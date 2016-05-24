From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] INFO: task Xorg:2419 blocked for more than
	120 seconds.
Date: Tue, 24 May 2016 12:57:08 +0000
Message-ID: <bug-91413-8800-L6OClDbbSN@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1217566707=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1217566707==
Content-Type: multipart/alternative; boundary="14640946270.03e3e.14441";
 charset="UTF-8"


--14640946270.03e3e.14441
Date: Tue, 24 May 2016 12:57:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91413

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
And now I'm getting the same issue after adding a GK208B and a (fanless) NV=
34
to my system. khugepaged gets stuck like so:

[83695.847012] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
[khugepaged:59]
[83695.847015] Modules linked in: rtl8xxxu mac80211 cfg80211 it87 hwmon_vid
nouveau uas usb_storage fbcon video bitblit softcursor font i2c_algo_bit ttm
drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt
fb_sys_fops cfbcopyarea drm backlight fb fbdev mxm_wmi wmi
[83695.847032] CPU: 0 PID: 59 Comm: khugepaged Tainted: G          I  L  4.=
6.0+
#2
[83695.847033] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[83695.847035] task: ffff8801d822b000 ti: ffff8801d8314000 task.ti:
ffff8801d8314000
[83695.847036] RIP: 0010:[<ffffffff810e9fef>]  [<ffffffff810e9fef>]
smp_call_function_many+0x1de/0x1f1
[83695.847042] RSP: 0018:ffff8801d8317be0  EFLAGS: 00000202
[83695.847044] RAX: 0000000000000005 RBX: ffff8801dfc169c8 RCX:
0000000000000005
[83695.847045] RDX: ffff8801dfd59328 RSI: 0000000000000008 RDI:
ffff8801dfc169c8
[83695.847046] RBP: ffff8801d8317c20 R08: 0000000000000005 R09:
0000000000000000
[83695.847047] R10: 000000000000175d R11: 0000000000000009 R12:
ffff8801dfc169c0
[83695.847049] R13: 0000000000016980 R14: 0000000000000001 R15:
0000000000000008
[83695.847050] FS:  0000000000000000(0000) GS:ffff8801dfc00000(0000)
knlGS:0000000000000000
[83695.847051] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[83695.847053] CR2: 00007f2c7ed83000 CR3: 0000000001c07000 CR4:
00000000000006f0
[83695.847054] Stack:
[83695.847055]  0100000000000000 0000000000000000 ffffffff8114d0c8
0000000000000000
[83695.847057]  ffffffff8114d0c8 0000000000000000 ffffffff81f31bc8
0000000000000009
[83695.847059]  ffff8801d8317c50 ffffffff810ea0a5 0000000000000008
0000000000000000
[83695.847061] Call Trace:
[83695.847065]  [<ffffffff8114d0c8>] ? page_alloc_cpu_notify+0x41/0x41
[83695.847067]  [<ffffffff8114d0c8>] ? page_alloc_cpu_notify+0x41/0x41
[83695.847068]  [<ffffffff810ea0a5>] on_each_cpu_mask+0x28/0x48
[83695.847070]  [<ffffffff8114d5f2>] drain_all_pages+0x94/0xbb
[83695.847073]  [<ffffffff8114fa07>] __alloc_pages_nodemask+0x5f3/0x8b0
[83695.847075]  [<ffffffff81173b64>] ? __page_set_anon_rmap+0x31/0x7d
[83695.847079]  [<ffffffff8118a919>] __alloc_pages_node.isra.57+0x12/0x14
[83695.847081]  [<ffffffff8118ae09>] khugepaged+0xcc/0x10d1
[83695.847084]  [<ffffffff810bdebe>] ? finish_wait+0x62/0x62
[83695.847086]  [<ffffffff8118ad3d>] ? maybe_pmd_mkwrite+0x1a/0x1a
[83695.847089]  [<ffffffff810a8f93>] kthread+0xa5/0xad
[83695.847093]  [<ffffffff81766492>] ret_from_fork+0x22/0x40
[83695.847094]  [<ffffffff810a8eee>] ? init_completion+0x24/0x24
[83695.847095] Code: 74 2d 48 89 de 89 c7 e8 f8 f9 ff ff 3b 05 4e c1 c3 00 =
7d
1b 48 63 c8 49 8b 14 24 48 03 14 cd c0 4a d2 81 f6 42 18 01 74 04 f3 90 <eb=
> f6
eb d3 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d c3 66 66=20

