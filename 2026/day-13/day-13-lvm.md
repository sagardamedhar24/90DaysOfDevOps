# Day 13 – Linux Volume Management (LVM)

* Linux Volume Management is primarily implemented via the Logical Volume Manager (LVM) is a strong virtualization technology that
  abstracts physical hard disks into flexible resizable virtual partitions. Its three core layers are Physical Volume (PVs), Volume Groups (VGs)
  , and Logical Volume (LVs).

  <img width="753" height="489" alt="image" src="https://github.com/user-attachments/assets/c787f872-56c4-4b75-b417-42481c987ce1" />

## Steps that I followed while practicing Linux Volume Management concept: 
1)	For this Day-13 task, I have created 3 volumes on AWS EBS with size 5Gb, 7Gb & 10Gb each, on the same availability zone (eu-north-1c), in which my one of AWS EC2 instance is available. 
2)	Then, I attached all these 3 volumes to my EC2 instance. But, those are only attached but not usable.

  	<img width="797" height="210" alt="1" src="https://github.com/user-attachments/assets/285b7599-2d7e-4d88-84a9-659b5d363a44" />

3)	To make them usable, we need to convert the to Physical Volumes.
   Command e.g.: `pvcreate /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1`
  	
4)	By using these physical volumes I have created volume group of two physical volumes.
    Command e.g.: `vgcreate devops_vg /dev/nvme1n1 /dev/nvme2n1`

5)	Then using volume groups, I have created Logical Volume. 
    Command e.g.: `lvcreate -L 5G -n lv-app-data devops_vg`

<img width="679" height="467" alt="5" src="https://github.com/user-attachments/assets/bbbf3f04-0fbf-41bd-a924-754c0eb7e7ee" />

6)	Now, we have just created physical & logical volumes. But we have to mount these volumes with particular path. 
  * So creating mount folder: `mkdir -p /mnt/app-data`
  * Before mount, we need to format the logical volume: 
  `mkfs .ext4 /dev/devops_vg/lv-app-data`
  * Then, mount the logical unit to particular path: 
    Command: mount /source(lv)-path /target(mount)-path
    Example: ` mount /dev/devops_vg/lv-app-data /mnt/app-data` 
  * Now, moved to path: `cd /mnt/app-data`
  * Also, we can extend the volume for particular mount. As per below command e.g. 
  `lvextend -L +3G /dev/devops_vg/lv-app-data`

<img width="715" height="479" alt="6" src="https://github.com/user-attachments/assets/8e1d778b-5901-45be-86ae-ffce1687d299" />

<img width="720" height="438" alt="7" src="https://github.com/user-attachments/assets/2054e55b-ab46-40bb-a6fb-a8c3f2f22b51" />

Extended Volume by 3Gb (Snapshot):
<img width="781" height="455" alt="10" src="https://github.com/user-attachments/assets/5dd69dfc-2b1a-4cde-8388-0dc214eac40d" />


7)	Now, the volume that I created and attached is usable after mounting the logical volume. 

8)	Also, we can mount the physical volume/direct EBS volume without creating Logical Valume. To do this: 
-	Create another folder under : /mnt/devops-disc-mount
-	Format the phycal/EBS mount: `mkfs -t ext4 /dev/nvme3n1`
-	Mount the block: `mount /dev/nvme3n1 /mnt/devops-disc-mount`

 Mounting Physical/ AWS EBS volume directly without creating Logical Valume:

 <img width="936" height="469" alt="9" src="https://github.com/user-attachments/assets/a6070e89-df9c-4977-8303-54c7127b5ef8" />

## Commands Used: 

- `lsblk` : Check or List blocks
- `df -h` : Show current disk usage
- `pvs` : To list Physical volumes
- `vgs` : To find volume groups
- `lvs` : To list Logical Volumes
- `pvcreate /dev/vol1 /dev/vol2 /dev/vol3` : To create physical volumes from AWS EBS volumes
- `vgcreate vol_grp_name /dev/vol1 /dev/vol2` : To create volume group
- `lvcreate -L size(5G) -n log_vol_name vol_grp_name` : To create logical volume from volume group.
- `mkdir -p /mnt/mount-folder-name` : To create mount folder/directory
- `mkfs.ext4 /dev/vol_grp_name/log_vol_name/` : To format the logical volume
- `mount /dev/vol_grp_name/log_vol_name /dev/mount_folder_name` :  To mount the logical volume on particular path/location.
- `cd /mnt/mount_folder_name` : To change directory
- `lvextend -L +size(3G) /dev/vol_grp_name/log_vol_name` : To extend/resize the volume of particular mounted volume.
- `mkfs -t ext4 /dev/vol3` :  To format physical volume / AWS EBS volume.
- `mount /dev/vol3 /mnt/disk_mount_folder` : To mount the physical volume/AWS EBS volume directly on disk path

## What I Learned
* Through this Day-13 practice challenge, I have understand that using Linux Volume Management we can manage the stoarge for any virtual server.
* We can extend / shrinks the storage volume for any cloud server using Logical Volumen Manager (LVM) as per our requirement, without rebooting them.
* I understood that how we can creates raw volumes from AWS EBS and attach them to our instances.
* We can dynamically divide the larger volume units into smaller chunks or can combine multiple small physical disks into one massive volume group,
using LVM Volume Group concepts.
* Even, by using Volume Snapshots option, we can backup our currently running server storage volume into another volume and can migrate data to newer storage volumes.
 

