Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D2D46C1A
	for <nouveau@archiver.kernel.org>; Thu, 29 Jan 2026 02:29:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14C1A10E7B4;
	Thu, 29 Jan 2026 02:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UkRPfPCu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAD9C40F1F;
	Thu, 29 Jan 2026 02:20:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769653211;
 b=o4c0fT5E+0a0J81HO2o0DFBzfBi1yquWHpi9GFe5JtIyNqEzsCZWmbOX/q+1cz15Y97Wl
 iXGnDiyZRaQgEVq6IKSrRBOzP4VhpUmpYU68YTG5RGUYq577jf5opZFnM6go3YeDiIMeTrA
 tqWszq+6WvlHPuZuF098++weG1uDUcIqR8W1+eg74/KTe+HpsMknCI2p5HOXJSIVY5ARqXn
 T0zpDuh7DYSE7AjY4AiWMNMUwVoaMU6Y7EwthXJgm7Fjwyj14BI5f3pS8XIXYMlxp2pKih+
 OB8H/VTo3fJNDfDkFYBJBa8j1W5UmExUJ154o7pPYVRK59rbEZS+k+NDln6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769653211; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5MDDtNqzmg9dcEX1NHO19b0RUvW+O9z1kEmQx1/moIs=;
 b=J7QiqB3+PL5cO7SArFHGAyhG868uLRmRyFfByeCmMOmTisUEBsf9Jx/XMfFSI+6MIDqE3
 UIv6MHVoMdfNSge2j0Ad+XGUGdvKucoFp6302MVssaNq2EaijvBNyv55LcUJmZspfPwWKCr
 QYv9FTP7x5QcEsLSLuDY6n/Z9ZA5WW0lFxId/EYmb61GriVCxn0LpXr8CWbf03JrjSFN/qW
 DoTc6aa4rvve68oyqA2pnw2aUftOoNRYn9c7yXSvsjIXY3xVdskYv6hRbeL0VOhwQ0hHUr+
 cvXsNeE9Thjm53MOw78a+n/sMzUvNQ5WnyObA9BJdfEB3tJbJlWL/zKTsNUg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B6FBB40ADD
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 02:20:07 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7B2C10E313
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 02:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1Y5me8v9ICR2EJeOfIpOW12jJ1yj6gNXdjV8AarM59+FVqd2YZsztQlLzFwvrP0bvrVI0/ZHTjR8fn0Il53eNqbUSEBZAEI5s996JU9M/1Sf65HXYr9C53xZTJGAiFBAwDNTo6dk8d0PX2j5bJ2suXrGf9nKuSGH+1U2ww63qEB2HWiyhl/zk18r4AEdVsGtqOkxhQ8ldHiVQ+NKf6sfVLTzdxi/YVcrnLvO+bB4md1VETBD1aF0rrlgiR5oKspKShtDjn037ONLHNajLNI0fTWz2iBdHSQGwzaUykVyYUKiRunNJmUvuUuzpeRZMMQpV1Oqb7f6yfE702X6xUW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MDDtNqzmg9dcEX1NHO19b0RUvW+O9z1kEmQx1/moIs=;
 b=grgn8T7xQWsk4mZzOdjhzeT1BAqM2oRGIvqMlOqCm9X3sFGGtiA4PjteA+IxOL4evWfo5sl8CJGhzSH55BjTFUxhQ775+fP3ejnSZLUIWvzzUxDypumRP6Ny5oM3jajqpxZp3FphT40oQ4PRf6JvFRQZ3D88HKu1yVPxHY7+pFhpIpDk/z2wUYK16kmhTmVwCmnmGHhur31bVUTnq7hlbNuOVVKEz41BVNW13xIlKmg6FkNEw1vl+U7OzwCmFnt3mv3h9ExK7TjBvcaK0m9l//bXfNdLG+/yUree7OTwoB30iY1ei+q7Wy/uxkUjjuTKV6XsflV+u0M5LK+D6OsE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MDDtNqzmg9dcEX1NHO19b0RUvW+O9z1kEmQx1/moIs=;
 b=UkRPfPCuK3zXL11ozn2pjjtmCD7GUzRYG2SIWjWXIdol9cHN8meoUUKwsIGIQPXJpq5h2aXp/GlvQ8ldMfXYstK3ZE4uKq/UjakoVeOlHJDj8FoQlEtZ0NKTfhGBC4794FL3bvJSE/DKF3Raytk7XTU4NK/6NYVclyVSHURlkDIKoH4U7oC/k1TYdDT94HHPRtJBnjSPRkUr3zLZv2YmH4/A3yHUvKBZg8TMX2mpLBRXhFbv+5ktHr6DppiNOdHTIMz9R8Kx1OVefQ5gQNFT1uenK4FHSYF1ZbU4Pst3rtIWZ9MPIKPYGPT7+SePkPw8Lq2rkN2ROY1ct5arkXHaXQ==
