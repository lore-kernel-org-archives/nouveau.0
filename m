Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A3D6CFA6
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:36:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5010EB55;
	Thu, 22 Jan 2026 22:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LOSLsB2n";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C112540543;
	Thu, 22 Jan 2026 22:27:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769120878;
 b=BNynjZQ/LS1cYi7d8GGMdF2EwYNosZz7cBa4OBoSpplkk3BqZLC+sBp59uGtub1XI4W6J
 gG4aMLrNiCtVV6XsRtdvEUAwphDtURMvteSWWadGjcdR7JTTQX04vow08R1g+tmdhIfpuhR
 jQIIIqJWNsqhnDTIiRTxTdE+uj8YCWjTVtrLeuQvSI9ZcRKac2JV4NlkbeONP8VLo+7UKE6
 wGEic1NFBL6n2E++myE7M90aJ1+WQI0GHH+40xI2/oOpPdiIdP2N7rkreFc3Dz9nWyzQDs7
 IbaP8QewlV9mtlqz7qvGNPXKKY1tZ9ERKQC18fTy8wHrWCWt6UzKzgd+qaRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769120878; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=l3DOaPRNUsReLWlmGNKznp6ZJRRYXF+NIm4rf3oid+E=;
 b=Ujq5tjU7qizA0OjaQJ2P2nDmqLKbmDfpWMesISIxGUMIovXGNf5hcp9n59/kNFt3sauGl
 E5THj2/eP7gkYEC3TatapUP+2v0v4mlF6HpgtgM976sLrxfZt10BnTrSSgH9UHGyc6Hr6BK
 5tAmmEqg6lB1XFlOgEijMddaNsOPLD+ZenkK7KiMkZ2Vv8Ecwdc+PVnOe0Qnw2RECXk6GWy
 hUf9Tnl2ug7ZjLWD8BoRXpaga6iM/YBMq5xE090oVqdyQ7TH6O0qr/Rl0E6rayOI71Wvrrg
 wAGWEZrhEigU/NmpKnyZRNnyzaCS80Gr3/H4kP29jzuqE8BU/feCxrVL3M4w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 27996403C3
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:27:57 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 986CD10EB49
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUL7kdcCSAXJ/AbmCe4sdqqY6gHGK90mDHdrTJlQWC+ci9zBI1x/Y2Hn0gjsrLcItlOSfCvS4vfDFuiv6N04R5ETVyVGVXz0mglUZHJP3CWTyzW+pUACGLNZYWgdHGz/D5v63bUSYnJokmo1EAyL9nD19Vr7OYwcMBPeMA0ISSXWFQqL2z/7GWJh97jmDqcN8x+DZ53WAsbIErEeZkWl5NaOioGdVuzOMeW+qLBycFQKOvlh/kuWKQYGLc9Aw0R9Q5lDgnBLwbd6Q/9xkntmQnPpRqYMm/ppmFQfYyc91k/RujxHAUZwY8wgrMPqeV6hSKORydqRcRng0iStN7jM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3DOaPRNUsReLWlmGNKznp6ZJRRYXF+NIm4rf3oid+E=;
 b=nU5VnRNc5Vym0QS4R/5wpUhnKK3iYV9PCQye5SbALbkyCjyv26BC+bzoZvlKKOkLsQaNEWpyzUnnk2VX6nsHjKtUGwWxX8O5H7G6E0ZPVH35n2B+qFfQE/ltV05krosEnmyY8Kijqrs/K5uhe0Bfe9SGUDsHpuu7ub+jvvhZrT2rlOUvQopEi/qsXgjB1G3sGDt0C9o0SIX3yh4PJuq2rUoWWHVlvtdpz1Yg2jlv8xpAlChPCoU/4jsj2GuafY/lsT0XyyCddLZBTWoqu7AnS6aT5NwtM1EjxUAkq6G06wuwkIQctM93cyhelIltrrohLmAC3ZfZrSnVGerR5e9KSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3DOaPRNUsReLWlmGNKznp6ZJRRYXF+NIm4rf3oid+E=;
 b=LOSLsB2nuXqwDQLWZ0ZzDhH05oCNOrzVdjneA252mBSsFLkZJUfh6hk6Ze/vTJRYa2/WFTF7MlqlCSxG8g/6YM6KNdt2EMe6x2yoLaEuj3aygB8KdvivbDp3yojEE0W+nYZiH7PgB+CjGIRH4eGDxQNB4vBKozATAVNt6iVe0tBCNoOGop5sKu4xF2fcvyV83COf8J7KaeMbxq2cWkyitdsPRkMQ94NeD2PkoLqoEKW3WyUiMhLV0GUetzd0tqQMO56sxg4BpXSI9cp+Uvh0A6nSP4Dbvhigv3ifHXHM33CBV2/dzoWR/nHWP5BrH2RDOrEXeAMQQBLkAB8pPqmNnA==
