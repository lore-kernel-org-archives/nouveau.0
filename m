Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0BCFF886F
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE810F4C1;
	Thu, 30 Apr 2026 22:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h5sJ2alK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3B2145D75;
	Thu, 30 Apr 2026 22:26:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588016;
 b=Xz6efPL0idns+pyT0nixosmf5Mg9EEJfSDT4gBEXy9U7zN4tPT989a7vay5Fg8s/RZb5V
 mIXdaaoomv7lJZuxUhS/pDFsriaWkwnuIkW3lQLgpEd1AdACuHtWFKJoolL6v8kZGcZhZRu
 PusCbRPasSmuUPXFTei4yQGvZ8Mux9FgJz+H3iWhVH4oHqFIdAe4stnBlbrsy5+ROP6KywK
 cwk7Tcg8BjM31Xze3aD/7np0jkzbFiMSA8qa81lbs34LHK9OyEuP2ltUHWeDyNpKC9jauUF
 swe5zHJeYPPibracYcmy6/zcAcg2UT8uSL7ylDR0oa3+q7EQIH4aLvUpaJaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588016; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=isTqsiWqWUuvHc3VSxc/l038Y9ewmrLe/sdrCYbVXfQ=;
 b=tVQas+oMDLBnnUKqj0he21nrUx9cNz6pMtmalc9HOhPTrI7nXN+ryZuPm5HlIiUJI+XsD
 aEJ6Kp4GBH8Cd20FrWN/yyqjybsZX9K8T3jaJ6VBtJr5HZR2L7bXeMXDhm8Wrd91vQGmwwm
 1qkrLIEf+Wf/EwFfMWDmQr9hlukhuKVnENLzXJQiUHx2T+xrX7VsVbFm4tmX0psfHSxge6Q
 ZxVvvZlY10Kk8YnSlbrOgKzsnxo5TvJKxrTbQdqj+bnRgnInvNbeIdKRaq32C6YcI7blMqT
 NaDXBtpqsY+gIhdLXvNIl5GV7d4BPSxL54lDP/e2yIWuCv7E3msUhmQKf5Ng==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 58F6E45D51
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:54 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7710E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgibMoqLEvPMGeu6vxG/2KDMMGLrCNGZ9hOq2e5hfk3Hz0HiIPSSZccd2IJh9Q5xQ0aixo0fdhbp6gX3HXvR9mclXhCvITUwhTfuPML9DRDGiBHiib8e4RO5ChiPn+Fg7D1mWWLZbBBdGQYPu6lYCQO1vL+xYHYAZH5Y/Cx5Y9BVPb8h55fF00z0nVrJ9WJrduOZGbzvs8pp8HbcrL+mLldXcPdcDLDUjiSpZXndry2pkEotcbx0lyvdzlQHzETl/Qo2ti7155T3o4e+Do2KWkcHYBwMTK7Y3gCc8aAM2izyn8k6G919c4tjct31ZOG1TqhJSvOJBss1rEG+HxP2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isTqsiWqWUuvHc3VSxc/l038Y9ewmrLe/sdrCYbVXfQ=;
 b=jY14K+dKWdekqszakCOfoJl0fcXxY3iASfQ4nUcJeyzPcGgYyVNr/3y4F1DAE54ues56Ae7/PqFo2KvgnzlTjhCuodRxdOvxB5fBJOlc7EnYyXdcuEytWPI1FWcp1Ua/ybIDrFUIPbtiTdGl15IFneOgDYWFFNmUPsKl34FREmN5jOLQLDoBIhPsQ4YsYNcqN2pZJLS26pYjeOBcDY96EbOW3FtydwLrIwHhPh98gbPqyJ+TcCCBy2wUOv3skLPze/TkqyIOeu9mGKqescxcRCjreTBCxo2jaCpQ27NgyRpH5yI30h24tAkOex65LkGyAdQmOTQ24x7YXvT7BressA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isTqsiWqWUuvHc3VSxc/l038Y9ewmrLe/sdrCYbVXfQ=;
 b=h5sJ2alKkbjLV9TYkv7UvV6fdTT7jBRqnKIQgCTBsX99tOS3aZtq8/R9S5ycwcp6TQRb3+85hmBcbr2RV0/HvdlI18ZCurNc/6Qv/6z9ovBfcjjFHJ8l156+QS+TlXL+4wVmMuRApHK6YUsCf1utVv6CqQWZJhSkOYTTT0z4cIXeiottLJfCUa+Wi7x1xwcpKnAJF9FYUQrt2lVddDefqimiV4gA0R6aPfWKqrrsZ+vkGFBMcf2aC1rrqAbAlIm+BofzsZqVygs6DSd93csGnKiLqP83FFcY0/bTcovw/KxU9qnCQVYy5xNzE4vDgFc7rGK10KH/gzXazwd2ics1og==
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by SN7PR12MB8436.namprd12.prod.outlook.com (2603:10b6:806:2e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:16 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::bf) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Thu,
 30 Apr 2026 22:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:59 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:58 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 10/10] drm/nouveau/gsp: formally support GA100
