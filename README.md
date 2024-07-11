# Android Device Mirroring on Linux

This repository provides the necessary tools and scripts to mirror your Android device on a Linux PC using USB debugging with the help of `scrcpy` for screen mirroring and `sndcpy` for audio forwarding.

## Getting Started

To get started with mirroring your Android device on your Linux PC, follow the steps below:

### Prerequisites

- A Linux PC
- An Android device with USB debugging enabled
- A USB cable to connect your Android device to your PC

### Installation

1. **Clone the Repository**

   Open a terminal on your Linux PC and run the following command to clone the repository:

   _Install git if you have not already_

   ```bash
   sudo apt install git
   ```

   _Now clone the repository_

   ```bash
   git clone https://github.com/nganaremba-rem/scrcpysndcpy.git
   ```

2. **Navigate to the Repository Directory**

   ```bash
   cd scrcpysndcpy
   ```

3. **Run the Setup Script**

Execute the `setup.sh` script to install `scrcpy`, `sndcpy`, and any other necessary dependencies. This script will also perform initial setup tasks.

```bash
./setup.sh
```

You might need to grant execution permissions to the script before running it:

```bash
chmod +x setup.sh
```

### Usage

After installation, connect your Android device to your Linux PC using a USB cable. Make sure USB debugging is enabled on your device. Then, follow any on-screen instructions to start mirroring your device.

For detailed usage instructions and troubleshooting, refer to the documentation provided within the repository or the official `scrcpy` and `sndcpy` documentation.

### Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to improve the repository or add new features.
