From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: 4.9-rc7 nouveau fails on arm64 64k page kernel but works with 4k
Date: Thu, 1 Dec 2016 22:23:46 -0500
Message-ID: <CAKb7UvgW331K53x3wub5o+6LOqeLN5PqgiiJG6WXi+WJDVDzDg@mail.gmail.com>
References: <042c54f3-e52b-6658-18c7-9c19492485a4@arm.com>
 <CAKb7Uvhewyhnrnd=fw9QrdEDLecG_VMZ8Wfuh-LyCgeW6X_wCw@mail.gmail.com>
 <CAKb7UvgZLafVmC3N0R-dfm4FDtCxUO3fC-4zLwsKauAj=hx=tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576128843=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvgZLafVmC3N0R-dfm4FDtCxUO3fC-4zLwsKauAj=hx=tw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Steve Capper <Steve.Capper@arm.com>
List-Id: nouveau.vger.kernel.org

--===============0576128843==
Content-Type: multipart/alternative; boundary=94eb2c1b7b0e5356e00542a4772f

--94eb2c1b7b0e5356e00542a4772f
Content-Type: text/plain; charset=UTF-8

That's right -- nouveau currently requires 4k page sizes to work. This is a
software limitation, not a hardware one though.

On Dec 1, 2016 5:13 PM, "Jeremy Linton" <jeremy.linton@arm.com> wrote:

Hi,

I placed a 9600GT in a softiron 3k running fedora 25, and the nouveau
driver failed to claim the device with :

[drm] Initialized
nouveau 0000:01:00.0: NVIDIA G94 (094100a1)
nouveau 0000:01:00.0: bios: version 62.94.0d.00.04
nouveau: probe of 0000:01:00.0 failed with error -22

Which with a little bit of debugging seems to be a failure in:

[77216.692605] [<ffff000001404120>] ttm_bo_validate+0xb0/0x1e8 [ttm]
[77216.698697] [<ffff0000014045ac>] ttm_bo_init+0x354/0x410 [ttm]
[77216.704706] [<ffff0000019d7bd0>] nouveau_bo_new+0x1f4/0x314 [nouveau]
[77216.711308] [<ffff0000019e4620>] nv50_display_create+0x10c/0xa1c
[nouveau]
[77216.718340] [<ffff0000019df898>] nouveau_display_create+0x50c/0x59c
[nouveau]
[77216.725632] [<ffff0000019d3e24>] nouveau_drm_load+0x22c/0x8c0 [nouveau]
[77216.732286] [<ffff00000137a1a0>] drm_dev_register+0xc0/0xf0 [drm]
[77216.738409] [<ffff00000137b8a4>] drm_get_pci_dev+0xbc/0x188 [drm]
[77216.744663] [<ffff0000019d35e8>] nouveau_drm_probe+0x180/0x208 [nouveau]
[77216.751354] [<ffff0000084c30dc>] local_pci_probe+0x50/0xb4
[77216.756827] [<ffff0000084c3e40>] pci_device_probe+0xf8/0x148
[77216.762474] [<ffff0000085b6a10>] driver_probe_device+0x284/0x420
[77216.768467] [<ffff0000085b6ccc>] __driver_attach+0x120/0x124
[77216.774115] [<ffff0000085b446c>] bus_for_each_dev+0x6c/0xac
[77216.779673] [<ffff0000085b6204>] driver_attach+0x2c/0x34
[77216.784972] [<ffff0000085b5cb4>] bus_add_driver+0x244/0x2b0
[77216.790531] [<ffff0000085b78e4>] driver_register+0x68/0xfc
[77216.796004] [<ffff0000084c29a8>] __pci_register_driver+0x60/0x6c
[77216.802047] [<ffff00000137bcb8>] drm_pci_init+0x108/0x138 [drm]
[77216.808146] [<ffff000001530158>] nouveau_drm_init+0x158/0x10000 [nouveau]
[77216.814922] [<ffff0000080831a8>] do_one_initcall+0x44/0x128
[77216.820483] [<ffff0000081cad6c>] do_init_module+0x68/0x1e0
[77216.825957] [<ffff000008150d84>] load_module+0xfac/0x12bc
[77216.831343] [<ffff00000815132c>] SyS_finit_module+0xe4/0xf0
[77216.836902] [<ffff000008082b70>] el0_svc_naked+0x24/0x28

By default fedora is using a 64k page kernel, switching to a mainline
4.9-rc7 kernel using the same configuration the same problem exists (there
are a couple others, mentioned briefly in the defect). Changing the
mainline kernel from 64k to 4k pages corrects the problem and a terminal
display can be seen.

The fedora defect is:
https://bugzilla.redhat.com/show_bug.cgi?id=1400623