But looking at all the active CPUs, there's always one with

[83696.530737] NMI backtrace for cpu 5
[83696.530737] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G          I  L  4.6.=
0+
#2
[83696.530739] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[83696.530740] task: ffff8801d8a3b000 ti: ffff8801d8a50000 task.ti:
ffff8801d8a50000
[83696.530741] RIP: 0010:[<ffffffff810bff24>]  [<ffffffff810bff24>]
queued_spin_lock_slowpath+0x59/0x173
[83696.530742] RSP: 0018:ffff8801dfd43b98  EFLAGS: 00000002
[83696.530743] RAX: 0000000000000101 RBX: 0000000000000086 RCX:
0000000000000101
[83696.530744] RDX: 0000000000000100 RSI: 0000000000000001 RDI:
ffff8801d75ff108
[83696.530745] RBP: ffff8801dfd43b98 R08: 0000000000000001 R09:
ffff8801dfd43d53
[83696.530746] R10: ffff8801dfd43d27 R11: 0000000000000000 R12:
ffff8801d75ff108
[83696.530747] R13: ffff8801d6ede000 R14: ffff8801d75ff000 R15:
ffff8801d528d800
[83696.530748] FS:  0000000000000000(0000) GS:ffff8801dfd40000(0000)
knlGS:0000000000000000
[83696.530749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[83696.530750] CR2: 00000000004330c1 CR3: 0000000001c07000 CR4:
00000000000006e0
[83696.530751] Stack:
[83696.530752]  ffff8801dfd43bb0 ffffffff817661b4 0000000000000029
ffff8801dfd43c00
[83696.530753]  ffffffffc03489b7 0000000000000010 ffff8801d7707400
ffff8801d528d700
[83696.530754]  ffff8801d75ff000 0000000000000029 ffff8801d6ede000
0000000000000029
[83696.530755] Call Trace:
[83696.530756]  <IRQ> d [<ffffffff817661b4>] _raw_spin_lock_irqsave+0x23/0x=
29
[83696.530757]  [<ffffffffc03489b7>] nvkm_fantog_update+0x43/0x103 [nouveau]
[83696.530758]  [<ffffffffc0348ac9>] nvkm_fantog_set+0x38/0x3f [nouveau]
[83696.530759]  [<ffffffffc034818d>] nvkm_fan_update+0x12c/0x1a7 [nouveau]
[83696.530760]  [<ffffffffc0348255>] nvkm_therm_fan_set+0x19/0x1b [nouveau]
[83696.530761]  [<ffffffffc0347c5a>] nvkm_therm_update+0x223/0x230 [nouveau]
[83696.530762]  [<ffffffffc0347c7c>] nvkm_therm_alarm+0x15/0x17 [nouveau]
[83696.530763]  [<ffffffffc034a837>] nvkm_timer_alarm_trigger+0xde/0xf6
[nouveau]
[83696.530764]  [<ffffffffc034a943>] nvkm_timer_alarm+0xaa/0xb3 [nouveau]
[83696.530765]  [<ffffffffc0348a5c>] nvkm_fantog_update+0xe8/0x103 [nouveau]
[83696.530766]  [<ffffffffc0348a8f>] nvkm_fantog_alarm+0x18/0x1a [nouveau]
[83696.530767]  [<ffffffffc034a837>] nvkm_timer_alarm_trigger+0xde/0xf6
[nouveau]
[83696.530768]  [<ffffffffc034abb3>] nv04_timer_intr+0x39/0x9f [nouveau]
[83696.530769]  [<ffffffffc034a71f>] nvkm_timer_intr+0x14/0x16 [nouveau]
[83696.530770]  [<ffffffffc03115d8>] nvkm_subdev_intr+0x17/0x19 [nouveau]
[83696.530771]  [<ffffffffc033f5fb>] nvkm_mc_intr+0x81/0xd2 [nouveau]
[83696.530772]  [<ffffffffc0342efa>] nvkm_pci_intr+0x4a/0x5c [nouveau]
[83696.530773]  [<ffffffff810cbc26>] handle_irq_event_percpu+0x6c/0x196
[83696.530773]  [<ffffffff810cbd7b>] handle_irq_event+0x2b/0x4b
[83696.530774]  [<ffffffff810ce999>] handle_edge_irq+0xa6/0xc3
[83696.530775]  [<ffffffff8105841b>] handle_irq+0x109/0x111
[83696.530776]  [<ffffffff8176859b>] do_IRQ+0x4b/0xba
[83696.530777]  [<ffffffff81766bbf>] common_interrupt+0x7f/0x7f
[83696.530778]  <EOI> d [<ffffffff8157911f>] ? cpuidle_enter_state+0x103/0x=
15b
[83696.530779]  [<ffffffff815791a3>] cpuidle_enter+0x17/0x19
[83696.530780]  [<ffffffff810be61e>] cpu_startup_entry+0x192/0x1fd
[83696.530781]  [<ffffffff8106f2ff>] start_secondary+0xe0/0xe3
[83696.530782] Code: ff ff 75 33 83 fe 01 89 ca 89 f0 41 0f 45 d0 f0 0f b1 =
17
39 f0 74 04 89 c6 eb e1 ff ca 0f 84 20 01 00 00 8b 07 84 c0 74 04 f3 90 <eb=
> f6
66 c7 07 01 00 e9 0c 01 00 00 48 c7 c0 40 65 01 00 65 48=20

Since it's in handle_irq, I assume that that takes some lock which basically
prevents the system from proceeding (except for NMIs). I can ssh into the
system, and even run some things (like these traces), but khugepaged is at
100%, and some other processes tend to hang. My VBIOS is to follow shortly.
Last I debugged this, I determined that this could happen if some time inte=
rval
we computed turned out to be 0, causing the timer to be executed from the
interrupt.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14640946270.03e3e.14441
Date: Tue, 24 May 2016 12:57:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413">bug 91413<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>imirkin&#64;alum.mit.edu
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413">bug 91413<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>And now I'm getting the same issue after adding a GK208B and a=
 (fanless) NV34
to my system. khugepaged gets stuck like so:

[83695.847012] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s!
[khugepaged:59]
[83695.847015] Modules linked in: rtl8xxxu mac80211 cfg80211 it87 hwmon_vid
nouveau uas usb_storage fbcon video bitblit softcursor font i2c_algo_bit ttm
drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt
fb_sys_fops cfbcopyarea drm backlight fb fbdev mxm_wmi wmi
[83695.847032] CPU: 0 PID: 59 Comm: khugepaged Tainted: G          I  L  4.=
6.0+
#2
[83695.847033] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[83695.847035] task: ffff8801d822b000 ti: ffff8801d8314000 task.ti:
ffff8801d8314000
[83695.847036] RIP: 0010:[&lt;ffffffff810e9fef&gt;]  [&lt;ffffffff810e9fef&=
gt;]
smp_call_function_many+0x1de/0x1f1
[83695.847042] RSP: 0018:ffff8801d8317be0  EFLAGS: 00000202
[83695.847044] RAX: 0000000000000005 RBX: ffff8801dfc169c8 RCX:
0000000000000005
[83695.847045] RDX: ffff8801dfd59328 RSI: 0000000000000008 RDI:
ffff8801dfc169c8
[83695.847046] RBP: ffff8801d8317c20 R08: 0000000000000005 R09:
0000000000000000
[83695.847047] R10: 000000000000175d R11: 0000000000000009 R12:
ffff8801dfc169c0
[83695.847049] R13: 0000000000016980 R14: 0000000000000001 R15:
0000000000000008
[83695.847050] FS:  0000000000000000(0000) GS:ffff8801dfc00000(0000)
knlGS:0000000000000000
[83695.847051] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[83695.847053] CR2: 00007f2c7ed83000 CR3: 0000000001c07000 CR4:
00000000000006f0
[83695.847054] Stack:
[83695.847055]  0100000000000000 0000000000000000 ffffffff8114d0c8
0000000000000000
[83695.847057]  ffffffff8114d0c8 0000000000000000 ffffffff81f31bc8
0000000000000009
[83695.847059]  ffff8801d8317c50 ffffffff810ea0a5 0000000000000008
0000000000000000
[83695.847061] Call Trace:
[83695.847065]  [&lt;ffffffff8114d0c8&gt;] ? page_alloc_cpu_notify+0x41/0x41
[83695.847067]  [&lt;ffffffff8114d0c8&gt;] ? page_alloc_cpu_notify+0x41/0x41
[83695.847068]  [&lt;ffffffff810ea0a5&gt;] on_each_cpu_mask+0x28/0x48
[83695.847070]  [&lt;ffffffff8114d5f2&gt;] drain_all_pages+0x94/0xbb
[83695.847073]  [&lt;ffffffff8114fa07&gt;] __alloc_pages_nodemask+0x5f3/0x8=
b0
[83695.847075]  [&lt;ffffffff81173b64&gt;] ? __page_set_anon_rmap+0x31/0x7d
[83695.847079]  [&lt;ffffffff8118a919&gt;] __alloc_pages_node.isra.57+0x12/=
0x14
[83695.847081]  [&lt;ffffffff8118ae09&gt;] khugepaged+0xcc/0x10d1
[83695.847084]  [&lt;ffffffff810bdebe&gt;] ? finish_wait+0x62/0x62
[83695.847086]  [&lt;ffffffff8118ad3d&gt;] ? maybe_pmd_mkwrite+0x1a/0x1a
[83695.847089]  [&lt;ffffffff810a8f93&gt;] kthread+0xa5/0xad
[83695.847093]  [&lt;ffffffff81766492&gt;] ret_from_fork+0x22/0x40
[83695.847094]  [&lt;ffffffff810a8eee&gt;] ? init_completion+0x24/0x24
[83695.847095] Code: 74 2d 48 89 de 89 c7 e8 f8 f9 ff ff 3b 05 4e c1 c3 00 =
7d
1b 48 63 c8 49 8b 14 24 48 03 14 cd c0 4a d2 81 f6 42 18 01 74 04 f3 90 &lt=
;eb&gt; f6
eb d3 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d c3 66 66=20

But looking at all the active CPUs, there's always one with

[83696.530737] NMI backtrace for cpu 5
[83696.530737] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G          I  L  4.6.=
0+
#2
[83696.530739] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[83696.530740] task: ffff8801d8a3b000 ti: ffff8801d8a50000 task.ti:
ffff8801d8a50000
[83696.530741] RIP: 0010:[&lt;ffffffff810bff24&gt;]  [&lt;ffffffff810bff24&=
gt;]
queued_spin_lock_slowpath+0x59/0x173
[83696.530742] RSP: 0018:ffff8801dfd43b98  EFLAGS: 00000002
[83696.530743] RAX: 0000000000000101 RBX: 0000000000000086 RCX:
0000000000000101
[83696.530744] RDX: 0000000000000100 RSI: 0000000000000001 RDI:
ffff8801d75ff108
[83696.530745] RBP: ffff8801dfd43b98 R08: 0000000000000001 R09:
ffff8801dfd43d53
[83696.530746] R10: ffff8801dfd43d27 R11: 0000000000000000 R12:
ffff8801d75ff108
[83696.530747] R13: ffff8801d6ede000 R14: ffff8801d75ff000 R15:
ffff8801d528d800
[83696.530748] FS:  0000000000000000(0000) GS:ffff8801dfd40000(0000)
knlGS:0000000000000000
[83696.530749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[83696.530750] CR2: 00000000004330c1 CR3: 0000000001c07000 CR4:
00000000000006e0
[83696.530751] Stack:
[83696.530752]  ffff8801dfd43bb0 ffffffff817661b4 0000000000000029
ffff8801dfd43c00
[83696.530753]  ffffffffc03489b7 0000000000000010 ffff8801d7707400
ffff8801d528d700
[83696.530754]  ffff8801d75ff000 0000000000000029 ffff8801d6ede000
0000000000000029
[83696.530755] Call Trace:
[83696.530756]  &lt;IRQ&gt; d [&lt;ffffffff817661b4&gt;] _raw_spin_lock_irq=
save+0x23/0x29
[83696.530757]  [&lt;ffffffffc03489b7&gt;] nvkm_fantog_update+0x43/0x103 [n=
ouveau]
[83696.530758]  [&lt;ffffffffc0348ac9&gt;] nvkm_fantog_set+0x38/0x3f [nouve=
au]
[83696.530759]  [&lt;ffffffffc034818d&gt;] nvkm_fan_update+0x12c/0x1a7 [nou=
veau]
[83696.530760]  [&lt;ffffffffc0348255&gt;] nvkm_therm_fan_set+0x19/0x1b [no=
uveau]
[83696.530761]  [&lt;ffffffffc0347c5a&gt;] nvkm_therm_update+0x223/0x230 [n=
ouveau]
[83696.530762]  [&lt;ffffffffc0347c7c&gt;] nvkm_therm_alarm+0x15/0x17 [nouv=
eau]
[83696.530763]  [&lt;ffffffffc034a837&gt;] nvkm_timer_alarm_trigger+0xde/0x=
f6
[nouveau]
[83696.530764]  [&lt;ffffffffc034a943&gt;] nvkm_timer_alarm+0xaa/0xb3 [nouv=
eau]
[83696.530765]  [&lt;ffffffffc0348a5c&gt;] nvkm_fantog_update+0xe8/0x103 [n=
ouveau]
[83696.530766]  [&lt;ffffffffc0348a8f&gt;] nvkm_fantog_alarm+0x18/0x1a [nou=
veau]
[83696.530767]  [&lt;ffffffffc034a837&gt;] nvkm_timer_alarm_trigger+0xde/0x=
f6
[nouveau]
[83696.530768]  [&lt;ffffffffc034abb3&gt;] nv04_timer_intr+0x39/0x9f [nouve=
au]
[83696.530769]  [&lt;ffffffffc034a71f&gt;] nvkm_timer_intr+0x14/0x16 [nouve=
au]
[83696.530770]  [&lt;ffffffffc03115d8&gt;] nvkm_subdev_intr+0x17/0x19 [nouv=
eau]
[83696.530771]  [&lt;ffffffffc033f5fb&gt;] nvkm_mc_intr+0x81/0xd2 [nouveau]
[83696.530772]  [&lt;ffffffffc0342efa&gt;] nvkm_pci_intr+0x4a/0x5c [nouveau]
[83696.530773]  [&lt;ffffffff810cbc26&gt;] handle_irq_event_percpu+0x6c/0x1=
96
[83696.530773]  [&lt;ffffffff810cbd7b&gt;] handle_irq_event+0x2b/0x4b
[83696.530774]  [&lt;ffffffff810ce999&gt;] handle_edge_irq+0xa6/0xc3
[83696.530775]  [&lt;ffffffff8105841b&gt;] handle_irq+0x109/0x111
[83696.530776]  [&lt;ffffffff8176859b&gt;] do_IRQ+0x4b/0xba
[83696.530777]  [&lt;ffffffff81766bbf&gt;] common_interrupt+0x7f/0x7f
[83696.530778]  &lt;EOI&gt; d [&lt;ffffffff8157911f&gt;] ? cpuidle_enter_st=
ate+0x103/0x15b
[83696.530779]  [&lt;ffffffff815791a3&gt;] cpuidle_enter+0x17/0x19
[83696.530780]  [&lt;ffffffff810be61e&gt;] cpu_startup_entry+0x192/0x1fd
[83696.530781]  [&lt;ffffffff8106f2ff&gt;] start_secondary+0xe0/0xe3
[83696.530782] Code: ff ff 75 33 83 fe 01 89 ca 89 f0 41 0f 45 d0 f0 0f b1 =
17
39 f0 74 04 89 c6 eb e1 ff ca 0f 84 20 01 00 00 8b 07 84 c0 74 04 f3 90 &lt=
;eb&gt; f6
66 c7 07 01 00 e9 0c 01 00 00 48 c7 c0 40 65 01 00 65 48=20

Since it's in handle_irq, I assume that that takes some lock which basically
prevents the system from proceeding (except for NMIs). I can ssh into the
system, and even run some things (like these traces), but khugepaged is at
100%, and some other processes tend to hang. My VBIOS is to follow shortly.
Last I debugged this, I determined that this could happen if some time inte=
rval
we computed turned out to be 0, causing the timer to be executed from the
interrupt.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14640946270.03e3e.14441--

--===============1217566707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1217566707==--
