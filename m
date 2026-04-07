Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2CEFF5136
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:22:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2757B10E4B7;
	Tue,  7 Apr 2026 19:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VbtRJnqm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 072C4456DC;
	Tue,  7 Apr 2026 19:10:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589026;
 b=GDcntA+/1JhchPUfNFn9ZruNwClNA9Hu7h6vg4Sl5CoxMy0RHlH31JYYNwFyMHpnA0USQ
 Ok9BXGtSX419q8ZtU0GF07vLtdh+tcdg1DV8GFl8eKOZ1YY1nIPkNLpzf595dC8UKZBh6DF
 w8is7UEKbRy6lUPOSoypX98mRKxBCpIcbnScx8XVd4uzJEgVAsiRxawnjZ8Pl5Yh7217WeY
 i7svDqulKZcExzn20oh1o+iOLlBlEOJZMpR/VJolYw2+K3m6YJpPcdoRZXqpUV2UFaLdrWx
 XNeyp8wVgzPkr4y9e8NYYsJ0dhTvP5vDKO8vn2k8Cbnz7Ru4QWc2VeD6RLhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589026; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9avGynk2KB3HDjobCYbzDYEUcZJltidkXAZaUoj6yqQ=;
 b=LCCHkjnGSfInb4e29FxhCKP6zUpKiH2F6UtmEkAf403NAz0asu21Hh9gvCW3TvoiEHIuo
 K+5jUY4+vLnGxb6MIAIHkVnwokMVlS+cTk8TUiaGaCYcEho/04qOCNdb4mP1S7U3BJ6LoAa
 iai39TytAxba99BexI2mTqe9vN47vWaZvS1R6RMwCVT8xKFiMTviwcnkuO8Bk30uE++baCD
 vGBaus2oITnB1ftAjlfXCuAxJSxPYFVkSaRttT6E6kw2wF3thmzslmC2uByhXCg70REkdIk
 WMtPFbn2uO7KQ6Gy+ipOzUO0vB+S7K7ywK9sk1bYNp4vZsGIHzM/eEK+TT4w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 95454456BE
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:24 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7010E4B4
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfE1FFrbZmPqGhsyfBkGozL/8Wt+dN0XSoqDZSb+rN50EDl5+OXJfHtHvBUghlfDfK+rbxuFH8U4Z4vtZjuT0edZWLNdzGCxzl8IZUkXKKyxELhCpvyuHcxemQPXy2U5Fu0H+ywQ8ei2nTAQhdmJuXL4M+dPw43+kUYoPG2NQNSQtwVqsoK/8fgSCrjDps6K0N3iGAzBhw/NIjxVFnsrh6L+aNCEi7RSrw/4uZxNXzDK/wNQdFbltdwD6SLoxBJjiG5S3qp5ObdkDBtylJ3H5X0SQx+BvP5j2GzIFl3YVjzFW/MkA1GgiC7m+zL+ri/1kzIfJt1PISpxmBXrs6uxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9avGynk2KB3HDjobCYbzDYEUcZJltidkXAZaUoj6yqQ=;
 b=YDSelh2uwEuq0OWeCj6fNudGDahIoCqpex0G/BkecY9S3kwkmO8G3A3I11Dt70cBuHsmQ0BTESPmyIVhpg9/NaYpVs28b2L/A/9NonGBuNSap80mjt9z1/eYdqK6a0JlRK7l30FMoFkQd1DqLm5RZqdADXtCpXSurYDMM9/e8phtB5F/mguUHdgboyliHHyVFUCjy7vD2ARj++LREOcan2nDJ7XiE6sILf/DxGJWWfF3x40Zrh1qZisuaItQbDrvNYkhOo+kSW2sefBS8RwoYHU6JiHIga6ONIteqzn/0TUq/YBHaDBwpLxUDILXJqre2P9ci7TcmASiSHFqTZrSxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9avGynk2KB3HDjobCYbzDYEUcZJltidkXAZaUoj6yqQ=;
 b=VbtRJnqmLERdXfHJg1Uxi0q0JdtQ45kDZTGtLABwtTrx197N8ngwtCBGU660eEXdGrie0gQXygDOty7SX4j45Re15ga9Gc6HxDwIG7Q7o7nOj6DD1suBnR01s4EPLjShKxwrB6a032X6x7RuCrD/xh5LQv0uuYm9cN1Fvr2+jFMx+VD/sq1nb/xfkzQh6ou1kUqddHTTkYqacKwKLK23ned8k4fd8ppwRQZtoXeABsxfdEIXfheWmKGNQxLEcJO/izka78HekZBetqbe3IRlTTns6p1R/bKyU3A2lxV22rUAnpF/BAT8MGAlRtkKWhZzCl1ff86404KNuDWettOa3g==
