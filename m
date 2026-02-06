Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4EE9129D
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 04:21:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E38E10E382;
	Fri,  6 Feb 2026 04:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e7aHr29K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B64C241B4D;
	Fri,  6 Feb 2026 04:12:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770351139;
 b=V6ptL2VYGOE+ut1LJtDcgHvWd0APSkcFC6vGse6pHfh6yuI4zum4iInlHxhed6LaPd7wu
 6XF3fZ1KqpCtpHyLfYDhIl0kHeQ0Lee9nI4+6eRj0deBQX7EZ6kCO7jicg7/BxxLGF7xg+N
 lUqbShMb1A8ctzIKGWv5CPUkVyvY+lCHF5WaQA5Ob0EQshvYx7X41Luu5AsaOfOVslOAnJT
 RRk+BUSDpkye33z99tl3zq93exjV0LnSq83ehrVHjqI52Kprr9cZiy0vR8qMysHushar/mM
 t4GAZBuklqqhdqqL6RZmbmQBuCQFrkg72RjD9MYkRWH1KhBHI5R8hHNihOmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770351139; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KseHWxD49ciminLMaryksRG5IoLWQZRya9Z+GQ04r40=;
 b=hdRUgYbmvXO24CfOPxLgVj39DTDttqtP8Mcp1VEaa5l6omq1/olBD+yTb9KLKRLQCWYQ7
 +eUJvwlNZcxQuM5kZoWRhn5Msme6BFiFW+UYufkN60guO0xFVTLULJ3re0GYfTKsqYMOmPi
 QYOSkYmKG+zAdDpUanrklnlpG5x0NBUtcidELCWbhuEgN8QYzW2lSEP93yLiRzi3hgknVsy
 KT83AyDUL7oDTVUF226P0g6Mi8sTOnejM1wMfQRlekohijaBqVMy/VCRJtopsph/5wQi/eK
 Ibl3HD//KYyin7MLMSFEhb6rdOB/0MvoFo8p12sCaNk9GeYc4bf25l7u1y2Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9237441B47
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:12:16 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ADBB410E346
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:21:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6Z8YlybieVG+VqE8PoPpusoEtrv3dGj6BQmHPzNR4jTwywP34xlaB/lYrEn28hLz+jueZDJCSbLgOo1owBIr3xjbeJCobMtNZ9AcqYrAaVMpSKo9D+PIJ9dL1dkbYGnghpAW/DFxJtQnrDMDCo9rKlOBkf2qlyNhVnKmUjM7A7/gEXpznC4tn02R99cCCCJJrvamartPtNcHNXpWM33fN9BlSaFmVa1wRXuMSiqv3BYyCLt9uc2H+FbLIQxxwczjzNA5gAi2C/A/NGyYcboT7z1tKhT4FMSUJ2sxvdkcR6w9sDcjuHnemZIBBSC7MNv95K68n4r1XWRb6J92revkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KseHWxD49ciminLMaryksRG5IoLWQZRya9Z+GQ04r40=;
 b=dvqVP+KUS7k5JifqOTc9KZ2OgcuAneRL27VkLAI+CCwBeL9w5wp+TwJZp6uv5Fxovs3uE+PYV+UkVMeAtrUmtF8b586KvpTxSu/uVRdW+JRXgo2/mA4LfdHmPYOZ8cD189z6WuetFkXpppSbUliq/eq+REIvzFe85nGJk+wE1t50a/qvxSwtignqKNAnJ05Znff9OVX891qClGtVst9wNMittBDAjvHaEzVtgNqzr8G+r2TqanFPspo+7xU8MocLI44CqV8AneKwJQQnv1HHdm/NLNzqBrYYwwFvNAGT/8WrFM0u5tS7Ov+kjrrKW4TwcL63rGG0hx/nnFp/xYApuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KseHWxD49ciminLMaryksRG5IoLWQZRya9Z+GQ04r40=;
 b=e7aHr29KPqKUyOsr3mBnc8e2zlajw+AWGD/DQ+TKX+rwJ5JOFo0S7AnW18PJI0jAWDdrCNHv7ulVVxwxuDUF76v1UYqZFK4MvtwKaCKnL9FNyMBUyVkAw2KGvhZSxgcUY7JXW0Uz0gpKfvog5pUz+MCQnKy6b4qsGgKivE0CG213bMAezWGdMOXkTjZOwbykGLZYd04FfCiW+kVledsYL+9WzmWQF54Q059xQwx+LImykTstl2pEKaxLqoTaxsKU39/qHm/pOiSr09thB6Js14GM3Lsquzt5JutUcrE63Q3wytatxCsmiIGlsdGlKXqODRxzVDqE8679VNFXaAA3XA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:33 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 05/30] gpu: nova-core: use GPU Architecture to simplify HAL
 selections
