Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D1FF5136
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:21:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABE510E4AD;
	Tue,  7 Apr 2026 19:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bQDqfaXe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1D310456D5;
	Tue,  7 Apr 2026 19:10:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589016;
 b=fiomv33Qchl1pQhw5Ydm2/g6Ws0ugAtlaQHqwpl0+D4Pix4+FbjByALyGynMPqFI82nRu
 SRJoj3/ClxgI2uvS6ocET6I5jEBZehePhyAoqU5xKgL8IER00pa2QkOTJXT08PTaz0B6qdX
 4jnoxkbcwL+GKJFNppej/BeD0gAOSMKCUDcI3GpUsAgY9jugt+aRTeLU/DntZh9W4vCcTl6
 Im74/pHlwp9Id5USIqrn8dK7zp03zYKnfnrPoRsSh+Nlkuf3bmf19rK5FzTMzId+YJaWgj7
 mEYw5DLi0dzVgREdcnmUm/DBZym0dJJDuquHMxhrE7AaJ9fT1G6mPEXWiujw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589016; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xq3rzl3h/hq4wL4rAABY8jbSao0C1Zj/XXzofMXe2bM=;
 b=GOWWQoNRLBRKGe1RlTnxY2zQbJjI3XgAvZbCkM3KnwTOzIwecFZBbRtsVPzL4MCnY130i
 YKE3tXtdEHkaJKfZTEDGEgUSTdunHZGIy9VExIYyS/f589SbIiMIDTkcQgt6uLAfvI0tmT/
 /5mqE0n3+EsoquhwRRjRHETK44zfSPzkrWbi3n6/glgOBckMPR8imJcEWYT8i8yg5XbS/3X
 pZy/PChVJoQZxLL/L5M1A/KmpvNjIkT4c/DABdpqQZPgBZ02pJSsv2G/NvYYNcHO7mrmjPt
 uNHKL2qUS/VKEN5+1sWElwwtfPHC0zgrLhOyFCfkFjYqxPOXez1e2GA/Xg4g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A45145642
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:14 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4624910E4A7
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aep1HUuAyiTrBuIxIAqmYP4A7DQf5gjbf9YMtOH08tnQrLhm7/PQM9E2nYzhwQUlpzMl+WGZ6R7rlduVfiAejqNNhtZGWMb5GG0qGhHExeO68GcvlYBQiuyYSAhohBs9IzaUizNNiOoP6fpTACwtposz005xOdNfr+uklZlnV9RnFd6wxyuKY/ay3LlrM+YPOZCKeDcjnH32n07MA8yf2dFb/2KD5lWxKbTV+BO19pf7E3fxCXUiz0N6WeMlFle91oHmxQ5eLFW8K9/ZbAzQahCPkQbK8fOfqrixTfyzeOHQLwF4G42Cw1dEWgKddLd4kUV2Lonc77WtFR1cYDr6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq3rzl3h/hq4wL4rAABY8jbSao0C1Zj/XXzofMXe2bM=;
 b=qmbTBkqkQrfdNcouHmvfhFSn2qOK+mCiQSyiBhRdmfr1I7JokSqthU1mQU2sJz+tlI6Afx4wt6w6uWj0T6VDe5C6upGxceHUd2TJbMo3weD4aTPG/9iyuXx61MyiRHbgGnbygnVGkb9kkAnBP8kp+yAz6GtQkpRZxskfVmRUtKv5ImV4UR0yTlH0s6y+QcUhoDENolPskMb72qoUMA6uJPPyFELoDkJKzlfAclq2LCmq6BhHyktSTUJo/exFwLTUgK36eTrR+yVhVw0Ac7w7F5dQApH73U6+BjQPm0xZivvXuhT4N2eIdxaGHNhkSEql7bahAbS6eXaNk0FQYtMBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq3rzl3h/hq4wL4rAABY8jbSao0C1Zj/XXzofMXe2bM=;
 b=bQDqfaXeLoQBzEYE79gQlwNNtO0br/LyDexb6NUmlm+XyOfnUWXFbeiP9dOKjWLxNmK7XLvZD5Rfg2KlACn0bCNAsnzhJCUdhyltUaVAdqab7/8ZjLEwvpN5UfNP5f9a1KjJcCGegUhjHh4q0ZX/NwYZ1b4eBiY/fFOnTt1rpkikgFqSKUoZcAj2hoAS2OaCNgsWWI5DXV8LSG6oFdBtd/FIK06efun0sDjt1gxgcMwDpEq5SDA/j86cepCr2k8m3FWv11LtAMFHS+YmGNxw/srTx0gGX+k9LyxUZ6RDpTXoDcn8frVeMQnjfiNY7r3HkXusQWlJPHW4zU7vdrA0fQ==
