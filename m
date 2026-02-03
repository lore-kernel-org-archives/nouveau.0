Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B617EE8B377
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ED0CA10E679;
	Tue,  3 Feb 2026 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HslpBaZc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 857CE41B48;
	Tue,  3 Feb 2026 22:39:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158367;
 b=XppEtDWb8FRm0P/9QA4LfJ+qWDEvoBxp1JuiA1GKkazLZ5a2MJOsRquq/Q+e9ay2sHpwe
 7ervO3l3aUT3U1e6qXIcCfoIcnqtTgi7HNbQ+7OOIBpbHkRFrnr302bzYFcKhqtfqfz9/IN
 kyocE1jTDCVF8tSpKVx0aeR+hUoIECMN3knvpiZySAAqE5zCCr4sMMZMIcYQ7MoL/dFbsyO
 IZzBhrg82leZH0uP7V7k+BYbuaOFzzK9WJF9IFFU5Igi0S0SAi8APlIq1dnLi2p4yY6FLTq
 beJS/Qugaq4HqycB2Nz6nDQ2UYBp5oFjLJP/Y+ZbisEcoq+YRiCi/nYhwQEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158367; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QL/wfpkmEPpSccAQF8mCUxXpa66Eyj2XUxNNOWrJ0XI=;
 b=yPAOJrtEWr0zQyP5bYHO3b0L6XvwtOpi8xu3fsuNnH9R4U4BE4JT6WXKiwFdhPYWzGNiO
 05KmHJVf5nu9Zn9ii84q/xhV0ql66rjj3C1M8Zoub18ftvcrROK1ZN30MAw5KkPFqv7ZfHZ
 kPU7PHhTVdKEJctrqC0exI25my6txM7VtkmrSGk8r30BKthc3nqQ9fcghvxOo+jTHPzyv7r
 tMBPxJ7u/7A9v99zE/FfM5SB9wlhZAfUrOi4LmDWFZ7OcS3KqE4HXuveLwNooW9eiwjhYlZ
 n1lgSgxwase9TWkgGZjr0uy1IQQxk7inCZ1K4xrXxMVxlYz6uwTa79Mqf4vQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 39E2E40B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:24 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71C5310E288
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIexiBMN/kwLmAHiaVGM0RiZIb5gOsWe5ypWe/N9nMLUbQ/SstLqDQqAfxWspIqHoXi0ZxKtxV2bnA8YdEmXoDzmj0BXxZUd7aTymILymDhZBLdnlVoC+5iVQ6CGCs2yxmZNoxKFE1DzaE/43qRypoivk65wR7U2BlY3kG3Rmx6FKipE+35v50p4NwkDotRNOV3VrbGYbU/eDD3G1d3dXyDgl7PWGNrLumqBosya019sdK7dNdcimT0Vz6q8E6b4/8H0q57HrQTHLOjalrKPytJaoJlMUvRD37KKYsy8Ol097rbfh/LzsxfgDLQW7LJbbibDSDbs8hmVrUYZGnFjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL/wfpkmEPpSccAQF8mCUxXpa66Eyj2XUxNNOWrJ0XI=;
 b=Eq2XX+LlNTvp+UwKFwOBJSbn6StZQbWnqjYCY3lLt3oHQhkhs2/3kXz6MoRTNyyXyPcEqSFdKBHGdQNeq13heXrIq/0IjPw1dFCt/ZbJfcTLrp6IAjDvSOL2atX0h0LtShtLzTHPBrTNE2fMf9ZTDcm7A161kwhYU+xo32ANYgK+x3tbxq9s5Ukf1lpxyueTZs7ktm5JAbwUw9YCSbKP3B++fKqMR1ePIStLKC0xjSa7droo9SsBK8hLL6u4y3UW1R6w8Y0Jfh4bhIjhOx+2fHH49XnpoWSjeKe/w1anjOOICgGDUDNpZ3OmHTSE/23Qlh+80Co3CtVyyGOKc+Lwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL/wfpkmEPpSccAQF8mCUxXpa66Eyj2XUxNNOWrJ0XI=;
 b=HslpBaZcxnJg/w24cEHRoaYY8skfVlCOJr+j0xaS36Xq8VsT/eGdh0rtTgDus5BB4VTAVALQ0zoLdocWODYTVfuprdj7Pnq5lp5HQdp2iJtwZB78LdJ7c/tZZSYVVwQ9Shy8BEv8kFcseb41urx5UeXTp+1002sVA7dhC/T6slId2zdSw91Ffou0jeBvJuIgWBEiVeRqMz3XepxqMOyqbNEbABkjpHMzpkATm9Mwot79Hw4oW+/DbyzYdxi7i5JSBkRiV5fcRfPlS/Rt1zOgq9S+Td9qmcmmXSdUZnzDEgs5gn7KA13IekbiEaO53jAit3VW8Cl8Rv9ovTtngEsaug==
