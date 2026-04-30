Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EE4CD13D2
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E184710F4BC;
	Thu, 30 Apr 2026 22:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MQlndMcX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C92A45D6B;
	Thu, 30 Apr 2026 22:26:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588016;
 b=MPRg3SqWvgw+WokkLD/bwZcwpaLWmYcvIt9czQ4RF6g13CCxUKV6RwLW9idKTvcA6oDel
 p7suTKi/DxwC51hEwx3twljZNjFBilxaJ7HN9ZUTY/Fk8F8Ms39T0zDPTiC7nkDXQx/Hk5s
 HNoSeUWqJdg/sAmFO1vHv0QsvbaZsDxNWP0Q8Dyp/As2aA/1GBS05t4uB6gdd6AtFSen0wi
 +1YnwcJrWKBKHPEGTtxzgn6X7RIPK3Y5CTw02hWFLVXVo2NML6eEUI10EvlMjcaQg45fW63
 k8Sr10vO2d1hqs4aE+3q456eDhg6nXbb6oHyp2i8qX+7R69iz12cfDFtE8xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588016; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dg5gFDcY14qrjWfTzz2ULHDMgq79IigD2Rmg8O6paiE=;
 b=jj3l1KqCv/YaHWu0PVeHlH+/sNb23zcZFvfOYGe+NLGOWI0SgKqv/pJPW5+be1F1eJhkg
 xJ2H2cpRdb+AHd/G0GTIui5fccbPYQCcpnGJ0aMXEFgNA40cH2fi2t9eot/U82JvukeLnEh
 8gzd0EP7FYYwC9DAkg07mnZtIrHBnypddBxvGdhzbFzn6i6gn1xCLBrAjiCA59gMeFz+CjI
 B+ALa3gf2aI2n+diWyhUY8lTPM3t0AaAmBq3L/MU/8U+a7SGaSY5xHyRhHB2A7WJiJ9QuMo
 OXET08JRt1YXoX2oENj6wGXlEqVhEm4hur+LgeAQzOU77eS82fIQUqY7pbMg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 17F7445D51
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011045.outbound.protection.outlook.com
 [40.93.194.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2210E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xs99HQUQyrCEtujx1SH6RQZ1xEWBWVi0HRbDWs02mMtjUc3djrq1emW/fciIjC670LkGN+e4NxsZBgxxtAgJxVXU7V92TTkrXKL/Kc9oQ0cK1HyZgP+Ic3VWDV7RgIRv3Ldhj5nmTFOO0xI7IzFHz6x9BrnaNeOoUyYnhVnLZwqfxk7UOPC5RoPczAGP9kdINHe/jM80+Y2VD9kzCE8AHB9naaSVOJA9v6radNXKB+v+kLYnLcflJiUEgfi+mtRCGPL0rqNijQFS5KY0thzrdct4VUynC5e9JfB9vagSq5hj/CvYgZLlPo3nQzggM9ZlJFsACHIpl6fkZuRrirbA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg5gFDcY14qrjWfTzz2ULHDMgq79IigD2Rmg8O6paiE=;
 b=I+apcsZ3FNu73MIdKlCbYYs8nRb6scSCsqODWvA06dgxbUvvi5I/+uBwyZ3aE2dUkh8qaYlerst921GbigDpoiwxn7p06NVbPa0qjpNQ8iuK2D26wUbjmbKStNvKfCcMh1CVG2chuRLBGdJIzoBWAYOkRc1XfzFjgGT3iaUK/bvbiSWKyqTzeOcZonN8DwHitD0y0XO6C/SXGQ6H4bWVBv6F4SQ5kaTw59lRkxKzP1XSpI0ujuMk0Auvqf8BJG7deH3aDt4helPQ/NagdC9Cp5xfZlfcaSKsjqda/bhgq8ySUmNvfyR4u/qU3brhPt/F3zQDd3uWXW0kgNAC6AEDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg5gFDcY14qrjWfTzz2ULHDMgq79IigD2Rmg8O6paiE=;
 b=MQlndMcXsut4b0ZfTNCKboBLuA7TD70aFWpIU5VN/H8um9XO6SMxPMrtv5rDKCUmEd8u1lNRpPYXvZ9kQEMOZETePG/5iU4IoSJe6xVHZWJ1mPzhZs52Y2wBQMiynYnUT4pv+b3oW6cwNbUhyPCY+nSRxOfxczdQLvi4JhPamxwCgF8d8f9xctUHz1kCayMOhcy8A2SbJjQAnD8XV4OLgdtjqzGX7L1X9E2qjY7+U/UTIQxjdgsGi01WnJkY52T77F2fCfyeYyvwx4hg9OdgdWD0MQhl8i/x+zm8JKwWOEOhd/vLL/XwDOfdfojvL4XOknyZcduUxhY28SEvqrc64g==
Received: from CH3P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::9)
 by SA1PR12MB999252.namprd12.prod.outlook.com (2603:10b6:806:4dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 22:39:17 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::5) by CH3P221CA0007.outlook.office365.com
 (2603:10b6:610:1e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 22:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:53 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 03/10] drm/nouveau/gsp: use fb.bios.addr for gspFwWprEnd
 instead of vga_workspace.addr
