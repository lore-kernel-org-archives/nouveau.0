From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: crash in ttm_bo_cleanup_refs
Date: Thu, 15 Apr 2010 14:33:41 +0200
Message-ID: <q2jb67489df1004150533i899b8dffide407788d5d85db5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I got a nice lockup today after running etracer for a few minutes.

kernel : Linux 2.6.34-rc3 + recent nouveau code (Apr 7 , de2f7caff0bf)
mesa : git master of today , using nvfx gallium

Apr 15 11:37:12 myhost kernel: [57533.031358] [drm] nouveau
0000:01:00.0: Allocating FIFO number 2
Apr 15 11:37:12 myhost kernel: [57533.033502] [drm] nouveau
0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
Apr 15 11:39:57 myhost kernel: [57698.458538] BUG: unable to handle
kernel paging request at 0007000d
Apr 15 11:39:57 myhost kernel: [57698.458551] IP: [<f82cddc4>]
ttm_bo_cleanup_refs+0x24/0x210 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458565] *pde = 00000000
Apr 15 11:39:57 myhost kernel: [57698.458569] Oops: 0000 [#1] PREEMPT SMP
Apr 15 11:39:57 myhost kernel: [57698.458575] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:39:57 myhost kernel: [57698.458581] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:39:57 myhost kernel: [57698.458667]
Apr 15 11:39:57 myhost kernel: [57698.458673] Pid: 7, comm: events/0
Not tainted 2.6.34-rc3 #16 P4C800-E/To Be Filled By O.E.M.
Apr 15 11:39:57 myhost kernel: [57698.458678] EIP: 0060:[<f82cddc4>]
EFLAGS: 00010202 CPU: 0
Apr 15 11:39:57 myhost kernel: [57698.458685] EIP is at
ttm_bo_cleanup_refs+0x24/0x210 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458689] EAX: 00070001 EBX:
e671cb40 ECX: e671cb50 EDX: 00000000
Apr 15 11:39:57 myhost kernel: [57698.458693] ESI: e671cb78 EDI:
00000001 EBP: f704ff30 ESP: f704ff08
Apr 15 11:39:57 myhost kernel: [57698.458698]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:39:57 myhost kernel: [57698.458703] Process events/0 (pid:
7, ti=f704e000 task=f7031ce0 task.ti=f704e000)
Apr 15 11:39:57 myhost kernel: [57698.458706] Stack:
Apr 15 11:39:57 myhost kernel: [57698.458708]  f82cf908 f704ff20
f82cd10a e671c1a8 f82cd0a0 e671cb50 00070001 e671c780
Apr 15 11:39:57 myhost kernel: [57698.458719] <0> e671cb40 00000000
f704ff54 f82ce028 00000000 f1a80334 00000000 f653414c
Apr 15 11:39:57 myhost kernel: [57698.458731] <0> f1a80344 f1a80344
c2808980 f704ff60 f82ce0a3 c2808980 f704ffbc c10540a3
Apr 15 11:39:57 myhost kernel: [57698.458743] Call Trace:
Apr 15 11:39:57 myhost kernel: [57698.458752]  [<f82cf908>] ?
ttm_transfered_destroy+0x8/0x10 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458761]  [<f82cd10a>] ?
ttm_bo_release_list+0x6a/0xb0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458768]  [<f82cd0a0>] ?
ttm_bo_release_list+0x0/0xb0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458776]  [<f82ce028>] ?
ttm_bo_delayed_delete+0x78/0xe0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458784]  [<f82ce0a3>] ?
ttm_bo_delayed_workqueue+0x13/0x30 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458794]  [<c10540a3>] ?
worker_thread+0x113/0x250
Apr 15 11:39:57 myhost kernel: [57698.458803]  [<c132213c>] ?
schedule+0x25c/0x700
Apr 15 11:39:57 myhost kernel: [57698.458811]  [<f82ce090>] ?
ttm_bo_delayed_workqueue+0x0/0x30 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.458817]  [<c1058310>] ?
autoremove_wake_function+0x0/0x40
Apr 15 11:39:57 myhost kernel: [57698.458823]  [<c1053f90>] ?
worker_thread+0x0/0x250
Apr 15 11:39:57 myhost kernel: [57698.458828]  [<c1057eec>] ? kthread+0x6c/0x80
Apr 15 11:39:57 myhost kernel: [57698.458833]  [<c1057e80>] ? kthread+0x0/0x80
Apr 15 11:39:57 myhost kernel: [57698.458840]  [<c1003e3e>] ?
kernel_thread_helper+0x6/0x18
Apr 15 11:39:57 myhost kernel: [57698.458843] Code: c9 eb ac 8d 74 26
00 55 89 e5 57 89 d7 56 83 f7 01 53 89 c3 83 ec 1c 8b 40 04 81 e7 ff
00 00 00 8d 73 38 89 45 f0 8b 0b 89 4d ec <8b> 40 0c 89 45 e8 89 f0 e8
4f 62 05 c9 31 c9 31 d2 89 d8 89 3c
Apr 15 11:39:57 myhost kernel: [57698.458909] EIP: [<f82cddc4>]
ttm_bo_cleanup_refs+0x24/0x210 [ttm] SS:ESP 0068:f704ff08
Apr 15 11:39:57 myhost kernel: [57698.458920] CR2: 000000000007000d
Apr 15 11:39:57 myhost kernel: [57698.458934] ---[ end trace
66bbdca73e702081 ]---
Apr 15 11:39:57 myhost kernel: [57698.603553] BUG: unable to handle
kernel paging request at 0007000d
Apr 15 11:39:57 myhost kernel: [57698.603565] IP: [<f82cce5b>]
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603577] *pde = 00000000
Apr 15 11:39:57 myhost kernel: [57698.603581] Oops: 0000 [#2] PREEMPT SMP
Apr 15 11:39:57 myhost kernel: [57698.603585] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:39:57 myhost kernel: [57698.603590] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:39:57 myhost kernel: [57698.603659]
Apr 15 11:39:57 myhost kernel: [57698.603664] Pid: 21939, comm:
etracer Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be Filled By
O.E.M.
Apr 15 11:39:57 myhost kernel: [57698.603668] EIP: 0060:[<f82cce5b>]
EFLAGS: 00210282 CPU: 0
Apr 15 11:39:57 myhost kernel: [57698.603673] EIP is at
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603676] EAX: 00070001 EBX:
e671cb40 ECX: 00000000 EDX: 00000000
Apr 15 11:39:57 myhost kernel: [57698.603679] ESI: 00000000 EDI:
00000000 EBP: e5933b1c ESP: e5933aec
Apr 15 11:39:57 myhost kernel: [57698.603682]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:39:57 myhost kernel: [57698.603686] Process etracer (pid:
21939, ti=e5932000 task=ef4f2d60 task.ti=e5932000)
Apr 15 11:39:57 myhost kernel: [57698.603688] Stack:
Apr 15 11:39:57 myhost kernel: [57698.603690]  00000000 e5933b4c
e5933b04 00000000 01000000 e671cb9c 00000001 00000000
Apr 15 11:39:57 myhost kernel: [57698.603698] <0> 00000000 e671cb40
00000000 e671cb68 e5933b9c f82cea87 00000000 00000000
Apr 15 11:39:57 myhost kernel: [57698.603707] <0> 00000258 0016d7d8
00000258 e5933b5c 00000000 01933b6c f1a80128 e671cb50
Apr 15 11:39:57 myhost kernel: [57698.603717] Call Trace:
Apr 15 11:39:57 myhost kernel: [57698.603724]  [<f82cea87>] ?
ttm_mem_evict_first+0x137/0x4c0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603731]  [<f82ce489>] ?
ttm_bo_man_get_node+0xb9/0xc0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603737]  [<f82ce856>] ?
ttm_bo_mem_space+0x3c6/0x4c0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603744]  [<f82ceb17>] ?
ttm_mem_evict_first+0x1c7/0x4c0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603752]  [<c103405d>] ?
scheduler_tick+0xed/0x240
Apr 15 11:39:57 myhost kernel: [57698.603759]  [<f82ce856>] ?
ttm_bo_mem_space+0x3c6/0x4c0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603765]  [<f82cf2d3>] ?
ttm_bo_move_buffer+0xa3/0x110 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603771]  [<f82cf3ce>] ?
ttm_bo_validate+0x8e/0x120 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603777]  [<f82cf6b0>] ?
ttm_bo_init+0x250/0x2d0 [ttm]
Apr 15 11:39:57 myhost kernel: [57698.603783]  [<c10d5a49>] ?
kmem_cache_alloc_notrace+0x79/0xa0
Apr 15 11:39:57 myhost kernel: [57698.603796]  [<f84bf9e4>] ?
nouveau_bo_new+0x154/0x3d0 [nouveau]
Apr 15 11:39:57 myhost kernel: [57698.603805]  [<f84bfc60>] ?
nouveau_bo_del_ttm+0x0/0xb0 [nouveau]
Apr 15 11:39:57 myhost kernel: [57698.603814]  [<f84c17da>] ?
nouveau_gem_new+0x4a/0xc0 [nouveau]
Apr 15 11:39:57 myhost kernel: [57698.603824]  [<f84c198b>] ?
nouveau_gem_ioctl_new+0x13b/0x2f0 [nouveau]
Apr 15 11:39:57 myhost kernel: [57698.603834]  [<f8235454>] ?
drm_ioctl+0x264/0x3f0 [drm]
Apr 15 11:39:57 myhost kernel: [57698.603845]  [<f84c1850>] ?
nouveau_gem_ioctl_new+0x0/0x2f0 [nouveau]
Apr 15 11:39:57 myhost kernel: [57698.603851]  [<c10ae6da>] ?
__pagevec_free+0x3a/0xb0
Apr 15 11:39:57 myhost kernel: [57698.603855]  [<c10b1840>] ?
release_pages+0x160/0x1b0
Apr 15 11:39:57 myhost kernel: [57698.603860]  [<c10c875f>] ?
anon_vma_chain_free+0xf/0x20
Apr 15 11:39:57 myhost kernel: [57698.603866]  [<c10e94fd>] ?
vfs_ioctl+0x2d/0xb0
Apr 15 11:39:57 myhost kernel: [57698.603873]  [<f82351f0>] ?
drm_ioctl+0x0/0x3f0 [drm]
Apr 15 11:39:57 myhost kernel: [57698.603880]  [<c10e96cc>] ?
do_vfs_ioctl+0x6c/0x580
Apr 15 11:39:57 myhost kernel: [57698.603886]  [<c10cc2c5>] ?
free_pages_and_swap_cache+0x85/0xa0
Apr 15 11:39:57 myhost kernel: [57698.603890]  [<c10c41fa>] ?
remove_vma+0x3a/0x50
Apr 15 11:39:57 myhost kernel: [57698.603894]  [<c10c41fa>] ?
remove_vma+0x3a/0x50
Apr 15 11:39:57 myhost kernel: [57698.603897]  [<c10c51da>] ?
do_munmap+0x20a/0x2d0
Apr 15 11:39:57 myhost kernel: [57698.603902]  [<c10e9c3f>] ?
sys_ioctl+0x5f/0x80
Apr 15 11:39:57 myhost kernel: [57698.603907]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:39:57 myhost kernel: [57698.603910] Code: c3 0f 0b eb fe 0f
0b eb fe 8d b4 26 00 00 00 00 55 89 e5 83 ec 30 89 5d f4 89 c3 89 7d
fc 0f b6 7d 08 89 75 f8 88 4d dc 8b 40 04 <8b> 70 0c 8b 83 8c 00 00 00
85 c0 75 11 31 d2 8b 5d f4 89 d0 8b
Apr 15 11:39:57 myhost kernel: [57698.603961] EIP: [<f82cce5b>]
ttm_bo_wait+0x1b/0x180 [ttm] SS:ESP 0068:e5933aec
Apr 15 11:39:57 myhost kernel: [57698.603969] CR2: 000000000007000d
Apr 15 11:39:57 myhost kernel: [57698.604021] ---[ end trace
66bbdca73e702082 ]---
Apr 15 11:39:57 myhost kernel: [57698.604029] note: etracer[21939]
exited with preempt_count 2
Apr 15 11:40:13 myhost kernel: [57714.260345] BUG: unable to handle
kernel paging request at 0007000d
Apr 15 11:40:13 myhost kernel: [57714.260358] IP: [<f82cce5b>]
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260377] *pde = 00000000
Apr 15 11:40:13 myhost kernel: [57714.260382] Oops: 0000 [#3] PREEMPT SMP
Apr 15 11:40:13 myhost kernel: [57714.260388] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:13 myhost kernel: [57714.260395] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:13 myhost kernel: [57714.260492]
Apr 15 11:40:13 myhost kernel: [57714.260499] Pid: 4546, comm: X
Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be Filled By O.E.M.
Apr 15 11:40:13 myhost kernel: [57714.260504] EIP: 0060:[<f82cce5b>]
EFLAGS: 00213286 CPU: 1
Apr 15 11:40:13 myhost kernel: [57714.260513] EIP is at
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260518] EAX: 00070001 EBX:
f186ac00 ECX: 00000000 EDX: 00000000
Apr 15 11:40:13 myhost kernel: [57714.260523] ESI: 00000000 EDI:
00000000 EBP: f68a9c20 ESP: f68a9bf0
Apr 15 11:40:13 myhost kernel: [57714.260528]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:13 myhost kernel: [57714.260534] Process X (pid: 4546,
ti=f68a8000 task=f68479c0 task.ti=f68a8000)
Apr 15 11:40:13 myhost kernel: [57714.260538] Stack:
Apr 15 11:40:13 myhost kernel: [57714.260541]  00000000 00000000
00000000 00000000 0186a780 f186ac5c 00000001 00000000
Apr 15 11:40:13 myhost kernel: [57714.260553] <0> 00000000 f186ac00
00000000 f186ac28 f68a9ca0 f82cea87 00000000 00000000
Apr 15 11:40:13 myhost kernel: [57714.260566] <0> 00000000 f68a9c3c
f68a9cec d5efb234 00000000 018a9c70 f1a80128 f186ac10
Apr 15 11:40:13 myhost kernel: [57714.260580] Call Trace:
Apr 15 11:40:13 myhost kernel: [57714.260592]  [<f82cea87>] ?
ttm_mem_evict_first+0x137/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260604]  [<f82ce489>] ?
ttm_bo_man_get_node+0xb9/0xc0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260614]  [<f82ce856>] ?
ttm_bo_mem_space+0x3c6/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260625]  [<f82cf2d3>] ?
ttm_bo_move_buffer+0xa3/0x110 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260635]  [<f82cf3ce>] ?
ttm_bo_validate+0x8e/0x120 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.260652]  [<f84c05c9>] ?
validate_list+0xb9/0x2b0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.260668]  [<f84c0eb4>] ?
nouveau_gem_ioctl_pushbuf+0x5d4/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.260685]  [<f8235454>] ?
drm_ioctl+0x264/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.260701]  [<f84c08e0>] ?
nouveau_gem_ioctl_pushbuf+0x0/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.260715]  [<c10bef1b>] ?
__do_fault+0x3b/0x4f0
Apr 15 11:40:13 myhost kernel: [57714.260724]  [<c10e94fd>] ?
vfs_ioctl+0x2d/0xb0
Apr 15 11:40:13 myhost kernel: [57714.260736]  [<f82351f0>] ?
drm_ioctl+0x0/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.260743]  [<c10e96cc>] ?
do_vfs_ioctl+0x6c/0x580
Apr 15 11:40:13 myhost kernel: [57714.260751]  [<c10c01aa>] ?
handle_mm_fault+0xfa/0x820
Apr 15 11:40:13 myhost kernel: [57714.260759]  [<c1041063>] ?
do_setitimer+0x153/0x1f0
Apr 15 11:40:13 myhost kernel: [57714.260768]  [<c1026cfb>] ?
do_page_fault+0x16b/0x330
Apr 15 11:40:13 myhost kernel: [57714.260775]  [<c10e9c3f>] ?
sys_ioctl+0x5f/0x80
Apr 15 11:40:13 myhost kernel: [57714.260783]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:13 myhost kernel: [57714.260787] Code: c3 0f 0b eb fe 0f
0b eb fe 8d b4 26 00 00 00 00 55 89 e5 83 ec 30 89 5d f4 89 c3 89 7d
fc 0f b6 7d 08 89 75 f8 88 4d dc 8b 40 04 <8b> 70 0c 8b 83 8c 00 00 00
85 c0 75 11 31 d2 8b 5d f4 89 d0 8b
Apr 15 11:40:13 myhost kernel: [57714.260855] EIP: [<f82cce5b>]
ttm_bo_wait+0x1b/0x180 [ttm] SS:ESP 0068:f68a9bf0
Apr 15 11:40:13 myhost kernel: [57714.260868] CR2: 000000000007000d
Apr 15 11:40:13 myhost kernel: [57714.260875] ---[ end trace
66bbdca73e702083 ]---
Apr 15 11:40:13 myhost kernel: [57714.260905] note: X[4546] exited
with preempt_count 2
Apr 15 11:40:13 myhost kernel: [57714.261273] BUG: scheduling while
atomic: X/4546/0x10000002
Apr 15 11:40:13 myhost kernel: [57714.261277] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:13 myhost kernel: [57714.261374] Pid: 4546, comm: X
Tainted: G      D    2.6.34-rc3 #16
Apr 15 11:40:13 myhost kernel: [57714.261378] Call Trace:
Apr 15 11:40:13 myhost kernel: [57714.261390]  [<c103332d>]
__schedule_bug+0x5d/0x70
Apr 15 11:40:13 myhost kernel: [57714.261400]  [<c1322406>] schedule+0x526/0x700
Apr 15 11:40:13 myhost kernel: [57714.261408]  [<c105e3c4>] ?
sched_clock_local+0xa4/0x180
Apr 15 11:40:13 myhost kernel: [57714.261417]  [<c10cc2c5>] ?
free_pages_and_swap_cache+0x85/0xa0
Apr 15 11:40:13 myhost kernel: [57714.261423]  [<c132270d>]
_cond_resched+0x2d/0x50
Apr 15 11:40:13 myhost kernel: [57714.261431]  [<c10c2270>]
unmap_vmas+0x580/0x6d0
Apr 15 11:40:13 myhost kernel: [57714.261439]  [<c10c42ab>] exit_mmap+0x9b/0x160
Apr 15 11:40:13 myhost kernel: [57714.261446]  [<c103a853>] mmput+0x33/0xd0
Apr 15 11:40:13 myhost kernel: [57714.261453]  [<c103ea68>] exit_mm+0xd8/0x100
Apr 15 11:40:13 myhost kernel: [57714.261459]  [<c104053e>] do_exit+0x11e/0x740
Apr 15 11:40:13 myhost kernel: [57714.261466]  [<c103db09>] ?
kmsg_dump+0x119/0x130
Apr 15 11:40:13 myhost kernel: [57714.261474]  [<c1006fcb>] oops_end+0x8b/0xd0
Apr 15 11:40:13 myhost kernel: [57714.261481]  [<c102682e>]
no_context+0xbe/0x150
Apr 15 11:40:13 myhost kernel: [57714.261488]  [<c1026950>]
__bad_area_nosemaphore+0x90/0x130
Apr 15 11:40:13 myhost kernel: [57714.261496]  [<c129678f>] ?
pci_write+0x2f/0x40
Apr 15 11:40:13 myhost kernel: [57714.261503]  [<c1026a02>]
bad_area_nosemaphore+0x12/0x20
Apr 15 11:40:13 myhost kernel: [57714.261510]  [<c1026e0b>]
do_page_fault+0x27b/0x330
Apr 15 11:40:13 myhost kernel: [57714.261524]  [<f8312362>] ?
intel_8xx_tlbflush+0x82/0x90 [intel_agp]
Apr 15 11:40:13 myhost kernel: [57714.261532]  [<c1026b90>] ?
do_page_fault+0x0/0x330
Apr 15 11:40:13 myhost kernel: [57714.261539]  [<c132508b>] error_code+0x73/0x78
Apr 15 11:40:13 myhost kernel: [57714.261551]  [<f82cce5b>] ?
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261563]  [<f82cea87>]
ttm_mem_evict_first+0x137/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261574]  [<f82ce489>] ?
ttm_bo_man_get_node+0xb9/0xc0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261585]  [<f82ce856>]
ttm_bo_mem_space+0x3c6/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261596]  [<f82cf2d3>]
ttm_bo_move_buffer+0xa3/0x110 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261607]  [<f82cf3ce>]
ttm_bo_validate+0x8e/0x120 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.261624]  [<f84c05c9>]
validate_list+0xb9/0x2b0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.261640]  [<f84c0eb4>]
nouveau_gem_ioctl_pushbuf+0x5d4/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.261656]  [<f8235454>]
drm_ioctl+0x264/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.261673]  [<f84c08e0>] ?
nouveau_gem_ioctl_pushbuf+0x0/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.261683]  [<c10bef1b>] ?
__do_fault+0x3b/0x4f0
Apr 15 11:40:13 myhost kernel: [57714.261691]  [<c10e94fd>] vfs_ioctl+0x2d/0xb0
Apr 15 11:40:13 myhost kernel: [57714.261704]  [<f82351f0>] ?
drm_ioctl+0x0/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.261712]  [<c10e96cc>]
do_vfs_ioctl+0x6c/0x580
Apr 15 11:40:13 myhost kernel: [57714.261718]  [<c10c01aa>] ?
handle_mm_fault+0xfa/0x820
Apr 15 11:40:13 myhost kernel: [57714.261725]  [<c1041063>] ?
do_setitimer+0x153/0x1f0
Apr 15 11:40:13 myhost kernel: [57714.261732]  [<c1026cfb>] ?
do_page_fault+0x16b/0x330
Apr 15 11:40:13 myhost kernel: [57714.261738]  [<c10e9c3f>] sys_ioctl+0x5f/0x80
Apr 15 11:40:13 myhost kernel: [57714.261746]  [<c100389f>]
sysenter_do_call+0x12/0x28
Apr 15 11:40:13 myhost kernel: [57714.275261] BUG: scheduling while
atomic: X/4546/0x00000002
Apr 15 11:40:13 myhost kernel: [57714.275269] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:13 myhost kernel: [57714.275371] Pid: 4546, comm: X
Tainted: G      D    2.6.34-rc3 #16
Apr 15 11:40:13 myhost kernel: [57714.275375] Call Trace:
Apr 15 11:40:13 myhost kernel: [57714.275391]  [<c103332d>]
__schedule_bug+0x5d/0x70
Apr 15 11:40:13 myhost kernel: [57714.275402]  [<c1322406>] schedule+0x526/0x700
Apr 15 11:40:13 myhost kernel: [57714.275410]  [<c1324e19>] ?
apic_timer_interrupt+0x31/0x38
Apr 15 11:40:13 myhost kernel: [57714.275417]  [<c1322f20>]
__mutex_lock_slowpath+0xe0/0x170
Apr 15 11:40:13 myhost kernel: [57714.275423]  [<c1322d79>] mutex_lock+0x19/0x30
Apr 15 11:40:13 myhost kernel: [57714.275438]  [<f823adb9>]
drm_vm_shm_close+0x69/0x200 [drm]
Apr 15 11:40:13 myhost kernel: [57714.275449]  [<c10c41fa>] ?
remove_vma+0x3a/0x50
Apr 15 11:40:13 myhost kernel: [57714.275456]  [<c10c41dc>] remove_vma+0x1c/0x50
Apr 15 11:40:13 myhost kernel: [57714.275462]  [<c10c42ff>] exit_mmap+0xef/0x160
Apr 15 11:40:13 myhost kernel: [57714.275468]  [<c103a853>] mmput+0x33/0xd0
Apr 15 11:40:13 myhost kernel: [57714.275475]  [<c103ea68>] exit_mm+0xd8/0x100
Apr 15 11:40:13 myhost kernel: [57714.275481]  [<c104053e>] do_exit+0x11e/0x740
Apr 15 11:40:13 myhost kernel: [57714.275487]  [<c103db09>] ?
kmsg_dump+0x119/0x130
Apr 15 11:40:13 myhost kernel: [57714.275496]  [<c1006fcb>] oops_end+0x8b/0xd0
Apr 15 11:40:13 myhost kernel: [57714.275504]  [<c102682e>]
no_context+0xbe/0x150
Apr 15 11:40:13 myhost kernel: [57714.275512]  [<c1026950>]
__bad_area_nosemaphore+0x90/0x130
Apr 15 11:40:13 myhost kernel: [57714.275520]  [<c129678f>] ?
pci_write+0x2f/0x40
Apr 15 11:40:13 myhost kernel: [57714.275526]  [<c1026a02>]
bad_area_nosemaphore+0x12/0x20
Apr 15 11:40:13 myhost kernel: [57714.275532]  [<c1026e0b>]
do_page_fault+0x27b/0x330
Apr 15 11:40:13 myhost kernel: [57714.275545]  [<f8312362>] ?
intel_8xx_tlbflush+0x82/0x90 [intel_agp]
Apr 15 11:40:13 myhost kernel: [57714.275553]  [<c1026b90>] ?
do_page_fault+0x0/0x330
Apr 15 11:40:13 myhost kernel: [57714.275560]  [<c132508b>] error_code+0x73/0x78
Apr 15 11:40:13 myhost kernel: [57714.275572]  [<f82cce5b>] ?
ttm_bo_wait+0x1b/0x180 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275581]  [<f82cea87>]
ttm_mem_evict_first+0x137/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275591]  [<f82ce489>] ?
ttm_bo_man_get_node+0xb9/0xc0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275601]  [<f82ce856>]
ttm_bo_mem_space+0x3c6/0x4c0 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275614]  [<f82cf2d3>]
ttm_bo_move_buffer+0xa3/0x110 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275624]  [<f82cf3ce>]
ttm_bo_validate+0x8e/0x120 [ttm]
Apr 15 11:40:13 myhost kernel: [57714.275640]  [<f84c05c9>]
validate_list+0xb9/0x2b0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.275657]  [<f84c0eb4>]
nouveau_gem_ioctl_pushbuf+0x5d4/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.275671]  [<f8235454>]
drm_ioctl+0x264/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.275688]  [<f84c08e0>] ?
nouveau_gem_ioctl_pushbuf+0x0/0xeb0 [nouveau]
Apr 15 11:40:13 myhost kernel: [57714.275701]  [<c10bef1b>] ?
__do_fault+0x3b/0x4f0
Apr 15 11:40:13 myhost kernel: [57714.275709]  [<c10e94fd>] vfs_ioctl+0x2d/0xb0
Apr 15 11:40:13 myhost kernel: [57714.275720]  [<f82351f0>] ?
drm_ioctl+0x0/0x3f0 [drm]
Apr 15 11:40:13 myhost kernel: [57714.275726]  [<c10e96cc>]
do_vfs_ioctl+0x6c/0x580
Apr 15 11:40:13 myhost kernel: [57714.275734]  [<c10c01aa>] ?
handle_mm_fault+0xfa/0x820
Apr 15 11:40:13 myhost kernel: [57714.275741]  [<c1041063>] ?
do_setitimer+0x153/0x1f0
Apr 15 11:40:13 myhost kernel: [57714.275748]  [<c1026cfb>] ?
do_page_fault+0x16b/0x330
Apr 15 11:40:13 myhost kernel: [57714.275755]  [<c10e9c3f>] sys_ioctl+0x5f/0x80
Apr 15 11:40:13 myhost kernel: [57714.275762]  [<c100389f>]
sysenter_do_call+0x12/0x28
Apr 15 11:40:13 myhost kernel: [57714.602557] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:13 myhost kernel: [57714.602566] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:13 myhost kernel: [57714.602578] *pde = 00000000
Apr 15 11:40:13 myhost kernel: [57714.602581] Oops: 0000 [#4] PREEMPT SMP
Apr 15 11:40:13 myhost kernel: [57714.602586] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:13 myhost kernel: [57714.602590] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:13 myhost kernel: [57714.602659]
Apr 15 11:40:13 myhost kernel: [57714.602664] Pid: 4711, comm:
multiload-apple Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be
Filled By O.E.M.
Apr 15 11:40:13 myhost kernel: [57714.602668] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 0
Apr 15 11:40:13 myhost kernel: [57714.602672] EIP is at groups_search+0x46/0x70
Apr 15 11:40:13 myhost kernel: [57714.602675] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:13 myhost kernel: [57714.602678] ESI: 00000000 EDI:
00000000 EBP: ef623e3c ESP: ef623e28
Apr 15 11:40:13 myhost kernel: [57714.602681]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:13 myhost kernel: [57714.602684] Process multiload-apple
(pid: 4711, ti=ef622000 task=ef41b9c0 task.ti=ef622000)
Apr 15 11:40:13 myhost kernel: [57714.602687] Stack:
Apr 15 11:40:13 myhost kernel: [57714.602689]  00000000 f6528840
f6da4300 000041ed 00000001 ef623e44 c10600a5 ef623e58
Apr 15 11:40:13 myhost kernel: [57714.602697] <0> c10e4308 f6da4300
ef623ef4 f6da4300 ef623e68 c10e43b7 ef7d1001 ef623ef4
Apr 15 11:40:13 myhost kernel: [57714.602706] <0> ef623eb4 c10e678f
ef623ea4 f0eee600 ef41b9c0 ef41b9c0 ef41b9c0 00000010
Apr 15 11:40:13 myhost kernel: [57714.602716] Call Trace:
Apr 15 11:40:13 myhost kernel: [57714.602722]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:13 myhost kernel: [57714.602727]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:13 myhost kernel: [57714.602732]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:13 myhost kernel: [57714.602736]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:13 myhost kernel: [57714.602740]  [<c10e606d>] ?
path_init+0xcd/0x1b0
Apr 15 11:40:13 myhost kernel: [57714.602744]  [<c10e8092>] ?
do_filp_open+0xe2/0x500
Apr 15 11:40:13 myhost kernel: [57714.602749]  [<c10dbb6c>] ?
do_sync_read+0x9c/0xd0
Apr 15 11:40:13 myhost kernel: [57714.602756]  [<c10f1726>] ?
alloc_fd+0xc6/0x100
Apr 15 11:40:13 myhost kernel: [57714.602760]  [<c10d9eaf>] ?
do_sys_open+0x4f/0x110
Apr 15 11:40:13 myhost kernel: [57714.602764]  [<c10d9fd9>] ? sys_open+0x29/0x40
Apr 15 11:40:13 myhost kernel: [57714.602770]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:13 myhost kernel: [57714.602772] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:13 myhost kernel: [57714.602821] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef623e28
Apr 15 11:40:13 myhost kernel: [57714.602827] CR2: 0000000000000000
Apr 15 11:40:13 myhost kernel: [57714.602831] ---[ end trace
66bbdca73e702084 ]---
Apr 15 11:40:13 myhost kernel: [57714.604508] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:13 myhost kernel: [57714.604519] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:13 myhost kernel: [57714.604533] *pde = 00000000
Apr 15 11:40:13 myhost kernel: [57714.604538] Oops: 0000 [#5] PREEMPT SMP
Apr 15 11:40:13 myhost kernel: [57714.604545] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:13 myhost kernel: [57714.604552] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:13 myhost kernel: [57714.604645]
Apr 15 11:40:13 myhost kernel: [57714.604652] Pid: 4684, comm:
bonobo-activati Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be
Filled By O.E.M.
Apr 15 11:40:13 myhost kernel: [57714.604658] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 1
Apr 15 11:40:13 myhost kernel: [57714.604664] EIP is at groups_search+0x46/0x70
Apr 15 11:40:13 myhost kernel: [57714.604668] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:13 myhost kernel: [57714.604673] ESI: 00000000 EDI:
00000000 EBP: ef53bd44 ESP: ef53bd30
Apr 15 11:40:13 myhost kernel: [57714.604678]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:13 myhost kernel: [57714.604684] Process bonobo-activati
(pid: 4684, ti=ef53a000 task=efbe8420 task.ti=ef53a000)
Apr 15 11:40:13 myhost kernel: [57714.604688] Stack:
Apr 15 11:40:13 myhost kernel: [57714.604692]  00000000 f6528840
f6da4300 000041ed 00000001 ef53bd4c c10600a5 ef53bd60
Apr 15 11:40:13 myhost kernel: [57714.604703] <0> c10e4308 f6da4300
ef53bdfc f6da4300 ef53bd70 c10e43b7 ef53bedb ef53bdfc
Apr 15 11:40:13 myhost kernel: [57714.604716] <0> ef53bdbc c10e678f
00000000 00000286 efbe8420 efbe8420 efbe8420 00000001
Apr 15 11:40:13 myhost kernel: [57714.604730] Call Trace:
Apr 15 11:40:13 myhost kernel: [57714.604739]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:13 myhost kernel: [57714.604749]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:13 myhost kernel: [57714.604756]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:13 myhost kernel: [57714.604764]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:13 myhost kernel: [57714.604776]  [<c1306de7>] ?
unix_stream_recvmsg+0x227/0x540
Apr 15 11:40:13 myhost kernel: [57714.604784]  [<c10e720c>] ?
path_walk+0x4c/0xc0
Apr 15 11:40:13 myhost kernel: [57714.604791]  [<c10e72d1>] ?
do_path_lookup+0x51/0x90
Apr 15 11:40:13 myhost kernel: [57714.604798]  [<c10e732d>] ?
kern_path+0x1d/0x40
Apr 15 11:40:13 myhost kernel: [57714.604807]  [<c12a05f9>] ?
__alloc_skb+0x29/0x130
Apr 15 11:40:13 myhost kernel: [57714.604815]  [<c129bac3>] ?
sock_wmalloc+0x43/0x70
Apr 15 11:40:13 myhost kernel: [57714.604822]  [<c12a0619>] ?
__alloc_skb+0x49/0x130
Apr 15 11:40:13 myhost kernel: [57714.604830]  [<c1307f09>] ? T.940+0x29/0x1f0
Apr 15 11:40:13 myhost kernel: [57714.604837]  [<c129bac3>] ?
sock_wmalloc+0x43/0x70
Apr 15 11:40:13 myhost kernel: [57714.604844]  [<c1308190>] ?
unix_stream_connect+0xc0/0x3f0
Apr 15 11:40:13 myhost kernel: [57714.604852]  [<c129a36e>] ?
sys_connect+0xae/0xd0
Apr 15 11:40:13 myhost kernel: [57714.604859]  [<c1298803>] ?
sock_alloc_file+0x93/0x100
Apr 15 11:40:13 myhost kernel: [57714.604867]  [<c10d9cba>] ?
fd_install+0x4a/0x60
Apr 15 11:40:13 myhost kernel: [57714.604873]  [<c129888f>] ?
sock_map_fd+0x1f/0x30
Apr 15 11:40:13 myhost kernel: [57714.604878]  [<c1299364>] ?
sys_socket+0x54/0x70
Apr 15 11:40:13 myhost kernel: [57714.604885]  [<c129a6c0>] ?
sys_socketcall+0x270/0x2a0
Apr 15 11:40:13 myhost kernel: [57714.604892]  [<c10e91c5>] ?
sys_fcntl64+0x65/0xc0
Apr 15 11:40:13 myhost kernel: [57714.604901]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:13 myhost kernel: [57714.604904] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:13 myhost kernel: [57714.604971] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef53bd30
Apr 15 11:40:13 myhost kernel: [57714.604981] CR2: 0000000000000000
Apr 15 11:40:13 myhost kernel: [57714.605010] ---[ end trace
66bbdca73e702085 ]---
Apr 15 11:40:14 myhost kernel: [57715.086960] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:14 myhost kernel: [57715.086968] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:14 myhost kernel: [57715.086979] *pde = 00000000
Apr 15 11:40:14 myhost kernel: [57715.086983] Oops: 0000 [#6] PREEMPT SMP
Apr 15 11:40:14 myhost kernel: [57715.086988] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:14 myhost kernel: [57715.086991] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:14 myhost kernel: [57715.087058]
Apr 15 11:40:14 myhost kernel: [57715.087064] Pid: 4709, comm:
cpufreq-applet Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be
Filled By O.E.M.
Apr 15 11:40:14 myhost kernel: [57715.087069] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 1
Apr 15 11:40:14 myhost kernel: [57715.087072] EIP is at groups_search+0x46/0x70
Apr 15 11:40:14 myhost kernel: [57715.087075] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:14 myhost kernel: [57715.087078] ESI: 00000000 EDI:
00000000 EBP: ef621e3c ESP: ef621e28
Apr 15 11:40:14 myhost kernel: [57715.087081]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:14 myhost kernel: [57715.087084] Process cpufreq-applet
(pid: 4709, ti=ef620000 task=ef595080 task.ti=ef620000)
Apr 15 11:40:14 myhost kernel: [57715.087087] Stack:
Apr 15 11:40:14 myhost kernel: [57715.087088]  00000000 f6528840
f6da4300 000041ed 00000001 ef621e44 c10600a5 ef621e58
Apr 15 11:40:14 myhost kernel: [57715.087097] <0> c10e4308 f6da4300
ef621ef4 f6da4300 ef621e68 c10e43b7 e8372001 ef621ef4
Apr 15 11:40:14 myhost kernel: [57715.087106] <0> ef621eb4 c10e678f
ef621ea4 f0eed600 ef595080 ef595080 ef595080 00000010
Apr 15 11:40:14 myhost kernel: [57715.087116] Call Trace:
Apr 15 11:40:14 myhost kernel: [57715.087121]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:14 myhost kernel: [57715.087126]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:14 myhost kernel: [57715.087130]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:14 myhost kernel: [57715.087134]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:14 myhost kernel: [57715.087139]  [<c10e606d>] ?
path_init+0xcd/0x1b0
Apr 15 11:40:14 myhost kernel: [57715.087143]  [<c10e8092>] ?
do_filp_open+0xe2/0x500
Apr 15 11:40:14 myhost kernel: [57715.087147]  [<c10dbb6c>] ?
do_sync_read+0x9c/0xd0
Apr 15 11:40:14 myhost kernel: [57715.087153]  [<c10f1726>] ?
alloc_fd+0xc6/0x100
Apr 15 11:40:14 myhost kernel: [57715.087158]  [<c10d9eaf>] ?
do_sys_open+0x4f/0x110
Apr 15 11:40:14 myhost kernel: [57715.087162]  [<c1062bf1>] ?
do_gettimeofday+0x11/0x40
Apr 15 11:40:14 myhost kernel: [57715.087166]  [<c10d9fd9>] ? sys_open+0x29/0x40
Apr 15 11:40:14 myhost kernel: [57715.087171]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:14 myhost kernel: [57715.087174] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:14 myhost kernel: [57715.087223] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef621e28
Apr 15 11:40:14 myhost kernel: [57715.087229] CR2: 0000000000000000
Apr 15 11:40:14 myhost kernel: [57715.087233] ---[ end trace
66bbdca73e702086 ]---
Apr 15 11:40:15 myhost kernel: [57716.088061] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:15 myhost kernel: [57716.088070] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.088081] *pde = 00000000
Apr 15 11:40:15 myhost kernel: [57716.088084] Oops: 0000 [#7] PREEMPT SMP
Apr 15 11:40:15 myhost kernel: [57716.088089] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:15 myhost kernel: [57716.088093] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:15 myhost kernel: [57716.088161]
Apr 15 11:40:15 myhost kernel: [57716.088166] Pid: 4706, comm:
sensors-applet Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be
Filled By O.E.M.
Apr 15 11:40:15 myhost kernel: [57716.088170] EIP: 0060:[<c1060056>]
EFLAGS: 00210246 CPU: 0
Apr 15 11:40:15 myhost kernel: [57716.088173] EIP is at groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.088176] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:15 myhost kernel: [57716.088179] ESI: 00000000 EDI:
00000000 EBP: ef5f9e3c ESP: ef5f9e28
Apr 15 11:40:15 myhost kernel: [57716.088182]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:15 myhost kernel: [57716.088185] Process sensors-applet
(pid: 4706, ti=ef5f8000 task=ef593180 task.ti=ef5f8000)
Apr 15 11:40:15 myhost kernel: [57716.088188] Stack:
Apr 15 11:40:15 myhost kernel: [57716.088190]  00000000 f6528840
f6da4300 000041ed 00000001 ef5f9e44 c10600a5 ef5f9e58
Apr 15 11:40:15 myhost kernel: [57716.088198] <0> c10e4308 f6da4300
ef5f9ef4 f6da4300 ef5f9e68 c10e43b7 ef7d3001 ef5f9ef4
Apr 15 11:40:15 myhost kernel: [57716.088206] <0> ef5f9eb4 c10e678f
696411b9 ef5f9ea0 ef593180 ef593180 ef593180 00000010
Apr 15 11:40:15 myhost kernel: [57716.088216] Call Trace:
Apr 15 11:40:15 myhost kernel: [57716.088221]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:15 myhost kernel: [57716.088227]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:15 myhost kernel: [57716.088231]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:15 myhost kernel: [57716.088235]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:15 myhost kernel: [57716.088240]  [<c10e606d>] ?
path_init+0xcd/0x1b0
Apr 15 11:40:15 myhost kernel: [57716.088244]  [<c10e8092>] ?
do_filp_open+0xe2/0x500
Apr 15 11:40:15 myhost kernel: [57716.088250]  [<c101c0e6>] ?
lapic_next_event+0x16/0x20
Apr 15 11:40:15 myhost kernel: [57716.088259]  [<c10676b2>] ?
tick_dev_program_event+0x42/0x150
Apr 15 11:40:15 myhost kernel: [57716.088266]  [<c10f1726>] ?
alloc_fd+0xc6/0x100
Apr 15 11:40:15 myhost kernel: [57716.088271]  [<c10d9eaf>] ?
do_sys_open+0x4f/0x110
Apr 15 11:40:15 myhost kernel: [57716.088275]  [<c10d9fd9>] ? sys_open+0x29/0x40
Apr 15 11:40:15 myhost kernel: [57716.088280]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:15 myhost kernel: [57716.088283] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:15 myhost kernel: [57716.088331] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef5f9e28
Apr 15 11:40:15 myhost kernel: [57716.088336] CR2: 0000000000000000
Apr 15 11:40:15 myhost kernel: [57716.088341] ---[ end trace
66bbdca73e702087 ]---
Apr 15 11:40:15 myhost kernel: [57716.090282] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:15 myhost kernel: [57716.090297] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.090312] *pde = 00000000
Apr 15 11:40:15 myhost kernel: [57716.090318] Oops: 0000 [#8] PREEMPT SMP
Apr 15 11:40:15 myhost kernel: [57716.090325] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:15 myhost kernel: [57716.090331] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:15 myhost kernel: [57716.090426]
Apr 15 11:40:15 myhost kernel: [57716.090434] Pid: 4682, comm:
nautilus Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be Filled By
O.E.M.
Apr 15 11:40:15 myhost kernel: [57716.090439] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 0
Apr 15 11:40:15 myhost kernel: [57716.090445] EIP is at groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.090449] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:15 myhost kernel: [57716.090453] ESI: 00000000 EDI:
00000000 EBP: ef51be48 ESP: ef51be34
Apr 15 11:40:15 myhost kernel: [57716.090458]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:15 myhost kernel: [57716.090463] Process nautilus (pid:
4682, ti=ef51a000 task=ef4f1080 task.ti=ef51a000)
Apr 15 11:40:15 myhost kernel: [57716.090466] Stack:
Apr 15 11:40:15 myhost kernel: [57716.090469]  00000000 f6528840
f6da4300 000041ed 00000001 ef51be50 c10600a5 ef51be64
Apr 15 11:40:15 myhost kernel: [57716.090481] <0> c10e4308 f6da4300
ef51bf00 f6da4300 ef51be74 c10e43b7 ef7d6001 ef51bf00
Apr 15 11:40:15 myhost kernel: [57716.090493] <0> ef51bec0 c10e678f
0000000f 00000004 ef4f1080 ef4f1080 ef4f1080 00000003
Apr 15 11:40:15 myhost kernel: [57716.090506] Call Trace:
Apr 15 11:40:15 myhost kernel: [57716.090515]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:15 myhost kernel: [57716.090524]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:15 myhost kernel: [57716.090531]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:15 myhost kernel: [57716.090537]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:15 myhost kernel: [57716.090545]  [<c10e720c>] ?
path_walk+0x4c/0xc0
Apr 15 11:40:15 myhost kernel: [57716.090552]  [<c10e72d1>] ?
do_path_lookup+0x51/0x90
Apr 15 11:40:15 myhost kernel: [57716.090558]  [<c10e7d6c>] ?
user_path_at+0x3c/0x70
Apr 15 11:40:15 myhost kernel: [57716.090567]  [<c118da7f>] ?
security_file_permission+0xf/0x20
Apr 15 11:40:15 myhost kernel: [57716.090575]  [<c10dbbfd>] ?
rw_verify_area+0x5d/0xd0
Apr 15 11:40:15 myhost kernel: [57716.090584]  [<c1042d77>] ?
__do_softirq+0xe7/0x200
Apr 15 11:40:15 myhost kernel: [57716.090592]  [<c106295b>] ?
ktime_get_ts+0xdb/0x110
Apr 15 11:40:15 myhost kernel: [57716.090601]  [<c110adde>] ?
sys_inotify_add_watch+0x5e/0x2f0
Apr 15 11:40:15 myhost kernel: [57716.090609]  [<c1041d21>] ?
sys_gettimeofday+0x31/0x70
Apr 15 11:40:15 myhost kernel: [57716.090617]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:15 myhost kernel: [57716.090621] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:15 myhost kernel: [57716.090691] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef51be34
Apr 15 11:40:15 myhost kernel: [57716.090700] CR2: 0000000000000000
Apr 15 11:40:15 myhost kernel: [57716.090705] ---[ end trace
66bbdca73e702088 ]---
Apr 15 11:40:15 myhost kernel: [57716.101900] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:15 myhost kernel: [57716.101913] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.101929] *pde = 00000000
Apr 15 11:40:15 myhost kernel: [57716.101935] Oops: 0000 [#9] PREEMPT SMP
Apr 15 11:40:15 myhost kernel: [57716.101942] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:15 myhost kernel: [57716.101948] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:15 myhost kernel: [57716.102007]
Apr 15 11:40:15 myhost kernel: [57716.102007] Pid: 21971, comm:
gnome-session Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be
Filled By O.E.M.
Apr 15 11:40:15 myhost kernel: [57716.102007] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 0
Apr 15 11:40:15 myhost kernel: [57716.102007] EIP is at groups_search+0x46/0x70
Apr 15 11:40:15 myhost kernel: [57716.102007] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:15 myhost kernel: [57716.102007] ESI: 00000000 EDI:
00000000 EBP: e8795e3c ESP: e8795e28
Apr 15 11:40:15 myhost kernel: [57716.102007]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:15 myhost kernel: [57716.102007] Process gnome-session
(pid: 21971, ti=e8794000 task=f64da520 task.ti=e8794000)
Apr 15 11:40:15 myhost kernel: [57716.102007] Stack:
Apr 15 11:40:15 myhost kernel: [57716.102007]  00000000 f6528840
f6da4300 000041ed 00000001 e8795e44 c10600a5 e8795e58
Apr 15 11:40:15 myhost kernel: [57716.102007] <0> c10e4308 f6da4300
e8795ef4 f6da4300 e8795e68 c10e43b7 e93b8001 e8795ef4
Apr 15 11:40:15 myhost kernel: [57716.102007] <0> e8795eb4 c10e678f
00000041 00000001 f64da520 f64da520 f64da520 00000010
Apr 15 11:40:15 myhost kernel: [57716.102007] Call Trace:
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10e606d>] ?
path_init+0xcd/0x1b0
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c11b148f>] ?
cpumask_any_but+0x1f/0x40
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10e8092>] ?
do_filp_open+0xe2/0x500
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10f1726>] ?
alloc_fd+0xc6/0x100
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10d9eaf>] ?
do_sys_open+0x4f/0x110
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c1026cfb>] ?
do_page_fault+0x16b/0x330
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c10d9fd9>] ? sys_open+0x29/0x40
Apr 15 11:40:15 myhost kernel: [57716.102007]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:15 myhost kernel: [57716.102007] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:15 myhost kernel: [57716.102007] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:e8795e28
Apr 15 11:40:15 myhost kernel: [57716.102007] CR2: 0000000000000000
Apr 15 11:40:15 myhost kernel: [57716.102339] ---[ end trace
66bbdca73e702089 ]---
Apr 15 11:40:35 myhost kernel: [57736.106379] BUG: unable to handle
kernel NULL pointer dereference at (null)
Apr 15 11:40:35 myhost kernel: [57736.106389] IP: [<c1060056>]
groups_search+0x46/0x70
Apr 15 11:40:35 myhost kernel: [57736.106401] *pde = 00000000
Apr 15 11:40:35 myhost kernel: [57736.106404] Oops: 0000 [#10] PREEMPT SMP
Apr 15 11:40:35 myhost kernel: [57736.106409] last sysfs file:
/sys/devices/platform/w83627hf.656/temp2_input
Apr 15 11:40:35 myhost kernel: [57736.106413] Modules linked in:
w83627hf hwmon_vid nfs lockd nfs_acl auth_rpcgss sunrpc fuse
snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq usbhid hid
snd_emu10k1 snd_pcm_oss snd_mixer_oss snd_rawmidi nouveau snd_intel8x0
snd_ac97_codec ac97_bus ttm snd_pcm snd_seq_device snd_util_mem
snd_timer drm_kms_helper ppdev snd_hwdep parport_pc i82875p_edac snd
drm edac_core i2c_algo_bit soundcore snd_page_alloc uhci_hcd
firewire_ohci emu10k1_gp i2c_i801 firewire_core crc_itu_t gameport
thermal e1000 processor button lp intel_agp ehci_hcd usbcore parport
i2c_core evdev agpgart iTCO_wdt iTCO_vendor_support shpchp pci_hotplug
rtc_cmos rtc_core rtc_lib dm_mirror dm_region_hash dm_log dm_mod
Apr 15 11:40:35 myhost kernel: [57736.106483]
Apr 15 11:40:35 myhost kernel: [57736.106489] Pid: 4635, comm:
gconfd-2 Tainted: G      D    2.6.34-rc3 #16 P4C800-E/To Be Filled By
O.E.M.
Apr 15 11:40:35 myhost kernel: [57736.106493] EIP: 0060:[<c1060056>]
EFLAGS: 00010246 CPU: 0
Apr 15 11:40:35 myhost kernel: [57736.106496] EIP is at groups_search+0x46/0x70
Apr 15 11:40:35 myhost kernel: [57736.106499] EAX: 00138000 EBX:
00270001 ECX: 00000000 EDX: 00000000
Apr 15 11:40:35 myhost kernel: [57736.106502] ESI: 00000000 EDI:
00000000 EBP: ef423d44 ESP: ef423d30
Apr 15 11:40:35 myhost kernel: [57736.106505]  DS: 007b ES: 007b FS:
00d8 GS: 00e0 SS: 0068
Apr 15 11:40:35 myhost kernel: [57736.106509] Process gconfd-2 (pid:
4635, ti=ef422000 task=ef41ad60 task.ti=ef422000)
Apr 15 11:40:35 myhost kernel: [57736.106511] Stack:
Apr 15 11:40:35 myhost kernel: [57736.106513]  00000000 f6528840
f6da4300 000041ed 00000001 ef423d4c c10600a5 ef423d60
Apr 15 11:40:35 myhost kernel: [57736.106521] <0> c10e4308 f6da4300
ef423dfc f6da4300 ef423d70 c10e43b7 ef423edb ef423dfc
Apr 15 11:40:35 myhost kernel: [57736.106530] <0> ef423dbc c10e678f
ef456d00 0000001b ef41ad60 ef41ad60 ef41ad60 00000001
Apr 15 11:40:35 myhost kernel: [57736.106540] Call Trace:
Apr 15 11:40:35 myhost kernel: [57736.106546]  [<c10600a5>] ?
in_group_p+0x25/0x30
Apr 15 11:40:35 myhost kernel: [57736.106551]  [<c10e4308>] ?
acl_permission_check+0x48/0xa0
Apr 15 11:40:35 myhost kernel: [57736.106556]  [<c10e43b7>] ?
exec_permission+0x57/0x80
Apr 15 11:40:35 myhost kernel: [57736.106560]  [<c10e678f>] ?
link_path_walk+0x5f/0x9b0
Apr 15 11:40:35 myhost kernel: [57736.106565]  [<c10ebdc0>] ? pollwake+0x0/0x60
Apr 15 11:40:35 myhost kernel: [57736.106569]  [<c10e720c>] ?
path_walk+0x4c/0xc0
Apr 15 11:40:35 myhost kernel: [57736.106573]  [<c10e72d1>] ?
do_path_lookup+0x51/0x90
Apr 15 11:40:35 myhost kernel: [57736.106577]  [<c10e732d>] ?
kern_path+0x1d/0x40
Apr 15 11:40:35 myhost kernel: [57736.106581]  [<c10ebdc0>] ? pollwake+0x0/0x60
Apr 15 11:40:35 myhost kernel: [57736.106587]  [<c118e5c0>] ?
security_sk_alloc+0x10/0x20
Apr 15 11:40:35 myhost kernel: [57736.106593]  [<c129bac3>] ?
sock_wmalloc+0x43/0x70
Apr 15 11:40:35 myhost kernel: [57736.106598]  [<c12a0619>] ?
__alloc_skb+0x49/0x130
Apr 15 11:40:35 myhost kernel: [57736.106604]  [<c1307f09>] ? T.940+0x29/0x1f0
Apr 15 11:40:35 myhost kernel: [57736.106608]  [<c129bac3>] ?
sock_wmalloc+0x43/0x70
Apr 15 11:40:35 myhost kernel: [57736.106613]  [<c1308190>] ?
unix_stream_connect+0xc0/0x3f0
Apr 15 11:40:35 myhost kernel: [57736.106617]  [<c129a36e>] ?
sys_connect+0xae/0xd0
Apr 15 11:40:35 myhost kernel: [57736.106622]  [<c1298803>] ?
sock_alloc_file+0x93/0x100
Apr 15 11:40:35 myhost kernel: [57736.106627]  [<c10d9cba>] ?
fd_install+0x4a/0x60
Apr 15 11:40:35 myhost kernel: [57736.106631]  [<c129888f>] ?
sock_map_fd+0x1f/0x30
Apr 15 11:40:35 myhost kernel: [57736.106635]  [<c1299364>] ?
sys_socket+0x54/0x70
Apr 15 11:40:35 myhost kernel: [57736.106639]  [<c129a6c0>] ?
sys_socketcall+0x270/0x2a0
Apr 15 11:40:35 myhost kernel: [57736.106643]  [<c10e91c5>] ?
sys_fcntl64+0x65/0xc0
Apr 15 11:40:35 myhost kernel: [57736.106649]  [<c100389f>] ?
sysenter_do_call+0x12/0x28
Apr 15 11:40:35 myhost kernel: [57736.106651] Code: ec eb 09 66 90 8d
48 01 39 cb 76 2f 8b 55 f0 8d 34 0b 89 f0 c1 ee 0b d1 e8 8b b4 b2 8c
00 00 00 89 c7 81 e7 ff 03 00 00 8b 55 ec <2b> 14 be 83 fa 00 7f d2 74
10 89 c3 39 cb 77 d1 83 c4 08 31 c0
Apr 15 11:40:35 myhost kernel: [57736.106701] EIP: [<c1060056>]
groups_search+0x46/0x70 SS:ESP 0068:ef423d30
Apr 15 11:40:35 myhost kernel: [57736.106707] CR2: 0000000000000000
Apr 15 11:40:35 myhost kernel: [57736.106711] ---[ end trace
66bbdca73e70208a ]---
Apr 15 11:40:43 myhost kernel: [57744.727821] SysRq : SAK
Apr 15 11:40:45 myhost kernel: [57746.230079] SysRq : Keyboard mode
set to system default
Apr 15 11:40:48 myhost kernel: [57749.211678] SysRq : SAK
Apr 15 11:40:49 myhost kernel: [57750.618024] SysRq : Keyboard mode
set to system default
