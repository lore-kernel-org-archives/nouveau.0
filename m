Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFA1F459F7
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1A010E9C9;
	Fri, 10 Apr 2026 17:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fozFd+2E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 85494457F2;
	Fri, 10 Apr 2026 17:25:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841934;
 b=R6v3kmE7RZ5m/51SZ4QjcCuY8lJl70DgTyyrGXQsCdeFltDWV+XaBAcAdHPJJoPJ/ypD0
 b9OAh6UXiGxSuSLxfzPB/85hUJViJSIXvPVjqU7fp3tqEmfjZA2XuduWTV1+SOyNo/4yQ3I
 sDl+drtOv8n4X70S/sGV9Wh3mi+Zyokmbvdfr0hfcTt0j31si7iqXAAjr75TV725Yh7yyGm
 Dm/Q0ISf2slV8yXHHSzHdWsMMQb1bU9wsIU3QePihWigVyAfrhH/jqTLCPQttoL6DWZZv5Y
 w8EfkzwElZKWrJkaLTH6TmlUuyGmW/pqpeWoy/muYt3LMzhaQp/YllnlkVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841934; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
 b=RdsG7PLsexsrzdINyKP2JAWC9HVPPIf/PzurY+kmC/NXub8lh2INffzyaB3OYb9fEYzAa
 yWeqQ54JXDCTONNJDlrsxZQGYZ9n3PniylcX/VozC6fJdD4P9jDgr2+OEPbAw47C3xsgSP9
 0hoOBvMnDfoNOBP3IlGIiMmspjdC8s7MHqIKfBY8gUFbDtZLfZhkCT4bgNKd2Hf6LGnvoO4
 Z5/J2CIl+kQS60jXYSuFJ2tYi4DnEKOsjXPdsdZyyrxceISRqQdXEUc45wTHYEhpA/PWiyY
 zwHsoWfe7OAVBLD3ykB6JqTvpVlz3p+AHu+6UATg9iD0f0HzKWmzfsF4FUZg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C8AA841B05
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:04:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28C8D10E897
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:15:56 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-483708b697cso2178885e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801754; x=1776406554;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
        b=fozFd+2E440odaZC8PGgR90MUnHjGZrXc1cs82YEnbTaDJ/ewfvWdxkqlAi+w7tdI5
         SmrTII2ed4FY8bUa0vqO/WZmXNSlZGSZ05t2aOyXQJwU3Tv94v5FNUWfsVir4TF2WsN2
         X6RDX7TnLXRi05ZBWe1XUinDMhSgP+uWikNzQ/RqhJ0IIa2NyEO/RGiayX+Y9E0YV+iU
         75OYDSnttx8txK8u3hRGw7Fc0luvW3qecSQZo+OeKuBu/eNZR3Dr+i1GzsNTx+61AFuB
         DMeus2uqRAm2eWRlUQ7FsxK52+lN69+Nw61DQTfzm2XF9+RqhE5DQDGNn5mlJ0HxqlX3
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801754; x=1776406554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
        b=Lffh23dsCaRuApDL9fQjIilxZtoefhzu7ew1iX5oO36ZN/NwvJzQabAIfuK76uh0iS
         YR8TfGBoYA8E+FtbDwZPIJs0VI9eAldGdKt9Acs1Gt/okxxqMOZEkfXZ4+SWWm6Sttuf
         mEMloXMZFdid701YA2VLazeW/Xg63jW+BqK90bYwrHFwkF6xjJiZ852QpB6XNMk91ce3
         OaBApjV6WUUqLkcJGSjESFsu72AWIh46ATCtqREcNoCgr3p6O3MjrYO/tNIv7xL2YEFf
         OVdabMcJi13c4exHNnI2dR8GN5t4s2Dm4bGbY6VVnd/8ZD57bUftv++/7HrjsM4zbv6k
         46gA==
