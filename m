Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C52AE9D3F3
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 04:21:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56510E374;
	Fri,  6 Feb 2026 04:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nC+5V+zr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EDE8141E53;
	Fri,  6 Feb 2026 04:12:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770351143;
 b=sZBEi9+gBea5wh0DYI8Ue84pILAhcQni9RNZL5//dKTtfWAVB+Dne6t5Yr5rzLUv8qS01
 n/x+5Zw53e8MObj/HSKXGsRbgo+EAAmrrC18CMP+R3WP+LXUbifIW4xVQFRHoiP9ZAqzZdd
 INLNCYbGfVglLlukLyt+sJ6E1+br4ci2bvxe3nlwxZGR2VazVbhqVWTD4yVXRU9+UgJlaVl
 yEZd5vuSus2f0k8ChKDWgpbsH60HEyjqG0S+l72f7HkaQURsPK5ktlqahNnsgRbmBBNz0Df
 alrngOVQ4fOWpwQyG5yPIxvf5pmpmtpqvuSRqRizEvWUKGxCtd9WyNJhbIhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770351143; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2qq4KVUwNPYepcxiz2LXqi9BqOqefBp72S/GkbGMaNk=;
 b=aboMpg5NEuZCwct2EgP175b1kzZ2gqu5Z3kL4xl7P6fA9yUvzAiHJD6UwkQHqFodgE9c8
 DRfgNWxaDkPBU+U/D2htC2RsNiLe+hSD291Z3UYK8DH0sQYmICCqu233351sV3Ao93sQKcw
 vg5S91q8fW6FKcsGEr9jZmIP7ErAufcXcDdD08OhJnpCI/YVwVoxekAKuE1erFa3AzGxonH
 ykIhSz6fOC9meM1GGpSsJMsZ9DCxOPBCitI8XIbOvnpBzlckImgxkCehhqeeNCbqWGcwiSm
 i4jteL/uin950Nt8K28uGRxcQL+8PJwXhngRamT+4Gpj9RiDswOPCk976eYg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ED21D41B49
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:12:20 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011040.outbound.protection.outlook.com
 [40.93.194.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 23E8A10E35D
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOKtU2noaergOvD5i/EBVFmX8H1OMm2SPEbbATRZp4a87lJLSjS42eUq55Uz7cXsEwnOjHxDHNaTJ57HCQhyzyuwG5RU+2ZNzFZeWXxan2TWJZdO/aBjQAHRFxd2opdGqyoViyfrfv4Uv+ycwqQR/gAx8Z35ensvxzh2BnEOzcU6QJPYk0aYywdIWtKIk5VAWxez/C3grr/9h5wBwHmv7qV3KlLrwQLVnbnbes6s0rGomdpAi1gJ87YaxYgYATrGBvg5BonGBdNs8q98SmdsEU4ittljE2xb2BUpP0zbtRzXKkORLckHfPh+pfgJiQznQ4RBrBD6VI53i9brtu/cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qq4KVUwNPYepcxiz2LXqi9BqOqefBp72S/GkbGMaNk=;
 b=WwhQNCdXlhVebeZoTTsJc+4y9a5j3+uqLzU55lr0eHPyZRtMBp9ba7MzwHGYaWg5VsZiIpBJoqSnvzKaWwJQ8C+sRH+MOAvVoSqZPz7gx5pSm6ByxN1SNjEPSQxzEFyDA2e178M7aDCGryn1OqKPSkWccTT7tgVSAqaAoYsq2NwLQNTxlhTd9gvNSP+kj+LNIx9BYCwSxM7jYr4ymR2cC0qX8AZLhkhuq8irxXbsh/1dY3n9bR/sc+Y+tJsXxX+f3UK+tzmOR6zvXp5/vqfuTgcqOV3fShHLA3Iq0Jzx4cexelHFbdH8ntSl5Q981V9gkf/iZY8IeRnsCfr2CVXSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qq4KVUwNPYepcxiz2LXqi9BqOqefBp72S/GkbGMaNk=;
 b=nC+5V+zrg2R8SinNDxscOIq/JI017sVa6pl7Hg8NGDTLyPP+6I6CBZ+jg62UZ0UUE7PVaSv5YnGzV01f/hK9KV9uWtzfeAdjMopwQNcKrwTWMmANVgGrP6kOK1NBEYG5Xvcc0QG6KPzQ6HjBLVAuUmLvwuM1xeb9YgXiORcC0FnDcoGnnuGfx+t4bzSftAlar/Ptmfd7N2bu9/msOW3hBonyRoG6DO34vmaZjNEwcIc3zlqKw+lcuBmi9rrDiHyowvDmMMZwQKXqjIbWTFT6jo06ZxzPYydibcy6imW8W4pPjEg6Ucmxj3ShxLWo25e+gVM0stIg+p+G4K5fYSpZgg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:36 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
Date: Thu,  5 Feb 2026 20:21:01 -0800
Message-ID: <20260206042123.303281-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: f766d860-c614-4062-b90f-08de653737c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5fSJqgU9/7CH78rVpFY7elFsgNWGyJLFfVuHGSV+TJfJidnkIZZNMBlWMPsw?=
 =?us-ascii?Q?hl6ScZ9U1y4LjVMCroNgdcs5oDsedNUVN1BozRU90rKHSp740AiyfuA1HBYj?=
 =?us-ascii?Q?rHkeh7PEaiEyLpsUA0cStSnwWCVNXhL4VdLfg9awChMnCLMaF3alQEZL7/XA?=
 =?us-ascii?Q?yAnkWAi61TYLdYUtII7XjO4QCMvb9/WbWcfDGKO4hQmOBwaXLNLlQIN2Wzf+?=
 =?us-ascii?Q?Vm9UWt8HFi63ANXice4rCr/9lenKSfa3LtpIO+1kJLoR1GE+cK5Vk6zhWvLh?=
 =?us-ascii?Q?NtPWvjB561ufo58yIcoGWs8dj2gRBi9ujnfprWnHDYh2tSlRoKzcL0mHRcBF?=
 =?us-ascii?Q?5HBbILvtosnGPZYSitVHWUzMZk0privylr8kcLGooHDk39WrfZC6fg0VblWV?=
 =?us-ascii?Q?Z/xes/EHJ6+MYbedwYw9nFZKG5f5uU/+iO58nTCAk/vThx2BhCzE2l0b53Uf?=
 =?us-ascii?Q?878fJtrXsMKuMgffCZH45v08CK6Inmtjr7j8o/0CxC1qZ/WM1HfbJXKO7C69?=
 =?us-ascii?Q?6D19mQvqlw4jqy068fT4GUvawkEAr0grABHGKG/s5RoJP8R++gw1rWXa7jJZ?=
 =?us-ascii?Q?0CswbZKuWpsBJvx63JquuG1uEoYza7Q4aY3IvvNtINYF12ThMIkeJSSqcXFh?=
 =?us-ascii?Q?tiJHBPwdBPzhTpvTjpTaGUD128WJ7nGCsIkZC7hyF/5Lo9rbkh3qWrsN+qNz?=
 =?us-ascii?Q?AorlAaKkVGppMe8BuIwP7nTVcIe27Q52ruNNDws6ku549+zLRgWXZqXSf2bI?=
 =?us-ascii?Q?9QC7ZDQp9ChvjSIMqh/EDu2BNcNHLqZeqNLmqU4fV9sYIAWMiyoX1TICJmza?=
 =?us-ascii?Q?/7aEvjtt5jyUWCNKeNfJOhFbopVAQfnC0D29sorZS3TF7tavbfuySbNPDiga?=
 =?us-ascii?Q?m0qp0BsWcuiZOLopU6DqqcffGlpxPgFsTXTVcRgUze18p1GVBANG+sDhH+MT?=
 =?us-ascii?Q?cvthS0Yl1cbyG2UQ5m2ndY7yY/QrqM16YoaO96htMi+MANrTFCaq6GLfdnux?=
 =?us-ascii?Q?7TGNn0xvlpi2euscaALAyC0behQP6sbh9nVrpWqzZH2ty9tiS9dDTvjXycnW?=
 =?us-ascii?Q?JnMEKj4MDFVDFave0y4yElbqEYPam6Y5gDrvKeKZYeYqHVEA9ZWvojasRlcK?=
 =?us-ascii?Q?AJOu7cHF2OkI9e+Ff3BBdqt5UXjA3agRhlwlcW2+dy4gJcR/YAU+TSuZu16I?=
 =?us-ascii?Q?8rKQ+Mws2MfJqRBIszmIxHMNgIoStbrYzERChQY/tXx0e6qeJEb65jAkM/cB?=
 =?us-ascii?Q?cUWATYw5ndBI45u0l+tBLB/Ikl0eE/rm3dV5Lh/X4LDzwfaJlETaU382Eiby?=
 =?us-ascii?Q?rXsSp5nkAX2WNLajv77QLIWhhKjQaYxgj1eZs+yLHY97G325oPMgab1wzdF1?=
 =?us-ascii?Q?ImFLJ7CNj3JaiEOafk0OCrxrvmCbXnOiJf6geIEbZJBsuK0jtDv0oktFXF+O?=
 =?us-ascii?Q?ymtgUOLku7ZuDHiACmDvJH6Iv1o0wNYUWpmvYpTDtTQ2TVaRJM7+a1bw9JfQ?=
 =?us-ascii?Q?Gsl9ira9ykLaBB52BNPJYhIAUyhlif06JStVxxtuDq2o4zUaHSSNi0F0jkYq?=
 =?us-ascii?Q?7rR65liw91ixCcsWpWU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BxWA3QLBqWdz+y9jMip32CE0tygQ5LMY+ZcV+uXuRYVwsysii5AaIcrQlTUk?=
 =?us-ascii?Q?wNFLN7X7xU7U8/kFKDe5OfG/E26umeaokTZ6XU28AWukIE5urV3QylZtYSx4?=
 =?us-ascii?Q?nlJzdFiGBtaUzRcRJPR9KyrxmV1eUi8F+u++bDy5cpeb93FaJGnUCrpxerhr?=
 =?us-ascii?Q?LtaflO367nZlJP4Ih0ZzQgyHsb9VcRpgrZiuYv7S3FJQyglmcDI08mEk6ghn?=
 =?us-ascii?Q?Nu48YDkPLUwldLHh/yTwhetrYW0y60rj/nr/SmFa0T6Erfo1XvX8zPvgbuj1?=
 =?us-ascii?Q?6dUikmqXkUoZyfhwyDZMVLR8nsnJ3+NyVRd0OdRwXzbdfUR1nokSnZP6PAWl?=
 =?us-ascii?Q?ExkvkL02EESG6UWSKtdQM0ByQBWU/zzXqpN1pj+ICemo03Fz6zRgXMWuBiIA?=
 =?us-ascii?Q?ZxlQKg9k4At1LDmkIGbUDBF7TB4l1VTKufZgUIr3fkFuYRJYBAjhozWZ/ORZ?=
 =?us-ascii?Q?CxU55blk8Q6GxxfStDnHb2Lhtz3dk1JN5lB79UzaiG73MUh4sGgcCftJgRkR?=
 =?us-ascii?Q?ixgBx9v1Dk2/VJpnIj9IRchzukH+/8SA4mCIcjU7yahxn/1zoe5+rq7rXSRP?=
 =?us-ascii?Q?aP2cfFxhheNr1Y8ET1+qtWw5vyA8/0HwCixMkfPxdI8R8X+kkPKpWEuJ51oA?=
 =?us-ascii?Q?JOZaB89lLvg/Zc4EsM+OGxQVH/lZokvpTM+PXSXlJ7Bbb3E2a69JI0Edx7EM?=
 =?us-ascii?Q?WhjbqP7Yu59dJE/cis3cOBfxtIA/eAjPRPXKvPD3y/sZqaAz9K1Doyq2flM8?=
 =?us-ascii?Q?md87n31SUhVPUw3WhJhyCCVbYcfkoKZL+zmr4B1UJHydoTECwplDU7Jmc5Mm?=
 =?us-ascii?Q?VWmluXM3oR8m4l0Y1P9JfWOuquFEdlIUXzao8fLtOqEGTGzHsHDnGv3eTSRy?=
 =?us-ascii?Q?sQcQCkR435mmND0i/YpFUPilKBPEW+fLDqOQiELojAseafhfpTqdY8ZYYFQ/?=
 =?us-ascii?Q?oHDH3qHySkEsAOHqIxETkWf1pzP6PVzqQy9Wr8GOV6FOqv/2+De3UvdUPPyu?=
 =?us-ascii?Q?+bKXNU+mb/7jvTZaF3gALx8mAZ+L71466HkdGpBBpIB1/BRmXi7yU5Tz99SY?=
 =?us-ascii?Q?n80J5Tl6Z+Zmd+ZhysduyH2WHLsE+6t3fVi/2y7HuPqAYwoyNiS99zXVE+e5?=
 =?us-ascii?Q?N0h+4Vnrk3M7JPJoh1CfhZpYTW+604H6Rq0OG7qIUaLRiyrEpMGJysWv3B2K?=
 =?us-ascii?Q?iwq0I3RKb2EUTczgmEBL/RMPebc6+ioZhY3NcyJPDGZQIkEIbrZP9TalUwuJ?=
 =?us-ascii?Q?nncQaTNCvKJTaxxEDpX8aNjQ9sqvIYZbN06KIwuWJOxkf7tD4ZnOu41ol9E2?=
 =?us-ascii?Q?i2v6fQZklp06LXlKkk7AGU8pXrq/g4he9FsVHDAYE9a+C8ai/JKGg4kb7etw?=
 =?us-ascii?Q?Q2PIoFWlNiVmu67lzY2onlFsfDCfP2gHuuM1h/PfNWzGECX7rsOTqu0ssrA4?=
 =?us-ascii?Q?nvzItIypBU9CCEp6cxBKm4ZIhj9eYirVg4y6roCa2duYu6CNqZ34rf6k3Hjf?=
 =?us-ascii?Q?eYcVIxmXZGUBzxz6yrQFyJkIPafiPL7d+NtYfGls+o/iP2F9R6jOty8ra6zq?=
 =?us-ascii?Q?iH0Q9UbYZBdpozlAJWNDlCCE8Oeq11/RLdhOFUnlnBd8Azh1L2Vr8sXZUtRO?=
 =?us-ascii?Q?Orv6zjEb4wcMx5mB4zZ0u/sj0PERzbuNLQ3H9GHbTQSPKJ2GmwLnSKpXGAQ4?=
 =?us-ascii?Q?2jwLdivkIpVZ8SoY9ZP1hWqr3ZEWpBnzng42Rjz41hlGkyJ6nqpXR13PjzXN?=
 =?us-ascii?Q?mzpOGJU+UA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f766d860-c614-4062-b90f-08de653737c7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:36.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 94rK5YjqBUSyiGYL362axbZpRC1mpzJNRJYtO9S2xoWYqhIRBmAS7IoWlTFYxAgiuf5bu1AWI3wiCnlFDndN5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
Message-ID-Hash: MUG2YFYO7YTPDT4BNP3M4ZQWRNI5T4GB
X-Message-ID-Hash: MUG2YFYO7YTPDT4BNP3M4ZQWRNI5T4GB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MUG2YFYO7YTPDT4BNP3M4ZQWRNI5T4GB/>
Archived-At: 
 <https://lore.freedesktop.org/20260206042123.303281-9-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2e7b90b80877..f04e2a795e90 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
         let chipset = spec.chipset();
 
         try_pin_init!(Self {
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion before doing any
+            // significant setup on the GPU.
+            //
+            // Hopper/Blackwell: skip GFW_BOOT completion waiting entirely, and use the simpler FSP
+            // Chain of Trust boot path (elsewhere) instead.
             _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                if matches!(
+                    chipset.arch(),
+                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
+                ) {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                }
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
-- 
2.53.0

