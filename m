Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8BAFF5134
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 18:53:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 331E810E49E;
	Tue,  7 Apr 2026 18:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UIAgYS1p";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12BE143E5F;
	Tue,  7 Apr 2026 18:42:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775587335;
 b=kTrIVX2v1HW+i3f0HsKyqX/ugsiaUhpWMzuJ+1oK3IdnWc8iIY0u2ICC7oqohu72wS+jQ
 88bMup7eooRIP9thce8RElSsGU77OhjKhtJua7/9UjiCdaF58CercL3LPFOM1OBGx8KtiTC
 WYI/SReHCfNmvvIbrLNx24GyPAQyr4qbLmknzRFMgVtMQPfE2IL5173bkf6JyoOJY3Ia/oj
 zZerLiUvVC3NkOPDSuk7mTayMHI2FUwg5tJ+RHccCt+Pn4oHrx2fihTi7AVGyGOPtMxtTjs
 2rcmFUCVCUS8iAOdDpa1cp179xo93oeUqr9Rlh9i3fH9LpVddMKwwRe14yqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775587335; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fOP2ZXentcs3IK3M+L+m8myWTw7NiTmj7Fcp6tqsx+Y=;
 b=KWR9ck3VdG258KCoaUiCm/OEp0FGbfWFqF31H5V3sO1Q23VH7VWRDE3Y4PnLWUdkGAfWB
 CkenjukNc2lKBueCBuJY1KIgs6FVTR0vrS5xvTXmry3VLf0Ox2d3WO8CBk893gx52CsnC1G
 EOkahfbb7Lx8HnDkQeN5JmhTKaUbMDfFtSWsQOufl/8lUkOy4WG3S+94vJcCAv5eq+oSbcz
 YaW590iVWZFHDxOG6c+3/UGqKYC8J7V4IqPWMMpmFguV0q/hyaLQfeolbkhnZGcOrlY/Jzc
 SS+6ZolPIxiTGStiXZ5FIXJQi7n/1oVNlvaui73JVETe5RD1qhQqPZVRW6bw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 41C8F43E5F
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 18:42:12 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63910E493
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 18:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tp6MU2CtXt1a5y0v/60AmLUlC6xLTjADZoEIh4+R59A44nPnA7hw6Vw5SNv42h1y/hVXeeVqbaFnxkAY2JvB9ppB8k5GrJnIwnDsF0zvqMCMETF22i3H3lNm8KNuYapsIlvrfco+BnAvxGyqaD7swaviExgMyugS0xYrTt1vS3eJV6iPB4wkd1eqPrRIU4iQ61mi8uawxz1JF3lmXs445PiNnvjy+HBqGfSlWANGO+PFMm3CXiGVElUJcIlAI9tNEE70WVef7XA8z72lLLB7xKEXugB8tAld1iVYm5htkiZ76/tv5ywTHQe/aEabJmZqFOsknrT2TpA38k7atjom2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOP2ZXentcs3IK3M+L+m8myWTw7NiTmj7Fcp6tqsx+Y=;
 b=KX7KloieX8MCY1OCHz6TKCYAnkufvHvx/tdc5OBb9yUDQZ39L+rRHvxB4yNLAS6SnLvZpftkokLY4AC+Ynq3NdkF6s7cMD4cQR4MWZ61Uys4Rla0r4VycNRwkhdB/h2H+ucUYHJqMaEkv6wNZ3AkvkybuBugNtNhkcfzTRQm5pDXpwN/I/+aXydEPU+pPU6vjDaptnsyrN5s1gUYi9Al8Mf7yQKjMa3jgYiNe+6je+zYZlnZyU7MUg8IMqqxkXwZs+6/mF4/ohqDhrp2JUbF9AHG4YbX7CM/nR/3m0wKRQH2tgzCY2w4t0XLg3S5ZyJhWQNBxpeZuc2stqskXFt6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOP2ZXentcs3IK3M+L+m8myWTw7NiTmj7Fcp6tqsx+Y=;
 b=UIAgYS1ps26GIcMpfnlUSHOGhqDpL1QoCRTe4vUqvNmUVKOuNawemYDv4XJeHbvcYSwrs+nOz3Qrrds92UrXDNW1BFZisBJSwxrPRFHEDlfyszjxABc4HRMZBw2L6oRIf7Cj/TJVqIfuYCi+SURBMKvOvkbJLsZen7jOqzwqPJcpmXSrEDErFeKs6lZuYb1EmUprtlBG05ExXHhWGZwd1EcjKp47IowJ1vLpPCjsWzJmLnnMvun6Bgg3z5dL8oplx9/1s5o5HdvW6Pij3RiCMdXVy/4ANVHe0qAQVa5NnQZUWHEnj+7DFmG8eM/P50CVaJvycdpjPS0eHiv6xwE0Xg==
