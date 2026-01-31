Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F368E6BF3C
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:56:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1AACA10EA65;
	Sat, 31 Jan 2026 00:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gnDEFuJk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6B98541B4D;
	Sat, 31 Jan 2026 00:47:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769820452;
 b=Bs0a+D2mc90gYp6R9yxEFPUUziAs6LHiKKZqeVDgOqVS7032a2iff9FsaBAQSEklO/QCu
 P1/2QqCZslYUHCDtVJxs55hMeWpFK2mkDH3SLjP3Yr7AJqONMa00Admwg1C7M7hgJZVaFT7
 Mnyw67kw9y/RdUEaObJ+F2f8DCB4pf0N/mPFb5fU9TWILCEy9ihl/0gGZ233ejtGLE0eycx
 tH6zrHQ5OTdRCMGC+0a9tUJ5S4mDR42jYFBZrcWxj1agRmsPTYfzSLJCqxhI8o4BbPl/80r
 nV7B1XRI/YDWZcUKu//y8WY/PGoLcPAKU02Jay9KkNiWdRHadxSz7KUbTUwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769820452; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ViJ7jZ+qJp7tW5TbjoQ8D7xxmPqaB8TpAUnQR8c49RU=;
 b=kVmpcSC8OYHE7SKwMM81iUf1vZLNavLDkBHDRNRze1I1dSZZNa2aboJ9L6O0RBOVGe284
 wz3/fcd1rrhkGs4QMlUD0KuW76l96D0Y0q9N/DTDbG2SB6PJMw+E0UdpKK8xfBYwTLaQhr7
 XC9UezQTwYOJnHrsiBm2aFz59dB7qkMvN0hA8RJddCYm89zO4xUi24CSlWJOJAuNBdQK0+E
 qFUt3OAnvXJHCQUUUFk8cIXi/oWFiLLTZpCha9Jifw09vxpvZ5esTK7dGN9AgyJSQt8ojwU
 GUR87SVXeppUXL+0UjvADZLMykQoJV1sXYlLKh3hFg99wl7VNx6VgbHmgNrg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EFC7341B4A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:47:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72FBF10E14E
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULdofn8dJJZVT6OrJdCNfNOYdhMWmnt3tD4kQYg80bubo8mArv5qtu5oacaZRmYkNBL0lIJS9lGfzQP3y76WB3gYJVfnrr/etjqqkkSpzfR/oh6mewFnL7T96j2K0cYZyLiSMU6PaeXQVB2QDmDnHf9yQSEgi41X0puFthnofMQLVDr7QzLG2/NtUkB5R6IInhkcPomNrc6lO5Bz/+2EQux1vhbUa47Y0tjTX8KPr4dopNTiFIaZORTnsUif9D4YtvuyS29l/2//k5kn4YvjZA96lOQ+j9PU8utQwrCm65CA1JnGR2whe9ce5t8FsKAOa4+cu5VOLXtgLMUYvSbm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViJ7jZ+qJp7tW5TbjoQ8D7xxmPqaB8TpAUnQR8c49RU=;
 b=x71wjdhOIDZgDMCR91Ki86j413YeKk8hbqfA4ypTGjjaCrxK0jzUvMli5gwx0FFLHlwKmywqdIKUa52L+C5V+T4YH62bWsPgDIf9W62Sk/niFv/59Ri/mq0UAbtI38CGDr6DvoGFlwOGUmHKGnDVXfvxJJtm/IUkCn0YJraLbHwVGwxtuIw7SSbUY6jSMziCgjMzntYIC9msje6plOnkNocdq2u0oHRetH5aERneNcFnFgCYCN/jYQcc0asnY1x1EwrmsKIw/NAP5GLFD3RBPmzkIZusqgJ1uCNC9a/6b5rJIYevX7jy6cXTVKSUT8IMv+ynE9aw05uKGUyctc6JDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViJ7jZ+qJp7tW5TbjoQ8D7xxmPqaB8TpAUnQR8c49RU=;
 b=gnDEFuJkeyXJia2GC5RGjaELmomcnKYekzFji+dQbfrPeRxCMbQPiGX5vHftCk0JeNfZIEei+xG/t26hTPEr2eVmV0P4Bfq0e4TXAq04uU9YvHf2JQFKdOkYW/0pmAvi4S4Iu3yZAPC60EFFDAocmESWFG8cTbCK1OFJMeJgrq3MEwQbIUJgR0nusUwDjM4qunNPANqj3/qkah/p1LMZcq9kJMdB9N2vatdLmBnFQ8hCp9cspyoO9KNejV/UlG7PO11TP2cVP7+fIh9IQ+FMzf4vFrQkhMlInjSxlHPRbhnDbnbkBtsis63gvLtOsEMB6KnXAF6QKXPFjxtRIz2NmA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:32 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 18/30] gpu: nova-core: Hopper/Blackwell: calculate reserved
 FB heap size
