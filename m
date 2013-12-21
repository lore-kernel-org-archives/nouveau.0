From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] New: NV98 [GeForce 9300 gs m] hangs on boot-
 all linux kernel versions > 3.2
Date: Sat, 21 Dec 2013 03:28:15 +0000
Message-ID: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2080603341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2080603341==
Content-Type: multipart/alternative; boundary="1387596495.71Afd31.5623"; charset="us-ascii"


--1387596495.71Afd31.5623
Date: Sat, 21 Dec 2013 03:28:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

          Priority: medium
            Bug ID: 72943
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV98 [GeForce 9300 gs m] hangs on boot- all linux
                    kernel versions > 3.2
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dardevelin-R9hm4oqK0XJGyKhy+UYuEA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 91069
  --> https://bugs.freedesktop.org/attachment.cgi?id=91069&action=edit
vbios.rom file

Hi, [warning newb in town]:
As in summary, I can't boot any kernel version above 3.2 in a debian sid
install without using nouveau.modeset=0

After discarding the hypoteses of being related to microcode by installing it,
and the later doing a fresh install of the distro i took some pictures to try
get some help they can be found here
http://cidadecool.com/z-tunes/debian/problem/Foto0810.jpg
http://cidadecool.com/z-tunes/debian/problem/Foto0817.jpg

removing quiet from grub line, i was able to read some nouveau messages which
led me to the irc channel on freenode, where 'imirkin' helped getting the
appropriated data to report this bub.

ON:Linux version 3.11-2-amd64 (debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org) (gcc version
4.8.2 (Debian 4.8.2-7) ) #1 SMP Debian 3.11.10-1 (2013-12-04)

running as root in a virtual terminal 'ctrl+alt+f2' 
rmmod nouveau
modprobe nouveau 

did not generate any kind of messages, so i followed the test with 
rmmod nouveau
modprobe nouveau modeset=1
the machine hang again, syslog which can be found here
http://cidadecool.com/z-tunes/debian/problems/syslog.1-saved
or viewed in the of this file.

imirkin mentioned it would be useful to provide vbios.rom so i booted into the
working kernel (3.2), but did not found /sys/kernel/debug/dri/0/vbios.rom
so i compiled https://github.com/envytools/envytools 
and ran sudo ./nvagetbios > ~/gforce9300gsm-vbios.rom which is attached and can
also be found here
at http://cidadecool.com/z-tunes/debian/problem/gforce9300gsm-vbios.rom

hope this helps you helping me and thank you for your time.

I hope i did not screw the important/relevant section and here is a partial
copy of the syslog, please use the link if you need the full one.

