From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fix unaligned accesses for SPARC
Date: Wed, 13 Mar 2013 16:52:03 -0500
Message-ID: <CAEk2StnDyWXQGw-X5SvnReLRj1bFzVerQm4Wg2vJajb+t4m38A@mail.gmail.com>
References: <CAEk2St=L0goZW-9XfKZx0-ApzO9yKYROtusdqZeoOEB=BB+Esg@mail.gmail.com>
	<20130313212910.GB10649@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1632764503=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130313212910.GB10649-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1632764503==
Content-Type: multipart/alternative; boundary=bcaec51b16d59a71df04d7d56a40

--bcaec51b16d59a71df04d7d56a40
Content-Type: text/plain; charset=ISO-8859-1

Marcin,

I had the same messages on NV17, which worked extremely well (OpenGL games
worked fine). The kernel will properly emulate the unaligned access, it
just causes a trap which is slow. If the unaligned access caused an error,
the NV17 card would have been unable to function given the number of
erroneous accesses.

Using __get_unaligned_le would probably remove one byteswap though.

Patrick

On Wed, Mar 13, 2013 at 4:29 PM, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> On Tue, Mar 12, 2013 at 10:18:41PM -0500, Patrick Baggett wrote:
> >    The nouveau driver makes a number of unaligned accesses via the
> >    ROM16(), ROM32() and ROM64() macros which fault on SPARC (but would be
> >    transparently handled by x86 hardware). Making use of get_unaligned()
> >    macro fixes the problem for me.
> >
> >    diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h
> >    b/drivers/gpu/drm/nouveau/nouveau_bios.h
> >    index 7ccd28f..92031f6 100644
> >    --- a/drivers/gpu/drm/nouveau/nouveau_bios.h
> >    +++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
> >    @@ -26,6 +26,8 @@
> >     #include "nvreg.h"
> >    +#include <asm/unaligned.h>
> >    +
> >     #define DCB_MAX_NUM_ENTRIES 16
> >     #define DCB_MAX_NUM_I2C_ENTRIES 16
> >     #define DCB_MAX_NUM_GPIO_ENTRIES 32
> >    @@ -33,10 +35,10 @@
> >     #define DCB_LOC_ON_CHIP 0
> >    -#define ROM16(x) le16_to_cpu(*(u16 *)&(x))
> >    -#define ROM32(x) le32_to_cpu(*(u32 *)&(x))
> >    +#define ROM16(x) le16_to_cpu(get_unaligned((u16 *)&(x)))
> >    +#define ROM32(x) le32_to_cpu(get_unaligned((u32 *)&(x)))
> >     #define ROM48(x) ({ u8 *p = &(x); (u64)ROM16(p[4]) << 32 |
> >    ROM32(p[0]); })
> >    -#define ROM64(x) le64_to_cpu(*(u64 *)&(x))
> >    +#define ROM64(x) le64_to_cpu(get_unaligned((u64 *)&(x)))
> >     #define ROMPTR(d,x) ({            \
> >            struct nouveau_drm *drm = nouveau_drm((d)); \
> >            ROM16(x) ? &drm->vbios.data[ROM16(x)] : NULL; \
>
> Please take a look at Documentation/SubmittingPatches and resubmit after
> adapting.
>
> IMHO, I think you should submit this patch only once you figure out how to
> correctly boot and use at least basic accelerated operations, because I'm
> not
> 100% sure this is correct - 1. you have other severe issues with nouveau
> which
> may or may not be connected to this code, 2. sparc defines get_unaligned to
> __get_unaligned_be, so maybe you need to use _le variant? or maybe use
> get_unaligned_le* without le*_to_cpu?.
>
> Marcin
>

