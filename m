Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98151C5CFEB
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 10:36:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16F10E4B2;
	Thu, 13 Aug 2026 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D9AKsJlH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A6F0547729;
	Thu, 13 Aug 2026 10:19:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786616387;
 b=xYx5sQDv6LnB3Xxw03rZi/rS3OCF6Z0cCabqk7t/uIajiM7xc6/Esoc7H9qYc24GU32v9
 3EZP4GRtdF98zNE/fR2dA5Akq2m2tTKLZpq564zxOd7J3f3PwSoND3xyC4TQb68MOB9aRZC
 yjZvTUc9DJdOMAFpAeSIiD7UQ8IIIm5o4TA6W97zEQ0sUw+ny9/l7U5UthfD7SWAN9ZbWWR
 zD3yTupAKvibjA5d5UZUhHvlevpsY8dcYTa2bK13z+J+mV54lT+NwF9ingIQArNnKjBrY4q
 wAdg1mwv5NW81LPt+6SinlYFwhsYWEsYmzAyJhLh2PoNpsK0Ve8SEbC9UI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786616387; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z3AY/Bs9FDrd8H3tGAAndoQ/dkrF/oypF8YiYah5nNY=;
 b=O+RF82cqtcSWjBSkwkyaXhPvrrdcoBeE6EFa413PkjGqUpR6apob3S2vQ49TpduyIOs2+
 VzaqfhHIZLssdJ+UFdMPQlASxEP1Ssn5ipy80LL5xjhJFJKXwbEOtdfrSQUSILQHcq0Ry0C
 /8OkNPQnSaxBsbiPJYTTadVOCZAtjTRSY8vCxBKexQo8zrNzoFoEON+JqsEYCmr2lehwIhp
 0jxHSsiEF2g+Sf4vlKLoqREFrkFlo+JBYwIUohshnL0gGV+4097OYM8QlN+lCyX3KmM3mep
 A9poUvGbyW51ageD3QsxXnTXR8uk41XyK3SC5rxE88wlediJJG1ExcxpHebA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C5520476ED
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 10:19:44 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB70710E028
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 10:36:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso1856354a91.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 13 Aug 2026 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786617363; x=1787222163;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z3AY/Bs9FDrd8H3tGAAndoQ/dkrF/oypF8YiYah5nNY=;
        b=D9AKsJlHQ5dz8KkNku+b6H/PijCsD8Jrb7UT8j6iRAn4NCW4PU/DAno2i3+TAWkK+d
         tpCrqHbINYABElVSeQVUTosGyoyEld3ENrF/BGMXNfJwSOk4wR3gAxlMr0gOd0xjUPVB
         OLqmLQFi+is7K2TAKr7k7ZbV/TtfSxhrazjS36P875JmvYyWQ0xoeC5RW5Wk/R8DAGr3
         QeT0W9Cv8BZMPlumQowejfr3FFsh5yKBLOCFFZvBUM/R2n8F24+sCnSW9icx/MrE2hHM
         TlLlV9eKqYFd9cMZOU52j074IKaOl5bTK+4dnfUoSTZ/rpIZEwYc1fnqURK7s7G9Euaf
         FiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786617363; x=1787222163;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z3AY/Bs9FDrd8H3tGAAndoQ/dkrF/oypF8YiYah5nNY=;
        b=TA6/nVh4JYv6i071VTNoCQS0cA/F1rJi01/Q7abss12uxlRKwhQQfVUE51hiktMkJD
         tCNHpf9ZJSpED6BWL8MiSUCtwciOmAF8x7XOf7eEViZBf+U7As6pJpe0AlsHy3rkCD+h
         pEql7rG9DKQHivl6Oxw96U8l45bSIYFI0GIpO9J7gVslAfHZbYPKi9VHLcxAVUXP12I0
         3VTvJm345X1lUOS1oH5M5Hd0jv/BiJJlgCAl3X9T0XbSNNp28jrAzzzw/NCRSgM0Jae2
         Cta3Hc3JVemexQ7mSRBGa8YaLZvQwVmT29HEwfaWnS9Ub9zeHmClyE3vkbMIY5HbJgwy
         qBOA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqf9bv28kiy7N47jR/50UROO7Rw9R3OfhHz45/K2MY5asdV+FbW3WfVsfHZzBnSZVzMPW2cvAyH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE8uA37qUm6vRMQpzHrZ/fYVtM9CERdMbjVL2zPfH+WkCJIztN
	CYKYBvtxc4i+w5yRc615eXISo9Rw1syyeJe92IyJUBOr7x+K3K7Vp4ZhAM7a14z+QDE=
