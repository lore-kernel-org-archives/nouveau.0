Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99061CD98CF
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 07:26:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A088210ED25;
	Thu, 11 Jun 2026 07:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4GXXGve";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4790546A32;
	Thu, 11 Jun 2026 07:12:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781161962;
 b=rznPajuXYNqXQzkByIDjDCAhql5oIGFgIb6OAYkDHF/V4MSrvLnziuaYKLbF34OrdNNoO
 NKd0k7EIodSgR3abiHGBZ/CGyCwQU7pYqxOwJQymiorO7zAEXNwlBfuAMxOxLRdUsjmHeBB
 ZRSxoHcln/HYrLjA/5TqO8DLcxGDImMGgy5hAggPjpKTSWQfVen5C70yvRJvRSwbZAjKOPG
 aFc+R3x2W6YDjrnxTQEDvhLKirNQEGv6/3BiHr+K1Q387Za3cDckwDnpAoyalY2jyuHDnYT
 EWcMIe/RKspHhx8KEN2Dfrjv4qXoLH2d4r+1BRKLfcpU5knN3GAZlasYt3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781161962; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cO8v5zFPHN391/LtW4mNbY912mSFMxqBdmu1KT2yTyA=;
 b=TdZn4GwX0acgQ41GsLhCezSi4BgOG6IuYcPx3HAf4iNc3336iCYziPZ0KzEtfZvRuhqgC
 zSNGsQpGg3CxwLpxJt/pC3bvW7CcfMYAYkYdsQ+XnaXfTvcIjib/fsvyVuqBnCmeFi8VUod
 sYSTjtaGBzhxOW3oi5Zo+rjVPQZarTM/UqwRqg2zMqqnWT1CScw6+N5Uev9fZs56fLy/xfp
 eEAkRQA1knZ4fwIqk0PfFfBDp9yQV/oSVE7VEdmNkk1nSEiEiL9HnMfly8oYYmNfwgkCK22
 SQtDCYH4kMFLv0uAPTXjx3u+ezy4LFjks137vBsWVf5o/GdGwcrFP49gPuOQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6201E46980
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A86410ED16
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:26:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef0ccccfcso534263f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 00:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162797; x=1781767597;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cO8v5zFPHN391/LtW4mNbY912mSFMxqBdmu1KT2yTyA=;
        b=K4GXXGveA+UkKaTyOz5Y4Lz8tFmjsn/msA3S0+8Azwu3Hjzi9Y3KIVsSaQ7IbVffOr
         vLuftX8Ca3NaLsbdVH0mLyfpCBLUt9qGWlxTD0XJqs0WarEct64jKM2pXgXWWJbk5LTb
         kH3syKe1C/iklZJOVTt64G2TOqluudTwT72A6nkhAbstjkQj+8RBh/Hn/Z57CnHdkCe0
         m7fNS3ml14PbX6gEzNzMNX8o0MBrdhU0UD1/cv4SOc6Ncd4q1lVxGyq5w/D2VuxgtqFL
         FsQrThzmASwUPqrkAYp688kKu5YatNIGgf0a8wqay1Y0zN1X3pgB3/zNwwC4s42h67KG
         l+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162797; x=1781767597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO8v5zFPHN391/LtW4mNbY912mSFMxqBdmu1KT2yTyA=;
        b=IUFl3+sly9+BqbRHIq+KU+HwJFkw89Ka5szWwOMklMBy1KIIeKXzOLmGmJAWuC9C56
         9qUvJoPLacaki78QjaghqTAQ5/AZzSkatbnoXyNOJbzuRojGRxi86lX0PcvW7yH6jbJo
         soVKYeBhoFi8+8tdIEpCI78ObbSvrW9Y6ZJ1HDl1qO63vV+rErbM0IDU3ikzyB+D7wqo
         XL4JFCAYLxxu5fBM5hcc7kZ67OHgZH5ScAEk4RUFkdRaWGKLGnic44/6X2Mo/JRmyVxN
         qZM85AOlkUHEqJMdBG+WshGKIR0GqDn7Y7eTGK5Adv6eRty4ny4vwX8YarlHuFc6JeMS
         1uVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DB7aBr+IebgmxpqOL4fzRgr9woulXV1s0Iy4DZqFaVsSGbOc50D86cxon1HtdJ5TjQuXoHCIk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKs51MkXgDIuvkm3dLJwZmnvDfa5zPx1b0AClrtyDouPfeKHLy
	EVxjEAc+6XS4Wt39PZ3qjG1sG09CxADNa1V61LL0VpRyInqCyuGC8omR
