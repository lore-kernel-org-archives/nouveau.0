From: Neal Holtz <nholtz-invPoGwsRgKUIZwRiZtBUQ@public.gmane.org>
Subject: Linux Mint 10 KDE Live DVD would not start on Fujitsu
 laptop, NVIDIA video, HDMI
Date: Sun, 06 Mar 2011 21:04:59 -0500
Message-ID: <201103062105.00061.nholtz@cee.carleton.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I had a problem with LInux Mint 10 KDE, with the Live DVD resulting
in a blank screen and no keyboard response during the KDE splash.  

I traced it to the fact that the laptop screen was turned off and it had 
switched to HDMI.

After installing LM 10 KDE and installing the NVIDI proprietary drivers
(and disabling nouveau), it worked fine.

I have reported it as launchpad bug 724722, and more info
is available there, including lots of logs:

https://bugs.launchpad.net/linuxmint/+bug/724722

There are at least 2 other similar cases reported on launchpad/linuxmint

Machine particulars:

wall:~> inxi -F
System:    Host wall Kernel 2.6.35-27-generic x86_64 (64 bit) Distro Linux Mint 10 KDE
CPU:       Dual core Intel Core i5 M 430 (-HT-MCP-) cache 3072 KB flags (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips 9044.14 
           Clock Speeds: (1) 1199.00 MHz (2) 1199.00 MHz (3) 1199.00 MHz (4) 1199.00 MHz
Graphics:  Card nVidia GT216 [GeForce GT 330M] tty res: 148x52 
Audio:     Card-1 nVidia High Definition Audio Controller driver HDA Intel BusID: 01:00.1
           Card-2 Intel 5 Series/3400 Series Chipset High Definition Audiodriver HDA Intel BusID: 00:1b.0
           Sound: Advanced Linux Sound Architecture Version 1.0.23
Network:   Card-1 Atheros AR9287 Wireless Network Adapter (PCI-Express) driver ath9k BusID: 10:00.0
           Card-2 Broadcom NetLink BCM57780 Gigabit Ethernet PCIe driver tg3 v: 3.110 BusID: 18:00.0
Disks:     HDD Total Size: 500.1GB (15.1% used) 1: /dev/sda FUJITSU_MJA2500B 500.1GB 
Partition: ID:/ size: 19G used: 6.5G (38%) fs: ext4 ID:/home size: 437G used: 64G (16%) fs: ext4 
           ID:swap-1 size: 4.10GB used: 0.00GB (0%) fs: swap 
Info:      Processes 191 Uptime 1:29 Memory 743.8/3824.2MB Runlevel 2 Client Shell inxi 1.4.12 



-- 
Neal Holtz                             http://cee.carleton.ca/~nholtz
Dept. of Civil and Environmental Engineering,   Carleton University,   
Ottawa, Ontario, Canada K1S 5B6.               nholtz-invPoGwsRgKUIZwRiZtBUQ@public.gmane.org
Public Key:  http://holtz3.cee.carleton.ca/~nholtz/pubkey.asc
Office-Hours: http://holtz3.cee.carleton.ca/~nholtz/office-hours.html
Free-Busy: http://holtz3.cee.carleton.ca/~nholtz/free-busy.cgi
