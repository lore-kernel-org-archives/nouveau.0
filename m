Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C946606A321
	for <nouveau@archiver.kernel.org>; Thu, 12 Nov 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=F6jBaCrb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=F6jBaCrb
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2D10FF77;
	Thu, 12 Nov 2026 09:31:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D0C249292;
	Thu, 12 Nov 2026 09:11:31 +0000 (UTC)
ARC-Seal: i=3; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794474691;
 b=X9o36e4g5NmSXVyGO/j2lNs9rUFIrveEaEfTDjjSF/285HZVcyRMDFMT7iWq/kBDEa6l7
 5hKSWclmKKX2UnrZsKXj3vhvQ9abZWpAVWyug/bJFp3XUiZAzMJKyyFPTdVe/1UJeupKssF
 QFQiFegnmTqgS5l8QtwKfbgbCOMsWcxEn6xYXfTn2OzY7+GhbpIgv3y9ZDaTmVB6pbTN+n3
 K7Fn4gvvv1h7Z+7IsFQu+JhyRGjdD4iiXfbe4ViAIq4IRRgGv2GJ/gHEChqUKbao9HnkjFp
 1JIMbeADyqnern+xASYYlWWdIebnQH3NKbxF+0Z3s1G/qO4tfTUbMPmVeUvg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794474691; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JeeTo1MjKv70DzSTDivqMn1e6x0VFy+ZiZPO54IltdA=;
 b=P4nBoL0w+z5dIjS5q2nfAvXeH0eG0T+KBqkN7rwH4xsGhwxXX2KA47uEnTaS+RhvIyt9f
 aikfjuDFEWCPzMv7cqo0B0UhZApsyOVZs/QQNXTDvBC0PsVm3fT0iHyYNSrvFlGJzy6gnI7
 Wk7fYvbkW0RPaPYjBz6XK7FSudi9QzDKFqt6w69lHJ40rkuh4vOkSxmNQerBgulxuzehLV0
 9xKEBc/u+2zcwPQD4325vVLxNevXnmnX/i+LxBJ+vgU2CxaKFdDKGOOy1uY1AyAb3SFlKsu
 JerQMo1QqHaSnkxqDU3z0qBSwe7B9Fn1cpZepfc6ny3nTL8Fs7AJQsN0CMDw==
ARC-Authentication-Results: i=3; mail.freedesktop.org;
 dkim=pass header.d=arm.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=arm.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 253CB46EFD
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 09:11:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3641610FF6C
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 09:30:58 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sR6kg7G11i1eXtVwuSWqbbwHeHDkZWjYkREcwci06IT8K5TlT4VRNHG1k6pdN8844u1g2onwZXOlft9m+ZEIxjFvj9F3VFtSnENfSjJwhf6Fhmsva+ffgT/PsRSkyepz6Ute/O4+Q56j8cAhLdA41lNNJ8Hr9dtVgtws2B6WUxMZgjyQff+VC+cHBYuedCfclyjcUVZqItNKxiMaPHDB/AINi9r2+hLkUg9/iH5lLOBsb1gwZOHDrMt1J8H0Lu4Tyz39U9FPGlEPDSC2Cy5LrzZQXPZ85rCLzbsYqdOM00IIuZOolxMoc9g4rUBUkNT+3DU3pET2wprh7nIrhTUzDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeeTo1MjKv70DzSTDivqMn1e6x0VFy+ZiZPO54IltdA=;
 b=SrQyImrO4bZZYcUL/1E3V4kpve9xUAN4LutbURDHDWHOcStwzA8ARm8BhAGYIVSIMZ4ASVDB7iGuXLPRDlcX9cQIxn9Y31hIY1X/Xm4dpJZizxLYG0OFh67Jg9o8KHMZa1EndYyqc5M3dwIR2fA8A05C06czLu+CST0MLb/TNeVeSiaWYGEVoUaHKNX4aCwxokv+mz69IkJa6czihuS0LWgJULQZnSSDdauMfFscAq2LlniOBdANGjmH7qmQWYYZrv36n9C2VllnaBxXqIj0gYWgKd0nF+ttWsw+dxOjgWaqm2M39+Ds2YJ9l4BDiojyo9NeltISg5Vm1utbpDj8lQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeeTo1MjKv70DzSTDivqMn1e6x0VFy+ZiZPO54IltdA=;
 b=F6jBaCrbbfnWcRhUwvsDL6dWgahL9GlGX14BTT5tKyXmiLcfbwfuI0i2HDwNT4WTN6SQWiz3UlujFm6roOgZginM70Ytjvmg4c5xXOakpYzcIMn+XCMZ+3iFUGtS3wDcvr1wFOCcA3d2OuCM0axQIsj9vxrl6E/lbOPTv632jhU=
