From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Sun, 18 Nov 2012 15:35:30 +0000
Message-ID: <bug-56461-8800-aW1tTIycXD@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0485137133=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0485137133==
Content-Type: multipart/alternative; boundary="1353252930.58C201.22826"; charset="us-ascii"


--1353252930.58C201.22826
Date: Sun, 18 Nov 2012 15:35:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #8 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
Okay, that was... interesting. I haven't quite managed to pin it down to a
single commit, but here is what I've found out.

I did a manual bisect, only looking at commits that make changes in
drivers/gpu/drm/nouveau. The area of interest had unrelated problems causing a
NULL pointer dereference and a compile problem. I fixed this by cherry picking
the following 2 commits each time I tested a new commit:

dea7e0ac  ttm: fix agp since ttm tt rework
095f979a  drm/nouveau/pm: fix build with HWMON off

With these changes, the last nouveau commit that works is:

d2edab4a  drm/nouveau/pm: fix missing volt changes when boot voltage is
undefined

The next 3 nouveau commits all fail, but with a NULL pointer dereference in
nouveau_hw_load_state() rather than with a black-screen hang:

2a44e499  drm/nouveau/disp: introduce proper init/fini, separate from
create/destroy
cf41d53b  drm/nouveau: re-jig fbcon suspend/resume process a little
1772fcc6  drm/nv50/disp: fix evo for create/init + destroy/fini split

In the next nouveau commit, the NULL pointer dereference has gone and it fails
with the black-screen hang:

f62b27db  drm/nouveau: shutdown display on suspend/hibernate

The stack trace for the 3 commits that oops rather than hang is as follows:

[   51.360006] Call Trace:
[   51.360006]  [<f0c78c69>] ? nv_crtc_restore+0x52/0x10f [nouveau]
[   51.360006]  [<f0cd3215>] ? ch7006_write+0x1f/0x50 [ch7006]
[   51.360006]  [<f0c7a623>] ? nv04_display_init+0x48/0x58 [nouveau]
[   51.360006]  [<f0c3214a>] ? nouveau_display_create+0x211/0x3f2 [nouveau]
[   51.360006]  [<f0c12b16>] ? nouveau_card_init+0x138a/0x1459 [nouveau]
[   51.360006]  [<f0c11744>] ? nouveau_stub_init+0x3/0x3 [nouveau]
[   51.360006]  [<f0c13092>] ? nouveau_load+0x3ce/0x6ad [nouveau]
[   51.360006]  [<f0ade3e0>] ? drm_get_pci_dev+0x13e/0x249 [drm]
[   51.360006]  [<c104580d>] ? __blocking_notifier_call_chain+0x47/0x4f
[   51.360006]  [<c113eb56>] ? pci_device_probe+0x47/0x68
[   51.360006]  [<c11ab567>] ? driver_probe_device+0x4a/0x13a
[   51.360006]  [<c113ea91>] ? pci_match_device+0x8b/0x99
[   51.360006]  [<c11ab6b9>] ? __driver_attach+0x62/0x64
[   51.360006]  [<c11ab657>] ? driver_probe_device+0x13a/0x13a
[   51.360006]  [<c11aaa38>] ? bus_for_each_dev+0x3f/0x63
[   51.360006]  [<c113eac2>] ? pci_dev_put+0xd/0xd
[   51.360006]  [<c11ab329>] ? driver_attach+0x19/0x1e
[   51.360006]  [<c11ab657>] ? driver_probe_device+0x13a/0x13a
[   51.360006]  [<c11ab0a8>] ? bus_add_driver+0x17d/0x24d
[   51.360006]  [<c113eac2>] ? pci_dev_put+0xd/0xd
[   51.360006]  [<c11ab8a9>] ? driver_register+0x57/0xec
[   51.360006]  [<f0ade51c>] ? drm_pci_init+0x31/0xe6 [drm]
[   51.360006]  [<c113ef22>] ? __pci_register_driver+0x31/0x8f
[   51.360006]  [<c1001027>] ? do_one_initcall+0x27/0x150
[   51.360006]  [<c108b650>] ? __vunmap+0xa0/0xd1
[   51.360006]  [<f0cb6000>] ? 0xf0cb5fff
[   51.360006]  [<c1054f97>] ? sys_init_module+0xccc/0x18f2
[   51.360006]  [<c109be00>] ? sys_close+0x66/0xa7
[   51.360006]  [<c127fb10>] ? sysenter_do_call+0x12/0x26
[   51.360006] Code: 00 28 60 00 f6 05 10 83 ca f0 10 0f 85 1e 12 00 00 8b 83
00 02 00 00 8b 50 18 01 ea 89 c8 e8 45 fd 50 d0 8b 83 78 01 00 00 31 c9 <8b> 2c
b8 85 ed 0f 95 c1 83 ff 01 19 ed 81 e5 00 e0 ff ff 81 c5
[   51.360006] EIP: [<f0c227fc>] nouveau_hw_load_state+0x9a5/0x26d9 [nouveau]
SS:ESP 0068:ee665cc4

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353252930.58C201.22826
Date: Sun, 18 Nov 2012 15:35:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>Okay, that was... interesting. I haven't quite managed to pin it down to a
single commit, but here is what I've found out.