Thanks,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--94eb2c1b7b0e5356e00542a4772f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">That&#39;s right -- nouveau currently requires 4k page sizes=
 to work. This is a software limitation, not a hardware one though.</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Dec 1, 2016 5:=
13 PM, &quot;Jeremy Linton&quot; &lt;<a href=3D"mailto:jeremy.linton@arm.co=
m">jeremy.linton@arm.com</a>&gt; wrote:<br type=3D"attribution"><blockquote=
 class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi,<br>
<br>
I placed a 9600GT in a softiron 3k running fedora 25, and the nouveau drive=
r failed to claim the device with :<br>
<br>
[drm] Initialized<br>
nouveau 0000:01:00.0: NVIDIA G94 (094100a1)<br>
nouveau 0000:01:00.0: bios: version 62.94.0d.00.04<br>
nouveau: probe of 0000:01:00.0 failed with error -22<br>
<br>
Which with a little bit of debugging seems to be a failure in:<br>
<br>
[77216.692605] [&lt;ffff000001404120&gt;] ttm_bo_validate+0xb0/0x1e8 [ttm]<=
br>
[77216.698697] [&lt;ffff0000014045ac&gt;] ttm_bo_init+0x354/0x410 [ttm]<br>
[77216.704706] [&lt;ffff0000019d7bd0&gt;] nouveau_bo_new+0x1f4/0x314 [nouve=
au]<br>
[77216.711308] [&lt;ffff0000019e4620&gt;] nv50_display_create+0x10c/0xa1<wb=
r>c [nouveau]<br>
[77216.718340] [&lt;ffff0000019df898&gt;] nouveau_display_create+0x50c/0<wb=
r>x59c [nouveau]<br>
[77216.725632] [&lt;ffff0000019d3e24&gt;] nouveau_drm_load+0x22c/0x8c0 [nou=
veau]<br>
[77216.732286] [&lt;ffff00000137a1a0&gt;] drm_dev_register+0xc0/0xf0 [drm]<=
br>
[77216.738409] [&lt;ffff00000137b8a4&gt;] drm_get_pci_dev+0xbc/0x188 [drm]<=
br>
[77216.744663] [&lt;ffff0000019d35e8&gt;] nouveau_drm_probe+0x180/0x208 [no=
uveau]<br>
[77216.751354] [&lt;ffff0000084c30dc&gt;] local_pci_probe+0x50/0xb4<br>
[77216.756827] [&lt;ffff0000084c3e40&gt;] pci_device_probe+0xf8/0x148<br>
[77216.762474] [&lt;ffff0000085b6a10&gt;] driver_probe_device+0x284/0x42<wb=
r>0<br>
[77216.768467] [&lt;ffff0000085b6ccc&gt;] __driver_attach+0x120/0x124<br>
[77216.774115] [&lt;ffff0000085b446c&gt;] bus_for_each_dev+0x6c/0xac<br>
[77216.779673] [&lt;ffff0000085b6204&gt;] driver_attach+0x2c/0x34<br>
[77216.784972] [&lt;ffff0000085b5cb4&gt;] bus_add_driver+0x244/0x2b0<br>
[77216.790531] [&lt;ffff0000085b78e4&gt;] driver_register+0x68/0xfc<br>
[77216.796004] [&lt;ffff0000084c29a8&gt;] __pci_register_driver+0x60/0x6<wb=
r>c<br>
[77216.802047] [&lt;ffff00000137bcb8&gt;] drm_pci_init+0x108/0x138 [drm]<br=
>
[77216.808146] [&lt;ffff000001530158&gt;] nouveau_drm_init+0x158/0x10000 [n=
ouveau]<br>
[77216.814922] [&lt;ffff0000080831a8&gt;] do_one_initcall+0x44/0x128<br>
[77216.820483] [&lt;ffff0000081cad6c&gt;] do_init_module+0x68/0x1e0<br>
[77216.825957] [&lt;ffff000008150d84&gt;] load_module+0xfac/0x12bc<br>
[77216.831343] [&lt;ffff00000815132c&gt;] SyS_finit_module+0xe4/0xf0<br>
[77216.836902] [&lt;ffff000008082b70&gt;] el0_svc_naked+0x24/0x28<br>
<br>
By default fedora is using a 64k page kernel, switching to a mainline 4.9-r=
c7 kernel using the same configuration the same problem exists (there are a=
 couple others, mentioned briefly in the defect). Changing the mainline ker=
nel from 64k to 4k pages corrects the problem and a terminal display can be=
 seen.<br>
<br>
The fedora defect is:<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1400623" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.redhat.com/sh<wbr>ow_bug.cgi?i=
d=3D1400623</a><br>
<br>
<br>
Thanks,<br>
______________________________<wbr>_________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.or<wbr>g</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div><br></div>

--94eb2c1b7b0e5356e00542a4772f--

--===============0576128843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0576128843==--
