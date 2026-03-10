Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F2FD88C3
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 22:00:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC14110E796;
	Tue, 10 Mar 2026 22:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n01674bc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A52AE45027;
	Tue, 10 Mar 2026 21:50:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773179412;
 b=BdZNrBN5NxPESBHC8Chab/yxEcaTcZg31vBNWdrNBPpekXCX/OUaKphMp2og9blsoGwdi
 tV/QYJJ4TMniI6WKQPAKBgVM8W6Ny+yxexHxfrAwSZjN76fsp3iaNYu/VJWaKh429CRr0vT
 H2474zE63fRI4ydYvGtuplNse3IdtRPR43Dwc0ThHNt4e8R78rhsPREWdSx/X55u3i+HtL9
 PJsMtNAbcCS+TudAfvhUZ0savGL6OGifbbNkD7zdvth4bMUHG0H0cJWzNU34PWpKtc4sLNE
 jaXZ+Dm18cznCyoExp7sCiGdK15BC/zPJR/mKo3Jjv7Fe3+wKBTTy3l9Lc+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773179412; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3htRNtiyfHJ++3QS4gKULJ5BXvQ/jQvxjR5Amz7uUJ8=;
 b=YMbqqznkOXZFvjI2Ut5EsM/wLJOzrQg1gGA7+gFrfQPNC4f1FyKwxDcqPhSUzJabP00/2
 YsjhySI5DFb6uNdAvdtK+QDVjkvpo0OlOw2nhCAyn7exm2twOnn1Cr0jmTxDqQyyx1Evp4L
 wlk0RPeur2HPsUIMGtru75IcYfo+M273SRg6WVJGKV2eF53VArbw28H6/etxrTIzesyT+QN
 o714LTeWA2x4oaXfuFvnsquy5MARQF0nRnviV9NeH7s8jQ3eGVb5KyffQZli2D7117cIIQJ
 trSNdiKU+dqC4dg5/KoIP0zSOAnn4F7twtdpPu1Tfmfn9uvx9z5SEl+jZHQg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0D9C045026
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 21:50:11 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0FA10E78C
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 22:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c968GQEPWx+yJYHPUqsPM3Mjf9PxB4plVJMiI6XtKlz/Gpmd3LbolGcw8kTNxcUMauUvdQ/QmsfhIr5L6k6KXDRwkvLOz2hkq+yHbj0+qR2zZ1ahOGC1j+Hweaw3K2Thmw4KuDbU4sJlwRHa2i9uIKywy/MEaBSq+1SOP0a1I6ga/6tSaxPQn/lN8LyLHvr1DNLnnA3OXfk/laY+pxM8IzkSMLzkdcsD2SWK3okQH7rkwIfrp9mZpVm1XXg6H6v1Nh6Whw265OkGZrCz8TiIn7eBXFS1LK0EdaOFghIBBJWJJQtycw1QBAB3r/2vOZvKkxWIGnL7YCZWviZeUvdYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3htRNtiyfHJ++3QS4gKULJ5BXvQ/jQvxjR5Amz7uUJ8=;
 b=h4q5tR036u00Qy1g0bBcwaYCYUCyn8F9xAr/1BduVgc4Etiiu07qjswHgsWroub7btS6CY3xUmLx7qpYcAoHNQDKRnKj+9SYd9uv7MC4PFFqaD1pBBPeboIX8GBx+ptXXY2DSNo0sRRb4c+0FENvJ4w4A5mbI7VZzcRmiA0j76AwJnllTElxbN4f9c2pzIbmlSdlcHcu1W6baUf+Ia8Pgmy97ngoCVYlvewbfzLAvUwy452kpGqZlb2fzCIsmF5j6ySl6qTXtHvjNqdnvIF0ZBOnkaQ5Ydm2h+6i6Q6HTOHxMO++BVlOrTsSyybmsxVp7GzN/Y/GLKEMfLpqYGa+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3htRNtiyfHJ++3QS4gKULJ5BXvQ/jQvxjR5Amz7uUJ8=;
 b=n01674bcTwE1NeWzVF8eK0u+KXo2eg9Jm5e2o6ZK2xEFWKmJXMc2wtf/wAcDk5Ez1KQmhIr4ZpFB57a3ibtJgeHFvvyP+PO6EYZn7wBNqEP6j3GKO3hkP7i57WS8D+azvr6n+AJSd0h8Gqcfsp9J8ZUeshI7Nb0QlljsnZ+YEcqAfcKRYL4oQtaQQKV+CATXBNlYvDQO2FJmtRRRfo4bhgsnsjVLkzCOoVthUe7W+Ja81PWrY1kFd0wLsxDXLuvCKHmmmqc+i93EqKZ/ZELaKLh3ZAT5LfueU3j7O5/lUZaCJ2QNzwVK3hLiqs17iPif4jQfkx0Y8w+mYA0drvAvxA==
