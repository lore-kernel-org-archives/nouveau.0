Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9231BCD13D2
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5710F4D8;
	Thu, 30 Apr 2026 22:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sb+I4qm6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B0F8B45D6C;
	Thu, 30 Apr 2026 22:27:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588021;
 b=Wd+cMZ/lVfgmw8AYg5mA3Kko9RIDGuELXGP60Z5yeGu57fK8dd487FUi+GZ7GxIsnTl/g
 G6PYGnyAUSH4QCET42DPGcu7/DUDLAf8PeTDp/B4Qm06Xb2SymOKA7h5xNbUMRu/dOQuq96
 Woh+XbF/7yh2E1/NYPlsgsnmzilrHRyli51j4/iW7izXIE3KOulNJQKQs1Z5t0PHIuxFtD8
 Ze3akTvb5oGgBhM0kd+TCUrmAetncCcVnPd6aj026qFfCfuz1QvSkDK862oTtgo1AP5Syos
 YWddpImt721EGBk+mL9jWpTFumNXPxm4jiIBQxK1qWT06wCVST2zDzpP5e6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=evZd9jF+ByYDC3/bqlAcP3ajjd0Gkp/dvC/9KsBZ6yM=;
 b=Qnjd0w1BaJf9mDoetolc/k/1gnz+4Xf2V4lFOBlxfxQNtPZ7p3x/93DXjJH8qcoj3vd8/
 j6/A7REEQxy6sJ3qfQcXQarf5WOVbt6+9FkC7I/bMRBW/Gk8oaT+dcAwzRD4fWSIM/fBemo
 JFrBJ0ad7yB12IVZScFDEiSud+r+JqHg+wWgVk72cvVgku7vJaMkGCByy7YtbsyVeyVSYNu
 NdDKwrJ69MV2SnLauB7JpWtjMv+lhpY+uRik1dBpiKWjx2aHTN0zH7Th/dU6/KszxfnoNeC
 7o2XDV79vE9x8phdJhg0+NqGv6272g9uqXJAGEN3jxLL105vwNqHTwNYBzcg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 99ECD45D6C
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:57 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010021.outbound.protection.outlook.com [52.101.85.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7D6010E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA9eKiIxDoHeLfC1RitdNSnGCLXbHEe8ZZs+i6YCoon77WLynkykAnVSg9//S76MuJVFwUL+8l8SbaQhBAcuIUgu7Et4VWaYCgIo80g5vj0pItPXouJsb/2UaECuNGNqu04YC7Z8MEPvqxMqCndGZZkZxjkYokUCCvLxp8sqPQ7pz6HnpvGpiiwsked/Oa1cJlj0KDIyicTcwZQAqi5nJOBO1iJVsljCGT9QOPQ4olBM5a2+hb+UmjXxC/mRlcaHyM7sYxULGD24Ak2adC5RMEDj09YQivt6vNltNkGHJINkMixADAsQFy4Tvz56rnVL/SCYXuFwPmOQrCDNQii4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evZd9jF+ByYDC3/bqlAcP3ajjd0Gkp/dvC/9KsBZ6yM=;
 b=gPsB+e+EC4VoXL5fxSc6HEcImrJNgjJKAUTpViTo00ZykEyUwE1fVdWiD7rbX6bXcA9QTpBicMdQ9Kh2nu3We0Mi0f29/jqtpktwlnGfR0LFZDlj7uJ5NuzPO/3WtsDPcc9tO/vSVzJUNnxlLtZXjbcDqWRXXSzCkjjH71EzX4CgyatWhnzlDagvaHRcaGvRhtFZ4g0syw0ygHpyJ+0I4ggKxh/kS9lux10A7chNVv8DbgH1KtrhrbRdqypfjPW2YbvnTRlTosP/GvOVUTeLKmEkyzhY0ZQmmnIUr/RZ41OOuFNOlIZbNVQwO6+TPT0WBVPMttP4JukBi2fzGCV7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evZd9jF+ByYDC3/bqlAcP3ajjd0Gkp/dvC/9KsBZ6yM=;
 b=sb+I4qm6TDCHlMtwXHK4f1ed9cRA8dGRTW8Movmzfxs+3wE5TE8jnGHt/zpQUQ//7gX4QK5/c5WSlIh5P1Cg3Tw4pVWUjXoiUhZRZd8J1knKs3j5Qv/Tl/6mXIg0sZIkaHLltAT9h3pBMFQahqSNl25rEeefrCtDO+U/hNdn9aPHKsjztuvh4XRJKbnbS+g2H8bs1JZEOY2foL7/5sNG3X9IQlkYUWqOPslIXkVq7m8zASJRMKa9YmpuLvF+ACrrNof1XiIiQt11bPDzwC5Dt42OCq7KP0sdHk4qRzmDpQtyGD8Ldo6/jDpGXKh7aMhxdJtGR0s1vyZEonwsDdfM0w==
Received: from CH3P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::28)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:19 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::db) by CH3P221CA0027.outlook.office365.com
 (2603:10b6:610:1e7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 22:39:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:55 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:54 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 05/10] drm/nouveau: only boot FRTS if its region is
 allocated
