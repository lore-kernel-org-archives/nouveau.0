From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 04/37] drm/i915: rework locking for
 intel_dpio|sbi_read|write
Date: Wed, 12 Dec 2012 14:05:52 -0800
Message-ID: <20121212140552.69f7a172@jbarnes-desktop>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355317637-16742-5-git-send-email-daniel.vetter@ffwll.ch>
	<20121212125447.728e791a@jbarnes-desktop>
	<20121212220032.GA5690@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20121212220032.GA5690@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, DRI Development <dri-devel@lists.freedesktop.org>, Nouveau Dev <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, 12 Dec 2012 23:00:34 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Dec 12, 2012 at 12:54:47PM -0800, Jesse Barnes wrote:
> > On Wed, 12 Dec 2012 14:06:44 +0100
> > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > 
> > > Spinning for up to 200 us with interrupts locked out is not good. So
> > > let's just spin (and even that seems to be excessive).
> > > 
> > > And we don't call these functions from interrupt context, so this is
> > > not required. Besides that doing anything in interrupt contexts which
> > > might take a few hundred us is a no-go. So just convert the entire
> > > thing to a mutex. Also move the mutex-grabbing out of the read/write
> > > functions (add a WARN_ON(!is_locked)) instead) since all callers are
> > > nicely grouped together.
> > > 
> > > Finally the real motivation for this change: Dont grab the modeset
> > > mutex in the dpio debugfs file, we don't need that consistency. And
> > > correctness of the dpio interface is ensured with the dpio_lock.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Looks fine, I guess you could convert the wait_for_atomic_us to the
> > non-atomic variant now that you have a mutex.  Either way:
> 
> I like that _us purely to document the correct timeout ...

Yeah we'd need a non-atomic _us variant to clean it up.  No biggie.

-- 
Jesse Barnes, Intel Open Source Technology Center
