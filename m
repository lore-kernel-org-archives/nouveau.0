Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C21F459F7
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0810E9AD;
	Fri, 10 Apr 2026 17:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLMbyOxD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B93A457EF;
	Fri, 10 Apr 2026 17:25:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841921;
 b=qsmiTIr6JYuWYdhBTgaS7OaUyPpcObTCTmyyr0rLHS4uQkOco4hKP82DyQ10Xo6ZM7VsX
 x6TNfYmPbVPIrlXFJaTYaaZPbqhOFVcPR/Q5AWBUACRCitcnyAPJbp8a6cd6OflEbZVZ0Oi
 97ZGT6DAjS9fiGIpcp6CDsIxxDHFfxX16+i00Hjzuke1fN3adibpExUp3OLr3T139/FoMr3
 QAaRmTFMjIO1YU9WWLoCy/ujUSLWMca0yUkiuI2Fm05nHqmYzz5DCiGyS3mm5DZspfWc/ri
 gpnXKUlVNvStS7kvZ+85oKR9+ONqEANJysHwyV9mKvowNWSbinMwEYeHfndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841921; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VouOEuCnHvjyu2RFuR8oBB76e+Jzifx7Gza9ra+kGWE=;
 b=CuX/AdVNTsgVHv5bEnk9pQyrAZcUmI75o7menb+f2QQzlkJI2MGsc85XoOL0r42GfUpYT
 q42m5/LTGokkZeRqjk3rREMH+5c0mIWvQGFl2aLkPnD0TBAb6/LUNUhbAdpgn6SIeHo1Oxy
 n++ldqdf8ataoFWaudbiMXIsnJWcLkGg5FMLwhmBWLC5VlBVo65VGYog+5gczq5K8p52cwZ
 ymNG19fUbvSSXnPKcf1HZW+a8LNWMPKf/96I/kDan2l8nKKi6+udiujBpEuuz2JXIA/Elwk
 CngXt5LtLU5U1HU2q8Hl1TPAgXl698MepCtBZ4y/zSKmEDvdWE8mGa7OVq6A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5F044451BD
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:09:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A710E04B
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:21:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488822b93c7so1263875e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755289; x=1776360089;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VouOEuCnHvjyu2RFuR8oBB76e+Jzifx7Gza9ra+kGWE=;
        b=DLMbyOxD8QPzq1n1V1m+xswI+8ssq69vQWm9zzfrnppoLGs1SsssYU4KD+U3taOz6Y
         pKRoRYcU7IuHK1HwXhlmXelCzSNoTnwZM1hn9lLABous54Lj5nfE9yj7W3+L+/TlMQrJ
         Te4sPw16v1zBMjhnYiCPEhXoObKHeyM9isNfCpeDowHPOdBH7ipliqquT28Dmme10l05
         FSF08K9wdffMAc/mV87IYOy6r+T5CUfNc0h8mT0yRh832AvQPm4YVEI8KTwAV8A+4JHe
         WqKNsL86idm5Oz/OoBDn9vX7bFjcDglT6VaHqiodWmxfUU913Nq9O6Bgb+40kj2EtMLC
         8MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755289; x=1776360089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VouOEuCnHvjyu2RFuR8oBB76e+Jzifx7Gza9ra+kGWE=;
        b=MAX7LmCvjEBIiI2thewrX/H3lJFXPFXV95RQFiTrO7fQUGPB3FxBYq4bjCVf56+AQU
         Txz4NDJx5McTaw1gguGn2LvS1jBcLAbcsSERwjYOTAWwMIEipmFxT7/LGjPEHk4X8rGF
         5ajX2T0FdZ9ZlOARcmoPRN3T6F9m7VkL0Ipt/WDmi3r9kHOSHZAiXyn6lBInY/rKoTka
         fp2mPt+KG/kBkZ0/0rgJR2v6xhakCO5x0DRojOqzsfXe5uRih62RQCUOdo3cvdL3TQk5
         gLJqnpzKN5TDp+EEXiyPxXo0eh01aE+hmQ+qZRNDcWzl1/al0GmObuy04bzuexT4fVWS
         Y61w==
