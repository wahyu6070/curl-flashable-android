
This module is an **advanced injector** designed to seamlessly install the `curl` *binary executable* along with its required shared library (`libcurl.so`) directly into your Android system. It is specifically engineered to support a wide range of CPU architectures, including ARM, ARM64, x86, x86_64, and RISC-V.

## *Main Features*
- Injects the `curl` *binary* into the main system execution directory.
- Dynamically allocates `libcurl.so` to either the `/system/lib` (for 32-bit) or `/system/lib64` (for 64-bit) folder based on the detected hardware architecture.
- Features flawless integration with the **Termux** terminal environment.

## *Usage Guide*

### 1. Execution via Android Terminal Emulator (Requires *Root* Access)
If you are using a standard terminal application (such as Material Terminal) with *root* access:
1. Open your terminal, type `su`, and press enter to grant root privileges.
2. Execute the `curl` command with your desired arguments, for example: `curl -I https://magisk.dev`
3. Since the library is injected properly, `curl` will run smoothly without throwing any missing library warnings.

### 2. Execution via Termux (Without *Root* Access)
This module automatically copies the necessary *binary* and *library* into your Termux environment during the flashing process:
- You can directly execute `curl` inside Termux without needing to run the `su` command first.

## *Installation Compatibility*
This module utilizes a *hybrid installer* (Kopi Installer) to support a broad spectrum of installation methods:
- *Custom Recovery Flashable* (TWRP, OrangeFox, PitchBlack)
- *Magisk Module* (Systemless Installation)
- *KernelSU (KSU) Module*
- *APatch Module*

## *Credits*
source : https://github.com/vvb2060/curl-android

