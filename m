Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFB1E9462C
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 02:46:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5835310E4BF;
	Tue, 10 Feb 2026 02:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PuyH5nC1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 399B641F99;
	Tue, 10 Feb 2026 02:36:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770691003;
 b=yq4Axf7yZvx1v2nsaK+G1f/gNSf/xw/qFdnsGBelbH0hPHGSGZ8Y5L4Aqn0r0hbV5BPGz
 AULYlqWSc2K9W6n8LVU3//pxKACAhO5W3FxjW7wA2uwS7aN3MYWoh64VxyxLBARkFMLr+vH
 yXntTlJmSHIiCAgjuP+XiTg1/lZ39L3ZrbjBePLmFnxe9vg0fcD55fInVoHJzPAbMaX8vlc
 41SY0VS9mq0Z66i7/1+wm4XA7cWkAh+3Njjvg8twvjDcwfi/lgJppVeUZkDgW24ZhwRsC9L
 eJwrP6eIf2F2ZiuKQC7+rWrka6rAq1xs9fZQZdggqvtKR1nWUjQzs/ADGlcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770691003; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pxo6FiNWZfafjmwp/KYtQKjfi0VnmxCwVCUijW51aKY=;
 b=Aq3HcC/3H6QmhZhZG8BeXafd+SCbW8yFBPxd6WvLdixMmY6SMp/x9wG+U5cbGJqJP1g/f
 lUrFoSTcNdDIeRPqyNe4ieRXUXtQbcvFH8hkE6fwx8KMv4fRdbS67T9fkwUHTw7nk6ELd94
 bPu/+/RRxQD2P+r10i854Yq3NKyMn3saEMiFXh/qgrd9dPNKswL1hn3Ev2oYXTtknIy7+vz
 PMdiSvOrLpfVJWRZ9b+wQMyc/JHL45CuTuZBNNgRF0GBZaKBLmudzq6TK3cYMSaGSJdvELA
 Rm/zWllfVeRsDBGTExHR7qLpKP9Qqp/y6LVDeQ7+uhKAhGrqbE4GHYJ8Q9Ig==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DF9A841C6C
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:36:40 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA04F10E4A9
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWhNtJPtzjmHXBfRmSmvz93MahE0i2NB+LtaJR44kR/f86rz/uIgfqbG+8l/bM18pk1jupgCj/2RkE3RiqnEG0BL10icNTT7+DdV9bUjldl65nxQNxaNCU0i1IE9S5fs2XR/e+knS8wcvRXGc++zQJabzrV5X6KFCfY3fa/LNC18jiyH5n+leOPPdTlHzYGzwNGyDrR7J0MT1lqsQGg80xWvowJCOGJ/Lsy+1OAbPWsBBM9WjF+Vq0zjvlHnutT1PxrL9+hPEHYqTbeTu8mfhGx0OqLWZyC7AhdNoQlhmrGeIc9C1bd8M3x8ong80uDXZFP/Fr3ZfCzNrnT1WKtR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxo6FiNWZfafjmwp/KYtQKjfi0VnmxCwVCUijW51aKY=;
 b=aKFvJMlzSwL6Ur1h1pVmDx6v/dEePLASIOaEe9pNhema2YEmAPG3YvjJ4Bk41IKYIawvM84dNDvBZuxVhODKErcLW+wQ0iKg9NWPi+GNyEY5njXysz+gsv/sO/KNWJqhzZMX5RUYoUu5HKb1HSbZMyY9GXpHyQGQuDifwyprzLgJ/RjRNOIZCjFbJqilrkWuccmN4J0/zP1Q7U7ooApUnMHugZySMzyy/tUxswx61wyzZvUSYi6bZA12TUnUcasx4SHXPTzkirCea5yBmqAaUrI4ACGjMH/qDGiTDwH1ZtBtmPR+iY7d5C3AxGQMvF5P1DB5jGUuJWziypCMM7TGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxo6FiNWZfafjmwp/KYtQKjfi0VnmxCwVCUijW51aKY=;
 b=PuyH5nC1c4ehOa1qUbKEmc+ldyO19A9Tfc2C7qcYgEaGh/cGcKRT7VfDQm5T9Y/TTw6dA6Uj22tNPhwRvG0kaXqRqtOu5KsGO6NW+XjPZV/PK0+CMHuCTf96rJjKGw6ghtdqWltZCAQuh+9WGl9oZ8AQS/QzDzfMXaKiVDhVcdrC9Eky4pMrjwbT2sY9DiKVV16P8PPuFcjD1LiLBx3xWcVOd22rsf1AriDsdcX++YdjsQBFoW/mRWJF4h/7q7IEtFd8+kVCyuMisIOeqTIaPcdUuidZVVaPD9kvZ72aT3mXSrGWK5GgjOGQnW7M7PuCoqgRaZw048AkRV/T3BKGrw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:06 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 03/33] gpu: nova-core: add FbRange.len() and use it in
 boot.rs
