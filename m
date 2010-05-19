From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Cannot compile origin/for-airlied against kernel 2.6.34
Date: Wed, 19 May 2010 19:55:52 +0200
Message-ID: <4BF42628.9020506@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0538576683=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0538576683==
Content-Type: multipart/alternative;
 boundary="------------060008060402070201090108"

This is a multi-part message in MIME format.
--------------060008060402070201090108
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

As summary says I cannot compile latest origin/for-airlied against
kernel 2.6.34 on openSUSE.

My archive:
git archive origin/for-airlied drivers/gpu/ include/drm/
--prefix=drm-all/ | bzip2 >../drm-nouveau.tar.bz2
(So all necessary things should be in it ...)

If you need further information:
https://build.opensuse.org/package/show?package=drm-nouveau&project=home%3Ajobermayr
(I think the website is self-explaining ...)

Thanks.
Johannes

|CC [M]  /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:215: error: conflicting types for 'drm_do_probe_ddc_edid'
/usr/src/linux-2.6.34-34/include/drm/drm_crtc.h:669: note: previous declaration of 'drm_do_probe_ddc_edid' was here
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c: In function 'drm_mode_std':
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:889: error: implicit declaration of function 'drm_gtf_mode_complex'
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:894: warning: assignment makes pointer from integer without a cast
make[4]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o] Error 1
make[3]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm] Error 2
make[2]: *** [_module_/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default] Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2
make: Leaving directory `/usr/src/linux-2.6.34-34-obj/i386/default'|

--------------060008060402070201090108
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv=3D"content-type" content=3D"text/html; charset=3DISO-885=
9-15">
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Hi,<br>
<br>
As summary says I cannot compile latest origin/for-airlied against
kernel 2.6.34 on openSUSE.<br>
<br>
My archive:<br>
git archive origin/for-airlied drivers/gpu/ include/drm/
--prefix=3Ddrm-all/ | bzip2 &gt;../drm-nouveau.tar.bz2<br>
(So all necessary things should be in it ...)<br>
<br>
If you need further information:<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://build.opensuse.org/pac=
kage/show?package=3Ddrm-nouveau&amp;project=3Dhome%3Ajobermayr">https://b=
uild.opensuse.org/package/show?package=3Ddrm-nouveau&amp;project=3Dhome%3=
Ajobermayr</a><br>
(I think the website is self-explaining ...)<br>
<br>
Thanks.<br>
Johannes<br>
<br>
<code id=3D"log_space">CC=A0[M]=A0=A0/usr/src/packages/BUILD/drm-all-2010=
0519/drm-all/obj/default/drm/drm_edid.o<br>
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid=
.c:215:=A0error:=A0conflicting=A0types=A0for=A0'drm_do_probe_ddc_edid'<br=
>
/usr/src/linux-2.6.34-34/include/drm/drm_crtc.h:669:=A0note:=A0previous=A0=
declaration=A0of=A0'drm_do_probe_ddc_edid'=A0was=A0here<br>
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid=
.c:=A0In=A0function=A0'drm_mode_std':<br>
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid=
.c:889:=A0error:=A0implicit=A0declaration=A0of=A0function=A0'drm_gtf_mode=
_complex'<br>
/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid=
.c:894:=A0warning:=A0assignment=A0makes=A0pointer=A0from=A0integer=A0with=
out=A0a=A0cast<br>
make[4]:=A0***=A0[/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/de=
fault/drm/drm_edid.o]=A0Error=A01<br>
make[3]:=A0***=A0[/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/de=
fault/drm]=A0Error=A02<br>
make[2]:=A0***=A0[_module_/usr/src/packages/BUILD/drm-all-20100519/drm-al=
l/obj/default]=A0Error=A02<br>
make[1]:=A0***=A0[sub-make]=A0Error=A02<br>
make:=A0***=A0[all]=A0Error=A02<br>
make:=A0Leaving=A0directory=A0`/usr/src/linux-2.6.34-34-obj/i386/default'=
</code><br>
</body>
</html>

--------------060008060402070201090108--

--===============0538576683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0538576683==--
