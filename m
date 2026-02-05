Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D298FECD9B5
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 23:00:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBB0510E16D;
	Thu,  5 Feb 2026 23:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IQrTLCds";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DF5D341B47;
	Thu,  5 Feb 2026 22:50:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770331839;
 b=zqTaLCM7NHQnVaWfriO6cd5Vf0LNmfnsRDgYj4RzheYfbt+vkIyiYlqaDsqBAdFTLmO70
 09c5oWhjzdeZseoRcYCstBy7cx71bfLx1T0++apWVYOh0V7Y+J9lqezXfj4q1ycf1+/kD97
 V63lj6RzdMchueldHRsXbL9DeBI2iCuWs4O8CeMgSCUVoMqXwUnvYzH+I1p60bCttnmVb/+
 cRX0wsBIVlfebqKeYfS2y+czkep9MlEAQApajQ8KqYYyxrM6lhYqPdHzZ35FV3UTPJ+EVCF
 CDg9aT8DKox6gezwHlYrXWJXtQ6dnej2tCQLTeiUZ7H5EIEZ8kiRtX/0tDtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770331839; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ADyt52Nub/ifir2QqN8RY99p8M0KyTo+amymCcXfplI=;
 b=KvjO4EDeOwfhDNarvg6qt0MQwqCraIhVkCdPSk4P4Icwr0imvw7M/NSa2aaeS6y3uZlTz
 aFEL3G5PFQ4V0PsBqAU+pwdVGcXlK3G8D/sh10dOsJMKyNNl+1xocGdLnCdXCibepnOTWGV
 1PAFVlgFv7Foh4pz74SsJqh+gpaM9370am01hYwKb36al5RiRVJGn4HJEiv6vMIy8FY4HM5
 rC2ny1GRi2AAp+T0w7G9GJYZlPWwcBA+wudNXbj7WGTozkWAYZEPd8JEwWbIb+EkADKNCq+
 Va8lRuL0Qn9RIsvZNQqb5nHfO+HD8vJ/TR9XP2PsYIQwKFeh8DuyGuB2VXpw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EFE6340F37
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 22:50:35 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 822CD10E14F
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 22:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdXhknUbezX0wlFK86+JT4ehhFYFEk5dYeWfeblljRCFIWuC7ZMCpcpGOCH+n83V77GO2qVZR+kfG2u/xJLqvf5RBkFRnX0+rcYjrVyGpyA2rugP+3HvIyvgtBdj8nETTmvz9SN4XCVQCIKKsL4HqkNYRju6SVBFkP+kgp9PW6FgxrGG6ywV609PjXY9bNN96wlqCuQIIRhBGUOqhdH2u5crOUqDJwaY1X8HFWh5LCePaWcRX2LoHG1zzwr8Zrbd8ibfFhkem+ZM9grRPtjfM2Reb9CqQx185wN41wZKx69Ygf38hUkvlFpl84T7Bz/HvB9wlYVPCgixQU0y8DRunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADyt52Nub/ifir2QqN8RY99p8M0KyTo+amymCcXfplI=;
 b=EwoLGLds3q/+oWiexQPKpg3yFjEabg/QSNCDamOJGavCDnrGXT54sb7dOVEACa8MVKeB903ndvKT5dT1bF+Kt+wG4w0T+GcUZB2Sa6HO2MPwr5PCfIJGv7EIalAUOuktHa+ivmOCEdNDrXQxdT9G1uUjYXIw7mA2A5jqnizqB/6I0RGkNHs9phQRQy+9hujQMIjNy12M9kdY83nw+FfUmeulNyQE8rGmYZBt/Ayi4G7gdtr0gxQSYkgOklIGfGwK92jSYJH1/DE+LcbvzkRz5q7A1KapP5RQACfwSNES7oS/lnCqqf1CJRxLEOh4J9u2Q3MzBJ0nxtrmSHr0iJUDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADyt52Nub/ifir2QqN8RY99p8M0KyTo+amymCcXfplI=;
 b=IQrTLCdsX9A3OxCqpASMMchE+fk8o7DuI47ccoXK6genGppytKEyLcNtSb/nPzAl/N7kMWKaINFf66LeGC+/DJNfQplEr5C19KeyeKdsZQepxQpHdqpc3cWzeHG72a2ru4hblZJD+8Hf0beB6qFYMw2lFEulKygGXQXeur6BAluu56kbkwQzNKoSXr93SusvqekXkCHf1+xI78mNerP5lCijNh7VVN+hSKX+M4QZVeozcz8qG78AtGbmALaftYZMRB1pGZgJqLy/0aHDt/cHUFgtjwULw9eRFGB0V+Xv21kBpkOuvqtcgpQm4WjRWQ8q4MSUC10NEw6YghRjDowh7Q==
