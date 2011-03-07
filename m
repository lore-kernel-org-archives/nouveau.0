From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix __nouveau_fence_wait
 performance regression
Date: Tue, 08 Mar 2011 08:24:26 +1000
Message-ID: <1299536668.29441.3.camel@nisroch>
References: <20110213203804.GA5395@joi.lan> <20110304164905.GA2743@joi.lan>
	<AANLkTin_jouzPDGfNnYq_BRqPzbvOW+F6jFNuc7p=p5E@mail.gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTin_jouzPDGfNnYq_BRqPzbvOW+F6jFNuc7p=p5E-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Mon, 2011-03-07 at 18:18 +0000, Maarten Maathuis wrote:
> On Fri, Mar 4, 2011 at 4:49 PM, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sun, Feb 13, 2011 at 09:38:04PM +0100, Marcin Slusarz wrote:
> >> Combination of locking and interchannel synchronization changes
> >> uncovered poor behaviour of nouveau_fence_wait, which on HZ=100
> >> configuration could waste up to 10 ms per call.
> >> Depending on application, it lead to 10-30% FPS regression.
> >> To fix it, shorten thread sleep time to 0.1 ms and ensure
> >> spinning happens for at least one *full* tick.
> >>
> >> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/nouveau/nouveau_fence.c |   10 ++++++++--
> >>  1 files changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> index 221b846..75ba5e2 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> @@ -27,6 +27,9 @@
> >>  #include "drmP.h"
> >>  #include "drm.h"
> >>
> >> +#include <linux/ktime.h>
> >> +#include <linux/hrtimer.h>
> >> +
> >>  #include "nouveau_drv.h"
> >>  #include "nouveau_ramht.h"
> >>  #include "nouveau_dma.h"
> >> @@ -230,9 +233,12 @@ int
> >>  __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
> >>  {
> >>       unsigned long timeout = jiffies + (3 * DRM_HZ);
> >> -     unsigned long sleep_time = jiffies + 1;
> >> +     unsigned long sleep_time = jiffies + 2;
> >> +     ktime_t t;
> >>       int ret = 0;
> >>
> >> +     t = ktime_set(0, NSEC_PER_MSEC / 10);
> >> +
> >>       while (1) {
> >>               if (__nouveau_fence_signalled(sync_obj, sync_arg))
> >>                       break;
> >> @@ -245,7 +251,7 @@ __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
> >>               __set_current_state(intr ? TASK_INTERRUPTIBLE
> >>                       : TASK_UNINTERRUPTIBLE);
> >>               if (lazy && time_after_eq(jiffies, sleep_time))
> >> -                     schedule_timeout(1);
> >> +                     schedule_hrtimeout(&t, HRTIMER_MODE_REL);
> >>
> >>               if (intr && signal_pending(current)) {
> >>                       ret = -ERESTARTSYS;
> >> --
> >> 1.7.4.rc3
> >>
> >
> > ping again
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> 
> This looks ok to me, but I would like to get Ben Skeggs ok on this one
> as well. So i've CC'ed him, hopefully he'll notice :-)
Ah sorry, I have actually looked at this quite a while back but came to
no solid conclusion.

While yes, I did see some minor performance improvement from it, I also
notice that now we once again get 100% CPU usage while an app is waiting
for the GPU a lot..

Ben.
> 
