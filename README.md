# Embedded Development Environment

Debian-based workstation setup for embedded systems development.

This repository configures a complete embedded firmware development environment:

* ARM Cortex-M development
* STM32 / NXP firmware development
* C/C++ embedded projects
* CMake + Ninja build system
* GDB debugging
* J-Link / OpenOCD flashing
* VS Code development environment

# 1. Prepare Debian system

Open a terminal and become root:

```bash
su -
```

Update the system:

```bash
apt update
apt upgrade -y
```

Install basic dependencies:

```bash
apt install -y \
git \
openssh-client \
ca-certificates \
curl \
wget
```

Return to your user:

```bash
exit
```

# 2. Configure Git

Set your Git identity:

```bash
git config --global user.name "Your Name"

git config --global user.email "your.email@example.com"
```

Recommended Git settings:

```bash
git config --global init.defaultBranch main

git config --global pull.rebase true
```

Check configuration:

```bash
git config --list
```

# 3. Configure GitHub SSH access

Create an SSH key:

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Start SSH agent:

```bash
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519
```

Display your public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Add this key to:

```
GitHub → Settings → SSH and GPG keys → New SSH key
```

Test connection:

```bash
ssh -T <yourSSHurl@github.com>
```

Expected result:

```
Hi username! You've successfully authenticated.
```

# 4. Clone repository

Create your workspace:

```bash
mkdir -p ~/Workspace

cd ~/Workspace
```

Clone:

```bash
git clone <yourSSHurl@github.com>
```

Enter repository:

```bash
cd devEnvSetup
```

# 5. Install development environment

Run installation as root:

```bash
su -
```

Execute:

```bash
cd /home/<username>/Workspace/devEnvSetup

./install.sh
```

This installs:

* GCC
* ARM GNU Toolchain
* CMake
* Ninja
* GDB
* OpenOCD
* Python development tools
* VS Code

# 6. Configure VS Code

Return to your user:

```bash
exit
```

Install VS Code extensions:

```bash
./vscode/installVScodeExtensions.sh
```

Installed extensions:

* C/C++
* CMake Tools
* Cortex Debug
* clangd
* Hex Editor
* GitLens
* Python

# 7. Install J-Link

J-Link is a proprietary SEGGER tool.

Installation instructions:

```
tools/segger/README.md
```

After installation, verify:

```bash
JLinkExe
```

Expected result:

```
SEGGER J-Link Commander
J-Link>
```

# 8. Verify environment

Check installed tools:

```bash
gcc --version

arm-none-eabi-gcc --version

cmake --version

ninja --version

gdb-multiarch --version

python3 --version

code --version
```

# 9. Ready for firmware development

Your workstation is now ready for:

* Building firmware
* Flashing microcontrollers
* Debugging with GDB
* Developing embedded C/C++ projects

Typical workflow:

```bash
git clone <firmware-project>

cd firmware-project
```

Flash and debug using project scripts or vscode
