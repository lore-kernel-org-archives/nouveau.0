Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA3EDEBFF
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 01:43:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBEE710E91C;
	Wed,  4 Mar 2026 01:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uDpiSnfG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E01EA44DE3;
	Wed,  4 Mar 2026 01:32:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772587972;
 b=O1OG+kLfZoLQ2wwlnR5JLyWNFgaE0Zr625abnHIcR9bR4CPg7+kog31QIa8A/KXUnan3v
 0ShNAIIBmN9mY5uj4Yokarpa6XghARMC2gpiiH8U6CjKKrV49B2tCX3sGoCkpFLDSoNVVf7
 yEbwavl175RzZxGBfSXQ4BkB20WDblyksU0So6RzkAMhskazNUFWJUQoqt2r/MZiWVuAS//
 s9GynFWadm5OZelpomVW3YJRKUXGOJ7xlsZ0f8skh/aJuRPDa+ONqq9IuhgPrqxCRLDttq5
 LXi9bxLZZhG9EPmKmH6fmystk287eurg3wh9FHryH3MohygERhZYijx8e2/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772587972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yqpF4E7bTm0V3HyFBJF+X2pviUhEbtYcpQZ3jlujHFE=;
 b=LRiiyqloA5XbvQxAnaPNBJNqCBIGSxUA1EtQigWNVA11ceT0tqC3QCFAK6UTE2t+qeaiw
 FFL4HEMYo5aMbfX7Cmz0FrwLUQ6Os5t3P1iHJ3yn5wlnbnAVCqcQFvfRwCqt3TdivayJIH8
 7XKeOHul9UkfPCt0Qs9pyQWGlm4/5l8wkHC7NTJ7Ajah6RkaJtjV00i6xM3BsdtX86jIxuR
 sZW2KfDxSx/2nSw4Udcc9zy+VhS+QlSU1+Oeispn/bB+gMr+UHMH6Lo5C5byHz0EdJSNcho
 ZfFuysgGtaTpD+tXZrwDZ7p5JutIYvbq5qYccfiWnvHfiCsUESvPoJOjZ2Tw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9FC3441B49
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 01:32:50 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6312710E912;
	Wed,  4 Mar 2026 01:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw8f3n2ngbvcz/IJG1lFjSQUzdKr5TSqoXnxcqpc/tUFZNCv+lULtz6R1bLPI7BE3JMpVADDG+vjzkjqEoikIaFzlD6NLS29UheH9si6eaWP2hwdyShjvzHL1Jq4yn0WuK0S44xOFtRC5Adq1Tm46IBT2l8MHowyR1vFlZWYnZ+wOyL/+HXygSHm7uYmkTi7jHkdV3z7+lHtImMbHyPmJyyVyp3ovN/olg5zRTyQ7Ybtr6LeHrTu78swC9nhTRue+yDKeaM+pP0j0DbTuVsK+zoztqKObVG4Amyhc9BI8WWddrrQeiK2igxsE7HFQXDwes/i+V46qi/lu+o2jhP/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqpF4E7bTm0V3HyFBJF+X2pviUhEbtYcpQZ3jlujHFE=;
 b=JG8bAQCPHGIBTpK/wfP8DClzQQW8MwghHUMBvbpgpG2j97s7E4sBHqDxC0WAbfliaB9E5vMzfEzPcNVSOEoEGD8PKHCuf29HzZK38X1UAvGVAWD3M8aOyaEW/Ft/bdB7h6M9R4bjVE8Bry9tjs73CI6qzgXu1EZGZgVVF/QV7ThFN30+at7SxXznyTOFTa0v/VKpOFOOSQ0hYp17hp2N6Xd81+hiBqgecXfqlt1skomxDSetjzlqIY+/ACPS/W8VEENM5fu9W9+WHm77f9Ira3VFlMs1mQrS2iamgoCz6BMaif8Wwks1q3tL0cABJQDsb2MmxjJsqEzSb+VkDzN3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqpF4E7bTm0V3HyFBJF+X2pviUhEbtYcpQZ3jlujHFE=;
 b=uDpiSnfGfURXoQFWVHaizxeBlq2eT0wjRkOdIKwSwl92WeesrWKEv89Os1TWn5oTp8CjJ3ZPzWY0el9xA/n25USZ5kKyWfAkrQx4gAoFc24W+AViXj+PbApKA/KbShY+1+XNm3aQ5ChQsCy873BopaTfzCGxtvREX4JmcUdY5drXdTQSVYJWLxe10vksR9Kv2FmBhSHxLFC7AZjoXwj79aO3urhhcpONZv5DpRM5Kz9NvmXpbZvz7jnk897NBgkSd0VCygxd1J9iIga9qZTEZcqOkMC2DWZkccYBTXjoAoei7XvaW0tkoRXENDh3aSXsqCwcI0HEh6fYjCW52AqRJQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:05 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:05 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v5 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Wed, 04 Mar 2026 10:42:16 +0900
