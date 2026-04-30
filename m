Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7748FF886F
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5FD10F4C7;
	Thu, 30 Apr 2026 22:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gH8rrU08";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01C0D45D74;
	Thu, 30 Apr 2026 22:27:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588019;
 b=FCuzzI6oWtR3knTpfBZBBQsYZaXSnaiHOwqIxWzqqaq/54MdvOWYBw8MJ2/Ch0BCmt0kF
 qPK+b0va7QNcRGUn3yPjp55UnPf3z/MEiGvM/C48GR6iN+DrNutKqhj/dYbITiiRhO5vhD8
 NNs+xTWlLvuCnA5MmGiMBHSgYoqf2cVSAuXQr1D8IqzPBDczcXT8ptnfDbIFvz0g3oJdgaO
 tMIsDIVH9gNghF7kK7uHBUiChHwlZRRW4eE2w5O1uKSKBQVmySFYNIOMuozf6n7WFI+IMoF
 3/+3G65eNHIZnishMnNZPJtbJ7+cSiZWvJbWAOivSWEtCJCcIqwHyssX8p+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588019; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=va+Fg6QXTy2VRrPRL5NtrLeZ2HKQffv9XFfVEr6jQ2g=;
 b=jLG/+Ppk3uY3x4+XE/MODraq7vvrUiqECsfP8PxjH4VwVPBawmDlsU9mGf6x+aNCNsIJO
 GZVS2QSjfIjpT7L0M/fVao75DNtIGmNqTH8Ift1c3sh+Id70Dqs/NrOai1H5MO45dWTxnmI
 WjpniTMjk6Zdl0HbHQl9jJI0+TFDtduZ4ViOmM/tPTT8pH09Quuus4CqE3Iu0dnBApOn05R
 FOjRHs8VdQiWl0gKVA8z7yP3TRpZ5e53JLB82MFG8tomvTa3kZI1CPBwR4nSXHiG6QxzORk
 6yvzVGpzeSnuH9teEqoQHjRTHDxHrdf4dqVIsB7Ub4Xjs0YWTMt6hT0nFf3Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8415445D73
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:56 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9C3710F4B9
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlRhiQEnH3WV3tyTjjoszBn+VUZaw6oX5vtOfZ5arL3PAKvJ6sWz88xfCWbBJI2Be5k35Xj/GiRCnoS+S/hXCw5eYnpdsvY0bSHzUojGPe+vaeOhOEss4Oot467eRg/dAc4fniZW1Fv531yj7xyFdMe3pZbepxQhvWImCrLYILFOAdo2F5pXI8tePHDhDSfjCsxncqCbg4dpgbjHtmLkg8IV2Y1vmrsxB4uEyJtPR84Cfy8CimM8q1jFI379Kr5rE+eOH1mFx7TnzBbnf2lhzzt1+PEYJIgV23bzBuf9mSf3U5Lwvzpni4oTiQWPCcxEW6MswuBUIIlxSoUYcA7tNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va+Fg6QXTy2VRrPRL5NtrLeZ2HKQffv9XFfVEr6jQ2g=;
 b=pG7TfdXPvPDBFZi+otQk99BEFOUrfVM+15fKEOgrH46EQmgdLIV3a+aNkAXl9Q2F0FFtORz9+plPUVT22Jrwm8V/9PJjfsZxBHmfndAZ8TOadS/SO7qSrQ1gHLy/dBoabfbtWsB0LV2mn8S3HpnKUepczwl2YxMQilXTOBwilfDnn1b8MNbJXgsBGx32e8ZUUmvtacun5fOHwMEmt/0BZZUmRZxRhGsA/Olesmgv+pZq9n2NmxIpxKfR3DFFicLnWxXPwPMMAuoBERHx8ueuPTFir5DE6JmlzhZk6H4bUN/zRUMFfyAMVdb+er9iWh38syBkj/9z6v9oQ2sIzIMEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=va+Fg6QXTy2VRrPRL5NtrLeZ2HKQffv9XFfVEr6jQ2g=;
 b=gH8rrU08mQ/GrfYtj9opmZCfUtGBcVmnkPjFHb5r/4N/wOLsUuAVqdxp2uB6CapK4e/crpSHJ2ZMQLIyYPMOTfiAJI95e27e93IpVz4M9vzRKGF90/bruptj3CYthXB4tcNnKjXOp05CdUd0zp2UmP6agb9w4SxG4aMZzW/tJitylDnr/2SVNwBLfYearBL1NzZw0MMvelAPlMxHcwzQ6DAlHgjRWjueGp1DCuH1pBxIQULKXmqSXCz8+d9os8eXbFEYy+MGRdf4cDq0c0bSH3TztgySHU6NFPOlFEBJtfz+nlpf9rYs/QQMWhJ7EFcBq1EZ+Rnk8eDhZ6g7rrVlyA==
