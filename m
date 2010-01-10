From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TTM] general protection fault in ttm_tt_swapout,
	to_virtual 	looks screwed up
Date: Mon, 11 Jan 2010 00:53:26 +0100
Message-ID: <6d4bc9fc1001101553n2c0ccd6ckd96fef82919f899e@mail.gmail.com>
References: <6d4bc9fc1001091541r7ff250dwcea38ae77783d487@mail.gmail.com>
	<4B4A2629.1070106@shipmail.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B4A2629.1070106-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jan 10, 2010 at 8:10 PM, Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org> wro=
te:
> I've seen something similar with openchrome,
> but I think I traced that down to the DMA engines causing memory corrupti=
on.

Corruption outside the memory it was supposed to affect? Shouldn't
that lead to massive problems? Also, i don't think a dma engine can
affect random memory pages (that would imply crappy memory
protection).

>
> Note that IIRC kmap_atomic may return page_address(page) for a lowmem pag=
e.
> Any idea what may cause kmap_atomic to behave in this way?

I think it's pretty normal for it to return page_address on x86_64,
since that doesn't have or need PAE or anything like that.

>
> /Thomas
>
>
> Maarten Maathuis wrote:
>>
>> I've been noticing for a while that i've been getting general
>> protection faults in ttm_to_swapout, this time i was printk'ing the
>> virtual addresses.
>>
>> In case it's not obvious, the result of kmap_atomic() is wrong.
>>
>> This is nouveau/linux-2.6 which is somewhere after 2.6.32. I was
>> wondering if anyone has ever seen anything like this?
>>
>> from_virtual ffff88003088b000 to_virtual ffff88003100f000
>> from_virtual ffff88003088c000 to_virtual ffff880031018000
>> from_virtual ffff88003088d000 to_virtual ffff880031019000
>> from_virtual ffff88003088e000 to_virtual ffff88003101a000
>> from_virtual ffff88003088f000 to_virtual ffff88003101b000
>> from_virtual ffff880030890000 to_virtual ffff880031016000
>> from_virtual ffff880030891000 to_virtual ffff880031017000
>> from_virtual ffff880030892000 to_virtual ffff88003101c000
>> from_virtual ffff880030893000 to_virtual ffff88003101d000
>> from_virtual ffff880030894000 to_virtual ffff88003101e000
>> from_virtual ffff880030895000 to_virtual ffff88003101f000
>> from_virtual ffff880030896000 to_virtual ffff88001c626000
>> from_virtual ffff880030897000 to_virtual ffff88001c627000
>> from_virtual ffff880030898000 to_virtual ffff88001c752000
>> from_virtual ffff880030899000 to_virtual ffff88001c66d000
>> from_virtual ffff88003089a000 to_virtual ffff88001c642000
>> from_virtual ffff8800308db000 to_virtual 0005d12492492000
>> general protection fault: 0000 [#1] PREEMPT
>> last sysfs file: /sys/devices/pci0000:00/0000:00:08.0/host3/uevent
>> CPU 0
>> Modules linked in: nouveau snd_ice1724 snd_rawmidi wm8775 tuner ttm
>> drm_kms_helper usbhid snd_ice17xx_ak4xxx snd_ac97_codec ac97_bus
>> snd_ak4xxx_adda snd_ak4114 cx25840 snd_pcm ivtv drm snd_timer
>> snd_page_alloc snd_pt2258 snd_i2c cx2341x agpgart ehci_hcd
>> i2c_algo_bit i2c_nforce2 tveeprom snd soundcore ohci_hcd
>> Pid: 1501, comm: ttm_swap Not tainted 2.6.32-00848-gedc4439-dirty #172
>> System Product Name
>> RIP: 0010:[<ffffffffa017c3fb>] =A0[<ffffffffa017c3fb>]
>> ttm_tt_swapout+0x135/0x1db [ttm]
>> RSP: 0000:ffff88003749fce0 =A0EFLAGS: 00010282
>> RAX: 0000000000000040 RBX: 0005d12492492000 RCX: 0000000000000400
>> RDX: 00000000ffffffff RSI: ffff8800308db000 RDI: 0005d12492492000
>> RBP: ffff88003749fd30 R08: 0000000000be8bfa R09: ffff88003749fb30
>> R10: 000000000000000f R11: 0000000000000020 R12: ffff8800308db000
>> R13: ffff880030a7a4e0 R14: fffffffffffffff4 R15: ffff880037795a00
>> FS: =A000007fa003a78700(0000) GS:ffffffff814d8000(0000)
>> knlGS:00000000f5a256d0
>> CS: =A00010 DS: 0018 ES: 0018 CR0: 000000008005003b
>> CR2: 00007fcac3873f80 CR3: 000000003ecfd000 CR4: 00000000000006f0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
>> Process ttm_swap (pid: 1501, threadinfo ffff88003749e000, task
>> ffff88003d2ae360)
>> Stack:
>> =A0ffff88003e00b910 ffff88003749ffd8 ffff880037795a00 ffff8800377918b8
>> <0> 000000001f4be800 ffff88001f4be870 ffff88001f4be800 0000000000000000
>> <0> ffff88001f4be844 ffff88003edb95d8 ffff88003749fdb0 ffffffffa017d550
>> Call Trace:
>> =A0[<ffffffffa017d550>] ttm_bo_swapout+0x1df/0x222 [ttm]
>> =A0[<ffffffffa017b38d>] ttm_shrink+0x9b/0xc0 [ttm]
>> =A0[<ffffffffa017b3c6>] ttm_shrink_work+0x14/0x16 [ttm]
>> =A0[<ffffffff810489c7>] worker_thread+0x1b7/0x25e
>> =A0[<ffffffffa017b3b2>] ? ttm_shrink_work+0x0/0x16 [ttm]
>> =A0[<ffffffff8104bd8a>] ? autoremove_wake_function+0x0/0x38
>> =A0[<ffffffff81048810>] ? worker_thread+0x0/0x25e
>> =A0[<ffffffff8104ba75>] kthread+0x7c/0x84
>> =A0[<ffffffff8100bd6a>] child_rip+0xa/0x20
>> =A0[<ffffffffa01d776e>] ? nouveau_mem_init_heap+0x5d/0xfd [nouveau]
>> =A0[<ffffffff8104b9f9>] ? kthread+0x0/0x84
>> =A0[<ffffffff8100bd60>] ? child_rip+0x0/0x20
>> Code: 04 00 00 00 e8 97 f7 ff ff 4c 89 e6 48 89 c2 48 89 c3 48 c7 c7
>> 92 1f 18 a0 31 c0 e8 ca ad 19 e1 48 89 df 4c 89 e6 b9 00 04 00 00 <f3>
>> a5 e8 ba f7 ff ff e8 b5 f7 ff ff bf 01 00 00 00 e8 c4 f0 19
>> RIP =A0[<ffffffffa017c3fb>] ttm_tt_swapout+0x135/0x1db [ttm]
>> =A0RSP <ffff88003749fce0>
>> ---[ end trace 8724ec5cfdbfe4ce ]---
>> note: ttm_swap[1501] exited with preempt_count 3
>>
>>
>> ------------------------------------------------------------------------=
------
>> This SF.Net email is sponsored by the Verizon Developer Community
>> Take advantage of Verizon's best-in-class app development support
>> A streamlined, 14 day to market process makes app distribution fast and
>> easy
>> Join now and get one step closer to millions of Verizon customers
>> http://p.sf.net/sfu/verizon-dev2dev --
>> _______________________________________________
>> Dri-devel mailing list
>> Dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
>> https://lists.sourceforge.net/lists/listinfo/dri-devel
>>
>
>
