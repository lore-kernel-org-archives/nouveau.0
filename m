Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82B5FD88C4
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 22:00:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8272110E7AC;
	Tue, 10 Mar 2026 22:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q8Tkh+Rf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4C43E4502C;
	Tue, 10 Mar 2026 21:50:22 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773179422;
 b=hmduvRNrk+EVCieA+L4WUeI70EG/xyCD51w05TV9jBF7pkWoOh2SsYokVOpq0eh2DrCJX
 ewlZcCMYTcG9EFoV3aXD8gZyLvMJr/Oo5ntpV+/PlZc6Bc8D7+DhO5Rlfn8VVmVDxSFHdxe
 2xU6K7MZ1bHyO3VGPU0nte0tiHK1Z6KnZjR+pl7HDrJvub/BF+ms3Qt2ITwia/d2dN/jOd6
 a5p0Vare7xzMiOBVzjsZ2JAGTc/xxwSPerSqgXXRXqv2fDDEhjAXdJ3RLdLq0QDlYvsQ4yE
 Cs5sER52URXgqwM1ybZODXkIdAMxXscQ5rcNBmuxzGkRHFuqW+Vs7DWLnhRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773179422; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rLOTYtzyuVpk4XOo5BXt2KpzL9ORT46/czu0QMUrgvc=;
 b=AL3rLBbcAR61SWj1GDdumH2yhWHUI4RAPSA0Tfhf4Du7LQhyhlqAjiklCJIkfvX/jnBUd
 qHwxDtmwDRg33coyeyIlyvdy08j06gZsoPElrdLEFKn6tbSIZDJjmitPmo7fVknuMtnCttq
 EPdNCAxBDATukruQM+Z/nIHxnmAAKoeWjtiUTXEshKYdDI6NBwDaxZUYjfDH26888TQe4yU
 4iU/x4FdZiyFT59vYakGigIhJFtu1Df6eHlfJ/4ALSjHgkZSS1Y8ELHAz3n1A2EDKqAKQlE
 hsMytNlq0urX3GSRLWdp9sZ1VRZQVXpA7TdizWvD3dn+jCn+93gG98gIrNWg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D325F45024
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 21:50:18 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB69710E78E
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 22:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPSxA2wGz2SYfnsEY2owTlxnHi5z8pSqnIE1pg4z3C7vV5+BSvnt018a4AsgM5ooKA/TChiS6UGSVYLKSXibCtu3EPeQhRjmfDPXZKe6wWIwCpgQ8+bVWt5p+xSIQtu7DV7OYNaa+RcXOFZufL5Y9REZX5vuu3QbsbIsMAlDA6WgyxJ5TyzZct/Gwyg0QC53Y+WRfPACxVy9ewDJkUZSMSzwIRjXs1ZMyZdrqJirtFzwNJcyzZqZD16GuzvA+riuw4EAdJ78elzG81gylghMNqMB5N9IpXT4uFBqYd91f/0qc3VhnF5thEhMPWLk7sO8aX/6GTw6QD0GFb7S2adKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLOTYtzyuVpk4XOo5BXt2KpzL9ORT46/czu0QMUrgvc=;
 b=LGOsjsIC5TILjsXB7inE25w8rZ9TAWMfmNNq6URWbKZlxM3/6vtss/UPKuNlRq8vA97iIl9AdXxMjQZbQRmutHSgNKXaUO8MvozHk9gBfoESupHC+PlukGSqccPBE/btL8ibGxGriRQvhdDTY3S03knBInrfRg65cZleV+6WvQZirs0Yc4BicbZaeOFzzCfCILRU7SB5E0vY2JXQg8EGGRBKlrkTzG6GcNJygKX5u5lHYaPe41Q2xfx63yVNFf3JNCwfZWQ82wNuEpGhfmChK6Uu53MoiBl86KXNLyvMASfaP3iDfh3460GUu/Nqjld6Xr1zAwu3+xFVG3YJT2OXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLOTYtzyuVpk4XOo5BXt2KpzL9ORT46/czu0QMUrgvc=;
 b=Q8Tkh+RfYkP3eOWhzX5cU9k5GJdVLH4abjYobgggIPItLLKIBZLb+5+q8jUave7h43A0jVeEXJpDbu/tT3J3RXc6sBqHzcQegtSDSpO9aXShlJ/WWN2B5LBSvcv1jaajAl1d4R3XDwXa2ofAXwpCvM2ThWWgOynAx3BCVmt6bqeV0NQ+zEw09PomKmiaiCWTNFsbN8oqdpDS5egAg3CWKAt7x669IMFzJDD2w7ZcKqRHtNviebMFNAi7Na9My7Hzz0lrhX9626VFgGD2VbWrS+t4iKtvWnowNIUI31ARQMAw3abEeWlxC/x1LZGJ+0P/Qgvs1Vch3NRPDCi0iT+W0Q==
Received: from SA1P222CA0197.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::6)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:47 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::b5) by SA1P222CA0197.outlook.office365.com
 (2603:10b6:806:3c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:24 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:22 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 7/7] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Tue, 10 Mar 2026 17:00:00 -0500
