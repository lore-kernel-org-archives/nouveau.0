Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BCDC44508
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 23:53:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFD710E8F1;
	Wed, 21 Jan 2026 23:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UDRqlpFn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72AF0403C3;
	Wed, 21 Jan 2026 23:45:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769039101;
 b=1Euwnvn00H7DuQot8w05cW0NZHg1imR7PY1vl0kVfUWD4fgZhQNNu/m499MMm/pYOiMBz
 b1MW/E4hNOiXlO0SpMUu/fzypRt/E1imBYJOSQOM32iLjuPjCnuwiK7xL9KBeAobERTG3PK
 EF2+B0Qi85DOvrLQEX9Hv8Bw+Mr/x5X0C7mBscFUo9YI5k/ESh5rebJNJjFcmkcqVYI6uGF
 k/sQJZqJEYDF5e0CAUqOsz2yQgosho0Q+xdnR6Sp9tJowK8qou1UteeG1WaCoERmGWoen8l
 gTY9nVB0ury/c9Hco9IV9ncnUwB2t56aLAJgPAv4PxxlZk8LGnfDoRPalgtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769039101; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OodM8uE1Zmmu0I+o0kinAlUFEdZVdKq4N7ctf19hfxo=;
 b=Aw/QQjsDdvjSe3kMavaWW3tho4KQYlJucFaf0kJLOMXSyRk+7knKgFiTEITXn/ymDeaaQ
 7+Gz7phWX1HkBwcZ5HzuMpl2dWeaSHpQEtu7z6KOAYvwC2lNIETtCxB9NfaKTdUa8/fy+84
 +21Fr9POvmIq+JImPZxQxeR9oR9U2kSZGW4SLteQntRuJXPWhCX1OwnMW+De8KXmWJOf97A
 uYS8kMokDArW+forehG6z6ngC9vGrAiLWKG2pBQS8+fWVInpZZW46UbRolviZB0JIIRr/YY
 T2laZvCLdBa5vU4EDXORllF9Htci9Lns0K/Pu3HXCYB/XnWfNmvjr80joMgQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A346E400C1
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:44:57 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01D7710E8EB
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAQKngj+MB7YsSw/uMylEVwkoARaWpZUfWfa0bajaEifhHXwieanS6J70eD/ADHvenbl9t8rLM2oYD7Bba9gkAkPhVDK1SNmEvNTffD7ptNd9W2TE4YifnJiwzc5nbEkjKh8M66sLXLoUkxOgsxcwDSfkn7OnsFC3AvzhEUe2jrfgUb4+rjdm7/hXhZjICYpkiacCYtus9eJhXDVzSQWfIeQJmZC3KsoqU0uS+/g6exDrL1VqUBpRQUrqiNcjr2HwZkXhoTtOss+2L6tcCG80eJR0jwRGOKgnHzqc4xLFWs5lbegxwtFTQ2K716B2kpotGp7gKGgZ6W4wmhNG6hVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OodM8uE1Zmmu0I+o0kinAlUFEdZVdKq4N7ctf19hfxo=;
 b=wtoS07kzblry5n/31n9VX0ykmkMYNcvPoPSnCTf7OjEiNVg6F3sod2Xiz1llweuRKrkT4Xgg0Pa0mpwwO8XASqzKvDNqO+gnuLQpi72+cMbsFEdrDnV2aQ80LfZcdfYpc3/maHrlSy6iGZlnBlK2bc3ZmlikExb6Qg7ERrQRjyWubSw13S25j8kIj/JUUaQL/EZ7vmvB+rD/7fcgLb/1BNv8RuvIpONJ87FZ3Skqqi4kbRp51p2mmdqIKRGVObOErC19K0U5sMboZ8Xgr5NNhmAT+7+k7w+V4AZQXIp4JjZdi/+ce4+CahC3QwKQHH4+bX6ZaIrEPMypTZAcZ/mOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OodM8uE1Zmmu0I+o0kinAlUFEdZVdKq4N7ctf19hfxo=;
 b=UDRqlpFnijH0Nx2WkPW67gEgv4vHWLiZeB+F+8+djQrEOAsknwii4yu2Zw0vDL2jnDjHXcHk5zX70iv4PNM55Hh6bRIzU8tJ2x06QELzMiCelzXlg9mqNuxkIEH5jZCgU4duuRx3FlxJ3LsQI+5Bh64TNxviJVr+Ith0UmjtJdryLufh49ZbYZ9vgB4a27x8KyZ7lQZpiw1D8ePuDrxmMQrDkXdEYOGohESvMY72nkqHgVEuoLfgvKEb9pv3O0qJ77kp0DuP+XJMQ7G3e/WUnRehkYNN+myE7VyeNpyHCr960Wgr4/DFl8exPYETScETN5l7DYRrjfe4HQtR8UlxeA==
