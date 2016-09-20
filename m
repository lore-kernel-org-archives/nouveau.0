From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Tue, 20 Sep 2016 08:48:11 +0000
Message-ID: <bug-94725-8800-nRDtSyGr7f@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136999689=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1136999689==
Content-Type: multipart/alternative; boundary="14743612901.147F6.15712";
 charset="UTF-8"


--14743612901.147F6.15712
Date: Tue, 20 Sep 2016 08:48:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94725

--- Comment #25 from Perry Yuan <perry_yuan-8PEkshWhKlo@public.gmane.org> ---
HI guys .
The Bug  is similar with my graphics panic , so I add related logs here .
When I boot up system ,system will hang at nouveau driver panic , repeat pr=
int
nouveau driver  panic info , I must force down the system .=20
If i add nouveau.runpm=3D0  ,system  can boot up normally  without panic .


My graphics : NVIDIA  GM107=20


And the panic info is related to pci op.
---------------------------------------------------
[   21.303467] Bluetooth: RFCOMM socket layer initialized
[   21.303471] Bluetooth: RFCOMM ver 1.11
[   22.095603] nouveau 0000:01:00.0: DRM: evicting buffers...
[   22.095605] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[   22.095622] nouveau 0000:01:00.0: DRM: suspending client object trees...
[   22.098407] nouveau 0000:01:00.0: DRM: suspending kernel object tree...
[   22.220120] FAT-fs (sdb1): Volume was not properly unmounted. Some data =
may
be corrupt. Please run fsck.
[   23.669052] Non-volatile memory driver v1.3
[   24.083662] pci_raw_set_power_state: 48 callbacks suppressed
[   24.083665] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.159560] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.179571] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.179575] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[   24.179617] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[   24.179618] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
[   24.317867] wlp2s0: authenticate with f0:b4:29:87:9e:e4
---------------------------------------------------
and the frequently panic is :


ul 21 18:38:50 localhost kernel: [<ffffffffa03c463b>] ?
nv04_timer_read+0x2b/0x70 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa03c41af>] nvkm_timer_read+0xf/=
0x20
[nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa03bc598>] nvkm_pmu_init+0x58/0=
x480
[nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa0374e8e>]
nvkm_subdev_init+0xee/0x230 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa03c84df>]
nvkm_device_init+0x18f/0x280 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa03cc138>]
nvkm_udevice_init+0x48/0x60 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa03736c0>]
nvkm_object_init+0x50/0x1c0 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa0373705>]
nvkm_object_init+0x95/0x1c0 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa037062e>]
nvkm_client_init+0xe/0x10 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa04125fe>]
nvkm_client_resume+0xe/0x10 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa036f7b4>]
nvif_client_resume+0x14/0x20 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa040fbed>]
nouveau_do_resume+0x4d/0x130 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffffa041000c>]
nouveau_pmops_runtime_resume+0x7c/0x120 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffff81350c8b>]
pci_pm_runtime_resume+0x7b/0xc0
Jul 21 18:38:50 localhost kernel: [<ffffffff81350c10>] ?
pci_restore_standard_config+0x40/0x40
Jul 21 18:38:50 localhost kernel: [<ffffffff8142ddb6>] __rpm_callback+0x36/=
0xc0
Jul 21 18:38:50 localhost kernel: [<ffffffff8142de64>] rpm_callback+0x24/0x=
80
Jul 21 18:38:50 localhost kernel: [<ffffffff8142ee39>] rpm_resume+0x4e9/0x6=
70
Jul 21 18:38:50 localhost kernel: [<ffffffff812a7ffb>] ?
cred_has_capability+0x6b/0x120
Jul 21 18:38:50 localhost kernel: [<ffffffff8142f00f>]
__pm_runtime_resume+0x4f/0x80
Jul 21 18:38:50 localhost kernel: [<ffffffffa04107bb>]
nouveau_drm_open+0x3b/0x1b0 [nouveau]
Jul 21 18:38:50 localhost kernel: [<ffffffff812a80de>] ?
selinux_capable+0x2e/0x40
Jul 21 18:38:50 localhost kernel: [<ffffffff812a1cc8>] ?
security_capable+0x18/0x20
Jul 21 18:38:50 localhost kernel: [<ffffffffa008add6>] drm_open+0x1f6/0x470
[drm]
Jul 21 18:38:50 localhost kernel: [<ffffffffa0091759>] drm_stub_open+0xa9/0=
x120
[drm]
Jul 21 18:38:50 localhost kernel: [<ffffffff811fc4b1>] chrdev_open+0xa1/0x1=
e0
Jul 21 18:38:50 localhost kernel: [<ffffffff811f5567>]
do_dentry_open+0x1a7/0x2e0
Jul 21 18:38:50 localhost kernel: [<ffffffff812a21ac>] ?
security_inode_permission+0x1c/0x30
Jul 21 18:38:50 localhost kernel: [<ffffffff811fc410>] ? cdev_put+0x30/0x30
Jul 21 18:38:50 localhost kernel: [<ffffffff811f573d>] vfs_open+0x5d/0xd0
Jul 21 18:38:50 localhost kernel: [<ffffffff81203058>] ? may_open+0x68/0x110
Jul 21 18:38:50 localhost kernel: [<ffffffff81206b3d>] do_last+0x1ed/0x12a0
Jul 21 18:38:50 localhost kernel: [<ffffffff811d9c96>] ?
kmem_cache_alloc_trace+0x1d6/0x200
Jul 21 18:38:50 localhost kernel: [<ffffffff81207cb2>] path_openat+0xc2/0x4=
90
Jul 21 18:38:50 localhost kernel: [<ffffffff8120947b>] do_filp_open+0x4b/0x=
b0
Jul 21 18:38:50 localhost kernel: [<ffffffff812160a7>] ? __alloc_fd+0xa7/0x=
130
Jul 21 18:38:50 localhost kernel: [<ffffffff811f6a93>] do_sys_open+0xf3/0x1=
f0
Jul 21 18:38:50 localhost kernel: [<ffffffff811f6bae>] SyS_open+0x1e/0x20
Jul 21 18:38:50 localhost kernel: [<ffffffff816956c9>]
system_call_fastpath+0x16/0x1b

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14743612901.147F6.15712
Date: Tue, 20 Sep 2016 08:48:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau driver fails to poweron GPU on GM204 after dynami=
c poweroff"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94725">bug 94725<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
perry_yuan&#64;dell.com" title=3D"Perry Yuan &lt;perry_yuan&#64;dell.com&gt=
;"> <span class=3D"fn">Perry Yuan</span></a>
</span></b>
        <pre>HI guys .
