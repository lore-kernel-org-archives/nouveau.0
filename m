Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F5D4697D
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 23:53:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24810E8AC;
	Wed, 21 Jan 2026 23:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gjJmpt9g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED87040284;
	Wed, 21 Jan 2026 23:44:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769039087;
 b=IU2or7AnISRk7oyqRATzgoreqSBUepa9yg++ZN8Omj2lQ/lKm6nYoa+KK1JcrwwyEnHj6
 iOWqZ5oRrW2k1NHJOuvISmCoCqALi4F9Sz7TpV76aU2Nv7vihKkmESw++1pHvjr49RZDTDI
 j0Pi3zWzVLk1phO6l1p+5NgXl9B1w3G+yWmo/kd7zmzrfJwAU7DSWaOZgzWZZxb6EXNyRkm
 mjALpkZNCHxwPaZKeA9sLPXvDzXKHasz3yyCpKk2N97XY0vmaLODuUD+ssCDgFVslN41r6P
 ibYjAA6m4u1y+Q5SlohPQrXOCyJBOa86bfX/QrfX/RtZiYJ+vMCv8M7ll0Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769039087; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=04QU0eqvm75qMvcdxWXlsz74EE9Jg3Sk+ZT5itvNeMUE4yr1Bs53j0YAL9z0fEZ3hrqI+
 DQ21NH5j9/0/KHZ6yuvpy7as76oJ13UqqTQ9/34Xgg7z3ssHzH90ZdytvuVrghcJSTxNJUc
 Lbc9b7mI927mZn5omp6n8dLIrzkFf1//cqI4qIz5592O9fP7bboqMZPL1EHZD6HfxQEmHEG
 +e0a7dfktfYo329XuOufsKVhJG2oWnNlyKi5NkKvgksBzoGYRaI4QTC1CpvvWPGcIYhH0jQ
 92e+DrK9hBFEf5nDPFvQXI8RypRDgS5NVAu3dGTL18rpw4dN6BSMCCqOGpPw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 76E564003B
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:44:45 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACCB210E03D
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOjg0al0MSDjqOTUhfrzly3huk/VGNlBLnuExfeuWJiWMOlm6Cf3tOtZHjKRXVzRgrT+A6vJ0yDOwVPdjgdlU3yrK7xJ7Bc8NGSvvvMsOWjuqIVsUDZt0aHKIVc1AB/ayPL2+KsVz9jftLkJM65scw6W0WMwSC14zONgPwvkTB2l6TjKFgqx17yt9fDB+La1HWtUSOytb3DziwAg/xuCkrZ5UplRRIXOR7plCg53xLj2iR5NeGj9sl67HtptX7x97Inww5ykkCAf4ylIDIY7M18htG9/E0903u/lfe5HBdRg8fF4AqakbaHtxiBLwCYQOavE2tyBXUWK7pAokavPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=jLezpz6gvzeUvSvL0HhousaAIqH8o/qmxI5EP5v6IRh2WwbslX9bmkMFVn1xdVng6WF0R+ubWCAhlg2QhPKAOkc1YU47+MGeUU29PRNVXvhdBVfS52oOBl9DsrJUBUriqJhGzSDxtx/nsBaIJvgzKnKbkNSl0p+v94ZrmvbydycSWVfk9NQDHshDMk+SilifWJKR6pm0slG49kygshJ9lwUlV9yXNzurxhwmIJVILOhdG5hSfFMdGXFNo7d0h4IihgK3vm8zp/Z9lKiD9RoxbYSN8N2OJhBdUzPOwrPiIlcvdN1NRQxEKRftiU6/5V3QJuQ9sPGWPWONcp/TgKUaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=gjJmpt9gRgwA9rQ7ree+/xJFzIjzP0QNEiMFtyRWW+TwCgmmh41nD2DROQKXVFbKzBGE2Uv11zRg+2sjrFgwLCUOd6+NJqwYFwC1xRWtFr9x6thqiurHgROSoPSDLlswIaH+MQequz5fTLUuVfsDUmIukXSAbCIJfMuZjxse7+TL21sSva9HHNL4OH32YvlU33wa1Z5FF4uSyE/8YlOPvDchr5TCnjZWvb7V++GM/IZwUN8SoRJ3cvlDjZ65WKFpsKLEDY03ffVGCG544cqDs01QI43yxOI+RA7hYLuYDYkDhYY2c6JfZXKSRLCA5fizB0YLStOhk8rdaD2ELdsOcg==
Received: from DM5PR08CA0044.namprd08.prod.outlook.com (2603:10b6:4:60::33) by
 CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 23:53:26 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::e6) by DM5PR08CA0044.outlook.office365.com
 (2603:10b6:4:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:12 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:11 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 01/12] gpu: nova-core: rename Imem to ImemSecure