Date: Mon,  9 Feb 2026 18:45:30 -0800
Message-ID: <20260210024601.593248-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 346ae0c1-3af2-45b7-defe-08de684e8a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fgau95Jbyj6Wh5Ck/3Ys8UUfMWHibDmlcbHvzSnKFfNpslRb1iiK5FOMXwHD?=
 =?us-ascii?Q?77+vmOA+5vxOX1CKWAD7SVMvCa/hx0haaJjEpKxIrQmFtDZ2Xl5rc3lqh+/p?=
 =?us-ascii?Q?4cULhIAltL6an3dQfmY7vzGcjdCQqM8og/bM8pdLoCR8iZAE4lHjByiGuuRx?=
 =?us-ascii?Q?9T/BW6B7p4J9gabWXlBQIkCFsQR033zLIBe5n28/QgZWRQZrKj4BXRn6Lic/?=
 =?us-ascii?Q?jWeLWo9OZu/JdZd98XFxb8wjO2bE4iLzXLzNGIIYHYUKse1+/YfqN9KbQfak?=
 =?us-ascii?Q?ebxtHdr+1XWYhYqtVzNl9Xjwnpng34jwEfbKsdLbSIPXRVoQXo7iBb+DycE+?=
 =?us-ascii?Q?Nil+9thR/NyJCnSIffYh0dtBIndB9cr16x+JTiA8BpD+0dlfb+ffKKpdYVXt?=
 =?us-ascii?Q?TXuLpMOYg4yZWZsmYF7lDmM6hyyKDOfX4MXUyGC0k58KN3ii9ye3YrTmRJAU?=
 =?us-ascii?Q?bpinjiX+XaimaUm8rT7dFUayZfyMW5B3AZz8ogqm7a12PWmalSyskR0kiHHv?=
 =?us-ascii?Q?D3LugABo4+7oD5VJ4eDyMiKHoAUshvQkd32atRjvfLVQcI7H77BJ6MfeMtN6?=
 =?us-ascii?Q?e0Oz7q1yu5jd4cRPJWLfREWUiQsLC4dqQDXB28+ldCiswxYIra0fDffw+mpX?=
 =?us-ascii?Q?dBosgG2gTPbAEPR2eDTtRO+YlxrtXquSboZeUONmCZNRtsfqzwsZYaAmlwxQ?=
 =?us-ascii?Q?XuNZ18UOK9aFfuUZ7obZC5+mXBDMfn2K6c19Ssxzl+sMXA29D88TX+8U/0s0?=
 =?us-ascii?Q?2Uehib/+cH9/bgITO04V3wLehNhC8W2Tz/xNQoGX+yAVtvskcVu4ycWGGIGB?=
 =?us-ascii?Q?JsMgG9Y0yReewDJT9PzP+EK2VK0AmcqqdmcAy5T/uAKBwqPUMv2Fn6jX+qzw?=
 =?us-ascii?Q?iqi1ZHqpE+os2kSRXBlKXsGh7WvCFApXtysZ8mWQyTr81KTE2vHjqKwEfsMG?=
 =?us-ascii?Q?mC1kmH25r+GiM5Avy/6qmoA3KVvj1OPWk7Nt/Lx3tgAMzda1MhFFZ01cRBl9?=
 =?us-ascii?Q?Ag7zYCkbheUWuKQzoW22SfNcdBBSsyNq72DjxD2JbAwSBN0PS9rgpjm63EPy?=
 =?us-ascii?Q?Xw0Q6uwGWisSnAso9CqYjeHB+Rn+XQpvkuxsygRM2pduxcuud23tFpX89Ktu?=
 =?us-ascii?Q?sKKNIXWomXwKd7ExyDfVqQ/K/6S1s6/Abw0W7RdhGJKrmrElgYBFzf5HVe5X?=
 =?us-ascii?Q?6aBxgZoA+Trh59SXkdBAcvwLvHrtdqBHc/UUsC8tcCpS+p1+K1FMU7iVzkoL?=
 =?us-ascii?Q?N7BtKkb7PSJgdNwiREA7IxHD6qkagwma/BAauXUbCgyjk9H4fTP1Vvvqndbz?=
 =?us-ascii?Q?ppsAnFS+ftDe/UK5Gj3QckuQyWNmETKHJBYdqiNT/MXiLigrgKbUlTEi3//U?=
 =?us-ascii?Q?qcZsTBa36rc2EnTji0DDqgIaWKesuX1j7a4XAE2odJ7yGNuf7gyTxTIYSIAm?=
 =?us-ascii?Q?bc5Yn1/Kz43yyWY/3+xLQvnXzbVXaTD43kQTrmC5EBCyhFrqkXDZAlbhiNoN?=
 =?us-ascii?Q?1SvH/iTTZb2mpXxb0TkFS6wEH2EHSEFJmK873tGlU40xdjnICrPqbeOmQDao?=
 =?us-ascii?Q?dWEE1s81DCC3CuZ2XSs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NsaL14URDw3xwrO/WfXr2LRLyJ4+lG7QTkIrrdWXVr3NSJpB0RvIFin4ymzb?=
 =?us-ascii?Q?Mb2qfu8D246QQtabFnyyfGu/VDrzl8ha3XaMXciQGDSNIroLaGmwHmwJ8Ofy?=
 =?us-ascii?Q?kitnCpII7/dcAioJKd2s3zAN++AfTvGZ11W8PaNHvMRioXtVrR6lNK8qA6Ww?=
 =?us-ascii?Q?S0QwVDXbl1Ue74X37Ygeu1xWvx1dHrxyDHX5A1XeOc1xyRzlRvxnjZIsXRiJ?=
 =?us-ascii?Q?APdtU4Hr67w4UjaCLE9p7Lmj8cmbElB0OJxecMeXuQTfQ+Tcb0LP24MxrQCU?=
 =?us-ascii?Q?UCDdKfYiaz77gvBtgELFs1L4zmUsuEpu5ZjN/CeWTbINbM6kWOm7aZZRb5jZ?=
 =?us-ascii?Q?aIYb3lL1CHPjluyuLcuVqvEeg1A4SXitiYCRixdJjJBDpOs1FX1+tPY6ds5m?=
 =?us-ascii?Q?QveVGg4Nl01gyON+Imp/joTP5yEA+T9PA3KY+YfuOj4RgFrHnQywISN1Z29Z?=
 =?us-ascii?Q?RtFLJNQVZX1LNdZGXmNi4431DjratgiCMfSDZAnmjs2/ibZ+zmZyUEFziCOm?=
 =?us-ascii?Q?+9OI+ih9i1h3HwCXiqDyD2VQD7SfMNZ4xiqDNzFnTM85D9mzzBsq6DYxa55G?=
 =?us-ascii?Q?W7w1XFLwIU0teODUJl9DRyvnPas0o3UGBGYal3WKcM6zgLMZR+ssATs49VZJ?=
 =?us-ascii?Q?Mxqwg4402wytVePcCWm5YW9apHz8oALRB3faP4nhqLa1aPZMbCu1XbQ8djOL?=
 =?us-ascii?Q?8qTXCzuZhqSMvmezPwM11dr4UD/tsZeEQNc6kam0ujDjEwCHJQWT1V/BUeKs?=
 =?us-ascii?Q?gWUITtGms2BAj4X++h0Ysk9VBISgmFoH8DElsCKAw4uJbGIFfumjOvS3nu3v?=
 =?us-ascii?Q?wkyrQK0gl0C79R5uyn5OHWkZBRQyA3Q29EKu2eTYNtqKPOwoX7ZP4iIs8h/q?=
 =?us-ascii?Q?4KkyFoTHyI27/542zLic9iFpHVvkMPvPFeIv/V0zbm1g2F3Ljf9gQb0AZeIc?=
 =?us-ascii?Q?QHsYbh32C5YkM9FGuYBhdkvdEwUciJi0lFNPChMs5Kt2BFUjbc/l8WJ9hgOz?=
 =?us-ascii?Q?EcARzJcboZMLeCHLbHxdLUf603l6OTg5N/3wNcMRxpmPal++fbp3Ma0c0caM?=
 =?us-ascii?Q?O23KyQC6YAuvzmHNa5tYWS4RamZC4WoyL0y4/U1reyIwH7G6+Fc2iYooXzl7?=
 =?us-ascii?Q?DZtLTaBIqv+tj29DNioQFDAgtkSsbI3cz5A2wUfwRdjTmxpxL7KGbk5Amw1d?=
 =?us-ascii?Q?c3vCY+U6Rv6kcaEW0/XUxgGbhpjE098ijZvBI1BywNO3mqaSCGjoNUAuQkUm?=
 =?us-ascii?Q?+76GP/IEz/BQv+wZ6GfNRltnYoNIj4Pb2oaTz2GRWV/0AlZdCOo6q8aJsQLc?=
 =?us-ascii?Q?mRGoh3RDxwedQ9E3A1LZNxmtyRSaGeHTuhaluRHEnoRryd5vvvEWApgWk0DM?=
 =?us-ascii?Q?05e9yK7YsbyscExlb43shYsBPcd2fE+a/E+bpFMeGwMcvo+rDGkd5bpm5KPE?=
 =?us-ascii?Q?IJ+xQIKEC+G+4XV1iiGeBA8I9JKVFkZcAi8JWnovthOAc8BubCdgAJpa8R5S?=
 =?us-ascii?Q?9E3yAC9pa4KlEZxiwHS3Hl7Krm5OyzVRSQyRDIEqTFobytrPsfrVZi5ykoVn?=
 =?us-ascii?Q?XKiaLWHnoLbo6Um2LFxeL3AGaFUGqbxCPdr2JVvc5i3Q2P3JiEyVMu+mqbJ0?=
 =?us-ascii?Q?gPYrG3l9KI2nGkTQFbb1aIY5gFcedQMqAmLhSnm0p3WDih2D5z5/abkiqC+s?=
 =?us-ascii?Q?J34nNizyy6qGaSO66PAl/ht2GSp7r3jJrVfk9NT8j7s/0r8B69T9zlSkPYhs?=
 =?us-ascii?Q?wvXdREWiuw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 346ae0c1-3af2-45b7-defe-08de684e8a1a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:06.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tqtXHARLG3TeS+j9jE4gHMy4GTPz8EuAb24DwV9BagKP4mPSPqd9aj7twCdIf3DYEPPHzJ9jCxmoinEqE/KXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797
Message-ID-Hash: BWSJJAOKJ6KJWBYPXVGVW3LRB6N2UAYC
X-Message-ID-Hash: BWSJJAOKJ6KJWBYPXVGVW3LRB6N2UAYC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BWSJJAOKJ6KJWBYPXVGVW3LRB6N2UAYC/>
Archived-At: 
 <https://lore.freedesktop.org/20260210024601.593248-4-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 6 ++++++
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6fb804c118c6..e803e6e0cdb9 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index bd6e6dc57e85..465c18e4c888 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -70,7 +70,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.53.0

