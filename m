Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABD9C5DF6A
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 17:31:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75FCB10E231;
	Sat, 15 Aug 2026 17:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOMxxLTe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0724C47843;
	Sat, 15 Aug 2026 17:14:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786814081;
 b=wzSRR8eCMcwYDqu4++/PUXvYS1ZYhftF4jg7th0d/xzmBoXXHvnQ1aN684hgwaGlzkAgB
 8uI0dvYQoBFvQm/7ygsrLwnrPqZHD6PKDCEnaKrSC99yTmVbdtdyZphcdrloZDwkxzI4ogL
 BMA5K/1T01tJu93kIqxyaWHk96Lj7/w7jhGkLElYi5WUo4ibHkzedVJJU6SGXlunsNBkhj9
 aj6WSUYUosmKmvVrcHQkld9zRMjuKANhRVTlEoNzysPKqkicpDmpbHSZaW2SQ1+bp99eKxV
 5rcgdrENWdv3ndNhUj8eoXmKBMXeXIyMB8cxddIW503gpk+EoQokhHkvu09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786814081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9eBdlB/mya9lLTAlc5ou5OAcHoUR69Q2TaK5PmrsA1I=;
 b=1AWs1yKxHprV9kuGK2gafiPtyXE+i4JTlHoGkx5xscKDZlw6yWxtIvZ7f7epFPLv3UTLJ
 NjJrfcUe36g8mbd3jGQ90xgVjeBBD9ZrwKyieRhhAfJ+6dvzXIbRcW1fS/az9TuK88Quum2
 cOs2aa1bbD+3htO2dCIFVhx0aFcYs5GCNxtPNg06JRR3NgA/LCPJMsbCCH2o3JPuYIvNY/U
 j8YFDAAiCkMbAJ2lOu/PCxESHzqESdEXH18nE04jEluj7lcgkLlzzVlX2lx+hwCtjbm1p5e
 S0eoEBmj3h1Ep2wYwWcyq45Mr97B8Yb1c9RRhEA1tEAV6AURPAlDwU6iQ8XA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E984447837
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:14:39 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 466B310E1EE
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:31:04 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-6ae9b721927so1388026eaf.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786815063; x=1787419863;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9eBdlB/mya9lLTAlc5ou5OAcHoUR69Q2TaK5PmrsA1I=;
        b=SOMxxLTeAMzIo81JaFV+EJVHEnRL5u5dKQ0z+aACqFp54k5kmQMvZk/rL3fit1v9K+
         zsyzgNaoxZzT8qkqfPUgI569MAHKKr2LuYungVW2Ogh//7+OPqiJznaryoJCimhTQnqC
         iBGqqvs6vLPEvKlAL7uVI31Y5XCsenc5tqXJW2z8rYt4ziPD6lLMp0RMHWZTiiPHNZLS
         irhTx4PyR00cnq1E/0SVSEW9bwF3WCq3S78P1uR503sRa1D1Vxm7iJyCRevOAluSbsFA
         +If24aaSxIdjVp6ryq9AXGGqWCHc5GnTPabyQ/cpP/8g2LZDaj4UqTlCphOQqOw24lKX
         4SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786815063; x=1787419863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eBdlB/mya9lLTAlc5ou5OAcHoUR69Q2TaK5PmrsA1I=;
        b=km/hBum+0A5bakVKp/+A2ce0guwtG/x00mVaIvxYEbx3z1+97HAM6JkU53JTSBoWTZ
         F/firUA0mCE0dsYonq4CV3ZXmh4Z48MEBm26CyqVeguS5G27Tn7A5WEuwD6nxSQ+dA6V
         93HMIMFndOZI9jp204f7HMZyEHU4ZWbz4JVszZQ+ofpYWmEa6iI0UTICU2E6K51gtAfh
         6TJbZGxFdGjhdJlmBOL+c6DnMWSb4y+0FgVrRMksizcIE+jj4PPY+bQXH3q00SGmR77S
         WuoXEITWzbKIP8R+J1Sw+JbZvpKaXDF/wppaE3OuNh0HPHGVHCJUbmBpAKfhFzExdr3w
         KrdQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8X2YREYH52JkgXIuuI5yVcLi6HJ+g6mkezLih3gpDjjPcHHWeBzAA5UrynsQbHDRqPv3BRNlQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbVCI7nFJSaqi9/ewUDnYgmE10hNjXlQmN4URV7WJEyVK5BXa/
	EaAhaXUEa4hHMjGDH5i9gdpO6PEyLEGzHb92/O4nPeK2tHnTzO4cHdrs