Date: Wed, 21 Jan 2026 17:52:51 -0600
Message-ID: <20260121235302.1962185-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b295be3-ad84-4d94-e441-08de5948451e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SWavTr+sQBUNeGy/yD8IFvCQ3bLMXd5hzpAspmP6z4ul8B/d4+wQCBxIiWf6?=
 =?us-ascii?Q?F3283EN27Nt9aqR14wlpUMl6UDyvp2m7bMK9PtaTRymOkQF8c31F97+olgSS?=
 =?us-ascii?Q?F7tt2zb4Y2qPTQb6wLj582I0NL3EUi8XOx0dDrsH23MGgV/ZDJU+1gNkpCh/?=
 =?us-ascii?Q?hNIXPnRu6E3gDwBsR0MPQNI32wHl8DPXb1aFkEQfJUAygiiB1u72u8z/i40b?=
 =?us-ascii?Q?aPd9ZU9qCQVypOpPTrU7TnjszemSsXzahiolVifuqoN5rYUQ+wLDThpSX0Uu?=
 =?us-ascii?Q?/TfXySGY9hjVBJevL45ygr0Q/Zql6BiDwazi1JAIpr7SGWzBVFcwr0osCQ1v?=
 =?us-ascii?Q?exgAwx8KuSzJ0RGobqBT5gLw2kLvMsfL6IU5ncN1nQaufUPxqRdCBSoQA4g0?=
 =?us-ascii?Q?V04iMLWnvTpABJcCo2ScTNKo0o+xXqMwmFgcVGz6tLfdKZkz960am/ua1prD?=
 =?us-ascii?Q?hmGBH+y4aln20fl4wQjmV9IswBscx20T7HFpvqupsLBDUcIuFYfNvaiDWDZV?=
 =?us-ascii?Q?pumCR6wswxc8LMEG/DQoseC2CZyjQzu+A6G0kg4D7IrQbGdS5vlmrdfmPKPL?=
 =?us-ascii?Q?V0hjGxcCTgdMoYBwCuOBAq0EBAjtAuSGmLTL6qT7Kh1G2q5Z9o61I8LbBT/h?=
 =?us-ascii?Q?mFhQJDdgH9qs+LOjoKr6OBHfZlFJo+joNl5qfg0AfXSuhj/FtqnuVE61TlZw?=
 =?us-ascii?Q?XDrRfUAOaZPgNr3T6NcthokiP3ISs8QYLQ2N+Ac+THsvgIyA2xJvKjZd3DQ6?=
 =?us-ascii?Q?gAB0Nb03ygkyi0ajPw7/oqGPMU19YM1ANouZLcRE7elm0CaBS5NE5lfhDUR8?=
 =?us-ascii?Q?i81pkhLwQi+G9ei7UxKGa1R4w0kyyxzAZGzM63en8eYTKpFzRoiX2ceObmL/?=
 =?us-ascii?Q?x+ElPVqCH/cANfUh+ANHnTpreKGGN4nP/Vo/LVbvMGCfoFdSQuL0NyBKc2Vz?=
 =?us-ascii?Q?kVqOzyeOPPVIRePnJ4EWnqDwDwuJ+9nNDl+2NQ4c9ZUL5nEHSQdqeWMFSmYC?=
 =?us-ascii?Q?qhP5VNrF+TwBs0xU4rAOSRTzeFdomEUhdjt/jPVUzjCC/nl6gZYSq6YR1zQG?=
 =?us-ascii?Q?KKD7/pbHDcqeOf6rldnlxacJ4ErDGyWM5YstX81CnngxSYpsAIURKQ1hsGHr?=
 =?us-ascii?Q?BmZmTDAw6nyxmOBoQNaa5iQGbkSMkjQh7IfBb8CGW3XIr5HvobF7WjCg1V2C?=
 =?us-ascii?Q?SATlYyCgtOKbMvJnwr7eNwXW5GKjuybaKS8xqb36Qc+xT1ndip3saO5JoyC+?=
 =?us-ascii?Q?m2FHwTtiqlR5YDgARwy7JEQpJts3PbP0B72yPX2yZPPflWgus2DCWUV8t6J8?=
 =?us-ascii?Q?lBxkQePrGZSzGiXuJIsYdZBOkeAfMJVsq4oH2RTeDbZ10Tx5i3jbJeEsbYBE?=
 =?us-ascii?Q?Z4pEkZNsec6ValYmrKMUJJQcGvyy6cEFt2tVyM2N/7QEgQv9qP2eB49jsX/r?=
 =?us-ascii?Q?W3yVyTg74iE6D/G5/H7U8g9oGgrspoh7x5w34XtOATuBU5zeqnt5JqvhFHVw?=
 =?us-ascii?Q?n9REadIhcrlPirEhPzKlvXrzKTmHo2mkDg6pi2HrR+0wAbAX14+yo9QmWu5T?=
 =?us-ascii?Q?ZFZ/Cxe6ruWgA0SYHO5xsc/1MtxKKsf2/IjumQaZOp9BfRkYPO2u+7LVZh6X?=
 =?us-ascii?Q?Mpbo3xzEuAG6V8/7v+B1O1Y915AASkaAxPbA6zdGsoUeXgELuuPxeT5pq9oX?=
 =?us-ascii?Q?ZkkvmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:26.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b295be3-ad84-4d94-e441-08de5948451e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
