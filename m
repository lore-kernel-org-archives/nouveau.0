From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] NV31 lockup
Date: Fri, 23 Aug 2013 05:40:42 +0000
Message-ID: <bug-20341-8800-0uQDwx8K2U@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097620407=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1097620407==
Content-Type: multipart/alternative; boundary="1377236442.c6C3Df31.7936"; charset="us-ascii"


--1377236442.c6C3Df31.7936
Date: Fri, 23 Aug 2013 05:40:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---
           Priority|high                        |medium

--- Comment #13 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia, thanks for the ticket bump.

I pulled this machine out of storage to retest.  The entire graphics stack has
now been upgraded.
- Mesa 9.1.6
- Xorg server 1.13.4
- xf86-video-nouveau 1.0.9
- Linux 3.11-rc6

Nouveau now reports at bootup:
[    6.584942] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[    6.585121] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[    6.585212] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    6.587705] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.629569] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.629663] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    6.629755] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[    6.630214] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[    6.631927] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    6.632210] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    6.632340] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[    6.632429] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[    6.642148] [TTM] Zone  kernel: Available graphics memory: 93186 kiB
[    6.642277] [TTM] Initializing pool allocator
[    6.642535] nouveau  [     DRM] VRAM: 127 MiB
[    6.642661] nouveau  [     DRM] GART: 128 MiB
[    6.642752] nouveau  [     DRM] BMP version 5.39
[    6.642839] nouveau  [     DRM] DCB version 2.2
[    6.642928] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[    6.643043] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[    6.643132] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[    6.643220] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[    6.643663] nouveau  [     DRM] Loading NV17 power sequencing microcode
[    6.645661] nouveau  [     DRM] Saving VGA fonts
[    6.690672] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    6.690779] [drm] No driver support for vblank timestamp query.
[    6.690966] nouveau  [     DRM] 0xE176: Parsing digital output script table
[    6.691764] nouveau  [     DRM] 0 available performance level(s)
[    6.691859] nouveau  [     DRM] c: core 234MHz memory 501MHz voltage 1220mV
[    6.695827] nouveau  [     DRM] MM: using M2MF for buffer copies
[    6.696202] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    6.777513] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo cbb04600
[    6.777995] fbcon: nouveaufb (fb0) is primary device
[    6.794224] Console: switching to colour frame buffer device 240x75
[    6.798678] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.798701] nouveau 0000:01:00.0: registered panic notifier
[    6.798729] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0


I spent some time ensuring the Nvidia driver (173.14.18) tested earlier in the
ticket was completely removed.  glxinfo now yields
   direct rendering: Yes
   ...
   OpenGL vendor string: nouveau
   OpenGL renderer string: Gallium 0.4 on NV31
   OpenGL version string: 1.5 Mesa 9.1.6
as expected.

Nouveau's 3D engine seems to have no lockup problems.  I spent a few minutes
working my way through xscreensaver's GL modules with no catastrophic
consequences.  It appears only 2D acceleration has issues.

Running "x11perf -putimage500" still locks up the machine.  Symptoms aren't
exactly the same as earlier in the ticket, but the end result still is loss of
a usable UI.
1. X freezes.  Local input is dropped.  Mouse pointer freezes, keyboard lights
do not respond to toggles.
2. Machine is not completely frozen, SSH still works.
3. X continues to run for a few seconds, then crashes.  X dies, but the system
does not return to a console.  The keyboard is still locked and the screen is
black.
4. dmesg has been spammed as follows:

[ 5096.360378] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x00037be4 put 0x0001d690 state 0x2000a428 (err: CALL_SUBR_ACTIVE) push
0x00000000
[ 5096.360431] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d690 put 0x0001d6a0 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[ 5096.360475] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d6a0 put 0x0001d6b0 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[ 5096.360516] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d6b0 put 0x0001d6c0 state 0x80000000 (err: INVALID_CMD) push
0x00000000

... lots of above lines repeated ...

