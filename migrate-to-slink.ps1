$ErrorActionPreference = "Stop"

$Root = (Get-Location).Path

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "       SLINK REBRAND MIGRATION" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Repository: $Root"
Write-Host ""

# ------------------------------------------------------------
# Files/directories that must NOT be modified
# ------------------------------------------------------------

$ExcludedDirectories = @(
    ".git"
)

$ExcludedFiles = @(
    "LICENSE"
)

# Binary extensions - never treat these as text
$BinaryExtensions = @(
    ".png", ".jpg", ".jpeg", ".gif", ".webp", ".ico",
    ".bmp", ".tif", ".tiff",
    ".zip", ".7z", ".rar", ".tar", ".gz",
    ".exe", ".dll", ".so", ".dylib",
    ".a", ".o", ".obj",
    ".class", ".jar", ".apk", ".aar",
    ".woff", ".woff2", ".ttf", ".otf",
    ".pdf", ".mp3", ".mp4", ".wav",
    ".avi", ".mov", ".webm"
)

# ------------------------------------------------------------
# Helpers
# ------------------------------------------------------------

function Is-BinaryFile {
    param([string]$Path)

    $ext = [System.IO.Path]::GetExtension($Path).ToLowerInvariant()
    return $BinaryExtensions -contains $ext
}

function Replace-SlinkText {
    param([string]$Text)

    # Android Java/Kotlin package migration FIRST
    $Text = $Text -replace 'com\.genymobile\.SLINK', 'com.slickyincorp.slink'

    # Preserve genuine upstream repository URLs.
    $protected = @{}

    $pattern = 'https://github\.com/Genymobile/SLINK[^\s)"''<>]*'

    $Text = [regex]::Replace($Text, $pattern, {
        param($m)

        $key = "__SLINK_UPSTREAM_$($protected.Count)__"
        $protected[$key] = $m.Value
        return $key
    })

    # Preserve genuine SLINK-docker references.
    $pattern2 = 'https://github\.com/pierlon/SLINK-docker[^\s)"''<>]*'

    $Text = [regex]::Replace($Text, $pattern2, {
        param($m)

        $key = "__SLINK_DOCKER_$($protected.Count)__"
        $protected[$key] = $m.Value
        return $key
    })

    # Product/source identifiers
    $Text = $Text -replace 'SLINK', 'SLINK'
    $Text = $Text -replace 'SLINK', 'Slink'
    $Text = $Text -replace 'SLINK', 'slink'

    # Restore protected URLs
    foreach ($key in $protected.Keys) {
        $Text = $Text.Replace($key, $protected[$key])
    }

    return $Text
}

# ------------------------------------------------------------
# PASS 1 - Text content
# ------------------------------------------------------------

Write-Host "[1/4] Migrating text content..." -ForegroundColor Yellow

$files = Get-ChildItem -LiteralPath $Root -Recurse -File |
    Where-Object {
        $relative = $_.FullName.Substring($Root.Length).TrimStart('\','/')
        $parts = $relative -split '[\\/]'

        ($parts | Where-Object { $ExcludedDirectories -contains $_ }).Count -eq 0 -and
        ($ExcludedFiles -notcontains $_.Name) -and
        -not (Is-BinaryFile $_.FullName)
    }

$changedFiles = 0

foreach ($file in $files) {

    try {
        $content = [System.IO.File]::ReadAllText(
            $file.FullName,
            [System.Text.Encoding]::UTF8
        )

        $newContent = Replace-SlinkText $content

        if ($newContent -cne $content) {
            [System.IO.File]::WriteAllText(
                $file.FullName,
                $newContent,
                [System.Text.UTF8Encoding]::new($false)
            )

            $changedFiles++
            Write-Host "  Updated: $($file.FullName.Substring($Root.Length + 1))"
        }
    }
    catch {
        Write-Host "  Skipped unreadable file: $($file.FullName)" -ForegroundColor DarkYellow
    }
}

Write-Host "  Text files changed: $changedFiles" -ForegroundColor Green

# ------------------------------------------------------------
# PASS 2 - Rename files
# ------------------------------------------------------------

Write-Host ""
Write-Host "[2/4] Renaming files..." -ForegroundColor Yellow

$filesToRename = Get-ChildItem -LiteralPath $Root -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.Name -match '(?i)SLINK'
    } |
    Sort-Object FullName -Descending

