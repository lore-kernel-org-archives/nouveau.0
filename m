Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29377C5B572
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 056D910EE65;
	Wed, 19 Aug 2026 16:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V4TFkGnh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D389A479A2;
	Wed, 19 Aug 2026 15:43:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154239;
 b=oQBVnfc3bcfnmCZzNfEloRla8GMPJ6xsuxFa4a+lsFYRoG/zpHBpcWP4YmfPnhUhE93/v
 3Gp44sorGX969P6cHEwZBRNemhrd70i6z1ntAQmp8dN6uWfUhlBaHvprAuq2CsJF4r1Su1L
 xpn5x9ibsdZVLkl3wpHoIEALPqF5c/W6lN8pdlfxhDGKGYW+S4NTTnqeY94hQjWmD9t1oY4
 F+2ivAJOg2JrqJHlIWwsX/4jQK+GFSRaxn7B+FFSZ4LzdFgSDDl1Fy+uru3DkGNgF2B1hSU
 h/F0JGn8unIbRJzbl8aHfQsnfS4DZG9XzNHrVgZKipbj52sMu3dXO+fO1Xvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154239; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fMF+0ARQ9Eixkloaq8eI+L+kTqWe7Y7ZEuYINPQUR1c=;
 b=SxRdP/U7TisVZAAgdwNucyY3tXJmwPieKmtQuRpWDGaPxw+3lo7aDORobCtPR3wwaZaMa
 F+94DNL18i1OFg3FQ3GbJ/1eCvdg9sQlGNt+DGDkPpeDMzsbsLi0q0xcYEPf2ASIt8RnyMz
 IS2YhsuM1CrwAQz3HLGb++Q5LhBoYKWq1ldGMIfb9gg0Y+WTPCciwJn7Esp4OVV6ik8lT4+
 avY3HKtAd8Rvy/PbJW+BKYYRUOLYdCbpCBW8hETDUkQvXgx015Esd47ozS8GHLH/iy8XfVe
 lko7kyLv9IvCMjuoXZZvRMQKnET6wh9n4fGohQO/jerSGFunL+HD6MfT+M2w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73F2D450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:43:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5918A10EE64
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMF+0ARQ9Eixkloaq8eI+L+kTqWe7Y7ZEuYINPQUR1c=;
	b=V4TFkGnhh8NOBEmqylQyihZ1HJYpUIQwA77XDi0hPtqz/LP6bo1olEwVlro3y8DeI+0u95
	mCK1zTM6jIw/S+Y1nOrc0pt2XC0AWMfLi/FnCcqtQX1xlsrxEnbEe4WYqt8Iy62mRqZrY6
	ZJa1isFhqu5+a85UEdx2p84700kqC/8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-5Dfng3uhMEqdLYBca1IOjQ-1; Wed,
 19 Aug 2026 12:00:19 -0400
X-MC-Unique: 5Dfng3uhMEqdLYBca1IOjQ-1
X-Mimecast-MFC-AGG-ID: 5Dfng3uhMEqdLYBca1IOjQ_1787155206
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 950711956047;
	Wed, 19 Aug 2026 16:00:06 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EDE4A18005BB;
	Wed, 19 Aug 2026 16:00:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 3/6] drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
 nv50_sor_atomic_disable()
Date: Wed, 19 Aug 2026 11:43:50 -0400
Message-ID: <20260819155934.154125-4-lyude@redhat.com>
In-Reply-To: <20260819155934.154125-1-lyude@redhat.com>
References: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: HmpEjb-W4nWiq82ieGe6ssqxMixOQV9ZVKzC0v2eO-0_1787155206
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: PPJRHQ6PQ2GQRGBCPTULOZOEASQWLORJ
X-Message-ID-Hash: PPJRHQ6PQ2GQRGBCPTULOZOEASQWLORJ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Marek Czernohous <marek@czernohous.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PPJRHQ6PQ2GQRGBCPTULOZOEASQWLORJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-4-lyude@redhat.com/>
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
Reported-by: Marek Czernohous <mczernohous@gmail.com>
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

