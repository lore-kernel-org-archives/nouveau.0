From: Eugene Shatokhin <euspectre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Sat, 19 Oct 2013 17:12:20 +0400
Message-ID: <CAL5fWtCUEfSSY=i-50SfgmTeuKgEh28wz492Be1ORJPidj_CvA@mail.gmail.com>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
	<20131019101417.50a33eaf@farn.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0457834748=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20131019101417.50a33eaf-DA5HUFbJnAM@public.gmane.org>
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

--===============0457834748==
Content-Type: multipart/alternative; boundary=089e0160a6760b5ad604e917cd30

--089e0160a6760b5ad604e917cd30
Content-Type: text/plain; charset=ISO-8859-1

Hi,

>  Ah, you are not using the ftrace framework nor relayfs? Mmiotrace
 used to be relayfs at one point and then converted to ftrace.

Yes, I considered these when I started working on KernelStrider but finally
borrowed ideas from Perf and implemented them. A mmapped ring buffer does
its job well and has a higher throughput than Ftrace in my case.

> Are you saying that you intercept function calls, and *never* rely
> on page faulting?

The system intercepts both function calls *and* memory operations made by
the driver itself. Yes, it never relies on page faulting.

 > Does that mean that if a driver does the ugly thing and
 > dereferences an iomem pointer directly, you won't catch that?

It will be caught.

What my system actually does is as follows.

When the target kernel module has been loaded into memory but before it has
begun its initialization, KernelStrider processes it, function after
function. It creates an instrumented variant of each function in the module
mapping space and places a jump at the beginning of the original function
to point to the instrumented one. After instrumentation is done, the target
driver may start executing.

If some original function of the driver contained, say,

  mov 0xabcd (%rax), %rsi
  mov %rbx, 0xbeeffeed (%rsi)

that will be transformed to something like

  lea  0xabcd (%rax), %rbx
  mov %rbx, <local_storage1>
  mov 0xabcd (%rax), %rsi
  lea  0xbeeffeed (%rsi), %rbx
  mov %rbx, <local_storage2>
  mov %rbx, 0xbeeffeed (%rsi)
  ...
  <send the local_storage to the output system>

That is, the address which is about to be accessed is determined and stored
in 'local_storage', a special memory structure. At the end of the block of
instructions, the information from the local storage is sent to the output
system. So the addresses and sizes of the accessed memory areas as well as
the types of the accesses (read/write/update) will be available for reading
from the user space.

It is actually more complex than that (KernelStrider has to deal with
register allocation, relocations and other things) but the principle is as
I described.

The function calls are processed too so that we can set our own handlers to
execute at the beginning of a function and right before its exit.

Yes, the functions like read[bwql]() and write[bwlq]() are usually inline
but they pose no problem: on x86 they compile to ordinary MOV instructions
and the like which are handled as I described above.

The instrumented code will access the ioremapped area the same way as the
original code would, no need for single-stepping or emulation in this case.

What I wrote in my previous letter is that there is a special case when the
target driver uses some non-inline function provided by the kernel proper
or by another driver and that function accesses the ioremapped memory area
of interest.

KernelStrider needs to track all such functions in order not to miss some
memory accesses to that ioremapped area. Perhaps, that's manageable. There
are not too many such functions, aren't they?

> I don't really know. I guess everything could be possible in
> proprietary drivers, but you can look at the instruction decoding
> code in mmiotrace, which digs up the type and size of access and
> the value. That has been enough so far.

Yes, I will take a closer look on that part of MmioTrace, thanks for the
point.

Regards,

Eugene

--089e0160a6760b5ad604e917cd30
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div>&gt; =A0Ah, you are =
not using the ftrace framework nor relayfs? Mmiotrace<br>=A0used to be rela=
yfs at one point and then converted to ftrace.</div><div><br></div><div>Yes=
, I considered these when I started working on KernelStrider but finally bo=
rrowed ideas from Perf and implemented them. A mmapped ring buffer does its=
 job well and has a higher throughput than Ftrace in my case.</div>
