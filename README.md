# Debian Development Environment

A modular Debian workstation setup for embedded systems, C/C++, Python and network development.

## 1. Features

- ARM Cortex-M development (STM32 / NXP)
- C/C++ toolchain, CMake and Ninja
- GDB debugging and OpenOCD flashing
- Python development environment
- VS Code with development extensions
- Docker and Docker Compose
- Network and protocol analysis
- Technical diagrams with draw.io

## 2. Prerequisites

Recommended: Debian 13.

Update your system:

```bash
sudo apt update
sudo apt upgrade -y
```

Install Git and SSH prerequisites:

```bash
sudo apt install -y \
    git \
    openssh-client \
    ca-certificates \
    curl
```

## 3. Git configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

git config --global init.defaultBranch main
git config --global pull.rebase true
```

## 4. Clone repository

```bash
mkdir -p ~/Workspace
cd ~/Workspace

git clone <repository-ssh-url>
cd devEnvSetup
```

Configure GitHub SSH access using an Ed25519 key:

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Add the public key to GitHub → Settings → SSH and GPG keys.

Test:

```bash
ssh -T git@github.com
```

## 5. Installation

Run the main installation script from your normal user account:

```bash
sudo ./install.sh
```

The setup is divided into independent package modules:

| Script | Purpose |
|---|---|
| `base.sh` | Essential development tools and utilities |
| `embedded.sh` | ARM toolchain, debugging and analysis |
| `python.sh` | Python development environment |
| `vscode.sh` | Visual Studio Code |
| `docker.sh` | Docker Engine and Compose |
| `network.sh` | Wireshark, TShark and TCPDump |
| `diagrams.sh` | draw.io Desktop |

Individual modules can also be installed separately:

```bash
sudo ./packages/diagrams.sh
```

Draw.io is optional and is not installed by the main setup script.

## 6. VS Code extensions

Run as your normal user:

```bash
./vscode/installVScodeExtensions.sh
```

Configured extensions include:

- C/C++
- CMake Tools
- Cortex Debug
- clangd
- Hex Editor
- GitLens
- Python

## 7. Additional tools

### SEGGER J-Link

Installation instructions:

```text
tools/segger/README.md
```

Verify:

```bash
JLinkExe
```

### CodeQL

Additional installation and configuration:

```text
tools/codeql/codeql.sh
```

## 8. Verify installation

```bash
gcc --version
arm-none-eabi-gcc --version
cmake --version
ninja --version
gdb-multiarch --version
python3 --version
code --version
docker --version
docker compose version
wireshark --version
tshark --version
```

Optional tools:

```bash
drawio --version
```

For Docker and Wireshark group permissions, log out and back in after installation.

## 9. Ready for development

The workstation is ready for:

- Embedded firmware development
- C/C++ and Python projects
- Hardware debugging and flashing
- Containerized development
- Network and protocol analysis
- Technical diagrams and documentation