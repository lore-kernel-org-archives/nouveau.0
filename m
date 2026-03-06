Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DCAF513EB
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 02:20:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE42710E2F2;
	Fri,  6 Mar 2026 02:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dLyWALue";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2501344EFB;
	Fri,  6 Mar 2026 02:09:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772762984;
 b=jN5fTslIXS31RdpXaL89AP1zb0zsM/ajw1IWr115kM4AaiB2mrORvxNbhoM0ywJacAJg6
 DJzMIV+0+wid7vM+lOYnI3lnzqsfjNqfQ2azE3B3hc6BKFvxmpXwkhMNLB2T5ICYfdf+nsf
 hjdKT8CmfxEkS5SCB1Tkh5AKTzzdfM4V7rp76723eAuG7WbNO7GlR8ZtegN5QALAYeRmGpA
 UOUVCqVDh4WndKSZI/VBuu2mSDcgc1zNTTJRbvXNGZmloeyHqSozbClsxkImlBikzd7NlQK
 DR7blgRWS7qY2w7qAhoLmsQEOMrDOkiu3QK5TdqRU5zyfLvBkt6vcAVWJtQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772762984; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=thp6V5hlNwlvui6CyC9qcz+IPQEBkA+MyBbT7kSiEGg=;
 b=ABI51rjN74Q8hJx/w2i2fLm7FKe7HHbS+0SRdy3K/qK2DPfblG7/OJjvc+2drL6EUskTs
 Iz3Q8C38j91Lg2+QqnqUrHFvQ+YEWyN+04xUFgee+YwLCk9mdUfOlrboVoBXkEinHuTwN6O
 /KsrfFGNU1vyO5M1OJBFduxL2FYk4OKm26BU1BAZR2vWSGdYrx6pXGesULFLoxB3HfukS4L
 j1ubhiRGUIEi3s7gTez8R9/EIsRLWgfBBpq75Rdaxf/Radrp459MuaNsQ+zJosYC8BZ2yCD
 +O0UNIpuP01qvMnZsK86SWODam0NofazBrpRX0/Zo8jBKlekGVB4W5yiJ0rA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A3AE440760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 02:09:41 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010029.outbound.protection.outlook.com
 [52.101.193.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9BE110E2E4;
	Fri,  6 Mar 2026 02:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Di5OWcaXj+PZv1Gnr0Fu8AjIHlP+VEVBjcyjIOCWRQOW79aypW3jq7uWzE6KP7KkWKxx/vHNWztEGjhnpsQaQfTJXQePfi43b90ZxM/b2rFlhoPdyvA+vzvkq78w7AoH0rCE20jsVlrUytEGmNwTII5M+MmoyvuLCBPosvnJZcYxOfmY+KXX0Z8W5QCKUq1T3K71JoC8Q4JKNsnnD7Ac1OEcLdjXtw2MPPcYfm9KblAZuTGjbkdqQKNGjpuHqqz96fdHTy814TjUg1EntNvw2n5A5NOsZWKaKQKcRQ19w0H7OxVgDSmb6NZaSXtjmfpxKs2zbt7tJEByEonyqghTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thp6V5hlNwlvui6CyC9qcz+IPQEBkA+MyBbT7kSiEGg=;
 b=IT6mU4gy7SCZQ7+rHQoV5Wbf++U3h3ILY+eH9Ze+VHDBj+kdDGZMT5pBQqYY3fA2YGHTH7++7bQkiAbhcmTSzAxrrvdDhcU4XxqvYxpWMZLzue7FyYL7mgmSc6jCvOYHGRuBz4eIJuEkEUsVDjQSxHUx/eU1u5CEDOaN4t/UhftRVlM0brHgl4btNzc2rHaVLGDTlo6FQoc7/YBlQ6/xNzso8IGQkZcxoRwu2DIAVdyZZWzQHNLAr44jTW32U8IhURtmp4Ry7N/Syo7OKhkmOL5qWN8P3aW1l5LXM0COpbwwZy9tIjJnUEnYsV1ZMb9pdbca4o7NG79qKIaarybXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thp6V5hlNwlvui6CyC9qcz+IPQEBkA+MyBbT7kSiEGg=;
 b=dLyWALue0CjmwuuRSi8bXxUPF/D2lbMXAarlZ2PrzDobc3pp2qxKCqipujiKpZEy8WDlkxYVk0he0NU45QdS1vRCjhTLh1mCQMFm9uaPd4EpY9tlPFwlgFaXjetPiTv2Z/gL91FjdZ07plsRUqnCY9cq96BuJOJpIti31watD8JLkqrItySPKQmYfJX151wp4vG6t+oK66UJkP7+pJWJVYAbg5kn4usQFVo/VSZYGwD3PGWHF4XNffjGbm0R86FV9sqNGtvjg632OucCUU5CIKTCTBW996s4E8yLqonLZzKBKsi+ocJWLFv6guwcyW9SS6WKZ4OLs04J68ML53qHdA==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 02:20:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 02:20:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:19:56 +0900
Message-Id: <DGVC8XG5H58W.3E5IYCC1D7RIQ@nvidia.com>
Subject: Re: [PATCH v10 10/10] gpu: nova-core: add gen_bootloader firmware
 to ModInfoBuilder
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-10-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-10-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 103ea18b-ed05-4aec-c595-08de7b26de2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	pCvr5GEORWTHY/BNTntVWoEvdNxjBrNaUEBW5jtWLsWjbaTDoEv2SFjzY08ZHPVvalmrrszMXyYW0Heogtni7/fVYlSMy0bOg3npkYMxKj0TpuiAqHUSCvQaTGjL4Ndz8XY7t2yV7CCGiD5SYGVGfRJMjjIjWl3dGCp1nZDtRH7sqkNDwxd/G5sEJF65Au798a4wt36rCbsusTY7SCvq/dLSNKU8mlrtKILL5QcmPh/fBR6FB6R5zjTda/VX7BKf/UM4ndvVdQp8dnKUU8+YfWiHZ6BLKtxHgK2BP/I/rUnQQlklrfhQ+cp+PfHYWeg1Kcgj4uRjxjLTLc0Jgo4Ai9ZpHXqXF7wE3o0b3FokzL7vV2YA0GhBE4On86L0IAGpMbajmGEcPk+NxWxf2r1EhNDcsWiF6RydQ8ofPLZjeXdG0aV0Fx98gdBhRk8osad3ud6vKslCN0lbu1cK2D4WKNxh73D8RDNi+w2ktlj2ot/5s+BpCkihgsiRGX8jWtAg5OHfNr/sUupoRixU6P7CEzaJtC40K6QCoI9iKRQ5aYXK90f1inSziETjCYjrFuWl8wTOktzgUoihZE+lbMWTPWawYWz9OZ6rrqhXylAotA6vUlbyu5DAESkPGPIoYhi/fMGQ4jbYi7OHKgxHCXB/ngcMwcgGoz6bFC5472vcWTtL1GJixQ83vwIYU/c+F3gF0cJQMHRinNf1QzxA1dN4i6wq50jeZZYBBXEB2YVtahk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVZKbkJjLzBDRWdha3NTRlZUM0RYY0VlNU52QytJb1pmVjFOODRGL0NuR1Mr?=
 =?utf-8?B?ODh2NTBpYVZDOXVyNzdaeUwzM2d5NkhXTTVaQVRKbWhHYTB0ODU3MzBRRWY4?=
 =?utf-8?B?SFlDSGJlQjJHVWlxbGNxcnZvTTNnUVVYRWFXcUZtdXlLZHZVMnNyTjgxRDJM?=
 =?utf-8?B?TjMyYzhRNzBkaVV6N0NDQjMwd1B6R2ZIR2s4MTU1dG9mVmhWSmVMK0RLelBO?=
 =?utf-8?B?R3IvM2tsTDBHbEhhRnJXZDlHczlPd3o1NmtnZVpUYjlLN3JyT205TE85am5q?=
 =?utf-8?B?L3I3bHgrb3YxRURZaWpKTnVvdVBISE80RmdZNnpWVlg4YWR4bnFPU0x3WEIz?=
 =?utf-8?B?dHMwTkY0VGowNTZGWm1CWjhxMEJDeVBScWpqbElzb25DZzRnU2JHODlMMVBh?=
 =?utf-8?B?U1NKSm95bGdPTkJGYS9RbjRKRElSUHN1OVo4N1c2WGJWdFRQTVBtaGVjOXEr?=
 =?utf-8?B?dnV1UmJUcnE2ZzJKazBLc1lEUzl2NWQzWEZQYVNwNVVOdFozVC9CZ05WL3kr?=
 =?utf-8?B?TFFpR3VwZWt1UzRPTFpzMGhrOWJENUNpZnUvRnlIYUg0MUdMa2dCZGUwaUEx?=
 =?utf-8?B?clFkVEZWMEFrOHJaTk5RSU0rcjNZSzFiNDMwRE9JYndOdXc0SkxoMmFOUjVR?=
 =?utf-8?B?M0l3RjczVzlHQUh2L2J0SEtORVlRV0tyTGNUOWxjd1hkVGM2enFHbzZ5eFJN?=
 =?utf-8?B?MGdHL1dVcnlMa0Nxa1JoYzJ2Tm1ZNVRQWFJuNEVsczlMYytadUtQeEk0dmJo?=
 =?utf-8?B?UGQzUzdtRzhpaW1sKzBaZkVGZ2lCYlR5alNKUVlUUzdHbENya2UyRG8zS0t6?=
 =?utf-8?B?czd3YnBFMWxnamtoc25WcnBlWHpYVkhLQ0tHQjdzL3phSnQyUkdsaG9mbFBq?=
 =?utf-8?B?bG84L0NkbGt2OXE5TUJYdnRzR3lzbDlKdHJqaTRaaHlLV05YYXlISWZvMDNL?=
 =?utf-8?B?WStMMzVMalc3Z1ZaUE5DbmVCY0hORGQ5K01wdHpNVGZPbWVDOCs0NDhqUkpY?=
 =?utf-8?B?MHh3eXVTTExEajVidlovczJJeFBHT2dRWElJY3ZyNVRQT0t2MWIyUklhZlV1?=
 =?utf-8?B?R3RybmQwNzhHN0RFWmtCOWRYZER4N2NYQ0NhTUpBRUJ1czJmdDhsRDdRMXZ5?=
 =?utf-8?B?azZYZWpXTFE4K3NUT0dqWFBsUUFUMjY1czVISm9VS3RIa2pkM1g2cnBjbmUy?=
 =?utf-8?B?Z2JDWU5JMVlDYkdsR1hPdTl0UndUUjl3Zy9yVm41MnZuVWpLbWg2elNGZVQ2?=
 =?utf-8?B?RVR4R0xYNlNXM01kQ0ZJVmNlb3NxMmxKUkExUXhJWFZqV1RGYzRQU1VsUVZU?=
 =?utf-8?B?aE42TVJPL1p2Y3lPR3RvdXIwNGFuVG1DRlVwQXluZHd1YlRIT3k3eDVKR1Bm?=
 =?utf-8?B?OXhCUnJlaW81WDRtM21GVHViRVUwYlhrbVBvZWhCK2R1QWpkYnR3WHhHQjNZ?=
 =?utf-8?B?WG0rQmdXVjRZMDZNbXk5QWgxVnZDeGRxYmYzMWxyU2dGV1JWTDVhVEw5dHVD?=
 =?utf-8?B?emc0WTM4Nm9ETk9TdktTV1Y4R2ZDRzdwMFpPbGhkdTkvYUlsNzhXVW1vRFBQ?=
 =?utf-8?B?NzMvTHJxbDVXaFd6SGhyTEZmc0kwei9ubFJJM2t6aFBhMitBYVlBcTlUS1Zo?=
 =?utf-8?B?SHhGSURCTlFwWHZvclYrek1CdDVqMVJHL1c5TmZIdkZ5QS9KU2JHZHhOelZ3?=
 =?utf-8?B?cE5PL2JBUk1KZnpLK09KZGkxN2pjYmVMbTVCVCtpMGtIT2QzelcvWFdrSVd6?=
 =?utf-8?B?VklHajJUN3U1OHlrZXkvOE9Na2JqZzFVRnRzS1VnVmpjd0IySzZhd2tHL0Z3?=
 =?utf-8?B?QTFnNmp4UzBEZE9OL245ZXVDZHZ0QzMxditDUkFHQzhFWU1VdzZKdXZNY0lq?=
 =?utf-8?B?RnVWbTBOZ3dKYjlCZTNRaDBMU0dJTWE5RXM4SmVmTmNIdllsd1FJbnhCaHlv?=
 =?utf-8?B?UTEweXNZZHJyUVRJMzBwUG5YbHV3TDRrbGRtbHozbVVSQjUwUlczUFVhTVZ4?=
 =?utf-8?B?c1BKNWplMlpBVHZjbjJKci9lN2FJWWpWQ3hwVG4xaFFYYnJtSXcyLzAxUlhC?=
 =?utf-8?B?N21IZXYxQ3lxb2FyRUZvSWVWV0t0Qm12eHpTTmhRNWJIanBSL0ZjbnRhSTlv?=
 =?utf-8?B?NGdqUVBlWkRvYzNJWkRsZFJ0WVF0OE5admhxYkV1R1RvVzNWYitoVTNvR0Y1?=
 =?utf-8?B?aVpEV1dBWmVwemtBYkZGU1QyMWZIblFYSmNKS3dlWmRFbTBCcUNzamRCTTMv?=
 =?utf-8?B?a3RFbzUvVHVEM0F3cUgwZUFjc1owTG5HdHlNRUR2NVRZTk9Ud2Y4T3RXNnBS?=
 =?utf-8?B?REJBMWVHNjgwWFdObFNmQ3ZIdEt4WFpockFBNU5JWGNQU2J5VWsyQXA0ZVhM?=
 =?utf-8?Q?ME77cC0llCqbs7iV+19NG9a66kF9C4fW56eYhls+7WiQ4?=
X-MS-Exchange-AntiSpam-MessageData-1: hQ019Tf7WJ0lrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 103ea18b-ed05-4aec-c595-08de7b26de2b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 02:20:00.0994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yq8Y41NfR/GxX97MTlYjCTBZFIC0fhCf4ldtY9atvXWQl6I22vULs26h7uU/W2qlnjIpbYiwRW/cD+hoUWIlBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
Message-ID-Hash: CRMKZCJ7NEJMOWLCTBXOTTY43X3EQ7TI
X-Message-ID-Hash: CRMKZCJ7NEJMOWLCTBXOTTY43X3EQ7TI
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CRMKZCJ7NEJMOWLCTBXOTTY43X3EQ7TI/>
Archived-At: 
 <https://lore.freedesktop.org/DGVC8XG5H58W.3E5IYCC1D7RIQ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> Turing GPUs need an additional firmware file (the FWSEC generic
> bootloader) in order to initialize. Add it to `ModInfoBuilder`.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
