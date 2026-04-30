Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B49BCD3423
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D95EB10F4CE;
	Thu, 30 Apr 2026 22:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GOKcOJ7n";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5ED8B45D74;
	Thu, 30 Apr 2026 22:27:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588021;
 b=vYvwQQSTY3UEG1/vVVdW7TGSHQuHHlZHqftiii4dFcHKr8bz4qN8S54fpJlbjz5E94vKb
 3ZqMPPwbLZrYyESWhEYY1nSzS23INMSBkkFiAUNgVqhpiOPgnqnf9JwxGq2uVcTegI7gZKy
 AGTiX5GVDV1SwEoln4KVBkM37tZsixuf7o1VX8zxUwG9jG1Dr5IvLgutiSF++vmKdsgixeZ
 S+ftNPaHWaxr90Gd9NJlaiSrzHJyq0YH0xU+BR5pN/u5aQbCiHtlvra36/5ImN8OlQjP8qP
 kAALBE412+qY5PYM6NASARPUJ43YMNSTbHTHzNBFDj445C9gQSO0yH3bUZLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VtVKPkafzIi/tgvldtsbpliw+EsGoCNykRe/dnulZWU=;
 b=OsU5P0jhDP4DT9sGA+1gdEnvFRjY5O6hRqefPe0m3wQZ+YkXYKufOZvw7STRnYyOU70un
 LnduwFeEPiDr3gnXmhfQEPMOFjdgRcqDq2W2Pc6TSs/EjwY0rsO+8kXX6KaVAVjl9GdbRJi
 Et7T+aq5MAKrTBEqxCs7ccQVBIORDOiGLEWfXvoCV7lt3w0eQ/6/NmjCfP1c096xj9BodLe
 ckg3FLiuGm8Ev0bnU4h4sdwpMeh/UlFouRfgaI0ADmJSBVLNa/mlkFunI7wxHeFbRWXw1/e
 0qevv8FRMhikEn4SOHWRhjIG1rM80itUu83/g7c2JhfJ5YLr9FAtOpCHrmPg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DEE4E45D73
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:56 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 007FD10F4BD
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFYNHwE/o/XgQaqETzKjothiQnqMhYcP0PTlWizlcrYHerUHfSbAIs7yxjxtiMDA93G4bzrXcvkrD22t4VDgekszsp5SYJqPARhqeaHseoFRX3V72zLm4BzqlWuyH+mtrPG54OIMxtuK3dXJ0oqlDAAwG1HljAdd0jal71J6IN8QomQW2b9xHW6a3d1lm9LQQ2cX9eN4Dn70ygN3IT9iDJrWw+HsH5qKXwweO8M9A2Rvj/ZMtr+L3aIzgIXwdRUY33Lht3ym+T4746cm3iAEU4dfCjHMBCBsE0Du0jNa/Wu2ehktIR/t6ULRaVpVspclFw/xA6caiASm3zVWpOtbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtVKPkafzIi/tgvldtsbpliw+EsGoCNykRe/dnulZWU=;
 b=RiWg88NZjeTA3+mvFZdjQA5fTcH4W+sv72iY85EVgNLLToKX7zo6lY71yKjechavliE5vVSDXQ0zFf6s3hTfuQtWYob3EIOi2tPDa5RGE1qDMRL9+1IkJO7vpLxIOt4d+Y52jwp/cQCxcBDK66/54YBHi7zUIa/I+hcot/jknA4ZizRWJxwIfwooiwzYTw5yBBur5IaGEmNi+Td1GioNQKOCLSPS9PVLEsF8R4NkugN+BI3DAO41oSsnADFqRMa36hx3Q88XIMp0dASf+AauoESGKtWB2mB27pw8oQj5GoS5VbphB7dCR/UA+8P5hY5U51pOhI5Oi9afUlPcd/87FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtVKPkafzIi/tgvldtsbpliw+EsGoCNykRe/dnulZWU=;
 b=GOKcOJ7nrFd/pDBMhtBUP+O25H9ufVmky+DNLzS9R7jwA0mVGV7mvDr2TizycFA+BulcXqk20BeBtbklONaxCPfQ0ExsGRHxhZtYy73jKpnzfDuL91zqP6Jfw8/A7QdZ9wmV4crwDqzUN74nAK8fKbdjjCDuebgxYWNEyd3+93ayWOJsRX392Ew2JlkOxqz0obhWMb/xfSMH4LoB2AE4ap18uUOb7bYdvDmnAQNlLyoXHmv1B72HdgxhxS4tPYs4bN+N/QxIKmvyvMZLyAo0RQb14VGIs4pc7G8N9kmrlFMOvyRlmXZ83ItFaWEcBw55mjyUaMS7C/3vgiVhNv7KoQ==
