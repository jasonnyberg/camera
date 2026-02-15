webcam-setup() {
    export RAMDISK=/mnt/ramdisk
    sudo mkdir -p $RAMDISK
    sudo mount -t tmpfs -o size=1G tmpfs $RAMDISK
}

webcam-capture() { fswebcam -r ${1:-"3840x2160"} --no-banner --loop 2 $RAMDISK/${2:-"image.jpg"}; }
webcam-display() { sudo fbi $RAMDISK/${1:-"image.jpg"}; }

webcam-capture-display { webcam-capture 3840x2160 image.jpg & webcam-display image.jpg; }