$renameCount = 0

foreach ($file in $filesToRename) {

    $newName = $file.Name `
        -replace 'SLINK', 'SLINK' `
        -replace 'SLINK', 'Slink' `
        -replace 'SLINK', 'slink'

    if ($newName -ne $file.Name) {

        $destination = Join-Path $file.DirectoryName $newName

        if (-not (Test-Path -LiteralPath $destination)) {
            Rename-Item -LiteralPath $file.FullName -NewName $newName
            $renameCount++

            Write-Host "  $($file.Name) -> $newName"
        }
    }
}

Write-Host "  Files renamed: $renameCount" -ForegroundColor Green

# ------------------------------------------------------------
# PASS 3 - Rename directories
# ------------------------------------------------------------

Write-Host ""
Write-Host "[3/4] Renaming directories..." -ForegroundColor Yellow

$directoriesToRename = Get-ChildItem -LiteralPath $Root -Recurse -Directory |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git([\\/]|$)' -and
        $_.Name -match '(?i)SLINK'
    } |
    Sort-Object { $_.FullName.Length } -Descending

$directoryCount = 0

foreach ($dir in $directoriesToRename) {

    $newName = $dir.Name `
        -replace 'SLINK', 'SLINK' `
        -replace 'SLINK', 'Slink' `
        -replace 'SLINK', 'slink'

    if ($newName -ne $dir.Name) {

        $destination = Join-Path $dir.Parent.FullName $newName

        if (-not (Test-Path -LiteralPath $destination)) {
            Rename-Item -LiteralPath $dir.FullName -NewName $newName
            $directoryCount++

            Write-Host "  $($dir.Name) -> $newName"
        }
    }
}

Write-Host "  Directories renamed: $directoryCount" -ForegroundColor Green

# ------------------------------------------------------------
# PASS 4 - Final audit
# ------------------------------------------------------------

Write-Host ""
Write-Host "[4/4] Running Slink audit..." -ForegroundColor Yellow

$remainingFiles = @(
    Get-ChildItem -LiteralPath $Root -Recurse -File |
        Where-Object {
            $_.FullName -notmatch '[\\/]\.git[\\/]' -and
            $_.Name -match '(?i)SLINK'
        }
)

$remainingText = @()

$allFiles = Get-ChildItem -LiteralPath $Root -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        -not (Is-BinaryFile $_.FullName)
    }

foreach ($file in $allFiles) {

    if ($ExcludedFiles -contains $file.Name) {
        continue
    }

    try {
        $content = [System.IO.File]::ReadAllText(
            $file.FullName,
            [System.Text.Encoding]::UTF8
        )

        $matches = [regex]::Matches($content, '(?i)SLINK')

        foreach ($match in $matches) {

            # Ignore genuine upstream URLs
            $line = ($content.Substring(
                0,
                [Math]::Min($content.Length, $match.Index + 200)
            ))

            if ($line -notmatch 'https://github\.com/(Genymobile/SLINK|pierlon/SLINK-docker)') {
                $remainingText += $file.FullName
                break
            }
        }
    }
    catch {}
}

$remainingText = $remainingText | Select-Object -Unique

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "             SLINK AUDIT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

Write-Host "Legacy filenames:     $($remainingFiles.Count)"
Write-Host "Legacy text files:    $($remainingText.Count)"

if ($remainingFiles.Count -gt 0) {

    Write-Host ""
    Write-Host "Legacy filenames found:" -ForegroundColor Red

    foreach ($file in $remainingFiles) {
        Write-Host "  $($file.FullName.Substring($Root.Length + 1))"
    }
}

if ($remainingText.Count -gt 0) {

    Write-Host ""
    Write-Host "Possible remaining SLINK references:" -ForegroundColor Red

    foreach ($file in $remainingText) {
        Write-Host "  $($file.Substring($Root.Length + 1))"
    }
}

Write-Host ""

if ($remainingFiles.Count -eq 0 -and $remainingText.Count -eq 0) {
    Write-Host "RESULT: PASS" -ForegroundColor Green
}
else {
    Write-Host "RESULT: REVIEW REQUIRED" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Next commands:"
Write-Host "  git status"
Write-Host "  git diff --stat"
Write-Host "  git diff"
Write-Host ""