Received: from SJ2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:a03:505::16)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:39 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::5f) by SJ2PR07CA0016.outlook.office365.com
 (2603:10b6:a03:505::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:23 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:22 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 11/12] gpu: nova-core: align LibosMemoryRegionInitArgument
 size to page size
Date: Wed, 21 Jan 2026 17:53:01 -0600
Message-ID: <20260121235302.1962185-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 283fc1ed-33d4-487d-2cad-08de59484c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wyZnRxf9KnZmQVzMnWELscC67sviECfeMIl8AeergVuIU873/ez5MGolHF3x?=
 =?us-ascii?Q?d/WwGaPTLYZgGs5q6Q5NK5G3y6y8wKpFtha1J3zpZng/3oOZ266xpd0zm/j5?=
 =?us-ascii?Q?4Dt0qjhuC/CTr4RSKgRzMeTK3BlhStl9d8X4F7RT1eXkDO4Bfl/7NcLF/DVa?=
 =?us-ascii?Q?+53B7ISZ+ue/wSMZWdWREbtKQzf0yBvnqIkd5dh1SsUDM03UShNsRdAl1KQa?=
 =?us-ascii?Q?pnVSl1z0ldKdFDIu6XLsGDRjDdDgzXDuogYJCt7RbL5fsyXjvdeL/pnU55Vb?=
 =?us-ascii?Q?lbryxC9HBkkZLh240hkjhALQ0l7aMgOyfn+LkiOb8t+M9ZIJJYuiOfcE92Yw?=
 =?us-ascii?Q?I8ULeHk+2nAyZCyofxqTs4kPeglN82Nu7af6apB+Fn9C/JUEMLKPZHPIP8ik?=
 =?us-ascii?Q?6sACi1PfqaDZ/t1U4FHPudJhNzq8ZisiTrMQJ+0jZzE7hck4Vy72/Jz8R2dV?=
 =?us-ascii?Q?wnx3BwAdTh5ZbhFPpd1fTaiQeXUTMxcKtd8Kcc0FeImkeIJAFzkoSs/ckt8s?=
 =?us-ascii?Q?qoVsflpVR/zrXlw8xPWrPv5BUX9PLJQ31SxR0gjyMWemDXO3nsv6HEsbeIM1?=
 =?us-ascii?Q?xUYyaLOsU553guow8aqsGM0bBuL/PtmMGAmY5voFq+xasIngm0mABrYLt1ic?=
 =?us-ascii?Q?vdR6PMnaY6SKfnMzBfnX/WJMxM1JbysqNvUdcNXgAvpM6JCjrIx3RtUzFwM0?=
 =?us-ascii?Q?3ZLnLI+jJKeS84ACUhNhZ/+alhjO0qa8WCaH06DNj5cOuhbsdHK+KIdDecjW?=
 =?us-ascii?Q?ZOPeeq1DPuDDXKXB+Tg6HFB7Na56WZLQXhewXoUn3ntQZBg2dYHQjMJt98lB?=
 =?us-ascii?Q?UQB+//hOiNxqn563/eUwV7N4ZBQDyjqpoLyVxJmNCrM5LVRzrWCTeJ4HoAtc?=
 =?us-ascii?Q?/mEoRlj25cqTE5qz7rTr6fdJ0z4/+smTobGYt3tSFiVPwUbnmbc452m9vye3?=
 =?us-ascii?Q?k0q17lTs5fC77Zmm/jOOx2LF6q4MXioKgp331h/RsAdKLmWBvRMSDjH3Aoen?=
 =?us-ascii?Q?HRjCOvUgza4ZwYacm60DYOqvfCVZIN5/Q608MlD1wJgK2FECYG1LHYKlRmna?=
 =?us-ascii?Q?zgf89j7i0PSlWSvPOSUfs2+csvEWgRzFYfFqrIOiyXjFhpeim/qe1fTzrg6s?=
 =?us-ascii?Q?T8PjKFpOh8lkTd+/54OMURXStljAOwnlXgw536m/HIlFcVpq6emqD9bq7a51?=
 =?us-ascii?Q?z2lUP8jWbvwdl+aLLTAKHMTZRxnZH5dCuEAjHDtOdaevcy0rjAqw+b0mvsYo?=
 =?us-ascii?Q?8WBOIb/CcuT6neTKNSnJ1ReQfmm2KUPHQxOWOpWnVVzmLfZUpW9xF+EnGS9B?=
 =?us-ascii?Q?AQn9WuBjA7CXiABSn07X+n04qxWsUkKzt11Zxjrn6NknTF91C4jn7iBBQaTf?=
 =?us-ascii?Q?inssA9By8C86Az02Y7WJ4ZGPHreoj158Wy3vk2v/PEkf8WJLNdESiFRGe6Ws?=
 =?us-ascii?Q?FEs9lWyVVQNSJ6MBFK0TD9dogeyEVv4E96pSjm71BrvZ2sp5IqCT+2RXi48E?=
 =?us-ascii?Q?4PNWf1y8Ywu07rwwD7I1FRNL6Txv+K9CFo02pmXP46Mc0h6pF1j3daKca+MG?=
 =?us-ascii?Q?CYfZKpbzWn7kWSbuovt9foOiMRSzVjAmNBm4HwBveMXsUOQryqk1Ah7UfBtE?=
 =?us-ascii?Q?wlF73O9Hi5jpWm51ZDbMNiFdmKgURU5Q7AQosi/zL+SueH/dzpBkcfAl1Fuc?=
 =?us-ascii?Q?zk8v6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:38.4545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 283fc1ed-33d4-487d-2cad-08de59484c45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
