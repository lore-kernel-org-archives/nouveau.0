From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH] drm/ttm/nouveau: add
	DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT
Date: Sun, 18 Sep 2011 17:07:08 +0200
Message-ID: <20110918150708.GD2815@phenom.ffwll.local>
References: <20110918131857.GA3389@joi.lan>
	<20110918135950.GC2815@phenom.ffwll.local>
	<20110918143004.GA8929@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20110918143004.GA8929@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Sep 18, 2011 at 04:30:04PM +0200, Marcin Slusarz wrote:
> On Sun, Sep 18, 2011 at 03:59:50PM +0200, Daniel Vetter wrote:
> > On Sun, Sep 18, 2011 at 03:18:57PM +0200, Marcin Slusarz wrote:
> > > Currently DRM_NOUVEAU_GEM_CPU_PREP ioctl is broken WRT handling of signals.
> > > 
> > > nouveau_gem_ioctl_cpu_prep calls ttm_bo_wait which waits for fence to
> > > "signal" or 3 seconds timeout pass.
> > > But if it detects pending signal, it returns ERESTARTSYS and goes back
> > > to userspace. After signal handler, userspace repeats the same ioctl which
> > > starts _new 3 seconds loop_.
> > > So when the application relies on signals, some ioctls may never finish
> > > from application POV.
> > > 
> > > There is one important application which does this - Xorg. It uses SIGIO
> > > (for input handling) and SIGALARM.
> > > 
> > > GPU lockups lead to endless ioctl loop which eventually manifests in crash
> > > with "[mi] EQ overflowing. The server is probably stuck in an infinite loop."
> > > message instead of being propagated to DDX.
> > > 
> > > The solutions is to add new ioctl NOUVEAU_GEM_CPU_PREP_TIMEOUT with
> > > timeout parameter and decrease it on every signal.
> > 
> > Just fyi: We handle that issue in i915 by returning -EIO when the kernel
> > decides that the gpu has died for good and that resetting doesn't help.
> > Until then we rely on the ioctl restarting to kick everyone out of kernel
> > mode so the reset handler can do its business. If the reset is
> > successfull, userspace continues (due to the ioctl being restarted)
> > hopefully mostly undisturbed. While the gpu is hung, but not yet reset, we
> > stall all ioctls before taking the struct_mutex (see i915_gem_wait_error
> > in i915_mutex_lock_interruptible).
> > 
> > Imo the advantage of that approach is that the kernel utlimately decides
> > when the gpu is gone, and userspace (lacking much of the required
> > information) must not engage in such guessing-games, too.
> 
> This approach would be preferrable, but we don't know yet how to reset
> nvidia's gpu. Fixing this API bug could at least let us degrade to noaccel.
> And I believe there are cases where ttm_bo_wait can fail with EBUSY and it
> doesn't mean GPU locked up...

Well, we do this even when we do not have chipset reset support (or when
it's disabled). Then we just signal the demise of the gpu with -EIO
without bothering to restart. I think even this is preferable because the
kernel has a much better knowledge of when the gpu died. E.g. on i915 we
check instruction regs to see whether there's any forward progress still
going on or not. Also, the kernel can differentiate between a dead gpu and
a generally slumpy system (e.g. an unrelated swap storm is grinding any
allocations to a halt until the oom killer shows up). No point in
declaring the gpu wedged in this case.

And if ttm really can fail with -EBUSY for unrelated reasons, I think
that's just a kernel bug.
-Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
