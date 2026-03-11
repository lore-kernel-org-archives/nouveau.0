Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E2EFD88D4
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 01:35:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6310E7AD;
	Wed, 11 Mar 2026 01:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gbEmO/vs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A36354507A;
	Wed, 11 Mar 2026 01:24:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773192265;
 b=PK1B68OnizTuIS+jgUiTTZHRjAOtsdRWdate7YJc8iUwunCPRyj+iX63YCceXB3fCSpIn
 dgo3uge6/Ygfg8HBl6s25ykLcwshB3/QHG+t/OpIXVFu3qkO4PEetY4TgiV5WuTT6OeHUX7
 dAyzeBojIpvvdVxdkuAy0m5v1jJGVjGH71h686Fe7aWTQgG8OnePaJ2K9w+41IAQ7NWW1OT
 Zn+xi3GAodnSvkPd/dNfRio6h4qXl5KIlJpL9G0dZ3WHYjaxhQLhU7ZXQBBbRmJXyDJemOE
 Yv5lCHKXKkDgj3DOphBvsW98mlZ81OVxn2AcF0jRr9CfvM7xdq9EhGYA2utg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773192265; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ws+tA2O8T/9rSiDXAT59Bfd2s7FlwlrB3K1mGhcjo/4=;
 b=U5Sx8NlMb4lauoA3kqmUvw5JEdio0edufWavAJ0Xx/dZd6HlXZZPKHqeE4Rs7yKjca37x
 iKHhfNJExZvhHdYcLIs0MCoGylAdqpjjQSQm5zBKTqH1lWwupTFXC790r7oPtNMvGAcx04Q
 rCOHFP4pmgZnnQGl7bglVzOu8HRAKL3KSsKgNC5NxglOAWT5w0jIKGhxKsR825Nf38rk0O/
 WwJPKCUPK2dwxIwZEG6eLdsRBxdHau2XlmjqzXy5pkl7FAPCr+aQ4mJReMPyS1qzesLqDpy
 cubWthD06iOlkDv8VYEMuAmMZtXGJnwf8ShlU9tKU2zXREoOtxjamgnrsQ2w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 86E6142BB3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 01:24:22 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE2D410E2D9;
	Wed, 11 Mar 2026 01:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK3QrQqWjQcJx+KPYf+XPtGJgTGS5yXS2QyQgzqqq0NqeYaubT4fZwxychJ7ewWSer1ff1e/SjORh7nY7bOonabP01oPYF8rH2iDklFRpFYTuomiSYERcMd7+0rGG235pEhYq4yYW+f0LyT0eJi3xhHCmq7dJVz70XTQMdYZy3c+uAkFEScF80JOnfP5HY08eNXkXPV4BvnQlIK/Zb1JRFK9Nt346qFcA5dydg9DwiLThwwxi2gBPf7p19annKuCUUptJambFzXYhgIjlUzjsV7PEeA6Mv1Wcfnk9uZKQq7e9nYewZs3TQt2WJjx2K2wcCJk/jiDqjQaPHk/hZgOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws+tA2O8T/9rSiDXAT59Bfd2s7FlwlrB3K1mGhcjo/4=;
 b=oG3HbwgZ15ArVSVORGuFKFMoG0nTI1VXq/8iVH0B501oEDnTeJ34wSN1tjp0/fs2KGwdMr9z1iN9BqPhkvhq7acu2zrn9caBen3kcr/dRC7gQdaw7nbwd47vsEtqtfBEYEhKqg/vjSdgH/Xe7MfdiQuy8wclOS7J3m3Tfy2hDwAK/7+C0ZOnQ+gJN4t2mMlpD0CK6nMbJlNB8U7jSOriU/m/kUcKys3j0v7SBTxh1kZjCQWnkUcT5bVcRU34n3uXUC7UYZ33SLUGY3VcernX2zD4CjPkJsC6IvorwcuTxZ7Mf56EXYfhjiZoBCTKPskFO/0SXCtJn7GxX4lUa6/g3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws+tA2O8T/9rSiDXAT59Bfd2s7FlwlrB3K1mGhcjo/4=;
 b=gbEmO/vsRoAX3ZbxLOCAtXVNcp3IYr9qoLftwGCs46u5zKWTyC82mAjL98Q4dOW5aNgsFP6EfDURHgrG+fYi8k6tfcYNcXp6MSZELlHpuhvOEstJT2L7QTAIZ04QrKoMevRs9fwRoQqsm4CWv7Ohv2pCpGPLhiNbZCSEXSCpeVZqLJTVLGZZfmaihVYJyEZkdtxvdd+JXAjeI6bLjAp7StmJHOuI3KYujrU+9j3LPGDE+wz4V60ZKdQafUUgOWPrcoDGVV+vCSv/HZX2N2YljFL/wIddo2WgqrCgwcsMBWWSwvzUBCOzn0qB4PR/1pgC0Wte+vF8LPdcTa+qK8PXhA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.7; Wed, 11 Mar 2026 01:34:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 01:34:53 +0000
