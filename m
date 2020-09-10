From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature reporting
Date: Thu, 10 Sep 2020 14:23:30 +1000
Message-ID: <CACAvsv5Pr_=ns89XqY2JbLNo8vPHdv6CJW3LJpFb4c+HAjiK8Q@mail.gmail.com>
References: <20200812204952.1921587-1-jcline@redhat.com> <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
 <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com> <20200909140706.GA27322@dev.jcline.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200909140706.GA27322@dev.jcline.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremy Cline <jcline@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: nouveau.vger.kernel.org

On Thu, 10 Sep 2020 at 00:07, Jeremy Cline <jcline@redhat.com> wrote:
>
> On Wed, Sep 09, 2020 at 10:22:14AM +0200, Karol Herbst wrote:
> > On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> > >
> > > On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
> > > >
> > > > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > > > new gp1xx temperature sensor") added support for reading finer-grain
> > > > temperatures, but continued to report temperatures in 1 degree Celsius
> > > > increments via nvkm_therm_temp_get().
> > > >
> > > > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > > > temperatures, which would be inconvenient for other users of the
> > > > function, a second interface has been added to line up with hwmon's
> > > > native unit of temperature.
> > > Hey Jeremy,
> > >
> > > Sorry this slipped past me until now.  I'm OK with adding support for
> > > millidegree temperature reporting, but don't think we need to keep
> > > both interfaces around and would rather see the existing code
> > > converted to return millidegrees (even on GPUs that don't support it)
> > > instead of degrees.
> > >
> > > Thanks!
> > > Ben.
> > >
> >
> > just a note as I was trying something like that in the past: we have a
> > lot of code which fetches the temperature and there are a lot of
> > places where we would then do a divide by 1000, so having a wrapper
> > function at least makes sense. If we want to keep the func pointers?
> > well.. I guess the increased CPU overhead wouldn't be as bad if all
> > sub classes do this static * 1000 as well either. I just think we
> > should have both interfaces in subdev/therm.h so we can just keep most
> > of the current code as is.
> >
>
> Indeed. My initial plan was to change the meaning of temp_get() and
> adjust all the users, but there's around a dozen of them and based on my
> understanding of the users none of them cared much about such accuracy.
>
> However, I do find having one way to do things appealing, so if there's
> a strong preference for it, I'm happy to produce a somewhat more
> invasive patch where all users expect millidegrees.
Yeah, I do have a strong preference for not having to keep multiple
interfaces around unnecessarily.  It'd be somewhat different if we had
external interactions, but this is all stuff within the module and we
should be able to make these kinds of changes without too much pain.

Ben.

>
> - Jeremy
>
