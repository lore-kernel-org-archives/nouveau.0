From: randrianasulu@gmail.com
Subject: Different swap behaviour between 2.6.36 and .37-rc1 ?
Date: Mon, 15 Nov 2010 18:40:30 +0300
Message-ID: <201011151840.31916.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hello all.

I'm using this kernel tree:
http://cgit.freedesktop.org/nouveau/linux-2.6/

It works OK for most time, but some days ago i booted with mem=256m (machine 
has 768mb of ram) and found what after merging 2.6.37-rc1 into this tree some 
workloads generated much more swap activity, than 2.6.36-based tree (from 
around 5/11/2010).

If I boot my kernel with mem=256m, then add swapfile (Adding 399996k swap 
on /swap.file.  Priority:-1 extents:728 across:2152040k) startx with nouveau 
driver and start to do usual stuff, after some hours of use 2.6.37-rc1 based 
kernel started  to swap thing in and mostly OUT swapfile, sometimes stalling 
machine for long time (around minute).

I have mozilla (seamonkey) session open most of time, in both cases it sized 
around
14823 guest     20   0  298m 102m  11m S 10.5 41.5 156:43.55 seamonkey-bin   

(~300 mb virt, ~100mb res)

Then, i start some git pull/make job (on wine or kernel source tree). After 
job finished, 2.6.36-based kernel behave OK, even if i have some 126976k used 
in swapfile. 2.6.37-rc1 based kernel  starts to swap things, at  application 
start, at menu open time (e16 here - nothing  over-bloated), when i scroll 
some pages in  seamonkey ... Most notable - closing seamonkey takes much more 
time (and swap-outs) under 2.6.37-rc1 kernel. 

May be this behaviour was fixed in latest mainline kernel, i tried to look 
at /sys/class/drm/ttm/memory_accounting/kernel/used_memory  but under  both 
kernel valus stays around 18000-19000 (currently: 18196) this lead me to thin 
this is not just some pixmaps for my 256 Mb VRAM GeForce6200/agp videocard. 
But i can be wrong here.

I have usual ide hdd, still configured as hdc/hdd:

/dev/hdd:

 Model=SAMSUNG SP0802N, FwRev=TK200-04, SerialNo=S00JJ10X568638
 Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs }
 RawCHS=16383/16/63, TrkSize=34902, SectSize=554, ECCbytes=4
 BuffType=DualPortCache, BuffSize=2048kB, MaxMultSect=16, MultSect=16
 CurCHS=4047/16/255, CurSects=16511760, LBA=yes, LBAsects=156368016
 IORDY=on/off, tPIO={min:240,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4 
 DMA modes:  mdma0 mdma1 mdma2 
 UDMA modes: udma0 udma1 udma2 udma3 udma4 *udma5 
 AdvancedPM=no WriteCache=enabled
 Drive conforms to: ATA/ATAPI-7 T13 1532D revision 0:  ATA/ATAPI-1,2,3,4,5,6,7

 * signifies the current active mode

/dev/hdc:

 Model=ST3160021A, FwRev=8.01, SerialNo=5LJ0BXTG
 Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs RotSpdTol>.5% }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=4
 BuffType=unknown, BuffSize=2048kB, MaxMultSect=16, MultSect=16
 CurCHS=4047/16/255, CurSects=16511760, LBA=yes, LBAsects=312581808
 IORDY=on/off, tPIO={min:240,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4 
 DMA modes:  mdma0 mdma1 mdma2 
 UDMA modes: udma0 udma1 udma2 udma3 udma4 *udma5 
 AdvancedPM=no WriteCache=enabled
 Drive conforms to: ATA/ATAPI-6 T13 1410D revision 2:  ATA/ATAPI-1,2,3,4,5,6

 * signifies the current active mode

driver in use:
Uniform Multi-Platform E-IDE driver
via82cxxx 0000:00:11.1: VIA vt8233a (rev 00) IDE UDMA133
via82cxxx 0000:00:11.1: IDE controller (0x1106:0x0571 rev 0x06)


default ext3 with ordered data mode on all partitions touched by swap, make or 
usual system activity (/ i mean).

/proc/sys/vm/swappines stays at 60 for two kernels, dirty_ratio - 20, constant 
too.

I'm out of ideas what was changed, because i rebooted few times and 2.6.36 was  
always better in this  area, compared to 2.6.37-rc1. Note, you may need to  
actually work with seamonkey , may be for few  hours, right after session 
restore it barely touches swap here with 256mb RAM. 

I think i'll try until 2.6.37-rc2 and if this behaviour continued - I will 
open bug at kernel bugzilla with configs and other data .....
