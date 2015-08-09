From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [REGRESSION] nouveau: Crash in
	gk104_fifo_intr_runlist()
Date: Sun, 9 Aug 2015 13:28:46 -0400
Message-ID: <CAKb7Uviet+Bg_KBnaOHGm7b-0vppu6pLDkE-UcoaCcdZ7fEaUg@mail.gmail.com>
References: <20150809170634.GA2712@zyxyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896310471=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20150809170634.GA2712@zyxyz>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0896310471==
Content-Type: multipart/alternative; boundary=001a114029fa8e60df051ce43381

--001a114029fa8e60df051ce43381
Content-Type: text/plain; charset=UTF-8

Alexandre, could you take a look? 0xbad* generally comes from bad mmio
reads.
On Aug 9, 2015 1:08 PM, "Eric Biggers" <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
>
> I am testing Linux v4.2-rc5 and I am sporadically getting crashes shortly
> after
> startup in gk104_fifo_intr_runlist().  What I've found is that the 'mask'
> value
> read from offset 0x2a00 comes back as '0xbad0da00'.  This causes the 'engn'
> variable to be assigned the value 9, which is invalid; then wake_up() is
> called
> on an uninitialized waitqueue which causes the crash.
>
> Reverting commit 1addc12648521d ("drm/nouveau/fifo/gk104: kick channels
> when
> deactivating them") seemed to make the problem go away, although I can't
> be 100%
> sure because the problem is sporadic.
>
> Attached an example of the kernel log up to the crash.
>
> Eric
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--001a114029fa8e60df051ce43381
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Alexandre, could you take a look? 0xbad* generally comes fro=
m bad mmio reads.</p>
<div class=3D"gmail_quote">On Aug 9, 2015 1:08 PM, &quot;Eric Biggers&quot;=
 &lt;<a href=3D"mailto:ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wro=
te:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I am testing Linux v4.2-rc5 and I am sporadically getting crashes shortly a=
fter<br>
startup in gk104_fifo_intr_runlist().=C2=A0 What I&#39;ve found is that the=
 &#39;mask&#39; value<br>
read from offset 0x2a00 comes back as &#39;0xbad0da00&#39;.=C2=A0 This caus=
es the &#39;engn&#39;<br>
variable to be assigned the value 9, which is invalid; then wake_up() is ca=
lled<br>
on an uninitialized waitqueue which causes the crash.<br>
<br>
Reverting commit 1addc12648521d (&quot;drm/nouveau/fifo/gk104: kick channel=
s when<br>
deactivating them&quot;) seemed to make the problem go away, although I can=
&#39;t be 100%<br>
sure because the problem is sporadic.<br>
<br>
Attached an example of the kernel log up to the crash.<br>
<br>
Eric<br>
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"no=
referrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/n=
ouveau</a><br>
<br></blockquote></div>

--001a114029fa8e60df051ce43381--

--===============0896310471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0896310471==--
