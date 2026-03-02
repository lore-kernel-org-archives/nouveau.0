Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789BE9B36A
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 11:43:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9F3C10E4A9;
	Mon,  2 Mar 2026 11:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fvV2pNtk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6B52144D4B;
	Mon,  2 Mar 2026 11:32:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772451173;
 b=hRXpQWnbl465yi9uKhjmimcxZ8T02VPsN0SAGGnhq4Dkb4p6JCCo0mGb2iYPk9dLYnGyD
 hf4TcTJuicH5S43NpRBa7CVjgxthdowJnTW8hT2IjUxcb+8Z8v3yciJs9VZC9lS7kH/qj56
 WH85msFIja4fp7hLKlqlli2yUpAzHvl/htUYY0kAwnOKkZgtAIkSox+VLnT6k1opk9Gb651
 hmkKz4eoj0NF2ZMgTM46qsjCFNDD/N5IJRNRgNjpVNTaCKc2YOa4NuAdMlSo5OxYkMaZseL
 T/bfBn2tBKJJRcuqiHhfbgPQEniwZqiKnB2cmonxeR5MJEKAJe+/7qDHZT2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772451173; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/xk0cB3ejg6x+g8QPLVKlfP5LVx9IUWJ+gsFaeJ3sRc=;
 b=lB6XmwtKnHHv10bjtvPebDqjRrBtfryizFCjngWH6SfotcA/4OPmw8Y5tpFZoVy3Ckp4x
 S+13NrvoWlYYjpaRGpTJfjz7VHCTZO7lEbDKX8JLK1xxKg2NBALkatGquF6SWqSfkb7aSOR
 2AaUdGYsBKqL4+Ay9HJ0VAMvYUkGlTuC11HS7fc5nHcPrmyoRHUT9F+GcYSUIsWeMGdr9cW
 UZKV9NEyHaoCeqpu7M0/FmIknjzxni+Lp2PXumPIHHwobu3sudOPDXg/Q1nOldaIiHXmO1s
 rCPpJTwuND6Jdc5/D3UL9IVxKSo+q9r5ys/g+chDZldPvnO3O5UFjCnMaVnw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 85E8240368
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 11:32:50 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010045.outbound.protection.outlook.com
 [40.93.198.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C570D10E4B2;
	Mon,  2 Mar 2026 11:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFqdeRJGsV0P1YpXkk2Ll7fMEyxp1qgMU8MRBLMRbHv39agsu/bEKnl8WH9ExE2+mopTsGptONFQsdGR4LLHl5tjRirLsL6il7w+XIipeGv1ta+xOB4XYtxDd13K7+TKkeOeyeflogs+mmBwX3yhCR+LoVJ4Dvm/na9mSjW1PmS7Xlj36TKZKCiFu7FYQgXULLle173PpB+M7MKNSqclNtjpPhQuL5D6KGkMtCCu4KrVs/pePiR8AnNOQ0QoCHUluU/QYWqgO7CwgwVSRpf2a6GMSaO/FxoP25DlwZFUQmnvhfBd/IClUQk/OR/hDsZl/V6h5eFNNaODUpzDAxNU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xk0cB3ejg6x+g8QPLVKlfP5LVx9IUWJ+gsFaeJ3sRc=;
 b=u5OudOGESPcfQjnIJs3TNumu2AxPrAm6v329AtF39AJNaJH5ISZEUAdYnPFwP7LiWLmyQlKfBSyxU3e9ti8N4wyHSobNbIw59QkGOIyXW6wFVQJn47FxrhBOolTkQEDFv+kCn3V/KeZi/n+VW+kmGcBrmVVBF4EHYnrOjYbvbAwCW6Hj15wiU2ybwd7uF7Cg4D2kPx0rIryB4ErKFJm5DQpuMi9hSF/eRfryTYq8iFFH8nC1LNS6quhBeG0x4O1AznVZ/+vRkuJvOtYvXfRqgJNENBRGPYsY80NlUG9lOR1+rF7F21QJLenQn1+BwlB4Va0gUqahd36vqnCMUY/psw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xk0cB3ejg6x+g8QPLVKlfP5LVx9IUWJ+gsFaeJ3sRc=;
 b=fvV2pNtkerebgqVnfPbEiMbdAWEPv3JrjIBT3ynkHHub1XQ8sqMvstmTgs82Ir4Xg20cfMojdU1c0pInExUCVdyOtbVZAvc0bsMoVLQDtmqBcSw7aLK+ht8nhFAXoUBP7Aprx1J94yLAmBd22i8KwEIg3v5gm1WHjzUOScroHSATRuG4cZMW8OXK8X+zTAy3alzSnDga5vEsn834LMdlmALngIOvB5pHj6Ykv/Oww3I0/AZJFk9VXuFxxUYtmJ0eYFL/yugyZWR9P+sGGtWD4L7WreCWBFvktRsPwZNsguAWijZy5i9jcHOFCjVhmqTWU2B6cQ0KiBfjktSJB2g7VA==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:03 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:43:03 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:29 +0900
Subject: [PATCH v4 5/9] gpu: nova-core: gsp: clarify invariant on command
 queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-5-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 89be65f1-074d-484a-ba38-08de7850dca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: 
	SwSXooRmEedli3R5piDfHA9kTVwJDIJJLaunX/hTxWDMvLaWOsUM2+mhwXTICwuulsNYA82u1OZ9DnI7wMGdRr0MSuKALJrMUT/3IqJ7MZNuB05WZD3rkM+B/J/Kx2FIv8rqESgYnhsj5Au72SyD3IAWomZPwHYtU4UNrPEQfbv0Lwpbbw6HaIA2vN7L52o7I1ks3TueVv60qehTVh//awuiM8usgkv6PCp9UtDU3WNmmo47rA9wI2NjXm5LuVAWUal0ICXHha8h/anZOCUYB30hywwsxddfV4Zs1NKDHJ4NDHPz9idleoHBkGK6j2ovEYP5owUV90xbRZ5E0lnNFp9hnZ2IOQxGqF69ugXubH9b6fgtuZzmbConpReZVNHjgOVfK2IBNBI9kz8T8mVeW+28lFTZJ1f8vh8tLp/UTTWs+XBpXeNrmg9LqlD9HdDRELoJmVD1dRi/AUkJPgWKq2Fd0bQMkH2v6B0WY28f3CnenmzTIcKs+xpRf3HZMNDKu+zbYanYsGqW7kmhpPVjRQxbj4HfY25c4+7vF19aGwMnlQRgjO+8Tp4lUW2hH7JGtUJ0kZJ+Bobgyvka+dy3xN/EJQlV4ic0sOdkTgAPAuRph7ftM2cJIxSMikcv4vb2BGj22c9cLWCYKobpDnpUDv206Mg0767XEvvET4VZvFQCKxFq24dKd8PWI4+IdRPbdPk8esKq4nQ2rrS7K0kOj/vuDL5Tdry3r24jeRpgK+TaXS3P0rh1mmKsZ0tmCfBMEdzfvDhcaqKNxDe2gvZ4bA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDFoVFZGL3hkaXRYZVJtVnBqTTgxdzVpMFkrcmkvWFIwaGdNemhWUFU4MG83?=
 =?utf-8?B?emJXT2tIQ0xRRFdhNkdZWU9zeGZQNTlEVXJRL1JyZkJDU09TVWQxcnFsbitR?=
 =?utf-8?B?RXplbEtrQzJpZG9rTlJrYkNodkZrOWxZcWxkenFzTDVZckdTelRQNmw4dHpy?=
 =?utf-8?B?aGpWbXN6Q0RrVXROOTdMVUtNOHhtYjU0K210azIvQm5qNEw4QUdPTkVxc0Rj?=
 =?utf-8?B?c1RYbTZpZVkzNXJRWnBBbFY3YzdCcFY3a1ZBVUlTQ05wVUprMFpIRkdNQmdG?=
 =?utf-8?B?TGFhZ2ZlVFRPR3JlWENNektLOHl0OXEwM1RMQ0JmQVZEYmRYUUIvdlBqZ0Nl?=
 =?utf-8?B?OHlWVldyVXc2TXc3cHhpZnV2eWt4endyb2FVWVFMYWxXbnRRaFJFaGNDRFpm?=
 =?utf-8?B?Tkdid1hEZDNBT2lmNThIbmtYUERKSStvV3liai9NR00xNnczbGVieERMdkN1?=
 =?utf-8?B?cEdMaElsSFJJV3J3bDdmTkZqUFlrb2tUTE5WVytnd083V092dExDdlVtc0g2?=
 =?utf-8?B?aXVDN2VkSEZLRCsvK1VqeStJakVkT3c1aFRDV0FLYzljbitYK1Vtd1pCcUV3?=
 =?utf-8?B?ODJwMktsN1A2bVhCQWQwYjJqMkllWEtmMjdqcjlrcWluYXlMWTIrUlh4Q0lE?=
 =?utf-8?B?QXllRksvRzY0VG1tbnRtZUFBdkpMbkhNeWlnb2dqM0RhZ1lNdzhZMVBTVFow?=
 =?utf-8?B?TVZ2R3JOTGd2aUV4Qko4ZXQvMWpqQlV2eFNPRmpSUjBpbXV4amxxVTJTVTRr?=
 =?utf-8?B?U0VxU3YxOUVtY2g2MWhTOTYzM0xzaW5wNlBlMkZ0akhRUzRpZHg2U0dMeldv?=
 =?utf-8?B?ejFsaTZyQW13ZGp3TERWc1p6SzM1dk1aYlNtMFVpRlcrV3pqTFVnbTV5TzlB?=
 =?utf-8?B?RUtvRUdKRVJOdEowTWI1WnY5TjdMeVBQNkVLZi9zMXk2dThoU1lUd0tTcnh5?=
 =?utf-8?B?QUsyY0h1YnJUV0sxUG1HQkFibUJjbWVXR2VxdVJ6QVNBV2hMc3lRMTRGdU9M?=
 =?utf-8?B?UC9zWWJmUHY4K21GVG0ralUveFozMzVla0tqM0dmOWdhTEt3d3ZLbEN4cldM?=
 =?utf-8?B?WEVDcVY5TG04UkFmdFhZa1hYaFZaMnRBQVRPWTA1blhhRU9UbzgzbG1NRlhF?=
 =?utf-8?B?SkViaFJCR1U2NndjNmErVG9yQ1BuMlMyVWErU2xhWlZIeEkxQThzN3JiVkQx?=
 =?utf-8?B?TXEzaXB6UTNRMVhqVTNtNDh6VzVPVGNWVzZlNVFLZWZSV2ppUnlLYlQ0bGtM?=
 =?utf-8?B?YzlZdDV4VU1TN0lBOUMvelU5bWVTVGptbm9lblJpd3R3eDhHT01selZJWGNs?=
 =?utf-8?B?YWJqNXV6eElzRkpEZVIyZ293NWZYNXRxSFRjWVVQaEZhb0cvb2UxMlNtR01D?=
 =?utf-8?B?aDhXTTA2Y2YvQ1RMZUd3YlQ5SG1ta2l6RS8rZVVjWk9idVI1YVprOTJzVzR3?=
 =?utf-8?B?SmxGV2tVRWhvVEFjdGx2OWcxUFNxZTBaekpYK2JGdkVobTFxbUUwd0FYM1cy?=
 =?utf-8?B?UDdISEVvdS8vYkZFWlpEOFU3SjRWY2dlYTdENTZ2aEIrWE43WENrRFVPNzNN?=
 =?utf-8?B?WWRtRUMzUjJqbkdpSzJ0bHRPdUNIZnl1VlE5Q0lzb05LYzc3NldIT3B2WTkw?=
 =?utf-8?B?SkU5OXhYS2Vaa05zNWg2ZDlxT094RG9ReEE4TnhVUmFUbFdQN0NlSnR4YlF2?=
 =?utf-8?B?YmJMZ3RvYWQrMW54N2VKbklCUUM4WGFHYUs2VnN2d2RSaWNRcEVIN0xHWGdQ?=
 =?utf-8?B?YjFZVFIwcm5Yem5uNXhJN2hTRlJkemNGUERiVHc2Q25pQ3I5R0hZWVhUZHJU?=
 =?utf-8?B?NmY5UGlzODZsR0ZDR1ZQbUF3SFNBUE9ocXBXaW5Rb21nY25rTWVQdk45VElW?=
 =?utf-8?B?OWJmNjk1VnVHTjlOQnV1Q1Y1VTA1bE5ZUytWT2N2cVV2OWMxOUpObEVVa2tB?=
 =?utf-8?B?ZW90V0w2S3puUlRUYUNaRWNXMldDSXhJbUVmUFlNQWFyeEtHd3BzaUJXNnJX?=
 =?utf-8?B?UjVYMENmdkk3cExoemJjRVBodXhXaE9BT2RyaDcwa2J1NHFVaTlTL2hDTVkw?=
 =?utf-8?B?b0lVNFJhR2JnV0RFamtBemNoSElBcHgvTGw3aXVHbndvYUVuZU9UZm9VUnYw?=
 =?utf-8?B?YkZCNnhlcHordmJvQ295cFJ6NE4zTUtrR0xhNTlRT1lJb0I3QVljQUVUNmg1?=
 =?utf-8?B?Qkd3TExHcmJGVTl6ZlpqQkZFRDIrRnVKSjh6RzBKSFRMT1EraGZqeFY2cFNL?=
 =?utf-8?B?b2NZQi9UTlBjNW1Yb2RlR3krZjloUWRUdHh1b3c2cXM5Nkc4c0dzdDFRVm1F?=
 =?utf-8?B?M0MwY0wxQjlrNThGa2JnWVVoSzh1VEE2UFJXaEdYSC9TZVVjZUthZllOblJF?=
 =?utf-8?Q?EcWYsQleSCdIrSeC4JsTzsa4TMKOm7138JE0Nz/vnGiWw?=
X-MS-Exchange-AntiSpam-MessageData-1: hMsF4WKbXLS0AA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89be65f1-074d-484a-ba38-08de7850dca2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:03.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rbXRF5Ibf0BfjyozPtGv723Gh/ueM2SHqvTHtv/kEgxaaKBqBQLtbYQLu7UrtFSle/nhMBXF5UFhr13adQ3x2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
Message-ID-Hash: VD4B2DNNQMNW4CB4SRDOINGLQ4QHLVCZ
X-Message-ID-Hash: VD4B2DNNQMNW4CB4SRDOINGLQ4QHLVCZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VD4B2DNNQMNW4CB4SRDOINGLQ4QHLVCZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260302-cmdq-continuation-v4-5-c011f15aad58@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3c2652be74bf..3653212efa7a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,7 +531,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0