<div class=3D"gmail_extra"><br>&gt; Are you saying that you intercept funct=
ion calls, and *never* rely<br></div><div class=3D"gmail_extra">&gt; on pag=
e faulting?<br>
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The s=
ystem intercepts both function calls *and* memory operations made by the dr=
iver itself. Yes, it never relies on page faulting.</div><div class=3D"gmai=
l_extra">
<br>=A0&gt; Does that mean that if a driver does the ugly thing and</div><d=
iv class=3D"gmail_extra">=A0&gt; dereferences an iomem pointer directly, yo=
u won&#39;t catch that?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">
It will be caught.=A0</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">What my system actually does is as follows.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">When the target kern=
el module has been loaded into memory but before it has begun its initializ=
ation, KernelStrider processes it, function after function. It creates an i=
nstrumented variant of each function in the module mapping space and places=
 a jump at the beginning of the original function to point to the instrumen=
ted one. After instrumentation is done, the target driver may start executi=
ng.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If some ori=
ginal function of the driver contained, say,</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">=A0 mov 0xabcd (%rax), %rsi</div><di=
v class=3D"gmail_extra">
=A0=A0mov %rbx, 0xbeeffeed (%rsi)</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">that will be transformed to something like=A0</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=A0 lea=
=A0 0xabcd (%rax), %rbx</div>
<div class=3D"gmail_extra">=A0 mov %rbx, &lt;local_storage1&gt;</div><div c=
lass=3D"gmail_extra">=A0=A0mov 0xabcd (%rax), %rsi=A0</div><div class=3D"gm=
ail_extra">=A0 lea=A0 0xbeeffeed (%rsi), %rbx</div><div class=3D"gmail_extr=
a">=A0 mov %rbx, &lt;local_storage2&gt;=A0</div>
<div class=3D"gmail_extra">=A0 mov %rbx, 0xbeeffeed (%rsi)=A0</div><div cla=
ss=3D"gmail_extra">=A0 ...</div><div class=3D"gmail_extra">=A0 &lt;send the=
 local_storage to the output system&gt;</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">
That is, the address which is about to be accessed is determined and stored=
 in &#39;local_storage&#39;, a special memory structure. At the end of the =
block of instructions, the information from the local storage is sent to th=
e output system. So the addresses and sizes of the accessed memory areas as=
 well as the types of the accesses (read/write/update) will be available fo=
r reading from the user space.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It is actua=
lly more complex than that (KernelStrider has to deal with register allocat=
ion, relocations and other things) but the principle is as I described.</di=
v>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The functio=
n calls are processed too so that we can set our own handlers to execute at=
 the beginning of a function and right before its exit.</div><div class=3D"=
gmail_extra">
<br></div><div class=3D"gmail_extra">Yes, the functions like read[bwql]() a=
nd write[bwlq]() are usually inline but they pose no problem: on x86 they c=
ompile to ordinary MOV instructions and the like which are handled as I des=
cribed above.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The instrum=
ented code will access the ioremapped area the same way as the original cod=
e would, no need for single-stepping or emulation in this case.</div><div c=
lass=3D"gmail_extra">
<br></div><div class=3D"gmail_extra">What I wrote in my previous letter is =
that there is a special case when the target driver uses some non-inline fu=
nction provided by the kernel proper or by another driver and that function=
 accesses the ioremapped memory area of interest.=A0</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">KernelStrid=
er needs to track all such functions in order not to miss some memory acces=
ses to that ioremapped area. Perhaps, that&#39;s manageable. There are not =
too many such functions, aren&#39;t they?</div>
<div class=3D"gmail_extra"><br>&gt; I don&#39;t really know. I guess everyt=
hing could be possible in<br>&gt; proprietary drivers, but you can look at =
the instruction decoding<br>&gt; code in mmiotrace, which digs up the type =
and size of access and<br>
&gt; the value. That has been enough so far.<br>
<br>
</div><div class=3D"gmail_extra">Yes, I will take a closer look on that par=
t of MmioTrace, thanks for the point.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Regards,</div><div class=3D"gmail_extra"><b=
r></div>
<div class=3D"gmail_extra">Eugene</div><div class=3D"gmail_extra"><br></div=
></div>

--089e0160a6760b5ad604e917cd30--

--===============0457834748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0457834748==--