Message-Id: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QTW7DIBAF4KtYrEsFA8NPVr1H1QWGoWFhO7Edq
 1Xku5fai6aKlw/BN2+4s4nGQhM7NXc20lKmMvQ14EvD4jn0n8RLqpmBACNAKB67dOVx6OfS38J
 cb/PW+6wSemOiYvXdZaRcvjbz/WPPI11vlZ73Q9aGiarRdWU+NTponwkUKbStdk4jKZnJR3DBC
 YgCNTrpHfu1zmWah/F7q7vIDdubSThotkguuFXC+kQJkcxbv5RUwmudvXELPBL+iIBKALnWGom
 oTH4i1AMB5ohQlUALoX6UNNY8t9B/hBKHi+hKRCFllhhCQvePWNf1B438bmXIAQAA
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 766e42f8-7543-4a23-9edf-08de798f610d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info: 
	MquJl1cub6hCSY0/ZlPd1/YupHBRS1+XiaYHipBMZKnW6xCJKS8w4HDTJI3MxV+LbhyCb7yZPL/p+9+MCC8rZM2Uc5R1ANymCFBmoS6PN9lOhZVBrNBTJaY7WfIsv5WoFFKli/zhCnGDyI/00APIt8Q980XsAsDULIsAD3Lxwprc6tkNVyFGQzagltykIdRmeVYUgC0FEAcnwhJNsVD1DeGnylJUEBP1Ytv2e8sDOfeGenMirIN7ceZmNkosTatCyyBaCvxA0w9B5Z2DWCerJRNliObm28zO+8AKNQvCAtMgHhNGdX/1URK43fsLKjVSpJQEU5V3v8XW/jFK66HtYHC2SdW2aep92nJrpY79TSurSj05eqRU9Dr7jKv7YSaexAq0kmQ1+tP8woZYAq/hNzH59yRVTLZfREPJjcJP7IF6ZKgjdFFw2yIqcT2yJwPb6w2pRMiv+0u/sPcCnY7++tNp7bU8iUmOguKjG7t+mp+gg/szpRJ/b1D+2axzXIfFGWUDUqSHX1Va4aSaNRPu4xe88vD8r9qYX536F17kVgSvewX8M29RVwysMeqcR9FZHYE8Au6faMuuzbMCCZz7dT9L/9XKmxXqwS/7BcPVNeCrXqNbNFjPbeuTX6NvbhM1JX6sVUqHxr/oxBc0G+O5897U31m7DCcHRTtfsOcImB0CCLg2JWUjfkxFIRXOO0pw8bCdLiJEw61VBdWd+tMrV/08JtQPmBsGKF2Vvo6BZLpo4O7QjyV1K11140T5D+3Jw1u3hznMx7jcyNzBKO5RLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGp5TndSeHV2aHN2TVJNdXFZY3J6QitBNEMyUjRWaDgrekQxNXFNa2k2R0JF?=
 =?utf-8?B?cGFKV3d3K1NRekpqaHVXREdUSDZRQmxMKzZJckFLdEdkU2xUNkZvbzFTeWpx?=
 =?utf-8?B?OERkM1JiNXg5ZmtWelN5dVQ0Ujg3M3dmYUZZQ1RNUTlsQ0hpM3pEeEx1Z3FJ?=
 =?utf-8?B?endHdjNhS2h3bUtGRUhrYVBuUDFKeEpTbGlENkp4eVoxa2lJVVZrRTNSMExi?=
 =?utf-8?B?Wk1vektZR2dXV0NMeUxVNTdCR2JoaTdrMGdMVXovblNvMW55eHJBVnVKRndY?=
 =?utf-8?B?QnFVbnpyMjRlVmVWVVlscVFkZFZYdHI3NzdLTGFnWE1qSEE0S2VpNzhjYlJo?=
 =?utf-8?B?RXIzYW5CNFlXaXZ2UWtmMFE0Njh1b0l3dCtBNnY3SzBwcVNnSWI4V08zdTZE?=
 =?utf-8?B?bkliMlg4OC9XdWlFRnIvWXJaTTBncHlBL1duaHRWUjZvVmd2TlJPcHZ0QVY4?=
 =?utf-8?B?eFlvSkZqa3lvY3M2cjFEY3NITGYxNE5WeUdBcjQwUVR0N2JpMEdtM0hxcVFw?=
 =?utf-8?B?Mk1GVDU5aGpMcThlU2xhOERES2wzMDdsMW5NaE1zUTVxcnJRUEszQ0FMaGhZ?=
 =?utf-8?B?b3g5b1N4ZUE1alQvcnd0UlNRQWlwcnFJdkdXd2E2QjRpN3BNUXE4UXdGYkNH?=
 =?utf-8?B?K2x6ODkwaFR5a2cvVmx4M2NyZDVJaWoxNCtabUh4ZHZ1ZGh6UkRPWUxsK2Rj?=
 =?utf-8?B?YlNqTXAwU0RGMjhuZjc2WVBESUdnenlteU4wRmNKVnVVaWJ2bUp5QjUyRU9U?=
 =?utf-8?B?RmZDZVhPMDNXZ01xc0hCNUdyaU1adC9wZ0tjVXo4S2ptUUpaMDkxbFQyNFhq?=
 =?utf-8?B?TkpwWU5HeXNYNCs3SGtZa0xNQjBLTldXLzRNTVVoUDVLZlp3N2x6R0llUlg2?=
 =?utf-8?B?cFFrY21kUkl5c0d5TytubHN6ZERQc3RxZ0FCQUh3VnFIV1p2TWljSVNkQWNO?=
 =?utf-8?B?RE1vbDdTSFFadnRsMnMyLytPNlpPTkxCRkxqNWVYK3Z4U2dzNFgyK1ZQR2pP?=
 =?utf-8?B?cDFZZHE5SmdUN25DUkRQbE9lcmthQnhPcFNEd3JPZ2U1TFZZc1dPNTEwejd4?=
 =?utf-8?B?c3ZzN01TRzA5MFJBVUNoQTlRWmVCMWZoSU50Yi9mZFAwMEo0VEFyb0dVcFNP?=
 =?utf-8?B?S0JNK0ZIaU52SEdMaTRvTVBuRDVvQ1FOSUE2NXdTM2dVY3U4a2pzNmlJcnFX?=
 =?utf-8?B?T01iRVRMcHJXWmtRWDVvL2FHMkRWRGV5enhyMnRROFJaQ0ZRNFdwd2ZrSlhm?=
 =?utf-8?B?TkNuMXV6cEZEWjk2bmJ3MlVHRDlidGxLS0ZqMFFyL25LRm1ORXVSYVhXOGFw?=
 =?utf-8?B?T3JtNjZ0UE0vbGduWlVNRkl4RU1YRWtoamRGKzFUdklPeUliUUxxZkJoemRX?=
 =?utf-8?B?V3krSnpySnE0YU1kMld3VnkwU09KejRUUnBocDhiNXF0NWpXT3cyUHhXUHB4?=
 =?utf-8?B?QVpZbmJUWHh3ZUNHcU5nRmM2K2w3V25remhma1RCdDNVeHB3RlBKNTV5SHJ6?=
 =?utf-8?B?d21uZ1RlQzVDdmZ3RFJCS3VkOHBYczFJTkc0ZENUNDJCeTdJd2kzaUpOUHhF?=
 =?utf-8?B?YUNZMHphbHc1WVh4VmFCQlQ4MmkrZkhyUUJOek54SmJsRTJ5d01QaE9uQkRP?=
 =?utf-8?B?c2V5WHRMWFBwLy9IelEvcDFKVVVHSjVxSyt2b05NQmRQZE50ekxmek50RHpJ?=
 =?utf-8?B?bTVvTTRPSlhoWWQxTGdjOHFsVENVd2xJNHdqdEFwekxMbk9Vcno0emNHbktQ?=
 =?utf-8?B?Sng2Y25pMFVhWmtvcVdOWHZCa1hFZXJVTVQ4MGlsbnVvemdONVk2bGRoYVNm?=
 =?utf-8?B?SWpPSFVUdW9WK0RDNGlwSkdmY1h0U3FTYU9OckNlSHFFbnNYY0JIbUQrbWJR?=
 =?utf-8?B?Y3l3M3YxU2EzRDV5UG4zNDBDMmFFTmxndlBmZFRXTE02MHBkOUtWakxHZ01V?=
 =?utf-8?B?TkpwTzBDOCtWODlSWUI5SGlRMWY3MG5nN2laeC9VQmhEVW9JV0NUc1Y3Z01H?=
 =?utf-8?B?TVRBRkxhV1BDajB0a1FYbUh0Q0VtRVBDUUFMMDJMZHRHZG9ER2pWQUsvd2Mr?=
 =?utf-8?B?SjBaLzV0UGVZcEtXUkpiVVVjU01QY1lhRHBDOHF3UzI4U2duQ1hHMDNOVHlO?=
 =?utf-8?B?bVVlek9mU0E2VXJXaGNRQ1dsaVkrbFdCSWZVbWpNU1QwNEtzZTBRZE9nZVpL?=
 =?utf-8?B?MzltT1I1amdoOW9UNURzVjBCNk5SV1pXVjN5SVlrVm1aSmtER2lXSEpWZEk1?=
 =?utf-8?B?MmtzZmxKZUVhcWlCQVJUeDNFS2FzaERsTGZTbEYrWVF5UDVrSiswdUVPZ2Nt?=
 =?utf-8?B?RXppVzl5QS9iNW5sOW1UNTQrMWJjTkpOSTI1Yy83S1p0ZVVTeW04K3RhUEtJ?=
 =?utf-8?Q?nGx6oPX1bcpTbBOs5LeROcPRp7s1UW0dquBJvX+ObN/CS?=