Received: from CH2PR17CA0018.namprd17.prod.outlook.com (2603:10b6:610:53::28)
 by LV2PR12MB6016.namprd12.prod.outlook.com (2603:10b6:408:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 19:21:44 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::da) by CH2PR17CA0018.outlook.office365.com
 (2603:10b6:610:53::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 19:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 19:21:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:29 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 0/6] drm/nouveau: fix GA100 issues
Date: Tue, 7 Apr 2026 14:21:16 -0500
Message-ID: <20260407192122.3055293-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|LV2PR12MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 569d9ef2-edc3-46f0-e837-08de94dae7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	/tqzHJAWtvlKTA86ddeM4F0Vc0rxmk/km8chp9ZPcawGFcPpz7UxoytBqFvu1FKbEzgdYaUcQx8LtBvcd17WwGYzuKqT3PH17U4cW3atA/dATtthapWT0c349DkIN7XNYqZNgS7DowHYJhNFGq/u1CW8ElgDwRUR71Mq5QcCBz2y8x7JMCje7kd0M8kDaMxB3mRBRDinsXBxonK6ZkcoVb/Yxrr2v+K71eyED9+1q46CjrhBO9VotE2ImrfyJjnSlswL5UqOz5yywdhIvodrZvoxv4IU6PkJmWamAbo3k/lPUNDiLBgw/YurQTpCUKAqvs3sMQIr3liAfPb+INqFJ3X2hVPhhq1CmwW1dZhRSi/l9eKnqRhq7GmXHNVCoTOq0mLEnldciJmzAY65o3w/S/5HOuBeWaW9awaQlJZ3HDpEQEkcdBgCl1eRi5mHr7wWE0MCqo3fuO3yXcRJi3rnCXTczByTGMotbkjKEiFjQD71w7T17gBhfsU5JYRoo5u8T4PteSs8dHXMpgDFenRLM0QwfC38LovEjh37jL7u0EXbHUZPNCKmQpT5YKvgc71ez65yF6/wMRUGXXrW+xdqIvxV0WzUN5wvqSCWI3ydf1FVK2lt5aFqrdoiNrGBBj/Sswe7DTFr2vaGyygtryxLWjXa/CILoFL5aeUDsSYyEd1aoGme+AusLQBK5fdA+s540Q3kFMCSRrWkWn6ND9huKHjF/0EfKvea4BceLe0zpGXXY2xIOcYuNNn8xCDWBibD5KTnPIQwsBXTHSJ5jrU7QQ==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	remVPeQNxJAMbd/i3NR2hRjbZw0BkSab78mHS96Y5lJWkJ2/2G58983ZG1uLsOUZy1cU5rGK4wHT7wnzywpVPFS16qfRVghCXA4ZG8DqjQ6ah1SBlRrJgeYcSLSGAW6amrIuWsu0I5GSxNg7khyLPSXcqdzlqggQQm5z7VyIy3Ux6RroALMRaJFmTdPmedQ21PWQdYbO2eKJwYO9/uPCRlFBRRmzEgOsVM0oYWgnraG9G0W5oecoAh2KLmOnhqbnBJPgkXVFC73OLPQB+c1OSl1td6j61fwVBxQbOaZaJxhwP0+d/nDqAIsrgJaCWGPcPc+GCML17NYmhTGCtagPonIm54p2PC8mocdM/m5vHsxkhrY2Pm9jS9XmjNheT9ZmKi6YWNC1Gn/T9AR2nmJ2OA9sxD1+QZUnoWMg65PGS+QCo54mEViSEFjNa3wAHBT0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:44.2350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 569d9ef2-edc3-46f0-e837-08de94dae7ab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6016
Message-ID-Hash: QSWGYRKBVUBN24I7OJXHU3JSI7JS6K6L
X-Message-ID-Hash: QSWGYRKBVUBN24I7OJXHU3JSI7JS6K6L
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QSWGYRKBVUBN24I7OJXHU3JSI7JS6K6L/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-1-ttabi@nvidia.com/>
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

Timur Tabi (6):
  drm/nouveau: check for GA100 specifically when calculating FRTS size
  drm/nouveau/bios: specify correct display fuse register for Ampere and
    Ada
  drm/nouveau/bios: skip the IFR header if present
  drm/nouveau/gsp: require GSP-RM for GA100 support
  drm/nouveau: parse the VBIOS on GA100
  drm/nouveau/gsp: enable FWSEC-SB on GA100

 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   1 +
 .../nouveau/nvkm/subdev/bios/shadowramin.c    |   3 +-
 .../drm/nouveau/nvkm/subdev/bios/shadowrom.c  | 110 ++++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  10 +-
 5 files changed, 112 insertions(+), 16 deletions(-)


base-commit: dc2d30e7db8321a6696d266838f7af7e9d1c7155
-- 
2.53.0

