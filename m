From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101322] GM108/NV118: 0 MiB DDR3 and boot crash in
 gf100_ltc_oneinit_tag_ram
Date: Tue, 06 Jun 2017 20:52:26 +0000
Message-ID: <bug-101322-8800-NTtOBc8t63@http.bugs.freedesktop.org/>
References: <bug-101322-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0263613439=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101322-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0263613439==
Content-Type: multipart/alternative; boundary="14967823462.Fe04.18271";
 charset="UTF-8"


--14967823462.Fe04.18271
Date: Tue, 6 Jun 2017 20:52:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101322

--- Comment #1 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Daniel Drake from comment #0)
> Created attachment 131742 [details]
> full dmesg log
>=20
> On the Acer Z20-730 laptop, the nouveau driver crashes during boot with:
>=20
> [    4.041108] nouveau 0000:01:00.0: pci: failed to adjust cap speed
> [    4.041167] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
> [    9.633613] nouveau 0000:01:00.0: fb: 0 MiB DDR3
> [   20.811768] divide error: 0000 [#1] SMP
> [   20.813654] Modules linked in: hid_generic usbmouse usbkbd usbhid i915
> nouveau(+) mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci syscopyarea
> sysfillrect sysimgblt fb_sys_fops ttm sdhci drm ahci libahci wmi i2c_hid =
hid
> video
> [   20.815697] CPU: 3 PID: 200 Comm: systemd-udevd Not tainted
> 4.11.0-2-generic #7+dev143.9f9ecd2beos3.2.2-Endless
> [   20.817684] Hardware name: Acer Aspire Z20-730/IPMAL-BR3, BIOS D01
> 07/07/2016
> [   20.819711] task: ffff8a3070288000 task.stack: ffffa3eb4103c000
> [   20.821762] RIP: 0010:gf100_ltc_oneinit_tag_ram+0xba/0x100 [nouveau]
> [   20.823789] RSP: 0018:ffffa3eb4103f6b8 EFLAGS: 00010206
> [   20.825773] RAX: 00001000ffefdfff RBX: ffff8a306f915000 RCX:
> ffff8a3075570030
> [   20.827820] RDX: 0000000000000000 RSI: dead000000000200 RDI:
> ffff8a307fd9b700
> [   20.829797] RBP: ffffa3eb4103f6d0 R08: 000000000001e980 R09:
> ffff8a3077003900
> [   20.831825] R10: ffffa3eb40cdbda0 R11: ffff8a307fd986a4 R12:
> 0000000000000000
> [   20.833814] R13: 0000000100005fff R14: ffff8a306fa2e400 R15:
> ffff8a306f914e00
> [   20.835882] FS:  00007f456d052900(0000) GS:ffff8a307fd80000(0000)
> knlGS:0000000000000000
> [   20.837874] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.839935] CR2: 00007fefceb1c020 CR3: 000000026fbc5000 CR4:
> 00000000003406e0
> [   20.841918] Call Trace:
> [   20.843972]  gm107_ltc_oneinit+0x7c/0x90 [nouveau]
> [   20.845952]  nvkm_ltc_oneinit+0x13/0x20 [nouveau]
> [   20.847991]  nvkm_subdev_init+0x50/0x210 [nouveau]
> [   20.849977]  nvkm_device_init+0x151/0x270 [nouveau]
> [   20.851997]  nvkm_udevice_init+0x48/0x60 [nouveau]
> [   20.853944]  nvkm_object_init+0x40/0x190 [nouveau]
> [   20.855924]  nvkm_ioctl_new+0x179/0x290 [nouveau]
> [   20.857838]  ? nvkm_client_notify+0x30/0x30 [nouveau]
> [   20.859794]  ? nvkm_udevice_rd08+0x30/0x30 [nouveau]
> [   20.861674]  nvkm_ioctl+0x168/0x240 [nouveau]
> [   20.863576]  ? nvif_client_init+0x42/0x110 [nouveau]
> [   20.865449]  nvkm_client_ioctl+0x12/0x20 [nouveau]
> [   20.867368]  nvif_object_ioctl+0x42/0x50 [nouveau]
> [   20.869237]  nvif_object_init+0xc2/0x130 [nouveau]
> [   20.871141]  nvif_device_init+0x12/0x30 [nouveau]
> [   20.872994]  nouveau_cli_init+0x15e/0x1d0 [nouveau]
> [   20.874873]  nouveau_drm_load+0x67/0x8b0 [nouveau]
> [   20.876674]  ? sysfs_do_create_link_sd.isra.2+0x70/0xb0
> [   20.878451]  drm_dev_register+0x148/0x1e0 [drm]
> [   20.880302]  drm_get_pci_dev+0xa0/0x160 [drm]
> [   20.882166]  nouveau_drm_probe+0x1d9/0x260 [nouveau]
>=20
> This has been reproduced on 4.12-rc3. Please let us know how we can help
> with further debugging.

does this error appear on older kernels?

Can you get a dmesg booted with "nouveau.debug=3Ddebug"?

thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14967823462.Fe04.18271
Date: Tue, 6 Jun 2017 20:52:26 +0000
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
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322">bug 10132=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D10=
1322#c0">comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D131742" name=3D"attach_131742" title=3D"full dmesg log">attachment =
131742</a> <a href=3D"attachment.cgi?id=3D131742&amp;action=3Dedit" title=
=3D"full dmesg log">[details]</a></span>
&gt; full dmesg log
&gt;=20
&gt; On the Acer Z20-730 laptop, the nouveau driver crashes during boot wit=
h:
&gt;=20
&gt; [    4.041108] nouveau 0000:01:00.0: pci: failed to adjust cap speed
&gt; [    4.041167] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
&gt; [    9.633613] nouveau 0000:01:00.0: fb: 0 MiB DDR3
&gt; [   20.811768] divide error: 0000 [#1] SMP
&gt; [   20.813654] Modules linked in: hid_generic usbmouse usbkbd usbhid i=
915
&gt; nouveau(+) mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci syscopyarea
&gt; sysfillrect sysimgblt fb_sys_fops ttm sdhci drm ahci libahci wmi i2c_h=
id hid
&gt; video
&gt; [   20.815697] CPU: 3 PID: 200 Comm: systemd-udevd Not tainted
&gt; 4.11.0-2-generic #7+dev143.9f9ecd2beos3.2.2-Endless
&gt; [   20.817684] Hardware name: Acer Aspire Z20-730/IPMAL-BR3, BIOS D01
&gt; 07/07/2016
&gt; [   20.819711] task: ffff8a3070288000 task.stack: ffffa3eb4103c000
&gt; [   20.821762] RIP: 0010:gf100_ltc_oneinit_tag_ram+0xba/0x100 [nouveau]
&gt; [   20.823789] RSP: 0018:ffffa3eb4103f6b8 EFLAGS: 00010206
&gt; [   20.825773] RAX: 00001000ffefdfff RBX: ffff8a306f915000 RCX:
&gt; ffff8a3075570030
&gt; [   20.827820] RDX: 0000000000000000 RSI: dead000000000200 RDI:
&gt; ffff8a307fd9b700
&gt; [   20.829797] RBP: ffffa3eb4103f6d0 R08: 000000000001e980 R09:
&gt; ffff8a3077003900
&gt; [   20.831825] R10: ffffa3eb40cdbda0 R11: ffff8a307fd986a4 R12:
&gt; 0000000000000000
&gt; [   20.833814] R13: 0000000100005fff R14: ffff8a306fa2e400 R15:
&gt; ffff8a306f914e00
&gt; [   20.835882] FS:  00007f456d052900(0000) GS:ffff8a307fd80000(0000)
&gt; knlGS:0000000000000000
&gt; [   20.837874] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
&gt; [   20.839935] CR2: 00007fefceb1c020 CR3: 000000026fbc5000 CR4:
&gt; 00000000003406e0
&gt; [   20.841918] Call Trace:
&gt; [   20.843972]  gm107_ltc_oneinit+0x7c/0x90 [nouveau]
&gt; [   20.845952]  nvkm_ltc_oneinit+0x13/0x20 [nouveau]
&gt; [   20.847991]  nvkm_subdev_init+0x50/0x210 [nouveau]
&gt; [   20.849977]  nvkm_device_init+0x151/0x270 [nouveau]
&gt; [   20.851997]  nvkm_udevice_init+0x48/0x60 [nouveau]
&gt; [   20.853944]  nvkm_object_init+0x40/0x190 [nouveau]
&gt; [   20.855924]  nvkm_ioctl_new+0x179/0x290 [nouveau]
&gt; [   20.857838]  ? nvkm_client_notify+0x30/0x30 [nouveau]
&gt; [   20.859794]  ? nvkm_udevice_rd08+0x30/0x30 [nouveau]
&gt; [   20.861674]  nvkm_ioctl+0x168/0x240 [nouveau]
&gt; [   20.863576]  ? nvif_client_init+0x42/0x110 [nouveau]
&gt; [   20.865449]  nvkm_client_ioctl+0x12/0x20 [nouveau]
&gt; [   20.867368]  nvif_object_ioctl+0x42/0x50 [nouveau]
&gt; [   20.869237]  nvif_object_init+0xc2/0x130 [nouveau]
&gt; [   20.871141]  nvif_device_init+0x12/0x30 [nouveau]
&gt; [   20.872994]  nouveau_cli_init+0x15e/0x1d0 [nouveau]
&gt; [   20.874873]  nouveau_drm_load+0x67/0x8b0 [nouveau]
&gt; [   20.876674]  ? sysfs_do_create_link_sd.isra.2+0x70/0xb0
&gt; [   20.878451]  drm_dev_register+0x148/0x1e0 [drm]
&gt; [   20.880302]  drm_get_pci_dev+0xa0/0x160 [drm]
&gt; [   20.882166]  nouveau_drm_probe+0x1d9/0x260 [nouveau]
&gt;=20
&gt; This has been reproduced on 4.12-rc3. Please let us know how we can he=
lp
&gt; with further debugging.</span >

does this error appear on older kernels?

Can you get a dmesg booted with &quot;nouveau.debug=3Ddebug&quot;?

thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14967823462.Fe04.18271--

--===============0263613439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0263613439==--
