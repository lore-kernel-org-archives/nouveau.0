Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AABAEF99E9
	for <nouveau@archiver.kernel.org>; Sat, 14 Feb 2026 00:19:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F39C510E84B;
	Sat, 14 Feb 2026 00:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="wrD5grnh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1903142FB2;
	Sat, 14 Feb 2026 00:09:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771027765;
 b=PZyo3+Uld5h4Lcm4S9F6ZK6q4gxLhHyiANPE7thGm0G0zSJyy4jeJfxAXPBR2TUnlSSFQ
 U84kXSaGULU6xCuwe3Q9iOIx+xzEa4XDGNBFoKuKgVzHq5wZ2cD/T3I2zcFNcjTlTMkvNBj
 WQeNraZR6HNs/5y7c0qxSiYFJlQGfkJSk+blG8QHy2+kUWoVojbNFHmsL+UsLhTMmbDL+go
 9PFCh5KYj63ER3wfNGTRYKMNWZSEiggatHph+V5Z9LVxC8vgv5/Bmwxe1BSyXb6Kq8d7NaA
 0WZmScex0/3MxaSNj8JB5PHQ+7W1dVFP9//3aR55ga22QIfeQ5VVOntxIDMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771027765; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=m2rxC3jtDVjlJC6Gw1QEHEMWcoHGtIqUt8uWss3FQqE=;
 b=cbEIbOHAPHnb1Hj+mnWAL2p6kLMva4B25JCYe9ohGaUBs8DRaAWzx1ZcDGfU4u5ENpwr+
 h7R77WYdxz2K4G96jeaQQOh36DV1VAyKiO3p9vDjowS7BrX4p1/2oO1WZgJo54yTosMI3mE
 peou88Vw2HjG/FrHLPaxr3gGUgHZwbYi9gLk8BUjRnB/ybE8z6vqis2RsHZggHE11/JmbMQ
 AtizgYd3TBie5rWnViK6q2oJGEful0EAMbB5LIiAYyIRXybKMqgl7Qt7peh5MmjNcTN54+i
 ruIbd2w9i53zNS9oIpZYqnjJv6bgeiUb5EM0vVlHpWo+404aqxKFOtFfhzIA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CDB6B40AA0
	for <nouveau@lists.freedesktop.org>; Sat, 14 Feb 2026 00:09:23 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021106.outbound.protection.outlook.com [52.101.100.106])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5396010E266;
	Sat, 14 Feb 2026 00:19:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5b5bspdftZ6taREPLJY9gDHXHAYENdqzlx2UTc6ZLjdqGKVdltokqKUm2H02C+JqCoUxLbqJIBy8b0SYni+fy2VBBPVLPaPdKJQtB88hNl9YsNCss9hOHmrtiAH/LGWJ8hEenVafdCO0lKzVIZpEjld6swofT5J1aTxOo6CyxHuTvyy+cy13xC00OZATHGuqQvyHWx7UpjVAs0oE7MzgmUrowvro1xLJoFGnmGkK98liMsSzekJjp88l5iToTnG1KyIBSPLOgNg6On8y3siU/MiyFAJuGq128JvnpuGv72/ZH8KNj7IrK7ZwpeIlCgBonpb0NaJxx9IaBcMULSU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2rxC3jtDVjlJC6Gw1QEHEMWcoHGtIqUt8uWss3FQqE=;
 b=whi54kyrz1ej+yWanZA8CmktQ+rDPXyM6k3hbFuzv+1ZWu8a4VvJZoJUdD2RpJ5Z2rOh4QDuBU784aovgJD9LnElAeR8lrpI/+MY+D0Ru4UC4WItPDiPlNzb/QzUmN4ZEDPZ9wd5EqB/IXU35O6Gf/zOQBu8au1YQuG4dj1EKJdGYwkLJub9mCKoxHZdLPpAP5fmY8Mb1ZUEMz8UJyqc1CJcd4tRaq4rAmaPXvtJcPed+kjfmXV1jDxBs2SCf2S7yXFqNlzlyWx62OhOjAH7PML2JhzIvqdbpG+kj609ocqSNPh4W1leeWoyIQ02OWzditOkQjMYZH4tEa8Fqm1o3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2rxC3jtDVjlJC6Gw1QEHEMWcoHGtIqUt8uWss3FQqE=;
 b=wrD5grnhr0u2HB59pXaaWwsrElduu7LM+oG0wWtUrFmZuzMZs5Jw+Z0eEha2QaFdVyASwx7+2FIVcNlldvXEwb8aF5K3/uW7XU26Pp3BtkPNLgeR+CD0PxdaYYfEJNeRnCyIz8+p9HP4L/V6LubQVaGVv1+9dcvLlhnhT5HhYWM=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7675.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:21f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 00:18:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 00:18:58 +0000
