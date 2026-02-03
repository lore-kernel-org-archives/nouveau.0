Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26526E8B36B
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2E4E10E6D4;
	Tue,  3 Feb 2026 22:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hqp4tkzU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 955A941B4A;
	Tue,  3 Feb 2026 22:39:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158371;
 b=q2O9qn/QwMsISyxH0MdOx5wOHS7XaaK+8SyLyluDhYfaLGlhcBFKQlWyi9p7AhJLLV9ig
 VY814Xky6N7zM5ev7+IEflgQim7cDMoSO+VrQTndB+AKLoULkJ6t4/PlRGeXk+TTRllLJ86
 HAa7t/aPtf2Pk6l8QPxEV3vv5hzYInh4/Bjm+Fi25YydCyf3aZI+pA7NwusnJtZut+zMKRx
 gLGohzci/v/eOqGJ4o1IqjD3lOryzRi8nojf9YWYBvYFWR42xTjhxkWjlHU9/cxGyKnZ4X9
 QsfTLuFz/dSN25Zqf9s0NA8IlLR7EL8n0LHBlm3aBfcW5ODSBdtnB3slqetg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158371; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xgg6igsKScrVlp6V1T9943S4ReIgSg/wlGyEB5sz3II=;
 b=Tva+2SgCh/5qNYc95GxMbyzEC9Mkej4JXO22j2R/2U51DJS80VnMAZWf9LX1o9Vri4lwx
 YbcCkzkHObeg0FpNTm9H+rsxfm/s3At5M+afxDTGiL5cUo+3Wg4b80wM24tGG2B4y5gMI+u
 WDGPRLo/zx2MDE2P4M+KGUTQiju03P40pqDJnxqQJsMoL9Mz72Pe7JwW8dBFCVPryhU1rRv
 YIyU8D6GF2/8mwfrhnajIL2eyvsulhTTG8fpjQS5U0XvpJbMWPDwCk04nkmexa7DCwNrG/k
 EA7FNMSUyvtBaFlUH+MxntJBztAKFrBxyzEVTixsjaLFqFyVT5Sqc7grdbPA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 757E241B47
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:28 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5D610E692
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uidGn5EI3whf28JOvVwglofmOjybJjIycC4GZi0rnXj95PoScAH1TOiVCsyAmzWYXuODiM3X/+bVQ2bHasdtdBjyPJMa8h2/T6Odog8tpBlA2CiUviZ+DqNvOTFN1pP8LLV1Fwb+yjElstcyQku9HhLeO9psfA3clAmar5FMZXQf+/JxZzXcnFJzu2jLjZ6ruS236HInMB+mJm2z1m4hXCDqobup36UdieEHzXcc/dm107tZzQYSRpEhW0X/5SrUNUlg8OhcYO8jUu9D7xh5StJJfHxG3GpWPmJVDmC/e0OrLfR4q8Qw37TbwG49MWNoZkOl1Y2WkAoSNMBPEAu0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xgg6igsKScrVlp6V1T9943S4ReIgSg/wlGyEB5sz3II=;
 b=T0LMx9Ye+cKYMYjV/mzwp4SFuYiurMDdWNCYxChTEEg2RmK/jds1K5x0ppVaKfX2Zq72yht6KePGlfgJCnrA4Aye+Hu//2uqjgOnGHgFHz1EllWsiKfPt8jZcLs+Wbnj9g05IjhLAAXWWHBNedlh9j7+FeSPH55C5dxlHc4qrfRiPNQkX436iF7jriAW7UXgH8R/iuxf8JrkQ4vb8OZJlmhfprvWI5Yq8182THCikQQTrZ5LuloULO3oC5rY1obOmqO85iKDZeJn01medq51K3hxAYoSFGn+2kMeRvNcQGWT3bMp+ES8h9MjKSyAcAFB1RsUeYtyRILrZI6+iTJ3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xgg6igsKScrVlp6V1T9943S4ReIgSg/wlGyEB5sz3II=;
 b=hqp4tkzUF1oBWKC7AEO4CCsmvylOIyYgd1zAtbc6gDUomzVQ2u1+8zICUfIDrWwkjFK2/Nejp75bMukGiggeDBpREemTelJa/ON96ZFZFV9EoCAHrduycM4rl8ZtqQQINAW8nOkYJip7jDmIP0C9cJj0QWAK8nRQrFEnyZy/IjfPK28D5+moVqzgizBSLnsxgSkW9MhgpB7M24I0eXttlULOYE4jYz8y6dPJpLacbwQSKZ3XylhWg1OneN+RAiP3II9FxSfJsywva4HsV/FB6joX0BfGz8wW1BAMzG80dpJclrb0eFIczKzPyz52YniPlqz4A5ac8l9OdsYI7ht25Q==