Received: from SN7P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::24)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:39 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::11) by SN7P222CA0026.outlook.office365.com
 (2603:10b6:806:124::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:16 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:14 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 1/7] rust: device: add device name method
Date: Tue, 10 Mar 2026 16:59:54 -0500
Message-ID: <20260310220000.1897166-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f2085b-3f0f-41a1-401f-08de7ef0775d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+DE+MHMEwzIvK32pTPsTrmB7pYXpr8wXEIPfMXRjQK6gxKXFw0EPXMW9ZZJr4sDzGhPzV3l/aZgMabMXdJRH7bBxYSE8ijw6AXHQPle20M8vzE37AS1K27ojaeIbSR9nIoMo9Yb1DGSRjy+o6NymGvywXrFzWpG80fDuBtQRZDorldtphCev2bLBZz6gsX5V0HUpNZtwXawbZ4IWJDLnUCU8G0P1e7Aw81j02OdPe1UH8HamupEq3FOOp/CDkI1gqBq2BWrR6gPAHz8UYTuGA4vkXiHORWt9c/PzkxobiDLOgWMPhCEcdvqmk9fQ0NzW+suZZNZEgczPItXJQzoNi1uu5e1dh1X91xuT+eNASnf5zTSYvbe9IS9Zr4xvKlJFAqz4Uy4xUDFUDSOOwOsZ3IbyJrbiM/aZI5J4p4G5rksqBiAWHY8k/OVtgjkDOngXkco8FrUGH5+6NeKzYZGhNRNCtm+yoVTSna1kUj94+kZPlAgphHbpfM9PE238CQEDbHiUKUGqBUnxrbuPqdeNYMPMth6+A2kNzw3/Q8nmvegjZ0LoJb5s2ZWTZ+VDlc10wacKKgM9fNPzXoh78RM6U4XTDBpNYLhPMBxlmDO/9VlaBEC8SMYFormrgX2SgbpcGtMYVz2XO9O08IAQEsmeiF9nxo7YTUiD72s3OxBOvcFUPqM0ybyeaPVUK0XjyggGJ5OeqAJjuzo5VoVij0KO3m7BYXEKJN/ri2zJ0SHrt0a/FjwphfMs3aknZnqtEqQ3N+Gz5sz1Zoxep7XuCdMGzA==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xcHj84wTVHWvNgUUBNbnuGwftTWrSpjY0oq7hLt1YMam7xOPTh3Inh7CBNLsuDz6YhE8N4T2phOg4tPCrnfknzBsh0YwCRe8YrO8nHxRQdDVakr1Y7GEnMl1iZ2kOW87bkJevrgeBnR5ViBU1bPxnAVb2+y7bXy155TGlliLtqHBaiS1lEtXSrJCiQ5Ilr3zrge19um2dQ5ovGGBCigHcMETP7C+XN8AD9JkuMfD5GLcYhhBkxpwrpzRN4pV6zOnQw/PfYh4kW9SPfvpk/wuE62eZLXFcd8wkhyKvHHoXXdGG0FWJBpCa68V2ZRcfqSBH8xnzEEdcG1Ud93ai5+FwPXq5toxYt4ELu/jLuNyjxuRM3p2Pzkm18S0vND4iw2Yk/Jx0Jc5T70RwjnczRN4ypsk/EHz6gZhL6yfHhGGDoDLJxQDtc2vrZZq2zDthJL6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:39.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86f2085b-3f0f-41a1-401f-08de7ef0775d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
Message-ID-Hash: XHFLWNLKDH2HBMPJQMDC3AJBWMQELHPC
X-Message-ID-Hash: XHFLWNLKDH2HBMPJQMDC3AJBWMQELHPC
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XHFLWNLKDH2HBMPJQMDC3AJBWMQELHPC/>
Archived-At: 
 <https://lore.freedesktop.org/20260310220000.1897166-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index a8ab931a9bd1..3be4ee590784 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ __rust_helper void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+__rust_helper const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e7687..6be93425fa0b 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -489,6 +489,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.53.0

