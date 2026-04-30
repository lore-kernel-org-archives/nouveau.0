Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2951DCD13D2
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 063B910F4C7;
	Thu, 30 Apr 2026 22:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xf4LnaLZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F6A145D8D;
	Thu, 30 Apr 2026 22:27:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588028;
 b=u7x6CMf6cD4R9+WW/mQrMwVnM67WxE8XyL9tA6bZNKt+p0NQF2ywxiZ/XVtUMdZXfSm7b
 gVUBuQKRCgNYwLdgJlWsckIdfqgKRPhrQTT+7bkcSpbpzaR6AbxbuTJ0oJY/C/W9d0tFaMR
 bCZin1RAM9nkY0IkF7j1QCPGgX/3Na4jg2pkjKfn72pP+xw/QsNRKnozb9mBgSUFdF+38JW
 oqXWH2b+IMEUHYSbaoIIFmFcpbkXcJ7onqtQbDuyWrN4lbuoj9r5k9NQcyafWpeYt938w1E
 v+rE6JeMOhnymamwkpKuZz5jJ1l4xlcioYZMD+vX+2/RpzLJTv+Pqf4spcKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588028; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S/IMTBIuN3hgvUMdbopIvPeWQHY6EDU0cBwySQ4M2Qs=;
 b=qOhRbgvEnluKYSRnozPJS8rcGreQta2rmJMHbcd/4pX28+wFLNhst9FgoinQpWLqJde8y
 R0g5pYNPq2Ol5RfbyNtMPBTRapopXA0tMQq53AWxRrvwDh/wWPm8u6e5nIGXGxkdbVEmRJ+
 NY40SpBbxg8MlbR0+8B1a8wkVRBaGHsGR37eK2q9mfWK3eciAsfRiwD5dOb4BCCEuXhGHOC
 fkSuXKnU0iIl1ARroxNsns1Gb4MoUqyRdU9M1XRidR+choXejvNpYs+M+bNMiYS9Syga4mQ
 hFBaAWTN6rUW4K881VQDNQJP8cCvIppugLy5GOVMj6KzbC9Gm2mY9oNDOzSw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C763245D6E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:27:04 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A47610F4C6
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnj2m4/xu69bRX/ioV3O/b5fdvu/OG6L235xFE5g15Eq19+uzcrMKwVzGOTxXyqr9l0jN9dPI3ekq4J+LWZqcLPhj3UmbnxmCyVWS72XEcioLKysNSPn2PiL8/S2dcqXHvqGe1BVRKfLkP9lp8Vp0HfoUBt2njEaj3kiyq6LxIog1WHiyiSw/xpJ0n2dipRn9Ff9H1+ZRqNCq5EN4nNIcH45A8UD+ISyflg/taAJRsKHcSwGaKKNoGYiTaZI05V2X+Y2cXZQra6gsK5er/cWaxzXiD2+WRh0XjKv15oirjV1DsPUAvmECkvrA1Ddby1Ewoqm67RADQ9N2wCmn6Ijcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/IMTBIuN3hgvUMdbopIvPeWQHY6EDU0cBwySQ4M2Qs=;
 b=mD8otdvvFDbTej2BenN+iF87gcJj0iRvI5U6ebWPcAoa0/fCRj3F8yrcq8HdTZoU42WU9BJk4K8jRy10MraE0rA8i2WBpRC6De3Jc+a7hYt9WzHRG4+tS/jgN/0HwFfdP/zu1TKQN1tyYOeD6icEcAZDPjCb5bt/Ge39HIMwtVQ8cWEydZso5u4LtLrB1wlguKeVtnfITLooDi97UkVd4jBrLHEzZJWNEV3rzhPipRd4p4A43I/PQV2tZf0o7tHSxa2JcT1z+we/PtBwmJpCIvs7qZQ5VOp2jAWQayQyAPlZqmJaA3xOiQ2bgLFUWOLrbbzj+gP9wRUY/S24g3uUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/IMTBIuN3hgvUMdbopIvPeWQHY6EDU0cBwySQ4M2Qs=;
 b=Xf4LnaLZROlhn2dLkBNIGNweqxdItTaHtf7i4Xx31h4kIUOGKzHB3DUEH/ayviOUg5PXc6q2jO9GOyMrK3e5h8gO0WfaoZzt2wnTPbr/Xj4roCASSbUJmBIYteSti24WLY+GuvV4RbDw7ET61nnW1BbhiW6KV7PR+iB4nO67462zfuYEEPmy8latLEBvdmN2oywdXXJcZAwP4mQwVcKFidsIwzLWQHUcvyHfD4wYEakGr1KAAyFBbgA2udsOxyu6Kpi9cEPwg9Ir6g5a1VqhY19GL5QaBiJplAKAmIWDhEfyqTXKKumllpCjeIE2WmfQtkoqQ98WNRHB8u1aL+GAKQ==
