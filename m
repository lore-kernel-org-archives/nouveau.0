From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Documentation: nouveau: Introduce some nouveau
 documentation
Date: Thu, 24 Sep 2020 11:38:47 -0400
Message-ID: <20200924153847.GA12520@xps13.jcline.org>
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
 <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
 <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c04d84e2-9091-a22c-c3e4-e43e4ee72057-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
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
To: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Sep 24, 2020 at 01:56:32PM +0100, Roy Spliet wrote:
> 
> Op 23-09-2020 om 22:36 schreef Karol Herbst:
> > On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > 
> > > On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> > > > On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > 
> > > <snip>
> > > 
> > > > yeah, I think overall this file is a good idea and being able to get a
> > > > quick overview over the driver is helpful. I think if we focus on the
> > > > user facing things first, like the hwmon or other things users
> > > > generally interact with would be helpful. I think if we start to
> > > > document areas where there are many low hanging fruits, this could
> > > > help random people to start with easier tasks and get more used to the
> > > > driver overall, so I'd probably ignore most of the stuff which really
> > > > requires a fundamental understanding on how things work and focus more
> > > > on vbios parsing (which has annoying interfaces anyway and it might
> > > > make sense to make it more consistent and nicer to use) and/or simple
> > > > code interfacing with the mmio space.
> > > > 
> > > 
> > > I'll admit to being motivated by entirely selfish reasons. I know
> > > practically nothing about nouveau and I'm the type of person who likes
> > > to keep notes about how things work together, both free form and
> > > structured in-line docs. All that to say, I think focusing on the
> > > "low-hanging fruit" stuff will be very beneficial and I'm happy to do
> > > that, but I'm also interested in documenting everything else I run
> > > across.
> > > 
> > 
> > yeah, that's fine. I was just giving a suggestion on where the initial
> > focus should be on.
> > 
> > > > Eg some users have problems with their fans as they are either always
> > > > ramping up to max, or not running at all... GPUs temperature or power
> > > > consumption is reporting incorrectly... all those things users hit
> > > > regularly, but which isn't really important enough so it just falls
> > > > under the table even if it gets reported.
> > > > 
> > > 
> > > This does bring up an interesting point about organization and target
> > > audiences. Typically when I'm writing documentation I like to organize
> > > things by target audiences, so we could have a layout like:
> > > 
> > > * General Introduction
> > > 
> > > * User Guide
> > >      - Overview of supported hardware/features/etc
> > 
> > That's best to document in a wiki though. And we had plans to convert
> > the existing old wiki over to gitlab. And maybe It think we really
> > should do that and clean it up while we work on that. It's just a huge
> > project but maybe just starting with whatever you want to do would be
> > fine and after a while nothing is left. Anyway, I think we should
> > discuss this more openly with the others as well. i don't like the
> > current wiki anyway, as only approved developers can change things and
> > with a gitlab wiki we could even take MRs on stuff.
> > 
> > >      - Installation
> > 
> > well.. I think this can be skipped ;) But still, also belongs more
> > into a wiki. I think what we could cover here is to how to clean up
> > remaining stuff from the blob driver as this is something which comes
> > up quite a lot on IRC though.
> > 
> > >      - Configuration (module parameters and such)
> > >      - Troubleshooting
> > 
> > that would be cool to have in the wiki as well. Just collecting the
> > most common issue and document it there. Especially if it is on
> > gitlab, users can just do that as well :)
> > 
> > >      - Getting Involved (bug reporting, running tests, etc)
> > 
> > yeah, and we have some stuff on that on the old wiki already, it's
> > just very outdated and needs updating, which as said above can only be
> > done by developers and developers sadly have other things to do :)
> > 
> > > 
> > > * Developer Guide
> > >      - Architecture Overview
> > >      - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
> > >      - Internal APIs
> > 
> > Right, those things I'd like to see in the kernel tree actually.
> > 
> > >      - Debugging and Development Tools
> > >      - Contribution Guide
> > > 
> > 
> > Those I think belong more into the wiki again. The latter is a bit
> > hard to split as there are kernel guides, but also community and
> > project guides. Mesa does things differently than let's say the
> > kernel. And Nouveau is still in this limbo state being on the old
> > infra, but also on the new one with mesa...
> > 
> > > I'm not sure how much stuff people want to keep on the
> > > nouveau.freedesktop.org wiki vs here.
> > > 
> > 
> > I think the first step actually is to set up a proper nouveau project
> > on gitlab for dealing with issues and the wiki. I would be fine to do
> > that and we can also move the code there late. But maybe let's start
> > with the wiki :)
> 
> Risking to turn this into a "let's fix everything in one go" project that
> ends up never getting finished, I just want to make sure that everybody is
> also aware of the documentation generated from Envytools [0]. Especially
> "architecture overview" (that is, if we're talking about hardware
> architecture and not driver/software architecture) might be better suited in
> envytools.

As Ilia noted, my hope is this document will focus on the software
architecture and not necessarily the hardware. The Envytools docs are
really useful so I think it would be good to add pointers to it in this
document and note all hardware architecture documentation should go
there.

> 
> As for module parameters, IMHO modinfo is supposed to be the source of
> information. It's sadly lacking any "sub-"option inside nouveau.config and
> nouveau.debug, which may be by design. Perhaps expanding the modinfo
> explanations can help cover at least all the other options in a way that
> never gets out of sync with source code.
> 

I spent a little time looking at how difficult it would be to
auto-generate Sphinx documentation using the same source as modinfo, but
it seemed to be a non-trivial task so I though in the interim using
doc-blocks (as some other drivers do) would be nice. I do agree with
you, though, that ideally modinfo is the one place to document options.

I'm still hoping to find time at some point to wire up a general
solution such that any kernel doc can just use a Sphinx directive to
yank the modinfo documentation, at which point we could move these
doc-blocks into the modinfo explanations.

- Jeremy
