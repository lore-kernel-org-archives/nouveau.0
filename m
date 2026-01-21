Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B2C44508
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 23:53:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B00A310E8DE;
	Wed, 21 Jan 2026 23:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T96c0Xvp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 248A7402B2;
	Wed, 21 Jan 2026 23:44:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769039093;
 b=iiD5QEukRA07rTZ/Pa4IEnHFEUU3953nQbLPaEmL1tsVuTCMqLw+7n5TyU7oNn/YfWFhY
 LB7Fr/IeNGEdR+bYCkXe0zVCxs4Av5J01yp8j3HqXquqmTzthMczdFDDrmEdmlROnv4AjIZ
 Cu7Ka0fql5oPlM/O4YOcdYHY/Aq/VmvZArRiGmPJNHDjg1L1YpUkXRL3SHVtMDvranzZAuX
 oXRHqCEBpRbPUvr7eIfJHknP1ZsKXT7ExOnK8ewDAAc9rZyXRzq96ODnNWn72BnNCC/S0rF
 fqOs5Gq4pCcIQ31Ty4zNOeIuHIga0off5ORYHi1l5iMETOqhjTAaU8s+x+bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769039093; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=t6ODgQEjMJ5PHkXaXNmGGX1X1xRGc20rfD1wsjTFHpI=;
 b=AUtP/0TDC3QvQQgoMEQAjqOhISce6PldX5/4LHS4JGXa0WuciUzyB8dpG0vhCBorhAK8b
 4Nz8Zbf2JmuX7ik5nVOQvdX5Z1fjwl4NkadneSidDr/5rAnhs54IFnsAKUUuXZ0ba9kqgaZ
 KDCZ0CVKX4FZx6vbL0l3KZkOprLGxh+w7vmgSWGtXzsmZYMoY4BhZ4snN37wgKhBFTaiAoq
 GsX+FIfBV0iB3xqhr6bXFv3+iwNGewHQ+M5vLq58MglIMdJ1/Z/UsYJhU7gjP8lCBIhQIBh
 /PjtI8Rlha+m4g6D21bwQmbQazvNl8R3HzDqgKZCRxJVKE5fuRIUjk7iXf6w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D1DCF40298
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:44:50 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0017A10E8BF
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 23:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOnkGqfz1DA0O8D4UIxGreRheKmi08ufwcIP4Q9CBE/6+dGs5cLqqjE4Anmrh7OnXyzq5Cewo6WltMq5TefXMUfbHGrQe9kIdaw9VzID6ZNA4FwqFetMFeok/FeoEHGlHqxJRTvPnAa0d4+URvTPMZGqUm/8hryuTGsaJYNK1g2TKHTfnuqlYhYlSblsU62mwl/ysbLikrILChNyQsbIsDnILiORqwSI2Wi9zGKPi97gtbososR/0Xg/e8lozmOyzxfelsPC16OcJ3a0y0LEfnKWkBe/uXEqlP4nPyahTuUUwIz14TYAPN97kU6BwkyVzkiPgD0eMkphxh7v+JuWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6ODgQEjMJ5PHkXaXNmGGX1X1xRGc20rfD1wsjTFHpI=;
 b=wwjviXSsS+VSN0lF7a8nrNrgmo3GcHbqPoT7QCK0QDPCXq03henpvDzarN0EgVLZe7QM37E1C6dtSjPmKkPJqHdEKEAj9l0CBYWsW2wllLtKa245DiqUt/Hl2WZ9upj4kFqUVh6hc5OE8p4Gf71zkMlQbUcRe6ON0bmczKjZdew+aHKYG6WiEfk6iIedxRGorphhKexjSS0j7kYDXniRG7ZHQi7XQ5bUnUvCM+yRqFdK5slhJbiAfgDtebSBlbIEm8PEcUke+qeePPr6Lo8sxeYPbA8kxYJjWvHUYxUQ9z4e0LNYzn8gv+CtvLWBI1O4q6QuxolquuAFxZXwG6aYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ODgQEjMJ5PHkXaXNmGGX1X1xRGc20rfD1wsjTFHpI=;
 b=T96c0XvpHpo7rsW/sckd/4Vwg2G4Pc/rYK+pZLyS4VefMeAyjciURpcmrQe9unEVySexOw2q4HZ/Jrsxh0uFa60DheqlSLOmGNe7lF61DWMrgbeTG2ME2wNvdVxTG+WNTluCbKGhIy95WNosQLJz0SJUiqXoNKH+v6+R/eY4HzcFrkGyzSZRnI27Ju4bF6mO3a74l/dgU+9cYY4ACvTG9DFswcySZdPb+BV8X0QDPuWCIqMupxfbf8VfFXr0WB1PYHZGPqjQnpPNajVjqtuvVTGEQKUmAxhmxf1+F/E3dLUPXMzJzQ1SxiICLlyLkpj1M3Uz54gi12OZpl4GkRuTPw==