Received: from SJ0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:a03:33e::23)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:29:03 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::99) by SJ0PR03CA0048.outlook.office365.com
 (2603:10b6:a03:33e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 02:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:46 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:45 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 0/7] gpu: nova-core: expose the logging buffers via debugfs
Date: Wed, 28 Jan 2026 20:28:30 -0600
Message-ID: <20260129022837.4133832-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 2994a787-4fc9-43d1-1074-08de5ede2acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rRRgWu+IW9+JccRzlCUMC5ISMnyJakvAO7DEGNZ1OBASNqsbaSSRzq1ntNSm?=
 =?us-ascii?Q?1xG6vceFFo/yqKalN/u31M2FTBS0ATJ+C2h71pOF/uvmop6sKesdslQWilln?=
 =?us-ascii?Q?aWWbNFGklcpmKB2HOPdiVMpNy4jhicTNwsBzFKT9tBx1841dgJPJWR984R4I?=
 =?us-ascii?Q?ihv9M3c0cD4NUvNEa8MRoDXFwGqRSmtdWmsSnK4CcweZiqvbIw1SNtwB+0gf?=
 =?us-ascii?Q?xEEmEfKEiSzbK3QQr5D7Mo3LMKI85ugmCa0xKSE/X1rit3FHMEpByi5BvQTb?=
 =?us-ascii?Q?fapO/5Q/q5oFnvGuxnKAuuUjlgROCCkFZvXid+Y+uM3SyE996nb21DmQ8WaT?=
 =?us-ascii?Q?1mI2s/w6lhUzsTKSdInNytIxIruGshDvtJnCMYPgLMWbkTP/3nzGqsuKDlFR?=
 =?us-ascii?Q?u9r/7cMdDRGU+2BAzuEawlfO00DuoC0gjZNWl2Hr/PUZ8eKlReDsfVeme3wn?=
 =?us-ascii?Q?8iScriKdCUJaTqo4ON3dUVu+Ahv9rzIN0xIPj8oH/HWQQDTGWFI5KhPRhzuU?=
 =?us-ascii?Q?wrw5jhxGf1dRq2JnlsuSi+OKKm2FjAsL0nqGPK2hg/1G+kLmpw62HKyb5LEn?=
 =?us-ascii?Q?BkhXpBPYg5hgms5tIvoApSkRLnZAfNOOdFwRjOs8V/fKCF5BOb8S2aTB0ChM?=
 =?us-ascii?Q?q2pbrEGIKZGPDlaqV0rmvTvvnQsM4sY/Psq6kpYdrby1okrEa2Rs0bJBV0Ov?=
 =?us-ascii?Q?ybla6jlG99gkGYDN5ihFWw9UTmmmCOrgjlj4FqxL9w6NeQbTzNf5PHCFCrjI?=
 =?us-ascii?Q?pkpxqCg+E5stRK3+GXZvaarpu22nxVSnwrGybH5a7kLkrlGyNS2pFC4a/JkI?=
 =?us-ascii?Q?kWUiBcU4jO6ivP5Tr45qfLJrp1qic4VHy/n1V+NN/MxhbCJ3/jtl5RnCVQ59?=
 =?us-ascii?Q?1YivOLFln1rMRnlPx4Sz4uaHNB2FhZXFkgHbjdxPg7u/fpt7mckFjojfaeTf?=
 =?us-ascii?Q?9vv62FKgA80ZMNBA0aTeJo2P/Vm11BbM+k2E71MXWRHjFoxZnH0yCsSYfjK6?=
 =?us-ascii?Q?6wvLRKrYt1LBgy+EiPmsaCZEhfLeCXsGsepw5u27zEi5edin3+3DSjyfVN0e?=
 =?us-ascii?Q?I5dauKwng6tj0jrExEkirgaUxAD9BImLVs3vo/aeZwz2uz9E6/i2OKfvPmpi?=
 =?us-ascii?Q?6Dcu0el/tc6Imwyom/9WWL33dNpqog8oMUZcb5S8jp9W7980fBNjSthYn4Lc?=
 =?us-ascii?Q?fHREZlAwnpGkF59BAVwebeHKe6TLjB/YM2DVBA5T94E8f4jNO2cRdfIGNcAL?=
 =?us-ascii?Q?ZPHMqe9ufsCp8Cl6vdO25pqL/noDF4X/X+oTeZ+qG9QXppdg9YiIwJxwXfVq?=
 =?us-ascii?Q?WHnSoQapwEzPzAH6tI8xGgkGdksJNcHB+310z3VEX09sVYSzc5GSofBaguuL?=
 =?us-ascii?Q?wC494mX6yXHRdwj0G2MHyFFeRIArQV3/No4k4MB53F9cdCqnmmbD1pyvUDfd?=
 =?us-ascii?Q?NUFK8NzXliwmKmVpnk/ppAG4VOxI9ga8rUKbqHEArUuUATlkwTP/Ynx4M8QP?=
 =?us-ascii?Q?yvzLxVhQWpNBSDfNCnRwWT7a5BfChTPqFtPyXlL95UrdIscdzizK3pQCqdX/?=
 =?us-ascii?Q?Jihnm/bSyfjjV3W9eDKQGtVTQ3xO/x7JTtLwlnP4rx5g/VuoPPkKbxNVehRb?=
 =?us-ascii?Q?Qk/+qCBUnj0lwmx5arHzINjta3iQopZx13OkHsiQDt6bMVP9MkIHU7HZ9w5u?=
 =?us-ascii?Q?cMUNdw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:02.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2994a787-4fc9-43d1-1074-08de5ede2acb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
