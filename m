Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0046C5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:57:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F910ECF3;
	Tue, 18 Aug 2026 23:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wyd+yOtK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 04BBD4792C;
	Tue, 18 Aug 2026 23:40:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096435;
 b=SehpR0/RxpKgC3xG2Qepl4G1hTU7maFPcTpVmV7w2KASsHa+5u8rntvuzYO72VmC7BHH5
 EA7X0TsloIMX6nvSsEJmOs6ha9ioetCLDTwGATGdEu/kty/uZlEzOfgjZatG5hFFiJcCo6f
 vEsYGe86RZQIb0kgVVz2lTNS+auegpa/iuLynm8UMZkFoPkRgPgSiB5zROD4Lhc8RmduPy8
 pDVMwLBl1O77D4UwGSbX/MYwAB4RLZQ059Ydv+LwSZhaSawDdNDROl+PBylS+LT/qtMs1Zr
 7fiVy2JGa/erxol0B7qd/Um39HacOyKkk7WmVJkyLHTjE3oVd4Qq3voyNLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096435; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Cdwphjmf7twiQKozt/YmavKP3Voyo4Fdnf0ShOQkMVE=;
 b=uA1sojed0km1WHjE3+kXkHdvK9LpR8gWSt8ecfOnJRmHfwIucD1Fv+3TkNLlK0XQhcvYF
 enQcjnhvnHSLC+y51JXNSBgLFQ2RcoZ8xfkwgDgtV3Cvsb2yF5L4k46EJCVZyjFLV+1Wy/k
 j1zvWM/O2zJ7Gzr+sDTT2JJaV2NdO9UsGhAcktltV3O89JDM35JbCqsJrOdLTyl8Vyq31jg
 v07BedtIaGZ4egD5el54IFB5j+qEKMuU/R6uwZyWl8GIG+4wwtylS2yEPU26B+dD66NXBCC
 Qy/qaPJ0k8P0YWrRl/w8pXJVlXGc9SNzEywcba/JLAoINjiBTMNWCbqMefkA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4BAFB47921
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:40:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6D10E958
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cdwphjmf7twiQKozt/YmavKP3Voyo4Fdnf0ShOQkMVE=;
	b=Wyd+yOtKwU6+NXI0DWoljjRkWrqzolDsJeD8Dt08rMoWfoqxDBvwnhyDJQzCmSHn4GeqCv
	9Zx/xaEivTfGLMHinPJVYSca8g6snfogwa1gZFCNOxdVRmZ1owQ4Kdz+Wg0Wv4qygcp1K5
	4SsETxO5fKnfvGZ/Fa8GP+37eBEQE8k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-dpPbQUV8Ok279EuZMzRjBQ-1; Tue,
 18 Aug 2026 19:56:59 -0400
X-MC-Unique: dpPbQUV8Ok279EuZMzRjBQ-1
X-Mimecast-MFC-AGG-ID: dpPbQUV8Ok279EuZMzRjBQ_1787097417
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B0DD419560AA;
	Tue, 18 Aug 2026 23:56:56 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.100])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A06ED180049F;
	Tue, 18 Aug 2026 23:56:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH 2/6] drm/nouveau/kms/nv50-: Add nv50_outp_get_old_crtc()
Date: Tue, 18 Aug 2026 19:48:44 -0400
Message-ID: <20260818235637.1738055-3-lyude@redhat.com>
In-Reply-To: <20260818235637.1738055-1-lyude@redhat.com>
References: <20260818235637.1738055-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: CodvQGhRBAK12hfnOZR7-3klw2cdjxH57q64N966Y8M_1787097417
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: IASFIQ7QMIA6PWJWMNKDRZOOTDTNBEHZ
X-Message-ID-Hash: IASFIQ7QMIA6PWJWMNKDRZOOTDTNBEHZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IASFIQ7QMIA6PWJWMNKDRZOOTDTNBEHZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260818235637.1738055-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Does what it says on the label, unused for now.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable callbacks")
Cc: <stable@vger.kernel.org> # v5.12+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a885394f7cb92..152361f7feb42 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -459,6 +459,22 @@ nv50_outp_get_old_connector(struct drm_atomic_commit *state, struct nouveau_enco
 	return NULL;
 }
 
+static struct nouveau_crtc * __maybe_unused
+nv50_outp_get_old_crtc(const struct drm_atomic_commit *state, const struct nouveau_encoder *outp)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	const u32 mask = drm_encoder_mask(&outp->base.base);
+	int i;
+
+	for_each_old_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->encoder_mask & mask)
+			return nouveau_crtc(crtc);
+	}
+
+	return NULL;
+}
+
 static struct nouveau_crtc *
 nv50_outp_get_new_crtc(const struct drm_atomic_commit *state, const struct nouveau_encoder *outp)
 {
-- 
2.55.0

