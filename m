Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28461D2ED10
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 23:53:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5510E8CD;
	Wed, 21 Jan 2026 23:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dCgNKlBy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D0DEB402B2;
	Wed, 21 Jan 2026 23:44:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769039092;
 b=x0c9/x2LtZ7fgV1wfnTGXaTAT4V/ALMjDzwajVriTwox5W2LCEWOcY+wjAmXPHCCsyjbY
 OAbR5r+pDMdXXBcfquf0W4MdpaMKx/vPMUWcU3LFoYH+4i1Yz1JkY31uOFIZ1dBkpfQDlI8
 yFc0nPQsFpCN/wThcd09b9E2gAjd1RUEFeR8mI0JHQYP3vcjgg9gIGEiaJruBtdYuT+OYyV
 YxK+lykhx2VWUaijm7PAopNAC+bgvPuXQkLNrPMTjm4NYdPV9D18QVuZXUXoVH3RirkFI3F
 gttbnf2MJlZDESuEJD0sXl4t8RKHcpu9uTIsNQArU7oVbwKewq4ra2rlYtig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769039092; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=te2ycdWspzyqE5fCCNZH+9bf8gJl+fBP888s7Ao8cwPf9lN0TbbvnjSI/Bksim5RLAeqm
 2gfqwh9vsNoTo/7Gm+za3yiT8mQpbF6glpc1b3i/8krfHQEbBivI8PPriSkIKTEYsPCZi1Z
 ClK8YEWQyyDKn4c+umWkLw8k8axC3ylUTpKzZDZYbVqzajta7r0oE2di1C6Yr4ElDEXQpNV
 lOwzFIWZ2tP55UH44+Fct/poMxw9G0L8RWPIjZWYelIc4aQqrEQYSstdR4uHOyRMl6nudIg
 tEc1al8k+9DJcLcL+0WvWx8nWLuoX670IuxgZfKJATTiOvoy25yxfX5a0DiA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C1C2401AD
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:44:48 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBCB10E8A5
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaogAUZacJsuEtEu6OIvlz8cdaE35WtDqc9vXkxuxNvHTezYzc9hWf+ATEGsAPIACGyYNNlf0NtbxyBItRwj9Be5qC6k1aLtfSKcvRwVZ8bY9sfs2Mpt7tDiJqpGNbOuOTg7fSJt5aRBb/TRVoGYLX8S8JAjRXxrvAKya1NFzZJdHw8sNQxxu0IdMILbl/COltqH2JKkaoXeA5ihl1SyqZSOsH9cFjECMoV6GkwgsnBERzxeiZuBDCwaSk/H4wI31QDa24g7/rU2mYdlPOZZpGgVO4bXY2VZ/TROauvigjFX/g2QdplrzuLK6+xLf/7dn+rfEZOh8QAwOsCARYWKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=Z44VKJKYD98K6te2huzxfWb6981MeGKghBjZP7myqx0wD9+l1NDTLoZJ0ad3eLol25guvgaWjtLYXKF3QddP6xs4+aF1B8h7J4x4FbcWH2WpAXw3Zl00+TAyAyI63j65JdXgS2wnZalzGHdgKgikSQm94APFkrBD8zZItWlvZIc7KeGsnVzogOADHk4EfgR0GgkDRyWmj5kLmhdGgRqYnI0ZBkfUefRSk2ultJH547KMgEnWC0CCgMpFqkYXb4UNwqSgpL0wZpFQ49YwY2kF5ub28RpbhJcIHaKjC2OVL2CIlfN1VJ/mr5DWQ7UPkWWz3UdiRisVjwZgkrv/1djUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL6oemKjE6MJ/aorDMg77+dd7cuvFAuQcYBjS2cpCiI=;
 b=dCgNKlBy3Ai5uBTisJwsNXJrxC+g68nyxmY8x+ZQOrhk9LNw3tCovnbt/AVnlp/bx7t1vGQMld7vJoDdTSNzSPUT7yxhRGcwdwqIZeXQq8a23xZoJLsPNyW2Muc1m+LTV3Z5hCAhLl9wP+H+YZaqhCGotVBdehYTYidQ7tOfAYFWmdhaKmUMR3/ixXniBpLOOvdnA/Zs3A3C04odw4nxmYY46dColYqZDCIE+RiUI3oBX8FwvpCzNeqlIMzsrG3jWsybWP+I9mmzXx4u5n3EVtzlgznfn1sBCLhO0uuIWY+SyQugYSUbCsSEhAWN5dRdSfcdaqmlZXXzib/e1BLQvw==
Received: from CH2PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:4e::24)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:31 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::53) by CH2PR02CA0014.outlook.office365.com
 (2603:10b6:610:4e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 23:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:17 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:15 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 05/12] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Wed, 21 Jan 2026 17:52:55 -0600
