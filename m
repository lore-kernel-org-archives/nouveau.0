From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Cannot compile origin/for-airlied against kernel
	2.6.34
Date: Wed, 19 May 2010 20:16:04 +0200
Message-ID: <4BF42AE4.6050603@gmx.de>
References: <4BF42628.9020506@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838821846=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BF42628.9020506-Mmb7MZpHnFY@public.gmane.org>
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
--===============0838821846==
Content-Type: multipart/alternative;
 boundary="------------030204080604070009050003"

This is a multi-part message in MIME format.
--------------030204080604070009050003
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Am 19.05.2010 19:55, schrieb Johannes Obermayr:
> Hi,
>
> As summary says I cannot compile latest origin/for-airlied against
> kernel 2.6.34 on openSUSE.
>
> My archive:
> git archive origin/for-airlied drivers/gpu/ include/drm/
> --prefix=drm-all/ | bzip2 >../drm-nouveau.tar.bz2
> (So all necessary things should be in it ...)
>
> If you need further information:
> https://build.opensuse.org/package/show?package=drm-nouveau&project=home%3Ajobermayr
> (I think the website is self-explaining ...)
>
> Thanks.
> Johannes
>
> |CC [M]  /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o
> /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:215: error: conflicting types for 'drm_do_probe_ddc_edid'
> /usr/src/linux-2.6.34-34/include/drm/drm_crtc.h:669: note: previous declaration of 'drm_do_probe_ddc_edid' was here
> /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c: In function 'drm_mode_std':
> /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:889: error: implicit declaration of function 'drm_gtf_mode_complex'
> /usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.c:894: warning: assignment makes pointer from integer without a cast
> make[4]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm/drm_edid.o] Error 1
> make[3]: *** [/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default/drm] Error 2
> make[2]: *** [_module_/usr/src/packages/BUILD/drm-all-20100519/drm-all/obj/default] Error 2
> make[1]: *** [sub-make] Error 2
> make: *** [all] Error 2
> make: Leaving directory `/usr/src/linux-2.6.34-34-obj/i386/default'|
>
I could fix above build failure - it was a wrong includedir (sorry). But
now I have this error:

|CC [M]  /usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.o
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c: In function 'intelfb_create':
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:131: error: 'struct fb_info' has no member named 'apertures'
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:131: error: implicit declaration of function 'alloc_apertures'
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:132: error: 'struct fb_info' has no member named 'apertures'
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:136: error: 'struct fb_info' has no member named 'apertures'
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:138: error: 'struct fb_info' has no member named 'apertures'
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.c:140: error: 'struct fb_info' has no member named 'apertures'
make[5]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915/intel_fb.o] Error 1
make[4]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915] Error 2
make[3]: *** [/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm] Error 2
make[2]: *** [_module_/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default] Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2
make: Leaving directory `/usr/src/linux-2.6.34-34-obj/i386/default'|

--------------030204080604070009050003
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html; charset=3DISO-8859-15"
 http-equiv=3D"Content-Type">
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Am 19.05.2010 19:55, schrieb Johannes Obermayr:
<blockquote cite=3D"mid:4BF42628.9020506-Mmb7MZpHnFY@public.gmane.org" type=3D"cite">
  <meta http-equiv=3D"content-type"
 content=3D"text/html; charset=3DISO-8859-15">
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
  <a moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"
 href=3D"https://build.opensuse.org/package/show?package=3Ddrm-nouveau&am=
p;project=3Dhome%3Ajobermayr">https://build.opensuse.org/package/show?pac=
kage=3Ddrm-nouveau&amp;project=3Dhome%3Ajobermayr</a><br>
(I think the website is self-explaining ...)<br>
  <br>
Thanks.<br>
Johannes<br>
  <br>
  <code id=3D"log_space">CC=A0[M]=A0=A0/usr/src/packages/BUILD/drm-all-20=
100519/drm-all/obj/default/drm/drm_edid.o<br>
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
  <br>
</blockquote>
I could fix above build failure - it was a wrong includedir (sorry).
But now I have this error:<br>
<br>
<code id=3D"log_space">CC=A0[M]=A0=A0/usr/src/packages/BUILD/drm-nouveau-=
20100519/drm-all/obj/default/drm/i915/intel_fb.o<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:=A0In=A0function=A0'intelfb_create':<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:131:=A0error:=A0'struct=A0fb_info'=A0has=A0no=A0member=A0name=
d=A0'apertures'<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:131:=A0error:=A0implicit=A0declaration=A0of=A0function=A0'all=
oc_apertures'<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:132:=A0error:=A0'struct=A0fb_info'=A0has=A0no=A0member=A0name=
d=A0'apertures'<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:136:=A0error:=A0'struct=A0fb_info'=A0has=A0no=A0member=A0name=
d=A0'apertures'<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:138:=A0error:=A0'struct=A0fb_info'=A0has=A0no=A0member=A0name=
d=A0'apertures'<br>
/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/obj/default/drm/i915=
/intel_fb.c:140:=A0error:=A0'struct=A0fb_info'=A0has=A0no=A0member=A0name=
d=A0'apertures'<br>
make[5]:=A0***=A0[/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/ob=
j/default/drm/i915/intel_fb.o]=A0Error=A01<br>
make[4]:=A0***=A0[/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/ob=
j/default/drm/i915]=A0Error=A02<br>
make[3]:=A0***=A0[/usr/src/packages/BUILD/drm-nouveau-20100519/drm-all/ob=
j/default/drm]=A0Error=A02<br>
make[2]:=A0***=A0[_module_/usr/src/packages/BUILD/drm-nouveau-20100519/dr=
m-all/obj/default]=A0Error=A02<br>
make[1]:=A0***=A0[sub-make]=A0Error=A02<br>
make:=A0***=A0[all]=A0Error=A02<br>
make:=A0Leaving=A0directory=A0`/usr/src/linux-2.6.34-34-obj/i386/default'=
</code><br>
</body>
</html>

--------------030204080604070009050003--

--===============0838821846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0838821846==--
