Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A7BEF06FC
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 01:48:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14710E274;
	Mon,  9 Feb 2026 01:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dPmnR5q6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6142041CAA;
	Mon,  9 Feb 2026 01:38:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770601120;
 b=OdJGoxtcO3QtN46ohkxYVuSRbQhMtobKisKss5lYfM6SoL7x1pieoi9aaSW7uUi8j45vS
 QY4/lNTdswN+vOEgL/3nVgiORzL5jNfSoibwZtD9lnUwVcZCDroLnrJHX5pPc88jgThY3SO
 6G8jZUWNz/k7PvC61Hv1mmGNAqbzeZ1I/rJtZnlNp0LzjqtDwu5o+xIRtJRsL0TUIljTc+a
 WC2lLqz8Pm04iQ+xIFOND8Tu6eBSp2G3pwudFKiwQGYdE2TH8rqZYBaZ2fLTfC5ShBjR7Sg
 I+Ctc6kLhB34pprdm7bWqnOsLCzKz2+/SpJnnw/V+3xygrwji/LMmB1imzuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770601120; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VWB/66o+Cn8OPgl1cNDkMapxJcBRyWT0qkypnoRILUQ=;
 b=0GRYeCMehXteOj9+IMOr0ajmf/gJDNPn+c57/0IAht2VsoHLagupbd8QSnoqRwCrwyNp2
 cf/gnEmWP2ZL2xHg5Vtc9uA5BA8f9YfLFy8WyS6LljNjJD0Cyb3+9WvTzwpTYXjj/aIuouS
 iNqBDIlx9ixF1J1ONHVTN3Fai1EaynzQytSetDFC5Unx6FZHY1DL4CU6PC4165X/LpCV4ET
 ZlBr+6iKFPqOqYiNiLgEcXAAb6+5ayHDviJfXg2brfeUvjI2ah2PTUcJ8Hjn0iumu3vsBve
 o4TnuV2d1ufbYxpi5+nZA9odZ3lBThXXhD/qv26zmHr985EbEiwPfCudHRSA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C0420404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 01:38:37 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012046.outbound.protection.outlook.com
 [40.107.200.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8D910E0B1
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 01:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+nkH8iypVhOFiJMiY2WbMZk2Jcb6Z0Qj2MoHQYW0v3l3eLd88+sDN3idO00kXWy1JnjHW3oAE7u8Zqtq+fmUIbSsP61S7YwDtSqa3u18HxN38KerL9aUOp+59ZfcJS8P3azVQFgTJwP7Bd++yLugFmbi7vyJQ1hKnbEgIqWtTt2W5gBw0uNZWY05Q4sDI4DABqR1rauR6f2bRdy0SDXraxXKbkeoA0UJTwEJKfD53tWRdAZOuNJ2LwsYf+gfuk1RZ9DkAlnaDhZDreAbBn8YQIs9oPfHTK0JcKU72orGBlzF6mTLwfMHnSri6CDwUGtf8HzST1x8vB82MtVz4aesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWB/66o+Cn8OPgl1cNDkMapxJcBRyWT0qkypnoRILUQ=;
 b=vdauGvw6qs4qgM6YWk0wLCGCb+RMekPwRnXhnad6N6RTfyzBqdcC7SyD8O4bVQlNR6I4J1aLbu4dWJlG3qhvDJiPulmCHgHBo6+Wh+niac2i7YdTM1RNZTxzPtm2MAVwk/T44Ts74jr6GhiO8SmxnGPH0YwYLTuEhsLeHfK1l/+ELuY6ddTe5SkpQaY+yMkEMoECE6ryTi+6VRNtAdyD5qBoSv1Taq7hZvQ+megU18YYwFdfLasFybMl9Ntwyeg6WGiO1/CIBrgTcO0kIMQQ3SN6wppP5PCuDFQciajhOWC5mhcpacs1vAFvzP67AsJ62BPjZpp2R3dXtnyCi8E8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWB/66o+Cn8OPgl1cNDkMapxJcBRyWT0qkypnoRILUQ=;
 b=dPmnR5q6lQLY5MS4/hQ5fggZw5a6WHzuiyaeMmyHeCY0PygiWOG3xfj9fXn9HyprN4caO93RyQtk4lzqwgB2EnY9drlaxsc1QfpuQVg99FyIeFlFF1cXyUU5fLna3xxyqa4DgTzoeqfIQW1BuZnozFAYlY1vhiG3v7ClQMf0L+cVybeRKiAOatlEJVM+neXeZqAHwsGSkwfRYufX2cF15uLZl7lZxzNG+skpNGWqK9E+5rdXq46zDLn0/Aqxbkg8tBn1VYv1n9kPjgcagaJbIZMLQziXIcW4KH/O/6HWGWhRYiQtsrlr6WktQ8AqNDJ3xKj4FMRaS7oNMCgbSIONGA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF5EBD457EF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::610) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 01:47:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 01:47:59 +0000