Date: Thu, 30 Apr 2026 17:38:38 -0500
Message-ID: <20260430223838.2530778-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430223838.2530778-1-ttabi@nvidia.com>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SN7PR12MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 734f53f7-fd9f-4ba9-800d-08dea7094fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	GlJk1dTdGU/bjKVHGOvnaGJLqqPzjR6TGgT/CxPSSHYDIzW252EG8yp+kjkmUXZWRBW/a3sAE1i2X+qhuYRuwbMxSDZcisFucoxbQhzfxbKDAkWwa2am4spEFA8AsvnVog8Q1RkuWv9dYiypdR2ebIYLNw4kaV1wQBrsNHbYWGUSCtw2bVnKFHChkB62gZVdbSaXkB3jEhrMdmA71TkzIiHZXHXE9lsmrpe+ZjSjNiRbDhwTSql6BYZWLK6PFR/Yc3sXdYMlhKJFtdNRGvMWGyILfERPIPovA9USobG89ThusF7Q9jayxlL5wWAy/CGBMe11Cye4KyCAgxFhRlBQwYrkwWEh+/LBmHpOMpP/GGczYPwfmKrpxF2sdrmaBynPuL5Y+2xoQJQFUxnNKqBMNqBaUTVJmwi/0Fe5Dwu55jl+4/ddghOQ81edCWdL8CYWEgt4Vz5GxypIlyFFKE5Jsq26eM2F3oTfLIODWlJbNIAptQW+GZKdklg1rBVcGmSgmIQuqw3wcLGESN+GiJ+wFO8gaz+C3VYZAO+mbHjnp77mIhDNUHoosnLNsEIoo05jZXQucIAAcwT2il1rR22+0FDyRA49Y2MOXJkggvtBqy+tu/tNnvo4vIq/zbw+67pd1cp16pO62Q90h/K8oDBZq8hLZB2i+1hyHpwS56Pa5oyknuvDTs54UUBK5dKGhmjOKnG+aAUwi4mYeay0WAJGK7rounbFVZUsTCCpbPhhZIw=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ie0HLvIv7ruxPfQ72mMsErs8ooPnBfjngzb5NFblQp3BMIvgk/vUeUHf8QgWsQco+fTIhWsCA5k+3LcvtHBkA6PCIISSaxrCwmcL+E1njS+YHaQf334bbPKCJnd7Sv9jdYt+iu+GIpvdEfGAEB9ITFfotNLVKsu7zjWjDFavNR1PU7xYJ30sGy+nTYJbG3CFJPkZ8LDoWf3sTLPCMlxZhNsz29ec2iwM01oXBG8M5QILRZBwskXRf2QRoJHLEw6azYjlqp0bz4WyClT8Vi4LO8fYBSaF7FW68A0NW3lEJpoJ1n1Hv6/9TBh7cBij2oj+dNAD3ZZVcjFgq0cdzU1qBHsDnGZRIEBS6KZu8LUdFICnSWji+lPgMMXrjiihLBT4//bqxJxO4LHjdGx+iQmV96wS4qRrXzrGQIcqQjUOkRlRP4CI2yI1yNR4SxNmvA+o
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:16.5198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 734f53f7-fd9f-4ba9-800d-08dea7094fa9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8436
Message-ID-Hash: XGF2AFNCSAN774PP7MKRH3EWP4PEJ3CC
X-Message-ID-Hash: XGF2AFNCSAN774PP7MKRH3EWP4PEJ3CC
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XGF2AFNCSAN774PP7MKRH3EWP4PEJ3CC/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-11-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that Nouveau supports GA100 properly, it should no longer require
the NvEnableUnsupportedChipsets parameter in order to enable it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 5af12037a5b9..ea62dc97f118 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3342,6 +3342,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x166: device->chip = &nv166_chipset; break;
 	case 0x167: device->chip = &nv167_chipset; break;
 	case 0x168: device->chip = &nv168_chipset; break;
+	case 0x170: device->chip = &nv170_chipset; break;
 	case 0x172: device->chip = &nv172_chipset; break;
 	case 0x173: device->chip = &nv173_chipset; break;
 	case 0x174: device->chip = &nv174_chipset; break;
@@ -3361,14 +3362,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
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
-- 
2.54.0

