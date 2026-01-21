Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0131CC44536
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 23:53:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D042810E8DF;
	Wed, 21 Jan 2026 23:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NZnRLQ1s";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 489704034F;
	Wed, 21 Jan 2026 23:45:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769039102;
 b=vIOlfDgbxxxLwSxUwwG7fbT+VQ81Iwrpw10IfTM5b9TcTRs8WzXnQkRWMRVSt/WrHFlMe
 zf5z+OUE9yQPxPYKeqSdq98ZmcsB4LLj/1r0cOn0CT8BjqiegzdDsJvNy4+sl6bjyycHGOV
 MCx4sVga8+SqLRlmdIYt8eulzGFYcq7vhT10T73/ko0loj4A3kWwtaTG53K0xyZMzvbfyBf
 ++fS2ypfnAQp5lgtIRtWYKODmLG4ZlYZmUWXUQm6qjqGyV3LaNmuloBrpztXy8fcpM+em9D
 /KT9Qo6rBilLSH7VOkiDIbqKE2HjyEWkFna93L3oAOk9gC/ZbadRQFgbHR8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769039102; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=E2JNseCoASi/0v2vF+/ma2gS8LwbM+efhXE2SxQ8QjvJpGbzVFkgBPaM/WcO+OqiTZGLl
 smHypadoKbEDMdVZL6Ct48IeSUbTaQuImsL8UkSShCvUPF1YhhDKR+/hti/oFAASXkCf8jB
 CqpfUtxj+1EmnxXIfT1FZK5pdobqRXSX0qwWVDLTylOTiKeGLUWsXThAk7AKw0WqPQd+7Ss
 fjDGYerdi9RASxRhTr6vfQxi6naXETLZqM9n7W5DLiPk7cfOk39OTrk8v7Qgs7xRYodghHM
 UvRr0SzSXGMW83gxIBy/KujX23sqkE2omi2NnVDbewwJPEE9WHAkd6TyikNA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E11CF400C1
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:44:58 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010063.outbound.protection.outlook.com
 [40.93.198.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 485F910E8AD
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfoA5Gwt8omnFKbcIsqxYIx5noTNnGFuw6SucdLYcKwzq+pwG5rv90xL/smbYOycG+eWxpa9bsMoOLYpKSkeKlM2m6NvVbwL1OE25T+GsucnSdy/60mtVE6FNjBJzp+Ru8o7VD2K2wsRO9iGysmU6krZnxVmPeOqIH9v7fyWLiSTvr6sVcM7YGKHaYdMRlXvpYUN15l6rNPMKg+cWvOi7hwdtGZHN2iSFUhpyuNgWBQUj50cONrCMUqyRP4a/JuzSrGw0qx5mTA5TLX4xGwmiCYCpykF62VQU0Ok+BBI86iVGH6gGlWz7LM/Rixi4zhEJxFsU7s5Q/pcSUNRbZQVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=qqZDOdDG1ZzGgPwQqlCJIuQlE8UWDkETELRrgmi3mk8Wru0na2rJp/4Q7dpVBzf6TuEyNkOBgrS4izTT2De0LmEhKStzJrVwebvmuglrAlaZ88jC9pJDGJNrVjc3xbOfSrR0IVJboQYkmmmaadLXafp0EEDr3PhK/aSCfyXO/yDD3GF+FHlqa06kQ2yH8R0wv3WNoPS5Ju63Io54UGcIldyDqUztPq5IulFDcW1Z+MPtxaJQIb4TUhvZZGz7W+/F0ZYxu1biLURGlVtnq/PXxqOXbM5or420/jZeqF1EEpoW7njC0FB5/rpxh3mEh+M+JKhMx1wsRcyK8cFj0DMeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=NZnRLQ1sdC58iog6xCBw52whzDDkI2YUck76za2dWr79w43RBvMwXFhGNEOgmkrcqpfHXMxDL8J0CrwyoKForrNxy5VbPKU7FvYrqhrRXnX62GWc6zHjHmUXox2MwhBzgCqSao8h/A8kmP0vmHAxToajaEGKqm7g9R+uHWGbfjPuaBIQJAPLTXi7vYI6hrGlUsAwhbJ0hHFppr+GAHcQhXRVBdn/AI9ClHNZw7hVSKRQs7CByiFPn4cJmi1w1KLu00D73XO7/Y6OJmfnUpeSsUBkbYscdBH+uKuLsXdH9A+J75r4VMMOcMF2nTPROdi4ixzPRvZIXivfHFJL3HGOrg==
Received: from DS7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::12) by
 PH8PR12MB7422.namprd12.prod.outlook.com (2603:10b6:510:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:37 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::48) by DS7P220CA0002.outlook.office365.com
 (2603:10b6:8:1ca::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:20 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:19 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 08/12] gpu: nova-core: add
 NV_PFALCON_FALCON_ENGINE::reset_engine()