Received: from CH2PR18CA0022.namprd18.prod.outlook.com (2603:10b6:610:4f::32)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 22:39:21 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::f9) by CH2PR18CA0022.outlook.office365.com
 (2603:10b6:610:4f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 22:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:57 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:56 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 08/10] drm/nouveau/bios: skip the IFR header if present
Date: Thu, 30 Apr 2026 17:38:36 -0500
Message-ID: <20260430223838.2530778-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0533ad91-4f39-42c1-397c-08dea7095242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	3x/HwUEgVs/IxbNJYVWGjGcOwI1AQXgRQN8fUMUXjIdTksH2BOdfQij4SX2XFNc3QpR+Tj8Sas+W722N3L3LN5KY9UXWA3YvIjENMgQLcnJNARyEfPCdNqoeP8hiEaqjmYoxOFOkRQ2d0Dphbv8+iYb8/Ua6ACd71wIPtDzf8AdX7hGC1r38zGdNva5SLBl898AmkCToQAXSwllQpYI+t1cJqvmg3+9FVHOEukvRG8RcTjBDvsl0AVzQAFQ59p3o6TROsKRKJnDfXZYNnrvitUF0Hswaqy2Eb0Bvo1Lf1gGpuPYgsQFsuYPBm6TtPME5vBh7EQt77d03BYu8TbGVUJKAbRTzPI4TA1z/JQ89jBa7VgjYxbcCtZXWX5JisYnH39NVeb0kCYpRQHGLKphmATMZinJeL1bR9A1PEh80+XKV8M8rWx2XPUzpoubKqfMBElPCcZcBLQuGLkOIz6cu4XykKjfuHXQfE057EygewRpVesOybJ9FBZs3rIuGWHeLNHnBS2EMJoCCWctlZXqQ1h2zQdcAj3aWv4SPFloCG4UGYVD2ZiSgtlZQC/p2KwsaiwNEyXt+NShc4vRoKA6b3u+Csw7ljx1KpqS3yiA2uowpUlPuNeqDNLm1qKNIJjTKpQzyts6ylvZD3a7DFyheDEuCI9oBcko5TDlMujxHEaBXFyoGntsWnTsYyJtHLOv/+VddOIIPHZ3LYq6vVrCbKF+bqJX/xlPptCskIeE1Ewk=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OSVARnzPL8npaLTPP6Z8sTx/4m5Tw8l3OwvVFFZSZurq4umLuioMBGs3W2EbawTKAx6GmuyBGKktAcid1nyzWjzbDYrHkZeFbX4iaU+OB0WqS/ZxNbIjufbgYTawo+pDER5NWpYVcfyw1+xZWRS8C6C+ci33sAA6BhlCk+LTbcrsmJ8B16jBBznwI0rdPpSbe/pC7O4QyjJcKGgqXqR7+vOHnt18ZCf9VcPwm95hoQFJHEFQ9BBADtmEtclJvQTfGdGaQK9xK1igjdHokVaowQ8jdTPBWxKiEbw1Z2qc/kK4VfIG5NhztknKTbVTuTpLU386/OKka3+Dtmyjxz0pG25KNAFn+BojrqBVK9mKiO4orC7vfrAJXDmcDy/UBmrHyx2ccZAmSiaxIAOVd55EfXZ4jJ92gwZG7DuT+tkfH6ioCp7jgtA1wdROCN5UtD3c
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:20.8113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0533ad91-4f39-42c1-397c-08dea7095242
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113
Message-ID-Hash: PXOYNY5DMAA5SSFPPEGOSMA7UZD2MAEU
X-Message-ID-Hash: PXOYNY5DMAA5SSFPPEGOSMA7UZD2MAEU
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXOYNY5DMAA5SSFPPEGOSMA7UZD2MAEU/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-9-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
method must parse this header to determine the offset where the PCI ROM
images actually begin, and adjust all subsequent reads accordingly.

On most GPUs this is not needed because either the PRAMIN shadow method
(which reads from VRAM via the display engine) succeeds first, or the IFR
microcode has already applied the ROM offset so that PROM reads
transparently skip the header.  However, on GA100 neither of these
applies: GA100 has no display engine (so PRAMIN is unavailable), and the
IFR offset is not applied to PROM reads on this GPU.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/bios/shadowrom.c  | 110 ++++++++++++++++--
 1 file changed, 101 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
