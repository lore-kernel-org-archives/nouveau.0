Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C9C5AC80
	for <nouveau@archiver.kernel.org>; Sun,  9 Aug 2026 15:42:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6501E10E58C;
	Sun,  9 Aug 2026 15:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z6cVKASU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 573B54765B;
	Sun,  9 Aug 2026 15:26:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786289202;
 b=NJGoqi/sDul4cQ+YtO5bFzrtHMHDjEJNTBRQHY3HKI5AFA0Ziqjw+iEfRvNsPLSeSVBRH
 h1q6HECmPhC3tQ1EPz5FOjHbJIQFb9gZnUZOiuXRihaJnOEna8KHrPP3FTb//i/MkgOZ7QJ
 5Ejly8dC2xcYhtZ7hoQSHBow7Ll8KZtnaI8UT0FF0VYa83R53GwYHNuMLoqn9IqZv11ZoYY
 OFBnOmF6GYblEBsuz2VGExHJ6uo9nVkbVCBmFrI98qm035zwtWqbIUr/7rf1/BaUGJ7Jw7X
 mzl/cUKY3qGGM4tOdssYwUYasCcnNeH+sg3zB14y3h4fNMSvTYunfbpjXtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786289202; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5x4mrfTwKDCuKeGOKJh1sjTyl1+66+prXU9ablIRt+g=;
 b=pT/FHqfCWFoGVZT4Fp+m/mXGTHs7qhcpLlgTO7vE3/fCpfxlvZvgZkaiDpGRw5TcUxwGa
 WibJj9vhRKpKFwepMUxt+QzqYAIR8A4fT9uxSkDOdyPbym64HNpnWx7P6PFQDoS1xsk6WNE
 Y5PXwcxD3eHqmcngP33VWmT2U7TKGIalPnQs0HZaxVJ5otrOW8VN4xFivVEu3XYp/8xSqix
 575rXPCyotK1rel5acUYGCs3R39fPaiByzSezqRNoAyYOH+DvQM4Z/+h9FlHWxYecaBJDYj
 R+lA0b6qw1bBftA70YJhktvegJSyU0csZKMc3kdkSAYgHOjQwEvDBeqBqirg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 432EF4721F
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 13:25:50 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A17BF10E039
	for <nouveau@lists.freedesktop.org>; Sat,  8 Aug 2026 13:41:58 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-38dfe910e9dso458061a91.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 08 Aug 2026 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786196518; x=1786801318;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5x4mrfTwKDCuKeGOKJh1sjTyl1+66+prXU9ablIRt+g=;
        b=Z6cVKASU594RsbR2tHm7FGkQEozqNNAqz1g1Zjd+Rcs9EMTUUTi9IvbS2HMNIjO13h
         VmeGncwPCGwgg8i1L+4yqZPOtTIh5aVx3MemxI7rOY9DMkRMF3KzQTGdo4W7R7Jp1Kwb
         cZFxPBPf02AHalRh7DZNwqXTuz2zeZ/yogWl7fUaxQaI16MP5wBRTSN6Y9Or7HEpG852
         R6bMQ0+9unAL/qOKh/2gGwTbzBA46+cC2eXD+A0Pov5s7zveASqNoVC/RQhb8NihglI9
         tgXjljZykFhcgPdmzWh6DAymqc11HiyXnUmtGQaFsvxa9cjjAnQiSYSdkKNfBMat2GK6
         kcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786196518; x=1786801318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5x4mrfTwKDCuKeGOKJh1sjTyl1+66+prXU9ablIRt+g=;
        b=m/d0zJq2he5RECGVPgzIuGIhCIW/wAAI7WBVu8UnhESWRFvLfXq4DLtd19bME2HMj0
         62cPFKVJta0Y6IzfEIkYLZ+EG+8MFkAKPNRDykfDHDD50TqW/TltjBR0Bxno+nRq7F8k
         ajth2AkOp+M+70G6FErYVTqAYgS1OiTXdqGF1BvuKJcNWWZcK/ApuIQJFoTkKx3ISkmB
         TFXIUFMt6ApgEyDOm9ETJa2+252Q0Rwzap8wEfFrEB9wWwFbyHLWzq/eC38uMRS8gwOv
         m+Vb/jTfOh+bPw0rRF0xmA3KkKj4OXbO4WHkiEDgom1c6UB5zwkGnfjxCtKLr+EPkiJq
         M08Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBwxFEaDTOIgE0xBsJhMWsjb4pHjpPg8U6/vhfBO4rxGpWGt+zAzgJKdBfCfk5bEbq5JGt3Fe1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPoRCLKTIQGk2/zACY07AAhOq/Tk7Us/egGQvoKYYOa2kI6GzM
	doetDA3gqO93gN1VaYpd4QnRhrNjY/0obbEl1FQl+i/I3x7b2n1Qfr2O
X-Gm-Gg: AR+sD10CEtHI5Sa55OsakhMewXiGJMGFvzGjhAiiBx5sKGtgwVoNXzGmEzhomR3T+K5
	wuPSDZKq1Diqqhjbxzn1pnBvNoh0JlDG3GFGl9QNvyNz6SN3yxFv1BN0MlLZo4V9Kuv3iT1N2rd
	gkjqX3iuIGH0F/OdWjs1KF5JDIb963Grf3n55l7Cj8jUdDG4fp0UgjfDKd2YSFKEmGSziJ+T1/9
	CSO8qhBypDWfdlB5PEammmrSr1DC0OYJEgPcUvJKabevVDeS1dxgA5tuyAN49PDk6JqaoG2ApmF
	BhxA3iGhltrTlGoMuXZ1TpAvfTVNNQpHZT74ZR9hEpRs9a0hD1T9oS1YfIbtBjCQmi3mlSaQ3qI
	HeFXTrNy/l9WIUpdcFlqFsGoJTTu9Zi5tuRDNMfVX3fYqXgD4Au2Yn+ov3zhKqwU92gHLRRPhIv
	mF8oUFlW50KkZ34hzthNiO+Y5VGKd9KH6X1wLd0xhUFv39c/G6/A==
X-Received: by 2002:a17:90b:4e8d:b0:38d:ec31:4840 with SMTP id
 98e67ed59e1d1-3903c5932femr32396260a91.13.1786196517998;
        Sat, 08 Aug 2026 06:41:57 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3925fc6f13dsm6278888a91.1.2026.08.08.06.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:41:57 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 21:41:37 +0800
Message-ID: <20260808134137.2864847-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lgs201920130244@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: CQPDYEIBB6YO6P4FCPOOZ7F54XR2HCRU
X-Message-ID-Hash: CQPDYEIBB6YO6P4FCPOOZ7F54XR2HCRU
X-Mailman-Approved-At: Sun, 09 Aug 2026 15:26:39 +0000
CC: Guangshuo Li <lgs201920130244@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CQPDYEIBB6YO6P4FCPOOZ7F54XR2HCRU/>
Archived-At: 
 <https://lore.freedesktop.org/20260808134137.2864847-1-lgs201920130244@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_drm_device_init() calls pm_runtime_use_autosuspend(), but
nouveau_drm_device_fini() does not call the matching
pm_runtime_dont_use_autosuspend().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the common
device teardown path.

This issue was found by manual code inspection.

Fixes: 5addcf0a5f0f ("nouveau: add runtime PM support (v0.9)")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e16f59b00f6f..1579a4b0785e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -585,6 +585,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
+		pm_runtime_dont_use_autosuspend(dev->dev);
 	}
 
 	nouveau_led_fini(dev);
-- 
2.43.0

