Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B4BE9381C
	for <nouveau@archiver.kernel.org>; Mon, 13 Apr 2026 05:33:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B86110E313;
	Mon, 13 Apr 2026 05:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJPebNnm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3EF1C44F5E;
	Mon, 13 Apr 2026 05:21:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776057711;
 b=n0nnb2+obmsQJlPz2z4+lj7ie7sM7M7Uk8FNzjiRA69N1Cqaooj7FqHS/2z0hylLVjqE/
 YXTyEDSxakN5cjHkoRABDNSNMiGrbaY47sXdqFiAVIVyg7bpdYSqlHPoRYOsg/7bNjB4g7r
 C/yykAjiTepzNjNjmDoI1K0fheNA8ZM7HnWbfJRsrKabYAGXQooDYpaDx75pTo7trqRsbI0
 assC0K2S7QAu7A7EZtfjqs7mKekNbDkLcSSkzfqp1VPIaU0dMFERcIT8e86w2VqBpN9my3z
 t1ffm4guUoTFP8n8PEYpllrpc30Ipx9L1clWKIM6S0hU+0EOX5pOiu7DWkAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776057711; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EHaRL1cA2CAkjbAtGV77AVcqcxelsXsK45coAJBB3AI=;
 b=fvV110PXaMgwASGFBlTHS1AilAgGqjjLctFuEzY08JST6uqqSCzx21V2EmRhWFqU8kyT5
 KOWc/FWzLP5IAalZWOZ8pES9cs5kNlBCHsIpP2xbE+5xDTfV5P8mRCtTaD6UffLtag+8Y8k
 Ej5zac98ZdMwOQmgp4hxg0vPdF4aObO764RGoHqXg1wBYK4PdGmoemYhIuKKUARhfeoTGIA
 ceR3HOfUP5/1ROB6cut5AaULP7ChQ80oF9l0q+nmQNNpIM05gZbu2KrrhBe4YHxjeH/GQXv
 zHh1E9g9nhlFlzQSpm2sbwj5He568ZKzwCjqNbH/zVN16W3g3RxaplGUn+mg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1990E4063D
	for <nouveau@lists.freedesktop.org>; Mon, 13 Apr 2026 05:21:48 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A87C10E30E
	for <nouveau@lists.freedesktop.org>; Mon, 13 Apr 2026 05:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SetEX8gGRZ3CCK5VsfDO5NTac4szFC9lMaRwVV8jGj0ZgJ042BcHR20sKM6nFF8kT7iHfnAFJdV4yBp4rwVvqmIfRMm+SArvOruw9Ynm1Hdk5S/f1WUbkdQd7x64gU4Tju6jNVzYQihqo5AyeMRb18nP6ZUiQpGg1/076IAUHBa4/M3GAU4Ghzng/KhYkK0/B4ndJaJ8a9dhOT4zJLalVqBgqWw6CMLnJ0l+00dY2JUVaxXc/mhQLT7PKjYU3mjH9i9BcDRTFuWAYznUt1FvTTwYYz4cZAk5Kz45dooMD1ZRBLThZDlIHGcz5ZG4BY5CmThxxeCQEk3bn9VjFYtgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHaRL1cA2CAkjbAtGV77AVcqcxelsXsK45coAJBB3AI=;
 b=L4bHvj6V+sCNz8eTFFv0SCDosuN3hEb6MTxbQY7On2Rfqu71SCz6Tu0+zcW6n49hBgcakP2KCb26yA91ww6+WMBE4iX3inB9NU+dUmHZfCUMPkRtDhKlBQLpalx2b5urzQ0nukHl/yrQhiCU8y0Y53Q1ngQr5ng7mgQzsGq5jctiuozLpTH9gQ8nfleP3Hfrg+d3n6dOSr0D+UUyVK1vLcKafk5bIeamceNMGkJ0x4DuaL1hm6AHbDBhM2pYZFISylb5E3xsIzLArK56IERnLTS5NH1bfM56mjKqkJ/Sb3LVZjAAr0x3IF23Obdq/iss8juIa0bLhhrYjpJTZjAmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHaRL1cA2CAkjbAtGV77AVcqcxelsXsK45coAJBB3AI=;
 b=kJPebNnmYTpD2zlGS4V2gJnwc+td/bKy01umy2l3jCBLYyJJfg2KzYT88805U6qgpKwvbHOKJtS/ndM5bq4/FC+Gqlt9RAGg+qqihXgbbFsD6E4M0+Uy7Hkq5YP6h+iNR3a0tIOQzQ6jelz4VP8uQenYaPlnHAu2jO9QXmiwAn9sK0HOA1peZ5WqAYT7A6QEBWyofaiLgRk5v45n7jiEOM7bnaTt8i0Zu8bCxdMkNGUw83xOsOu7kiT9+dL7wVftzRqChzGKnhBk1qkdi9tyIVlcDMb6fni65QG/rwHdbs02EEK6RvQR5MAOwXkB6Np7JzIv897yQNgYPo60OX1VwA==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF5EA4322E1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 13 Apr
 2026 05:33:26 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 05:33:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 14:33:23 +0900
