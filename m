Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51182C5DF86
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:57:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 285BC10ED06;
	Tue, 18 Aug 2026 23:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ByE7HCZb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72CCD47933;
	Tue, 18 Aug 2026 23:40:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096441;
 b=LWP4zN0y4NFqNE0wHEd9zD2Jys70+d4Va1Iq2xOqlTLJ6SIqdY0pRw7KaGUVQiXLRLief
 Co7NRf+3Bz9Qomyr5TK0nO3h93xp6+FURC57fT7crs2xuKbDqftiNX17BVZ4/97bahIJ6z0
 3lG1ep66qgr9BgAYiB108tNaeNdXWApckFg5D87Y2nR/m6aSTBizyvxFVzLNoqb36s3tQMD
 xquOcX4ftByuV/JJvraZy99YtiFSicMR8ZuH/S1MFNqeArY7YwdXAsrp6rUtbajjUQNdosf
 0uUKh/Od6vxCP9C68jCsqTQsv2mPxWFg5kqF4xP9Qk4sTwUqMdBuAHtw/V/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096441; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pz0aXgFMqOpBVjMIOtdMICeTUjk8ldXgSQBenL20dmc=;
 b=GC9D4tiOV1NuKNuokp9xM1gmEHNwLQQ7EzdJv5+QdIgRefq6/C0mEFjf9RKjc59rt5Nl3
 D6t3S+pcc/+6PlTiSXAjIRhgAFNxNvdvCtCcI6OhvxzxRsHEwFMbGPXKYwLfqqaCdVmgrBE
 QNesE6h171G7kt4F6gv1O9LxSTOFeBnWeGlyG/eHqlAbQwObik4xpf/pACuIlMjebdydgXY
 TrIbmjMnrkv+dTZ4Tl2mM56b5Uy5ar+xJDb0624+lT3PaGuReZOePW5N/097fsbzTNA/j1e
 WoLMravFkRiWz7Em0ONH2EOuHaDUXfMB4Sa6DcLgLqN1snqeIWr4baLNo9RQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DA94F47915
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:40:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF5910ECF8
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz0aXgFMqOpBVjMIOtdMICeTUjk8ldXgSQBenL20dmc=;
	b=ByE7HCZbS8MTjHMyTgm3sz6nFlMY3TIXexlY29Cisrg0UFP7GHB44cAMUf/mfPN4JMoi0z
	pIJgicQo+6e6+Px4D6gds8zPEfW1HoeqKUWQBsjHbkdgHTMk8TbM/uhnbtTyNo7uMKXkl7
	8HZNwu1F6u+I0py1ezxNWO2bQR7gkj0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-H0UBxphkPlK_ZrnM_2TM5w-1; Tue,
 18 Aug 2026 19:57:06 -0400
X-MC-Unique: H0UBxphkPlK_ZrnM_2TM5w-1
X-Mimecast-MFC-AGG-ID: H0UBxphkPlK_ZrnM_2TM5w_1787097424
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D881180049D;
	Tue, 18 Aug 2026 23:57:03 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.100])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7B68D1800347;
	Tue, 18 Aug 2026 23:57:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH 3/6] drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
 nv50_sor_atomic_disable()
Date: Tue, 18 Aug 2026 19:48:45 -0400
Message-ID: <20260818235637.1738055-4-lyude@redhat.com>
In-Reply-To: <20260818235637.1738055-1-lyude@redhat.com>
References: <20260818235637.1738055-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Z7hqLtXRj_qqlEc1IOGCgdv8uZlrQ9bYCi5iETv7nDc_1787097424
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XBIKIJK2DF5OJKN7QBMTGBBQDB5IBFHJ
X-Message-ID-Hash: XBIKIJK2DF5OJKN7QBMTGBBQDB5IBFHJ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Marek Czernohous <marek@czernohous.de>, stable@vger.kernel.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XBIKIJK2DF5OJKN7QBMTGBBQDB5IBFHJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260818235637.1738055-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a leftover CRTC bookkeeping variable from the pre-atomic days.
While it works in most situations, it's prone to breaking - as pointed out
by Marek Czernohous.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reported-by: Marek Czernohous <marek@czernohous.de>
Fixes: f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable callbacks")
Cc: <stable@vger.kernel.org> # v5.12+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 152361f7feb42..f19820dc055ae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -459,7 +459,7 @@ nv50_outp_get_old_connector(struct drm_atomic_commit *state, struct nouveau_enco
 	return NULL;
 }
 
-static struct nouveau_crtc * __maybe_unused
+static struct nouveau_crtc *
 nv50_outp_get_old_crtc(const struct drm_atomic_commit *state, const struct nouveau_encoder *outp)
 {
 	struct drm_crtc *crtc;
@@ -1606,12 +1606,18 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_head *head = nv50_head(nv_encoder->crtc);
+	struct nouveau_crtc *nv_crtc;
+	struct nv50_head *head;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	nv50_sor_atomic_disable_backlight(nouveau_drm(state->dev), nv_encoder, state);
 #endif
 
+	nv_crtc = nv50_outp_get_old_crtc(state, nv_encoder);
+	if (drm_WARN_ON(state->dev, !nv_crtc))
+		return;
+	head = nv50_head(&nv_crtc->base);
+
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TMDS && nv_encoder->hdmi.enabled) {
 		nvif_outp_hdmi(&nv_encoder->outp, head->base.index,
 			       false, 0, 0, 0, false, false, false);
-- 
2.55.0

