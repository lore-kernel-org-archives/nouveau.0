Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F77C5DF81
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4787F10EE41;
	Wed, 19 Aug 2026 16:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YbGb6wYF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C2C8479A2;
	Wed, 19 Aug 2026 15:44:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154241;
 b=XzFvUYGK6g4lh/Rc9a+MCOU0Ey1TyeoSITEqOjWz9alP3OB4A/q661nQP4LPKl1xPfEQf
 HDbJMWSytAReM1Tt5r6tMxxVibGcw3YaaUacQ276mndThetX80UBR+7va0vXyl9TzDq3zum
 QS2UJgX8aMJtQ1IXyZR3v6wWuh77Stk/fBWOcsUQAFZMkW4DvjEMBiMK16DLj+4W2NP6SuY
 qoP9eHRxSNOzhlRMr6y0MwoE7i6R8aQ60+jcyxwvwemoxhJXER3oC9o8DWOVCxB1/sF2xOJ
 KdjopoCKu3bO45k4Mth96B0yJh3RSeKWl43U03i9dAisnxC3Ntf6j548crTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154241; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JT0fofyDnN3jIOFGkcp2QtaEzfnX9HVu+laIRR16rT8=;
 b=jyNMhhtjL4iq5pLYruP4KKwbpcL140vPjn40uCrfQVCvChW0wMyjcX8oF8oPrUPyUa42c
 5Op7a/LQjzfllIABQgmKuuMJPQmnJxQkYuUh2tLooK43lV1GtfYAkYZcarVpsWoUujilZvp
 29OFHyF8eNvi+ktiWrHsD/BEYlVl4eCRIkRgyVswVAejb9xDMGS+XRFagVSo9BNY9VJOki6
 bET1oBVddUJhiYjUjQQ1JN1ZxRPI9bll05qdV0wrDZIZA2tPTuEo9s/Ht2nsERJqof6DyHB
 1JzfDbv6Rxmb4kpaomLx4tyDiQR/AKL28eEdD/crO+WZ3eMKFkom+i89dq4Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 652D3450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:43:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCE610EE54
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT0fofyDnN3jIOFGkcp2QtaEzfnX9HVu+laIRR16rT8=;
	b=YbGb6wYF/iAf4702LnPjOFhUCFYEk/ZTCnj/gvIvf6yaZ0P9gepjns7vblCz7JIRhgTVz8
	NqP1OJJnSSXa5dbAGR+mDwmc1TeXlqE/q/Z1W3GsciV46P26s3H+WMJ3p1tldkVpYJCAw1
	68tjxYt9rN3uv52m6xr/sPbTRvVdVCM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-_fe2aKthM6-dWDRcoiYhNQ-1; Wed,
 19 Aug 2026 12:00:26 -0400
X-MC-Unique: _fe2aKthM6-dWDRcoiYhNQ-1
X-Mimecast-MFC-AGG-ID: _fe2aKthM6-dWDRcoiYhNQ_1787155214
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 56A7019560B9;
	Wed, 19 Aug 2026 16:00:14 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 517EF180034F;
	Wed, 19 Aug 2026 16:00:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 4/6] drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
 nv50_disp_atomic_commit_core()
Date: Wed, 19 Aug 2026 11:43:51 -0400
Message-ID: <20260819155934.154125-5-lyude@redhat.com>
In-Reply-To: <20260819155934.154125-1-lyude@redhat.com>
References: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: elwbz28P0lh-Eh-efyZQ18zrXyLXrL7mHsn-DUmZ5vs_1787155214
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: BS7NHMMPDIAOCZLDLRMAEFRLVWAZSJJA
X-Message-ID-Hash: BS7NHMMPDIAOCZLDLRMAEFRLVWAZSJJA
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Marek Czernohous <marek@czernohous.de>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BS7NHMMPDIAOCZLDLRMAEFRLVWAZSJJA/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-5-lyude@redhat.com/>
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
V2:
* Only grab the new CRTC for an outp if we're enabling it, which guarantees
  that we have the CRTC's atomic state present in the current atomic
  commit (also removing the need for a NULL check).

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f19820dc055ae..d038743d1382a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2173,7 +2173,8 @@ nv50_disp_atomic_commit_core(struct drm_atomic_commit *state, u32 *interlock)
 			struct nouveau_encoder *nv_encoder = nouveau_encoder(outp->encoder);
 
 			if (outp->enabled) {
-				nv50_audio_enable(outp->encoder, nouveau_crtc(nv_encoder->crtc),
+				nv50_audio_enable(outp->encoder,
+						  nv50_outp_get_new_crtc(state, nv_encoder),
 						  nv_encoder->conn, NULL, NULL);
 				outp->enabled = outp->disabled = false;
 			} else {
-- 
2.55.0

