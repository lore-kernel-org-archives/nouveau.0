Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE13FD9E02
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 19:34:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE23410E9B7;
	Thu, 26 Feb 2026 19:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FYCiqLLZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8876C44C88;
	Thu, 26 Feb 2026 19:24:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772133885;
 b=AKhYH0o09uLeGHOzO8TKn8GqEsrb3Jr4pCjJp2qD0CIYt/JN84vPL7bXIeiZActNwy2zE
 HeiFNKRZC/abYCyN2NZ2GbbaOZNYxw31sg6/1O0tttas89f/xkfTAiullMbzp4uLDlws5xT
 LZmNMsD911QaA2blUjHx6nOn2lualDCAVT17aDrcTbw/XzpIJewabgLoYpqEG8Cr413+DId
 +4XNBE2Drz7csnpQYk2TdWH/aXSQzNJCdS5G5ufXSmxpTWGQZZRl9wKfbCvB80Lcb1Kqwmq
 uc1SxzFDHsXhgKcU/VGgRdGhH/HmJcbZoTHOSjPaYN+3jXYugfKEX0e4mAQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772133885; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6wHSi3pjValyWrBjLVT37rL2hXPwTAhDbStrp9d+/g0=;
 b=OkL0OHcj74RL4ZgKuWPOPFt01+JMwZr2cAx9wKiQLyMugg3vo7iv3jqy1nGdgZNaE5ouj
 orsM4RynAzCf2QFoTtTRVmzHAWmtAIePzvDOFuTXNGQ9R4Kji9cec0YEz1tVFk2bRYakW39
 xWY8P/LQOAVWF7lcrNaSo32DoI3ws533m6aH3MYmD8TK3k9AD2pihUqi3xml4PjUwZevely
 wCR95vcC8BZuuBzWZrCsVUiPELi1O5/r9RvnlUN4Ujx2U3fgcv7a6gD7qqdOun0X1jVOtUK
 bEcVr2/GSKNHBBHdiqAx6epipXmk0V4+1KSb+0p/uU1MjGIcWb5xGMIl82Yg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B9881448EE
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 19:24:42 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ADA9010E081;
	Thu, 26 Feb 2026 19:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmog0qpJSpjdOTGrYITxkQb015y6VMiuuBfmbtNm3xFk5h9aw+wvH4mgGueGyuflZ7FuTQe/EbG9m3zcMskEVU/DP/z0lu1/+q2+x/waNFybm76dZrdXz/+anIsGXyYMS+NsMYBLea3ywd8pjRN08IUCx9HqR15SCRJ3ZjQ56gxbK5hm9rm3QRyLzd3Zj1fJJPWrOT6hlOkKMlFbjdmTYPF3kgclu4BLL7mqmQN98hClTB3jO2iU8aiGO5Ch+JTLZdHhoaUk7oho9EQ4Ztcf3wQt8PSCO1kEBUXe10SJI2uoxiYSzFjjEyRyHeUIH+yzsTHauZ/M1JjxtalqYrQCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wHSi3pjValyWrBjLVT37rL2hXPwTAhDbStrp9d+/g0=;
 b=OWrYP+TQh3NOFoo5XDRSMg+p6SoD8yewgDcnibPApFNrnxa1Jg5TDVH5M1oa9RgQRYV9EFJ53NOEpYFFvEZRNFAL62hB//ZQhZFfy0dw3mpPLkDmkM55HCOeF87KnydLMCV47Kxd61dtLrUBWiU7+rCtU/b8St5OTeLPCmQwXS96CNQQKJI2audSAzjniSJqcGZaW9RLjc3Bc2Mw0mostyLHCF83lfro1fGrmAzAWXvaVE/gZSWP/AP/xqTwpFeo9rp5i61pOIWjGnObLowXnR2roeNq3IKI/xY6o8ctwt8u/5HP6agVb25LC3z+au1UyrK22K2snh7aDBFV0hXz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wHSi3pjValyWrBjLVT37rL2hXPwTAhDbStrp9d+/g0=;
 b=FYCiqLLZ5pckO3Jel8x2o9RO7yiDfgB92INWhrjqVsUWVG9eQq5QSEI3xbu0IqEau+5jFiYSXVl5Yy1UZkX7fJGJfUbJq5sPBYmYDUMzOXR2eIOQ/TpO2FFcuXvMrkO7eKQ1oG93VZB+Iexc0pM7AipVpTAeol183WOQXjCcILpeAYIqIhZwap3u4EDixiJUgNVzo6mGeVtpRw2hA6XN4LCjmr2JkSEpYzg0jAhm7Z5VQRnPCvHuIGsm5Cy2E/qQsEna1KbEkJCPvd+AP2+/6Ix/yKRkIgl8z5r9KDahdP8GTv43cuecZDnY5fOxplL5z9FH7QQ/danMCib3t1oQLQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 19:34:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 19:34:44 +0000
