Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A96EB7EB8
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 11:18:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E308210E9B7;
	Wed,  4 Mar 2026 11:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Z0bilzLZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0346444DAA;
	Wed,  4 Mar 2026 11:07:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772622471;
 b=qoj3OLpTUdLbUoqomrolO+cABbT6pSQlapacDDztErrCw/xJcApACsxCfLE12Ktpms5SN
 BISPv11sfdDrpvj5Gkiu7QOEm5AdvANppvHhTckqUS9hAmAGdpITB/xASQQdlwTOCZj8/jV
 QfbHplNhsKQBGgj0+VJ5/ItSQsVv9f4xm8V2wwtZNoyqvKwtN7nF+/RqYRVU2b0EGeBMJbJ
 fgZ585+/QKxEWyCv0s/MRviqL/JcSF0mwhLhqGGC7A9yqLCVI+BTCCIfaqTR62v6h89gHlo
 DT1ZgxSucnit7jMz2R9TdJnfWWJTx/u82tIrnRcLI/01v7W/WfNB3EfQDcRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772622471; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v0jdjfGWPVuVYyjIGUEfvqLDRRePRTtGTkTICBSVHIA=;
 b=wz4U9QKvXlzz77aZ5y8emgvou94VzG1hWZYobEEotZ2WbkmYgm06qYbMGkHOEpJnawR3Z
 8eD7AWPp4R1pYm1NmH0QRbaScvqz/lf6IUGMf67YbwJ5lCasOYxq1z70BXJHeVMPaOnwlU1
 lnVsO7xDaFD/e+wybafusw02tfiCRaoDNOmUshXn91nxxaRsEhe5a+sbgCUFn4zxQaI6sQj
 q4lvAUvo745OPdzEa/PnG8D0tGuqvJjhvklYZoOXQVAdIuI0y3Fr4nuKQ+9pRMRZ0gYLqkh
 /2k0LBAspVfM/kBAX+ANjn7zgYITp4pgUACvSlIzCOIgqtK+yPBdeT93xhoQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EDF7D44DAA
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 11:07:48 +0000 (UTC)
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020075.outbound.protection.outlook.com [52.101.195.75])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD1A10E9AE
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 11:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMoYl4WxhnAyABNU7kHaVP/I7w9mSCKKwM+KG/q00hPtDYf81MrELHvWMf0AFg6AcjPWmJ1C+5v+GhN46V9wlix52RaLmEtFFjxmVDd5m/GtVbLNR+toT+YpEgE3QWo1cuKOvZsaSKxByq7gJ3zSmVr1asFLVSJi6CsMsS18TKJ1cAqU4uBVw7INCRQY5XJbiWLtTCv964/jRyZkWyDirZgMLtj6NHwKb2PudsGDHdbZOvVMJeYMbw7+1XG5FC6ADCJytmq2ksPRysZpj+bZvDP6sk/ZHBD4GmvHgDPHLbfHqdJQhVnQYXX2GCRL4vodl4KVzPBGU3zPOK9ZyJt4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0jdjfGWPVuVYyjIGUEfvqLDRRePRTtGTkTICBSVHIA=;
 b=fkWy2WdApXTLgxRz4ekcohfzzWPK2JygzW/7CIO3Q5QvAtxJv2u+JpUivtP7+B+0EjM7Pg9ZwV9O8BT4hs8Id0vB+OLCTrRPhMacUm9k0GuqGLiFYypSti0hbpzQ+MnVCSiwsEh1ZrpJ/JxqLh+z6VsPlES/n5PfmAgOAAT6/6lX2fyAkqKBlK4t/Zz37YuthbQGtBJAUEoOsXGvURQstDJ7IJsWjuzuGsqGKnusGGU1Dwdw2O684E6VQJ+yShPUJDDbKiGA3mvOS4SIJrNQoLtuJC3L3v80qnd+Rqjk7fmIb6FMAj89qM/vRyw8nu3eQDowgwXtoURUzVRGxzLokg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0jdjfGWPVuVYyjIGUEfvqLDRRePRTtGTkTICBSVHIA=;
 b=Z0bilzLZHIfyLnSuTkiggdYUz4IeQAWPC5iNiSh/rql14FA88jtYLQ2MM41q6HpVZ3cxmO3LjSKBrKyOWHO36E7VPsb2CI0xQwvUL6z6wr2W/WQWIpFiaLqXpD8v3T6Hk6WPfGQsJxxqqnMuhNVS8M2I6vNySxkpTSmyazBUlHg=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7366.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:18:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:18:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:18:02 +0000
