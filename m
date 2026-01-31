Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C1D49C9E
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:56:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18ED810EA5C;
	Sat, 31 Jan 2026 00:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g5DFDr3K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 691C94140A;
	Sat, 31 Jan 2026 00:47:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769820471;
 b=YTtLxqLsi9vh3V+E5foelAVrvi8tH5vBbIz2zPMHRi+c99lw4OosjlL281pZK+JAzmJdh
 Y6OD6bWUZQSgtmtjxv+uRcoAD6NQuvYgCz9JT+9jZTFBal2fDnqYwdrMkUd+Wkig/ZRNiIf
 iKX4WuxK36ruXZbYTa1n84LgsJHPZ9t46PCmP7hheEHzCNBVds/qdtJQxeQ6olVERpAYBeP
 5cwx+21RnSt9Lzdh5P1fsjZsvYWjNHCMaATDNMQ0LIwuk3x2YX2bpGlw49xRLGpPSiUn0lN
 8e8lEPKbqsA1g4XqCqy4pDExAZFg9NDE2LFiqq2FifwhwIeCMS/HEJC9BxZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769820471; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Y2xQh2jeSN7wumYmbEOQm8sucNHxJpRMjQ60PChpQA=;
 b=bDggyxoiSQ0Tf8Hdxq/0DPkF9+46QgPUMT+SZ1n8jgtQl4E5dIIby1mZsDI2xUprHpLOa
 QakkMeNXyOWdvGp+lDulzASxnDcLvRJJzylQGKWc4ofgZj4CYZEd5LAEsx8vnhQgoFha2td
 Yt8QY08zwmjLlpvMoIQae5/1HJK6o1Esj+j6716oDHampvGNcvCJzwgVl4xNA4iTq4dmS36
 wXhx41R4UjVcc7k7KEQMkIOowRjBwTRSLMODqcO83GISv8HXh9UxGgdeEdO6naM24LAPUQi
 LWhWLx6lShAa3uzX0rLTSi1WC3c7gGbTwuUJKQOwi2/tRYzbIqjCm8QygbNQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A45E40F72
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:47:49 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E10D10E971
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6CbXe8AClQjqwVKI0lAWpGSbN7zgd7Ez/V/B8LYXelQEQ45aCvq6t/U5ZduajvnLymhv1uUUhNwBZqlDG4vCJ8Sjx0E3SCJ12//9SG9eZ+K6SKZWBqXi7M3YiX6Zow9uDbMOgY0J8sBTPv08rG0YzoPtBVBYjHtG4BJlmDsX/Punm2vXPKshUr1jve8V92VH5U+HFRzFrC02069gz/emltpxETbTHBOjmLK3iii83DHUi9OABstH8XtB2cxxgG/wnXzm0vUmLaxpNCGgSNA54V4va09E6DFoBf/qK89AhzMFZYNUYVyJBiMc9j0BrCve6cTe1U/p53lKRSmplXzmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Y2xQh2jeSN7wumYmbEOQm8sucNHxJpRMjQ60PChpQA=;
 b=ZCQNGqWcRdZ3CSje4dGTMLUdeygmPbsWX4h2N/q/uC6oXyyOfqGodgk96GYOzWa/dBVcINR3YFgK0SC1EmoI8mA1JphRQU6/cCPmVdbe0L44zWD7MPm/HJEaJMsT061HW/SFoXeerpYnt6BebYyrPN7B0o8GAp8IV5/TU9kPqHtlHzibpq7pK+SG8rUgw680KK9rDP3cZebdH8ku4xYb6TuaSjSD7HBszI26rcoqYDXJ2MPWWurWNFzLSTQognD2UDeEZpcN0Zo8+Xo3GeuTOgK1HJFE0WVOmBY8pEO14eTtG5LLaRjedLfTQinv3Jz+rI8QCWUSF7oyJAzRokfTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y2xQh2jeSN7wumYmbEOQm8sucNHxJpRMjQ60PChpQA=;
 b=g5DFDr3KjTLymcIVtW6W1wLTrCzEN5H4W/VSyRRFYR1AZY9dfS7yx6TT6D0jiVKK1INZQv5UMjn4Pa+UHd1pDipOJ+RdtDUh9h1LeqDxy83oVZT0K3UoDzVTVTpPPC/JQVpYRwJ0HwhgWwTLNvZAFcx20XwrlNT04rg1cFvU1B2q+CUOBnu6G3En1kCjUovyEjSvo2j154YmAAKBI19RWhirc9JctiGpHmGgjWsctee6R/ljSGsos/kZaRaKo3v9aBj66hBQtZhQUUlb6qNUVgsk4ApRJQBf/wF2m1yilDW5IvShb/sxOy3ca2ssW/gLjYV2np/dBvdL8C8yYpnpug==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:53 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 30/30] gpu: nova-core: clarify the GPU firmware boot steps