Date: Thu, 26 Feb 2026 14:34:42 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
Message-ID: <20260226193442.GA4077409@joelbox2>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 532058d6-1b8e-462e-ac20-08de756e17da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	6nPdqX3OqgQXtsz14/YuelpySacGzsWaQOpWAWxlxhqmwNQ2i28CohhYpOu2qo+b5HXi4VT8tRMBAyby3POzEx/DeGf2P58t+mBQ2GB1k3G+WXUtnbuu133ZyK3qHB5jrR/xTqB+7EZfKzU1IsK5G1bBoMmCWWEVjmGrZrAXYn8Pct1omksh+d+sGtpPskl4XPXmfXG2rs5qGBXo5XxC0oayIQ7zs9+nQYtILBbkhVM5i5JjHMeeg+gtRq/SlQrbPFbaFSB3J69QHZZN6skb9HkDso1LiHTW8pWGE39XvDdVUPefZiLDI/7XNOZXanyXhTydn/Jvz4bS/Im5+kWFZwJaJSHpLpT2FhpcDUIbh0i0FDU+LTPkRdIN0RtbL4t0fiEkvr9hfCssVFpC7IFER0tQWZI1NBlzTOUeNDwNuSRB7LSd3wwLQIntIPTfuOmRJYg0n8q4f0uqW0Dp3vbBUcXfjVKXPm7GgA3epBUPdCaHupank0KdRAtQpDTC9bQrj/hW1xs2TcCa0kALy23ywXZEbZjeboLqUiPH3xZG79F4ZQc4y2zaGhVRdl7VkXoAposCtolFqMv7wzH4qPvRP9Ux5uv2Ih5Y7PvMnfFUNlwR9RKfaQRGCiEU7ilEHwmDnFt965fIwodvNFGyWXywskctTTyP9lH5Pybr+n+PVlmu21gn7o+RykFbVXyH/JcHmiR1yj347O07oUvUGOoOnMIMn6oRtNh3SM8j1rP/1oo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1dhYzN6dWQwK1Y1Uysvb2xvUnRuQkM4aVd5ZERYc2hNRENuMkY3a2krbVpL?=
 =?utf-8?B?Sy9xYU5vTGtLYThLQjhlczNKSU5DVWM2NU9PaXV1WDR2WEJVRUJnVW5jNVRK?=
 =?utf-8?B?cHhRRVFXVnNNM2tRUGlmR1BtNyt0emNSVjFvTGwvK3NpVzZDQy9laHZZMElN?=
 =?utf-8?B?bDRidjU2dG15VmdrbkVxc1VmN0hXbVlPSlRxd1ZNNCtON21QQkRxeDJOYi9V?=
 =?utf-8?B?bUk0cStVSXZDL3RTM3dkUFZ4bFBIQU5zTWhqZHlHTmZGUlVMcUxjdzVrYmxk?=
 =?utf-8?B?K29YQXJwK0xZT1hlWG90RFVkK1RVZkQ0NitFbXJQOXdGNWNlU2RyMVNKMUpk?=
 =?utf-8?B?b0ZKQkJ2bHJZaVVSaG5XbHJhcng1a0hkWmw4bDREK2d5NDVqUXpXUElXdWZH?=
 =?utf-8?B?dlpGQWQ5LzFhNWNIdGI0cmZ3R3R3SDlsQ0QxazN3SnJMYmJLM1NKcDk5cDRX?=
 =?utf-8?B?M0svbjFTM1huejdoaWMvLzNWQ3lnUWRqemNEaXFuYzNBQVp6cDFZOU1QRTV5?=
 =?utf-8?B?dHc0TGlZV2hyR08yeFpxa0Z0d0o2TU5MZnR2Y1JMTTNDbjBWK1Rid2Rmclhu?=
 =?utf-8?B?aVhaNTMySFhNbzdwbWFKb3l6a3IxVXdGN0lHa0NCM1FYOGlOVmw5Sy9nbVN1?=
 =?utf-8?B?Y3ZkK05OdnJqUG5IbFVFdHFoSVVDeGk2K1E4OWlNTzZDMjVNTkRuNGk1M0FN?=
 =?utf-8?B?VmhRb0g3b1dkWlBzKzQ0dk5nT0ExNlE0VlUrKzlYYTFFdmRMVmxNdzlqdnhY?=
 =?utf-8?B?VnR2QVRsMW54U2RQTVJ1ekZYQS93M1lpdkltN1I4cDJIYm5Mc1dRbitRYzYy?=
 =?utf-8?B?RUdFZW9ZbTY1dXpPV0lWS0VuRUZoOXBjUVFWTWpEaVJKUENSeDlwMEFiK2sr?=
 =?utf-8?B?MGM3a2t1NDZiTFFGYUt3K0NOMVo1ekVTeTFUWGh6MVA5MEZKVWdxdnBEbjc0?=
 =?utf-8?B?Z1oxeXJDelBIWElIQlZQTGZ3SlF3U3hJUzZvV2JpMzVoNDVLRy9pQnppU3F2?=
 =?utf-8?B?VVRmTjRkbWpkcTA3T0xNZ3VtS0RkYXFmS25LQnJTZ2JPYUZKblN1WGY2YnZy?=
 =?utf-8?B?aVl6QkVzTXRxaEpNR1BDOFM2TkNXSExSWlo0WTRMTEI0SmlmdG5TUlF3cGU0?=
 =?utf-8?B?WGFQazhuQmd1Y1hEM01oS09DbGdXa1pQUk9EbjFJOTdueUxRaFBtZG0xUklj?=
 =?utf-8?B?ZVE4OU5uVi96TEc0WWFpWHdvams1dW5jOXBpR0ZrRnU5cWkyOGpya09GaThh?=
 =?utf-8?B?VklNMW9ObzVYdUpRNzVOK1c0Y3dsT3hOWWlmSE0vb1pUZGwvenRoWEE4bjJu?=
 =?utf-8?B?SkUvK3cwUmJHcFVFM1k1QUhxVmpybFIzQlViaTdjc3FiR1BTR01iUENMbHJE?=
 =?utf-8?B?Sk1XYjZJZFIzQVppRUUzZWlSMk1TMmx5cHd1OEdkaCtzc0xOaEt3RWwrcXBM?=
 =?utf-8?B?ZThBUVZkU3BwYmNpQnRLRjJ2UjF2MzJHejIxVmNUSGJLc2FOb3BqSmdLQjVh?=
 =?utf-8?B?bGVIMG9FVW9pVDQrbyt5dzR3UTlNRHY2QU80TzFtWFVsSnRoVE9LUkY2am5s?=
 =?utf-8?B?d3h3RlZiYXpUdVhDYm5OMjBUZVY4ZFkvNnNVV0NndFoxdTE5RUVXbUZxSEo5?=
 =?utf-8?B?Zi85cHkxS0V2ODJGTjVmRVFSUEpwNEFBSHZscEc3cE82U29DZEltU0szOVRV?=
 =?utf-8?B?MVB4OFNRQ1dMVmZPWmxENGVrRTkyRzd2K0pkbDFhRkJ4YnhEVGsxTWtHWnI0?=
 =?utf-8?B?SjNHOUlkWTFrSTE4L01LMVlvV29oR0JleUcvdnVOYnNnMXc0Y21KcThORm50?=
 =?utf-8?B?cU5Ea0RLdTVZMWNRSkJJWXIxRnYyRHVYelB2K2JRNVQ5bDI0cVZiTWdkVlBi?=
 =?utf-8?B?ZFRRb0ZPZW1SazdpVEsrUFVWM2UrQVp0d0sxY1l3N09tMlV6eU16SDQxSjI3?=
 =?utf-8?B?UUVTN0l4Ty9IOC9rV1pFam9EcFA2Z20xZjVxWG15RExEWUxPWS9DRHIvZzUr?=
 =?utf-8?B?cmxhUXBjOWo4cUZMaWVBNmcwRW5lZHI3LzBoUjNxdnpWSmVONXJvcklZZ2I3?=
 =?utf-8?B?dEhoUUt3SjMyVjRpOC9QMVBPaVh5RXY1WndoeDN6Mko4RFBSMGJHWDhXVlZk?=
 =?utf-8?B?WG9OWDZ6WDBXT2duUGkvQmJkb3VzOTZqcUpndFRCcXdJV1NBcXp2amd5WHpm?=
 =?utf-8?B?Q1dkc0J4OUxvRFlLQTJCamZPbzRxMnVoU2F3SGxOUUp4Y2Q3U3FVeld4ZWZZ?=
 =?utf-8?B?bVBiWk41ek53QTlreWZLbDM3dzFwUmhMVk1iU0tKS0Z1RStRS21tRC94em9H?=
 =?utf-8?B?SW1YbXQyUExRSXB3bGoweUV3Uk9BNTBHZDMvM0xHNmc3cDlNNlRtZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 532058d6-1b8e-462e-ac20-08de756e17da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 19:34:44.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nUTRpmo283bUvQODzUtZiOu2F7P8l0Rol8phibgJSdx/thZozlhgV2N9KhOkak9nPKZSynQP+i9VoNaaOe2SUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