X-MS-Exchange-AntiSpam-MessageData-1: eBvQ9r/c5PpEwg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 766e42f8-7543-4a23-9edf-08de798f610d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:05.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vzsZ/roN23DiXBktv37xEQEBZk6GVKBjmhj+299R6IvQYDpzHYBOaM4/PPU2lJB9Ednk/N4CPZgZAEJWcLZWyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
Message-ID-Hash: 46KJBYRRQCFYFVDJRYPUMFVLKY3RCTEM
X-Message-ID-Hash: 46KJBYRRQCFYFVDJRYPUMFVLKY3RCTEM
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Zhi Wang <zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/46KJBYRRQCFYFVDJRYPUMFVLKY3RCTEM/>
Archived-At: 
 <https://lore.freedesktop.org/20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds types
`SplitState` and `SplitCommand` which support splitting a large RPC
into smaller ones while transparently letting regular sized RPCs be sent
without extra copies.

The send pathway uses `SplitState` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v5:
- Moved continuation module under cmdq.
- Made timeout into a constant.
- Renamed command_size to size_in_bytes and made it a default method
  on CommandToGsp
- Link to v4: https://lore.kernel.org/r/20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com

Changes in v4:
- Removed Tested-by Zhi on the ContinuationRecord patch, since it
  changed substantively.