Date: Sat, 14 Feb 2026 00:18:57 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
In-Reply-To: <DGE8Y55O5445.D6KRXL724153@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
 <DGE8Y55O5445.D6KRXL724153@kernel.org>
Message-ID: <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0143.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a0578b-e7d1-4dd0-cb9b-08de6b5ea5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qCqRCmCqpAIxcl66C3voXoC3n3PgdwwETvOxD261j3WUmAs0NrvIR0urmO8l?=
 =?us-ascii?Q?KUDI+Yp1yvdOsuZ+SknetrDJtqDUDWk1HZOCvprzB3lw+nXihdrN1PLIOXqB?=
 =?us-ascii?Q?m+gcBV6kCHk5JHqI2m5gLll0q/IJy4WGH2bqUMeH55+Tl8R529oSgtsBsUmU?=
 =?us-ascii?Q?Bgo8ynzky5urVEohaiN9TcIaOJtKt+jCgbnoPXMaJIfTpr3rxvnTDzGBuKOD?=
 =?us-ascii?Q?XtPym5zICe15OXP0MoOyg3rXmlOnOJ05tqTPr6Vc3+eYuQF+iHvlOKmETGjc?=
 =?us-ascii?Q?TMjnxJJIgLAhGo9OeLjNZR1ClpTW5fRBmtYTFFjTmGv403aUb9VfPD5RX10y?=
 =?us-ascii?Q?o0M1KFU6lEbROCtePdiQfSd47JTbNyR+1i/1RYXsfK3WTq0BaSev4FNInC7u?=
 =?us-ascii?Q?VK0yQpcroD/yvha9E0EnIKog/2zhYqup3r3y7UUBHulV1E/PFjHLskB70UKh?=
 =?us-ascii?Q?xjx7Kd0eMs5WOt3dQ/PTn1aH8VBgjMX+cgXXWZYnYjah5h1kuWGKDMkPDg9W?=
 =?us-ascii?Q?7KiC3vqDQVUsTdqUUokNurmvZawstRGIQouNyXTNi28sotR8ZnSoE4ykjH/d?=
 =?us-ascii?Q?Ux9TDaJEAYTZO71P92Vm1NmDNZkJKhejjqKABkikiDXBYt9SuP/uXylk5HUQ?=
 =?us-ascii?Q?8Kc9WSkDY7c7M+q1msmES+3bFiRE5Bn9JqBXvtAH6pNo1cYC7do/LDMlTGlX?=
 =?us-ascii?Q?5nJ4yCYR0jLl+NrOTsPe7TleUXaUpWCc/ilYMBdbT/HLuFgyXCOC8LZl6hAO?=
 =?us-ascii?Q?AUYNHKlQACKUdLfNhxPtC5b2PzJu/gbey0YrXxXUffT5j+vwl3Ld4Rm2LoQP?=
 =?us-ascii?Q?/CeoHmwQ8Bl5XwtnXZpoLjPAiUOc5e/f7iKafzzGvXIcZ9uhKBj9dgi8u74q?=
 =?us-ascii?Q?pHLMCA3Agfs0paP+pVHS4gjFsyXuNsFygaAHtXMz2hNeDAhOgzI7/Bn8Vv7G?=
 =?us-ascii?Q?hXKA1/lCreC9ATvi9+eY3vMIkcmX/W7/5knFfsK2tq7dl54JhWe8OCmxkEpM?=
 =?us-ascii?Q?PD1Yc7nRMHS81eyGOA2nny8dvhYwz1um8pLu2H+YmCP7Zye73mLDdrUz4PL2?=
 =?us-ascii?Q?3HkUytUfKju/Ocpme582wyDFaLm9P+qru+/R6+zdsoFaPA8mF3MvSLI2YB0w?=
 =?us-ascii?Q?ZvC0fQe2ZMwwnieZGWm1qJDXqp6Z60Zx36u7rsbmEhXNrpIN7y3DYCUKJrc1?=
 =?us-ascii?Q?z069ekbQKU8H76nLjNFUL46yndq4Nod0VXaf+b/yn9LeCjXTwsP0Q+S0iImd?=
 =?us-ascii?Q?z/qrJRSiLRtot51wABaJ2bJqkeBGHzSAUyEdH8c3Rc4OszoVTu5BfcF2796a?=
 =?us-ascii?Q?YuXRRpFgnNP8axpYSkf/4PDVb3zz/Bb8tqsxnzH1NBWEzG1FNYHsnJR/w3tF?=
 =?us-ascii?Q?o4A/IA9ww/goIXOVTuldbGjjd4/TttBxXPSyKqS081ab36LdznVUlYImKiBN?=
 =?us-ascii?Q?Ik1PmYTYXrjha9EphOfv6fQi5yZuDNfk5kare0T/7HUKFKoSP5NrQlpzFRRJ?=
 =?us-ascii?Q?hjr+8r7zjnG1zTQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ARp0MoMJycCaRoO+vNTX5BIUGvND2cUUyNV+agv+wBx2q2EemndreVAbDC/6?=
 =?us-ascii?Q?KOch9AxSm13kclXcTnDUCjx3JvbGhjx9Fxu8cGnW+Q7aN0iKWMM9Z3CQQvnM?=
 =?us-ascii?Q?pgMqIqlNO8mMugH79hYqdf4IcPgEq+f7SpnCqzSBDaxK7UoP3fkupp+qX4GP?=
 =?us-ascii?Q?AjqbcrkfXjM5kCIRhjEAs/oBM/cR16DHiV/rxiSJXSIXHnT8trw72PNRV5Y7?=
 =?us-ascii?Q?meMm3Ks57NfuYi06F0ztxHW/LhEqu6ei7Z/mD6lyLEZozSY4lSV6DL1S1s4w?=
 =?us-ascii?Q?/W3Vca0pQZZfb/zCB2QERiwuc4D4ho2KMDX8wH7GNabEaG6uHqg8Ht0Xj1YQ?=
 =?us-ascii?Q?j803UG59oiSmPeCdkyb3TaiewLfjCOcwmkUQEPlCY8MWxdhhN7ERrmZG7Evw?=
 =?us-ascii?Q?Q8q0AX+TKW+PsZgMyC7Zlo5yWByFBQQ28guQVeAoeBNTL9GeEXA0zKYka9O+?=
 =?us-ascii?Q?dLhzHKf/ARBk+P5QF1q2Du82NWfH4v/WAxQRc3yIFJkQgAvoyXz7nUpy/IYP?=
 =?us-ascii?Q?W4A2fjHOi291BFrxTQTueCadF+HXCs+e/BOU1zeDistd173EgnmX/xFIi4/K?=
 =?us-ascii?Q?mmenqf0htk+EUAUFFfV8RyuwqT71nJB0Nl5wxarbG1XiO7VcJ/PXRk0h8LfP?=
 =?us-ascii?Q?yfWRLq1qgjE8PyRYPIT8cRcS/3uYjI9VMmZWH43bmrbHjrK5BidosMv/Obbq?=
 =?us-ascii?Q?eykCphoaGtx/R+xqrvmpzkexp0uvgEODZnJ0Wen8M+WqRC+Y/NdoltLPVO++?=
 =?us-ascii?Q?yQTWwGTELxXmid+0Y6mA5EBD/fA86K1FK/cfHx0l9bhXIAhEloXfUVeSldUz?=
 =?us-ascii?Q?tP/1mjq/vPDrnBA0mTzVU9VC/6TK+cLHSGDKN2ZcFuxDu1+/3ZhZZ1hX5tTG?=
 =?us-ascii?Q?+GzS/UQPWwHleTg0EJ2Q4mvGBXc8GneAegZ3XVmT4NphY1Psdr1p7lAAX1vB?=
 =?us-ascii?Q?dpwpF0GbSevUieUpzu1huTIAaPqKt9GX32smBAfLU4WBsBbZnCq3AGaQAQgK?=
 =?us-ascii?Q?3KjlLFERu7ysSIj+XIAPLbL8EnKNSgo8/tIW7K1UN+csd7znJYCmd/JCVp/6?=
 =?us-ascii?Q?eMCQFGqYDwWBTpSEzIc0i+4Mh0Oqu84GWL9IrAJJgVUdmS0q57DNjQaNiYqp?=
 =?us-ascii?Q?szz13Xph/A/tdmykHjfCmM9mrLT/8DDkzJR3DxZR7x65jNwHxyQf0uRda8qn?=
 =?us-ascii?Q?SVFwZ+T06rVqw48J3u3YAQJiqhy4fPP+nCC4Q6HAA1IknFR/PXFnrS95Lqs4?=
 =?us-ascii?Q?kIdmhzaxisIqpo1HC/iTQkUvi9dY3ehgHz9YvwYP2EZBOOC704HyobUbOBaH?=
 =?us-ascii?Q?bHraKP18/E7gYKOEHFBaNhRG2MCmJwygIH8AHLQJrS4+NAR7lYKxKUUWtrPs?=
 =?us-ascii?Q?i1q72WuiU6VZmRiDKpE/r2XzpbqesWRUMumdHsIyfOuYt7Q3MoZf0nNcTk1d?=
 =?us-ascii?Q?afnA2PrIcm77/M2N7ARUY1kmiLszWiUeT6KXkSOws1oi30f0WzXVW63tRSAz?=
 =?us-ascii?Q?fZSkfN8ErhnXcvmmQzCeSFYRteN3pij6Og5uaYPmG+dps94PZMRunLPyqLe5?=
 =?us-ascii?Q?4/VHP+83pSojIlISsSxv4z7uqIetazedHjsJxqkVvsxY4vWpllqTytVWC6Fn?=
 =?us-ascii?Q?7EJNK6M+H81GyGjhnOO5g9sYO2qrs0ZfRnS+TxEEE22MmcWTwLcTE4EhMhQw?=
 =?us-ascii?Q?sEet3VMq0Wimjj4qpMxrCpirXfYJz29wfA5DPdV2WyN5tTvCMoNVJTNSa6qW?=
 =?us-ascii?Q?oL17lxCxag=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3a0578b-e7d1-4dd0-cb9b-08de6b5ea5a8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 00:18:58.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D2Zzov9igZYgYl+BV5GCOei/NpP8HJSAbn1+gZZzBBOgRCEJm/avRyGiFXnSG2wl8gFmjDnSZninU+lBkzYVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7675
