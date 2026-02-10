Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D60E9462B
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 02:46:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ED97C10E4C4;
	Tue, 10 Feb 2026 02:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQuxOcrK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C88C542030;
	Tue, 10 Feb 2026 02:36:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770691006;
 b=t32O3ceomlXa53hDWkQ+Z6PUwMxC20MX8hGj98RlRO8WF7j/PwwkbmdE460ZKT/1O1Jf3
 95HSJBtgmzKdoFJyK/9fvT3LHYMvUC6oUlNmnDnkp/w+S70of+C67fQUa0j+ogTvkCKxhmf
 vR8+mgC/LhCUX0n9qYG3rlnBCjxd0EptX1elsRv2tfeIAgm1wTVvlEqkIom0spJesZlIqnU
 Xf+kI9+0hS29bbbHJPlBeuTX9IVf0yKV/pk9d1ugbqGvf0Sbg5SB3qnfzNeH4gebUNduUd/
 yRrhe1nHuBw/q2APQeTOLS1CZVeA+HaVPNyV2bz5Wc2pzuy76bZ8QhMSWHCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770691006; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AMGzlKC0LsF2T3Lj/OenFLl4ktj2PyJJRhM3y9qUqww=;
 b=fhp6zeQKSMXIKa93UBX5056BHRCwctiJPe0WLUcMiw66ZryR3n2GeO/e5jcuGxTNXqopa
 ps2bI+8gnFeE372LGVfit41uSUiCAwOLVILGtOLneLMJQFmcMe6y6QKMfzStw5fLBOd8N53
 UKXAXy9YeBRWvlIHIc0ivi6Hl13pdCOkfULkGy21hTw66gIk0j3L/c6Ws0wY/P4Y8iHe5mm
 aeSZfc32NuDSfMmF6E2vHM5rC3BGNl9uR/NIDjfRh+Q5lXgvhLpU40Yni83EQIa6ZCTisLI
 v0113Qfx5F+mKQAACSm4QFA5bUpT7KEcF/vRvx33qE11Rit1YwJYmZlyGuUA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C82541C6A
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:36:43 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013006.outbound.protection.outlook.com
 [40.93.201.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A056B10E4B1
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+DZRrF7jZR7JNO7dBm8/pNwgkyj+4KZ8P3w67Gue9ZYfNHfgbwJzkHG+3jb90O1xniAnKeIOxba72NjyHD691RPmJ0iO6bfKTMJM/5mVgncZ5inTOAO4+RzxFUaHF6FyA4SmIBBowaxAGgitZ4D3q5ae+w/FzsL9uRKxyi1sCEgJBWvgDSgURqnASFWhUq8BeXGcsMIY3swNXZkwMvCh9wNThqpiuBfk98N9LQChG2lPbGm95hutF9tmMuIedk6Hbg2GcpXdKUp2zZwpkOdTeDaUUmBCaSm6Yy+H/891mhXdShrIJaLj+oPPB8SaFQ/+a56AmgOR655mqrqVRQR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMGzlKC0LsF2T3Lj/OenFLl4ktj2PyJJRhM3y9qUqww=;
 b=SKgjK7nydWwi9LNwewbDPZCitdvIMqieMQJMJsupkTOVF9UR2v4elZQi/GW0q0akFnX02WHCx5DiTJ6DJHAthzr3TO89KETUgHXci2+bc+U8Xm4tcgcXC24o9kcXDGcfv3j/nJlrpk6V4OprCghE+diGtXkTglcdc50dTnbXkxBrm1DxxOHi7szFKEfiSymWyPnt5IGBFLhcCpxpkWyUmH5w2Qick6xLtjYMjMoLZjlzygJD3qElg5QehUivE1U9JRmWmrPtYbbg0T7QBLhR73J4zTzt92vaxUXZc7NREfjzUY9QYNiE/wPYatxHXZ//Hp6GI/kzBmFQjFJf5nvixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMGzlKC0LsF2T3Lj/OenFLl4ktj2PyJJRhM3y9qUqww=;
 b=PQuxOcrKffHMpmkY/VTJkXFvkWmiOZegLuJM9vgGePUbimd55JzpwxtSiHsUQGU7LkfYxhkJhZn9n/dPesDPOqO89PMHvsnkfDCjSzKAOIZDFv8xszcDAdHy1/HST+jw2AU31+PXxZfK7fLKrjOkeGQ/5avj5EG69HwmAyHSWiQeBWCLFffxChEF8WQglgvoe/OTznJkMUT8Lx1YfdAsGaOYltB+P3R4ZWfKSTmsbI1HLiQeJ8QKgQ5pLxJ0spxc86Wd8JdTTwjceOCg8Z9jHim1cwbYudqF41TfkddG3Owyi78v1h4tsHEJgBAVUByCVEdnBubX/Ol300d+5ZpAKA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:08 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 04/33] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Date: Mon,  9 Feb 2026 18:45:31 -0800
