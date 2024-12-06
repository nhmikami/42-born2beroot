# Born2beroot

This project aims to introduce the world of virtualization.
I created my first virtual machine in VirtualBox under specific instructions.

## Requirements
* Operating System: Debian
* Encrypted partitions using LVM (Logical Volume Manager)
* Operating system configured with UFW firewall leaving only port 4242 open
* SSH service running on port 4242 only and block root to connect using it
* Implementation of strong password policy
* Installation and configuration of sudo following strict rules
* In addition to root user, a user with my username present which belogs to sudo and user42 groups
* Creation of simple script called monitoring.sh, developed in bash. At startup the script should display some info in all terminals every 10 minutes.

## Workflow
1. **VirtualBox**<br /><br />
VirtualBox is a free and open-source virtualization software developed by Oracle Corporation. It allows users to run multiple operating systems on a single physical computer simultaneously.<br /><br />
It was already installed in my computer, but you can download it [here](https://www.virtualbox.org/wiki/Downloads).<br /><br />

2. **Download Debian**<br /><br />
Debian is a free and open-source operating system (OS) based on the Linux kernel, known for its stability, security, and extensive package repository. Debian serves as the foundation for many other popular Linux distributions, such as Ubuntu.<br /><br />
Download it [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/). I used the amd64 ISO image.<br /><br />

3. **Setting up the virtual machine**<br />
    - Name and Operational System:
      - Name: Born2beroot
      - Folder: /nfs/homes/naharumi/VirtualBoxVMs
      - Type: Linux
      - Version: Debian (64-bit) <br />
    - Memory Size:
      - RAM: 1024MB <br />
    - Hard Disk:
      - Create a virtual hard disk now
      - File type: VDI (VirtualBox Disk Image)
      - Storage on physical hard disk: dynamically allocated
      - Size: 32GB <br />
    <br />
    In Settings > Storage > Optical Drive: select the amd64 ISO image<br /><br />

4. **Installing Debian**<br /><br />
I followed this [tutorial](https://github.com/gemartin99/Born2beroot-Tutorial) to setup manually encrypted partitions using LVM as it is required in the bonus part of the project.<br /><br />
<br /><br />

## Concepts
**What is a virtual machine?**<br /><br />
A virtual machine (VM) is a software-based emulation of a computer system that runs an operating system (OS) and applications as if it were a physical machine. Virtual machines allow you to run multiple operating systems on a single physical computer, isolating them from each other.<br /><br />
Its main components are:
* Hypervisor: a layer of software that creates and manages VMs. It allocates resources such as CPU, memory, and storage from the host machine to the virtual machines
* Guest OS: The operating system installed inside the virtual machine
* Host OS: The operating system of the physical machine that hosts the VMs
* Virtual hardware: virtualized versions of components like the CPU, memory, disk storage, network adapters, and peripherals

Benefits:
* Resource Efficiency: Enables better utilization of physical hardware by running multiple VMs on one physical server.
* Isolation: VMs are independent of each other, so issues in one VM don't affect others.
* Portability: VMs are encapsulated in files, making them easy to move and back up.
* Flexibility: You can run different operating systems (e.g., Linux on a Windows host).
* Cost Savings: Reduces the need for multiple physical machines.
