Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AD3C5B572
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A481F10EE6B;
	Wed, 19 Aug 2026 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hb+FOMc8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E390479AC;
	Wed, 19 Aug 2026 15:44:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154254;
 b=YAcTyqMIg6efQzGrD2WIWQySlrGVMl6ZtyXAaDzXvyVfEg2kcdmYF6iZM+Esnu4YSg0qY
 o67Pe9Md1TiYWZSsMCd/Sekp6rk3OTKhRByO1yEANCnBF99zbmxEex4+lNVhgPRR+KEhf+0
 sphcmLGMqc2XQauG5thtGN96/HijLuIPbXUSqZq22b4unaRzdJeAizmZbVbJs4MeTPqstNm
 WlyYVdrX9Fc0VM69rDR8bdBZ7b0wSmHyPfcJ9KhSYRA/ZnQlRjwLmC/1a96KqEhq9zaROxU
 PZfUwRtPGcMxa99L96fi2NoVrXtifU9zX939gcr7NpvaKzYqMtPM52kVOusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154254; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AmVZrC88SHmujLw0GwInwyK0aXHXazrDaX+bMc3Sarg=;
 b=U44CFDxejnG1AOSt/BDE+QekMb1fWdo6N9dQyTPJ3eOOw52VV8wRpqcTzJe7Lj2oFZr7H
 WT/AOR46J9UnUT6uz47GBjyFXcY8l3cfVBphZiXo1Wmkr+r0n1vEWFNb6uOyMCi7nymHKTW
 6XhJJJoJvO5Zk9msa+2f8RWcWkScpP3jWbU3bubHWeWQVfBFo19Jdv+gZ/n6XD9lv5xdmOV
 LnjvtI3KocoJXNgzKkUZi8Z6uwUEKQ8tB32KIDHHtEao7Hm9y2+ISjnfwQ7lVn0yuhqfOnk
 Ue1DNwJ0j8//TxnAd6JXGRmYFr0bfduuZP+0tvHfNJsOYszzq+THo1EG39sQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F2414450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:44:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D02D410EE2E
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmVZrC88SHmujLw0GwInwyK0aXHXazrDaX+bMc3Sarg=;
	b=Hb+FOMc8RSU+xkHiX3vpSZnbO1mSikvDYiX2k1QwS6pQzga0XK/xkgtLf4uenKLv8a7KF0
	KefyB++elPjQ83Z/Pcy+QpHVsVRwJLtbBQ9oFRZIPH0o60WEOcXz6C7nVr8PbvqFM3HPfC
	fe+HHlgxdTFx07Ux55mXu+unPR7hhTQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-cLSv2quxNVWFMru23CE9vQ-1; Wed,
 19 Aug 2026 12:00:37 -0400
X-MC-Unique: cLSv2quxNVWFMru23CE9vQ-1
X-Mimecast-MFC-AGG-ID: cLSv2quxNVWFMru23CE9vQ_1787155222
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A45ED19540E7;
	Wed, 19 Aug 2026 16:00:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 192BD18005BC;
	Wed, 19 Aug 2026 16:00:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 5/6] drm/nouveau/kms/nv50-: Add nouveau_encoder->audio.crtc
Date: Wed, 19 Aug 2026 11:43:52 -0400
Message-ID: <20260819155934.154125-6-lyude@redhat.com>
In-Reply-To: <20260819155934.154125-1-lyude@redhat.com>
References: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: SO812TZhzDeJKnUO4lJgRJrclMjdxnpr3pIEr9BP1cs_1787155222
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: GBRRXAMIAZPFZSXZA7VMAJJLU5IOLLAQ
X-Message-ID-Hash: GBRRXAMIAZPFZSXZA7VMAJJLU5IOLLAQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Marek Czernohous <marek@czernohous.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GBRRXAMIAZPFZSXZA7VMAJJLU5IOLLAQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is the only spot in nouveau where we do actually need to keep track of
the currently assigned CRTC for an encoder, and it ideally should be
happening outside of the modesetting locks.

So in preparation for obliterating nouveau_encoder->crtc, let's just add a
variable into nouveau_encoder->audio for tracking this and use it instead
of nouveau_encoder->crtc. This makes it a lot more obvious that this is
only intended for state-tracking for audio.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d038743d1382a..fbb874b11d7a8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -636,7 +636,7 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 
 		nv_encoder = nouveau_encoder(encoder);
 		nv_connector = nv_encoder->conn;
-		nv_crtc = nouveau_crtc(nv_encoder->crtc);
+		nv_crtc = nv_encoder->audio.crtc;
 
 		if (!nv_crtc || nv_encoder->outp.or.id != port || nv_crtc->index != dev_id)
 			continue;
@@ -757,6 +757,7 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
 	mutex_lock(&drm->audio.lock);
 	if (nv_encoder->audio.enabled) {
 		nv_encoder->audio.enabled = false;
+		nv_encoder->audio.crtc = NULL;
 		nvif_outp_hda_eld(&nv_encoder->outp, nv_crtc->index, NULL, 0);
 	}
 	mutex_unlock(&drm->audio.lock);
@@ -781,6 +782,7 @@ nv50_audio_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	nvif_outp_hda_eld(&nv_encoder->outp, nv_crtc->index, nv_connector->base.eld,
 			  drm_eld_size(nv_connector->base.eld));
 	nv_encoder->audio.enabled = true;
+	nv_encoder->audio.crtc = nv_crtc;
 
 	mutex_unlock(&drm->audio.lock);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 4422c6185d498..647322ac1c8df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -62,6 +62,7 @@ struct nouveau_encoder {
 	/* Protected by nouveau_drm.audio.lock */
 	struct {
 		bool enabled;
+		struct nouveau_crtc *crtc;
 	} audio;
 
 	struct drm_display_mode mode;
-- 
2.55.0

