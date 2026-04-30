Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927FFCD13D2
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8427310F4AD;
	Thu, 30 Apr 2026 22:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tRCzsRG3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B67F45D6C;
	Thu, 30 Apr 2026 22:26:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588011;
 b=m2DnzYu+5GO7EFg2ZzpJFquuWbnAODwkibStWXjitOXsg055huByluZ2Xwklh0jWNIy/X
 1QJT0Cx06l1qQCbuOFAmBtKnYrfiT5vHi0OkDurFBUz9a20rgfV+r6fXyo1MSrV5pnfEI6O
 Zx9tzoGkij2fKvX9SdnpEUn5iO4S5RV4l7mSrbKvC+yU2zLLmX+154lKlqjB6ikMyJcW5/+
 6VzBL3EoBc6MY5CcnSzObrdfg7b4+iK41IFCG3BGMnxZdrhzNnczKc/hPrXN43ub+r+xSh4
 cpwQ3Wg3dmKL8NeIgFXg8HbADP5NqKWSppvXdT32OxPOCUvQ6wmb69rz3UDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588011; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bVmUALoCafBVk1Q3uPe72rXkYMJ1ksV5779i8RQ+tL4=;
 b=AY7NsCnDbotZ4AcnZQqgOgZsELOx2uhH7+H2hLDAbL8lBObDMjyirCUBnlD+1kFcU5hWk
 pvc7jVuotRqyQvZZOPvtRvFr6VraE3He/boK1g/Gufe1InG3pZJUwJPVQ3GzB1CM8BSK5S7
 R2tAxoUw5IyOaZ2PHQnQ00YbcPjFioxONv4GL41EbDXazC2A0TjW1zOKenS/vKLM3jyU/B1
 E05mtLzJbnCJgGXbBpFZBJ8v6Mm06AaMbP4zxQDv/74LG+Ed3B0MGWdthGiaEHFcrPnT2BF
 Xykpf55fjp0rMwm2JyqdMRI5YjYQmg6p2TXtmrlz5mTvaQYj6e/M76CgCNmQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C58D445D6B
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:47 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A61F10E4BB
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3wGV/lpu/pyuw4psrTObh15odCRfA4FnfT1rfwKWH+tRCasbyFo6B1YYYVP3vpjmB6xEQuni3DgbMjhORPsgF4i4N/GojIGM2uIziCfZ9FI8N1Nd9fCuAjzSCEtEjWsTSjSOYh3oLFi8Z53yDQ3Ouf/msO9oc0zCVkqvmk3irxBy3QUXL4L4uzh6WSd5o5LsgAsMEHt92nGdZaJ4+CVMpuBQaXNrKx2PQ6+dX2nnMcA+si9Jr84jGMT2ZAXKVg0KSl2VzsiuQGoFwNK7EY3b9pF5wTgxYcRpVkUfZSLsaEYUiBJ9U1crYaKB128jsITWOkcKJj6GrpaW7QSAt1phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVmUALoCafBVk1Q3uPe72rXkYMJ1ksV5779i8RQ+tL4=;
 b=CnXOj7Uheh4pGAjsJn3s9NvVbb+Uc3+vagSZyi3/jZ1aefKBct6ddncS9QlcuIE7AvSKEZPdkXaUMWi/pzg53vwUGRTTwj4lDX7RIVpHsCpWJjpSW4An98eto4rjX0+5nG2bCQ3pWuN8LyLALXe4hscdWgQSXX6n/REixxlQi1qOt/Fju49U2qVofIiXI+JRK8JRwtoGB57jp38bysQHrZW6e9BZ14rM3OI92kDfCHoVKlP2gng1iZ7LMnjVYXXzvvW7vQWPH4wgnIXCBMgVe7XnVAZpxzgZFe6flTfjCQp9ExK/lro7CKllaXR56ccVwY2bttY+/5Q38s23jARLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVmUALoCafBVk1Q3uPe72rXkYMJ1ksV5779i8RQ+tL4=;
 b=tRCzsRG3m22pA7GLTQHr86yobXrTNxszWNYURQVAhjTFQhl4gwPld1c7ZYTrQ8DeYUnfbW2juw2WmMOxjb2yQxlSdHDI1J8m4ibuFiVI/RQSt4TmUpg5HEPYWjM5icpHGv4qmCp7NBLMMDsgY1BtQ9IfOvVr5eInqmYhDA7kSBDH6aH9CZt8GuqxHR1iEb+7aYdFnzP+zKQme1KKDeY/jIKd5MObxt1Flsc9/+1cvdHRkx4fRSoIY56urgn6XGUrzs0atXXkPHRiX41PqsO0s3Gk5MSaGoEzfQK+W2NLahonGv6woy9+P5phBXHJCBgAGDFvlCkGU+ZXvspPXwsIzg==
