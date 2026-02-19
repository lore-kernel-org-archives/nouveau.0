Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56837E9A054
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 19:29:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 075A210E742;
	Thu, 19 Feb 2026 19:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d/QfJqMU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4812343430;
	Thu, 19 Feb 2026 19:19:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771528752;
 b=XX/8zFr1jQSY54YF3N1rKChssDLo4tDJafjcMYRx6IL5NsABFEnoVcthkAp9DMua0sTFe
 GxQW3vl3bpl+WeAvDjC0GrYxbLW8C8McWz5kG6Df9OORDP9zbx2TYxJqCOFyMiDiHVtkep9
 UwMxTOl1wb0uVlhuHi7nwUF0xLzbCVxX6mrK3kqojExKmxwOp0i2i2TVDJ5IpUI8OGOAsDU
 ipS0wlZuDUcBHYdpcu3kQGcQweMiRb0tC/KGBVAP8k9q21Xu0f4oS8YaSJwYvlwYXmax6lX
 jJ0yceLjIlvL6aCiiAYAuiBwprSHelh6TxaDmmA1+Ahd2L71auifD8TJQzWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771528752; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r5flg/QouGC+ddl1sNTGhEnraVyFmHEuO7vnhntyKlU=;
 b=RWjGjfJBBNJ21x9JFByERROu0oM5pR4v1kwyB3KiLWNfosJq6FWG7RJ4jYxlzncGC6kfm
 y1HKmryNly6ym8DwAm4nIZ8YHu3gIRfvlb+jTdsdeTg6oRqBzhaPOwk5VF4zmtoz3zzq3XK
 dwS6msvdSwEMXS0TPP2EicunSsW0Fuf6uWBzHpapAlsVxiSGyRbHm6MyXq4t3ZBm481Fv/4
 9w6Gp/xqkVkaufstdP+S1pNXMi7hsmZurBJs3h9uiHDZQ8eWKsTpqykKLa4hKp6+pmQS+Rb
 jx7Z2doGBRXjXJBwBcwMGCCjPJxwTK5wySAq/iUW+S4p3kBURHcLoAPDcHZQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3D37C43401
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 19:19:09 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9913E10E73D;
	Thu, 19 Feb 2026 19:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkpaArZNLB6fzqET+rshpkQdeyYx/Q42sHv0nPtG+R2GQtY97Dw8oNfdT1nF/BSG0VLZt32rIJlK3AL2su4Hp9yAMXqjIdpdo286ZUy9yiK03X4l1lu7iN9K1h/ozDT+gpehcD1UE2nuPCoByAECcSF4rZbpSMt3bbdnwHidxD4BQvHCe5oApUo1PAt8VD4LP9L2EYdWXQDWwO5vlK49EUHPrulKPrdxJgcQatS6qIVAWlzyD1JMH+45DSlDYc3ij9rKg3r4vrCZ7kHdHCxfiVuO4HpphoMmzPUArRYbAZV3Eq2e0Ae+1JDA3QYDRyKfCLrRoXe+8T1QK9XMHJMraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5flg/QouGC+ddl1sNTGhEnraVyFmHEuO7vnhntyKlU=;
 b=B61+OE+qgGyiLBWsXeRHT4QohjVvojnXk0Njt6nQSNSUuHuU9Ds0hczI5xLuDt2tFmUkLt6hZkGtk9H32D6H2V4+siHD70o2ALppqnvvbrtS/v0IrjhBWNfBn5gXWYbyQEmLCK4W5oTsJaDByOdbajixrtWXtwujbWmaCPO2POhMIUl9p5mqEV0l7iQqkMpvETdY4lrvCDbXO8/XzLozOgWKACMjn+2RtiTKpHOpO7HUcsyzXHdz43evtJYazpSxrlf7bRmoRzbHmj6VrsTj6az+Bjy5J1tSeFPw28d6Jt7L8s9+pLYknwVXDQF0vQ5RCLcmyK2hOAEwMApEoEiJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5flg/QouGC+ddl1sNTGhEnraVyFmHEuO7vnhntyKlU=;
 b=d/QfJqMU7YJHKDyo6WvxRrY6Q+84+Dd9FT7kwvVNHqLtK/vt7dZMKFLiCsaEX55fshdoY/4S1VYxegDZGGN0UDKXLDQNof9xMGkD16GRdzyC6W3LvyFTVVS/Df4f8CxlCmlBdkdAAPZ63RZrV1FokPgRiH+95ZTgvubNIBwKCgOPY9syBDbJ21ug8WB50Q8bk9CDOE3kPoozqiR3V5piIGkTiFjx2UQ6g/sD/rEyGp9xhx1T2k5i1HmIw0lzPpVWeIze5PaNMmGqNLG12M+vpo9VjE3eAK2lmRk4F+ghTs2dL4r0JYF281gv1s12Osggz7gUQW3dgthV3SqkeApqVQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 19:28:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:28:53 +0000
