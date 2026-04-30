Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB98CD13D2
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2B1F10F4C6;
	Thu, 30 Apr 2026 22:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JO0Yp7YZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 70C8B45D7D;
	Thu, 30 Apr 2026 22:26:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588019;
 b=LiRG+tw18uueJyj30ezy9Q7rB5RKPsmlbgl6mKkFm+wm+5cXArKRrrn05nsHr796HigYZ
 lgYX7PjN2Ws78+i23tJ85WYwZdk5SF8AJkvvAWAYVHkhOVLTztJSLwlk9QLBaMD35ZTcA1u
 K4LPLAovgK5pASGvqlbNkqPcrFidGP6qseZtNmSXnVBenJhgrfxcXQrqR2Vn9QSkdyThdMr
 7g3l72wcIIML3KJXLYLPjvFGjt3DEW559OsGQ1aaeAWgLiXMj1MJ55pqs8h/q1OdnXhW22p
 MTU0Bg3E83ocRZYcHXNlKj/USMC5nfD4AWQhSyGQw/1x336PRqv4XRsgDF2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588019; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HxE6s6fsxJ6XcfRE2oerPsOx88/1rYGYFgE3+usrbTs=;
 b=ExUtRAJV8c3Y7kAk9T3GQotBsceXlbRowKPQFhLS0ZlT/Pq3MP5fI6qc3FUQUKUlIT6Io
 K7DSOmeve9CY7xn+0/f8SAQAvANuuF533RkHDO36SmmQzyjLEtAvYYwJwgJtXuXvJiIvdwq
 ae7Ean4hELqWJQ3NO6HpS+Kiw3QLjodiqqxHjflKgqgNS/wpI1U3coRiA6xxOSHvXXEosau
 dGUtf3GzaWC/ToJxai7+JG5deIupF4f1uDZkhjB1qBWU2E5L+LTWmX+ITdTQjK2pmGScA+k
 u3FAueJXD1P8y+iHRdDnMGn/QQ3tSmVcwi5QYcbNrclMWI7kk4VCRDZdFFDg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 090EB45D6C
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:55 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6710E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMjwrLKFOXLKn8Wk/q9jkA49kdPVwCiViPDESxh/qWyeNGLApMaPduzLq55vLcpcxoA8dLxvBUp1gdjqmRpkyLJbsvM9bBOlh9Pb1U9rTrkegI070jAPHNPUwCFBBBsV2TrftJogcfN9uPyweYl2/96YDn0loXQtjfoiZd/Bv05hmO61WgTebtdVQIYTKhUMIhDziTjrQGaQODvmEga21nEKuu2vj4AkG0g/LAwVQBwJsNASPFasly1QfcJOiuPfKtMoqPNmIS/sdkzCu9fk5kHlnedBvQoXwLwvwNgKGQLg1HCZcmHpJMMZ6KIaRkFZt3FQeIGsIR978PdzLv5BAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxE6s6fsxJ6XcfRE2oerPsOx88/1rYGYFgE3+usrbTs=;
 b=HDgWAjRV5dRYo0qaXeWI7QOQqLYT3ovy7IxQ1uLhh5fjWIPxy6n3VcvKQn4AHf0s6h/yVJNcoExDSbyRcKqOiL6MWE4popK2KjdQVajrMK7LB+CUMW3wWfUs1PEVvv5v0XsMUjJSPGAiMDZe8oGV77NHaXyImektp/DU8ttYNd2DAh+CLSEIwLPsVz284JUd1lxHZ/EpSKsvoesz/X2KRxXWDMAp8zeNZY0WlrzHI3PDpZxrfcTFa5UA7IFf+wNSgPpN8fYPkl2E7lz72b52iMqnssEAu/7eXzVZ9PK3eLagepuV8+qg8K+dK9PPPjqQHCXSC6cCRAIaDH20JCNhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxE6s6fsxJ6XcfRE2oerPsOx88/1rYGYFgE3+usrbTs=;
 b=JO0Yp7YZITSY6/xQIcInW6IXYJK9i8sPDAs0OpqbCn+qpvUxM85zQrDL2e2+FY61itO+O73uQoyIM3CyRctXHBKDuZpfLvhCL+5YVweWVdA+UW6Q09z7eze8CAQoRMySmKIJuRRDsd2y9dTwEtcNsmXNqlvwLtwQ4Rjpw9wMJoshXPAKJdxLTPBlVeHJel8v2viZFQ9aksrdXZpMIChuo13vdd4NIFacNqjpqKVSSGp6vvWBVTLQn+AssvsqoLlXnaSmTdPIJNRVfWn0nZTJp/hZhGAqLiof/yKVF0u0dWmzuGlm+TfCqjqvoqNmzc97CsP41cV0yli0xa64Q4dgZg==
Received: from CH3P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::9)
 by SA1PR12MB9469.namprd12.prod.outlook.com (2603:10b6:806:45a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 22:39:15 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::c0) by CH3P221CA0007.outlook.office365.com
 (2603:10b6:610:1e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 22:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:51 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:50 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 00/10] drm/nouveau: fix GA100 issues
