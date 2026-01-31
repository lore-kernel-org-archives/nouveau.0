Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D850BD46C1D
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:56:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B6E6A10E229;
	Sat, 31 Jan 2026 00:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRs42nqF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B9D040F72;
	Sat, 31 Jan 2026 00:47:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769820450;
 b=wU3w7+ln7fTxXC9DaoLLuXDttwNaBnH35F6foWcdnTNcjItuDQ+YPnbAsuHcRsoYuXZOO
 mPpjk/wF3xPm2JdbQSSSVK4sqORPCeiS82faEX3ZV7vBVypUV5jfuQpigqt+lpAWpxvxWR6
 6VPwhA8zjRBuNMcjTgTJdmPag8Or67tzK6Vb7GBhgS4kIoQluO9ze6X1XZeMyzRA4hi6yCX
 W9JP5L2QeO7g4cMbMVBWhaSxSECMk4ugoAheQlnJeL1/rRE+MPAxSXHuYRY5/6Nj+yHDrKo
 tkj7jqWgyK+geASLDWBxE5VrWehwOFKDhKUMB4NAVc8COEDfm5xB+kD3Kh6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769820450; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EKVndETr1RUCpi5OohKflNm7aP/usbwuqzBmwLLBCYc=;
 b=NUM4oti5nikYKYDKu7f9C2gFqmy9MrkMV4qU1SfH4LmcJDokxgBp1SdWzqGa1jPF3DNE8
 0eCeWo1OUcXyFAvMBWMMWgQzmOxwavFhJ/psGiWXlW7LyYrmWylb82JsKf0OyQH7rwvU+wL
 4quhPOI39f1x7BnX38/24iH+iLSKRLF2lW8Sch1ww9Gm0qf3VNJLCEXqZI2dNgEX4QCAra7
 BOLI9YR2z/auarIDxpUP8dWd0eiZ7+5Ioiv7hxvByYDQr7WUjoSEiGf+KOXbLUIznmW/Iqy
 QQYm+kL9yPj8MYLdTrwXadT3FG5T6x9sUt4AF5TEgoop3DDK/LWJt2NsFODg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C48B940805
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:47:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3373110E1CF
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8AxhjHynkI2HaX2XL8kRZHLdoTTn1p39fC2u8wynSB5A98idZuG6A9ZVUwQzow+NW9iwCQtrL1vebCJ5ar+z7hCrzxg5/tvZmvpnnqrau7doUByKHBad+52DAKikL0rlqXFDwmfPTlbeYrdorok0g7E6g892FncypiQGbOLdTYuIJBnTk5YAehc8cHdsdiVTlPA3IGXKVS7dfocZROA39tWhkFAiXZQFvhDHmJspf0Rf7ojRR6uXgWVPz4iGJIQDQ3NC8E45dZtq+rWdZk0aNznXIsmPBvlRhHkuNc66/EjXdRUxMyctn3spOJNko9X9FQShCzWrEXoijDS4UjGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKVndETr1RUCpi5OohKflNm7aP/usbwuqzBmwLLBCYc=;
 b=SqtlPIrbVJt+GS8oBIzAPp7Rxb0HGOiFhVdL2SMY/E+GAERfsk2d2uQGwLY8zYhyHQRCxNA/lz1RXERdglYeVbapdJwlgLoDY+bhdXbnj9VMH73t5+KVOD8YowFk6vjd2PsMK/fLDSGb63ew7ZbO1bryZD9M7Bs8L+z8mHLvvzvw9PQPnZMxu2b1SyWs7Do8DKeyZdOoCciEfsFoyiwL4oscd1ZkpJp+oBLws2aMjpjydbfj1PpZZgGyABoI19PXFKxxqVVLh67yRmFswl1WkYrPqHFVfcYKxgozDJ67pEEE5CyiB2tqWU2ZC00nI+CcRI6lTXJ/k3hi8+/gBJzmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKVndETr1RUCpi5OohKflNm7aP/usbwuqzBmwLLBCYc=;
 b=jRs42nqF4HFL6XpYKBIId1uVNpmfPnDw8dQcIja1jWVkgj16buB6DVwcfKYg9Ktb0eIpolIun0swLFN6ep3DrC9OZizSlfnEKW8QQ+9UOS83IQ8uogRDEHbsikQYBa3WQAQE7DIgWCD6ybgza1hkkgJwl1iHmYaNhUqdsUVuUzUSg9nd+9qORZO8gVSOeTekAGpirpu/FCsS5bRmkZurCod/HnGyAmAOWOCkKE4S0QN3iCunkAoJxyNCSTKpxS8meMhCuHwOu7tppVdCX0IAQqexO+PRheN/dXFFkTEMMlTArtSsFRD6lKN64QbQNqGQAj7g2ocbLkomyQycu5Zosw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 17/30] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