Received: from PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::9)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 22:36:42 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::2f) by PH7P220CA0167.outlook.office365.com
 (2603:10b6:510:33b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 22:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 22:36:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:57 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 14:28:55 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	"Alexandre Courbot" <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v8 00/13] gpu: nova-core: add Turing support
Date: Thu, 22 Jan 2026 16:28:35 -0600
Message-ID: <20260122222848.2555890-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MW4PR12MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f965c4a-1d16-4403-3e93-08de5a06b5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0RQIw7QEMnDF60Xh9SptoqZOKT6qyXmOJW8Si+ZnZbAEWqM4yfn1G7C3TvC6?=
 =?us-ascii?Q?w2LiDUdE12xm1eFes/5VcxCGWyyr0K+PK+iArK/cLu0fiLJc412gxeJIluyT?=
 =?us-ascii?Q?jpWqRXO9ZR/ogO7yz9c773fnaAZGZUk7CVp4YcDarFfB9Vq6s7BXGsCaXAtK?=
 =?us-ascii?Q?XjkJCE/j8KiIaIS939IPTP81pcJuIH9DPw1VxyAvtdfA0D9vZux7rxNwgBPX?=
 =?us-ascii?Q?OX7Rg+4LCJh9idWgbszefXY2pqagViKnDhkCb8dOs9fXYia9CdC7MvTLp+h4?=
 =?us-ascii?Q?XbgXQkGjJ3OgwinGLaMlct0ncbdKOwiPA1WmSE4DKxoIqLrd2WbtHmGq4MQl?=
 =?us-ascii?Q?Nt7G5EgmsG32++oQ3QaXASqlJ/ZAWOESlQOka/MCv27IQgK12g4G+XN3yvZu?=
 =?us-ascii?Q?VdIJeGP4ARGhSRXVaCFFhAc7FTblOcXQCQa7r5wMqvL1PUfi9lTEZZXbC681?=
 =?us-ascii?Q?LI8yaoGtP2AVKmhbycvb7cGS0h1ItoD33Zkd+Xpfmif2fwR0bK8X8W+EE5ev?=
 =?us-ascii?Q?CRq7viP/4eygh3EpH6qavQYnvaLxk+C1l0qZ/oNH3TIJcWbyA7WvVjhloUav?=
 =?us-ascii?Q?3wdr2JvcFSOG9Sxg8sZna6tz8hspb1qiSNH2UbzkhHhlFN7ND1d8upCzdp+c?=
 =?us-ascii?Q?xLzRbEohvrGlGKLSrreotT6s0XSQo5eNkXjNJtSsU41flcSZ7c3IOjSM7Rla?=
 =?us-ascii?Q?iZ82jhiLZkmtADaOGECpeRaVTHuzhCgcQ4vP6HUFdai7tVhDu5jMROTKsexD?=
 =?us-ascii?Q?Mi+WWa91m9xQVPJb1IOqg98x6+sd+9VPJiXQN4HD6CqOUVN6JInzBOhB6tdh?=
 =?us-ascii?Q?vKQJP7Bna+HsoWELH09+RdwJ5Ddz0hgPXhzawJ7T4QbMOfwTLQaBAUb4JkRR?=
 =?us-ascii?Q?P9pyp+m/bi/gbMw2iGXvrhPkCGYdvogiJ+6Bn5z7s3GBbTZc9Xtj74QlcTWb?=
 =?us-ascii?Q?4dMnMy74l00bpY5+1zB4HwdUucvhFBlNlrUROx2PRKgIcqq6pul3p6lUYdsA?=
 =?us-ascii?Q?NzeNNWflrasqF3xTnHHgthR5Tz06Q/gL5LUjYpPd0o/jTi0E3CuPTT7JH8kH?=
 =?us-ascii?Q?nj4B8H2AvU2u1vQ+E2zR5zjw/YOHkvHQM6IfLLDgyw6d2/LWPnWjQY5hhZ6W?=
 =?us-ascii?Q?ipgZvKusw+durUn45fjWRsi/p6jOFlq79STHwr00ezii3laIK5f41g5GcySw?=
 =?us-ascii?Q?PCKf8703AMJCRNur4u2pFEvgEgB7orZsffmhqzv70Oq0cBHVcuAvRwDsZaru?=
 =?us-ascii?Q?XsEbD+yke2uCmAlvO8N/9w6vzzyLlBzGgY9NLLPvNPvJ4z4FPeKqJ6FbM66v?=
 =?us-ascii?Q?G+lsS/XwQI12IiqTlgOIE32nFaqmlZ9MpFTAJJNiH0sPDf26aJCsKo57RQ2V?=
 =?us-ascii?Q?Zt1gJ7CJwxnNvA3x3cwm7AZQgFNldwiCOd0HnvntH1bNCBOHxYuSHCIxdaoa?=
 =?us-ascii?Q?qytWyC4FpAVD1sOrrIoy4oeJkvK9/4jUG6c5YBPcjiJR+qgGiBZsMxWMwGej?=
 =?us-ascii?Q?UW6fb3uT5GN1FjFVPxB3rHSQT8t06AvmgV/v6iHNXx4Tk7ZFvcwt2rcBWvKT?=
 =?us-ascii?Q?fFE/McY0X3KTS5WkpMePK8hWSm7lLV5YxedWpj/IiZt5fafaI60PQLrzrkVN?=
 =?us-ascii?Q?lK2BIvgok9uFsaI/aUWqFmdfVO7y7eAkTj7BQ+3DXMO6swzHnsNA9/gZSHM2?=
 =?us-ascii?Q?NcfxJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:36:39.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f965c4a-1d16-4403-3e93-08de5a06b5b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
