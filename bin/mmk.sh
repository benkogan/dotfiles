#!/usr/bin/env bash

#
# Build script for Arch Linux kernel
# Used for 3.10.34
#
# Ben Kogan <http://benkogan.com>
#

if [ -z "$1" ]; then # quit if no arguments
    echo ""
    echo "  Usage: $0 [original kernel version] [columbia uni]"
    echo ""
    exit 1
fi

ver="$1"
uni="$2"
ker="$1-$2"      # YourKernelName
cor=2            # number of CPU cores
job=$((2*$cor))  # number of jobs to spawn when compiling kernel
dir="/home/ben/kernelbuild/linux-$ver" # intended run location for mmk

if [ "$uni" = "bmk2130" ] && [ "$(pwd)" != "$dir" ]; then
    echo "WARNING: current directory is $(pwd). It should be $dir."
fi

# Build and install a new kernel
for cmd in \
    "make -j$job"                                         \
    "sudo make modules_install"                           \
    "sudo cp -v arch/x86/boot/bzImage /boot/vmlinuz-$ker" \
    "sudo mkinitcpio -k $ker -c /etc/mkinitcpio.conf -g /boot/initramfs-$ker.img" \
    "sudo cp System.map /boot/System.map-$ker"
do
    $cmd && echo "SUCCEEDED: $cmd" || { echo "FAILED: $cmd"; exit 1; }
done

# Check necessary files exist
for file in                     \
    "/boot/initramfs-$ker.img"  \
    "/boot/System.map-$ker"     \
    "/boot/vmlinuz-$ker"
do
    [ -e $file ] && echo "SUCCEEDED: $file exists" || { echo "FAILED: $file does not exist"; exit 1; }
done

# Add a boot menu and then recompile VirtualBox guest module
for cmd in \
    "sudo ln -sf vmlinuz-$ker /boot/vmlinuz-linux-$uni"             \
    "sudo ln -sf initramfs-$ker.img /boot/initramfs-linux-$uni.img" \
    "sudo ln -sf System.map-$ker /boot/System.map"                  \
    "sudo grub-mkconfig -o /boot/grub/grub.cfg"                     \
    "sudo dkms uninstall vboxguest/4.3.10 -k $ker"                  \
    "sudo dkms install vboxguest/4.3.10 -k $ker"
do
    $cmd && echo "SUCCEEDED: $cmd" || { echo "FAILED: $cmd"; exit 1; }
done

echo "SUCCESS: mmk succeeded for all steps :)"