Received: from CYZPR14CA0037.namprd14.prod.outlook.com (2603:10b6:930:a0::15)
 by IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:48:39 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:a0:cafe::93) by CYZPR14CA0037.outlook.office365.com
 (2603:10b6:930:a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:16 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:14 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 7/7] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Tue, 3 Feb 2026 16:47:57 -0600
Message-ID: <20260203224757.871729-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfce52e-757a-4523-4e4f-08de63765fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?51I6K4+t8xhAa/J8NmKLLymKTANm4QZKm/NLP2Bucu0nkJ7uLWEvbi1ptlpO?=
 =?us-ascii?Q?S8uhaGJSyDr936FPCEpMha34qH81nMSLHFkjr166dMeYatd9Sx506JJ2TRHP?=
 =?us-ascii?Q?VErOdzWSanMtFNAB7ugr+qKlLARLWKBQkX4x/zrmhZVyZ6kHeNAYjTFwVF4b?=
 =?us-ascii?Q?dfBPu1mwYy9+6027wgeMLnyKbAZXXyWZ15Wf9R35PJBZxrdOcLahjw2yTowZ?=
 =?us-ascii?Q?/nV0wfo3ivRa9dGb9FN7D7gLus1PxnEID1CFytTqdEfnmwwrjdX+rUS7k0Hi?=
 =?us-ascii?Q?TDClOzt6tuite4KVHA7ezCpN5T9Wr5BW3xEM1a5+t2jAG4Pcb5YJi4uMCKhI?=
 =?us-ascii?Q?gv3Z/R+SYY7iA9aQqE2fLj5bx7lOx+Uwbre4yalhoCoB/+6osSoo4OfelgqE?=
 =?us-ascii?Q?CiLI59r+D55Qn99UKJ6ah0crLFB9iBp6SlEtV0h84ooY1+j7V6xnogul9YGz?=
 =?us-ascii?Q?LxRGaBLSL/5DhKAahnTh0+UDP4IUnRR+GLpNav4oNzDfzknxqwi7GSZ1wLtK?=
 =?us-ascii?Q?nPkGAVxlVNomA8Ieu+VLhbn0oIJYYRvSMogChr9mUJvNgdE0Aszl9mMssGcP?=
 =?us-ascii?Q?sQZ6Gw9opbJs1YWLoV8G+/zN3h7KbqJYjjeoFmi5uvf9PAdbQfxuG2OkO+f6?=
 =?us-ascii?Q?+0ogOdz8yyAf4jsKkK9+RZvfzJXFHb/IgTia3bCSxndb3bOt1VCkcJL2mH/n?=
 =?us-ascii?Q?dpNDw7Ht8CCQiA8Y04ZAz8EZRbNXWZk+VSg2F13ic26wTHcsYSzgMSH2tsux?=
 =?us-ascii?Q?RMwyKtllUJvcuSTQImbYCTGqiFZJOW00zupUoWi3Ol2Mz930ysIHWYWX2G32?=
 =?us-ascii?Q?Qa6rykoCzy5hbfvqByIk2JJRIH7jDhLXDakPiMYYs4iifg/uYoJPujfvR0zY?=
 =?us-ascii?Q?HnYp468XOCF8zZroM34o34i1QVaUnuaWq2Ypt16sstgBMKKu4GLMq3vpYAkq?=
 =?us-ascii?Q?IJ+OyxdSNpqMH1UyFSd5/+kMqr6rP7UN38w2mP7xuqxai9v61lcJJx+02e9I?=
 =?us-ascii?Q?NggRCT9Q2o44C1mcgQJ4LfLRlrmsFrn/WcIbaG56ZKvuLh9UdN2dRGmvwpY6?=
 =?us-ascii?Q?NkZ7KVwp1e0LlEeA1qK2QwHyNTjKIanmnX8Ga/8yJVXIhJonC65Ef90vh/LZ?=
 =?us-ascii?Q?/28BkBQi8ihSC5qQ2/PWKNcbgmnnCtjiQc6bZja+iUr2MAtkX9vJhTBZS/hM?=
 =?us-ascii?Q?1xgpgQvrosIblI27/RbuUvpBncU0GdF+wJKQ3kxqT/Qfb91mBvVp5AOVbAIf?=
 =?us-ascii?Q?Dx33DgwyDDexJcxfLhH76yzYVH61Zeb+dVFmHnbeK+iO00RrfKy8ogIO72pW?=
 =?us-ascii?Q?/rBxXwxOrIxvjpl4MV1zk7TR11LXvyOSq7g2GTVttXS/ML4R3dZiruP4i4+4?=
 =?us-ascii?Q?iDAMe4p+BoyU9WXRQJPs9Aewda3Ic5Z5hJQvYPocwZYsHaycrH6iU9W78M6q?=
 =?us-ascii?Q?FEaHSnMxXCS68ouHdFnFjGVe8jL7oa8/0Hrv/UesL1wZuR0cHJBWD20cqDuN?=
 =?us-ascii?Q?yHFi9rEouYFElfoD3oLGDpBJF41tA+r9GjbatBWxz2OydqwkRSdXa9tb2U/Q?=
 =?us-ascii?Q?ucuLhLDCjcehVIG+dwC0Ug9dxlsv5DqXoYPCiP59RKq67cXGyTh8Jz1SHXc6?=
 =?us-ascii?Q?y8FU6b4fdJsSbIspuHo5x+WxE5357xWACYX1RnqzGx+2TG5LUKofdIn/XW4Y?=
 =?us-ascii?Q?uOGSWA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	c6GWVSg9b+UCebznhZaikSBU4KRD7yuc3GiQbXReQd8J3mtUU14cMaTXQ0t+DF6PErI27nxGSKYzErFIzNTjax0/isXyvN7MjyHGkN8AIhq0HoNBk2CMKX8XikajvSIccFZ4eDrPn39zQqr3EqwNgX0FKeJyGDEc2EGnZDnOsb+h2NnCfTb33Jwr38r6zl6lq4RtLD3d5qxw5e7qmCke1tn6vf6Ft6tJrNBPfEwSotTYqCKMXSTJh9wJkR+WPGAvBurl1O5k40+kUJKfRg9EL0DRB0PVImvDeFaOIOiI7cMnSDPWHpGofh9NUq4Ue+jCz6V6yaR2fOS0Q+Ekxl53+dR7IAqPWDbiHts6psuYyDXdW/srLb20vU0A7aw/5VaQfZ3jm+/1O4bG9r2977j/uEvImTK4Gb0rdgmgci5Fmm5rozBxEXXp5xH0MxUiZIWL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:39.4967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9cfce52e-757a-4523-4e4f-08de63765fb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496
Message-ID-Hash: KFQG3EEEBIGMW3ISKZOY3ZDQSF6JYP2M
X-Message-ID-Hash: KFQG3EEEBIGMW3ISKZOY3ZDQSF6JYP2M
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KFQG3EEEBIGMW3ISKZOY3ZDQSF6JYP2M/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-8-ttabi@nvidia.com/>
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
2.52.0