Received: from DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) by AS2PR08MB9836.eurprd08.prod.outlook.com
 (2603:10a6:20b:603::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 09:30:52 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::3c) by DUZPR01CA0331.outlook.office365.com
 (2603:10a6:10:4b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:30:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 09:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGl30QnMOengROlkSs/nZ09NnXRWRIpXHWd+LfFl8yBvBt3LP3NQrzHJhFW9onjtl4+vwUuhT3s906nmA4Yl6THe2ORwPkzQsnxPsvNmrr1U8yUC1tJxtCOnjCTIQ1NC7EQxQlia3DTcJW3Y1e/tTkIAea0nIc8EMBLML23STz47knRIAB4jQ/NeebpCsFUMyA0F6cCJ3FNZMjwbNkbIAYrqy0JaEHZ6putYUgM5ROgyl1C+8gxEoNDWOT1An963jlaP2jpux29kW977v5Wv9OIKZD8yELnnF0ajetuCbSAA9gm158XpkPPHwDcdBuowD+rxn3lWtSnvoLSeAg5JhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeeTo1MjKv70DzSTDivqMn1e6x0VFy+ZiZPO54IltdA=;
 b=xvnDGkQBfaFG+5hYPTu/A40xqiBQBgvwHW/JI7nR4XzG4t7Eak9eas+VGk/+uvc0WyBeI+nUowyFTGVtFm0RY+S9janr4BUJpXI6qFmdA8OtF2mVPpE6d3jWur/k7Lex2a1lg6TaeZmsNFPP45S6ynufjREwkdkKtPZXayhMow2yenNyPNapHtkyokneMRp1a2tjP+64a11vuvyboPlCpBBg5xO5EBHLCcq83pVCBa18/jtP9VzYrFFSDnOMIPZYZnIlB+bS6IdghMTGySLgO5i6vewIIsKiCIilPbcYDoHpeTqXCJHAqRdD6ucaIgY+N1MHCv0PtcYsmPGqyybYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeeTo1MjKv70DzSTDivqMn1e6x0VFy+ZiZPO54IltdA=;
 b=F6jBaCrbbfnWcRhUwvsDL6dWgahL9GlGX14BTT5tKyXmiLcfbwfuI0i2HDwNT4WTN6SQWiz3UlujFm6roOgZginM70Ytjvmg4c5xXOakpYzcIMn+XCMZ+3iFUGtS3wDcvr1wFOCcA3d2OuCM0axQIsj9vxrl6E/lbOPTv632jhU=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15) by GV1PR08MB10402.eurprd08.prod.outlook.com
 (2603:10a6:150:15d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 12 Nov
 2026 09:30:10 +0000
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c]) by AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 09:30:09 +0000
From: Bence Csokas <bence.csokas@arm.com>
Subject: [PATCH v2 0/2] Add struct_offsetofend() for pointer arithmetic
Date: Thu, 12 Nov 2026 10:29:32 +0100
Message-Id: <20261112-offsetof-v2-0-276ede839967@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP2G9WoC/22OzQ6CMBCEX4X0bE1bfmI8+R6Ew1J2pSZQs1uJh
 vDuUrx6/GZnZmdVghxQ1LVYFeMSJMR5B3cqlB9hvqMOw87KGddYa2odiQRTJE2NA2jK6kJmULv
 9yUjhfVS13Y/l1T/Qp5zPjh4Edc8w+zFLE0hCzocxSIr8OUYsNhf8+bdYbXRl65Jqbw0O/gY8n
 X2cVLdt2xcn+3ZNyQAAAA==