X-Gm-Message-State: AOJu0YxLZzfwngF+dWtWfvPD2h69cPhMvnPZ1B/rId+IgrQZrUak4gQG
	I1yGB9uHlFlO+gKhkTNFMsfJF6820vUsCtU0eFNjpMtf4jYcMhwO2ZE6M7rebxsxq0o=
X-Gm-Gg: AeBDiesfJKO/6Zd+81mwDYlAKNCWqcWDssEaYGnTwd3Oyuurie43vmrRptsJS3Ajxlt
	IyP93kTV4BUOeAUYKTvhV8YuR/ZMTgucXIg0rlYmUcPWo71jJzjswZCNF8ABy8ZZVApWDJSYhl6
	gvVZ7e8+LGH6fJkeAfhBkAvT0+Phg4crJfyckplAk890xb4y0jURswJ91ROJP/Ko2zIb2Ao2jU2
	j/Zb6BvAUhhfPSpdZ1ee0APubs30a9XkBIgUCOaaEEjWI/8K/krsRJzOaMCV4xxnNLeNP/zOHE7
	zbK04fA3DIB1TlVh1jF+l02vhFaIOcZrWmX2dnFjyQ022pdStlMjnIvSJxYx3mtLv2BaQUTcqct
	+MEf4ykMVLF9zv15k3gQ4HDbCV2nCO80mB3skQEtCbdRh3ix6sSuCs8Ty1z9Aub/6dhDoTsOrny
	Tpp85MAj9FiRStqGYGMGgbpc6vRRU55Z+ePidS4ou7eqyS9wBcsw2903kfoAL0PS7dR/EIwVudw
	N4jjwAVsYmyX6y98xsxWRZZ
X-Received: by 2002:a05:600c:524d:b0:485:c456:5e4f with SMTP id
 5b1f17b1804b1-488c52b42a8mr64500175e9.0.1775755288741;
        Thu, 09 Apr 2026 10:21:28 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec090sm367345f8f.12.2026.04.09.10.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:21:27 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 0/3] drm/nouveau: stability fixes for NVAC (MCP79/MCP7A)
Date: Thu,  9 Apr 2026 19:21:23 +0200
Message-ID: <20260409172126.115441-1-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: PN6QRTLRTW73MRSUUOJWSKGBW4R6PY7W
X-Message-ID-Hash: PN6QRTLRTW73MRSUUOJWSKGBW4R6PY7W
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:18 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PN6QRTLRTW73MRSUUOJWSKGBW4R6PY7W/>
Archived-At: 
 <https://lore.freedesktop.org/20260409172126.115441-1-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

this is my first patch series for the kernel. I'm running an Apple Mac
Mini with an NVAC (MCP79) chipset and DisplayPort output, and hit three
separate stability issues with the nouveau driver on kernel 6.18.

The patches are independent but together they bring the NVAC from
"needs NvMSI=0 workaround and can't run Wayland" to fully stable
operation with MSI enabled, working DPMS, and functional Wayland
(tested with Weston).

Patch 1: The MSI re-arm function for G94 uses memory-mapped register
access (nv40), which is unreliable on NVAC — the sister chipset NVAA
already has MSI disabled entirely for this reason. Switching to the
PCI config space method (nv46) fixes sporadic FIFO errors and hangs.

Patch 2: nv50_sor_atomic_disable() dereferences nv_encoder->crtc
unconditionally via container_of(). Under Wayland atomic modesetting,
the CRTC can become NULL between check and commit, causing a kernel
crash. Adding a NULL guard fixes Wayland session teardown.

Patch 3: Transient DisplayPort link glitches on NVAC cause unnecessary
disconnect/reconnect cycles. A single 100ms retry in the HPD IRQ
handler catches these without affecting real unplug detection.

All three patches were tested on the same machine (NVAC 0xac080b1,
DP output) over multiple days with DPMS cycling, VT switching, and
Wayland sessions.

Thanks,
Marek

Marek Czernohous (3):
  drm/nouveau/pci: use nv46 MSI rearm for G94 (NVAC/MCP79)
  drm/nouveau/kms: add NULL check for CRTC in nv50_sor_atomic_disable
  drm/nouveau/dp: retry link check once on HPD IRQ before disconnect

 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 8 +++++++-
 drivers/gpu/drm/nouveau/nouveau_display.c     | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.52.0

