#!/bin/bash
#Creacion de particiones

cicchelli@parcial:~$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x5f03a2c9.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-4194303, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-4194303, default 4194303): +5M

Created a new partition 1 of type 'Linux' and of size 5 MiB.

Command (m for help): t
Selected partition 1
Hex code or alias (type L to list all): 8e
Changed type of partition 'Linux' to 'Linux LVM'.

Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2): 2
First sector (12288-4194303, default 12288):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (12288-4194303, default 4194303): +1.5
G

Created a new partition 2 of type 'Linux' and of size 1.5 GiB.

Command (m for help): t
Partition number (1,2, default 2): 2
Hex code or alias (type L to list all): 8e

Changed type of partition 'Linux' to 'Linux LVM'.

Command (m for help): n
Partition type
   p   primary (2 primary, 0 extended, 2 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (3,4, default 3): 3
First sector (3158016-4194303, default 3158016):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (3158016-4194303, default 4194303): +5
12M
Value out of range.
Last sector, +/-sectors or +/-size{K,M,G,T,P} (3158016-4194303, default 4194303): +5
12m
Value out of range.
Last sector, +/-sectors or +/-size{K,M,G,T,P} (3158016-4194303, default 4194303): +5
12MB

Created a new partition 3 of type 'Linux' and of size 488 MiB.

Command (m for help): p
Disk /dev/sdc: 2 GiB, 2147483648 bytes, 4194304 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5f03a2c9

Device     Boot   Start     End Sectors  Size Id Type
/dev/sdc1          2048   12287   10240    5M 8e Linux LVM
/dev/sdc2         12288 3158015 3145728  1.5G 8e Linux LVM
/dev/sdc3       3158016 4157439  999424  488M 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

cicchelli@parcial:~$ sudo fdisk /dev/sdc
[sudo] password for cicchelli:

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): t
Partition number (1-3, default 3): 3
Hex code or alias (type L to list all): 8e

Changed type of partition 'Linux' to 'Linux LVM'.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

cicchelli@parcial:~$ sudo partprobe /dev/sdc
cicchelli@parcial:~$ sudo fdisk -l
Disk /dev/loop0: 91.68 MiB, 96129024 bytes, 187752 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 63.78 MiB, 66879488 bytes, 130624 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
Device     Boot Start      End  Sectors Size Id Type
/dev/sda1  *     2048 83886046 83883999  40G 83 Linux


Disk /dev/sdc: 2 GiB, 2147483648 bytes, 4194304 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos


Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
cicchelli@parcial:~$ sudo pvcreate /dev/sdd1 /dev/sdc1 /dev/sdc2 /dev/sdc3
  No device found for /dev/sdd1.
  Physical volume "/dev/sdc1" successfully created.
  Physical volume "/dev/sdc2" successfully created.
  Physical volume "/dev/sdc3" successfully created.
cicchelli@parcial:~$ sudo pvc
sudo: pvc: command not found
cicchelli@parcial:~$ sudo pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sdc1     lvm2 ---    5.00m   5.00m
  /dev/sdc2     lvm2 ---    1.50g   1.50g
  /dev/sdc3     lvm2 ---  488.00m 488.00m
cicchelli@parcial:~$ sudo pvcreate /dev/sdd1 /dev/sdc1 /dev/sdc2 /dev/sdc3
  No device found for /dev/sdd1.
  Physical volume "/dev/sdc1" successfully created.
  Physical volume "/dev/sdc2" successfully created.
  Physical volume "/dev/sdc3" successfully created.
cicchelli@parcial:~$ sudo fdisk -l
Disk /dev/loop0: 91.68 MiB, 96129024 bytes, 187752 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 63.78 MiB, 66879488 bytes, 130624 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 49.26 MiB, 51654656 bytes, 100888 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdb: 10 MiB, 10485760 bytes, 20480 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sda: 40 GiB, 42949672960 bytes, 83886080 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xb2a6d529

Device     Boot Start      End  Sectors Size Id Type
/dev/sda1  *     2048 83886046 83883999  40G 83 Linux


Disk /dev/sdc: 2 GiB, 2147483648 bytes, 4194304 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5f03a2c9

Device     Boot   Start     End Sectors  Size Id Type
/dev/sdc1          2048   12287   10240    5M 8e Linux LVM
/dev/sdc2         12288 3158015 3145728  1.5G 8e Linux LVM
/dev/sdc3       3158016 4157439  999424  488M 8e Linux LVM


Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
cicchelli@parcial:~$ sudo pvcreate /dev/sdd /dev/sdc1 /dev/sdc2 /dev/sdc3
  Physical volume "/dev/sdd" successfully created.
  Physical volume "/dev/sdc1" successfully created.
  Physical volume "/dev/sdc2" successfully created.
  Physical volume "/dev/sdc3" successfully created.
cicchelli@parcial:~$ sudo pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sdc1     lvm2 ---    5.00m   5.00m
  /dev/sdc2     lvm2 ---    1.50g   1.50g
  /dev/sdc3     lvm2 ---  488.00m 488.00m
  /dev/sdd      lvm2 ---    1.00g   1.00g