Syslog Partial copy: 
ec 21 00:43:59 ycradnileved kernel: [ 3818.384770] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x298480a2
Dec 21 00:43:59 ycradnileved kernel: [ 3818.384873] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G98 (NV98)
Dec 21 00:43:59 ycradnileved kernel: [ 3818.384969] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
Dec 21 00:43:59 ycradnileved kernel: [ 3818.387139] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478081] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478178] nouveau  [  
VBIOS][0000:01:00.0] using image from PRAMIN
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478385] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478479] nouveau  [  
VBIOS][0000:01:00.0] version 62.98.39.00.05
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] INFO: rcu_sched
self-detected stall on CPU { 0}  (t=5250 jiffies g=14778 c=14777 q=144)
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] sending NMI to all CPUs:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] NMI backtrace for cpu 0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RIP:
0010:[<ffffffff812600f9>]  [<ffffffff812600f9>] __const_udelay+0x9/0x30
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RSP: 0018:ffff8800bf803e48 
EFLAGS: 00000046
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RAX: 0000000000000000 RBX:
0000000000002710 RCX: 0000000000000008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RDX: 00000000008a0444 RSI:
0000000000000200 RDI: 0000000000418958
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RBP: ffffffff818405c0 R08:
0000000000000000 R09: 000000000000043d
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] R10: 0000000000000000 R11:
ffff8800bf803bb6 R12: ffffffff818405c0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] R13: ffff8800bb2a6000 R14:
0000000000000090 R15: ffff8800bf80ed80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Stack:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  ffffffff8103ed6a
ffffffff8189bea0 ffffffff810dbe01 0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  0000000000000001
ffffffff810a3100 ffff8800b90f1c50 ffff8800855e8080
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  0000000000000000
0000000000000000 ffff8800bf80e220 ffff8800bf803f68
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Call Trace:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  <IRQ> 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8103ed6a>] ?
arch_trigger_all_cpu_backtrace+0x5a/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810dbe01>] ?
rcu_check_callbacks+0x321/0x610
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810a3100>] ?
do_timer+0x200/0x640
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810aa4e0>] ?
tick_sched_handle.isra.15+0x60/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810654ab>] ?
update_process_times+0x3b/0x70
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810aa49b>] ?
tick_sched_handle.isra.15+0x1b/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810aa517>] ?
tick_sched_timer+0x37/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8107b194>] ?
__run_hrtimer+0x74/0x1b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8107b939>] ?
hrtimer_interrupt+0xe9/0x220
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8103d386>] ?
smp_apic_timer_interrupt+0x36/0x50
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8148205d>] ?
apic_timer_interrupt+0x6d/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  <EOI> 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa041071a>] ?
init_nv_reg+0x6a/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0410709>] ?
init_nv_reg+0x59/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0415045>] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0415508>] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa041a875>] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0409c72>] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa042d478>] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0409618>] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0409ee0>] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa045e41e>] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0252e4a>] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa0255035>] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa045eab2>] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8127dfe4>] ?
local_pci_probe+0x34/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8127f202>] ?
pci_device_probe+0x112/0x120
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132f348>] ?
driver_probe_device+0x68/0x220
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132f5bb>] ?
__driver_attach+0x7b/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132f540>] ?
__device_attach+0x40/0x40
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132d633>] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132ead8>] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8132fb6a>] ?
driver_register+0x6a/0x140
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffffa07a7000>] ?
0xffffffffa07a6fff
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff8100210a>] ?
do_one_initcall+0x10a/0x160
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810b56c2>] ?
load_module+0x1bf2/0x24a0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810b2340>] ?
m_show+0x1c0/0x1c0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff810b6001>] ?
SyS_init_module+0x91/0xc0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [<ffffffff81481469>] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Code: 00 00 48 ff c8 75 fb
48 ff c8 c3 0f 1f 80 00 00 00 00 48 8b 05 51 87 60 00 ff e0 0f 1f 80 00 00 00
00 65 48 8b 14 25 20 3b 01 00 <48> 8d 0c 12 48 c1 e2 06 48 8d 04 bd 00 00 00 00
48 29 ca f7 e2 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] NMI backtrace for cpu 1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CPU: 1 PID: 0 Comm:
swapper/1 Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] task: ffff8800beeea780 ti:
ffff8800bef0a000 task.ti: ffff8800bef0a000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RIP:
0010:[<ffffffff8103a56e>]  [<ffffffff8103a56e>] mwait_idle_with_hints+0x5e/0x70
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RSP: 0018:ffff8800bef0be30 
EFLAGS: 00000046
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RAX: 0000000000000020 RBX:
ffff8800bee7cc00 RCX: 0000000000000001
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RDX: 0000000000000000 RSI:
0000000000000001 RDI: 0000000000000020
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RBP: ffff8800bee7ccd4 R08:
ffff8800bef0bfd8 R09: 0000000000000018
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] R10: 0000000000000c01 R11:
0000000000000007 R12: ffffffffa0225090
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] R13: 0000000000000003 R14:
ffff8800b91f5200 R15: ffffffffa02251b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] FS:  0000000000000000(0000)
GS:ffff8800bf880000(0000) knlGS:0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CR2: 00007fe04b6180c0 CR3:
000000000180c000 CR4: 00000000000007e0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Stack:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffffa0221e40
0000000000000019 ffff8800b91f5200 ffff8800bef0bea0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffffa0225090
0000037df316a58e 0000000000000003 ffffffffa02251b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffff81360c7b
0000000000000003 0000000000000003 0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Call Trace:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffffa0221e40>] ?
acpi_idle_enter_bm+0x1a7/0x1fb [processor]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffff81360c7b>] ?
cpuidle_enter_state+0x3b/0xc0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffff81360dbb>] ?
cpuidle_idle_call+0xbb/0x1f0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffff8101aac5>] ?
arch_cpu_idle+0x5/0x30
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffff810a096e>] ?
cpu_startup_entry+0xde/0x280
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [<ffffffff8103b892>] ?
start_secondary+0x1d2/0x230
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Code: 89 d1 48 2d c8 1f 00
00 0f 01 c8 0f ae f0 65 48 8b 04 25 30 c8 00 00 48 8b 80 38 e0 ff ff a8 08 75
09 48 89 f8 48 89 f1 0f 01 c9 <f3> c3 41 0f ae b8 38 e0 ff ff eb bd 66 0f 1f 44
00 00 65 8b 14 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] INFO: NMI handler
(arch_trigger_all_cpu_backtrace_handler) took too long to run: 3.455 msecs
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] BUG: soft lockup - CPU#0
stuck for 22s! [modprobe:5556]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Modules linked in:
nouveau(+) parport_pc ppdev lp parport rfcomm bnep uinput binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse joydev uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core videodev coretemp media
kvm_intel kvm iTCO_wdt iTCO_vendor_support snd_hda_codec_hdmi lpc_ich
snd_hda_codec_realtek psmouse microcode snd_hda_intel snd_hda_codec snd_hwdep
pcspkr mxm_wmi mfd_core i2c_i801 snd_pcm battery serio_raw evdev wmi
acpi_cpufreq video iwlwifi ac mperf snd_page_alloc button btusb ttm
drm_kms_helper drm i2c_algo_bit i2c_core snd_seq processor snd_seq_device
cfg80211 bluetooth snd_timer snd soundcore rfkill ext4 crc16 mbcache jbd2 sg
ums_realtek usb_storage sr_mod sd_mod cdrom crc_t10dif ahci libahci libata
scsi_mod thermal thermal_sys r8169 mii ehci_pci uhci_hcd ehci_hcd usbcore
usb_common [last unloaded: nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RIP:
0010:[<ffffffffa041044d>]  [<ffffffffa041044d>] init_mask+0x2d/0x290 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RSP: 0018:ffff8800bb2a7870 
EFLAGS: 00000246
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RAX: ffff8800857a7c80 RBX:
000000000000d9d5 RCX: 0000000008000000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RDX: 0000000000000000 RSI:
ffff880037014c00 RDI: ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RBP: ffff8800bb2a78c8 R08:
000000000000d9f0 R09: 0000000000000020
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] R10: ffff8800857a7c80 R11:
00000000000000f0 R12: ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] R13: ffff8800bb2a78c8 R14:
02c900120149d9d5 R15: 00000000e6f5528a
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Stack:
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800ffffffff
ffff8800bb2a78c8 0000000000000000 ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800bb2a78c8
ffff88009a56c0c0 ffffffffa0415045 ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800bb2a78c8
ffffffffa0415508 0000000000000002 ffff88009a56c0c0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Call Trace:
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0415045>] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0415508>] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa041a875>] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0409c72>] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa042d478>] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0409618>] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0409ee0>] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa045e41e>] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0252e4a>] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa0255035>] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa045eab2>] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8127dfe4>] ?
local_pci_probe+0x34/0x60
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8127f202>] ?
pci_device_probe+0x112/0x120
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132f348>] ?
driver_probe_device+0x68/0x220
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132f5bb>] ?
__driver_attach+0x7b/0x80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132f540>] ?
__device_attach+0x40/0x40
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132d633>] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132ead8>] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8132fb6a>] ?
driver_register+0x6a/0x140
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffffa07a7000>] ?
0xffffffffa07a6fff
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff8100210a>] ?
do_one_initcall+0x10a/0x160
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff810b56c2>] ?
load_module+0x1bf2/0x24a0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff810b2340>] ?
m_show+0x1c0/0x1c0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff810b6001>] ?
SyS_init_module+0x91/0xc0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [<ffffffff81481469>] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Code: 41 55 41 89 cd 41 54
41 89 d4 55 48 89 fd 53 89 f3 83 e3 fc 48 83 ec 08 48 8b 7f 08 48 8b 47 10 48
85 c0 48 0f 44 c7 48 8b 70 08 <48> 85 f6 48 0f 44 f0 0f b6 45 24 83 be e0 00 00
00 4f 76 14 85 
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] BUG: soft lockup - CPU#0
stuck for 22s! [modprobe:5556]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Modules linked in:
nouveau(+) parport_pc ppdev lp parport rfcomm bnep uinput binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse joydev uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core videodev coretemp media
kvm_intel kvm iTCO_wdt iTCO_vendor_support snd_hda_codec_hdmi lpc_ich
snd_hda_codec_realtek psmouse microcode snd_hda_intel snd_hda_codec snd_hwdep
pcspkr mxm_wmi mfd_core i2c_i801 snd_pcm battery serio_raw evdev wmi
acpi_cpufreq video iwlwifi ac mperf snd_page_alloc button btusb ttm
drm_kms_helper drm i2c_algo_bit i2c_core snd_seq processor snd_seq_device
cfg80211 bluetooth snd_timer snd soundcore rfkill ext4 crc16 mbcache jbd2 sg
ums_realtek usb_storage sr_mod sd_mod cdrom crc_t10dif ahci libahci libata
scsi_mod thermal thermal_sys r8169 mii ehci_pci uhci_hcd ehci_hcd usbcore
usb_common [last unloaded: nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RIP:
0010:[<ffffffffa040a7ce>]  [<ffffffffa040a7ce>] nv_printk_+0x13e/0x1c0
[nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RSP: 0018:ffff8800bb2a7838 
EFLAGS: 00000282
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RAX: 0000000000000000 RBX:
ffffffffa049cd02 RCX: ffffffffa049c8d1
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RDX: 0000000000000005 RSI:
ffffffffa049caf4 RDI: ffff8800857a7c80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RBP: ffff8800bb2a7858 R08:
000000000000d9e3 R09: 0000000000000020
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] R10: ffff8800857a7c80 R11:
00000000000000f0 R12: ffff8800bb2a7806
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] R13: ffff8800857a7c80 R14:
ffffffffa040cd4b R15: 0000000000000018
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Stack:
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  ffff8800bb2a78c8
000000000000e820 00000000ffffffff ffff88009a56c0c0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  0000000080000000
ffffffffa0410750 ffff88000000e820 ffff8800ffffffff
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  ffff880080000000
ffff8800bb2a78c8 0000000000000000 ffff8800857a7c80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Call Trace:
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0410750>] ?
init_nv_reg+0xa0/0xe0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0415045>] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0415508>] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa041a875>] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0409c72>] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa042d478>] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0409618>] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0409ee0>] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa045e41e>] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0252e4a>] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa0255035>] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa045eab2>] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8127dfe4>] ?
local_pci_probe+0x34/0x60
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8127f202>] ?
pci_device_probe+0x112/0x120
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132f348>] ?
driver_probe_device+0x68/0x220
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132f5bb>] ?
__driver_attach+0x7b/0x80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132f540>] ?
__device_attach+0x40/0x40
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132d633>] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132ead8>] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8132fb6a>] ?
driver_register+0x6a/0x140
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffffa07a7000>] ?
0xffffffffa07a6fff
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff8100210a>] ?
do_one_initcall+0x10a/0x160
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff810b56c2>] ?
load_module+0x1bf2/0x24a0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff810b2340>] ?
m_show+0x1c0/0x1c0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff810b6001>] ?
SyS_init_module+0x91/0xc0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [<ffffffff81481469>] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Code: 8d 84 24 78 01 00 00
48 89 44 24 28 e8 dc 4d c9 e0 48 8b 84 24 70 01 00 00 65 48 33 04 25 28 00 00
00 75 7f 48 81 c4 a8 01 00 00 <5b> 41 5c 41 5d 41 5e 5d c3 66 0f 1f 84 00 00 00
00 00 44 3b a7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387596495.71Afd31.5623
Date: Sat, 21 Dec 2013 03:28:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV98 [GeForce 9300 gs m] hangs on boot- all linux kernel versions &gt; 3.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">72943</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV98 [GeForce 9300 gs m] hangs on boot- all linux kernel versions &gt; 3.2
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dardevelin&#64;cidadecool.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=91069" name="attach_91069" title="vbios.rom file">attachment 91069</a> <a href="attachment.cgi?id=91069&amp;action=edit" title="vbios.rom file">[details]</a></span>
vbios.rom file

