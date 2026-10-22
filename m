Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F0606A31B
	for <nouveau@archiver.kernel.org>; Thu, 22 Oct 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEPZQ6XF
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 065BE1125D7;
	Thu, 22 Oct 2026 12:37:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6239E4711E;
	Thu, 22 Oct 2026 12:18:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792671501;
 b=GnTEUQUC9QB+x6300SOkCdwlfPJUHw8vcYdlZqxwrve/2hGFQ19nwPqtQ3UuCeUXOIhat
 y81X4Sqich/FxY2Pp1HVTWnQugu5dnpII+7MFu2uIq5/cZZyPlY1UzbsykCrZ+FJpMbBX5D
 rP8rygrLjMUiZH7EN19J5TKwQjxxpQZ6JUPrIKxJ8EmuRNJADb4mW9oVe3fdbKrlevNLcYd
 StTrv7OqpYziaWsNnr5w86YNeKIH/oAZLxfk+TNm/rr3EZSvtd+pePl741DgocqwjaDTqX7
 OLgWpIm4xMJQKHUxS8AZQCV4ljWtnguBFmjnILgoKmopl312o//8LtQknMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792671501; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uPlzCIvkfSnkgir25yuwWSuLLhTVuWIZJtmc6Zjf57A=;
 b=iSVHv2WeziRRVnnm4u7DZdk45dYM5fJKF4yUl9TFRdbBWcCei7i2mkE2W86al21P42ZrR
 0qscr/IZAjwHAmRf4QzzIw3Jf9SvpuNFKJI31lS/3c0GL/3/Gbwm3Bg7+t/SHRaH4EIQdKg
 FCsSYgiZScHIxgSAMeFwRLdYPS7O/DeTr7X2PEf7FQdJqnH03aPLWVXgy55J0zY1W6ODMgk
 fwnzBXSfp6UdxLsbGx8O9GwNT7sbrp5TevTpiIkYLFhcPKWSTF7xEuDkc1BCzWpeN9bUQsz
 Xfi83J06UW4lhf54YoRNcNJ5w5CgFNzAOjr1CEHWaw6N7kgSQf1TBjE9wnGQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9B66A4092B
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 12:18:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9A41125C9;
	Thu, 22 Oct 2026 12:37:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E94C943C49;
	Thu, 22 Oct 2026 12:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571A71F000C3;
	Thu, 22 Oct 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672627;
	bh=uPlzCIvkfSnkgir25yuwWSuLLhTVuWIZJtmc6Zjf57A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZEPZQ6XFqamphCutdacgmQgGi5lWHZUyGhjd4lGJHbS9V/2K1MFj8RKw3LyHcHu+E
	 z5UvC3QNoJgwU05arB5Pino8M3feiqcS+VX03dKc1++bwg0UAqBdrhlme06hawWEXL
	 gjM/Pi4RjZZhc+3K19hhul5qGDYh71dM9IAPI9yEEO20Qx0gajeQtgJkx41WqiOuiD
	 PfsmGdQ6xgkFUKvZdgHzPQZzXYeAizBHh7Lvj9S3deydFmF47SI7/vpCViOzwidDXs
	 UkplfDffOTfDU6uxArKYqvhzUYlVuBjxiD8D/srHUPYAVaEOv80erKRlFFAzrmq2G5
	 pBCMg4f1MvfjQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:55 +0200
Subject: [PATCH v2 56/59] drm/nouveau: Convert to atomic_create_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261022-drm-no-more-connector-reset-v2-56-0b7e4e85b1e8@kernel.org>
References: 
 <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: 
 <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5772; i=mripard@kernel.org;
 h=from:subject:message-id; bh=WN37xsB1e7g9V/eB9Zk0Nf7/0/Doqi+6O4h11c9dMvU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mJY1MM5ZvHlB+lmvTc9XzN1Sqjpdw6z5mJL5DJGXU
 xYf6Lvt3jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcl2EseHfojDXvS+nTF0S
 smXdtz3lmx1Wxf3yb7DfLy+l/DHswpN1a45fYniYul03cOEkqbApLUqM9ZmHOO/KXatXCi+3P9r
 em2IrebnEqMTB+0nWh5l778z41VkrzuL5M2N+8ONv3hHq8457AgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: K7H5H4JXN4CZSQANCZW2ZQB5EATXJ3YK
X-Message-ID-Hash: K7H5H4JXN4CZSQANCZW2ZQB5EATXJ3YK
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K7H5H4JXN4CZSQANCZW2ZQB5EATXJ3YK/>
Archived-At: 
 <https://lore.freedesktop.org/20261022-drm-no-more-connector-reset-v2-56-0b7e4e85b1e8@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The nouveau connector reset implementation creates a custom state
