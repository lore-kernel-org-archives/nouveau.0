Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF66FF886F
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 586D410F498;
	Thu, 30 Apr 2026 22:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dyweLikv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC23745D70;
	Thu, 30 Apr 2026 22:26:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588010;
 b=QFGad2ks01iAICxTkX2ivcHhGh692KhyZ/Vf7yudLo0JaCBtGtz4dzwAMbux4AFHsRtfK
 Rv0B8Az8fcnjI03i/7H5rzKFcc7EMSTAc4tavCtpIQ8kPqs6FwTlxcZVt61QMT+VOQmso7b
 xsEVv/XWejI5HukjJF+cx4T8PwF3XW7JF4sKLSOz5CsShsZplkhLwtNKEjQ3pCZdDVSQicH
 kFRZCTKT28sJzilMlAtlPv7McR7MTwUQZSj/I26x70JjQwx5rhK7AyNcn72g0Nwf2JPuwQI
 7nXT70X2whr6M/DPUhCCjR6998bw64I1sr+Xy3/jk0ba6g9WdPBwmcXkP/bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588010; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wk3H0f01LiNEdfpRELNDlyvUf+tIRyuHKj/f1ePg2ME=;
 b=OSybnQp/zdrvn5lMyX2FPvbvNtlK3cdscZ+rP05+QRu3H0JN7S8PnSx5h//Svmz7eEmY4
 yw93/xPXRM+OT6tMFtnJ6wqFESBtCaheqzw6IA3CrRLGJ88hnoGxkFDmGerM1A4CFtFlRCw
 iReKPWAmH9CQd+BoilUR0Wcf4AKpnrPxKxAXjR0K6bybHpfFtdlmsoJODmM7qhunr3Bc3Jg
 Ld7EN/Zjaq0F+6vn//J+h4RfUm/KfZnLtyfb1ngyjiWKCRUpwfhtgCGAt/8HYoNKhcDK9oK
 toAWJpmZ9jZF4RQGGypYeMgR/ymNSQLi3XWf4qgB6E/WvCHTkJWtYYH4GiRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C103545D51
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:47 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D692B10E4B0
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlH0S3IaEAJ2LGJ8r2Lf69JJ+cQyZLaj01M/sueVckJ6hdOEsYz6qQhT3KDZ7nTkMdqkGXBgf7PSPnYFf6p7gnTT2ebqmm1QN86/5a1jrXnC8QQzs4tr6lvsndHVbxCne7S5eSrQCkftNHX28LdCcgGeB9839QwAP/Itp0Bj7GYXWHgm5QVz+E4v9OXJGAXGWa5GMvLkOhbii/EpSlw/PLvnHKyaGcky6Lgu2MUMy7VPT4URiYRXp/EhmA6lYx1xVS0QS7XtkMXkeBua/LFEZX/sGYyEGqv6zTV6jCckLW8zqynnS7Ceryv6iaYI+ZEkcw5373L6SSFg0Tgbx58wSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk3H0f01LiNEdfpRELNDlyvUf+tIRyuHKj/f1ePg2ME=;
 b=CNEbbg72p+lcZo+iL9VjLlpmx672cNdsrvcJ4HFwW/BU0f7GShgz/n3dL4Zgju8oD2roKGW5LVFPXgJz59sDkfO1a1O24DR5HmqCgrHWgo6gwzSx20+tsCSA6l1WWlBacEoNsMZybefI2axUvqI40SlqNYgxbaoP7SoCUpfaEQWQr1RaVoGiCzdl6yJX8x3GoafZNMqjcYa27wPzMHc1A7BqeSxPf49MEjZpGOKt1JgkACY9F9sP0m9KgeGpcfQa9HaAGAYifD/ykVuR1ToKS/eKm5s8p9ZAhR1K4g6hspWCqTSU27eP3D48E9G57PCk7j9TQZ1xo4Nk0AEscZsxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk3H0f01LiNEdfpRELNDlyvUf+tIRyuHKj/f1ePg2ME=;
 b=dyweLikvBmTaQdLdtspopBquuRhRpDGKnG0EaF4IgV1sVt0TbiNMqagYQjkzZ/fO8iR0Dc5fTcx+n0AThLWoSIvgP0qawIx8ETAyBZ1hxlRbEv1FAudXyO37QW+/ui2dcURWU2MkdSoH7Vc7kkRJWDiCPEdP81cR2pOjY8LURIF5aykp9iuYacivIea4ERYuc6bgVomKKvClvCMqBmVE63UnKKW+HBk93IH2wQoi1TPNWRdHmidTq0t/vBF/Op2rOd+PeOSHcA1Q8EHRSXFpnJIyVbyECx33aWtUT/tNWpCqZLhKiOY4xwd1ib+QAZBzjNWH4w5aQWO8+qk3a/tWCQ==