Message-ID: <20260121235302.1962185-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a069b8-bbfc-426e-2df8-08de594847d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6XfCKDIt4RRDIQbhrVHWPm2pXvaTbX2hiVk616lLm5Krf6m6d20/FcHidDwK?=
 =?us-ascii?Q?iD/fettH+YMAljp5CtfRuenVWsWTWduVdERHYc/3rqEwtia7pFkPQCGk2H+P?=
 =?us-ascii?Q?7wiTrKeElKamMDT6LdhKKCxLpss9Z1+jTQCXY/HSZJGRtm7aYxp4zBa1jUwN?=
 =?us-ascii?Q?Tc/x5wPdXGNaCIfqbBAbJiiweZGtgYw/1/4Z+plUE9EsuEDZ+cTmrKsHhGk+?=
 =?us-ascii?Q?SFhEYkTs2MuDughdX7aBC+EXLx5X1CPMS6erGCtD0RN4RAPwX9bq+xhhsudt?=
 =?us-ascii?Q?LY7n/Dagc/u6sxGIcEoCq21kKIo2WC+tLoLowNZ8L0ftLYjCzoCFftC+GYo0?=
 =?us-ascii?Q?t8S80KSfCEZg+fgRkgL6oHlmZ6gXCFnxkJowQqlNJZD1K9mJSKm13h4PPr18?=
 =?us-ascii?Q?O7EJuuvhv3BEcFCT8SY/Yow38LjgdYoywcZXZq9s2jovDNCas33PCx778vnS?=
 =?us-ascii?Q?ls/CEdY/Dn1Vhh95EGTJFS4c1wXY+n0Xjq0c0E7eL/ogxCr8s4leDQOROchH?=
 =?us-ascii?Q?psu+hBvrLPm7kHykNT2TIO33p+sVP2YuPWt7RaYjlJkUGvQog0S15OOV5epE?=
 =?us-ascii?Q?nqn2OS9I1jN0Xme7A6OZ07iUGTMB1AMduAMzxNWtmvKCzsjdMBA2NtrJYTT0?=
 =?us-ascii?Q?UmSCUaZvg0RpU2tLpS7urpCN6j9r+IrZS98hIexeDmqs/LTFmL31sTnI5yyD?=
 =?us-ascii?Q?u/vpnO2DORxWENy4eQNud2G5pir4Os+a3lygjKYGCiD1kVlPM2fhAgzTk545?=
 =?us-ascii?Q?aMcplR5itGzB06lB7DYzZdsUN/kDSuTjyVSPYra3OjoTWPAiTtDijQlyfhjp?=
 =?us-ascii?Q?dmnnAtCGyPuQVZk2kIdg9D5hmvtxIr3kukfQLrJjwiu3qPmgPvUIoTfJQKba?=
 =?us-ascii?Q?rYFYghemXSQcshf+1obXUkRlUnKiEWpt9twlLds4taOVxw124KrYyDVDwWVG?=
 =?us-ascii?Q?Fy3KMFggeutYxnIl3E1yR8cI04pjoOkMiE5tgD2JxYSz6cp4icg9KW7/05rv?=
 =?us-ascii?Q?f8/MVH0dNt7kUifLbB2TgJ0V0hqyDawu/9TdfW1VhPbfUte/S5+GW3A7nthX?=
 =?us-ascii?Q?eUJU5Vx0hoDDvJ9NVFbOJmoyR6lE2QVzh4SZJCzfqzhfX6IjngxGAaWqWWwn?=
 =?us-ascii?Q?EK2L8elpAX57DMqf6ST6/0hlqmfQlanEOIKPmhoqEbdmrQdKJQE8badikXOQ?=
 =?us-ascii?Q?qNFInIZkuK9LTdigAHTRB0s3ZnSW2yMCP1QHtsHGf4Pg+so0jEMv9jRZJg+N?=
 =?us-ascii?Q?gMjPpxeIl6G53cnEtAZFtd9YP1PL/zQogKcxtNnDsAmm8HtG1pedsi/bsV2p?=
 =?us-ascii?Q?Rhw/ndqLCle/LQj6SqkAonCxrrf1uhdkRKhia7vNakjBr+htsyU4UaoDv9De?=
 =?us-ascii?Q?v9ZGLYwXJz5Rrz2w4UhlM2NvLuOfYoZNeXlKGD6hBLtZZcEdMYAS086Yr8tn?=
 =?us-ascii?Q?62JJ0oue0rVtM2K4pzlQjQW5MfidYWwObPEhjTc2lLehWUBI4XLr+caEaELH?=
 =?us-ascii?Q?bIDbQY0rd3erVAKufT0cVsuGhLuQsasPBQCDnX/I54RmNh+xYLooW9kxkOd2?=
 =?us-ascii?Q?OLTiCURZRMYzHpMU3+UvThOQvi8pDv93qVFHoCAMTJTQ9D/StcrtGSkXVnsC?=
 =?us-ascii?Q?7UzMCHck2B2wYNw6AT+7r3Ho4LcFaPCvc7aa1p8WV1htG+7ANz0BGVIdrU2G?=
 =?us-ascii?Q?AOfVjQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:30.9520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7a069b8-bbfc-426e-2df8-08de594847d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
Message-ID-Hash: 2KQJJNMM6EU27EAC3HXM2YY5MHMDZSAP
X-Message-ID-Hash: 2KQJJNMM6EU27EAC3HXM2YY5MHMDZSAP
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2KQJJNMM6EU27EAC3HXM2YY5MHMDZSAP/>
Archived-At: 
 <https://lore.freedesktop.org/20260121235302.1962185-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 14 +++-----------
 drivers/gpu/nova-core/regs.rs   |  9 +++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 60713fecffc9..2a8fb7059a44 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -457,7 +457,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -525,8 +524,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -566,14 +564,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(
-            bar,
-            fw,
-            FalconMem::ImemSecure,
-            fw.imem_sec_load_params(),
-            true,
-        )?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..b8ddfe2e5ae7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -16,6 +16,7 @@
         FalconCoreRevSubversion,
         FalconFbifMemType,
         FalconFbifTarget,
+        FalconMem,
         FalconModSelAlgo,
         FalconSecurityModel,
         PFalcon2Base,
@@ -325,6 +326,14 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the `imem` and `sec` fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self.set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.52.0

