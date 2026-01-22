Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E5AD6CFA6
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:34:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F376910EB49;
	Thu, 22 Jan 2026 22:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rM36yBdq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 46442404AB;
	Thu, 22 Jan 2026 22:25:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769120758;
 b=d7FsHMDMEJdc011et5YvSWJcGbLQwX4nDGKtly4Xjlmaf1bRZU3/NunozzNBoksb1oxJ2
 Pc7XD0aEd/3paNNoLQedoItmnur8fPC29GD+Y+ODCcgNxvPUf7Dl7R3tqq8sHR1qf6xpJpu
 ixyy+VgnBlvxA4hh4GwHCFD3/m2jA3F+A/+0s0h+/H1QUPCd8VSGVtPCsAJX6nTjwH65sT6
 u6oz0GIKL/ZEdFVXj+f2AP9wvANlK2cQ3w1CwOrFjVwMhPng5sFMWU2IA6mf72U12xjvToN
 xE9ah5yMi2XzLBlhgQj+W+FBO4PysOMTSSSU7Y28d75sM2E5fvmViOzK5d6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769120758; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3o7d1AV2bUgJ1U3EYZbGhhrfWKjUQeLjtczVDRxTsV4=;
 b=x+IeXrTUm2BFDjWVPgbOiC4ilLSwNwKuMelm3O3YPPuR0CoQbGGUdqDjnrM0xaMindd3J
 V7vt7unrBBjxdAZGX0ILikK7aftjDBsp0wz/PdbbQpxBosly/Zie9mZrDvfrCcKK8HlQF1w
 PS9M6fGysRSDfJd2hU/jOsXgLYKuVNDALVL4ida8iDGjHsCfmDiP7dRccwZgDQM4NlX/EDi
 +bVtb4bYFjvmwra3kZliubEPT/2rLCo5X6QLWHA8yvOwXcV5yZqVoB1vhiuVl4sjkWnl5qE
 lSO2sM+SZWzhhhlScM2sF1zKW7lWWBll3yHTFfoZyhO7/SuwOuwgnRF0LnFg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C160F4003B
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:25:56 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB510EB31
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0xE8MGfvUasLvLj9fe3N6bmg/XOqeHnHvNBToRVOPGfa2aw7tprcI/bmGjecu+r5t4mClqPjn9k2PeaeShrO3zjxi1cOgkDEyuz6txZm0Nc2fPROP5+0bi4QY2cFEXMnbCkjTCuTAnepvc8JP1WtI+QmsRIbYaoR2OKqCkSMPgFzokcKFBSXeZSnUFuKSjJGkxzXPyirzwP67/9JYax7dRoYTWDLgWEZilVpncnidDkdEhG4OY1imPICOXa+gtgngocPMPLdjLdZcCtJOLXcUKt0unCUIRwYRAPOAKMraHbBN5hhpkZG3QhyZGXnZbUuMssCLnSrTbELJOJWZrdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o7d1AV2bUgJ1U3EYZbGhhrfWKjUQeLjtczVDRxTsV4=;
 b=GxiuQzlhNcWnyW54UJrfTGYFy4Qa4GUaFdpFYUjVUThtyhCbWkANTXoFgixnUUJgW+zquUxakxwoow2KPkh6fqwaUU+W43Zk+avc+uEecODtD7me7SXW4D24sJDF8kp9SDoJZlHg4/LA/B8IeO1qDbx8o+aWIhw9bp7HHiKBXW8rBQgZgUGFU8bWSCduE+rk3SkLUT1RWI8kzl6r6pgXw4dRxfd44KcRE4W4CAMVSThaPKRZl4zulOsVHnMg8NSiXya5xX8HCMWPvqhxhkcd3sFJidwJD88XXb93dgtJuhEGJZWQigCq1ich692lTTEA7E/6rofLbgUzmEk/peyx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o7d1AV2bUgJ1U3EYZbGhhrfWKjUQeLjtczVDRxTsV4=;
 b=rM36yBdq7nJJ+gheVQyK5emSjIj0DrOogGI1fBLEfYmoI535uFpt6SXrfWyrdN3kqYWAXsp08GP8MbGEThwEhCAuKjC2v6oYAzdSIMwtD4jVxL70NPB1QW0Mnkc9/eHBBzvfjn301Dd5V63ZLdqdOGwYwffL9PLsRmgWAU0Iroh/dR4dNzZ2+hnUXnNyOcpaHIpHKPUqcHtPKoAMK1dicDH0yWZCVWCVTD9+O4kifSkjqtD1j64UdMH022nAXevw2f/9bgBF56g8Z95NbFysnB2O3rS9CaDIheFqBzZSUGr/7ioXdxdXl6YLqzEt5TkC2yzH6xTH8Ctttd24+QkrWQ==
