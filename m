From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 10/37] drm: add per-crtc locks
Date: Thu, 13 Dec 2012 16:25:30 +0200
Message-ID: <20121213142530.GG29018@intel.com>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355317637-16742-11-git-send-email-daniel.vetter@ffwll.ch>
	<20121213113812.GF29018@intel.com>
	<CAKMK7uEPQQ6Yttf1upttTE0WVKJmo3bSn-xRUQvKyQCUDZySJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uEPQQ6Yttf1upttTE0WVKJmo3bSn-xRUQvKyQCUDZySJw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 13, 2012 at 12:54:44PM +0100, Daniel Vetter wrote:
> On Thu, Dec 13, 2012 at 12:38 PM, Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >>   And if we _really_ want such semantics, we can always get them by
> >>   introducing another pageflip mutex between the mode_config.mutex and
> >>   the individual crtc locks. Pageflips crossing more than one crtc
> >>   would then need to take that lock first, to lock out concurrent
> >>   multi-crtc pageflips.
> >
> > I'm actually concerned with multi CRTC page flips, not for moving planes
> > between CRTCs, but mainly for updating content on genlocked displays
> > atomically. We need to avoid deadlocks between multiple CRTC locks. Try=
ing
> > to take the CRTC locks in the same order would be a solution, but since
> > user space can send the props in any order, it's going to require extra
> > of work.
> =

> Ordering CRTC locks should also work - modeset_lock_all takes them
> always in the same order, and as long as you only take a single crtc
> nested within the modeset lock that's still ok (e.g. the load-detect
> code). We don't have many CRTCs, so even the dumbest sort will be fast
> enough. A bit of work will be required to make lockdep happy. But we
> can achieve this by nesting CRTCs within a fake lock encapsulated by
> the lock/unlock helper functions.

Yeah it would mean pre-processing the object ID list in the atomic
ioctl. Currently there is at most num_crtc+num_plane object IDs in the
list, assuming userspace didn't send any duplicates. For each of those
we'd need to take the CRTC lock. So a bit of a change to my code, but
not too bad I suppose.

But this also has to handle planes that can move between CRTCs, so
it's not quite as simple as that. Maybe grab the lock for
plane->crtc, and once you have the lock re-check that plane->crtc
didn't change before we got the lock.

We also need to change things so that plane->crtc can never be NULL.
Currently when a plane is disabled, we set plane->crtc to NULL, but
since we need that information for taking the lock, and to prevent
two guys from accessing the same disabled plane, we can no longer
allow that.

-- =

Ville Syrj=E4l=E4
Intel OTC
