From: =?UTF-8?B?5a2r5YGJ56iL?= <dmvictor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 8K HEVC decoding with NVIDIA GeForce GTX 1060
Date: Sat, 20 Oct 2018 22:37:39 +0800
Message-ID: <CAPHE55j5Nv-7Le1XwGeM9gWjkn=M8bz9n48x3N97GZrFSL5C6Q@mail.gmail.com>
References: <CAPHE55jvauzGm-QHUSze-Wg+W7S+qnqUobcu5BL+jPKWjBYAAw@mail.gmail.com>
 <CAKb7UviJ-Nu2X9r1qvhA8Y0DYSfC_P45yPohbe5QG2GaoTNYxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2040811743=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviJ-Nu2X9r1qvhA8Y0DYSfC_P45yPohbe5QG2GaoTNYxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2040811743==
Content-Type: multipart/alternative; boundary="00000000000008870b0578a9f9ca"

--00000000000008870b0578a9f9ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ilia,

Thanks for your reply. The works seem complicated.
To the best of my knowledge, at a high level for building my 8K HW decode
enabled Android OS, I need to do the following.

1. Extract firmware from the NVIDIA binary driver.
2. Make a customized kernel with the extracted firmware.
3. Replace Android-x86's kernel with the customized kernel.
4. Add libdrm, DDX, Mesa & libVDPAU to Android-x86 for userspace
implementation.
5. Build the customized Android-x86 image.

Is there something I am missing or misunderstanding? Thank you!

Best regards,

Victor

On Fri, 19 Oct 2018 at 21:09, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Fri, Oct 19, 2018 at 8:53 AM =E5=AD=AB=E5=81=89=E7=A8=8B <dmvictor@gma=
il.com> wrote:
> > I can imagine there is a long way to go to fulfill my requirements. But
> I know a driver for my NVIDIA card is a must for the hardware decoder to
> work. Can somebody shed some lights that if I want to play an 8K HEVC
> encoded video on Android-x86 with NVIDIA's decoder enabled, what should I
> do in this project? And how to start?
>
> The steps are straightforward, although each one of them is fairly tricky=
.
>
> 1. Load decoding firmware into the engine
> 2. Hook up engine "servicing" (like interrupts, channels, etc)
> 3. Figure out the how the commands work, what data they require, how
> that data is formatted, etc.
> 4. Sit back and enjoy some 8K HEVC video.
>
> In VP3/4/5, there are 3 stages to decoding -- BSP (bit-stream
> processor), VP (video processor), and PPP (post-processing
> processor?). Starting with VP6, we believe these got integrated into a
> single engine. However not much more is known. I have a vague notion
> that the way the data is passed in hasn't really changed much,
> although obviously for HEVC it will have as that's a new format.
> Perhaps it's all even simpler now if you don't have to drive the
> VP/PPP independently. But perhaps you still do and they're just all in
> a single engine. I haven't so much as looked at a command stream...
>
> Loading the firmware could be a drag on GM20x+ -- if you have to deal
> with secure mode, it'll be a huge pain. You will also have to locate
> the firmware, which is no longer quite as easy as it once was, I think
> the GPU will DMA it from system memory now as opposed to it being
> uploaded directly in the mmiotrace. I've created a "scanner" tool
> which looks through the blob for firmware-looking things.
>
> Cheers,
>
>   -ilia
>

--00000000000008870b0578a9f9ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Dear Ilia,<br><br>Thanks=
 for your reply. The works seem complicated.<br>To the best of my knowledge=
, at a high level for building my 8K HW decode enabled Android OS, I need t=
o do the following.<br><br>1. Extract firmware from the NVIDIA binary drive=
r.<br>2. Make a customized kernel with the extracted firmware.<br>3. Replac=
e Android-x86&#39;s kernel with the customized kernel.<br>4. Add libdrm, DD=
X, Mesa &amp; libVDPAU to Android-x86 for userspace implementation.<br>5. B=
uild the customized Android-x86 image.<br><br>Is there something I am missi=
ng or misunderstanding? Thank you!<br><br>Best regards,<br><br>Victor<br></=
div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 19 =
Oct 2018 at 21:09, Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org">=
imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Fri, Oct 19, 2018 at 8:53 AM =E5=AD=AB=E5=81=89=E7=A8=8B &lt;<a href=3D=
"mailto:dmvictor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">dmvictor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wr=
ote:<br>
&gt; I can imagine there is a long way to go to fulfill my requirements. Bu=
t I know a driver for my NVIDIA card is a must for the hardware decoder to =
work. Can somebody shed some lights that if I want to play an 8K HEVC encod=
ed video on Android-x86 with NVIDIA&#39;s decoder enabled, what should I do=
 in this project? And how to start?<br>
<br>
The steps are straightforward, although each one of them is fairly tricky.<=
br>
<br>
1. Load decoding firmware into the engine<br>
2. Hook up engine &quot;servicing&quot; (like interrupts, channels, etc)<br=
>
3. Figure out the how the commands work, what data they require, how<br>
that data is formatted, etc.<br>
4. Sit back and enjoy some 8K HEVC video.<br>
<br>
In VP3/4/5, there are 3 stages to decoding -- BSP (bit-stream<br>
processor), VP (video processor), and PPP (post-processing<br>
processor?). Starting with VP6, we believe these got integrated into a<br>
single engine. However not much more is known. I have a vague notion<br>
that the way the data is passed in hasn&#39;t really changed much,<br>
although obviously for HEVC it will have as that&#39;s a new format.<br>
Perhaps it&#39;s all even simpler now if you don&#39;t have to drive the<br=
>
VP/PPP independently. But perhaps you still do and they&#39;re just all in<=
br>
a single engine. I haven&#39;t so much as looked at a command stream...<br>
<br>
Loading the firmware could be a drag on GM20x+ -- if you have to deal<br>
with secure mode, it&#39;ll be a huge pain. You will also have to locate<br=
>
the firmware, which is no longer quite as easy as it once was, I think<br>
the GPU will DMA it from system memory now as opposed to it being<br>
uploaded directly in the mmiotrace. I&#39;ve created a &quot;scanner&quot; =
tool<br>
which looks through the blob for firmware-looking things.<br>
<br>
Cheers,<br>
<br>
=C2=A0 -ilia<br>
</blockquote></div>

--00000000000008870b0578a9f9ca--

--===============2040811743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2040811743==--