Received: from BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::26)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 22:59:51 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::2a) by BL1P221CA0014.outlook.office365.com
 (2603:10b6:208:2c5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 22:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 22:59:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:59:35 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:59:34 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH] gpu: nova-core: program_brom cannot fail
Date: Thu, 5 Feb 2026 16:59:22 -0600
Message-ID: <20260205225922.2158430-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ded784a-8484-4852-c236-08de650a44bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T9RgEg/MCx5t29zPgPdWeZ8ud+P/dH3ABwLOjJvOw5cFD3bcyN8O21uXiVDO?=
 =?us-ascii?Q?RQ5CPohtjqvWyPVJSaB/9pP/btYG0pRWuk8QbgqD8hF/i8mlbdNZ+o245cVk?=
 =?us-ascii?Q?sipyiWohlWbLBYPOMr+I5jHv+DLyFBLrq16E4JH44+8gCOfiUShqz3y4utBm?=
 =?us-ascii?Q?1pdSehRr2H6emZT0ETTBSO1szmCp4cJSNsM/3yq64jYU1k7UVSGRY9IxkR0C?=
 =?us-ascii?Q?dzgRcq8gefbiDsVmSzUl5OtYw5DGI397+iMHiQdS25WBzTfJdq4h90c7PXIC?=
 =?us-ascii?Q?UdOZ/uclhRwOBtF/kQ6vW+HHWf1DWkglFIOhKktCtp2NL2cM3/tOjO2dF97G?=
 =?us-ascii?Q?GcHlTmz+mbSxaeQipsAAQGIH0YFu58Ai2xXk4bpEbHZcf/0P+lRtYXnhEGta?=
 =?us-ascii?Q?/jbCbaMCuALzSCE4njQ+JrWm4dbavqVgED9moCtP8cUW17v5MOSlVwCvXC01?=
 =?us-ascii?Q?Md1Wf5jXBEffy52o3n7m/2BMuGVwX4luwex8eGDhfu9HBiugfV1blvy/htym?=
 =?us-ascii?Q?Kupxl9BnE1NOidSpSIzXWrbXjVlOXD1l6emqsaUKIxGgKOUmFw1e/PyDH+9j?=
 =?us-ascii?Q?BnF+CS77HdvXZ48fnUVNK/rWPGGewfG36U5mZnTz5/iMloK/XFKEP0YgSDXX?=
 =?us-ascii?Q?nDjJyDXown7Vc8pcZZtpM9IKtOv0ajBc91QCJU8PX+cqfEebQtPYE59L4Lww?=
 =?us-ascii?Q?eY9RL4Upmje/U4m+NzmaT7k2LOpVjXw6siGccImAtcwPk+uiIJdHEIEfPhJx?=
 =?us-ascii?Q?RKDvVRR1xqLRdanumrbxDprumrJ91YNO5qT4dKjCiQasZpJ6aGV+yn8GEbu8?=
 =?us-ascii?Q?cRIwN1/28m+wYeaNA3C7yGQW0oiHX28VhZBAPWqnoC5faW4n42DULyTEaHDE?=
 =?us-ascii?Q?ALd6PUkdJTKfh+DKDdT9Hgpp/uzCZUWk2mPI+fUdtdMRh+b3uha4uOSuADgK?=
 =?us-ascii?Q?ZChQAWMzeNrQou64PCe++oKdXjEP0y4h3BcgWYI3C9mrN7u56XVWbaE4egGv?=
 =?us-ascii?Q?U9J0mmzn+q7tZ2J4SpN0XXkcLR7m+hr15gU4qD7lbuxK4qA4WNvTa9iU/9Vb?=
 =?us-ascii?Q?5gDGX/UfwBYEOPM1ZZNYfj0pJYS+AnePxCZ6v/3xszIuBg9FHdcY7nz4Em8l?=
 =?us-ascii?Q?i4LWCsR3yppLtNcn/8qJa1fegBtlq2f23rzcUBGicM6338cTuw9YUzWTBS1J?=
 =?us-ascii?Q?RUDRwmLO7ETbZDnQ9T+wr5wBx8JEB/qkBuJn0HZww7yIAGGSP+blEr607kKe?=
 =?us-ascii?Q?OzGZI45EOD0ySrdCNxJDRQSsM3Frr3hsS2jceLe6YfQ0HxP1mMAf2OXG8KBo?=
 =?us-ascii?Q?2+s5YjGlMzeA6kDR+Jav8EIpqp7/noO7IpapPvOQ0oL6Asf1jzh0ewOwB50d?=
 =?us-ascii?Q?qP03K9ozS4HBq2guhQurkpJZmsW/jpWrQRgvdzphYLVOpynR0Np6UUy+t7h6?=
 =?us-ascii?Q?uoCsruNeoX/MVjJl4kwQQ6QdUfv9kSFinA+VMd5QcWunbmjfB1dXZkaUb657?=
 =?us-ascii?Q?eca0DChxyPQfte/2bhunezYG85Pavlbi0rmXjKT5iHWYu0RIlm43d1u/c6Th?=
 =?us-ascii?Q?fojzlbI2ouqR74E5+XO3YKNAnUjdVXjBVvooEx4e1URnjTfQ0jIvVGIjLsHt?=
 =?us-ascii?Q?LJcBHBdXZbm4J4GDkFgWTwqfXryqAzILwmy036ASCOp1e2NVZ0aahN8EGreV?=
 =?us-ascii?Q?g7cEOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QFkKqp+63skczhN2SzmKWauNRKKCeTI69lbo64RKhDVCZr03qHytJvf6up2ncfqcKIxqA0SwOG4xSspwQlMlSoIffF2o/aYjJdQcSW4O+PBIpNqqlDSCqhoDHFXsdyGmSeoBTjbIq6clqIlgmzzIhSGY5K6piWD9WcN/7Acc65qwt0pifNAKmnUYfOQnMoRGVQL3zdK7UPhmE3G8oadDjkI/BN+BqxJ611yu9mfGNNqEuAnVVO4O/jkb8pzqQkKkVwoGhTqoABsAqz5thpydVIHCrYe67s2/iHuNDJjZM74GYdnQL+K9eVcZgl7hpIsKxElXXvBAKNQGFh+yrYqHEfde7Zexk8t7SmTF0T8DOPZBhcFmpl+/+AVAQwSEpmoPgsHBob2h1pKyWGhe3FQJjDBkHlDlwR3C9FM/LOicyXEHbnkCyi4M63IGy73K7aTj
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:59:50.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ded784a-8484-4852-c236-08de650a44bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
Message-ID-Hash: MZS6PK7INTS7P6TFT3SLUQ5USNXRW4R4
X-Message-ID-Hash: MZS6PK7INTS7P6TFT3SLUQ5USNXRW4R4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MZS6PK7INTS7P6TFT3SLUQ5USNXRW4R4/>
Archived-At: 
 <https://lore.freedesktop.org/20260205225922.2158430-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Change the signature of the program_brom HAL method to not return