Date: Thu, 30 Apr 2026 17:38:31 -0500
Message-ID: <20260430223838.2530778-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430223838.2530778-1-ttabi@nvidia.com>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA1PR12MB999252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5f445b-47eb-473e-11b4-08dea7095019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8DfuFD2Ins0TFWk1SHMV0VjzNYK3i0j6X9UqJh2TSPcxSilX7uF7y9dVPgz7GiHlXDdwBs3PGY/949uHZ+p9ClOBNSe3SexXVLCOFOlxB9w4adshR2OoG+gi+4twCQXaUiJyEe9b4vk79rz2PV2Y93EsiEVK1SjRYb5yH3U8FY6y/JxzxxKl+xe9Gxk2lnScLalnsVCh/bScla3f3XTdloHAHsdn+z3VfpOjFpa+l1jL92ZhIVswHu2yVAz+COv0GkNbezyaOscSEhcO1oeVn+An5A0s+ShB4MT+9Am7Y749lJ9/j+nBgpstVjdoXRtksuqiIEMiPTwpe9kh781XmbugNpJWrwZXjEv2VnzF8g8fx38xN4bjlfkKtkIzgHtgEdUnb49gabjBr32MsoAHZmrryiISwg/eY9CzJc7OjFVmnT1dVicXG8aBaoCn0uV0du6rA6ksA1ep9uRl9Sz/+79ixHgKyfBnKE8azmkOnmuIw0de7th7RBY1wGYM8TwaeGgy1q/8K9xEUR3ltYmLLEtrwvwUnmB/lsX8dp9DFswth9SPaOhOeME+AQrZGNMGk0DaznhdOOsh5D8MHQSVh30SadWYCJ0CejeTRwX2/MICF5n/2lyxe+ls/8XqtjqRuOklHXTm1+o17JjJOloj6qxwOAxgVrTQWQMCFJikkZa7DDWONfvxXflFr4ehx32NdJGsrjYqwWMFMB11fON/AJVO+q/XSnntP7je3Bfu5IQ=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LZQWRDVFShURdKZbKf3doaxOB2QdenJm7hQXxQINikWJ9uqvMEyisao7+FIsyWMqTl4uiCpn2D6l8a4vcln65WZiM5GFX9gmgkzMaTle9Xr1Qqn05pniNRXu9txhU4Zv7N+HrQm6YdBrjDQWKr89wJOzXFWLEDWpDsbhU8cWpI5PPLCLM/uAJEciT64nfUH8hd4fM/PzJpd6FM+5UiLuE3Sbsebhh8UCO+80cdTWymqI+0PrL6lObzM6yxW5d1v4uRKPY45zreuhepGylTuUNdwr9V1cHRRTmjhfnWWJHG7/l7YgrAmW76Gwu8UYwyaCWdFnuKEGKCoVBFCii2RdbnBnhAjCXXqr7AG5U4sJ4ihFnwWjEJqK3lpq4o/oH1Ugri742qBPbJ1J95ArYrf1ueQMdrCeAg1j8foPvQ8wpIjPrNMCM8QKQH6OBnikj66D
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:17.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d5f445b-47eb-473e-11b4-08dea7095019
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999252
Message-ID-Hash: XBWV77T5R2N6AASYETFBLZPKTJYH5V7V
X-Message-ID-Hash: XBWV77T5R2N6AASYETFBLZPKTJYH5V7V
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XBWV77T5R2N6AASYETFBLZPKTJYH5V7V/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In OpenRM's kgspCalculateFbLayout_TU102(), gspFwWprEnd is derived from
vbiosReservedOffset, which is computed as:

    vbiosReservedOffset = min(mmuLockLo, vgaWorkspaceOffset)

The VGA workspace offset is one input into this calculation, not the
direct source of gspFwWprEnd.  vbiosReservedOffset is the effective
top boundary for WPR2 placement, and it may be lower than the VGA
workspace when VBIOS has locked a region via MMU_LOCK.

In Nouveau, gsp->fb.bios.addr is the equivalent of vbiosReservedOffset,
while gsp->fb.bios.vga_workspace.addr corresponds to the raw VGA
workspace location.  The original code assigned vga_workspace.addr to
gspFwWprEnd, which produced the correct result only because bios.addr
was always set equal to vga_workspace.addr and never adjusted.

Use gsp->fb.bios.addr for gspFwWprEnd to correctly mirror OpenRM's
layout logic, so that future adjustments to bios.addr (such as clamping
it to an MMU_LOCK boundary) are properly reflected in the WPR metadata
passed to the booter.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 19cb269e7a26..aa3ac34989b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -246,7 +246,7 @@ tu102_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	meta->bootBinOffset = gsp->fb.wpr2.boot.addr;
 	meta->frtsOffset = gsp->fb.wpr2.frts.addr;
 	meta->frtsSize = gsp->fb.wpr2.frts.size;
-	meta->gspFwWprEnd = ALIGN_DOWN(gsp->fb.bios.vga_workspace.addr, 0x20000);
+	meta->gspFwWprEnd = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000);
 	meta->fbSize = gsp->fb.size;
 	meta->vgaWorkspaceOffset = gsp->fb.bios.vga_workspace.addr;
 	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
-- 
2.54.0