Received: from BN9PR03CA0556.namprd03.prod.outlook.com (2603:10b6:408:138::21)
 by DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 3 Feb
 2026 22:48:33 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::1) by BN9PR03CA0556.outlook.office365.com
 (2603:10b6:408:138::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:06 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 0/7] gpu: nova-core: expose the logging buffers via debugfs
Date: Tue, 3 Feb 2026 16:47:50 -0600
Message-ID: <20260203224757.871729-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f638457-17f9-4e4f-1514-08de63765a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p/Js5yq9UKQZa2o/umt+SAbsO5G98AY/F1gT1x462pLwM3Tj/AAfAyZyLdWn?=
 =?us-ascii?Q?PnEXkX0PbXPDlugGOEkzsBrLeMjCIfJk0tiZNBnoEHL0pVwdLwMeGd56rYqL?=
 =?us-ascii?Q?16sORpwa/3ieu/qZ8qUKgQoDCFg++eVPM32XQNKCR4CF7nM0sMOZjNdfRfEG?=
 =?us-ascii?Q?QAlXy0NZE7LEpYfvlW49xxdqTkNjltpW5uRKgtVrPIy8H21LtR2a2tma/P55?=
 =?us-ascii?Q?mim0VqrGG/MTGQqTOSWac8eTtepT2OFhFnwCF8leFPVJrCO8swSr9EY8ciqy?=
 =?us-ascii?Q?6VHM+lPQ+AXygIY2jsEIwbQ241JURTm//OSjbUJBTcgQ1y5b9bEb3DSiO0pl?=
 =?us-ascii?Q?cLfjdH/UegjIm42vE/pbwYpOlztWn3ldy+k/cTZJyYUJG4laSb8JlnyflxN0?=
 =?us-ascii?Q?Rwl4sjtaPhCakyrRAIrgHE75ke5apIrZh5wRnqlKlNSay4MwbOhj+2hKiaI0?=
 =?us-ascii?Q?LFchNlAoT2eGn+iyFOQvNxUtyJjS5dt6hHBm2H/PQRKcxZIh2qM+DbtObhNk?=
 =?us-ascii?Q?JhxymJ9cqC26AOq8J+EDVh1M97z3++rqeCb4qW9pWMiT9ZUUuc92kpYfiWdG?=
 =?us-ascii?Q?ftrNSeln2hcH88YkantftgtaUuZlIOZpauP4doKLGGoRoNCoq+ji+anI99On?=
 =?us-ascii?Q?yXQ3oY/2Rcn978qovcQDaO6wqLe6q7TvP7LsGaPAFKLBoM/pn9ixBeKbbKH3?=
 =?us-ascii?Q?ihDBB9l1vNCt1V/d+B7Bd3zot/kCGFXgxbFuzZKa875kTFw6V473NhgBGWPA?=
 =?us-ascii?Q?bMyLJI4R9OkF1P7kCbmVYCkeI20NHnYG9m+eEPVFmF+LPmiDi4bOQIbclk4A?=
 =?us-ascii?Q?SFnf4p8MglbLry95UDUcwJqIG0V8qqaUH44VUp9rKlsZXwiws9sLUIHkCdYJ?=
 =?us-ascii?Q?beEs3eapRJOJ9TXPsp820XYWYwCdH1vOqjy+N6MHtpjgOgZ4sVLi5cZFiL/3?=
 =?us-ascii?Q?0Yv6aSgiqZS6EbmKZjWdM5slQbJ/25u3XXf+EQ+G0UoR2mm9Vl2BPxTBWeYi?=
 =?us-ascii?Q?Kv274B3quIO0waMb+c0HCcprdxtlOBPKVSv490NbVF3vO7PObkByzacCya/J?=
 =?us-ascii?Q?3Ld6sW9yX7orPDfzUDp/Qnn1+WiuQ3MhISQUTrkFmtnDHLVPzKLB85Au1giF?=
 =?us-ascii?Q?NBTFOllXIM8KH9D3neOYcJyaLpYQKdGY+G7KgKXcayatEiq8a3CIXagmP8v7?=
 =?us-ascii?Q?VVC7kmp3fjvZDQmBppZ9klXAnJjE9IzXJs+vOat0kgsjQGxLxilNiHYQGyUU?=
 =?us-ascii?Q?PUmwBrLXht9LA6DNZzRCEINDHJ5w5o+1V+U/9ohFU+2RLziX1IF053eRHhxa?=
 =?us-ascii?Q?LKGIKd+41jAMwI9WLhH7QUotghfGGTO2TXOietPTynLlvgB5JR9lODa6rTBk?=
 =?us-ascii?Q?fMdkLDyNze+cl6IZbduLUXnDCdh+DYN+dJPZEu1qYvs77bW0rNLOZOIdgTiV?=
 =?us-ascii?Q?QZynoYQ7PD9sV13wJc/Yv1thalTsPNV4FRH7qPwkNPj1LqaubYp9lFAwZYxQ?=
 =?us-ascii?Q?vJvWin+5WZlYodI0ahd+EwNWp5TVP83+F3vX5CUrzgtMqBloGr9+APOoKTrs?=
 =?us-ascii?Q?YZC8a4yTCpONiRqH7O3QscczmJG6Um++OesE7Cod01V5TbxxFXFeIYiXwR0E?=
 =?us-ascii?Q?1yT1kKvrwxdgHtCqTAB4OBo75j5qcfiDRy0fIrq7UCDO8VchYJTZ1UU7GLcm?=
 =?us-ascii?Q?0RiTyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	E+WUwXwr5r9gSg5P9x/PstZ26DB14dWIKYfuYN7kcrBUQEdLsOc2BSp4p70vC90up/11McMhNFAaTOmiuhWNBvWLaaS12XocyK/tEzVWHBl3VfNXK+qf06pC6nmz33wn7J7tiDXW/FL9RyLLWeiyPJybu7HRuS1yjr7UK3i4GQK4cVTY8iN5ZMQMFlTyOmv9gdmdayHqtldcJvuAh+nCuBZEZkaG3p5nFBQO+UABuVS2W6c07v4mjbZyXUl9BKAd7dbJrxtT4Y+5rV1uGgp3pWe46H+KGunDr/3OzpYiR7NtjSoWXZ10Mt6HJbbA6BthHaYqd20OjCVjhbCUAvZNeGn0oEWe5hurmWpLbwSVkD4vhyYlBVRGeKDsU+xoC0gi8wfOaJ//OmG+Hx+bTFPRMQ15gpVOPJ1RGINJfzmIDWYWc2TuKVPZILROPbnxYL4d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:30.7106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f638457-17f9-4e4f-1514-08de63765a82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591
Message-ID-Hash: MGGGUWWV6WPQ7M5SVLVQUSL3LD4IA3WY
X-Message-ID-Hash: MGGGUWWV6WPQ7M5SVLVQUSL3LD4IA3WY
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MGGGUWWV6WPQ7M5SVLVQUSL3LD4IA3WY/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

These entries are gated on a CONFIG_NOVA_CORE_DEBUGFS Kconfig option.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v6:
1. Removed NOVA_CORE_DEBUGFS Kconfig
2. Expanded some SAFETY and PANIC comments
3. Added write_dma() and write_raw()
4. Renamed BinaryWriter patch
5. Moved misplaced diff in BinaryWriter patch
6. Miscellaneous minor changes.

Timur Tabi (7):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  rust: dma: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs  | 14 +++---
 drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++++-
 rust/helpers/device.c              |  5 ++
 rust/kernel/device.rs              | 10 ++++
 rust/kernel/dma.rs                 | 36 ++++++++++++++-
 rust/kernel/uaccess.rs             | 74 +++++++++++++++++++++++++-----
 7 files changed, 210 insertions(+), 28 deletions(-)


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
-- 
2.52.0