anything.  None of the implementations can actually fail, so they
always return Ok(()).

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 2 +-
 drivers/gpu/nova-core/falcon/hal.rs       | 2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 8 +++-----
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 +---
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..14a789ac625a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -532,7 +532,7 @@ fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result
         self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
-        self.hal.program_brom(self, bar, &fw.brom_params())?;
+        self.hal.program_brom(self, bar, &fw.brom_params());
 
         // Set `BootVec` to start of non-secure code.
         regs::NV_PFALCON_FALCON_BOOTVEC::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..c8480e8afe0b 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -46,7 +46,7 @@ fn signature_reg_fuse_version(
     ) -> Result<u32>;
 
     /// Program the boot ROM registers prior to starting a secure firmware.
-    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams);
 
     /// Check if the RISC-V core is active.
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 8f62df10da0a..478823311c83 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -75,7 +75,7 @@ fn signature_reg_fuse_version_ga102(
     Ok(u16::BITS - reg_fuse_version.leading_zeros())
 }
 
-fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
+fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) {
     regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
         .set_value(params.pkc_data_offset)
         .write(bar, &E::ID, 0);
@@ -88,8 +88,6 @@ fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) ->
     regs::NV_PFALCON2_FALCON_MOD_SEL::default()
         .set_algo(FalconModSelAlgo::Rsa3k)
         .write(bar, &E::ID);
-
-    Ok(())
 }
 
 pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
@@ -115,8 +113,8 @@ fn signature_reg_fuse_version(
         signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
     }
 
-    fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
-        program_brom_ga102::<E>(bar, params)
+    fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) {
+        program_brom_ga102::<E>(bar, params);
     }
 
     fn is_riscv_active(&self, bar: &Bar0) -> bool {
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 7de6f24cc0a0..c38a556d1565 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -44,9 +44,7 @@ fn signature_reg_fuse_version(
         Ok(0)
     }
 
-    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
-        Ok(())
-    }
+    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) {}
 
     fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);

base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
-- 
2.52.0

