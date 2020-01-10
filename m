From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct
 drm_driver.get_scanout_position()
Date: Fri, 10 Jan 2020 17:25:56 +0200
Message-ID: <20200110152556.GK13686@intel.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-4-tzimmermann@suse.de>
 <87eew7o73u.fsf@intel.com>
 <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
 <875zhjo1op.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <875zhjo1op.fsf@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, eric@anholt.net, amd-gfx@lists.freedesktop.org, benjamin.gaignard@linaro.org, alexandre.torgue@st.com, David1.Zhou@amd.com, thellstrom@vmware.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, vincent.abriou@st.com, mcoquelin.stm32@gmail.com, rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com, freedreno@lists.freedesktop.org, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

On Fri, Jan 10, 2020 at 03:56:06PM +0200, Jani Nikula wrote:
> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Hi
> >
> > Am 10.01.20 um 12:59 schrieb Jani Nikula:
> >> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>> The callback struct drm_driver.get_scanout_position() is deprecated in
> >>> favor of struct drm_crtc_helper_funcs.get_scanout_position().
> >>>
> >>> i915 doesn't use CRTC helpers. The patch duplicates the caller
> >>> drm_calc_vbltimestamp_from_scanoutpos() for i915, such that the callb=
ack
> >>> function is not needed.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> ---
> >>>  drivers/gpu/drm/i915/i915_drv.c |   3 +-
> >>>  drivers/gpu/drm/i915/i915_irq.c | 117 ++++++++++++++++++++++++++++++=
--
> >>>  drivers/gpu/drm/i915/i915_irq.h |   9 +--
> >>>  3 files changed, 119 insertions(+), 10 deletions(-)
> >> =

> >> Not really enthusiastic about the diffstat in a "cleanup" series.
> >
> > Well, the cleanup is about the content of drm_driver :)
> >
> >> =

> >> I wonder if you could add a generic helper version of
> >> drm_calc_vbltimestamp_from_scanoutpos where you pass the
> >> get_scanout_position function as a parameter. Both
> >> drm_calc_vbltimestamp_from_scanoutpos and the new
> >> i915_calc_vbltimestamp_from_scanoutpos would then be fairly thin
> >> wrappers passing in the relevant get_scanout_position function.
> >
> > Of course. Will be in v2 of the series.
> =

> Please give Ville (Cc'd) a moment before sending v2 in case he wants to
> chime in on this.

Passing the function pointer was one option I considered for this a while
back. Can't remeber what other solutions I condsidered. But I guess I
didn't like any of them enough to make an actual patch.

-- =

Ville Syrj=E4l=E4
Intel
