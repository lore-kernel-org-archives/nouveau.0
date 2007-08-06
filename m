From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11868] New: Starting X for the second time fails
	(without reloading drm modules)
Date: Mon,  6 Aug 2007 12:36:19 -0700 (PDT)
Message-ID: <bug-11868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11868

           Summary: Starting X for the second time fails (without reloading
                    drm modules)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hardware is a PCI-E NV43.

This problem is recent, i'm fairly confident it's caused by this commit or the
related commits in the drm (i used a slightly older version without problems):

http://gitweb.freedesktop.org/?p=nouveau/xf86-video-nouveau.git;a=commit;h=c7b16f6fff96ffcff8049feed2a0a9ef6de4209f

The system freezes up, but i can still use the magic sysrq keys.

I have gathered the information i can.

Snippet of Xorg.0.log (last entries):

(II) NOUVEAU(0): [drm] DRM interface version 1.3
(II) NOUVEAU(0): [drm] created "nouveau" driver at busid "pci:0000:01:00.0"
(II) NOUVEAU(0): [drm] added 8192 byte SAREA at 0x1efff000
(II) NOUVEAU(0): [drm] mapped SAREA 0x1efff000 to 0x2b0109043000
(II) NOUVEAU(0): [drm] framebuffer handle = 0xc0000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel

Snippet of kernel log (first is a succesfull attempt, the second fails):

