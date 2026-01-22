Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D0D6CFAA
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:31:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 51CCA10EB31;
	Thu, 22 Jan 2026 22:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G3w7IpAO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90EF3404F1;
	Thu, 22 Jan 2026 22:22:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769120558;
 b=zj7cRtEcw6Do42vxQdWfZHeB25fl7KiTNePB5hyK+lnKVoU1Qm5kEk6bAIFqTbtZcMm7S
 rwJjRbVe5oqm5NidgjmpifrzmneoPmeiOGNiyOOH8MKm+zHvTuZo/g3zcyFPzCGXgIptkO/
 dN4qdETj0k5mGLIFNpvgEqi2PYX7zQUipXRr2EsTe1bIIWZisfxfbl0OfVvsOABgNhIKeyU
 W8gP/WvrkzXEDK6n49srJ4l5+4WTnx0Rt7uIc6y2k/oYwTWk4XOjpsRutg3+Xo0SUzxwwRG
 avjHeKLmtzUXZzQyN7+FeP+vPIw7DTX5JKAPfZsaO9BXLVhsSrKoj5npE65g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769120558; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=U+5ErfWhTx/2XIsAuaN74o4aIbRFrEjOfJzhILwnQBP6iElNX9dUtCVZUDq5aBldZhHdG
 ryjIuUsb7Nrm7j6SSzHxeQ3K97qhtNc6qBbehHJG6xVRwRgIdcZ6yejf1Taml41b8VsJ44O
 cdyNRrEdY9SnJa+SdwazzzGIX3ezNBJHHdofp1S4R5j7fOo4LlsRoYVkRHTNsqLWH8svAF+
 LaGH1GCN+qSoeVJotC0BM2SvQgUpr3Qw9XxaHoEdJSbOR3X1w2RcyGuG62mxG7J/cSYNj0Q
 wtspQKmRXFzm71+FudYKKrk3ekFddqo0VlrulNlBNm9cpKnVGyzKCq25UOpw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 148654031A
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:22:36 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 871AE10EB10
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSOz2J3kVJVjytlVCrV/TLt/duHld0RdchtjY+gQpG5m79MShutmpxY2AHsYuaTqd9UbgymZ1v0Q9t660NKDfFmTTteTJxISBOGSQ3jydCEW7XOqqKHN492hybqGbkhAziP8omUdUF7IdFsGGhPrxYSctxl4GszVYP3ozwUK6LomEXuy7P+nMZuy4/TUuPHOfk0ANoOal4y/U41Nsq1xX7Psj+ZqBNcRmrdLm11THfwP17keBcBb924HVdyGuLiSlZXnpRmm5Ddr1PjEBD1tRPn4w8RIwwGqd2VQrZ9p1e7tFEi+3YH46sfxSFTV6M2PLO+JRj6unvuVNpaGvblPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=L5K++6g5MMS1P+vH8fVSGcuGvS4X4C+VZmJ+Aa6wV288l0Qc4XlSsQWQy2PiQiz9JXP8P4ek5HRiYTn7Xqzv7VpBclTOWY9UKZ8vXfRynXKsdT2MSXTUEg3PXdutJpEx8/mYzp0NLBweSs+LajwNIHAW0R85tFzkwMry9Vt4Zhnc8ZqrgyRVey9h6B3F7yHvVVFwmB/1JyW0SS10PI+pvwNIFYDgJP0L9zM8mLDEhHLa6HytnBSzpF5lnBUwEGj7y83RdrQWZ0O3AMBYDJtf/ZjXontSxhth8EOssTQs/jQhLGYZcf4nFgVC1gC9+32VK4LRPEW2SB5NNUCB5qTs3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDTbnicKuY0v8+B0QTZjbgrZZe4UCx9kzokAyHMKv+Q=;
 b=G3w7IpAOkOXSuVbi4mAMNI117gDAf0Wh6PDdHvCO0amzaLgSpvB5gI5F9dPd+6sw0LyQ+wwOjmeCoYXqKzkR731bgHPBSxtlSvkLVwIHTt8kHjdDQx5eyJpmVX/znCmBLjtbRe2kWj3cjCOlUt6CDS0UnZenEUadfpER240ol0hyySzoBkw3q7U7L4hsLYwsKGh+hMjS2Z92YDPD1JDUxi4d4D7CxvdJJa8Ozn0R5A9MW+AJOYAObXzdWef0uxFXPzDaqfN1EeEwkE5fLZ8q3CMFODw19BzFYLPAhridFjfeFE7itE7o5EekdcZ96PrJ2Ii/Jthvk78q22FWqutGDA==