subclass, but only initializes a pristine state and sets
driver-specific defaults without resetting any hardware. This is
equivalent to what atomic_create_state expects. Convert to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 11 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.c | 27 ++++++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  3 ++-
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e91130f93db6..947d0ff4ba02 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1249,7 +1249,7 @@ nv50_mstc_destroy(struct drm_connector *connector)
 static const struct drm_connector_funcs
 nv50_mstc = {
-	.reset = nouveau_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = nv50_mstc_destroy,
+	.atomic_create_state = nouveau_conn_atomic_create_state,
 	.atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
 	.atomic_destroy_state = nouveau_conn_atomic_destroy_state,
@@ -1263,4 +1263,5 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
 {
 	struct drm_device *dev = mstm->outp->base.base.dev;
+	struct drm_connector_state *conn_state;
 	struct drm_crtc *crtc;
 	struct nv50_mstc *mstc;
@@ -1282,5 +1283,11 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
 	drm_connector_helper_add(&mstc->connector, &nv50_mstc_help);
 
-	mstc->connector.funcs->reset(&mstc->connector);
+	conn_state = mstc->connector.funcs->atomic_create_state(&mstc->connector);
+	if (IS_ERR(conn_state)) {
+		drm_connector_cleanup(&mstc->connector);
+		return PTR_ERR(conn_state);
+	}
+	mstc->connector.state = conn_state;
+
 	nouveau_conn_attach_properties(&mstc->connector);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index cc3caf8de64b..e4ab9849de4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -243,6 +243,6 @@ nouveau_conn_atomic_duplicate_state(struct drm_connector *connector)
 }
 
-void
-nouveau_conn_reset(struct drm_connector *connector)
+struct drm_connector_state *
+nouveau_conn_atomic_create_state(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
@@ -251,11 +251,7 @@ nouveau_conn_reset(struct drm_connector *connector)
 	if (drm_drv_uses_atomic_modeset(connector->dev)) {
 		if (WARN_ON(!(asyc = kzalloc_obj(*asyc))))
-			return;
+			return ERR_PTR(-ENOMEM);
 
-		if (connector->state)
-			nouveau_conn_atomic_destroy_state(connector,
-							  connector->state);
-
-		__drm_atomic_helper_connector_reset(connector, &asyc->state);
+		__drm_atomic_helper_connector_state_init(&asyc->state, connector);
 	} else {
 		asyc = &nv_connector->properties_state;
@@ -279,4 +275,6 @@ nouveau_conn_reset(struct drm_connector *connector)
 		}
 	}
+
+	return &asyc->state;
 }
 
@@ -1231,5 +1229,4 @@ static const struct drm_connector_funcs
 nouveau_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
-	.reset = nouveau_conn_reset,
 	.detect = nouveau_connector_detect,
 	.force = nouveau_connector_force,
@@ -1237,4 +1234,5 @@ nouveau_connector_funcs = {
 	.set_property = nouveau_connector_set_property,
 	.destroy = nouveau_connector_destroy,
+	.atomic_create_state = nouveau_conn_atomic_create_state,
 	.atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
 	.atomic_destroy_state = nouveau_conn_atomic_destroy_state,
@@ -1248,5 +1246,4 @@ static const struct drm_connector_funcs
 nouveau_connector_funcs_lvds = {
 	.dpms = drm_helper_connector_dpms,
-	.reset = nouveau_conn_reset,
 	.detect = nouveau_connector_detect_lvds,
 	.force = nouveau_connector_force,
@@ -1254,4 +1251,5 @@ nouveau_connector_funcs_lvds = {
 	.set_property = nouveau_connector_set_property,
 	.destroy = nouveau_connector_destroy,
+	.atomic_create_state = nouveau_conn_atomic_create_state,
 	.atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
 	.atomic_destroy_state = nouveau_conn_atomic_destroy_state,
@@ -1362,4 +1360,5 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
+	struct drm_connector_state *conn_state;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
@@ -1522,5 +1521,11 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	}
 
-	connector->funcs->reset(connector);
+	conn_state = connector->funcs->atomic_create_state(connector);
+	if (IS_ERR(conn_state)) {
+		ret = PTR_ERR(conn_state);
+		goto drm_conn_err;
+	}
+	connector->state = conn_state;
+
 	nouveau_conn_attach_properties(connector);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index eb292d2ba4bc..02f843648eb8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -217,5 +217,6 @@ extern int nouveau_hdmimhz;
 
 void nouveau_conn_attach_properties(struct drm_connector *);
-void nouveau_conn_reset(struct drm_connector *);
+struct drm_connector_state *
+nouveau_conn_atomic_create_state(struct drm_connector *);
 struct drm_connector_state *
 nouveau_conn_atomic_duplicate_state(struct drm_connector *);

-- 
2.55.0