I did a manual bisect, only looking at commits that make changes in
drivers/gpu/drm/nouveau. The area of interest had unrelated problems causing a
NULL pointer dereference and a compile problem. I fixed this by cherry picking
the following 2 commits each time I tested a new commit:

dea7e0ac  ttm: fix agp since ttm tt rework
095f979a  drm/nouveau/pm: fix build with HWMON off

With these changes, the last nouveau commit that works is:

d2edab4a  drm/nouveau/pm: fix missing volt changes when boot voltage is
undefined

The next 3 nouveau commits all fail, but with a NULL pointer dereference in
nouveau_hw_load_state() rather than with a black-screen hang:

2a44e499  drm/nouveau/disp: introduce proper init/fini, separate from
create/destroy
cf41d53b  drm/nouveau: re-jig fbcon suspend/resume process a little
1772fcc6  drm/nv50/disp: fix evo for create/init + destroy/fini split

In the next nouveau commit, the NULL pointer dereference has gone and it fails
with the black-screen hang:

f62b27db  drm/nouveau: shutdown display on suspend/hibernate

The stack trace for the 3 commits that oops rather than hang is as follows:

[   51.360006] Call Trace:
[   51.360006]  [&lt;f0c78c69&gt;] ? nv_crtc_restore+0x52/0x10f [nouveau]
[   51.360006]  [&lt;f0cd3215&gt;] ? ch7006_write+0x1f/0x50 [ch7006]
[   51.360006]  [&lt;f0c7a623&gt;] ? nv04_display_init+0x48/0x58 [nouveau]
[   51.360006]  [&lt;f0c3214a&gt;] ? nouveau_display_create+0x211/0x3f2 [nouveau]
[   51.360006]  [&lt;f0c12b16&gt;] ? nouveau_card_init+0x138a/0x1459 [nouveau]
[   51.360006]  [&lt;f0c11744&gt;] ? nouveau_stub_init+0x3/0x3 [nouveau]
[   51.360006]  [&lt;f0c13092&gt;] ? nouveau_load+0x3ce/0x6ad [nouveau]
[   51.360006]  [&lt;f0ade3e0&gt;] ? drm_get_pci_dev+0x13e/0x249 [drm]
[   51.360006]  [&lt;c104580d&gt;] ? __blocking_notifier_call_chain+0x47/0x4f
[   51.360006]  [&lt;c113eb56&gt;] ? pci_device_probe+0x47/0x68
[   51.360006]  [&lt;c11ab567&gt;] ? driver_probe_device+0x4a/0x13a
[   51.360006]  [&lt;c113ea91&gt;] ? pci_match_device+0x8b/0x99
[   51.360006]  [&lt;c11ab6b9&gt;] ? __driver_attach+0x62/0x64
[   51.360006]  [&lt;c11ab657&gt;] ? driver_probe_device+0x13a/0x13a
[   51.360006]  [&lt;c11aaa38&gt;] ? bus_for_each_dev+0x3f/0x63
[   51.360006]  [&lt;c113eac2&gt;] ? pci_dev_put+0xd/0xd
[   51.360006]  [&lt;c11ab329&gt;] ? driver_attach+0x19/0x1e
[   51.360006]  [&lt;c11ab657&gt;] ? driver_probe_device+0x13a/0x13a
[   51.360006]  [&lt;c11ab0a8&gt;] ? bus_add_driver+0x17d/0x24d
[   51.360006]  [&lt;c113eac2&gt;] ? pci_dev_put+0xd/0xd
[   51.360006]  [&lt;c11ab8a9&gt;] ? driver_register+0x57/0xec
[   51.360006]  [&lt;f0ade51c&gt;] ? drm_pci_init+0x31/0xe6 [drm]
[   51.360006]  [&lt;c113ef22&gt;] ? __pci_register_driver+0x31/0x8f
[   51.360006]  [&lt;c1001027&gt;] ? do_one_initcall+0x27/0x150
[   51.360006]  [&lt;c108b650&gt;] ? __vunmap+0xa0/0xd1
[   51.360006]  [&lt;f0cb6000&gt;] ? 0xf0cb5fff
[   51.360006]  [&lt;c1054f97&gt;] ? sys_init_module+0xccc/0x18f2
[   51.360006]  [&lt;c109be00&gt;] ? sys_close+0x66/0xa7
[   51.360006]  [&lt;c127fb10&gt;] ? sysenter_do_call+0x12/0x26
[   51.360006] Code: 00 28 60 00 f6 05 10 83 ca f0 10 0f 85 1e 12 00 00 8b 83
00 02 00 00 8b 50 18 01 ea 89 c8 e8 45 fd 50 d0 8b 83 78 01 00 00 31 c9 &lt;8b&gt; 2c
b8 85 ed 0f 95 c1 83 ff 01 19 ed 81 e5 00 e0 ff ff 81 c5
[   51.360006] EIP: [&lt;f0c227fc&gt;] nouveau_hw_load_state+0x9a5/0x26d9 [nouveau]
SS:ESP 0068:ee665cc4</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353252930.58C201.22826--

--===============0485137133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0485137133==--