Received: from DM6PR21CA0022.namprd21.prod.outlook.com (2603:10b6:5:174::32)
 by CY3PR12MB9680.namprd12.prod.outlook.com (2603:10b6:930:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:31:22 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::ba) by DM6PR21CA0022.outlook.office365.com
 (2603:10b6:5:174::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 22:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:31:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:02 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:59 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 03/13] gpu: nova-core: support header parsing on
 Turing/GA100
Date: Thu, 22 Jan 2026 16:28:38 -0600
Message-ID: <20260122222848.2555890-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CY3PR12MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 184cdcd0-193d-4385-b728-08de5a05f7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wZ523FHzK90NvjWxdxxT4XFKGqAB81Xhz5Q0Ah1KBoRxUQyHcNy3lpPu3z1v?=
 =?us-ascii?Q?9m4VEfskR24SusEmEM5yNFXYB+yk8ZeioVmbnWgzdx3/jkdic9bIH+0UppqZ?=
 =?us-ascii?Q?qWjgYKnJdIsNLJc8nA5mCmwSZ5p2Txr/6b9EDRCU11k44KA/MwNJdFSGO9q8?=
 =?us-ascii?Q?b/f44ucCieT5iNkhxMc02cFwZONyAmvAFfY27TpyGKFumHaN+EkGUMjQey09?=
 =?us-ascii?Q?yBshFuOB6c88Bk8kpeSO2f7wYsJBIVnv+xY6bpvLpKkTTpGnpE2weFDDDmhs?=
 =?us-ascii?Q?KOtj2NkanfNPg8BHLkbmi00tDKSGfywG9fe1MyZMFsOJHY/tJoZ+Bdjo3aBS?=
 =?us-ascii?Q?A7/sPgQlp0g/09vJwfUWHB3oOj6pZ90Lvc/otiYda+GWhU9VqJCpU4pZnNpv?=
 =?us-ascii?Q?tVj6T3FeUOheGV1CFbYJDJNo1k3V93XUiD3DDAdGzQVrkPultwyHk/eRrMrb?=
 =?us-ascii?Q?jKV08yIltuFx9mJ8Y0De1DGA44R6CHe+2Jelrgjj8fLFSl4JNTRuqgkNJyFr?=
 =?us-ascii?Q?XL4srLrRZSt8S60P8XZT3xiCNQKfrYo9wrmrKviY80NT1zWo5XOOtlO7l/aY?=
 =?us-ascii?Q?MV0iKgREnwuFGNJkt1Oj0DOOUIULXjYzE5Oi/Kl55ge0G4VFDSVwzXMZqoLD?=
 =?us-ascii?Q?HGfm2BqcoZL0vkQVicsm+wyapMThiIGmZr6MocbPcgmW/OvcTawaAYhIMBV6?=
 =?us-ascii?Q?sLa/biVjMss9yd8pUUm7T4WXchdNk6BcISIQfEOZKpp1dt2gM/3kbYI2XZPI?=
 =?us-ascii?Q?+wjykGMqs3ioWU7GONoO4s7HnpOK/1c4c0U46wdkg0pQtpdT6antL8zRzLOC?=
 =?us-ascii?Q?cDCpjN5x/LeHBO/XKYk2wM3EujKCoS3SHGgVMgidAUYsrLh5XsB8E3c7sNNv?=
 =?us-ascii?Q?jlQ0BuhBJNI3AApA7/HC4jqy+gvlPxjkMct/HvLsVruSYWNoZliYkh3nhGMs?=
 =?us-ascii?Q?IgEXNYT3ILEy7BbHEZ2HssvM7X8cTRRGl+nD+N5iTOH5m3Z6LSrBED/pn5+/?=
 =?us-ascii?Q?vsXWfrdWMOXP+Ua4TJomsOfC7s3Y2qnT6sh7bRbIHw6jnYjdrGeZJXpS1i0/?=
 =?us-ascii?Q?Fgr9EuY11p7l35F9fHh42IMls5rc23xiXHy4afVYpEm32l1ZCD5ZqKpZeOLK?=
 =?us-ascii?Q?wjI+iVKEn0cwRWjDP/IpHD6H3yX87scr/ST3Aa5XN9+g2kiViTXpWnGqs4BC?=
 =?us-ascii?Q?bAxUbOt1PXt05/Pwc/Md0TUjzzV537DNile6yPk1F6aFBELuPPZiG+GQKhNo?=
 =?us-ascii?Q?bBB15M/NR7OyUMnrkLRbXu4vR/DS26zqei5/7LTszBCkgcAPd36taAQD6Z6S?=
 =?us-ascii?Q?re4F3EAZ/HFhWrHneKhXeE0EFBOe5kzLTUM/hqwEkR3OnGU56jUzoS4+eBz6?=
 =?us-ascii?Q?8bSFUn4dGsvMK6EpbOaS+FSuVRiAEZMFW8c5vtPWyGU69Yn7tBLZVAJmU3ya?=
 =?us-ascii?Q?Z5Qx9jU0arZQa1zlHPAWrikbAt3eQzWB4xSwLEzUsknkIeibSPbHwhYD6Ni4?=
 =?us-ascii?Q?V7AXOJ8w4DcLz8JqhJts0CuqZRkoZQ0Nm+AKGYpjum3COe7VOQ9Fh63iOptV?=
 =?us-ascii?Q?HsyKQzUQ2/J34mr0I922wQ0PKq/uz2uqCmB6GO8ilZ70H9fPDfB7lG8eX2U4?=
 =?us-ascii?Q?964RzoMJmO0jA9HUnWblkYc5aNj8mlR91ehohDnmAxu/7XNDyD9WBwh5oX55?=
 =?us-ascii?Q?Fn1Vpg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:31:21.3432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 184cdcd0-193d-4385-b728-08de5a05f7fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9680
