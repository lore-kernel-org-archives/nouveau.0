Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A9BC44515
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 21:52:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0060A10E206;
	Mon, 20 Jul 2026 21:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RJ1DiCEd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF59A4726E;
	Mon, 20 Jul 2026 21:36:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784583399;
 b=bn0iYheGC9Pz0kBHjLoDcElMjyIXrs8Iid01jUXpdAykKbAnBoQicJ44oWqIyO5MFJKpr
 eQ3jeWZUq8bb1XDQvdoknktD3lD8tO+lx0AT37oV16La0nZ5sHG6kMlI6N1WK5kefYOCWLF
 ZgN4yMz7uvaqOzg2HGqrRj0mOLiCSsBYZCjVQu8Q3KqkshDSWw/dG01PcNq7vV9ampyMMk3
 lBGYgMfsoNQuokHzJ2gHRTFBirZM71uqgBeYAAsqJyfunkGlGpmOPiobSQ7SDeDfZ5dS8z6
 8siWkr0pMFlXlDX0rfBaOzOp87YEll7UBNOv7uO0zduXV8BJD3XMYrYAMxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784583399; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BAzHEt/JUKcSSo+NrPYMNWpznNd/HnyKFTRe4NDoHyE=;
 b=ADSGsmNv8A/AjKnRihz+FQ2LtxBLBn5GAaQ3RmKjsjRlRqiTH4+XybCr0llD3oGiaerBb
 RCoKpKVWIhEl5MYsjsnwj4UZHskuZ8CFu3MaEqRP+xCSPlHNb5GbpOgQMQ7elUqBrygxlMr
 REojHQm4uHvw5IBfzNDuqU4IuF9m1zWUnTS38Red2bZvF9RUaZo3DE4mL/gqC3I043djHfM
 SbpwOH/SHuH7ypty7CTJe6zJYHvo6BKER1TjgGq6v6BK4kDARZSka7q31IfOa0PBJl+BECY
 7aL1Cwp3xQar3GCIsFMdc8gsnx1NaEBuoHvpd5jUK1Jl4Xp1H1Ohu02D9dkw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 739D247266
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:36:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1510E1EB
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784584323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAzHEt/JUKcSSo+NrPYMNWpznNd/HnyKFTRe4NDoHyE=;
	b=RJ1DiCEdv9W+TCyCx7HHNSy2rXR25DlQVkwPQdYZbUBXZNmeFORFGFGvBG1mUUL/QP8D5B
	DmFaS7lGiLcUD2q86z7xueCBfdizpc+5JvKf730JpU/b+Ht6+m1ItkVMyka7W3LxppJ5gA
	I+2kDESQvbVqGazdPPwZWhpFKQRw/Bo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-PGvBqEc6OX6dfgpXMwxmiQ-1; Mon,
 20 Jul 2026 17:52:00 -0400
X-MC-Unique: PGvBqEc6OX6dfgpXMwxmiQ-1
X-Mimecast-MFC-AGG-ID: PGvBqEc6OX6dfgpXMwxmiQ_1784584318
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DCF89195E924;
	Mon, 20 Jul 2026 21:51:57 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6BEC51800764;
	Mon, 20 Jul 2026 21:51:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm/nouveau/kms/nv50-: Add .blend_modes to
 nv50_wndw_func
Date: Mon, 20 Jul 2026 17:36:16 -0400
Message-ID: <20260720215058.398210-2-lyude@redhat.com>
In-Reply-To: <20260720215058.398210-1-lyude@redhat.com>
References: <20260720215058.398210-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: aghqrjTpcLHgRzP3TPgbgO1EDXAVo5wvux59QH_aExM_1784584318
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BUNXAA4OGZURICG4LJCZ5G5UD5OVRMPI
X-Message-ID-Hash: BUNXAA4OGZURICG4LJCZ5G5UD5OVRMPI
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BUNXAA4OGZURICG4LJCZ5G5UD5OVRMPI/>
Archived-At: 
 <https://lore.freedesktop.org/20260720215058.398210-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

At the moment, we currently (incorrectly) only expose a blend property on
the plane if we have a nv50_wndw_func->blend_set function for the given
wndw type. But we need to expose a blend property for all types of planes
that can display color formats with an alpha channel.

Prepare for doing this by introducing a way of looking up the supported
blend modes for a type of wndw by introducing .blend_modes, which describes
all possible blending modes nouveau currently supports for a type of wndw.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")

---
V3:
* Don't forget to specify .blend_modes for base.

 drivers/gpu/drm/nouveau/dispnv50/base.h     |  6 ++++++
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/base827c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/base907c.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  3 +++
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     | 10 ++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |  1 +
 10 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base.h b/drivers/gpu/drm/nouveau/dispnv50/base.h
index 085bd3aeb40b6..fbfd62d8fc798 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/base.h
@@ -1,5 +1,7 @@
 #ifndef __NV50_KMS_BASE_H__
 #define __NV50_KMS_BASE_H__
