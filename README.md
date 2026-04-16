# *Curl Binary Executable Injector*

This module is a specialized tool designed to inject the `curl` binary into your Android system. It achieves this by utilizing a high-performance **libcurl.so** shared library, which is renamed and treated as a standalone executable binary during the installation process.

## *Core Functionality*
- Injects the `curl` binary directly into the system execution path.
- Automatically detects device architecture (ARM, ARM64, x86, x86_64, RISC-V) to ensure the correct binary version is deployed.
- Configures advanced execution permissions and SELinux security contexts to ensure seamless terminal integration.

## *How To Use*

### *Terminal Execution (Requires Root)*
Once the module is successfully installed and the device has been rebooted:
1. Open your preferred Android Terminal Emulator.
2. Type `su` and press Enter to grant root access.
3. You can now run the `curl` command directly, for example: `curl --version` or `curl -I https://google.com`.

## *Installation Compatibility*
This module uses a hybrid installer framework compatible with:
- *Magisk* (Systemless)
- *KernelSU / KSU*
- *APatch*
- *Custom Recovery* (TWRP, OrangeFox, etc.)

## *Credits*
Executable logic developed and maintained by **Wahyu6070**.
