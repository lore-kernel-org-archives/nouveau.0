Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEF9D6CFAA
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 23:01:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3545710EB8A;
	Thu, 22 Jan 2026 23:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dTviNuWX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 75441404B5;
	Thu, 22 Jan 2026 22:52:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769122334;
 b=NFKGgiWj/Z2ujRCvoRP5vfpxg1G3ATJ3gZtEkDoebyFFAs2x6ly8yscT7v0Te90WzokMA
 V4gP+FvEOyDM8ISxcbvI3xnLJUyPjuBrY4Nm3g8V2whMxseWKuSJPSkg5Ng8lGlyRkrwiGA
 rI1he2xiEyXtWPOnBvzJAzepaU9DrNLuYze2PVGsjUQhNm3I3t1mN7HPu4r5q5EKowDLGUh
 mVwIb9zsfO0lhEDZfrMXy2laqa1x1rvkXyXT8Mi9SUzykIvoqK9n2u8uKZwJByHkvLBaWGG
 YJ38Lomp6YMwRJxoYrVhyplinME7J2KQYcXnhk8Bf95sEmfoxh4B93m4kCXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769122334; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Hem6a6ex0EyiPUaX3uBYC3F76vMgE7LMynbRG+xklt8=;
 b=vuY2OuvoHmL+jvCv9uJMT2f7d8vshF+Oh+fy+OQdBvaY3nOv6plxAS+wZp7DzSC2rRn4K
 JJOcL7tScAx7L9AaYJB8O3Wbd4ZUWnYm0CGPcuIReLeHvqDatOMsBf7JSUKsKvMsCmfwSPi
 szw6J0fUrX+2E+20uzSOIci5dRenFtyy9ZlIl2fKXVvLhFCgSZmiSgWwWRlyRZe+n0MZczP
 /xZ0UvfVFve+oRnKX50NJFiR6tqBporF4gRAYbmZZMpWAzqEjFBhyBWfhU0RDSf98uKSiwC
 sotljjoyzIZUXoLgITyvGcJCod1avcrs43exOjMOZKfat5xTbh62li9fEpkw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 42C20403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:52:11 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B584810EB85
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 23:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJRUn5FLjdR7y+SPl5oFMRrpdSzprsQLhkSbBmLkSEljkWIGn0lpEE8KpDtPAfrEPspavbtrwn03TSHRXHDHkg67KFPE4xIGdCY9WYNLosCLhl3uj07vklFkk9CP674+itZclo7aPHZalDXDcVjDGcBQNISaBz1ZC8kMCEOPsWu0KjcBchrHaRpGQkC5YGruJSTfp7nwhW0QiM/xLDhIBsYH8QytMjF8sopS44xVP9weqOkk+9BnkxwjlsM2rFqUaSglxLSaag+majq8FQ2NRt9CtBPV5Jns904ljIC+tI4MHXMSiMg4KyQ6B+bWTzT8hsEGchtBchfmQg6/5bZsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hem6a6ex0EyiPUaX3uBYC3F76vMgE7LMynbRG+xklt8=;
 b=Z/e3461Hl0+37kzKvvFpuDlKbQj4fIH7I8b/qYsopKUHB/uk9LN7ZzIR2LzfG3t67WAbYJ+erAt+UBeMpVKmmob8wvHZrRk/XwOX2h5RgVv9nU2vMlpTKk6CozzUv/N99xp5pElSh/hqIqQE8x2Nq4daPAi3pMnBpvWm+l+FcZOp9k2FWJ0lxa2yrvCNqK0MR6t8VpyatwoKpXz2BU+pVpHeYrnOAxcx5DHhbNm/n1U3LqIw6G/bRPPOG8EgCCcb/klV44jGWfWMSa0Oe/dlzbb/yt8ASs4f4nLvUNLo/KYNEjgD67YczdXT+90Mr5vrMvWEe0R3vu/le4/BzX9gQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hem6a6ex0EyiPUaX3uBYC3F76vMgE7LMynbRG+xklt8=;
 b=dTviNuWXu4WtlO3+b6IGrMD3vFRtPkOmoslbqI7sF6kmGJhZaMvONwGPnCNoeOw8q0v+sJN10ibamCaB9G0GT4+UpiTbr/EM5xH3iPVYKc/KwvyR0ehF6XbWOjUFq4c43bWTsdC2k2GW3OUV6TgtoMYiBn7VGfLg3e5An2xRpobs0T1dXmSOCAamg7ClxjWD9rCdl5s9Hbxincjz4JPu2P3Nl+sn2lQlDfPUCLsMo7E4k2ndRF5zwRw5W9JEJZA0P4xfamKAO0fGmnkRca46L6cVs+UX3+Y6uLeoR1f4U3wQuY2nE1tMNdWK5rfKbt4Qs3usO87gqAhbJrBwSOiiyg==
Received: from SN7PR04CA0223.namprd04.prod.outlook.com (2603:10b6:806:127::18)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 23:00:57 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::dd) by SN7PR04CA0223.outlook.office365.com
 (2603:10b6:806:127::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 23:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 23:00:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:08 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 05/13] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Thu, 22 Jan 2026 16:28:40 -0600