Message-ID: <99af9d88-05a0-4dcd-85f4-9d5fe9ee6744@nvidia.com>
Date: Tue, 10 Mar 2026 18:34:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova: rename drivers to use kebab-case convention
To: Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>
References: <20260310062443.2763230-1-yphbchou0911@gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260310062443.2763230-1-yphbchou0911@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1bc08a-8216-44e1-5f8d-08de7f0e6498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1xFT2hPvf6rTgLIC0O4LKvONIrIbhZKulqvw8eLKXZv8igrvXL3MSYDC0tOr191CQQLkhDYnRsDtk+o0XppZON5Y/2+jdRCoMaAYyquqERE/STmO8FygkjM/9jMEQcR+1JaMv55D3CabCMMLJDOcWgKt8YB0svitb35gMrCwio+TijtooLwCTmJa7nLe/LdpdoJSmJePpVmO5amMuTAc2EdaMgv8QWGC73fO2xhAAQ4gKsBfo5GcSk6PZyFuRRDIoW+hdlu/OS3e8Sy5sQi0G3BIY/h0v5LvanKi1WYB0EHvSNeW4DW6ZUC9thK4beZOzLo0WbOVXGWHTQPdx/vp7jlAPwecNXDLc96YLeLFFYdKjElZVhPxOske3JVHj2je4IRFo/RCauDgnufSk2y43VGb+vBbLHREWkNy73vwRVdtIBUZRaI6O9SaFH3iqGX/QzE8TxHpi0jIsOCJeN8TISmU/XpRfRjJ2XiwuOyD5TSINgmxNHY4blq4vps3jZdjFEc1pObSxg73o0yhEGkSiX9hwrGJV/4fdKeCrVfEYhasjhsgbcFA/cMhQ1ov7oQ1FKlkZdWa28um2kvKDPNocUs3XcpLawEc6c1MroszDRU22J7jazpHb1OK7khDKFqxX45ffMKa7nc7SRpPZ3r6kd4aqfU/ts176FIPuc14u5z/Ue6neMJz2X/1z0WFoVpNmNFXgcWSdAiuDBZFQnyrL5yyDb8MApsmPN0xzC0ekErs6Iaggnqlm8q3Yyxgpty3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTBpYm1iMitjZlZlV01GZ1E2VjdOclcxVk9zUUZHQktBM25MNDJnQmRnZTd0?=
 =?utf-8?B?ditFMXU2L3JkaUpOS2dzVEFIUmlrdlI1RGpCbHZxNk40U09TdWovQ3pYTjlq?=
 =?utf-8?B?WEVLOUM1SWFyWHpNM21mTHBybFlYbU5nMEZWZE9NVDNPTnUvSzd0WHBCZzRT?=
 =?utf-8?B?dmhZWG1GbDJCS0svV0pDNS9raVdCRXNzQUovQkZNd3dhdkFrY1BsT1YwSUx4?=
 =?utf-8?B?Wnp2SG5FTzdEMFA1SDdhRjJZVFh5bnk0c2g1OXhDMUdzM25pUEM0MDNqMEI5?=
 =?utf-8?B?dC90NkpoTkhoWWR4M0tnVXlsQTlYaTB5OVh5RkpyY2ttUld4NHk2YlFWRjJy?=
 =?utf-8?B?L3dLSFhuRGViTVMvWVBvQXhIaE1JTVBaVGpSU1hvcHVicDhFeUw1eTJ3NGdx?=
 =?utf-8?B?eFFST1NWam1JcWx4UTVvQjA0RGVxbUE1TUp4OWFZU2h6QXJKVHdlM3N0YzNR?=
 =?utf-8?B?WFdtNHZRWnowODNVZ2lDQk9OdzRqMjRpZ1pyQ0pZVEt6SUVTNXRacTR5OE5o?=
 =?utf-8?B?RHEyMk5QeGlEM0VTbXk0T3BOZVdpR1V0OGlmRnZTYzBoUjFyTWJEd0pVM2Ri?=
 =?utf-8?B?RThxQ0tTZ2xCSmd3OXUxUHJHbUJ0eUt5b0xwMmJpWU4rYm5vclpleU8xbzdG?=
 =?utf-8?B?WVRWT1VPaCt0RG8vLzJEdHQ3YzZ0MTczWVJMcUJEdVRyNkJiaXUxT3dBTUxj?=
 =?utf-8?B?MXdrOHRqNlhvSmxmR2tZOVlVdHBETStFUm1hcDRIbWU1bEZmYzI4UjlBbnhs?=
 =?utf-8?B?QWpPS2FrbkFtTE1Ga2pKSGZobjdNSlhWVjN2SEFaZkdSOXY1b0wwQzV6aHZx?=
 =?utf-8?B?RUw1UVArTDhNN0haYWc5VlZMVE5PZXU1N2dvYUpRd2tYRm5oTnIxMzUyZTRN?=
 =?utf-8?B?Tlpoa0tZZjNseE1MSVlWVFJlMkM5UHQrUHFXQzd1dTZPYUxPdGxYcWNzSlIx?=
 =?utf-8?B?Rld6YWl6Q1h5NDFWemM2UE04RHlXU3Z5eGg2N0ErM1FnSkdKOEhEejRqMEty?=
 =?utf-8?B?ME90dzI5UkRFNG8ydG5Fd0FSYUpzYjNFRDlLQ2J5L2ZFT2VObU1tNDlqZCtv?=
 =?utf-8?B?b3BlTnZhUXJkVlNadnloUStFMzU5dmlhSE8rWU5vQk9rOHNvT0I0cnh3ODhV?=
 =?utf-8?B?VmQ4UUFMeW1VV2dTZVFZNVNNWmI0UlpXR3gzbHAzMkVtb282RlVzTmNWUWRI?=
 =?utf-8?B?RGsvbkdSbWpzMlc2OG9HVVZUZ3pES0E0Qjk4bDR2N09SK3dMbk1iRkZEeFBv?=
 =?utf-8?B?R3ZKYTkrSk90YWZVbWlxNG1hbzYxclBPQ25uTFN5VEhOOGR4MDZGUU5YUDdN?=
 =?utf-8?B?QWJYQlRybDVlRjl1YThiekZUZTh0MXdxNWdnVys1L2tCTWlUaWwzWm1YbitT?=
 =?utf-8?B?RkR2MFdHNG55REc1SFd3VzhkWVJtU2NUUUxMMmVIVUh6Ri9kNFdJekMzYVlt?=
 =?utf-8?B?dU9iak13ZnkvWVVid0FDcE0ySjJqdjROYncrMDJ5ZzBRd3dRSkV5OVUyMUlR?=
 =?utf-8?B?Q2xHbTFKK1BMKzNqeFlIb1JsTGxRbm8wSTJ0Q2pFRXhsSDhSUUNuOUkwSk1L?=
 =?utf-8?B?Y1lpRkxZVmFhSkM2KzRTSzNkWG8rTy80OWxSQVlHNWt1WFF4ZytJUjU0emhq?=
 =?utf-8?B?bXZhNWxXNUMva3B0T3FnOURPTkdwdEphVmZPQUlJektGUVBrSlNlQ2cyd0FF?=
 =?utf-8?B?UWtTNGtFaGx6WHhKdlJTTW9rRXd3OG8wbzUrWnd4RjdBckwzbDBhQ2R1TUQ0?=
 =?utf-8?B?cGRlR1ViSzd6YkwxY3RqWnNMK2I0V0tyZGY2NjhBV0NjVmF5WEZYRkJsRVF5?=
 =?utf-8?B?N3pYbFpFZ2FaWVRCM2NaQjVscEEwZ2g5ei9QSFF2RmhGek1Yc0JDUHI4aEp0?=
 =?utf-8?B?cUQ4NVlDV25GNDVuT0YrY0pFRkxQclNMbm1HVWNiS3ZtMW5ocUZXN2lVdjRS?=
 =?utf-8?B?M2cxT2l0ZUFrcE1XTllwUFA1ektob0huNHBEbGp0THlQODhZRno5d0JjdWRV?=
 =?utf-8?B?UmV6VVlNSmYzTDd3M0dBS0laNDUzSEtiNGdGTS9KUVlzc1NoT1FJdFVvQXBl?=
 =?utf-8?B?b0loMHVINWhQODN4a2xBbm1DYnBjRll3L3BqZ3pKaXJqZkc1NEZxMFplVml5?=
 =?utf-8?B?cWFRNWpDQ1psWGFua1NzRWV0UFlxQ3VuTjFMZEZ6VkRUcEkrWk5DK2VoNGZW?=
 =?utf-8?B?VW9sNTBhL1dRekJzcGFYQUw5Q24vSVZoNmRzTVJCdGJGZnYxV3gwKzI2bEJ4?=
 =?utf-8?B?NHpPSEFMOVBCMjhPRSt3R2NDaWx3aGRjV3hqc2VXRFFOd0syWC8weG9lTHNs?=
 =?utf-8?B?S1VvRmlrV2RIVndYdlRTNTlITU5KTTNEek9ocUN4TG10aFRkellBQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a1bc08a-8216-44e1-5f8d-08de7f0e6498
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:34:52.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uw1M3LR0bLMa1mesKPQjDf5go5zBgjbdIy1hQywXsZ/0gouny6RIwgZf1/1i9xkAL287Zb3yoSktZmmDjNKJig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
Message-ID-Hash: EUX44GLDASQ6SDSQFTLAEJZSMBND5FBD
X-Message-ID-Hash: EUX44GLDASQ6SDSQFTLAEJZSMBND5FBD
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EUX44GLDASQ6SDSQFTLAEJZSMBND5FBD/>
Archived-At: 
 <https://lore.freedesktop.org/99af9d88-05a0-4dcd-85f4-9d5fe9ee6744@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/9/26 11:24 PM, Cheng-Yang Chou wrote:
> Rename nova-core driver from "NovaCore" to "nova-core" and nova-drm
> driver from "Nova" to "nova-drm" to follow kernel naming conventions
> before these names become UAPI (e.g. exposed via driver_override).
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1228
> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
> ---
>  drivers/gpu/drm/nova/driver.rs     | 4 ++--
>  drivers/gpu/drm/nova/nova.rs       | 2 +-
>  drivers/gpu/nova-core/nova_core.rs | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
> index b1af0a099551..addf70c33cb2 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -32,11 +32,11 @@ pub(crate) struct NovaData {
>      major: 0,
>      minor: 0,
>      patchlevel: 0,
> -    name: c"nova",
> +    name: c"nova-drm",
>      desc: c"Nvidia Graphics",

hmm, as long as we are fooling around with names here, I see that
this should be "NVIDIA Graphics and Compute", really.

Obviously that can be done separately, though.

>  };
>  
> -const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
> +const NOVA_CORE_MODULE_NAME: &CStr = c"nova-core";
>  const AUXILIARY_NAME: &CStr = c"nova-drm";
>  
>  kernel::auxiliary_device_table!(
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> index 8893e58ee0db..1fd454c7e0df 100644
> --- a/drivers/gpu/drm/nova/nova.rs
> +++ b/drivers/gpu/drm/nova/nova.rs
> @@ -10,7 +10,7 @@
>  
>  kernel::module_auxiliary_driver! {
>      type: NovaDriver,
> -    name: "Nova",
> +    name: "nova-drm",

Well, but now it is out of sync with the file name: nova.rs.

You should change both, or neither, I'm thinking.

>      authors: ["Danilo Krummrich"],
>      description: "Nova GPU driver",
>      license: "GPL v2",
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index c1121e7c64c5..90e98380687b 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -22,7 +22,7 @@
>  
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
> -    name: "NovaCore",
> +    name: "nova-core",

This bit looks good.

>      authors: ["Danilo Krummrich"],
>      description: "Nova Core GPU driver",
>      license: "GPL v2",

thanks,
-- 
John Hubbard

