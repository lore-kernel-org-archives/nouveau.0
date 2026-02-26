Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A9FC5939
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 11:47:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3710E900;
	Thu, 26 Feb 2026 11:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rGz21nvy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4BB4F44C72;
	Thu, 26 Feb 2026 11:36:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772105817;
 b=Wc6hmcRXflKbSYzcfBSK2jWcgVudS9cKyE3AgCq1YwFUkaFfqqD5MIRA1mf7I8ax6HNwE
 HaH4Wb182LrQbPG70/5eHBV90jOuNhqzWswwqHtdX2xYIWDl+Ki8lTXnCDN3ea86WlEfHk9
 eXnlvypLNVAn+/2EFTgKaWnvJocrs5xIVFubqCTVI75C4Xxr4ji/avDFS4j3IF4kvJwGVFN
 rBMbvX0rdI2OiGYh/QCApSmzGMNSiDHowi7m6gg+Fq7Da4tHil3zgpBA12KP8zQq45ftOrP
 n81duxatVm0IwY1IcPuuDpyjczbQmQKihhM8NPIOqU3AKpV1AMUwwZY1Piww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772105817; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=gdTU6+vdM+uxN3i937J+nYrDkaAG+6oWZKeTjbyoNU5/nQhr9bWg3C06QUdfyoJINVCKq
 uAXX4IOEDQTwpZwQpBuIaZA2xuo/dQOHTiYcXt1qWu8KMDK/9HdkcUHzYXczNQjM1qn6IsH
 ZAIbOu0LU8Rb0u0yqe11ktXMss8f8fJJI0U16MceVVPpIEhdKFAvILXrnn6zS8PWK5BYIPn
 /8FOgmwI/87qzSW0551k/AUtPRCzXFmAnlzSJ7e4+R8M0wXJJ+hyE+RUgNMJod2I31UEfAn
 B5pMbCQlI4Ja+Ri+kx78+7YAWQ1Np2hKts4MHODo+0SzNBXhA3xHaZMDMakA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D2E5A4429E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 11:36:54 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B52D10E8EE;
	Thu, 26 Feb 2026 11:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVu+ce1MLTVZ3zX3GLQQ/oWtRzW1mGXNRm73vO7xzG2qJpGQS7VvzBoFOp6/YWYOx6ovVWaER3DryAlPELAWs8CEMEHsEZQIZc8bIz2/W4s1R9Ds54frgnquWhOK/KguNq2qkM3VN5wM3nd3duBSNGRKW7nFM0Wpx4TTXXrs4OHFQrM5VhnUrfGQDL0hcjRVU4GdTo0SzxoN3zUYD7sRVAesBeLWcfrSf/BWGr4WnkXmmY9+TdEYKEOravjV1IZZ2RmoH3UkFcTjOs0b0wMmZUBj6BRLAewKlw3Yp2O9RCZn8vJUMjxWafN7QxgJepFYWKRcEpCT7M9fdae4H6EWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=YxWC/oWySZ+RRP0Y+vke8SG71P8igJdmCDEQCVv62Jta/FVhgzI8ieDD2qh2n3ogFDdOzNkEx2xax94CS4I42+8xmn0DKyEUz+H92XG01ikSIHzveJbD3rw58/Ac4y7wCrXabAy5pAMsQ1kuRAdHMN59eRzZKfrDzJDnJWROVB+qb9Aprtceln5ctUoDzjDolOw+Py3C+dmWOQ54ADM01h1YG+8E4YfHIvVe4L4E3doLtf4Sze84zWUS4sBF4AVGuvnSNhPCd4BfpjU2MHvEkHKdN8zxRljVAkgK9vSMZXgOYiYLeswqwHcUgp+CnVedGKZ6Er/hDbKtgYym1r9Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=rGz21nvyId453vnOck0rBSd8YDD/Yxm8F1AbfX2zoa/2yxreAY6kReLH2k/9yKDXoML0sQOfXZmTh7OsvEg3JJXzANUt3X5PrG5P8inihTMsn8vYZRMLdyRtZf0LtMGZKgtpUcVV4G2hXiKAYs6IRHDl2aFPMr8ChEu7kA9c2FgnoQomMlBm7w/QEz6LChJB8hTdSLEwXGefaB2aLjeOw7Xsw51OYLxH8ERDQnfmq3TmzSGsGWhEQxn8xZHWYOeauKG24lTLJBpBaRaAbY5Bv6H38OZdcsgzv5rYSm5rtikyPtPeBwwIkCJrrbSfRLDhT+sbFfaxA/VKpxwjfDwOwA==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:56 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:36 +0900
