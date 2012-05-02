From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Wed, 02 May 2012 15:53:39 +0200
Message-ID: <4FA13C63.4090806@free.fr>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
	<1335425549.27165.9.camel@nisroch> <20120428144956.GA10116@joi.lan>
	<1335958137.1898.6.camel@nisroch> <4FA137C4.3000900@free.fr>
	<1335966493.1898.15.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335966493.1898.15.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 02/05/2012 15:48, Ben Skeggs wrote:
> On Wed, 2012-05-02 at 15:33 +0200, Martin Peres wrote:
>> On 02/05/2012 13:28, Ben Skeggs wrote:
>>> Right, again, I don't disagree :)  I think we can improve a lot on the
>>> big-hammer-suspend-the-gpu solution though, and instead reset only the
>>> faulting engine.  It's (in theory) almost possible for us to do now, but
>>> I have a couple of reworks to areas related to this pending (basically,
>>> making the various driver subsystems more independent), which should be
>>> ready soon.  This'll go a long way to making it very easy to reset a
>>> single engine, and likely result in *far* faster recovery from hangs.
>> Hey,
>>
>> What about kicking a channel that put the card in a bad state? Wouldn't
>> that be possible?
>>
>> This way, we don't loose the context of other channels and only the
>> application that hang the card will be exited.
> That's pretty much the idea.  The trouble comes in where PFIFO will hang
> waiting for the stuck engine to report that it's done (eg. it will wait
> for PGRAPH to go "i've finished unloading my context now" after it's
> told PGRAPH to do so).
>
> Hence why it's important to be able to (preferably) un-stick the stuck
> engine (usually handling the appropriate interrupts properly will
> achieve this), and failing that, reset it and lose the context for just
> that channel.
>
> The work I'm doing at the moment will, among other nice things, make
> handling all of this a lot nicer.  And it should be nice and speedy in
> comparison to the suspend/resume option, we won't have to evict all
> buffers from vram without accel, which can take quite a while (not to
> mention that it might not even be possible to get to the VRAM not mapped
> into the FB BAR on earlier chipsets if accel dies).
I get it, that seems nice and good.
>
>> I wonder how pfifo handles commands sent to a non-existing channel, but
>> I'm sure it shouldn't hang or anything.
> It can't happen anyway, if we destroyed the fifo context for a channel
> we wouldn't be telling it to execute commands still :)
Right, but there may still be some commands left in the IB ring buffer, 
right?
>
>> Anyway, if this is not possible to only kick one channel, then what
>> about kicking all channels, rePOSTING the card and using KMS to output
>> the lockup report (and send a notification of the report through udev
>> and store the report in a sysfs file)?
>>
>> Let's not try to be perfect, let us just be able to do better bug reports.
> I'm still skeptical about how useful any kind of generic "lockup report"
> can possibly be, beyond kernel logs..  However, as part of the work I'm
> working on, there may be some additional information available via
> debugfs..  I don't wan't to elaborate on this too much yet until I wrap
> my head around what exactly I want to achieve, but I'll give you a
> heads-up once I do :)
Well, a good report is important so as we can have an idea of what went 
wrong
and also, that would allow us to differenciate bug reports.

Basically, I'm now convinced that the nvaX random lockup is not actually 
one issue.
Having such an enhanced bug report could allow us to verify this theory.

PS: Speaking about nvaX lockups. I still get lockups (nva3/5) and I 
suspect that the
problem comes from the context switching micro code. Not loosing the 
email I'm writing
simply because kwin's channel crashed would be a big win to me.

Martin
