Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E354FCB611
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 15:07:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 633DE10E3FE;
	Fri,  6 Mar 2026 15:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gMT4GAbG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A646744F57;
	Fri,  6 Mar 2026 14:56:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772808995;
 b=mfOCknBWvaJmihcoYctqD4dm0f0essZRq1yPuVf0IQFEBNGLTin9s0brK4wG+foQ/V7SO
 CBMrm/wnYoCbmV/GVeF3acWo56+RFcK/1bseI5P8YaptoZ5TM6yG3JoI08m0mKOb/j0dUXj
 vOAO5QseOCynI3w7ZxVcn10FNcdPF7/0dbRMnuoUNLLy8XDWYPoqZKORHQCozj2/khIrop1
 7SvcHos4ych33HEAoA62kjmY4ZQK/xusoAHyclaO23ngIUrpHlUfz4x1BZtrBDd2PqLo77A
 VU/qXi/DleRbsho42eSV5aLSC48JBcXeBr94gjWsWRaBbiPxPJl7RZ2YdiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772808995; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YuHnCAoNXTT3lU/xn0j632G8a285dKOJSKC87nmrnnA=;
 b=hcJssINTpZi0xbEUKiVfUqdUq6B3eLFw7IDKCDIXNZJCvTzF/GuFPMdCrEswv4BDHsiH2
 6ahZEvgtDuNaeUV8LWhR/TMoz5eVf46jkLgQzA4IChOOPw0MwsgWa/UAMReLE1I3cIGweE7
 kMMA3RWT1H6aeRBenuCgAiwMDKowqA9lkSn91frAPR6+I/t/erQRAaniTr/3jmm9jEM5YXQ
 HYXDHtJPWKUNMkd2nRSglj1mh/JK0/uoJBacT2EUZxoHoXl0OuGlU+Snun94wXE8U4IfCtM
 C3D5CAUg8BHobXX2eK/kxHA1pr6N22atdEkBjKPIfpe0Y8Zk7nA07EiusYoQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4CB6A404AB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 14:56:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A264F10E3BE;
	Fri,  6 Mar 2026 15:06:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A09F460127;
	Fri,  6 Mar 2026 15:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37261C2BC87;
	Fri,  6 Mar 2026 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772809616;
	bh=iPL1KTeGN4AZsj8P3Tdxd7pG3wQBIceCKNb1YSqkPQs=;
	h=From:To:Cc:Subject:Date:From;
	b=gMT4GAbGOkUvu7pEf3WSi3riN6UMGc5YzMkkvLDOlXF+526ctQGhiD7ZvUv7QRw1y
	 tkpngcTHQl6PVkTm6iDdT7ksvB487fQzQ9G2+28JjpKpmOG/AQhd/5gVMTijwGHGo6
	 j0Dc2oHYklqBmie9o/HMFV+H3H96yXyZ/C7qokdgEeIcBFWA/DJb3NkM3TKnFLy7ap
	 BGowVtLGopwB1UpOEBQk8A+sBDQkJyoh2Z5593Fq/vLqtC+Xr6EJBvQLH4SX5E1mPn
	 39EcZqvYSeB7RCuev2v77NDvRLkPCfES0nYPqcQMUl5VQS4rOAgd77T9H1efqY2z9A
	 79eDEe1Je/u7Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Timur Tabi <ttabi@nvidia.com>
Subject: [PATCH] drm/nouveau: avoid
 -Wtautological-constant-out-of-range-compare warning
Date: Fri,  6 Mar 2026 16:06:44 +0100
Message-Id: <20260306150650.465132-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZCHCLK6IZZLKZKORP25TXHIOL4U375XS
X-Message-ID-Hash: ZCHCLK6IZZLKZKORP25TXHIOL4U375XS
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZCHCLK6IZZLKZKORP25TXHIOL4U375XS/>
Archived-At: 
 <https://lore.freedesktop.org/20260306150650.465132-1-arnd@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Checking a large 64-bit constant against a 32-bit dma_addr_t produces a harmless
compiler output when extra warnings are enabled, but leads to a build failure
with -Werror:

drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c:17:37: error: result of comparison of constant 4503599627370495 with expression of type 'dma_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
   17 |         WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));

As the calculations of sysmem.flush_page_addr are mostly done on u64 types anyway,
change the struct member to the same type. This feels less invasive than changing
each WARN_ON() to add an extra cast or extended condition to shut up the warning.

Fixes: 31d3354f42c0 ("drm/nouveau: verify that hardware supports the flush page address")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index e0d777a933e1..7b932449606b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -38,7 +38,7 @@ struct nvkm_fb {
 
 	struct {
 		struct page *flush_page;
-		dma_addr_t flush_page_addr;
+		u64 flush_page_addr;
 	} sysmem;
 
 	struct nvkm_ram *ram;
-- 
2.39.5

