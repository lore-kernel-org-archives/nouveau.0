Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEABBC5DF6B
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 02:10:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9686A10E88E;
	Sat, 21 Feb 2026 02:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WUJviFO1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0643043450;
	Sat, 21 Feb 2026 02:00:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771639222;
 b=qUDOljr7Zv6ct0grxzsJ+h19Qm7G/xDaoibfaXuApaNSCyOUSHTnjv048YbmHjGKnJeG+
 VyakrwvMmkHN038nNWjeyF082wLm/cmqWduE2jN+sbnDc+GpymyfLc3nGKkx4mUKs9TEYud
 V5uFvP2ikKvrH7o29vK6rS1PxT54Si6ELvvwYcfKvLsZ6y2sVBZjNCbpijpfb5QXkF6Okvx
 4jXKaCWpaQVe63CMc6EV15QtqMak7+mvW+P8QPR4ULfY0skSUPqI0pzvInORxgqJN59a/A0
 DTa9nBj7ODWESihunrNJt8wnaQ7eN/Lz9s3YME+6B1HOjc+sJpdJxuI3/a5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771639222; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+R4aV4IYkR9k6fVtn8f5fdvlJs6hjyrrqMOk4mwU74c=;
 b=Qm285Fi3BrIsEuYyObw1ionrdstawHz9/wNT0e2kydNPKY5Atp4e6TcWN7qjlBzBVXvWb
 JmkK6LjRiBCL6UeSDTNSxoOCcYOvJUIuo+9UbzBPOVdzQXV0hZf7t64OuwwA/k+PNzPEv7x
 1mwkX5U79gR4GvboP54f6Gxs1yCipAgdN4g1xDzHjHDHVfICxAKrT19qTZ+dY8IllH8vxU9
 qzHAQCZYk/FR85sT8mBWC7+QZnM0NxP0GrEcwTpp+c0knb657NrC1OGTvod6PQ67yQ17NPC
 qJow4bBuj9OljQu9GIZDlhqe4ACCGx5jlIRnuoXBd8Z21mZdyL/8l8eELbuw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3673B41A0C
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:00:18 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8515E10E87A
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq/Aiby0jheOQ5HRwGhwbVDH5hAw2mjIi4DxjD4PSPmo56V1mPIHn4V4AOSzPD7nr5PDCFXtRCHqRyDPToRo+qC2qtWqGiftJYRmDa6FN4rNUiyh+nTJu53wf3OCMqSIQERlxZWLjozjOak8BFldH6Ahfm9mANzM8lUahMk/4xSp6nxyb8wueaZf64mUIpsEWCwIQDXXWnWOLcFFLvoh/xhzL8JLSd7Nbp66xOBrfn8M8VQgm2zXbpW7U05Jhc6Cy3TwAupgxWutya022t1ZBgoju+eZfbEQrYaKgQBlxWgMPG589KG928iLIJkfStU2m6MzYbz16GuPSoU5lnHQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R4aV4IYkR9k6fVtn8f5fdvlJs6hjyrrqMOk4mwU74c=;
 b=CI+W5854hjknqv+y79OAVieHDJz1YvIxyNUUsElCxxqI60smmdS7s9z57AC3PNH7n40kanueSYQlHIFPNkmUPwBpiBjZWrauvfzT5qlQXHnH9yVYgtUsqSLegW/aPFI2mLBIZ0SXz4BWKEcp5/n9Ga2KDvV7PmFbk5v/XTG4Pjiw5DR3Jm58VMzdNIn556w4zo3OhWIa43jnj4VhI8G6YuB3wUkMuXww6RI7pXZOmlNpA2T3TtRWIDQYKjTyJft1OEtapOJW6L7ZjLc3cW/Wh8GTbYDyA4FPDGzY9Y+KWsIH8KrEVYDORkbA6Y1hEbBxs7QmzcHnZgGdWfuQSj1KcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R4aV4IYkR9k6fVtn8f5fdvlJs6hjyrrqMOk4mwU74c=;
 b=WUJviFO1k63KrGb0XDeABMuj5m34LeTAHPipVjiLvLMFpry/APcUAbp/IcX4Z6s90pRW/gKAxlVPRnmC7P0Yvk8gutBL3qmYQb4Cx4CByPlVS7QoyeFddkdDoekWA5lo5jOL0AYvfzcNf5fv2MKY2jswr61v71X0T2cNa3iKA/5UfRWS3Oq36BIJ5ARTAyin5cmjWeopAOOtQYap4rZZVTJTcHZl1zS2P2Z9uvmAzO+p3uBWIxh4nwyoTOotrUS/2WvDRlTFLRg6zTUhudyLsstjNAwFDO12Ly0syqG2i1owqd5tJLZKwzJBXIZ8VUk8I1LoLas1fgEciQO42FAEpQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:08 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 11/38] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