Hi, [warning newb in town]:
As in summary, I can't boot any kernel version above 3.2 in a debian sid
install without using nouveau.modeset=0

After discarding the hypoteses of being related to microcode by installing it,
and the later doing a fresh install of the distro i took some pictures to try
get some help they can be found here
<a href="http://cidadecool.com/z-tunes/debian/problem/Foto0810.jpg">http://cidadecool.com/z-tunes/debian/problem/Foto0810.jpg</a>
<a href="http://cidadecool.com/z-tunes/debian/problem/Foto0817.jpg">http://cidadecool.com/z-tunes/debian/problem/Foto0817.jpg</a>

removing quiet from grub line, i was able to read some nouveau messages which
led me to the irc channel on freenode, where 'imirkin' helped getting the
appropriated data to report this bub.

ON:Linux version 3.11-2-amd64 (<a href="mailto:debian-kernel&#64;lists.debian.org">debian-kernel&#64;lists.debian.org</a>) (gcc version
4.8.2 (Debian 4.8.2-7) ) #1 SMP Debian 3.11.10-1 (2013-12-04)

running as root in a virtual terminal 'ctrl+alt+f2' 
rmmod nouveau
modprobe nouveau 

did not generate any kind of messages, so i followed the test with 
rmmod nouveau
modprobe nouveau modeset=1
the machine hang again, syslog which can be found here
<a href="http://cidadecool.com/z-tunes/debian/problems/syslog.1-saved">http://cidadecool.com/z-tunes/debian/problems/syslog.1-saved</a>
or viewed in the of this file.