cicchelli@parcial:~$ sudo vgcreate vg_datos  /dev/sdd /dev/sdc1 /dev/sdc2 /dev/sdc3
  Volume group "vg_datos" successfully created
cicchelli@parcial:~$ sudo pvs
  PV         VG       Fmt  Attr PSize    PFree
  /dev/sdc1  vg_datos lvm2 a--     4.00m    4.00m
  /dev/sdc2  vg_datos lvm2 a--    <1.50g   <1.50g
  /dev/sdc3  vg_datos lvm2 a--   484.00m  484.00m
  /dev/sdd   vg_datos lvm2 a--  1020.00m 1020.00m
cicchelli@parcial:~$ sudo vgs
  VG       #PV #LV #SN Attr   VSize  VFree
  vg_datos   4   0   0 wz--n- <2.97g <2.97g
cicchelli@parcial:~$ sudo lvcreate -L +5M vg_datos -n lv_docker
  Rounding up size to full physical extent 8.00 MiB
  Logical volume "lv_docker" created.
cicchelli@parcial:~$ sudo pvs
  PV         VG       Fmt  Attr PSize    PFree
  /dev/sdc1  vg_datos lvm2 a--     4.00m    4.00m
  /dev/sdc2  vg_datos lvm2 a--    <1.50g   <1.50g
  /dev/sdc3  vg_datos lvm2 a--   484.00m  484.00m
  /dev/sdd   vg_datos lvm2 a--  1020.00m 1012.00m
cicchelli@parcial:~$ sudo vgs
  VG       #PV #LV #SN Attr   VSize  VFree
  vg_datos   4   1   0 wz--n- <2.97g 2.96g
cicchelli@parcial:~$ sudo lvs
  LV        VG       Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_docker vg_datos -wi-a----- 8.00m
cicchelli@parcial:~$ sudo lvcreate -L +1.5G vg_datos -n lv_workareas
  Logical volume "lv_workareas" created.
cicchelli@parcial:~$ sudo lvcreate -L +512M vg_datos -n lv_swap
  Logical volume "lv_swap" created.
cicchelli@parcial:~$ sudo lvs
  LV           VG       Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lv_docker    vg_datos -wi-a-----   8.00m
  lv_swap      vg_datos -wi-a----- 512.00m
  lv_workareas vg_datos -wi-a-----   1.50g
cicchelli@parcial:~$ sudo fdisk -l
Disk /dev/loop0: 91.68 MiB, 96129024 bytes, 187752 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 63.78 MiB, 66879488 bytes, 130624 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 49.26 MiB, 51654656 bytes, 100888 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdb: 10 MiB, 10485760 bytes, 20480 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sda: 40 GiB, 42949672960 bytes, 83886080 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xb2a6d529

Device     Boot Start      End  Sectors Size Id Type
/dev/sda1  *     2048 83886046 83883999  40G 83 Linux


Disk /dev/sdc: 2 GiB, 2147483648 bytes, 4194304 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x5f03a2c9

Device     Boot   Start     End Sectors  Size Id Type
/dev/sdc1          2048   12287   10240    5M 8e Linux LVM
/dev/sdc2         12288 3158015 3145728  1.5G 8e Linux LVM
/dev/sdc3       3158016 4157439  999424  488M 8e Linux LVM


Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vg_datos-lv_docker: 8 MiB, 8388608 bytes, 16384 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vg_datos-lv_workareas: 1.5 GiB, 1610612736 bytes, 3145728 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vg_datos-lv_swap: 512 MiB, 536870912 bytes, 1048576 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
cicchelli@parcial:~$ sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 2048 4k blocks and 2048 inodes

Allocating group tables: done
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

cicchelli@parcial:~$ sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 393216 4k blocks and 98304 inodes
Filesystem UUID: 8ed7b913-8247-49c4-a21c-207dd7782a30
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

cicchelli@parcial:~$ sudo mkfs.ext4 /dev/mapper/vg_datos-lv_swap
mke2fs 1.46.5 (30-Dec-2021)
Creating filesystem with 131072 4k blocks and 32768 inodes
Filesystem UUID: 5f5e923d-68fd-44d4-aa0b-5deebafef816
Superblock backups stored on blocks:
        32768, 98304

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

