From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: UBO support for nouveau broken
Date: Thu, 11 Jul 2013 14:52:03 -0500
Message-ID: <CAEk2StkRDYxBuZZ=O1N46=qYfdS6UPi4bQ8QSpc=XjCbXpHshA@mail.gmail.com>
References: <CAMv9YTfiUo3BtogiohwiC5cLd7qkYYUuxvjhkY1vXpW_LEP2+g@mail.gmail.com>
	<CAMv9YTeSg9fcbmJ3k3tN2HtFjO4kSEsB7cQP_8CquvfCR9=d=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0536452444=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMv9YTeSg9fcbmJ3k3tN2HtFjO4kSEsB7cQP_8CquvfCR9=d=A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0536452444==
Content-Type: multipart/alternative; boundary=047d7bdc876c66973e04e141ba76

--047d7bdc876c66973e04e141ba76
Content-Type: text/plain; charset=ISO-8859-1

Hi Thomas,

Are you well-versed in C and OpenGL? If so, can you write a test case for
it that shows the problem? If not, would you mind running a test case if I
wrote it and letting me know how well it works (if at all)? I'm not a
nouveau developer, but I do have an interest in seeing this bug resolved
(my app needs working GL 3.3 support) and I imagine compiling and running
an emulator (including downloading test ISOs) is a very... un-fun ... task
to reproduce your bug, indeed.

Let me know so we can get to the bottom of this!

Best Regards,

Patrick


On Thu, Jul 11, 2013 at 2:21 PM, Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> Oh and just for the sake of completeness the problem occurs in the form of
> wrongly rendered textures in front of a black screen. The objects only are
> fusible for a second and them disappear sometimes they appear at the wrong
> position or are rotated.
> If you compile dolphin with GLEW_ARB_uniform_buffer_object replaced with
> false in Source/Plugins/Plugin_VideoOGL/Src/Render.cpp the problems won't
> occur.
>  I tried testing it with other cards but they got different problems for
> example my "GeForce GTX 560 SE" throws dozens of
>>
>> [   63.403141] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [(unknown
> enum 0x00000053)] ch 3 [0x023fa7b000 dolphin-emu[727]] subc 2 class 0x9039
> mthd 0x0300 data 0x00100100
> lines when trying to run dolphin with it.I will try to test it later with
> all my remaining nvidia cards and nouveau.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>

--047d7bdc876c66973e04e141ba76
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div><br></div><div style>Are you well-versed in=
 C and OpenGL? If so, can you write a test case for it that shows the probl=
em? If not, would you mind running a test case if I wrote it and letting me=
 know how well it works (if at all)? I&#39;m not a nouveau developer, but I=
 do have an interest in seeing this bug resolved (my app needs working GL 3=
.3 support) and I imagine compiling and running an emulator (including down=
loading test ISOs) is a very... un-fun ... task to reproduce your bug, inde=
ed.</div>
<div style><br></div><div style>Let me know so we can get to the bottom of =
this!</div><div style><br></div><div style>Best Regards,</div><div style><b=
r></div><div style>Patrick</div></div><div class=3D"gmail_extra"><br><br>
<div class=3D"gmail_quote">On Thu, Jul 11, 2013 at 2:21 PM, Thomas Schneide=
r <span dir=3D"ltr">&lt;<a href=3D"mailto:maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_=
blank">maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
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
<br>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div><br></div>

--047d7bdc876c66973e04e141ba76--

--===============0536452444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0536452444==--