Received: from SJ0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:a03:33e::12)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 22:34:43 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::35) by SJ0PR03CA0037.outlook.office365.com
 (2603:10b6:a03:33e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 22:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:34:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:29:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 06/13] gpu: nova-core: move some functions into the HAL
Date: Thu, 22 Jan 2026 16:28:41 -0600
Message-ID: <20260122222848.2555890-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: ee989062-fb7c-4819-c8b0-08de5a066f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jWe70u2b3sz6R5aK9L4bKr9rNE8xN100xxtodD3+umXK3wzILaWQ5Zai9erh?=
 =?us-ascii?Q?MiXs9c5926gzpCl03u+P3xVdh3Phwy0kRBzyIx9DGVf4ggFqllCWC3e1xm3e?=
 =?us-ascii?Q?4u1ACsn2bOdoJ+v0B+eus2K6Y8bYlAbLuwOoiiVzx5m8SO5sEt8bpLC9Z9uc?=
 =?us-ascii?Q?x2F+Ha04oqeqhGqzbRXlJhSi0ffL2lXwdKZEjn3F29JN/NHOMyIrWKMuxwBq?=
 =?us-ascii?Q?hb+/o0sS04QR/F+iEQnR/fdjSm91QsUtl5Xo14tO+OHxPn16epAPsaC2yw2G?=
 =?us-ascii?Q?VrOVr2jAp9E2+mVHBdv+b1idrktFDw+Vv4i6em5ILygzDjFFsV+e0HLpcicG?=
 =?us-ascii?Q?maXRcrSkKAYfHfTQWez0iOObIyZGx2a4UShTbrHIZeuZISd5U8/ZdC/7Vg+7?=
 =?us-ascii?Q?3sOYGEIH/BU4Sry9HObS1yj/oXVN9lvn5ryvH8MnrewB5Td2h5tR4NHAaOmx?=
 =?us-ascii?Q?FoMO4pnX+rglF2gs8Y9zJPePYv6fpL1FLwIijdWaB7nc8VTtjaOnlN45AQ+d?=
 =?us-ascii?Q?FfOQg1SrRk9HgsIgAfhjCqGc7LZl5+WdEe5l10xgmIUAdT5VCUbfrUJe8pxZ?=
 =?us-ascii?Q?/7A8W882YJaIPtoW48ERx4tJXUYjZgvLWP0PlJU40ZudCDyMFq/588zCQyKJ?=
 =?us-ascii?Q?7YrABUNRcvWV/5qyZbk1ZQCLnTb5YzO0ameuaBfgmdyXYSgDblZQG1te47l3?=
 =?us-ascii?Q?Gwf/MSBVSwxaGzFljCIwBUKwLpPpjetTF1sQuZ0lmgWNc0LLPtkUIaY3vhj4?=
 =?us-ascii?Q?hY82irzHvvUn0Uzr/mbjhBNo+ejiLkxUfwau8CLlAiuK36FO9X+lHSHSj/tk?=
 =?us-ascii?Q?9WdDrtTPynnIIwWPyo2+irBr3tQqJGCMlUAJZBYjpMnKBKPXObZ0kOXL54zZ?=
 =?us-ascii?Q?NVt84hD60qrfsZ4moXe/aKKbsI8uVw27C93QmUvuCq5UiPsowisJHpwYSRo8?=
 =?us-ascii?Q?KSdFWLYRireRAd8ERCJ/9a/OZ0XiQm0auBFWIRG3SCfJQ6EVgbwsCoAIXZ3s?=
 =?us-ascii?Q?YErxEDiNOC2g47a++u/NdTASBEABAnp/gtqGJ7ize22LEdarRdN3o+bEYQDZ?=
 =?us-ascii?Q?wHb5j119HD90/Qx4415JQITxAFZ6Mk7dSiOJtaG0Gsny+Ucq9BfiCYM3jDla?=
 =?us-ascii?Q?wtSL//rsnh4SN3E8qvDcRXQsEANOJKaYSFTdpK9jrvlf06wBnCQ8Z88PZYEU?=
 =?us-ascii?Q?Y9M5ci9PLQ8p0loK/UotDyhi8WFEDIeKQ+pYd/55OfrCRSPqJjOJJ/zfEjWQ?=
 =?us-ascii?Q?wVgXNi2exjWN1LPds9L+opxR/Szrz/Dus2oLt0DibzIW1ciCD12ahAAUPIh+?=
 =?us-ascii?Q?8qTWvFKc8KPtD2B5/4oTKkmgbvzUiN78fa/1y+X8TxTK9lxzBe5EZOZ/Fbmi?=
 =?us-ascii?Q?mp8hVyX068CguYbavy8VAMJO30N8r7ihZRD+PqlzizUeFtxtZmV4Afz8+OCm?=
 =?us-ascii?Q?ieXJb4PuBjdyKHrkSP4oGBDnyOzdC8KVI1Zv9NveVAlUXteb8R1EkjxICDPC?=
 =?us-ascii?Q?VOATiixJosbM1egVPlClTzNLVfjmaHnESq+Grh0rlnQo6pd/ZfHZ1EzjKSMn?=
 =?us-ascii?Q?E9C0asGXUIe2Tm9ljiSGc8N8gzZD0vwHIqzeG3Ot7Xf0qWv/ewTqzB8Hn9c7?=
 =?us-ascii?Q?TR1GpiiIM+yR8aVhDghVIkCrRvL7AFwJ29+sUcUWUeAa9ZEfDPyZoy5KjiIU?=
 =?us-ascii?Q?PkEiSw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:34:41.4786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee989062-fb7c-4819-c8b0-08de5a066f43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