Message-ID: <20260210024601.593248-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 7773c22d-65c7-451e-3523-08de684e8ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vbKvUHek85FkAhcLyktSnsJ63jOSjRPMBwkRy2asPtfokIqev8adGeI+BLK2?=
 =?us-ascii?Q?680HbmNKD0WHKpqpaOSwG9tT66tN1+S8+HWZrsNQ65MKl4k4cl22NFD1SHen?=
 =?us-ascii?Q?E900LWvRRM5urZVXqGsXg7V2fyvRVTKJMGg/G6+S/QupZXzvXCTWsYduYOhq?=
 =?us-ascii?Q?t9QHCFerV/Ss6+lyn9yXYQ3eKs7Aw/5/+AKwhKe+RPyXFsl7YV9CnSrK+tZ+?=
 =?us-ascii?Q?VrndXf1hjVBKhXU3yHx67IPeaEyp2WX1Tg8cwd0c9+pU3S61djmLPznMmY7N?=
 =?us-ascii?Q?zqoDEszKFY5e36QTeZQMYVlNCzMzA2mPfoNRAbc8sdVS2vGlW1gvISnpMOkk?=
 =?us-ascii?Q?nNBRZ4MrzdTnz4ErjBu8pOWByyzdcToQdr0TJGJWsBcbMKWSV5u2LnFdnqO7?=
 =?us-ascii?Q?bOKesBtpE2glnwB0fhVW32abX6cR+r31Yl7+8lm7kUpc5piWbKJZyahVOwih?=
 =?us-ascii?Q?lguA7e5OyGbxUf9iZ3wI0+3nE4XAfl1nSMqizDOUNG0FpUMY/DDj0gNupWpU?=
 =?us-ascii?Q?DhSFpKu0jxfsBXbBQSglGyrcp8xr7ifLE2a0hC9iB+CBIbKubX9mw1t4TAPY?=
 =?us-ascii?Q?OPqWQUgDHpWZK2QvGGbTbQvFr0R5IPcEdLILDeo7VMPGMTfaD4j52h9oynu5?=
 =?us-ascii?Q?fF/xIu9f1u491G20ANT0iD8TDSATsmYImSGetP9VxYwnChBCgBY4QOMJjqaK?=
 =?us-ascii?Q?/FDybNISJwSChHwiG769OA4lly0W1RF+zsg6kngk9XQjq7cTGHbLMj77IQcm?=
 =?us-ascii?Q?RLJC3t+bZ3+KFwMBTkUdwhHVisqmaHfaQdRAxyYbWlS9zzPF3Offyp4zaWL+?=
 =?us-ascii?Q?Y7wKLWT/khXIiwPtaECrCZfGcYodLXlh2Ttj7+rIpd0bnj4jBFqnXgGDA9Lv?=
 =?us-ascii?Q?SyFO4pr/oxzszLMqRjFVFIgHwucZ5n2n0v6l2yyMxYS5C4WqIHiPrRLvGkM3?=
 =?us-ascii?Q?GIQe+n6+OQQK+dTJjhTLK1iLabS2ya+V2/vCJ3R1dMIIV3vSDRQv1553cKor?=
 =?us-ascii?Q?NGo8TtNmwvP59PYJUeJDd/y1QfSCo4q9ZrHgdXJx6iO8HZ+KKo12Mi3hwrTi?=
 =?us-ascii?Q?F/KOzeXMM04Id1FlzJ6mEnnhSRQWaGU/jdnaMWLl1qRxyp/MLUrTAXXOiFVy?=
 =?us-ascii?Q?vE9wpL5EuLGgMK4ZJruxe20VeLkY3HkVS/QR7OOGeg3AefqsIzmOADxwx0tl?=
 =?us-ascii?Q?3PyDQzk1df9KBQuiLvIfCnGZRCWMD1hq4stGgnuIr6WAcBqLZUB+kS1BbWfv?=
 =?us-ascii?Q?ZJMVMRlMT20a8ehafYtUURZqZeUYf+iih1ZFPbKumUQ8MpmGZ5mEUPk9aN5N?=
 =?us-ascii?Q?P3B3sQl4ElEpIIvgrLHh5DH6Zsqu9HS0FFjatR/xYgI5GRgKGQvqTYS2/4Wy?=
 =?us-ascii?Q?khkk067Qegj/0bGazRrZjDk4wFIBDpbevnQtgxxB9z0ZbJZSGW5BPhuwv3Uy?=
 =?us-ascii?Q?iuqqEMM2JKMcwuzhOefGUxUzHRoUnOeJLwwKxxTd+I5Dz6B57A4D6iKuWqT9?=
 =?us-ascii?Q?T3ZSLSdaUWBYlJ06OXCY30hM/AW2THqtWvquDafqE0Wn2QA0us3/YphKP3qY?=
 =?us-ascii?Q?rgMPUUmZfZZxRgGOJ2U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TtMFnyqI4+jH5hvPP/Kk/NIyGcBN1xusRaIiKBRzy2KlX1Sk/8b/fiAybwvM?=
 =?us-ascii?Q?hsvgKo1nPqitRWynE4Zte3Tg7g8rL4QXlqVflbpAhwsUsmtzD/7hsTpL9bML?=
 =?us-ascii?Q?n5q9DLRVQTh35B1vp3lmdrvDTxFP0I1FQzYuWA34tBbrELF0DFLt+sGKNDl6?=
 =?us-ascii?Q?qlU+DqPNOpiITmr8kqD32fgM4Mn3pZv6Z02Ccwc19JAEN5YdvHLhdLDdv7dS?=
 =?us-ascii?Q?kE7NeKY7eeMmWaad6tALIp+F2kuhTuGTdMkiR5A3XkO7laYuyPkm8/Y1SXQw?=
 =?us-ascii?Q?r6kfXkXM0nMd6ns3kWvFejBAoN4M0nJSXDuqFgP8bKaq1Nc8PkZIhH+7jyZ1?=
 =?us-ascii?Q?ssYOQN5a2z/v3mYewgtF7thGpSdw48Wxv0WM9F/zW+DLBXIpcLNBoBpwxEa0?=
 =?us-ascii?Q?7nMzEu4FV/5X7DJyW5cGkp5q/Sv5tyYQPbETU1q2POG7JMnqiu2n+dBcKFiT?=
 =?us-ascii?Q?KAJ0qJQqD9gnUxxTkKLPGBZaXMFMkS8pvfNnRbPG4ylbp4lHDPy1izFGNkOd?=
 =?us-ascii?Q?dpWGjF+wWEmiJDdlf3O90rZU0tErnhlnQqNfoH8yphqENUmTaA6vODmZVo7h?=
 =?us-ascii?Q?YO2bG5tBASYBibxtQ8RUaxQ5J9IngtlfZgtlxxiZGHh+WS5Ei0PyUqR78HJ1?=
 =?us-ascii?Q?UrA6+dZrc8FZyaOu4vT3B3zgzGS32z6EL4Q68tpMRQW5+j373UP3ghRgysg6?=
 =?us-ascii?Q?KCElmZBY6hGaKAPlyUMbwAWqoKEX6emopThX48kOOL4yN/KSKDUGO0W/M1eb?=
 =?us-ascii?Q?hjnPs5aujKY4vfSKLwqlPgIUmRvcSErGAuBvmIgrNlgec0daQ8aff7yYRJ7d?=
 =?us-ascii?Q?Emnt8MxgKzidHUiSPUzdgjoDJN6YnXWz/NvVlHo0PxNOtP9LEWBuouDP+wfl?=
 =?us-ascii?Q?XQ4xMwEu8dY5bXJ43T84Dq2NK9apWMdL46qbTOBn1H2KIOTou56jIUT/j2Lt?=
 =?us-ascii?Q?V9PPqpt2rwvYVX2ysDsiQ2aA9UJQCXubwvRbdto+WriDjG/BOV0cOnovzogj?=
 =?us-ascii?Q?ZbhXhKCWtGyFMuEY0lAI9Tao6pp2xvbXJL2qzLajwEttMgeqDkhIlGtxFPW/?=
 =?us-ascii?Q?3BaFq5WbMNp/+girWsuSq4zPR7oUjN+vqQSqmOXYu2+1jivBjtb+3iNmWoo0?=
 =?us-ascii?Q?MwM4eL9aqfvlbzkMHNpsLk/nwWvnl1+4hVatjODKSr7VNTAg2eXu/GmxO9Lr?=
 =?us-ascii?Q?wzM0MeA4020Ml7s1WdsVlpOpZd1gY5CxbW/vr++DaSgUaINFQi2P+6EesGak?=
 =?us-ascii?Q?mTYzFLNHjlz+feIFSPoCqVcF0fN0lae9XvRa7JW8T9QrF0hQFdQkNbz86xPy?=
 =?us-ascii?Q?Vdqr5Y9JcVXUECwvwLdJirpTDua3Z7pIq6uPAV0glMAYpO9Q+Sf/NuhDq3BC?=
 =?us-ascii?Q?BqovkuXhILlt2Yh52wqHs+jBJf/meRTfNeIgyrYxp3Wr/VQoxJAiKEYLSg0z?=
 =?us-ascii?Q?/Bvy4CdFXVmynnmSztjpoGkjlbv6Ba9+1mp54ZxtK9iNh5SzcdYvgk1FfpS4?=
 =?us-ascii?Q?sGsy3L0ZcW3SruUMWbX9KwN9z4MJ4XE/sHfF6lLjwPVYQJsyHt00Zoa4H3fD?=
 =?us-ascii?Q?gmGsp97bZLjsVWCBTtCE5P9L9MY3F/pJV7pEwiyEAFP5hCW1uSx8hcGEr1hK?=
 =?us-ascii?Q?RaxoPlJaYFUKdnn4druaXJ2tEvVTj6mNw4sTE/WXFuZODIPknDWOxi/l6KvH?=
 =?us-ascii?Q?Znvso0ma53v7kthPV6c1KrQRhtv1LJHb9fbPr9JdG3CIOAjK+ThZRx+UTQML?=
 =?us-ascii?Q?bozJiIBP5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7773c22d-65c7-451e-3523-08de684e8ac8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:08.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 w4UzeECJs8jhfDxkvGlhaZBco6ynEQOtwX+IIcrw1dwFcFenUji4VxUeVIoLMzeP0p6BA8OLjc+75w7H0BwRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797
Message-ID-Hash: UFZ62K2MV3Z3O6BCS25646B6RVSJH6JW
X-Message-ID-Hash: UFZ62K2MV3Z3O6BCS25646B6RVSJH6JW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UFZ62K2MV3Z3O6BCS25646B6RVSJH6JW/>
Archived-At: 
 <https://lore.freedesktop.org/20260210024601.593248-5-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..444c95fd4ece 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -76,7 +76,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..71fa92d1b709 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..bc2243450989 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -222,6 +222,23 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell => {
+                            // Distinguish between GB10x and GB20x series
+                            match chipset {
+                                // GB10x series: GB100, GB102
+                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                                // GB20x series: GB202, GB203, GB205, GB206, GB207
+                                Chipset::GB202
+                                | Chipset::GB203
+                                | Chipset::GB205
+                                | Chipset::GB206
+                                | Chipset::GB207 => ".fwsignature_gb20x",
+                                // It's not possible to get here with a non-Blackwell chipset, but
+                                // Rust doesn't know that.
+                                _ => return Err(ENOTSUPP),
+                            }
+                        }
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f5907c31a66d..b6a898008a59 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

