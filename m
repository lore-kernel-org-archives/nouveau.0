From: Craig Garner <craigcgarner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [ANNOUNCE] xf86-video-nouveau 1.0.12
Date: Wed, 9 Dec 2015 21:31:46 -0500
Message-ID: <CAGfK2pd-hagnOoT9VUVW2wbq0X4_NSWF_F5jcY5UOhj1ub7huA@mail.gmail.com>
References: <1449714365-9359-1-git-send-email-airlied@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1077131832=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1449714365-9359-1-git-send-email-airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xorg-announce-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1077131832==
Content-Type: multipart/alternative; boundary=001a11409e021ee0b0052682027e

--001a11409e021ee0b0052682027e
Content-Type: text/plain; charset=UTF-8

What Fedora release is this going to make it in to?  Is it going to be in
FC23?  If so, I'll give it a test.  I would like to be able to upgrade
again :)


On Wed, Dec 9, 2015 at 9:26 PM, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
> New nouveau DDX release.
>
> Ben Skeggs (1):
>       Bump version to 1.0.12
>
> Ilia Mirkin (14):
>       copy: don't bother trying to create copy on pre-nva3
>       allow path to envyas binary to be specified
>       kepler: remove unnecessary texbars, add live-only tex for nvf0
>       use defined method names where available
>       nv50: explicitly disable ZETA buffer
>       Check before trying a solid fill
>       nv04-nv40: don't attempt to do 32-bit shifts
>       older hardware prefers copy to clear, so use that
>       nv50/exa: add comments showing the code that makes up the programs
>       Avoid build fail without COMPOSITE
>       glamor: remove
>       remove maxwell GM10x support for now
>       xv: use correct max width/height settings
>       fix build after glamor removal
>
> Maarten Lankhorst (13):
>       enable dri3 support without glamor
>       move down call to nouveau_present_init until after fb init.
>       fix crash in nouveau_glamor_set_shared_pixmap_backing
>       fix !DRI3 case
>       rework initialization to prevent some crashes
>       check memory allocation in nouveau_glamor_set_shared_pixmap_backing
>       fix null pointer deref
>       Make the ddx load with platform devices
>       Use the correct class and shader ops for GK20A.
>       Use drmGetRenderDeviceNameFromFd to obtain the dri3 node.
>       Simplify nouveau_allocate_surface's pitch calculation.
>       Try using EXA ops harder in drmmode_fbcon_copy fallback
>       Actually do a clear instead of doing a bogus copy.
>
> Mario Kleiner (3):
>       present: Fixup return type of nouveau_present_init()
>       Add Option "DRI" to allow selection of maximum DRI level. (v2)
>       Take shift in crtc positions for ZaphodHeads configs into account.
>
> Samuel Pitoiset (1):
>       fix a wrong use of a logical operator in drmmode_output_dpms()
>
> Vadim Rutkovsky (1):
>       Adapt to new dirty tracking api
>
> git tag: xf86-video-nouveau-1.0.12
>
>
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.12.tar.bz2
> MD5:  dc79910c7b9e32321cefc7af250c7765  xf86-video-nouveau-1.0.12.tar.bz2
> SHA1: 480a8e1da05683e9bbedba61885cd56e7623bc00
> xf86-video-nouveau-1.0.12.tar.bz2
> SHA256: 0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e
> xf86-video-nouveau-1.0.12.tar.bz2
> PGP:
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.12.tar.bz2.sig
>
>
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.12.tar.gz
> MD5:  5dfbc08933f2db994b2e100b9c49f480  xf86-video-nouveau-1.0.12.tar.gz
> SHA1: c0ad3ccdfab29c43d2477400069e40c54c848e29
> xf86-video-nouveau-1.0.12.tar.gz
> SHA256: b82ed744e3431d077c54516d8447da292a9028b1b1ce1055a2062807b08c24b6
> xf86-video-nouveau-1.0.12.tar.gz
> PGP:
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1.0.12.tar.gz.sig
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
>
> iQIcBAEBAgAGBQJWaOKRAAoJEAx081l5xIa+Oq4QAJ7DMs0a+39VTIMLyMmL5/2o
> FLf5htw5vSAkrX2GizolNli4F560q+NS77pR2WVMKvX9noqjMZQcAU0m8w6K5OmR
> 28xMma89CXXZNcJ3UiYTr5CyDBL8N3KqrIxL+a8QDIe7jI7J/IAFBSCLtEaDhDfS
> z8r/Pj28LvEGBn4dCvRjflToE4sMxlkzGgtFiWG8hQputsQ1REGiChuAx+0DzMAG
> XGpLliSj1Nc1e1b/tVCBupIoEgqu42+cX/Sc3/ECaOhX/VlNb8av3ChJjPkTtwGU
> Gq4P172/43U5/34/M8RJ1OxZ+3Cm/ANadk9w0Kay1hy4z7ELFfdpmJEXWlIVe4dE
> e32vnmGVil+aLWu+o6OjcPSI+Cg3HgZAUKu0PrnONSRRzZUDGY9DVLHsHuPeRGqw
> uqG7+MEVT0cJm3cueeyyiAGn+oPk9IRpxmZeJ+TFf95HEWLZE3ZHLoRSfmb6fBMV
> 1dRkpQ4g/yUIAGqGn4r+XrV70b8cQDCZiroFXs0bdtY9ckXaGg46x+je0NMIUBG2
> vhwRUGN6rQctnGwnkl7vzKmHR2K1VNi+VMrV8ykd4b6mQcPBw3Qvo1Liu+stY4EA
> vUx4mKC5HDs2Pka+Nxk6gOSBUadpX6TfH/ZF7zYBjXjETIlsGPWhYJsQB004pSer
> OVrN2TQsPPAmvUpxoQyT
> =b4WM
> -----END PGP SIGNATURE-----
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a11409e021ee0b0052682027e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What Fedora release is this going to make it in to?=C2=A0 =
Is it going to be in FC23?=C2=A0 If so, I&#39;ll give it a test.=C2=A0 I wo=
uld like to be able to upgrade again :)<br><br></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Wed, Dec 9, 2015 at 9:26 PM, Dave Ai=
rlie <span dir=3D"ltr">&lt;<a href=3D"mailto:airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"=
_blank">airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<br>
<br>
New nouveau DDX release.<br>
<br>
Ben Skeggs (1):<br>
=C2=A0 =C2=A0 =C2=A0 Bump version to 1.0.12<br>
<br>
Ilia Mirkin (14):<br>
=C2=A0 =C2=A0 =C2=A0 copy: don&#39;t bother trying to create copy on pre-nv=
a3<br>
=C2=A0 =C2=A0 =C2=A0 allow path to envyas binary to be specified<br>
=C2=A0 =C2=A0 =C2=A0 kepler: remove unnecessary texbars, add live-only tex =
for nvf0<br>
=C2=A0 =C2=A0 =C2=A0 use defined method names where available<br>
=C2=A0 =C2=A0 =C2=A0 nv50: explicitly disable ZETA buffer<br>
=C2=A0 =C2=A0 =C2=A0 Check before trying a solid fill<br>
=C2=A0 =C2=A0 =C2=A0 nv04-nv40: don&#39;t attempt to do 32-bit shifts<br>
=C2=A0 =C2=A0 =C2=A0 older hardware prefers copy to clear, so use that<br>
=C2=A0 =C2=A0 =C2=A0 nv50/exa: add comments showing the code that makes up =
the programs<br>
=C2=A0 =C2=A0 =C2=A0 Avoid build fail without COMPOSITE<br>
=C2=A0 =C2=A0 =C2=A0 glamor: remove<br>
=C2=A0 =C2=A0 =C2=A0 remove maxwell GM10x support for now<br>
=C2=A0 =C2=A0 =C2=A0 xv: use correct max width/height settings<br>
=C2=A0 =C2=A0 =C2=A0 fix build after glamor removal<br>
<br>
Maarten Lankhorst (13):<br>
=C2=A0 =C2=A0 =C2=A0 enable dri3 support without glamor<br>
=C2=A0 =C2=A0 =C2=A0 move down call to nouveau_present_init until after fb =
init.<br>
=C2=A0 =C2=A0 =C2=A0 fix crash in nouveau_glamor_set_shared_pixmap_backing<=
br>
=C2=A0 =C2=A0 =C2=A0 fix !DRI3 case<br>
=C2=A0 =C2=A0 =C2=A0 rework initialization to prevent some crashes<br>
=C2=A0 =C2=A0 =C2=A0 check memory allocation in nouveau_glamor_set_shared_p=
ixmap_backing<br>
=C2=A0 =C2=A0 =C2=A0 fix null pointer deref<br>
=C2=A0 =C2=A0 =C2=A0 Make the ddx load with platform devices<br>
=C2=A0 =C2=A0 =C2=A0 Use the correct class and shader ops for GK20A.<br>
=C2=A0 =C2=A0 =C2=A0 Use drmGetRenderDeviceNameFromFd to obtain the dri3 no=
de.<br>
=C2=A0 =C2=A0 =C2=A0 Simplify nouveau_allocate_surface&#39;s pitch calculat=
ion.<br>
=C2=A0 =C2=A0 =C2=A0 Try using EXA ops harder in drmmode_fbcon_copy fallbac=
k<br>
=C2=A0 =C2=A0 =C2=A0 Actually do a clear instead of doing a bogus copy.<br>
<br>
Mario Kleiner (3):<br>
=C2=A0 =C2=A0 =C2=A0 present: Fixup return type of nouveau_present_init()<b=
r>
=C2=A0 =C2=A0 =C2=A0 Add Option &quot;DRI&quot; to allow selection of maxim=
um DRI level. (v2)<br>
=C2=A0 =C2=A0 =C2=A0 Take shift in crtc positions for ZaphodHeads configs i=
nto account.<br>
<br>
Samuel Pitoiset (1):<br>
=C2=A0 =C2=A0 =C2=A0 fix a wrong use of a logical operator in drmmode_outpu=
t_dpms()<br>
<br>
Vadim Rutkovsky (1):<br>
=C2=A0 =C2=A0 =C2=A0 Adapt to new dirty tracking api<br>
<br>
git tag: xf86-video-nouveau-1.0.12<br>
<br>
<a href=3D"http://xorg.freedesktop.org/archive/individual/driver/xf86-video=
-nouveau-1.0.12.tar.bz2
MD5" rel=3D"noreferrer" target=3D"_blank">http://xorg.freedesktop.org/archi=
ve/individual/driver/xf86-video-nouveau-1.0.12.tar.bz2<br>
MD5</a>:=C2=A0 dc79910c7b9e32321cefc7af250c7765=C2=A0 xf86-video-nouveau-1.=
0.12.tar.bz2<br>
SHA1: 480a8e1da05683e9bbedba61885cd56e7623bc00=C2=A0 xf86-video-nouveau-1.0=
.12.tar.bz2<br>
SHA256: 0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e=C2=
=A0 xf86-video-nouveau-1.0.12.tar.bz2<br>
PGP:=C2=A0 <a href=3D"http://xorg.freedesktop.org/archive/individual/driver=
/xf86-video-nouveau-1.0.12.tar.bz2.sig" rel=3D"noreferrer" target=3D"_blank=
">http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-=
1.0.12.tar.bz2.sig</a><br>
<br>
<a href=3D"http://xorg.freedesktop.org/archive/individual/driver/xf86-video=
-nouveau-1.0.12.tar.gz
MD5" rel=3D"noreferrer" target=3D"_blank">http://xorg.freedesktop.org/archi=
ve/individual/driver/xf86-video-nouveau-1.0.12.tar.gz<br>
MD5</a>:=C2=A0 5dfbc08933f2db994b2e100b9c49f480=C2=A0 xf86-video-nouveau-1.=
0.12.tar.gz<br>
SHA1: c0ad3ccdfab29c43d2477400069e40c54c848e29=C2=A0 xf86-video-nouveau-1.0=
.12.tar.gz<br>
SHA256: b82ed744e3431d077c54516d8447da292a9028b1b1ce1055a2062807b08c24b6=C2=
=A0 xf86-video-nouveau-1.0.12.tar.gz<br>
PGP:=C2=A0 <a href=3D"http://xorg.freedesktop.org/archive/individual/driver=
/xf86-video-nouveau-1.0.12.tar.gz.sig" rel=3D"noreferrer" target=3D"_blank"=
>http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1=
.0.12.tar.gz.sig</a><br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1<br>
<br>
iQIcBAEBAgAGBQJWaOKRAAoJEAx081l5xIa+Oq4QAJ7DMs0a+39VTIMLyMmL5/2o<br>
FLf5htw5vSAkrX2GizolNli4F560q+NS77pR2WVMKvX9noqjMZQcAU0m8w6K5OmR<br>
28xMma89CXXZNcJ3UiYTr5CyDBL8N3KqrIxL+a8QDIe7jI7J/IAFBSCLtEaDhDfS<br>
z8r/Pj28LvEGBn4dCvRjflToE4sMxlkzGgtFiWG8hQputsQ1REGiChuAx+0DzMAG<br>
XGpLliSj1Nc1e1b/tVCBupIoEgqu42+cX/Sc3/ECaOhX/VlNb8av3ChJjPkTtwGU<br>
Gq4P172/43U5/34/M8RJ1OxZ+3Cm/ANadk9w0Kay1hy4z7ELFfdpmJEXWlIVe4dE<br>
e32vnmGVil+aLWu+o6OjcPSI+Cg3HgZAUKu0PrnONSRRzZUDGY9DVLHsHuPeRGqw<br>
uqG7+MEVT0cJm3cueeyyiAGn+oPk9IRpxmZeJ+TFf95HEWLZE3ZHLoRSfmb6fBMV<br>
1dRkpQ4g/yUIAGqGn4r+XrV70b8cQDCZiroFXs0bdtY9ckXaGg46x+je0NMIUBG2<br>
vhwRUGN6rQctnGwnkl7vzKmHR2K1VNi+VMrV8ykd4b6mQcPBw3Qvo1Liu+stY4EA<br>
vUx4mKC5HDs2Pka+Nxk6gOSBUadpX6TfH/ZF7zYBjXjETIlsGPWhYJsQB004pSer<br>
OVrN2TQsPPAmvUpxoQyT<br>
=3Db4WM<br>
-----END PGP SIGNATURE-----<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
</blockquote></div><br></div>

--001a11409e021ee0b0052682027e--

--===============1077131832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1077131832==--
