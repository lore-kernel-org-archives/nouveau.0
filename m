From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix __nouveau_fence_wait
	performance regression
Date: Tue, 08 Mar 2011 17:22:52 +0100
Message-ID: <871v2hzin7.fsf@riseup.net>
References: <20110213203804.GA5395@joi.lan> <20110304164905.GA2743@joi.lan>
	<AANLkTin_jouzPDGfNnYq_BRqPzbvOW+F6jFNuc7p=p5E@mail.gmail.com>
	<1299536668.29441.3.camel@nisroch> <20110307232256.GA2680@joi.lan>
	<87lj0qzaut.fsf@riseup.net> <20110308121628.GA20238@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0790225202=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110308121628.GA20238-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Tue, 8 Mar 2011 13:16:28 +0100")
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

--===============0790225202==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Tue, Mar 08, 2011 at 01:58:50AM +0100, Francisco Jerez wrote:
>> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>=20
>> > On Tue, Mar 08, 2011 at 08:24:26AM +1000, Ben Skeggs wrote:
>> >> On Mon, 2011-03-07 at 18:18 +0000, Maarten Maathuis wrote:
>> >> > On Fri, Mar 4, 2011 at 4:49 PM, Marcin Slusarz <marcin.slusarz@gmai=
l.com> wrote:
>> >> > > On Sun, Feb 13, 2011 at 09:38:04PM +0100, Marcin Slusarz wrote:
>> >> > >> Combination of locking and interchannel synchronization changes
>> >> > >> uncovered poor behaviour of nouveau_fence_wait, which on HZ=3D100
>> >> > >> configuration could waste up to 10 ms per call.
>> >> > >> Depending on application, it lead to 10-30% FPS regression.
>> >> > >> To fix it, shorten thread sleep time to 0.1 ms and ensure
>> >> > >> spinning happens for at least one *full* tick.
>> >> > >>
>> >> > >> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >> > >> ---
>> >> > >>  drivers/gpu/drm/nouveau/nouveau_fence.c |   10 ++++++++--
>> >> > >>  1 files changed, 8 insertions(+), 2 deletions(-)
>> >> > >>
>> >> > >> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/g=
pu/drm/nouveau/nouveau_fence.c
>> >> > >> index 221b846..75ba5e2 100644
>> >> > >> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> >> > >> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> >> > >> @@ -27,6 +27,9 @@
>> >> > >>  #include "drmP.h"
>> >> > >>  #include "drm.h"
>> >> > >>
>> >> > >> +#include <linux/ktime.h>
>> >> > >> +#include <linux/hrtimer.h>
>> >> > >> +
>> >> > >>  #include "nouveau_drv.h"
>> >> > >>  #include "nouveau_ramht.h"
>> >> > >>  #include "nouveau_dma.h"
>> >> > >> @@ -230,9 +233,12 @@ int
>> >> > >>  __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy,=
 bool intr)