Message-ID-Hash: GNBWBT2EZBP7SCBKDZHDYUYVVWQWGP2K
X-Message-ID-Hash: GNBWBT2EZBP7SCBKDZHDYUYVVWQWGP2K
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GNBWBT2EZBP7SCBKDZHDYUYVVWQWGP2K/>
Archived-At: <https://lore.freedesktop.org/20260226193442.GA4077409@joelbox2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 27 Feb 2026, Alvin Sun wrote:
> Thanks for the clist abstraction. The Tyr debugfs [1] I'm implementing
> needs to iterate over a GpuVm's VA list, and I'd like to switch that to
> a CList-based implementation.

Thanks for looking into using CList for this!

> Could you make CListHeadIter public and expose a public constructor?
> Or do you have a better suggestion?

I think this can be handled without exposing CListHeadIter. See below.

> The VA list mixes two node types in one list — GpuVa (with driver-specific
> data) and KernelGpuVa — so we have to filter/skip nodes and can't use
> CList as-is. With a public CListHeadIter and new(), we can implement a
> custom iterator (like our current GpuVaIter) on top of CListHeadIter and
> then migrate that code to clist instead of hand-rolled list traversal.

Looking at the Tyr code, both GpuVa and KernelGpuVa are
#[repr(transparent)] wrappers over the same C struct (drm_gpuva), linked
through the same list_head field at the same offset. The "two types" are
a Rust-level modeling choice for safety, not a structural difference in
the list — every node in that list is a drm_gpuva.

