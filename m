Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECBFE9462C
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 02:46:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76810E4DC;
	Tue, 10 Feb 2026 02:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="diPBWAw5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3EDEF42FB2;
	Tue, 10 Feb 2026 02:37:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770691024;
 b=0Gsc5G7V57Alh3ehW12Vd1ZZQDVc8wTKr0MHzU+cygy0S8cgfo06AuoCMzt9htyq8pxym
 DALuvGRF1r2D4Obw0GD3Tmv2Jf5dfmGWf2ynJiuamBOJKVP3CPt+KYAC/yyG39fLtdkMsYM
 PQDYiy6kyscMfAZT7h5rVkvSvaYu1A8gXDmImgwM5oXi5QH3CsvwsHS8n+PtpO4DO+TScSC
 D9GDeWnMDTMFPtFDrCDKnUFwlVgi+mecwuTSoVFxt+hEZ8xZ5wH2PlndDjhaZ/VT6xo8Caw
 fL+l0+4CeU6ueHIrNFEtbwioD8tIBhMf13Jp3audO19BDM47RN4GYcKZAdcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770691024; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b97UhfQlYpMNfx9Rh+pgbUxNN8K+EgfHdGj5pdiT6uM=;
 b=drCEBNWqC2ynn2uGpDT1zkS7o0n42zcnDxx3XyTdJypvHvZy4xyV8NPnmx2yeMvJ3LfXB
 VFlgE8fEXgeUNulTkOgflDyAvvcq2x2hGkEEZ67T2GRY7HDtOZFEQlUxDmBk9I7Suhzt8+p
 SMiJslai4Dzf5OBu2KWUMW3Uip25D9c9Lh11v7tfIKA/kpLvNLK3BwcZhNBPRcl8xH9zD/b
 hae/VL/aQrMB1155KOtaJX6gEXIFnztGle6lV5WDr/cvI4S3YqBIzHGYV18LS870KQhs2Ff
 EgBmM5kWQlBImelb2Y/+NLA9JRqE1McVbGWzIsniIp+pwUQ7d7JWZndXWDhQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 16FD94241D
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:36:59 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07CB010E4C4
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSxTJUAp/P6hS7JU4DKRV8G/5YDVsM5MsUgimBnHcnm6njK+eDFWp0zI3Pku95nUPrFAGZl+Z+fpi9l7s/XisS26AASR/Q3yEzCPHA1zuk7i18Cd3Xw4k1menfLcDYJvCds6vVl0voSxvyOd9WzvQKWX7tAYm69e7kyrytSuroCJAqbcHwZKaVFDdFvAGtRjhzj5uH8BD57Ga1kcHv8jDHTTVhthgSe06jTG1onCcX5Ng6VeX5c5oaZ0vZwgwjQdtrogJo4VmMtClIH4P6WfRFPy/6Z1SSR73Rxz+ThX+03BVE1f6GMbGJSafRNte3npC7ikuaap69N2oOaznopH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b97UhfQlYpMNfx9Rh+pgbUxNN8K+EgfHdGj5pdiT6uM=;
 b=XWb58JsrqiiG03fmnlL4+7WC6JCNj7kFz1Ykmz9SR2TvGmDDFzOwIxpHg+qkX4z98DRB6X8s7v2irdbqUIeFSDS4w0zP5aygxRpAre3wEKRzbwAOUxWGuM1hjMYzLM91A3IYi8piQ7f8wT+ryrpo5YVsJ5NwfL637GmYp98kKF+x9vNarv6ickn6jpV8GuaPsBX0Naa8rHrh2QzZhmIesNig3ok3ucXjXk1Dmj8QvLlZvFduZveXMv0sIIZJ1LHGZWjKZa6AmeOnX5UJBTUe0xW7c/mCRQRf/aMl962R8N1nDP7hl8orbsb/Wua1NBuLeoU7kRfGnxIP+p4ruRrjtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b97UhfQlYpMNfx9Rh+pgbUxNN8K+EgfHdGj5pdiT6uM=;
 b=diPBWAw5g5nG6vbgGkEZVyTHbOw8OF/H/wCTpAXp8ajqZvBNT21wijaqHLYbHXhcR5s1Hq0jSkhU+O71SX7MeyVB182/tjURgQEhJd4aYAK3hSdylQq6MwNRsNtKhs8QclzLTELu7RTpa9UakshX1z31GMbbFWzVQ37TNl1+YYoNBBtLXGFFCS2HOqYHb0gNrqAFtz2IT7d8ValTpXZMGlOTMlifolOFUzYpTA/RSA7CW36xMbf6xClKwZFCadSQZXZ9XTbO2HPMVrEPL893s4IMvaw+QkotdixecXK4U2v+duAVkBQUVz4TQtkdwK4p8mLQ2+yMZxda0JF1sqczWQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:25 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 18/33] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