Message-Id: <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
In-Reply-To: <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c02dd1-8c77-4ef9-6fbd-08de79dfb3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	2HOVjH2tAA13UWRyIfHLSCG87DfPmUgDuhpOizGipQCIB7L4nufRh6TNb7Jblmx1OLH6+2C/+Aa8s5s/Q8OvV/9qUV0nQFpSTOxXa9mFkbNp5rYnJuzL+GFdDR/G5H0Y/RHQys6+/lQx1wTBqrrmc7dnZcxyDSCaHQR22b9SKyQntKWFD9akc06sX1KoqCxYh/g+tP0kuOV/BY0hmeBobImiRIWplW2duzgxCNWAmII+MZjEM5H7YdnxGfRamVzu5z2+w3v/5x4jIQm61kqmCpHKRebv3Sg9beayj3JkHx67+UIo1lSCtWXhQAi781e7xTcIVNp7bHMyv+M4A1jujrkcqF0ftAAf+wLXj5iQoKgRo992pGSg9jo9O/gav4Ekxw6jwyfh7JVwntHNyuSmRSmfxvH5wcqqJdF5F8W8N+rvgHDGlLTsQukeAvGEgNeWPdg8Cb1XtyVyjVVGcInirDiQ2TKevbXxKxNlOVav7gEqpfcxQSpgMTWXrGVeywUu9WC/PewvXg/IjkSol0JVnJxryRwNY7CjNyv9HLXA7kqPiNbiE4Mg13vkj9X1hnyVE/Z1EUqb3JnJL+gLrtyYEN5eSkvUsyHpEu++3Qt5WRioKqXdgXVwIJEOMGs2ghtX57td2+xbytImyTM566cJgrdQrGEOD2f3ORh7vpTFD35Y0gNb/PsgaOxIL91oGQKwPb0kGJle9XV5334HK/fKIHTNQZwIBQC1ofUDFH8SVgQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWZ5aWhtMXR3MWZseG5mQ0wrRDZnbjJSK0V4QnRBaG45ajlLTXVvbzJrRURY?=
 =?utf-8?B?R2U1bWJ3V1lnWDdGNGFnNkJWazRMcHBVdS9HODNBSjY2aFEvQ1pWWmppaDcr?=
 =?utf-8?B?V1pNVUFFQWdMS2plVnpjcUhKaFdhM2wwczBoM2IraHlhNzZwampEUVpjRXVP?=
 =?utf-8?B?L283YTNjcVlOa2I0ZTU0a3NrL1k1U2ZiT210NGt6a1JWVnJqUUMwdlNaTm4z?=
 =?utf-8?B?b2lpenVMRDFJM3NmOXNpUzdDTlBPUFVtSURLUU9YcHprRGloalNBZkMzM2o5?=
 =?utf-8?B?N0g4TGpOSTdPSnJGWkNHcWNkL3JFb3dhamhuRkcySGlMaXNxZDBtOHJYbUVh?=
 =?utf-8?B?akRlcDIrQ3A3SC94d1VGaXVHSGNzZ2t0VENQT2RGbjF2eG9qKzk4NlVPdUVD?=
 =?utf-8?B?OWtkaXhWdGd0dENwQWE0ZTFvNEtjdWpaL0ptd1JaaVVOVTEydDh4WGFjN3Q0?=
 =?utf-8?B?K0lLdlI0ZFRnd2RhVkdNN2N0cWVXVlU5Z2VwS0xTNkJNRllydjE0Uzk0clVT?=
 =?utf-8?B?U1NYNnJVdDVQYnNqSEx5VWhtZjI0c1d1RWRVeHhBcldLakoxTk9nK09aZGNj?=
 =?utf-8?B?Y0RhNG1uLy9WaHBOa25ucWloeFJJTWhSMlBwTTVVNWgyZXNTZlQ4ZmhDRTRk?=
 =?utf-8?B?TGVjSW5qV2EvYUwwbXNnV0toK0hpZVFWaHhHQjJ0SDk5VkVnVXYzRzJmOUNV?=
 =?utf-8?B?eDdKQllqSGFJSGZVTlNhWDc2UEp4RGZTeENYcFFBRG00L1Vja1M2Sk5yWTZq?=
 =?utf-8?B?SXdKa0Q3QS93RUJlODFkL3FDUmJ0cThiN0dvZEVPY3NvTDVLVW85U3hBTDkr?=
 =?utf-8?B?YjZsQ0pBc2ZxZUlBSWpNa2hOUlY3VE80dWhkSjdRTEdmdW9aKzJMR0RTVTJ0?=
 =?utf-8?B?anNyMUNHdHJtSCtwbzR1SHVhNVZyUzliRlY4QU1BSWRpN25qQzdwRFZ1bHJ5?=
 =?utf-8?B?bVR2ekljZk5oSGRVaFhnTTFPdkRBUDRHOW1xUGFFN3grM0x6S1k1b2ZEdE44?=
 =?utf-8?B?YXVwdGJuQUJKQUVwRVVJTnpYTVh4cFJHUFVMY0RkR1VSV2NBc2RNemJBUGZi?=
 =?utf-8?B?VjdzR0gxSkRaNmJ0b0ZuS0NWdGN2NDNJN2ZmSkV1emp5Tm1pZUVNRExtdWVE?=
 =?utf-8?B?TmduSWxxRzhrRVZzd1FCd2IyTnFybUF2eGxoV3pZT3U3L2hPYWRtSTdLZWlr?=
 =?utf-8?B?R0N0OXRwcTEwWkM0ZnZRNzdTTnR4RkxxSGhFRTBtb05NMDFvUG9nUmhsZ2Nx?=
 =?utf-8?B?M3JXSWppdW9rQUh3endGN0toK2h2ZEttQjBUSFVpWkhtZlBYSE1wUHVFUk5y?=
 =?utf-8?B?cDBoS3VmZ1ZRNXJaTFNqRjVBTmZvczIwWmhSbE1lMEQzajJjUDN2Zk5RVjVB?=
 =?utf-8?B?YWY4SnpHQlBzWUhqVkoxbDlJaHdZNVN1cGkvVEc2NVVhWDFIeUhITkJkQi9h?=
 =?utf-8?B?MklteWVOa043b0lTMTAyWG9zWEU0RDNJVFd2Vzg4YlNrRzFENExHMkIrWWg4?=
 =?utf-8?B?bU9GYmNLQmE5RkYwREVVdXRNK1dnTTB3bC95WU5yeEpkRHNLV2hHWVQ0b1VW?=
 =?utf-8?B?R2ZjQlptQzh2YmUxUllXWWR4MHVnc2hHTVFOVEk3M2EyczZ3dmF5TG9PWE5a?=
 =?utf-8?B?R1ExaGg3Q21QU0RBWXgyTC9nUmFHR3Q3UGxsSVVBL1MxQ2MyU3k3SWRBOUd5?=
 =?utf-8?B?RStnMzk1b2J1N3FPcXg0NGRRdnR5ODdrcHlGU3hIcUx4TmFKb1hiV1JxQnIr?=
 =?utf-8?B?Q250K3oxUlY2Rk1ZT3RQcmlMUVN3M3lTQWRpZ3hVdHZrdHdhTU9oSjJnQXpU?=
 =?utf-8?B?NVRQb0tMRlErZDk1NHVDRXRiRm0zQjJRS28xclBFVk55cWYvTzVDZ01JZHhN?=
 =?utf-8?B?NWxQWWhzYUNGcHZObEdsUURpNFFhcW5RSVFNdDZ5T3NvdGU1OVdwT3N1ZStU?=
 =?utf-8?B?Y1g4cy95dTl3bUlLOW41T3owZkJhVGNGcktXR2h5YmtqMEozUEpaODU4bHJo?=
 =?utf-8?B?dTJFYnppNlZOUDlicWJZOThMS04vM3dXbHROUDJWVUdlR0l5UzdndkIwbzZG?=
 =?utf-8?B?eUROeU5RZXpjc1JYcVpYMWZ6Ni9nTURCVTR1STFMZ0V6QmxlOFhWclFlK0Fu?=
 =?utf-8?B?SXZSdUE5Wm5QVVZEUFFlMXdOb1FONUxhcDBud0dncG9IOUgxSHVNYS8wMkZl?=
 =?utf-8?B?Z2l3ZmM0OGJkMjdNcWR3YnFCUFVyUGx4NWJlQXJDM2lvWVFaMzd0T1RjOTRj?=
 =?utf-8?B?RlJlbTVUdmIyS2Njc0RWdnBieTJIVUxvQ015Tyt4S1lPVDIwUEVLWHRHWUFG?=
 =?utf-8?B?VnBxOGR4c1I3eG9JbWJzdnJwU3I2R0tQQ0xzQkM0SzRJa0dyNmlxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68c02dd1-8c77-4ef9-6fbd-08de79dfb3e2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:18:03.7108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KxiqC3rrBg7IeaJqk8AMqT7V8EdjLLXCugDxQGotw/pW5/BQ+LdpneGFOfWJzFOLUG6tr9fX7TM01ORaw/IzVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7366
