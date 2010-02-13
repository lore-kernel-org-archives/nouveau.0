From: "Shinpei KATO" <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Subject: Bugs in nouveau_channel_alloc()
Date: Sat, 13 Feb 2010 09:15:20 +0900
Message-ID: <001e01caac41$a3ea3f50$ebbebdf0$@is.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_001F_01CAAC8D.13D1E750"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: ja
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

This is a multi-part message in MIME format.

------=_NextPart_000_001F_01CAAC8D.13D1E750
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I have just started using Nouveau, with Fedora 12.
I downloaded the source from the Nouveau kernel repository, and built it by
following the instructions in the Nouveau Wiki page.
The new Linux kernel with Nouveau seems to work without any problems, but I
found some error messages in the kernel log.
The attached file contains the kernel messages related to the Nouveau DRM,
which I copied and pasted from the original kernel log.

To my understanding, two errors occured when the nouveau_channel_alloc()
function is called.
In particular, the first one occured when modprobe is done, and the second
one did when Xorg is launched.
I am not sure if these errors are actually "BUGs" or not.
Wish someone gives me some advice for them.

I am using the GeForce 9500 GT card installed on the DELL T5500 machine
(X86-64 eight-core).
Please tell me if I need to give more information to get answers.

Best regards,
- Shinpei

------=_NextPart_000_001F_01CAAC8D.13D1E750
Content-Type: application/octet-stream;
	name="messages"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="messages"