+#include <drm/drm_blend.h>
+
 #include "wndw.h"
 
 int base507c_new(struct nouveau_drm *, int, s32, struct nv50_wndw **);
@@ -24,4 +26,8 @@ extern const struct nv50_wndw_func base907c;
 int base917c_new(struct nouveau_drm *, int, s32, struct nv50_wndw **);
 
 int nv50_base_new(struct nouveau_drm *, int head, struct nv50_wndw **);
+
+/* The only blend mode supported by base channels */
+#define BASE_BLEND_MODES BIT(DRM_MODE_BLEND_PIXEL_NONE)
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index a431f6c5f6fa9..41b648ab3c5e5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -297,6 +297,7 @@ base507c = {
 	.image_set = base507c_image_set,
 	.image_clr = base507c_image_clr,
 	.update = base507c_update,
+	.blend_modes = BASE_BLEND_MODES,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base827c.c b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
index 4545cc5f3a14b..6c290324b4f3e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base827c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
@@ -93,6 +93,7 @@ base827c = {
 	.image_set = base827c_image_set,
 	.image_clr = base507c_image_clr,
 	.update = base507c_update,
+	.blend_modes = BASE_BLEND_MODES,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base907c.c b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
index 4a2d5a259e15b..a94d8350224b6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base907c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
@@ -205,6 +205,7 @@ base907c = {
 	.image_set = base907c_image_set,
 	.image_clr = base507c_image_clr,
 	.update = base507c_update,
+	.blend_modes = BASE_BLEND_MODES,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 1a889139cb053..5f2ff40388e7f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -29,6 +29,7 @@
 #include <nvhw/class/cl507a.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 
 bool
@@ -164,6 +165,8 @@ curs507a_wndw = {
 	.acquire = curs507a_acquire,
 	.release = curs507a_release,
 	.prepare = curs507a_prepare,
+	// TODO: Cursors also support premulti, but we haven't hooked it up anywhere yet.
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 90d100514bef2..81af5c3369d4c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -1,6 +1,8 @@
 #ifndef __NV50_KMS_WNDW_H__
 #define __NV50_KMS_WNDW_H__
 #define nv50_wndw(p) container_of((p), struct nv50_wndw, plane)
+#include <drm/drm_blend.h>
+
 #include "disp.h"
 #include "atom.h"
 #include "lut.h"
@@ -74,6 +76,7 @@ struct nv50_wndw_func {
 	int (*image_clr)(struct nv50_wndw *);
 	int (*scale_set)(struct nv50_wndw *, struct nv50_wndw_atom *);
 	int (*blend_set)(struct nv50_wndw *, struct nv50_wndw_atom *);
+	unsigned int blend_modes;
 
 	int (*update)(struct nv50_wndw *, u32 *interlock);
 };
@@ -139,4 +142,11 @@ int wndwca7e_new(struct nouveau_drm *, enum drm_plane_type, int, s32,
 
 int nv50_wndw_new(struct nouveau_drm *, enum drm_plane_type, int index,
 		  struct nv50_wndw **);
+
+/* A set of blend modes supported by all wndws */
+#define WNDW_BLEND_MODES               \
+	  BIT(DRM_MODE_BLEND_COVERAGE) \
+	| BIT(DRM_MODE_BLEND_PREMULTI) \
+	| BIT(DRM_MODE_BLEND_PIXEL_NONE)
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 554c4f91f8bec..7ab4d532118ee 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -343,6 +343,7 @@ wndwc37e = {
 	.image_set = wndwc37e_image_set,
 	.image_clr = wndwc37e_image_clr,
 	.blend_set = wndwc37e_blend_set,
+	.blend_modes = WNDW_BLEND_MODES,
 	.update = wndwc37e_update,
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
index d1ca51aae58cd..e220f43b5bca7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
@@ -231,6 +231,7 @@ wndwc57e = {
 	.image_set = wndwc57e_image_set,
 	.image_clr = wndwc37e_image_clr,
 	.blend_set = wndwc37e_blend_set,
+	.blend_modes = WNDW_BLEND_MODES,
 	.update = wndwc37e_update,
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
index 52af293c98f4a..580cf7abd8193 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
@@ -95,6 +95,7 @@ wndwc67e = {
 	.image_set = wndwc67e_image_set,
 	.image_clr = wndwc37e_image_clr,
 	.blend_set = wndwc37e_blend_set,
+	.blend_modes = WNDW_BLEND_MODES,
 	.update = wndwc37e_update,
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
index 2cec8cfbd5461..d65ec438b434f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
@@ -231,6 +231,7 @@ wndwca7e = {
 	.image_set = wndwca7e_image_set,
 	.image_clr = wndwca7e_image_clr,
 	.blend_set = wndwc37e_blend_set,
+	.blend_modes = WNDW_BLEND_MODES,
 	.update = wndwc37e_update,
 };
 
-- 
2.55.0

