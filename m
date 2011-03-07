From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix __nouveau_fence_wait
 performance regression
Date: Mon, 7 Mar 2011 18:18:41 +0000
Message-ID: <AANLkTin_jouzPDGfNnYq_BRqPzbvOW+F6jFNuc7p=p5E@mail.gmail.com>
References: <20110213203804.GA5395@joi.lan>
	<20110304164905.GA2743@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110304164905.GA2743-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Mar 4, 2011 at 4:49 PM, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> On Sun, Feb 13, 2011 at 09:38:04PM +0100, Marcin Slusarz wrote:
>> Combination of locking and interchannel synchronization changes
>> uncovered poor behaviour of nouveau_fence_wait, which on HZ=3D100
>> configuration could waste up to 10 ms per call.
>> Depending on application, it lead to 10-30% FPS regression.
>> To fix it, shorten thread sleep time to 0.1 ms and ensure
>> spinning happens for at least one *full* tick.
>>
>> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_fence.c | =A0 10 ++++++++--
>> =A01 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/n=
ouveau/nouveau_fence.c
>> index 221b846..75ba5e2 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> @@ -27,6 +27,9 @@
>> =A0#include "drmP.h"
>> =A0#include "drm.h"
>>
>> +#include <linux/ktime.h>
>> +#include <linux/hrtimer.h>
>> +
>> =A0#include "nouveau_drv.h"
>> =A0#include "nouveau_ramht.h"
>> =A0#include "nouveau_dma.h"
>> @@ -230,9 +233,12 @@ int
>> =A0__nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool =
intr)
>> =A0{
>> =A0 =A0 =A0 unsigned long timeout =3D jiffies + (3 * DRM_HZ);
>> - =A0 =A0 unsigned long sleep_time =3D jiffies + 1;
>> + =A0 =A0 unsigned long sleep_time =3D jiffies + 2;
>> + =A0 =A0 ktime_t t;
>> =A0 =A0 =A0 int ret =3D 0;
>>
>> + =A0 =A0 t =3D ktime_set(0, NSEC_PER_MSEC / 10);
>> +
>> =A0 =A0 =A0 while (1) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (__nouveau_fence_signalled(sync_obj, sync=
_arg))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> @@ -245,7 +251,7 @@ __nouveau_fence_wait(void *sync_obj, void *sync_arg,=
 bool lazy, bool intr)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 __set_current_state(intr ? TASK_INTERRUPTIBLE
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : TASK_UNINTERRUPTIBLE);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (lazy && time_after_eq(jiffies, sleep_tim=
e))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_timeout(1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_hrtimeout(&t, HRTIMER=
_MODE_REL);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (intr && signal_pending(current)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ERESTARTSYS;
>> --
>> 1.7.4.rc3
>>
>
> ping again
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

This looks ok to me, but I would like to get Ben Skeggs ok on this one
as well. So i've CC'ed him, hopefully he'll notice :-)

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
