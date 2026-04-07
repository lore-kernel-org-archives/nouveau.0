Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD30DFF5137
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:21:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4188110E4C1;
	Tue,  7 Apr 2026 19:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z29RFRec";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A2BF456DA;
	Tue,  7 Apr 2026 19:10:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589022;
 b=BM6COLuQd7FY4zEf0AwKtEPtMqLFIaTWwN+t2zR7XRoQmQlXwz2+kJe8R2Gp71DRaYE80
 Y9kX6mZyrbR3+ayXSA3t0mo4QR+dD6kipbk0TCRijhIYNn5vQK8oxMivCBZCNWzDmrQj02b
 ONUdym+EnoJcNVggzr0Y7MWX7qjrFgC1y7zrP5Kgf+6vU6HAptDSybxHlTuCZfHl8nW2IfN
 VXr6CR8Kn3z89KXw0bRMDQVJM8aTRigj+ANsKGPk17sWA9YoEel0wdxdU1cV3g4NhZZV5Jz
 AIdXbeSxIA8UEWq+SccVFXveSpQOqHDdJ9yk1T9Za/o6yAiflEK+SD7mTUVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589022; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NK3R6xK0xztdTkhgxexKmv3KP0BrMNSKGMCbTadT9T0=;
 b=onlt8IL+ziWASTZWf0w1JrvexWB0ZFpvQ8v69iHRudpOrM9beFe0Ts58e6iXYGjhNGMGg
 rSs9j8vGLuqgWckxVLBbqBESKRoLX69G/oMs+Cn8WrHFDw1JdKKazUUz5t0VHzMNilujr05
 PlmPOXbf7XT0W8P3tbnwOztpQtYia/BVEsZfcZaBAPn+xudnESSUNyJFSCNuECVsDoPiPgR
 vlINopBTdKLqtJRXH7jKdwex99tTtrxGjSp+FR6jhtS55X4qwtWe3ZJBe68xu8joCymL6gE
 Ncwu6f8sXF6IxAfsTCf3mHjzUpmAlHTgHlPNk9Rn24mh8o/wgq2vCZZF93Ig==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 90BA2456BE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:19 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7BABB10E4B0
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5WhpVhHZZcJPce4ubv7XJhFyY1pDMFXU0Cyi4SonOS0LahsWKv9GpZIceQs9Y81P8T+5lIoHSmMkKCGWgzmxyUw8kVgAp0F0LksyiPdFFw9Omh6CKeg/K9YvZ7wU5mrPjfRkme5DZ0iooxszXeTy8hQ4qlfaQehd3lTw9DtcpgT0yV8/VE+nn1aEFeJHw2UBMf59SZK9mdZoLLKPe6yRrH82lDvWfC2kQQp/3Ph0eSmOX4xeP80Ntww2BM1dOXwepYI2lNb/P/UMgjx249Xb9qX99Ri7CVgsxCD9XtoRrA12HbfcQgEBHwfUkLclLozvs4dBp30B/NuWVqPh+/eyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK3R6xK0xztdTkhgxexKmv3KP0BrMNSKGMCbTadT9T0=;
 b=R2NTgPwKP6Zc3XQj0K6PhQWq2676VFbYy/CuundsZIlqd+HYVHlf/sPOMSHRPhryeKFA8AIIGoiyOjK3p1JapHnq+4HIwLx6HQMZuLNro+urJLipCC+UJE/hOao/kBGX2b/MI4HO1GlRU1twidIk6BYxO6z6xttWzvt0WJgAOWrSaWX44ZUwcIx9spUZ1Ptu6FI+c+uXs9wbM6rFAlWjIOpW+o1e/t0tsCgtucdatfKkM/qTOeZFXsSqzfQcQ9+cnvVuF0TLmeZP/9w36ETa/FWjf3JRXZ1JVO9D2RtHyifcuzeoGqUXESW1VJr+vaieJh3XaOzhfLDGEJKsSvJBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK3R6xK0xztdTkhgxexKmv3KP0BrMNSKGMCbTadT9T0=;
 b=Z29RFRecYq4tUENkeJ3rwgojIrtim3TaL5ht9sMz/YvY6THMD7jFo1rwFwXudgu8rDkfUqYVzlhVz+/JNCv9KI0CTzklHIRxBmMsIUQ0gyQnRTp8wPmt9SmxwFZM7z4Q1f7yydJuQax4hKZGp/pzDmMCOiNc9AZUNJBqqM52dG3H5i8EdT5xhFMoR7LJ7vvxdGZRZmX98Nr7carTIaGHqk+Z/oHmVDENr9xUTVH6vb42jXO4QvKnBOLhDalaTFAQ6wvhwKk9gKzUuoGJnaz0xIvi1fDnR8Zu+KYhvG74GqX+Iss1rcspquhFcVzO1dOTxl79VQPWCsxgwlry5C+bKg==