Feb 12 18:19:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
nouveau_channel_free: freeing fifo 2=0A=
.=0A=
.=0A=
.=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] Initialized drm 1.1.0 =
20060810=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: nouveau 0000:03:00.0: PCI INT A -> =
GSI 24 (level, low) -> IRQ 24=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected an NV50 generation card (0x096000c1)=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Attempting to load BIOS image from PRAMIN=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: ... =
appears to be valid=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: BIT =
BIOS found=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Bios =
version 62.94.29.00=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: TMDS =
table revision 2.0 not currently supported=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Found =
Display Configuration Block version 4.0=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: DCB =
connector table: VHER 0x40 5 16 4=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0:   0: =
0x00001030: type 0x30 idx 0 tag 0x07=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0:   1: =
0x00002130: type 0x30 idx 1 tag 0x08=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0:   2: =
0x00000210: type 0x10 idx 2 tag 0xff=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0:   3: =
0x00000211: type 0x11 idx 2 tag 0xff=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0:   4: =
0x00000213: type 0x13 idx 2 tag 0xff=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Raw =
DCB entry 0: 02000300 00000028=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Raw =
DCB entry 1: 01000302 00020030=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Raw =
DCB entry 2: 04011310 00000028=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: Raw =
DCB entry 3: 010223f1 00c0c080=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 0 at offset 0xD0BE=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 1 at offset 0xD4D3=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 2 at offset 0xE4C4=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 3 at offset 0xE60D=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 4 at offset 0xE849=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table at offset 0xE8AE=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xE8AE: Condition still not met after 20ms, skipping following opcodes=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xC090: parsing output script 0=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xAB1C: parsing output script 0=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [TTM] Zone  kernel: Available =
graphics memory: 2026660 kiB.=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: 1024 =
MiB VRAM=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: 512 =
MiB GART (aperture)=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: nouveau 0000:03:00.0: firmware: =
requesting nouveau/nv96.ctxprog=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: nouveau 0000:03:00.0: firmware: =
requesting nouveau/nv96.ctxvals=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Allocating FIFO number 1=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: BUG: sleeping function called from =
invalid context at mm/slub.c:1719=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: in_atomic(): 0, irqs_disabled(): =
1, pid: 152, name: modprobe=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: Pid: 152, comm: modprobe Not =
tainted 2.6.32 #1=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: Call Trace:=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff81045bfb>] =
__might_sleep+0xed/0xef=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff811092a4>] =
__kmalloc+0xb3/0x15e=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00766e1>] ? =
kzalloc.clone.0+0x13/0x15 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00766e1>] =
kzalloc.clone.0+0x13/0x15 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa0076784>] =
nouveau_gpuobj_new+0xa1/0x2f6 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00775a5>] =
nouveau_gpuobj_new_ref+0x3d/0x7e [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa0095f6a>] =
nv50_graph_create_context+0x93/0x1f2 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa008d4f7>] ? =
nv_wr32+0x1d/0x1f [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa0074719>] =
nouveau_channel_alloc+0x481/0x54d [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00738d0>] =
nouveau_card_init+0xbb2/0xdb8 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa0073ede>] =
nouveau_load+0x3f8/0x406 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa001dbbc>] =
drm_get_dev+0x378/0x479 [drm]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00a7ab4>] =
nouveau_pci_probe+0x15/0x17 [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff81237035>] =
local_pci_probe+0x17/0x1b=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff81237dfb>] =
pci_device_probe+0xcd/0xfd=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3b73>] ? =
driver_sysfs_add+0x4c/0x71=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3d33>] =
driver_probe_device+0xdb/0x1fb=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3eb0>] =
__driver_attach+0x5d/0x81=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3e53>] ? =
__driver_attach+0x0/0x81=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3202>] =
bus_for_each_dev+0x53/0x88=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d3ad2>] =
driver_attach+0x1e/0x20=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d372d>] =
bus_add_driver+0xd5/0x23c=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff812d419c>] =
driver_register+0x9d/0x10e=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff81238027>] =
__pci_register_driver+0x58/0xc8=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00c6000>] ? =
nouveau_init+0x0/0x4d [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa0018c46>] =
drm_init+0x75/0xdb [drm]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00c6000>] ? =
nouveau_init+0x0/0x4d [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffffa00c604b>] =
nouveau_init+0x4b/0x4d [nouveau]=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff8100a069>] =
do_one_initcall+0x5e/0x159=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff8108d360>] =
sys_init_module+0xd6/0x236=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [<ffffffff81011cb2>] =
system_call_fastpath+0x16/0x1b=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
nouveau_channel_alloc: initialised FIFO 1=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected a DAC output=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected a TMDS output=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected a DAC output=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: DCB =
encoder 1 unknown=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected a DVI-I connector=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Detected a VGA connector=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
allocated 1280x1024 fb: 0x40250000, bo ffff88012966ba00=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] TMDS-8: set mode 1280x1024 1b=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xC0AE: parsing output script 1=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xC0AF: parsing output script 2=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xBD9A: parsing clock script 0=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
0xB6D6: parsing clock script 1=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: Console: switching to colour frame =
buffer device 160x64=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: fb0: nouveaufb frame buffer device=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: registered panic notifier=0A=
Feb 12 18:20:25 shinpei-t5500 kernel: [drm] Initialized nouveau 0.0.15 =
9dc649a4fa246bfc1 for 0000:03:00.0 on minor 0=0A=
.=0A=
.=0A=
.=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
Allocating FIFO number 2=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: BUG: sleeping function called from =
invalid context at mm/slub.c:1719=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: in_atomic(): 0, irqs_disabled(): =
1, pid: 1450, name: Xorg=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: Pid: 1450, comm: Xorg Not tainted =
2.6.32 #1=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: Call Trace:=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff81045bfb>] =
__might_sleep+0xed/0xef=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff811092a4>] =
__kmalloc+0xb3/0x15e=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa00766e1>] ? =
kzalloc.clone.0+0x13/0x15 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa00766e1>] =
kzalloc.clone.0+0x13/0x15 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa0076784>] =
nouveau_gpuobj_new+0xa1/0x2f6 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa00775a5>] =
nouveau_gpuobj_new_ref+0x3d/0x7e [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa0095f6a>] =
nv50_graph_create_context+0x93/0x1f2 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa008d4f7>] ? =
nv_wr32+0x1d/0x1f [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa0074719>] =
nouveau_channel_alloc+0x481/0x54d [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa007485b>] =
nouveau_ioctl_fifo_alloc+0x76/0xf3 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa0019218>] =
drm_ioctl+0x26d/0x335 [drm]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffffa00747e5>] ? =
nouveau_ioctl_fifo_alloc+0x0/0xf3 [nouveau]=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff810dbb50>] ? =
page_evictable+0x17/0x81=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff810daa21>] ? =
lru_cache_add_lru+0x27/0x29=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff810f4e55>] ? =
page_add_new_anon_rmap+0x3f/0x4e=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff81123c00>] =
vfs_ioctl+0x22/0x87=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff8112415c>] =
do_vfs_ioctl+0x47b/0x4c1=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff811241f8>] =
sys_ioctl+0x56/0x79=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [<ffffffff81011cb2>] =
system_call_fastpath+0x16/0x1b=0A=
Feb 12 18:20:28 shinpei-t5500 kernel: [drm] nouveau 0000:03:00.0: =
nouveau_channel_alloc: initialised FIFO 2=0A=

------=_NextPart_000_001F_01CAAC8D.13D1E750
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_NextPart_000_001F_01CAAC8D.13D1E750--
