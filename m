Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B133DD6CFAA
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:36:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36E10EB4E;
	Thu, 22 Jan 2026 22:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JJ5RPoeq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8582A40564;
	Thu, 22 Jan 2026 22:27:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769120878;
 b=UoLZuo/srJVY4y+bgHpGvwaOJoHdkzS5Mnza03CfXPkZMI+phDtSHBS52VXYN+Chc4RQX
 Rddg2WF9tJIvZsUKBlnz0T2rt44GU7KTucPTOX0JkO/rhtGGn5P4DJD5JSDi9i4jPH/DeJU
 dWbgUj+PBWRFTU+KAUWKhm9jbLZZVClVxO7HrceG3g500dL4MIqk5rX9HycWfGx6srTiJDZ
 eb7Fdb7W5lus6qbErwTj97okoF/9za4HIc9vA2+OuCjPoeqcNFT1hNlZMSFT6ciK3mVrWCF
 Mi4bMciknDHmfBIBY7mMokFU+qNKOedFPGjmfnIjDqlSVC9lEVAiMKEARBEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769120878; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=PXpgquepNK7EphC7bFygMKklnSKMDFGYw430ryVbKP1yyRMoloUUHVxzRXah1fqlyHuZu
 pYZYWlic/PPlM3I7b9FjUTSODLGgNqMIJvrx3xz6YJqVH53yYSwyUVESvB/KpoIbMPoW49N
 aNw+9rHklyoQjXbuRt6MDYuCcUrZtfs5ZQweyXK8lxfL7gAlimRg5oIoYi8pUqESpXnip+3
 eSE6D/4GsiVjiziOLAmkGYEjbitwHzLt+Nbk+bRJM0AO/ZzhKLZ8vyS882UX2ZUDgtcCyDe
 VV6hRfvGGGbPiiPb5dWiVmPTv3F3gMXsUflckz0soGdxg/Ci3tXdNmilDoaQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8CD75403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:27:55 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013057.outbound.protection.outlook.com
 [40.93.196.57])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 024CA10EB49
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blqeiQvQCr5w/Qf4pvGEA/xCxuCSXubCdoMGgwRdwr4ZgplgSVuAikO4fgYsUNWjXWGsSod5KfXb5TjqrKob0iWyOLu3KJ2xYJ+vd+7ZiUXKXI21alxI/ay+OAoeF+1rEjW6kN5A3eDT4m1hASDdij3akQffWnOLR6AKq+89jBvOOyRyLTEtHaTRbh7FbmlQtKOs4yyTCSgDdyCrxreEGzyTXY6lq5nv6GkeQK0wo9Xh6Iq4BsfeLNOn47Ego80hRzPSkZwFGSBuUcl4MO2/sbwkEP4Jwu5exGdmyzEtzPUb17yuFfeGqYG01knY47Ih58/bSgtfwobJHnxJDS7VDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=Qrr/jiIcuT6RyTFD7BJRb0k2EgP29gAnNjkG4Kkerb5ZkYG/5c7ShL7+kpLppcoLP/KKUrQjm6pEsMtXndr0SWFxuI9aplNyXSzwLgfrmMuAWQJJCag18XUCwp8MBGQTjiydI6BClojm/Rlq1w21jMtJsQpVXuNN79Zk9q8OmLeLI6ixLNmCTbO6RsAYx9fMucltTLG2vLdZ999/xTVsepU0QeEBqyJVddLX/i7MFzRu7EaEg9ZyG/33b0jAysfKlcG0WmdSVQziOnuMtFZAddcY/Y+XRSW2llAiwYgUd2Xvjfdqu/jQ1IW8lYgwbYFON6p3+qdPyF/WXQAXvH99Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=JJ5RPoeqz4jXmgVVd3KPK7+NqA/VXltzluaEAm/zHRY8TM9HlXz9Pxl0hiHjmKzXTuOzqPF4QT6Ec/M3QGunaHh55z8XkiPNXhouAhiuAz3FGPBzIbnYYaJA8WtYPX/KdTnvMpNZIG6qtTq+fXPc1YKSr3DhwHeT+mebGyHqNuE4DIgN9GFqUkeVOmLO7tgOv/FiKX3cclPSYQmz7dBdUn9VzyD9BhAgir4Ta6j3joLEpF0yTZkcCV9nD6NC8QnQFIr0jcmzMIoYnQQPgA1SIMQOWDfhWNfNlXfhR1UL7uji9PiNxXwuKBQ0WdvUD4rAEI067YyS90FW7XihPsBiDA==
Received: from DM6PR02CA0117.namprd02.prod.outlook.com (2603:10b6:5:1b4::19)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:36:42 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::f9) by DM6PR02CA0117.outlook.office365.com
 (2603:10b6:5:1b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 22:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:36:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:58 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:56 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 01/13] gpu: nova-core: rename Imem to ImemSecure
