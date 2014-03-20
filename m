From: David Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm: compute runpm on load,
 don't register autosuspend for non-runpm
Date: Wed, 19 Mar 2014 20:08:19 -0400 (EDT)
Message-ID: <465454377.2152657.1395274099679.JavaMail.zimbra@redhat.com>
References: <1395242922-1617-1-git-send-email-imirkin@alum.mit.edu>
 <CACAvsv5Gtei0nD2754pQF7ySkexzvGHq4j8JNwmBwG0JmyUGBg@mail.gmail.com>
 <911292108.2144314.1395272753596.JavaMail.zimbra@redhat.com>
 <CAKb7UvjRSO3SXJ8zUY70BRsM6A-2bgBYnEqLzmVBTEFGzzj1wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjRSO3SXJ8zUY70BRsM6A-2bgBYnEqLzmVBTEFGzzj1wA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org



----- Original Message -----
> From: "Ilia Mirkin" <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> To: "David Airlie" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: "Ben Skeggs" <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Ben Skeggs" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Sent: Thursday, 20 March, 2014 9:49:47 AM
> Subject: Re: [Nouveau] [PATCH] drm: compute runpm on load, don't register autosuspend for non-runpm
> 
> On Wed, Mar 19, 2014 at 7:45 PM, David Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> >> On Thu, Mar 20, 2014 at 1:28 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >> > There was a proliferation of duplicated checks for runpm == -1 &&
> >> > optimus. Instead of continuing that tradition, get rid of all of them,
> >> > only doing the optimus computation once on load.
> >> >
> >> > This should hopefully fix secondary cards suspending and then being
> >> > unable to come back in non-optimus setups.
> >> >
> >> > Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> >> > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.12+
> >> Also untested, but looks like a saner idea to me.  Dave?
> >
> > Unfortunately not sane, we are looking at adding apple-gmux support, so the
> > load
> > ordering is indeterminate, so doing this will mean we just have to undo it
> > later.
> 
> So... suggestions then? I always end up having to add runpm=0 on
> multi-gpu cards... the secondary gpu seems to suspend without any way
> back.

Figure out why you get suspended, send patch to fix it. The conditions should be enough to block it.

Dave.
