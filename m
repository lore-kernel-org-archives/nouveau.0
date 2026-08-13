Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BFDC5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 13:14:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 828D210F32D;
	Thu, 13 Aug 2026 13:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ElE7xhMM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D246F4772F;
	Thu, 13 Aug 2026 12:58:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786625884;
 b=AgQ1P8Cw+f2Ft4q19D383MrYbY+iGac4N2bKa+oS9/JYWPBxtbZlkENIf8KNzbK8kTLC3
 JgwO89DpkOUn56BLgkIKZrPQf9GvKNLg/0Aekjf0SOVaUUzqaCAzc6HbI9H6pqDFZ0UBEkT
 xK0xx1CJIKjbFTpV6EHCS/gooUrgabeYvgxJnnJqK8QvWHd/7rXSrirduFgKPP/qGfcTDtv
 R842T7a7CsDy1Ws4F53AmLFt4arYIHwoqeiLJJxsdN7W07VMJw/2cljqCqSDBSPssnj9Rvp
 cfXl94BcWkmrWb3UR8pU5/J+IfdJTGD1JeGNqJinnVcPb/kxcELZhT4JgoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786625884; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lMjx6F1TSzytJZWqY2HUhhf0vDBC3SrSTqRCJ5oQEAA=;
 b=Ydqp53v9KJmBADbyivE7VQOIw1+RudpTDzvNv3pIv6qKhrF0q1BN7D9d3Zecg19gjWd7J
 xvLSXZHRBMcuAQqUWIcdFUKIyUutzgNUymYt21jeX7ByBeiz9SbGW2VKDk7Ibv20bBOqiZw
 HKjmcJreGW2AMMzFQzSm07zmMtultbhOtLnY07vI1DNml6BG9QoFMChyNEZVMWZzZnKpJyO
 zFeYoCw7VPKCyx8LWsHxB/OIVJa6eHFoa76QW1E6zdE6Lyn4mnwxBc+YwVhW7xi/zILn/Za
 K6O3Z/Afj9cPFXvJLpFetXAotA/YnV9Nc07NmxMKcYrOpJT55/U29RQZdf2w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A2CB476ED
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 12:58:02 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBBD10F327
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 13:14:21 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-848761b5897so987239b3a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 13 Aug 2026 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786626861; x=1787231661;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMjx6F1TSzytJZWqY2HUhhf0vDBC3SrSTqRCJ5oQEAA=;
        b=ElE7xhMM6sz1kUM8nPg6CLW3PG4/HS7Be1TbJajZIw6xdBiY8hT8+4IyMCkDfx54lb
         rRml3MjW5f0BAVLs7k5tZR+Xgo4I24ExQzkOQf7UVdNny3VYeHUZwOZbIBDLg2mgw4hE
         FcOqvRfUU2LrPw4ZWNbx9iW81dSdMNrZPss+GEcDGMl0V9KlKUD+1no+gevK82B0ncRf
         Ur2ZU7B6ic9iNXkklr13mspkWibkGNfCWe1GF0Z3qME1c57updmRteozgI/Nq/3/SCRo
         +V/d+oOXhlwQsmG7Q6iQffpzAAsSXe+b5NS9hw/3tgj5YtNd1i8M8ytkMeGTxVKNRwdz
         ZkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626861; x=1787231661;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lMjx6F1TSzytJZWqY2HUhhf0vDBC3SrSTqRCJ5oQEAA=;
        b=Q+jLFp+3tXI7RI0f9q5fjZqtRdAEuNXNBV2fA32WcmDPkBHxfKch1m9lIgO42qQCBx
         dwijbmAa7MabkpuwfgEdesITzzuXGMMQ7+M6lA4hS6c5BsBPOKBJOG69Y8Ji/nAirYz1
         sOm1iQm3tsYMKrB9fxfmtoDxM19ZuWCgUba0D34mRGQgRKsuNSYlJGCQPmctuCj/DPCS
         Nu7jTDzJ14ReUzmwg9OmWfMJL7l00b35Ro2WQHLhW05goIEE5JpeP5iYg/kZNWJwjwMl
         VK1qAExZKufBwGAwOqx4itcFZcSwfB58ooPj69p10uj7XhuMqwneyLcwt22kMM2/ZNzN
         MC+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrffL7IO7m3M1GwxlVm8bzCX3FydOozIIhir7FVLe8UE/nXuCxfPq3wXECsCY6+0+SP/wzR1ir+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN0pREFX77FgZ4tZBPqz7W9FZpB8eGAoQWnVPz+ozA+9Sq+x3n
	qg2GqSziHGQVVruqRd1BsbQg0jnq57669TfWICaMUTt5wHZQFlKtyQhD