X-Gm-Gg: AR+sD11fSq/hcVv70x0OxkTgbSYyfKMgDdckc3GM3OlyEmGke/zWeHz64Ysq/hSBQvY
	JYz9M+QXlLmRPSzfLRyDLYIrlHxl/uz76UlgXgLbEp2gn/7GCXZbnOCHDs3Ut10c4YR5scn8FJm
	RrfdQ7o8sEPOUt3N3BlqKDiRQhO6RfeXvme/dB1Ho8JFp0oP4fbF2FuvipaZ1bLKIw1o8BQXZaV
	8VIiHX3vhmzcZ7kRsOVEI2JNyMHOH39PXMsiPvvS8heF0AUQgmlqRoIeeZpoRnD590OwVibqgOv
	U4QzWyu19K8SejCcUijZrGcMuaeNy6jZ/Jg4QFQC30Z8WA+6PxQg7WtWnOxAId3mBlt475TCkT1
	aV02wxhFCDTV1jAGzDBA5m6M1lS5xwQ0jYxmfN6xHHs1QIrmNZmiHwKnrOHJUdequOfALzZWp1B
	5d5dBw7hVFqGE4BhARD85N3wPMVcR94AvYc7oRafovuhnM23MZ13jmrHz5kVE=
X-Received: by 2002:a17:90b:278e:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-3931e0242f8mr6100351a91.6.1786617363370;
        Thu, 13 Aug 2026 03:36:03 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41ce3fsm2381426a91.10.2026.08.13.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:36:02 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Thu, 13 Aug 2026 18:35:47 +0800
Subject: [PATCH] drm/nouveau/nv04: check cursor buffer object size before
 upload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-nouveau-nv04-cursor-oob-v1-1-3f3eb37d213d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAKefWoC/yXMTQoCMQxA4asMWRtIOzKIVxEX/YkaF400tgwMc
 3erLr/FexsYV2GD87RB5S4mWgbcYYL0COXOKHkYPPmFTm7Goq1zaFg6HTG1alpRNWLIPi5ELvO
 cYdSvyjdZf+fL9W9r8cnp/d3Bvn8AMrGehnsAAAA=
X-Change-ID: 20260813-nouveau-nv04-cursor-oob-ad2b6001de3d
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786617357; l=1859;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=meyb6Y2dzI5h7FZCiO0Odzp0AHqH1igJ4/zqrayN1Nc=;
 b=RNFf4wcl5LftIPZXfs3V3e6M/RvnsKRYFDr2Klg/361+meLcH5wFsHmX27P4vcahMHwYigsCm
 x9MU0ukgwrABPcno3tUpRryRAvmlcH+Rkiw0czCAWwMQsBzK44PWa6V
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: JGUWMDA3T27ELKFZOJ2LOPDVF2U6JSZK
X-Message-ID-Hash: JGUWMDA3T27ELKFZOJ2LOPDVF2U6JSZK
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JGUWMDA3T27ELKFZOJ2LOPDVF2U6JSZK/>
Archived-At: 
 <https://lore.freedesktop.org/20260813-nouveau-nv04-cursor-oob-v1-1-3f3eb37d213d@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nv04_crtc_cursor_set() validates only the 64x64 cursor geometry, not the
size of the backing GEM object, before nv11_cursor_upload() /
nv04_cursor_upload() read up to 64 * 64 * 4 = 16384 bytes from it via
nouveau_bo_rd32() at hardware-fixed offsets.

nv04 uses a legacy cursor_set callback with a NULL cursor plane, so
drm_mode_cursor_common() passes the raw handle to the driver without
building a drm_framebuffer; the framebuffer path's size check never runs.

A client with DRM master can thus supply an undersized GEM object and
trigger an out-of-bounds read, as nouveau_bo_map() only kmaps
PFN_UP(size) pages.

Reject undersized buffers before mapping, as gma500's
gma_crtc_cursor_set() does. The check precedes nouveau_bo_map(), so the
error path only drops the GEM reference via the existing 'out:' label.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 500fd77b87d1..0393025baa64 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1000,6 +1000,11 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		return -ENOENT;
 	cursor = nouveau_gem_object(gem);
 
+	if (gem->size < width * height * 4) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	ret = nouveau_bo_map(cursor);
 	if (ret)
 		goto out;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-nouveau-nv04-cursor-oob-ad2b6001de3d

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

