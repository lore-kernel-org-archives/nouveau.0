From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: NV130 - gtx 1050 ti
Date: Thu, 4 May 2017 19:33:29 -0400
Message-ID: <CAKb7UvjzCXeW=A6H7wrh7eqBtWpukpsiLyAFQBwXCt8sjZRBtQ@mail.gmail.com>
References: <160646ee-8f7f-7a5d-b703-dd951b1d815b@xtronics.com>
 <20170504090040.xnlpegbhp6jbwalp@pmoreau.org>
 <4e019d05-4e63-cde0-aa89-8b8eb1ea94bc@xtronics.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284468122=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4e019d05-4e63-cde0-aa89-8b8eb1ea94bc-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karl Schmidt <karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1284468122==
Content-Type: multipart/alternative; boundary=001a114fdea2438225054ebb3387

--001a114fdea2438225054ebb3387
Content-Type: text/plain; charset=UTF-8

On May 4, 2017 6:44 PM, "Karl Schmidt" <karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org> wrote:

On 05/04/2017 04:00 AM, Pierre Moreau wrote:

> Hello,
>
> Acceleration for Pascal cards is coming in Linux 4.12, support for Pascal
> cards
> in xorg-video-nouveau is in 1.0.15, and if I remember correctly, on the
> Mesa-side, you will need >=17.0.
>

Thanks - I suspected it was too new.

I'm finding the monitor capabilities miss identified even if I use an older
card - I'm guessing that nouveau talks to the monitor to get the an ID?
And then passes that to some part of xorg or something that looks up the id
number?

There have been several hardware detection bits over the years - I did a
dependency tree on xorg and still don't know where to find it.

Who should I contact to get them the correct monitor info?



The monitors store this info themselves in an i2c-accessible blob. Nouveau
will just read that out and pass it on, like all other drivers do. The EDID
contains info about modeline, etc.

--001a114fdea2438225054ebb3387
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On May 4, 2017 6:44 PM, &quot;Karl Schmidt&quot; &lt;<a href=3D"m=
ailto:karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org">karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org</a>&gt; wrote:<br type=3D"attrib=
ution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">On 05/04/2017 04=
:00 AM, Pierre Moreau wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
Acceleration for Pascal cards is coming in Linux 4.12, support for Pascal c=
ards<br>
in xorg-video-nouveau is in 1.0.15, and if I remember correctly, on the<br>
Mesa-side, you will need &gt;=3D17.0.<br>
</blockquote>
<br></div>
Thanks - I suspected it was too new.<br>
<br>
I&#39;m finding the monitor capabilities miss identified even if I use an o=
lder card - I&#39;m guessing that nouveau talks to the monitor to get the a=
n ID?=C2=A0 And then passes that to some part of xorg or something that loo=
ks up the id number?<br>
<br>
There have been several hardware detection bits over the years - I did a de=
pendency tree on xorg and still don&#39;t know where to find it.<br>
<br>
Who should I contact to get them the correct monitor info?</blockquote></di=
v></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">The monitors store this info themselves in an i2c-accessible b=
lob. Nouveau will just read that out and pass it on, like all other drivers=
 do. The EDID contains info about modeline, etc.</div></div>

--001a114fdea2438225054ebb3387--

--===============1284468122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1284468122==--