Received: from CH2PR04CA0012.namprd04.prod.outlook.com (2603:10b6:610:52::22)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 19:21:51 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::74) by CH2PR04CA0012.outlook.office365.com
 (2603:10b6:610:52::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 19:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 19:21:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:33 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:33 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/nouveau/gsp: enable FWSEC-SB on GA100
Date: Tue, 7 Apr 2026 14:21:22 -0500
Message-ID: <20260407192122.3055293-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7dd87d-aa7d-4a73-9263-08de94daebfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5dMVogkFryxbOfqem/IFsUBYTCxBiWK1T0qYujnVAROuuXpxkB+lGi0L4JKb1NBz/w7cZAbFbvGDUVaJO908SYj+sMJV1LbNY1ZeLwg4m5RySpITzuPpNLRdfUn0/Xlvz0yULZpqoqQl1LH9GcR7FfTNrmBcxBwVBvY72bqN6Vbc/LtC5MHfpD0A/Wr8ZVzieZQwS64QYIl23dXuEKGQHXhlEoHY+4s/pwqTRtAbL6S9Z0Qn8jVEr6S6SoHqyghhHympfa+KaXchRIBb2KswAic3xyJraVN4MDxqvUoLHMyjzcxboLbi01fjFjfEgkCQ1xa8vjCbaWB4RncpGRCbn1d2lxU1g+agOyc8K7mytSwscKGPA39cPaF4zzsfS8Hb5vMmuvkRYzon4jp0TsHQ2vINiXequf+3ZqGLKQFyWbL3OlMs5nME8gFTmyIXMayraINhD6JzsJ+LHxn/e79esjIsYbYglCo66Z/13zXWKik+mmdL62b6jfSSSWQrpcp0HRGWSpHIimV7pcoo7Yvio5hw5AXrDkFDOe8TP8ii/DBbHy50pIHfCJMxKyuVT2dz1l3oGXtbY6Y1VQaRwyoUUZ1Q8IVPRTzTN+JPNco3kLy/DbBEms64KfgnMVLb5Eo8Uy7BqR6y5mmInUR7W6+DJE6LrM4ieOsv827OHak2h2E+CRiVwne1cWCpxgblmdjBjclqxvJpqiwOcDpJyByKrb6bbudK4hhCScuiaHGLt76IXk/VNgEkV57M6v4jQJLaNBNBIrELFjEaf8/OjlT6Nw==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gH+h+QLg51/kyrYZGvorZh6FOZQfx8rGBiXXrl8SLcd1dIVpZMwhGnhrz0xWWUbsH9/rQ39dm57achV8BLwapepl3iHWmt/XpSCCK/y8xHlE/Hyc/wGYSrm4nIX+zH5TK22QD9QSL4IQa+GMeBBckuPwTS5GiKSkVOUJlCSAmcIiYkheZsG66einIRJXtiFUFAibiEj50uIn53iYx+NSh8ZUFsqPCUjysPS0RSuVAt1lr09AOojztlRN0z2skbNlC6n3+Cnb8IHaUDhg+myiwm4w060MaT3oSckyomjpKTO4uHCRzfh1Sa2KPfOvdS8na3Da0Xqx+FkJWB3SffMxuI5HEYOd0f4Oo6dZ99Yf28Tk1WsKWH1EBIuhYRdDvzw56bMFJK0U5r4w1qmkcDlFJAw4AXDHaHEdhDsLb/mPJaocthx9IFK3JTtpSxls69nb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:51.4672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0d7dd87d-aa7d-4a73-9263-08de94daebfd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
Message-ID-Hash: NHKQPWNHQRSPKO3I7OLPSGB7N2YHMCC4
X-Message-ID-Hash: NHKQPWNHQRSPKO3I7OLPSGB7N2YHMCC4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NHKQPWNHQRSPKO3I7OLPSGB7N2YHMCC4/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that the VBIOS is correctly parsed on GA100 (via IFR header
support in the PROM shadow method), re-enable the FWSEC function
pointers that were removed in commit 20e0c197802c ("drm/nouveau/gsp:
add support for GA100").

FWSEC-SB is constructed during GSP-RM boot by parsing the FWSEC ucode
from the VBIOS, and is executed during teardown to restore PreOsApps.
Without these pointers, driver unload or suspend triggers a NULL
pointer dereference when tu102_gsp_fini() attempts to run FWSEC-SB
with an uninitialized firmware struct.

This requires the acr/bl.bin firmware (the generic falcon bootloader)
to be available for GA100, which is the same binary used by Turing.
A symlink for this file was recently added to the linux-firmware
repository, so an updated linux-firmware package is required.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index cc57de99e59e..d953f913f949 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -41,10 +41,13 @@ ga100_gsp_flcn = {
 static const struct nvkm_gsp_func
 ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
+	.fwsec = &tu102_gsp_fwsec,
 
 	.sig_section = ".fwsignature_ga100",
 
 	.booter.ctor = tu102_gsp_booter_ctor,
+	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
+	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-- 
2.53.0