Message-ID: <20260122222848.2555890-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9412dc-b493-4784-a227-08de5a0a194d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V94Pdhen2OKYEPzaqrG1VcuYf0JeiRwSg6EzrKpKXF0dZW04efxnwGX8paGS?=
 =?us-ascii?Q?5+SDTDtazqQKErAh78f7yHpRkVKsoYRx+jkTEpmdFtZboC4UJzrYyoU1q7cf?=
 =?us-ascii?Q?8qLEznJ+ZYmnLWxt1MIwOzFfljGqTsf4CqzjIMPJ+FvlxOz29F77qB7bN7Pf?=
 =?us-ascii?Q?hc2hc7M9Kky3BLfpN2FJbtysY4PVhKaVosGRWXTYPNEXDdfT2pKZoTzm1J7S?=
 =?us-ascii?Q?5xdRdGojC5s2rzlIrRKiD5FXU/lA396e0lNNUJJNfi4HTBzLbXLvzijuLpBh?=
 =?us-ascii?Q?i1N9pMdUHF1dVSd04bqOsJW6qHKWq8gqplRtdK4Tq49wwtWgCxRre25DpAha?=
 =?us-ascii?Q?JbgnRdEbnT9nMVH+X42voNSVSYEzmeFp1lJT3viRU8SdNnv6fxpo9Er+pocT?=
 =?us-ascii?Q?WZvtMoHbWfqIIz3r9PntVZaoW9XL4dRPbPn03K8JMzUlzd6ZCVaPjR8/WP71?=
 =?us-ascii?Q?s/w0nZk1NzqSc5FpSEKnnniW0n+1DDd3MZSvoWU1eaFbYQTVNuJHTpwDiyB/?=
 =?us-ascii?Q?OsOrrcHHSHzZQrYWEuTqes9TY14NEAZ8dTUXROI+cJRsRukjEXziodf9ORNC?=
 =?us-ascii?Q?iqdWVPfWd9Ha6FDKDXsGL2XqVGbUEBNsX0bL3Ukly78avwEa5JT7oJYeQQEk?=
 =?us-ascii?Q?BVOvpnz8yaFY+2d980w8qDY4t+e6mxVYG9QgXZE79z1KYouxKrS00bcdEWEV?=
 =?us-ascii?Q?M00nMbvzmwt+Bh5CZVLTieVICLdttL8iHVfeUjaXA4M3MehTy+OrzwgFeL1i?=
 =?us-ascii?Q?mL3NuQnj/KCmd5wUiNHEoqwWno7z++TCxVZ0dEKI6/pCVH7BEBA9Ck/RKbmy?=
 =?us-ascii?Q?HL+1z5qYwqKLejV9Eeh+EOFioThXCGQLMHgr/FcWzz10+HJYTMQxjCUb+b5n?=
 =?us-ascii?Q?Pi1+zIN80/+Hl0NnUW1UfhXMcGs8lztbFBj9inJzj10b2rxoKap1OSmyzTMi?=
 =?us-ascii?Q?bCGP/yJ6buuN+m712pq8wfXQ1cp7bZ18VJd8TnecdoLlPwfVqMJzfFOTe0D+?=
 =?us-ascii?Q?jXBcy1ILJIF/fLX9VmCNVpeDqoHzOef+/NyjxTxu/x/vd/LtHnysX1hB9xen?=
 =?us-ascii?Q?J58p1BcfdMiMRlaToMywRidbuap6o81LzpG6Xiv4wV906wMvZ45SxdnyL0kT?=
 =?us-ascii?Q?g1j4zmzrtE9YIqsRjEU6hP87mzs0bu+7w5lzoU7MjhPYXDejQolyPgTyfTZN?=
 =?us-ascii?Q?PjA7r8Ugn67HjUM1UqJ2rE9+LbYC9DIXYgj9DPg7A+A5V7Q6+mBAxyx9Y01+?=
 =?us-ascii?Q?2Wq5dXwUDxve2RfC7/VbEBrpKy/Vco2snKxAJKQejd+yTaynONQx9Do5x5nA?=
 =?us-ascii?Q?6QmF/JrZOz9LBJM7uCmGHjE4nS9NZAN/Hfqy7PmPc4Qd2BSCoEr2ujLN5Oi4?=
 =?us-ascii?Q?aae50AhyI4aaXGRnFACc/rzCNbb8ahe8/Ad4T+18jxE5r6gkfRQmlXvf8vSR?=
 =?us-ascii?Q?ndbYlm2MYUb17UkpRWpfmwjBgUT7G9wQMnBY+wXekGoWlvryqKDv+eWY4eod?=
 =?us-ascii?Q?TN8jtekkygCqfWr1VNjuOdf/tc1HmTOdzPxFfwoIYHFjKWmkzW01nQkIaK/N?=
 =?us-ascii?Q?ZsgrNVRXelpzg2vC5MKkVPgxKzcgTpyc99easplS7X44IgjQlMaB4EoH6wrJ?=
 =?us-ascii?Q?87XlBOzHc5p/qHbl9PUfdpBWyINHXFrpfzzxkR0ncijq2hAqz6c3CmJFzNbk?=
 =?us-ascii?Q?9OwvJA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 23:00:55.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee9412dc-b493-4784-a227-08de5a0a194d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699
Message-ID-Hash: IXKPOV6ON3WPUSZA3TI55JVYCKKL6RL4
X-Message-ID-Hash: IXKPOV6ON3WPUSZA3TI55JVYCKKL6RL4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IXKPOV6ON3WPUSZA3TI55JVYCKKL6RL4/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-6-ttabi@nvidia.com/>
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
index 0d1a0f86d83c..3629422e7a52 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -458,7 +458,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -526,8 +525,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -567,14 +565,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
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

