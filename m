Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E3FFF5135
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD1E10E4C5;
	Tue,  7 Apr 2026 19:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qlz9MNsr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 491E5456DC;
	Tue,  7 Apr 2026 19:10:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589027;
 b=PMf3YcrrgzjKYQoSc/A5yw33R6eKgiqk1QVuobEK6zBceaooHfClZDKPoEOMBz3V/iCZR
 T4X1KD2e1Hj3v4FiPgwW5abdaKgjFXpUznj01+mTUFU7sztH18FLYUUohP/MTv88Vqdo3NR
 yY+Kmk3m4UxnbN/+sjkJhwQVnARWUZdxG0IERGGuW0wD0qEMOY20d+0yDnhdKfHj2ec3BxT
 OsP/8jcp6citsW5qU10AU+hS/AFJfBuAOsSp68ffNxwxeJuKPLoI05lSnb6hK2wn5lzFq6y
 LnRJiNvKwwt8N8oif5HzQM6MODSbWTWY0U2tQ48P72jZEBuTrtu7P6I2Pu/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589027; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QCz5T53HM36X2FmPnMxGKtcR2vtwanm9voTneW/8BzU=;
 b=XtIHvIrkA7A5QNV8KbElleBQZmdJyfolQ5FT4CCaN/GC4QgcJ9IO0Q6ByngdFaRrc7tlA
 tjZS3qz7XOowBBSdmzWQi6KIsvntWEGLKdKdT8OthvpaSg7sks7ttVTCO3P9eaV04OKt8Yh
 6W2Ta+PkspVw7hWVZg5uskkcKRf0p0a2kfiyYDYKrIlGReyTU/ni0gjvY+gOzZVDdqNw3KQ
 Oooxg2WwKP1WWcesZuycsEn8nDZj98j/N71ZOsFZNYX/X5of+nzzZADc0fXdX9TLdyvAxW1
 cOMZJcVp9jGYjqCHV1ffylvsBTM2sRdYJGy8r0G9CfSiAMlBP/l9PUFKR0Ww==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B56A7456BE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:24 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B11210E4C4
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBPTJno2W6hXvTQqFaxDIP5GqFLWtfK2kzoJ2sbQInkK2u+pCIjznUGN/1eBA5KbitL2LHa0yZg/iyT8uYokThhNAgLpXzn+nfkiSzPmI7Lqs9BO4hTkaJ/6vxWtgu1O45xh8MQKKoxXQLUcwulmZie6Thl9zVrshnCUpe4W7cMGNl9jjKbjUhsZHT3tgA1Ksl1EXSeJMP0cZIXcLLeOUswncACkfvqs/J0otJ9SGRiAzHshZ3aAG4HNP1u1ZVtL0EQC0RjOXIYAbNeK0akHysDIVubkSA5l3Wj1reN2PhOzYchFAxcj3wox9FGNDvhQ35qReDvSyzWiOn4p/KAGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCz5T53HM36X2FmPnMxGKtcR2vtwanm9voTneW/8BzU=;
 b=VD666F5XlDTwoaWkq1ycCOUVoSd4HmmtLojljiaDxP8dHQ1e+Mpf2loZ/WcV1nagA9FUuLNNnj0Rg1IRfPIf6L+DhBlg3bbwmTWoWt9LxdFeAy8KJ0qW5nXjSgR1Em61JBp9iBxr5YHPUh0evHJDVK4Ew54kbHVrUzUIwUm7pQN0BU29R0pnSbWz9M9fZRDZndRc/kJ2PpWhHBWmeGHpKnhK0BGAKc1x9Buj9APb7w/daUKiJpaU5iEyKGGKfdlTOWvk8jWoONIDRCImA6ZcVYWp+js0ZcwiOwjvUiGoxIg4SYUwGyg+RDieUWETKlHIkyWxMVYmQp7RhgoaoyxjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCz5T53HM36X2FmPnMxGKtcR2vtwanm9voTneW/8BzU=;
 b=qlz9MNsr9sCCqpeKLl2/AArCeQ0Wk5rSP7LYVbNcrTM4VOVVE9Ud6vRkprUSg0+VSx6k81eTP+zc/QyOjIPTz81aJaaiUmuMoPYAOcsyNsNugFJ2WKSEIrA+s6NjWRAtmDzzK4pVNjkPObr0FiLlTfTJE11elhG4dCz2wcXBGVnwq1IwqmVVr3KGb3W4OQW4PWwUrJLCg+TPQjjtlb97n/+jWyIruAHmny4jjI8DTdZuJLlp9L5fLWz0kp/xwj7YeJSnw7/Ex2LDiZM4qmuRlywEpmXzEBl5Lkpob7PEw5A7yIHlsRf4ZWa6zTFVJbxLWgL2MUYkNZC8Ebfu0eCQbg==
