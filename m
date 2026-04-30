Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0474ECD13D3
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 22:39:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE2810F4C3;
	Thu, 30 Apr 2026 22:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c4yrTeyt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0494345D7A;
	Thu, 30 Apr 2026 22:26:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777588017;
 b=sUEDgV5kPQWCxEbO3S0FJuJBaYZFojX6XIkZCLuYGLzq51cE8i8qvj4UaUeK/dPpL/1qm
 dt1DA+ACcoGFp0llhGUn8uz2k85DmRvQHYeLdT0JjuMEcnpYNLv2+RIdIHkwSqeivXvAQ3a
 H8DLVuI9SPPqizCpwlciMnO3phqn63NKLEZtek8CFrQZnvaVn3MXviWqSkMXYKix3PTeO1g
 6Yp5Swtyw7u4p7L2tEKq1ABivZIYDIhNn3i9JP9GUlX7vvS/b3YbYsv0racE9nSxSX6RvFK
 kA659rcUehToGTBd55pDd7ato3qrEGhvJkAr86/2xHSinXHexS3rgyykHREA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777588017; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eZm2kJm8TjhGGMrZ2CFQ4Zrl0tSd0cXkkuEx2Y4yNnw=;
 b=cMljvvQ46Ik7vtpEQTsiMQTbgPWDbNzSb/cZuoHpM14BBMTBL2hvybW8l5pHSlgUrFhMv
 xZ4WO1i4SSAGlVJE+wJGHdrPXQAx0I+PktKyXo8bb51HT8zHk/Vzo4FU9Fhw8modrGnbMRE
 owzLwAYEt3vWi3pvofvrLr3Wv2bxH2T1KrEsddiZEXVRrEREeHX68i3qGGL4kaWtOv96k84
 MHBPWfVGIGJAPten1+KSQN9ZaYWrzweokLBUPIHaBYj5RPKKvDsBvx/M6uLfIavUAfumhS5
 xLF9BrX1iup6yRCDnNaMGH6sPBtDOzmGJv5Oc4vj639/22Ysy9FwjyxFJE4w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DB05A45D6C
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:26:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 313C910E4AA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abk16dAqohRbznoswGpEeVXhTrB9VofQ9R+IJ3RGYJa4XcXHUrG1hG1up/G04MF0YZi2Q/6iOls2nnuikUBQ/4GaVv90tvm+dr6ZpGRJMEklHwMMzY0dU+51Weu/pyzg9JjxEZ4B8WnXNcVeg8XMlsDU7fGDHAgLrx+46IDcWQ6xiMgGZZ5IZHNXMz31AOReFHmo3GjN3JC4r7cS355RuICWKTMtU7z40+BRMN6EiGvdV9KsllKAatFFXJtcLbwopUkfv8C7xFShKoMrFxE45TVL7kupEHTZr7e9bv7kQsiGzraKhjrNZac7A6cYDQ3xnpcH6d5gl0iXe3qMNDKlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZm2kJm8TjhGGMrZ2CFQ4Zrl0tSd0cXkkuEx2Y4yNnw=;
 b=qFJiEtYMPgbSWMHrwUuMZ6JheVsv9vycWErppzqtX71uIte43xTBLvRf/xClRu/8B1VmPEATcPHNpVN88SuXG7+eL1z4AnxYHubZN0VR11NXkS+N1XCsrDfMPxycTSOeGYDK5/fMpItHN62uS+f4tMmM/hQ4lWU2Tk08Y/rSUbA4/cuhpAoD2oTrLaqNTCf6m7dD+YhRLgUtS7gqLlVyUQ0qkFsRhmr1cRWHu6ur8rYnYUY8a4IL+nF5tZ69gMwqjwunrJNY9Tk4aQdsvIkzvU9CvzJZ2eg2QrI98fY0bNXUlV7hd5zQRj/lCkKy9NksxBvKV76Iy9nMXT2O5TUl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZm2kJm8TjhGGMrZ2CFQ4Zrl0tSd0cXkkuEx2Y4yNnw=;
 b=c4yrTeytY5D6RPU99ort7GqMxrAFdrh7CR1otWsAsRmj3Hs1ayk/LMldp+sf/POfI4y4HkGnJB5Ub+2aVDTRP7N2dAyX4P4o9R/ApuowtwKsOJ5z4U03wxt2OuZZ0qbl88sUKHc3b2Eluo29GMoolUnw0iW64sjgAanzln5nKy7K0R/go+cxh7Mr7U7Ozy8JBKL0AxKMrADEvXqG7O+euSu++4lJhri9BBuPwfPaxi7ubfBcxXzJLkYAqNYEhGyCYMA7dTJvdAlnj4ay1aeF04Z7YlhJ7H37LQlCEaGH+vEnRIVn6kWV3tURpbT7iwLllrau0dIxVs7oFm2PJyXLZg==
