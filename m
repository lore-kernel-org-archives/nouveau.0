Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D709C44520
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 20:56:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9AF110E1DB;
	Mon, 20 Jul 2026 20:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PrOuB2LZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BE6424725E;
	Mon, 20 Jul 2026 20:40:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784580043;
 b=JfL9P1tLCdlx/ZXNQND/c7CZj0PtZd3bKbKgs9YlFk5cbSt5NdXaDkJlY4m376lShQQJI
 huiso8nflo120ZJLLzGRgMtkPzsfbV3vm1fXv5mv5CRJ+iltYmxOm7JBSePKepJGJcO/X5t
 6whWO7pNC95ACaqrhDMy2jB9PcOVRnA7VLn66KNwC0TAymLzspiS7oTIOHKwg0T1T+u4nV+
 coAqM9ysV7eXDKMUpvuyE1KkX5x1DgwTU/DBQueqKFwBGZHvnL/E27EDsgRE+mBiv1wGrQQ
 7qFIQ9Y7oeKeEhCi84WRTnAKO34sgHb94gwyPtfLQ9tMXpj/p//xPJOnWQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784580043; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S3UfYK2QvWZWqyC1uU0Q9121WlGcYTxuFnwRsrmF06s=;
 b=vibcSb+XrHzm68icI/YiDdDMIwHKPKhQOM1aPFcfDDayQwcAPgnoilhRzJQSrgtpOrnok
 1agpeO0+qw7sdU3luEfQxv75uys40RL1ygGPFG1TVIAjmkC8I0d61MqpPE3lZNCmVcunPIr
 23xi8XKuFT5X5+Ln8AfUXKTkKkepVq0aa3B+O/Tek8B1NHXne09Iyp02sFXzOucW6z2hu/Q
 dXgWWK6xt8lJYe959YDsBw3BDvfD/hVRdTFA+DCY2b2Hib1gPawa0WPOMto/IMr3tLve82a
 xuxgyGdqcNWLozpWoH2Yajcld1nH/say2JDC66tmIkTFwWYYNI8d1Li69t6w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8238B466F6
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:40:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBA810E1B0
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784580966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3UfYK2QvWZWqyC1uU0Q9121WlGcYTxuFnwRsrmF06s=;
	b=PrOuB2LZ5avhcjlqb95H+IInrmmEa3Mxv99jlTyQhWNItbxhDaFP6/ks1j/ivy0OwRN/Dn
	Z66UjnSJdtnCxh1/IPxa2l9gCVoL0iUsbGHW/oLl4ylVYfLzNWHCn/INvZeMtDF8eaWNuk
	HKQ7oL52M+nznVtNDt3VKZ+LgPUWUGQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-9Uhy5fAPMrSsZpoBOrCx0g-1; Mon,
 20 Jul 2026 16:55:59 -0400
X-MC-Unique: 9Uhy5fAPMrSsZpoBOrCx0g-1
X-Mimecast-MFC-AGG-ID: 9Uhy5fAPMrSsZpoBOrCx0g_1784580957
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED047195E908;
	Mon, 20 Jul 2026 20:55:56 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4614B1955F78;
	Mon, 20 Jul 2026 20:55:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm/nouveau/kms/nv50-: Add .blend_modes to
 nv50_wndw_func
Date: Mon, 20 Jul 2026 16:43:55 -0400
Message-ID: <20260720205541.257781-2-lyude@redhat.com>
In-Reply-To: <20260720205541.257781-1-lyude@redhat.com>
References: <20260720205541.257781-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: allaH5WmKdvaZtP9kqx2Gtwe6tGHUlYKV90Rpmx0L40_1784580957
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BIRZGL7PNBZC2GN2SDHC3PSQ7H37CGFV
X-Message-ID-Hash: BIRZGL7PNBZC2GN2SDHC3PSQ7H37CGFV
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BIRZGL7PNBZC2GN2SDHC3PSQ7H37CGFV/>
Archived-At: 
 <https://lore.freedesktop.org/20260720205541.257781-2-lyude@redhat.com/>
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
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  3 +++
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     | 10 ++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |  1 +
 6 files changed, 17 insertions(+)

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