Received: from SJ0PR13CA0102.namprd13.prod.outlook.com (2603:10b6:a03:2c5::17)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 22:39:07 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f3) by SJ0PR13CA0102.outlook.office365.com
 (2603:10b6:a03:2c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Thu,
 30 Apr 2026 22:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:52 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:51 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 01/10] Revert "drm/nouveau/gsp: add support for GA100"
Date: Thu, 30 Apr 2026 17:38:29 -0500
Message-ID: <20260430223838.2530778-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4337c7-3d77-44fd-e92c-08dea70949ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zbLyKe0B+XYF+qrvCUiL1bOfEF9ofC4tUDL6guXQow6N2iBaXmx+Hrg7tGIyrKoxuxxEPp3MH8OYULVVd+i0L2FZ0KRYSVIoK4DSN+YrS4iN8DHAVz5MJ65fno86dHBFbJJgUYzcG9+jMW6SenC7xG+L/LuyPhfp1leuN4tcqRXnrKqDSnCLQ3tz2rBrnbnQ3uvq1vnKXd3AoIK0QTPZ/Baxq0sbe5HTivCdKgCmkH4QMeh+uQcNgP4l0rmZCYCIYX2fv8JNUs7WDK9OgYAnqcwOkzUmz/JQiTaheEfo1ybttKrHtTxJ2C3CF6CFkxpX1HHD4wGsyCv4U+CSVZwPZVIuwJn3TLpSK+kVVixe+j2TysE7EA3Uprpwol57X/CyfnbXjlxAgKbxGTn4ZsjVFC1aIP9kTmADu4Q42+nwUzwSHZi6ruAq43piNCBhEJ59NDBTi1KBuKzw3STgwppwVYcqCWDs7ruFmbJx5COQpaYZeoYCEhAbv9n/xm2cZ5+nwNmqXK9Ynhbe5uTR7zfr9a9BEWhnUbZx0FlKyNHB0na/4n+vBjrSWz5PbRhGH1cvRPgUaMtUJJlVh22PowJAHfI/R2QlImwVUAYU7V+HswGZVcKXb9obxo+GXkNePJobW65ioKwTK85NUKFLYiuO+1OmfW2uTBQ8gnYqhu55N/NNGtwHua24OiRQatoxRGeVK6C8uY76Xenn7kvQYIIvSWmp3rGlF3TcOxHS8KF8e94=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	03aWvWYUo4k1Utf794whPN/X54zBon6AKSYC1HqftZjNcY2W1yfpxubXfHSX7fLtbEJpLZEhb7d3kbLNMXjYFRRN0xc+AFV2KEL6IQJ4h0YEeEK+DTUiSGjxlQEFTjhbuzZ/iLAhyNr9Z13cyKKvBsjSO5iz8IfvfGcUNdU06053arF71HNh5r7GFZJOeqQWkQZjdRstYmclB8F1WKSKCG601O7i9L+XAQH7nDCae+bw/l+/d11giTKtZ1u4bRhooTg5OHRMRYNxU/B4WY725O9LJBdbw8RtlgN1QK9HVUv7u6jolRtcqE84RD6v8QkQtca543p2apju9dMNw7zBkKHVkNBuoGKPcLBL49WDxPzwSlDVOI3MJAGMwHxG39i280tcLKdjjjjXcizxrGJoG9q9ePXwiGQHP3WumcVVMTbL7W5ePE1OghLSWQ86QABw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:06.4993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e4337c7-3d77-44fd-e92c-08dea70949ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875
Message-ID-Hash: HNWOQ4BT57K7QESG3BSVLHJFFSE54TNX
X-Message-ID-Hash: HNWOQ4BT57K7QESG3BSVLHJFFSE54TNX
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HNWOQ4BT57K7QESG3BSVLHJFFSE54TNX/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This reverts commit 20e0c197802c545db220157fafd567a10f2b7672.

