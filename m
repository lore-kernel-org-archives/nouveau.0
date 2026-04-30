Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06E0FF886F
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18410F4C8;
	Thu, 30 Apr 2026 22:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZYPftwUH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0DAA545D7C;
	Thu, 30 Apr 2026 22:27:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588022;
 b=YJ0RrIBuGqhLc+kO9wj5skbKOh7Bk47EILPYm6eByHgdPCq5WDFvPMiOJEh60+Kfc6x4P
 7JmQaS5tGCfYYvug89YH+bzA7AajPICbluDRxLlpIsutvZJEUR3Xq5QGtbvcukHdZwq1jSc
 XNO522M/m3PEC6JiYwmCG+XMa18g1OVueQJG1Kdjyr2xgPFMrPpCkgLaYS9xbnns7pPK0dE
 QOz5OBQNsbW5gDdvXOAPFA0h7078jweZHTPbNvIy72vYyc2GtCXKr+EBTjv++t333kwysV6
 odHAbHBVg9733r9kTgHT2Ms3N9Dt4A9ePKlPGyd60HeopYLXO8hJprmOrthg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588022; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b93VNtsMpfER1FQHnptf6G03fKoY7RIovPl6ojOoYUU=;
 b=hpHh5ouiZFL4e+7e2V0RZ6oRPh9WlmXzTBiORMvKGQNBTyS3xicb8c6Q4alYJkUirDgkf
 w1ymk/iVDG/F0WVEMfQifsz5PuHrVmOskifw1NcxV9r8WdplPrqfcGZpyR7OHaZBiKmYIt4
 c/wMGobK0WkBswpjRseajEbvBo6GNI/wDDf/e/ZSCW312JvpfVbIyFvfXUjK5l/vs9mpCGC
 txUs7HcPEC1zOi7FoTysh87vqJeQ57w6kJScs7SAjVNLWsZ13fkTYqw7I8OvFx3YLSTEECQ
 kOxuoGVgLKeIGegiqCSdCzyZkmkgq4Uj4iVwCp7Xp5xdhvMP2hdRTR0kkqyQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 185E245D6E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:58 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010036.outbound.protection.outlook.com
 [40.93.198.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6629910E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOWVzLI8Ow3cGloRJgGOTDD5Cp+d+pCFy3fh8WnZHUYr2gjgHb9Bu6IFfevuw1qKkVjdDWSDWk75f4EQsEU+/GK8H8AXylcckzv6KL5pPdt117WjZx+2Bz58/uqeumCF8Dvkr04qO+VVALOPVMKPk5BHI48CyKJZ2AElLXICcI9X+ftt12awVeG4WRTqYqR/X1iGaRmZ7TuGpScEP/9WAeFgw1AMj8697A8E26L4Y3fxtM7nioWntGrSN4zzh7QwDlyw90gUHHHdXP2IOyBdouEW8PS15sDAz8r6JyvLyJLj4mH/aA/xac85m+VCIaTuJVDduO+cx51MkInVNkECuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b93VNtsMpfER1FQHnptf6G03fKoY7RIovPl6ojOoYUU=;
 b=xP6PdBr/95Ku7F0yxFWldrVr4tXd/nSXqd9/HVraWmSNV3fpkws+hRZmTUGbRdTBVm6gvxHeq9+XkWcL8XaazxUJ95BLQgw5anOqfMJUmtnm1IIJBEFJRDmTcT4rMFpuzVi1b/uyif/idJuuqmT3YCxQ3Bpyn5hCYrjvEeM93q7gOG6xruyPRUuFODFEVHX9h2eZdzD3WBy8627eRT9UzXxGvelhGAneK8yS1hpyQM4nLqwqS4mfjRfYvOTaw+JML/yf80lPjdueLyGO0NCKEEX2rJjSLjyHefNzwuea3SmPUzoqUzaWPKF+ApVwQXlu8My63+32xxxfJspGQpbMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b93VNtsMpfER1FQHnptf6G03fKoY7RIovPl6ojOoYUU=;
 b=ZYPftwUHkR/t9Sl+FuFo5PThtJo06zMIb6wJKopEKI3btVcZIRrv3pSaRHCnzcbRA8Tt6dzATuz8FhGz87+yfLmxwRRJQiiIXtsQQRxSHMarivJPBf5oMq4DRVkVwF6RX87d/xVc/kgln66WTA9tQHZje0oT01Ua1A8YRwcni10zr/YHoESTxz0Hwr8+wDBGWeZjzQ8Sv2xFXPARIuZkwv7OYrtKccX0dbW6h9FKBt3YwCPhm+8h9R3Dft/u2TxLmvDl8ANzioPJrrvg5IXAn8GO7f3/phk6ePX2DFaAIjubkZrPzSsxi9KOGR4vQXqUcDuNbHkUs1gJfrUtN/eHEw==
Received: from SJ0PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:33f::18)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:15 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::4) by SJ0PR05CA0043.outlook.office365.com
 (2603:10b6:a03:33f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Thu,
 30 Apr 2026 22:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:58 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:57 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 09/10] drm/nouveau/gsp: require GSP-RM for GA100 support
