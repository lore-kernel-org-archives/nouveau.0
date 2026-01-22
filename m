Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E523D6CFA2
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:29:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 499B110EB32;
	Thu, 22 Jan 2026 22:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XqzcG1gP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 99F68404AB;
	Thu, 22 Jan 2026 22:20:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769120447;
 b=l4q1W+EkpyQe77lad+/oYljGhhzDvrUHy69qW6jARu3Uq2xCbqTfWN/pz6M6a0nBLIpuW
 SlWHbPJhq8KT7cK8zmBNi5M0akqciEbZqgo36iw40imWGK1xJrQFN2mnmK8VVF8P33U226T
 OH9PBr0nzchjtpg0uoHcJP97xn8pG8NaPR+3qq+Une4rlPNQp95KVtY1f94orFcae+1pJzq
 aiO57c0o2wxB8Eygumj3o7wwnc3f6nivjtsHhOlX8VH6at00iSS+WVpIgwOl2W1S8leO8Sc
 GGgdhjr1NLZ/Rb5IfvE2SlUdk6CKawhRmIgQ5HAmwC0jbcLtION/QCZr2onA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769120447; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=wPnEIG4/WLnHgn48lTtzRhFbwvdgj5krRzsfJX5uzCi6leipzcXa/1QMkPNhgUHMi891K
 QFYtqeKZZC9qfkKRZsiYzmXv+bZQb5432peUVNJB/68UWTocHd0XZP8hPteah/Egoov/UQ4
 VQPtdNyOa4yIJkU3MuYJQW5N7MlVj8AYxydzJBetDmwaFXTJeOYZWn7Nt+m9iscuHubFw0P
 Q0Q6lSyz+Pa4jLgn/IrnIiadg+vQEDg1OOJMCLHzesEeBeZxFKJRrPrTUxKaJlpsVN7qr+8
 9EXqpEEOCW0iBIiS3cTjWseW9mIzNAXvqW9YgLo1NE3ntG13XgEGe4cEI3eA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 90FD4403C3
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:20:45 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 111B310EB10
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrtcfIVCSs8E66LMNHSSKWfbZWI87Rng7JMMNnsVtRpRtAlbJmZ7jLsGSGROOy1tNF/WL+mMQG8COdyt/a5qGiDclQFaW4ge35xqa9+cQRYl+88aj2vZcB02QM1GyLxxTHcrKuOUJcsHPMbb+arkV3qje1M21PPPt2nm4HRmwM79sUna2SNFUvpbVRlLWZWG8VX+vEOjm4cavyZrNFmE4iEZtxs6CoKpGacZOkBLOAQbbxcqG7FFu4cOc+d0wvLr13DUh5D5aSt2jlzFt3VShGPoAesZPG6RwjAZ+6o6ketUpqt8N90W97V2AsodCwYIccIPkx5S5wrNd5+12FmRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=bOVno+y6guXxCL/h7fziafZa91QSXRcbPfARebS5QgEnUvFIlblTEozJNrr/rmxnZFPIOTJKh8+EsLUWvQ4OV5dHovT4+jN7Rh9v6eV2YkY3Yuaow+dcTrpgQG+fp19PvfV6WPYzuVpw2Ibsj8P2qRaMy8ja2DZUH/yUlkB7d7mhhsDYGerjlvN2I4lxm5bn/nHy/nWmOF55SgbTfY7XVoUs4ba95ZsnN/gjjgot4s+NhUnCydZ2PmWRKFlHtcUyua1nDy3+cFB5QRuAOAOlTCEuiCa5n16MDcvJwbmRLbM8YkWDJDJla+A/6IbCUY0DjGPuA/JXOiTUBNEmdtWiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePAvCMe2JRzMtW1dzM1ji1qr/2RuUKvIv7IE64vlbok=;
 b=XqzcG1gPlvp4rC4BsZWnfK86x7uCaXYsy3t3HUz+1t4DS+yWo0cZnB1Z54t4+jJVLbMeaftMLdf6Wth+keo1Kle1oTkA8p0geh+VkUKSoM1mrHzgiRRVz3ZbyBELlgvv8ePzsDn0awyVEFotXbLqpitBn0mlfBg0jnh/fGl23o8uj72hqBKYd4vfEv03oZ+OpH8jaG3hnaie3/wM8fj9yrC0SWhAaz85EtlZtoGABHiFbbBZj3p+xpIAJzkdHpTkicxT4kqQcxqhvrxRj30NNNyAaJESyvnOuc5SfFALBPBJkrhNBSmI1bNC1PXro1D8r43hsuXjVlZyn9VQ7hli3g==
Received: from DM6PR08CA0054.namprd08.prod.outlook.com (2603:10b6:5:1e0::28)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 22:29:32 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::59) by DM6PR08CA0054.outlook.office365.com
 (2603:10b6:5:1e0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:29:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 08/13] gpu: nova-core: add
 NV_PFALCON_FALCON_ENGINE::reset_engine()
