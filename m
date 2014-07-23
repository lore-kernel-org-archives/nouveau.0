From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 09:15:52 +0200
Message-ID: <53CF6128.6010703@amd.com>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com>	<20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local>	<53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>	<53CE6AFA.1060807@vodafone.de>
 <CAKMK7uG1d31zU_i__wc+Yq46A0x0tPeKnMBs+NHSmHS82uMsXQ@mail.gmail.com>
 <53CE84AA.9030703@amd.com>
 <CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>
 <53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>
 <53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>
 <CAKMK7uHijSve_CsDE+pUk8+tjCAZjL7-nZCKeUkKuuufCPS4tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKMK7uHijSve_CsDE+pUk8+tjCAZjL7-nZCKeUkKuuufCPS4tQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am 23.07.2014 09:09, schrieb Daniel Vetter:
> On Wed, Jul 23, 2014 at 9:06 AM, Maarten Lankhorst
> <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>>> Can we somehow avoid the need to call fence_signal() at all? The interrupts at least on radeon are way to unreliable for such a thing. Can enable_signalling fail? What's the reason for fence_signaled() in the first place?
>> It doesn't need to be completely reliable, or finish immediately.
>>
>> And any time wake_up_all(&rdev->fence_queue) is called all the fences that were enabled will be rechecked.
> I raised this already somewhere else, but should we have some common
> infrastructure in the core fence code to recheck fences periodically?
> radeon doesn't seem to be the only hw where this isn't reliable
> enough. Of course timer-based rechecking would only work if the driver
> provides the fence->signalled callback to recheck actual fence state.

Yeah, agree. The proposal won't work reliable at all with radeon.

Interrupts are accumulated before sending them to the CPU, e.g. you can 
get one interrupt for multiple fences finished. If it's just the 
interrupt for the last fence submitted that gets lost you are completely 
screwed up because you won't get another interrupt.

I had that problem multiple times while working on UVD support, 
resulting in the driver thinking that it can't submit more jobs because 
non of the interrupts for the already submitted fence cam through.

Apart from that interrupts on Macs usually don't work at all, so we 
really need a solution where calling fence_signaled() is completely 
optional.

Christian.

> -Daniel
