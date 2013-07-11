From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: UBO support for nouveau broken
Date: Thu, 11 Jul 2013 16:34:46 -0500
Message-ID: <CAEk2St=fx2uCEweZGm9rObzVAysMqJxji049Eewa30coJf7x-A@mail.gmail.com>
References: <CAMv9YTfiUo3BtogiohwiC5cLd7qkYYUuxvjhkY1vXpW_LEP2+g@mail.gmail.com>
	<CAMv9YTeSg9fcbmJ3k3tN2HtFjO4kSEsB7cQP_8CquvfCR9=d=A@mail.gmail.com>
	<CAEk2StkRDYxBuZZ=O1N46=qYfdS6UPi4bQ8QSpc=XjCbXpHshA@mail.gmail.com>
	<CAMv9YTefThggQ0-y5xgYkURuAou=pxMQ3xnh70Hx9PgCKwSbrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0899074129=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMv9YTefThggQ0-y5xgYkURuAou=pxMQ3xnh70Hx9PgCKwSbrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0899074129==
Content-Type: multipart/alternative; boundary=089e01536e06bc98fe04e1432913

--089e01536e06bc98fe04e1432913
Content-Type: text/plain; charset=ISO-8859-1

Thomas,

OK, thanks for the update. I don't have a working machine with NV graphics
that supports UBOs. Could you compile and run a test program for me if I
wrote it? Though it may appear to not work for UBO offsets other than 0,
there may be another pattern here, such as multiple of page size or
something crazy like that. If we can find more information, it may help
other developers.

Patrick


On Thu, Jul 11, 2013 at 4:24 PM, Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:

> I myself am not that well-versed in c and opengl - especially opengl - I
> can read and write basic c code but that's my limit.
> The problem only appears when using an offset that's not zero.If you want
> to debug the issue you could very well use the dolphin-emu and apitrace.
> You can find one apitrace here http://markus.members.selfnet.de/dolphin/dolphin-emu.trace
> (~48M)
> The only 2 reasons I ever thought of learning more c and opengl were
> dolphin and nouveau (what a coincidence).
> Hope that could help.
> With kind regards,
> Thomas Schneider
>
>
> 2013/7/11 Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
>> Hi Thomas,
>>
>> Are you well-versed in C and OpenGL? If so, can you write a test case for
>> it that shows the problem? If not, would you mind running a test case if I
>> wrote it and letting me know how well it works (if at all)? I'm not a
>> nouveau developer, but I do have an interest in seeing this bug resolved
>> (my app needs working GL 3.3 support) and I imagine compiling and running
>> an emulator (including downloading test ISOs) is a very... un-fun ... task
>> to reproduce your bug, indeed.
>>
>> Let me know so we can get to the bottom of this!
>>
>> Best Regards,
>>
>> Patrick
>>
>>
>> On Thu, Jul 11, 2013 at 2:21 PM, Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>wrote:
>>
>>> Oh and just for the sake of completeness the problem occurs in the form
>>> of wrongly rendered textures in front of a black screen. The objects only
>>> are fusible for a second and them disappear sometimes they appear at the
>>> wrong position or are rotated.
>>> If you compile dolphin with GLEW_ARB_uniform_buffer_object replaced with
>>> false in Source/Plugins/Plugin_VideoOGL/Src/Render.cpp the problems won't
>>> occur.
>>>  I tried testing it with other cards but they got different problems
>>> for example my "GeForce GTX 560 SE" throws dozens of
>>>>
>>>> [   63.403141] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR [(unknown
>>> enum 0x00000053)] ch 3 [0x023fa7b000 dolphin-emu[727]] subc 2 class 0x9039
>>> mthd 0x0300 data 0x00100100
>>> lines when trying to run dolphin with it.I will try to test it later
>>> with all my remaining nvidia cards and nouveau.
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>>
>>
>

--089e01536e06bc98fe04e1432913
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thomas,<div><br></div><div style>OK, thanks for the update=
. I don&#39;t have a working machine with NV graphics that supports UBOs. C=
ould you compile and run a test program for me if I wrote it? Though it may=
 appear to not work for UBO offsets other than 0, there may be another patt=
ern here, such as multiple of page size or something crazy like that. If we=
 can find more information, it may help other developers.</div>
<div style><br></div><div style>Patrick</div></div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Thu, Jul 11, 2013 at 4:24 PM, Thom=
as Schneider <span dir=3D"ltr">&lt;<a href=3D"mailto:maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
target=3D"_blank">maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><div>I mysel=
f am not that well-versed in c and <span>opengl</span> - especially <span>o=
pengl</span> - I can read and write basic c code but that&#39;s my limit.<b=
r>

The problem only appears when using an offset that&#39;s not zero.If you wa=
nt to debug the issue you could very well use the dolphin-emu and <span>api=
trace</span>.<br></div>You can find one <span>apitrace</span> here http://<=
span>markus</span>.members.<span>selfnet</span>.<span>de</span>/dolphin/dol=
phin-emu.trace (~48M)<br>

</div>The only 2 reasons I ever thought of learning more c and <span>opengl=
</span> were dolphin and <span>nouveau</span> (what a coincidence).<br></di=
v>Hope that could help.<br></div>With kind regards,<br>
Thomas Schneider<br></div><div class=3D"HOEnZb"><div class=3D"h5"><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/7/11 Patrick Bagg=
ett <span dir=3D"ltr">&lt;<a href=3D"mailto:baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" targ=
et=3D"_blank">baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span><br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Thomas,<div><br></div><d=
iv>Are you well-versed in C and OpenGL? If so, can you write a test case fo=
r it that shows the problem? If not, would you mind running a test case if =
I wrote it and letting me know how well it works (if at all)? I&#39;m not a=
 nouveau developer, but I do have an interest in seeing this bug resolved (=
my app needs working GL 3.3 support) and I imagine compiling and running an=
 emulator (including downloading test ISOs) is a very... un-fun ... task to=
 reproduce your bug, indeed.</div>


<div><br></div><div>Let me know so we can get to the bottom of this!</div><=
div><br></div><div>Best Regards,</div><div><br></div><div>Patrick</div></di=
v><div class=3D"gmail_extra"><br><br>
<div class=3D"gmail_quote"><div><div>On Thu, Jul 11, 2013 at 2:21 PM, Thoma=
s Schneider <span dir=3D"ltr">&lt;<a href=3D"mailto:maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" t=
arget=3D"_blank">maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br></div>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div><div>
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
<br></div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
<br></blockquote></div><br></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--089e01536e06bc98fe04e1432913--

--===============0899074129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0899074129==--