Date: Wed, 21 Jan 2026 17:52:58 -0600
Message-ID: <20260121235302.1962185-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121235302.1962185-1-ttabi@nvidia.com>
References: <20260121235302.1962185-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|PH8PR12MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 701230d0-c0f4-46c2-b17a-08de59484b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?la7zwo9X6xg+RxhPZ60wuhUagBhOonJYt2yW3xotvot2Ss4+izMDCmVO1IzM?=
 =?us-ascii?Q?Cxa4Xd3puJmMdUdzTe8miZNiSYhJmIbY78QSNf0N7S0PyreBfEqH0c+MapyI?=
 =?us-ascii?Q?UILSJO2LSCX1sPOaBVaF/fqQbAIuCKDb3HI8quMe4oUfygIpekMWmO6p5ImN?=
 =?us-ascii?Q?osuhrIftOT+JDNdv0zr7hIsG06jz7WlHG8+2VqsjkIGAAvMkAqCd6mvECmfl?=
 =?us-ascii?Q?J3zEZUH8oJTv0+GXVsf/Ll8P8Sx8yCNphkQ2PGu/LhdbjOMN5U2/zJaTNddw?=
 =?us-ascii?Q?eYsIG4g6DJzYfpFSLj5oHWn9FP4Sbe6ZnrHA64801FrGXhmZ5nqNZoDXJgYV?=
 =?us-ascii?Q?1Gb7SWEbbFCbVX4tM1CBtvqhS8gj4UVlJ7N0+UPtbGon8C/JLIhgWdjEJhdC?=
 =?us-ascii?Q?leqygN2/uPVycd89MTmZECAcPre4RsxS5VAdr1daKLizvySBLEjtQf4M2a7T?=
 =?us-ascii?Q?XsqYB6bu33W07Den37x2Dfj1HAiS4K3naP3U2u6/o2nq3wTsB2KM64aCUUlt?=
 =?us-ascii?Q?FaBNL2rVTB4Uk4w6akURYZ8k6xs/TWVVVzOx43qHuG1v7juc0PsjPG7S/s2k?=
 =?us-ascii?Q?NJbEio5GHPyEs4+geJejd82iq3Xk0BggODUwGHj2rINKDhzIwhWuEuUBJjzI?=
 =?us-ascii?Q?2R3vXAiazolgTg4VVniZ1WvAcWsanijPSliQJ6MsKr0DQlXQCDk2Zqj0XSqL?=
 =?us-ascii?Q?c4zAx5IeHADPmC5BnWNuGA1IKAFMFnWb7WBa3lFJU7YtpIQlswq0jrGdMoxK?=
 =?us-ascii?Q?+fDJ3gGSCGtj9+0WVvI2+TiTn5wWm7ojCxzGtdmLRPsNPqQc6oDY/R+SgDu1?=
 =?us-ascii?Q?awmbPUsMM/7TcFCEKDLTYb5T1nZD/34YKR6TDbE+1tQZJVvFOoF5k/5K3qOu?=
 =?us-ascii?Q?lrQwfO51rgrN2Yua3PKwnuXDvdivq0SIk/OkICZG2fSL4woUHpBIJR+mFMP7?=
 =?us-ascii?Q?3WN0xElEytosOCsXvntYrw/1uQXywZuAicOV/QDHqmP69buo6NTylQTWV29K?=
 =?us-ascii?Q?QyAKyBEpQv5E9vKrrziErc39gi2fYzM1guvotYd7dh8IR6f3WDxxpdPTlPfO?=
 =?us-ascii?Q?3yjMnUddKWvPdlLZWto5IsSAbhmZTbtgBnk2vlJ01KcAS1pSsjcuPfsPqOmp?=
 =?us-ascii?Q?EdNVUJhGr9pQ95pUROkf8zvFD3owNQaRT+gBAG4FcrG2q1mrmgTle1oiOqQy?=
 =?us-ascii?Q?qHrjnXE4B1qO1lK/59LSMc5yOqm2L8m2HSSfQflzTj7tJSXaaJGMTH3QfKHH?=
 =?us-ascii?Q?XOscuopZ0N1zeGKg7Swmt+qu9ozMhbbmwwjJ1ICVQYoB+x+MNShZSEJPBsIT?=
 =?us-ascii?Q?w8KxL44UAqyH+6Sqbu7UO5RFQSgmUvGCjwEtjpyBdDIEQEtlxSzMKE0VDzBm?=
 =?us-ascii?Q?HwFQbT2q/ldV7aEdLEoZVAV57yWa1gNpqq9iGHX0sVSwm2me+ecPn0O4Ppav?=
 =?us-ascii?Q?9qJX5PUa0ACfIoypL2YFycVC9yqJ2r8FmbUe4zirV1I97qQEsk1VQOcvaalT?=
 =?us-ascii?Q?niTBCCU7/dtoIb84A7nEY/6aQUIooBmGk/ecYeMM1LaaN3x1Yh64clqzs+kK?=
 =?us-ascii?Q?S9oAgxQIfyRQmT3877bOihajR1Id/OruRWwMIm+ZqlFs/ccdEHtin2LxBxAB?=
 =?us-ascii?Q?UqzvkqpvJsaDhdNx8AQXeOUV/zzhT53P05OcTjiD4OBRInAHh4zUKyULWluz?=
 =?us-ascii?Q?cMYjgA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:36.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 701230d0-c0f4-46c2-b17a-08de59484b2e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7422
