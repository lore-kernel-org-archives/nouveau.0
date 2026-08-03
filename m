Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1E2C55822
	for <nouveau@archiver.kernel.org>; Tue,  4 Aug 2026 16:03:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C08B10EB15;
	Tue,  4 Aug 2026 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d4cA4ocZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 85BBA475F0;
	Tue,  4 Aug 2026 15:47:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785858445;
 b=wgniEI7uLX8ZCSZcbOX2vtyB1XFbi4/vNG+/PSl27xxaHM5x+VV1slcckpx/ARZI0iQCu
 BoEgYUw7nuwrmm9OO5RF4OwWVN87E7k6DzMsiITMtt4E1FQfLFqVQAgPdEYG7NiTgLaF2SI
 gyNQbvV3cUPIJygqB87xODWYTD0xVdKzcV0mpX2akTyvuRkDhn2VdziT9VK6nnXorplYKSm
 2Bij5DPdWfYNwYdy4gHt9WBUmdbD9bCVED5/Oy/G7peyoszvwe4adErT/4ZuhQbSucKYPjp
 TEADEd503+L6EC5UbP+nSWHoQO5HSlatEN8853i6TYT8TFNmOv5oNDYOQmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785858445; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eTvs94omlnn6KRMYaf/xTULVGskgqo6uDr6699pyZW4=;
 b=hqNvQ/Yw9FIyp/R6qbuJLOzvAnM3syc1JlqDwsG6HpsHzFfSmlSyx9NToK/X+bgIbk7JH
 0oRgE7zpxXQL8yjNKHBo7sqUHonUvXNZE0si2oHO0uLKp/0Kr61Rlkttsy2YdstKdrcOkH7
 b9Rjx53eA3rHKDifTlxgyzgQt41/92rfSM1CTk3AIy2iLH06WaGojpvz9qpMuoGgPHIXlAl
 CmfCRSvTzBAEfcWWPORJa79khXO9tY7bpf4CpuWbekyFMDcBIaJEG653OhCLgbPBT0pe7LW
 1u3SxNNCeB7NH+k17QvMke5owOn4U07wuHreyeTQzTe8sqRTqffn0+zVVxMQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F36A247590
	for <nouveau@lists.freedesktop.org>; Mon,  3 Aug 2026 21:34:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E157B10E0A6
	for <nouveau@lists.freedesktop.org>; Mon,  3 Aug 2026 21:50:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso21927905e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 03 Aug 2026 14:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785793833; x=1786398633;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTvs94omlnn6KRMYaf/xTULVGskgqo6uDr6699pyZW4=;
        b=d4cA4ocZNTvVseGeAiQCkVUFvgPihVSgA2+HkStgzzAxsVYx/DtU5jeBrdDGHDHLF5
         QOU7TREKscKdR3Zj3DmSnK9SzBruopAbnQWSbazMDNQmvBrlxQE11hbZOYq2wR74VILk
         s/67jwsXjjqw+Z7458WseixRgTVjIR2yXRC7mTCylD909BwtYfMnSBLy1JwUhpQ0R/OS
         exewZ8/KpNl0Lgce24oW0QvFUlgMYcaMafuRvs0jEnKdUpcBTcu9BRgT27fCNmd+WXLP
         Vkx4pN2rsJRyCYCHfsIEbvbm8qxrQyi67jqRBDeWnjCbnyrxbaH3mCGvh/6KIcJfXhnk
         utOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793833; x=1786398633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTvs94omlnn6KRMYaf/xTULVGskgqo6uDr6699pyZW4=;
        b=AuaBr7ELb5eoRD2HsHLLkenaWAz5UY09MZ/NFjw0I4gVHJrBdKAoNhI7fvT1E3u+7e
         eCHLk1/ed+A1tVS1pyt4kQHplZwdXX1weo/wSSnf9knBdLqXUf+rxRNBSw5VIaaldSBk
         Hr37kRBKkFif0NfO3xJ3Pvt/suX2eGUNMK5gNWjV0YWTsey9gAudQXauSGSFPxR1ENwe
         S0loJjQyRcgOJrG3k5VxsSI6MrhogRcmxzkDfUD35VKdxIpDq2DMYIMVl8PWckLjMgH6
         Qj0zAOnEkza36lq17x/xCBpmDLUGJ6rqudmfnB82QkxVfXVDNMk0rgk46xgs6xIcXvn0
         I56A==
X-Gm-Message-State: AOJu0YwHlull6OTZ+ZHA9MlvlmN3gRa/JlOh2rjJo1edCwrsmJh8+yb7
	Oc0bZ0H3aajg/OtoFcPcJzjHweM0RkI56NDlExkI9KhJPrO4/ihvtfjGe+2qDwWlF74=