[ 5126.421032] nouveau E[ X[1337]] failed to idle channel 0xcccc0000 [X[1337]]
[ 5126.425268] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 1 [X[1337]]
subc 0 mthd 0x0000 data 0x00130000
[ 5141.425031] nouveau E[ X[1337]] failed to idle channel 0xcccc0000 [X[1337]]
[ 5141.457144] ------------[ cut here ]------------
[ 5141.457328] WARNING: CPU: 0 PID: 1337 at
drivers/gpu/drm/nouveau/nouveau_bo.c:151 nouveau_bo_del_ttm+0x66/0x70
[nouveau]()
[ 5141.457334] Modules linked in: lm90 ipv6 lp fuse hid_generic usbhid hid
nouveau mxm_wmi snd_via82xx wmi video ttm drm_kms_helper snd_mpu401_uart
snd_rawmidi snd_seq_device snd_ac97_codec snd_pcm snd_page_alloc snd_timer drm
i2c_algo_bit via_agp agpgart uhci_hcd snd soundcore via686a ac97_bus gameport
mperf i2c_viapro processor ppdev e1000 i2c_core shpchp parport_pc ehci_hcd
parport thermal_sys button psmouse serio_raw evdev freq_table hwmon loop [last
unloaded: cpuid]
[ 5141.457413] CPU: 0 PID: 1337 Comm: X Not tainted 3.11.0-rc6 #1
[ 5141.457419] Hardware name: Compaq Compaq PC                      /06E4h,
BIOS 786K1 07/26/2001
[ 5141.457424]  00000000 00000000 c76a3ca0 c150d8e5 c76a3cd0 c10389fa c16233b0
00000000
[ 5141.457434]  00000539 ccc512f4 00000097 ccc10a16 ccc10a16 c5ca9800 c5ca9824
00006240
[ 5141.457444]  c76a3ce0 c1038ac2 00000009 00000000 c76a3cf8 ccc10a16 c76a3cf8
cc88190f
[ 5141.457454] Call Trace:
[ 5141.457480]  [<c150d8e5>] dump_stack+0x16/0x18
[ 5141.457497]  [<c10389fa>] warn_slowpath_common+0x7a/0xa0
[ 5141.457543]  [<ccc10a16>] ? nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457586]  [<ccc10a16>] ? nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457595]  [<c1038ac2>] warn_slowpath_null+0x22/0x30
[ 5141.457638]  [<ccc10a16>] nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457685]  [<cc88190f>] ? drm_mm_put_block+0x3f/0x50 [drm]
[ 5141.457703]  [<cca385ee>] ttm_bo_release_list+0x6e/0xa0 [ttm]
[ 5141.457714]  [<cca3912e>] ttm_bo_release+0x13e/0x1d0 [ttm]
[ 5141.457725]  [<cca391e5>] ttm_bo_unref+0x25/0x30 [ttm]
[ 5141.457772]  [<ccc13abe>] nouveau_gem_object_del+0x3e/0x60 [nouveau]
[ 5141.457789]  [<cc879ed2>] drm_gem_object_free+0x22/0x30 [drm]
[ 5141.457804]  [<cc87a1e8>] drm_gem_object_release_handle+0x88/0xb0 [drm]
[ 5141.457818]  [<cc87a160>] ? drm_gem_handle_delete+0x110/0x110 [drm]
[ 5141.457840]  [<c1272cb5>] idr_for_each+0xa5/0x100
[ 5141.457854]  [<cc87a160>] ? drm_gem_handle_delete+0x110/0x110 [drm]
[ 5141.457873]  [<cc88748c>] ? drm_fb_release+0x9c/0xb0 [drm]
[ 5141.457889]  [<cc87aa1a>] drm_gem_release+0x1a/0x30 [drm]
[ 5141.457903]  [<cc879469>] drm_release+0x4a9/0x520 [drm]
[ 5141.457917]  [<c110168d>] __fput+0xbd/0x1e0
[ 5141.457924]  [<c11017ed>] ____fput+0xd/0x10
[ 5141.457932]  [<c104fa31>] task_work_run+0x81/0xa0
[ 5141.457941]  [<c10394f8>] do_exit+0x1f8/0x7f0
[ 5141.457957]  [<c1043886>] ? recalc_sigpending+0x16/0x50
[ 5141.457966]  [<c103a81e>] do_group_exit+0x2e/0x70
[ 5141.457976]  [<c1046237>] get_signal_to_deliver+0x157/0x520
[ 5141.457992]  [<c102ce90>] ? vmalloc_sync_all+0xe0/0xe0
[ 5141.458000]  [<c1001829>] do_signal+0x39/0x940
[ 5141.458007]  [<c10ffd40>] ? do_sync_write+0x60/0x90
[ 5141.458045]  [<c11005ad>] ? vfs_write+0x15d/0x1c0
[ 5141.458064]  [<c1072c5b>] ? get_monotonic_coarse+0x6b/0x80
[ 5141.458083]  [<c127e1c8>] ? copy_to_user+0x28/0x40
[ 5141.458093]  [<c1050fe0>] ? posix_get_realtime_coarse+0x20/0x20
[ 5141.458100]  [<c102ce90>] ? vmalloc_sync_all+0xe0/0xe0
[ 5141.458107]  [<c100217d>] do_notify_resume+0x4d/0x80
[ 5141.458118]  [<c1512533>] work_notifysig+0x24/0x31
[ 5141.458124] ---[ end trace 1bc9e065918e3541 ]---