Received: from CH0PR04CA0016.namprd04.prod.outlook.com (2603:10b6:610:76::21)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:19 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::31) by CH0PR04CA0016.outlook.office365.com
 (2603:10b6:610:76::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 22:39:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:56 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:55 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 06/10] drm/nouveau: GA100 has an FRTS region size of zero
Date: Thu, 30 Apr 2026 17:38:34 -0500
Message-ID: <20260430223838.2530778-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e2e22e-c117-4a92-d376-08dea709519c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GRFCBba8El39tbME83RpyeQufYTvfr6H6pXbnQCbGkvIErvMeg6OVUtogVsHvk3dcXMlvSpFWg+Y73H8AA5bxJXgRdDVZi7fO+mUm9Tmel6kBiaCeHVsnKHih65Uauw8TD2ZHdFIOh95JgVGhcatBSPmW05qzMRbJVBqYkearK0isKXDieKbsztMSBaRRMo+goMZ7NaoGuVaiQnHsJv0+IeXQ3yuwD8lYyBfG29Qz5IYaryHxLNK1yUmSQYPr4q8VGyr9bs3Dllo3Pa5pO+CbzVNFAHQYFhPHtBDAocv7SFQULTCyIBrnTIBSMaBHoraJkfsphbPRwmw/nfq+O/mR4Y/e18vcHia/VOIEBxB1ITI9g4s/aHPFJybxnzTVCTfVUoTrCItrkXXNSJtINOGoJeSMM9+96DfPg36G2uKDoxgA4wNSL/WY5TUZt/qTxJyr054/fQ0XW7KMRlpijuJbq9wR8xJPFR4CiTF0y7WgSLUzWjcqlg/FvXl0Fyh3qV1zPl39H7mDMvHJxDh9uL0FwyZRBDJkKHzlQjp4qyhdqWvQ2l91jGPhmCtcVWHcedK6RpTE4GlZz/rK2kI2wsIUIrA0/cwE04dGZ2vX1Xsrp2jmmK+R1eQ5HPdUTtP3S4iI5DWSmG+tjMKVP1IhNjhTWI6QWrGOeLlJiyHW16PndVYYajztJ0Gqh/9VAtA23Ort6FOHwz/0h/aFy+bCOvNH5DYkU7WLpkZrAKhOKvPUx0=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oy32qV/YPC/fK04OXGlyeJOEAYK6642hO759PtvbIZ3PYDi28xWgHhnDC1hPN6iZJFG6kFvFPaAxQ4I+PO0Jw580/04O7Qdhc8axYHyT3PxyEyzgs4gtHRbFHav/CgNM0+imlrTb6jpz0d2CWMSpBckiVsBCfm+O+5Gq+olpQp2L8Rd9Y9HM8aD5/TnyIrrFEaXSi/F+kXA1deRpm6gi8JGm9QeQvNz4e21M5JV3QC3Rmw1GGrj5v4MLr6As6oejsoQIZ8GtUHCuTf2xhACf/0EGid2u0yy8Kgvm7btX0rXEMQfdtfGLib7i0FcN9tApzcU7MgCmoj1mI9jshrta/+4jikAbzgtwaQOTQJpCFmkt+UJSo3osIMVA9AAEegTv8OYwYUFCQfdwheCOH5pSaun43AmSdmNHLnsqA0jJ7uQFEnatAfZMyOR1dRoDJnwS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:19.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8e2e22e-c117-4a92-d376-08dea709519c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
Message-ID-Hash: 6FESFWTI7MP7YYGZ4CJKEMKJVDMSLQGL
X-Message-ID-Hash: 6FESFWTI7MP7YYGZ4CJKEMKJVDMSLQGL
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6FESFWTI7MP7YYGZ4CJKEMKJVDMSLQGL/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When booting with GSP-RM, the FRTS data region normally needs to be
allocated.  However, on GA100, this region is not used and so its
size needs to be set to zero.

The truth is that GA100 is just special, and the simplest way to
determine the proper FRTS data region size is to check for this
GPU specifically.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index fc8db6bcaf23..11a37963bd4e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -367,8 +367,13 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	/* Calculate FB layout. */
-	gsp->fb.wpr2.frts.size = 0x100000;
+	/*
+	 * Calculate FB layout. FRTS is a memory region created by running the FWSEC-FRTS
+	 * command, which writes power management data into WPR2. On GA100, the booter
+	 * firmware handles WPR2 setup directly and FRTS data is not needed, so no FRTS
+	 * region is reserved.
+	 */
+	gsp->fb.wpr2.frts.size = device->chipset == 0x170 ? 0 : 0x100000;
 	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
 
 	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
-- 
2.54.0

