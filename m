From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Why do we disable local IRQ around
	nouveau_fence_update?
Date: Thu, 27 May 2010 23:13:25 -0700
Message-ID: <AANLkTin9Ttg5dCYTJhwsJ5exUUXfj_Jh_eVQbs9NYHCt@mail.gmail.com>
References: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n@mail.gmail.com>
	<20100527175556.4c83819d@daedalus.pq.iki.fi>
	<1275025635.16293.4.camel@nisroch>
	<AANLkTincXdsGcx3DdYEENjupN1XMFBv4KCa5hdcqYkbj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0907904270=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTincXdsGcx3DdYEENjupN1XMFBv4KCa5hdcqYkbj-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0907904270==
Content-Type: multipart/alternative; boundary=0016e68dd8e8b122b30487a167a0

--0016e68dd8e8b122b30487a167a0
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 27, 2010 at 23:03, Stephane Marchesin <
stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>
>
> On Thu, May 27, 2010 at 22:47, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> On Thu, 2010-05-27 at 17:55 +0300, Pekka Paalanen wrote:
>> > On Wed, 26 May 2010 23:24:57 +0200
>> > Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> > > For NV04 i can understand, since it's irq driven fences, so let's
>> > > split the question.
>> > >
>> > > NV10+: can we reduce it to just spin_lock?
>> >
>> > I don't know the answer, but I know the theory: if there is
>> > any path, that can take the spinlock from an interrupt
>> > service path, then you must use the irq-safe version everywhere.
>> We could, the interrupt-based path is currently only used on really old
>> chips that don't have REF_CNT.
>>
>> >
>> > > NV04: can't we rely on a normal spin lock and add it as well in
>> > > nv04_graph_mthd_set_ref?
>> >
>> > So if NV04 fences are driven by irqs, and the ISR needs to
>> > take the lock, then no, you cannot revert to irq-unsafe spinlocks.
>> > I'm not sure how it relates to ISR bottom halves, though.
>> >
>> > Note, that also irq-unsafe spinlocks disable preemption, which
>> > might be enough to disturb audio.
>> The spinlock was actually only ever meant to protect the list itself and
>> not the sequence counters.
>>
>> I've attached a patch removing the spinlock use everywhere except when
>> we're actually going to touch the pending list, I think
>> last_sequence_irq is still safe as the NV04 fence IRQ handler is the
>> only writer.
>>
>
> That would mean the write has to be atomic everywhere though.
>
>
Blah, of course the *read* has to be atomic, not the write...

Stephane

--0016e68dd8e8b122b30487a167a0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, May 27, 2010 at 23:03, Stephane =
Marchesin <span dir=3D"ltr">&lt;<a href=3D"mailto:stephane.marchesin@gmail.=
com">stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex;">
<br><br><div class=3D"gmail_quote"><div><div></div><div class=3D"h5">On Thu=
, May 27, 2010 at 22:47, Ben Skeggs <span dir=3D"ltr">&lt;<a href=3D"mailto=
:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div>On Thu, 2010-05-27 at 17:55 +0300, Pekka Paalanen wrote:<br>
&gt; On Wed, 26 May 2010 23:24:57 +0200<br>
&gt; Maarten Maathuis &lt;<a href=3D"mailto:madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D=
"_blank">madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; For NV04 i can understand, since it&#39;s irq driven fences, so l=
et&#39;s<br>
&gt; &gt; split the question.<br>
&gt; &gt;<br>
&gt; &gt; NV10+: can we reduce it to just spin_lock?<br>
&gt;<br>
&gt; I don&#39;t know the answer, but I know the theory: if there is<br>
&gt; any path, that can take the spinlock from an interrupt<br>
&gt; service path, then you must use the irq-safe version everywhere.<br>
</div>We could, the interrupt-based path is currently only used on really o=
ld<br>
chips that don&#39;t have REF_CNT.<br>
<div><br>
&gt;<br>
&gt; &gt; NV04: can&#39;t we rely on a normal spin lock and add it as well =
in<br>
&gt; &gt; nv04_graph_mthd_set_ref?<br>
&gt;<br>
&gt; So if NV04 fences are driven by irqs, and the ISR needs to<br>
&gt; take the lock, then no, you cannot revert to irq-unsafe spinlocks.<br>
&gt; I&#39;m not sure how it relates to ISR bottom halves, though.<br>
&gt;<br>
&gt; Note, that also irq-unsafe spinlocks disable preemption, which<br>
&gt; might be enough to disturb audio.<br>
</div>The spinlock was actually only ever meant to protect the list itself =
and<br>
not the sequence counters.<br>
<br>
I&#39;ve attached a patch removing the spinlock use everywhere except when<=
br>
we&#39;re actually going to touch the pending list, I think<br>
last_sequence_irq is still safe as the NV04 fence IRQ handler is the<br>
only writer.<br></blockquote><div><br></div></div></div><div>That would mea=
n the write has to be atomic everywhere though.</div><div><br></div></div><=
/blockquote><div><br></div><div>Blah, of course the *read* has to be atomic=
, not the write...</div>
<div><br></div><div>Stephane</div><div><br></div></div>

--0016e68dd8e8b122b30487a167a0--

--===============0907904270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0907904270==--
