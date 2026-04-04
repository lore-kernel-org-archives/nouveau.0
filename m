Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE48E88D73
	for <nouveau@archiver.kernel.org>; Sat,  4 Apr 2026 02:19:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B808E10F4EF;
	Sat,  4 Apr 2026 02:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xa3+VJB5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B9FF945568;
	Sat,  4 Apr 2026 02:08:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775268490;
 b=t4Q9jUKhAq/ivXaUsRsh3plCLDYniE5eVK7x49Wf+qKrW0ccrVvydEcxwXL8Z3KIH6q/C
 gOc9H91BtA8NnBx3FW5Za+kwSM0f2iJsQLICBzAY9dJWHKq3QxUrFHFi+UWKPy44p+4R7rm
 Gu5WS458oTB8L4FTxWAr7d5p6fib9/mtS61CkDnwp3wQTaT8jmj5fBnlT6DEhOZum4vH935
 rHriBLLKUgh6pwAYrA1tzZbOnxGBOklCZQJxSRRlVi61aK74tbZdTyqHt8C1ibwWm6tQQ8G
 cw69yVFsfk+u7nLMM1OY+5stbFTzaeS5qxnru/UfU2gK0vwv1h7AqTw8BwsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775268490; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7x/e5k/CC+O2llxNNfXsjY6zUGMwqAKax388+eGiztQ=;
 b=dsxRf4Os92Ij4IuB5YpXf2RJ8PuwKcCnjIYIMs9ORAh4KBewwtAzXdBnMBIotmBhnmBGF
 EqUbhvhQorS6B7AGerMBBwMNHL2LWdmXO4k40NgS7iMkLIxsYOB2dlFimyA90c5aezMy2fZ
 viDKYaqD6ToMng+1RL5vWGPVWBgQlRdtpHfPFTqqMm/vclQPvHNDqx1+3/wHLZHBKDLHEoV
 f7CsuUMIjZ7Sq4g86v0M5+WnXvfyXNOqG/aP4pMCGGgb1EbfvFuDCRo4VM8UvcyWURfigAv
 25fBxS47Iza2qWejq3wL69m6uj01LZN1pMpzalBxRs4vuRnIz0vbjru6nLMw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A4CF645208
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 02:08:07 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA7310E076
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 02:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkgSD6PV7vYVewKMzVAWiEAXvrwpBwjbbU8NoXDfV+K22nUp4yAyvej/Upu7b1VvlYi0pPoC4HTaGmCocfh4S0KWSb2HVqVfeZI+Kkzom3+vKNBP48QW/Lp4ZIlJpdddnuP+D8qUjoho3esnIKDaH2R4HC9LF++HiywQDy1mzrl4dR8JkFx/59LgMTld7aSH+vlTkmTxsNByATZOYuN8q2tI1V21O5JzY4LCEB7WLJnPRKw+tpjdSW2dWYWgYAQB50d/ipeH63hKWPwEIPxWMLjmMJ7m2zx9kYuWucVQMOCdqRHGG2NJAXwzVxHDF5wYCf3U9q7igH6elBl4JvS+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x/e5k/CC+O2llxNNfXsjY6zUGMwqAKax388+eGiztQ=;
 b=a0F3cWV8rv+p3Zq3zxivsRwc2H++BibCwYnX4MRwwWRcfMAQ5Ts2vaLoQfOtsbvK4OSJC67714uYSCng3CVswlvV2+wJnzSvKRZbYZZ1mkgmwRrp4dOpk/3+Rrhh/GpRAqlQhuMzrFBlt4RUpHES4eNX+qkTYdyJ/k9kCDVQKplHnPo5fnxP7+yn1udpy9vgVqbrNJAcWT6UUuQ0uFmJ9K8vTM9EZbnp5WfVfq5CUoxaZdNnso3gSMPYmZe9KQPkoghVF5G6NoIm6fBPzS/IoRGsVOyDNvHVaYi1czz63EG+HTjZ4rOFGUpI7KKQ1lx6a0XpERW3xhbT4HidwZbpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x/e5k/CC+O2llxNNfXsjY6zUGMwqAKax388+eGiztQ=;
 b=Xa3+VJB5H5D4pQve5L7YRUb51ysSuclA11lfbC2FYbyz9I6osgv7i7FfPBMkXekHCTTIb9iOhuIq+wbxSuKjmQWlP8zQlQQeA7DcIHVudit9h1q62eXVGqgf3Ia5CGETcRdyCwm81BsKJL5t3x4KucsqdLGYd73+P3y67U9HkXRemh1f8sw5SjwQajPGSykzJ6h0UztkpMsLbrdtIUQU/2O60gGg2g90y1CKMcOSOdavsrpWuTm6g+J85Xa6ElxTn/PXaH5NaWOZCOZLHir9ivIATHwYzEdqTt4pdokwyAQoBcggAlbVVuY1vHsHtqEnzEpZtZZEOV75FVkc6k7Y6A==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 02:19:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 02:19:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 11:19:26 +0900
