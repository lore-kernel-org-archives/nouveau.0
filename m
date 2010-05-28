From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Why do we disable local IRQ around
 nouveau_fence_update?
Date: Fri, 28 May 2010 16:18:51 +1000
Message-ID: <1275027531.16293.5.camel@nisroch>
References: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n@mail.gmail.com>
	<20100527175556.4c83819d@daedalus.pq.iki.fi>
	<1275025635.16293.4.camel@nisroch>
	<AANLkTincXdsGcx3DdYEENjupN1XMFBv4KCa5hdcqYkbj@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTincXdsGcx3DdYEENjupN1XMFBv4KCa5hdcqYkbj-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2010-05-27 at 23:03 -0700, Stephane Marchesin wrote:
> 
> 
> On Thu, May 27, 2010 at 22:47, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>         On Thu, 2010-05-27 at 17:55 +0300, Pekka Paalanen wrote:
>         > On Wed, 26 May 2010 23:24:57 +0200
>         > Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>         >
>         > > For NV04 i can understand, since it's irq driven fences,
>         so let's
>         > > split the question.
>         > >
>         > > NV10+: can we reduce it to just spin_lock?
>         >
>         > I don't know the answer, but I know the theory: if there is
>         > any path, that can take the spinlock from an interrupt
>         > service path, then you must use the irq-safe version
>         everywhere.
>         
>         We could, the interrupt-based path is currently only used on
>         really old
>         chips that don't have REF_CNT.
>         
>         >
>         > > NV04: can't we rely on a normal spin lock and add it as
>         well in
>         > > nv04_graph_mthd_set_ref?
>         >
>         > So if NV04 fences are driven by irqs, and the ISR needs to
>         > take the lock, then no, you cannot revert to irq-unsafe
>         spinlocks.
>         > I'm not sure how it relates to ISR bottom halves, though.
>         >
>         > Note, that also irq-unsafe spinlocks disable preemption,
>         which
>         > might be enough to disturb audio.
>         
>         The spinlock was actually only ever meant to protect the list
>         itself and
>         not the sequence counters.
>         
>         I've attached a patch removing the spinlock use everywhere
>         except when
>         we're actually going to touch the pending list, I think
>         last_sequence_irq is still safe as the NV04 fence IRQ handler
>         is the
>         only writer.
> 
> 
> That would mean the write has to be atomic everywhere though.
Hm, why?  It's only possible for one thread to be updating it ever, the
hw can't trigger another interrupt until we've finished the first.

Ben.
> 
> 
> Stephane
> 
> 
