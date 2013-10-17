From: Eugene Shatokhin <euspectre@gmail.com>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Fri, 18 Oct 2013 00:11:15 +0400
Message-ID: <CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308053911=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20131017194614.64a6b70e@farn.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Pekka Paalanen <pq@iki.fi>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============0308053911==
Content-Type: multipart/alternative; boundary=001a11c3d9b488861504e8f56b60

--001a11c3d9b488861504e8f56b60
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Good to know that!

Yes, it should be faster than page faulting, although I haven't done the
benchmarking yet. And yes, it is not needed to disable all but one CPU. In
my current implementation, I use an ordered workqueue to send the data to
the mmapped output buffer (where they will be read from from the user
space) and that ensures the order of events is kept. May be less than ideal
but it currently works quite well with network drivers, the performance
overhead is acceptable there.

A subtle drawback may be that the system sees the memory reads and writes
made by the code of the driver directly but if the driver uses some other
kernel functions, it needs to intercept these calls and determine how they
access the memory of interest. Theoretically, it could be less accurate
than page fault handling. A page fault happens no matter if the driver
accesses the memory directly or via strcpy(), for example. I doubt this
would be a big problem for tracking the accesses to ioremapped memory
though.

Nevertheless, it is manageable, the system already handles string
functions, for example, and reports appropriate events. The handlers for
other functions could be added as well. So this just requires a bit more
maintenance work.

> Unfortunately, my job exhausts my coding energy, and I haven't even
touched mmiotrace in years.

I understand. I have many other responsibilities too. Code to write, bugs
to fix, etc. ;-)

Well, then, when time permits, I'll try to prepare a prototype so that its
performance and reliability could be evaluated. Hard to tell what the
numbers will be before that.

Suggestions, comments and other feedback are welcome of course.

And, by the way, video drivers do not use SSE and similar instructions when
accessing ioremapped memory, do they?
Such things are rare in the kernel and usually frowned upon so I opted not
to handle them so far in KernelStrider.

Regards,
Eugene




2013/10/17 Pekka Paalanen <pq@iki.fi>

> On Mon, 14 Oct 2013 22:45:09 +0400
> Eugene Shatokhin <euspectre@gmail.com> wrote:
>
> > Hi,
> >
> > There is an interesting TODO item on MmioTraceDeveloper page:
> > "kprobes has a generic instruction decoding facility, use that instead of
> > homebrewn (or KVM), and use emulation instead of page faulting"
> >
> > Actually, I have done something similar in one of my systems,
> KernelStrider
> > (http://code.google.com/p/kernel-strider/). The system instruments a
> kernel
> > module when that module is being loaded. The instrumented code executes
> > instead of the original one and provides information about the memory
> > accesses it makes and the functions it calls. These data are sent to user
> > space for further analysis.
> >
> > Currently, I use this system to detect data races in the Linux kernel
> (and
> > have found some). I suppose, it could probably be useful to MmioTrace as
> > well.
> >
> > KernelStrider uses an enhanced version of the x86 instruction decoder
> that
> > Kprobes use and relies on binary instrumentation rather than on page
> > faults. So, it can track:
> > - memory accesses (address and size of the accessed memory as well as the
> > access type are recorded)
> > - function calls (exported functions and callbacks, one can setup pre-
> and
> > post- handlers for these)
> >
> > Is there any interest in trying this approach to the task of MmioTrace?
> >
> > If so, we can discuss it. When I have time, I could try to create a
> > prototype based on KernelStrider's core that tracks the memory accesses
> > Mmiotrace needs.
> > What do you think?
>
> Hi Eugene,
>
> that is very interesting! I assume emulating the instructions is
> not only cleaner, but also faster than page-faulting, right? Maybe
> even more reliable, perhaps up to the point where we would not need
> to disable all but one CPU.
>
> Unfortunately, my job exhausts my coding energy, and I haven't even
> touched mmiotrace in years.
>
> However, let's see if there are interested people on the mailing
> lists. I'm CC'ing nouveau, since that is where mmiotrace started,
> and dri-devel in the hopes to catch other drivers' reverse
> engineers.
>
>
> Thanks,
> pq
>

--001a11c3d9b488861504e8f56b60
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div>Good to know that!</=
div><div><br></div><div>Yes, it should be faster than page faulting, althou=
gh I haven&#39;t done the benchmarking yet. And yes, it is not needed to di=
sable all but one CPU. In my current implementation, I use an ordered workq=
ueue to send the data to the mmapped output buffer (where they will be read=
 from from the user space) and that ensures the order of events is kept. Ma=
y be less than ideal but it currently works quite well with network drivers=
, the performance overhead is acceptable there.</div>
<div><br></div><div>A subtle drawback may be that the system sees the memor=
y reads and writes made by the code of the driver directly but if the drive=
r uses some other kernel functions, it needs to intercept these calls and d=
etermine how they access the memory of interest. Theoretically, it could be=
 less accurate than page fault handling. A page fault happens no matter if =
the driver accesses the memory directly or via strcpy(), for example. I dou=
bt this would be a big problem for tracking the accesses to ioremapped memo=
ry though.</div>
<div><br></div><div>Nevertheless, it is manageable, the system already hand=
les string functions, for example, and reports appropriate events. The hand=
lers for other functions could be added as well. So this just requires a bi=
t more maintenance work.</div>
<div><br></div><div>&gt;=A0Unfortunately, my job exhausts my coding energy,=
 and I haven&#39;t even touched mmiotrace in years.</div><div><br></div><di=
v>I understand. I have many other responsibilities too. Code to write, bugs=
 to fix, etc. ;-)</div>