Date: Fri, 30 Jan 2026 16:55:52 -0800
Message-ID: <20260131005604.454172-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2b3044-f1b0-4b55-6b58-08de60639314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?McrVlg7o8fmWFbOFIPxUCK7SSJ9H0Y1Lnc1SdAcw8OSQds4LsvmI4r7g+pzd?=
 =?us-ascii?Q?tj4zLa30AvPPzmzDlxCz1WQSGXQDSxCe7wK9TTgHYGkIrFLudFtPjlYtV9r2?=
 =?us-ascii?Q?xHp3GzlfYDUUhBHh7tGg06AKoFnLxt3sFcwc38WKerbKk7vQ4sSe1HDhKjMs?=
 =?us-ascii?Q?16GO5Ed0vTZ107rTK+a0OdxNyPcKsT6AbpfzNlR4mumGoRb+UnH0K6fFakD4?=
 =?us-ascii?Q?kp/1TclEEi0x76ppgw0e9QemQfjRHOuY7il2Wo/0YedfvNC8wbAXU0ipW4I6?=
 =?us-ascii?Q?7rTmxzWveHnUsx64bx8KiPLFB7PoobO5OAp5NFdkNQqp3mBCIszdnJsxW9G0?=
 =?us-ascii?Q?LSgkf7j3hOBQCEoK0inge17MSxi3J4RZus/dSh3nYtubqz04QkRi5YEzfY0i?=
 =?us-ascii?Q?sozn9qlBY5qE49yXHg8XQZ3s/nfKzmAiJqSMQJULa3O0hWTNRJ5gJIAJbMbI?=
 =?us-ascii?Q?Hgc3Nu9CREXEFMGy2FZHs5tV9zdqtlEH9O97xKIXmQS2oBrGXs0577lqK+rX?=
 =?us-ascii?Q?9xmYocBWZv5+LV4Zxyza8H+qlfG60g8i2mygCEt4vzHnlqoeUfhBCATuv7qG?=
 =?us-ascii?Q?M6xK44czHmC1JJNuo43wgM4xyovA38pvYaDHC8QVtxq0pJTP8lWiIWY2nB08?=
 =?us-ascii?Q?kHA6EhiCs0Az2WUbWiejDYpm0nW8bbL9qvLdF4ayk0MBe3KJow598uoRWf34?=
 =?us-ascii?Q?SPidPP3UGL4DXz3fkYESzG9MaNLx9r92Ix6DKc89q/sPtpocEQ5lMfjRjqhs?=
 =?us-ascii?Q?xD3vRhNx3ag4Zukd/Y9RQacTpcp2xEAPXpmCXozqJoT2sr7rsXzRWlkwVTg6?=
 =?us-ascii?Q?EQg/uyyO6oveOt+oRGaDbhNdtJn0wpMg06ZBcfXKcjVHoW7qMMl6ElYrD7+4?=
 =?us-ascii?Q?9CkpOLtf4EOWZOiTqg36CLH4oK3Og4REm2vPhOPd4rT98XDr2ms9l6oUoa98?=
 =?us-ascii?Q?1Uoax0pOEiceQMSWyUaC+I50DZV4CNffHmj6wvbITMSDPz7ZdSCuxkxMv1/B?=
 =?us-ascii?Q?CO8Muo8tWx3iHYvmQI2RTDy9H6as6T2BdLQYDexHF1omnFqtjdPhccAgIqac?=
 =?us-ascii?Q?M9ZjuBsATbY/jDyIjGGRPza+jANRaynb+nwza5UsUGwymX4nMruvEre0pxCW?=
 =?us-ascii?Q?d5SUV6uNjvpvL6GawcLesgmvYIXXaj6BO1FEF3VtrMC/WJNTAETeA3pp/P59?=
 =?us-ascii?Q?PWhmmT1wNAJ3WWAVtj4SJ7OE2HSxPHoOh68iqutpeA88NxSRpsM/l02x57Xx?=
 =?us-ascii?Q?w/bu7Pz554cCsgyjMTi/q6naA8zQLr78sGDzl2Zzh8wf4G74BbVZZD5sPIoD?=
 =?us-ascii?Q?74igHeFAkXT9utzZt3VRRQhMkS4Ts7Vlq+xccOIXWJE3ELUx5SrAHJ/iocbU?=
 =?us-ascii?Q?X3KCy7xMcJ21mDi+qemdpprP8/OzFXDEoQ4HMXl36PFPioAhyV4D+o22PjT5?=
 =?us-ascii?Q?SCxxGI9yoBiRxxTKlnKmT1zqz9cV1Msy/zHZveME+ooPWxAFzfbz0xxp9qON?=
 =?us-ascii?Q?VRev87wK299ekfKTAgoTug/j89g4HeoEJG1IlwpULSJEvIpOROYkVPyhEs1y?=
 =?us-ascii?Q?Snyi/B4tyFb3/IweNOg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3A8Mcig3Yf5+4Tl+Z+QCRddTcsExCcx/Zs9Sm0GrSSK2dmClx8lGbwbyUND4?=
 =?us-ascii?Q?CEisYH6h4y/6rHkgja8ZmvpjDxfO0q7dzzPcahMz7BfdFfuml/RogNBHPiQs?=
 =?us-ascii?Q?3o67zpz41D7WQNDIA2hhoJmnYUEO2UwjtdNQxUq9ussqbaJRX/QrzY3VZSkK?=
 =?us-ascii?Q?zqeL2LJMPcmU/H1HS0SgVKxI1u6nc25s11mnU6k6tU/vD7qzUmmFOp22ovZd?=
 =?us-ascii?Q?KUk9nNOgqaej8fWyf8uV1yt5durJuc+ZszvE8SShB4Thgr7/+hnHluMaGmYM?=
 =?us-ascii?Q?Bs3XsC7N/Gzo5U7wsoCiRIYX+XLtsqLUAIFdO6Taa+Ij4SBTMU9eAU37JtYs?=
 =?us-ascii?Q?Oj7JI6YRQ992GH/5ncAfAax7zXERFcTBA+cJdMO0Xc698sPUCZvbRasn+3OK?=
 =?us-ascii?Q?45SsQjgQ/I0FHYFe4KhVoDNkaaKQ+lIbaEYcSAD8g03TfBCCXI+lfmkItVhi?=
 =?us-ascii?Q?iWqzkyAEXXgCEoW5fnNPzw6qf20F7toNfwqC2aAnVfcNpr5xo+jrf2s7l8AV?=
 =?us-ascii?Q?PzAhQbByhHxr9/vKmnxPknC/t3MsUhtnxLTQ/WZZD2YtcFmF0WFLTpHkYLr9?=
 =?us-ascii?Q?dJQg8aArjcnTCzO9RYtReOPG/gCQPaMpyzhTRq/srv4LbCe566DSY78XuKls?=
 =?us-ascii?Q?JhPiZIlRGq7qjNl/jD6Huvw6VRjnUlXo8ogBklr3ZCtUy7S8NXwt0Y75Up5g?=
 =?us-ascii?Q?0ondFi5Y4SLwYcAqYML11YgxIaIvTWXIx53S/VN1IYTtkCrkCl7yaJk5XCkQ?=
 =?us-ascii?Q?bwhhZx2Vqb8yoHkwFuXvtsYVHnh5iUUHQIerIbi8JKSaK1YI6ad0ZiTI3+Tf?=
 =?us-ascii?Q?SbojIi4PrbZz34smexfWZ6StK6aC9DmlBBahFdFGz4rmaZD5E1Gk9SUrfw6r?=
 =?us-ascii?Q?qen9CyYY8Z24k5jxuI7iZtEOU846hEne8qAEAMqL0jySbYVLxdvIVCGw0wL/?=
 =?us-ascii?Q?dbEujVUeccqH2Vev1l+tQu5Mu4lJmjSj+wL6aKBjIgTcMg/RJGbIqX2bfPtM?=
 =?us-ascii?Q?fEfkXiwgcozeaCVcAEbQmoYFTqGrlBfN43qWqUXobs7k1NPF/X34XAQA/3Pe?=
 =?us-ascii?Q?rfOj/j0HiayuOw++1PBo529S3hYfaXjdmpBwB4E7eJS1T++OBLwXWDZP2UKk?=
 =?us-ascii?Q?93lLuzeQxCkbI29stRoUwP7wdHRtTIqDUG2saR8eMjcA2v4vmRDpOmZ8XVgq?=
 =?us-ascii?Q?SmcZbSC1iaGDs4/l2LmzXymej/Igot1EkCtMmEJgdnIRQslP2ZGfHPinJngQ?=
 =?us-ascii?Q?CjrKloG8s4J7mZFkATytRO5DOnAg4rKKSWNcMZ+OKJIlRLRG94Gs9eryFnO8?=
 =?us-ascii?Q?vh+CgPb27kcfNNuQBNlZvUN5o50C9iDrDuBCJuwTJQa5m0hwF4HFXSKc1qBN?=
 =?us-ascii?Q?C1SizQnQyXtHaXpYCu3Ry30t/ZgVYiugYpzAgtqdlDFaWAYm2vv+p2wBKMr6?=
 =?us-ascii?Q?jC1SbjauZ2z2sDCnt9fHpf2Hapt3L05miACgjKuwLICC2VMOYi4ap+8xeDPR?=
 =?us-ascii?Q?6edWGddZb7tl7FnhdVTdY5aWovjAJ0f+qYnDgNTIKriZXgWKzVmd5SKNxCR/?=
 =?us-ascii?Q?q5YyxA9Z/20MdLs9GScUuLxBn5FUu4sut7H0cakxX68IFCDPJTUHLKZJU2og?=
 =?us-ascii?Q?KzbbKvLKNDR5MZkT7MjUkS9DlrGH2O9WOioLrNYMqjkQxLuuF2lcP9TEmVvH?=
 =?us-ascii?Q?xg+k4yZlgPFGBO/IN8scmFeCv0FayYfREtCcT1S1cMXqRf6FdZPJK81gQ+3W?=
 =?us-ascii?Q?odhYch1FFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f2b3044-f1b0-4b55-6b58-08de60639314
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:32.0468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OnUxS4IX0FkvQTho6gsJWv4ilOTxEzgEvPHsxjPloY5JNx9GiKdVK37+1euO7AbP95Iu9fDFyfoOzpZ2Q+OZ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
Message-ID-Hash: JOIW6YPSDJOALW6NV2ADJJCJED24PT3I
X-Message-ID-Hash: JOIW6YPSDJOALW6NV2ADJJCJED24PT3I
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JOIW6YPSDJOALW6NV2ADJJCJED24PT3I/>
Archived-At: 
 <https://lore.freedesktop.org/20260131005604.454172-19-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

The calculations are const, so a new const-compatible alignment function
is also added to num.rs, in order to align the reserved areas.

Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs |  6 +++++-
 drivers/gpu/nova-core/num.rs    | 10 ++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index e803e6e0cdb9..9b4407338724 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -170,6 +170,9 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// Total reserved size (heap + PMU reserved), aligned to 2MB.
+    #[expect(unused)]
+    pub(crate) total_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -257,6 +260,16 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
+        // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
+        let heap_size = (heap.end - heap.start) as u64;
+        let pmu_reserved_size = u64::from(PMU_RESERVED_SIZE);
+
+        let total_reserved_size = {
+            let total = heap_size + pmu_reserved_size;
+            const RSVD_ALIGN: Alignment = Alignment::new::<SZ_2M>();
+            total.align_up(RSVD_ALIGN).ok_or(EINVAL)?
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
@@ -267,6 +280,11 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            total_reserved_size: total_reserved_size as u32,
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    crate::num::const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K) as u32;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..086153edfa86 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -183,6 +186,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..f068722c5bdf 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`kernel::ptr::Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+#[inline(always)]
+pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    build_assert!(ALIGN.is_power_of_two());
+    (value + (ALIGN - 1)) & !(ALIGN - 1)
+}
-- 
2.52.0