Message-Id: <DHK0ECA2BBVR.K2PTR9039QEF@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: fix missing colon in SEC2 boot debug
 message
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "David Carlier" <devnexen@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>
References: <20260331103744.605683-1-devnexen@gmail.com>
In-Reply-To: <20260331103744.605683-1-devnexen@gmail.com>
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: b477ba53-e594-4106-e957-08de91f09a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ioG1d6Iwj0csu+rHlwYmnVZCv2QJ+TT1qZAiueWedYoUV7PQuWXhpqQm8VaUzfFDstIZpjqTlN++uD+GN+pGSxM2GZiLhGwE8CGZhX0tnyeqYbmMM9PFH84tIkAoawJ64CqycLOA7kK9Nx7wCuGThR2Fst9/UWK1pvK1f09WQow5GFberqLy72xO6BRiJnpW39Nz7T5Cdt7tphRfL4k3S7yes47YGry11GidaZxJgZIgQAkNJeECWTktJ7CAaWULzt5kYEC30pjw9wE2x90Vl3qT/MgzXgLE5+3Zi9ELBJph6K8qTeSHO0830jTFylRKEfmWvAzLzmogNwgDEVEW+SH+Xl5K5jQnecs7Tl03S7Azxa/MMFvJ8KaXoVfopG4qT/AgqSd95cj+13+sy17ShJS9e2dt8pAMfEeY5EXNbEK4APC3532U+mbLA459J/XZcg8DDZIEgJjChQPI72kfYild25MKbVIancSX0ujaUiJl4G/a7QwnE0/SD9199Ca5RrfqwImUQWxiinKRO7FaDgXp9C/mfvy7NV5D3bZ3YCsy6MKh/p+fh9TK+r2UOP5mJhgX1lm9IcfJocPkVTl79wKb5Dm9/OBRzUy6IBaH8HwV9LvEOCxz5bY0CcPEDFIo7eajkh3F6PfNSxFjRJwCdJ3wpjatPBsS43nuic3QXtZ88M/9steAIOTcMrCiMIIxdp92vmMHTK9v71o7vmlpYmp7kzrm6ibyjoDMgN1of/Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2VwbHRBWkI3ZUNRY0NBajdzV2NrV0w4WGtZcGRHZCtobklqa0ZZUmgyaXNF?=
 =?utf-8?B?aVo3akwzaVJhU29kTlVEalBKajIzd0g0L1pvaGpja1lCODVmNjBnd2hadXF1?=
 =?utf-8?B?ODN6Mk4wa3M0K0lHNmFlbXl2d0p0MzJTQXIrVUxHbXA0RlJFOUdBNHFKcGZU?=
 =?utf-8?B?U2QxbEVOTGphdTF3ekpXVzhUODBVZE9lK0Z5aWlXUjYrTk1tU0czSE41dlZo?=
 =?utf-8?B?M1VKWUsxUjZFL28zZjRkaXNHNldObWVURlJoaHR1a0xMaXVlTS9xa2dwaGlW?=
 =?utf-8?B?TmcyTlV0aERObHk0YWdQLzhkSERWTUF5SlNXYmliRVR1anlnOEsvZjQvNlZ6?=
 =?utf-8?B?YTROdTVyNjRpckRHOElydEYzU29kUnpBVWd6MDFmR1hqZ3QweE9TN3U0NlFS?=
 =?utf-8?B?MG5kb3QxMmlOU0ZJVUVGK09zS1JJNDdPaGJPMHNkSmRPN055M1FUK3RZclhx?=
 =?utf-8?B?NkR5ejdKVVFUdjhZeUxxQlNmTXlCMXpYVWM2NTM0Nkh5cUl5Y0lEdnY4bmJW?=
 =?utf-8?B?L2FOZXl6eVVyTEhRYllYb1ZjdXJjMmc4ZEx5enoydXZxcUFudGhmRmk3YlhL?=
 =?utf-8?B?UlkyZ0pJS2hRejBNSVZySm9Qc2ZZQXYwaFJGZU8yU0F4em5OSitWZE9PT1B3?=
 =?utf-8?B?ZDRkOG5BNFphWU0vZzFoOGN5cjlsdDVya0ZxNU00ajU1K1kxVGNKcXZqRWgy?=
 =?utf-8?B?V2pUWFRJeFZYRDBZZ01Md1lRaGZKYkdkNjZoQnB4eEJzemwxN3lBY1ZTWVcv?=
 =?utf-8?B?YzRjRkZxQk1Pdkw3RHlnb0NhM21VR3pFY25LMnBFQWUrTWJkbFBJeGF2STM1?=
 =?utf-8?B?Qmh5QjVpbmtNSWViMHRSV0FvVmFYcXZ6MEVuR3F6SlYyUUVIZW9KM0tlanZC?=
 =?utf-8?B?SHoxOVhzTUhwa3hWYzluWGs4MDl5ZkxNNXp2TCtJMHk3U25qbG1uN1VZcU9H?=
 =?utf-8?B?RS9tU2thNC8yMHdHOGpNcUFpNlNFdDhFa1BqRGptQ3BPSWVxd2JNN2lIajEx?=
 =?utf-8?B?Znhtc1BxdDQ4Y01rVDVLMkxmd2ZqNVZobzFCMmsxK1pEM1JEMjAvN1YzL29H?=
 =?utf-8?B?d3FNUEpBRzZIcE9CcytIY0w1WDRoZnpnb1lzY3AreTJEbGRjVU9WV0M3c3ZB?=
 =?utf-8?B?OUNrUzVVbFFXRnk2T1NHS0g2QTFTQ3RqMktQMUVQaXBVUmR6VW1FaFJocHY5?=
 =?utf-8?B?UnhFOFJxaW50cTBIckdjL1lYWERuUDltd2FOT1ZGOTFaZlBIRzczQ2VIOXkz?=
 =?utf-8?B?U0JZUjJXblJPVmJZQ0VFWFh3Wkw3MG1TMWlaOWNyM0U5dHhqQ25PZ1BSWkFO?=
 =?utf-8?B?cmt2M3FoenZValpXMktKMythbkluaGo1YVlaTkk0a21tRlVsaVNoSUxPbERO?=
 =?utf-8?B?NlRlUmh5blJ3cGJRN2UzWW9QQk1DTnNGNjk2cnBxMzQ1bXlLSE1ZcXZ4Z3pr?=
 =?utf-8?B?OUZycVkxRi9rMERlYWdEN05IdXUzcUhWRDJpL3l1QVBvcURYSjBvQm4wTVYv?=
 =?utf-8?B?UjVKR1hHYkNsaEtUakVPa01NaEZTaDcwTnhXRGFGRjFOQ2xxQVhMM2ZCcU9D?=
 =?utf-8?B?OTNpcTVObzk1K3ZRWS9LRzJ3Yk4zaDJPYURoRUk2UnhtUzZQT1ZGQjFqR0RR?=
 =?utf-8?B?WjNERXdpVWFpQUFQeTdHeWFYUDJKOTk5RFNDVkk4RUxhek9tWFlZeHczMnRs?=
 =?utf-8?B?dUlnVVp1NmMvSXY5YXJjWXRwYVJMU2ZVRE5PaFA4eUZrd2g0dzhFbXpRRzMx?=
 =?utf-8?B?WjNhS2d6L29xWVFMbEcrZCsrL21ocVR4NFcxOXBUOGFwZjNRSk1TOVM2WXVS?=
 =?utf-8?B?dEJHUmI1MGpNMHpQY0VrSmx6aE1xRWNsUnhDcXRlYTdCcGxJakkvUDdwSzJF?=
 =?utf-8?B?RmVXT2RuRm1kamVmdWowOFJxenkvWGhadjRnT000RCtlSTBEUlM4Z2kyOVdK?=
 =?utf-8?B?VTRxazhOMnNsWEMyb1ZlS01PN25xUlM3WVJabzYrUVNFb1BlK3lJSjBCR0RC?=
 =?utf-8?B?VUdqdGRlK01oeVErUENQai96WncxUTl6Z29LcUVMTXVpMHJXVDRZbTJxYUMv?=
 =?utf-8?B?YnM2TTc0d25vYlZEdjFWRERGeDZlQ0hINWo4aGV0TlhPNFl5ZSsrYmJKUEY0?=
 =?utf-8?B?U3lwSlBMUU94b29pVWxsVUhiYmhVeDZLYWFMVlk2d0dzM2Rtd1grcEhBVXZB?=
 =?utf-8?B?RDcrYjZLVWFvVVliOGs5SXA2cmVYcnJFbEZZRHFFOENPa0xhb3VNU1Q4b2cy?=
 =?utf-8?B?LzFtL24xNW5TVEZkT08vSkk3eWJiNjNVV3dHUnhpSjBVTmlrOGdhRWdPc2d5?=
 =?utf-8?B?NHJTa3pZcHFWZG1mcllVdjh5WlNsZS9hM1pxVkZGL0pCMUdWaVdxK0tsSDMy?=
 =?utf-8?Q?Lx491okgf5F55NzNwzRHFx5cMjAlO77B4D7xUDpIziahe?=
