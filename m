From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Why do we disable local IRQ around
	nouveau_fence_update?
Date: Sun, 30 May 2010 10:58:33 +1000
Message-ID: <A679A2E1-84A5-4C54-89F6-E63627B38EBA@gmail.com>
References: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n@mail.gmail.com>
	<20100527175556.4c83819d@daedalus.pq.iki.fi>
	<1275025635.16293.4.camel@nisroch>
	<AANLkTinC5nTPwt4pVQFTinYptJ_hwHcUBCqmWc-NtSM6@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 7E18)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinC5nTPwt4pVQFTinYptJ_hwHcUBCqmWc-NtSM6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org



Sent from my iPhone

On 30/05/2010, at 9:22, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Fri, May 28, 2010 at 7:47 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thu, 2010-05-27 at 17:55 +0300, Pekka Paalanen wrote:
>>> On Wed, 26 May 2010 23:24:57 +0200
>>> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> For NV04 i can understand, since it's irq driven fences, so let's
>>>> split the question.
>>>>
>>>> NV10+: can we reduce it to just spin_lock?
>>>
>>> I don't know the answer, but I know the theory: if there is
>>> any path, that can take the spinlock from an interrupt
>>> service path, then you must use the irq-safe version everywhere.
>> We could, the interrupt-based path is currently only used on really  
>> old
>> chips that don't have REF_CNT.
>>
>>>
>>>> NV04: can't we rely on a normal spin lock and add it as well in
>>>> nv04_graph_mthd_set_ref?
>>>
>>> So if NV04 fences are driven by irqs, and the ISR needs to
>>> take the lock, then no, you cannot revert to irq-unsafe spinlocks.
>>> I'm not sure how it relates to ISR bottom halves, though.
>>>
>>> Note, that also irq-unsafe spinlocks disable preemption, which
>>> might be enough to disturb audio.
>> The spinlock was actually only ever meant to protect the list  
>> itself and
>> not the sequence counters.
>>
>> I've attached a patch removing the spinlock use everywhere except  
>> when
>> we're actually going to touch the pending list, I think
>> last_sequence_irq is still safe as the NV04 fence IRQ handler is the
>> only writer.
>>
>> I haven't tested beyond knowing this laptop I'm typing on still  
>> works.
>>
>> Thoughts?
>>
>
> Why the extra "chan->fence.last_sequence_irq++"? Isn't it already set
> from nv04_graph_mthd_set_ref?
Ah good catch, if I push this I'll fix that first :)

Ben.

>
>>>
>>>
>>> my 2c
>>>
>>
>>
>
>
>
> -- 
> Life spent, a precious moment, in the wink of an eye we live and we  
> die.