Date: Fri, 30 Jan 2026 16:55:51 -0800
Message-ID: <20260131005604.454172-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 0329aa0c-09d3-4d04-49bf-08de60639265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3zhg/ePy0RpiU5d2Mk4UGRaLUipb3ktSOCwrkExE0KoKb4OmXpT5VuvQSiUx?=
 =?us-ascii?Q?cPz+YgjqgCmNZk4KwzvWoQqy0BbGVN/FKo8DhnbmIYSieYOsT2UoUK3LHSf4?=
 =?us-ascii?Q?uYdILJc2ww/Drj6Iz94CfatLsswWvqQX8qcNeDHq3Q2gkzCOSiZPUJTAk96z?=
 =?us-ascii?Q?KIqx6YqDUh+z2o3ZrRAnFM1q8ot17KsGfewoRH7EPWUWpV28oKK4vBhE0npb?=
 =?us-ascii?Q?FElpS67j8elk6HIBvSO+4PQQRnGps486VhYr4gLvKJYlvj+JsNswHyGlvPJa?=
 =?us-ascii?Q?sT0IR78Khz2/JTkVHnmUOxJNT1oKF0flAfHjs3QIFF+7rbY3ueHMbwcDQikQ?=
 =?us-ascii?Q?NJXFXvTJp43LlJoWo1cnmofM5+oHZaPr9gn2x2k6wrwIhceT2JJCchM2Ztbs?=
 =?us-ascii?Q?yE6o5bd7YGqS2VUKDUQgVUINkfcpvT7LVjdvuEF30EdoOqosHacyAEQr5kLK?=
 =?us-ascii?Q?Yz9Bh2Quo2pb8sZTFNicwWXhbWOm6xGK9QGJsqtRoHrGT+T7Ohe9BZxEqVti?=
 =?us-ascii?Q?Y5DNT6DanHF+kyFUnDn09gXQCnsDxv3nz1jiPOuQ8vlzD0BbwjNPb2Pl/J2c?=
 =?us-ascii?Q?OvpiAtLo+NE5ctN9ZQzNDZVuPcw+2eASUCsWuPYTWvkyhnMDT1k+PZ9B/r22?=
 =?us-ascii?Q?Ghhpe+E5Mmhb7J9RX9HSdiUdoZPCzcHAaUU3VP+upiUudIBp2DmprZjw0fdi?=
 =?us-ascii?Q?6H8+IW5XAd0fa7w9FDWwj5C3JhseLrJ1h5tHcpgU/qeV1Xqm+pnmyW+v7yL5?=
 =?us-ascii?Q?tN+8DDHS0FdNZV1sK63LKWD/JYr4wwXA9+JaqcbLDxr2UDjVy1UmFNVCi2G0?=
 =?us-ascii?Q?/FrIxW+EK6G29d/MEjZjsfTZFqRYtJAvQWXBI0JfkzxTpzFq2bKJwjGC5zz9?=
 =?us-ascii?Q?8k9UhZji2yiGkvsnvyqb+ZlRwPxrD2qFtIagXcpwjD65AbBCAT0Fw87gSH4b?=
 =?us-ascii?Q?KoeKyQr28KFRdvbkkELBLCkz4Wyj/eB957lKgYyqXPv0zkwHXppfaafTiktq?=
 =?us-ascii?Q?ifa4QCFOsG1PGBNWV8cTsjlgeNojt8DHb9M80+mXL2NN3dgUoYgonNd8dDuU?=
 =?us-ascii?Q?dPqPyiNRpGFULCBqyjeZUSlAsh/Mxtz6tjWthe+1cnCdriblu+FbFY1wROgl?=
 =?us-ascii?Q?2N7FIL5fipwg/jIqMF2mvWlYIO0wv6aX1jvroAfAEyX3m3e2FevZhwVeWIHV?=
 =?us-ascii?Q?xSwE8xgftOLLoG4nDCDFd47m+ND0sm/DLWAPpEoMH59sVolHNmro558zMg7h?=
 =?us-ascii?Q?R4/OF+Kp3OOLv0zDkRQz7gnhhtPYPIaH6utg8Ypv840jvfeqdxq6X8pcsFAJ?=
 =?us-ascii?Q?Gmwd1IGOqxowf4sDa1uupM/01eL8yjKO0sIV/yLJU5uizpFaPby8mXPRlxiA?=
 =?us-ascii?Q?1b5UE2LujV3RjAfF3UubOr8VzFTS64wnwSORD6hM/8XuRmGQ4HK38fdbz4BJ?=
 =?us-ascii?Q?h6BHI5loGMU6jjkzzkDTBDx2Pk4d+EmYN+bZa1AGL70c7GsUyRbcVo5BZjaJ?=
 =?us-ascii?Q?eMmjKov3VVmQeom4HwkN5TZYavyphbzMbmWqNNht03oqPGaSp/IAkz2O4rOs?=
 =?us-ascii?Q?Wx6jEn1m4LQs2eqeN+U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JGLrf0kCCNpsu4fuFlkfXKVULY2Q/6jB0R7Z1KaWSWKdHAUUr2rUTPcQPKTR?=
 =?us-ascii?Q?tk/doRiFKWGj+CgdHHI4Hr+2R3zqwLR7DalZbH98PqOyCzEZe0RjwNXLpqm+?=
 =?us-ascii?Q?FMyxkgWjp5TSrzJaWRV6LBZ4wMFN5BterubmhnmX3lZO6Sj+x2QMXJ0DFSH5?=
 =?us-ascii?Q?BvAvrIztQQJMqTWwItOj349SBGx5xEtQqmcKvr3K2w9p2X9Lux589bt0Kid0?=
 =?us-ascii?Q?bTd7pG9M/zL8hZnaoR9PuyTXJk/DehsXd8ECInoaiXGN+L4z52VcxdXMcnNB?=
 =?us-ascii?Q?Am/KEyotlO8e2XU82kaE8eeifNO1JK55dRdZP9Fi1GqNsiQbIm69X/0eADmA?=
 =?us-ascii?Q?1yZyzNuO59Hrh38Xvky2Q2zrT4Eqhj5ya82hw2hi6Qwx+l5AltYupp0trQbX?=
 =?us-ascii?Q?+j7XglWDTKfcGhhEtMUbW5LZ6EAK1zRfHviD6P+1XDUm/WPW56ria3yvtj1f?=
 =?us-ascii?Q?Y7qHhbk0ALnyPaNh1L/vgsCrrSkZIIRk56PeYBJcVF+L4fbl/HTMNhGA655y?=
 =?us-ascii?Q?bRucBvoaBDRKS290J3bw3A0wlAz/d+YLHc91TCIhVzqVPwI0dNqhXCFh1DY4?=
 =?us-ascii?Q?Z9izS1QtQbki4g+ZIySsi2PU3od4s4PiWguAgCvlFwbiybR+uDdJ46va20Be?=
 =?us-ascii?Q?RfgdDxglhYPayEoVJagZs+jht9mbR+IMu8TISAPs1AgfbkfNadNiUPMLObN0?=
 =?us-ascii?Q?frLBdWhQ9iXVmfU8rM1i2V7ehbFbrbRpaep/StqOqZNph5YDJqQyI28j94q7?=
 =?us-ascii?Q?TUJqrKfLrWZi4+f0mFsuGhA2K1On2j8YMCMTh9tsN/Qqr3CQGwNzcfU3MRFU?=
 =?us-ascii?Q?JMd28PN3pn/sQVqM7qFyxzDazumymI3Y6dkZ7zp8wVoXEBLfinoLo3VY5TmW?=
 =?us-ascii?Q?9w7PF69sav/fy722dY/4NU6AAx0ztilsCO/exiNpifdvoNX1awE4xF3gSyr7?=
 =?us-ascii?Q?ZSgyErcFV0MrP/FVagNL5xWzLIu2k6pKP9J1uzIDi81luDbdKf0RtbZOFCc4?=
 =?us-ascii?Q?5l0ctpUWpOtj3DU9biXnWGjgsUu5LXZPs7vetN8BpFNJ5RPOpV3uvb+jxkts?=
 =?us-ascii?Q?O84h1iv5AO/jjYWhbZWlUpkhjtUPp1zRtNwSuzhmQZ03uX+koEp82fDl2Bjo?=
 =?us-ascii?Q?ixL+5FzkjpSD0IsXTpQKthtiTe8HyOPbjXTgzG0GXn6BEiW9Dct/Gy4biyau?=
 =?us-ascii?Q?pr5/QQBNvkA5wlecnlWCmI9R7TkXgUhDCKenOQyLxRid9vrzv4btB/t7QEWE?=
 =?us-ascii?Q?R+zzDp3II+JX4V3cKV3g51sKlOZeRv91T58IrnSTP2cdFmd+0h3hjh4WTGHu?=
 =?us-ascii?Q?MaBX9LMmhjuGXDu3qoQj1Vm3G0rZJBdpGK574UG2BSwwGnPzvGL7tUdQ3eqx?=
 =?us-ascii?Q?6pRIAlL8/qoahpA/vNrhCqXw2vfcYYykSqjje8EzUAjxholPMb0+Jkul8HmZ?=
 =?us-ascii?Q?lV2Qr0BCczDllQ4gDBiJymiroa84qwfEAUbip1eHUaxQo+EMfJKVz24EFDu2?=
 =?us-ascii?Q?0MHbtJwUlRzdISt+lsDFLcreUxRuZoHXmfvJaRY37gWZXTZLw1Hc+Iz9Ec0j?=
 =?us-ascii?Q?yrXeYXa+KTolkRYkWW4bAymczt08PZlRcu4GAm8DiSk/LW17v12uYIZGOEFT?=
 =?us-ascii?Q?nQYN/Po5TD5gLTfaRAHOjj8gcJfjWV17KRdYaYmCKVR5AeT9zdBTrWzh0FBL?=
 =?us-ascii?Q?hkrDTAPLJP5MTO9b4JUIP/eih3f6OAOBAofbffqCUGjJUdheBexj0op31QP7?=
 =?us-ascii?Q?FRm5+Tl0lg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0329aa0c-09d3-4d04-49bf-08de60639265
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:30.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NqUQmLTf/9nb03jD+oZ4MBWqVJlCw6XDfDtjwvA+ZI9w2Bhys/cRMA+wx16+N+Z7zqh4j5f57X5TyQmTOP424g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
Message-ID-Hash: ZEYGOMSGBOUUVTARXN7ADYP33Y4AWGM7
X-Message-ID-Hash: ZEYGOMSGBOUUVTARXN7ADYP33Y4AWGM7
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZEYGOMSGBOUUVTARXN7ADYP33Y4AWGM7/>
Archived-At: 
 <https://lore.freedesktop.org/20260131005604.454172-18-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 47 +++++++++++++++++
 2 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 5152c2f1ed26..081b9fce9278 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -46,7 +46,6 @@ impl Falcon<Fsp> {
     /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -70,7 +69,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -88,4 +86,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular - pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(unused)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
+        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Send message to FSP.
+    ///
+    /// Writes a message to FSP EMEM and updates queue pointers to notify FSP.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `packet` - Message data (must be 4-byte aligned in length)
+    ///
+    /// # Returns
+    /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
+    #[expect(unused)]
+    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers - TAIL points at last DWORD written
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        regs::NV_PFSP_QUEUE_TAIL::default()
+            .set_address(tail_offset)
+            .write(bar);
+        regs::NV_PFSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+
+        Ok(())
+    }
+
+    /// Receive message from FSP.
+    ///
+    /// Reads a message from FSP EMEM and resets queue pointers.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `buffer` - Buffer to receive message data
+    /// * `size` - Size of message to read in bytes (from `poll_msgq`)
+    ///
+    /// # Returns
+    /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
+    #[expect(unused)]
+    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        regs::NV_PFSP_MSGQ_TAIL::default().set_address(0).write(bar);
+        regs::NV_PFSP_MSGQ_HEAD::default().set_address(0).write(bar);
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 30a5a49edeab..861dbde5a0ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -441,6 +441,53 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     31:0    data as u32;        // EMEM data register
 });
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+register!(NV_PFSP_QUEUE_HEAD @ 0x008f2c00 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_QUEUE_TAIL @ 0x008f2c04 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_HEAD @ 0x008f2c80 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_TAIL @ 0x008f2c84 {
+    31:0    address as u32;
+});
+
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100): 0x000200bc
+// - Blackwell (GB202): 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper => Ok(0x000200bc),
+        Architecture::Blackwell => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+#[expect(unused)]
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+// Helper function to read FSP boot completion status from the correct register
+#[expect(unused)]
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Result<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch)?;
+    Ok(bar.read32(addr))
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.52.0