Aug  6 21:11:29 localhost [drm:drm_init] 
Aug  6 21:11:29 localhost PCI: Unable to reserve mem region #2:8000000@c0000000
for device 0000:01:00.0
Aug  6 21:11:29 localhost [drm:drm_get_dev] 
Aug  6 21:11:29 localhost PCI: Setting latency timer of device 0000:01:00.0 to
64
Aug  6 21:11:29 localhost [drm:drm_get_head] 
Aug  6 21:11:29 localhost [drm:drm_get_head] new minor assigned 0
Aug  6 21:11:29 localhost [drm] Initialized nouveau 0.0.10 20060213 on minor 0
Aug  6 21:11:29 localhost [drm] Used old pci detect: framebuffer loaded
Aug  6 21:11:46 localhost [drm:drm_stub_open] 
Aug  6 21:11:46 localhost [drm:drm_open_helper] pid = 6567, minor = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:46 localhost [drm:drm_setup] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:46 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:46 localhost [drm:drm_release] pid = 6567, device = 0xe200,
open_count = 1
Aug  6 21:11:46 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:46 localhost [drm:drm_lastclose] 
Aug  6 21:11:46 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:46 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:46 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:46 localhost [drm:drm_stub_open] 
Aug  6 21:11:46 localhost [drm:drm_open_helper] pid = 6567, minor = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:46 localhost [drm:drm_setup] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:46 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:46 localhost [drm:drm_release] pid = 6567, device = 0xe200,
open_count = 1
Aug  6 21:11:46 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:46 localhost [drm:drm_lastclose] 
Aug  6 21:11:46 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:46 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:46 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:46 localhost [drm:drm_stub_open] 
Aug  6 21:11:46 localhost [drm:drm_open_helper] pid = 6567, minor = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:46 localhost [drm:drm_setup] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:46 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:46 localhost [drm:drm_release] pid = 6567, device = 0xe200,
open_count = 1
Aug  6 21:11:46 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:46 localhost [drm:drm_lastclose] 
Aug  6 21:11:46 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:46 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:46 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:46 localhost [drm:drm_stub_open] 
Aug  6 21:11:46 localhost [drm:drm_open_helper] pid = 6567, minor = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:46 localhost [drm:drm_setup] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:46 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:46 localhost [drm:drm_release] pid = 6567, device = 0xe200,
open_count = 1
Aug  6 21:11:46 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:46 localhost [drm:drm_lastclose] 
Aug  6 21:11:46 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:46 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:46 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:46 localhost [drm:drm_stub_open] 
Aug  6 21:11:46 localhost [drm:drm_open_helper] pid = 6567, minor = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:46 localhost [drm:drm_setup] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0286415,
nr=0x15, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf46288000, end =
0x2adf4628a000, page offset = 0x1efff
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf46288000,0x00002000
Aug  6 21:11:46 localhost [drm:drm_do_vm_shm_nopage] shm_nopage 0x2adf46288000
Aug  6 21:11:46 localhost [drm:drm_do_vm_shm_nopage] shm_nopage 0x2adf46289000
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0286415,
nr=0x15, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc0000000, size =
0x04000000, type = 0
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106426,
nr=0x26, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106426,
nr=0x26, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x6440,
nr=0x40, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_card_init] prev state = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc8000000, size =
0x04000000, type = 1
Aug  6 21:11:46 localhost [drm:nouveau_init_card_mappings] regs mapped ok at
0xc8000000
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xcc000000, size =
0x01000000, type = 1
Aug  6 21:11:46 localhost [drm:drm_irq_install] drm_irq_install: irq=18
Aug  6 21:11:46 localhost [drm:nouveau_irq_preinstall] IRQ: preinst
Aug  6 21:11:46 localhost [drm:nouveau_irq_postinstall] IRQ: postinst
Aug  6 21:11:46 localhost [drm:nv04_instmem_determine_amount] RAMIN size:
1024KiB
Aug  6 21:11:46 localhost [drm:nv04_instmem_configure_fixed_tables] RAMHT
offset=0x10000, size=512
Aug  6 21:11:46 localhost [drm:nv04_instmem_configure_fixed_tables] RAMRO
offset=0x11200, size=512
Aug  6 21:11:46 localhost [drm:nv04_instmem_configure_fixed_tables] RAMFC
offset=0x20000, size=4096
Aug  6 21:11:46 localhost [drm:nouveau_mem_init] Available VRAM: 130048KiB
Aug  6 21:11:46 localhost [drm:nouveau_mem_init] Allocating sg memory for PCI
DMA
Aug  6 21:11:46 localhost [drm:drm_sg_alloc] drm_sg_alloc
Aug  6 21:11:46 localhost [drm:drm_sg_alloc] sg size=16777216 pages=4096
Aug  6 21:11:46 localhost [drm:drm_sg_alloc] sg alloc handle  = 15f7d200
Aug  6 21:11:46 localhost [drm:drm_sg_alloc] sg alloc virtual =
ffffc20015f81000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] offset=0x00010000
size=0x00000200 flags=0x00000003
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] gpuobj ffff81003a5a19c0
Aug  6 21:11:46 localhost [drm:nv40_graph_init] Loading context-switch voodoo
Aug  6 21:11:46 localhost [drm:nouveau_fifo_init] Setting defaults for
remaining PFIFO regs
Aug  6 21:11:46 localhost [drm:nouveau_dma_channel_init] 
Aug  6 21:11:46 localhost [drm] Allocating FIFO number 0
Aug  6 21:11:46 localhost [drm:nouveau_notifier_init_channel] Allocating
notifier block in 272
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00001000, type = 4
Aug  6 21:11:46 localhost [drm] allocated 0x0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_channel_init] ch0 vram=0x8003d001
tt=0x8003d002
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81003a5a19c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x7f00000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81003a5a1dc0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x8003d001
gpuobj=ffff81003a5a1dc0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fc8
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000fc8:
h=0x8003d001, c=0x00002100
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x1000000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=8
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=16396 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f70c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x0, size 16777216
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x8003d002
gpuobj=ffff81002f6f70c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fd0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000fd0:
h=0x8003d002, c=0x00002102
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc0000000, size =
0x00008000, type = 0
Aug  6 21:11:46 localhost [drm:drm_addmap_core] Matching maps of type 0 with
mismatched sizes, (32768 vs 67108864)
Aug  6 21:11:46 localhost [drm] allocated 0x0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x8000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=1 target=0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7840
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x00000000
gpuobj=ffff81002f6f7840
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=71680 align=16
flags=0x00000002
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f73c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f73c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] offset=0x00020000
size=0x00000080 flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] gpuobj ffff81002f6f74c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f74c0
Aug  6 21:11:46 localhost [drm] nouveau_fifo_alloc: initialised FIFO 0
Aug  6 21:11:46 localhost [drm:nouveau_dma_channel_init] Using FIFO channel 0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x20
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=8
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=16 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7140
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x0, size 32
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x8003d003
gpuobj=ffff81002f6f7140
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fd8
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000fd8:
h=0x8003d003, c=0x00003685
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch0 class=0x0039
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch0 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f72c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x80039001
gpuobj=ffff81002f6f72c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000ec8
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000ec8:
h=0x80039001, c=0x00103686
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0206448,
nr=0x48, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc0008000, size =
0x04000000, type = 0
Aug  6 21:11:46 localhost [drm] allocated 0x8000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf47713000, end =
0x2adf4b713000, page offset = 0xc0008
Aug  6 21:11:46 localhost [drm:drm_mmap_locked]    Type = 0; start =
0x2adf47713000, end = 0x2adf4b713000, offset = 0xc0008000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf47713000,0x04000000
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106441,
nr=0x41, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106441,
nr=0x41, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106441,
nr=0x41, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106441,
nr=0x41, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106441,
nr=0x41, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0206448,
nr=0x48, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x00001000, size =
0x003c0000, type = 4
Aug  6 21:11:46 localhost [drm] allocated 0x1000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4b713000, end =
0x2adf4bad3000, page offset = 0x2effe
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4b713000,0x003c0000
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0206448,
nr=0x48, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc4008000, size =
0x00010000, type = 0
Aug  6 21:11:46 localhost [drm] allocated 0x4008000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4bad3000, end =
0x2adf4bae3000, page offset = 0xc4008
Aug  6 21:11:46 localhost [drm:drm_mmap_locked]    Type = 0; start =
0x2adf4bad3000, end = 0x2adf4bae3000, offset = 0xc4008000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bad3000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0206448,
nr=0x48, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc4018000, size =
0x00004000, type = 0
Aug  6 21:11:46 localhost [drm] allocated 0x4018000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4bae3000, end =
0x2adf4bae7000, page offset = 0xc4018
Aug  6 21:11:46 localhost [drm:drm_mmap_locked]    Type = 0; start =
0x2adf4bae3000, end = 0x2adf4bae7000, offset = 0xc4018000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bae3000,0x00004000
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106442,
nr=0x42, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0286443,
nr=0x43, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm] Allocating FIFO number 1
Aug  6 21:11:46 localhost [drm:nouveau_notifier_init_channel] Allocating
notifier block in 272
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x003c1000, size =
0x00001000, type = 4
Aug  6 21:11:46 localhost [drm] allocated 0x3c1000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_channel_init] ch1 vram=0xd8000001
tt=0xd8000002
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81003a5a19c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch1 class=0x003d
offset=0x0 size=0x7f00000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7340
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0xd8000001
gpuobj=ffff81002f6f7340
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001d0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x000001d0:
h=0xd8000001, c=0x00803688
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch1 class=0x003d
offset=0x0 size=0x1000000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=8
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=16396 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7440
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x0, size 16777216
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0xd8000002
gpuobj=ffff81002f6f7440
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001c8
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x000001c8:
h=0xd8000002, c=0x0080368a
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0x003c2000, size =
0x00008000, type = 4
Aug  6 21:11:46 localhost [drm] allocated 0x3c2000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch1 class=0x003d
offset=0x3c2000 size=0x8000
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=1 target=8
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=44 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f71c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x3c2000, size 32768
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x00000000
gpuobj=ffff81002f6f71c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=71680 align=16
flags=0x00000002
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f75c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f75c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] offset=0x00020080
size=0x00000080 flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new_fake] gpuobj ffff81002f6f76c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f76c0
Aug  6 21:11:46 localhost [drm] nouveau_fifo_alloc: initialised FIFO 1
Aug  6 21:11:46 localhost [drm:drm_addmap_core] offset = 0xc8810000, size =
0x00010000, type = 1
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4bae7000, end =
0x2adf4baef000, page offset = 0x1f000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bae7000,0x00008000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4baef000, end =
0x2adf4baff000, page offset = 0xc8810
Aug  6 21:11:46 localhost [drm:drm_mmap_locked]    Type = 1; start =
0x2adf4baef000, end = 0x2adf4baff000, offset = 0xc8810000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4baef000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_mmap_locked] start = 0x2adf4baff000, end =
0x2adf4bb00000, page offset = 0x2efff
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4baff000,0x00001000
Aug  6 21:11:46 localhost [drm:drm_do_vm_sg_nopage] 
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0030
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a03c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x00000000
gpuobj=ffff8100235a03c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000100
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000100:
h=0x00000000, c=0x00904c0e
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106446,
nr=0x46, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] ch1 class=0x003d
offset=0x3c1000 size=0x20
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=8
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=16 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0a40
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x3c1000, size 32
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0xd8000003
gpuobj=ffff8100235a0a40
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x000001c0:
h=0xd8000003, c=0x00804c10
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0062
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0f40
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000010
gpuobj=ffff8100235a0f40
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000100
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000100:
h=0x00000000
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000108:
h=0x80000010, c=0x00904c11
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0044
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a07c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000012
gpuobj=ffff8100235a07c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000110
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000110:
h=0x80000012, c=0x00904c13
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0043
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a04c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000011
gpuobj=ffff8100235a04c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000108
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000108:
h=0x80000010
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000110:
h=0x80000012
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000118:
h=0x80000011, c=0x00904c15
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x004a
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a06c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000016
gpuobj=ffff8100235a06c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000130
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000130:
h=0x80000016, c=0x00904c17
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x009f
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a05c0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000015
gpuobj=ffff8100235a05c0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000128
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000128:
h=0x80000015, c=0x00904c19
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x3089
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0940
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000017
gpuobj=ffff8100235a0940
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000138
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000138:
h=0x80000017, c=0x00904c1b
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0019
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0640
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000013
gpuobj=ffff8100235a0640
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000118
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000118:
h=0x80000011
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000120:
h=0x80000013, c=0x00904c1d
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x005c
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0dc0
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000014
gpuobj=ffff8100235a0dc0
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000120
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000120:
h=0x80000013
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000128:
h=0x80000015
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000130:
h=0x80000016
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000138:
h=0x80000017
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000140:
h=0x80000014, c=0x00904c1f
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x0039
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0740
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000018
gpuobj=ffff8100235a0740
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000140
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000140:
h=0x80000014
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000148:
h=0x80000018, c=0x00904c21
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x400c6445,
nr=0x45, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_gr_new] ch1 class=0x4097
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] ch1 size=32 align=16
flags=0x00000006
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] gpuobj ffff8100235a0e40
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:46 localhost [drm:nouveau_gpuobj_ref_add] ch1 h=0x80000019
gpuobj=ffff8100235a0e40
Aug  6 21:11:46 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000148
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] collision ch1 0x00000148:
h=0x80000018
Aug  6 21:11:46 localhost [drm:nouveau_ramht_insert] insert ch1 0x00000150:
h=0x80000019, c=0x00904c23
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0086420,
nr=0x20, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_addctx] 1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x40086422,
nr=0x22, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0x4008642a,
nr=0x2a, dev 0xe200, auth=1
Aug  6 21:11:46 localhost [drm:drm_lock] 1 (pid 6567) requests lock
(0x00000000), flags = 0x00000000
Aug  6 21:11:46 localhost [drm:drm_lock] 1 has lock
Aug  6 21:11:46 localhost [drm:drm_fasync] fd = 6, device = 0xe200
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf46288000,0x00002000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf47713000,0x04000000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4b713000,0x003c0000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bad3000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bae3000,0x00004000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4bae7000,0x00008000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4baef000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_vm_open_locked] 0x2adf4baff000,0x00001000
Aug  6 21:11:46 localhost [drm:drm_vm_shm_close] 0x2adf46288000,0x00002000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf47713000,0x04000000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4b713000,0x003c0000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4bad3000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4bae3000,0x00004000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4bae7000,0x00008000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4baef000,0x00010000
Aug  6 21:11:46 localhost [drm:drm_vm_close] 0x2adf4baff000,0x00001000
Aug  6 21:11:49 localhost [drm:drm_do_vm_sg_nopage] 
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf46288000,0x00002000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf47713000,0x04000000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4b713000,0x003c0000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4bad3000,0x00010000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4bae3000,0x00004000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4bae7000,0x00008000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4baef000,0x00010000
Aug  6 21:11:49 localhost [drm:drm_vm_open_locked] 0x2adf4baff000,0x00001000
Aug  6 21:11:49 localhost [drm:drm_vm_shm_close] 0x2adf46288000,0x00002000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf47713000,0x04000000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4b713000,0x003c0000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4bad3000,0x00010000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4bae3000,0x00004000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4bae7000,0x00008000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4baef000,0x00010000
Aug  6 21:11:49 localhost [drm:drm_vm_close] 0x2adf4baff000,0x00001000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf47713000,0x04000000
Aug  6 21:11:53 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106449,
nr=0x49, dev 0xe200, auth=1
Aug  6 21:11:53 localhost [drm] freeing 0x8000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4bae3000,0x00004000
Aug  6 21:11:53 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106449,
nr=0x49, dev 0xe200, auth=1
Aug  6 21:11:53 localhost [drm] freeing 0x4018000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4bad3000,0x00010000
Aug  6 21:11:53 localhost [drm:drm_unlocked_ioctl] pid=6567, cmd=0xc0106449,
nr=0x49, dev 0xe200, auth=1
Aug  6 21:11:53 localhost [drm] freeing 0x4008000
Aug  6 21:11:53 localhost [drm:drm_vm_shm_close] 0x2adf46288000,0x00002000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4b713000,0x003c0000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4bae7000,0x00008000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4baef000,0x00010000
Aug  6 21:11:53 localhost [drm:drm_vm_close] 0x2adf4baff000,0x00001000
Aug  6 21:11:53 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:53 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:53 localhost [drm] nouveau_fifo_free: freeing fifo 1
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7180
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f76c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7200
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f75c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd72c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f71c0
Aug  6 21:11:53 localhost [drm] freeing 0x3c2000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_channel_takedown] ch1
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd74c0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001d0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x000001d0:
h=0xd8000001, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f7340
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7440
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001c8
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x000001c8:
h=0xd8000002, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f7440
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9ff00
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000100
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000100:
h=0x00000000, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a03c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fe40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x000001c0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x000001c0:
h=0xd8000003, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0a40
Aug  6 21:11:53 localhost [drm:nouveau_notifier_gpuobj_dtor] 
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fdc0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000100
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000108:
h=0x80000010, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0f40
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fd40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000110
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000110:
h=0x80000012, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a07c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fcc0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000108
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000118:
h=0x80000011, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a04c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fc40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000130
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000130:
h=0x80000016, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a06c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fbc0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000128
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000128:
h=0x80000015, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a05c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fb40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000138
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000138:
h=0x80000017, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0940
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fac0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000118
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000120:
h=0x80000013, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0640
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9fa40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000120
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000140:
h=0x80000014, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0dc0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9f9c0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000140
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000148:
h=0x80000018, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0740
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810035e9f940
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch1 handle=0x00000000
hash=0x00000148
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch1 0x00000150:
h=0x80000019, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff8100235a0e40
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7540
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj 0000000000000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref 0000000000000000
Aug  6 21:11:53 localhost [drm] freeing 0x3c1000
Aug  6 21:11:53 localhost [drm:drm_release] pid = 6567, device = 0xe200,
open_count = 1
Aug  6 21:11:53 localhost [drm:drm_release] File ffff81003e496b40 released,
freeing lock for context 1
Aug  6 21:11:53 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:53 localhost [drm:drm_lastclose] 
Aug  6 21:11:53 localhost [drm:nouveau_card_takedown] prev state = 1
Aug  6 21:11:53 localhost [drm:nouveau_dma_channel_takedown] 
Aug  6 21:11:53 localhost [drm] nouveau_fifo_free: freeing fifo 0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7b40
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f74c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7bc0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f73c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7c40
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f7840
Aug  6 21:11:53 localhost [drm] freeing 0x0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_channel_takedown] ch0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7dc0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fc8
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch0 0x00000fc8:
h=0x8003d001, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81003a5a1dc0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7d40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fd0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch0 0x00000fd0:
h=0x8003d002, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f70c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7a40
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fd8
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch0 0x00000fd8:
h=0x8003d003, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f7140
Aug  6 21:11:53 localhost [drm:nouveau_notifier_gpuobj_dtor] 
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd79c0
Aug  6 21:11:53 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000ec8
Aug  6 21:11:53 localhost [drm:nouveau_ramht_remove] remove ch0 0x00000ec8:
h=0x80039001, c=0x00000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81002f6f72c0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref ffff810036bd7e40
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj 0000000000000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_ref_del] ref 0000000000000000
Aug  6 21:11:53 localhost [drm] freeing 0x0
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj 0000000000000000
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_takedown] 
Aug  6 21:11:53 localhost [drm:nouveau_gpuobj_del] gpuobj ffff81003a5a19c0
Aug  6 21:11:53 localhost [drm:drm_irq_uninstall] drm_irq_uninstall: irq=18
Aug  6 21:11:53 localhost [drm:nouveau_irq_uninstall] IRQ: uninst
Aug  6 21:11:53 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:53 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:55 localhost [drm:drm_stub_open] 
Aug  6 21:11:55 localhost [drm:drm_open_helper] pid = 6605, minor = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:55 localhost [drm:drm_setup] 
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:55 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:55 localhost [drm:drm_release] pid = 6605, device = 0xe200,
open_count = 1
Aug  6 21:11:55 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:55 localhost [drm:drm_lastclose] 
Aug  6 21:11:55 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:55 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:55 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:55 localhost [drm:drm_stub_open] 
Aug  6 21:11:55 localhost [drm:drm_open_helper] pid = 6605, minor = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:55 localhost [drm:drm_setup] 
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:55 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:55 localhost [drm:drm_release] pid = 6605, device = 0xe200,
open_count = 1
Aug  6 21:11:55 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:55 localhost [drm:drm_lastclose] 
Aug  6 21:11:55 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:55 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:55 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:55 localhost [drm:drm_stub_open] 
Aug  6 21:11:55 localhost [drm:drm_open_helper] pid = 6605, minor = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:55 localhost [drm:drm_setup] 
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:55 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:55 localhost [drm:drm_release] pid = 6605, device = 0xe200,
open_count = 1
Aug  6 21:11:55 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:55 localhost [drm:drm_lastclose] 
Aug  6 21:11:55 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:55 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:55 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:55 localhost [drm:drm_stub_open] 
Aug  6 21:11:55 localhost [drm:drm_open_helper] pid = 6605, minor = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:55 localhost [drm:drm_setup] 
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0406400,
nr=0x00, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:55 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:55 localhost [drm:drm_release] pid = 6605, device = 0xe200,
open_count = 1
Aug  6 21:11:55 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:55 localhost [drm:drm_lastclose] 
Aug  6 21:11:55 localhost [drm:nouveau_card_takedown] prev state = 0
Aug  6 21:11:55 localhost [drm:drm_lastclose] driver lastclose completed
Aug  6 21:11:55 localhost [drm:drm_lastclose] lastclose completed
Aug  6 21:11:55 localhost [drm:drm_stub_open] 
Aug  6 21:11:55 localhost [drm:drm_open_helper] pid = 6605, minor = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_addmap_core] 8192 13 ffffc2000003b000
Aug  6 21:11:55 localhost [drm:drm_setup] 
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106401,
nr=0x01, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106407,
nr=0x07, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0286415,
nr=0x15, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00002000, type = 2
Aug  6 21:11:55 localhost [drm:drm_mmap_locked] start = 0x2b00e9f78000, end =
0x2b00e9f7a000, page offset = 0x1efff
Aug  6 21:11:55 localhost [drm:drm_vm_open_locked] 0x2b00e9f78000,0x00002000
Aug  6 21:11:55 localhost [drm:drm_do_vm_shm_nopage] shm_nopage 0x2b00e9f78000
Aug  6 21:11:55 localhost [drm:drm_do_vm_shm_nopage] shm_nopage 0x2b00e9f79000
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0286415,
nr=0x15, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0xc0000000, size =
0x04000000, type = 0
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106426,
nr=0x26, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0xc0106426,
nr=0x26, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:drm_unlocked_ioctl] pid=6605, cmd=0x6440,
nr=0x40, dev 0xe200, auth=1
Aug  6 21:11:55 localhost [drm:nouveau_card_init] prev state = 0
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0xc8000000, size =
0x04000000, type = 1
Aug  6 21:11:55 localhost [drm:nouveau_init_card_mappings] regs mapped ok at
0xc8000000
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0xcc000000, size =
0x01000000, type = 1
Aug  6 21:11:55 localhost [drm:drm_irq_install] drm_irq_install: irq=18
Aug  6 21:11:55 localhost [drm:nouveau_irq_preinstall] IRQ: preinst
Aug  6 21:11:55 localhost [drm:nouveau_irq_postinstall] IRQ: postinst
Aug  6 21:11:55 localhost [drm:nv04_instmem_determine_amount] RAMIN size:
1024KiB
Aug  6 21:11:55 localhost [drm:nv04_instmem_configure_fixed_tables] RAMHT
offset=0x10000, size=512
Aug  6 21:11:55 localhost [drm:nv04_instmem_configure_fixed_tables] RAMRO
offset=0x11200, size=512
Aug  6 21:11:55 localhost [drm:nv04_instmem_configure_fixed_tables] RAMFC
offset=0x20000, size=4096
Aug  6 21:11:55 localhost [drm:nouveau_mem_init] Available VRAM: 130048KiB
Aug  6 21:11:55 localhost [drm:nouveau_mem_init] Allocating sg memory for PCI
DMA
Aug  6 21:11:55 localhost [drm:drm_sg_alloc] drm_sg_alloc
Aug  6 21:11:55 localhost [drm:drm_sg_alloc] sg size=16777216 pages=4096
Aug  6 21:11:55 localhost [drm:drm_sg_alloc] sg alloc handle  = 15f7d200
Aug  6 21:11:55 localhost [drm:drm_sg_alloc] sg alloc virtual =
ffffc20015f81000
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new_fake] offset=0x00010000
size=0x00000200 flags=0x00000003
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new_fake] gpuobj ffff81002f6f72c0
Aug  6 21:11:55 localhost [drm:nv40_graph_init] Loading context-switch voodoo
Aug  6 21:11:55 localhost [drm:nouveau_fifo_init] Setting defaults for
remaining PFIFO regs
Aug  6 21:11:55 localhost [drm:nouveau_dma_channel_init] 
Aug  6 21:11:55 localhost [drm] Allocating FIFO number 0
Aug  6 21:11:55 localhost [drm:nouveau_notifier_init_channel] Allocating
notifier block in 272
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00000000, size =
0x00001000, type = 4
Aug  6 21:11:55 localhost [drm] allocated 0x0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_channel_init] ch0 vram=0x8003d001
tt=0x8003d002
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f72c0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x7f00000
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] ch0 size=32 align=16
flags=0x00000006
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7140
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x8003d001
gpuobj=ffff81002f6f7140
Aug  6 21:11:55 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fc8
Aug  6 21:11:55 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000fc8:
h=0x8003d001, c=0x00002100
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x0 size=0x1000000
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] access=0 target=8
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] ch0 size=16396 align=16
flags=0x00000006
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f70c0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x0, size 16777216
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x8003d002
gpuobj=ffff81002f6f70c0
Aug  6 21:11:55 localhost [drm:nouveau_ramht_hash_handle] ch0 handle=0x00000000
hash=0x00000fd0
Aug  6 21:11:55 localhost [drm:nouveau_ramht_insert] insert ch0 0x00000fd0:
h=0x8003d002, c=0x00002102
Aug  6 21:11:55 localhost [drm:drm_addmap_core] offset = 0x00001000, size =
0x00008000, type = 4
Aug  6 21:11:55 localhost [drm] allocated 0x1000
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] ch0 class=0x003d
offset=0x1000 size=0x8000
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] access=1 target=8
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] ch0 size=44 align=16
flags=0x00000006
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81003a5a1dc0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_dma_new] Creating PCI DMA object
using virtual zone starting at 0x1000, size 32768
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch0 h=0x00000000
gpuobj=ffff81003a5a1dc0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] ch0 size=71680 align=16
flags=0x00000002
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] gpuobj ffff81002f6f7840
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new] global heap fallback
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f7840
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new_fake] offset=0x00020000
size=0x00000080 flags=0x00000006
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_new_fake] gpuobj ffff81002f6f73c0
Aug  6 21:11:55 localhost [drm:nouveau_gpuobj_ref_add] ch-1 h=0x00000000
gpuobj=ffff81002f6f73c0
Aug  6 21:11:55 localhost [drm] nouveau_fifo_alloc: initialised FIFO 0
Aug  6 21:11:55 localhost [drm:nouveau_dma_channel_init] Using FIFO channel 0
Aug  6 21:11:55 localhost stopped custom tracer.
Aug  6 21:11:55 localhost Unable to handle kernel paging request at
ffffc20010630000 RIP: 
Aug  6 21:11:55 localhost [<ffffffff8808e962>]
:nouveau:nouveau_dma_channel_init+0x14e/0x4a4
Aug  6 21:11:55 localhost PGD 3ffc8067 PUD 3ffc7067 PMD 3e30d067 PTE
ffffc20015f82163
Aug  6 21:11:55 localhost Oops: 000b [1] PREEMPT 
Aug  6 21:11:55 localhost CPU 0 
Aug  6 21:11:55 localhost Modules linked in: nouveau drm sch_sfq cls_fw sch_htb
ip6table_filter iptable_raw xt_comment xt_policy xt_multiport ipt_ULOG ipt_TTL
ipt_ttl ipt_TOS ipt_tos ipt_SAME ipt_REJECT ipt_REDIRECT ipt_recent ipt_owner
ipt_NETMAP ipt_MASQUERADE ipt_LOG ipt_iprange ipt_ECN ipt_ecn ipt_CLUSTERIP
ipt_ah ipt_addrtype nf_nat_tftp nf_nat_snmp_basic nf_nat_sip nf_nat_pptp
nf_nat_proto_gre nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat_amanda ts_kmp
nf_conntrack_amanda nf_conntrack_tftp nf_conntrack_sip nf_conntrack_proto_sctp
nf_conntrack_pptp nf_conntrack_proto_gre nf_conntrack_netlink
nf_conntrack_netbios_ns nf_conntrack_irc nf_conntrack_h323 xt_tcpmss xt_pkttype
xt_NFQUEUE xt_NFLOG xt_MARK xt_mark xt_mac xt_limit xt_length xt_helper
xt_hashlimit ip6_tables xt_dccp xt_conntrack xt_connmark xt_CLASSIFY xt_tcpudp
xt_state iptable_nat nf_nat nf_conntrack_ipv4 iptable_mangle iptable_filter
ip_tables x_tables nf_conntrack_ftp nf_conntrack nfnetlink it87 hwmon_vid
i2c_isa i2c_nforce2 ivtv cx25840 wm8775 tuner cx2341x tveeprom videodev
v4l2_common v4l1_compat snd_ice1724 snd_ice17xx_ak4xxx snd_ac97_codec ac97_bus
snd_ak4114 snd_pcm snd_page_alloc snd_pt2258 snd_i2c snd_ak4xxx_adda
snd_mpu401_uart snd_rawmidi k8temp
Aug  6 21:11:55 localhost Pid: 6605, comm: X Not tainted 2.6.22.1-rt4 #1
Aug  6 21:11:55 localhost RIP: 0010:[<ffffffff8808e962>]  [<ffffffff8808e962>]
:nouveau:nouveau_dma_channel_init+0x14e/0x4a4
Aug  6 21:11:55 localhost RSP: 0018:ffff810030925be8  EFLAGS: 00010286
Aug  6 21:11:55 localhost RAX: ffffc20010630000 RBX: ffff810038995d08 RCX:
ffffc20015f89000
Aug  6 21:11:55 localhost RDX: 0000000000000001 RSI: ffff81003a5a1dc0 RDI:
ffffc20010630000
Aug  6 21:11:55 localhost RBP: 0000000000000000 R08: 00000000ffffffff R09:
00000000000000d0
Aug  6 21:11:55 localhost R10: 0000000000000000 R11: 0000000000000000 R12:
ffff81003d864000
Aug  6 21:11:55 localhost R13: ffff810038995800 R14: ffff81003d864000 R15:
ffff810038995800
Aug  6 21:11:55 localhost FS:  00002b00e8f95b00(0000) GS:ffffffff80676000(0000)
knlGS:00000000f7d066d0
Aug  6 21:11:55 localhost CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug  6 21:11:55 localhost CR2: ffffc20010630000 CR3: 000000003225b000 CR4:
00000000000006e0
Aug  6 21:11:55 localhost Process X (pid: 6605, threadinfo ffff810030924000,
task ffff81003fed2b90)
Aug  6 21:11:55 localhost Stack:  ffff81002f6f72c0 0000000000000000
0000000000000000 0000000000000000
Aug  6 21:11:55 localhost ffff810038995c30 0000000001000000 ffff810038995820
ffffffff88089b62
Aug  6 21:11:55 localhost 0000000000000000 ffffffff880a5aa0 ffff81003d864000
0000000000000040
Aug  6 21:11:55 localhost Call Trace:
Aug  6 21:11:55 localhost [<ffffffff88089b62>]
:nouveau:nouveau_card_init+0x7bf/0x80f
Aug  6 21:11:55 localhost [<ffffffff88089bb2>]
:nouveau:nouveau_ioctl_card_init+0x0/0x5
Aug  6 21:11:55 localhost [<ffffffff880696cc>]
:drm:drm_unlocked_ioctl+0x18f/0x20d
Aug  6 21:11:55 localhost [<ffffffff80254854>]
__generic_file_aio_write_nolock+0x345/0x3af
Aug  6 21:11:55 localhost [<ffffffff8022a24f>] printk+0x4e/0x56
Aug  6 21:11:55 localhost [<ffffffff8025492a>] generic_file_aio_write+0x6c/0xc1
Aug  6 21:11:55 localhost [<ffffffff802b254e>] ext3_file_write+0x16/0x94
Aug  6 21:11:55 localhost [<ffffffff80271bdf>] do_sync_write+0xc9/0x10c
Aug  6 21:11:55 localhost [<ffffffff802750d5>] cp_new_stat+0xe7/0xff
Aug  6 21:11:55 localhost [<ffffffff8023abe1>]
autoremove_wake_function+0x0/0x2e
Aug  6 21:11:55 localhost [<ffffffff804d8e3c>] rt_mutex_lock+0x15/0x3e
Aug  6 21:11:55 localhost [<ffffffff8806974a>] :drm:drm_ioctl+0x0/0x13
Aug  6 21:11:55 localhost [<ffffffff8806975b>] :drm:drm_ioctl+0x11/0x13
Aug  6 21:11:55 localhost [<ffffffff8027cfcd>] do_ioctl+0x9d/0xb6
Aug  6 21:11:55 localhost [<ffffffff8027d23d>] vfs_ioctl+0x257/0x270
Aug  6 21:11:55 localhost [<ffffffff8027239d>] vfs_write+0x121/0x136
Aug  6 21:11:55 localhost [<ffffffff8027d292>] sys_ioctl+0x3c/0x5e
Aug  6 21:11:55 localhost [<ffffffff8020934e>] system_call+0x7e/0x83
Aug  6 21:11:55 localhost 
Aug  6 21:11:55 localhost ---------------------------
Aug  6 21:11:55 localhost | preempt count: 00000000 ]
Aug  6 21:11:55 localhost | 0-level deep critical section nesting:
Aug  6 21:11:55 localhost ----------------------------------------
Aug  6 21:11:55 localhost 
Aug  6 21:11:55 localhost 
Aug  6 21:11:55 localhost Code: c7 00 00 00 00 00 ff 4b 18 89 53 10 ff c5 83 fd
08 75 c0 48 
Aug  6 21:11:55 localhost RIP  [<ffffffff8808e962>]
:nouveau:nouveau_dma_channel_init+0x14e/0x4a4
Aug  6 21:11:55 localhost RSP <ffff810030925be8>
Aug  6 21:11:55 localhost CR2: ffffc20010630000
Aug  6 21:11:55 localhost [drm:drm_vm_shm_close] 0x2b00e9f78000,0x00002000
Aug  6 21:11:55 localhost [drm:drm_release] open_count = 1
Aug  6 21:11:55 localhost [drm:nouveau_fifo_cleanup] clearing FIFO enables from
file_priv
Aug  6 21:11:55 localhost [drm:drm_release] pid = 6605, device = 0xe200,
open_count = 1
Aug  6 21:11:55 localhost [drm:drm_fasync] fd = -1, device = 0xe200
Aug  6 21:11:55 localhost [drm:drm_release] *ERROR* Device busy: 1 0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
