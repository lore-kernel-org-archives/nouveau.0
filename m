From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14941] ioremap leak/oddity in DRM
Date: Mon, 10 Mar 2008 13:51:11 -0700 (PDT)
Message-ID: <20080310205112.015EF130091@annarchy.freedesktop.org>
References: <bug-14941-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14941-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14941





--- Comment #4 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2008-03-10 13:51:10 PST ---
Ok, so I should not have applied the both patches together. ANyway, this is the
kernel log:

[10827.545301] kmmio: loaded.
[10837.455814] [drm] Initialized drm 1.1.0 20060810
[10842.824600] ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 16 (level, low) ->
IRQ 16
[10842.825872] kmmio: ioremap_nocache(0xfb000000, 0x8) = ffffc200004bc000
[10842.826156] kmmio: Unmapping ffffc200004bc000.
[10842.826493] [drm] Detected an NV20 generation card (0x020000a5)
[10842.826713] [drm] Initialized nouveau 0.0.10 20060213 on minor 0
[10858.554576] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[10858.587579] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[10858.593323] kmmio: Unmapping ffffc20003580000.
[10858.593494] kmmio: Unmapping ffffc20002500000.
[10858.627117] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[10858.660011] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[10858.665817] kmmio: Unmapping ffffc20003580000.
[10858.665988] kmmio: Unmapping ffffc20002500000.
[10859.671455] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[10859.703436] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[10859.709132] kmmio: Unmapping ffffc20003580000.
[10859.709302] kmmio: Unmapping ffffc20002500000.
[10859.741084] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[10859.773234] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[10859.778917] kmmio: Unmapping ffffc20003580000.
[10859.779086] kmmio: Unmapping ffffc20002500000.
[10859.811407] kmmio: __ioremap(0xfb000000, 0x1000000, 0x0) = ffffc20002500000
[10859.842806] kmmio: __ioremap(0xfb700000, 0x100000, 0x0) = ffffc20003580000
[10860.487452] [drm:nouveau_mem_init] *ERROR* Error initialising AGP: 1
[10860.519058] [drm] Allocating FIFO number 0
[10860.585753] [drm] nouveau_fifo_alloc: initialised FIFO 0
[10860.585764] kmmio: __ioremap(0xf4000000, 0x8000, 0x0) = ffffc200024e0000
[10860.586806] [drm] Allocating FIFO number 1
[10860.657699] [drm] nouveau_fifo_alloc: initialised FIFO 1
[10860.657714] kmmio: __ioremap(0xfb810000, 0x10000, 0x0) = ffffc20003520000
[10873.312851] [drm] Allocating FIFO number 2
[10873.385945] [drm] nouveau_fifo_alloc: initialised FIFO 2
[10873.385960] kmmio: __ioremap(0xfb820000, 0x10000, 0x0) = ffffc20003540000
[10877.386933] [drm] nouveau_fifo_free: freeing fifo 2
[10878.892568] [drm] Allocating FIFO number 2
[10878.965646] [drm] nouveau_fifo_alloc: initialised FIFO 2
[10882.966435] [drm] nouveau_fifo_free: freeing fifo 2
[10885.638113] [drm] nouveau_fifo_free: freeing fifo 1
[10885.639210] kmmio: Unmapping ffffc200024e0000.
[10885.639292] [drm] nouveau_fifo_free: freeing fifo 0
[10885.639857] kmmio: Unmapping ffffc200024e0000.
[10885.639933] iounmap: bad address ffffc200024e0000
[10885.640014] Pid: 15415, comm: X Not tainted 2.6.24-gentoo-r2-trace #1
[10885.640100] 
[10885.640101] Call Trace:
[10885.640240]  [<ffffffff8021ca0e>] iounmap+0x9a/0xe0
[10885.640251]  [<ffffffff881c4264>] :mmio:iounmap_trace+0x14f/0x15c
[10885.640279]  [<ffffffff881cf80f>] :drm:drm_core_ioremapfree+0x51/0x53
[10885.640292]  [<ffffffff881f1089>] :nouveau:nouveau_fifo_free+0x1db/0x253
[10885.640308]  [<ffffffff881f5d6c>]
:nouveau:nouveau_dma_channel_takedown+0x60/0x6c
[10885.640320]  [<ffffffff881f0287>] :nouveau:nouveau_lastclose+0x63/0x109
[10885.640339]  [<ffffffff881ccb7a>] :drm:drm_lastclose+0x4a/0x3b5
[10885.640359]  [<ffffffff881cdabb>] :drm:drm_release+0x47f/0x4d2
[10885.640368]  [<ffffffff80274970>] __fput+0xc5/0x1a1
[10885.640375]  [<ffffffff80274c0c>] fput+0x13/0x15
[10885.640379]  [<ffffffff80271f1b>] filp_close+0x66/0x71
[10885.640386]  [<ffffffff8022b89d>] put_files_struct+0x6c/0xc0
[10885.640392]  [<ffffffff8022b946>] __exit_files+0x55/0x5a
[10885.640397]  [<ffffffff8022cd37>] do_exit+0x242/0x778
[10885.640401]  [<ffffffff80274c0c>] fput+0x13/0x15
[10885.640408]  [<ffffffff8022d300>] sys_exit_group+0x0/0x14
[10885.640413]  [<ffffffff8022d312>] sys_exit_group+0x12/0x14
[10885.640417]  [<ffffffff8020b74e>] system_call+0x7e/0x83
[10885.641638] 
[10885.642736] kmmio: Unmapping ffffc20003540000.
[10885.643070] kmmio: Unmapping ffffc20003520000.
[10885.643157] kmmio: Unmapping ffffc20003580000.
[10885.643316] kmmio: Unmapping ffffc20002500000.
[10892.039445] ACPI: PCI interrupt for device 0000:01:00.0 disabled
[10892.039524] [drm] Module unloaded
[10943.881377] kmmio: unload...


Looks like something is freeing a bunch of io-mappings at a time. Notice, how
creating fifo 2 for the second time does not ioremap anything, so there is
caching in action.

Maybe this is a non-issue.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
