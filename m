Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A47606A31E
	for <nouveau@archiver.kernel.org>; Thu, 26 Nov 2026 22:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=V7JnUiaT
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 64349112768;
	Thu, 26 Nov 2026 22:03:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C8FE40438;
	Thu, 26 Nov 2026 22:03:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795730630;
 b=LrNIcfozhtKaYIa3RvYnZh1JztKFLn5/WoTIVp2es65yJjSM3dUA55UtxDRhc62x+0fC/
 5JgYirVgMK0wkwi8mh45F+wnEp6B1fNdF74PtyGKbNgjWmmOKx1Z5WlubwAFhrlwAxELSCX
 MCs6UMJd5pzEaqyGcfCwMzq1fzRMDTnKPnPb0y54KUeHTU968Rw6yIt05ThIViuRH/FEH2L
 ODVmses+9fk6nuGLqrIv2WRePaYR5eWpUl1aDS4h6XsD93qTte3zqutX+K3ujLE6cNSXT1u
 ymA+yQWN5l2LgLLkkDnpJKd85TFwBN2OxuNpDm74/gYHWFm3xr9jdtQbfiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795730630; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QG7x41CbbyirdC2OMK80hsT9es9iEMG3U7KuCt7Ho90=;
 b=Cw05JF6/kX3qjILhnfysPVw34FvOuZsr0auBi9NpfsOsKdv12DkGnlxnhlI6EYLBDUtYv
 5uSh77yaFisMLCcHJnLmThtnpyztoTVP3mYn0WPdq1DtY0qXC3jJjOo9nm/eDHdKe48FrYJ
 IL9TUSrDshdqxQ9dTMlU8CXxRPuwzGhEc2sq4JGgpQvMHJjuPQ+RsWQHgBSyHQBEFvnrXAD
 QT1Nrr+EBrlL0Olvlb9WnxeqByuvEj3MjxYedC4kjP0zbA4jWPyWIxdyEYWFkKSr3XT4y+g
 QLh4FdnnihZg1fK9X67wMluyIViLs8WJEpdUV2Jtwdy24onvmcvRYq1DjXlw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ideco.ru;
 arc=none;
 dmarc=pass header.from=ideco.ru policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ideco.ru;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ideco.ru policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C0D9D40348
	for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2026 08:33:53 +0000 (UTC)
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Thu, 26 Nov 2026 08:33:48 UTC
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD3F11214E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2026 08:33:48 +0000 (UTC)
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id B5E7F2032496;
	Thu, 26 Nov 2026 13:24:39 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id A1D962037210;
	Thu, 26 Nov 2026 13:16:30 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru A1D962037210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795680992; bh=QG7x41CbbyirdC2OMK80hsT9es9iEMG3U7KuCt7Ho90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V7JnUiaTcCnW0T0aalfoWlJmCqKJwfmbGX3RAYzGYQdAsTsGfwAZT0IlUJxFBGFrJ
	 +oA2TYrTjstAk3dEKLVLB+GXyQxfDpLUOd9suIiYebxtrYky6PeXOTfdUHde6VtLvh
	 xCbngRqgFlwlcKairHTDlIBiPfg2Myya7EDVD09sqWznPjUMxV2ydOsv0REoEyI2C5
	 BnigBTjCsQYS1CuWC5noLjgLNZy41XrS+9tEK8cG9arkxgeCULfgrNZj/4P6NPLE4I
	 EmmXom0Z4n9/dIkjAD4qCsGfJpGaktom30a7eZz42OpEo9lnw+VOJ1NEQW2vlxEIJ0
	 KY/ex3NmAYbaA==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/5] drm/connector: Handle DVI-I property allocation failures
Date: Thu, 26 Nov 2026 12:15:57 +0400
Message-ID: <20261126081602.2901498-3-a.kazinsky@ideco.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126081602.2901498-1-a.kazinsky@ideco.ru>
References: <20261126081602.2901498-1-a.kazinsky@ideco.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a.kazinsky@ideco.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: S5CB5HS2TIPTMP7R6EHVVX4GJCFA5F4V
X-Message-ID-Hash: S5CB5HS2TIPTMP7R6EHVVX4GJCFA5F4V
X-Mailman-Approved-At: Thu, 26 Nov 2026 22:03:47 +0000
CC: Alex Kazinsky <a.kazinsky@ideco.ru>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Eric Anholt <eric@anholt.net>, Jesse Barnes <jbarnes@virtuousgeek.org>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S5CB5HS2TIPTMP7R6EHVVX4GJCFA5F4V/>
Archived-At: 
 <https://lore.freedesktop.org/20261126081602.2901498-3-a.kazinsky@ideco.ru/>
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_mode_create_dvi_i_properties() returns success even if either
drm_property_create_enum() call fails. Nouveau then continues display
initialization and may pass a NULL property to
drm_object_attach_property(), causing a NULL pointer dereference.

Return -ENOMEM on allocation failure and destroy the selector property
if creating the subconnector property fails. Publish the property pointers
only after both allocations succeed.

Handle the error in Nouveau by cleaning up the mode configuration and
freeing the display structure before returning.

Fixes: f453ba046074 ("DRM: add mode setting support")
Cc: stable@vger.kernel.org
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
 drivers/gpu/drm/drm_connector.c           | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_display.c |  8 +++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 41cbd76e0b1c..51e616f5aa5e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2061,7 +2061,8 @@ int drm_connector_create_standard_properties(struct drm_device *dev)
  *
  * Called by a driver the first time a DVI-I connector is made.
  *
- * Returns: %0
+ * Returns:
+ * Zero on success, negative errno on failure.
  */
 int drm_mode_create_dvi_i_properties(struct drm_device *dev)
 {
@@ -2076,12 +2077,19 @@ int drm_mode_create_dvi_i_properties(struct drm_device *dev)
 				    "select subconnector",
 				    drm_dvi_i_select_enum_list,
 				    ARRAY_SIZE(drm_dvi_i_select_enum_list));
-	dev->mode_config.dvi_i_select_subconnector_property = dvi_i_selector;
+	if (!dvi_i_selector)
+		return -ENOMEM;
 
 	dvi_i_subconnector = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
 				    "subconnector",
 				    drm_dvi_i_subconnector_enum_list,
 				    ARRAY_SIZE(drm_dvi_i_subconnector_enum_list));
+	if (!dvi_i_subconnector) {
+		drm_property_destroy(dev, dvi_i_selector);
+		return -ENOMEM;
+	}
+
+	dev->mode_config.dvi_i_select_subconnector_property = dvi_i_selector;
 	dev->mode_config.dvi_i_subconnector_property = dvi_i_subconnector;
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 07882624a7f6..04e9a512eaec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -657,7 +657,13 @@ nouveau_display_create(struct drm_device *dev)
 
 	drm_mode_config_init(dev);
 	drm_mode_create_scaling_mode_property(dev);
-	drm_mode_create_dvi_i_properties(dev);
+	ret = drm_mode_create_dvi_i_properties(dev);
+	if (ret) {
+		drm_mode_config_cleanup(dev);
+		drm->display = NULL;
+		kfree(disp);
+		return ret;
+	}
 
 	/* this only gets set if the driver has the ATOMIC flag */
 	if (drm_drv_uses_atomic_modeset(dev))
-- 
2.56.0


