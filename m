Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C8DCD98CC
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 02:13:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE28A10E90E;
	Fri, 12 Jun 2026 02:13:19 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B2DE346A77;
	Fri, 12 Jun 2026 01:59:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781229558;
 b=th6GJbbRCan3mFdb1WCatWwvHxWdcyOpcVTe+t+VMU9DRfo7lihBwdPO0uvPpgVUj6p9H
 cAl921XstqS266WxsPwRqjaHIpj8nYrK2yS86G1aP6DX37d8fR6rrg5sTve4LfEzMMQfEL4
 NRQs/8IjlWLb1dir2FaHG7pZu2t2BbVc3nNrLPBwju3pL8Ou7GGM3Y2md48iyLfdQgp3/Dl
 THlcHFDPPJVZNKCfFIti71LnRjUdhIZU6aVoUQ2kNVPsI3g4Fj1kQ3G03g3pZ6WMLi70ulM
 +nusT5oZNSp+xZeE1a5zZFATC6/4I6rDEGzknDA9rSp/g4SFxIzS6u+xUHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781229558; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KkRVhKNtrjEqS2SR7t8aMkJSCBwJJBEO/NC5vx6Sf6s=;
 b=Efz5YphCb63AjhhDw6iuyGT+L9cSqtxjFMHfHmj+RStB1eb7psshytDDiZKUAXRTAkZ9W
 +BGPOZMYXl2BAs9Kfsx+lMAM0FiA8XAD1z5TRvY1wf/rrb/LC2DE8PqmKMjuXt9BVVrWiz3
 RYxgFhusrxntIQE3g15JFFbS5s5v3oYtQnkPzRYVBuS49NSL5avkHGolikbZFgir+Y+QZdA
 CcTG19R2fc0nUaQbjnDQKWKVrmGuAhbX04uYvOhOJyfpZIY+ISJbWG+h5LkWgpjDzHDsOgM
 glnTLCJQf2Ud0R33bT+pk97srpM+TRG9s2lFNZPpLo65v+G8Zfrxy3kndCeA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 91264460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 01:59:16 +0000 (UTC)
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Fri, 12 Jun 2026 02:13:17 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0810E8FF
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 02:13:17 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-_MzuU9R0OF6NQ44H7H7Otg-1; Thu,
 11 Jun 2026 22:07:04 -0400
X-MC-Unique: _MzuU9R0OF6NQ44H7H7Otg-1
X-Mimecast-MFC-AGG-ID: _MzuU9R0OF6NQ44H7H7Otg_1781230024
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DAD5119560AD;
	Fri, 12 Jun 2026 02:07:03 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5983530001A7;
	Fri, 12 Jun 2026 02:07:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/gem: reserve the bo in the info ioctl around the vma
 lookup
Date: Fri, 12 Jun 2026 12:06:58 +1000
Message-ID: <20260612020658.3176270-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Wf7twUvYwjDcNtsXnUHHo9vXRaitsBZcY42ozqYAEw_1781230024
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: SCKL3T4BFMOCZINYPR4SKQROMJKNXM7I
X-Message-ID-Hash: SCKL3T4BFMOCZINYPR4SKQROMJKNXM7I
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SCKL3T4BFMOCZINYPR4SKQROMJKNXM7I/>
Archived-At: 
 <https://lore.freedesktop.org/20260612020658.3176270-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

In the non-uvmm path, there could be a race between the info lookup
finding the vma, and the gem close path closing the vma leading
to a use-after-free.

Spotted with the help of Opus 4.6.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index 20dba02d6175b..c5a24dff4b69b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -313,11 +313,20 @@ nouveau_gem_info(struct drm_file *file_priv, struct d=
rm_gem_object *gem,
 =09rep->offset =3D nvbo->offset;
 =09if (vmm->vmm.object.oclass >=3D NVIF_CLASS_VMM_NV50 &&
 =09    !nouveau_cli_uvmm(cli)) {
+=09=09int ret;
+
+=09=09ret =3D ttm_bo_reserve(&nvbo->bo, false, false, NULL);
+=09=09if (ret)
+=09=09=09return ret;
+
 =09=09vma =3D nouveau_vma_find(nvbo, vmm);
-=09=09if (!vma)
+=09=09if (!vma) {
+=09=09=09ttm_bo_unreserve(&nvbo->bo);
 =09=09=09return -EINVAL;
+=09=09}
=20
 =09=09rep->offset =3D vma->addr;
+=09=09ttm_bo_unreserve(&nvbo->bo);
 =09} else
 =09=09rep->offset =3D 0;
=20
--=20
2.54.0