The Bug  is similar with my graphics panic , so I add related logs here .
When I boot up system ,system will hang at nouveau driver panic , repeat pr=
int
nouveau driver  panic info , I must force down the system .=20
If i add nouveau.runpm=3D0  ,system  can boot up normally  without panic .


My graphics : NVIDIA  GM107=20


And the panic info is related to pci op.
---------------------------------------------------
[   21.303467] Bluetooth: RFCOMM socket layer initialized
[   21.303471] Bluetooth: RFCOMM ver 1.11
[   22.095603] nouveau 0000:01:00.0: DRM: evicting buffers...
[   22.095605] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[   22.095622] nouveau 0000:01:00.0: DRM: suspending client object trees...
[   22.098407] nouveau 0000:01:00.0: DRM: suspending kernel object tree...
[   22.220120] FAT-fs (sdb1): Volume was not properly unmounted. Some data =
may
be corrupt. Please run fsck.
[   23.669052] Non-volatile memory driver v1.3
[   24.083662] pci_raw_set_power_state: 48 callbacks suppressed
[   24.083665] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.159560] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.179571] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[   24.179575] nouveau 0000:01:00.0: DRM: resuming kernel object tree...
[   24.179617] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[   24.179618] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
[   24.317867] wlp2s0: authenticate with f0:b4:29:87:9e:e4
---------------------------------------------------
and the frequently panic is :


ul 21 18:38:50 localhost kernel: [&lt;ffffffffa03c463b&gt;] ?
nv04_timer_read+0x2b/0x70 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa03c41af&gt;] nvkm_timer_rea=
d+0xf/0x20
[nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa03bc598&gt;] nvkm_pmu_init+=
0x58/0x480
[nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa0374e8e&gt;]
nvkm_subdev_init+0xee/0x230 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa03c84df&gt;]
nvkm_device_init+0x18f/0x280 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa03cc138&gt;]
nvkm_udevice_init+0x48/0x60 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa03736c0&gt;]
nvkm_object_init+0x50/0x1c0 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa0373705&gt;]
nvkm_object_init+0x95/0x1c0 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa037062e&gt;]
nvkm_client_init+0xe/0x10 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa04125fe&gt;]
nvkm_client_resume+0xe/0x10 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa036f7b4&gt;]
nvif_client_resume+0x14/0x20 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa040fbed&gt;]
nouveau_do_resume+0x4d/0x130 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa041000c&gt;]
nouveau_pmops_runtime_resume+0x7c/0x120 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff81350c8b&gt;]
pci_pm_runtime_resume+0x7b/0xc0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff81350c10&gt;] ?
pci_restore_standard_config+0x40/0x40
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff8142ddb6&gt;] __rpm_callback=
+0x36/0xc0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff8142de64&gt;] rpm_callback+0=
x24/0x80
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff8142ee39&gt;] rpm_resume+0x4=
e9/0x670
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff812a7ffb&gt;] ?
cred_has_capability+0x6b/0x120
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff8142f00f&gt;]
__pm_runtime_resume+0x4f/0x80
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa04107bb&gt;]
nouveau_drm_open+0x3b/0x1b0 [nouveau]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff812a80de&gt;] ?
selinux_capable+0x2e/0x40
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff812a1cc8&gt;] ?
security_capable+0x18/0x20
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa008add6&gt;] drm_open+0x1f6=
/0x470
[drm]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffffa0091759&gt;] drm_stub_open+=
0xa9/0x120
[drm]
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811fc4b1&gt;] chrdev_open+0x=
a1/0x1e0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811f5567&gt;]
do_dentry_open+0x1a7/0x2e0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff812a21ac&gt;] ?
security_inode_permission+0x1c/0x30
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811fc410&gt;] ? cdev_put+0x3=
0/0x30
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811f573d&gt;] vfs_open+0x5d/=
0xd0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff81203058&gt;] ? may_open+0x6=
8/0x110
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff81206b3d&gt;] do_last+0x1ed/=
0x12a0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811d9c96&gt;] ?
kmem_cache_alloc_trace+0x1d6/0x200
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff81207cb2&gt;] path_openat+0x=
c2/0x490
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff8120947b&gt;] do_filp_open+0=
x4b/0xb0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff812160a7&gt;] ? __alloc_fd+0=
xa7/0x130
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811f6a93&gt;] do_sys_open+0x=
f3/0x1f0
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff811f6bae&gt;] SyS_open+0x1e/=
0x20
Jul 21 18:38:50 localhost kernel: [&lt;ffffffff816956c9&gt;]
system_call_fastpath+0x16/0x1b</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14743612901.147F6.15712--

--===============1136999689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1136999689==--
