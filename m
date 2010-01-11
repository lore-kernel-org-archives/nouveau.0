From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TTM] general protection fault in ttm_tt_swapout,
	to_virtual looks screwed up
Date: Mon, 11 Jan 2010 10:13:46 +0100
Message-ID: <91752841001110113k42b07d7eod51dfa08708fe264@mail.gmail.com>
References: <6d4bc9fc1001091541r7ff250dwcea38ae77783d487@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1001091541r7ff250dwcea38ae77783d487-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jan 10, 2010 at 12:41 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I've been noticing for a while that i've been getting general
> protection faults in ttm_to_swapout, this time i was printk'ing the
> virtual addresses.
>
> In case it's not obvious, the result of kmap_atomic() is wrong.
>
> This is nouveau/linux-2.6 which is somewhere after 2.6.32. I was
> wondering if anyone has ever seen anything like this?
>

I am not sure this is related (so I don't want to bother dri-devel
too), but using a specific version of nv25 dri and exiting etracer
game, I managed to trigger a nice combination of problems :)
validate:-12 then a bug in _mmx_memcpy , called by ttm_to_swapout then
many of the "reserve_ram_pages_type failed" stuff.

I suppose firefox is quite good at putting pressure and triggering
bugs, but not quite as efficient as gallium :)

And if it's not related at all and completely off-topic, then sorry.

[  250.615413] [drm] nouveau 0000:03:00.0: Allocating FIFO number 2
[  250.617551] [drm] nouveau 0000:03:00.0: nouveau_channel_alloc:
initialised FIFO 2
[  267.092436] [drm] nouveau 0000:03:00.0: validate: -12
[  267.944165] BUG: unable to handle kernel paging request at 0aaff000
[  267.944178] IP: [<c11a0b71>] _mmx_memcpy+0x79/0x134
[  267.944194] *pde = 00000000
[  267.944199] Oops: 0002 [#1]
[  267.944203] last sysfs file:
/sys/devices/pci0000:00/0000:00:02.2/usb1/1-0:1.0/uevent
[  267.944210] Modules linked in: snd_emu10k1 nouveau snd_rawmidi ttm
emu10k1_gp snd_util_mem ath5k firewire_ohci drm_kms_helper snd_hwdep
gameport ath skge snd_intel8x0 firewire_core crc_itu_t drm
snd_ac97_codec ac97_bus nvidia_agp forcedeth i2c_nforce2 agpgart
i2c_algo_bit
[  267.944238]
[  267.944244] Pid: 3046, comm: ttm_swap Not tainted (2.6.32 #10) A7N8X-E
[  267.944249] EIP: 0060:[<c11a0b71>] EFLAGS: 00010212 CPU: 0
[  267.944254] EIP is at _mmx_memcpy+0x79/0x134
[  267.944258] EAX: cd6c3000 EBX: 00000040 ECX: 00000040 EDX: 0aaff000
[  267.944262] ESI: cd6c3000 EDI: d741b600 EBP: dcd15ee4 ESP: dcd15ed0
[  267.944267]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
[  267.944272] Process ttm_swap (pid: 3046, ti=dcd14000 task=ddc0e800
task.ti=dcd14000)
[  267.944276] Stack:
[  267.944278]  0aaff000 00001000 d6a95080 fffffff4 d741b600 dcd15eec
e0a21bf0 dcd15f10
[  267.944287] <0> e0a21f80 d6989758 c1857860 d741b600 000003b6
d74a3a00 00000000 00000000
[  267.944296] <0> dcd15f44 e0a22d49 dfbcab8c d74a3a28 00000000
00400000 00000400 00000000
[  267.944306] Call Trace:
[  267.944324]  [<e0a21bf0>] ? T.418+0xd/0xf [ttm]
[  267.944335]  [<e0a21f80>] ? ttm_tt_swapout+0x106/0x17b [ttm]
[  267.944346]  [<e0a22d49>] ? ttm_bo_swapout+0x12f/0x161 [ttm]
[  267.944356]  [<e0a2128a>] ? ttm_shrink+0x7d/0x89 [ttm]
[  267.944365]  [<e0a212aa>] ? ttm_shrink_work+0x14/0x18 [ttm]
[  267.944374]  [<c1032244>] ? worker_thread+0x11f/0x188
[  267.944383]  [<c101ff94>] ? T.1319+0x26/0x5e
[  267.944392]  [<e0a21296>] ? ttm_shrink_work+0x0/0x18 [ttm]
[  267.944402]  [<c1034e51>] ? autoremove_wake_function+0x0/0x2f
[  267.944407]  [<c1032125>] ? worker_thread+0x0/0x188
[  267.944413]  [<c1034b50>] ? kthread+0x5e/0x63
[  267.944419]  [<c1034af2>] ? kthread+0x0/0x63
[  267.944427]  [<c10030d3>] ? kernel_thread_helper+0x7/0x10
[  267.944430] Code: 00 00 00 0f 0d 86 c0 00 00 00 0f 0d 86 00 01 00
00 31 c9 eb 46 0f 0d 80 40 01 00 00 0f 6f 00 0f 6f 48 08 0f 6f 50 10
0f 6f 58 18 <0f> 7f 02 0f 7f 4a 08 0f 7f 52 10 0f 7f 5a 18 0f 6f 40 20
0f 6f
[  267.944476] EIP: [<c11a0b71>] _mmx_memcpy+0x79/0x134 SS:ESP 0068:dcd15ed0
[  267.944484] CR2: 000000000aaff000
[  267.944489] ---[ end trace 74c69ad3330bb04a ]---
[  267.944495] note: ttm_swap[3046] exited with preempt_count 2
[  268.666662] reserve_ram_pages_type failed 0x9cba000-0x9cbb000,
track 0x8, req 0x10
[  269.001031] reserve_ram_pages_type failed 0x6ff0000-0x6ff1000,
track 0x8, req 0x10
[  269.474134] reserve_ram_pages_type failed 0x68f2000-0x68f3000,
track 0x8, req 0x10
[  269.767270] reserve_ram_pages_type failed 0x14c98000-0x14c99000,
track 0x8, req 0x10
[  269.783213] reserve_ram_pages_type failed 0x23eb000-0x23ec000,
track 0x8, req 0x10
[  270.161672] reserve_ram_pages_type failed 0x10784000-0x10785000,
track 0x8, req 0x10
[  270.376144] reserve_ram_pages_type failed 0x9e01000-0x9e02000,
track 0x8, req 0x10
[  271.169852] reserve_ram_pages_type failed 0xe1b7000-0xe1b8000,
track 0x8, req 0x10
[  271.607980] reserve_ram_pages_type failed 0x3ae2000-0x3ae3000,
track 0x8, req 0x10
[  272.027030] reserve_ram_pages_type failed 0x195e8000-0x195e9000,
track 0x8, req 0x10
[  284.930170] reserve_ram_pages_type failed 0xdcd4000-0xdcd5000,
track 0x8, req 0x10
[  285.043614] reserve_ram_pages_type failed 0x36c5000-0x36c6000,
track 0x8, req 0x10
[  285.941944] reserve_ram_pages_type failed 0x30d2000-0x30d3000,
track 0x8, req 0x10
[  341.055291] reserve_ram_pages_type failed 0x1b90b000-0x1b90c000,
track 0x8, req 0x10
[  355.005349] [drm] nouveau 0000:03:00.0: nouveau_channel_free: freeing fifo 2
[  355.074031] etracer used greatest stack depth: 5632 bytes left
