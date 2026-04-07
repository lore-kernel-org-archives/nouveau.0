Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE747FF5136
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 19:21:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34610E4B6;
	Tue,  7 Apr 2026 19:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fIKGc1IK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7A9E8456D9;
	Tue,  7 Apr 2026 19:10:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775589021;
 b=NN0TVBfeELXXK9mEUV8EtOw87jgelyZQ31WptzP8/AlULv88b5ezh1z0FUIMG/sxgVe6/
 XnVD8WVbUWLhGhXecfYXbct7NTBOhQTCDQpg9KcngCKGCfVujSeAsPW7c+cCVIQrbTDM4c3
 sD94DcGUpY8PZTzohJ1Zsn6rYj/KZpVVM5/7kcy717cWCNW8l8xJyxRg+RwsVif/t7XT69j
 SuVhpklTqsgDpmG61uJV7WjxAK5xkQSIZjoXw2i7/zojc642kl8s8aGSSgkkXbPtlWCWttf
 5WmmN6G6neIv1IsOU+ziSg3vtWooOtCJXeLMBirUjXAf32X2JakI+fTlHSTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775589021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jf/Ex8Euyvfg4NRiSq0TlS4M37OMjexeqfwoDfgvAc8=;
 b=NdxwSn78/YrN1JfKQmyy5n+6q3J6Fj3WWXU74/l7kBKH6pA0Ys+j+NqMvuOOSwWWklp8W
 AGCZU23/pOKzNPbA+Z/7fYwe+v8miytfL7FPKhsoGkVb/zh++UydSqXk5II3MCEquMnjd/U
 901Dr50ekiMy5ncHcBwQYyNwHRlP8OGZ4/EBy88zBO2eXfN5yc5+KeAof3WbiV0/KlmpFBi
 7WI7O/GLICnQQXMJUjo5X41ICdJEDADvGWz6XsdKYAQTZW3BNJ1ss2BmP1+AT+0oGo5e6Fu
 FVWoiTxqbUywQK5Zfqx8BMwJWM80XCNgVmnC4Qy/yC1SZ8YQu1w823495DWg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 83FA045642
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:10:18 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72BEC10E4B5
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 19:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMMKOZF4Ez/zz+WZDYOL6sSp+1O+W2mUy3uYaZBwfXMfi3VYerf8kzD37TjqIPKfJEkB6UW35d468P2tTIetTtnVdC7aUEpZ6VtVf8j7y6G4QxcYSBeDvmJClv0T7F2Qi9ehj7fBQmRDeMBKGOjTZTVNzRd2w9RzkzRe5r4BnxmilGi5MAJVDtsOFZSxUvW/Y5Z7m3N3S6mlrVPZwSpNdS7Osu98bNYC4GHTM/CEEQWQkwEUxn+lq2dwcjx/Q538BwrJiMm5+fHS2ssdIq/NxlGhvRMGeoNHH83yGAIzAHD0fUhzscc2HYSKVefYaVYz/Dj79hr1IbaW9n8FdCRdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf/Ex8Euyvfg4NRiSq0TlS4M37OMjexeqfwoDfgvAc8=;
 b=MzRfVnWWW+gq1g+GXcKhPUhPiaNHVfxIPIDNityq3yRyj3SdZICjmX/2d8Gr7UVOekiyQiUTS7MifZa8kAXbrCO0tz9s3rKF6ku41I6ctaba8P3dKcOGpM/F3o25DGw8ls19sXIpor5GLa/FDNc48IsozPDqRdPQSDMMZYsZAqZZn1w3PhSkxuT7sSX9yWKoF4nwLtWNZB192EyTyMxq1lidGYim08e3X9uu+YShQmGN4IBCbmHIPBVQVBINFmTNXEI0hoaVzSmolCYRjd7Q9R5CgSTuAHCqBP00S6wfkHFXuHTYTAw2cqDJ2HWt0R78Ye7pLZv2cQKeNXLphJcCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf/Ex8Euyvfg4NRiSq0TlS4M37OMjexeqfwoDfgvAc8=;
 b=fIKGc1IKKFTjeS+QgELQMrL6wHLEK1C/flf+H4Me308RtNYHtoZx0yCwV/lkhjttI8H7BHegjYH/fJH859MTYL+YA/P5aw7hX1/PfCB8I5Ub+h8ger1jCBDlx8Jlaow20nfjil0lxHyLeFgANkplufs6lXJkIQhXLWVa9tEcCJzeTkwOXRRz4RTJGK+RQ532rUs131ZHN0fJt+WPljbeEwS2mGpwVnCbPJWKMnaDNQPYXj1Rqr1QpqPadgu45MtedQQp+k/fLtfOh+lbkVEZHgWYHfYG6nCaXT1trBc3YpPtTZVfkpQ9jVeXe3kFuWFzjPZYyuUmJpOiwnlWAzmwnQ==
