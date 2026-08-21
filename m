Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5170DC5DF96
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 14:41:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3410F2F7;
	Fri, 21 Aug 2026 14:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S0Rp2KFQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0640547A95;
	Fri, 21 Aug 2026 14:25:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787322305;
 b=tCULL46vewAIlE5xBwdSUvyiEr2UwX2ti1M3WjHQXD/af8e9mPuuIdIrjflxopf00ff4X
 UFtCvHRlplrqNui0/+1PNCKI8eNobKqbfPpN8MxGTL8nr0OudcRd5Tw6iSj1AxSVWpEMtFg
 FBk6t4UcKkFYX5HZTvEgPusAmTztlkZ3l23xihL3S+Mmaophdl6TmHAQBfd9Pm3z7L1ywtz
 cmx7sv0WbCQ/LqV+mHsPk3Mz2Ua1UeHnx6Zp5mBUc7iWsS8yWgW3ysy2es4aFz7iPc7al5G
 5xVrv1m6LdRzqZqMUotJQMonylwovkjeBbCQvGi40ewz8xPXqqxEBA6qiM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787322305; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sILiU5hnk0bK7FJMVer/A2NdMTsPP5tMrf5d+SITn88=;
 b=JFElSmn27hzVH3QCJ7q6MnUbk2qUKgaCDCxZfiVRguvvQNX6dBgmlhH76uCkEJF2SPwQK
 +0++CSY41K2Vp6OhWFcnvvXgUrExLyANYrE+m00RriZETU6811+jHxsjbVrcGcL5fBpewi3
 N2jZbQVrBObbCZ6JZbRQ4hVX1ZgjLZVbu5PEMhzuPHWY2+y2BiZrp27Iv0L76p2ArkRtaFX
 7fH6Otywcc9168laMGPqNQqWvitVfIno/IW7wOtSiCAm14gqMffIJumZ8S9GHoDxdTubk+K
 nG4CrpftDPpENVvJhQCPUxNQrq+yR0fn3z9SfIE4Ozqltn2HrBtGDHNEBEQw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 02BC4474BB
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 14:25:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15EA310F2EC;
	Fri, 21 Aug 2026 14:41:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D720140312;
	Fri, 21 Aug 2026 14:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9DC1F00A3A;
	Fri, 21 Aug 2026 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323299;
	bh=sILiU5hnk0bK7FJMVer/A2NdMTsPP5tMrf5d+SITn88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S0Rp2KFQfr3s8UOm+hXsr9mDfrYyuhTo583wlBZsizqYr2gfVxRmmyUDgu+tkcp+1
	 E40SQaaP2/dii/gIGy1qNMR8zafoz0Bl8lR4XIiX5bEM3VWiG9PM2Ob4G31AxkwZeC
	 cJCA/RobBJeCpXbTBUnFZ6XaWFVjwR5ojAbRDvKOzTMuKiio/WI6C+/iEd33bedxIx
	 IQaSWE7Xy8GKpnp8/iqujJJvH7h8zk+wNnd79nWEaoI/Ut+siCivMOIjTFuHzdmWij
	 Py9JQaAQhrr8G0BRnNL9HludcoABkNYDofKp6I94JAffIJ6uUcKSGDpivqkHHNd0gt
	 cVnPyyM9SVJJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:33 +0200
Subject: [PATCH 57/70] drm/nouveau: Convert to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-57-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VfBq/nJGwnD++v64DCYnhI73vjHwhPomJYcPvum9yCA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyYJ3bKy5fmh9YhU2z0z1D2xm3ll9yFW81yGr5uTJm
 dyJGrM6prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwEQaDjHWpwY+fZijktudd+mp
 jAZfpGug+dGs3Fex6jJH2XqkN+jseuHEcH/n07ytLia/kuweHqhhrK9ZLBk8/+CsttMbz25Zv2L
 y2QkFnXdaVj6e8ttuzrXs75Of7H6r8bb2o+C0L7scZkQtKdsAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: O5VDNQAVE27BD3NUWGDFWS64XWF5DGRF
X-Message-ID-Hash: O5VDNQAVE27BD3NUWGDFWS64XWF5DGRF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O5VDNQAVE27BD3NUWGDFWS64XWF5DGRF/>
Archived-At: 
 <https://lore.freedesktop.org/20260821-drm-no-more-crtc-reset-v1-57-fb793475c05a@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The nouveau nv50 head implementation provides a custom reset hook.
However, this hook only allocates the state, initializes it with
__drm_atomic_helper_crtc_reset(), and frees the previous state. It
does not perform any hardware reset.

Since this is exactly what the atomic_create_state hook is meant to
do, minus the old state cleanup which the caller handles, convert the
implementation to use atomic_create_state with
__drm_atomic_helper_crtc_state_init() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 1affa0378bd0..6a3a93de0cbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -489,22 +489,20 @@ nv50_head_atomic_duplicate_state(struct drm_crtc *crtc)
 	asyh->clr.mask = 0;
 	asyh->set.mask = 0;
 	return &asyh->state;
 }
 
-static void
-nv50_head_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *nv50_head_create_state(struct drm_crtc *crtc)
 {
 	struct nv50_head_atom *asyh;
 
 	if (WARN_ON(!(asyh = kzalloc_obj(*asyh))))
-		return;
+		return ERR_PTR(-ENOMEM);
 
-	if (crtc->state)
-		nv50_head_atomic_destroy_state(crtc, crtc->state);
+	__drm_atomic_helper_crtc_state_init(&asyh->state, crtc);
 
-	__drm_atomic_helper_crtc_reset(crtc, &asyh->state);
+	return &asyh->state;
 }
 
 static int
 nv50_head_late_register(struct drm_crtc *crtc)
 {
@@ -523,11 +521,11 @@ nv50_head_destroy(struct drm_crtc *crtc)
 	kfree(head);
 }
 
 static const struct drm_crtc_funcs
 nv50_head_func = {
-	.reset = nv50_head_reset,
+	.atomic_create_state = nv50_head_create_state,
 	.destroy = nv50_head_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = nv50_head_atomic_duplicate_state,
 	.atomic_destroy_state = nv50_head_atomic_destroy_state,
@@ -537,11 +535,11 @@ nv50_head_func = {
 	.late_register = nv50_head_late_register,
 };
 
 static const struct drm_crtc_funcs
 nvd9_head_func = {
-	.reset = nv50_head_reset,
+	.atomic_create_state = nv50_head_create_state,
 	.destroy = nv50_head_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = nv50_head_atomic_duplicate_state,
 	.atomic_destroy_state = nv50_head_atomic_destroy_state,

-- 
2.55.0