X-Change-ID: 20261105-offsetof-f62aa6348f0d
To: Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: PR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::16) To AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR08MB10291:EE_|GV1PR08MB10402:EE_|DB1PEPF000509FE:EE_|AS2PR08MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 97079ee6-4d34-493a-c09c-08df409fa477
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|921020|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009220027099003|261009221227099003|261009221727099003|261009223027099003|261009223327099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 F2lMfknCP3z1AucWQuGarVjTDHVW5ARJ1Le2MfBRXdYYsZY0XPhmBH0f8zCmw3TxRL+WjWAn6dMjFtnbXJntWM2Hoev0NrIdRp4uzV4hprcdKC1EA5dmnmCqMsvBZaWK+U55QVlejY+rKnzfPuNklnNpXDNaqT5lYVUc/SwBNHrTiBb9oO0ZOPFL+/dJFocfobEAiyXnJB2twV1xpNQTCxT1Fzfr6paY5UBdD8NYvnCGrKHKUmnpF3Q/SwwmOSIrVD5UcIXJiPKP0B+p4H0VvUGXiUZF/FJD5r4GCHCY0PhJOUZmN0IVTrQm8j2Kq8KuVDPuAV2/uHCJWyZAz3W1XEWIlwsrJsvFCMwfR8rRXCLJU/AfhMFPcxRtNTx4pe+o0mrSpxlfQD4gXD1785AZFUEW51wySOGr6sIDObmK3ndSx5KQwXL42JNNXbe0vFfGhlS7jKwNrhnL8p1pjkq9JtbwV8hyJPUPbcpngCKJXEipeYaY+20P7LkZ9brxQM2P+37E2iddKKQrHm1F98M5exe4+AIw3M74/1oEk6u0w5vGHkA3dCQe8ZDQKZaz4331EuwpGwOjXqw2m7QJSmx9dxiqD4zMa7gGOl7OP/Rr4OfWB9N1mknpBg7zLvOTt5dYBab6EaHzerhUXAYDkwOYno41J0pix9Hp+sMuk2lPFvs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB10291.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009220027099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009223327099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: 
 1bmMsFiWoyBAT8vv8SB0shTGPv59xgn2Alb0xteuSSQsKOx/l4ZYryd+pomzHtN4yw6hl0j3Q9YTXSN833JT7KfeNchcSVzpcIMva+JRcLUDvf/nawshOJUlgHEbNYFhGm3nLoDQeu+rgmvOX+76TnGL1gwol9d1I7hEvI7d40B5nusNyt2e8yDPoBYpPiNQz7sdzbgjCJiyIRUHhVOX+7KUGOCG7EdrwJG5u1UCrLLEofzypfSvS4PpnhMgwt8qQi57SkmaZiywXHQHrdALJPMr0ZksiQrOk9ZLUU/MKvpJ+Xh/qwp6RH2YzmqeWGkoBRKwr3QolD1xAtkXgoplNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1280c9fc-f198-4074-b374-08df409f8b16
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|35042699022|376014|14060799003|1800799024|23010399003|82310400026|36860700016|921020|10067099003|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tG4bAeFQjtXhODfm9Ql/mvhMnfzx4sLRD93U+p7iZF/7EwcZ2t+Ja+IR/lDZhdOqPI9CMSpxLyric7FtWvqEH2Wfl9e95SlMuyx6j3maz1PD9LWSB2jmSNrbXPJlxjv/NDZGrYEGXTbE8UZFha7GaC6v18UngZLo3Cxeds7cXSjGtHpNNmwDZZhgQosxVW8omp24vQ8O7Ul7cgY4UA8Yjr3BlooPE9rqKiwcBKnH57ixYciVjm87wHiFQ2lxZdrxAIj6IIfLdKr/qgzn01XZTgHpf3mY7Jn9jLruL+56Tc+pVnvVO90e0r8GqHZ71jAaAuzoflYsPZuZxyU6xFLptvwVRrdVm+ssm1tTBHFJHzdAXdrKyM+L7Lx440q9SGqTEA/CcB1LB2yZI+NbwjUajMskFYQBW9M1KmxmyenCp25Sc2o7xjxWhec/El9fJFRCGPHMVKLlb1IarCctBaVG9UkzRXltn/rMq/zzZ6XV1rZlpO23LiyN83+5OgWo1zzsWdbhM/gov3LGEdp+liBpa2tmgFjrWKypvtL/fMS6xbR5GgTFqHZ0v/ne/ddiT2a26TKDz5ah64hLDfVhTFYkINcEFg1ciFpV/ivHr/02x9PVAwMFcbKIc6j25bGZ100QJHkQtX5PhyMhcOLmWMLQh9XosY3Ooci1iwpU9QhwXjZLwf0nwiJYHbFBvz+iuRfsF17cCJU3U7eJ4BnURpTIRg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(376014)(14060799003)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rGjpFBco0U3xwg6dD8++kblVTYNy6lJlIONYFOaR4M3UqeL+Tg4+DJGkrWQ+P6W+GWSfy3Wada0Lz6csHpeUkXEsUeA3xGpOPAUAtWTN9fSCeVxE06+P2+I3757G+eamsybG6CfcU1EEwCVa4/MIO0Ov0Xoa/dkZeWQx6p6i+okpPzP1x7bS5mfroLYLLq5nhhUWFFQbHgOYUr+HMizhAeugBUIjJ9NpYwkEO9uD65Frgm+zIDXaQWIAuFxhKSAxDRxIlVbCV/shwoVKOk3mgBKZsf1AapaMDaO9g1lDpnFFurBYE4iRK8jnh0SvLkPwMC9M1mSL4nkQXZI3EO/gm5VHp/uY8S+EdoaF4QolkFia9WZ5HM7TH1ylPKcbglSUL05uZvMG5WffybWA2LkqEagtBDDZMPVgXDXltl41q1rdPocO/fxERPdTNsA7a2cz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:30:51.2097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97079ee6-4d34-493a-c09c-08df409fa477
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9836
Message-ID-Hash: PXHD2LOP5AFJSSB33AJMDMDPPF5YKIH4
X-Message-ID-Hash: PXHD2LOP5AFJSSB33AJMDMDPPF5YKIH4
X-MailFrom: Bence.Csokas@arm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Bence Csokas <bence.csokas@arm.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-scsi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXHD2LOP5AFJSSB33AJMDMDPPF5YKIH4/>
Archived-At: 
 <https://lore.freedesktop.org/20261112-offsetof-v2-0-276ede839967@arm.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A common usage pattern for offsetof() is the following:

  offsetof(typeof(*ptr), member)

