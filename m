Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CDFE94620
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6892510E470;
	Mon,  9 Feb 2026 22:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EcqP+WpT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 960FF41E53;
	Mon,  9 Feb 2026 22:31:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770676310;
 b=Esr3mz3UFQzGlgqjwu+VXR4AX1MCd0srjdbZ07vUlnAkkPRPX1F2bSpEVh0MJODXxgN4h
 8VXe9Km7NrlAF9N3v4gIfVW/kQXSPyzCaZfI+1vG+v5uPm/copTZiXvIM532zN81Ns04cIB
 boieeDOJMJsK8hFS/y/9jQhcJM2nyRAPEOUN04UO2RmSiLow2zrIfzn2SW8W6RfqpTAVX45
 6quua45EcKC1isDLStrmej3c9EC2PVi/8YGTwODHSH6yrwFfYdbwIR8lBdwMkSwwbcRhiZf
 Uu7kteKYMm3NC3VsoqWF+M0uccIv0Y42fE6fCgrQUYBDTYG/Z0L88uNpjeeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770676310; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EPxsYn53nO0X+7DIDLQtYmOtHpcRC0xxhAnP9P0uwLo=;
 b=ee1e8kiBh+EihU5M+0vkD4aIxlv2aS8pY93t7qPuoaS/7k+NikT3GnEsdK4TGxOwJlbcu
 J2fMJNzdG+maeK9CSka992ZtZMGOFpw4/R2XpFyfEp2uK7aTFqfWRA74jM/0rkuqywb7EPL
 blFi+cew4IV8XqkNGaHx34M/Jaxt4yMbAnwoeOkJ+qJzoAl8Ux7DjyM3/+JVfl8O0kD+HqO
 6m47sLSu0brlXi0Auuhrtzl5D1kcOP4Zt9oi/y31LWo3RmA9p1vhzs3z6DnTIHohmaccR9Q
 KKb8lxo7oFqHhNnh9qFaDgUxLz+DMNVdJFmhmR15JMJll522GO2Q3aCB2yYA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 41149404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 22:31:48 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C1DD310E322
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 22:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FobmHXam7OdpHC+M0ZLqy2V/gK9y7+CTqaMpQVin42anHeuYGQ0FBcibvsPXgJVIaRcZV4m8eSjSdwXo9+68Rry2yD/rHAPz6SdPoH2PBGa/TKGBov154q2Qa3NuF4alIn11oyfvRTSgv79yarUCzkyWyEcwfGDivMgQP9OuDHIvI6jTpWb16CAQKeyIjdT+74lvlHcsFEBtNbHJK3THFe8g+RRvI/BFXFJdYY5GNJgzvg3LoEr57Vria+py8rie7UBxvRuib0nUy9tI0hrva0CY6x4fDph+13kiMKxAnPRXC/UN0ACF/nKmRntDIczYJr3Bwj5pf+YNBfXYUaNKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPxsYn53nO0X+7DIDLQtYmOtHpcRC0xxhAnP9P0uwLo=;
 b=QC/zLEi8b4CcOdj9leYsktMp/TdpDCdWBFOllwLL70Wup+LFH8d58kaK77KMIiEajnr61uqK0fk+ZdV2k8NDqHgK7NoFLATHKfmpbVGZhqmpm6UzFHPZQeKpC7+L7t0BZflVMjHWB65bhi9cPz+n2bKiUBoRkxY71kGMw5J5xc+bvh88pO9zyjUsH0zHkzn0GDGBUo+2VN9kuLmeDqK5E7HRVrfCWm3crLQKDAuI0oqWms8TW3M5mqJI8eQ0h1ISKOA0hUGL5csoj/BwoTx7i5QS8t6Y8+rqbT0FEhI7SsN18AwgZbYKneF+t/qF1E3aamzYnlU9P/IyWyo68hkHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPxsYn53nO0X+7DIDLQtYmOtHpcRC0xxhAnP9P0uwLo=;
 b=EcqP+WpT1lkbPSxzTNzozGRt1FA9r5T0FzU90X/EgCR7douY3aLwx4IWgpqkLO+6KvcQyeW2eqLSwjinooud080PAPHAHesBqrFla5b8yAGMCdp/WkbcYynH2vFR01zpjL58X/15asGuBeOOuv3og8k66lSIME/DLbtNehJ69h8nl/eK7gD8STr3ozlHiM5pxRdIuADynknI5n3GFXeJMldXwQY7dbGltP9zzMf2kOn56cDwnVJG7WLH/N9V7WUjsSeI70t42KuaP5IzAGjuDwOPKXz+Yy0uijh9xe9SNHzfmh3jJkk6wN9JtnijxqvttySEBzETKU9n6ugT5tdJUA==