Message-ID-Hash: 2MTTGSKPZ4EXUSI7IUQ3HAQQ57WIZUWM
X-Message-ID-Hash: 2MTTGSKPZ4EXUSI7IUQ3HAQQ57WIZUWM
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2MTTGSKPZ4EXUSI7IUQ3HAQQ57WIZUWM/>
Archived-At: 
 <https://lore.freedesktop.org/20260121235302.1962185-12-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Alexandre Courbot <acourbot@nvidia.com>

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs    |  8 ++++----
 drivers/gpu/nova-core/gsp/fw.rs | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 766fd9905358..bcf6ce18a4a1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,7 +27,7 @@
 use crate::{
     gsp::cmdq::Cmdq,
     gsp::fw::{
-        GspArgumentsCached,
+        GspArgumentsAligned,
         LibosMemoryRegionInitArgument, //
     },
     num,
@@ -114,7 +114,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentAllocation<GspArgumentsAligned>,
 }
 
 impl Gsp {
@@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
-                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc_coherent(
                     dev,
                     1,
                     GFP_KERNEL | __GFP_ZERO,
@@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index caeb0d251fe5..89be26b597d1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -904,9 +904,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsCached {}
 
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsAligned {
+    pub(crate) inner: GspArgumentsCached,
+    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsAligned {}
+
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
-unsafe impl FromBytes for GspArgumentsCached {}
+unsafe impl FromBytes for GspArgumentsAligned {}
 
 /// Init arguments for the message queue.
 #[repr(transparent)]
-- 
2.52.0