Date: Fri, 20 Feb 2026 18:09:25 -0800
Message-ID: <20260221020952.412352-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a29f73-3a61-4079-1ea9-08de70ee55ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rn3aosGdxzDN5/aw3g1nrO34wSlEPCDinMqhmyynEd3QpdPIuAkshF3N7XoM?=
 =?us-ascii?Q?vPKOecgVvsv5stM/U0Cq0/wr6FzfbOnmVeLNmpsAY6W2Y62d5NRfeBeo4YYh?=
 =?us-ascii?Q?/pV/efLmnOGvmbLivUUAHYMJkJ9UExTff2A4ijcNHudvYKyDBWhXbkZT7pcZ?=
 =?us-ascii?Q?kDTBwPGCKWl34csjvVq9ZwMlqjYszSpZbAY7fS7BbdJnlZSsn68lAY9r9E/I?=
 =?us-ascii?Q?PC65cgD1MChF5o+NtcDj0uPinYpwsT2W11tJMvVzvHvSxmyLS2mnkxFAhb/v?=
 =?us-ascii?Q?UM+yL5klxeIFEcG1RlSaxkk2s7JPcfMH8UyxwSHw4xCXpycvWS4ubgteaF/u?=
 =?us-ascii?Q?EuPNFjijneSFRINPp+5KBRqHj+e09hrmlBoMcujkUMQ6K9uU540oz1l1Negu?=
 =?us-ascii?Q?jzQ0orXrAnszbTWrHCLvVq+oOWVj3FMo0NDwV51hyvvjoXdc7YzMYQ95YRlp?=
 =?us-ascii?Q?bu6K+KWcRaNj31SZhJNaPTni8a69peW5BhVmGwptEd7TPnEKhrgkrLVFzMKj?=
 =?us-ascii?Q?fm+m9w2VPa5XEL3S2NNQo/Rq3WL2WzGpuYVhKKmH/TOlvS0xE3ztz2zqbOmN?=
 =?us-ascii?Q?3uVut1zob+VDIqWzcN1TT0dl5f3OZd/fl/dvlWvUuryunMDqEBqTO3UXUGa8?=
 =?us-ascii?Q?zDslzKHjT+GaA9VR5plvlu0Kxyn6wgk9rnCsV7ov8qPbhHpipy1OKVBVRa34?=
 =?us-ascii?Q?KhrBt7h77GegogQI/19MmvnVKLL04RtN3OMdnDmIpuKDbUitnFOufI2gdy0L?=
 =?us-ascii?Q?Udr9EOsHNmeE4wNKQ/CfjS+KTjwhE05J4VOHfhRJc3MLL7fQs5Zu69w1snam?=
 =?us-ascii?Q?e8pTii4w1W7prP3X6zlWypGJb6CCh0ucVYIj9vTzuIt/kTpDDfLKrTHeyFdr?=
 =?us-ascii?Q?XhsgZAOcS0EDnAbFoD4RbvfWd0FpUgNfQv5fgPiOTzmMrIbENcuptoHiEfz1?=
 =?us-ascii?Q?YYH4bafdsdFhHtmcLzFUAuQTswNKQqi2HuNdOWitdvoCLLlHAfCylhgMvP6x?=
 =?us-ascii?Q?TIssT/4cQCBuUPKPgpSCbIhpcJnsKa/dYq3vSIF6ZlXYBL6XvUhsN0Ro4tEj?=
 =?us-ascii?Q?egWIUhbVjAFngIDvR8046g54RYfKIRF8XJPA5PrpyjDdKqV6muAK9+GvYuGT?=
 =?us-ascii?Q?t4Q84BoqJ17TJNVHDE4PirdMaxfQ/CkkesvHV6vPKP59P1xW9SHfE20ymL51?=
 =?us-ascii?Q?0JKL/7CzfpZd6grHbSJLIiYUl62qMU2WoBItZBlza7DJp6HsCbWNf4t/+wn6?=
 =?us-ascii?Q?jprIGP+RWYju0CgKcErvNc8NH7eMcsL5Jdb4OtTlHzzC+gEd7TA0190oFT5+?=
 =?us-ascii?Q?y0XW+s1rE7wkCWL6+j6RGH6D5lQgC19XLn5PecNFIBQyUpqHAY4WzXsKyqg7?=
 =?us-ascii?Q?zLFsynsnSQ9+dGi8y7oZeZEOi2Qsx/SWCp6/GqEcdsWiN0pSpmzQIWIXTscY?=
 =?us-ascii?Q?Uw4yVYzw9vosAjsljS84jr9iE0aQUG0LrCWzYrMfDFC/ai4hCLophhbhiFqB?=
 =?us-ascii?Q?v5NyGllsLm7tEXlADrhIkyPDQugd3Sr4k+Dydi2TM7hZYccj/Ffz1AXBfFiM?=
 =?us-ascii?Q?hBJcFFIT9k/zN2doYhg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uRIjXX9kGDYMds9xDkkkcWGcy27Gy1AuKvu25z9vKik6zEhlHjGNFofyPZYc?=
 =?us-ascii?Q?WrQfQuYoAqYNaVHAfKXWlNWqblw5QScOIEvmEEivqw3xuzsBbRZtMKF/wLXs?=
 =?us-ascii?Q?m/PIdYjNMDCwfZkkgcCZrsYdWd96O/oACNcMJMG1yXBjK4cmxyFWvbmNbSrz?=
 =?us-ascii?Q?j4+NYC9qWSxACpqxtVefoz8MIzAL7UnDtsAOzk8+uaaAZa3LArJJFnwr7JSM?=
 =?us-ascii?Q?68HSz36tNRMBpqNsRkQZOdpyJPx2Bax/Cq4iNdUPiz4sXU+Ra7UOn7gPmqjg?=
 =?us-ascii?Q?/84rf+vaoVNraw+ia9HI21OqTOgu+sYXxh0stWaNAP8vRUoRI2ljvWJvmbt4?=
 =?us-ascii?Q?Yd625EqWMmJfGlQ2zmgrbWAdJncM/5dsghXtseV74hBBAFmq/4XzxZGQJAQ8?=
 =?us-ascii?Q?VO4/VdSs2k5egWKyTomwi5IfxPmy5s6iAOkHJ9DjpXbFFN1cvtQE+C3vy+LW?=
 =?us-ascii?Q?TeBVbmECeN75OIMwWK0XkpZHDty0Pwwh9vnK5GwnCQvPduyyQuTavx+GoQ3H?=
 =?us-ascii?Q?zO3Q26bP2CS2qvmBbGKAh08eV3D7AEmP0oK6BErw92rEz+ZbNO7VisSnW9uh?=
 =?us-ascii?Q?RiN0AI81KMDmLBarF0YXZOvjM/bocCfwEVkglLGq6hB6/fNdqS7oebdyRm+O?=
 =?us-ascii?Q?P5CeceLFccTu/vUre6197sgpNWqOLz7prfi6d+wogXwEdk+ZEa4MM93+1bVX?=
 =?us-ascii?Q?huSK6GC1QIwTe2IcqzBE1DzQgmMgvpLj/Dw0VngnQKNwUSkzxBN1gJG+U8ZA?=
 =?us-ascii?Q?HplLt1pFA2Z3SnAnL8sSsnJ/sHIWStcxEGAp1Z5AY+Or3VK3Cj2KZpFARcMI?=
 =?us-ascii?Q?Ss/qZEcBFbTPwoZM4bxvuL3fSDkbUOQhhvJqdfQooCKFEJptLkfsLUaq6yc7?=
 =?us-ascii?Q?T7PpQrCQjSwfUiEP0tNvMYHuq++wP3QG4l/UL11FWShGUUQSVlVs++TeT2nr?=
 =?us-ascii?Q?UdJCkZXkGAPYfyvNixss943C8Y3vBCvPn9yaoOBhz7t/FeFkyWAUnrMZLQRL?=
 =?us-ascii?Q?7zzHcS03h1ESwPgRDd90ousuRtu14mL1cxqeNKgo5f95VXRJ1IXRpNrD6At6?=
 =?us-ascii?Q?so4DDfLBH6FHjLCVPqVvk5uxvE3VoNRDjHxcO2hJzOMM9cY9TN/t6gp2mLW8?=
 =?us-ascii?Q?Hz1orOsEmutnUhKhx0jgwvy1eOeK1wU9u964a2rV5q4CnjQmDQ0MgCJpIjEp?=
 =?us-ascii?Q?cwxV4P20TAvhtwPjsw5HI7T0NJA0tc3u8PD0igeRBoejD0LjGfGJvu1Zyfht?=
 =?us-ascii?Q?ZR02hxmEZHAj/xVTP7cJnRKvrXDt3gTdYwH0hfXImFNE3YYAmrb/oO6Y06U9?=
 =?us-ascii?Q?oN7q7RwFmkF/IYRUxnfLn2ndXmlWa6gJIIbcHeJJcDdUQOOKOdOpRFaAyTWU?=
 =?us-ascii?Q?t399RQv1lT5Dv8L4Q2OKh+H+13moMk2MFVslySDKIC0ukY9pWaDmT/X/65/Y?=
 =?us-ascii?Q?FyApcSnB47pHyENzGU8cvnExYTXKk5CRiwZb+u1D15k/0I7TsltW0+jEq8MG?=
 =?us-ascii?Q?ID/LAeCX8X3jFMamO2aVkCV2qVS//20yKBsL3PA4Fxcy9ldDnFQsGpcnpGRn?=
 =?us-ascii?Q?0XOUaG4TyUxnaLT+ZXGf8Jh0clXt6kRqIxf6nnrIPe+knTOAKux+2zTtjugS?=
 =?us-ascii?Q?9OEPDWV9BnFhxVSGuEQSx4Ni4Tld6Kt4BczVMW9jqzMACOoqIUAE3V7gi/Jp?=
 =?us-ascii?Q?tsl6Mzx/QncIzp6aqJxxjjYM0rm6Cjc5tSNYIKKXmfQncKH7HWfmZrMEF1LY?=
 =?us-ascii?Q?7M3LD+7ctg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3a29f73-3a61-4079-1ea9-08de70ee55ef
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:08.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j3APT20Yofe1PkaaUzWT4VX763qZo2Sc39ap1d3PR9vNZFF7HumsHwaAdVCzl7s3wfoEJxmQia8yUO6IJZYOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
Message-ID-Hash: K37F6U2XUMZIMLKV4PAACOJR4XF46YMA
X-Message-ID-Hash: K37F6U2XUMZIMLKV4PAACOJR4XF46YMA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K37F6U2XUMZIMLKV4PAACOJR4XF46YMA/>
Archived-At: 
 <https://lore.freedesktop.org/20260221020952.412352-12-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures,