X-Gm-Gg: AR+sD13nKo/1f7W4v+ah+qMCAXNJuS1iXktDpN+uPMyqRtDLtWSG9ScoK8lVppSjMuf
	FqkQ4mp9uv2I4CuOFs3mrYg/vnMQosObx+BpqUVkCbUTlKi0YnSRWKvKIvlP81FlaugMbgzaMCn
	NhqA6b435SGBCfopKA+fRtd8iGnC6fm++ryB4EOnnb1fat40yn0dFqg4qzvjsfxOH9X4sPB1u/j
	mixdG10G8U57hYhDPWRv5ZkO4krj/Gxh/57vrUFG103pbMQozpJqGU0w7qgi5WOdV41OuMW1NQQ
	qhZ+U2MMdfT11jEKuXLsoUKtI0BM0dSB27jOUxJghLUo6WehVEtsMpBOM1RieUWy36YukzYoQUV
	BTJP0CFqVWTpiD9Z0KSkqf+0K6V5Q+5HKndg6mwk5CmQf1gnR8SUX6rSzb+WNziYKvjcLMeZtDC
	zYKGBGvY22GEJ0PPfTEg4FjSXqUIbLa1pqkc04dGX5vUqZyTxB8dD8mrA832Pq75dHsF7GfLDPc
	iA2Y1ecQswQAkPRlSrrqX9BHGDZZSVa5fbKkV0puou5ry6Cq5iOqCTIFFtiSFsfO4+sQHZNZa8U
	b5KCPxSf5z4ORx0NytU=
X-Received: by 2002:a05:6820:198c:b0:6ac:a45e:ff84 with SMTP id
 006d021491bc7-6b0d6178f68mr12492143eaf.13.1786815063400;
        Sat, 15 Aug 2026 10:31:03 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net.
 [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7f3e86686c4sm4029328a34.23.2026.08.15.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 10:31:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 15 Aug 2026 11:30:52 -0600
Subject: [PATCH 1/2] drm/nouveau: Fix NULL pointer dereferences in GETPARAM
 ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-null-fixes-v1-1-0df9dda951fb@gmail.com>
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
In-Reply-To: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786815060; l=2757;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=MVZDrr9AdB0Vo7KRedm1n4U4GInx5SVFnRzNS1+N+Zo=;
 b=7UtxmLGZFzvMkY6BMZrEvXFUjeGPkc4RBlhqbpixxTBpEjYL4ZS4ob1Nv7UkTpsJorw7B6qKD
 7bNy0uHZI5LBKqx/0worjGBZzN0LRsOe6yk1r3TwhKZosmYiYY6NdZF
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
Message-ID-Hash: ADLNKKCUCWZOTRJQO5GVLVCTKDR7LU36
X-Message-ID-Hash: ADLNKKCUCWZOTRJQO5GVLVCTKDR7LU36
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ADLNKKCUCWZOTRJQO5GVLVCTKDR7LU36/>
Archived-At: 
 <https://lore.freedesktop.org/20260815-null-fixes-v1-1-0df9dda951fb@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When hardware or firmware initialization fails, the graphics engine
(gr) or device functions may remain NULL. Attempting to access these
during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS) results
in a kernel NULL pointer dereference, causing a crash when userspace
(GNOME/Mesa) attempts to probe the device.

Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in the
ioctl handler. Return -ENODEV to signal the missing hardware state to
userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
kernel log without risking a console flood.

RFC:

These crashes may not be repeatable, they happened while I was trying
to build nouveau as a builtin module, with binary blobs in the kernel
image, on a laptop with an encrypted disk.  Gemini tells me this won't
work, so I punted.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 291203121f0c..c9270c5b0fac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -306,7 +306,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = 1;
 		break;
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
-		getparam->value = nvkm_gr_units(gr);
+		if (gr && gr->func) {
+			getparam->value = nvkm_gr_units(gr);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no gr engine or func\n");
+			return -ENODEV;
+		}
 		break;
 	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
 		int ib_max = getparam_dma_ib_max(device);
@@ -315,11 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		break;
 	}
 	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
-		getparam->value = nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
+		if (nvkm_device && nvkm_device->func && nvkm_device->func->resource_size) {
+			getparam->value =
+				nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE: no device func\n");
+			return -ENODEV;
+		}
 		break;
 	case NOUVEAU_GETPARAM_VRAM_USED: {
-		struct ttm_resource_manager *vram_mgr = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
-		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
+		struct ttm_resource_manager *vram_mgr =
+			ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
+		if (vram_mgr) {
+			getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no vram mgr\n");
+			return -ENODEV;
+		}
 		break;
 	}
 	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:

-- 
2.55.0

