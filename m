Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F67BCA5FC5
	for <nouveau@archiver.kernel.org>; Wed, 30 Sep 2026 21:36:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B657110F50E;
	Wed, 30 Sep 2026 21:36:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D2B204885D;
	Wed, 30 Sep 2026 21:18:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790803124;
 b=p897vwy109lnip/0Rph6vZ+mQzNK6RczGfZKImdN1N3VHYlzcuSTnM7rxkWyvmhHZ17My
 fILIaIOow/dCfA4zz2628VWX5BGkcuUDbEgESqsfd9IWupQAvg37AxL0kNd9JxYchgQ0FO/
 TBKaUuv1/+exjQEFTY1XWIUiFNnAJyyPaopvjB3/T0bH03aMLi7Njsfz0G/MGwkGzbneZpZ
 2c8zrXPi7YHbSQ7/OIiwu2wsQ4a1o9kE4WHNsLn24zScerAap4gEJSeoVTVbFaxHOCvw0zE
 YelZPeTh4UDdyJxr1w7KUaffOJ15F0fGgCXmFH3/p4t9epKmG3QqInGqhcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790803124; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4fdi5zMNXe7zMPqOg6SItJ4uKz7MKEZ3umD3HlVM0dI=;
 b=EVPXv8kdeBUvFhtPMNf9AnjhM2N32qI6HNhY+swPgjS1LSw97QOPtmVq2TxOFpdlDXa99
 0wxFqqfXZUNkQHr62MICDsvvgozdRq5P8hk5oeUh4hUC0p16/CCGd6iL/ecqjtd0VPq1KYL
 N5ZGHVqcxWDZcBthYjX+BSvoedcB66eWhRZGxE6cD2l0QzlTpIDqZ2ljq0XY38GfEKyaH4i
 D+bgAZrI5y9dJHzdcspB9L5miYorVZn/wpAbTAaSc2IOTQjRGWIvLrTWOYzV4nCZUWZX2Zs
 Ub9mLVDvy5kI/PB4eCLxi3HIKmJlsiirklVwegRdU/K8i2gFZTDVIJ0ONuUw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B104446EFD
	for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2026 21:18:42 +0000 (UTC)
X-Greylist: delayed 883 seconds by postgrey-1.36 at gabe;
 Wed, 30 Sep 2026 21:36:49 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2294310E1B3
	for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2026 21:36:49 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-IvSqCvZWNxSmw-KlnwCdBA-1; Wed,
 30 Sep 2026 17:22:02 -0400
X-MC-Unique: IvSqCvZWNxSmw-KlnwCdBA-1
X-Mimecast-MFC-AGG-ID: IvSqCvZWNxSmw-KlnwCdBA_1790803321
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B13D8195FDCC;
	Wed, 30 Sep 2026 21:22:01 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.53])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 826A5180056E;
	Wed, 30 Sep 2026 21:21:56 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: check gsp->rm as well as gsp pointer before gcx
 ready
Date: Thu,  1 Oct 2026 07:21:51 +1000
Message-ID: <20260930212151.3926202-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3G6-Ql-YvYcE64G5tNVGpiVBXnJ5EaZPG-HJc3f2H6Q_1790803321
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: WM7UI4TPJU4PEOUTM7OZEHKVICEFYBIE
X-Message-ID-Hash: WM7UI4TPJU4PEOUTM7OZEHKVICEFYBIE
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>, Woody Suwalski <terraluna977@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WM7UI4TPJU4PEOUTM7OZEHKVICEFYBIE/>
Archived-At: 
 <https://lore.freedesktop.org/20260930212151.3926202-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

In turing systems where gsp exists, but can end up not being used,
we need to add a second check.

Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_EN=
TRY_PREREQUISITE")
Reported-by: Woody Suwalski <terraluna977@gmail.com>
Tested-by: Woody Suwalski <terraluna977@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/device/user.c
index f78e6b9b4292..b841d66f8bb3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -201,7 +201,7 @@ nvkm_udevice_gcx_ready(struct nvkm_udevice *udev, void =
*data, u32 size)
 =09} *args =3D data;
 =09int ret =3D -ENOSYS;
=20
-=09if (!gsp) {
+=09if (!gsp || !gsp->rm) {
 =09=09args->v0.ready =3D NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
 =09=09return 0;
 =09}
--=20
2.55.0