Message-ID-Hash: ZO3SMLZK3FPMUEDS5VKGSZG7RC2C3M5Q
X-Message-ID-Hash: ZO3SMLZK3FPMUEDS5VKGSZG7RC2C3M5Q
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZO3SMLZK3FPMUEDS5VKGSZG7RC2C3M5Q/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Turing/GA100 version of Booter is slightly different from the
GA102+ version.  The headers are the same, but different fields of
the headers are used to identify the IMEM section.  In addition,
there is an NMEM section on Turing/GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..86556cee8e67 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,30 @@ pub(crate) fn new(
             }
         };
 
+        // There are two versions of Booter, one for Turing/GA100, and another for
+        // GA102+.  The extraction of the IMEM sections differs between the two
+        // versions.  Unfortunately, the file names are the same, and the headers
+        // don't indicate the versions.  The only way to differentiate is by the Chipset.
+        let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
+            (
+                app0.offset,
+                Some(FalconLoadTarget {
+                    src_start: 0,
+                    dst_start: load_hdr.os_code_offset,
+                    len: load_hdr.os_code_size,
+                }),
+            )
+        } else {
+            (0, None)
+        };
+
         Ok(Self {
             imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
-                dst_start: 0,
+                dst_start: imem_sec_dst_start,
                 len: app0.len,
             },
-            // Exists only in the booter image for Turing and GA100
-            imem_ns_load_target: None,
+            imem_ns_load_target,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -393,7 +409,11 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            ns_target.dst_start
+        } else {
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.52.0