Date: Fri, 30 Jan 2026 16:56:04 -0800
Message-ID: <20260131005604.454172-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bceec5-4d52-4192-8b28-08de60639fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fs4DjWVu2RRTXqPnchdAF2CxP/v7ic+tfjgBYADNciR7JSngpoi4KO1B1lkd?=
 =?us-ascii?Q?y+6rowFkaa+n8toLCNr78J/bdsEkEGxv8G0Zse/DyXzzgSdmN3S1Zz7Rm2xu?=
 =?us-ascii?Q?VwNHx7wlRILughnlLX6P3Te51lrDoAgQfZQjVXztiQmZU57QuBlV3nS70NE6?=
 =?us-ascii?Q?svtPeWMCy60+3Wjcy4a3xikBFN+jGxTaK14oaH12jC7T2ERflQyXJsiWN+hh?=
 =?us-ascii?Q?XbQz9vyqh5NUAAWp8YvLgStMJkc7BJPNMQ3/d0+CwmDJbE7p7xMk8Z/ahPFK?=
 =?us-ascii?Q?dnB1AKXDhVE4/XzqBnVlWe9jxyT5TCKu6Mt5AIxAxfN41qOi+KQZv0d5IqFm?=
 =?us-ascii?Q?/BcZ2VXMSZ4MGqlfDEHRs2+KOcpXAMxs5gi/7Xeq9eE5Y3ys0DMHNPsK2fdp?=
 =?us-ascii?Q?fts6HqDBCswZSSyu/DUEkhMbO+DmnHKinE1KdrEE1hegCSifV5UTYlP3H+Lp?=
 =?us-ascii?Q?t544EtxFkmBv+YDnotauQrFVWdRRqLhAXICddBues3nlXSk6VX+iINynS4+L?=
 =?us-ascii?Q?yIZOJ+3laH2/FhjHpZxOGtqIuXnTTUD536iB7hT2IwS3ZA15aMEKLn8HSUPd?=
 =?us-ascii?Q?mlaPUnXkr8mSIBv/TkQSeYA3CSyAjEf4WANR6EXZVsSPm9s65zdq2b8HwGcC?=
 =?us-ascii?Q?kylzKdiPgrY39wLT67EjCMFbPYiMVjOGGJYUG1GInLITCymYSKd0eWrTagY2?=
 =?us-ascii?Q?dvJPa/3+nV6C8VIm2Fs9Drt++WgGfocJcvoq5QOpT8EFEaZbf5G8aAEhOpIk?=
 =?us-ascii?Q?CYYHv+1uD1l48BZMRWWC9GDINL6/h59qMxbBpeG05yyjgQ2rONUhg+NmjzKA?=
 =?us-ascii?Q?ki5lKJT0wMRQi4WpcFPogNM5OxDKgPcqg2plqTbfmumKyDtoF6o1CV0W8x0t?=
 =?us-ascii?Q?5Cqs3hRqAkv+yt8bb1aEptOqjspZF04UmS7qkAH6UidEaObql9owFiCbRlb/?=
 =?us-ascii?Q?NKSCvd/MTIqg8zGt+pm7w7hU5Hw6dyKkwTGR7zSzr4TSN7KogWlnCrfjVZdm?=
 =?us-ascii?Q?y6K7EwbMdWcQW3EMnKFUT08ie83VWw3pfpa69t+TzK6UfvH09vE44pvIdoSM?=
 =?us-ascii?Q?53sCEKmAMIGVT954vQOHQsJZ8ZALOb+EDgw7UYkjXC9q8mUXL4iWIqhBOByq?=
 =?us-ascii?Q?yz3stNPda1J7Vzf3K52iGp1cxdFNaEoYQ4ge8wnQHD0zRwjA8SaUm8srfhDb?=
 =?us-ascii?Q?PFS83iZ6YGSF3HEVpuNqBRJAgJmNaIlZfsGA1zdAdVngBGxndbocXzk8hfS/?=
 =?us-ascii?Q?zox8zxSwDHplmTUPHBrw2JEe3dirHz4buJQNTm36bQuQOBYGlMSGRp8hzxd/?=
 =?us-ascii?Q?/eiD2STGzoZLmNVxfS7ZkHjtcw+GOTPWUbymFKH3dLy8ehLZYddNf1XSGaZz?=
 =?us-ascii?Q?5al1jbwbpbhuvUK8RhP2RpGVAd1WO9N+jiRW8YeaVv40r+RMnJkbc6y3v5nf?=
 =?us-ascii?Q?fxwXt8foYUUeiro8PznhNppesBYFwZyLReDyfNz4KJFF8WHczq/gjbbL2BQr?=
 =?us-ascii?Q?KJ1Dm08EztKvyp334Pjfb+brmv+j/LOSkyPYM+zIqf4JPVB1bFCDQv2SPCl8?=
 =?us-ascii?Q?pw3DLZA5Cb7z8RUI6tM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FZKmxWg3TvL4bvjOKFcDb2pVkO2QASu9tRRZe7t2jhrB1+bmZpmOMXoRqC8n?=
 =?us-ascii?Q?y84Gf33M0PQisaQDw4B44HZZvE2i3arfcsK+pGjrUJrJXWbPWbP/lOHngcuY?=
 =?us-ascii?Q?8yxdpd51pxrEsN8JGb2e7abc/4xpQCDmy6ljdxnLuss0qKKrRKrecsSWhsTX?=
 =?us-ascii?Q?8mS1lnF1wr8z8Gcj3dB0Pv7qmCIYiuKjj79v/6OStHY3gRp2vIO96kxDQ5w2?=
 =?us-ascii?Q?VqckmrhQyI5mVEalGFMflkLm6pWPKRpic3Xyex4ItowzeVYiMrPbxLigTDyy?=
 =?us-ascii?Q?LO45OVdSzJBbl4F4PuzZKy68kZFVykXm/pU8JUyJREB/niCBiIbm95w4JlDf?=
 =?us-ascii?Q?g1vDOc9UA1RZ41g/t0N1RSUqHbUHFbYHewPR8qZ/MBgVJj7+rvO9YbcCeQFI?=
 =?us-ascii?Q?bFdUaA1yeM5Hm3V1yfulaDC/m3sKi3xSW61f8HurMVAc+cFndvGRnS5APfk5?=
 =?us-ascii?Q?wLg7791H0TWMmXxB1r2r8NixDEzhwRGs56hSOnbkW0ldTq7q6RZYdYIVidDH?=
 =?us-ascii?Q?08mK8q2kLepBpUxJLXpoma97QvXSB9j+c8GGwXa0pw4uLxbAFi4JPHNNCejK?=
 =?us-ascii?Q?oaFbRLv4cX68mNrJdvhZ18yQpvTqV5ahVz9sW3V+p0rwMUwjCuTyTOxv9XRB?=
 =?us-ascii?Q?zYrKHNNs9fw67dtwnMw4/szKktYEFztEaePK3jTVssg1MSw0PsIVZddNwzi2?=
 =?us-ascii?Q?aMawmliKA7Kmu3RRVdTer/hFsxSxgdtlQT+vcZasCh+nKhdO9PPxol57ADkG?=
 =?us-ascii?Q?dDJVOzvBxJEGIH4DvOtr4aVTEO+NhVlrfY2kmCsx9Dq+NGZ8kLWD5utPh0LQ?=
 =?us-ascii?Q?DlCFokWA4Xc6sTxlvB7vTJ+Q27UMeybsuAsrTYCberbt9VGdIz8JD+aUbvvD?=
 =?us-ascii?Q?3bPoBmeaz2EOiQnH9HQ6yismUReOl056pZK1+gwVvZ/84WBwkMe/2WuJYwkX?=
 =?us-ascii?Q?85Qjp6sj/d9Azw/gN9SUxIVaaSZ9mBeXRg23i6FwT+kYkApMafaHTvBSoKSN?=
 =?us-ascii?Q?2zN8AQZ3z3fH6J/w2PDADEib9KMEIkBvrBMyBJXLHX2wxFq54yYUKbCzXBQi?=
 =?us-ascii?Q?dhrB3YRWMZ85Up6PCaCSt2u7lC1n0r3QE66sC5ejIrO7Z9uhXTJUXYvdZhh8?=
 =?us-ascii?Q?NCPAOkYlAwigQKZG+2YBuQHRslDuZmIbGKZxSB2Dx2J6ZUd6/t2VbgwMYnE4?=
 =?us-ascii?Q?yvRYup07X6Ct3kDmlu+/uVAUTayuFJGPlx4029fQwUzygkO6ReSBFfrERhg+?=
 =?us-ascii?Q?pxNNUjH4X9TIBJfdRfs4c7YQqil4730OY7uxDcNLivam5yBKjGMUUNDfhRXx?=
 =?us-ascii?Q?tn7Fr4N4TGobaKA+Qfh+yiRRDvy2/+pxBJNXqIoUUzZM5KIQajAD8Mm17u2s?=
 =?us-ascii?Q?ijCu3RmLWThkoDJEWnAO9ydwSX2koedVGi69SZW6vNb0ScjbkdT/5DsnMby5?=
 =?us-ascii?Q?OdhNrdIEjkFdUYiK0RSud4cbbHz6iEBB3BXDA1wmYVtKL4pYvqGZGNTbjg9G?=
 =?us-ascii?Q?tEu5zFauv/n8oDZaUVLJ+PwJdjxs837/16pmUb01CDivd/nJtlqYzaJgy5dD?=
 =?us-ascii?Q?swV0KX6DinC32keA4pbcyYkjs0IzrydbAxOc5grlMmMm8m6V72F09wXpmVzW?=
 =?us-ascii?Q?K4w67XocapvT9fUNbBfa0q+NXcCG1P4DEPOCqUs3U1M2I6YBV3NJzeQSiVh1?=
 =?us-ascii?Q?q+/YHEaF8mJ6F8f3JM39EPr82QHuqfXNDTb7vKMIwTeGWZ5Mx3xXiRmH60TV?=
 =?us-ascii?Q?Mb79HVms0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38bceec5-4d52-4192-8b28-08de60639fa5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:53.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ssMt4oVjaV7NKM842nLTg1yWzEsRiG7rjApZ1cpuNG0VE3vI/xkEGIYpuiMkeKTa8NIE+PR9wj7gOB5QfOmnqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