X-Gm-Gg: AR+sD10GnAK0V/aNDanWbCa2DJjho3S9tATQbKjN+A4RHNH3T1YhIswY/V5mfl2WNLS
	IX7g/lmULI03NoPgpiMI0VxcalszJgcOJnjTwB0B6bmnJYYF/tWIyiz3AQeKxu18L7Xh6tQ3w4w
	fqeCitV3ZFEmbLvA0vquZURxrOsRNkuQ8OoPFayWpK2mpHbxgSvRzlBhZGKRJTDxgJA2G3XmwtH
	ThYfZ4RRrya4xuyK15oS2cAkhFs6X9FaP8WV68I5Uc+4pMe6jO7I4QzWd5bh+LyPpjZIUom5j9S
	RBK5DpZsgrzaBDEtxGYRXHOMdVgJq9I0MoAZFKctJVIMbShHF0mFW71kUcKpu2WLQDsR1MIRFLa
	87NYbFxFs24pLI/X9v9sfjEb7S/MlAvmzXgpNtnbUNyB+8+qF27x+ohny8nE+n5E0GWZbcgMmT/
	NRT2gQFpMabHCFpDDqCgF9DFJQjAf0JQFuMLyIcvXd7rfEfPhRFbhS0E2IsQ4=
X-Received: by 2002:a05:6a00:124e:b0:84a:2fff:ced2 with SMTP id
 d2e1a72fcca58-84fc7694568mr5608723b3a.35.1786626860773;
        Thu, 13 Aug 2026 06:14:20 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef6a4a4f5sm1084669a12.9.2026.08.13.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:14:20 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Thu, 13 Aug 2026 21:14:08 +0800
Subject: [PATCH] drm/nouveau: reject zero-size notifier object allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20260813-nouveau-abi16-notifierobj-zero-size-v1-1-20dee38077cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB/DfWoC/yXNQQ6DIBCF4auYWXcSkUhJr9J0ATLacQENiDEa7
 95pXb18m/8dUCgzFXg0B2RauXCKAnVrYHi7OBFyEEPXdqa1SmNMdSVX0XlWRrTwyJSTn3GXwcI
 7YR+0tTZo4/s7SOmTaeTt//J8XS7VzzQsvzSc5xcN0nxlhwAAAA==
X-Change-ID: 20260813-nouveau-abi16-notifierobj-zero-size-5d3888d36b57
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786626855; l=1998;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=f/7hmALYx1pUavsqR9dX4xDKx4SJ9Gehp6aIWoZk6lE=;
 b=JzBvG33pFgsgUZm3gcV+sluPbY85ddmYsDyvCdNM9M42adhFWTnHbKTyJhu8MgcNPFlyRhplW
 /1cni1BqMUkAfpVfdotWiTvDnbpRubL+xOM++Kx3OqwfdikGFXjDL70
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: ALW3SAJBHLC4NZ7Y3HTW7ZIJQYH2LFRA
X-Message-ID-Hash: ALW3SAJBHLC4NZ7Y3HTW7ZIJQYH2LFRA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ALW3SAJBHLC4NZ7Y3HTW7ZIJQYH2LFRA/>
Archived-At: 
 <https://lore.freedesktop.org/20260813-nouveau-abi16-notifierobj-zero-size-v1-1-20dee38077cb@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_abi16_ioctl_notifierobj_alloc() passes the userspace-controlled
info->size to nvkm_mm_head() as both size_max and size_min without a lower
bound.  A zero size satisfies the allocator's "e - s < size_min" gate
(size_min == 0 makes the unsigned comparison inert) and yields a
zero-length node, after which

	args.limit = ntfy->node->offset + ntfy->node->length - 1;

underflows (offset 0, length 0 -> 0xffffffff) into an oversized ~4 GiB DMA
window.  The dma object constructor only rejects start > limit, so the
validly ordered [base, base + 0xffffffff] range passes and is programmed
into the GPU DMA context.  The ioctl is DRM_RENDER_ALLOW, so any render
node client can trigger this on pre-Fermi hardware.

Reject a zero-size request before allocating anything.

Fixes: ebb945a94bba ("drm/nouveau: port all engines to new engine module format")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 291203121f0c..8d139bbb2934 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -660,6 +660,10 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
 
+	/* zero size yields a zero-length node, underflowing args.limit */
+	if (unlikely(!info->size))
+		return nouveau_abi16_put(abi16, -EINVAL);
+
 	chan = nouveau_abi16_chan(abi16, info->channel);
 	if (!chan)
 		return nouveau_abi16_put(abi16, -ENOENT);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-nouveau-abi16-notifierobj-zero-size-5d3888d36b57

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