Received: from SJ0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:a03:3a1::30)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 22:41:12 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::b2) by SJ0PR03CA0385.outlook.office365.com
 (2603:10b6:a03:3a1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 22:41:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 22:41:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 14:40:49 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 14:40:47 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau/gsp: add support for GA100
Date: Mon, 9 Feb 2026 16:40:36 -0600
Message-ID: <20260209224036.3283326-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0ad0d8-33f7-49e8-c9e6-08de682c5374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MR+CdyGuuAOCt++mla8Bg8j8mUg4qoLnsB4g2zaqVt3/D5/6BgCPkhHFfICW?=
 =?us-ascii?Q?nLE/QjBJxj9Gznz4pOuKAcU+D7tA6VysZ4jIgxMrAwcW7bsq6xwp03/ECGjZ?=
 =?us-ascii?Q?+27bZJfSxf3JzM3Dt7KM1AnGgY9JC7KmXRT5amX3Kcejh34pYUzE36KXNpNV?=
 =?us-ascii?Q?k7MYm75bm2ZMq0IVZsnE2apLtIhF3+9Ey0Thz8ktxL4r2TNeWoYKmO3htFaT?=
 =?us-ascii?Q?e9Z9rGzq2xHSe1YQ5GecGBTsg0yEfiAASqECghGIszAwPfbTcmZdNSWHPip6?=
 =?us-ascii?Q?xd0SlwQDGtIEDYxMpVfRxWPt+vuBwtMQbEN00SItJ8/pZn4Ko3sftR3ZNTUC?=
 =?us-ascii?Q?LO5wpbkWwfpztIsJC1FT+BXeTNP+bLdxnIlUQOb3/oEiUUypEK4FmBgXgJ+E?=
 =?us-ascii?Q?F4R7Ei7oYCMU4Ji9TEO4FNAQUar/rUTWEr7E7lwBUV1xGWLEYzobl8bzrlww?=
 =?us-ascii?Q?ZQD9LqHmxKLogiKxATIgnT1X48WVJQ/kpeNQsnbCusliLUGJJ9RMMbq7O1ZG?=
 =?us-ascii?Q?+EM8ioD4b5xAD6g91h3TwEvzoiADmS1f3CC0N6yl7QqMZETJz+L3mndXmLrW?=
 =?us-ascii?Q?j9I7o2MMEgx10HjhIfNn5iVh9L3TC6rSRt2qpEzn3+KFAlWDmd3VsPXdmO/t?=
 =?us-ascii?Q?utrlECiaubOy7B8t8xx/+IOKzdMDewzRwjQt9aGVmw1QYHZuSarHEypU6s20?=
 =?us-ascii?Q?ju31/SYiWvUu8PxbVOmTp9xHpuF8bmu3xLwMTyWykRDCvwkWiSKq7v9E8Cc1?=
 =?us-ascii?Q?XSCKBV4iNI2FH9F9bp1mH0vsNRZ8hxmqhUzeOvz/QcjY+2/vn4JKGttcaH0D?=
 =?us-ascii?Q?ZG1oaJ7Wv2p4xrI6bvL3KFI5PARH2NKzqqPSuWb7BonR3LMCklJJTds9aB/D?=
 =?us-ascii?Q?9z2MigMKMU6EBLFwjaA95IVvh96hWh3LWJEYTklIHMrIztrIAxBYsTleMlKY?=
 =?us-ascii?Q?ZNbfATXRIi9a3TWyooJmfoHNnvEysfqAbbTykYA9QSJh7lWrax7VqmR7pSt+?=
 =?us-ascii?Q?xMySHugFTj93YBCNB3b3nuuoFCaziBUzHJzWjekg81VONIOmho6ptPr1QYGd?=
 =?us-ascii?Q?Cx2uCXriOBe7rTUXiuowAEJ2hw2Zozfo/+RdcFHHpmOq8X8sqj6PY14n9tlH?=
 =?us-ascii?Q?3hQGLgBOwWffqhqqvxhji63O87TLtlOojjkBjbdLvqCjk0FG+VEdpuRfCic+?=
 =?us-ascii?Q?gSgtI8i7oMJz0bL3x6L/tjivpc0NHLSWD4yXuSaw8+OLyVA7UNCJFIMks15t?=
 =?us-ascii?Q?6VOukRY/pxjwAqvAUyFnZIzCBQXNNAMUru3IkJ7BhbsuUpO4pAyOo2Q7PKB3?=
 =?us-ascii?Q?kVl4YgCpgxrwPklNjSa0kFqduql3H3xOUUT5cr7qHOWEZVh4KNzkY+LzY58m?=
 =?us-ascii?Q?HZIzey3slKFmciLbueSgRfL4K04ioOhw7ic4IwExK+vegaseVm7EndfNOEka?=
 =?us-ascii?Q?qftZnjF3AxKOSeraKZea5LknZzYgRokeNicYVtWYqSnawROiasiwkzqUsOxA?=
 =?us-ascii?Q?jynZTvJ3XJD7FntmvAOYuoyKCi+y7Dh1cQl5KaMz3jdnMktMYILQLOQ1cxD1?=
 =?us-ascii?Q?1pl3qpiUxt9vFXm+nmGTA1vf56Ynj3xOPZKHwG7f+oXInjfAvEExQrWrAhUT?=
 =?us-ascii?Q?kCDi8QzudPS/uftUybynFkv780NcdM9Czp6Y5voDT4iWVL5mWZBX1bBjrFra?=
 =?us-ascii?Q?lC3T+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fntK2Uq86zZzmezOB8Wf5iYEtfqxZkFYXrNVI0AtWkT4WjUusme5W6ElY/oU3akKF3HjOaVSsNieHCHjeN8zAtTVRHPs0pccO4z8poRLUHfglYaor08Nb3jNdKeWVfFNfml0Oubo0hb1kCeXy/3yFL+WzoI0QnZVHLzK2eRuEPxrmWCVLvDIH5zIWcJ7LgO0DpUW/hEoS2UxOBBdeBHg9Si/5PHjO4eta3WxUSUzIpvhQyBPHq3YKLz9oqSAcyo39HXIzMCMS3TkBSFbBGbcoF3cv9bMQltul4DSWmS+dJmocmQm4ygdVZ5nernPDRlm58xB9K3rm7Ew/gKco/BO9qa3CxBkHJuLvoTdfxNgSNbJh4Esmd0SqvePI6R1YMsMrKs01gvkKfXvB014P8dq6vg6MeU/Tl/Keq6yUgCPUvPBdA8YqHDaKDCRJMfjQsXw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 22:41:12.0225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2b0ad0d8-33f7-49e8-c9e6-08de682c5374
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
Message-ID-Hash: IDSJ2B5DI22JJUPFCMTONBYWAYQSFCAQ
X-Message-ID-Hash: IDSJ2B5DI22JJUPFCMTONBYWAYQSFCAQ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IDSJ2B5DI22JJUPFCMTONBYWAYQSFCAQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260209224036.3283326-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GA100 is a compute-only variant of GA102 that boots GSP-RM like a Turing.

Although architecturally like an Ampere, GA100 uses the same GSP-RM
firmware files as Turing, and therefore must boot it like Turing does.
In addition, as a compute-only part, GA100 has no display engine,
no VBIOS, and no graphics (GR) engine.

Since it doesn't have VBIOS, there is no FWSEC firmware, and so there is
no FRTS region that needs to be reserved or initialized.

Although Nouveau now supports GA100, there is currently no real support
for this GPU with either Clover or Rusticl/NVK, as both require a 3D
engine.  This is in contrast with GH100, which does contain a GR engine
and is supported.

Also note that this patch partially reverts commit e8b3627bec35 ("nouveau:
don't attempt fwsec on sb on newer platforms."), which added fwsec
pointers to struct ga100_gsp erroneously.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/device/base.c  | 11 ++---------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |  4 ----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    | 18 +++++++++++++-----
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 2517b65d8faa..fc730ed05fcb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2513,7 +2513,6 @@ static const struct nvkm_device_chip
 nv170_chipset = {
 	.name = "GA100",
 	.bar      = { 0x00000001, tu102_bar_new },
-	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga100_fb_new },
@@ -2530,6 +2529,7 @@ nv170_chipset = {
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
+	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
 static const struct nvkm_device_chip
@@ -3329,6 +3329,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x166: device->chip = &nv166_chipset; break;
 	case 0x167: device->chip = &nv167_chipset; break;
 	case 0x168: device->chip = &nv168_chipset; break;
+	case 0x170: device->chip = &nv170_chipset; break;
 	case 0x172: device->chip = &nv172_chipset; break;
 	case 0x173: device->chip = &nv173_chipset; break;
 	case 0x174: device->chip = &nv174_chipset; break;
@@ -3348,14 +3349,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x1b6: device->chip = &nv1b6_chipset; break;
 	case 0x1b7: device->chip = &nv1b7_chipset; break;
 	default:
-		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
-			switch (device->chipset) {
-			case 0x170: device->chip = &nv170_chipset; break;
-			default:
-				break;
-			}
-		}
-
 		if (!device->chip) {
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
 			ret = -ENODEV;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 27a13aeccd3c..fdd820eeef81 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -41,15 +41,11 @@ ga100_gsp_flcn = {
 static const struct nvkm_gsp_func
 ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
-	.fwsec = &tu102_gsp_fwsec,
 
 	.sig_section = ".fwsignature_ga100",
 
 	.booter.ctor = tu102_gsp_booter_ctor,
 
-	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
-	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
-
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
 	.init = tu102_gsp_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 04b642a1f730..1f7360276744 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -318,8 +318,13 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	/* Calculate FB layout. */
-	gsp->fb.wpr2.frts.size = 0x100000;
+	/*
+	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRTS firmware.
+	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), the FRTS does
+	 * not exist.  Therefore, use the existence of VBIOS to determine whether to reserve
+	 * an FRTS region.
+	 */
+	gsp->fb.wpr2.frts.size = device->bios ? 0x100000 : 0;
 	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
 
 	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
@@ -343,9 +348,12 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_fwsec_frts(gsp);
-	if (WARN_ON(ret))
-		return ret;
+	/* Only boot FWSEC-FRTS if it actually exists */
+	if (gsp->fb.wpr2.frts.size) {
+		ret = nvkm_gsp_fwsec_frts(gsp);
+		if (WARN_ON(ret))
+			return ret;
+	}
 
 	/* Reset GSP into RISC-V mode. */
 	ret = gsp->func->reset(gsp);

base-commit: 310326bb7df4bba094a3fc60364c641c547fd923
-- 
2.52.0