Message-ID-Hash: CR2TCZDQU2U6J5LYCFVBMGTAHET3JSCG
X-Message-ID-Hash: CR2TCZDQU2U6J5LYCFVBMGTAHET3JSCG
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CR2TCZDQU2U6J5LYCFVBMGTAHET3JSCG/>
Archived-At: 
 <https://lore.freedesktop.org/1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026-02-14 00:09, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
>> If you prefer, I can send out a version with just improved projections 
>> without
>> all the generic I/O improvement stuff.
> 
> Yes, that would be great. Otherwise, we can also use as_slice_mut() to 
> avoid
> having to touch field_write() directly, but I much prefer the former.
> 
> In any case, I'd like to keep the PteArray type. It can at least 
> provide a
> function to calculate the value from the DMA address for a given index.
> 
> (Would be nice if we'd have something like a dma::Projection<T> type, 
> such that we
> could have PteArray::init(self: dma::Projection<Self>).)

I think once I/O projection work is done, this would just be

impl PteArray {
     fn init<Base>(self: io::View<'_, Base, Self>>, dma: DmaAddress)
}

and the generic I/O projection is used inside.

Best,
Gary

> 
>> I've already suggested that in
>> https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570456463.
>> The issue is that however the PTE array needs the actual DMA address 
>> to
>> initialize, which Alex and I feel that we shouldn't provide to the 
>> initializer
>> when `dma::CoherentAllocation` is not yet constructed.
> 
> Ah, indeed -- that sucks.
> 
> And yes, it would be super pointless to give out the actual DMA address 
> in the
> initializer, as it would defeat its whole purpose. :)