Received: from SJ0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:2c0::32)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:53:32 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::10) by SJ0PR13CA0027.outlook.office365.com
 (2603:10b6:a03:2c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Wed,
 21 Jan 2026 23:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 23:53:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:15 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:53:14 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v7 04/12] gpu: nova-core: add support for Turing/GA100
 fwsignature
Date: Wed, 21 Jan 2026 17:52:54 -0600
Message-ID: <20260121235302.1962185-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9517df-177e-4198-9728-08de5948487a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tDSGjUbZWv34V8fF8m8vx8iDftIoDcBV+F+XVyWwArhbSL7a/gzHrKsE6FvD?=
 =?us-ascii?Q?fPeLCGU7xkk/q2QDOLD1iqqUcAD8VNTIlBdchZNOpgs2FxzdcBgFmNWGPWYy?=
 =?us-ascii?Q?ytSN4Bm64hWRyaKzduilKhLkyuhqUw51T1xa4Elf1Kn3+BDflk16tLvvuDtt?=
 =?us-ascii?Q?EcvfXzhCcqs8IaLTWXOqi4cuh3aHC0II/bNZWiM0ySxiByBH6Xuv18t3jDLZ?=
 =?us-ascii?Q?U8ZwRLz7xYM7tUtZLVA4mLa8cCduXSo1MHokojoIs+02pTMu7fE4HfBLfiZB?=
 =?us-ascii?Q?nKfFX+LOvG+NxLmxiQ+G/GZ1KRA+vq4Vvx6JFG3P8bybHCzXxJ1m3K72ch8b?=
 =?us-ascii?Q?XYOOVlzsyxMlCZ4Q6PToTTAX7IBkCN1RrERRpTtAzGo+OvRrmnromEvHBkSA?=
 =?us-ascii?Q?RrwCopXzMD2uvMdYrFe8/rf8kHr4xslxTdYB448sKnYw6LLju9JxFQr2ive9?=
 =?us-ascii?Q?wlsOvffcTQR3T56zxGWrqMh7ne35OuCRsNskrMiWzK+gYiimUkA7n+W/VfwQ?=
 =?us-ascii?Q?B9ccTRKJ5NoLim0DZb9SBcQBwni7ga8XO8Z8JhCk8oIKKD3arlqBN5RfayKX?=
 =?us-ascii?Q?AVcQOeBCBzt3Th6rCE7LKZaUnX8lGN4/huO9/JfXece155xo/9rIsQUIpzgx?=
 =?us-ascii?Q?OefPGTQMTiZpu96iKWEiTfOElD4nF4Klz5wnmBRMwJ9eJPEcUBfWpR0DlRXu?=
 =?us-ascii?Q?Bb4KngrC/XcYkp35/ojaQB50PtzHPv6CuYnwniJ5vy3H6OcjEZR3Xn+8Bdkj?=
 =?us-ascii?Q?2QL/WfvGbe4ziIOZLg6O0BWBdCBAaN7iRdJw0BCGqFmR+jJtdxBnQDL3rOQe?=
 =?us-ascii?Q?CcsIaGUu7O1LlVwZrGOA+jKdGH6wqqPvQGklJun3Bh5oRMb7o8PZC/pPoHI+?=
 =?us-ascii?Q?IJNwbKoSJdkptpl/UFgPe8hAysTKruXc0Uh0frnI67/EmyDc1TRY0aVPgJDQ?=
 =?us-ascii?Q?RbczT7DvcK2yf5n2Rspxt/QTvYS+U9T9wKWhWlZWdA2CAsCOUMqfwA2HEeXC?=
 =?us-ascii?Q?fomiyKUZtSiYFM+JMmIUg+ZsvUoTlPSdxe4exSR/6ezumbTM3TqMI+NC0Tlw?=
 =?us-ascii?Q?7ofZwK2/HVX9wOsD6ycwoSmCY8tWyc0Qx66HcHLhVxi6IP4wnNkvTAWlfXi9?=
 =?us-ascii?Q?CQvUZLHzB0jLakp/ReIXAJLGEDOk3/76S6IDj9UVpHjUNmWYoUAkx+z4PlS1?=
 =?us-ascii?Q?MvBfGFRNITznphTUajqyXfmFruiqLqaanCtjGAMFg6fo+lAvu1UQTUqt8SbM?=
 =?us-ascii?Q?xvkTTcPfSwsPfJaOPf6o0l78GGA616C+3YdBuchqAOojlVvLDk8do4Vaj4MZ?=
 =?us-ascii?Q?9CIViLrWK2/MJm7YHoYXRZe+JSo/v5y5FXvcM0fyk7/i8SHYMiXrlRDQTzYm?=
 =?us-ascii?Q?iwmU4WiqAOQlol8WR48apUppOhveMVmPnRi6luQuXWStKwDVYZMx06s2JC06?=
 =?us-ascii?Q?3BijtS1kRm++At9HRiYjyf74BAYWhEGT9pzOcC+9p0pIMU79VvYlt+0rys2Z?=
 =?us-ascii?Q?e/a7bRBcjv3BxUpz/Pp/M0TUVMwtM1PG7ZnjJ1oZSoIC04vM0pQhCvIBHrAm?=
 =?us-ascii?Q?VE8ksbaYgSZsoUI6IMr6r9HL/2JJS265+k6+c6l2/+mvmVKxDud2GS6GiXTN?=
 =?us-ascii?Q?imIn/nOzrHJUQsGar92bx3vhY5Cq0eLARPrBOJqu8BwybzUzqT9eUO+qHvHT?=
 =?us-ascii?Q?3DGiHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:53:32.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f9517df-177e-4198-9728-08de5948487a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
Message-ID-Hash: VWEBKGDAHLAXYYOUF5EHOMCSHGMPFZFE
X-Message-ID-Hash: VWEBKGDAHLAXYYOUF5EHOMCSHGMPFZFE
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VWEBKGDAHLAXYYOUF5EHOMCSHGMPFZFE/>
Archived-At: 
 <https://lore.freedesktop.org/20260121235302.1962185-5-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turing and GA100 share the same GSP-RM firmware binary, but the
signature ELF section is labeled either ".fwsignature_tu10x" or
".fwsignature_tu11x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1025b7f746eb..3f75398954be 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -214,9 +214,13 @@ pub(crate) fn new<'a>(
                 size,
                 signatures: {
                     let sigs_section = match chipset.arch() {
+                        Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 =>
+                            ".fwsignature_tu11x",
+                        Architecture::Turing => ".fwsignature_tu10x",
+                        // GA100 uses the same firmware as Turing
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
-                        _ => return Err(ENOTSUPP),
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
-- 
2.52.0

