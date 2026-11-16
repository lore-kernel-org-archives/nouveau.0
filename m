Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E0606A329
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoGwZ0jT
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7362610EEE0;
	Mon, 16 Nov 2026 10:32:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E73654945F;
	Mon, 16 Nov 2026 10:12:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794823942;
 b=jqLNatZCBiGzub8/v65x+pXsmeCQ8dVFR00xuE2/SOqkH9mjN1CaKKv2a/cNJe4yvIfU0
 5kQVirDE/qxBiKqKofA8bGbizR4nkQncbDLhIHVGAgHU50zRBMHOZYrXuVbfEBwxdx3kicl
 ccC8kBQKnp3pOvnrcQlGKviYewroT5qCpdbJSnC2DNRByQbfx8GKJZKijjqBu1a8idAaiWc
 z8rsUSrlOray29Q6Q5pP1A5xQ+9RSsSFsk6deTvzDU1IzYT2VckZIYqcXoIDlkE5ybn8eL/
 NtRQWS6pksnnEoElLEyM6qpVvp4YHW0nQxigNcV7opFOYmxbCm1vQQgsZRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794823942; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CrxUZSqQwu5xXzU4Jjfy7fm+RdDMryq8e4LL4gnJgFY=;
 b=Aogkn6grKpjrAYsKaERqa3ZvBprQ8YXyzWmPkLSnJRlPCLOMHpwNY2vlLe2K1tR/5uNqq
 FAlOAufefF1Eik+53FdQzZD+inAX5/Pg+1zKmstdNv6rLA0JOEmKdhcfPw6OnqrAiEAQqq8
 KsPQpchsnuTM1d3cjtXyK1CoBNPCLdcNGCRGFNe5I83Cb5bjxrnEgujxku9a2oUgo37Ug4y
 T1ERLV/vFIb3yEdxnF+dGrjmvrz9q0AxWa56Lxv2uvYwiBiA9uml0c3nztlWJ8qT0aN1jQE
 eNT12QIuiorZKBJe/JatwAiwKTmOZNCGZeFq0DomVwkjn/EvEwTDLJXFqGVQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DA43749418
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 10:12:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C82710ED7C;
	Mon, 16 Nov 2026 10:32:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 259AE42470;
	Mon, 16 Nov 2026 10:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE771F000CD;
	Mon, 16 Nov 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825125;
	bh=CrxUZSqQwu5xXzU4Jjfy7fm+RdDMryq8e4LL4gnJgFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QoGwZ0jTvWGo4pTu6KDSlSHplMqG3W4ijDAbKx9xPR9i1K0y2F0LOmhi8b2C71pGv
	 irDq4C4hWMeNn1Gx0d3GqGPj9pEZopSoG8VjJTjKZVB300nbpFONS6KhLPFfecy/UY
	 CeIr/IbapKIruAIeim1i4Gu09vSlxXcni2V/2xHoAga6OXghc8UIjNztfJQ+eWcx0W
	 Z0q8ek0lX3CFqCF8BBdbHAaQbfS2Da8zt8nLnvw4L7uWWK26MiwL05Ysb30cq84Rc0
	 4PbLyYT+g/OHRaO8CC7KNyNrxuX8nGs2i49K4YOpzZtU/LGZnRHE2LSFXpEGU4gYAI
	 Jyn+nXzQV2R8w==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:37 +0100
Subject: [PATCH v2 21/64] drm/nouveau: Switch to
 drm_mode_config_create_initial_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-21-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UaLrwBXbBX2Y51nqvhjeIAavByFSiuP7gXk7g4C45wI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bnv6dddLbFtTvDI93iUopfdv3ap34Z0zendd6Rbiv
 x9WM/FGx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI2izGhnkndoq5/RO85vD2
 wsNYrsvHNy87G3nauFRt8SLPE+pfhXwkeSZny/2R7vjPJfb7ashsJ8ZaiTOrbnptkhbL/WNp2fq
 tZGNyjc3f/QKZL9fI5Wf1NsyNeNnlFHZSYW/n4ezTa1UXVHkAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: II4XZUKEDQ3LO3TPVL6ORWJFUAEQJO7D
X-Message-ID-Hash: II4XZUKEDQ3LO3TPVL6ORWJFUAEQJO7D
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/II4XZUKEDQ3LO3TPVL6ORWJFUAEQJO7D/>
Archived-At: 
 <https://lore.freedesktop.org/20261116-drm-no-more-config-reset-v2-21-0bb471f4d1e0@kernel.org/>
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

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d71dcfc6ee66..da07acea6a41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -708,11 +708,13 @@ nouveau_display_create(struct drm_device *dev)
 	}
 
 	if (ret)
 		goto disp_create_err;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		goto vblank_err;
 
 	if (dev->mode_config.num_crtc) {
 		ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 		if (ret)
 			goto vblank_err;

-- 
2.56.1

