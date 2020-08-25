From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v4 00/20] drm/dp, i915,
 nouveau: Cleanup nouveau HPD and add DP features from i915
Date: Tue, 25 Aug 2020 15:50:07 -0400
Message-ID: <20200825195027.74681-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Most of the reason I'm asking for an RFC here is because this
code pulls a lot of code out of i915 and into shared DP helpers.

Anyway-nouveau's HPD related code has been collecting dust for a while.
Other then the occasional runtime PM related and MST related fixes,
we're missing a lot of nice things that have been added to DRM since
this was originally written. Additionally, the code is just really
unoptimized in general:

* We handle connector probing in the same context that we handle short
  IRQs in for DP, which means connector probing could potentially block
  ESI handling for MST
* When we receive a hotplug event from a connector, we reprobe every
  single connector instead of just the connector that was hotplugged
* Additionally because of the above reason, combined with the fact I had
  the bad idea of reusing some of the MST locks when I last rewrote
  nouveau's DP MST detection, trying to handle any other events that
  require short HPD IRQs is a bit awkward to actually implement.
* We don't actually properly check whether EDIDs change or not when
  reprobing, which means we basically send out a hotplug event every
  single time we receive one even if nothing has changed

Additionally, the code for handling DP that we have in nouveau is also
quite unoptimized in general, doesn't use a lot of helpers that have
been added since it was written, and is also missing quite a number of
features:

* Downstream port capability probing
* Extended DPRX cap parsing
* SINK_COUNT handling for hpd on dongles

Luckily for us - all of these are implemented in i915 already. Since
there's no reason for us to reinvent the wheel, and having more shared
code is always nice, I decided to take the opportunity to extract the
code for all of these features from i915 into a set of core DP helpers,
which both i915 and nouveau (and hopefully other drivers in the future)
can use.

As well, this patch series also addesses the other general
connector probing related issues I mentioned above, along with rewriting
how we handle MST probing so we don't hit any surprise locking design
issues in the future.

As a note - most of this work is motivated by the fact that I'm
planning on adding max_bpc/output_bpc prop support, DSC support (for
both MST and SST, along with proper helpers for handling bandwidth
limitations and DSC), and fallback link retraining. I figured I might as
clean this code up and implement missing DP features like the ones
mentioned here before moving on to those tasks.

Lyude Paul (20):
  drm/nouveau/kms: Fix some indenting in nouveau_dp_detect()
  drm/nouveau/kms/nv50-: Remove open-coded drm_dp_read_desc()
  drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in nouveau_dp.c
  drm/nouveau/kms/nv50-: Use macros for DP registers in nouveau_dp.c
  drm/nouveau/kms: Don't clear DP_MST_CTRL DPCD in nv50_mstm_new()
  drm/nouveau/kms: Search for encoders' connectors properly
  drm/nouveau/kms/nv50-: Use drm_dp_dpcd_(readb|writeb)() in
    nv50_sor_disable()
  drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling
  drm/i915/dp: Extract drm_dp_has_mst()
  drm/nouveau/kms: Use new drm_dp_has_mst() helper for checking MST caps
  drm/nouveau/kms: Move drm_dp_cec_unset_edid() into
    nouveau_connector_detect()
  drm/nouveau/kms: Only use hpd_work for reprobing in HPD paths
  drm/i915/dp: Extract drm_dp_downstream_read_info()
  drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode
    validation
  drm/i915/dp: Extract drm_dp_has_sink_count()
  drm/i915/dp: Extract drm_dp_get_sink_count()
  drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
  drm/nouveau/kms: Don't change EDID when it hasn't actually changed
  drm/i915/dp: Extract drm_dp_read_dpcd_caps()
  drm/nouveau/kms: Start using drm_dp_read_dpcd_caps()

 drivers/gpu/drm/drm_dp_helper.c             | 167 +++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c     | 124 ++------
 drivers/gpu/drm/i915/display/intel_dp.h     |   1 -
 drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c      |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c      |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 305 +++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 132 ++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_display.c   |  72 ++++-
 drivers/gpu/drm/nouveau/nouveau_display.h   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 211 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_drm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   2 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  48 ++-
 include/drm/drm_dp_helper.h                 |  15 +-
 include/drm/drm_dp_mst_helper.h             |  22 ++
 21 files changed, 761 insertions(+), 389 deletions(-)

-- 
2.26.2