X-Gm-Gg: Acq92OHlqUZpn9nbvBQVUUxbCP07Z9s3otjve+5lnG9pRTO5mlXgyP+2kasoCi4FJMQ
	po3DcjOS9XLJWtp30WLTNUVEN+A1kHvD9WIDJoDrKB5j+VhA1yiuCuh1pPewJGYQsnQIjJavPoh
	ntRSKtDTaRdxyNtqiz/+O/81MJctBfbV8TMMFMm4xWjLHV+d6exfEwBzLzexfKY+QSAtzquuWkV
	h/9BhjVNb4BM/SlOjpt9xH1P35cad1XhFywhVAEMdGc9aqtIKXJsOoOF/MSzgWTfs1dabgPV8HF
	h6zJtqJKOzOWiBfbyi24GJI+Kmy/WW0UcUE4umdOo+Sfjwxw1HH0/6u94jGclZJw1rVMvi/8BdX
	1UTzKcr0bMocYQqcvM79IeCCdLR/a5pGDfyV1pAgR0qNodGyICM/OlVi3CU6Fss7TS3TS4KC+fY
	0p2XwBWFKMIPY8HTL5QiQZGTBAFkpyLUp18ToyfCkqp2z9lvynzmEbIKGy6G1B5fdTPOikMTr8p
	mDXU+nKyJJDvkvtBbuWgQbzFw==
X-Received: by 2002:a05:600c:8b29:b0:490:6e0f:29f4 with SMTP id
 5b1f17b1804b1-490e55cc3fdmr8988475e9.3.1781162796880;
        Thu, 11 Jun 2026 00:26:36 -0700 (PDT)
Received: from localhost.localdomain
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea21sm42585795e9.1.2026.06.11.00.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:26:36 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/2] drm/nouveau: NVAC (MCP79) MSI rearm + SOR-disable NULL
 guard
Date: Thu, 11 Jun 2026 09:26:32 +0200
Message-ID: <cover.1781162589.git.marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QUD3DOYTSZUCXC5EG4UYXSP26IA65IEJ
X-Message-ID-Hash: QUD3DOYTSZUCXC5EG4UYXSP26IA65IEJ
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fab Stz <fabstz-it@yahoo.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QUD3DOYTSZUCXC5EG4UYXSP26IA65IEJ/>
Archived-At: 
 <https://lore.freedesktop.org/cover.1781162589.git.marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a v2 of the NVAC (MCP79/MCP7A) stability series, narrowed to the
two changes that are genuinely stable material and reworked after review
plus an independent second-machine test.

The original v1 [1] was a three-patch series. Since then it has had a
three-week soak on my Apple Mac mini (early 2009, MCP79) and an independent
test by Fab Stz on a second machine (iMac9,1 / MCP79, 6.12.90, X11/KDE 6),
who confirmed the system is more stable with the series and provided a
Tested-by. After an internal review pass:

  Patch 1 (MSI rearm): NVAC re-arms MSI through the MMIO mirror of PCI
    config space, which is unreliable on this IGP; a missed re-arm leaves
    the interrupt line dead and the GPU wedges. v1 switched the whole
    shared g94_pci_func (ten chipsets); v2 narrows this to a dedicated
    mcp79 pci func so only the tested chipset (0xac) changes, matching the
    existing g92 precedent.

  Patch 2 (SOR disable NULL guard): nv50_sor_atomic_disable() can run with
    a NULL nv_encoder->crtc under Wayland session teardown / VT switches,
    and because the deref goes through container_of() the NULL becomes a
    bogus pointer that faults. v2 restores the guard as drm_WARN_ON_ONCE()
    and, unlike v1, does not call nvif_outp_release() in the early return
    (that path is owned by the commit_tail release loop; the v1 form could
    release twice and detach the OR before the disable flush).

The v1 patch 3 (HPD link-check retry) is intentionally dropped from this
series: it is a behavioral workaround that sleeps under mode_config.mutex,
not an obviously-correct fix, so it does not meet the stable bar. I will
revisit it separately if it is still needed.

Both patches carry Fixes: and Cc: stable tags. Per-patch v1 -> v2
changelogs are under the --- in each patch.

Disclosure: this work was done with assistance from an AI coding assistant
(Anthropic's Claude, Opus 4.7 and 4.8); the analysis and conclusions are
mine and have been verified on hardware. Each patch also carries an
Assisted-by trailer to that effect.

[1] https://lore.kernel.org/nouveau/20260409172126.115441-1-marek@czernohous.de/

Marek Czernohous (2):
  drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)
  drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()

 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 16 ++++++++-
 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c   | 33 +++++++++++++++++++
 5 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c

-- 
2.53.0

