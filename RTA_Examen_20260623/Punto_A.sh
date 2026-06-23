
Santiago@DESKTOP-H8JVUJJ MINGW64 ~/Documents/UTN-FRA_SO_Vagrant/VagrantFiles/parcial (master)
$ vagrant ssh
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-179-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Jun 23 03:02:03 UTC 2026

  System load:             0.1
  Usage of /:              6.6% of 38.70GB
  Memory usage:            18%
  Swap usage:              0%
  Processes:               105
  Users logged in:         0
  IPv4 address for enp0s3: 10.0.2.15
  IPv6 address for enp0s3: fd17:625c:f037:2:dc:5fff:fe02:c88d


Expanded Security Maintenance for Applications is not enabled.

44 updates can be applied immediately.
36 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

2 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

New release '24.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Tue Jun 23 02:04:36 2026 from 10.0.2.2
vagrant@parcial:~$ su cicchelli
Password:
cicchelli@parcial:/home/vagrant$ cd
cicchelli@parcial:~$ sudo fdisk -l
[sudo] password for cicchelli:
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


Disk /dev/sdd: 1 GiB, 1073741824 bytes, 2097152 sectors
Disk model: HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
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

	
