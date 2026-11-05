Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43981606D81C
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OBiH34Je
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25A31112793;
	Thu,  5 Nov 2026 15:32:15 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6546748D77;
	Thu,  5 Nov 2026 15:12:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793891569;
 b=0OSOn190Yu/TY7VKNJbtyNR8/hkCaS9G1kIGwF4Xm5Z5EQtSkTcI7mc3jERkaeY/swPis
 CiPYKRZONtZzDfipxL+3nXNJft3sVl4fPvgzrqKApF8FljtHy6ZCn/Wu5RDu9kjwWAdXWSZ
 8G/RUwRfMuymihpqb+y2NJbIeU2KJgwvk72U16NZhDTrMIJZoAT1sV5Wp8saaGWdO7W/Iw4
 MCCmcNYpUj0MfAkvXnRtEPvqDAs793xoxJ/2A44jlasTJeIV4KQ0KSxfPJ8iDJhKHG7dDNo
 t0R+FnXToOmMf3YiNaEwDD2JZrmeilSj8HbYdfYmfJtc5IolEcRtDK7OfwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793891569; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Xe5neJ+XyDF04SkUBFNyx0TsB1KGMSoqhCvNEkQH3A=;
 b=r5wKe8Pom2BeGOzC2wFbk5nUH31dkaUWw/GLqvAbYdYw/jF91fQbpKupdLZnJp6p1PpA+
 v2dC2KRgWk6smDNE4B9FZFyhDMy8JEQUn+5lj/FRr1rsXQ3PQEY/DEZZC++lQFdmDzcaMzT
 Lk8CRYGcPfQEUi5G8ZF5xLNJRy8iLmPa4Yczir8oaimWGoB8mY/0Uq1pIiTD0OiKtDwd31U
 1AEez6MrGBT6vVPVJm6saEPp6ADAqWwInqd1nacoxnsVaZD4ohITM7N6xkLfBUIGq75VDfa
 1bBjeSwRURJplvlFuBm6oFnby9j/oL/JWW7swez1tg+6qlFRVEM2MOeM0gtw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 74D7548D52
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 15:12:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0108112788;
	Thu,  5 Nov 2026 15:32:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7579F60416;
	Thu,  5 Nov 2026 15:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00541F0093A;
	Thu,  5 Nov 2026 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892726;
	bh=7Xe5neJ+XyDF04SkUBFNyx0TsB1KGMSoqhCvNEkQH3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OBiH34JeK96dNnuVV+wHlipr+vFVOAKkOXHUleScVGS0Gx4331PatcFGDvTSv1mzf
	 W9EnlBvovvyAcM2guP21z2JHGK4ypn1b82S5HQ09gVrRV+uwkiuEgrLD1VkZCpB1z/
	 jBnO1t8P6KUUWEFK+HiZVrVwCDr4bXSNvt9xEphmoJwzpCXo8RhP5QlKhm/NZMz+Q7
	 vBRkMrfrVL6aUdWBtO26qG3Z3A2bDrL+4aXs1qmD171I6vtX/C0G1Zbxw4aSgn9Av/
	 Hw7N46j0xuGqrSpITieZqwy/XafGuiKLGRN1syoIdUgyb19WCqsZpGTRhEfu1VgCwR
	 GDcBbIi2wnCrQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:40 +0100
Subject: [PATCH RESEND 31/83] drm/nouveau: Switch to
 drm_mode_config_create_initial_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-31-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EZMKoCQ0JYBsGKGth1V0QvP4ALC4NycizbyyTebktVI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrx+rPZ1xmMLvRcHbs/i5teZ7yG9bJr05c+a8w8uu
 c4+PeGmYscUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYyLa5jOX1+/sXNesdD3Ge
 EPfyo8NRwZYTBfFH59/Ji394p/SGBqt5zbSX6VWcoW/OHFN/Jl55k7GheZFz8/+18eoOphNfnp7
 47f+zx5P5PgQ/miC17PuZq4I87Rz5LVoTeB3nZ+p2O8b6VMUCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: T6YAUWRELORV7AQX5PLOCMLON7ONDAMK
X-Message-ID-Hash: T6YAUWRELORV7AQX5PLOCMLON7ONDAMK
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T6YAUWRELORV7AQX5PLOCMLON7ONDAMK/>
Archived-At: 
 <https://lore.freedesktop.org/20261105-drm-no-more-config-reset-v1-31-1f58d1e33380@kernel.org/>
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
@@ -711,5 +711,7 @@ nouveau_display_create(struct drm_device *dev)
 		goto disp_create_err;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		goto vblank_err;
 
 	if (dev->mode_config.num_crtc) {

-- 
2.55.0