Received: from MN2PR05CA0037.namprd05.prod.outlook.com (2603:10b6:208:236::6)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 19:21:54 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::76) by MN2PR05CA0037.outlook.office365.com
 (2603:10b6:208:236::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 19:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Tue, 7 Apr 2026 19:21:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:31 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/nouveau/bios: specify correct display fuse register
 for Ampere and Ada
Date: Tue, 7 Apr 2026 14:21:18 -0500
Message-ID: <20260407192122.3055293-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c79f35a-d27c-4800-96f0-08de94daecf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ZA88k/9MwIHjV6CET4N2l4ICoR06Q0ww9IvsuR6lVabixFECL5PH+bpxZitYnjIlVCywrkrBMlVoe2wMj3fehNtJrJOOZJw43GGKN7zBi91H19gE+NECCgWw2CoPestNfwOqX3MhuvYXPnWg25n6sHSVmf+uY/PYkju7g6kTCqA8sJv2Wg2KsEl2U1btuGI6IRsz1xDOzj2HtH1lBOdkYaXy9PtwQttG8vJWRNdp16m8ItbJujTH7JFa4grOLFT9r4jKNw2i82aSxwimawzUramzJvUEo+AP2yn7i5MohOqltYSKJuL44BXX2455mpPiNvbVcjcZfapbuLlacQG1jPeZmMBvof7DliVwIRv/vOzDJvNZxzmulhm6UsKh64F5wmGfpl5PLwLFpS8BSmgrdBwcSvk28gYldTkiS/VxkP/I4YMc2vNh97bb86cReKjb0/Q6AfOTicB7l9B/5PRyFRMYZwH19tGZxsJiD/Fumv+o1l4a3O71uB+FLvhjKPaJ/3FSa4kDEKGZ12V8HQHkwipmmoeEyD9Trk+wBX1qPMPzQRiydeU0e1S6LSIi/VbQ2SeWAO8Kz8b8DbZRT5yQJpK/SyzhoRt3XsIjtwmtqwM/dplP83eCWWTzBQFMorLWXrwmNHDXy6SMo7k+F9sKtlz6w0gb6lqVe5mzXV4Vc+T7Ryk0LyJzOELCMzlcllDl4mNToAP9ETUEIuOXXNNg43zdhwr11d5M84YHxz9jmyB3JF0NWLYirJrTaK1MpKCzcDdPFpIZY3j0O1iZYn5bNg==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vj36QRDtj1cMuLEejv+ktDaDm8x10OkVGcSStJLq/VWCZ8uQ+mWsFpyIX8Nd4BlmroqHc1BA7pi07HA8WtxQeDyo38cuqbU/DBQFU5GodbG11zJUBk0tmu+oMXYHHr62XYFyGqJ+oQe3EbaWkaRzLZ9/8+PK3QKre/RJA7LiC8VdhcMXruxW0LPKZ4jK+/5JocU7VSe/AJsLCfZ8LR8VD89wT2mG1+zhElW8Xr8NNmV5+fKcmVfgjEWlrf0KtAwlGJ2hUIV3sFPCAnLo8vDPJXXjld0cK5MqQFAojv5TwJWToh3repTepRHEbSIflUPZerTAt0ulS/8W5RkKQ7M+kPPFH2FL+GP8v3+2Bv3oN5rCKYlATtME+ph7/LvhVeRxlFcNbIZ3hYJWwIKQKB0botQWqClOxkxAH/AJaCMYVDJ6gd8ksi8k5YAJ1olTPagN
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:53.0407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c79f35a-d27c-4800-96f0-08de94daecf1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
Message-ID-Hash: 2SCVWUDTTKHVLMAWRW3TS5MVE4DU2C4T
X-Message-ID-Hash: 2SCVWUDTTKHVLMAWRW3TS5MVE4DU2C4T
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2SCVWUDTTKHVLMAWRW3TS5MVE4DU2C4T/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The NV_FUSE_STATUS_OPT_DISPLAY register is used to determine whether
the GPU has display hardware.  The current code that normally reads
this register is instead hard-coded to check for GA100 vs later GPUs.
Since this function is called only on pre-Hopper GPUs, and this
if-statement applies only to GA100 and later, the check works
because GA100 is the only non-display Ampere and Ada GPU.

However, there actually is a register that can be read, so we should
use it.

Fixes: a34632482f1e ("drm/nouveau/bios/ga10[024]: initial support")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
index d5411d176e3a..0d9e6cdd6119 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowramin.c
@@ -65,13 +65,14 @@ pramin_init(struct nvkm_bios *bios, const char *name)
 
 	/* we can't get the bios image pointer without PDISP */
 	if (device->card_type >= GA100)
-		addr = device->chipset == 0x170; /*XXX: find the fuse reg for this */
+		addr = nvkm_rd32(device, 0x820c04);
 	else
 	if (device->card_type >= GM100)
 		addr = nvkm_rd32(device, 0x021c04);
 	else
 	if (device->card_type >= NV_C0)
 		addr = nvkm_rd32(device, 0x022500);
+
 	if (addr & 0x00000001) {
 		nvkm_debug(subdev, "... display disabled\n");
 		return ERR_PTR(-ENODEV);
-- 
2.53.0