Message-ID-Hash: OVJUPBNEGJTTL6MWVPTI34DIP4UH7N7P
X-Message-ID-Hash: OVJUPBNEGJTTL6MWVPTI34DIP4UH7N7P
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OVJUPBNEGJTTL6MWVPTI34DIP4UH7N7P/>
Archived-At: 
 <https://lore.freedesktop.org/DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
> On 2/23/26 6:20 AM, Danilo Krummrich wrote:
>> On Mon Feb 23, 2026 at 3:16 PM CET, Gary Guo wrote:
>>> On 2026-02-23 11:07, Danilo Krummrich wrote:
>>>> On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
>>>>> On 2/21/26 11:46 PM, Gary Guo wrote:
>>>>>> On 2026-02-21 02:09, John Hubbard wrote:
>>>>>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>>>>>> equivalent of Alignable::align_up(). This uses inline_const to vali=
date
>>>>>>> the alignment at compile time with a clear error message.
>>>>>>>
>>>>> ...
>>>>>
>>>>>>> +#[inline(always)]
>>>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> u=
size {
>>>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a powe=
r of two") };
>>>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>>>> +        Some(v) =3D> v & !(ALIGN - 1),
>>>>>>> +        None =3D> panic!("const_align_up: overflow"),
>>>>>>
>>>>>> This is wrong. Either this function is always used in const context,=
 in which case
>>>>>> you take `ALIGN` as normal function parameter and use `build_assert`=
 and `build_error`,
>>>>>> or this function can be called from runtime and you shouldn't have a=
 panic call here.
>>>>
>>>> I think the most common case is that ALIGN is const, but value is not.
>>>>
>>>> What about keeping the function as is (with the panic() replaced with =
a Result)
>>>> and also add
>>>>
>>>> 	#[inline(always)]
>>>> 	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T=
 {
>>>> 	    match opt {
>>>> 	        Ok(v) =3D> v,
>>>> 	        Err(_) =3D> panic!(""),
>>>> 	    }
>>>> 	}
>>>>
>>>
>>> We already have `Alignable::align_up` for non-const cases, so this woul=
d only be used
>>> in const context and I don't see the need of having explicit const_expe=
ct?
>>=20
>> Fair enough -- unfortunate we can't call this from const context.
>
> OK, so after the dust settled on this discussion, I *think* we ended up
> at this, which I have staged for an upcoming v6. Did I understand you bot=
h
> correctly?
>
> commit 1360a440272976df697140361537c5b697d602e0
> Author: John Hubbard <jhubbard@nvidia.com>
> Date:   Thu Feb 19 14:44:02 2026 -0800
>
>     rust: ptr: add const_align_up()
>    =20
>     Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>     equivalent of Alignable::align_up(). This uses inline_const to valida=
te
>     the alignment at compile time with a clear error message.
>    =20
>     Overflow causes a panic, which becomes a compile-time error in const
>     context. For runtime alignment with fallible overflow handling, calle=
rs
>     should use Alignable::align_up() instead.
>    =20
>     Suggested-by: Danilo Krummrich <dakr@kernel.org>
>     Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>     Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..b8b0cb1e0b6b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -225,3 +225,31 @@ fn align_up(self, alignment: Alignment) -> Option<Se=
lf> {
>  }
> =20
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Aligns `value` up to `ALIGN` at compile time.
> +///
> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
> +/// `ALIGN` must be a power of two (enforced at compile time).
> +///
> +/// Panics on overflow, which becomes a compile-time error in const cont=
ext.
> +/// For runtime alignment with fallible overflow handling, use
> +/// [`Alignable::align_up`] instead.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::ptr::const_align_up;
> +/// use kernel::sizes::SZ_4K;
> +///
> +/// assert_eq!(const_align_up::<16>(0x4f), 0x50);
> +/// assert_eq!(const_align_up::<16>(0x40), 0x40);
> +/// assert_eq!(const_align_up::<SZ_4K>(1), SZ_4K);
> +/// ```
> +#[inline(always)]
> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of t=
wo") };
> +    match value.checked_add(ALIGN - 1) {
> +        Some(v) =3D> v & !(ALIGN - 1),
> +        None =3D> panic!("const_align_up: overflow"),
> +    }
> +}

The implementation doesn't address any of my original comment and all my po=
ints
still apply.

Best,
Gary

> <blueforge> linux-github (nova-core-blackwell-v6)$=20
>
>
> thanks,

