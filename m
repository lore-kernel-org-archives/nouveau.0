From: Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: UBO support for nouveau broken
Date: Thu, 11 Jul 2013 21:21:50 +0200
Message-ID: <CAMv9YTeSg9fcbmJ3k3tN2HtFjO4kSEsB7cQP_8CquvfCR9=d=A@mail.gmail.com>
References: <CAMv9YTfiUo3BtogiohwiC5cLd7qkYYUuxvjhkY1vXpW_LEP2+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1590925812=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMv9YTfiUo3BtogiohwiC5cLd7qkYYUuxvjhkY1vXpW_LEP2+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1590925812==
Content-Type: multipart/alternative; boundary=001a11c26a305dacc904e1414e86

--001a11c26a305dacc904e1414e86
Content-Type: text/plain; charset=ISO-8859-1

Oh and just for the sake of completeness the problem occurs in the form of
wrongly rendered textures in front of a black screen. The objects only are
fusible for a second and them disappear sometimes they appear at the wrong
position or are rotated.
If you compile dolphin with GLEW_ARB_uniform_buffer_object replaced with
false in Source/Plugins/Plugin_VideoOGL/Src/Render.cpp the problems won't
occur.
 I tried testing it with other cards but they got different problems for
example my "GeForce GTX 560 SE" throws dozens of
>
> [   63.403141] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [(unknown enum
0x00000053)] ch 3 [0x023fa7b000 dolphin-emu[727]] subc 2 class 0x9039 mthd
0x0300 data 0x00100100
lines when trying to run dolphin with it.I will try to test it later with
all my remaining nvidia cards and nouveau.

--001a11c26a305dacc904e1414e86
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">Oh and just for the sake of completeness th=
e problem occurs in the form of wrongly rendered textures in front of a bla=
ck screen. The objects only are fusible for a second and them disappear som=
etimes they appear at the wrong position or are rotated.<br>


If you compile dolphin with GLEW_ARB_uniform_buffer_object replaced with fa=
lse in Source/Plugins/Plugin_VideoOGL/Src/Render.cpp the problems won&#39;t=
 occur.<br>
</p>
<div class=3D"gmail_quote">I tried testing it with other cards but they got=
 different problems for example my &quot;GeForce GTX 560 SE&quot; throws do=
zens of=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex">

</blockquote></div><div class=3D"gmail_quote"><div class=3D"gmail_quote">[ =
=A0 63.403141] nouveau E[ =A0PGRAPH][0000:01:00.0] DATA_ERROR [(unknown enu=
m 0x00000053)] ch 3 [0x023fa7b000 dolphin-emu[727]] subc 2 class 0x9039 mth=
d 0x0300 data 0x00100100</div>
<div>lines when trying to run dolphin with it.I will try to test it later w=
ith all my remaining nvidia cards and nouveau.</div></div>
</div>

--001a11c26a305dacc904e1414e86--

--===============1590925812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1590925812==--