>> >> > >>  {
>> >> > >>       unsigned long timeout =3D jiffies + (3 * DRM_HZ);
>> >> > >> -     unsigned long sleep_time =3D jiffies + 1;
>> >> > >> +     unsigned long sleep_time =3D jiffies + 2;
>> >> > >> +     ktime_t t;
>> >> > >>       int ret =3D 0;
>> >> > >>
>> >> > >> +     t =3D ktime_set(0, NSEC_PER_MSEC / 10);
>> >> > >> +
>> >> > >>       while (1) {
>> >> > >>               if (__nouveau_fence_signalled(sync_obj, sync_arg))
>> >> > >>                       break;
>> >> > >> @@ -245,7 +251,7 @@ __nouveau_fence_wait(void *sync_obj, void *s=
ync_arg, bool lazy, bool intr)
>> >> > >>               __set_current_state(intr ? TASK_INTERRUPTIBLE
>> >> > >>                       : TASK_UNINTERRUPTIBLE);
>> >> > >>               if (lazy && time_after_eq(jiffies, sleep_time))
>> >> > >> -                     schedule_timeout(1);
>> >> > >> +                     schedule_hrtimeout(&t, HRTIMER_MODE_REL);
>> >> > >>
>> >> > >>               if (intr && signal_pending(current)) {
>> >> > >>                       ret =3D -ERESTARTSYS;
>> >> > >> --
>> >> > >> 1.7.4.rc3
>> >> > >>
>> >> > >
>> >> > > ping again
>> >> > > _______________________________________________
>> >> > > Nouveau mailing list
>> >> > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> >> > > http://lists.freedesktop.org/mailman/listinfo/nouveau
>> >> > >
>> >> >=20
>> >> > This looks ok to me, but I would like to get Ben Skeggs ok on this =
one
>> >> > as well. So i've CC'ed him, hopefully he'll notice :-)
>> >> Ah sorry, I have actually looked at this quite a while back but came =
to
>> >> no solid conclusion.
>> >>=20
>> >> While yes, I did see some minor performance improvement from it, I al=
so
>> >> notice that now we once again get 100% CPU usage while an app is wait=
ing
>> >> for the GPU a lot..
>> >
>> > It's not "minor" performance improvement:
>> >
>> > without this patch (FPS):
>> > nexuiz:    53
>> > wop:       181
>> > tremulous: 157
>> > wsw0.5:    89
>> > glxgears:  730
>> >
>> > with:
>> > nexuiz:    63   (+18%)
>> > wop:       248  (+37%)
>> > tremulous: 156  (-0.6%)
>> > wsw0.5:    91   (+2%)
>> > glxgears:  1054 (+44%)
>> >
>> >
>> > Ok, so you are worried about CPU usage... Let's see what will happen if
>> > I remove spinning added by "drm/nouveau: Spin for a bit in=20
>> > nouveau_fence_wait() before yielding the CPU".
>> >
>> > reduced version (attached):
>> > nexuiz:    62
>> > wop:       248
>> > trem:      157
>> > wsw0.5:    90
>> > glxgears:  1055
>> >
>> > Good enough?
>>=20
>> Remember to exercise some software fallbacks as well (e.g. something
>> using core fonts), software fallbacks were the main users of the
>> spinning you've removed.
>
> corefonts are pretty fast (measured "time dmesg"):
>
> without (spinning + timeout 10ms): 0.08s
> with (spinning + hrtimeout 0.1ms): 0.08s
> reduced (no spinning + hrtimeout 0.1ms): 0.25s
> old (no spinning + timeout 10ms): 13s
>
Ah, so it's still trading one performance regression for another, and
you could make everyone happy at the same time.

> So I think "no spinning + hrtimeout 0.1ms" is a reasonable compromise...
>
What's the CPU usage difference between the spinning and the no-spinning
cases? It's likely to be negligible for most applications aside from the
ones using queries and fallbacks intensively, and in those two cases I
agree with you that optimizing for low CPU usage doesn't make a huge lot
of sense, getting low latency is already hard enough.

If I'm wrong and the initial spinning affects the overall CPU usage
negatively, then we have two different use cases with different latency
requirements and the DRM API needs to be fixed (though, there're maybe
other solutions to explore first, like, start with a really small
hrtimeout and increase it exponentially up to some cut-off value).

> BTW, old behaviour (no spinning + timeout 10ms) affects other workloads t=
oo
> nexuiz:      50
> wop:        153
> tremulous:  155
> wsw0.5:      89
> glxgears:   100 (!)
>
>> Anyway, software fallbacks and occlusion queries are the only two places
>> (that I can think of now) where we need the low latency your patch
>> gives, and, as Ben already pointed out, we probably want to keep CPU
>> usage at minimum in every other case.  As a middle ground, the "lazy"
>> flag (or rather, a "hog" flag?) could be exposed all the way up to
>> userspace, and those two cases fixed to set the flag differently.
>>=20
>> What do you think?
>
> I'm not sure. I think optimizing for low CPU usage is not the best what
> we can do right now. 3D performance is still too low behind blob.
> Let's fix 3D perf first and think about CPU usage later.
>

IMHO, switching to lazy waits was the right choice at this stage, it
doesn't make optimizing for "3D performance" any harder, quite the
opposite, it helps to pinpoint some poorly-pipelining programming
practices by making the already existing performance problem more
obvious.

>> >
>> > ---
>> > From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > Subject: [PATCH] drm/nouveau: fix __nouveau_fence_wait performance reg=
ression
>> >
>> > Combination of locking and interchannel synchronization changes
>> > uncovered poor behaviour of nouveau_fence_wait, which on HZ=3D100
>> > configuration could waste up to 10 ms per call.
>> > Depending on application, it lead to 10-30% FPS regression.
>> >
>> > To fix it, shorten thread sleep time to 0.1 ms.
>> >
>> > Additionally, remove spinning (added by "drm/nouveau: Spin for
>> > a bit in nouveau_fence_wait() before yielding the CPU"), because
>> > it's not needed anymore.
>> >
>> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  drivers/gpu/drm/nouveau/nouveau_fence.c |   11 ++++++++---
>> >  1 files changed, 8 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm=
/nouveau/nouveau_fence.c
>> > index a244702..010243b 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>> > @@ -27,6 +27,9 @@
>> >  #include "drmP.h"
>> >  #include "drm.h"
>> >=20=20
>> > +#include <linux/ktime.h>
>> > +#include <linux/hrtimer.h>
>> > +
>> >  #include "nouveau_drv.h"
>> >  #include "nouveau_ramht.h"
>> >  #include "nouveau_dma.h"
>> > @@ -229,9 +232,11 @@ int
>> >  __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool =
intr)
>> >  {
>> >  	unsigned long timeout =3D jiffies + (3 * DRM_HZ);
>> > -	unsigned long sleep_time =3D jiffies + 1;
>> > +	ktime_t t;
>> >  	int ret =3D 0;
>> >=20=20
>> > +	t =3D ktime_set(0, NSEC_PER_MSEC / 10);
>> > +
>> >  	while (1) {
>> >  		if (__nouveau_fence_signalled(sync_obj, sync_arg))
>> >  			break;
>> > @@ -243,8 +248,8 @@ __nouveau_fence_wait(void *sync_obj, void *sync_ar=
g, bool lazy, bool intr)
>> >=20=20
>> >  		__set_current_state(intr ? TASK_INTERRUPTIBLE
>> >  			: TASK_UNINTERRUPTIBLE);
>> > -		if (lazy && time_after_eq(jiffies, sleep_time))
>> > -			schedule_timeout(1);
>> > +		if (lazy)
>> > +			schedule_hrtimeout(&t, HRTIMER_MODE_REL);
>> >=20=20
>> >  		if (intr && signal_pending(current)) {
>> >  			ret =3D -ERESTARTSYS;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk12V90ACgkQg5k4nX1Sv1uXrQD/Wi0r9xeYjrvhGhQ/QICrtcGH
f7kV9ODCVTkeGR7AWAgA/i3qCCdCIq6G13LCcLAuJmt/grB0KWT5CxBUDxtgKkb5
=qmg7
-----END PGP SIGNATURE-----
--==-=-=--

--===============0790225202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0790225202==--
