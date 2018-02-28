From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Wed, 28 Feb 2018 21:54:55 +0000
Message-ID: <bug-105173-8800-hXXykOnb3z@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0196823976=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0196823976==
Content-Type: multipart/alternative; boundary="15198548950.5BbceD.15583"
Content-Transfer-Encoding: 7bit


--15198548950.5BbceD.15583
Date: Wed, 28 Feb 2018 21:54:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #10 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Nick Lee from comment #8)
> Also tried:
>=20
> Vanilla kernel 4.15.4-300.vanilla.knurd.1.fc27.x86_64
> mesa-17.3.5
> wayland session
> reproducible

What exactly is reproducible? The artefacts I would assume, but which error
exactly? The NULL pointer dereference, or the =E2=80=9Ctrapped read at 0080=
000000 on
channel 1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient =
04
[M2M_IN] reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?
I did manage to reproduce the second one with Wayland, but still no luck wi=
th
the first one.

(In reply to Nick Lee from comment #8)
> Fedora-Workstation-Live-x86_64-Rawhide-20180220.n.0.iso
> wayland session
> mesa-18.0.0-0.1.rc4.fc28.x86_64
> Got artefacts with dmesg output:
>=20
> [ 1035.437016] nouveau 0000:03:00.0: swiotlb buffer is full (sz: 2097152
> bytes)
> [ 1035.437020] nouveau 0000:03:00.0: swiotlb: coherent allocation failed,
> size=3D2097152
> [ 1035.437023] CPU: 0 PID: 1842 Comm: gnome-shell Not tainted
> 4.16.0-0.rc2.git0.1.fc28.x86_64 #1
> [ 1035.437024] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2009
> [ 1035.437025] Call Trace:
> [ 1035.437036]  dump_stack+0x5c/0x85
> [ 1035.437040]  swiotlb_alloc_coherent+0x1c3/0x1e0
> [ 1035.437052]  ttm_dma_pool_get_pages+0x21a/0x620 [ttm]
> [ 1035.437057]  ttm_dma_populate+0xdd/0x390 [ttm]
> [ 1035.437062]  ttm_tt_bind+0x2e/0x60 [ttm]
> [ 1035.437067]  ttm_bo_handle_move_mem+0x4cf/0x550 [ttm]
> [ 1035.437073]  ttm_bo_validate+0x119/0x130 [ttm]
> [ 1035.437104]  ? drm_get_edid_switcheroo+0x16/0x40 [drm]
> [ 1035.437109]  ttm_bo_init_reserved+0x334/0x380 [ttm]
> [ 1035.437114]  ? ttm_bo_init+0x62/0xd0 [ttm]
> [ 1035.437190]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
> [ 1035.437226]  ? nouveau_bo_new+0x401/0x580 [nouveau]
> [ 1035.437262]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
> [ 1035.437298]  ? nouveau_gem_new+0x120/0x120 [nouveau]
> [ 1035.437334]  ? nouveau_gem_new+0x5d/0x120 [nouveau]
> [ 1035.437370]  ? nouveau_gem_ioctl_new+0x53/0xe0 [nouveau]
> [ 1035.437381]  ? drm_ioctl_kernel+0x5b/0xb0 [drm]
> [ 1035.437392]  ? drm_ioctl+0x1c4/0x380 [drm]
> [ 1035.437428]  ? nouveau_gem_new+0x120/0x120 [nouveau]
> [ 1035.437431]  ? eventfd_write+0x94/0x2a0
> [ 1035.437467]  ? nouveau_drm_ioctl+0x65/0xc0 [nouveau]
> [ 1035.437470]  ? do_vfs_ioctl+0xa4/0x610
> [ 1035.437471]  ? SyS_ioctl+0x74/0x80
> [ 1035.437475]  ? do_syscall_64+0x74/0x180
> [ 1035.437478]  ? entry_SYSCALL_64_after_hwframe+0x3d/0xa2

I=E2=80=99ll try the iso. Did you get this error with supertuxkart as well,=
 or simply
by launching the session?


(In reply to S=C3=A9rgio M. Basto from comment #9)
> Complete unresponsive my nvidia , with nouveau or nvidia drive when boot
> with kernel 4.15.x last kernel tested :  4.15.4=20
>=20
>=20
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce 9300M
> GS] (rev a1)
>=20
> [   29.876760] nouveau 0000:01:00.0: DRM: EVO timeout

It might be a different issue (especially if you get a freeze even when usi=
ng
the NVIDIA driver. Please open a separate bug report; it=E2=80=99s always e=
asier to
merge two bug reports than to split one in two.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15198548950.5BbceD.15583
Date: Wed, 28 Feb 2018 21:54:55 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Nick Lee from <a href=3D"show_bug.cgi?id=3D105173=
#c8">comment #8</a>)
<span class=3D"quote">&gt; Also tried:
&gt;=20
&gt; Vanilla kernel 4.15.4-300.vanilla.knurd.1.fc27.x86_64
&gt; mesa-17.3.5
&gt; wayland session
&gt; reproducible</span >

What exactly is reproducible? The artefacts I would assume, but which error
exactly? The NULL pointer dereference, or the =E2=80=9Ctrapped read at 0080=
000000 on
channel 1 [0fbb0000 DRM] engine 00 [PGRAPH] client 03 [DISPATCH] subclient =
04
[M2M_IN] reason 00000006 [NULL_DMAOBJ]=E2=80=9D one?
I did manage to reproduce the second one with Wayland, but still no luck wi=
th
the first one.

(In reply to Nick Lee from <a href=3D"show_bug.cgi?id=3D105173#c8">comment =
#8</a>)
<span class=3D"quote">&gt; Fedora-Workstation-Live-x86_64-Rawhide-20180220.=
n.0.iso
&gt; wayland session
&gt; mesa-18.0.0-0.1.rc4.fc28.x86_64
&gt; Got artefacts with dmesg output:
&gt;=20
&gt; [ 1035.437016] nouveau 0000:03:00.0: swiotlb buffer is full (sz: 20971=
52
&gt; bytes)
&gt; [ 1035.437020] nouveau 0000:03:00.0: swiotlb: coherent allocation fail=
ed,
&gt; size=3D2097152
&gt; [ 1035.437023] CPU: 0 PID: 1842 Comm: gnome-shell Not tainted
&gt; 4.16.0-0.rc2.git0.1.fc28.x86_64 #1
&gt; [ 1035.437024] Hardware name: NVIDIA MCP7A/MCP7A, BIOS 6.00 PG 04/22/2=
009
&gt; [ 1035.437025] Call Trace:
&gt; [ 1035.437036]  dump_stack+0x5c/0x85
&gt; [ 1035.437040]  swiotlb_alloc_coherent+0x1c3/0x1e0
&gt; [ 1035.437052]  ttm_dma_pool_get_pages+0x21a/0x620 [ttm]
&gt; [ 1035.437057]  ttm_dma_populate+0xdd/0x390 [ttm]
&gt; [ 1035.437062]  ttm_tt_bind+0x2e/0x60 [ttm]
&gt; [ 1035.437067]  ttm_bo_handle_move_mem+0x4cf/0x550 [ttm]
&gt; [ 1035.437073]  ttm_bo_validate+0x119/0x130 [ttm]
&gt; [ 1035.437104]  ? drm_get_edid_switcheroo+0x16/0x40 [drm]
&gt; [ 1035.437109]  ttm_bo_init_reserved+0x334/0x380 [ttm]
&gt; [ 1035.437114]  ? ttm_bo_init+0x62/0xd0 [ttm]
&gt; [ 1035.437190]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
&gt; [ 1035.437226]  ? nouveau_bo_new+0x401/0x580 [nouveau]
&gt; [ 1035.437262]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
&gt; [ 1035.437298]  ? nouveau_gem_new+0x120/0x120 [nouveau]
&gt; [ 1035.437334]  ? nouveau_gem_new+0x5d/0x120 [nouveau]
&gt; [ 1035.437370]  ? nouveau_gem_ioctl_new+0x53/0xe0 [nouveau]
&gt; [ 1035.437381]  ? drm_ioctl_kernel+0x5b/0xb0 [drm]
&gt; [ 1035.437392]  ? drm_ioctl+0x1c4/0x380 [drm]
&gt; [ 1035.437428]  ? nouveau_gem_new+0x120/0x120 [nouveau]
&gt; [ 1035.437431]  ? eventfd_write+0x94/0x2a0
&gt; [ 1035.437467]  ? nouveau_drm_ioctl+0x65/0xc0 [nouveau]
&gt; [ 1035.437470]  ? do_vfs_ioctl+0xa4/0x610
&gt; [ 1035.437471]  ? SyS_ioctl+0x74/0x80
&gt; [ 1035.437475]  ? do_syscall_64+0x74/0x180
&gt; [ 1035.437478]  ? entry_SYSCALL_64_after_hwframe+0x3d/0xa2</span >

I=E2=80=99ll try the iso. Did you get this error with supertuxkart as well,=
 or simply
by launching the session?


(In reply to S=C3=A9rgio M. Basto from <a href=3D"show_bug.cgi?id=3D105173#=
c9">comment #9</a>)
<span class=3D"quote">&gt; Complete unresponsive my nvidia , with nouveau o=
r nvidia drive when boot
&gt; with kernel 4.15.x last kernel tested :  4.15.4=20
&gt;=20
&gt;=20
&gt; 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce 93=
00M
&gt; GS] (rev a1)
&gt;=20
&gt; [   29.876760] nouveau 0000:01:00.0: DRM: EVO timeout</span >

It might be a different issue (especially if you get a freeze even when usi=
ng
the NVIDIA driver. Please open a separate bug report; it=E2=80=99s always e=
asier to
merge two bug reports than to split one in two.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15198548950.5BbceD.15583--

--===============0196823976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0196823976==--
