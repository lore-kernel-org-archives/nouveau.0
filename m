Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6827C5DF6D
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:58:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDEE10F77B;
	Fri, 14 Aug 2026 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qi4pnGHH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8EBA4780D;
	Fri, 14 Aug 2026 23:42:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750947;
 b=KjXhmIGxwA4NXz935GUTSTHFdvToaLgBhzd/emQ7ozXXX6V3QFFi4apHNoEKIlS6aO22u
 w9jKtaCHd1CY0a/y/UtOM3bMbDc9WrmpkT1+VW6oscehfegIgO0cXdKbGgGU/Jj861wAECx
 v6W5d0AbMa8Oun/9pwPPBQpfxenW70OPCgrBMgusQ9g9r81TXm27NJZooHi6mS4pX53TfwH
 7FF6Fk5u8PMyuWWL4mzLinDE8SX0njNjlZZr4C7WoUCc8DD97KCh5lD9jLZoDSUGkO0JMds
 yaanuvE99X71xzNk/cVSoMzIFyeujvs6lNOUqsxOb0GdhDQChCLPsle6nNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750947; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YPXxPr49E5YFipy1o/O5phwWh+kr0p/UDA08jPQpFV4=;
 b=vBmAYAQUJcoIQzHUlibobQIPLSFoAUH7i0V2eBNCZ68Mn1E8K5AE/qSfcIaBUKf8qakA3
 0ingaTJ9L50o3nyxON9rKpvSLu/SGizvqLlMQgrG5EOn/k5DcOtrkDeMfbWo9FCWYkSXo/p
 Z0uvN26bqVCBvUJ55aj9O8iCe1jGV+AfxijEyJfKIsdJqjZsEg1M/vl8GJcUFqIbbsOtNFB
 rJeDnqE9++h08qh4y3dh0rg3EED5Oa8qAYcNZBXAGYpiaSUJHMa55cKX24aYkXXZkptjNHc
 g5xlXonh5FyuMqT0tjsdpBYb2miG0UprYRTD8dMcpP62WTiX23FcRgCcOWiA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 244D8477E8
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1EED10F4B6
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:58:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so16119285e9.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751926; x=1787356726;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPXxPr49E5YFipy1o/O5phwWh+kr0p/UDA08jPQpFV4=;
        b=Qi4pnGHHd54UkrI3wcFtZvFVY5Fe+Xc0fmxBW466+V6Y7+XFjpXxFNz7VaW/PymEy8
         PNcE+YYp4tVyWCLSI+2vlxfGoDMi0Pf9CP98rQGisioU5lKvEViTSsXCXAsR62GMBsdP
         bE9s1dkpcge4iUBaeohx+n09eU1Zc/KFaZASjmLXWsZfTyJo7s4sjhgdC9Cr6EjmyyYY
         YIrNxo8q8uqL5WwJT3EkzlnZzGx61S9ZkBn5WhjDClxF5qkoANXmAZMl+BV3ATxNt4lX
         MA3EJMTMYBuVDAl7osKnrJZX98csv66m2cn2nwBOvsTbluEZsTjtDsORa5Z9rPvra+sG
         JB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751926; x=1787356726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPXxPr49E5YFipy1o/O5phwWh+kr0p/UDA08jPQpFV4=;
        b=emQGviOiCWSCdVg5amjSEkrrNKgaMFXWXiUOvYxNggwtWLpEsoM4BQVvQwuP3OO37M
         gXfDl9EaxUGHPrs/SqD1fhO8WHxQKswEwJij/thpkHme40vHUv2RybnDaBMHMgmwmMlk
         FlB9h6GXu2Xst1cc4+8hKDNqVRVTQwtQ0uLiXVN6ciM8TPJn1tGa4PW+yQwkbI5oI22H
         iUhePIvo0nLb7d1mLAXnq3HthTfzSj8f/RQpiIZmpLiEIWDMwlGcZlgsgb+X0gILYyfa
         hfz/ljpijmitgF6OW3BeJHBxByPRCfBYqKzY/RHWgTY51Kxl8TkObZFs5uFWlNsyzWS/
         y/AQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqkyva8gLiZMYF9U7yUuyG+pi4pgFSJe88NP87VKpAGhN+VOfCb/4Tehtqa80e4UwWWwBCwXN/X@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNMVIGoQZ1+Zszw6iPL4II7DTzaqolQAnCY0ikUcCP0JzqXiX3
	kNs3EnpkUqoRmNMYJ3No7OOJOv/bqJbim7H59l8MGglbRsnsU4AN4q3f
