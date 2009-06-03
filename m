From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Nouveau DRM kernel tree
Date: Wed, 03 Jun 2009 22:13:13 +1000
Message-ID: <1244031194.17907.20.camel@localhost.localdomain>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Just a heads up that there's a Linux kernel tree up at
git://anongit.freedesktop.org/git/nouveau/linux-2.6 which (after
discussion in #nouveau) is where development of the Nouveau drm will
continue.  In the newttm-devel branch is the latest work towards using
the re-worked TTM memory manager that will likely appear in a future
upstream kernel.

The major differences between the drm in the newttm-devel branch, and
that up at drm.git are:

- TTM is the sole memory manager, the previous interfaces no longer
  exist.  For compatibility with the 0.0.13 kernel in drm.git the
  interface exposed is identical, however, the MM_ENABLED getparam will
  *always* return 1.  Calling the older ioctls will return an error.

- Kernel modesetting for all supported chipsets.
  - The code for G80 onwards should be fairly OK, it's mostly the same
    as what's in Fedora 11, which appears to work well.  There are some
    changes from F11 though, see below.
  - For earlier chipsets, fbcon comes up fine, and X will start on all
    the cards I have available, but it hasn't been overly tested and
    likely has some rough edges still.  The code is more-or-less in sync
    with the latest DDX git.

- NV50 modesetting:
  - Uses the display push buffer (yes, this is necessary, I didn't do
    it purely for the fun of it).  From some error messages seen
    while confusing the binary driver, NVIDIA call the display engine
    EVO, so, I stole that name too.  Any guesses what it stands for? :P
  - CRTCs can be configured to scan out non-linear buffers, except on
    the most hateful of all G80 chipsets (that'd be the original 8800).
    I'll look into that more at some stage.  Work is needed elsewhere
    before this will be useful anyway.

The most straight-forward way to try this out is to build the kernel
(2.6.30-rc7) with CONFIG_DRM_TTM and CONFIG_DRM_NOUVEAU enabled.  There
are ways to build against your current kernel, but I'll leave that as an
exercise to the reader.

Anyway, there are still some rough patches, but people have been asking
about this for a while now.  If testing, please report any
bugs/regressions noticed.

Ben.
