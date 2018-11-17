From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 3/6] drm/nouveau: Stop reading port->mgr in nv50_mstc_get_modes()
Date: Fri, 16 Nov 2018 19:21:17 -0500
Message-ID: <20181117002120.28703-4-lyude@redhat.com>
References: <20181117002120.28703-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181117002120.28703-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

mstc->port isn't validated here so it could be null or worse when we
access it. And drivers aren't ever supposed to be looking at it's
contents anyway. Plus, we can already get the MST manager from
&mstc->mstm->mgr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e6f72ca0b1fa..66c40b56a0cb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -893,7 +893,8 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	int ret = 0;
 
-	mstc->edid = drm_dp_mst_get_edid(&mstc->connector, mstc->port->mgr, mstc->port);
+	mstc->edid = drm_dp_mst_get_edid(&mstc->connector,
+					 &mstc->mstm->mgr, mstc->port);
 	drm_connector_update_edid_property(&mstc->connector, mstc->edid);
 	if (mstc->edid)
 		ret = drm_add_edid_modes(&mstc->connector, mstc->edid);
-- 
2.19.1
