Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F19AC5DF6D
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 09:17:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57810ED97;
	Wed, 19 Aug 2026 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HJOgebtM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC9C047970;
	Wed, 19 Aug 2026 09:01:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787130064;
 b=H/NETl31WdbRR/40uKr/8bVE4o/W3mrj7B8FNiBEt1M7iIulvPUvxOD6BAgDVRWysyjfB
 8TOj/N48EtIngX9XLDoIpRew0jDZoSFA+RZFMQRew6ADUiTcGkUm3RgPpZbe+VVywKSD/5J
 XjiPr1HRj/MKsY6zXcxRUuysECWxncNhuaHgxcvt4u5vh7XozW3sowtPmilUznee0GFUsU9
 o2F2NrgaYdGxGTdekYulSP7qOMKlS3E6dT90EhDnkvotSR4QsTjALNg1hyE7yde4bi0vkon
 /f/vIRNIdUSE2Co3HHkJuJfHVMkBvb8RmycMB2gnpe9cJOr7tnrsVQ7/I9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787130064; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HgKYKxxGawS+Y3KPMd3fgnzXO0x1m/t52oc7d3V1CPs=;
 b=QXi0SDmf6X+UdTixLRAqh6gTjttNapkGWyj1FllrNxQWkMofUzAd5Q2SZLR4TC1ZddosY
 tJPzDu/E5gRYloe0bUHSuuBiBkxPIM73FClAAT4++NHX26FNG7h6eiTBZRYSdCREbRAiKpo
 aPIyjVTye/iMexhZ6fGQt2f86sp/fWFJikm5vFdKm3FcPbYDuG6+PLAef8JCRLHOAtT1exG
 KE2GKli+xB1sFkhRVe9/vNuXf1SaVhVSstcy94plDSBxl152u3j/fKj+7uKQci6twD5Hn0g
 r9e32IKZ20YmuQSlNZedLSgdjnXpzLz1syGoOKuXdZWfPpjb9hnuZqhEbhtw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7AA46478BE
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 09:01:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDA7010ED95
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 09:17:34 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so814484a91.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 19 Aug 2026 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787131054; x=1787735854;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HgKYKxxGawS+Y3KPMd3fgnzXO0x1m/t52oc7d3V1CPs=;
        b=HJOgebtMfKLpxeGYBTGfMLCv1/HTpg+0PbBUkw7ylLazj+/ujJXJ4mhYfM6pbj4r42
         xJqjah6zcXAoAFXm+VM3giPHwOKKwBdRWSP+cSTq5DaH9b+H0z6SG4CCzK9blFfzZvs9
         Awi0usFutcSoMp6WaLR+NI2FVGg+URQi1SWU9ggXr4RSPG/CoC3SBHB+BUS5nflUzXf0
         H1OUMMhJEBnVPVU3C0tYoivu6DCKeZfM42UXdE9XdNYMRq/c1bLqLmYSrAMVtBcjo3GA
         6pteEsDKWAX6lUs2rwj9uT7LcCZWBPMJwqUPODuBFKvg7Z/N0jqV6tjes9V2zzicbNNp
         QCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131054; x=1787735854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgKYKxxGawS+Y3KPMd3fgnzXO0x1m/t52oc7d3V1CPs=;
        b=qXvzUqXsb+nV2GDCfkOok9I56yfl4Hb6DGYbqnSXVUfHYaJ0zCf5AkVIB/eLBvm3BC
         FRL8e55FkqknjWPzJEXzI0em7l2rrUV1wtkxqGjwkS2RO547Fqaaj2ptHDFUl1pr6Rls
         K/GZqgIXvylJSLyuufBSueD7mYpqszy2t33a6r0nJRXWUuyOvDDUMbdBbkYSHDn8STpS
         fJ0VcoxDFUY57K6kPXUJ9NMCXEf0UZcc8cBFJZPgXT3FOob1pCM3qKrSFkbyng+ArK28
         QZBBrBlM+TXOuZYFsxD96cOzpXYjK9aGroE3xLiU0D4InFRGShLjQfwllx+nHI6NOSzr
         pYRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoBCbAs4K+S8A/WrXnIapKF3+LJTLaszbC6XbiaKoDhK6aKLJiYcCwQRg455bPQDJ/VQSS5L4qp@lists.freedesktop.org