imirkin mentioned it would be useful to provide vbios.rom so i booted into the
working kernel (3.2), but did not found /sys/kernel/debug/dri/0/vbios.rom
so i compiled <a href="https://github.com/envytools/envytools">https://github.com/envytools/envytools</a> 
and ran sudo ./nvagetbios &gt; ~/gforce9300gsm-vbios.rom which is attached and can
also be found here
at <a href="http://cidadecool.com/z-tunes/debian/problem/gforce9300gsm-vbios.rom">http://cidadecool.com/z-tunes/debian/problem/gforce9300gsm-vbios.rom</a>

hope this helps you helping me and thank you for your time.

I hope i did not screw the important/relevant section and here is a partial
copy of the syslog, please use the link if you need the full one.

Syslog Partial copy: 
ec 21 00:43:59 ycradnileved kernel: [ 3818.384770] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x298480a2
Dec 21 00:43:59 ycradnileved kernel: [ 3818.384873] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G98 (NV98)
Dec 21 00:43:59 ycradnileved kernel: [ 3818.384969] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
Dec 21 00:43:59 ycradnileved kernel: [ 3818.387139] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478081] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478178] nouveau  [  
VBIOS][0000:01:00.0] using image from PRAMIN
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478385] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Dec 21 00:43:59 ycradnileved kernel: [ 3818.478479] nouveau  [  
VBIOS][0000:01:00.0] version 62.98.39.00.05
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] INFO: rcu_sched
self-detected stall on CPU { 0}  (t=5250 jiffies g=14778 c=14777 q=144)
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] sending NMI to all CPUs:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] NMI backtrace for cpu 0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RIP:
0010:[&lt;ffffffff812600f9&gt;]  [&lt;ffffffff812600f9&gt;] __const_udelay+0x9/0x30
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RSP: 0018:ffff8800bf803e48 
EFLAGS: 00000046
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RAX: 0000000000000000 RBX:
0000000000002710 RCX: 0000000000000008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RDX: 00000000008a0444 RSI:
0000000000000200 RDI: 0000000000418958
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] RBP: ffffffff818405c0 R08:
0000000000000000 R09: 000000000000043d
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] R10: 0000000000000000 R11:
ffff8800bf803bb6 R12: ffffffff818405c0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] R13: ffff8800bb2a6000 R14:
0000000000000090 R15: ffff8800bf80ed80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Stack:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  ffffffff8103ed6a
ffffffff8189bea0 ffffffff810dbe01 0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  0000000000000001
ffffffff810a3100 ffff8800b90f1c50 ffff8800855e8080
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  0000000000000000
0000000000000000 ffff8800bf80e220 ffff8800bf803f68
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Call Trace:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  &lt;IRQ&gt; 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8103ed6a&gt;] ?
arch_trigger_all_cpu_backtrace+0x5a/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810dbe01&gt;] ?
rcu_check_callbacks+0x321/0x610
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810a3100&gt;] ?
do_timer+0x200/0x640
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810aa4e0&gt;] ?
tick_sched_handle.isra.15+0x60/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810654ab&gt;] ?
update_process_times+0x3b/0x70
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810aa49b&gt;] ?
tick_sched_handle.isra.15+0x1b/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810aa517&gt;] ?
tick_sched_timer+0x37/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8107b194&gt;] ?
__run_hrtimer+0x74/0x1b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8107b939&gt;] ?
hrtimer_interrupt+0xe9/0x220
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8103d386&gt;] ?
smp_apic_timer_interrupt+0x36/0x50
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8148205d&gt;] ?
apic_timer_interrupt+0x6d/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  &lt;EOI&gt; 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa041071a&gt;] ?
init_nv_reg+0x6a/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0410709&gt;] ?
init_nv_reg+0x59/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0415045&gt;] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0415508&gt;] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa041a875&gt;] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0409c72&gt;] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa042d478&gt;] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0409618&gt;] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0409ee0&gt;] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa045e41e&gt;] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0252e4a&gt;] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa0255035&gt;] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa045eab2&gt;] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8127dfe4&gt;] ?
local_pci_probe+0x34/0x60
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8127f202&gt;] ?
pci_device_probe+0x112/0x120
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132f348&gt;] ?
driver_probe_device+0x68/0x220
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132f5bb&gt;] ?
__driver_attach+0x7b/0x80
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132f540&gt;] ?
__device_attach+0x40/0x40
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132d633&gt;] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132ead8&gt;] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8132fb6a&gt;] ?
driver_register+0x6a/0x140
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffffa07a7000&gt;] ?
0xffffffffa07a6fff
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff8100210a&gt;] ?
do_one_initcall+0x10a/0x160
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810b56c2&gt;] ?
load_module+0x1bf2/0x24a0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810b2340&gt;] ?
m_show+0x1c0/0x1c0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff810b6001&gt;] ?
SyS_init_module+0x91/0xc0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006]  [&lt;ffffffff81481469&gt;] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.484006] Code: 00 00 48 ff c8 75 fb
48 ff c8 c3 0f 1f 80 00 00 00 00 48 8b 05 51 87 60 00 ff e0 0f 1f 80 00 00 00
00 65 48 8b 14 25 20 3b 01 00 &lt;48&gt; 8d 0c 12 48 c1 e2 06 48 8d 04 bd 00 00 00 00
48 29 ca f7 e2 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] NMI backtrace for cpu 1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CPU: 1 PID: 0 Comm:
swapper/1 Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] task: ffff8800beeea780 ti:
ffff8800bef0a000 task.ti: ffff8800bef0a000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RIP:
0010:[&lt;ffffffff8103a56e&gt;]  [&lt;ffffffff8103a56e&gt;] mwait_idle_with_hints+0x5e/0x70
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RSP: 0018:ffff8800bef0be30 
EFLAGS: 00000046
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RAX: 0000000000000020 RBX:
ffff8800bee7cc00 RCX: 0000000000000001
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RDX: 0000000000000000 RSI:
0000000000000001 RDI: 0000000000000020
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] RBP: ffff8800bee7ccd4 R08:
ffff8800bef0bfd8 R09: 0000000000000018
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] R10: 0000000000000c01 R11:
0000000000000007 R12: ffffffffa0225090
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] R13: 0000000000000003 R14:
ffff8800b91f5200 R15: ffffffffa02251b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] FS:  0000000000000000(0000)
GS:ffff8800bf880000(0000) knlGS:0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] CR2: 00007fe04b6180c0 CR3:
000000000180c000 CR4: 00000000000007e0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Stack:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffffa0221e40
0000000000000019 ffff8800b91f5200 ffff8800bef0bea0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffffa0225090
0000037df316a58e 0000000000000003 ffffffffa02251b0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  ffffffff81360c7b
0000000000000003 0000000000000003 0000000000000000
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Call Trace:
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffffa0221e40&gt;] ?
acpi_idle_enter_bm+0x1a7/0x1fb [processor]
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffff81360c7b&gt;] ?
cpuidle_enter_state+0x3b/0xc0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffff81360dbb&gt;] ?
cpuidle_idle_call+0xbb/0x1f0
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffff8101aac5&gt;] ?
arch_cpu_idle+0x5/0x30
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffff810a096e&gt;] ?
cpu_startup_entry+0xde/0x280
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055]  [&lt;ffffffff8103b892&gt;] ?
start_secondary+0x1d2/0x230
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] Code: 89 d1 48 2d c8 1f 00
00 0f 01 c8 0f ae f0 65 48 8b 04 25 30 c8 00 00 48 8b 80 38 e0 ff ff a8 08 75
09 48 89 f8 48 89 f1 0f 01 c9 &lt;f3&gt; c3 41 0f ae b8 38 e0 ff ff eb bd 66 0f 1f 44
00 00 65 8b 14 
Dec 21 00:44:20 ycradnileved kernel: [ 3839.488055] INFO: NMI handler
(arch_trigger_all_cpu_backtrace_handler) took too long to run: 3.455 msecs
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] BUG: soft lockup - CPU#0
stuck for 22s! [modprobe:5556]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Modules linked in:
nouveau(+) parport_pc ppdev lp parport rfcomm bnep uinput binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse joydev uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core videodev coretemp media
kvm_intel kvm iTCO_wdt iTCO_vendor_support snd_hda_codec_hdmi lpc_ich
snd_hda_codec_realtek psmouse microcode snd_hda_intel snd_hda_codec snd_hwdep
pcspkr mxm_wmi mfd_core i2c_i801 snd_pcm battery serio_raw evdev wmi
acpi_cpufreq video iwlwifi ac mperf snd_page_alloc button btusb ttm
drm_kms_helper drm i2c_algo_bit i2c_core snd_seq processor snd_seq_device
cfg80211 bluetooth snd_timer snd soundcore rfkill ext4 crc16 mbcache jbd2 sg
ums_realtek usb_storage sr_mod sd_mod cdrom crc_t10dif ahci libahci libata
scsi_mod thermal thermal_sys r8169 mii ehci_pci uhci_hcd ehci_hcd usbcore
usb_common [last unloaded: nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RIP:
0010:[&lt;ffffffffa041044d&gt;]  [&lt;ffffffffa041044d&gt;] init_mask+0x2d/0x290 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RSP: 0018:ffff8800bb2a7870 
EFLAGS: 00000246
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RAX: ffff8800857a7c80 RBX:
000000000000d9d5 RCX: 0000000008000000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RDX: 0000000000000000 RSI:
ffff880037014c00 RDI: ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] RBP: ffff8800bb2a78c8 R08:
000000000000d9f0 R09: 0000000000000020
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] R10: ffff8800857a7c80 R11:
00000000000000f0 R12: ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] R13: ffff8800bb2a78c8 R14:
02c900120149d9d5 R15: 00000000e6f5528a
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Stack:
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800ffffffff
ffff8800bb2a78c8 0000000000000000 ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800bb2a78c8
ffff88009a56c0c0 ffffffffa0415045 ffff8800857a7c80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  ffff8800bb2a78c8
ffffffffa0415508 0000000000000002 ffff88009a56c0c0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Call Trace:
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0415045&gt;] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0415508&gt;] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa041a875&gt;] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0409c72&gt;] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa042d478&gt;] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0409618&gt;] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0409ee0&gt;] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa045e41e&gt;] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0252e4a&gt;] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa0255035&gt;] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa045eab2&gt;] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8127dfe4&gt;] ?
local_pci_probe+0x34/0x60
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8127f202&gt;] ?
pci_device_probe+0x112/0x120
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132f348&gt;] ?
driver_probe_device+0x68/0x220
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132f5bb&gt;] ?
__driver_attach+0x7b/0x80
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132f540&gt;] ?
__device_attach+0x40/0x40
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132d633&gt;] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132ead8&gt;] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8132fb6a&gt;] ?
driver_register+0x6a/0x140
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffffa07a7000&gt;] ?
0xffffffffa07a6fff
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff8100210a&gt;] ?
do_one_initcall+0x10a/0x160
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff810b56c2&gt;] ?
load_module+0x1bf2/0x24a0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff810b2340&gt;] ?
m_show+0x1c0/0x1c0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff810b6001&gt;] ?
SyS_init_module+0x91/0xc0
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006]  [&lt;ffffffff81481469&gt;] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:44:45 ycradnileved kernel: [ 3864.072006] Code: 41 55 41 89 cd 41 54
41 89 d4 55 48 89 fd 53 89 f3 83 e3 fc 48 83 ec 08 48 8b 7f 08 48 8b 47 10 48
85 c0 48 0f 44 c7 48 8b 70 08 &lt;48&gt; 85 f6 48 0f 44 f0 0f b6 45 24 83 be e0 00 00
00 4f 76 14 85 
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] BUG: soft lockup - CPU#0
stuck for 22s! [modprobe:5556]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Modules linked in:
nouveau(+) parport_pc ppdev lp parport rfcomm bnep uinput binfmt_misc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc fuse joydev uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core videodev coretemp media
kvm_intel kvm iTCO_wdt iTCO_vendor_support snd_hda_codec_hdmi lpc_ich
snd_hda_codec_realtek psmouse microcode snd_hda_intel snd_hda_codec snd_hwdep
pcspkr mxm_wmi mfd_core i2c_i801 snd_pcm battery serio_raw evdev wmi
acpi_cpufreq video iwlwifi ac mperf snd_page_alloc button btusb ttm
drm_kms_helper drm i2c_algo_bit i2c_core snd_seq processor snd_seq_device
cfg80211 bluetooth snd_timer snd soundcore rfkill ext4 crc16 mbcache jbd2 sg
ums_realtek usb_storage sr_mod sd_mod cdrom crc_t10dif ahci libahci libata
scsi_mod thermal thermal_sys r8169 mii ehci_pci uhci_hcd ehci_hcd usbcore
usb_common [last unloaded: nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CPU: 0 PID: 5556 Comm:
modprobe Not tainted 3.11-2-amd64 #1 Debian 3.11.10-1
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Hardware name: LG
Electronics R510/QL8, BIOS QL8L3B42 07/30/2008
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] task: ffff8800855e8080 ti:
ffff8800bb2a6000 task.ti: ffff8800bb2a6000
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RIP:
0010:[&lt;ffffffffa040a7ce&gt;]  [&lt;ffffffffa040a7ce&gt;] nv_printk_+0x13e/0x1c0
[nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RSP: 0018:ffff8800bb2a7838 
EFLAGS: 00000282
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RAX: 0000000000000000 RBX:
ffffffffa049cd02 RCX: ffffffffa049c8d1
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RDX: 0000000000000005 RSI:
ffffffffa049caf4 RDI: ffff8800857a7c80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] RBP: ffff8800bb2a7858 R08:
000000000000d9e3 R09: 0000000000000020
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] R10: ffff8800857a7c80 R11:
00000000000000f0 R12: ffff8800bb2a7806
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] R13: ffff8800857a7c80 R14:
ffffffffa040cd4b R15: 0000000000000018
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] FS:  00007f29516aa700(0000)
GS:ffff8800bf800000(0000) knlGS:0000000000000000
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CS:  0010 DS: 0000 ES: 0000
CR0: 000000008005003b
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] CR2: 0000000000f922e0 CR3:
00000000bb633000 CR4: 00000000000007f0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Stack:
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  ffff8800bb2a78c8
000000000000e820 00000000ffffffff ffff88009a56c0c0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  0000000080000000
ffffffffa0410750 ffff88000000e820 ffff8800ffffffff
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  ffff880080000000
ffff8800bb2a78c8 0000000000000000 ffff8800857a7c80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Call Trace:
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0410750&gt;] ?
init_nv_reg+0xa0/0xe0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0415045&gt;] ?
nvbios_exec+0x35/0xd0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0415508&gt;] ?
nvbios_init+0x98/0x150 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa041a875&gt;] ?
nv50_devinit_init+0x45/0x190 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0409c72&gt;] ?
nouveau_object_inc+0xb2/0x1a0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa042d478&gt;] ?
nouveau_devobj_ctor+0x1d8/0x6a0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0409618&gt;] ?
nouveau_object_ctor+0x28/0xe0 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0409ee0&gt;] ?
nouveau_object_new+0x180/0x240 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa045e41e&gt;] ?
nouveau_drm_load+0x15e/0x600 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0252e4a&gt;] ?
drm_get_minor+0x1ca/0x260 [drm]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa0255035&gt;] ?
drm_get_pci_dev+0x155/0x270 [drm]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa045eab2&gt;] ?
nouveau_drm_probe+0x1f2/0x280 [nouveau]
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8127dfe4&gt;] ?
local_pci_probe+0x34/0x60
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8127f202&gt;] ?
pci_device_probe+0x112/0x120
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132f348&gt;] ?
driver_probe_device+0x68/0x220
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132f5bb&gt;] ?
__driver_attach+0x7b/0x80
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132f540&gt;] ?
__device_attach+0x40/0x40
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132d633&gt;] ?
bus_for_each_dev+0x53/0x90
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132ead8&gt;] ?
bus_add_driver+0x1d8/0x270
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8132fb6a&gt;] ?
driver_register+0x6a/0x140
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffffa07a7000&gt;] ?
0xffffffffa07a6fff
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff8100210a&gt;] ?
do_one_initcall+0x10a/0x160
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff810b56c2&gt;] ?
load_module+0x1bf2/0x24a0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff810b2340&gt;] ?
m_show+0x1c0/0x1c0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff810b6001&gt;] ?
SyS_init_module+0x91/0xc0
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006]  [&lt;ffffffff81481469&gt;] ?
system_call_fastpath+0x16/0x1b
Dec 21 00:45:13 ycradnileved kernel: [ 3892.072006] Code: 8d 84 24 78 01 00 00
48 89 44 24 28 e8 dc 4d c9 e0 48 8b 84 24 70 01 00 00 65 48 33 04 25 28 00 00
00 75 7f 48 81 c4 a8 01 00 00 &lt;5b&gt; 41 5c 41 5d 41 5e 5d c3 66 0f 1f 84 00 00 00
00 00 44 3b a7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387596495.71Afd31.5623--

--===============2080603341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2080603341==--