Date: Thu, 30 Apr 2026 17:38:37 -0500
Message-ID: <20260430223838.2530778-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a412ea0-6809-40c1-30c7-08dea7094ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	g5MIxTluEaXCXj3+Y0LkrohYYHiEIG6JjdU46QDzxIIBIrC7RBA0oWrjVBXiF7VkEspEbRa1tFCn8wj7W5Acifoab0YU1ow/54fOwwR2Npb3s7GuPrRK2/QNzjzKQzh+L8zk8mjy4FiKRf32cQ8XdT0+ghf5zGq07be93viWcuIFYw64tKVzGwa+JwPtumYDFnu/O2FRjLmxXYQRTgJEPqWxDyDwuVehGf7Uy5skgFNli713BVLWgyWM0Sgjcv0MSGBHqiWyZ6VzR8ANkpG5iDB2TkLlYsTXwcYnaOwqSdcGLhSRdmiHpVKK9CngAU/lhXQzUfyW/svZNATT7sDEESeqexSA3pEk21EDzM6fhCckVN9g3wMMI1rKrEOjWNaWlNYJgCDk+Gvs7hiLQRRV3EKkMnGoFmzdWe8Gq1GwTxmvOdeicUkO0+7HlHCUCs8SXL+rL9anOaCVbQAnMaCWW5udA4KhIHSMJSu+0quLUTYTAKmXpnElrVJkQ/Whl6TnhVndf4DuRKHQYl5r9/7tNFRDn7t1boxs5TKZq2h5T1NCZtdns3wxCmZyoeEXBVpLcPyMI3VsGaB3wO7qxvui0z4oyT13kgCuDfgygC3s+i4DSrKOIjCQZ225kfGBhYkJPZ6YTeZTJ+OTMjzpHHzigJfPeqef8Jxs4wXN4R3sreXPzA2JH1Hq6DnJQuoDLedLE1agAbd9C1DXHzk01tEoZ2cBPCsZNzprpEpcYy4Lcbg=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/R7TU2iS42LpCdQWhVlICjIw/n+nPYGCYvueEpcJLM7IGmX/1u6bjsS3B3GVO4c6SWQiLQbt0JXOa4icRXzIhuXHkvPAf7gJnuzatmSHAftRNEk0ejjBvqS5b2szxtF7UQkmGN2RLY1up3BVCzPhNFM46nftLZeuBsBnyG9a5XR5d9iZTWKp3lZ7DTi4C8ZRdVs0MZUVQNKtkxNGckOYt9RoUswyJUoddduU6Qq/vK+ieiyUAFXAYveabylpMMWtLJpiYc/pWQqoPLcm4vrTLJMh3peRW6TAt+/bdB2tnhwKqkDRCuQiusESWpj1LbRZ44qn+mU5ky8/11d7pzfTrjRAn9IPuZKKt4I0jrWoeAT7U+52SY9dqb1UoO+QhjXns+hkvKVYnjWmRbqhIXzxDyzG2t0AhXE9mxIh0C0mvTZiOr/yn7YIxCMY3cLA4JzI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:15.3281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a412ea0-6809-40c1-30c7-08dea7094ef3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
Message-ID-Hash: 7VSUMHMJZGLGW2ZQQRQY7VVKRPI3KC6Y
X-Message-ID-Hash: 7VSUMHMJZGLGW2ZQQRQY7VVKRPI3KC6Y
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7VSUMHMJZGLGW2ZQQRQY7VVKRPI3KC6Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-10-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nouveau supports Turing and Ampere GPUs with or without GSP-RM.
Support without GSP-RM is mostly academic, since GSP-RM is
needed to run the GPU at full clocks.  It is also the default
mode for these GPUs.

GA100 is a special case, however.  The current code has some support
for running GA100 without GSP-RM, but several features are missing.
More importantly, some required firmware images like ucode_ahesasc.bin
are not available and would need to be provided by Nvidia.

To prevent Nouveau from even trying to boot on GA100 without GSP-RM,
remove the non-GSP fallback option in the ga100_gsps[] array.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 27a13aeccd3c..d5126fe39d27 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -63,7 +63,6 @@ static struct nvkm_gsp_fwif
 ga100_gsps[] = {
 	{  1, tu102_gsp_load, &ga100_gsp, &r570_rm_tu102, "570.144" },
 	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
-	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
 
-- 
2.54.0