Despite claiming to add GA100 support, that commit actually has quite
a few problems.  It falsely claims that there is no VBIOS.  GA100 does
have a VBIOS, but it has no display engine, so it cannot use the
PRAMIN method the read VBIOS and must fall back to using PROM.

For whatever reason, the VBIOS on GA100 has an "Init-from-ROM"
(IFR) header where the PCI Expansion ROM would normally be found.
So to find that ROM, Nouveau needs to parse the IFR header.

The commit also falsely claimed that there is no graphics (GR) engine.

So rather than try to fix that commit, just revert it and start over
from scratch.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/device/base.c  | 11 +++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |  4 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    | 18 +++++-------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 72848ed80df7..b101e14f841e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2513,6 +2513,7 @@ static const struct nvkm_device_chip
 nv170_chipset = {
 	.name = "GA100",
 	.bar      = { 0x00000001, tu102_bar_new },
+	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga100_fb_new },
@@ -2529,7 +2530,6 @@ nv170_chipset = {
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
-	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
 static const struct nvkm_device_chip
@@ -3341,7 +3341,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x166: device->chip = &nv166_chipset; break;
 	case 0x167: device->chip = &nv167_chipset; break;
 	case 0x168: device->chip = &nv168_chipset; break;
-	case 0x170: device->chip = &nv170_chipset; break;
 	case 0x172: device->chip = &nv172_chipset; break;
 	case 0x173: device->chip = &nv173_chipset; break;
 	case 0x174: device->chip = &nv174_chipset; break;
@@ -3361,6 +3360,14 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x1b6: device->chip = &nv1b6_chipset; break;
 	case 0x1b7: device->chip = &nv1b7_chipset; break;
 	default:
+		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
+			switch (device->chipset) {
+			case 0x170: device->chip = &nv170_chipset; break;
+			default:
+				break;
+			}
+		}
+
 		if (!device->chip) {
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
 			ret = -ENODEV;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index fdd820eeef81..27a13aeccd3c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -41,11 +41,15 @@ ga100_gsp_flcn = {
 static const struct nvkm_gsp_func
 ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
+	.fwsec = &tu102_gsp_fwsec,
 
 	.sig_section = ".fwsignature_ga100",
 
 	.booter.ctor = tu102_gsp_booter_ctor,
 
+	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
+	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
+
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
 	.init = tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index dd82c76b8b9a..19cb269e7a26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -318,13 +318,8 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	/*
-	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRTS firmware.
-	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), the FRTS does
-	 * not exist.  Therefore, use the existence of VBIOS to determine whether to reserve
-	 * an FRTS region.
-	 */
-	gsp->fb.wpr2.frts.size = device->bios ? 0x100000 : 0;
+	/* Calculate FB layout. */
+	gsp->fb.wpr2.frts.size = 0x100000;
 	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
 
 	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
@@ -348,12 +343,9 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	/* Only boot FWSEC-FRTS if it actually exists */
-	if (gsp->fb.wpr2.frts.size) {
-		ret = nvkm_gsp_fwsec_frts(gsp);
-		if (WARN_ON(ret))
-			return ret;
-	}
+	ret = nvkm_gsp_fwsec_frts(gsp);
+	if (WARN_ON(ret))
+		return ret;
 
 	/* Reset GSP into RISC-V mode. */
 	ret = gsp->func->reset(gsp);
-- 
2.54.0