Received: from CH3P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::22)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 22:39:19 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::18) by CH3P221CA0008.outlook.office365.com
 (2603:10b6:610:1e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
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
 2026 15:38:54 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:53 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 04/10] drm/nouveau/gsp: read MMU_LOCK to fix WPR placement
 on GA100
Date: Thu, 30 Apr 2026 17:38:32 -0500
Message-ID: <20260430223838.2530778-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: e93ad53b-5d33-4260-0de1-08dea70950e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Y50taA5QWf/JTU9+hf6oHcf7TEeN39AqdnrZ+CjBnXUCWOAuZdO/jL047np42Ctd0pE8csJkleznkFBW1GbU9UaDmnIFa9nejcqdCFvDGz2qGKa0E+8Sz/JIO+tIAJGIVfXY1oxI7gEQQ4+M6LL2HixEYo6EgRN3OdJ1NPiMnzs9FKt7bTPmNH5ZU05p7vLyJof1nU+udawDYbCQX9Z6AJGqAKz8xjvm5+2pvA+t9X9+Y2P+1IsNJyzukMH8oqCXsdKJw0Q9JzjQco+I8tIlL5YPg4gjQ7F3yEyqotZWKdz06SVddXucwMZreFXejUSF9YJZQQWIdH3T9LfyIm/xVLQiByfJwEttIFonILLed++1pOvGE/qi71tDc4QfUVzxPlt10pDMArRsiKMR2v2r/GXVKT4D6Kf+DHgt7+MGFUtGXY/AT5KHBA7gC1QddJlAY9CgelkXA9Z2n2w/C2QpANjZ4YqI4opqrYZ2HaiIjcXQ+oXzIjEfIt4pxHlnhbsPM0pBMiuuwqK3agPFJHTE1nKDoZW7ZSC1rgIfmTOXBGoc6kxdZn61I3GEVPoulW4XC8ZEDoXGyMqaEMgfXCNh7PTacQWpOZfNXO+DrkdNs3mo/NA6HjstbrKtoIGpzxIZqE/UgyEc9qXArUmCOHbkJzrw1Byo/G1Qn0X8Q71m+nJfXowOIKJVveMBr0MCgjKaYvExCuf5rG3Zcy0lnvZuFAk90R1mYu0/1ZyhCYXd6B8=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3rx7Y+XZPIBuiqP33PuY9ltDqZbaLQV6kq/u/XvzWqHXlHYuWWt/+crR3/z3d5xVgv81t4O71jqyytOCg6MO3mvVGOHQnurscRQTWHgHTOOvuGb1UoUF/MFxQe5zB+XIskGFrno9TFOK0+Cb2DuqHS79Hr/oRW2WSAwmdaOKlGBPW5SC8FltGplC+mhpKM8b9dCvVAGQiyp8ASP1MgrInAkfz5zwPJ1Yl0SIYxhN/zV+OowY3AaCfPThCO2LIXbV4002ceKlQ+FPjmNLAG4C/lKl7c/ptpTzLjE/f+RLS3OLDo9cvpcGudI9SaJrPqHjM8QSkLPrK1IwsavI5+nlIGiIrxtkHpMOGOPAPwFtLqpPYkcpa6Mvocc9BMQI5lgi59ZyBpH6waS92c2zBiEYhkyy0EI9lR7WkkD2wv33kkI0TKH1ED81aYriHljxC2uA
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:18.5158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e93ad53b-5d33-4260-0de1-08dea70950e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
Message-ID-Hash: DJYROVRHUZVFUYE5GMB6N2KAZQMG45OH
X-Message-ID-Hash: DJYROVRHUZVFUYE5GMB6N2KAZQMG45OH
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DJYROVRHUZVFUYE5GMB6N2KAZQMG45OH/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-5-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On GA100, the row remapper hardware reserves a small amount of DRAM at
the end of framebuffer for spare rows used to repair memory errors at
runtime.  When an uncorrectable ECC error is detected in a DRAM row,
the row remapper redirects accesses to a spare row, transparently
repairing the fault.