The 'CBLocation' parameter, as mentioned earlier in Comment #3, seems to have
been removed, so I was unable to test this.
[    98.210] (WW) NOUVEAU(0): Option "CBLocation" is not used

Ben is probably correct when he suggested the chip has an unstable AGP bus. 
Setting the agpmode=0 parameter on the kernel module makes everything nice and
stable (but probably slower on the top end where it is needed).  Is there some
workaround or hardware manipulation ordering that is in Mesa, but hasn't made
its way into xf86-video-nouveau?


Thanks,
Jason

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377236442.c6C3Df31.7936
Date: Fri, 23 Aug 2013 05:40:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Priority</td>
           <td>high
           </td>
           <td>medium
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV31 lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>Hi Ilia, thanks for the ticket bump.

I pulled this machine out of storage to retest.  The entire graphics stack has
now been upgraded.
- Mesa 9.1.6
- Xorg server 1.13.4
- xf86-video-nouveau 1.0.9
- Linux 3.11-rc6

Nouveau now reports at bootup:
[    6.584942] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[    6.585121] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[    6.585212] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[    6.587705] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.629569] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.629663] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    6.629755] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[    6.630214] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[    6.631927] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[    6.632210] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[    6.632340] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[    6.632429] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[    6.642148] [TTM] Zone  kernel: Available graphics memory: 93186 kiB
[    6.642277] [TTM] Initializing pool allocator
[    6.642535] nouveau  [     DRM] VRAM: 127 MiB
[    6.642661] nouveau  [     DRM] GART: 128 MiB
[    6.642752] nouveau  [     DRM] BMP version 5.39
[    6.642839] nouveau  [     DRM] DCB version 2.2
[    6.642928] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[    6.643043] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[    6.643132] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[    6.643220] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[    6.643663] nouveau  [     DRM] Loading NV17 power sequencing microcode
[    6.645661] nouveau  [     DRM] Saving VGA fonts
[    6.690672] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    6.690779] [drm] No driver support for vblank timestamp query.
[    6.690966] nouveau  [     DRM] 0xE176: Parsing digital output script table
[    6.691764] nouveau  [     DRM] 0 available performance level(s)
[    6.691859] nouveau  [     DRM] c: core 234MHz memory 501MHz voltage 1220mV
[    6.695827] nouveau  [     DRM] MM: using M2MF for buffer copies
[    6.696202] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    6.777513] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo cbb04600
[    6.777995] fbcon: nouveaufb (fb0) is primary device
[    6.794224] Console: switching to colour frame buffer device 240x75
[    6.798678] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.798701] nouveau 0000:01:00.0: registered panic notifier
[    6.798729] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0


I spent some time ensuring the Nvidia driver (173.14.18) tested earlier in the
ticket was completely removed.  glxinfo now yields
   direct rendering: Yes
   ...
   OpenGL vendor string: nouveau
   OpenGL renderer string: Gallium 0.4 on NV31
   OpenGL version string: 1.5 Mesa 9.1.6
