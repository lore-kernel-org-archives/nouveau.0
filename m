From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
Date: Wed, 9 Sep 2020 10:07:06 -0400
Message-ID: <20200909140706.GA27322@dev.jcline.org>
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
 <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 09, 2020 at 10:22:14AM +0200, Karol Herbst wrote:
> On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > > new gp1xx temperature sensor") added support for reading finer-grain
> > > temperatures, but continued to report temperatures in 1 degree Celsius
> > > increments via nvkm_therm_temp_get().
> > >
> > > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > > temperatures, which would be inconvenient for other users of the
> > > function, a second interface has been added to line up with hwmon's
> > > native unit of temperature.
> > Hey Jeremy,
> >
> > Sorry this slipped past me until now.  I'm OK with adding support for
> > millidegree temperature reporting, but don't think we need to keep
> > both interfaces around and would rather see the existing code
> > converted to return millidegrees (even on GPUs that don't support it)
> > instead of degrees.
> >
> > Thanks!
> > Ben.
> >
> 
> just a note as I was trying something like that in the past: we have a
> lot of code which fetches the temperature and there are a lot of
> places where we would then do a divide by 1000, so having a wrapper
> function at least makes sense. If we want to keep the func pointers?
> well.. I guess the increased CPU overhead wouldn't be as bad if all
> sub classes do this static * 1000 as well either. I just think we
> should have both interfaces in subdev/therm.h so we can just keep most
> of the current code as is.
> 

Indeed. My initial plan was to change the meaning of temp_get() and
adjust all the users, but there's around a dozen of them and based on my
understanding of the users none of them cared much about such accuracy.

However, I do find having one way to do things appealing, so if there's
a strong preference for it, I'm happy to produce a somewhat more
invasive patch where all users expect millidegrees.

- Jeremy