Date: Mon,  9 Feb 2026 18:45:45 -0800
Message-ID: <20260210024601.593248-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4a98ea-003e-4b25-12d8-08de684e9500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BSAkwhzZdzG2vSDjVx5Mmoa6ZZstVQPiYYLf97cl5Q3aDGpyXyyWEr86CoeN?=
 =?us-ascii?Q?AuRPsgqjFFc/KbqBOLy5HAN9DMS3NwoxBIDDuExcl5yekiSNVBg8z/vPRkpu?=
 =?us-ascii?Q?4/ZJDhnKLabXiqPu5uGUX9Mol4UAT0dfd8LxyTI1FlVCg0tXj21ddQtnQBJ6?=
 =?us-ascii?Q?ZkB7+h2lc3Ze4d7Wuj5XyC2VJsoXIgEC8Q0j9G7uznJlELTnFIBxaTYRDUGX?=
 =?us-ascii?Q?d1Q9E3j78atU23hIzvIy4yE14P7he8e7zcOObg7vZnAtoJ+3oaxs9J8Ir8XC?=
 =?us-ascii?Q?NjPtt95gOpBxNqV7a7iiHtKtf9bIdgFckJHFc0vj2AZKLDInB78vUa5y1HE6?=
 =?us-ascii?Q?sNOIs+sdoVwPOwZrT28Q2XAJUV70SgZO4dAc5JrcggsCsH6YeB/o7aBHzktw?=
 =?us-ascii?Q?RwhK0hh6v8ckd/HXxEPcijM+MQ+zVu5gVVdISYbs35sBgQF866P6uSzSYPiL?=
 =?us-ascii?Q?/u+BulWMSPIPwvPM8ptySY9nc1Ye0aZx936ORj3euou2mwSFNsFXI7Rj0FHk?=
 =?us-ascii?Q?XWvDH1irUiGf/zPySHoTnpGarRi1kKoKYxRb/qorFijUmO/lyy0KhaF1d2I2?=
 =?us-ascii?Q?BBfC6EWRHSNERXp05xs5bhWSz5mpYYHC7MBRJzVAiiNg6kdzp8nEFy/EzZUq?=
 =?us-ascii?Q?pbpKi65eIGvs2IANcCyBsnzqm4k83nMJOhtgxGL/FQNOnjSk/BlL3wNR15Rl?=
 =?us-ascii?Q?MiWW+eKRA9G0dM4O3yj/zCsFzXeFZLK1AMlOLvq6LDWtdJOqSVLysqSVU/+P?=
 =?us-ascii?Q?NoBfDrUlx4oQefPou++Ybe+q8SYIMPlYaNgeKbC3sHWH8GIzOwM7mHkxOP6Q?=
 =?us-ascii?Q?GYXQNopMtLfMvV+QmebIxY3PcpqZAhCbq9rNfBPE1nHq5ym3QYMOXodYxJoK?=
 =?us-ascii?Q?7mRiZDJZ8P4cBh3/6+AV78K8o3VQd/ofSZtZJmjlH/rfCE66fgHxE2ReJAg6?=
 =?us-ascii?Q?5nVK0r2dHKjGdPUa5VWNmhMyyv8tNoRKqXAAtVNvgC0Oe/O1owsPKhmcveg2?=
 =?us-ascii?Q?8+ef1itxPWAJaihAyWSidJNd+wdJUf3swSS3mBIsCnFrmLeqTX7naFJTLKtR?=
 =?us-ascii?Q?xDCL+7AIgvJqQoOoAAJdDNqEjht8beFJMLknlbZMRrIpeDfJu4FnMCwqG3hU?=
 =?us-ascii?Q?HaKzWmBpjiecZ8KbyOLa4vRVLlZ/GPYcw36yUxHZlZurGh1kLx9isqr6l/vH?=
 =?us-ascii?Q?3hjnK4ZE3MxsGiLI0341aND/3lYR83MmcvWIttRUmtNEp1LD4V0yZf++3cxB?=
 =?us-ascii?Q?boZOFmL+Qy9MwuQdMORB8TtGs+17XLrhvUQDbd3HfxMpMP21+n5oTzkvX9vg?=
 =?us-ascii?Q?Tzak6ApijTXpVEeTg7L19SaNxoEf7JefPmzQEv6Ht0UZQg3vkx1+tFLId0zS?=
 =?us-ascii?Q?1tBUuDb0SquDwaXGEFXS4NmHKcXHk3PqQvZqpDL3AHn9pb1+tlsq+6UYjcBh?=
 =?us-ascii?Q?z8mi9FdgIF63i6ljHvnZfyN1sG5TR8chd58QxFbgZhvZPc7WgSFnvVpCvmuC?=
 =?us-ascii?Q?QByU11eucCcbrBWC2Y5QajyBNVPaEMXG8Plq+vk8Nz6JGtOng5fyitvus1FE?=
 =?us-ascii?Q?tp+3KQnaZB7gGAqJYYI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E2b5aHaAQE6Jwqy+uXuOcL5ZWa14KKUSbS4zg66bzVLyydLJlXVHDn1FsGLe?=
 =?us-ascii?Q?SfLGhB2PezYvKIfu4GfwdyLE20aKMKtLab/SCQPufQhINlDrR6XUKn0LkeWL?=
 =?us-ascii?Q?HRDYcJIpLtNVGXqXwz85e8/UUD53pVk+UBMTFsIYdwpdKGo3oB080InuN0XV?=
 =?us-ascii?Q?4toM05G3WyBXELFK3tf+yiRO7KAlRYM5+9/tWe0IxOrqOPA4xSZOdyzOqCXg?=
 =?us-ascii?Q?OPXwnXyk6+B65WuKn0d/WIe4FfHQjkTNHctokKdtWkzGyBMJVbqwJ8lWGQYl?=
 =?us-ascii?Q?k0I0lf0Iocx7JRIuXRZIXd6/IsTxAsdQH3SJCF+x5dlO+hK69RyLeLBKWxxn?=
 =?us-ascii?Q?Jb1xpBXsq2WW0u7EskC4FShfUTxZrEGGL8xD+L6stnwloaHmnkKOtg0K//gV?=
 =?us-ascii?Q?Xl/y0bvZwrqo1nfDg5fSDh0UD3aawfRl2fFWKb7HP+dc1rxpECcUdERUhOFl?=
 =?us-ascii?Q?TBuUtF5brtjRUBJoMgSrpZioLfEPCTGj4RAFVuc19X2n16aobFskcrWXKtSf?=
 =?us-ascii?Q?Mefzu/OITzxWnOdkDl7inSt+aOIz226UDR7APgGdz0TcnsQgE5TWxc42+vor?=
 =?us-ascii?Q?DSGWhe/AVmFV4KxM3aYfrGWyG3sVxBO+4T30w84bhg5TUo7PB3SaxbOZhRcB?=
 =?us-ascii?Q?XWQIpjVOR/Qv+igQeNTidehhVuEQEPL/Uo1HFgvo1n8ZLiYf15wVmUmriUZE?=
 =?us-ascii?Q?54La8i6rZ5BqvZQTUXr2GC+NpqxrRxfOINok2FGG8V68bdIZoEn3boIt2rdi?=
 =?us-ascii?Q?BktOawsXfLbwaeV6H77Kewy79LRfsKYqB7t7yuA0xBnVYjUgRb9ul9hW+GMk?=
 =?us-ascii?Q?Sfovltjiji/s4XuqWai4mxUVmyjeNAKpsVyGnrcUz5VvOlKHGniDZhSdK4Er?=
 =?us-ascii?Q?4hE5EtuSPzuCgRSKISoBgXypiaMzp/9iSCw9IbCDspDkmUlrg5C4Y9ywtk2r?=
 =?us-ascii?Q?r0S03yAMK2lb6elT1GvMDs5o+K9/hx8xFvfwrSNIub5UFtjHJpFTVDXSM2Wu?=
 =?us-ascii?Q?1Ke1Sk2Rl4j53k/mWILO9YDJQbWTydFb7PPIEPDh37lDUR5uP1+nFMQsn/4I?=
 =?us-ascii?Q?a0vpi1qdD/3cVds6G73x+2fQoiTUowjK5mVpLL0u19Qj7L6i0ZF1Ii3tqdJg?=
 =?us-ascii?Q?cecsEngNiSbKHd/ZOin+Yw9l0KW9KsBVqgLjbQeZljdp1oYx8DKsneLk7BZ4?=
 =?us-ascii?Q?3Af/2G1Ztt8Y9gB/MvW7nzY5GZ9QE9AhiQfwS0OOJXNGJIihxcZYUdc0BH+t?=
 =?us-ascii?Q?SXPHAP4fpxx5tgPPNUi8ZG4VJpp6hfbN4W8bBi43Fe4Ng0JvLsTxv1VSi81I?=
 =?us-ascii?Q?X8owMhKUzQqe0raa58ck30n7D/ur9XyE+covE3O/0s6/+VXOhV36ClGwDxi2?=
 =?us-ascii?Q?9PEnDxjD1jYh7CNveNPXOWxB6PwojLL1siMFh2xWeEQ1buacdwhla23tjBQr?=
 =?us-ascii?Q?7Nua3TNi4rVvuzhvlJpGXBFcTDSff88DpWKC91zxCbiZHZqecOtHDZ/pgFUr?=
 =?us-ascii?Q?jRWFpgDb4Sn1P2tTApOaupQa5/1oQ4OHnbcc1vNta0GmWiG00KxSS+MgMJhg?=
 =?us-ascii?Q?9s5ZW8FWecD5qH9kRLdcV6DLhv0Pf2JIbC34J9WoYcqEq84jH2HLXsENsbfn?=
 =?us-ascii?Q?7WC/ZpBn7j0qUAXnSJqw8dddr7wuhynhnGmYfwHSqeO8GOIL0eK3+u0hFuBo?=
 =?us-ascii?Q?2K64JCvzlviVpp6eEK3LEqKAGbGRX3Ce5l7AKjCApO9H0khLIhiN17yiwrkB?=
 =?us-ascii?Q?U5bvq1X7vg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c4a98ea-003e-4b25-12d8-08de684e9500
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:25.1454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z/hT9CeSG5f611hPUwMPQEpQ4EYnoJ3tnfkqgsrKFRQl0r/rRKrZgbz8uKJ4H4reJB3+VyLRDEZ/ZXj6sXJ5VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
Message-ID-Hash: QMZKA6R3HR5VYYQ2REES5IZDV2Y5FYLT
X-Message-ID-Hash: QMZKA6R3HR5VYYQ2REES5IZDV2Y5FYLT
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QMZKA6R3HR5VYYQ2REES5IZDV2Y5FYLT/>
Archived-At: 
 <https://lore.freedesktop.org/20260210024601.593248-19-jhubbard@nvidia.com/>
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
index fb1c8c89d2ff..51dae900267f 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -41,7 +41,6 @@ impl Falcon<Fsp> {
     /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -66,7 +65,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -85,4 +83,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
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
index 1ae57cc42a9f..f63a61324960 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -444,6 +444,53 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
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
2.53.0

