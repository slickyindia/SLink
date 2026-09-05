# Verify SLink Releases

Verify release signatures and package authenticity.
> SLink 2.0 documentation  
> Practical guides for setup, connection, control, media, recording, and development.

### Documentation

[Overview](../README.md) | [Windows](windows.md) | [Linux](linux.md) | [macOS](macos.md) | [Connection](connection.md) | [Control](control.md) | [Video](video.md) | [Audio](audio.md) | [Recording](recording.md) | [Build](build.md)

---
All releases are signed using Romain Vimont's [GPG key] ([raw]):

[GPG key]: https://blog.rom1v.com/about/#gpg-key
[raw]: https://blog.rom1v.com/keys/rom1v.asc

```console
$ curl -s https://blog.rom1v.com/keys/rom1v.asc | gpg --show-keys --with-fingerprint --with-subkey-fingerprints
pub   rsa4096 2021-03-15 [C]
      4569 58E8 5A18 5DD5 C2D1  E4E8 0C82 2B29 8461 FA03
uid                      Romain Vimont <rom@rom1v.com>
sub   rsa4096 2021-03-15 [S] [expires: 2030-05-14]
      E39E 2DE6 A55F 5AA6 D8EF  B79A CA01 F46F 1868 3B3D
sub   rsa4096 2021-03-15 [E] [expires: 2030-05-14]
      2C86 255E 6D65 241D 8248  F1B3 F212 10AE 292B 63D1
sub   rsa4096 2021-03-15 [A] [expires: 2030-05-14]
      1782 0F23 CB1D 1921 5572  6FAD 0F0B 58E1 3784 09AA
```

## Import the key

```bash
curl -s https://blog.rom1v.com/keys/rom1v.asc | gpg --import
gpg --keyserver hkps://keys.openpgp.org --recv-keys 456958E85A185DD5C2D1E4E80C822B298461FA03
gpg --fingerprint 456958E85A185DD5C2D1E4E80C822B298461FA03
```

## Verify releases

For each release, two additional files are published:
 - `SHA256SUMS.txt`: the SHA-256 checksums
 - `SHA256SUMS.txt.asc`: the signature of the checksums

To verify a release, two steps are required.

First, verify the signature of the checksums:

```bash
gpg --verify SHA256SUMS.txt.asc
```

For example:

```console
$ gpg --verify SHA256SUMS.txt.asc
gpg: assuming signed data in 'SHA256SUMS.txt'
gpg: Signature made Wed Dec 17 20:16:30 2025 CET
gpg:                using RSA key E39E2DE6A55F5AA6D8EFB79ACA01F46F18683B3D
gpg: Good signature from "Romain Vimont <rom@rom1v.com>" [ultimate]
```

Then verify the release checksums:

```bash
shasum -a 256 -c SHA256SUMS.txt
```

For example:

```console
$ shasum -a 256 -c SHA256SUMS.txt
slink-server-v3.3.4: OK
slink-linux-x86_64-v3.3.4.tar.gz: OK
slink-win32-v3.3.4.zip: OK
slink-win64-v3.3.4.zip: OK
slink-macos-aarch64-v3.3.4.tar.gz: OK
slink-macos-x86_64-v3.3.4.tar.gz: OK
```
---

### More SLink Documentation

[Previous: SLink Video4Linux](v4l2.md) | [Next: SLink Video](video.md)

[Back to SLink](../README.md) | [GitHub Repository](https://github.com/slickyindia/SLink)

*Documentation for SLink 2.0.*