Received: from SJ0PR13CA0112.namprd13.prod.outlook.com (2603:10b6:a03:2c5::27)
 by DS0PR12MB999105.namprd12.prod.outlook.com (2603:10b6:8:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 22:39:14 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::31) by SJ0PR13CA0112.outlook.office365.com
 (2603:10b6:a03:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Thu,
 30 Apr 2026 22:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 22:39:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:57 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 15:38:56 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 07/10] drm/nouveau/bios: specify correct display fuse
 register for Ampere and Ada
Date: Thu, 30 Apr 2026 17:38:35 -0500
Message-ID: <20260430223838.2530778-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DS0PR12MB999105:EE_
X-MS-Office365-Filtering-Correlation-Id: c11290a3-87f9-4918-1f6e-08dea7094e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3+86VmT89aJYIV+S9Y0A14j9rPnszm+jNGP/FXDKzIWvJ7g9e6pFlAOuUmtmqlesHrKqw5OOyESZ8oJLf8wVU1iN3r7d+hBvN1I3dnKuaBoEIZYkm655bnJhZYxqMaZ/RNWVlNIzjd4uVzdH+Nyoxlv3CZu8SgsuWUwkgL3Niea2HqNnUOZCbckBq0D+smAaq+GDTmYWJgdOtkQ+WqF8FcqAttNoSTuift/F5mg2khGy8StG7e/QcC843zJAfb+X6mzYb/xXlhsPbktnd8+lc6wNGeYCAgqXWTLgfVFAIUBLkK5hwReHREDtg3nv38N35/vNhLjrrfQ78F1i8BDoJkuWWnjtJtB5YX19l0q1dUexyxnPT8zaFGK130lDtifvMzGPPXzW4/4N/3rn5oH28GUAAK3GoeEB/t+KcgkTzq0G62DvYjejvi+vVd4SLgjt6IQEZTTjOGNe20ACfdrkQSgE23Mr9L1eZkV9yawbjJr6QqCxfAdYTQ/9Y4TGCoNuTfboc4f9e+Pel6myDw92OhfM49Mdzpcm0UOz8tw845ig38xa12D0UtjNRVT8iS6zSznuOn/h4jdwzC2snAbze7XUMXOtk6ONdYaO44ErUn/1kpD2nSAiP/aW6k8zLu3nQwtn5ffEOUCNxb9O7mRgRZA4zYVxVafi2WyHqlDadZ3JJLI+blhUnEcWIBeXFY1P7D45n2dOqzaNp93Y6HEwMrHAOaNBSzI/SuLNYO3Hrmw=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eQSALRcB6nX2gjhcRHMeFHVx9g3FYrBlQ5AHe+La8NDoWgS4DafR4aAYinDi59WmKaXC9shrvWHsd6wX56X5SmZ473pD+Uipj3+mmoQrZM6N1f4JwXrnFzI4ZAoy9/nBpexpoWHmSvUK4H1qJL0Y/CG+QnlwOlgFuSwlh0OUglCIRfGdPSOoJDVAPF6DkHwFZMI8F/gu/hiRmHSnIq4vr4hpykhIa3DI2lXXAhCqLxXPd8+po5I4Sx+vByVHS0N9puzkRimeWh6JCAZu63TfMtTeg+N4Lowt0/Qz5YILmLMeZhpTaIVSAz24YPEPchC157ey/NzMrSNcOiwngYdt9mK5b0Wp6vBgXkyO+dNhVuGPNaq7DFTTAKKNJ4DF+r2FVJ1rIk0Ubqp00LKtTx5R7MfRpinjwgi5aQCnus8B0jGVMvBgLs5g3/IGTiU1nuYR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 22:39:13.9651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c11290a3-87f9-4918-1f6e-08dea7094e22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999105
Message-ID-Hash: 7VK55ED7A5FW7FLOJW7NINUYXWAT4NXE
X-Message-ID-Hash: 7VK55ED7A5FW7FLOJW7NINUYXWAT4NXE
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7VK55ED7A5FW7FLOJW7NINUYXWAT4NXE/>
Archived-At: 
 <https://lore.freedesktop.org/20260430223838.2530778-8-ttabi@nvidia.com/>
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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
2.54.0

