Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32910C5B572
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5B2010EE71;
	Wed, 19 Aug 2026 16:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZVRGYvLc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BCC14479B1;
	Wed, 19 Aug 2026 15:44:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154261;
 b=dEZlVV0epvZttxaV2koNenIA6wNQ6rHm+R8PgrWv4tbAt60gMpu7ILxGZXXNvBRAJ/s1c
 b71w8KXtBn9KtkVYWPoENfqCuKBJviafUXYTHWkSlUGOSOi+9oUMuAK+kI1tFOtclB6mKKW
 KALDa7EzgxdvrDs0eYHTv/u8soQalxuEVtmCRV2QnMSb7q/EJ1xztFPdZCNrDUzt6yWVdua
 AL+ql6IZ9S5HY0a//oPWErns9Xw+xhTqLYXQ+HVBvTDVAMfBThAZDROmLiiHh7LVm7AVGuv
 iXWoPb25AXw50N8b3XjEnCE79jS158NwhMQn8FoiPC9dNjwwmtaSCDJh3CUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154261; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=o/spj4W5FENPyv/B4rNGsfmEZBcto8Uc5DMRDqeD4Hw=;
 b=US445bLxGCgz34o9oCQmSD4o5AlE9vXPMS5thklexCg/M0ynB79Z2sYApuEddG3dKfNhT
 eSyJOmxq58alUmSu+Q29GtW8DnC3H8BdqCYXhVbWITHdsVOM6cWc5FPJq+hWu6hw3TBcLq3
 F4YiV7WR05BIO/xzjqwcIW/m9kLgl9rXmN3N5+QhZDn6pcdI2SM6BCmOJrP2SapvZ1kNyOk
 SnLBaOViiUhLM9ms7LqazgR+9OkXT4tvuKUIDLrr6Oc2UY74UJ60DPiqb5hkNNoYG9l2zzQ
 7weDzfgGl+HMZ5ay7K0MDk+xVMysk9aeJUBGMvNc0NPAo+JaRgmr78naC69w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 541FE450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:44:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1CA10EE4E
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/spj4W5FENPyv/B4rNGsfmEZBcto8Uc5DMRDqeD4Hw=;
	b=ZVRGYvLcdkNassuZhMLtDfXGgc2yt58wOIOfTq18wYQiww36oxHR1DSrhbm7Ypq022dd0D
	FTESwrff9SltZew7SZvFHtDJBjCA9Q6urt7x9eQTumCJBrJ/paD2POX2bzfl4k8VnUBQER
	tHPKr9Nf5BCLSktztJmm+3JWmxE5sts=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-j6z_4fppNDCdYmnoOZ5soQ-1; Wed,
 19 Aug 2026 12:00:46 -0400
X-MC-Unique: j6z_4fppNDCdYmnoOZ5soQ-1
X-Mimecast-MFC-AGG-ID: j6z_4fppNDCdYmnoOZ5soQ_1787155231
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 950E319541B1;
	Wed, 19 Aug 2026 16:00:28 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6904C18005BC;
	Wed, 19 Aug 2026 16:00:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 6/6] drm/nouveau/kms/nv50-: Obliterate
 nouveau_encoder->crtc
Date: Wed, 19 Aug 2026 11:43:53 -0400
Message-ID: <20260819155934.154125-7-lyude@redhat.com>
In-Reply-To: <20260819155934.154125-1-lyude@redhat.com>
References: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: G2cgEOPUITWVCi5pUFdTL4_EpkHtr5ze8qS4iCoH-BE_1787155231
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YVSYLGLCHC4MICANS6NH7WWI6T7DZ34I
X-Message-ID-Hash: YVSYLGLCHC4MICANS6NH7WWI6T7DZ34I
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YVSYLGLCHC4MICANS6NH7WWI6T7DZ34I/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-7-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is mostly a leftover artifact from the pre-atomic days, and while
we've been using it for a while now - it isn't great. Mostly because having
redundant state tracking for things atomic already keeps track of is pretty
much always error prone, as anyone working on nouveau who isn't already
very well versed in atomic modesetting isn't going to realize this isn't
the right way to see what CRTC is assigned to an encoder.

Now that we've removed the only legitimate user (DRM audio) and all the
illegitimate ones, let's obliterate it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 8 --------
 drivers/gpu/drm/nouveau/nouveau_encoder.h | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index fbb874b11d7a8..1882ab3176a49 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -502,7 +502,6 @@ nv50_dac_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *s
 	const u32 ctrl = NVDEF(NV507D, DAC_SET_CONTROL, OWNER, NONE);
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
-	nv_encoder->crtc = NULL;
 }
 
 static void
@@ -532,8 +531,6 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *st
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, asyh);
 	asyh->or.depth = 0;
-
-	nv_encoder->crtc = &nv_crtc->base;
 }
 
 static enum drm_connector_status
@@ -1634,7 +1631,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *s
 
 	nv_encoder->update(nv_encoder, head->base.index, NULL, 0, 0);
 	nv50_audio_disable(encoder, &head->base);
-	nv_encoder->crtc = NULL;
 }
 
 // common/inc/displayport/displayport.h
@@ -1802,7 +1798,6 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *st
 	u8 depth = NV837D_SOR_SET_CONTROL_PIXEL_DEPTH_DEFAULT;
 
 	nv_connector = nv50_outp_get_new_connector(state, nv_encoder);
-	nv_encoder->crtc = &nv_crtc->base;
 
 	if ((disp->disp->object.oclass == GT214_DISP ||
 	     disp->disp->object.oclass >= GF110_DISP) &&
@@ -2013,7 +2008,6 @@ nv50_pior_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *
 	const u32 ctrl = NVDEF(NV507D, PIOR_SET_CONTROL, OWNER, NONE);
 
 	core->func->pior->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
-	nv_encoder->crtc = NULL;
 }
 
 static void
@@ -2058,7 +2052,6 @@ nv50_pior_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_commit *s
 	}
 
 	core->func->pior->ctrl(core, nv_encoder->outp.or.id, ctrl, asyh);
-	nv_encoder->crtc = &nv_crtc->base;
 }
 
 static const struct drm_encoder_helper_funcs
@@ -2794,7 +2787,6 @@ nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
 	armh->state.enable = true;
 	pm_runtime_get_noresume(dev->dev);
 
-	outp->crtc = crtc;
 	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
 
 	drm_connector_get(conn);
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index 647322ac1c8df..6dcdfd048a35d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -54,9 +54,6 @@ struct nouveau_encoder {
 
 	struct i2c_adapter *i2c;
 
-	/* different to drm_encoder.crtc, this reflects what's
-	 * actually programmed on the hw, not the proposed crtc */
-	struct drm_crtc *crtc;
 	u32 ctrl;
 
 	/* Protected by nouveau_drm.audio.lock */
-- 
2.55.0

