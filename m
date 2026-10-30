Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA9606A325
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmRRneZH
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 58589112A84;
	Sat, 31 Oct 2026 02:09:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E3E7848C27;
	Sat, 31 Oct 2026 01:50:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411417;
 b=iQnx2jO7rWVykiSKORhIID3BjfOZB9aOVSJwDWtsN+hSwwTVVsqM/VnABsrEYrEzAwBFV
 ur0ThVzSebnMd/oDKwY2geDHpLHcC/Xql2oxZADsfIAl6vW0RVZqdvYjI/ZQkAaHRXEbtrl
 oJowo8XhjFYrOKJTcA2LdMd7jqU5lIprNej8TE8uUnKQLdQkSItj1WtznNZyoa8m1+cITT2
 D1BG/bKupv2ylQ5jp1/5dq9mrtURmpPN477+OpwMnu6+vlPhwFNwSC93Q4DOtcfT/bMttuJ
 CxO6zl+ipEUGrdrtJuPedonnck9bKX6MXhnGwxKHrkb15+3Bzok5RoUiwJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411417; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
 b=I/Lco4ExEJUUsQ/VxIqsoDB6lbD838ZeveZXqqr5ksKBchZmLIMCfSCP/pWFmoHJsqyO2
 RTHthx6tNC0qqOpCpa4+i9YckwxxABsiuPTGpImFO0Ip5VGsip3zkKOs2wBmOlB0mjkpulI
 s5ivxGu18BwQcoZ0eG+9EYyAU5OlOSPCu2+3l+ZLgOGdBe3J6Amcm82NZ+J9YLtXS/3mJJf
 nGw4PdwOBRY5S1eEX/wZX1fQJpt7DcQ0/jhISMJMzTa8G+Hun+F1dmrerb+AYB01h4AplVJ
 1WSU2/W8zNEN5nrfRz9pJ2dhou7EmpSLB6e6ybRBb/x1Gb5rJDJJtMqrMAvA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 503854711B
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 20:09:07 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1317410E0F8
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 20:28:15 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so1947184eec.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Oct 2026 13:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392094; x=1793996894;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
        b=JmRRneZHUtRlQd7i94O9VPzRgRNuTXLKRXw1oxEkIEDR3ppoSeyMGIMp/i9evUvtk/
         EnGsm8KI9C3DPXa2+y+oD6KsShcApn1ojSdFuDOfbdH1hqPuDdD7tQHzI+rkr+WP35+T
         /rpwuySvqCymaUX3XdYgaXroJg2DhcUHfTlZg6Ocv+cOjoXRda+fls/6lI2KWEijsY+3
         kBH6btgNkAUbWtuJ+AuP/qJ3e1TYeeqZbw8GONkMl/Ai0QG6Wpv29yPZyw1oc6S+4d8/
         3jONnUoxnyDTk1O+xTcc5zHvT3xVOBc7A+Ga8sqc0J5BSuGWt57upxiohycaFHxpVXfV
         35aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392094; x=1793996894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL5Q/qru/61qA3CeBuTxFCjV0LvdujInnspbH7ZeU+E=;
        b=c/gQdySh15KLJOlr3irXNS/oUHxxgBO8pYQ2fwC0cCWVpvhaPeV45I8nfXiiO29d/e
         FKl9OgE3wInvtJkCQp6dlA6ejMz/2aUWte+bDo2xA4MlU6L9lm4bLxEreZaeLkx2cwVl
         pGVkJOpXQsekjZmlpkmVdK4wXvMRI89Gi6UkKehjWVoGmOw5hctrAOc5S1L3FOrnfbU1
         qg+il+sj4gD8EQKzRfaQ41NVijvHqefWlw/cHP6yozC/FRu9RTk446g3Rsl9iGp08Pvc
         e1fiqzsL9NdaeRsZwy3zVpVwLB1tZjuoVVSsmTp78xrL44jdNlzNHNPeZp5MeTIo0u1s
         TIjA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxsPOXTXpUe1w18BIPcSs82g9E2jW9ENMkWyI1YJ+WhGPmHXX89e/WNyLIrLRSBUFjkcqqroun@lists.freedesktop.org
X-Gm-Message-State: AFq9FYL0bNBPLip+d6ikz0Ykd2QGad4OsIsTYQdkXlDH3TZEu+Kk+HwD
	RasBdce1gQVo7U/e4SxSDGs5MBB0zpCoHUtUDwERvJCWCQ8HCqQHZRcc