Date: Thu, 19 Feb 2026 14:28:51 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Message-ID: <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
References: 
 <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
X-ClientProxiedBy: BLAPR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:208:329::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: a74cf624-18b3-40c2-5f86-08de6fed1d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eKDY10mkp1rZA4EwmmUF8wCfxyoqvk8o5lf4wV3+BOBibkDtco6yFlkwSrkr?=
 =?us-ascii?Q?LiSv14Evxw9FjSOg8ie0YMKipK1wO3LDduF407dQczk6b33hbZsShi146tFK?=
 =?us-ascii?Q?rrD862YzOqMLR4iuODzL2VUu99VkRp7osm5SMhLKKynSkdNqRyQUosn4LoIo?=
 =?us-ascii?Q?Ko72++kJxSGCvyAo2wqB+sNHxs++WBJxZCjqbKA7fabByk71FHKaDTqaRpxp?=
 =?us-ascii?Q?HkLQPRefm0PVcaNRJ4dd+URdb4lbOEXHc6PaHAKEC/HV47W35AbnK/NPEeL1?=
 =?us-ascii?Q?CZ5gnT9mmnDpFkGaFdcjc65rDrCwRgpgcGl8OdAeggeWpJdI3JFXFWq40qq0?=
 =?us-ascii?Q?mrvbbYNUyDy8O56w4p6hF57HSkl3d9xH/P1bGmP/4/jxLtDqzX4rd+ezDrmO?=
 =?us-ascii?Q?EcLtwz14tSWxBQBz17Oh0qb1IW2jq93ZFNw52vmA11yqKWz/xAmwH3Lbu0NL?=
 =?us-ascii?Q?Df/wEbtfjZvCADMAYh9lMhHlmwUFLAEVMSxQhcnB8KvFbwDadLDpLy3W0h6G?=
 =?us-ascii?Q?ZBq5M5gyEx5z8tdImwjZqDnbmgl9Rvvtd9r5K3v2jpQ4y+ZzWl5GNvFK3pvd?=
 =?us-ascii?Q?ZmQf/Zyd00UcBE/5ZIwxYGFHrfueGqrBjcVYDHdT3ZBpiDkufYqkjkWAnYrT?=
 =?us-ascii?Q?VCjNYQH5sD//siEvKqu01jpkcwMCENT0Qmnx2qmgPBJ+wNCsMIQBomenS43M?=
 =?us-ascii?Q?Jyv5X32/JHxKTGkiHrtZox86uGxn8hIzcBDPxdDs5Hgdj7aBl6o1XYvy0CUi?=
 =?us-ascii?Q?UwjKV3vG3LVbPZtYQRL7vQ+Ayfkp4mYpnW+ilGkVCWTt1qYL5OAt/rcalnMU?=
 =?us-ascii?Q?pV/dJdfbG+ITq2eSH9QgzRnaaSNwX1+yFuUXH4daFum8t5H6TvUbgvW8UTMd?=
 =?us-ascii?Q?ksnfKOOpgxIzo8liENPq5RbdottkeH8yfO7RVwpv6u+am171qoELflqN1Bp1?=
 =?us-ascii?Q?lIm/lNHbWcRLORhEFGnGw18B7rfF4HNNTXdutPAHvMPnaPnKThnBX5pWtR+t?=
 =?us-ascii?Q?9+jJ9du4LMtzueJbpM8gPe8QgskF95uydBcin4HDZR2Nw0LpifCORI6PP596?=
 =?us-ascii?Q?aTkjCheAPEz6IOVPFZvKigI1g1P1jOsDOV3eQEwhThUy155q+iypx8QNzoJx?=
 =?us-ascii?Q?aov/Xz6M8AW+sRN0RDJIPc+hqjUyOAtx03jXOvXGWHxKPShP6DuH4TsbV+Q8?=
 =?us-ascii?Q?3tWOSKWfZETeRNTP0/pCKGywvq88Wjcait09Do1Rrn3tHK0Gkz69oa2fxC28?=
 =?us-ascii?Q?EI21rAa3066kvsRhveXohgb6yVvHQ67NkdmKm2fT1XNHbLk6G2hCl/2BCABG?=
 =?us-ascii?Q?aehBVXNfVBimfXmA6xZQKIcTotPy3IZ+LIQ6YdD7OxrdWovDrmqJmJvnbbeu?=
 =?us-ascii?Q?/y3kbcV7SAZx6XV77yL9S2f/guPb42k3yE/mvQF5uRrqiMAmRzDG2RL7j7lv?=
 =?us-ascii?Q?Cbd9KiKPCGhS8NuZ5vRokiL5wjL3Q3g5ipTdw9Ek+EUtNfmJUmzSmvCueMZz?=
 =?us-ascii?Q?GeNdqd+C0xXJNJXIxtd2rGJW9Dwzo4DUwAiCLwOxmllbvpnAUT2fvi1GMt4M?=
 =?us-ascii?Q?dG58Tzp1Ph57mlvh/pE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kiCyIRU+G4k1KkKvD5wIxNp/3ocsMeBpByngfsLIABJDx7HyTqrDYkBtQB77?=
 =?us-ascii?Q?NPv4EBrOlbQWkjbQ5ULu+KV9F2/+JV6nNJUQKtQQbta1tXnVxUTqLLUklPKO?=
 =?us-ascii?Q?jJfDGFx/eyFCQjyCbOyMwIwqSYcadQvYTvzvX14HcJAwLDrPPPvGwl7KhTyZ?=
 =?us-ascii?Q?n9uq0Epq3rObn81+R37mrm/bWil+UfvhFkIVbMuMMwoMmwlRUDQqSxiBUGzj?=
 =?us-ascii?Q?BRgLM6L7iitXQaKK0RdrHD7Zd8wvKskxPxn0aq4wS15SvNvjOQ1BJL3EwiSa?=
 =?us-ascii?Q?l4/R5ZPiLbeqblFPHV3F2LmlJ8afPYc08YyTu1CIzynzHgikcBHfyRzVo1P/?=
 =?us-ascii?Q?BYPMJtleZEfYHOr/ZYMinmf+UUs14UJayXu2OJoSBDnlzhAerxTSWeb5OdVZ?=
 =?us-ascii?Q?ZA+3AR14gvIw00Flom3vHm398vvzR40kuUtgDhQ6NYWWOW503SvpaIJ8+goq?=
 =?us-ascii?Q?SxwwrBplBDms+L+qSZ39qHM06/vfbhmqToOmYE6+gsufeTw0pl30RTwMnxzm?=
 =?us-ascii?Q?IfKknLwW+cv54gfnJSyHn8wm0iy87kfy3bw/z5cSgWCFzuznHs7WxXGmFLWY?=
 =?us-ascii?Q?GSBE6N8V1xv+TxnXY+YBc1oCiczZ2djbOMdhuOnPs/6RFPwCUDgOd+ynDtf+?=
 =?us-ascii?Q?Guwf0UhK728jvqlSF3AHmSOEChxsoejPuAbl4OYlkXyB0wuGkxUlz6hewNpi?=
 =?us-ascii?Q?Yvjh0PWsocfOATLxoub7GuLvUJAY4glt/kGKP+r2K5ZI7NzDtvZ3L98iN/vP?=
 =?us-ascii?Q?1ICn4KlBy9tQvlOLE5r8Bk5Z2syBf5mo3ujrLlhmLSjRC/k/BNEt1GxNsHct?=
 =?us-ascii?Q?qY7DFj5Q7LD/4JMIWuXNBgsSR8Tg1j9WbfDa0FSLQpGQxVnfStB9JKLR86pY?=
 =?us-ascii?Q?JA7/E29SIH3pHn4ZTLyRDPmkv0GstL/HsIKDmX3Kuacga4Ay8c7RdherRpiz?=
 =?us-ascii?Q?a8xkM/ub5/RH+z+oBF7KyNccCy/hAk6j0YiAlOUDwklv5+kfGbllvdBZ/RVH?=
 =?us-ascii?Q?bK1RD39dA6XZLtH8pL8jH5lcHATPkn/p/IJsBbSq4jdTyTS9EAF3rLBqoAqA?=
 =?us-ascii?Q?0XgF1qdf4VBG/JSVXSO4v2R1t2wh1pJ+XAi9X+NET+pybjPHAn7PFoqAhaPq?=
 =?us-ascii?Q?MEGXFY4qXDRhd31VTCQFkaKuiR+ncwBRfmzkuTyqDt0Mtc5LGwyi35hiX2Bm?=
 =?us-ascii?Q?4ojUKdbtm1nop/IYPWIKklbXKieN+N0Oaki1y9lMlEQfYLqQSbMuaNVPQDb2?=
 =?us-ascii?Q?alLX3lSDlOI9nGpFYGmJ7+HaG0v5u1uKUKWPEP83bE+lXewePxYCewgYXG80?=
 =?us-ascii?Q?SP7sqzdgt5/I5X337gdSHSdrfGyOq9lAWdzjrhEZkooPGtV+5o0RNX/hmp9R?=
 =?us-ascii?Q?BLDP/lrI61NEFGo4aYUiYEW1uJqVBArI6BFpRghqhnLEIQb4gOsXK6HRIXNH?=
 =?us-ascii?Q?HYqDassxSX0oUvUhtcwHe/+0EqPb/rPg0iW66Ac7K7Zsz3Lu3lBQCYiN8sA6?=
 =?us-ascii?Q?3kDQA3AfG/ZKvtSkM0XYhaW3GgTzjnI39YlR7WBzbXlqMZN+nqVRI0B+ucLu?=
 =?us-ascii?Q?GfWWztrLCA2CTwsSCQma/AMSMvG2S8Cpt/DUv1clBSdzbDVkBfUHClOqathK?=
 =?us-ascii?Q?aX6Uh0heUVbc6B9QpPQP7OFSiZF9gkSyA6tJvzQGqFagLngTKU59Ro73uf37?=
 =?us-ascii?Q?wjdlt/8ng15YFqYazGWwYVjZcz3Iq/pE4r7b0Vl7w13s+1xWflht8e/Uu3cZ?=
 =?us-ascii?Q?gwdtXnlFGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a74cf624-18b3-40c2-5f86-08de6fed1d81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:28:52.9968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hj4aqS7MPFFnsgznDifHG6CPrUN33MoTXdXYMnlEAwUrLXYZ7hkPAKJNszvlPfCCUr4e0d+x7g+v6H58PT0UsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
Message-ID-Hash: ZQEPIAHG4CKDPOFYKRXYQ3VRF7Z56EY2
X-Message-ID-Hash: ZQEPIAHG4CKDPOFYKRXYQ3VRF7Z56EY2
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQEPIAHG4CKDPOFYKRXYQ3VRF7Z56EY2/>
Archived-At: 
 <https://lore.freedesktop.org/FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Feb 19, 2026, at 1:38 PM, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Feb 19, 2026 at 7:07 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok
>> with this too?
>>
>> If all in agreement, I can make this change for next revision.
>
> It would be very good to get you guys (and NVIDIA) more involved in
> general, so thank you! :) -- (and Danilo for proposing it)

Sounds good. :)

> Do you want that I set up a branch for that like `rust-ffi`? It is
> usually what we are doing lately for things like this, and slowly
> splitting things into more pieces. I see you both have already sent in
> the past a few GIT PULLs etc., so possibly this is not that
> interesting for you, but we can still do it.

I think let us see how it goes and how much is the volume? If it is
light then I/we could send you a pull request from personal kernel.org
repository, if not then we can set up a branch at that time. What do
you think?

--
Joel Fernandes