- Incorporated Alex's design for SplitState
- Moved the continuation record types into their own module.
- Tightened visibility on continuation record types.
- Used non-zero sized command in tests.
- Link to v3: https://lore.kernel.org/r/20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com

Changes in v3:
- Rebased onto drm-rust-next
- Added some doc comments
- Reworded command_size doc comment
- Link to v2: https://lore.kernel.org/r/20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com

Changes in v2:
- Added doccoments
- Renamed driver_bytes_available_to_write to driver_write_area_size
- allocate_command_with_timeout merged allocate_command with timeout parameter
- Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
- Changed oversized command error from EIO to EMSGSIZE
- Added EMSGSIZE to kernel/error.rs
- Split WrappingCommand functionality into SplitState + SplitCommand enum
- Made max_size a const (MAX_CMD_SIZE)
- Removed send_continuation_record + added comment for type inference
- send_single_command now consumes the command
- Extracted command_size + used in SplitState 
- Link to v1: https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com

---
Eliot Courtney (9):
      gpu: nova-core: gsp: sort `MsgFunction` variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      rust: add EMSGSIZE error code
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: add `size_in_bytes` helper to `CommandToGsp`
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for continuation records

 drivers/gpu/nova-core/gsp/cmdq.rs                 | 119 +++++++--
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs    | 301 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |  75 +++---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 5 files changed, 439 insertions(+), 58 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

