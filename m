From: Bryce Harrington <bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [Fwd: Re: Introduction and discussion - Nouveau for
 Ubuntu Lucid]
Date: Sun, 22 Nov 2009 22:19:03 -0800
Message-ID: <20091123061903.GD3083@bryceharrington.org>
References: <4B099687.6000002@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4B099687.6000002-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Steve Conklin <steve.conklin-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Canonical Kernel Team List <canonical-kernel-team-33AaDErTWvAAkhNd+W/JZ0EOCMrvLtNR@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Nov 22, 2009 at 01:52:39PM -0600, Steve Conklin wrote:
> Steve,
> 
> we appreciate you came forward beforehand. Below are some comments
> on how I personally view the situation with Nouveau, and I believe
> they are mostly the concensus among the developers.
> 
> On Sat, 21 Nov 2009 21:33:33 -0600
> Steve Conklin <steve.conklin-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> 
> >   I'm the Ubuntu kernel team member focusing on graphics during
> > the Ubuntu Lucid Lynx (10.4) cycle. At the Ubuntu developer
> > summit last week, we made the decision to include Nouveau in the
> > Lucid kernel.  I'd like to open a few topics for discussion with
> > the Nouveau community:
> > 
> > First, I want to make sure we're pulling from the repo you prefer
> > for delivery with the distro. I've seen the information here -
> > http://nouveau.freedesktop.org/wiki/FrontPage#Source and here -
> > http://lists.freedesktop.org/archives/nouveau/2009-March/002765.html
> > 
> > and I haven't been able to find a tree that's indicated for
> > release to upstream or distros. Is the master branch on the
> > freedesktop repo the best place to pull from?
> 
> That is because there are no trees for upstream nor distros yet.
> The kernel upstreaming tree has not been created yet, and we are
> still not sure how the development process will look like.
> Whatever distros do, they are on their own. You can follow
> http://nouveau.freedesktop.org/wiki/InstallNouveau , the install
> guides tell which trees to use. They are basically 'master' of
> nouveau/linux-2.6, libdrm and xf86-video-nouveau.
> 
> On the DRM kernel modules side, we have an issue with the ctxprogs,
> previously known as voodoo: we do not know if it can be distributed
> legally as is, so we are trying to play it safe. People are working
> on that, and that is the major reason why Nouveau is not in staging
> yet. ( http://lwn.net/Articles/357805/ )
> 
> Note, that we prefer to have the whole set of DRM kernel modules
> installed from the Nouveau kernel tree, and that may sometimes
> cause problems if you try to support other drivers at the same time.

Right, we've run into the trouble that because the i915 driver is loaded
by initramfs, it loads its drm module, and when nouveau tries to load
with its own separate drm, it won't load.  I guess we're going to need
the initramfs to be smarter about all of this.
 
> On the libdrm side, even though Nouveau code is in master and
> included in release packages, Nouveau is not released yet. This
> means that we rely on git revisions. Releases of libdrm may
> be too old for the other parts to work.

This is good to know.  Ideally we'd prefer to not ship a git snapshot of
libdrm for Lucid, since that impacts requirements set for other drivers
as well, but during Lucid development it should be okay.

> There's nothing special about the DDX, it lives in its own repo,
> unreleased.
> 
> Nouveau has had the policy, that people should not try the Mesa
> accelerated 3D driver, and I guess this still holds, so I would
> advice against distributing that. It is still far too unstable to
> be installed system-wide.

Noted.  We'll be shipping mesa 7.7 on Lucid.

> > Second, I expect that we'll have one or two calls for testing. I
> > welcome discussions about any particular functionality or
> > hardware that the Nouveau community would like testing coverage
> > on, and any preferred tools for testing. Ubuntu testing results
> > and bugs are open, and there are some tagging and processing
> > tools that I can use to help get these back to the Nouveau
> > community in ways that will be helpful.
> 
> The individual developers should comment on this, since I have not
> written any considerable pieces of code. The wiki front page has
> the generic testing request.
> 
> > Third, we have a good facility to capture logs and useful
> > information after oopses, crashes, and when bugs are filed. If
> > there's any information that's useful to the Nouveau developers
> > that's not part of the normal kernel logs, I'll make sure we
> > gather them - just let me know what you need.
> 
> Kernel and X logs are the most important to start with. Other
> things that may be requested when working on a specific bug are:
> - video bios dump
> - kernel log with special debugging options for the DRM modules
> - mmiotrace of the proprietary driver
> And of course, requests to try patches or the latest git revision.

The apport hook captures the kernel and X logs so far.  The other things
might be trickier to fold in, but I'll add these to my todo list to
investigate.

An example of the information captured by the testing tools is:
https://bugs.launchpad.net/ubuntu/+bug/474787

> > Last, what else have I missed that I should know about?
> 
> Go for KMS, user mode setting is not that interesting.
> 
> I should probably roughly sketch the Nouveau release steps:
> 1. get Nouveau DRM module into staging
> 2. get Nouveau DRM module released in mainline kernel
> 3. release libdrm
> 4. release DDX
> The timetable is completely open, so do not expect anything.
> 
> How do you plan to distribute Nouveau? Have one or two snapshots
> for testing and then freezing the packages? Or do you intend to
> do snapshots every once in a while to update it?

We will be doing snapshots periodically and including them in the
development version of the distro.

> Outdated distribution packages are a bit of a pain already,
> but if Ubuntu actively takes the support burden, I guess we can
> live with that. It is far too tempting to say "please try the
> latest git revision" before taking any deeper look into a bug
> report.

For testing purposes, we have been providing nouveau in our 
xorg-edgers.  This is a collection of git snapshots of upstream code
which is updated every week or so:

  https://edge.launchpad.net/~xorg-edgers/+archive/ppa

For the -intel driver, they've found this very helpful for situations
where they would want the bug reporter to test against git, but the bug
reporter lacks the technical skill to install all the various pieces
from git on their own.

> Oh, could you make mmiotrace easily available on Ubuntu?
> I'm not sure what your current situation is, but if it requires
> a kernel recompile, it is a big step. It needs to be enabled in
> the kernel configuration, and it is supposed to have
> negligible impact on the system while not activated at runtime.
> AFAIK, the extra memory burden is one page per cpu, plus there
> can be some spurious kernel messages while using gdb.
> http://nouveau.freedesktop.org/wiki/MmioTrace
> 
> It would also help if you have an easy way to switch between the
> Nvidia proprietary driver and Nouveau.

Currently it's difficult to switch between them, but we can probably fix
that.

Bryce
