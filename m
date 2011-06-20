From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gpu lockup detection and fallback to noaccel
Date: Mon, 20 Jun 2011 13:03:30 +0200
Message-ID: <20110620110330.GA3678@joi.lan>
References: <20110614211859.GA3687@joi.lan>
	<1308119242.8806.1.camel@maxim-laptop>
	<20110619222554.GI4771@joi.lan> <1308529026.2464.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308529026.2464.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jun 20, 2011 at 10:17:02AM +1000, Ben Skeggs wrote:
> On Mon, 2011-06-20 at 00:25 +0200, Marcin Slusarz wrote:
> > On Wed, Jun 15, 2011 at 09:27:22AM +0300, Maxim Levitsky wrote:
> > > On Tue, 2011-06-14 at 23:18 +0200, Marcin Slusarz wrote: 
> > > > Hi
> > > > 
> > > > I have a very rough patchset which adds support for GPU lockup detection and fallback
> > > > to (more or less) noaccel to xf86-video-nouveau.
> > > > 
> > > > As the patches are only a proof of concept and needs a lot of work, I would like
> > > > to know first if this is a desired feature - I don't want to spend a couple of days
> > > > on patches which will be ignored or rejected with a reason "we don't need it".
> > > > 
> > > > So, what do you think?
> > > 
> > > Will love it! I have unexplained hangs here, so maybe I could debug them
> > > further with this.
> > > 
> > 
> > Thanks for encouragement. But...
> > 
> > I was hoping for reponse from someone with commit access. I really really hate wasting
> > time, so I'm not going to finish it. Oh well, I guess it's not that important as I thought.
> Hey,
> 
> I'd be interested in seeing the approach you've taken at least.  I'm not
> convinced this is something we want exactly, my fear is that a lot of
> bugs will end up covered over with people not noticing.  But, lets
> see :)
> 

General idea is: detect nouveau_bo_map failures and disable acceleration.

libdrm:
Problem 1: timeout in __nouveau_fence_wait never triggers, because xserver uses signals, (SIGIO
for input and SIGALRM for some short timers), which interrupt fence loop and causes syscall restart.
Solution: detect timeouts on libdrm side.

Problem 2: nouveau_pushbuf_flush asserts when it can't allocate space for next push buffer.
Solution: handle it and return error. As WAIT_RING and FIRE_RING uses nouveau_pushbuf_flush, they
need to propagate error further. BEGIN_RING uses WAIT_RING, so it needs propagate error too.

xf86-video-nouveau:
Should handle all errors (nouveau_bo_map, BEGIN_RING, WAIT_RING, FIRE_RING) and disable acceleration.
This is tricky.
Problem 3: we can't disable exa in the middle of accelerated operation (which might consist of
several exa ops), so we need to mark channel with AccelBroken and return false from any Check/Prepare
funcs. The problem is: we need at least one operation - nouveau_exa_prepare_access. On NV50 it means
WrappedFB must be enabled. (I didn't investigate it yet, but maybe we could untile the pixmap?)
WFB has some performance overhead, so this whole functionality would probably need driver option
(e.g. DetectGPULockups), which would implicitly enable WFB :(. Exa with only PrepareAccess hook
is EXTREMELY slow (~0.1 FPS, maybe even less), so after one full accel operation, we need
to disable exa entirely and fallback to NoAccel - I didn't investigate how to do it yet.

Additionally, nouveau_exa_prepare_access needs to use NOUVEAU_BO_NOSYNC when AccelIsBroken, because
waiting for locked up pgraph does not make any sense.

Completely unrelated to this madness is detecting GPU lockup at driver initialization time.
It's nice and clean and it allows to restart xserver automatically in NoAccel mode after lockup
(However it needs to workaround bug in xserver, bugfix already sent to xorg-devel list -
http://lists.x.org/archives/xorg-devel/2011-June/023075.html).

Mesa:
Should assert when any of nouveau_bo_map/BEGIN_RING/WAIT_RING/FIRE_RING fail. At least for now.

Marcin