Message-ID-Hash: 7TZHAG3UMARP5ZQPKC7ZTYTZ25MZMKRL
X-Message-ID-Hash: 7TZHAG3UMARP5ZQPKC7ZTYTZ25MZMKRL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7TZHAG3UMARP5ZQPKC7ZTYTZ25MZMKRL/>
Archived-At: 
 <https://lore.freedesktop.org/20260131005604.454172-31-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that Hopper/Blackwell GSP is up and running, it's clear how to
factor out the common code and the per-architecture code, for booting
up firmware. The key is that, for Turing, Ampere, and Ada, the SEC2
firmware is used and a CPU "sequencer" must be run. For Hopper,
Blackwell and later GPUs, there is no SEC2, no sequencer, but there is
an FSP to get running instead.

This change makes that clearly visible on-screen.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 118 +++++++++++++++++-------------
 1 file changed, 66 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 04b6141a9c38..02eec2961b5f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -162,7 +162,48 @@ fn run_booter(
         Ok(())
     }
 
-    fn run_fsp(
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -311,55 +352,34 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            let bios = Vbios::new(dev, bar)?;
-            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
-        }
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        // For SEC2-based architectures, reset GSP and boot it before SEC2
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            gsp_falcon.reset(bar)?;
-            let libos_handle = self.libos.dma_handle();
-            let (mbox0, mbox1) = gsp_falcon.boot(
+        // Architecture-specific boot path
+        if uses_sec2 {
+            Self::boot_via_sec2(
+                dev,
                 bar,
-                Some(libos_handle as u32),
-                Some((libos_handle >> 32) as u32),
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
             )?;
-            dev_dbg!(
-                pdev.as_ref(),
-                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-                mbox0,
-                mbox1
-            );
-
-            dev_dbg!(
-                pdev.as_ref(),
-                "Using SEC2 to load and run the booter_load firmware...\n"
-            );
-        }
-
-        match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
-                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
-            }
-
-            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+        } else {
+            Self::boot_via_fsp(
                 dev,
                 bar,
                 chipset,
@@ -367,9 +387,10 @@ pub(crate) fn boot(
                 &wpr_meta,
                 &self.libos,
                 &fb_layout,
-            )?,
+            )?;
         }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -380,29 +401,22 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
         // Now that GSP is active, send system info and registry
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
             let libos_handle = self.libos.dma_handle();
-            // Create and run the GSP sequencer.
             let seq_params = GspSequencerParams {
                 bootloader_app_version: gsp_fw.bootloader.app_version,
                 libos_dma_handle: libos_handle,
                 gsp_falcon,
                 sec2_falcon,
-                dev: pdev.as_ref().into(),
+                dev: dev.into(),
                 bar,
             };
             GspSequencer::run(&mut self.cmdq, seq_params)?;
@@ -414,8 +428,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.52.0