Date: Thu, 22 Jan 2026 16:28:36 -0600
Message-ID: <20260122222848.2555890-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c63f4ef-0c98-4218-6713-08de5a06b64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v3SilgHV8R5udYjveGFmKGBKF9nazXHDvoRN7Ugm44rMzml86j3+BQ5Ox8p1?=
 =?us-ascii?Q?h+Gqs6wpSul6VajS4RnidNiwHxlb91zNaoidaOtSKxuecL/xF1N7NJECEN8j?=
 =?us-ascii?Q?dUznSNIVcLa0/wpvH4nA/sFxTHn90L38Lv4TEB4HTkufVSWF5Utwt7WQfFyp?=
 =?us-ascii?Q?Gfxb3v2gE/hP0vmfWwhKJ3Ei9NwL5Rj8pubp/SsAXX5Y1YzLv0PAaCns//ED?=
 =?us-ascii?Q?jmWjwtEEJKa6xFmoiIp37VwHd2SM+An+nsW77Ed8vMDOMIO7ytY0OSbcB8kz?=
 =?us-ascii?Q?fS2Qyl18eXbHFBgEdAodMozE9DIMfbQ37TSC3oCT5KkuMOL83B4DULt9sIVl?=
 =?us-ascii?Q?x032D3BXcMMle2TCnWN5aZdxTYQgym+tb+sQYMkL35UMs+EWeuhQlBhWBwf/?=
 =?us-ascii?Q?L7cdjrIM5t5nABgLcEEqj1LL34VWyJBkjSKrm3U7dgCo/3HNSEU50II24EUJ?=
 =?us-ascii?Q?PZLtFg0VwsDiIbKUyhQIiAE+iTgyMPjyftF0/t8IZWNGHZkT94kyqhA9Azbh?=
 =?us-ascii?Q?Xfk4NmS0ttfX1hWc95e/MAlfZZQcRt3tANE2mttAKzgoaoCFxDXALsuQeYoa?=
 =?us-ascii?Q?luiL6HilNnNQhLDo+Sm/GiYks5+hXyd48+V8/JcMLRE9hJpJJdI5ha5oicGf?=
 =?us-ascii?Q?Qn/Fbl1gvuU3k9c9T/yUNbXSsE12jaWR3lZzFd0yP4eYncfBP+3hELccGOzt?=
 =?us-ascii?Q?4v4fdds+uAI+Kvrb55MSoYMpOvaH/SLkmnRJBvl6LRMQKiC0YhpXNvphJ4Ei?=
 =?us-ascii?Q?7VOfBsOS8gciFb4zQbejNzVFsVkcNOy8smmuZnhzWKJf0azGqn4o+XWcRu4O?=
 =?us-ascii?Q?p0PakA1xmLWEXg1XwkMSnCyvMCY54J2hiz0g8fqXC9A40TtMK3ebtXCCDYnT?=
 =?us-ascii?Q?MDwoLR1bKY6t0vqxPeoCcqN2HnYd7e3Yzxn/nZxqD9b7C4K1yZg888CooxVC?=
 =?us-ascii?Q?Y/h9GxbRvElRfJfermTWWGENI3mNAMlkskIsSA5PjtXjl7E78ZB6aqJRs9qZ?=
 =?us-ascii?Q?p/2oGohp8OOLkT8I5nwyWvfkrWKPzipIoOc+JAUyueO7LrenH6LyJGbxdNqL?=
 =?us-ascii?Q?WfuUKQlBHiVnmgq7F2Z0ofXJz9eGmQ+fdZMSjGJT6nVKjvoypEwofGINlm0K?=
 =?us-ascii?Q?jGUB/5I2SRRunAU5Ju2HK72BTFLF6zSk0p8pn9Lvirs+J6hGioiE8PmP9YJJ?=
 =?us-ascii?Q?aQGOoSeU544NM0qt8CnDOKXfvVMq1xiB5VT/xYDbt4gx8px0pmU07wyxYj8s?=
 =?us-ascii?Q?LRKHsZR7p4VeXt13SqZ9O/hHf7fJdEehwRYRshe9gMBm4KBzw2/Tmezp3Ns1?=
 =?us-ascii?Q?4JgHgfA7GU/fcwvSAS9EtpxqBV+rt4tF59h29CWIocpkIyth/IEaJPpG1jKH?=
 =?us-ascii?Q?Zlaa0EjaLGAC3W/SFhZw1ecZHQRLtreoS8y5wNogbUsqTA10Ei5SjIHaOsXa?=
 =?us-ascii?Q?sNwkgEEP3tpHu89VBZjx3EJbsQtIuBTltPpN2v6+LZQbYPc8FjFxRtZJ68XE?=
 =?us-ascii?Q?HaHxb98Q3IlekPp8dAVvjEoUYquD6EDPanUztuZ9Lwf3Z+dCOJbKuXTGDeUr?=
 =?us-ascii?Q?wg8x95i4ALtQf/iid2Hp2BGC84nhEtbHIAY1DnImfCiDjp9mipRAgbpb87my?=
 =?us-ascii?Q?JvIu6OR4yMj9wM0/AO9OP8Zb7tx4JhDblxp4+hpeKC8pooSAZa91AlMM8bdS?=
 =?us-ascii?Q?U6nlqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:36:40.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c63f4ef-0c98-4218-6713-08de5a06b64c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572
Message-ID-Hash: WVWRASSCEVGMKGPAFQJXZP7SCHMERZ2G
X-Message-ID-Hash: WVWRASSCEVGMKGPAFQJXZP7SCHMERZ2G
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WVWRASSCEVGMKGPAFQJXZP7SCHMERZ2G/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-2-ttabi@nvidia.com/>
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