X-Gm-Gg: AR+sD11GaJ6mCouWk+s2IHRMSMMu5OoTLQ6PxROYTdQg4KCiCVlZo73sCoohX8aYG77
	InNXWBNL0o2cnzRk2CtLkVb5+EhnH2H3oxbSquCG9Hlq0yHcwUx2fFqXRP/+cPTQenlbD5+yglh
	pZ+ASF2FEFOJU54lV503o3GRjPBLeirhJnCBBVLXojk9feB+mCVDUD7xO2RAoWw02Cm588OIgeM
	OI/pko6Xp+mBwFN4M1PG9MTlNq+Q8dwORwoBWq2O0jEAQnLJQTnymRh+RrjW3HZDupxadIk3oAA
	fJ93arsXCKBD0FJqyWHZFW+CYiIwmTsVFAsyCIYK9jzCfXIxhVqcvl4BtL/H7MPqABkD2iTPXQZ
	0pzU9PWxzffqxO1HDOhUYA12zduexomMZ8if4oQf7mXyFvIYKqsSwRrWOcBEJxiN3UKqZRAb5cp
	dGWyJIbVtQdBuZf0Ap6skFdBqktcw5I8thErm+Obt3jvQu5936f9xyXgivzD9FyEfu9Xs=
X-Received: by 2002:a05:600c:6051:b0:499:737c:8a8b with SMTP id
 5b1f17b1804b1-49987980774mr83702945e9.12.1786751926216;
        Fri, 14 Aug 2026 16:58:46 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:58:45 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] nouveau/gsp: fix HDMI vendor infoframes on GB20x
Date: Sat, 15 Aug 2026 03:57:00 +0400
Message-ID: <20260814235705.59132-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LRCEBRCXHKYDMP6TQZWLH6ICFMIZVFJB
X-Message-ID-Hash: LRCEBRCXHKYDMP6TQZWLH6ICFMIZVFJB
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LRCEBRCXHKYDMP6TQZWLH6ICFMIZVFJB/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-3-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP path reuses the GV100 direct-MMIO infoframe writers on every
chip. On GB20x that is only half right as while the legacy SF AVI unit is
unchanged, the legacy VSI unit at 0x6f0100 was removed, so
gv100_sor_hdmi_infoframe_vsi() writes into a reserved area and no vendor
infoframe ever reaches the wire. This affects HDMI-VIC signalling which
can impact some 4K modes for legacy HDMI 1.4 sinks.

Select the SOR functions per GPU family in r535_sor_new(), keyed on
the display root class from the RM GPU table and use the new
generic-infoframe VSI writer on GB20x. Everything else stays on the
r535 table.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 1155f079b0c3..96febd01da78 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -36,6 +36,8 @@
 
 #include <rm/gpu.h>
 
+#include <nvif/class.h>
+
 #include <nvhw/drf.h>
 
 #include "nvrm/disp.h"
@@ -587,6 +589,16 @@ r535_sor_hdmi = {
 	.audio = r535_sor_hdmi_audio,
 };
 
+static const struct nvkm_ior_func_hdmi
+gb202_sor_hdmi = {
+	.ctrl = r535_sor_hdmi_ctrl,
+	/* The legacy AVI unit is unchanged on GB20x. */
+	.infoframe_avi = gv100_sor_hdmi_infoframe_avi,
+	.infoframe_vsi = gb202_sor_hdmi_infoframe_vsi,
+	.audio = r535_sor_hdmi_audio,
+	.frl_train = r535_sor_frl_train,
+};
+
 static const struct nvkm_ior_func
 r535_sor = {
 	.hdmi = &r535_sor_hdmi,
@@ -595,10 +607,25 @@ r535_sor = {
 	.bl = &r535_sor_bl,
 };
 
+static const struct nvkm_ior_func
+gb202_sor = {
+	.hdmi = &gb202_sor_hdmi,
+	.dp = &r535_sor_dp,
+	.hda = &r535_sor_hda,
+	.bl = &r535_sor_bl,
+};
+
 static int
 r535_sor_new(struct nvkm_disp *disp, int id)
 {
-	return nvkm_ior_new_(&r535_sor, disp, SOR, id, true/*XXX: hda cap*/);
+	const struct nvkm_rm_gpu *gpu = disp->engine.subdev.device->gsp->rm->gpu;
+	const struct nvkm_ior_func *func = &r535_sor;
+
+	/* NVD5.0 (GB20x and later) reorganised the SF HDMI packet units. */
+	if (gpu->disp.class.root >= GB202_DISP)
+		func = &gb202_sor;
+
+	return nvkm_ior_new_(func, disp, SOR, id, true/*XXX: hda cap*/);
 }
 
 static int
-- 
2.55.0