Message-ID-Hash: XN7RAGBIMNSN7U4LQKHDG64G2WLS5B4L
X-Message-ID-Hash: XN7RAGBIMNSN7U4LQKHDG64G2WLS5B4L
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XN7RAGBIMNSN7U4LQKHDG64G2WLS5B4L/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

A few Falcon methods are actually GPU-specific, so move them
into the HAL.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
 drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 41 +++++++++++++++++++++
 3 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 3629422e7a52..344354ed50b8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -16,7 +16,6 @@
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
         Delta, //
     },
 };
@@ -398,48 +397,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
     }
 
-    /// Wait for memory scrubbing to complete.
-    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
-        // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.mem_scrubbing_done(),
-            Delta::ZERO,
-            Delta::from_millis(20),
-        )
-        .map(|_| ())
-    }
-
-    /// Reset the falcon engine.
-    fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-
-        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
-        // RESET_READY so a non-failing timeout is used.
-        let _ = read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.reset_ready(),
-            Delta::ZERO,
-            Delta::from_micros(150),
-        );
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
-        self.reset_wait_mem_scrubbing(bar)?;
-
-        Ok(())
-    }
-
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self, bar: &Bar0) -> Result {
-        self.reset_eng(bar)?;
+        self.hal.reset_eng(bar)?;
         self.hal.select_core(self, bar)?;
-        self.reset_wait_mem_scrubbing(bar)?;
+        self.hal.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
@@ -673,8 +635,7 @@ pub(crate) fn signature_reg_fuse_version(
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
-        cpuctl.active_stat()
+        self.hal.is_riscv_active(bar)
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..c77a1568ea96 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
 
     /// Program the boot ROM registers prior to starting a secure firmware.
     fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+
+    /// Check if the RISC-V core is active.
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    fn is_riscv_active(&self, bar: &Bar0) -> bool;
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 0bdfe45a2d03..61cc3d261196 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,6 +6,7 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -117,4 +118,44 @@ fn signature_reg_fuse_version(
     fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
         program_brom_ga102::<E>(bar, params)
     }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(20),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.reset_ready(),
+            Delta::ZERO,
+            Delta::from_micros(150),
+        );
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        fsleep(Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
 }
-- 
2.52.0