X-MS-Exchange-AntiSpam-MessageData-1: JkOdd3IYOCL78g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b477ba53-e594-4106-e957-08de91f09a3c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:19:30.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1+bKrTmTPcOXtotIah671ObTqrqlQEkngpa6GkFckcOTYIh21BfHPzMCPtN1CILtx2Ni++msWkAudcEsjNG15A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29
Message-ID-Hash: NSJ2S3BRFM2T7LI2XC4LC4SOVK6PGQK4
X-Message-ID-Hash: NSJ2S3BRFM2T7LI2XC4LC4SOVK6PGQK4
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NSJ2S3BRFM2T7LI2XC4LC4SOVK6PGQK4/>
Archived-At: 
 <https://lore.freedesktop.org/DHK0ECA2BBVR.K2PTR9039QEF@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 31, 2026 at 7:37 PM JST, David Carlier wrote:
> The SEC2 mailbox debug output formats MBOX1 without a colon separator,
> producing "MBOX10xdead" instead of "MBOX1: 0xdead". The GSP debug
> message a few lines above uses the correct format.
>
> Fixes: 5949d419c193 ("gpu: nova-core: gsp: Boot GSP")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 6f707b3d1a54..18f356c9178e 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -195,7 +195,7 @@ pub(crate) fn boot(
>              Some(wpr_handle as u32),
>              Some((wpr_handle >> 32) as u32),
>          )?;
> -        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1=
);
> =20
>          if mbox0 !=3D 0 {
>              dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox=
0);
> --=20
> 2.53.0

Thanks for the patch! The issue is also technically fixed by [1] but I
prefer having one fix per patch, so thinking about taking it anyway.

Danilo, do you mind if I fast-track this one into drm-rust-next since it
introduces no possibility of breakage and is technically a fix? This
would allow the Blackwell series to rebase nicely.

[1] https://lore.kernel.org/all/20260326013902.588242-29-jhubbard@nvidia.co=
m/