Subject: [PATCH v3 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-4-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b8eaaa-cf10-4ecf-1f5d-08de752cbe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info: 
	LSsFJL9TkQize6gP1KaZiqhbUG+p3z+T5G8Hb3y3Jytu3QackpjKzr5U41L6XLpRaybyQsIcUs85AOUEt4SS1TwEYXh1ZXJypSf9gTc06uZ9tn1Y99Juj4X9Bp0KkCoWDiUdp4qMS4ilJ0nh1dMeukvK6QszT9gU/HSUn3jd8WaxgeTys+AUS/yWmH8sJnppF8Y0OztEL8+4Dht/ej9ktXk8PyV8CdZMmmRspjRAjbWYW2M8+vZlYUA2RqUZSFDE7N4fXH/BspGxxvgYe+zIEQdeRL9GkZHNGK3C+WXjrA7dfcfEuuowG4XB1pQWegjDiy5TwwRK6BXA9ovTHLvILmLlkhAfTP/CAk4FiTPx4NSTC0Nd9IH8EhUjnu0tJlvH3ojBt8L6sFnnYOCUaui9wotaFAjNphjL320I0ZPWVuthXtzULizawiwJLwYs+62ph4oQPNQ3oDl8cCIWhPQC/UrLByFzVCf2NQ3oTd0UpoJnxC0snFeaVOcHj4EkeMyEU1lThSnlKMQoiy8tbTaylCP2JGwxcMjy1MQeRgeMddqF7Yp5K2uprj4bl1iY/UkaenagyWYusIkg4D6Ed3Gy6tuPwCghGxtlEkEjct/DDzJtFx4KlQlOjVn8l2eG21ixM9iZ4k0oDo8M9BD4l1tCCECa/0AYuXEXhkpitutmEYIfNvNL3Icz7vZsYotXM5T0GSaWtBh4czAKJ1atwgshYY5lxUxSceW9bHqjMwqEfL4bPisCgS4aYwkvFruvLbQbVpBV/3MQ/l8TR5ky1pAotQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aE5LTEpHdHhRQ01sR3pkR1ZBVHZNeG5jbTRTY1E5UWI0M1B5RkRLcE1RbWxY?=
 =?utf-8?B?S2ZpSW1qMXZJZGJRTGpvV0JZMzNnVk1lRlJpVGpEWkE5OXExb1JjeXZjMndI?=
 =?utf-8?B?Tzk1ZDh6Z3lUYjAyV3lESzQ1cUJJalJNWkMxM2FCQ1FyQjRqbjQ0bzhrbFBZ?=
 =?utf-8?B?dEpweThwVlZpak84RlhndDhHbmZlQ1o5MmJ0YTQvd29FMnNUSzFob3ZHSFdW?=
 =?utf-8?B?bGlVQVRuVlJiSG1TNXpkaXBzM3lqZ0JiUXpreVRNcERvM3UwTnFQaTFyU29C?=
 =?utf-8?B?WGtYclp1akRtZDE3NTh6QURUZHpwTVVHY0xVQkhOTFAvcU1aSlV3bnVSMC9J?=
 =?utf-8?B?ZHQ3cmRFcFRKN3pZb0E4c1J5V3hnbWRaZGhyOVFBaTBKaFFOYmpDRTIvdmZr?=
 =?utf-8?B?eVYvbHFNVEFja3g0ZUlFalROMk9HeCt3djJ1a3V3aFFmeTUzTFJwUnk2bHFj?=
 =?utf-8?B?S1VpYVo1bWNNb1BzRTlwNWcrMmdkVGZGc01yOU9qNStnMWpGS2JsT002Q2cy?=
 =?utf-8?B?UjB2UWZaeFhoK083K1pySFNvU0lLcFc5WTl2V0xYYTBmSjA2bkdYU1pDVlA4?=
 =?utf-8?B?QU8xeGJCNnpBNVh1cFdxOVhxZmk3NDVwUDhCQXVKejgxRjJ1M0tWaHhMOU9l?=
 =?utf-8?B?cnNYalZtK2Z0RmlEYUI0R29Rc0Y4d2V4UzRpTEVReU5vM2Y0M3pRcUpOMnJz?=
 =?utf-8?B?U2JaV2J3bW5rV2lQNzZ1MS9qaUMwVXpnem1JeTZINDZzRGV1TE01aHZpa2Zr?=
 =?utf-8?B?Nkp6UEZoMFF6NWczMnpLTXA4RFdueXBrcFdaU1l1a2JFWERBTkNTdEx2dlp5?=
 =?utf-8?B?WjNndkc0dTMwa1AreWpxMmxoVnFwS0EzYWxNUUp6VURzOXJrZWZnTmM4eW9F?=
 =?utf-8?B?a3hPL3FRVElManFvOThCaFdDRGVNWW9FelhXSklaNFQ4YWJxdWg0MDFYTEFm?=
 =?utf-8?B?T2tuOVByMSttbEJMMDFxdGJGWUJPRVpObzZRNnFnU0xMaTN2cmJCczgrcXVa?=
 =?utf-8?B?aFc3ZzY2MUJGclhvYWg0U3djVUY3SUIxK01jcUNZeFhlSWtqT20yTG9GUjRy?=
 =?utf-8?B?T1F2bGQ0MlorZFhXRzVwYWZ3S0NZTzZNeGZwYzZidWNYU0NyWURJTGk3RzBv?=
 =?utf-8?B?bjIybDFhQmFKVDNiSjVoZDRWS2M1UE1ER25ES1Zkck93SUVEdG1ua3A1Mzkv?=
 =?utf-8?B?am90ZVltbmZsTGpOTng1R0NqdG1naWdwYmlsNTRHMVNKSXI1aE00ckQ3d3gr?=
 =?utf-8?B?aXE5UHp1ZWNmMWRweGlKWGRCWnNPYkpYVjVtUHNWczR4YmhpeVY3Z1VGekI1?=
 =?utf-8?B?dStNVjZ6UTBjbTl6Zk1YYWxuTENKWWp4RWEycjl3aG5hUHZMbjU4c1IreUZn?=
 =?utf-8?B?U3lmcmJNU1NrWSt4bnArV0RLaVhQdk1scWJnV2UyMXgzckpCNFdncUdUdVhS?=
 =?utf-8?B?a0NFQS8xck1IVHdLME9pdDJCSWtKWFcyWUtDT2l0eWtudGNKdXVtMnZGcXV1?=
 =?utf-8?B?RVg4WWRiTU0vdEhDS3NZYlZ3MVhMMy80UnRpZ1F3N0IrOE1CNkRDTmtPQkl0?=
 =?utf-8?B?WlN0OHQ1bFNPQjViTkpuaGpQY0ZVVDhydit4MEljRmEveU5ubHlPZGZXZGFZ?=
 =?utf-8?B?TmRHVS9KL0ltWXdTOFVvVXB3Nk5mSEpOcERFdXRqK2lDSUdoSnpLejhuNGtz?=
 =?utf-8?B?WG9EZjQyMDJCUGlVZVFhOVNGb0dIVUFoZnZUbjlsY3ZNdXl6OXZkY1NQWDAv?=
 =?utf-8?B?eGxpVFpuV3puQmRRdDA2d21vNXlIdXNUYmVMVWo2djYrTU44VkNMYXZyVkhp?=
 =?utf-8?B?ZE9VZkFYTldnYndTc0x5N3FZemloaGw3L1AxNldFb25zaEd0aXlPckUySzdG?=
 =?utf-8?B?TUkyek9SQitvR1NERnR1OW0rbkV3dlozc2NXY09HWlptZHVGMlVEZ1cyODZL?=
 =?utf-8?B?TDhiMzNmU2ZydnFOOStQNml2QTFWd1QyckpDYVdqb2lwRk9NYytLSEN1R2ZJ?=
 =?utf-8?B?UjArWHRlQnAxWGl3QlFBYzZEZFluMUFsVkhRQ2ZFMGpjb00yYXJsaEdPTXYz?=
 =?utf-8?B?engxOXE3REdxa25GOUkweDhPeDA5dzBod0NEQkg4d0tMTkEwbWFVNGpRZWVS?=
 =?utf-8?B?dlNYZ3VKa1NpQmJpMWgwSVVHcnhLK0tlMTJHSzFidWI2bEdZcmhFcWM4SURD?=
 =?utf-8?B?TXdhbTN3N2QxS3FKZTR3R1A4RHlqWi82L0VuTzVaWEIwRDBXellMeXBoTHBM?=
 =?utf-8?B?dVRFcDN4VU8yZURTS0FpOHF1TTlSQWxOOHo4aTRkbngyeEdteVV3YUNHb3By?=
 =?utf-8?B?WUszL0pmMEJFc3NCbEZYYmY0R2M2QUw5SzdBdHpOcWFUS2QzSm8rdm9TQVFO?=
 =?utf-8?Q?zXglkBRTIcC3SeLYTxGry9A0ciTBM5n+x1kr8D4ngMSss?=
X-MS-Exchange-AntiSpam-MessageData-1: uj6vhyXcqDh0ew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4b8eaaa-cf10-4ecf-1f5d-08de752cbe70
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:56.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6sWxA1XpODw4X8FHuRiKvGQq76DQ0CitvNJx3HrG8RYkGDg+JJi2luMUw+Lx/d6X10K+lnrWd0Vgm1R0fYCqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
Message-ID-Hash: ZWJPMW7Y4GZYPS4YZBDHTM3YBHXMDGJT
X-Message-ID-Hash: ZWJPMW7Y4GZYPS4YZBDHTM3YBHXMDGJT
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZWJPMW7Y4GZYPS4YZBDHTM3YBHXMDGJT/>
Archived-At: 
 <https://lore.freedesktop.org/20260226-cmdq-continuation-v3-4-572ab9916766@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 4 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index efbbc89f4d8a..3c2652be74bf 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -32,7 +32,8 @@
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
-            MsgqTxHeader, //
+            MsgqTxHeader,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
@@ -300,9 +301,13 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(EMSGSIZE);
+        }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4b998485360b..6005362450cb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -39,6 +39,10 @@
     },
 };
 
+/// Maximum size of a single GSP message queue element in bytes.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
+    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..334e8be5fde8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -43,6 +43,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.53.0