Message-ID-Hash: 5HOBV4LFIEODPJGBZI4ZWFEM7OJ2ABLX
X-Message-ID-Hash: 5HOBV4LFIEODPJGBZI4ZWFEM7OJ2ABLX
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5HOBV4LFIEODPJGBZI4ZWFEM7OJ2ABLX/>
Archived-At: 
 <https://lore.freedesktop.org/20260129022837.4133832-1-ttabi@nvidia.com/>
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

Changes since v5:
1. Replaced the debugfs::BinaryWriter implementation for LogBuffer with
one for CoherentAllocation<u8>, and moved it from gsp.rs to dma.rs.
2. Updated the DEBUGFS_ROOT drop to ensure the devices are unregistered (
and thus all the device-specific debugfs entries are removed) before the
driver itself is unregistered (which removes the top-level nova_core entry).
3. Updated several SAFETY comments.
4. Removed all references to PCI in device::name
5. Removed debugfs::Dir::empty()
6. Replaced UserSliceWriter::write_buffer with write_dma
7. Replaced BinaryWriter for LogBuffer with BinaryWriter for CoherentAllocation<u8>

Timur Tabi (7):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  gpu: nova-core: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/Kconfig      | 13 ++++++++
 drivers/gpu/nova-core/gsp.rs       | 46 +++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp/boot.rs  | 14 ++++----
 drivers/gpu/nova-core/nova_core.rs | 53 ++++++++++++++++++++++++++++--
 rust/helpers/device.c              |  5 +++
 rust/kernel/device.rs              | 10 ++++++
 rust/kernel/dma.rs                 | 36 +++++++++++++++++++-
 rust/kernel/uaccess.rs             | 41 +++++++++++++++++++++++
 8 files changed, 201 insertions(+), 17 deletions(-)


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
-- 
2.52.0