and in fact for all future architectures, because we have moved on:
there will not be any future GPUs using the older GFW_BOOT system.

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f6af75656861..50bf351b64cc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -170,6 +170,15 @@ pub(crate) const fn dma_mask(&self) -> DmaMask {
             Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
         }
     }
+
+    /// Returns whether the GPU uses GFW_BOOT for firmware loading.
+    ///
+    /// Pre-Hopper architectures (Turing, Ampere, Ada) require waiting for GFW_BOOT completion
+    /// before any significant GPU setup. Hopper and later use the FSP Chain of Trust boot path
+    /// instead.
+    pub(crate) const fn needs_gfw_boot(&self) -> bool {
+        matches!(self, Self::Turing | Self::Ampere | Self::Ada)
+    }
 }
 
 impl TryFrom<u8> for Architecture {
@@ -315,11 +324,11 @@ pub(crate) fn new<'a>(
             let chipset = spec.chipset();
 
             Ok(try_pin_init!(Self {
-                // We must wait for GFW_BOOT completion before doing any significant setup
-                // on the GPU.
                 _: {
-                    gfw::wait_gfw_boot_completion(bar)
-                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                    if chipset.arch().needs_gfw_boot() {
+                        gfw::wait_gfw_boot_completion(bar)
+                            .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                    }
                 },
 
                 sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
-- 
2.53.0