Message-ID-Hash: 5L24XTPBI32ZSRZCU5TYUKR2BBBNNZZA
X-Message-ID-Hash: 5L24XTPBI32ZSRZCU5TYUKR2BBBNNZZA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5L24XTPBI32ZSRZCU5TYUKR2BBBNNZZA/>
Archived-At: 
 <https://lore.freedesktop.org/20260121235302.1962185-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename FalconMem::Imem to ImemSecure to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can also contain non-secure sections, and so FalconMem needs to support
that.  By renaming Imem to ImemSec now, future patches for Turing support
will be simpler.

Nouveau uses the term "IMEM" to refer both to the Instruction Memory
block on Falcon cores as well as to the images of secure firmware
uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
instead, and uses "IMEM" just to refer to the physical memory device.

Renaming these terms allows us to align with OpenRM, avoid confusion
between IMEM and ImemSec, and makes future patches simpler.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 20 +++++++++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 46b02c8a591e..310d4e75bad3 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -240,8 +240,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSecure,
     /// Data Memory.
     Dmem,
 }
@@ -348,8 +348,8 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
-    /// Returns the load parameters for `IMEM`.
-    fn imem_load_params(&self) -> FalconLoadTarget;
+    /// Returns the load parameters for Secure `IMEM`.
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
@@ -460,7 +460,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -517,7 +517,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSecure)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -552,7 +552,13 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(
+            bar,
+            fw,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+            true,
+        )?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..096cd01dbc9d 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
-    // Load parameters for `IMEM` falcon memory.
-    imem_load_target: FalconLoadTarget,
+    // Load parameters for Secure `IMEM` falcon memory.
+    imem_sec_load_target: FalconLoadTarget,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -354,7 +354,7 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
                 dst_start: 0,
                 len: app0.len,
@@ -371,8 +371,8 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
-        self.imem_load_target.clone()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        self.imem_sec_load_target.clone()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
@@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_load_target.src_start
+        self.imem_sec_load_target.src_start
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..6a2f5a0d4b15 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
 }
 
 impl FalconLoadParams for FwsecFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: 0,
             dst_start: self.desc.imem_phys_base,
-- 
2.52.0