This is exactly the definition of struct_offset(). Some call sites use
offsetofend() instead of offsetof(). Add this variant, then replace all
call sites with the corresponding macros.

Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
Changes in v2:
- Use struct_offset() instead of reinventing it
- Rename offsetofendp() to struct_offsetofend()
- Merge the two treewide patches
- Link to v1: https://patch.msgid.link/20261105-offsetof-v1-0-4153f5c10edc@arm.com

To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Philipp Stanner <phasta@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
To: Zack Rusin <zack.rusin@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Selvin Xavier <selvin.xavier@broadcom.com>
To: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
To: Chengchang Tang <tangchengchang@huawei.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Haiyang Zhang <haiyangz@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
To: Johannes Berg <johannes@sipsolutions.net>
To: Benson Leung <bleung@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@chromium.org>
To: Nilesh Javali <njavali@marvell.com>
To: GR-QLogic-Storage-Upstream@marvell.com
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-rdma@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: chrome-platform@lists.linux.dev
Cc: linux-scsi@vger.kernel.org

---
Bence Csokas (2):
      stddef: Add offsetofend() variant of struct_offset()
      treewide: Use struct_offset()

 drivers/bluetooth/btmrvl_main.c                    | 12 +++++-----
 drivers/dma-buf/dma-resv.c                         |  2 +-
 drivers/firmware/arm_scmi/base.c                   |  2 +-
 drivers/gpu/drm/drm_edid.c                         | 26 +++++++++++-----------
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  4 ++--
 drivers/gpu/drm/i915/i915_active.c                 |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            | 12 +++++-----
 drivers/infiniband/hw/bnxt_re/qplib_fp.c           |  2 +-
 drivers/infiniband/hw/hns/hns_roce_cq.c            |  4 ++--
 drivers/infiniband/hw/hns/hns_roce_qp.c            |  6 ++---
 drivers/media/usb/uvc/uvc_v4l2.c                   |  4 ++--
 drivers/net/hyperv/rndis_filter.c                  |  2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c     |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rs.c        |  2 +-
 .../net/wireless/intel/iwlwifi/pcie/ctxt-info-v2.c |  5 ++---
 drivers/net/wireless/realtek/rtl8xxxu/core.c       |  2 +-
 drivers/net/wireless/realtek/rtw88/fw.c            |  2 +-
 drivers/net/wireless/realtek/rtw89/core.c          |  2 +-
 drivers/net/wireless/realtek/rtw89/fw.c            |  8 +++----
 drivers/net/wireless/virtual/mac80211_hwsim_main.c |  4 ++--
 drivers/platform/chrome/cros_ec_lightbar.c         |  4 ++--
 drivers/scsi/qla2xxx/qla_gs.c                      |  2 +-
 drivers/scsi/qla2xxx/qla_mbx.c                     |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla2xxx/qla_tmpl.c                    |  4 ++--
 drivers/scsi/scsi_transport_fc.c                   |  2 +-
 include/linux/overflow.h                           | 12 ++++++++++
 30 files changed, 75 insertions(+), 64 deletions(-)
---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261105-offsetof-f62aa6348f0d

Best regards,
--  
Bence Csokas <bence.csokas@arm.com>