Date: Thu, 30 Apr 2026 17:38:33 -0500
Message-ID: <20260430223838.2530778-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9b603d-232f-4a32-6e3c-08dea7095102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VkY2iwkLC40ql4HynrIl2QnfsW3DIKFrkSc7ew5dF5LG9oeVg6cEITg7IhECDMX5DqIx2Br4SlndBZXYYmLsxnGEHIZsxD5s3kSnhdXJnWw4e7ui+2r8Ebx4NGrlpayQ6FQP6NATZCsXzt61sEaQYycM/ZiU1TM+XfQwsGhAXeBSlGZcVTGbnhj1XM1HNdBvlULnAhPwQDMA8ixQ2kjS+p327beLOfzDtBY0kO6zcL/RyaMjLkc4Bzzl/1Z96jwz0WG//zYJiY31KCE60fj5Sr9z0n6Tp09qM6SExl52J+cf2kUjQx/oaGj4P8zN+IJ7DdXJIN7KxQlA4mFVkPNE0/qIvBfY6BcHkxFyMckoVvkk3JBQ+MoV5dzovnZFaVxS+YxErB/uGhBUT0fY/x39vkKaXYYmWd159nLc8+K0850E75kr/4O189JxBo+TaJNM3zKBBHybkM9GmxXM8U+vbMtN+jdslggjbwPTQhD6rBZyzdCDge0eU6uHHwXRsorxGCAOQYd1kELkLVqVWNL0gYKmYEzwJYny4thyLBPFMAZYEO9Mq7Ndb+/mmn0XQnYNnKbOJprLsrE/CZPHKh863IOPLlw8cbdeFFIPok5DojW61e+oyx9+bawhMf2pvMXz9ZMv7ZnjBFgr2qU8LG32W92nwVYgPHAdOwF2Do8Op4ssp+IUH9Jw1IktYgEWJ6Tih/Acz5JNby7apdrTtr+SiNl69PKRVfxXmrJj+mlbllI=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y5w9qJVQrk/eaMGXQh1R8SxL7t7EFKARICIQDm154C4evWZOLLZbxl9GOOxyF8w+UFafS6YE+daCXphbVkh11XCPQlt1ocGXktx1hSOdOaJSRhGtxEf8fUMCTEVcyH5HeBmTc5iRHgixKz2gLxheRVoYNcmQnKFc3Fy+xvSaVHkIkD9aUM9miLFBFqqC7C+S8NYzc3X4qGA5dLTJyK91yCUEm/r4oZsEFz9ZM1x7HWeXsUTI5S+sqpJBYP8V/7V2P0ei7UBU4J+hYBgJKaN9/PpTJKBpnOxNIxKC6IStS7SIKaUoW/6jgNtgy3XQb33GDcCrMOJcN8mTRCesEanj79enAyb9zVY7sNDey/+muRP6st37BgaLWK+C4yO+HoqwnSXbf0L8RUfd5hcofHXO/IYG6G4QJ8lKAm72rLmgUswiGkGLbGY+uB+oWMmix4bL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:18.7246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e9b603d-232f-4a32-6e3c-08dea7095102
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
Message-ID-Hash: 7V6NMUVFXQKKWQWCOTFB4FC456TZBSPI
X-Message-ID-Hash: 7V6NMUVFXQKKWQWCOTFB4FC456TZBSPI
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7V6NMUVFXQKKWQWCOTFB4FC456TZBSPI/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
(its size is set to 0).  In such cases, FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 66f285b60f1e..fc8db6bcaf23 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -392,9 +392,12 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_fwsec_frts(gsp);
-	if (WARN_ON(ret))
-		return ret;
+	/* Only boot FWSEC-FRTS if it actually exists */
+	if (gsp->fb.wpr2.frts.size) {
+		ret = nvkm_gsp_fwsec_frts(gsp);
+		if (WARN_ON(ret))
+			return ret;
+	}
 
 	/* Reset GSP into RISC-V mode. */
 	ret = gsp->func->reset(gsp);
-- 
2.54.0