X-Gm-Gg: AYBFou2OetIliYYAgfyRwpOyVKbU0mEGS2tApb4XNfutyhsIlmHOQX9lbN6Vrz4ZUF6
	2JnRrBmr1LIkADPSJe30Se/G4Y/DvnZ1p6DwS2YgbxJd0Rksj5EAFOHMmZ51WaGRn1ILUTSGMvH
	rmyjpFsPqx8eKstDiM9YWDGJ4i5Xp0vZP2rJ6i/5aiiEMpJyuPPsMuSXGDeVi5C2CC1hXZMn2AI
	2PAnAn9YCP+DmPOaUQ12Oo8tvIokpb9e4a7zmoaQJaYVYzmx2+ZfhXeAxRUwmTfSqTR68MmiTwI
	YffqJ9kNn9xioDxuPtqXXFSIZj5ZggfR/A4i/m2uzFgb9zuI8DfCfNU0DLsmDPKD+z2r8kB/sY5
	2/LKb3SdG+Y1Gz2rCVBdVdeQeJFz5/9Y0t72Oyx95XeQs37VOdRh/93Y3Ya3YGmdjGzpiGIhY7U
	HFK+f6bCW9REKHDao6O360Fi/w22fuxeRS3a6HbljugoYGl6kKbBBR+Z9O9Dh+iAflASVJ7cfJK
	CJ49FsSi3UecZcuLKTQJOtZ002mdFgTVVHEgRqiKbOpYWJECKCtaeKD+P+yND18H1zFmNBYqNwV
	Los3ME2LF5rHyDUWmTYU/hYv7ETZIEOI5omKR/8=
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id
 5a478bee46e88-36a4242c0e1mr4738625eec.38.1793392094038;
        Fri, 30 Oct 2026 13:28:14 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a61a0csm10976489eec.22.2026.10.30.13.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:28:13 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau: Fix CE channel creation on pre-Kepler GPUs
Date: Fri, 30 Oct 2026 17:28:09 -0300
Message-ID: <20261030202809.28723-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: muniquefeitoz4@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: D53S2R4HBXAFAI4IKGMGQN4VQIQFJGAW
X-Message-ID-Hash: D53S2R4HBXAFAI4IKGMGQN4VQIQFJGAW
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:50:15 +0000
CC: Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Munique Feitoza <muniquefeitoz4@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D53S2R4HBXAFAI4IKGMGQN4VQIQFJGAW/>
Archived-At: 
 <https://lore.freedesktop.org/20261030202809.28723-1-muniquefeitoz4@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine
channel") changed nouveau_accel_ce_init() to unconditionally request a
privileged channel (priv = true) when calling nouveau_channel_new().

However, privileged channels (func->ramfc->priv) are only supported on
Kepler (gk104_chan_ramfc) and newer FIFO implementations. On pre-Kepler
GPUs that expose a Copy Engine runlist, func->ramfc->priv is false,
which causes nvkm_chan_new_() to reject the channel creation with
-EINVAL:

  nouveau 0000:01:00.0: DRM: failed to create ce channel, -22

Specifically, this affects:
- Tesla GT215 (NVA3), GT216 (NVA5), GT218 (NVA8), and MCP89 (NVAF)
  using g84_chan_ramfc (GeForce GT 210/220/240, 310/320M/330M, etc.).
- Fermi GF100 (NVC0), GF108 (NVC1), GF106 (NVC3), GF104 (NVC4),
  GF110 (NVC8), GF114 (NVCE), GF116 (NVCF), GF117 (NVD7), and
  GF119 (NVD9) using gf100_chan_ramfc (GeForce GTX 400/500 series and
  Fermi-based GeForce GT 600/700 series such as the GT 730).

As a result, drm->cechan remains NULL on Fermi GPUs and TTM buffer moves
in nouveau_bo_move_init() cannot use the dedicated hardware Copy Engines
(COPY0/COPY1), falling back to M2MF on the main graphics channel.

Only request a privileged CE channel when device->info.family >=
NV_DEVICE_INFO_V0_KEPLER.

Fixes: 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine channel")
Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5e1336615..0a15f1281 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -337,6 +337,7 @@ static void
 nouveau_accel_ce_init(struct nouveau_drm *drm)
 {
 	struct nvif_device *device = &drm->client.device;
+	bool priv;
 	u64 runm;
 	int ret = 0;
 
@@ -349,7 +350,13 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(&drm->client, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	/* nouveau_dmem copies require a privileged channel, which is only
+	 * supported by Kepler and newer FIFO implementations.
+	 */
+	priv = device->info.family >= NV_DEVICE_INFO_V0_KEPLER;
+
+	ret = nouveau_channel_new(&drm->client, priv, runm, NvDmaFB, NvDmaTT,
+				  &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.56.0

