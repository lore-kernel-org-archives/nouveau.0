Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CFFF886D
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 20:29:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E33610E38A;
	Tue, 28 Apr 2026 20:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8264cWH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7832245D0F;
	Tue, 28 Apr 2026 20:16:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777407406;
 b=FOFBgn0P8BJj/4apYjzI8MFRRqx8mVqxUwE3/nqHBjyqY/Pp5e6zKb92t1A9FYsrMBBTl
 6TBwH8XhnseSVBEgN9xzlj0c7P6PnI4TUSJZ4jt6BRlAH13raQJI2Zr/ykBPKdiktDMZm2d
 O9fJ/aXWxSbe5/y+bvetTb85JTE7NstY7Q/B3Ft7BjVXH2tYEm2uhD12E/pFky1zENkt1OS
 3haNkXflv71aN20Fqtqr5lZuuwTaCkuYXQJZbI3FXai9mdpLczVuPpD1E5vTN4I9UtPgjW9
 oheV/9A1BYx8r5wUTr0Gx1FPrIANThwS4gr5DWC8YSKKE69QF6PV+hZXdRbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777407406; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yCDx8i4WdDlcaRX1OEaDMA7dgEIN7rVE3Rcums2sqUk=;
 b=MuPNvHB8Wr3MF68yRxP/CPDzEb9sqvdG/3kmjAuLHoEoS5tsezNJmJeCNUot5NQw5zeyz
 6uehivu+zfncF4CnxYqmpZ2HjwPK7a1+OinyCZNk63d5kz3aHW1MFgjoC9GZXDCkHErrris
 01JRS3rfDO+Xmzu4k04yy4jra5gsfn94vhbaGPIB8OdPK7ItIJdtu+zh7xPxrta1Lr8MNAZ
 6cNYZfur5avdeKWDK/xLu/jevRMFVKdDnVEkVUpAoRh+eZDbeCwt70xNwwJ1kmdMu8Tmf3F
 x/hYAwakf6WHrGQwrljpsRAi+gO/io7ep0ysjSIizvrfMMzQAyvNUZGtNi3Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 85AD845563
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 20:16:43 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012016.outbound.protection.outlook.com
 [40.107.200.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D18910E0DB
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 20:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owa6+yDSBtqpVtC1X9foLkemIB1cMu/Th23dQekUyu4dcYXCrQeHUfc05qSPwdgvVr9SzGvfn9OwsE5gTNkwp+btZPJ/0leeLUyPCYxF5BYpRR3057GC2BBiYQw+1AfrpwK8ZlI/ytiTCfVeAAfAgnRIjbmSntJGobHFL6XNGkgBWT5Mo+YqrKKCx6Q2m3hQBreKDa1p/BrZjUykeWOW35BZg2LbGiG/t45l87RpxPGYefcnC8p/qoA/3yruLjOCbIDyFc7IoBgvljvKZLnZrEo3XxMjXxFr67kH0Ri4BVarR2l2XLvVF3IKDk/QEy+dpqL4SUCsezgi3yhNd3NLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCDx8i4WdDlcaRX1OEaDMA7dgEIN7rVE3Rcums2sqUk=;
 b=St/wXyJmgiJyHuCK8h8YQkErqyc+E7jH6TLc7deW6ifUoVsxJnWnkihx0qUUrCaS+xIQVLRflh8kivYoLp/4IMNcQ3OJcmPAUOE4gJO8Zvod1R7gcpV4s7UPsz1IBru9625dpCj6L2NG4bJGNabO4CJTnmJzk/9ryUTEErzMJW91CpBhr9puR1HA627loZxIEbcrvtKihWONYfmQjQv5eHOkWCtpidXFAvkIVsyx9BxvAlKgJBTxXHcxN+31sa8K2rvgHfjvPx0plUU3UpU1+Y3VmSgXW5CRplzaYDW9vbvs5S1/2lkKjL2rs5EcHKQt8dCMnkLGp8c86LtPOdLCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCDx8i4WdDlcaRX1OEaDMA7dgEIN7rVE3Rcums2sqUk=;
 b=b8264cWHqOycNInEMu4opJ5avlxfQAEx89kO+Rj29pcY7MGSVp0Epu+o/10osgavmidtcnh6cN7nLbJ9tjcVsSUqvep2xreSB2vA4FT8teyLQZyX8pTaVM8mMdF7qVXJFlr/s+1LnwFONcOtIyrDywHlRiZ1ZPs5CZ/ewuj26k5o8ASsZcAmuPLIqG262MxPuaSr6LXn4xCjIWrCLYSylkkZWtTfAVcN65ba+CdNEFVCX0ryAA0gyZcAa6AGX4BkQo5vnK/KCkEUUUqB8kIhbfA9ZSDhQLhW3qDHL/Sd9ahNWVmWx5P88uSow/Hgaq8+GMGu6N+tDa2zmXNHPvYMFw==
Received: from CH2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:4e::11)
 by DS4PR12MB9819.namprd12.prod.outlook.com (2603:10b6:8:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 20:28:59 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::70) by CH2PR02CA0001.outlook.office365.com
 (2603:10b6:610:4e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 20:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 20:28:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 13:28:34 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 13:28:33 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
Date: Tue, 28 Apr 2026 15:28:25 -0500
Message-ID: <20260428202825.1123719-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS4PR12MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6e7c6a-dd5d-4ce1-a3ed-08dea564c77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qLJQmExzwek+1V2UdpEAR7zfFAdUHvceR6UeFbTU7LG8VdArivl67hje3H9gRmbwjA3ZsyKmjP5IrzBPiJX6W7Nxqvi4mKEqQyFr3SseKKgJ+BhhmKNJEu1IUA0W0e8GgSYF5Q2VgPfeL9hi4zvHpyHhUKNOsjpqYZyoPIeBsjuPqTHz0vrf5LtHX5ravBGp69rcg9on7g1zTlfdjR//L+o5nhkjIlJBucQl3ixRVZBn+o3FJCs+wl8kmHUUYF+YJKXofZwgXoToSC+7DhmLjNrS9ka+RHba0b8FDHkciboVEogD3KjBZLnSf+nKDP8hep/eXdVmfFQ73QpppZ/BLxSZfrZPaWF4NpOEdOVOOxIPFnm1NBXE9HDEwqwo+5cmLntdAPe9PM2avLJhBTh5It/rokel/c4SZTy8Sgx0R7HVgayXObsdnHZfje2bSXsVXvo21Sbxh9zhTks437ss36Ld00V9eM/II9R52Pt4eQgFRaM0DPvCuzKBuT21zhSWX4nPv1AbaFMlT9gV6W+EuFPc7cTAkwEQ2M0gVFUDvxrl3niJNvbFrF5B8hlVuhvHvSMfgKgOHnckLwLJozlo7m1jc6qlZRpOD083CR/1P4rRpajTCXam+rycOJnH1oeM6ROImSezVOfP3EyCCL+Gmx7QclOlrBxUiO/HH3cNVSCoCpO+tHXzyDzQ4ozk3q0COEsH1phtMasmgkbMh9f53sAiWld1ThqMo9+SGGjajOsPTnkUDq7pxYtR0njOX6GeJ3hmC7PWGYHImvdvmwX+FQ==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PHjjTNWqMpoM1NQQQFNMqtIyEMi4opaVQ8SToXIAp/fQdhJvsTtmCxhy+7je9PD5ux8p6IGGHfNEVhDaa3rIHem5yu1q435QvKU1CIMZbIf6RUku5gk/PqM/TKvGSELX05M3Sk70rXwNk8ot+p12CYkQgl1s3H5Uw2DfyAlDmpdl+5YGX9yjnnB0j6G4M8gd/Jk8Cip7siGZDDdLYKcDjyLgc2K5aV8CId6xqWeAnKqFxdeeVXvr6CdsDxnE7DmsMM3gmuHrCLzF68sTht0y6MAXKZyCuhrYdBTsWYNGZrUg6Q6iG3r8FpMBEd2thX/KDIhlDFKHAUqMva4uY2dgcm+UivGIT6NUE6KEPY/T8kAkv0BXNB2dF6D91ZzQN1pqTg3BlxnB5mdb6PKeLrwh84+aV4NR97q7UDMKIzRvGRPYTezHD1bIHEfSArH4qR9p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:28:59.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c6e7c6a-dd5d-4ce1-a3ed-08dea564c77e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9819
Message-ID-Hash: AHIXNUO2GQREC2YDZX5LORZR3UWZCRXY
X-Message-ID-Hash: AHIXNUO2GQREC2YDZX5LORZR3UWZCRXY
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AHIXNUO2GQREC2YDZX5LORZR3UWZCRXY/>
Archived-At: 
 <https://lore.freedesktop.org/20260428202825.1123719-1-ttabi@nvidia.com/>
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
 drivers/gpu/drm/nouveau/nouveau_bios.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index c8335f5b49db..38032bb95826 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2085,10 +2085,27 @@ nouveau_bios_init(struct drm_device *dev)
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
+		 * If this GPU has an nvkm_device_chip.bios entry, then the VBIOS
+		 * data was already read by the nvkm layer during nvkm_bios_new().
+		 * Point the legacy DRM-level VBIOS structure at the same buffer
+		 * so that any remaining legacy code can access it. This exposes
+		 * the VBIOS via the DRM debugfs entries.
+		 */
+		if (nvkm_bios) {
+			bios->data = nvkm_bios->data;
+			bios->length = nvkm_bios->size;
+		}
+
+		return 0;
+	}
+
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
-- 
2.54.0