Date: Thu, 22 Jan 2026 16:28:43 -0600
Message-ID: <20260122222848.2555890-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c16e61-9bb0-4924-c0f2-08de5a05b5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zy2mvD1LJRb9AjSM/dkbzQvhUR2c1uLShLfPxKtti7cJLWoi2dbggKfIx7oX?=
 =?us-ascii?Q?LpWkFpRkWivfqb6isD8YYv0M3ywauWp8qrsKDyAdPlYDdj5KdWeeJV+nFw3N?=
 =?us-ascii?Q?E2yTNlkB1jtCTpdRo5BXSRNNti7jZup8CeRxR8At8j/lqBeX6jIWSSNy1B3G?=
 =?us-ascii?Q?qF//gJN0+cXnxrPB3I1GkRO96xak8u9KLC/CpPWlLH6qpSLUvYUnOetOUzdC?=
 =?us-ascii?Q?QhkH9LU82kbfVUDcK3UIHOl5JpLVAUMsHOAuuaocj637+c5azgcsOrR1tayG?=
 =?us-ascii?Q?l+zZN87X0ZUpHxVLVxkJhl7gznkwGaFF2R5+4CPpJXytU5r0VQ8tUIvlV8q0?=
 =?us-ascii?Q?Xv5gVjF0Y8PT5Vob3xIpiT4P+l3cmFBRjs/Wp8BMTpLdSpp9n/zwZLmXXmkV?=
 =?us-ascii?Q?eFAJ4AFfc0Abp0f+Z3bnNpVCUaskItQoa+nYlUkeWmqpHdtaXqbcopvi8NXR?=
 =?us-ascii?Q?9T2wklKukVs0K5XHOgwJuVMyiQEgYrVPeM1lwE7f70HwZW40NiqV3EBJO744?=
 =?us-ascii?Q?AWULyS1asxz1U5YpaC3AGvOm4yaAxJxcS3trsfSnMzuxhix/aSvDlkl4Ob24?=
 =?us-ascii?Q?xGjyEg5kqBjT3oUBwfupWel4SXtg6/e6hitZ/+AcsxYkrGnDemTMoBPBEvqj?=
 =?us-ascii?Q?jakU41SRouTpwtUfQ1wYAb6Aak8xYxTJAbycndzmtvHIzjFCC2jP2RpFSvym?=
 =?us-ascii?Q?y2/SLpb3icYAKgmwbl5Saj/g5R0g7UWwjxrJA1c0nnUNkyC5+VzQPze8rIGs?=
 =?us-ascii?Q?6tpP8w6EhtR/lwdSalCBa24C1Qa8oWzlEFV82DuuihcIrl2j2tJFvdAdUB8B?=
 =?us-ascii?Q?MeThofFpVWoMfRceiftsQf7FFuknMdABcVTXFCKrHxRdz0V0/Ml1aGi7rpyd?=
 =?us-ascii?Q?24BWR8TL6paxb+CcQ1eCkhI1PLPF7lbI5ffO6yUuQuynatDOoyvNODPJw3rR?=
 =?us-ascii?Q?OPpFczgXzh0GUaJ7zpAOwRSsMO+RGbswgL0NvPXNzNfrHwXTz0/21M6TzRM+?=
 =?us-ascii?Q?fNp+zquheO7tT0LY2OY7xxQsmugOr5gVI9v9nhWOcOaQcXjYL3vWwYDhHzqQ?=
 =?us-ascii?Q?fdFag8IkFK/JqooeyMDVaqRAgtWoXvKwliAd3soaXDjAX3E9tlpEoQjFL/TD?=
 =?us-ascii?Q?fqJRnwhK87tqsAbXMMS0DY4f0t11TIYQT3tu+37NFvvEYQKgO0Hss6XpzpUj?=
 =?us-ascii?Q?io5+iM68xhpxMwWyYeQ3xJuwgHnGSP+3f8LsLoASckx4nqIO0QOYjfzXlA4e?=
 =?us-ascii?Q?v9cEYR0sdVmRAdUzOg+MkVVkRPLW8FXCTtykbSUk6DDehJr6ihJMQOOGIppk?=
 =?us-ascii?Q?6xCwSPgGaQIQOHLha1H7Y2DdKHfUCv8TeCYNSeJEhrw5zBJzm50inAmEP65y?=
 =?us-ascii?Q?2xoiDbg5vvW5pmmPux7QBPS9w8QAobi2pXbeeHyBEIXVyTuGsM3S2O+MwTVZ?=
 =?us-ascii?Q?T3TfPG24yVwlQHPBpFyv53Y6mIQLVEKvZCY6bq5T7kDnUSh/poXBzAtO39T4?=
 =?us-ascii?Q?SkzQFcm8HkbWM6XT2pdXvjQmitI8rYhSSs9JptJragPAXklsdIArtoQh+7Qs?=
 =?us-ascii?Q?fvmSfSGguMunzJs9cazeHQD8oXj7MO9kKelB6kayy4b+RTeWrKUJEMJTXfhW?=
 =?us-ascii?Q?M9//4Nk/lF0eBxTaS18snYtJftOIx+YydYt0ZIGf3DJkZTrvHiXy08MgwUz+?=
 =?us-ascii?Q?zwtyVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:29:30.3284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13c16e61-9bb0-4924-c0f2-08de5a05b5cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
Message-ID-Hash: D3JPHNQS2S7YZ6QNHYPLWW2AL4TOBN2L
X-Message-ID-Hash: D3JPHNQS2S7YZ6QNHYPLWW2AL4TOBN2L
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D3JPHNQS2S7YZ6QNHYPLWW2AL4TOBN2L/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-9-ttabi@nvidia.com/>
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

