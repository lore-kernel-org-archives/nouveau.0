From: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau fails to initialize G94GL / Quadro-FX1800 on
 aarch64 board
Date: Thu, 7 Jul 2016 20:26:37 +0200
Message-ID: <CAFvQSYQDmZbzMRDi04uFPFS7_ejbZdt3QPV_mu-N=kaAdT0HFQ@mail.gmail.com>
References: <CAFvQSYRgoo6x=J4tbo3VZgAT2cyQTj=WcuwzrHtV-g4XKtTj9w@mail.gmail.com>
 <CAKb7UvjSA9OAAzuvaFRpwWEVyDfGLxJnnPQrq-AyLWuh4m9-Pw@mail.gmail.com>
 <CAFvQSYTYdxSFDEFgY69hzfGFGcChG3YBGtyQthJgkdOAxTu09Q@mail.gmail.com>
 <CAFvQSYSU5VHvThwihgbOuxr5cCerXCYEbhTWf2YiJnhd_8x-4w@mail.gmail.com>
 <CAFvQSYS8_KmFBsOfrk955dO9J8p9bvFeHCDR=XYopQmN1pe+3g@mail.gmail.com>
 <CAKb7Uviqrn6qddpk6Bag2G9EzDGgvjSqGC=UFLfUmKo8jFSaLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0846480641=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uviqrn6qddpk6Bag2G9EzDGgvjSqGC=UFLfUmKo8jFSaLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0846480641==
Content-Type: multipart/alternative; boundary=001a11493a04a64b8f05370fd30c

--001a11493a04a64b8f05370fd30c
Content-Type: text/plain; charset=UTF-8

Hi,

> It's surprising that it's coming up as a platform device and not a pci
> device. Perhaps xorg was built without pci support? (Not sure if
> that's even possible.)
>
> It should definitely not be coming up as a GPU screen, but as a regular
screen.

When forcing it to initialize as normal screen everything seems to work
perfectly!
Xorg was used prebuilt from Debian unstable...

I'll try to find out where the culprit is...

Thanks a lot , Clemens

--001a11493a04a64b8f05370fd30c
Content-Type: text/html; charset=UTF-8

<p dir="ltr">Hi,</p>
<p dir="ltr">&gt; It&#39;s surprising that it&#39;s coming up as a platform device and not a pci<br>
&gt; device. Perhaps xorg was built without pci support? (Not sure if<br>
&gt; that&#39;s even possible.)<br>
&gt;<br>
&gt; It should definitely not be coming up as a GPU screen, but as a regular screen.</p>
<p dir="ltr">When forcing it to initialize as normal screen everything seems to work perfectly! <br>
Xorg was used prebuilt from Debian unstable...</p>
<p dir="ltr">I&#39;ll try to find out where the culprit is...</p>
<p dir="ltr">Thanks a lot , Clemens</p>

--001a11493a04a64b8f05370fd30c--

--===============0846480641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0846480641==--
