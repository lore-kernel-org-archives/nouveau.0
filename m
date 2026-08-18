Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E96C5DF86
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:57:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E33410ED04;
	Tue, 18 Aug 2026 23:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A7piKPUK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE3094793A;
	Tue, 18 Aug 2026 23:40:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096455;
 b=DShJBvqATMHceM9Kxx3ZWD0GF6E0YIBykF5zmCN8gfpiFFdglChLRZHY0bzzxqkueLfpL
 +KoORv15dj9acwf/Da8FCXFQU2kRfC0bFxuxIJ793APEOa6RGPP8LPiPqP71E+MqeOKWbbe
 t9rvkQKLrluSVXIKSE7+XSQeYUqB/BQTyX1Dt75tuyxxoFGquJg2gv8LZ48J59PpyqUxa+f
 NwHwXJzmurvzuZt8+pyiu/XGyjnEVSwdq0tXgN7bmOU9kZ5X4w8Xst/xvLp4wDqdxNnof4i
 q+TnGMzA2YH8Y3GsHWYsoEpplWm6ybZuvQ0h+jvYyJDi99CfcGQcfB2wDisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096455; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+AiUvg3f0tmCvkZK9tohm8bvMedZbKf/cdnpoumO1Tw=;
 b=T+9OXjHxKyNCQibrkJ33gmm59wpqEJ0k0gFW6V2hEog4capLnHKSIkqnZIYb+nNwASqt8
 zcOvVbzH0CgjsqbeKbcT53cqvtX+7oznjL7oYvgrzP1pIgdq8wQXGeTkYzrNQQ1xVNzj0J2
 zsv/eaiH4bU6pq0vSKY++AkoAEsfHglUBRHWyPMk8hlTVeoPcJJ3D1ilyxIGg+66z5blM8C
 SVjVNNQSNGa9d+VJP5ZPL9DQWB4YMyd4KVSjFhD/huJuM/4VcUQa6g1hftv5lsLXAvpuktG
 u2oYyMeZuJmtLKgGWLPZxAiZGrRNbPyp0vlGmqqaeffDCGpDpvJCF9Gcz18Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E2C847932
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:40:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA410E708
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AiUvg3f0tmCvkZK9tohm8bvMedZbKf/cdnpoumO1Tw=;
	b=A7piKPUKyVYjaQw1V52HJ1tIfU0Oqj+H0AbGvhOWHWId5sxdSUqrpvMzjSiZdmlWq2Rj6+
	UXv8kGGR3oDnieRW1XLaOIAJ/XbPYOQ72ucrT3xtSTsFE6gLn9i0vhJvCHsBsbVK2pZ2XT
	BCNcHHfXRuuGQKyz307IsXqxOaEt7hw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-aqiblKe4MkGyJoEF2yAsqQ-1; Tue,
 18 Aug 2026 19:57:12 -0400
X-MC-Unique: aqiblKe4MkGyJoEF2yAsqQ-1
X-Mimecast-MFC-AGG-ID: aqiblKe4MkGyJoEF2yAsqQ_1787097430
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B8C41800637;
	Tue, 18 Aug 2026 23:57:10 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.100])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1C9D41800347;
	Tue, 18 Aug 2026 23:57:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH 4/6] drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
 nv50_disp_atomic_commit_core()
Date: Tue, 18 Aug 2026 19:48:46 -0400
Message-ID: <20260818235637.1738055-5-lyude@redhat.com>
In-Reply-To: <20260818235637.1738055-1-lyude@redhat.com>
References: <20260818235637.1738055-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: sGYAYWD7sE3jn5d6aFjtJjtX5n9m5X6TqBUiDrQOxYM_1787097430
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6DUIRCMHZNK3SNGVKOVR6JD7OAD2QKOA
X-Message-ID-Hash: 6DUIRCMHZNK3SNGVKOVR6JD7OAD2QKOA
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Marek Czernohous <marek@czernohous.de>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6DUIRCMHZNK3SNGVKOVR6JD7OAD2QKOA/>
Archived-At: 
 <https://lore.freedesktop.org/20260818235637.1738055-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Another leftover spot where we still use nv_encoder->crtc. Get rid of it
and do the right thing: get the currently assigned CRTC from the new atomic
state.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reported-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f19820dc055ae..63d554e97fb62 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2171,10 +2171,14 @@ nv50_disp_atomic_commit_core(struct drm_atomic_commit *state, u32 *interlock)
 	list_for_each_entry(outp, &atom->outp, head) {
 		if (outp->encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
 			struct nouveau_encoder *nv_encoder = nouveau_encoder(outp->encoder);
+			struct nouveau_crtc *nv_crtc = nv50_outp_get_new_crtc(state, nv_encoder);
+
+			if (drm_WARN_ON(drm->dev, !nv_crtc))
+				continue;
 
 			if (outp->enabled) {
-				nv50_audio_enable(outp->encoder, nouveau_crtc(nv_encoder->crtc),
-						  nv_encoder->conn, NULL, NULL);
+				nv50_audio_enable(outp->encoder, nv_crtc, nv_encoder->conn, NULL,
+						  NULL);
 				outp->enabled = outp->disabled = false;
 			} else {
 				if (outp->disabled) {
-- 
2.55.0

