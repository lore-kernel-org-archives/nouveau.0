Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F43C433F5
	for <nouveau@archiver.kernel.org>; Thu, 26 May 2022 20:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399F710EC35;
	Thu, 26 May 2022 20:47:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564110EC2E
 for <nouveau@lists.freedesktop.org>; Thu, 26 May 2022 20:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653598071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j55Hw5a6F1TpjTaAYT/6/Dg4/4EU0p+iC4wvT7hHJl8=;
 b=AZQedZ2fvdlugcUrfSinG9tYBftsskwH2bstmEJemJFjn6CZ61qXPNd7QAh6pinzgEiZf+
 GnQyiFUfjeXA3jtRhHYKyKBL+X9mUYUVDtOgRBqUKRHYtfg+A3CYwnFC1YrIE1QhILBCdr
 oACD3DYkkseU/Yn4JZtN+MnHHJ8AYMg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-Ydy1vXiaMWufEpgVNLOJuQ-1; Thu, 26 May 2022 16:47:48 -0400
X-MC-Unique: Ydy1vXiaMWufEpgVNLOJuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B32A83831C56;
 Thu, 26 May 2022 20:47:47 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65191400F36;
 Thu, 26 May 2022 20:47:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 26 May 2022 16:47:31 -0400
Message-Id: <20220526204732.660069-2-lyude@redhat.com>
In-Reply-To: <20220526204732.660069-1-lyude@redhat.com>
References: <20220526204732.660069-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Nouveau] [PATCH 1/2] drm/nouveau/acpi: Don't print error when we
 get -EINPROGRESS from pm_runtime
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since this isn't actually a failure.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 2cd0932b3d68..9f5a45f24e5b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -537,7 +537,7 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 				 * it's own hotplug events.
 				 */
 				pm_runtime_put_autosuspend(drm->dev->dev);
-			} else if (ret == 0) {
+			} else if (ret == 0 || ret == -EINPROGRESS) {
 				/* We've started resuming the GPU already, so
 				 * it will handle scheduling a full reprobe
 				 * itself
-- 
2.35.3