--bcaec51b16d59a71df04d7d56a40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Marcin,<div><br></div><div>I had the same messages on NV17, which worked ex=
tremely well (OpenGL games worked fine). The kernel will properly emulate t=
he unaligned access, it just causes a trap which is slow. If the unaligned =
access caused an error, the NV17 card would have been unable to function gi=
ven the number of erroneous accesses.</div>
<div><br></div><div>Using __get_unaligned_le would probably remove one byte=
swap though.</div><div><br></div><div>Patrick<br><br><div class=3D"gmail_qu=
ote">On Wed, Mar 13, 2013 at 4:29 PM, Marcin Slusarz <span dir=3D"ltr">&lt;=
<a href=3D"mailto:marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">marcin.slusar=
z@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
ue, Mar 12, 2013 at 10:18:41PM -0500, Patrick Baggett wrote:<br>
&gt; =A0 =A0The nouveau driver makes a number of unaligned accesses via the=
<br>
&gt; =A0 =A0ROM16(), ROM32() and ROM64() macros which fault on SPARC (but w=
ould be<br>
&gt; =A0 =A0transparently handled by x86 hardware). Making use of get_unali=
gned()<br>
&gt; =A0 =A0macro fixes the problem for me.<br>
&gt;<br>
&gt; =A0 =A0diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h<br>
&gt; =A0 =A0b/drivers/gpu/drm/nouveau/nouveau_bios.h<br>
&gt; =A0 =A0index 7ccd28f..92031f6 100644<br>
&gt; =A0 =A0--- a/drivers/gpu/drm/nouveau/nouveau_bios.h<br>
&gt; =A0 =A0+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h<br>
&gt; =A0 =A0@@ -26,6 +26,8 @@<br>
&gt; =A0 =A0 #include &quot;nvreg.h&quot;<br>
&gt; =A0 =A0+#include &lt;asm/unaligned.h&gt;<br>
&gt; =A0 =A0+<br>
&gt; =A0 =A0 #define DCB_MAX_NUM_ENTRIES 16<br>
&gt; =A0 =A0 #define DCB_MAX_NUM_I2C_ENTRIES 16<br>
&gt; =A0 =A0 #define DCB_MAX_NUM_GPIO_ENTRIES 32<br>
&gt; =A0 =A0@@ -33,10 +35,10 @@<br>
&gt; =A0 =A0 #define DCB_LOC_ON_CHIP 0<br>
&gt; =A0 =A0-#define ROM16(x) le16_to_cpu(*(u16 *)&amp;(x))<br>
&gt; =A0 =A0-#define ROM32(x) le32_to_cpu(*(u32 *)&amp;(x))<br>
&gt; =A0 =A0+#define ROM16(x) le16_to_cpu(get_unaligned((u16 *)&amp;(x)))<b=
r>
&gt; =A0 =A0+#define ROM32(x) le32_to_cpu(get_unaligned((u32 *)&amp;(x)))<b=
r>
&gt; =A0 =A0 #define ROM48(x) ({ u8 *p =3D &amp;(x); (u64)ROM16(p[4]) &lt;&=
lt; 32 |<br>
&gt; =A0 =A0ROM32(p[0]); })<br>
&gt; =A0 =A0-#define ROM64(x) le64_to_cpu(*(u64 *)&amp;(x))<br>
&gt; =A0 =A0+#define ROM64(x) le64_to_cpu(get_unaligned((u64 *)&amp;(x)))<b=
r>
&gt; =A0 =A0 #define ROMPTR(d,x) ({ =A0 =A0 =A0 =A0 =A0 =A0\<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_drm *drm =3D nouveau_drm((d)); \=
<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0ROM16(x) ? &amp;drm-&gt;vbios.data[ROM16(x)] : =
NULL; \<br>
<br>
</div></div>Please take a look at Documentation/SubmittingPatches and resub=
mit after<br>
adapting.<br>
<br>
IMHO, I think you should submit this patch only once you figure out how to<=
br>
correctly boot and use at least basic accelerated operations, because I&#39=
;m not<br>
100% sure this is correct - 1. you have other severe issues with nouveau wh=
ich<br>
may or may not be connected to this code, 2. sparc defines get_unaligned to=
<br>
__get_unaligned_be, so maybe you need to use _le variant? or maybe use<br>
get_unaligned_le* without le*_to_cpu?.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Marcin<br>
</font></span></blockquote></div><br></div>

--bcaec51b16d59a71df04d7d56a40--

--===============1632764503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1632764503==--