cicchelli@parcial:~$ free -h
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       229Mi       282Mi       1.0Mi       1.4Gi       1.5Gi
Swap:             0B          0B          0B
cicchelli@parcial:~$ sudo mkswap /dev/mapper/vg_datos-lv_swap
mkswap: /dev/mapper/vg_datos-lv_swap: warning: wiping old ext4 signature.
Setting up swapspace version 1, size = 512 MiB (536866816 bytes)
no label, UUID=76e2b76d-af92-4543-b233-ce25edaffa5f
cicchelli@parcial:/var/lib$ sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
cicchelli@parcial:/var/lib$ df -h
Filesystem                      Size  Used Avail Use% Mounted on
tmpfs                           197M  1.1M  196M   1% /run
/dev/sda1                        39G  2.6G   37G   7% /
tmpfs                           982M     0  982M   0% /dev/shm
tmpfs                           5.0M     0  5.0M   0% /run/lock
tmpfs                           197M  4.0K  197M   1% /run/user/1000
/dev/mapper/vg_datos-lv_docker  3.5M   24K  3.0M   1% /var/lib/docker
cicchelli@parcial:/var/lib$ lsblk -f
NAME                      FSTYPE      FSVER            LABEL           UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
loop0                     squashfs    4.0                                                                           0   100% /snap/lxd/38800
loop1                     squashfs    4.0                                                                           0   100% /snap/core20/2866
loop2                     squashfs    4.0                                                                           0   100% /snap/snapd/26865
sda
└─sda1                    ext4        1.0              cloudimg-rootfs e57cb73c-ac10-4b9b-b4ec-c506d8c896ca     36.1G     7% /
sdb                       iso9660     Joliet Extension cidata          2026-05-15-11-13-05-00
sdc
├─sdc1                    LVM2_member LVM2 001                         gVELnt-xX6T-myhy-hNs0-3O3L-9Z0Q-U5Quwh
├─sdc2                    LVM2_member LVM2 001                         99M84v-fXOt-bVkW-1jTp-oRkW-Tehn-h1PceK
│ └─vg_datos-lv_workareas ext4        1.0                              8ed7b913-8247-49c4-a21c-207dd7782a30
└─sdc3                    LVM2_member LVM2 001                         2DTaMi-Wv9L-tyEZ-vFcZ-eRGX-x9LW-jrYj14
sdd                       LVM2_member LVM2 001                         pHTiCM-ylOW-DAgE-eIX3-rqlJ-Yqsc-CwnWd1
├─vg_datos-lv_docker      ext4        1.0                              806a7b68-da0e-4689-8517-5b7588dc25c3      2.9M     1% /var/lib/docker
├─vg_datos-lv_workareas   ext4        1.0                              8ed7b913-8247-49c4-a21c-207dd7782a30
└─vg_datos-lv_swap        swap        1                                76e2b76d-af92-4543-b233-ce25edaffa5f
cicchelli@parcial:/var/lib$ cd /
cicchelli@parcial:/$ ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  sys  tmp  usr  var
cicchelli@parcial:/$ sudo mkdir work
cicchelli@parcial:/$ ls
bin  boot  dev  etc  home  lib  lib32  lib64  libx32  lost+found  media  mnt  opt  proc  root  run  sbin  snap  srv  sys  tmp  usr  var  work
cicchelli@parcial:/$ sudo mount /dev/mapper/vg_datos-lv_workareas work/
cicchelli@parcial:/$ df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              197M  1.1M  196M   1% /run
/dev/sda1                           39G  2.6G   37G   7% /
tmpfs                              982M     0  982M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
tmpfs                              197M  4.0K  197M   1% /run/user/1000
/dev/mapper/vg_datos-lv_docker     3.5M   24K  3.0M   1% /var/lib/docker
/dev/mapper/vg_datos-lv_workareas  1.5G   24K  1.4G   1% /work
cicchelli@parcial:/$ free -h
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       225Mi       284Mi       1.0Mi       1.4Gi       1.5Gi
Swap:             0B          0B          0B
cicchelli@parcial:/$ sudo swapon /dev/mapper/vg_datos-lv_swap
cicchelli@parcial:/$ free -h
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       225Mi       284Mi       1.0Mi       1.4Gi       1.5Gi
Swap:          511Mi          0B       511Mi
cicchelli@parcial:/$ sudo systemctl restart docker
cicchelli@parcial:/$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2026-06-23 04:34:20 UTC; 16s ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 11041 (dockerd)
      Tasks: 8
     Memory: 25.1M
        CPU: 751ms
     CGroup: /system.slice/docker.service
             └─11041 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.194034582Z" level=info msg="Restoring containers: start."
Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.218567888Z" level=info msg="Deleting nftables IPv4 rules" error="running nft: >
Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.242140003Z" level=info msg="Deleting nftables IPv6 rules" error="running nft: >
Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.864425344Z" level=info msg="Loading containers: done."
Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.873544906Z" level=info msg="Docker daemon" commit=70eaf5e containerd-snapshott>
Jun 23 04:34:19 parcial dockerd[11041]: time="2026-06-23T04:34:19.873732666Z" level=info msg="Initializing buildkit"
Jun 23 04:34:20 parcial dockerd[11041]: time="2026-06-23T04:34:20.097486472Z" level=info msg="Completed buildkit initialization"
Jun 23 04:34:20 parcial dockerd[11041]: time="2026-06-23T04:34:20.108722777Z" level=info msg="Daemon has completed initialization"
Jun 23 04:34:20 parcial dockerd[11041]: time="2026-06-23T04:34:20.108857378Z" level=info msg="API listen on /run/docker.sock"
Jun 23 04:34:20 parcial systemd[1]: Started Docker Application Container Engine.