X-Gm-Message-State: AOJu0Yzpc/8RD4jUF9BtMi9mkBWuCNJMUa/L1StgZZ9ROEkpKKnqOMi5
	WGsQ69f/+wYZjDg+DHpw9zPxzZpQviR6amLCd3FImAi9OSpG0n7SlSS6MZ6aBPnK
X-Gm-Gg: AeBDiesV9wK4AcAjHjQ1yObw6Ca6i2ffiC8IVuD2Y1zOeiTWDih1kijdbojxLQTzcnU
	O1F8XnQZK9T9v4Xh3iqkRXhfg/sZuFskwlo54jBe5iB2I1io+0w0vgMl2WwSnusVDKuwZ4Qxfa/
	16vzvxsgBcWsGxMGEXgqSdCtsuf0C/yE6UjdRpxtQlzOimmaoSsqKlgzmCmqXWuBQZqvxe/HM+N
	h8CWb/2tSDQG2f5u73TFZzbibpl4PRVVa192hZas6ubXuA6iOEDSK+js+0TAAP+NXZ6nBjB7BV1
	/tCvpOpm/tg9pyO+HcrXUn5/iONW42CzEVH6nmo6eX8X/JrnlnHVpP4GNBkpHwJmXmg2RNw1D7r
	BBj/SuNra8+UlWE1ZrzDzL94j4RZucZ4xeqq9jZGhybOJa8r02sk7kfhvNK/9fJ5sSxZQ+CkNPY
	oWN6m/RBBtDdi4ilad5C/mnCF15sWEgzLB4TjHB4S8t4pFecQrQPHK/cuL7wq4Ym5oEidi+HOmU
	xrM9CIHmVEuRg==
X-Received: by 2002:a05:600c:b85:b0:486:fb8a:fed with SMTP id
 5b1f17b1804b1-488d68a0975mr10827815e9.8.1775801754397;
        Thu, 09 Apr 2026 23:15:54 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5888c12sm55473955e9.3.2026.04.09.23.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:15:53 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/nouveau/pci: use nv46 MSI rearm for G94 (NVAC/MCP79)
Date: Fri, 10 Apr 2026 08:15:50 +0200
Message-ID: <20260410061552.19056-1-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3MJ7GPAHLRQYF5LGGACQ2AYE3BVSQVA7
X-Message-ID-Hash: 3MJ7GPAHLRQYF5LGGACQ2AYE3BVSQVA7
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:31 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3MJ7GPAHLRQYF5LGGACQ2AYE3BVSQVA7/>
Archived-At: 
 <https://lore.freedesktop.org/20260410061552.19056-1-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The G94 PCI function uses nv40_pci_msi_rearm(), which re-arms MSI
interrupts via memory-mapped register access. On NVAC (MCP79/MCP7A)
chipsets this method is unreliable, causing sporadic FIFO errors and
GPU hangs.

The closely related NVAA (MCP77/MCP73) chipset has MSI disabled
entirely in the driver (.msi_rearm is not set), with a comment marking
it as "reported broken". NVAC shares the same integrated GPU
architecture (both are NV50/Tesla family, memory-mapped through the
host bridge) but was not given the same treatment.

Switch to nv46_pci_msi_rearm(), which re-arms MSI via direct PCI
config space access (pci_write_config_byte at offset 0x68). This
method bypasses the memory-mapped register path that is problematic on
these integrated chipsets.

Tested on Apple Mac Mini (MCP79, NVAC 0xac080b1) with DisplayPort
output. System is stable with MSI enabled (no NvMSI=0 workaround
needed), zero FIFO errors observed over extended operation including
DPMS cycles.

Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
index df745d069..9dc28a4bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
@@ -28,7 +28,7 @@ g94_pci_func = {
 	.cfg = { .addr = 0x088000, .size = 0x1000 },
 
 	.init = g84_pci_init,
-	.msi_rearm = nv40_pci_msi_rearm,
+	.msi_rearm = nv46_pci_msi_rearm,
 
 	.pcie.init = g84_pcie_init,
 	.pcie.set_link = g84_pcie_set_link,
-- 
2.52.0