X-Gm-Gg: AR+sD12Cu/w/6IQwhiXkzlTB9rLsHhyYbDMos17pmOuTtAeAmEoMW3M70wSolXiuQFx
	azkdDmx9+6isJNtihM3VXWhtMcd1mR57EmeKLALOLL7feM5IZX/3NleVocjdptNMjzqtiqN7Mox
	mRu9pCWqZ/eM9o6zY+/lsiRJ+H09CqKa1TgY6mDQGztI8xhORDxgSkfq10X1RhcQTHG6oGIt+od
	zHO1DXBav38m/Bf2ukMi7w6mD3cqL/hY1ttLr8zFvpGP5hyuSqUzHS3H+0bWBbqt45/Dd/EMu6c
	Dn/8Lq3s828kc7dVMt+VurXMAiU7xJHz4Ttkgf+w7qKX2XY3+NY6ZE9Fmw6PioQE0osbRrlGV7E
	FFR+AK9KIVIZTff1dMH9LXv2xYGYN0tIXOscu9XE7sZXzMp8ZlKYwDY+UNHbxNs1oyTbLc1z3kQ
	sYpQtaBJguCKWrnCvkjsg1RcC2yuYJQ/We2TTs0FCP+12QVgoyO/SEvYG11XJD72S62qyjlmUBJ
	pOjGp3NxwueIyTegsK4vap5A7QU/H1r6EC63FFpK9w=
X-Received: by 2002:a05:600c:34d1:b0:495:7561:a9ed with SMTP id
 5b1f17b1804b1-4980c679d9dmr297266215e9.17.1785793833068;
        Mon, 03 Aug 2026 14:50:33 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fdf392sm44274645e9.11.2026.08.03.14.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:50:32 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/iccsense: fix memory leak in
 nvkm_iccsense_oneinit
Date: Tue,  4 Aug 2026 02:50:22 +0500
Message-ID: <20260803215022.172201-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 6BDQISBU3RGAQ3SGSFSRJ3FGOI4IIGVK
X-Message-ID-Hash: 6BDQISBU3RGAQ3SGSFSRJ3FGOI4IIGVK
X-Mailman-Approved-At: Tue, 04 Aug 2026 15:47:24 +0000
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Muhammad Bilal <meatuni001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6BDQISBU3RGAQ3SGSFSRJ3FGOI4IIGVK/>
Archived-At: 
 <https://lore.freedesktop.org/20260803215022.172201-1-meatuni001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvbios_iccsense_parse() allocates stbl.rail via kmalloc_objs() to hold
the per-entry power-rail table parsed out of the vbios ICCSENSE table
(drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c). The only
consumer of that table, nvkm_iccsense_oneinit(), copies the fields it
needs into freshly allocated struct nvkm_iccsense_rail nodes but never
frees stbl.rail itself, on either the normal return path or the
-ENOMEM error path taken when a rail node allocation fails.

nvkm_iccsense_dtor() only walks and frees iccsense->rails (the copied
nodes) and iccsense->sensors -- it has no reference to the transient
stbl.rail array, so that allocation is unrecoverably leaked every time
oneinit() runs.

Observed with kmemleak on a KASAN build:

  unreferenced object 0xffff888104cbe480 (size 96)
  comm "(udev-worker)" pid 526
  backtrace:
    nvbios_iccsense_parse+0x217/0x740 [nouveau]
    nvkm_iccsense_oneinit+0x140/0xdd0

Free stbl.rail once we're done consuming it, via a common exit path
that also covers the -ENOMEM case.

Note: ret is reset to 0 immediately before the loop rather than at
declaration time, since it is already in use a few lines earlier for
the unrelated nvbios_power_budget_header()/nvbios_power_budget_entry()
return codes. Returning it unreset from the done: label would leak
that unrelated (and commonly non-zero, e.g. on boards without a power
budget table) status code out of oneinit() on the success path.

Fixes: b71c0892631a ("drm/nouveau/iccsense: implement for ina209, ina219 and ina3221")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 3ccdbbe2fad0..6bfe4913dcb6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -239,6 +239,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 		return 0;
 
 	iccsense->data_valid = true;
+	ret = 0;
 	for (i = 0; i < stbl.nr_entry; ++i) {
 		struct pwr_rail_t *pwr_rail = &stbl.rail[i];
 		struct nvkm_iccsense_sensor *sensor;
@@ -280,8 +281,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			}
 
 			rail = kmalloc_obj(*rail);
-			if (!rail)
-				return -ENOMEM;
+			if (!rail) {
+				ret = -ENOMEM;
+				goto done;
+			}
 
 			rail->read = read;
 			rail->sensor = sensor;
@@ -291,7 +294,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
-	return 0;
+
+done:
+	kfree(stbl.rail);
+	return ret;
 }
 
 static int
-- 
2.55.0

