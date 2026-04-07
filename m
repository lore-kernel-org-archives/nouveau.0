Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B4FF5135
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:21:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8510E4BD;
	Tue,  7 Apr 2026 19:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U5ys67LG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C4B4B456D8;
	Tue,  7 Apr 2026 19:10:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589021;
 b=jS/3YcJg09SqxINpW2PDxQ2bFawMF7vLYulXlRGoKxJtC0+++S0cDSdMcrfRsLgckatF0
 mRYFVKkyrzieAvPrUJW6Y3EwNkp2k2+xG2oaEVRK2cGwyw5xRxA6XmfwZW/HZSxdEbt3MnG
 6MBsPuwE6c9MBwQC+MviQ4Le14kU6z26KvZuXT7uPemmoUPHD10sKEJhsIHlIwDeRV++fF9
 3VWXp4UDhUo3rwXDiZhjFMx4b6Ir15fFkOBxPVcH1+jr4IUYDanEagrp8/u67woB/TzweDd
 y6zzX2UqD/Ek2O/6Ew6JR9LpDgJLDhi/eXSRSCFn82zK/mN9mG789aJIlJQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mxAfE0YH3eW6dmwVErDLEeb+H5dWji3yWDQkKIUlG4c=;
 b=z4eDS0FN4w2y9Sgz56Nzf9YjXD577AM1hap5JLfm3j6LPS2cCN0Cfo0zSAwoVOut2sSiY
 dk0bHLQ6+UWdmInnPaOZWDrKzQ+szyr+AxkkiHhwO+IPGPf+nO7ux1raKJ31lPFYGwEMHul
 885l2FrwvGab3a/1x3jkINVcclVE5mZtOZeujfwzqxBZ5Cg71nmpd1qxvFg3Vit211QgN6O
 ADiTBvnzvXvWFHXrZc9WQK5nRnzCTKO1ZtVzfadTNb+bNzy3VxwUT2v+nVUvPDNV3pzpVho
 LcytZHLrn4NOZEE/6wlRCkpzNZEQtNhaklGTwCDvJnaPyOSYKS/bkUydue7Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2524645642
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:19 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3110E4B0
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEOgC4tfo4u9lbWNC17zZUbb6OXALixqvCxrYMw3Sla6FIgLEcruxJgI62OABusZHn7M7h6mG3RdsEiHcB+gOffAG8Bf+1j+ArGSamWdzil7ckcpAcKYsbpCtF3Z3iW47ARcktJ40HojGq0QvSSzar2Vlk0eupw1/SRzsOg9ZTcIk22k/VbtuGkqxBgJH3hlGi6Rp4KhT2QSdae8DqscoldzxbGT6IboN9XlyaytfHd9jGgvsxRTa2mfkXLbkJqnFOeuu+q0IHSS4oSzqTbXUhi4+R6uXfwL5NUddV8EptKwSlhSwuqSPOZLaGpPcC1b15jrjSRukXdMOL6kjEenNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxAfE0YH3eW6dmwVErDLEeb+H5dWji3yWDQkKIUlG4c=;
 b=yLHQjNVpc9YT9sQn7lX9jua83RmQkpaeBMXbvdzusIXOwmxTYt4v915gPi5MvvPBhMHgEXCDnS+Qz/2VkBt6yQwBpSvX45m2svyoT0P6t9LGiVRKgbfL93yX+MDewohSG/WhbTDkLl1CMNyHoTsk63/cL8shsfGRRVK0c5Z6bD6gIhnGW6yye2+aus5uqgSiJ1Kjlko+wTPusQk6x6YxOIAphpnC45tMYPxWQD2Jq41FcrNcRi7rFzqaudNeQFk5fEzVCoLUlbiQmut9KBTNuBB0GaGLq17/98OjqoHa4WslhxSwWUM56UCsAgzJr/d4GE0zg7s4i35kbxvdRQcNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxAfE0YH3eW6dmwVErDLEeb+H5dWji3yWDQkKIUlG4c=;
 b=U5ys67LGIGu8+Ta7sikxaiQlVW5FGqh4T6jlVebednM2h9zlc/Dn+1eK3COnjkU7PPt0gM8ysz3f63pSaYcgBvhp5haUi9KCzss2Ys2pfWD6hF8rVpUA9idmitw697sQyrsy11t4jWG5gNAQu9MO17hMNPtU3WKvlOUOjSfzqVONpAjTQwBMfJYkIfVjCQkunCt3o8x/eRVk8U6KxFH7xIZuNwNeUHq/HwVYyghclII8LCMyGJxlSX703jlb7vcYarj10yrcLuOFUJPk5oExOXUm2YR3yZ7HWVJwBceJHiEAr5f6Iw+TTzHVEU16Fer0m5IU5+BAqIBHVJ8QWpUfcw==
