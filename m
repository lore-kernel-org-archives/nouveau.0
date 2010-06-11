From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nvfx
Date: Fri, 11 Jun 2010 15:37:20 +0200
Message-ID: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu@mail.gmail.com>
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
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Marek

Thanks a lot for your rebasing work.
Here is my report :

- all my games that broke with temporaries patch (they were either
completely black or lot of black screen flash every frame) behave
badly, but in different ways :
* etracer is very slow and often crash in ttm code [1] (I think this
is an old bug that just resurrected, no idea why)
* foobillard is very slow and still flash a bit
* strangely, neverball seems to work, I get similar results than with
old nvfx-next-6b branch with temporaries reverted. no black flash
while playing.
* glest segfault [2]

I also compared with piglit the old nvfx branch with the new merged one :
114/174 vs 113/174
That looks quite good with 3 new pass, but 4 new fail :
* fbo-copypix
Returncode was -6
* glean pbo
     ../../../../src/gallium/auxiliary/util/u_inlines.h:77:pipe_reference:
Assertion `pipe_is_referenced(reference)\\\' failed.
* texCombine4:  FAIL rgba8, db, z24, s8, win+pmap, id 33
* fp-long-alu

There is just fp-long-alu that is for sure a regression caused by new
master code (some gallium changes). I don't know about the 3 others.

It might be worth to re-test everything on your new branch with this
patch reverted :
nvfx: rewrite render temporaries code, also affecting 2D and resource code



[1]
Jun 11 15:08:00 myhost kernel: [ 8670.323229] BUG: unable to handle
kernel paging request at 0007000d
Jun 11 15:08:00 myhost kernel: [ 8670.323242] IP: [<f840adcb>]
ttm_bo_wait+0x1b/0x170 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323260] *pde = 00000000
Jun 11 15:08:00 myhost kernel: [ 8670.323265] Oops: 0000 [#1] PREEMPT SMP
Jun 11 15:08:00 myhost kernel: [ 8670.323271] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Jun 11 15:08:00 myhost kernel: [ 8670.323278] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
hid_logitech ff_memless usbhid
 hid snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_emu10k1
snd_rawmidi snd_pcm_oss snd_seq_device nouveau ttm drm_kms_helper
snd_mixer_oss snd_ut
il_mem snd_hwdep drm i2c_algo_bit snd_intel8x0 snd_ac97_codec ac97_bus
firewire_ohci firewire_core emu10k1_gp crc_itu_t i82875p_edac evdev
ppdev snd_pcm snd
_timer gameport e1000 edac_core parport_pc snd soundcore
snd_page_alloc psmouse uhci_hcd i2c_i801 intel_agp button thermal
processor iTCO_wdt iTCO_vendor_support serio_raw i2c_core ehci_hcd
agpgart shpchp pci_hotplug usbcore lp parport rtc_cmos rtc_core
rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Jun 11 15:08:00 myhost kernel: [ 8670.323367]
Jun 11 15:08:00 myhost kernel: [ 8670.323373] Pid: 5723, comm: etracer
Not tainted 2.6.34-rc5 #21 P4C800-E/To Be Filled By O.E.M.
Jun 11 15:08:00 myhost kernel: [ 8670.323378] EIP: 0060:[<f840adcb>]
EFLAGS: 00210282 CPU: 0
Jun 11 15:08:00 myhost kernel: [ 8670.323386] EIP is at
ttm_bo_wait+0x1b/0x170 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323390] EAX: 00070001 EBX:
f4700900 ECX: 00000000 EDX: 00000000
Jun 11 15:08:00 myhost kernel: [ 8670.323394] ESI: 00000000 EDI:
00000000 EBP: f100bb50 ESP: f100bb20
Jun 11 15:08:00 myhost kernel: [ 8670.323398]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Jun 11 15:08:00 myhost kernel: [ 8670.323402] Process etracer (pid:
5723, ti=f100a000 task=f387c840 task.ti=f100a000)
Jun 11 15:08:00 myhost kernel: [ 8670.323406] Stack:
Jun 11 15:08:00 myhost kernel: [ 8670.323408]  00000000 00000000
00200002 00000000 0100bb3c f470095c 00000000 00000000
Jun 11 15:08:00 myhost kernel: [ 8670.323418] <0> 00000000 f4700900
00000000 f4700928 f100bbcc f840c35f 00000000 00000000
Jun 11 15:08:00 myhost kernel: [ 8670.323429] <0> f100bc98 f100bc98
0000eeee f100bc38 00004000 00000000 f4700910 00070001
Jun 11 15:08:00 myhost kernel: [ 8670.323441] Call Trace:
Jun 11 15:08:00 myhost kernel: [ 8670.323451]  [<f840c35f>] ?
ttm_mem_evict_first+0x12f/0x4a0 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323460]  [<f840ba19>] ?
ttm_bo_man_get_node+0xb9/0xc0 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323468]  [<f840ce5d>] ?
ttm_bo_mem_space+0x36d/0x430 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323486]  [<f84bd183>] ?
nouveau_bo_move+0x193/0x410 [nouveau]
Jun 11 15:08:00 myhost kernel: [ 8670.323498]  [<c106c805>] ?
generic_smp_call_function_single_interrupt+0x95/0xd0
Jun 11 15:08:00 myhost kernel: [ 8670.323511]  [<f84bcff0>] ?
nouveau_bo_move+0x0/0x410 [nouveau]
Jun 11 15:08:00 myhost kernel: [ 8670.323519]  [<f840b3d7>] ?
ttm_bo_handle_move_mem+0xf7/0x330 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323527]  [<f840d01d>] ?
ttm_bo_move_buffer+0xfd/0x120 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323535]  [<f840d0ce>] ?
ttm_bo_validate+0x8e/0x120 [ttm]
Jun 11 15:08:00 myhost kernel: [ 8670.323547]  [<f84bd9a5>] ?
validate_list+0xa5/0x280 [nouveau]
Jun 11 15:08:00 myhost kernel: [ 8670.323561]  [<f84be6a0>] ?
nouveau_gem_ioctl_pushbuf+0x5f0/0xea0 [nouveau]
Jun 11 15:08:00 myhost kernel: [ 8670.323576]  [<f83ce3ac>] ?
drm_ioctl+0x28c/0x410 [drm]
Jun 11 15:08:00 myhost kernel: [ 8670.323589]  [<f84be0b0>] ?
nouveau_gem_ioctl_pushbuf+0x0/0xea0 [nouveau]
Jun 11 15:08:00 myhost kernel: [ 8670.323601]  [<c1035e86>] ?
task_tick_fair+0x36/0xf0
Jun 11 15:08:00 myhost kernel: [ 8670.323609]  [<c10e8554>] ?
vfs_ioctl+0x34/0xa0
Jun 11 15:08:00 myhost kernel: [ 8670.323616]  [<c1088d4a>] ?
rcu_report_qs_rnp+0x6a/0x100
Jun 11 15:08:00 myhost kernel: [ 8670.323626]  [<f83ce120>] ?
drm_ioctl+0x0/0x410 [drm]
Jun 11 15:08:00 myhost kernel: [ 8670.323631]  [<c10e8d06>] ?
do_vfs_ioctl+0x66/0x580
Jun 11 15:08:00 myhost kernel: [ 8670.323638]  [<c10431c0>] ?
__do_softirq+0xe0/0x1d0
Jun 11 15:08:00 myhost kernel: [ 8670.323644]  [<c10e927f>] ?
sys_ioctl+0x5f/0x80
Jun 11 15:08:00 myhost kernel: [ 8670.323652]  [<c101c436>] ?
smp_apic_timer_interrupt+0x56/0x90
Jun 11 15:08:00 myhost kernel: [ 8670.323660]  [<c100381f>] ?
sysenter_do_call+0x12/0x28
Jun 11 15:08:00 myhost kernel: [ 8670.323663] Code: 0f 0b 0f 0b 8d b6
00 00 00 00 8d bf 00 00 00 00 55 89 e5 83 ec 30 89 5d f4 89 c3 89 7d
fc 0f b6 7d 08 89 75 f8 88 4d e8 8b 40 04 <8b> 70 0c 8b 83 8c 00 00 00
85 c0 75 11 31 d2 8b 5d f4 89 d0 8b
Jun 11 15:08:00 myhost kernel: [ 8670.323727] EIP: [<f840adcb>]
ttm_bo_wait+0x1b/0x170 [ttm] SS:ESP 0068:f100bb20
Jun 11 15:08:00 myhost kernel: [ 8670.323737] CR2: 000000000007000d
Jun 11 15:08:00 myhost kernel: [ 8670.323744] ---[ end trace
6da3a079cf5aebe6 ]---

[2]
*** glibc detected *** ./glest: invalid fastbin entry (free): 0x09bc2938 ***
======= Backtrace: =========
/lib/libc.so.6(+0x6c7b1)[0xb6fa67b1]
/lib/libc.so.6(+0x6d52b)[0xb6fa752b]
/lib/libc.so.6(cfree+0x6d)[0xb6fab1cd]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1f837d)[0xb614837d]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1f845b)[0xb614845b]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1f829c)[0xb614829c]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1f8513)[0xb6148513]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1cdb72)[0xb611db72]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1cf947)[0xb611f947]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x1154e)[0xb5f6154e]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x18cf4)[0xb5f68cf4]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x17e42a)[0xb60ce42a]
/home/xavier/app/mesa/lib/gallium/nouveau_dri.so(+0x67d2c)[0xb5fb7d2c]
./glest[0x80898f7]
./glest[0x808bf48]
./glest[0x808b310]
./glest[0x808b6f8]
/lib/libc.so.6(__libc_start_main+0xe6)[0xb6f50c76]
./glest[0x804e0f1]
======= Memory map: ========