Message-ID: <20260310220000.1897166-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e2e802-ce01-4100-2b46-08de7ef07bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jwl7hYCbmtl8cxOMciRNS2i3IXAHqA1DacTv5qKMqNyiumk+viDpeKdoXg+b6lb+Vj+tHBq2r+irzklo5V0egEWXDRxW7PGaFa37MZ9TQCo87P/FSJsSziH/h0TfW0Grf+5v+iBMQVjYv6v6Gw3cynMGyekXcCKrmz59F5crJAHELZMTRgMZZG60JkZdC2AL7M1s3+y/sGTbE3kYoQIX3O+nsKCO4bcwJ/RRcHbCQiM5E425R66Kp3ECLzdQpzhZXFN4FC9Naw9EvsvkqcEj3quPEPyEBZVBNVGUCeSUqeOqa9dw897gAD1jOvOQXV5X+TugPz/HWuZULi5fZ9H2w6EvrdJIMeLcyn1zWpTUmvl6C3jRokB7k//fWucxjtGj8V4gn0b1EPgZvK+3Nki/8yZ49C4Yul9mGd95a4UYvGKtjHNwm0/KbApvvNL0x3ngrkM8gwGaNY6WN/UufBNM9Dp1+obpcw6yBEW/cfbfAHZ8hQI8Ct38wypziyeht+JBSUJrue7lNkMyZyMkfyPOMHO+r9/ECvWCR5doz6JWPveBxe5gQxEIRKbJQsSAVdDKCeYxueenHbR6DF3eLIGVzyqcr5E06FpPMCXc+8RYMDHV2EFtvDArAV+0z799D62m7pGb5hicdmy0YR5/l2jXDKooag5H2dlPdBUpVaygxy4FwGTQLED1gYT5duq1eYwH+CbMIUWr3uawGrCk7+QFRQHhRi8QSNpBaiRy4uTAtQSDeI01a7m5hkitIzJ1DVgoUk1AGn8y8zCW5ww58GWrpQ==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nwi9PMkuRZef+YbJIxBfmIELsjjlxhL7h9rH6c5ITFYIHDTXRu1bzSx+wQyagzIg7ybhGW9Xct8J6gcSHi6X1MxRXU32k2/scQxO7YzPiWJQT7d0dAQteLqHLbztFgKsMTF+x3ln4PZXPhqxIzKWKLs03WoYgkzZaBAYIpytH4zLx90IXSlNf7EbjzqRaapRggjWVMnbG10lb2Xfw7rPv6lhKBJ3gFeS4+t4t0yt4Iprt+PfVTtQdhxZHfTluaH+wvgw4d4f8V0VsMFbgt6nWb/KFjfEAq3GclNYbzGCYfy0bxzdzlJCouCNRvheBytCD7R8qQJ6OHyADt16TvfG73BDaTKBrcV+5OE1L8lqEmhgFOZhzDzNEfrwBBxgIh13Oe9kIR+98LcBE+qf2dhap5EW3Cp0CASOTeaXpvx125Q7pcZ7kWeJrXXgWrAHpL1w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:46.6828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4e2e802-ce01-4100-2b46-08de7ef07bd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
Message-ID-Hash: MIQQSGYJJ3ADB7MBTTGZYU64E7AAHE5P
X-Message-ID-Hash: MIQQSGYJJ3ADB7MBTTGZYU64E7AAHE5P
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MIQQSGYJJ3ADB7MBTTGZYU64E7AAHE5P/>
Archived-At: 
 <https://lore.freedesktop.org/20260310220000.1897166-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 49 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..863a75b93c30 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,8 @@
 mod boot;
 
 use kernel::{
+    c_str,
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -100,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 }
 
-/// GSP runtime data.
-#[pin_data]
-pub(crate) struct Gsp {
-    /// Libos arguments.
-    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+/// Log buffers used by GSP-RM for debug logging.
+struct LogBuffers {
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
     logrm: LogBuffer,
+}
+
+/// GSP runtime data.
+#[pin_data]
+pub(crate) struct Gsp {
+    /// Libos arguments.
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    /// Log buffers, optionally exposed via debugfs.
+    #[pin]
+    logs: debugfs::Scope<LogBuffers>,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
@@ -123,15 +132,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
+            // Create log buffers before try_pin_init! so they're accessible throughout
+            let loginit = LogBuffer::new(dev)?;
+            let logintr = LogBuffer::new(dev)?;
+            let logrm = LogBuffer::new(dev)?;
+
             Ok(try_pin_init!(Self {
                 libos: CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
                     dev,
                     GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
                     GFP_KERNEL | __GFP_ZERO,
                 )?,
-                loginit: LogBuffer::new(dev)?,
-                logintr: LogBuffer::new(dev)?,
-                logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
@@ -152,6 +163,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
+                logs <- {
+                    let log_buffers = LogBuffers {
+                        loginit,
+                        logintr,
+                        logrm,
+                    };
+
+                    #[allow(static_mut_refs)]
+                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
+                    // after driver unregistration, so no probe() can race with its modification.
+                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
+                    // registration and cleared after driver unregistration, so it is always
+                    // `Some` for the entire lifetime that probe() can be called.
+                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
+                        .expect("DEBUGFS_ROOT not initialized");
+
+                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
+                        dir.read_binary_file(c_str!("loginit"), &logs.loginit.0);
+                        dir.read_binary_file(c_str!("logintr"), &logs.logintr.0);
+                        dir.read_binary_file(c_str!("logrm"), &logs.logrm.0);
+                    })
+                },
             }))
         })
     }
-- 
2.53.0