X-Gm-Message-State: AFuF++nnJXsm2C///9CL5m54OZ/AnwOdjGy78YwkyGWmk750a6yqgH+M
	ADhHwD9cDSyUKBQmqTAFAumn/kgKqN68qHzlvsQfIiyq8fv7ZDXJVZzP
X-Gm-Gg: AR+sD11jkhvJCA5EZWv/htE4Zpz7n+2hgEW2BFcQ0ZduGeg2VG0Ykkmgt9N1EWxIRCr
	EvXLdDKwRJmev/Av14Sw595iJayYL94HMRsYIFYp+EHdsMQfJpzxcCklRy9ZPcGE8geTCwKIjSK
	tVmTasRmxKP20x9SI8NkRNVxMwk19oWbSGiOLlGrtccoA65n21ygd9/oEZK7yuFH/6UbmLe4z1Y
	dA2+BeGFJsc5Ct/Au+OzseLkqkXQnDTHZ78AON3l4hbqsC9fjyYKmqQZXsSWvyWdIKSJ4N9vq3e
	ijG802rpXhP6VwMw7dhV6IloetVGKaQsyynZu6efW/sKFp2HhI6cvtioTj32K3y+rYXHPUJyDLD
	5pyexAeAPSJlu8ttQLVN8b4plS12QJDA6uxvxdhD8j5PaYhGzjqfBk4nI57A1quXhGTqtU/nHHG
	WKoaUsceXHLcB8F4iD0FgeQGzWTB8ChqvNPBviikg3TIfrcnVU3XyEP7Z/o4MarY2cZpeM0w==
X-Received: by 2002:a17:90b:4e8f:b0:392:ca3b:370a with SMTP id
 98e67ed59e1d1-39580a50d67mr6579598a91.2.1787131054307;
        Wed, 19 Aug 2026 02:17:34 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.101.42])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb30541sm1875737a91.13.2026.08.19.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:17:33 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Wed, 19 Aug 2026 17:17:01 +0800
Subject: [PATCH v2] drm/nouveau/nv04: check cursor buffer object size
 before upload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-nouveau-nv04-cursor-oob-v2-1-63eb8d0c847f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIx0hWoC/4WNSw6CMBRFt0I69pl+DBpH7sMw6OcBz0hrWtpoS
 Pcu4AIcnuTccxeWMBImdm0WFrFQouBXkIeG2VH7AYHcykxy2fKLUOBDLqgz+MJPYHNMIUIIBrS
 TpuVcOFSOretXxJ7ee/ne/Thl80A7b7nNGCnNIX726yI27/9LESBA9QqNOjsplLsNk6bn0YaJd
 bXWL7GoJb3QAAAA
X-Change-ID: 20260813-nouveau-nv04-cursor-oob-ad2b6001de3d
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787131049; l=2269;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=yKd0NOqvnUZEXHXx+SmVyZErpDxsdELkJs/BqkIVgrQ=;
 b=3C4upJJdGASxXPTYB5K57J6xhcml4PoXkh2TeciUednabbD7qnhs5S1jUJs0UdydjzTeemBIR
 b9h0HYcOlVFCXGw7fZOCKq5rljXg9qF9dLGLhCHUbCGf4C2W8UCaqMt
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: YRL4PLMQ7OOW4WRTUDIV6IVZEIIG5KWU
X-Message-ID-Hash: YRL4PLMQ7OOW4WRTUDIV6IVZEIIG5KWU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YRL4PLMQ7OOW4WRTUDIV6IVZEIIG5KWU/>
Archived-At: 
 <https://lore.freedesktop.org/20260819-nouveau-nv04-cursor-oob-v2-1-63eb8d0c847f@gmail.com/>
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
gma_crtc_cursor_set() does. The bound is computed with array3_size() so
the width * height * 4 product saturates to SIZE_MAX instead of
overflowing. The check precedes nouveau_bo_map(), so the error path only
drops the GEM reference via the existing 'out:' label.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
Changes in v2:
- Compute the size bound with array3_size() so the width * height * 4 product cannot overflow (Lyude Paul).
- Link to v1: https://patch.msgid.link/20260813-nouveau-nv04-cursor-oob-v1-1-3f3eb37d213d@gmail.com
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 500fd77b87d1..07251cf83df9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1000,6 +1000,11 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		return -ENOENT;
 	cursor = nouveau_gem_object(gem);
 
+	if (gem->size < array3_size(width, height, 4)) {
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

