From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Why do we disable local IRQ around
 nouveau_fence_update?
Date: Thu, 27 May 2010 17:55:56 +0300
Message-ID: <20100527175556.4c83819d@daedalus.pq.iki.fi>
References: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 26 May 2010 23:24:57 +0200
Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> For NV04 i can understand, since it's irq driven fences, so let's
> split the question.
> 
> NV10+: can we reduce it to just spin_lock?

I don't know the answer, but I know the theory: if there is
any path, that can take the spinlock from an interrupt
service path, then you must use the irq-safe version everywhere.

> NV04: can't we rely on a normal spin lock and add it as well in
> nv04_graph_mthd_set_ref?

So if NV04 fences are driven by irqs, and the ISR needs to
take the lock, then no, you cannot revert to irq-unsafe spinlocks.
I'm not sure how it relates to ISR bottom halves, though.

Note, that also irq-unsafe spinlocks disable preemption, which
might be enough to disturb audio.


my 2c

-- 
Pekka Paalanen
http://www.iki.fi/pq/
