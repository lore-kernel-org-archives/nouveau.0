Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E1AFF5138
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAEFD10E4C9;
	Tue,  7 Apr 2026 19:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fSd20Wuu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 859EF456D6;
	Tue,  7 Apr 2026 19:10:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589023;
 b=uXQd0BufhhrDSBeJUf2Pjr1dQWGnhoLbgqG/abXIMOaxDo+6YNfcLnFENGpDVOgc2SWEF
 sZfUpwXkiPakVRyP9PKYdjCX/Jbp11aR4npFy3i6XPy9B01QQrl0WxJAZ+NrGtAZZlCqxYL
 ooseq8hdBStnpXYoorvUr5BCfZXcyYdRkd6gK6XR9AGaDPtJYiPiE+rB/2PcaV59ayWTWYl
 bM1dWYZqI78KwqM815pwX57naH66leAe2Cbobl4UtUqLcYkWBGsxUK/360mmhyJ2iONwv6m
 1vjBVqbIG0R5CweGp4pENqgq/nBdyTlczJ/LFRJzP4x5wcKda9cfOJ5W4FEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589023; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hlCLu4x+RophidxwveGxL0LkTA+7EcVEH+NkACBTffc=;
 b=wMPi6br+CvQvF8i0Kvbx7h7YUVA5y/i5eLJ7UTiN5P9b7sIkvS8BHikjU7+TFzBtOGKrA
 KbZpLtw+qbO+M2GLMWBC6n5nATsBTNQuvqLZx6rPiHUHEEfsP60VER0fMxa0DL2aNmpBXR1
 k5JSlYkS3iZ0/oKXXbHvByxcchY3R+q/vEclY6r9b4W0KjsntDbZjrDfjX5G/g6GT63xdk9
 Y/VrM+TURdCwtiYaKnYkzX9WsFpoM313xtAX90VrKesLklqQaWy95+FLp2yq1nSiPDfz7yR
 m3hJL8rErLhz65ld3py8fCsOsnZ5QfvdP7lPu9mY1s4o5m6JSwlZ24uvV46g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 314BE456BE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:20 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011070.outbound.protection.outlook.com [52.101.62.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25B5A10E4B0
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyaSYXmA17+0uDosza0QuS7FE9tbTxXSx3L1RpddGRVRzbXQp2kZwQNtXtrjrmsAjEeVoMD1KAcNWFkzgoJDQc0bOMPgghFutjkn251m7khqIHd2MBNanJtwKFeAfuD28a5+ecmyUpqyzTsQt+nrbEPzVUr4L6jaqyBIgusrWAs9jDZBssJEWOviQB82Nce+5hZiOQ+5mNxwaaVv+gunWSS9sXw/G3DGt68xuKT/aQzxZRjUUQj9C1huA2FIDJfJcVfVu4ceu4R4CFqJukfQv0irJFFZ1dfHseNm86yVrialy23Hf2Onvxtqs8QsLL+pzrxot2CQbC0BnklB5opvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlCLu4x+RophidxwveGxL0LkTA+7EcVEH+NkACBTffc=;
 b=pMGfip7P0/dgo//H2XKRHyIkyIGjNkUS/3eJdYhhRCGriiW4bedL4KcYEZKH8QNpR2MRvHw+1JmMbVy4Y8M/kFCDpulWSAwsiIuqgrkWIQj1tRdN+0q+JEBciMX+uL2pJUq92cNvnP+cslFMkEytKN5Jx7TvHAML/zKTtZ94qP4GGgBeACyT73pZr13BXvU8lz+wg8TnIlBmhnj3aEK8d0YE7mrul0l3Ke6Sya1+ruABV6ZIo91UUjffm3Ix9N5sQQneCS76FQbN21LHKLsd0lrNoa4358w++BhO22VLI4kti+7la68OBI/SkRFRkLabWNSROVgOQ4pXrYgwd1/uJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlCLu4x+RophidxwveGxL0LkTA+7EcVEH+NkACBTffc=;
 b=fSd20Wuusq3QQNROkdjy2rd19kSmwbffJv83zlomgWV5nfRVY/a+iBBRo+w9ACgmbHV+rjHkIY3zgpIQfxvuPbOOnLVp1VIrU4n+O+86y3z57fQiPhricAUeT3A/ld0Vokgm/4FMlWuOUco3r6AbVms/0J/yCxVFPLfmM5C/5QITgd79chVf0/gQRMKK0gS+FWY309BKn1nIj5qi1GFYfgJzgmpcp7AyRUwuqPWrz8HEDArmhrMgOBJd6OyAoOOSyO3rGPggkHM6lTagjhA77238zrfq2qwdSNKVFguhvb1PHr34DqwQ4XjzyRqjmRTK9YDZX0bBKrqzGxFy9GJgNQ==
Received: from MN2PR05CA0043.namprd05.prod.outlook.com (2603:10b6:208:236::12)
 by SAWPR12MB999139.namprd12.prod.outlook.com (2603:10b6:806:4e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.14; Tue, 7 Apr
 2026 19:21:52 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::14) by MN2PR05CA0043.outlook.office365.com
 (2603:10b6:208:236::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 19:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Tue, 7 Apr 2026 19:21:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:30 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/nouveau: check for GA100 specifically when
 calculating FRTS size
Date: Tue, 7 Apr 2026 14:21:17 -0500
Message-ID: <20260407192122.3055293-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407192122.3055293-1-ttabi@nvidia.com>
References: <20260407192122.3055293-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SAWPR12MB999139:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4c2d6c-3110-45d1-59ad-08de94daec16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XUW0JrvqF7+0G2TgFB3zePdmlQvJGu+FcZLerjVK1+l4igsl0Oai5TukThlD55JrhVI4InwX4m0c2llV5AUAApSIl0DcfeDGZ/X53gfVKgKkoTxwA4RtzUePcU4mBTNO0UZ/I9LoVmy5piij6hP/09ZYCh43ZOQ92tDvB6sjvlakynypKlVDYYjVGHhhu04iV7zx5QZiqllgBflnsgVIiWZ+tp0jshDhvHdTk3XSaRSPvdZVJ3k25vyEdIiRY8CxfteVzK4P0Nb0UkqCazR2LxSytf9da1dfBib6Mqlljk9f5Pb7jgvrfhi38f1DLHZyZtE1kriDqKxLynZNCnO9E7vo9tDEGP0q5kN1PE+k3zs99h2mnKXdBZHAq3tbR1DeKz7MXH3IVjPoaI1mQ9BQFLT/Ul/9y4IyWdmF0O7bKFT/4UUQUU3jinX+WfIEjkxWV6CtUFsoqwTStGh87npRhbHrqFtIU0UJPLaa2WBml2zQ6PHgXF3h/ltt7LG20IxtEUQvoe7yJwqV/b+9I3Uj9SVMx6v7qyIOX7KDKZIjHrIOwZuTzUGioCc7W3nOvvfGsx966p7r71LRq3ueeceN51r1Q6BNrgZOgr6Rgf/Q6PyGqWmwhCmPamg54fTaIXRCaVYePjwRjnvm5DcTFZdYwTSbYqTUo3S1YgXVc1cFBlDVtw+xForHMqumjAnc/tphuYrcYoYgAzBbi4MXCplFJOJOwIVELd8fAgqfsDDFP/JBZN3nRJj26P47riJCeFk1ls1B90RoWEhhkQW7602+4g==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gizeh80C/8x9+B0YOOPNekoFy3OzK6tKs5Y9l2s/TBynwr+CPAHCpaW9ciKKjzzSpBOlLAifuA45uwjgzDPRnyDnIMHTBkGrJ7g/YLN8s6p2+Oan3tY1qH8g45wPZrKELhU4UjUECw0h7xcNp0xWjuSEwpEwMOdEGyQFu3/bixtDJaarOyHtfMr1NrkZTa7Hb/cWbxfIlszCyDq1e/D/PaDyKokjuQW+iX+AmawUiJvrZTtl0aJnvs1g6XcmjmSRAeM9gIi0/yv0rT/MzZhT41PmNiyxPh1Hw0qo13q3Ml+YII/flCLB5k/SWSAKoN7JVB9affO3lMuqsbLmMxeWxUA7FwxC36nvf3fFc+VrJ9LofJT4VYtJxrJxi3jPSP9moS1IYYT82MXQd8aRZU4ZIGQ/fmU9RzNk4tgfo7gqkmfVoLc3Y0JCoRigUi2TZnRq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:51.6610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f4c2d6c-3110-45d1-59ad-08de94daec16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999139
Message-ID-Hash: HFDJFNC7JXHVWI3RDFMSHJYMX73O5XDQ
X-Message-ID-Hash: HFDJFNC7JXHVWI3RDFMSHJYMX73O5XDQ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HFDJFNC7JXHVWI3RDFMSHJYMX73O5XDQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When booting with GSP-RM, the FRTS data region normally needs to be
allocated.  However, on GA100, this region is not used and so its
size needs to be set to zero.  The current method of looking at
device->bios is not valid, as GA100 actually does have a VBIOS.

The truth is that GA100 is just special, and the simplest way to
determine the proper FRTS data region size is to check for this
GPU specifically.

Fixes: 20e0c197802c ("drm/nouveau/gsp: add support for GA100")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index dd82c76b8b9a..815be8d0ecf2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -319,12 +319,12 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 		return ret;
 
 	/*
-	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRTS firmware.
-	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), the FRTS does
-	 * not exist.  Therefore, use the existence of VBIOS to determine whether to reserve
-	 * an FRTS region.
+	 * Calculate FB layout. FRTS is a memory region created by running the FWSEC-FRTS
+	 * command, which writes power management data into WPR2. On GA100, the booter
+	 * firmware handles WPR2 setup directly and FRTS data is not needed, so no FRTS
+	 * region is reserved.
 	 */
-	gsp->fb.wpr2.frts.size = device->bios ? 0x100000 : 0;
+	gsp->fb.wpr2.frts.size = device->chipset == 0x170 ? 0 : 0x100000;
 	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
 
 	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
-- 
2.53.0

