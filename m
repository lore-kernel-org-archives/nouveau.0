Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC2CD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:29:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5178210F5E6;
	Thu, 28 May 2026 19:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AwQGQyt2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EB6114661D;
	Thu, 28 May 2026 19:16:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995771;
 b=nP2eB9X8AVfgR1NdDzzBtjGwbNdIB0lAm8rc9qrEzj2xVh1uSXgaOHQHwt0IfjqjBalcM
 7Y6PZUi4xHQHtO9xjG/5mYd7x1ZDjjSk8w/kZ1rkyn2XxJpwwVQRqAxzrS6hsz7EEDGLk98
 UyHtU1RwqEtbFLtLk1R8pstRFjTSc+P4c7BNRNeeTF/w2hUSu6g2+/bqUXgatGhIrEZDrYt
 0F1l2ULeZb5HpH9i0FGG7rY1oG0svq0S8dRqZ3JT6HimUxFFkwKgWKGjKOdzBQoXP4AkEE7
 hv3ohIhGkBbdZqoXUqKkBD/RgLhkWZYZevgs+qaC+VUy1oRylljHltYVsHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gXEMs3m1iU9CvSjiofzhaHKNsr4M9NI1nJV5PXEBxJY=;
 b=pCVzgQ+L0Btu1xB5V/nSIQvldWsccxT7/0zY5Kt0GPtqg/W00jJR5nyrsSUbGxy42rV3q
 swv6U6kZbR6GO5bMvZAIVek6Alq+rVmizaYKq3/OZVGOuUZa4CpnmORyd92qToRLgBMPcAR
 d630Mydsm4EKeC1UK0TMSEe+7sTpeMYhxQnpwQ/lJUQlafWeav4tfReTw0JlT1ZuRKBWPAz
 qhGDWJcNBLiElGtRMvPk8+Px1rESqxGTks0zKwNRACvF2B76yW0DxCe9nwvBfvS5V2f4a4x
 GQrsj+U3FiAf8gILxxgaEeLsx1Dj9mOxy5H67a8I0GCUOKJo/xGeL7yupprA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A861B401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:16:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C595F10F5DD
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXEMs3m1iU9CvSjiofzhaHKNsr4M9NI1nJV5PXEBxJY=;
	b=AwQGQyt2sg4HIOw+t9KN7dis2oi/fgx+drYtWZRvfx0j6FPtLmxBe8FB/Rc1o0JP7IvIo+
	vgmBT4v82wkaZiRQuVJicKnAU4kUbQK9A8rCQ2GTZbV9x4rlPd1gFXVZUmweWVi786e82W
	OPYYSDxCivw6pl4aW+SoudQ9h7GZmBw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-NpLvq8C8N86CP8_axzjxIA-1; Thu,
 28 May 2026 15:29:33 -0400
X-MC-Unique: NpLvq8C8N86CP8_axzjxIA-1
X-Mimecast-MFC-AGG-ID: NpLvq8C8N86CP8_axzjxIA_1779996570
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C84619540DC;
	Thu, 28 May 2026 19:29:26 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A0DF19560AD;
	Thu, 28 May 2026 19:29:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc
 functions"
Date: Thu, 28 May 2026 15:27:19 -0400
Message-ID: <20260528192847.4077458-6-lyude@redhat.com>
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: TEji9IzGY_TqhYya4DNJwFEwfrfbozuSqc9dgB_qwLA_1779996570
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NJXJWHREC3YD4GOO2CQ5PANBGCLW6INU
X-Message-ID-Hash: NJXJWHREC3YD4GOO2CQ5PANBGCLW6INU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NJXJWHREC3YD4GOO2CQ5PANBGCLW6INU/>
Archived-At: 
 <https://lore.freedesktop.org/20260528192847.4077458-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is probably too risky, see the discussion here:

  https://lists.freedesktop.org/archives/dri-devel/2026-May/570353.html

This reverts commit 281fe11c6c4aebc1a1eb9d21eaab7323ee5af979.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index ab2bd88eebce5..64fed208e4cf8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -373,7 +373,7 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 	object->handle = handle;
 
 	argv = gsp->rm->api->alloc->get(object, oclass, argc);
-	if (IS_ERR(argv)) {
+	if (IS_ERR_OR_NULL(argv)) {
 		object->client = NULL;
 		return argv;
 	}
@@ -415,8 +415,8 @@ nvkm_gsp_rm_alloc(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u32 ar
 {
 	void *argv = nvkm_gsp_rm_alloc_get(parent, handle, oclass, argc, object);
 
-	if (IS_ERR(argv))
-		return PTR_ERR(argv);
+	if (IS_ERR_OR_NULL(argv))
+		return argv ? PTR_ERR(argv) : -EIO;
 
 	return nvkm_gsp_rm_alloc_wr(object, argv);
 }
-- 
2.54.0