Received: from SJ0PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:33f::9)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:08 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::cd) by SJ0PR05CA0034.outlook.office365.com
 (2603:10b6:a03:33f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Thu,
 30 Apr 2026 22:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:53 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 02/10] drm/nouveau/gsp: add SEC2 to GA100 chip table
Date: Thu, 30 Apr 2026 17:38:30 -0500
Message-ID: <20260430223838.2530778-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2c4828-d7ce-427a-bdf3-08dea7094ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8fjjdvzn1j2kcPCbx9lMp+q+66DDpnbA9EvaElGJSQFftMac0O4MCYddQV8aJhB0nxpYOcmcKELDc/NrKZP6gC2NAOEJNYUrAfgBzKAM7qHgqjPkrmUhTqGFvdQWTKNLyvVITVWK3KrITJQ0YdHUhJ47STJdtoSzON4Awiuo/CvEuEmBZSsT6KyOw/agYdztbnWYDabwE31qrdPo9JfGZm3nY/qOQmXZjRfU7rMHfgsINolUFbeQrEY9g5YRMEb+gZrk0gQNPmkLzra31lLEo9ZugN08rHpzrErrb5FoQIMEBi2uWW4hLbiuCD4O9KYMljJcFRV2tpTCUz390yKvxkQDAvfOBeWMjCEf30wiMUevfUs/Wy+2Zy3vmRpGvXYyZG0Brn2lhIS/PxW/fWpTUoXHV2gbQmkEJxk0xWi+0cxAEgD6ideJSqQlo2kC8tbt1ceFkr28Y3X7UR2akkg5aI1NNmcDZysTOEElU6G7BRwcnRLyMb5InU60UfJps23Gm3DtHCGLYHuJqiFm2MEFFGedOBf5p+Z5pDGdzsmUqAir26UvyXM+YwGBaHRblZyuViYnST8pC25ZYMTuGW9vQTwlwd9P3EdkbgIOO3YvKFR3DzR+HxZ3xEjdFCrNGdLbOZvpzh1yjgBoCCiFkuqFB5MUCFLfWqEUrZ9JL/QlwinokM4TIEesxFFVZIUXEFUyrgh/I6bucRt05UMjFYRABmxG0ygR5Eejke6ZYEQKWP0=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EbVOf89Im77gP1Rp1iglhNfzPloPzc6FzNQ5BNfGYIqbwYTixjxlCnh5JeO+oXOrxHgAVhp1iNE9KJzG544rx8+XYtm5ExlL9Td8ZPxmO/HdbqIfxxpT1XMydwZqiRcYXV55ydlhBB8g6jI63ZExP7667j7D3DbZ4Y1ibIP293ne+NNbgFAE14lRFr+z9LdMg0R5ZGYxlAc3trQ5d/L4XyCqVcYILkOC1E7t8FdCSs5NVh+psZIgNVWAoocmVRY2KhBOYMPF2fKRGLEC0tmQS0bmV0vUVH2SOZBSh6Wlk+WLENDOEMwoAFPXypRL/hOH4i7njypE8FqPxtLw2FXve7Bc/Hjn/MTM+AL3TkTXaU1vyNhhpUV20QCEDI0TMOuJLaV92g+koK0ZbwEKx2g0L4aVVZFMLOwjtgaUvd6qrJ0pefB/DQc2AAGIR8s+yqop
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:08.3792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe2c4828-d7ce-427a-bdf3-08dea7094ad0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
Message-ID-Hash: SLFJ2E3UBFYBXDE4RQARHI3B3J4MIH4U
X-Message-ID-Hash: SLFJ2E3UBFYBXDE4RQARHI3B3J4MIH4U
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SLFJ2E3UBFYBXDE4RQARHI3B3J4MIH4U/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The booter-load and booter-unload firmware run on the SEC2 falcon.
During tu102_gsp_oneinit(), the booter constructor needs device->sec2
to access the SEC2 falcon.

Without the .sec2 entry, device->sec2 is NULL and this dereference
crashes during GSP-RM boot.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index b101e14f841e..5af12037a5b9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2530,6 +2530,7 @@ nv170_chipset = {
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
+	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
 static const struct nvkm_device_chip
-- 
2.54.0