The LOCAL_MEMORY_RANGE register (0x100ce0) reports the GPU's FB address
range, but its encoding rounds to 1GB boundaries.  On GA100, VBIOS
originally rounded this value down, which could lose up to ~1GB of
usable FB.  As a workaround, newer VBIOS instead rounds up to the next
1GB boundary and programs MMU_LOCK (registers 0x1fa82c/0x1fa830) to
mark the gap between the actual usable FB and the rounded-up range as
reserved.

OpenRM's kgspCalculateFbLayout_TU102() handles this by reading the
MMU_LOCK registers and computing the WPR top boundary as:

    vbiosReservedOffset = min(mmuLockLo, vgaWorkspaceOffset)

Without this, the WPR region is placed at the top of LOCAL_MEMORY_RANGE,
which overlaps the reserved region.  The booter firmware detects this
and rejects the WPR layout.

Add ga100_gsp_mmu_lock_lo() to read the MMU_LOCK range and clamp
gsp->fb.bios.addr accordingly, mirroring OpenRM's behavior.

This is a GA100-only issue.  GA102 and later add the
NV_USABLE_FB_SIZE_IN_MB register which reports the correct usable FB
size directly, eliminating the need for the MMU_LOCK workaround.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index aa3ac34989b7..66f285b60f1e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -291,6 +291,42 @@ tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 	return addr;
 }
 
+/*
+ * Read the MMU_LOCK range programmed by VBIOS.
+ *
+ * The row remapper reserves a small amount of DRAM at the end of FB for
+ * spare rows used to repair memory errors.  The register used to report
+ * FB size rounds to 1GB boundaries, and VBIOS rounds up rather than
+ * down -- reporting a larger size than is actually usable.  To
+ * compensate, VBIOS programs MMU_LOCK to fence off the unusable region
+ * at the top.  We must read this and keep WPR below it.
+ *
+ * Returns the low address of the locked region, or 0 if not set.
+ */
+static u64
+ga100_gsp_mmu_lock_lo(struct nvkm_gsp *gsp)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	u32 lo, hi;
+	u64 addr_lo, addr_hi;
+
+	/* NV_PFB_PRI_MMU_LOCK_CFG_PRIV_LEVEL_MASK */
+	if (!(nvkm_rd32(device, 0x1fa7c8) & 0x00000001))
+		return 0;
+
+	lo = nvkm_rd32(device, 0x1fa82c); /* NV_PFB_PRI_MMU_LOCK_ADDR_LO */
+	hi = nvkm_rd32(device, 0x1fa830); /* NV_PFB_PRI_MMU_LOCK_ADDR_HI */
+
+	addr_lo = (u64)(lo >> 4) << 12;
+	addr_hi = (u64)(hi >> 4) << 12;
+
+	if (addr_hi < addr_lo)
+		return 0;
+
+	nvkm_debug(&gsp->subdev, "MMU_LOCK range: 0x%llx - 0x%llx\n", addr_lo, addr_hi);
+	return addr_lo;
+}
+
 int
 tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 {
@@ -304,6 +340,19 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	gsp->fb.bios.addr = gsp->fb.bios.vga_workspace.addr;
 	gsp->fb.bios.size = gsp->fb.bios.vga_workspace.size;
 
+	/*
+	 * On GA100, VBIOS may lock the top of FB via MMU_LOCK to reserve
+	 * space for the row remapper.  Mirror OpenRM's kgspCalculateFbLayout
+	 * by clamping bios.addr to min(mmuLockLo, vgaWorkspace) so that the
+	 * entire WPR2 layout and gspFwWprEnd stay within usable FB.
+	 */
+	if (device->chipset == 0x170) {
+		u64 lock_lo = ga100_gsp_mmu_lock_lo(gsp);
+
+		if (lock_lo)
+			gsp->fb.bios.addr = min(gsp->fb.bios.addr, lock_lo);
+	}
+
 	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
 				     &device->sec2->falcon, &gsp->booter.load);
 	if (ret)
-- 
2.54.0

