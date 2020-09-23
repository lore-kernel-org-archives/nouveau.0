From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Documentation: nouveau: Introduce some nouveau
 documentation
Date: Wed, 23 Sep 2020 16:39:18 -0400
Message-ID: <20200923203918.GA37078@xps13>
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

<snip>

> yeah, I think overall this file is a good idea and being able to get a
> quick overview over the driver is helpful. I think if we focus on the
> user facing things first, like the hwmon or other things users
> generally interact with would be helpful. I think if we start to
> document areas where there are many low hanging fruits, this could
> help random people to start with easier tasks and get more used to the
> driver overall, so I'd probably ignore most of the stuff which really
> requires a fundamental understanding on how things work and focus more
> on vbios parsing (which has annoying interfaces anyway and it might
> make sense to make it more consistent and nicer to use) and/or simple
> code interfacing with the mmio space.
> 

I'll admit to being motivated by entirely selfish reasons. I know
practically nothing about nouveau and I'm the type of person who likes
to keep notes about how things work together, both free form and
structured in-line docs. All that to say, I think focusing on the
"low-hanging fruit" stuff will be very beneficial and I'm happy to do
that, but I'm also interested in documenting everything else I run
across.

> Eg some users have problems with their fans as they are either always
> ramping up to max, or not running at all... GPUs temperature or power
> consumption is reporting incorrectly... all those things users hit
> regularly, but which isn't really important enough so it just falls
> under the table even if it gets reported.
> 

This does bring up an interesting point about organization and target
audiences. Typically when I'm writing documentation I like to organize
things by target audiences, so we could have a layout like:

* General Introduction

* User Guide
    - Overview of supported hardware/features/etc
    - Installation
    - Configuration (module parameters and such)
    - Troubleshooting
    - Getting Involved (bug reporting, running tests, etc)

* Developer Guide
    - Architecture Overview
    - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
    - Internal APIs
    - Debugging and Development Tools
    - Contribution Guide

I'm not sure how much stuff people want to keep on the
nouveau.freedesktop.org wiki vs here.

> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > index 5a96c942d912..76b90d7ddfc6 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > @@ -1,22 +1,57 @@
> >  /* SPDX-License-Identifier: MIT */
> > +
> > +/**
> > + * DOC: Overview
> > + *
> > + * Interfaces for working with the display engine.
> > + */
> > +
> >  #ifndef __NVKM_DISP_H__
> >  #define __NVKM_DISP_H__
> > +
> > +/**
> > + * nvkm_disp() - Get a &struct nvkm_disp from a &struct nvkm_engine.
> > + *
> > + * @p: A &struct nvkm_engine reference.
> > + *
> > + * Return: The &struct nvkm_disp that contains the given engine.
> > + */
> >  #define nvkm_disp(p) container_of((p), struct nvkm_disp, engine)
> >  #include <core/engine.h>
> >  #include <core/event.h>
> >
> > +/**
> > + * struct nvkm_disp - Represents a display engine.
> > + *
> > + * This structure is for <some abstraction here>. It has <some assumptions
> > + * about its usage here>.
> > + */
> >  struct nvkm_disp {
> > +    /** @func: Chipset-specific vtable for manipulating the display. */
> >         const struct nvkm_disp_func *func;
> > +
> > +    /** @engine: The engine for this display. */
> >         struct nvkm_engine engine;
> >
> > +    /** @head: list of heads attached to this display. */
> >         struct list_head head;
> > +
> > +    /** @ior: List of IO resources for this display. */
> >         struct list_head ior;
> > +
> > +    /** @outp: List of outputs for this display. */
> >         struct list_head outp;
> > +
> > +    /** @conn: List of connectors for this display. */
> >         struct list_head conn;
> >
> > +    /** @hpd: An event that fires when something happens I guess. */
> >         struct nvkm_event hpd;
> > +
> > +    /** @vblank: An event that fires and has some relation to the vblank. */
> >         struct nvkm_event vblank;
> >
> > +    /** @client: The oproxy (?) client for this display. */
> >         struct nvkm_oproxy *client;
> >  };
> 
> generally not a big fan of "int a; // a is an int" kind of
> documentation. But if it would specify constraints or details on how
> it's valid to use those fields, then it makes totally sense to add
> stuff.

Definitely, I think that is not particularly helpful documentation. Of
course, the what and why of a function parameter or struct member is
very likely to be more interesting than that, but it's true that every
once in a while that the variable name can be so clear there's not much
else to say.

I think it's fair to say the documentation I added for the above struct
is not good. I think it's also fair to say that a new-comer such as
myself who stumbles upon this structure has practically no chance of
guessing what it's all about without reading a bunch of additional code.
My first guess was that it represented a display I had plugged in, which
at this point I'm fairly confident is not at all correct. It required me
to look at many users of this struct along with perusing envytools
documentation to guess it represented a display engine.

It may well be I'm an exceptionally slow learner, but even short notes
can be extremely helpful.

> 
> not sure if you were aware of it, but we have some documentation on
> the module options here:
> https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> 
> But I think it makes sense to move it into the source code and link to
> the new thing from the wiki then.
> 

Indeed, and in fact I started this documentation from the wiki, but
tried my best to fill in the missing parameters and config options (you
don't happen to know what the NvAcrWpr* config options do, do you?)

Thanks!

- Jeremy
