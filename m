Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A978C5B572
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3E10EE6C;
	Wed, 19 Aug 2026 16:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hg+82dpc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 97BC74799D;
	Wed, 19 Aug 2026 15:43:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154233;
 b=lsC4VlrKwDtgu5aJhOYxr3Gxk29uIrEl7TdVfBP1nyVY+sHYNXhDKskmyGKVCT+hXYne/
 D6Xr0xh2wG7tWpeO4nyPzI16lL/po01mssb+FtSw3rVw01QjiQiLaUrj4Q+2IHtebvdT6Gd
 7upJuyOxafppAM5OxWeFC94hEOxfdEh3mXcCbssHeyE8lboGkA8sTibSh4blY3uaKr3hhp0
 5i7VEFieec1BLCI3GMJjimM5FZkd5la/+HW7+x5n8GPSyFoHR7UBlZ6nCbSSI0DSD3QWi1Z
 xQdc4YNmh0bmTrc1jceZ9O+1D2xk/m7lN58wY8xYoiCr9sKdf11r1wJCGCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154233; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Cdwphjmf7twiQKozt/YmavKP3Voyo4Fdnf0ShOQkMVE=;
 b=C3Q7R4ftR1qTYUi8ZRROem4Azv2SbwbJ2hjjKH2PCPgxl5R899nLrAz8JjZ6/lnhSCNrx
 CpPSfmWAmRGtA7RarM5HnsJHzHgZbSn4aDlteMYYNUQ4GevXc1jXshxf5soie/OoF3FZsEW
 Fzq0V+g6cONE0pDjcRksz7DzOoTpJPOlBlk7r0+0wbnHE55EU8IJtx3Pl9nalKvNSzDhzl5
 uysNSoMJw9F8RrtXaTLKrBoKOded/BbU7gfJmlxB49Mp9bGgRtA0ZWKlm3/U3qVCdMIPxDs
 Ebcr8Bnum047bHR05R1KKUi28C+qpZLH3D/hUp5MHSQ553J68TFOg7W0AScg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2F1F6450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:43:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 194FF10EE43
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cdwphjmf7twiQKozt/YmavKP3Voyo4Fdnf0ShOQkMVE=;
	b=hg+82dpcZ+kdV9EmOYankBcxKKh9ik575zBI0kGyj6GZgbq85JTtsVXczb6eGRyJ2DfI7C
	wJQsH7CwdpdOPrU4Y1u0LmSj46MPdbLFUGK6h93+7jLxpY1pNzkxvBGniYUdCkw9QARORo
	pzeJWyznlhl62GKDkgjCJTU/5wwHPYA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-eCl0fOJ4MQCvU2ebNBM7_Q-1; Wed,
 19 Aug 2026 12:00:09 -0400
X-MC-Unique: eCl0fOJ4MQCvU2ebNBM7_Q-1
X-Mimecast-MFC-AGG-ID: eCl0fOJ4MQCvU2ebNBM7_Q_1787155199
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3C5271954AFB;
	Wed, 19 Aug 2026 15:59:57 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 63C4A18005BB;
	Wed, 19 Aug 2026 15:59:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 2/6] drm/nouveau/kms/nv50-: Add nv50_outp_get_old_crtc()
Date: Wed, 19 Aug 2026 11:43:49 -0400
Message-ID: <20260819155934.154125-3-lyude@redhat.com>
In-Reply-To: <20260819155934.154125-1-lyude@redhat.com>
References: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Utp1crBz95drSgRCEzZ14IuSmqzCYv7oKx8WvrY26qU_1787155199
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 226N5OU5LIPY5V6CD6ZSGZ2KVUVZBOG4
X-Message-ID-Hash: 226N5OU5LIPY5V6CD6ZSGZ2KVUVZBOG4
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Marek Czernohous <marek@czernohous.de>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/226N5OU5LIPY5V6CD6ZSGZ2KVUVZBOG4/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-3-lyude@redhat.com/>
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