So CList's typed iteration already works here. You can iterate over all
nodes using a common Rust wrapper type (like a #[repr(transparent)]
wrapper over drm_gpuva), and then skip the kernel-reserved node by
pointer identity — since drm_gpuvm has its kernel_alloc_node as a named
field, its address is known. Something like:

    // Iterate all nodes as a common base type.
    let list = clist_create!(unsafe { head, RawGpuVa, drm_gpuva, rb.entry });
    let kernel_ptr = unsafe { &raw mut (*gpuvm_raw).kernel_alloc_node };

    for va in list.iter() {
        if va.as_raw() == kernel_ptr {
            continue;  // skip
        }

        // Cast to &GpuVa
        let gpu_va = unsafe { GpuVa::from_raw(va.as_raw()) };
        ...
    }

If you need a named iterator type (e.g. for returning from a method),
you can wrap CListIter in your own GpuVaIter struct that stores the
kernel node pointer and filters in its Iterator::next() impl. That would
probably also be cleaner.

OTOH, with CListHeadIter you'd need to do container_of manually on each node,
which might be more erroneous code, whereas CListIter handles that for you.
And anyway, the pointer comparison needed to skip the kernel node is the same
in both approaches.

Would this work for the Tyr debugfs use case?

--
Joel Fernandes