index 39144ceb117b..9e171b1bad73 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
@@ -24,34 +24,126 @@
 
 #include <subdev/pci.h>
 
+#define NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE 0x4947564E	/* "NVGI" */
+#define NV_ROM_DIRECTORY_IDENTIFIER 0x44524652			/* "RFRD" */
+
+struct priv {
+	struct nvkm_device *device;
+	u32 pci_rom_offset;
+};
+
 static u32
 nvbios_prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
 {
-	struct nvkm_device *device = data;
+	struct priv *priv = data;
+	struct nvkm_device *device = priv->device;
 	u32 i;
-	if (offset + length <= 0x00100000) {
-		for (i = offset; i < offset + length; i += 4)
-			*(u32 *)&bios->data[i] = nvkm_rd32(device, 0x300000 + i);
-		return length;
-	}
-	return 0;
+
+	/* Make sure we don't try to read past the end of data[] */
+	if (offset + length > bios->size)
+		return 0;
+
+	/* Make sure the read falls within the 1MB PROM window */
+	if (offset + priv->pci_rom_offset + length > 0x00100000)
+		return 0;
+
+	for (i = offset; i < offset + length; i += 4)
+		*(u32 *)&bios->data[i] = nvkm_rd32(device, 0x300000 + priv->pci_rom_offset + i);
+	return length;
 }
 
 static void
 nvbios_prom_fini(void *data)
 {
-	struct nvkm_device *device = data;
+	struct priv *priv = data;
+	struct nvkm_device *device = priv->device;
+
 	nvkm_pci_rom_shadow(device->pci, true);
+
+	kfree(data);
 }
 
 static void *
 nvbios_prom_init(struct nvkm_bios *bios, const char *name)
 {
 	struct nvkm_device *device = bios->subdev.device;
+	struct priv *priv;
+	u32 fixed0;
+
+	/* There is no PROM on NV4x iGPUs */
 	if (device->card_type == NV_40 && device->chipset >= 0x4c)
 		return ERR_PTR(-ENODEV);
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	/* Disable the PCI ROM shadow so that we can read PROM. */
 	nvkm_pci_rom_shadow(device->pci, false);
-	return device;
+
+	/*
+	 * Check for an IFR header. If present, parse it to find the actual PCI ROM header.
+	 *
+	 * The IFR header is documented in Documentation/gpu/nova/core/vbios.rst
+	 */
+	fixed0 = nvkm_rd32(device, 0x300000);
+	if (fixed0 == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE) {
+		u32 fixed1 = nvkm_rd32(device, 0x300004);
+		u8 version = (fixed1 >> 8) & 0xff;
+		u32 fixed2, data_size, offset, signature;
+
+		switch (version) {
+		case 1:
+		case 2:
+			data_size = (fixed1 >> 16) & 0x7fff;
+			priv->pci_rom_offset = nvkm_rd32(device, 0x300000 + data_size + 4);
+			break;
+		case 3:
+			fixed2 = nvkm_rd32(device, 0x300008);
+			data_size = fixed2 & 0x000fffff;
+
+			/* ROM directory offset */
+			offset = nvkm_rd32(device, 0x300000 + data_size) + 4096;
+
+			signature = nvkm_rd32(device, 0x300000 + offset);
+			if (signature != NV_ROM_DIRECTORY_IDENTIFIER) {
+				nvkm_error(&bios->subdev, "could not find IFR ROM directory\n");
+				goto fail;
+			}
+
+			priv->pci_rom_offset = nvkm_rd32(device, 0x300000 + offset + 8);
+
+			break;
+		default:
+			nvkm_error(&bios->subdev, "unsupported IFR header version %u\n",
+				   version);
+			goto fail;
+		}
+
+		/* Double-check that the offset is valid */
+		if (priv->pci_rom_offset >= 0x00100000) {
+			nvkm_error(&bios->subdev,
+				   "PCI ROM offset of 0x%x is too large\n", priv->pci_rom_offset);
+			goto fail;
+		}
+
+		/* If there is an IFR header, there must also be a PCI ROM header. */
+		signature = nvkm_rd32(device, 0x300000 + priv->pci_rom_offset) & 0xffff;
+		if (signature != 0xaa55) {
+			nvkm_error(&bios->subdev,
+				   "could not find PCI ROM signature at offset 0x%x\n",
+				   priv->pci_rom_offset);
+			goto fail;
+		}
+	}
+
+	priv->device = device;
+	return priv;
+
+fail:
+	nvkm_pci_rom_shadow(device->pci, true);
+	kfree(priv);
+	return ERR_PTR(-ENODEV);
 }
 
 const struct nvbios_source
-- 
2.54.0