as expected.

Nouveau's 3D engine seems to have no lockup problems.  I spent a few minutes
working my way through xscreensaver's GL modules with no catastrophic
consequences.  It appears only 2D acceleration has issues.

Running &quot;x11perf -putimage500&quot; still locks up the machine.  Symptoms aren't
exactly the same as earlier in the ticket, but the end result still is loss of
a usable UI.
1. X freezes.  Local input is dropped.  Mouse pointer freezes, keyboard lights
do not respond to toggles.
2. Machine is not completely frozen, SSH still works.
3. X continues to run for a few seconds, then crashes.  X dies, but the system
does not return to a console.  The keyboard is still locked and the screen is
black.
4. dmesg has been spammed as follows:

[ 5096.360378] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x00037be4 put 0x0001d690 state 0x2000a428 (err: CALL_SUBR_ACTIVE) push
0x00000000
[ 5096.360431] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d690 put 0x0001d6a0 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[ 5096.360475] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d6a0 put 0x0001d6b0 state 0x80000000 (err: INVALID_CMD) push
0x00000000
[ 5096.360516] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 1 [X[1337]]
get 0x0001d6b0 put 0x0001d6c0 state 0x80000000 (err: INVALID_CMD) push
0x00000000

... lots of above lines repeated ...

[ 5126.421032] nouveau E[ X[1337]] failed to idle channel 0xcccc0000 [X[1337]]
[ 5126.425268] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 1 [X[1337]]
subc 0 mthd 0x0000 data 0x00130000
[ 5141.425031] nouveau E[ X[1337]] failed to idle channel 0xcccc0000 [X[1337]]
[ 5141.457144] ------------[ cut here ]------------
[ 5141.457328] WARNING: CPU: 0 PID: 1337 at
drivers/gpu/drm/nouveau/nouveau_bo.c:151 nouveau_bo_del_ttm+0x66/0x70
[nouveau]()
[ 5141.457334] Modules linked in: lm90 ipv6 lp fuse hid_generic usbhid hid
nouveau mxm_wmi snd_via82xx wmi video ttm drm_kms_helper snd_mpu401_uart
snd_rawmidi snd_seq_device snd_ac97_codec snd_pcm snd_page_alloc snd_timer drm
i2c_algo_bit via_agp agpgart uhci_hcd snd soundcore via686a ac97_bus gameport
mperf i2c_viapro processor ppdev e1000 i2c_core shpchp parport_pc ehci_hcd
parport thermal_sys button psmouse serio_raw evdev freq_table hwmon loop [last
unloaded: cpuid]
[ 5141.457413] CPU: 0 PID: 1337 Comm: X Not tainted 3.11.0-rc6 #1
[ 5141.457419] Hardware name: Compaq Compaq PC                      /06E4h,
BIOS 786K1 07/26/2001
[ 5141.457424]  00000000 00000000 c76a3ca0 c150d8e5 c76a3cd0 c10389fa c16233b0
00000000
[ 5141.457434]  00000539 ccc512f4 00000097 ccc10a16 ccc10a16 c5ca9800 c5ca9824
00006240
[ 5141.457444]  c76a3ce0 c1038ac2 00000009 00000000 c76a3cf8 ccc10a16 c76a3cf8
cc88190f
[ 5141.457454] Call Trace:
[ 5141.457480]  [&lt;c150d8e5&gt;] dump_stack+0x16/0x18
[ 5141.457497]  [&lt;c10389fa&gt;] warn_slowpath_common+0x7a/0xa0
[ 5141.457543]  [&lt;ccc10a16&gt;] ? nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457586]  [&lt;ccc10a16&gt;] ? nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457595]  [&lt;c1038ac2&gt;] warn_slowpath_null+0x22/0x30
[ 5141.457638]  [&lt;ccc10a16&gt;] nouveau_bo_del_ttm+0x66/0x70 [nouveau]
[ 5141.457685]  [&lt;cc88190f&gt;] ? drm_mm_put_block+0x3f/0x50 [drm]
[ 5141.457703]  [&lt;cca385ee&gt;] ttm_bo_release_list+0x6e/0xa0 [ttm]
[ 5141.457714]  [&lt;cca3912e&gt;] ttm_bo_release+0x13e/0x1d0 [ttm]
[ 5141.457725]  [&lt;cca391e5&gt;] ttm_bo_unref+0x25/0x30 [ttm]
[ 5141.457772]  [&lt;ccc13abe&gt;] nouveau_gem_object_del+0x3e/0x60 [nouveau]
[ 5141.457789]  [&lt;cc879ed2&gt;] drm_gem_object_free+0x22/0x30 [drm]
[ 5141.457804]  [&lt;cc87a1e8&gt;] drm_gem_object_release_handle+0x88/0xb0 [drm]
[ 5141.457818]  [&lt;cc87a160&gt;] ? drm_gem_handle_delete+0x110/0x110 [drm]
[ 5141.457840]  [&lt;c1272cb5&gt;] idr_for_each+0xa5/0x100
[ 5141.457854]  [&lt;cc87a160&gt;] ? drm_gem_handle_delete+0x110/0x110 [drm]
[ 5141.457873]  [&lt;cc88748c&gt;] ? drm_fb_release+0x9c/0xb0 [drm]
[ 5141.457889]  [&lt;cc87aa1a&gt;] drm_gem_release+0x1a/0x30 [drm]
[ 5141.457903]  [&lt;cc879469&gt;] drm_release+0x4a9/0x520 [drm]
[ 5141.457917]  [&lt;c110168d&gt;] __fput+0xbd/0x1e0
[ 5141.457924]  [&lt;c11017ed&gt;] ____fput+0xd/0x10
[ 5141.457932]  [&lt;c104fa31&gt;] task_work_run+0x81/0xa0
[ 5141.457941]  [&lt;c10394f8&gt;] do_exit+0x1f8/0x7f0
[ 5141.457957]  [&lt;c1043886&gt;] ? recalc_sigpending+0x16/0x50
[ 5141.457966]  [&lt;c103a81e&gt;] do_group_exit+0x2e/0x70
[ 5141.457976]  [&lt;c1046237&gt;] get_signal_to_deliver+0x157/0x520
[ 5141.457992]  [&lt;c102ce90&gt;] ? vmalloc_sync_all+0xe0/0xe0
[ 5141.458000]  [&lt;c1001829&gt;] do_signal+0x39/0x940
[ 5141.458007]  [&lt;c10ffd40&gt;] ? do_sync_write+0x60/0x90
[ 5141.458045]  [&lt;c11005ad&gt;] ? vfs_write+0x15d/0x1c0
[ 5141.458064]  [&lt;c1072c5b&gt;] ? get_monotonic_coarse+0x6b/0x80
[ 5141.458083]  [&lt;c127e1c8&gt;] ? copy_to_user+0x28/0x40
[ 5141.458093]  [&lt;c1050fe0&gt;] ? posix_get_realtime_coarse+0x20/0x20
[ 5141.458100]  [&lt;c102ce90&gt;] ? vmalloc_sync_all+0xe0/0xe0
[ 5141.458107]  [&lt;c100217d&gt;] do_notify_resume+0x4d/0x80
[ 5141.458118]  [&lt;c1512533&gt;] work_notifysig+0x24/0x31
[ 5141.458124] ---[ end trace 1bc9e065918e3541 ]---

The 'CBLocation' parameter, as mentioned earlier in <a href="show_bug.cgi?id=20341#c3">Comment #3</a>, seems to have
been removed, so I was unable to test this.
[    98.210] (WW) NOUVEAU(0): Option &quot;CBLocation&quot; is not used

Ben is probably correct when he suggested the chip has an unstable AGP bus. 
Setting the agpmode=0 parameter on the kernel module makes everything nice and
stable (but probably slower on the top end where it is needed).  Is there some
workaround or hardware manipulation ordering that is in Mesa, but hasn't made
its way into xf86-video-nouveau?


Thanks,
Jason</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377236442.c6C3Df31.7936--

--===============1097620407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1097620407==--
