From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] drm/probe_helper,
 drm/nouveau: Validate MST modes against PBN
Date: Fri, 24 Jul 2020 13:04:55 -0400
Message-ID: <20200724170457.711072-1-lyude@redhat.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Now that we've added the hooks that we've needed for this and used them
in i915, let's add one more hook (which I could use some feedback on,
I'm not sure if it's worth maybe just reworking how we do mode pruning
in nouveau instead...) and start using this in our mst ->mode_valid
callback to filter out impossible to set modes on MST connectors.

Lyude Paul (2):
  drm/probe_helper: Add drm_connector_helper_funcs->get_modes_ctx()
  drm/nouveau/kms/nv50-: Check MST display modes against available PBN

 drivers/gpu/drm/drm_probe_helper.c          | 11 +++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 41 ++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  4 +-
 include/drm/drm_modeset_helper_vtables.h    | 42 +++++++++++++++++++++
 5 files changed, 104 insertions(+), 18 deletions(-)

-- 
2.26.2