Message-ID: <f9b0e77c-342e-4d08-8170-660a6c87b0b4@nvidia.com>
Date: Sun, 8 Feb 2026 17:47:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/30] gpu: nova-core: use GPU Architecture to simplify
 HAL selections
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-6-jhubbard@nvidia.com>
 <358d309f7c600bbbfed1fd702a89a114ea011ea4.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <358d309f7c600bbbfed1fd702a89a114ea011ea4.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd278da-c900-485e-0975-08de677d4126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1FZb2RiR0lxb1BnWE1XN2d4RU5XU29EQ0FlQzB4OWtUMGRGMkhZcy9SblA1?=
 =?utf-8?B?bkJXTUx4ZytOcUtIenNYMG9yTEhlcnpUZ01BdXdWakRRV1F0enZVbzBLaGdP?=
 =?utf-8?B?VWgraXpNdGQrREovMmxJT0pGZzVWWjFtMktUVC8yK2JnZEdGaCtPM2ZXS1BM?=
 =?utf-8?B?UVBvQzVJeUMvT3NPK3dNclYxSGF1Nkk2cldYbzFYYUVtTkduNkVQUEVKRVZ2?=
 =?utf-8?B?aWsyODl4bkZxSzhvMEJHRm9EN09UK0pWWGxkTTE4ZU5ta1grYTd1SkgyQTRa?=
 =?utf-8?B?T2xuZ2R3TmxXdjRvcytiQUx6djhpUjRib0lUR0xHa3ZacnZjRi9iaHh6TnV4?=
 =?utf-8?B?WnA0QVRJTEZXUFRzd3YxbmtPdDZTUmFDZ0VDYWhSRGVoTFVhRnRoNWR6aU1S?=
 =?utf-8?B?UDdmVEtkM0ZhVEg1WGgzaGh4L0tlcUp4S0V2WDNGM2FVdS9yTUxkMGFUUE5x?=
 =?utf-8?B?Q2R0RW9KazM4em0vUFNVbmtKOStSR1RQaVUzc1B0czVFWjU1ZXNSZGRSYzJT?=
 =?utf-8?B?b21LUmJhS01jMFRNSE0waWp1Yld3UlpyNjBPcmplT2RHQzdCQndCSTNwMzhm?=
 =?utf-8?B?czNuZkZ6a2drUFowRDhMWWxvdXJoRm0zWXpNbEYrVm1RSFh0Z2dFbHBpNWpC?=
 =?utf-8?B?UjBPK2JoT0FSRmVXRkJ4bEdqUHlKeEVuU2xSVStmRUZ0dTZRZHVwNjN5WVl5?=
 =?utf-8?B?UUh3T1NMR3A1SnVXWVU0bGtBd3hYOVlJYkQwMTQ3VlBiZ1NlZDlvWFFQeTZv?=
 =?utf-8?B?UjUxVmd3Sk8wYVE0RG8yNk9OL1UwK1hDdG5qOEZVbHI3RHhyUEx1NUFWdzNZ?=
 =?utf-8?B?ZFUxNnIxWG5SRFNxV2R3WHl2TWN0TG8vM1IybkRSUjhKcVpOalF6NzdJaW5w?=
 =?utf-8?B?SjhrZEltclRMSWdJS1lSZUdRMDRjcjVPNFpDMVRrS2JoZG1qVklFUHhRd0M2?=
 =?utf-8?B?OFZRN2JGTUI0V2ErQWpBZGVjbGJFYUlDbEN6S1dNWnlXcTlMbEJncERyZVJO?=
 =?utf-8?B?b05aS1RhUkhYeWc2Q29ERWhsZGJlSzNRZS9HVTh2RUpHVlVqb2k1cVUzalVK?=
 =?utf-8?B?S3VaZ0JYeEVtaFJQNFJheUR6cjZEQ2pSMnhlS1BOTGZPWXJRdk41dDVUUFVC?=
 =?utf-8?B?RlVSc0tyTzdPZzlPYmZBeGtqMWh0ZzJTKy9BUlNZaTZGcVhORGdXNnJMeW03?=
 =?utf-8?B?TXE2SXZkUUVqMm5NaS9iMVVvdUlQYklJVHZsc1JWS1RQVGhkRTFzQzUxUWRj?=
 =?utf-8?B?MGFJUENtdnAvczhkbmVKVDhSVmNHcUUyMGJDVXREbDIzM2ZtTEpZajJWN2xo?=
 =?utf-8?B?UDNuV05KN2ZtR0dyVU91OGJ5MUd5clBuVHd0SEVRRlJvWlVJYU1iYkMybG93?=
 =?utf-8?B?N2NsZ3NXR3ZuSXlqZDZTZ3BxUm5ra2NjWDJZVXdoVUhVR1FNZjdZWis0NnJ3?=
 =?utf-8?B?OVpCU0ZPczFLNnFUQjlGNXA3c3Z2WmFkcG9SelMyY0owWTNtRkI2TVl3aUQy?=
 =?utf-8?B?c0E4QmRWRDlldGZJdVBiL3p3cUkzMlZyVGNSY1V5eDBJbzF3YVZTM0J4ZUFu?=
 =?utf-8?B?TmxLYzMvQmZYZ2NkLzFvaFRlZnA5Y1MzVUpUdzZiNmVzVyt4eWVmM2hnUVBL?=
 =?utf-8?B?NUJvbmUrSmFrOXVyY3AzNzdCQ3NWdVpRNkhiTUJ5UFlMWHN5b3BDRld3SW9o?=
 =?utf-8?B?blcwRHpIMVN2V1M1aGJ0bWlsNTZ5ejlJM1hQNE9jV0VEYlFJdmkrOVE4M25V?=
 =?utf-8?B?aTdIMnlrb1RubXlYbmdqUlVFcENsQVQ0bS94eWc4Q09JTWZITW1HVWkzUUl1?=
 =?utf-8?B?NHJEbXNPZGtiNVA1Vit2YlhlVlFRT0w3Q2xQUGpqMGNHMXcweXhYMndJSGMv?=
 =?utf-8?B?cHBjOTFDTlc0SGJwMDk2VDB0NUtnTW5ad3pHOWFtSmtPRWlHeldRRS82NzlC?=
 =?utf-8?B?MlAvTXZnbWZsMXdkaG44VnZTS2Z3NGZ4SWlKS1k0cVFkcEpzVFNxNWtyelVF?=
 =?utf-8?B?b0MxQ2FIMDIxUGFxL2pTK1VRM245NURycE1nNjNydWtFMTNSNTd2Ry9LRDFN?=
 =?utf-8?B?K0xWNWsyUzJUU0xDcDVNWHVBankxTjlOODdaYWNRRy91am9jT1IxMk1ndUxJ?=
 =?utf-8?Q?pt00=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UEgwS2dSWWJSbUlkSTVqdGM5aDZaL3ZhRkNkQkFzVFN3RzVXbEZMb1pRR3hP?=
 =?utf-8?B?WWxXWGw1bkh2YlN0WU8rZ1JOTytJZkh3ek5rZVQ1RHhpOG9sNlgyREh2OGpu?=
 =?utf-8?B?Q1QrY241dzhrRXF5Zzh1bTNXZWw3QWNqa0hvQVVwV3BjTEorRUhuc0phSEYv?=
 =?utf-8?B?REVxdFdSOUJKNW9RNXExUEVpaERSMUx0NzRqcjBWY3BHZS8vcm9vT0tBc2hq?=
 =?utf-8?B?TS9wSFlvWmZseDdYMWJKYWJwQW13aUhRQ1ZTZS9UQ1BCbWtOemFKV2FLaGVt?=
 =?utf-8?B?OHBpdWptYmpyUDBvaWsvcDFvZmJQZ3ptWW9XdWtKcXdheG4vYkNESDJibWl3?=
 =?utf-8?B?bFh4aVVUbDM1RHdyK3RBKzdVanN6bmJVS01hZy9hc25ZejFPOUQwbnpEeWxJ?=
 =?utf-8?B?N0hjenVqTVNaaFlMSS9JV1lDeVorMVFqSHR1amZIM3BJWWw4ck92aFFhaXJ5?=
 =?utf-8?B?bjRudlQ2R3NPQldQZnZGWVJrMzFhbmpEenU1RGxZZW1pdCtnWHpkRng1RVp6?=
 =?utf-8?B?ejR1VTVwdFJmNzQ1VjhuOUJqOWJHcDJsZERUQmZoMVhBdDdFQ1BKOWMxb2Vo?=
 =?utf-8?B?S0YwbEU0YjczNGhWNzkzVCtwbEhYNWdsbFhxaTFLU01UbWdkNjdpZzg0QjM5?=
 =?utf-8?B?R0J1MXU4WWY4S1hxWDRWeFFHRVplLzg3YVFSV24vZWhKTlVvSS9FMC81bHRo?=
 =?utf-8?B?MDFqRmJjVnJxRHNObUsxTVR0M1YvVkxFcmlmSXA5b1RuMkZ0NDNwQ253a3Iy?=
 =?utf-8?B?bXYyWnp4TGRmTmpNYUU5ai9rdkx4emk0c21zd1JRaHcvVHZBSzVaMElaU2pI?=
 =?utf-8?B?bXMxb0tJdnRWSUJCdVluYU1SM0o2V3dDQ0N3bGdrZlhLOEJJbnVyRHNlbEt0?=
 =?utf-8?B?Q1Rtalp0S0pyUUdITW1ZZWV4OVR4ZTY2NmJtL3IyQ1FzbDRzbXdSRThJN2NY?=
 =?utf-8?B?WFhVSEFndUJ2QmhIK1FJazhyNFhQSE1nZE5zdzZmVUo1VnVGUTJXZHlJMjBs?=
 =?utf-8?B?MUlwekYraFlOWTJUR1BHbTNTbzZrc0h6a244RHRZWWt4L2lwNmhGY21MNVRR?=
 =?utf-8?B?TnpWYjRlcDVWa1FuOU1UQ0FZTWtCRDZsL2RyeVY1M0xhTXg1djNZdHhpbUN0?=
 =?utf-8?B?aFc3dythUG5FWXQ4QW1jeU5YZFBYVWVxSXVqYnpQekhGa3Z2M0dMVTRncDY5?=
 =?utf-8?B?RjlNSFhQNzZ5TnNDcVZXVExoSVBZSXZZNjBhSmlnSXkwMEh0WmZWNXJiNGpq?=
 =?utf-8?B?MDJwTWFzV3lraGpCVTNHVGxFN2VBSkxxSVNRQytVZExTbHFzTGdscSs1OFBo?=
 =?utf-8?B?YUxUbStNRTNFNWczMytWUGVaWE0vaVRGUHhabWVzTHpGS1MzYndQYVBNcmtX?=
 =?utf-8?B?WGRrNDFNY2d3OUdKbHRXMGFWaWpLVURBTS9YclhvOUhmL2syTmFDenRrQ0F1?=
 =?utf-8?B?bEpwTjhjOWFYOFBycFYzSDV1YnhuYVBWYXM3L09MWVBaVHJaejBlc01jVzE2?=
 =?utf-8?B?cm11N3ZIQjh6N2h6ekV5c2MyK0VOWG4wck5KcHBkZlNRZ0tqemtNU1Vwdlcz?=
 =?utf-8?B?TDFOQ2dMdThtTjYvOUlBdzZ0QXE1UjFLN3lwd0VGdE5UUmlUVWtJQ3lkMnlQ?=
 =?utf-8?B?dWdnRitzaGhkb3g4TkpZVUJkMm55K0R6M3l3dnNwR01aTHI0MzUwb3U3MzFP?=
 =?utf-8?B?LzA3R3BTRWhDWWh3NE4xUTRVQlRBN3ZFT1JtS0paVmVIa1lmS0NvSUQ4endG?=
 =?utf-8?B?aGM5N3dBWGlSTUxkOXE1U2gwN0xhbTg0Wlh1NXMrZHdSVU5mWkV2enRqcXFv?=
 =?utf-8?B?V1NPcjdoKzRwdVZLWWp6RVoybUlUd2J5WlloK0N2N3dYU0VsaFdmSVllS0kz?=
 =?utf-8?B?OXZMaVM3S1JPeGtVMlFoTDMza24zM0wvVGg2NlZPcklKZVhhTmE4OHRhVDBz?=
 =?utf-8?B?cit1d2VmSjVYYjRpL2hrbnBDcjlWREJqVy9ER0RML1UrQ1lJa2tuT2hGU3Ax?=
 =?utf-8?B?ZW5kc2l6QmI2RTc0YjZNQ1EzMDUySmtXN2V2RHZXWWVDMUV3UHE3dWlpeVRJ?=
 =?utf-8?B?ZWsxbHNMU2YwZXRnelBZZE9tM3NxZEkzSVVBaW1hSmpSZDdleGxteHh0U2xJ?=
 =?utf-8?B?RzkyeTh5cFQxVmp2QzR4U3lQM3B1MEducDV1K0EyZjlaNWtGYzJETTMzQmdO?=
 =?utf-8?B?K2dmNGtiSHZiZ3hCRU5lUEFLVEg3QWRsVy84aGhvcDBKbHFqeTVYOUFGQXZE?=
 =?utf-8?B?MDFkczJYQlh5bkl3T2hZMEk1V3FYeEhja0xQWXg3dmVFT0E2c1IwaGlvbHdJ?=
 =?utf-8?B?T3c0aTUyQm9oTHkwdmdWdU1raHhyQlZXbWk3R0lVVUg5OG5EZVRZTnJ4QWYx?=
 =?utf-8?Q?J6Y2kMIj13MuphI8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5cd278da-c900-485e-0975-08de677d4126
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 01:47:59.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CtfK7EBjjWhzmfNQ/b7Xz3C1j8f2YEPiOEAeMbbDZ4eahMj9jEOeVT0JnZvYmNUlglhBdvn6MWkqc4WpsoVlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF
Message-ID-Hash: QHMBDVZ5VQRLII4P4OYXHPHSHIZHUCOP
X-Message-ID-Hash: QHMBDVZ5VQRLII4P4OYXHPHSHIZHUCOP
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QHMBDVZ5VQRLII4P4OYXHPHSHIZHUCOP/>
Archived-At: 
 <https://lore.freedesktop.org/f9b0e77c-342e-4d08-8170-660a6c87b0b4@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/6/26 10:02 AM, Timur Tabi wrote:
> On Thu, 2026-02-05 at 20:20 -0800, John Hubbard wrote:
>> +        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles
>> the
>> +        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
> 
> Where did you get this from?  I haven't started looking at GA100 yet, but this is news to me.
> 

 From Open RM:

GA100 returns FRTS size = 0 via kgspGetFrtsSize__0x00000000, while all
other Turing/Ampere/Ada chips use kgspGetFrtsSize_TU102, which returns
1MB.

GA100's kgspPrepareForFwsecFrts is stubbed out. It returns
NV_ERR_NOT_SUPPORTED, vs. the real kgspPrepareForFwsecFrts_TU102 used by
GA102+.

The boot sequence in kernel_gsp_tu102.c guards FWSEC-FRTS with if
(kgspGetFrtsSize_HAL(...) > 0), so GA100 (returning 0) skips it
entirely.

thanks,
-- 
John Hubbard

