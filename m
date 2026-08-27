Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E2C61DC6
	for <nouveau@archiver.kernel.org>; Thu, 27 Aug 2026 01:50:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10510E380;
	Thu, 27 Aug 2026 01:50:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9663747C5C;
	Thu, 27 Aug 2026 01:34:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787794444;
 b=zQ8j/eihtKtRUIYBUxk/TsSwz0KNQIkSUkl89XJ+iMTGz+ds0AGlNtWbRa/UtNGV/qDft
 o36fA4XX/hi5IYQ4wFQO9PqAqCA0kmaTYL8dtu8GqwqeRq3h199zcnVR5+M8W7/DBa7N5uf
 JDmqBU4rXzAJCmIOpp53+yOa+/a9WXA/+mSfDqTbJYSbRN2pxyVKa8YDiGesKFgvliq8FOk
 SVQTpTILQrEKa4DAMWmamy+cTZ1MNoXCJXhN1U0W2G9sM0nUHSN5PbPDkQ7AM+GiFc6QV21
 4s1ksHDoJuhM2os2NmY/PqlTn3nVsQent1bV8vpDmqf98rzSXS0W3Q+isIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787794444; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RaH2chO7cLRFBStKaxw8jAE0xI1hp3jpGBCNQ6tZBQ8=;
 b=MB+aeRFsO38bH92hlSoEYC4lxqpY3JQm+IQ96aalmZkBBEXlycYOwGaU/YH8lXkE69coj
 VD6kIvSsHc4JDeiy2WA2h1f3kNK+JogOAlnOt+nP67zr27D7s3XYLEwbvmqWUTiLkpTKP8J
 M3HiHMncljw6lUXu7SxxbNPxRs+gWab9/ubDR6bVQ4ex1dx675c08HdUIlIaDAgVLuMHPTA
 dln8F8UoaoRyN+el9ymuwhBkeOMJU2dF64xFTUMGssr02dw8dj9a5qktA+rOq9HZCvxixo0
 DCCQAtStgIzXBw0IQrxC6x+atNa7P8NlqxaLhvK+/nEOBBb7tTc4WAzOfG8w==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C2B7147604
	for <nouveau@lists.freedesktop.org>; Thu, 27 Aug 2026 01:34:02 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E496E10E023
	for <nouveau@lists.freedesktop.org>; Thu, 27 Aug 2026 01:50:51 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-O8H2j3s-Pfen7cCOp754PA-1; Wed,
 26 Aug 2026 21:50:45 -0400
X-MC-Unique: O8H2j3s-Pfen7cCOp754PA-1
X-Mimecast-MFC-AGG-ID: O8H2j3s-Pfen7cCOp754PA_1787795445
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AEAD91831341;
	Thu, 27 Aug 2026 01:50:44 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.85])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0227219560AB;
	Thu, 27 Aug 2026 01:50:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/connector: set no zero sized all displayport on
 nouveau
Date: Thu, 27 Aug 2026 11:50:38 +1000
Message-ID: <20260827015038.3483865-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KNX3JY8wRtyQh_oqRbFF0j0HZahtXOF3S5uPaZAL11Y_1787795445
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: V52YXY6N4APMP37JEIXYHYJCSRQVDFO2
X-Message-ID-Hash: V52YXY6N4APMP37JEIXYHYJCSRQVDFO2
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V52YXY6N4APMP37JEIXYHYJCSRQVDFO2/>
Archived-At: 
 <https://lore.freedesktop.org/20260827015038.3483865-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I'm seeing failures on Turing with some monitors, let just
not bother with zero sized on any nvidia GPU.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/=
nouveau/nouveau_connector.c
index b0b0ad9a0c24..9b9c9ea2bce1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1404,8 +1404,7 @@ nouveau_connector_create(struct drm_device *dev, int =
index)
 =09=09nv_connector->aux.drm_dev =3D dev;
 =09=09nv_connector->aux.transfer =3D nouveau_connector_aux_xfer;
 =09=09nv_connector->aux.name =3D connector->name;
-=09=09if (disp->disp.object.oclass >=3D GB202_DISP)
-=09=09=09nv_connector->aux.no_zero_sized =3D true;
+=09=09nv_connector->aux.no_zero_sized =3D true;
 =09=09drm_dp_aux_init(&nv_connector->aux);
 =09=09break;
 =09default:
--=20
2.54.0

