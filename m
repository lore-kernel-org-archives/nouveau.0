Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE2C88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 19:10:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1598010F0AC;
	Thu, 17 Sep 2026 19:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ckEvX/Pp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 25E0848209;
	Thu, 17 Sep 2026 18:52:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789671155;
 b=Kb/wgRqUhAvWO2vCcTSuho55C3es0Otu/r12XerJaOn8z8xZv0uSKW7Khe/bYwHWmu3no
 +u0U1i2AoLIMIMjXtUGmsLtsP77C4K9kDjMScguVW2yoMiOaHC8ZPjsJE6CDCUwzaJwf+Lx
 hXvaayElYsUSvy1qvJoZkaR9TRVE1dJli3MkwU1HC0+jBSrbEB37lWeTLTaH7pMh5Mf9itI
 kVFQXeRsOtuP6fb/H9CztRNKp+WbjAeBN+FCFbPCR1IKDvVCa+Vtqo4HX4LJG5dPN8UNe2T
 cPh1SL7Mqv61EE9pNKfOH1LI7mY+LUgk+9/Wy/SUgyVZVBBNRUuqKQmVf/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789671155; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
 b=FoJ52Kn16QyPkAmw9Om+DyO7oNOlmVYaDlSyBSkI7zf7tLgo4sD6O6AfTJCkIDQJJQ4NQ
 uhHQ6rGPip61VlJ8ndUlOXJ3XHi+BviCakElokrIzZjySNXxI2bkB5kMdOxDXiaZqHQwUBG
 +Ac+lm9trOOHw/aswi3VrnTQJ0MkE/2Pe8FRGBM78UgIXu2aQC0YYP5Db6z7OVVf5zZVbdB
 IAk1YcoPovnlXeiYF3h28e8JzCUF1GiHF26Xji2THroOd6e81cHaACV5xu5Y7d863ykuNaz
 4syhAQnvdpMludhxILfVxd01+2V5hMfwjXoD3nqRPDp2IWFVmhfTxoMIiyOQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4DEDB481F9
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 18:52:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E5ED210F0AC
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLSwLuQl37xTTXPl3smRd+44VFQmLk3YryksgVUFqw=;
	b=ckEvX/PpPHozCJvjKhP/boLhnlGGoYFKf+W+MkUQCpj9gkXXtHYHZr4NIYWe0QY4X2Ittr
	LI2yHSkXQ2zpa/mW0JY4kdirxq25s1Thy26/BX5LqI9S7E8dKG6+wNo0kPhCHDUYQTu1WF
	4CdS/aSzJXulhskc7MVPUL4a2SBLyvk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-L08vBYwrMvevo6MKfy0e6g-1; Thu,
 17 Sep 2026 15:10:05 -0400
X-MC-Unique: L08vBYwrMvevo6MKfy0e6g-1
X-Mimecast-MFC-AGG-ID: L08vBYwrMvevo6MKfy0e6g_1789672203
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5188818301BA;
	Thu, 17 Sep 2026 19:10:03 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ACB8919AC047;
	Thu, 17 Sep 2026 19:10:00 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
Date: Thu, 17 Sep 2026 14:54:29 -0400
Message-ID: <20260917185916.1089621-6-lyude@redhat.com>
In-Reply-To: <20260917185916.1089621-1-lyude@redhat.com>
References: <20260917185916.1089621-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: XEOrDsIj7ltNSbQYqG7Ok6BT8X4pjoMJUpCh51us_Kc_1789672203
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: UEQG7EPMGX37O6XECSCE5FW7SZOERJX6
X-Message-ID-Hash: UEQG7EPMGX37O6XECSCE5FW7SZOERJX6
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UEQG7EPMGX37O6XECSCE5FW7SZOERJX6/>
Archived-At: 
 <https://lore.freedesktop.org/20260917185916.1089621-6-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that we're properly saving the compbit backing stores on fbsr init, we
can start setting bEnteringGcOff = 1 again without things breaking, which
brings us closer to following the exact same code-paths OpenRM does for
fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index a93a39ef7c690..469e7eed1d6f8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -135,7 +135,7 @@ r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
 	ctrl->hClient = gsp->internal.client.object.handle;
 	ctrl->hSysMem = memlist.handle;
 	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
-	ctrl->bEnteringGcoffState = 0;
+	ctrl->bEnteringGcoffState = 1;
 
 	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 	if (ret)
-- 
2.55.0