Message-Id: <DHRS5QL3JLEH.T9Z5PSZ4K8BJ@nvidia.com>
Subject: Re: [PATCH 1/3] rust: sync: add helpers for mb, dma_mb and friends
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402152443.1059634-2-gary@kernel.org>
 <20260402152443.1059634-3-gary@kernel.org>
In-Reply-To: <20260402152443.1059634-3-gary@kernel.org>
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4897cee8-f382-4eaf-1471-08de991e2fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PKt9b6ofqglvdKm6JHhc6ttj93LR9jdJcknJhssMpdofFkVeGqTX/wiVnqH+gYrwPu2nC9JvKyVijM3EMAGnLHd6hwwsjoql7kevT+/PXFgzeqzc18oD3pW7/AUc+/JuRKhvnAoUkpS4DMcLIX8x5TKaM6LfP0B7mGH6Vgt184QCPLtpwJCVvS8qLCNj0Zl1Yk3B5iwNsOlPkNQwsDxhEMSeMNEr3wMOZKvDlBSFuUBTsJSo0jOTuGbP2zUWjl+LYv7R59PkLf47Qcgr3T6Vc5Md2S+udBiH1PIFiRXMJ7X7gSpx5f7YBi/Ngf2JIM04swX9H6l2PifpJLZylZj2cta9zwaxzZTn7d52Lhz3m94Ar+3wCdA/tvNtJgPFYBgD/VNYH82k8XEacd03av3JVc/9U32bRk/ItTxs8j0R1jKXfTfFZlArPgWyCdLSg3DXgUk6kZc/37/AwhL/Xx54FRSaHIXlyXqxdWADGbeqv+NeQxYuYGMjytiNvqON2lgdhjWTUSTcOwPHBnzCozryCO4DjAHc7jjjHnxBIquyAlXeUp5hs7gB1twDW1yOBF1LEfj1qwGnt1q7DknjJTUiMwW4A5Buwlkj9kavYA3cBU01NwAm5VV4k5i2gev/D49VJ/Gqm9c8vchOiWxelKgueLf6e1yZKY2yjHn60RSUn6G96dgJ9+20PunG4Mk1KHh5L5xhx5zNpQs+wWrwy0U1q78nssK01sOKHLCLIntTM2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHZwckM4Wm5NcVloNVh1VHc1RWZWaFFlL0pXOVZEVCtqWXRvTHRaVWJETzc5?=
 =?utf-8?B?dTZUSG1zTGRqMlpYWDZUcVdDUVNsSE5pTTMveVYzTXpUMDlPRllNclZvSzBX?=
 =?utf-8?B?cTJ3K2VDNXEvbm9GS21ndlFCOEt5d2pKSGtwUnVDYjVaRWFJeVRwaStZdXNj?=
 =?utf-8?B?UVNoeXlGY0VEWTgrNDl0ZjdtR2d1bFRENm9kNitqR0ZhdmxNWkk0YStrVVl6?=
 =?utf-8?B?eFJsS1ZWZzZ1V2lZZXNnSGVOdExheXhmRjJReFN2YTdqODdjK0x2Q3NOWGdO?=
 =?utf-8?B?bmlhSExZZXkrUmRNMVBMQ3V1YllzOTZYSlRjSDdOdDlMTzlvOXd0YlQ5L1pU?=
 =?utf-8?B?TEFuTk01MzRadllOYUF3WlhFL01tUEZvclpaZ3hHVEMrR0l3SldjMHNON2xC?=
 =?utf-8?B?VlRTdWNhb3VmMXRlbTR3YmZJaHliTzRpMXY1anJGdjdKcXh6c1BXOG5LZUh0?=
 =?utf-8?B?TFYyOVlvN3ZUVi95S0hVNlBBQ0htdzVLVnZlUVJYUzc3SktFZnV3UkxjSWRu?=
 =?utf-8?B?SnlDTzdONGo0dS9wNnRwSWFEYVA5ZjZuYXY1Yld3ejNtb2RFeUNORElqdTJZ?=
 =?utf-8?B?RW0zR1c4bGFGQk1PazB3Tk1TTWx2LzRhRDdKbUlkRWJnVEhlY09rSVdGVUZK?=
 =?utf-8?B?RUs3RC8venRSL1VWOHZNWlgwV1orTENpY0FDZE5nYW5UdmxxUVRiSjdiWDg4?=
 =?utf-8?B?ckM3eEdsQURNZXQrZzRCUER6M2diUEdsZkFOYnpUb1B3N0JmS3FPL1BuMWFr?=
 =?utf-8?B?aVlmbWM0WWE4RDZydy9yWFY3TzVLVzdBN3QrZFNnQjRTUXVpSlpERnllUys4?=
 =?utf-8?B?MWhiSjRQTmM5M2hsTGEzWTgzS3czTVNPV1RlT3kzMzU3cC9CZ3RTNGdOckF4?=
 =?utf-8?B?Q1ZIUFdlbEwzbnlFc1BzclRjaEQ1QkxJc2NiVHQ4cmxWMENqYmhsZ3JDSHJ6?=
 =?utf-8?B?cWNHM0JNSHRnUExVbE5hTFBIQWt6SGxFaXRxTWpzTmdKbWJmYndsZ1llVW5m?=
 =?utf-8?B?WFlxdUtPYlJxSVgrWnBpRG92QTBPQWVyTFFRZW1GOUdZRlg4U0JnUTBpYkty?=
 =?utf-8?B?VUthYVlqZUF3OUJheEt0OVZIVGFZcDZjbnJJY3VBelhzN1RIQnk2QWRicFN1?=
 =?utf-8?B?M3g0Vmw3aFNYWUEwemFVelhIdkNFbzZxbStvalQxa251RXQ0VWlnUENWNkJn?=
 =?utf-8?B?TVNRMHdqNW8rdnFsdUZUZzhUN3ZGZ3ArYkp4L1VMZXVkTE41cHUyU0ZhREVF?=
 =?utf-8?B?ekpiVGd5RS9qdHhRWlYxV2pmSG1kTWZ5dXlPZXFaREdINUhqMG1ySVc0QXRs?=
 =?utf-8?B?akhZN3NuZHg5TVhyTUxWOTM4d1JyY09CVjZwcmZuc2NZLyt6NmZBTW1oNEpY?=
 =?utf-8?B?Nzd3TEZCc2MvOUFkUUtZUGdUUU0zei9OUkVtdTgyMllnQ0NWbXNtbFdDYTl4?=
 =?utf-8?B?Tmd4cEVNc2Rsek5TQUxxUy9GR2FzMEg4OXBYV3ZxWlhJR0ttTkNTejNjZ09z?=
 =?utf-8?B?OUYvZllaYmo3cTZlKy9DbHRaL1NFUFJyRUl2YUpwK2J3OUs0V0VpWUZ5L2pr?=
 =?utf-8?B?QmNhTjBLZXRDL0JxTSt0MmxIYTQ1Ri9XWWNFZjMwa2JZaHo2MWFKTGhiMklj?=
 =?utf-8?B?S2p1NkVMRnhNNDZSL0hBeWZEZTBETzNnOE9mWjJCVXNTN1oxbzMxT0p2S3Ra?=
 =?utf-8?B?S1ZMU0hoU1p3elNWdzRrdjdtbXBVdHBSVUNUeVpVSnBLdm1hU1BDQXIzcjJN?=
 =?utf-8?B?bVZXUEZxZWw2WHA5Um1WUzBXSk44eVNpcUc1ZDk2ZDlrYUlaazRaZ1M2bmVV?=
 =?utf-8?B?ZU9PQm1jS2g0Q2YxS2N5OWlQR04yYldNMWViRm9XY2FMTXlyd3g5TlY5TFNq?=
 =?utf-8?B?SE9TS3BxY2tOekQzVWFLVkhTTElNb1JpVzQ4Z1dtTUVVamkwOFJ1S2RwMHIy?=
 =?utf-8?B?M29ZbnhHei9LZnY1c1UxSTBhbkZEdFBJMVk2SFB1dUlrMmJhdkYzSTY5ejk0?=
 =?utf-8?B?UU8vTTVzTzl2dkJpa0ptdU9LK1hVSitBZU5nR0llTDllOENCZ1hmUUJjakpF?=
 =?utf-8?B?WWRHbUJhTFNGdDNUMnBnTXJoOFVuL1lzUHBjaGFyNDZObi8xenhxakJLWlNl?=
 =?utf-8?B?b1BRT1diQzRWdGt0SjBQL0s1b0RVODN0TWpDWVNKVDh3WGZ3VnZjWDdtdHNW?=
 =?utf-8?B?UFc3WHlFNXN6RHdNY2dMczF6TVRuK1BOakovZzVqWUs0bXNpZ3lPVEpuOXB4?=
 =?utf-8?B?SnhrK2JhZ2dyRDd2QjRockpNRjE0c1UyYkQydmE1ZTZyZDhJWnNWb2hnOXpD?=
 =?utf-8?B?bVRqbnE0Rmd5Y0VDRjNMZmhLSitpOXJlRFFmc0ZXQ1lEa2JjVXdyK2ZXNjJG?=
 =?utf-8?Q?8Z2dENqimWMp8s1drCrlN36uVPJxiyPtai5Q/T5Eu2VYc?=
X-MS-Exchange-AntiSpam-MessageData-1: l6+arFR1uQNvqw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4897cee8-f382-4eaf-1471-08de991e2fd0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 05:33:26.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wlhGnsxcBx0Rskvce1aO2oCGTNNXI61lFRAtqKEC+TdZsx6TfmgbiBTig0nl2b7ZpK8LjxPoCacEd/0m1ccinA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1
Message-ID-Hash: 7PVWW2H5IO3NCS7W6LHKPMX5EIYLM43H
X-Message-ID-Hash: 7PVWW2H5IO3NCS7W6LHKPMX5EIYLM43H
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 lkmm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7PVWW2H5IO3NCS7W6LHKPMX5EIYLM43H/>
Archived-At: 
 <https://lore.freedesktop.org/DHRS5QL3JLEH.T9Z5PSZ4K8BJ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Apr 3, 2026 at 12:24 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> They supplement the existing smp_mb, smp_rmb and smp_wmb.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