Date: Thu, 30 Apr 2026 17:38:28 -0500
Message-ID: <20260430223838.2530778-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA1PR12MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e79bc8e-b23e-41e7-b098-08dea7094f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	j8E9VllFAIMXZyuRr1Bia2WxK2j0c1CpAXzwg6GCo3s2JZOTxtHdVSeuplmgZf88qd2nGJb3ilVyLuGpnS2JfK6z/XPsCYTVZpNBSAPM7sVVSfGJL/mxOf9OzdnCHAE5Ie0+iTje3gquIx2UsjaxCW/4nloE09QvS0tW809Lo0k5toBQaiWhpughe5ijJfb9LIO4Y9bnM3x0ziemU4LwCvHZ/h0p4VR7OZiKSZLaa/OR5On0RBNPxbAQvTX4ywUMc/MBAbOpqSTq3PlB0bx2DYgwReyEcJCeAbBFcjCrWGson/ZRVfuWxjInKGPBmOhkFHGJ6PrQ0w4YifiMHCCEp5sxbGyhVqiAvBcXfzOapWkeF1wSuFnaUq2Oze5hB3r1GcM2cHbQq3uejOtLsYto4s/Z47WjIl7f2LRx/a9nKMSv43eUfFugZu+5EJx9iGjBT7a9Gyye6penG+TtNNZJrNJWk+m//so0P9YnJQpsRGxmGju0HNWHKmzHJ1d6vKndbqMDV3YvPOG0z6HrQuMuHCikSeUXL3OOoGneZ5a/i08UiK9FpgjIm4srxttq3xtYu/nv0ku9od3RJXc6QMMamd0L1bdS23hX4wZVfxB2m7p5UqrGTNmcBLY/OhSRNjbyZ23rAs2sNe1aKPn4h4a/hvFPkaychlV58PRzFJAozBHVLiD5RvKNWtvfkEOwciplagO/kdafLXaEoUDXmkHyUCb/kpDhvhNJIp3GFZy+9Mk=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AfWTdFS98DxpdOPuuKOpM1N/0KEBUpuwbiW32Y4/4SA/ymCucOfGZgDVfX2W4ooPxX9TDtaYWMHf+KzO12SQK6vWBsf9KX9XssOxYL+r8R3gBrxzFpK8xASAhLI7hEaTVG/QD6YsIn3wYg51zPWvWMBKouvzI3H9bDA2T5bZgxvDK15W9vLeJPFYydxoRGujXsmjDdm/C+BTpcBRNQhJ8RlAI0AHptsc/2HiJ4V//k0s7/CmMg+5P0l6442LdZ1ALHcuSKJ3nyePs8koQM3+K9Tk+8pqeDi1ojLHzfnEQX7Fj2DInbNCTgtxLk/h/Y9uu0ONrMs91JICQXA9YGH6Fh0iJIWYRIS8Oktuub00VuGfjpkFi35tco3LKnQOCcdB9ik5OT4eVcN+f721tN396QUUdrIrPJYUAW3bWaMyi8yRq5LTeSKQq15OszKGkrkv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:15.4229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e79bc8e-b23e-41e7-b098-08dea7094f09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9469
Message-ID-Hash: 46I4BM4L2KN7WQFDUC3THOEHPJLRRSLA
X-Message-ID-Hash: 46I4BM4L2KN7WQFDUC3THOEHPJLRRSLA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/46I4BM4L2KN7WQFDUC3THOEHPJLRRSLA/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The previous commit that claimed to add GA100 support, 20e0c197802c
("drm/nouveau/gsp: add support for GA100"), actually had quite a
few problems.  It falsely claimed that there was no VBIOS.  GA100
does have a VBIOS, but it has no display engine, so it cannot use
the PRAMIN method the read VBIOS, so it has to fall back to PROM.
For whatever reason, the VBIOS on GA100 has an "Init-from-ROM"
(IFR) header where the PCI Expansion ROM would normally be found.
So to find that ROM, Nouveau needs to parse the IFR header.

The previous commit also claimed that there is no graphics (GR)
engine.  That is also false.

This patch set adds the IFR header parsing and a few other missing
pieces to allow GA100 to actually boot and shut down GSP-RM
properly.

Changes in v2:
1) Rebased to latest drm-misc-next
2) Added Lyude's reviewed-by
3) Reverted original commit and refactored on top
4) Added code for row remapping work-around

Timur Tabi (10):
  Revert "drm/nouveau/gsp: add support for GA100"
  drm/nouveau/gsp: add SEC2 to GA100 chip table
  drm/nouveau/gsp: use fb.bios.addr for gspFwWprEnd instead of
    vga_workspace.addr
  drm/nouveau/gsp: read MMU_LOCK to fix WPR placement on GA100
  drm/nouveau: only boot FRTS if its region is allocated
  drm/nouveau: GA100 has an FRTS region size of zero
  drm/nouveau/bios: specify correct display fuse register for Ampere and
    Ada
  drm/nouveau/bios: skip the IFR header if present
  drm/nouveau/gsp: require GSP-RM for GA100 support
  drm/nouveau/gsp: formally support GA100

 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   1 +
 .../nouveau/nvkm/subdev/bios/shadowramin.c    |   3 +-
 .../drm/nouveau/nvkm/subdev/bios/shadowrom.c  | 110 ++++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   5 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  61 +++++++++-
 5 files changed, 163 insertions(+), 17 deletions(-)

-- 
2.54.0

