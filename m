From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/10] extract dp helper functions
Date: Mon, 22 Oct 2012 23:30:14 +0200
Message-ID: <20121022213014.GI24005@phenom.ffwll.local>
References: <1350548132-3037-1-git-send-email-daniel.vetter@ffwll.ch>
	<CADnq5_OuZkS0qO736MWyHRiHiLfD+JX522S7Y6e1o8ZH2bEzgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CADnq5_OuZkS0qO736MWyHRiHiLfD+JX522S7Y6e1o8ZH2bEzgA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, xorg-driver-ati@lists.x.org, DRI Development <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Oct 18, 2012 at 09:30:01AM -0400, Alex Deucher wrote:
> On Thu, Oct 18, 2012 at 4:15 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > Hi all,
> >
> > I've frustrated myself the last few days yelling at our link training code.
> > Comparing the i915 code to radeon and nouveau I've noticed the lack of a nice
> > set of dp helper functions. So I've started to extract a few.
> >
> > There's lots more that we can do I think (link configuration selection, the i2c
> > over aux retry stuff which diverges already between i915 and radeon, maybe more
> > higher level parts of the training sequence). But there the drivers diverge
> > quite a bit (e.g. the link configuration is driver by different things in each
> > driver: coded link bw from the dp spec, link clock or required bw vs avialable
> > bw), so that's more work and probably best done when reworking these functions
> > for other reasons.
> >
> > I've also tried to put the new helpers a bit to use in nouveau, but due to lack
> > of hw that part is untested.
> >
> > Comments and testing highly welcome.
> 
> Looks good to me.  Other than the minor change required in patch7,
> this series is:
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Slurped into drm-intel-next, with all the nouveau patches and hunks
dropped (I'll pester Ben once this has landed in drm-next), as discussed
on irc. Thanks for reviewing this pile.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
