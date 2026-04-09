Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BB5F459FC
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6111610E9B2;
	Fri, 10 Apr 2026 17:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mZK81Ln6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8C31457EF;
	Fri, 10 Apr 2026 17:25:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841924;
 b=pAXtpMu/Nm4mDUhz2FcH62tHlhbfL6g7tL1ug8T912cfOZCm/ZKxGQCZXbjsTBkP/JB7n
 e1MRLPMCRUAcF3N/baQW1aCmUXOWoBBJwNdTppJls4cB/0ofvSNnG914sVnuKw3tdjWfFg4
 9ED2cE/X5ULqJ+gwtVmMg3vaUNf9f2ANCcsidTckFoqgk9Fk/J5+86rg0tc7bf6xCfjya7v
 zd+UD3g+OxgFLhoOxJU19ZsT4hR5Oe7fARI7DuNffiYDG0EREJqjz/l1aOso2Aq3GkFbky7
 H1d/AGWKbxzNzc148X1Yi3rbM+J1G7alwHPwGMTteGj8vd142BXffdKBXMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841924; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
 b=KosiAoR2vm1cGYe/p55AVVtwEMq8eXmwiye3jBN4gkX1Vu2JHkGBdv5X7js+rJO5k6eA+
 o78jv0Am0YMU/Zl6YJbmAJZjvZIQ9y1c8YZqVQqW5tgArK7XXrz6FkztZ7CyYe9CVgig+SJ
 xcB1ueP/u7nfX3E2NObmWpAsLTsBt5pCiqhprCjqKlImOe1WMWhCBPLdBqCsqyLn+mQ/wVO
 o/YIYc+j37sYU9yy1FKDZfYqozq13caKh7cbY7cRJfMeyp8Jo+DytCOnFFHJkyqlP0PPyfn
 YuXS+qyeYaoo5myVTZX8oGEpgKqcgiXn07MzssfwOeyeqZDtvktfcbbW/0gw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7782945642
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:09:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBF7810E849
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:21:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4889d0a9df0so1417035e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755290; x=1776360090;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
        b=mZK81Ln6CIbe8BmnKqEELdlJ3eVdLSOP112imfj8+Gd6E8b0cnSSfnlg5kd9BpI+KU
         Vmv0svjhsdgZay9bjNtMxyZtjTP0m7jEgjrUojcJtz2g6zEPV3xpKbtfZX+PfczyTDym
         gW+9Jpz1sxYOhh0bypsMM+8iOfImN9vMeQDz9+QeVVWd7+49UacJgtIr7QmzCtkVT06J
         vGLSNnumOJagp8TSD6tHcfygUmayGp9PFCxupnuMk2LAdPaP+LKXc9p/8eEuxGPcMwt1
         iwoaiVUU6cilWUeiukvJGbdIebothvuYQLa3788gYygBkQVPZ2VT9rGfctVZGUUpxOS6
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755290; x=1776360090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSjn24L98hphx3W4Kt1Sy+XjH05WXGXcx5CVk5R26MI=;
        b=d8IeZ/RHztzFVci8MwWZ8Ya2VmbWuMY/KpWlThXyIRRVHP8KGjuB5/1amGvAwgOqiF
         de9y7QNCxd15CK9wn+ZKGmGPpRwHp4KIgXdbTIMaK4YRTwks18l+XDLa/v3YvaB5WeFA
         TRnhZxbM/dUGg1fJe/3Mhxt0N75UvnHlpNPyrGSxREou81A6OBpExZrZyBL9w1AO1B+n
         J9TdErqFlBi5NdF+QJdq8Ljv2XIN6gnxiXozOnnkkSy+YxRiMjHv6qemt9RQsj29qB7l
         5xBUmmn4ViyBFRpmY9kbvtWshVltUgd2XNoTWiAidpD1L0T/qcJYs8e57zp513g3EEYE
         sFmg==
X-Gm-Message-State: AOJu0Yzy8mctT2/qVwX1ZGRKFOCIgHxnwyivsdxS/8qDx3z68c2Qyk/r
	+mEW9nRbC2QqIWawiB2VMmiCVpMubKVxkgqa55buaPp+M/fkVxd1YhOMFTmtRAG6kqA=
X-Gm-Gg: AeBDietqWCx/WkYVlz6VjpH+dyfP6IQgiDQEVZWYS9XRTPf7NW++2Cg0qW0FifkbV4F
	Y/CqYqOS5MbhhoDG+qhiMoKTrOV5AoICaU1c6Se5l0bdc7FwSakxo0Mir1WB3sFXot7xVed4dWy
	41j1Bj0Fh1XI91FvyHSEhjTH3h0zmjhGiWg81NLXCsog2PCqhEIeV/IYBZCrl6IoPN+qswMa7zn
	KNYhg0KnJ72QAkq9kOvQ0+5U858ypuoH/YjZgw2Wu80zUm+ytL4tU1HAboI2WeB2rxdQsw+gV6r
	shOh1dInKcWy1lL8RmVAQLDVDlQMli48A20jloVyXb0oai6OgGRBBX5UiC5XaaL6516Nz8dI5Iv
	QS77EgjOkIqhaX90becznele9PMRKZX9F6I+XOK06ZwswyLePAXo89UojL3dcGCTEKC6ZesKf/I
	CwUBmHj2BCo8MLHnDfSkuuFw4bLUIyDWWhLTVqMWkaWzVMetYO1beiajgy4+UGV4jY1xSaBAeYU
	BGNukswwUH5LQ==
X-Received: by 2002:a05:600c:4447:b0:486:f634:f2e with SMTP id
 5b1f17b1804b1-48899785fb2mr220242965e9.4.1775755290042;
        Thu, 09 Apr 2026 10:21:30 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec090sm367345f8f.12.2026.04.09.10.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:21:29 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/nouveau/pci: use nv46 MSI rearm for G94 (NVAC/MCP79)
Date: Thu,  9 Apr 2026 19:21:24 +0200
Message-ID: <20260409172126.115441-2-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409172126.115441-1-marek@czernohous.de>
References: <20260409172126.115441-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: SW2ZLMJZDP5VE24CWQVAXOEGV7QQPG4Z
X-Message-ID-Hash: SW2ZLMJZDP5VE24CWQVAXOEGV7QQPG4Z
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:22 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SW2ZLMJZDP5VE24CWQVAXOEGV7QQPG4Z/>
Archived-At: 
 <https://lore.freedesktop.org/20260409172126.115441-2-marek@czernohous.de/>
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