Received: from BL1PR13CA0438.namprd13.prod.outlook.com (2603:10b6:208:2c3::23)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 18:53:41 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::f4) by BL1PR13CA0438.outlook.office365.com
 (2603:10b6:208:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 18:53:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 18:53:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 11:53:20 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 11:53:19 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
Date: Tue, 7 Apr 2026 13:53:06 -0500
Message-ID: <20260407185306.3024695-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e6e90b-e9ba-4148-aa7e-08de94d6fcc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SSIVdIAyTSfikoNJ+dbGcvtuI0mGgUaZPkj2x/mvNXYT+pWpfS2IEB2N8WtNAJCiCuFJuf8ep15LMb7MBOQ1zjeugQo5ToO4RBjLOsD3wp2OHQ8oNkd3hWtay35amVJw5lJ2bOkmmGOdGGyVJGztS8gr5EgZW0B33qyBeuyCdcFo9+E8Wt7N4CKk9wJOA5ms+KwNXR0fm/Irggcho76/IssbsIvgZFgx3rSbvjc0A8+jbBzxaoxWEInUgQVSL5gh8e7vwWEWMpVzFSmYHlqN5V2pW4+n7rXrmIjUIKKi7E5eUjo0NFyAMNUg53cuPfUBnAQ+yDTL6+8tA0iK7iFSj9JUdm6lP66tk8n5q1d9f9H0vThM0g0z/HGzQXQYjpx0G1iXfERKPP1rH1GtEHR2+AXPFZo3vx+jUgLT5ygo4c1Jkx5c2MkZ5ixI7AeDUyhUr7rPfwtIGyh1phlR2QdhoGr7RQg009KRgn50Y3HDOqmdF62k9X2oMOMPq3HUSIz9aSLtnDvpd4Dans3l0etr4+6oL/fr2h6cJzStjPIpgRNRu068y1rBKZV6NZjxnu3bq6ATF+RjcwFtycbDY/kNNOfiQnvlLqpFCT8LDOWhXTD0RVHC5YgOFeC1hXrnW/q3Vu9HT0lKCyaAgdUVrYsItWfmcipvinNEck4cogtY6xOwWE4xucMJeFOd3Osd1hqR6E29Hz8encaTQub2GhNF/e8KfWQrbY2dZOgUrhSOMJ/rrTrd10RZRAjHwei4G1jNh3LEdh84kBy23j3udYZtIg==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qCrReEJnPxBRUUwJ2kjurxXDCVV/YBJZORvQwaIkamweCnbkcXiKKYIjGQ8LnYCT/c+uvgrEV0kh+p5e6F/ZbKIm9/MTDMiTWteeipTtzuFHQ0Yl9SCRCUQKxFbLoY5D43CKl/GwqXDDV5Ar0G5h5z46D3V8cNWEmtEwxR1jpZnDSR/kBAcGJBAL3UdTfeeZqS1bacNtO1LkHzu9JVMwh7jL+HPapLRv9k6xo3DDOdAK8YHA0za4MWv0Zgm84FQwPILm/Lyt6d/GtauqAq4lgrA2+rbkaR6tv3KmNQAdUcvdYtOphXFmOqcXV1Ty4bapCUZ86P3gk8WcHmTJMjYwP5gp8vB3lw2lrSowGuvaWvP8Tw5oGWHHfOELdTIhANH/djprAjL+AG+iHeuHPbVK9Z4UHsG35QqgqwQwf1ZMqfeJgnQGsKlqOssuy0JV7V1I
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:53:41.6033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7e6e90b-e9ba-4148-aa7e-08de94d6fcc7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
Message-ID-Hash: BAEP5N23ZL2Q3OMOC2K7MASUB4353TMN
X-Message-ID-Hash: BAEP5N23ZL2Q3OMOC2K7MASUB4353TMN
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BAEP5N23ZL2Q3OMOC2K7MASUB4353TMN/>
Archived-At: 
 <https://lore.freedesktop.org/20260407185306.3024695-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When Nouveau boots with GSP-RM, it bypasses several traditional code
paths to allow GSP-RM to handle those features.  In particular,
some VBIOS parsing is skipped, and a side effect is that the VBIOS
is not exposed in the DRM debugfs entries.

Fix this by updating the drm BIOS struct (nvbios) with the VBIOS data
from the nvkm BIOS struct (nvkm_bios).  This happens normally in
NVInitVBIOS(), but that function is skipped when booting with GSP-RM.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index c8335f5b49db..28bcf38cdddf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2085,10 +2085,24 @@ nouveau_bios_init(struct drm_device *dev)
 	int ret;
 
 	/* only relevant for PCI devices */
-	if (!dev_is_pci(dev->dev) ||
-	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
+	if (!dev_is_pci(dev->dev))
 		return 0;
 
+	if (nvkm_gsp_rm(nvxx_device(drm)->gsp)) {
+		struct nvkm_bios *nvkm_bios = nvxx_bios(drm);
+
+		/*
+		 * The VBIOS data was already read by the nvkm layer during
+		 * nvkm_bios_new(). Point the legacy DRM-level VBIOS structure
+		 * at the same buffer so that any remaining legacy code can
+		 * access it. This exposes the VBIOS via the DRM debugfs entries.
+		 */
+		bios->data = nvkm_bios->data;
+		bios->length = nvkm_bios->size;
+
+		return 0;
+	}
+
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
-- 
2.53.0