Received: from CH2PR17CA0029.namprd17.prod.outlook.com (2603:10b6:610:53::39)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 19:21:47 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::30) by CH2PR17CA0029.outlook.office365.com
 (2603:10b6:610:53::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 19:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 19:21:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:31 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/nouveau/bios: skip the IFR header if present
Date: Tue, 7 Apr 2026 14:21:19 -0500
Message-ID: <20260407192122.3055293-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4d0a89-4755-4c89-a631-08de94dae999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	t/8uqrETTFKn4S+REkE22+2TM8xaRAra3zScJJ+J8zOfS+BqSZPKLFog06peoYQzG3gQk2gME0myt6BEO94ZwUdm/V8C9CbXPasFVvsxCsHhsdoO0rry8XnftMGHPGTTHwtTQNlcxVhtOQSMfTZcwhVr7uvSYsd6BFEg/C8Hwb/D/pRy1mqwmwVbXigUaX34UfkgbvhKta/LnrFAT+R28VIppl7KOwgFeAwWyEZg8t1DKPvtoIyBUFy48ecX/Uy4ZTDQVIYFJimX9FiteGA15SOaSWhmplXayN55F13EbVezuvhrc3xx3OKJtPpVqdYufyoowl9zB/fhNIoBAweUM3j1oAZ2DHnaBUGA6KYsZnx6UYsYnuwk2sL+BWwm4sGi2tfy25wanmYoUTOwbeWvK9Hj6SiCFzn0oS2kI50eX6kcZcxYKK8AG3EZiiJAEZvltRpU/2mUG4gSBIhK02xp46PuHjzknxB+pJraylQ1kxbPUOQ8EUgE3pjtgtzEgpMDoJZJ0i6p+/RQoKNR4FYqL0iJnKdQ1xh5yn681zAQNzlqeIUnwPxi1n/E71o4F4WrHe2tgtM0blv3BaY89uQiQr48AdkmUnW8pREVxqrKYSwRD3bBMRiNWtS6b5HwEa3IIwcP/89+p/swuXZb7ssX1BkQ7BJqPSTVboD43jZ6/9zAvtv5kcvCS5F56F4J4jupEZoe41hvFHAfNATHOYFyA8FDs8j4tdSLAdwZbR7NmUlG6q1OW7z+vXNjWArg+3VwD+Cps/c2Qz/Yrw4lAflDXQ==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UHCP7SXl12tOIr4LdIjxGkCrg+BHZ65EZYE06S87hliVwTsOwg8nc3pDgdzOLfVCnjGMuYg6o5DIFBdA1zBephqosvGzPzK7MvErlMR9aCkfZhLnmz9O02M9g+69N73i3O4jmNWlj2zeW4wq9OMFNQi2M5MTcUAKtWshlTns+ygW9QbfWvg8BrDwRi7DzH7GgxvTimPDyeRoc0TFqcvNU2O6NGK/akQG3C9B4yrLSgh25OGq77SmgDs5vY4QJ/q1/rnGP1nYdHlCsFwf5zjwdcLE6gBFqNqVmY3WA+b5Df1kOwg1KsXBlEixzbEdubVNb85I2xuQUvDsuIrVxEWmFeqDlRH1ib0fY4Gl8QDEnyyzfAZtRWHR2Gd45nI2pmACgv1eycADL9YnAhNBnfMd8mI7/TOzS1j6oWXYRTgsP/Qp5Iht03vD3R7f/Q7fu/V+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:47.4614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b4d0a89-4755-4c89-a631-08de94dae999
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
Message-ID-Hash: 4RRH2N2LY6KXTZIE33QZM6HGIW72XIA5
X-Message-ID-Hash: 4RRH2N2LY6KXTZIE33QZM6HGIW72XIA5
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4RRH2N2LY6KXTZIE33QZM6HGIW72XIA5/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-4-ttabi@nvidia.com/>
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
2.53.0

