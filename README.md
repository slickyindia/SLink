<div align="center">

<img src="app/data/slink.svg" width="120" alt="SLink">

# SLink

### Android screen mirroring & control for Windows, Linux and macOS

**Mirror. Control. Record. Connect.**

SLink lets you view and control your Android device directly from your computer using your keyboard and mouse.

<p>
<a href="https://github.com/slickyindia/SLink/releases"><strong>⬇️ Download SLink</strong></a>
&nbsp; · &nbsp;
<a href="https://github.com/slickyindia/SLink/issues">🐛 Report a Problem</a>
&nbsp; · &nbsp;
<a href="https://github.com/slickyindia/SLink/discussions">💬 Discussions</a>
</p>

![Version](https://img.shields.io/badge/version-4.1-7c3aed?style=for-the-badge)
![Windows](https://img.shields.io/badge/Windows-Portable-2563eb?style=for-the-badge&logo=windows)
![Android](https://img.shields.io/badge/Android-5.0%2B-16a34a?style=for-the-badge&logo=android)
![License](https://img.shields.io/badge/license-Apache%202.0-f59e0b?style=for-the-badge)

</div>

---

## 🚀 What is SLink?

**SLink** is a fast, lightweight Android screen mirroring and control application.

Connect your Android phone or tablet to your computer and use it directly from your desktop.

You can:

- 🖥️ Mirror your Android screen
- 🖱️ Control Android with your mouse
- ⌨️ Control Android with your keyboard
- 🔊 Forward Android audio
- 🎥 Record your screen
- 📷 Mirror supported cameras
- 📋 Copy and paste between Android and PC
- 🎮 Use supported gamepads
- 📱 Work with virtual displays
- 🌙 Control Android while keeping its screen off
- 📡 Connect over USB or TCP/IP
- 🔧 Use OTG mode

SLink does **not require root access** for the normal connection.

---

# ⭐ Features

### 🖥️ Android Screen Mirroring

See your Android screen in a desktop window with high-quality video and low latency.

### 🖱️ Mouse & Keyboard Control

Use your computer's mouse and keyboard to interact with Android applications.

### 🔌 USB Connection

USB provides a simple and reliable connection with very low latency.

### 📡 Wireless Connection

Connect using TCP/IP when you want to use SLink without keeping the USB cable connected.

### 🔊 Audio Forwarding

Forward supported Android audio directly to your computer.

### 🎥 Screen Recording

Record your Android screen for:

- Tutorials
- Demonstrations
- Testing
- Documentation
- Content creation

### 📷 Camera Mirroring

Use supported Android cameras as a video source.

### 📋 Clipboard Sharing

Copy and paste supported content between Android and your computer.

### 🌙 Screen-Off Mode

Keep the physical Android display turned off while continuing to control the device.

### 🎮 Gamepad Support

Use compatible game controllers with supported Android input features.

### 🖥️ Virtual Displays

Create additional Android displays for compatible applications and workflows.

### 🔧 OTG Mode

Use SLink's OTG functionality for supported hardware-control workflows without requiring USB debugging.

### 🐧 Linux Integration

Linux users can use additional functionality such as V4L2 webcam support.

---

# ⚡ Why SLink?

| Feature | SLink |
|---|:---:|
| Root required | ❌ |
| Permanent Android app required | ❌ |
| USB support | ✅ |
| TCP/IP support | ✅ |
| Keyboard control | ✅ |
| Mouse control | ✅ |
| Audio forwarding | ✅ |
| Screen recording | ✅ |
| Camera support | ✅ |
| Clipboard | ✅ |
| Gamepad | ✅ |
| Virtual displays | ✅ |
| OTG | ✅ |
| Windows portable version | ✅ |
| Linux support | ✅ |
| macOS support | ✅ |

---

# 🚀 Get Started

Getting started is simple.

## 1️⃣ Download SLink

Go to:

**[SLink Releases](https://github.com/slickyindia/SLink/releases)**

For Windows, download:

```text
SLink-4.1-windows-portable.zip
```

---

## 2️⃣ Extract SLink

Extract the ZIP anywhere.

For example:

```text
C:\SLink\
```

You do not need to install the portable version.

---

## 3️⃣ Prepare Your Android Phone

On your Android device:

1. Open **Settings**
2. Open **About phone**
3. Find **Build number**
4. Tap **Build number** several times
5. Open **Developer options**
6. Enable **USB debugging**

The exact location can differ between Android manufacturers.

---

## 4️⃣ Connect Your Phone

Connect your Android phone to your computer using a USB data cable.

Unlock your phone.

Android should display a message similar to:

```text
Allow USB debugging?
```

Tap:

**Allow**

---

## 5️⃣ Start SLink

Open the extracted SLink folder.

Double-click:

```text
SLink.bat
```

SLink should automatically detect your Android device and open the mirroring window.

🎉 **You're ready!**

---

# 🪄 The Simple Workflow

```text
Download
   ↓
Extract
   ↓
Enable USB debugging
   ↓
Connect Android phone
   ↓
Allow USB debugging
   ↓
Run SLink.bat
   ↓
Control Android from your PC
```

No complicated installation process is required for the Windows portable edition.

---

# 🖥️ Windows Portable Edition

The Windows portable package is designed for a simple:

**Download → Extract → Run**

experience.

The package contains the required SLink components, including:

```text
slink.exe
SLink.bat
SLINK-server
adb.exe
AdbWinApi.dll
AdbWinUsbApi.dll
```

Required runtime DLLs are also included.

You can keep the complete SLink folder on:

- Your PC
- USB drive
- External drive
- Other portable storage

---

# 🔌 Connection Methods

## USB

Recommended for your first connection.

Advantages:

- Low latency
- Reliable
- Simple setup
- Excellent for development and testing

---

## TCP/IP / Wi-Fi

Use a network connection when you want wireless operation.

This is useful when:

- The phone and computer are on the same network
- You don't want to keep the USB cable connected
- You need more flexible device placement

See the [Connection documentation](doc/connection.md) for advanced configuration.

---

## OTG

OTG mode provides a different interaction model for supported hardware workflows.

USB debugging is not required for OTG mode.

```bash
slink --otg
```

---

# 🎛️ Useful Commands

The main command-line executable is:

```text
slink
```

On Windows:

```text
slink.exe
```

Start normally:

```bash
slink
```

Select a specific Android device:

```bash
slink --serial ABC123
```

Select USB:

```bash
slink --select-usb
```

Select TCP/IP:

```bash
slink --select-tcpip
```

Fullscreen:

```bash
slink --fullscreen
```

OTG:

```bash
slink --otg
```

---

# 🎥 Recording

Record your Android screen:

```bash
slink --record=screen.mp4
```

You can use recording for:

- Tutorials
- Bug reports
- App demonstrations
- QA testing
- Training
- Content creation

---

# ⚙️ Performance Controls

Limit the maximum resolution:

```bash
slink --max-size=1920
```

Limit frame rate:

```bash
slink --max-fps=60
```

Disable audio:

```bash
slink --no-audio
```

Example:

```bash
slink --max-size=1920 --max-fps=60 --no-audio
```

---

# 📱 Android Compatibility

The standard SLink connection supports Android devices starting from:

**Android 5.0 / API 21**

Some advanced features require newer Android versions or device-specific support.

For example, audio forwarding and camera functionality can depend on Android version and device capabilities.

---

# 💼 Use Cases

## 👨‍💻 Developers

Test and interact with Android applications while working from your desktop.

## 🧪 QA & Testing

Record and reproduce Android application behavior.

## 🎓 Education

Demonstrate Android applications on a large computer display.

## 🎥 Content Creation

Create tutorials, demonstrations and Android walkthroughs.

## 🛠️ Technical Support

View and control supported Android devices from a computer.

## 📱 Productivity

Use Android applications while keeping your computer workflow in one place.

## 🎮 Gaming

Use supported keyboard, mouse and gamepad functionality with Android applications.

---

# 🔐 Privacy & Security

SLink is designed to keep the connection under your control.

### No account required

You can use SLink without creating an account.

### No advertising

SLink does not require advertising to operate.

### No root required

The standard connection does not require root access.

### No permanent Android installation

The normal workflow does not require installing a permanent Android application.

### Local-first operation

The standard USB workflow does not require an internet connection.

For network functionality, only connect devices across networks you trust.

---

# 🛠️ Troubleshooting

## Phone is not detected

Check:

- USB debugging is enabled
- Your phone is unlocked
- You accepted the USB debugging authorization
- Your USB cable supports data
- Try another USB port
- Try reconnecting the phone

---

## USB debugging authorization does not appear

Unlock your Android device and reconnect the USB cable.

Check:

```text
Settings → Developer options → USB debugging
```

---

## SLink opens and closes

Run:

```powershell
.\SLink.bat
```

from PowerShell so you can see diagnostic messages.

---

## Wireless connection doesn't work

Make sure:

- The computer and phone can communicate over the network
- The required TCP/IP connection is configured
- Firewall rules are not blocking the connection

See:

**[Connection Guide](doc/connection.md)**

---

# 📚 Documentation

| Topic | Documentation |
|---|---|
| Connection | [Connection](doc/connection.md) |
| Video | [Video](doc/video.md) |
| Audio | [Audio](doc/audio.md) |
| Control | [Control](doc/control.md) |
| Keyboard | [Keyboard](doc/keyboard.md) |
| Mouse | [Mouse](doc/mouse.md) |
| Gamepad | [Gamepad](doc/gamepad.md) |
| Device | [Device](doc/device.md) |
| Window | [Window](doc/window.md) |
| Recording | [Recording](doc/recording.md) |
| Virtual display | [Virtual Display](doc/virtual-display.md) |
| Network | [Tunnels](doc/tunnels.md) |
| OTG | [OTG](doc/otg.md) |
| Camera | [Camera](doc/camera.md) |
| Linux V4L2 | [Video4Linux](doc/v4l2.md) |
| Shortcuts | [Shortcuts](doc/shortcuts.md) |
| Building | [Build Instructions](doc/build.md) |
| Development | [Developer Documentation](doc/develop.md) |

---

# 💻 Platform Support

| Platform | Status |
|---|---|
| Windows | ✅ Portable release |
| Linux | ✅ Supported |
| macOS | ✅ Supported |
| Android | 📱 Device runtime |

Platform-specific guides:

- [Windows](doc/windows.md)
- [Linux](doc/linux.md)
- [macOS](doc/macos.md)

---

# 📦 Latest Release

### SLink 4.1

Download the latest release:

**[⬇️ Download SLink](https://github.com/slickyindia/SLink/releases)**

Windows users can download the portable package and run it without a traditional installer.

---

# 🤝 Contributing

Contributions are welcome.

You can help by:

- Reporting bugs
- Suggesting features
- Improving documentation
- Testing new releases
- Improving compatibility
- Submitting code changes

Before opening an issue, please check the existing:

**[GitHub Issues](https://github.com/slickyindia/SLink/issues)**

For questions and feature discussions:

**[GitHub Discussions](https://github.com/slickyindia/SLink/discussions)**

---

# ⭐ Support SLink

If SLink is useful to you, consider supporting the project:

⭐ **Star the repository**

🐛 **Report bugs**

💡 **Suggest improvements**

🤝 **Contribute**

❤️ **Share SLink with other Android users**

---

# 📄 License & Attribution

SLink is distributed under the **Apache License 2.0**.

This project is an independent rebranding and continuation built on an open-source codebase. Original upstream copyrights, notices and legally required attribution are retained where applicable.

SLink does not claim authorship of the original upstream work.

See [LICENSE](LICENSE) for the complete license terms.

---

<div align="center">

## SLink

### Connect. Mirror. Control.

**Android on your desktop — simple, fast and flexible.**

⭐ [Star SLink](https://github.com/slickyindia/SLink) ·
⬇️ [Download](https://github.com/slickyindia/SLink/releases) ·
🐛 [Report an issue](https://github.com/slickyindia/SLink/issues)

</div>
