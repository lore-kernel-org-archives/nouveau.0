Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D74E8B36B
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A171B10E63F;
	Tue,  3 Feb 2026 22:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ILphDbOC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4204D41B4C;
	Tue,  3 Feb 2026 22:39:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158365;
 b=bjWDyOCzrwzuqekh4UmA4XHlWsJPuZfIRJk1OHaRunE5ADp0qqGFd9DRSM9ek7IoqgQL0
 NisXowY7hXQeu1DFgWiNjfPTtPEz8jBdUCl9u7oTVG1rQFvhvY8C4DDykn+0jI7g1yd9kTM
 rUa2a+3p4RblzvE6YFNk6icqeiJ3RCXthwIK0rkYU3rVViLHo7hrRmwveo8iNGPKakrp9XI
 s5MQ1Dh2I+2e4SfwhN4YPc8qcEOU9NDbcW8aXo9Z5/Xm1bOdhL9dOchJWmc+EPaMytI1ftg
 UynclMcB2wE8UPC7gGhrYxwT2qNjwfkBaZhh4EqOZPd7Rqf1MuR6GqyV1hZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158365; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YOjG4/QuCVJ2ekkwrM05SaYyXvY9u2/VbzdxGkJb/Qw=;
 b=gZq4sXzRmF9gXSRNR8ncrwMZ2UQAZ2vDoeYM8XfK9AEo366CTpPy2JHOpXdggeKJXhcdY
 PX7+8CX6i4KHTNVjmn1mSs1gWOafKRU4tSeOdcqSVJie7Mb62OgUPEyHavEctqTmeFs+mWW
 aC+oDhM3emOYeVmGFKMTKxZxm2zC2m+/ZiGCa3dYxPYulIFPRe30+tlRPxr5l/URq+ryQ0w
 ziNA5jV2+GvI/Jk26+iNVH58wgnaph65wSvzfMiSLwQFqlnTS3qSNLMOWsc9tSMSaqKrC8s
 /+h9CJ1Y8V2cKP0d9+mzXgZadK7+kY1EPaDZqxKA/Lb7yKGuPxPBd5gQIaGw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A3BA40B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:22 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010029.outbound.protection.outlook.com
 [52.101.193.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCED10E288
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7P9KGUumsGSzZOZiQeWLFm187kDKBM5uDr1K32gvBxIt5VGp/PFUxD/cpEfPgBuuBe99cvH9DuLlxeUuIrcgY+tMeb3fMH9IxSsAs3Y4yDSju0/otr4GbdM9q4zMjcKcHbBot2QexiZjM5+Wwbj//TL38zdPvgM5HxHgjTOv2WyHs+3U1gxIQIZJVmkkynIxIqDJVFsMyULDDaWkSbXnd2ejQZBBy6GBtyo2Bh1x8bb2i75lONw3mPud1luhAf1x6khDnKuFmdU3AmwrfJVoKTn06YmB+oawcmJDgmlh4a6D/k7gOvKIRhDtZa8WeHaj3NduNKNg+WcZ/j10df6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOjG4/QuCVJ2ekkwrM05SaYyXvY9u2/VbzdxGkJb/Qw=;
 b=YWz+lOyelXsg/SxBghhn5VsHlxtn6jyfHr1vUz8Sdjrm1j6L/9dz9QUGje6pTch3pAuJK3qD/bfXPbOLer2c17MZ16Uh1Dpw7sZTASFC3YwVRNjBA1GErERS4BTkQCw3s8Q70eJTb/B5m1dtEekUkVRwzmocLpRIk6+zZPpD1iExoN6rRb6nKcIzHS4rllVtk7YVsl2/UTooBPB6+MAprVYKMpayVbSxrzs4Lpx4yX5DPM//ebanTfw2RlKWel9pqkCyJCPygCIoHGgEhYEHPCWzsMD0w76oQbMBKK0m3y4iFkAX81XjY3Suz+SVEfJYX3yZ+AknsEcNyUpVi7vgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOjG4/QuCVJ2ekkwrM05SaYyXvY9u2/VbzdxGkJb/Qw=;
 b=ILphDbOC2a+EnPrgzP12oqdLsCJflY36LiFIRlppxx2RjKdv1Y2P5yCyVOpc/8z8L5TtbGnBuIczl80rxJgDX5tOw0RlfqZRdap4QaaMQY7Rz78DexoEmLl1HoGVJ7Y6MFJ4NvmXH5kXUlxbD+elS+xQ+eZPSAWZKD646CuFhuZ1+O8vl7IJ4xWe6da2qlciO/VdbXIRcE8E2KD0TwrQ4cd2LlUEf/jvUR0e9P/Uvjs+7ZLWhSaZOPoAA/rUo2NnfKuj37tL8G3w1YRhoSEf9kvipLn3Te9mYFl0Z8QaOIUSCOjtI2HrvCRyoejuravqaN8Op1MbmDsPp0HtoS2IQQ==
Received: from BN9PR03CA0552.namprd03.prod.outlook.com (2603:10b6:408:138::17)
 by DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:48:33 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::38) by BN9PR03CA0552.outlook.office365.com
 (2603:10b6:408:138::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 22:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from DMA
 buffers to userspace
Date: Tue, 3 Feb 2026 16:47:52 -0600
Message-ID: <20260203224757.871729-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203224757.871729-1-ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 930cb6ca-d4ef-4750-928b-08de63765c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eVMqJ8cdOwldN2W32iKL5A6squQv+VUsxb3j3SjgnAsTsm0kNmTC/EBpfGXj?=
 =?us-ascii?Q?uWGuO3f2baPapaHcYdPVLhu68ZLw8dao4WJEGtkqRwOea4creNiFYEsvrkn0?=
 =?us-ascii?Q?EqpbJy4wawsRL0aL7kKdM04dQNtcU4109EduwNiuTOM6RGpq52X/ulVITXAL?=
 =?us-ascii?Q?/I7HOW4GkeFy4SpUPNp8PHLlfJERlVHt0W+gf70zIGY9wOTwtLV4uU0kYpxt?=
 =?us-ascii?Q?ZZGwXWin4HwUHziN6s+SsybSepHIRtnbgpBdYOEU8z/QE50GC+3ELsE3NcgY?=
 =?us-ascii?Q?lt7ykY2preMeA3k7AtaMQogrP8LhLP50dZLXHjhMI5Tbgy3rIDDW0rsfazJT?=
 =?us-ascii?Q?PK0ClJC06khTnZlLQl0IYqdm+WR6bplPOwg5XNu0c6b9Gs10hE4LQZRmbjRi?=
 =?us-ascii?Q?jt2f+VkJuarlV3yJ65XAeIq7O0XNk9ag0cbqcGxlAdlhm9ZP3KnxeKUCqOsv?=
 =?us-ascii?Q?UhvFscPUIg3vBd4nGFeWde17t+MYnHrHLLsPjw1Uqty51YluqYJPHLh9SWvF?=
 =?us-ascii?Q?S3UWtA1LmWSHKjGUryBYxWvrPYuzjNgkYOPx9SQGivpm2rZdfweIn/Q08mVq?=
 =?us-ascii?Q?+v2B/mTDFIZkU912qUmD1ZqLV12/xGLntOmVD3Z+E23pqcnUa+KlvXKHbt5o?=
 =?us-ascii?Q?BBiZHp0iQp15maXrfsvenM+S1a2EPUuxgUNgQVPjQ1pho54OIByvD9XGgKKk?=
 =?us-ascii?Q?ODsU3bUSmEiadNEYYgovRoLkNgKwwPBbVXdHQ1YO1I/gJCEgqHS1oCQx/1FE?=
 =?us-ascii?Q?p/csNcu93tuK1iOwXdX6RDlAMRH/lhu5fv/ywfrpCDy9ZTs9b063NUrbQ3IO?=
 =?us-ascii?Q?1qeYtULUYujlnqZyOHW5Sh1At5l+yisoFTKn10cq3s5xPPw+uvmFn0aLUG4P?=
 =?us-ascii?Q?sV4MoAljNWZOQfpeeDWjS6/CSmdjocqL1/R/fKSGeai9ee+tDjrm42jQqEo0?=
 =?us-ascii?Q?DwjWiZ7ce3o5aLPc6C9Rop+SYM7E3zS3dcM3tu42UVoXMQiBqNfW6GvBuHBP?=
 =?us-ascii?Q?CQbv3cOvzl/eh3uXEWkHAcS0pVx/poHdjt+F8yAW3VjzCco9ZpkgWyHXGJ0h?=
 =?us-ascii?Q?1e+tEGCvGLbebJCyOflUReWgg9X86isPx6oiHAJqQQvaf506zrMzSKwX2rQD?=
 =?us-ascii?Q?y2Ozn+8iS+3Ntcm5MZtc4vGlqOuk0XK4aahNMWH5Xh3umsXIZfdrePFMw8D2?=
 =?us-ascii?Q?XykiWYomqbsDI4Udvf5ZzdSFuI0GLuGrEiR8Ovdk+69I32EEcdgFWMVaXa4n?=
 =?us-ascii?Q?Am1XIdwp8AgvlawItkSG0e08OVbWi5Y1Z84oZNZul/bGoLvK6sZ6k99z5kAC?=
 =?us-ascii?Q?0LS/uOEG/CozG2x1T+2vSHKBmIDwDm0lLvqGcJFbfw9M5jr7yPw6wjk/VAlz?=
 =?us-ascii?Q?7hFBNTeGEJ3L4kpiDqTrhTAM9NDEWXhRPy//o6uUg1aWRoCVoFr2i95iVhK8?=
 =?us-ascii?Q?qtMWpsFoRXimT7Se5z4FCJkqqd9cMPZ/OkNWKn3TpjHnuQaZyk4fZPZm2gGO?=
 =?us-ascii?Q?fxK/SaFeaYxgZjRzCr6d03Lwt+1jtKO0sOxamKDJVtJskwASt9CeclAyWC74?=
 =?us-ascii?Q?a6o+3cF54Ds1HrkUQoaDyNKyTZPvGcGbc7fxr6Pz9xMhoJn7f7mFP+zPWnir?=
 =?us-ascii?Q?WFpx5eRKAEPGpc0Z3JbIb5fH/JkR8BmzRDjPjsV48SHIWWAfNIb2VEbIkckJ?=
 =?us-ascii?Q?zAks5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TupHBENCwnFWxZCVVW8qOpFwddqP9Rp4V7ZFRqi2hZrwSEKw0NudJSdw50/ejsuwZvsjbwERBX3BslBuGEGA8N6RA/epWns9m5aKZTG199wY1iRD+UndfgpQIBjJ3oeUgEVrmSDqmTVLAxQxg7sE9y/Hk6R4AZHu+tBbTLp/Ui4sNdf6BsFOjwAVo/rkpZ+tRT7XLy1eiEAaelGLnFuDqq6Fp6qqgmL6lsSijb4PFPpqyq3MoVBspPUvJmn54TrxRIDaZx5mQl8KgUX/B8ULC+5Q6ewk+WPrruAv1EV7OPtbe498DtDTzpgPCkDXtLmL+pD/7ZkSGY8HBq6zLywGDooxzV4BC7u4ftuJosNKpKgPcV9rRtAyyUIzhxGDyaHTX8LJig28bAMCLbo7C4yyRJmYvnf6sUNpdSdA5vNE8idYPemG2JN8kZcMEa8dhXyc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:33.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 930cb6ca-d4ef-4750-928b-08de63765c40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
Message-ID-Hash: 46M45LCXYSUZW5DAIZQHWH2STHOL5VQT
X-Message-ID-Hash: 46M45LCXYSUZW5DAIZQHWH2STHOL5VQT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/46M45LCXYSUZW5DAIZQHWH2STHOL5VQT/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
to userspace. This provides a safe interface for copying DMA buffer
contents to userspace without requiring callers to work with raw pointers.

Because write_dma() and write_slice() have common code, factor that code
out into a helper function, write_raw().

The method handles bounds checking and offset calculation internally,
wrapping the unsafe copy_to_user() call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/uaccess.rs | 74 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..d29a52f2a878 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -7,6 +7,7 @@
 use crate::{
     alloc::{Allocator, Flags},
     bindings,
+    dma::CoherentAllocation,
     error::Result,
     ffi::{c_char, c_void},
     fs::file,
@@ -459,20 +460,20 @@ pub fn is_empty(&self) -> bool {
         self.length == 0
     }
 
-    /// Writes raw data to this user pointer from a kernel buffer.
-    ///
-    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
-    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
-    /// if it returns an error.
-    pub fn write_slice(&mut self, data: &[u8]) -> Result {
-        let len = data.len();
-        let data_ptr = data.as_ptr().cast::<c_void>();
+    /// Low-level write from a raw pointer. Caller must ensure ptr is valid for `len` bytes.
+    fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
-        // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
-        // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
+        // SAFETY:
+        // - `self.ptr` is a userspace pointer, and `len <= self.length` is checked above to
+        //   ensure we don't exceed the caller-specified bounds.
+        // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
+        // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
+        //   failure (e.g., bad address or unmapped memory).
+        let res = unsafe {
+            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
+        };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -481,6 +482,57 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         Ok(())
     }
 
+    /// Writes raw data to this user pointer from a kernel buffer.
+    ///
+    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
+    /// if it returns an error.
+    pub fn write_slice(&mut self, data: &[u8]) -> Result {
+        self.write_raw(data.as_ptr(), data.len())
+    }
+
+    /// Writes raw data to this user pointer from a DMA coherent allocation.
+    ///
+    /// # Arguments
+    ///
+    /// * `data` - The DMA coherent allocation to copy from.
+    /// * `offset` - The byte offset into `data` to start copying from.
+    /// * `count` - The number of bytes to copy.
+    ///
+    /// # Errors
+    /// Returns [`EOVERFLOW`] if `offset + count` overflows.
+    /// Returns [`ERANGE`] if `offset + count` exceeds the size of `data`, or `count` exceeds
+    ///     the size of the user-space buffer.
+    /// Returns [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    ///     bounds of this [`UserSliceWriter`].
+    ///
+    /// This call may modify the associated userspace slice even if it returns an error.
+    ///
+    /// Note: The memory may be concurrently modified by hardware (e.g., DMA). In such cases,
+    /// the copied data may be inconsistent, but this does not cause undefined behavior.
+    pub fn write_dma(
+        &mut self,
+        alloc: &CoherentAllocation<u8>,
+        offset: usize,
+        count: usize,
+    ) -> Result {
+        let len = alloc.size();
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
+            return Err(ERANGE);
+        }
+
+        if count > self.len() {
+            return Err(ERANGE);
+        }
+
+        // SAFETY: `start_ptr()` returns a valid pointer to a memory region of `count()` bytes,
+        // as guaranteed by the `CoherentAllocation` invariants. The check above ensures
+        // `offset + count <= len`.
+        let src_ptr = unsafe { alloc.start_ptr().add(offset) };
+
+        self.write_raw(src_ptr, count)
+    }
+
     /// Writes raw data to this user pointer from a kernel buffer partially.
     ///
     /// This is the same as [`Self::write_slice`] but considers the given `offset` into `data` and
-- 
2.52.0