Date: Thu,  5 Feb 2026 20:20:58 -0800
Message-ID: <20260206042123.303281-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b818222-7807-4f1d-7768-08de6537359b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7tqwWOBC2OnPFaY0miOLzj7brgjX6EUv6aM9sGXyd8AVszOrZyQBHmt57HH9?=
 =?us-ascii?Q?rvx2uPAHtuZoZ6RP/qkCHPjye5atL5Bm2Wn+6EdaOSjQHbcDCK24R9sWA1EX?=
 =?us-ascii?Q?EPe7IIbnERfEOmE+4subwypSRZ5XYAIy+ld3ySeBoiJHdeKrajhJgusUcjkz?=
 =?us-ascii?Q?gkFgXP7Tgin2OergFRRQ2TLGA1eu2iV6xUH69/oiJhCEGLvluHXUfPFu1gKO?=
 =?us-ascii?Q?PCa0Zauo/7TLPo2haznenFOVaAJQXxNsjeSjzzPaESMuYitJItFbHjmDzDzO?=
 =?us-ascii?Q?BPT+NfiJUruBFrxmVMEhd84Dj5NISV/Gffz4FwC+8gMRYM+F9IvSBKMWCpPa?=
 =?us-ascii?Q?D/ucWz98ZLeialtQivb10BNpeeIn2S49OjsSnyC1dWKKHaGmEAN3NL68Q/TP?=
 =?us-ascii?Q?RD0BvLbbF7Cjqq4fDDrylZU0p7iuO+giLQoaUUIZlvPpM4/uxYhc29gfks+9?=
 =?us-ascii?Q?w9ac8z/+YYkbxPSUaE0edzqivLnIPzF5OuclLofhMyI4aEB0lfdhEmViVqZx?=
 =?us-ascii?Q?xqcZyx1I2XwJFSDj4VhJ1/avSOaonSrXtJN3OvoW+Z+DgzRMZ8QhuCvvIgn2?=
 =?us-ascii?Q?LhhjpdoMrrCD1ajcB3n30na+xnSMviBPl3VtFS7VonAloOuMNH/T9YvEYqxo?=
 =?us-ascii?Q?DpBYySi53wTslKityz2NTkHTUZOoC0hpzVsMHqlI8r/Qtf/LwCHr0cxyZy4n?=
 =?us-ascii?Q?TBFxJOJUmzWJ2+VrDYJuBNZ5EIRX/SjJf2w98Fo26/YaoSAb/8PZGB4cwMkZ?=
 =?us-ascii?Q?WE24LJt4VPS9BWgbKv1zH59dqmRexX93Q3pBqlymjB09hwQfM0uATNTkMU8Y?=
 =?us-ascii?Q?KIJdCn6jEqqVlqyK3r9b6fuGvAeqjZ3Qe60qBafB7kRBJj/8Tz0FC7hD7ZNR?=
 =?us-ascii?Q?dnNWM+GYuexP16mTepwCcRl+o0mGbMpSCazWamgn/pw48wZM0POJU8RsPC8S?=
 =?us-ascii?Q?jV/f4wkstQmXbYz+/YRJdwpwIObStKPE0tPpg5VAnlZo0iPkVQux+GkHL6rI?=
 =?us-ascii?Q?KL8b6dikrMpI0qQaRFRcG44wzkbzMb9P7WGEsrp/QRhVHmm05MbjllROyGWp?=
 =?us-ascii?Q?vinO83QMGhTwqrEiwp2NxbAzwcfS9pES6B/0bVcOINaGfeL88z3k791Gqm3J?=
 =?us-ascii?Q?43hMUvosnDibwiVqNkaG5JNbtyYnanLVHCpCPW2Vs3Mo25AX9PDw0l+Ou4nL?=
 =?us-ascii?Q?uOujwWGKCQEjZCioglMmPDmGSjAORgXuMjYqT/uh4TNNbFlEixlniBBszPII?=
 =?us-ascii?Q?TewszsjAkCNCAke0L5g7w6FdJeLUvvJKz+02XmexX7q0JKqcq715Ucm2OZ7e?=
 =?us-ascii?Q?vJ21lnGsyH849Rc7/AAi1rjZpcGMiPbKCrLZPQt15H+EgDUJ3cGQy5amDFef?=
 =?us-ascii?Q?+MiV2Hs820fBOKuzuqSR7Q7Wu7fJ14oqPWCcHVtipCPrEII/ekIQQ2t1g3fz?=
 =?us-ascii?Q?AHOaiKDWhuCzERi3cYVpsVJMqANaVl6yieKQCdN9Z6UPLXNA7qPmUI0SNkUA?=
 =?us-ascii?Q?D4fmlFQSs1mD8HIdkjUi3gJHxKlpso/WlYA7QJc792NibAlVxEEUPzVeqzdm?=
 =?us-ascii?Q?D3xCGcwFnoFgoehac5Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L+0n5Wt9BQi19tU4x7X/2BItGckFry6JOj8C0MnrfLHiwsgqkRp13beRid8B?=
 =?us-ascii?Q?YEXIS9ICQmbbkv15ozDtdkuDgQNp7gPg2rGuWQoOY+fPmgeKadygCel9dcn4?=
 =?us-ascii?Q?/8WktL/WCZ0Y2gK891rQvjUmy7uHqCIbU63TKe7SSpafPZqUyPj6js+nF7OK?=
 =?us-ascii?Q?zVcYDobiecxw7ju1IT13jsWALccGKcCh/8gXeHWLM1VYSZ1/lCVaFtCMgV55?=
 =?us-ascii?Q?B40eKlVSzjJyQsueQLAW9/bzxO0P+tTRT2PEy0QB8Ioi5yGj7QOw/zv/rTGj?=
 =?us-ascii?Q?gI251izJUbHITtxAYFtntxuJgZzMJ7vlc8joh4zxp2uVTOG3hGm/NRwtMrg+?=
 =?us-ascii?Q?XlWOM6KYuMKb/DHTZj18odn65/Nmq73ftywiETwKBX3968eGtucLntVSWYJw?=
 =?us-ascii?Q?WTOmsiZ5aVGZx3fHJ1uMURhH7FfsO5teTbTXCTSKsXSOP1fXsQI6LoDzzbzq?=
 =?us-ascii?Q?TeSFUq337SD9Fvq/cFNkJA/vz6CeaBuiDHCVrgeJJdIjJMrFAnfFGixY+zPE?=
 =?us-ascii?Q?Zg6dlWymSpt+IE6bgYMHHXehYntTnqL46MYjhwLQ+GEYyR8AV6jcV3RhqSae?=
 =?us-ascii?Q?cWGViq26EN596ecf77n9LqCBDlDJVqJS+q6fa8KYGvIPBXSu21PSZ65U3Z9c?=
 =?us-ascii?Q?UR9qlDVc1LgBkMBiFQbz4fO21qblQU54ryVV/3dzHCNNafYia/EgeQ/GQoUu?=
 =?us-ascii?Q?B/5mpOHeKwIgPdgOK8IZRJALFFJggfgTlp7JYXghm7zb8EzxBKDnxfUUoOZ4?=
 =?us-ascii?Q?g7FFnY1HJ2WJM2P+feBIlNQMW4jTyfG5tKYuRfety2MwArDGY8zm2P7gZ9uv?=
 =?us-ascii?Q?UiYOQK55+HFW4Kem0rx7HQOQUJ4UZL8/OKB1A6K5X1mFvIurQ/qx3lmTbSkM?=
 =?us-ascii?Q?9aD/5KoUij7zY9PzxO9/Wcj4KCtTu3GKz+ArTCEJ9CPW8TUTKqR3S2Jgh/qf?=
 =?us-ascii?Q?GjG2QxtHl3tV8IjR2E+XtmSHaUeTq0CV1Cs4TIZ0/1hgll2sQN7+dkvxRaaA?=
 =?us-ascii?Q?NPK99ubZZOT10bDR7I3Gs6ZFI0uhrmT+wzyphftDfYOKQ0/EKWaxZ7CDm7Cp?=
 =?us-ascii?Q?mIaR6kvW+zBoEpXleKhXxqinNDQey7PuZBFVbVaXw1VV7NpYTnGrlR2mmf/m?=
 =?us-ascii?Q?ew3pgfbl5bHkuyzSt2n29FkIc6BO/PUtzChTddimwWD23J7Nwn8RzbVDv6Ay?=
 =?us-ascii?Q?8iih4QEzQ8TnF8G89ZDYNPqbESNX9iYf+y8juEzFpW4NDhz03I6dN6H90+88?=
 =?us-ascii?Q?q6di5yCbq1SYdeoHAehE7zmsx/pxLjgpNQFAPut6GR7h//aK8AXGR75tDewn?=
 =?us-ascii?Q?ijTIXW3q72rbKb8gxXvKArsCui56u7gAVGFGLX7x/l2GvCQ/nd73GfEUEjJr?=
 =?us-ascii?Q?63pUs8cfkKUqgxPTMPETGHSF9dW4mCzeNmMKA5M2TJhJCf0X++WN46hwlGQp?=
 =?us-ascii?Q?9CYSf6kuAKKzWBpxbZseMMxFWAYQM/DW82hcBXRmqM/oYJOU4cGPLHTAHEeb?=
 =?us-ascii?Q?v3U4mUZeSB1QejvC651n8PYzgN6u83P5ioMCj5c4lDJgFyEQTtK3zCY/XgW6?=
 =?us-ascii?Q?VNEMW4q0oPLU5siTSgk+oc8HONoQoXek9pQqdeEec1jy5rza1O3b8avu0Vvf?=
 =?us-ascii?Q?zwzayo7yO8bXItRR/wKG7DqDZWjJxgCQtpxTNOzujFj+BqqISDXlWhaDG+lx?=
 =?us-ascii?Q?2F+LRSaM3Hy6CUnOe5hPlZ73jK1DzBSq/kAqurSLJdwlcnoLnf1T3A9s71Cd?=
 =?us-ascii?Q?Pda7biTiQw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b818222-7807-4f1d-7768-08de6537359b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:33.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PVaYiuDhupIHtSLL1bp7I/EiRBE6w8HZWqlZz8b/oj86kWNTLcKA29qDGlfn8KPQqT++1sC2Q15/3uaOCyXmZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
Message-ID-Hash: EGBSDRPGTX47OEAPPP52CXIDYXL7E4SN
X-Message-ID-Hash: EGBSDRPGTX47OEAPPP52CXIDYXL7E4SN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EGBSDRPGTX47OEAPPP52CXIDYXL7E4SN/>
Archived-At: 
 <https://lore.freedesktop.org/20260206042123.303281-6-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Instead of long, exhaustive lists of GPUs ("Chipsets"), use entire
GPU Architectures, such as "Blackwell" or "Turing", to make HAL choices.

Note: Left a // TODO for GA100, hinting at the remaining work in order
to bring up that chipset.

A tiny side effect: moved a "use" statement out of function scope, in
each file, up to the top of the file, as per Rust for Linux conventions.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 444c95fd4ece..edf4d27d54f7 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -70,17 +73,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 71fa92d1b709..d795ef7ee65d 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.53.0

