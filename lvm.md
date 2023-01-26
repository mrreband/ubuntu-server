## Logical Volume Management (LVM)

File system structure: 

<img src="https://d33wubrfki0l68.cloudfront.net/cda83679d927d9fbbdd73e2656b5615e2e2e6c89/81d1e/images/2019/11/lvm-key.jpeg" />

---
### LVM commands

#### *hard drives:* `sudo parted -l`

```
Model: ATA TOSHIBA DT01ACA2 (scsi)
Disk /dev/sda: 2000GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  1128MB  1127MB  fat32              boot, esp
 2      1128MB  3276MB  2147MB  ext4
 3      3276MB  2000GB  1997GB
...
```

---

#### partitions: `sudo lvmdiskscan`

```
  /dev/loop0  [     <61.96 MiB]
  /dev/sda1   [      <1.05 GiB]
  /dev/loop2  [      67.81 MiB]
  /dev/sda2   [       2.00 GiB]
  /dev/loop3  [     <55.61 MiB]
  /dev/sda3   [      <1.82 TiB] LVM physical volume
  ...
```

---

#### physical volumes: `sudo pvs`

```
  PV         VG        Fmt  Attr PSize    PFree
  /dev/sda3  ubuntu-vg lvm2 a--    <1.82t <1.72t
  /dev/sdb3  centos    lvm2 a--  <231.69g  4.00m
```
    
---

#### volume groups: `sudo vgs`
```
  "centos" <231.69 GiB [231.68 GiB used / 4.00 MiB free]
  "ubuntu-vg" <1.82 TiB [100.00 GiB used / <1.72 TiB free]
```

---

#### logical volumes: `sudo lvs` or `sudo lvdisplay for more details`:
```
  home      centos    -wi-a----- 173.87g
  root      centos    -wi-a-----  50.00g
  swap      centos    -wi-a-----   7.81g
  ubuntu-lv ubuntu-vg -wi-ao---- 100.00g
```

---
#### Resizing logical volumes: `lvresize`
- logical volume `ubuntu-lv` is only using 100 gb of the 1.82TB available for the volume group `ubuntu-vg`
- steps to resize a logical volume: 
  1. find the path of the logical volume: `sudo lvdisplay -C -o "lv_name,lv_path" | grep ubuntu-lv | awk '{print $2}'`
  2. resize the logical volume: 
     1. `-L` to add a specific amount: `sudo lvresize -r -L +10G /path/from/above`
     2. `-l` to add a percentage: `sudo lvresize -r -l +100%FREE </path/from/above>`

- use `-r` to also automatically resize the filesystem within the logical volume

---

to extend the `swap` drive:
1. turn off swap: `sudo swapoff`
2. do the `lvresize` described above
3. make the swap `sudo mkswap /path/to/swap`
4. turn swap back on `sudo swapon`