Message-ID-Hash: Y56DYM7WOBPDKK4TXNO4PXOHQ74PWY32
X-Message-ID-Hash: Y56DYM7WOBPDKK4TXNO4PXOHQ74PWY32
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y56DYM7WOBPDKK4TXNO4PXOHQ74PWY32/>
Archived-At: 
 <https://lore.freedesktop.org/20260121235302.1962185-9-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a method for the NV_PFALCON_FALCON_ENGINE register that reset the
Falcon, and update the reset_eng() HAL functions to use it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  9 +--------
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  9 +--------
 drivers/gpu/nova-core/regs.rs             | 19 ++++++++++++++++++-
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 61cc3d261196..39863813a2bf 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,7 +6,6 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
-    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -147,13 +146,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             Delta::from_micros(150),
         );
 
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
+        regs::NV_PFALCON_FALCON_ENGINE::reset_engine::<E>(bar);
         self.reset_wait_mem_scrubbing(bar)?;
 
         Ok(())
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 586d5dc6b417..23fbf6110572 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -5,7 +5,6 @@
 use kernel::{
     io::poll::read_poll_timeout,
     prelude::*,
-    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -65,13 +64,7 @@ fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
     }
 
     fn reset_eng(&self, bar: &Bar0) -> Result {
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
+        regs::NV_PFALCON_FALCON_ENGINE::reset_engine::<E>(bar);
         self.reset_wait_mem_scrubbing(bar)?;
 
         Ok(())
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cd7b7aa6fc2a..ea0d32f5396c 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,13 +7,18 @@
 #[macro_use]
 pub(crate) mod macros;
 
-use kernel::prelude::*;
+use kernel::{
+    prelude::*,
+    time, //
+};
 
 use crate::{
+    driver::Bar0,
     falcon::{
         DmaTrfCmdSize,
         FalconCoreRev,
         FalconCoreRevSubversion,
+        FalconEngine,
         FalconFbifMemType,
         FalconFbifTarget,
         FalconMem,
@@ -365,6 +370,18 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     0:0     reset as bool;
 });
 
+impl NV_PFALCON_FALCON_ENGINE {
+    /// Resets the falcon
+    pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
+        Self::read(bar, &E::ID).set_reset(true).write(bar, &E::ID);
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        time::delay::fsleep(time::Delta::from_micros(10));
+
+        Self::read(bar, &E::ID).set_reset(false).write(bar, &E::ID);
+    }
+}
+
 register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
-- 
2.52.0