Message-ID-Hash: Y6EKGO3576MGLHWWEHL35VCTEGNKLNGP
X-Message-ID-Hash: Y6EKGO3576MGLHWWEHL35VCTEGNKLNGP
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y6EKGO3576MGLHWWEHL35VCTEGNKLNGP/>
Archived-At: 
 <https://lore.freedesktop.org/20260122222848.2555890-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
functions using build_assert with arguments" in order to compile
with CLIPPY.

This patch set adds basic support for pre-booting GSP-RM
on Turing.

There is also partial support for GA100, but it's currently not
fully implemented.  GA100 is considered experimental in Nouveau,
and so it hasn't been tested with NovaCore either.

The latest linux-firmware.git is required because it contains the
Generic Bootloader image that has not yet been propogated to
distros.

Summary of changes:

1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
is used.
2. Because of non-secure IMEM, Turing booter firmware images need some of
the headers parsed differently for stuff like the load target address.
3. Add support the tu10x firmware signature section in the ELF image.
4. Add several new registers used only on Turing.
5. Some functions that were considered generic Falcon operations are
actually different on Turing vs GA102+, so they are moved to the HAL.
6. The FRTS FWSEC firmware in VBIOS uses a different version of the
descriptor header.
7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
aligned to 4KB.  So pad the struct to make it 4K.
8. Turing Falcons do not support DMA, so PIO is used to copy images
into IMEM/DMEM.
9. Load the Generic Bootloader from disk and use it to boot FWSEC on
Turing and GA100.

Changes from v7:
1. Fix unused warnings in some commits that introduce an identifier
but don't actually use it until a later commit.
2. Split out the Generic Bootloader code from the PIO code into a
separate patch.
3. Removed accidentally included vbios.rs.orig

Alexandre Courbot (1):
  gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Timur Tabi (12):
  gpu: nova-core: rename Imem to ImemSecure
  gpu: nova-core: add ImemNonSecure section infrastructure
  gpu: nova-core: support header parsing on Turing/GA100
  gpu: nova-core: add support for Turing/GA100 fwsignature
  gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
  gpu: nova-core: move some functions into the HAL
  gpu: nova-core: Add basic Turing HAL
  gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
  gpu: nova-core: add Falcon HAL method load_method()
  gpu: nova-core: add FalconUCodeDescV2 support
  gpu: nova-core: add PIO support for loading firmware images
  gpu: nova-core: use the Generic Bootloader to boot FWSEC

 drivers/gpu/nova-core/falcon.rs           | 252 +++++++++++++++++-----
 drivers/gpu/nova-core/falcon/hal.rs       |  26 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  39 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 +++++++
 drivers/gpu/nova-core/firmware.rs         | 203 ++++++++++++++++-
 drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 180 +++++++++++++---
 drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
 drivers/gpu/nova-core/gsp.rs              |   8 +-
 drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
 drivers/gpu/nova-core/gsp/fw.rs           |  14 +-
 drivers/gpu/nova-core/regs.rs             |  72 ++++++-
 drivers/gpu/nova-core/vbios.rs            |  64 +++---
 13 files changed, 863 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs


base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331
-- 
2.52.0

