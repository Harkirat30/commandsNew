

1) Command -->  mkfs.ext4 /dev/xvdh

Above command is used to create a file system on the host , provided we have already created /dev/xvdh somehere else

2) mkdir data
3) mount /dev/xvdh /data
4) df -h 


NOTE : /dev/xvdh -->>> It is the device name of resource volume_attachment where we attach the vol id and instance id in a AWS instance
