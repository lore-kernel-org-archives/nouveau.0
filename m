Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E24E606A33F
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mg/5ACXK
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 659F810EE76;
	Thu,  5 Nov 2026 14:10:05 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8F4D48D65;
	Thu,  5 Nov 2026 13:50:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793886639;
 b=k0jSnviQKhntBojXFMGRQ1OECQUegAhSnDxlii3rCayTwKh2ht4Se1Mc1ygiWFMnkhgNk
 eQKjOmMOvJtOw7WQwW6XTIa85rLvIX8p1R534tDpCQaF2a2qlzOPiv0SmsW87PmRu5d+Sds
 FMI/qQoirNIuPg1wEcWpe5JfZ5xlVQAKV+lzmhpbsH4Rcr0wBcSQjNZltd4aCg5DmikEBvB
 tZOqZC+LrZn13nbJSJTrGKqSFc5G9bO6LDXMq8zTV3xgzsF4VnxaZD0jD++Dsm9pzNBkbXE
 kcBLlD9pX8BRF/jb0rBgSpwntwUEUPu87HHYAUHPQmAdkb7Vl2QLF5IMpKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793886639; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Xe5neJ+XyDF04SkUBFNyx0TsB1KGMSoqhCvNEkQH3A=;
 b=T3ZjTKjuaM66FH71oNXcX33uWoeNNyRtNZDXG/UnNDBN227xmsXkZhI/+QTAg6gM6x4H8
 GHsMP3UUgpJoUZgjVlAFYTf29YWGKzNnpYtQxIKQ6P5wTkIJrW5mLPLJPmIQHIVTfBE4Z3/
 jGAjW0uek1N63KbnLu3p0stLqbc0zyBstmCkHA5GP8/72nzdSDlWU/6jLVps7H80yYN0Yh8
 2b0PGYQkvIb5o6p6wZkh1ObxKdLERum4D344HeiqaFIrZRIL+ci09/aI17Tth3SyucPwEg0
 mliHNSUaQptBi0FA7i6fKAAi72uptdvkqZ+dBS3ArzhPXg1VAB0hy6yeuYLg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5DFF748D5B
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 13:50:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B52EE10E5F2
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 14:09:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A7BB60267;
	Thu,  5 Nov 2026 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA741F000C1;
	Thu,  5 Nov 2026 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887796;
	bh=7Xe5neJ+XyDF04SkUBFNyx0TsB1KGMSoqhCvNEkQH3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mg/5ACXK+j6Zn7tDtflmgrMlqaPhdJOVyENKQoHzuIFXFriAthj+eR94t05qLsUVa
	 Mt6MxNc1my5jLIgawq8lDU4YrHbpgBPx3XTnBy1LvHGbRr8LsdzaH/mvxy80Mh5LuO
	 SslNsYuSBNau8QLxNxaKbRwgt3NBYfl8ap2icg/88DJTnWbi9mTmpGbmR8sA0xF0Xo
	 JpLrMoMBy09NeU90gmvN10JxKNo5B7aXQ+ocyOqb+eReOrQVFne/DHSy82QJ5zgCa2
	 D8z06AYzFLkeV2+m8KSJ7aW9K0wJuCR6MQfKMouilrOZbC6pN/a9Ujx9NWd4naGPAu
	 XmMfkbLG+8x6Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:48 +0100
Subject: [PATCH 31/83] drm/nouveau: Switch to
 drm_mode_config_create_initial_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-31-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EZMKoCQ0JYBsGKGth1V0QvP4ALC4NycizbyyTebktVI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlveldan3TfV2K+RSt04vqYk+pWqzl8ec5xPl7dKLw5a
 AWndP/2jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRhdqMDV8Uzxr+bjm99oTA
 hePhKTtyprTLmbVUbjl2ervQzltBd5anZl1178oSYb7VVrf6teh9UcaGptLml8ypgrWBgi6bDsl
 +8ZOI0giX/W95iueDX4ObVMb8dZ+f7S4L5tL6HLfO/HlizVkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: VF5DKSH5IU3YII562FYE25AEW2C2MC7E
X-Message-ID-Hash: VF5DKSH5IU3YII562FYE25AEW2C2MC7E
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VF5DKSH5IU3YII562FYE25AEW2C2MC7E/>
Archived-At: 
 <https://lore.freedesktop.org/20261105-drm-no-more-config-reset-v1-31-763560c2cc3f@kernel.org/>
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

