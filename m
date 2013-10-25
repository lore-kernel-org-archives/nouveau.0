From: Eugene Shatokhin <euspectre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Fri, 25 Oct 2013 17:19:56 +0400
Message-ID: <CAL5fWtBggbZF3a3TaQ_Cx3QD_vXa2bT2behV20OdJN9DCKYh9g@mail.gmail.com>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
	<20131019101417.50a33eaf@farn.lan>
	<CAL5fWtCUEfSSY=i-50SfgmTeuKgEh28wz492Be1ORJPidj_CvA@mail.gmail.com>
	<20131025120846.277e85aa@farn.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0128189616=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131025120846.277e85aa-DA5HUFbJnAM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0128189616==
Content-Type: multipart/alternative; boundary=047d7bdc8ffe4d483c04e9909b66

--047d7bdc8ffe4d483c04e9909b66
Content-Type: text/plain; charset=ISO-8859-1

Hi,

2013/10/25 Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>

>
> Just curious, how do you detect interesting instructions to
> instrument from uninteresting instructions that do not access mmio
> areas?
>
>
As I currently use this for data race detection in general, there is no
need to separate accesses to mmio areas from the accesses to other memory.
The tool just tracks all except the accesses to the data on the stack (if
it can know for sure the data are on the stack from the address of the
memory area). These are usually not interested for data race detection in
the kernel anyway.

So, yes, almost all the instructions that may access memory (except some
special instructions as well as MMX, SSE, AVX, ...) are instrumented. For
some instructions, it is easy to determine in advance if they access
memory, so I enhanced the decoder from Kprobes to provide that info. For
other instructions (e.g. CMPXCHG, conditional MOVs), it is determined in
runtime whether they access memory and whether this event should be
reported.

So, currently, it does not handle mmio areas in any special way. I am just
evaluating, if it could be useful to create a tool based on the same
technique for these purposes.

mmio areas can be obtained by a driver through a few kernel functions. A
set of currently obtained such areas could be used to filter the accesses
and decide whether to report them or not. So, yes, basically, it is
"instrument everything, filter before reporting to user space".

I guess to be sure your approach does not miss anything, we'd still
> need the page faulting setup as a safety net to know when or if
> something is missed, right? And somehow have the instrumented code
> circumvent it.
>

Page faulting as a safety net... I haven't thought that through yet.

I suppose, I'll look at the code first when I have time and try to
understand at least the common ways for a driver to access mmio areas. It
will be clearer then how to make sure we do not lose anything. And - if it
is possible with the techniques KernelStrider uses.



>
> We could use some comments from the real reverse-engineers. I used
> to be mostly a tool writer.
>

Yes, if some experts could share their knowledge of this matter, this would
be most welcome!

Regards,

Eugene

P.S. If you are interested, more info concerning KernelStrider can be found
in my recent talk at LinuxCon Europe. The slides and notes for them are
available in "Talks and slides" section on the project page (
https://code.google.com/p/kernel-strider/). This is mostly about data races
though.

--047d7bdc8ffe4d483c04e9909b66
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">2013/10/25 Pekka Paalanen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:pq-X3B1VOXEql0@public.gmane.org" target=3D"_blank">pq-X3B1VOXEql0@public.gmane.org</a>&gt;</span><br><div class=3D"=
gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im"><br></div>Just curious, how do you detec=
t interesting instructions to<br>

instrument from uninteresting instructions that do not access mmio<br>
areas?<br>
<br></blockquote><div><br></div><div>As I currently use this for data race =
detection in general, there is no need to separate accesses to mmio areas f=
rom the accesses to other memory. The tool just tracks all except the acces=
ses to the data on the stack (if it can know for sure the data are on the s=
tack from the address of the memory area). These are usually not interested=
 for data race detection in the kernel anyway.</div>
<div><br></div><div>So, yes, almost all the instructions that may access me=
mory (except some special instructions as well as MMX, SSE, AVX, ...) are i=
nstrumented. For some instructions, it is easy to determine in advance if t=
hey access memory, so I enhanced the decoder from Kprobes to provide that i=
nfo. For other instructions (e.g. CMPXCHG, conditional MOVs), it is determi=
ned in runtime whether they access memory and whether this event should be =
reported.</div>
<div><br></div><div>So, currently, it does not handle mmio areas in any spe=
cial way. I am just evaluating, if it could be useful to create a tool base=
d on the same technique for these purposes.<br></div><div><br></div><div>
mmio areas can be obtained by a driver through a few kernel functions. A se=
t of currently obtained such areas could be used to filter the accesses and=
 decide whether to report them or not. So, yes, basically, it is &quot;inst=
rument everything, filter before reporting to user space&quot;.</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">I guess to be sure your approach does not m=
iss anything, we&#39;d still<br>

need the page faulting setup as a safety net to know when or if<br>
something is missed, right? And somehow have the instrumented code<br>
circumvent it.<br></blockquote><div><br></div><div>Page faulting as a safet=
y net... I haven&#39;t thought that through yet.=A0</div><div><br></div><di=
v>I suppose, I&#39;ll look at the code first when I have time and try to un=
derstand at least the common ways for a driver to access mmio areas. It wil=
l be clearer then how to make sure we do not lose anything. And - if it is =
possible with the techniques KernelStrider uses.</div>
<div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex">
<br>
We could use some comments from the real reverse-engineers. I used<br>
to be mostly a tool writer.<br></blockquote><div><br></div><div>Yes, if som=
e experts could share their knowledge of this matter, this would be most we=
lcome!</div><div><br></div><div>Regards,</div><div><br></div><div>Eugene</d=
iv>
<div><br></div><div>P.S. If you are interested, more info concerning Kernel=
Strider can be found in my recent talk at LinuxCon Europe. The slides and n=
otes for them are available in &quot;Talks and slides&quot; section on the =
project page (<a href=3D"https://code.google.com/p/kernel-strider/">https:/=
/code.google.com/p/kernel-strider/</a>). This is mostly about data races th=
ough.</div>
</div></div></div>

--047d7bdc8ffe4d483c04e9909b66--

--===============0128189616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0128189616==--