Received: from DSSP220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::8) by
 CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Tue, 7 Apr 2026 19:21:49 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::37) by DSSP220CA0013.outlook.office365.com
 (2603:10b6:8:3d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.31 via Frontend Transport; Tue,
 7 Apr 2026 19:21:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 19:21:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:33 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 12:21:32 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/nouveau: parse the VBIOS on GA100
Date: Tue, 7 Apr 2026 14:21:21 -0500
Message-ID: <20260407192122.3055293-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9e0598-3b63-409f-64c7-08de94daeaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	p8R08EOmMclRMGDnaEGN8TLDHdENUsP2I/pLZFj8+3Lf+lM7wbSFezY3K8/5gVgXzX7eWOipfnGQ8ZvtHpxPjrpLQxID1qqdQQcIq4fFJQXQrYXl0L6Z8r5GbbQUoBmOz6oH63u3YmdV2ogdVk57YwvkF/EbskMQsfS8ORDg4bqti9/issTY0U1jEPLMd6o5Rfhs/35QeJb38x5x+4osfx/IuWzGijs2+aVbyFHzHWT1q29JI0pb2+dVjWQMCncUALGfQXmcCJR0JAIJ6rEXYtbq5e3GtMWbuchYsdhebdVf8iJN+qF+j9v3Bbeslihah2T74dYOdfn29oz+eDyP4TQ+PsRTXc7NpLBl2xg+Drmk5lcrA0fOvK1krt8TXJiTNiLn1NpQ6shUxXG1SHY7TAwOo2NJeieFzoRqDwoBCIFmBUfPPQLDFfmmbgerBn4p4+dm7mnHlx0ewgbxZR1HSLW5jNb7iO2cfEmWkXlzaUtdE4yZ4LwPhmr/xKbjt0TPSxLx65GMZk3NHk2DpdaiX93gUmkgIwZsMv1lATYxNfo3WdZR1orGut08Cbjoh7dkIPthaja6TrJkAcrXSCTaivyCUUmwdJo8gjeIUWn7xlwpCKpzFjsPuswilxrPUaJSgQqLYA2VfitpFldk0DZN7FrbZDcOqtW3/1LCkqLrPm7G6aP1+IWgWhROv/FLIANguR4W1Athh0RSwn37oxBLxHADwchxTRdNHOnJEe+1YsDchT3E4kcP0yOuVhP4VbvRJQwdPS5vmuC15mljJHADoA==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SmL7uXVeoYzEYbeFTmnIZ6yP0nEKyAZIix0T7rxOzFj/Ve9TLbAj9r4+4QiD+T/RBSR6Bupq02920AUxfp+h+LLfuvzDJS3T9XxentWq4dzOIpm6OoTAJdKTKYLHCiVGr+IXW1pg0MZGIrsrOSaoBypy7WmofdvvXj+Wspilzd3WHc+nv+zCOAacbxKJsD24vsAeDGs06NZPIDg53Rj6EYFIdk0Ug64TvS8F4oLK92+ub9mFhQBW42R7JJ4V6lFR5eqoXNXPwSrYGTqNOT6CS442oMef+v5pcSywdCu+3+Kuk6xXRYL+BmhxzGPeOqRbO8biwdYwtP3FsG0WOzj4UZKtxLozcd7+1Y2qQgoLQoJ6iuDxL0joDsflT2HVIsXNa92dnDi8KfPRl03oqlcrkjmZXuS9OQU9lMUL+OuGtFKZP11Q1LzgCpOqLXs2Vrl3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:21:49.7702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b9e0598-3b63-409f-64c7-08de94daeaf5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
Message-ID-Hash: 7AJ676R2DFPAXVQPATUCD6MWETOVRPBY
X-Message-ID-Hash: 7AJ676R2DFPAXVQPATUCD6MWETOVRPBY
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7AJ676R2DFPAXVQPATUCD6MWETOVRPBY/>
Archived-At: 
 <https://lore.freedesktop.org/20260407192122.3055293-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that the IFR header is properly parsed on systems that expose it,
re-enable VBIOS parsing on GA100.

The previous commit that disabled it [1] incorrectly stated that there
is no VBIOS on GA100.

[1] Commit 20e0c197802c ("drm/nouveau/gsp: add support for GA100")

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 72848ed80df7..9c0b58f57922 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2513,6 +2513,7 @@ static const struct nvkm_device_chip
 nv170_chipset = {
 	.name = "GA100",
 	.bar      = { 0x00000001, tu102_bar_new },
+	.bios	  = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
 	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga100_fb_new },
-- 
2.53.0

