# SLink Tunnels

Connect to Android devices through remote ADB and tunnel configurations.
> SLink 2.0 documentation  
> Practical guides for setup, connection, control, media, recording, and development.

### Documentation

[Overview](../README.md) | [Windows](windows.md) | [Linux](linux.md) | [macOS](macos.md) | [Connection](connection.md) | [Control](control.md) | [Video](video.md) | [Audio](audio.md) | [Recording](recording.md) | [Build](build.md)

---
slink is designed to mirror local Android devices. Tunnels allow to connect to
a remote device (e.g. over the Internet).

To connect to a remote device, it is possible to connect a local `adb` client to
a remote `adb` server (provided they use the same version of the _adb_
protocol).


## Remote ADB server

To connect to a remote _adb server_, make the server listen on all interfaces:

```bash
adb kill-server
adb -a nodaemon server start
```

**Warning: all communications between clients and the _adb server_ are
unencrypted.**

Suppose that this server is accessible at 192.168.1.2. Then, from another
terminal, run `slink`:

```bash
export ADB_SERVER_SOCKET=tcp:192.168.1.2:5037
slink --tunnel-host=192.168.1.2
```

```cmd
:: in cmd
set ADB_SERVER_SOCKET=tcp:192.168.1.2:5037
slink --tunnel-host=192.168.1.2
```

```powershell
$env:ADB_SERVER_SOCKET = 'tcp:192.168.1.2:5037'
slink --tunnel-host=192.168.1.2
```

By default, `slink` uses the local port used for `adb forward` tunnel
establishment (typically `27183`, see `--port`). It is also possible to force a
different tunnel port (it may be useful in more complex situations, when more
redirections are involved):

```bash
slink --tunnel-port=1234
```


## SSH tunnel

To communicate with a remote _adb server_ securely, it is preferable to use an
SSH tunnel.

First, make sure the _adb server_ is running on the remote computer:

```bash
adb start-server
```

Then, establish an SSH tunnel:

```bash
ssh -CN -L5038:localhost:5037 -R27183:localhost:27183 your_remote_computer
```

From another terminal, run `slink`:

```bash
export ADB_SERVER_SOCKET=tcp:localhost:5038
slink
```

```cmd
:: in cmd
set ADB_SERVER_SOCKET=tcp:localhost:5038
slink
```

```powershell
$env:ADB_SERVER_SOCKET = 'tcp:localhost:5038'
slink
```

To avoid enabling remote port forwarding, you could force a forward connection
instead (notice the `-L` instead of `-R`):

```bash
ssh -CN -L5038:localhost:5037 -L27183:localhost:27183 your_remote_computer
```

From another terminal, run `slink`:

```bash
export ADB_SERVER_SOCKET=tcp:localhost:5038
slink --force-adb-forward
```

```cmd
:: in cmd
set ADB_SERVER_SOCKET=tcp:localhost:5038
slink --force-adb-forward
```

```powershell
$env:ADB_SERVER_SOCKET = 'tcp:localhost:5038'
slink --force-adb-forward
```
---

### More SLink Documentation

[Previous: SLink Shortcuts](shortcuts.md) | [Next: SLink Video4Linux](v4l2.md)

[Back to SLink](../README.md) | [GitHub Repository](https://github.com/slickyindia/SLink)

*Documentation for SLink 2.0.*