Received: from CH2PR04CA0023.namprd04.prod.outlook.com (2603:10b6:610:52::33)
 by BL3PR12MB6596.namprd12.prod.outlook.com (2603:10b6:208:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 19:21:48 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::ad) by CH2PR04CA0023.outlook.office365.com
 (2603:10b6:610:52::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 19:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 19:21:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:32 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/nouveau/gsp: require GSP-RM for GA100 support
Date: Tue, 7 Apr 2026 14:21:20 -0500
Message-ID: <20260407192122.3055293-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407192122.3055293-1-ttabi@nvidia.com>
References: <20260407192122.3055293-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BL3PR12MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 7431d999-aebf-4b3d-8fa9-08de94daea1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+7WymARCYne1Q4T34Vpgurdx+4D1iaqnvTaImnKgvsmdlzfW4rJl+oTYs8qLnmPdeZ6oTasq/F1VjGpSIJg3LJJCVAh7xQDoebtE9faAlUbzAXhO1iL4MF7QjOll7LlCtmfXgAPkHqf3aCggg1JmA720Lx+wZnnRYcX4xezwK9sSNC2lwp2Otik2RSWWfZ1XmZESc9FWBysLuOXR3/GkepSNPv5K+XKWW72u6MFIrfWnYrYCAXjXdauOiyxJ8pjKYjLQ+KLfjce+/Q985VXJxWhFLo9837AAUH8VHGPSESQ8w3U0zy3yPF042lE3uhCz35h/Od8KR+YI6BIKHg845xSHPbRs6yj6liTYG1FPv+nreNQdPgIPM0VRD5xK/9i5sewB6kwh331FDWjiE5MMHACialPwJKJAtgtkg+inIpcSIqwD4aRUQErhtiwZDZ446Wm2bBGLYBZKU/cwoDBqgZAmoYzaEjSPm/knifuvGKPke8WIH1+nfiH7ttdS0gDgt3N1vKUx9aftU9++/DvDgitpD0PSTu3Z+Dn74NTPjhb4ztDc6lrki7ViornJRDhfV+0r5Mrn86Xkga/EwQ0Bl5j+Ctu0EG0FlCXGKx57Sg0cdCpbntOk8glvxDdqTB/dyAgRWz5+UbSoNV4COpfSmVrtLoDqvgg4cHkPMt85gooG1dtodfM+37LCeq9cMPZ+oEM0c0T2sxWe2zJfPdKQtjWxNwXz9kU3fc18jgasqivrwYTZAbPW3UEq4hDBGFXX8GZ+XxEIEwnY0a/wbBMWSw==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gGzv8yTcYO3+xlYXdC91SkrFvMfpKxDymFjCyTeqJ4V3dq0Ro42inafIbJSn4FglS6eQAeWx+UzywjWAOLqID0tMxp9QmqE4EqrlAn1x8FAXSV3tqgHPzUEqE0hmh2rq9xsZRY7JNRm78adjiVers1pUQMzmbhlXSO3rDOqbrAXurdlqCIUneE8lhwJ/W8Yr+r8oFRWvEPjL6RWYFqD/M6mXCplSSWkouunXFECyzplfa1mH+h8oZT7aoRX7S9h4OuZjACpY+JDgXmAHS2mVKqTKP/Hx65y2q0kBE/j74h9ycXTprfmC0ooLun2cBUKmZYSbseVv/RJ5EJVortzxuMkRGuwHFusPBnhTCmNuEkktI7l1/Y/r9hDaX8ASJhrM7ZK22NJXPd1g3vxHYJrctkWjNv64dq+GbO0y54FvmM4xDe/DULXy8gbnntJ6eHnc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:48.3284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7431d999-aebf-4b3d-8fa9-08de94daea1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6596
Message-ID-Hash: 4GYBQXU4B3IFG33OU6XPJTS35E4X7PXS
X-Message-ID-Hash: 4GYBQXU4B3IFG33OU6XPJTS35E4X7PXS
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GYBQXU4B3IFG33OU6XPJTS35E4X7PXS/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-5-ttabi@nvidia.com/>
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
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index fdd820eeef81..cc57de99e59e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -59,7 +59,6 @@ static struct nvkm_gsp_fwif
 ga100_gsps[] = {
 	{  1, tu102_gsp_load, &ga100_gsp, &r570_rm_tu102, "570.144" },
 	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
-	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
 
-- 
2.53.0