<div><br></div><div>Well, then, when time permits, I&#39;ll try to prepare =
a prototype so that its performance and reliability could be evaluated. Har=
d to tell what the numbers will be before that.</div><div><br></div><div>
Suggestions, comments and other feedback are welcome of course.</div><div><=
br></div><div>And, by the way, video drivers do not use SSE and similar ins=
tructions when accessing ioremapped memory, do they? </div><div>Such things=
 are rare in the kernel and usually frowned upon so I opted not to handle t=
hem so far in KernelStrider.=A0</div>
<div><br></div><div>Regards,</div><div>Eugene</div><div><br></div><div><br>=
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2=
013/10/17 Pekka Paalanen <span dir=3D"ltr">&lt;<a href=3D"mailto:pq@iki.fi"=
 target=3D"_blank">pq@iki.fi</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On M=
on, 14 Oct 2013 22:45:09 +0400<br>
Eugene Shatokhin &lt;<a href=3D"mailto:euspectre@gmail.com">euspectre@gmail=
.com</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; There is an interesting TODO item on MmioTraceDeveloper page:<br>
&gt; &quot;kprobes has a generic instruction decoding facility, use that in=
stead of<br>
&gt; homebrewn (or KVM), and use emulation instead of page faulting&quot;<b=
r>
&gt;<br>
&gt; Actually, I have done something similar in one of my systems, KernelSt=
rider<br>
&gt; (<a href=3D"http://code.google.com/p/kernel-strider/" target=3D"_blank=
">http://code.google.com/p/kernel-strider/</a>). The system instruments a k=
ernel<br>
&gt; module when that module is being loaded. The instrumented code execute=
s<br>
&gt; instead of the original one and provides information about the memory<=
br>
&gt; accesses it makes and the functions it calls. These data are sent to u=
ser<br>
&gt; space for further analysis.<br>
&gt;<br>
&gt; Currently, I use this system to detect data races in the Linux kernel =
(and<br>
&gt; have found some). I suppose, it could probably be useful to MmioTrace =
as<br>
&gt; well.<br>
&gt;<br>
&gt; KernelStrider uses an enhanced version of the x86 instruction decoder =
that<br>
&gt; Kprobes use and relies on binary instrumentation rather than on page<b=
r>
&gt; faults. So, it can track:<br>
&gt; - memory accesses (address and size of the accessed memory as well as =
the<br>
&gt; access type are recorded)<br>
&gt; - function calls (exported functions and callbacks, one can setup pre-=
 and<br>
&gt; post- handlers for these)<br>
&gt;<br>
&gt; Is there any interest in trying this approach to the task of MmioTrace=
?<br>
&gt;<br>
&gt; If so, we can discuss it. When I have time, I could try to create a<br=
>
&gt; prototype based on KernelStrider&#39;s core that tracks the memory acc=
esses<br>
&gt; Mmiotrace needs.<br>
&gt; What do you think?<br>
<br>
</div></div>Hi Eugene,<br>
<br>
that is very interesting! I assume emulating the instructions is<br>
not only cleaner, but also faster than page-faulting, right? Maybe<br>
even more reliable, perhaps up to the point where we would not need<br>
to disable all but one CPU.<br>
<br>
Unfortunately, my job exhausts my coding energy, and I haven&#39;t even<br>
touched mmiotrace in years.<br>
<br>
However, let&#39;s see if there are interested people on the mailing<br>
lists. I&#39;m CC&#39;ing nouveau, since that is where mmiotrace started,<b=
r>
and dri-devel in the hopes to catch other drivers&#39; reverse<br>
engineers.<br>
<br>
<br>
Thanks,<br>
pq<br>
</blockquote></div><br></div>

--001a11c3d9b488861504e8f56b60--

--===============0308053911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0308053911==--
