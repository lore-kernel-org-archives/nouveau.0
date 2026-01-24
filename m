Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04222D778BF
	for <nouveau@archiver.kernel.org>; Sat, 24 Jan 2026 01:10:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 172C710EC1B;
	Sat, 24 Jan 2026 01:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KzFn0Go0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E150A40490;
	Sat, 24 Jan 2026 01:01:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769216511;
 b=m1hFKAD92iiAjH9ZHWMcmoZ7gwvGGhlBG1jLnsjCpX5n+CuVlHZ3vEK7LFn+5Jq4EY3B0
 8/vhHj4pymKS49LYjwPqKdG0vm6w3NJ9mndVrFKLZe77acI1KxJiXBJ0bxnp6jrh2yx/vQs
 60Zn1C1m3Mg5/68oiKfUIWrpydFPZIpfbCCSmSDGCCQ3YP3FeDeEiSjSLyA3GydLPH3KJyI
 Vx0n7Vj9yD4cPB8PGkRQnjQ4yGdQlXH4RTXq/190wJjgszqwZtFkpmFnDADlKvtmB22Le3I
 GF2uWroxvSnzILj+w7Z61m99jbzLlMz5tK3b8S0MuHnsNaNBiGDXC92dXcCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769216511; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7npyZ8WIe/1thn5EOb4TiEqgcyLJYRrbZ7hkF3CfHGA=;
 b=EcxnK//IsSzOyW3xGrhmXXFrx0FG8mGNY9TQ5bWylKyDXFjCp4KwcXnC+i55jjTXhpr5Y
 pqL6WET0uPThtWEn+ZlQjGPpNqBg6MRA5GaJrezAMPl+yBMAicyHvlkNEhmlE1QUmSlbk/h
 zaz350ZRaOufG8WrKToPUJypvtjD+xPfkIvPAdebaBze7e7e2iT5xX/WnMYoG8RldX5gyW/
 417Am9V9hvaS4B1q2hfx/Hm75nxuZxiyr1vyXnxOLxKt+5Utvb/JNpHyNDOtEKWRaUi/1QZ
 vuu8j6t/4ba7hhJRW7yuXP3kajVVrwrlz24bZugAJ4DqY8FjbMlpqZzL7Qyg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A44C64031A
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 01:01:48 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012024.outbound.protection.outlook.com
 [40.107.200.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81B6F10EC17
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 01:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGuRNUftVll0DKVdZhMzkBbg/ufzTU1uiLZdiQHhPq4LGlS7bm/GWhHjaYrmDqgC1cshgL2bv6PgB/1IPm6ya1jJciwnBMW73B946RB3X/l42hWe4JxGVIrT7rH5BxA5+e89MYqVXtZbOxCuHS426lkGVgTqo53ai79aR3IYTmGnY52qqzvEiJ0YQrUUvXjoupH4n/Qzn9/zgWYww/YtQpHOZvdKnXeN2/fvgW3D5bf+70SLPYUUnpaJEhV6FlJT+5wJwA/hozO/r3R2Qs4i2xxpfx0efKJZco+8JsQ6i4z3CJZZWUWRWqGoxlxjflNqZ9ZF4ccs+CKL0sg5zCIAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7npyZ8WIe/1thn5EOb4TiEqgcyLJYRrbZ7hkF3CfHGA=;
 b=RHuUF5MDa6+eQGkna4Wu2s5DdlS1lv5hkJ+jrfAipGLCqTuuJ9Hy0V5uBhNXcMqXVwBTqt8PDUWIHWahtmVlWtW8DTN+h27mGpRHaaRT+8PrJBX5wimu/SGQICXGU5LGxW2xVMLRAfNUnu/xwXy1qHp86AYj9sqFFKNcUQCIvca0pDle5m7HMSdnnk6VqG3gorNfDOXyJcmquB2RZq2V3g6Ji63aHvlHCv7W6pe5eM0o8CXpYHIp0JFPqI6z5tlqPO39kY3Ks/BLxlHV0vpeUdgEXsTE9H+Gg+oaijOW2X99Me9ZWzYqp5KItnpjrbJ83Mee3neBa9CZzm9SJV/yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7npyZ8WIe/1thn5EOb4TiEqgcyLJYRrbZ7hkF3CfHGA=;
 b=KzFn0Go0Q134ni2VrmqsCvxwXi+jkR4diae2lIUJU6Pek+r0Y+qHQGbsjcwKIu3LebGmEciUwi5B4s80qlIAoru+9TEGs9YIjucEDmEllA5nPnfYG1reVi6LrM5sLu40crUbSzJDSoERcIr9nPORgyNfmxcltV9s8Yp3rZ7MPexIbn71i4C7vBHKbBnQ5WDwK9uSP8ii++GOLhY1JjG9eK+8dncy4NNFv8dxMs92V5x26MwmZvIaLL7GlsFSgebQiLU9CyKeHgFUhX9yLas4uIFm2I1uO8iZuQKqNPSfAM6WvOarqALm7HG+REfJwDCiVFdXHGYyKTApy9d8jDopDw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Sat, 24 Jan 2026 01:10:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 01:10:36 +0000
Message-ID: <4c5ca917-1ee5-4e2f-816a-25e77e842af8@nvidia.com>
Date: Fri, 23 Jan 2026 17:10:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-29-jhubbard@nvidia.com>
 <DFUEKCHQISZL.GIHM3SA9PAZN@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUEKCHQISZL.GIHM3SA9PAZN@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: cad42267-026c-40ef-ea8d-08de5ae561af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVA4SjR2ZVcrTWhXMDhmUnprVmgwTStYOUZ3WnRTTkRWQStyZlFwbmUzV3kv?=
 =?utf-8?B?ZGRFYk5oWmQ4QUpqU1pkeFh4ZVoyQXdjNURJaWhXdnpWemkxUXp1RTRRdFp1?=
 =?utf-8?B?Z1hvc1hiS1A0QzhHOHJNbFVkMjhvMGhoams5UjBvSlFjSnIrcVNhS2M0NHlT?=
 =?utf-8?B?cVdlOG5HbndPMUlQcW9TVVpiMC9LZmpSbEphbHJIbGZhejJmMzdlakUvNkJ4?=
 =?utf-8?B?N1hhdU0xMzY4bzFIdHhBbnRJb082RURpVENuMGdydjllYmZOSUxIQVRIaVRX?=
 =?utf-8?B?KzhBN3pYOERoRStLNG0zWTJ0YlB1M1RPd1hMc1BFeHBsVUdjbUVDK09lVXVj?=
 =?utf-8?B?cVEvMjEzMTBXVUszMWdkakNhVkxlUy85RVkyZmh0dmNMNTJzZTdpZWFYSXRa?=
 =?utf-8?B?U3M1Zm1nUGl1U0dKSkd1Nk5LenVLUmFEcWNOL2xubG9NaTJZK29yNW9EVEFn?=
 =?utf-8?B?dlNJSUVjTjBNWU93dmJidHlESmxWKytqdGJSbUJPWVEvbjBZQ3dSTDhZa3Fo?=
 =?utf-8?B?dm43bVpvMXlGbEh6QkdjM1dzUnAxTmY1RUd5azBhcytuUnlrNWE4K0Y4Rno2?=
 =?utf-8?B?Y1hnNzVHbWo0SldJd1hYVXJKMHZFZ2wxUDlLZmR0bW85TVY4YytWT0NtUm4w?=
 =?utf-8?B?N1o0Y3RtZDhoYTdrRStGeklZYnFRanFUTFhyN0FMVzl1eVRZeW5NL0JuM016?=
 =?utf-8?B?OHhKbkoxTVJVcU4ycFBBblltQlBjYUlBSGhjK1BKRTgwYXBzaTEyd1lPSHJ6?=
 =?utf-8?B?UEptc2syOEVPTzVFWS9NazRmYTJZTTJLQUsveDlmQWx3U1FvY0NjU3JZRWV6?=
 =?utf-8?B?YjBPVGRhbkpZTThRNmwwcmRXeGphY01CdzNNaDNFQ3RyMUVVT2pYZllsNXJS?=
 =?utf-8?B?SGlpWWt5REVVZ285L1J2VjFlai9Vb2FkKzgwWTA1Q3dBOXZ2a3lsWHF5WEdn?=
 =?utf-8?B?bWpTMUJ4Q2xLYStPRVdHQmpFR1MwTVZwUTJmSjB6cjEvR3pRdlBIVXhuUE8z?=
 =?utf-8?B?WkFFdHloNE9DWWsyOTBDZU9vTUVZbnl4cWVNRWkwU2ZkRWFGZVliNkloeVEv?=
 =?utf-8?B?Tk9WRXdvWjh3NGtrNmh4ME5HQU5CTUNFSmN2RFdkSnAyZ05TVVcxcHBSNDZt?=
 =?utf-8?B?Nkw2MTBPV09Rcy9tUXlZeGpwKzlTV0JhSjY0cXpPOTQvZzM0a2pTNjhnNjd5?=
 =?utf-8?B?ZEMyZ04zQmN2dUFwUDFsQ1lOZW9Nd1ZTS1J4UXhmalppMEt0ZmlVKzlic2p4?=
 =?utf-8?B?anRZank1ZlB5VHlEd3RXWS9EK2tMUjMvNjF4UFdTbDlIS2FvWWlQMVY2NXN4?=
 =?utf-8?B?SlhwWXlOVjExOWxrZy9vcHhwN0M3b2Y2TDBjUHVXem1xeFhkY200aXlXT1Vj?=
 =?utf-8?B?QzQ3OHlmSDg1c3hHb1IvTzBKdk5xcU5yUXVoemE0QjM3VVc2REkxS2ZZUG5K?=
 =?utf-8?B?emlvYTJ4V3BnaU1FRWxlVmx2OXZZQjhnaWJvblFiWWtwMHpNTXVXUHpyaEJo?=
 =?utf-8?B?eGZTdm9MNko2RnU5K0NQK25XRmZBYTZSRVp6YmlXM2FqUHdCZ01Sd0VBWHVO?=
 =?utf-8?B?ZDd3T3NOanFGQVBnY01WMTRMemJFcjByai8vTDlUdTZ1SFgyTEhPSnUzelIx?=
 =?utf-8?B?N1h6cWsxZlpDOHBiOVlMYk5Bem81dXEwcHhpNXFPaW1xRVczanFpc3h5UzFQ?=
 =?utf-8?B?d3Fwd2J2d3VUbDJhZnNCTVZEb09VTnJmRlM3Z09nVzV5b3hzTWZsVVM3QnZk?=
 =?utf-8?B?QllOaDcvNm80dXVUN1ZMbkxjaGdMZGh3Q1lFSjBHU3Yyc2EvcTVkblpOOGoy?=
 =?utf-8?B?VlRZZ1VWbDlnZ21pek83UTBJYUlWSmJzNDZ1d2RBVjNhT3ZxNjFJTU5tdDJz?=
 =?utf-8?B?Vll6cDU2RkIyT0hkZzVlOTFybWpwcVlvWjZpVG01UU40dmp4Ym5NcjEwVXB2?=
 =?utf-8?B?RDByRU9IdzNWU1l0VGJLL3I3dE9hOU9tWkQ2YTh6TkhReER4S25nYTZnQWR2?=
 =?utf-8?B?NVBiSVY0Ny9qUDJpalFuOWJ6RHhJc00zT1AwUlNIL2xCYVdpZE50anM2UTFM?=
 =?utf-8?B?TXRST3ZIdFk0YmxNTk1oOW5ERWhHUkRkTDNySW96dFo5bFZFMmRVRWszSVdJ?=
 =?utf-8?Q?ql5A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGM3bGd6L0dyclJhYklKQWJBOVhObWtzcjUvNEsrcVJiMFdJNkd2ZzVWMnV2?=
 =?utf-8?B?enc1Sk14Mkx6Z1lpZUtiTEovL3FyTE8vYVNzdVg5Z3NXTjh6cmpKQVVHRWZa?=
 =?utf-8?B?Vnc4WEtyYXFLdDFEOXpWQk9QbEdzSHh0SmNTdURiWXdHNkgrTnZ2OEhtR3FO?=
 =?utf-8?B?MEtLaG95N0dTcWVnc2Vlb1hVS1YxdDdNRE4xc0R6UlpPVk9GTTFBWS80NE4x?=
 =?utf-8?B?R0h4MzVOcDNRWkt6OFErR0dCZmRsQTZIUEhSQm02VUVQL1Q3Y2tQdXNOdGYz?=
 =?utf-8?B?bGN6blJac3dyWUpHRnRjYVVwNDlKS0MwZ0tDb2c1elBFL0hjTFhDM2R3Qi95?=
 =?utf-8?B?eDJqY1FaRExCZTZ5NXgxS0pxMm8zZU5yNDdlMkw3RERTamlTc2VVUkgwKy84?=
 =?utf-8?B?d2xoNzlvbkVweGRHdnB6eXUrdU9Pa1FzN3lMYjFlcFBVM3pGVzJXVkxRYWYw?=
 =?utf-8?B?MXkzVWxscG5nRk5BdjZ1cStmdzQ5M0t4bzgzR0NHdHBJOStOemxDQStseUNx?=
 =?utf-8?B?c3MrOXlxakY0RHhra1pNRThMT29xdHc0UCtmblhZZWVKMUZNVWNlWjR1dFlx?=
 =?utf-8?B?eVhhK3lJeG9ackVRUHl2bWxRbUQzbmNEdWpVQUhDZ280OW1QTFpreldPc2pS?=
 =?utf-8?B?MmJ0eW1GK29zSnJRbWRaRFBLZ2dCWENZTjd4cnVDV2RIcGtuc3huYXZrU29S?=
 =?utf-8?B?WGlQSjYyMC9mNVgyVmxiczhybVZBa3diektJQzBtYkVhQkVLMnJ5VlFzQTU4?=
 =?utf-8?B?VU14OFNMWXFobFk2MXo1eEZDbEpzc3o0UTNxWXNzV3c1R3JMSTF4Y1ZVcTk1?=
 =?utf-8?B?MWtQV2FjNDhBc2hrZWZHT0NXbk1qMi9iWk5yS3AwQThNNk1DRHlSb2NFWXZT?=
 =?utf-8?B?VjhrbFBheEdCaFkxb05ZN3Z4WUNQam9vSERwSEpGYmNoeWpYTXY4ek4rMHgy?=
 =?utf-8?B?QlRRZXp6b1VlOEludGZYOTBYN0VvbEhreDI3RnZNV1o0dGhSdkRiaVZMN0Ex?=
 =?utf-8?B?aUYxTW5IaC9RV0pWN2hKakJGODVHQ0EyNVRXcXZUeE9Wc0NrUEM4akVnNHdB?=
 =?utf-8?B?ZjFJYXc3K0ZKU1BGZ09KWTNhQmhPNFl1U3dtWlMzeVY0emk2cml3dUM3RjJ3?=
 =?utf-8?B?UC9qbnBmaFJNam0rT1JuZk5mRkhHTkRzVzlBM1VSQ3FhdU9TL0EzZVJWdWln?=
 =?utf-8?B?bjljR3lXREJnemtQUUVDa3dzMXV4Z1RCa0h6RG5YNndUY3ZzQjdFU2QwWklQ?=
 =?utf-8?B?L3dnUmt6OUJUMUpmT0tvemJxWWs0eGdzczhKY0V5eUowMzNQMTRINlkrR2x5?=
 =?utf-8?B?RHAxa2grUUpzUkRaTUw2MVNkMEVhY0tBbjRYYTVwTlhJN09CTjZaR0oyUHlU?=
 =?utf-8?B?ZWdqaVVvMlZJSWRsbnVBd0lWb29NYXhPV20yaTJQdHU3cmpSdkJVSWRENUVt?=
 =?utf-8?B?Z2tmcmtrZFFmWDd6TUJjSmlocHprNGNGRDNTSzJNNi9FV2orVC9uR2pDVHlu?=
 =?utf-8?B?K2FoMGJhQ3hFbnZYRUdxalpQSEVNNHBpcS9td1U3ZjVjSTNzaUcrSHpscE1F?=
 =?utf-8?B?eW53V1F3SzRYUkREaWNVaHFEV1Y2UDlQckUxbU5nWE8rUzZTcUMrSnJHNjBG?=
 =?utf-8?B?dnJ3S0diQmN3WUdwNVdkZHpBUmZhTWUzQ1JVdDdNbStlc0o1UjNwUkk3QUwx?=
 =?utf-8?B?cEM5MExLeDl6WVVoWm55RnpGV3NqcGQvaVJlMjVIbjQ3RkYrZCtMd2tjKzNF?=
 =?utf-8?B?bnp3OW9CN2dtREx5S0pLcUdBV1V4M0ZyL2ZTVU4rZEVoU2pONFp0NHZkdWZM?=
 =?utf-8?B?TVNVcTIrTG5tK2phZHk4ZktTVGh1RFBPTGhadGI3Rk5HUDBmZ25Ld0RhOWNr?=
 =?utf-8?B?aWlRanpEeitTQWVSa0R0c0NCT0hBWU1VYW93bzI1b3lBSkJjY0hzN1B3SnB6?=
 =?utf-8?B?dWRXMDZFZE5FTW5WemEzN3ZUeENCTmh5VHBod0xmMFB1YWMzVlkyTEV4VFJK?=
 =?utf-8?B?OU9YY0JqRnFyeGFSczR1U05YNmFRUUkzd09ySUlSYUltYXdLRkNFai9nVDY1?=
 =?utf-8?B?emd4YnlBeWJYNjkzQ3FITjd0clhKRTAvejQxL2VXNEpzbUFTWFhETUwrWFNM?=
 =?utf-8?B?Ui9RRXpZeDFFK1ZUOHI0RXJnMU80T05GN3dIUzZjSUFLV3VqOEVzOUNMTXox?=
 =?utf-8?B?c29CZUxCL3pzSXdoS0MvejRtTmttSzRUU0xpMlhFUmdrL1ZyVTJ6UEwxYUNq?=
 =?utf-8?B?TXFaS2k5ZVRyTUVmY01UdjVNbHV2Z05zOGRwTEdQYTFDdlZyUjl5dXJJcFhE?=
 =?utf-8?B?NWFkVnRreGVzTVdOTWFLUVowYVB1S0QxUUlPQlZtYVdUb3dtcXk0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cad42267-026c-40ef-ea8d-08de5ae561af
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:10:36.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RYIKetQZptcmDur5nMbIpzrMWnERmeUUcsdT1tHQb3S9tLBUtDn6Rt9RRJF37MrMDvnmurv+ld3XqkH4aWftzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349
Message-ID-Hash: V6S7BWQNOSRB77VHJEFA76CVFJFR5TU6
X-Message-ID-Hash: V6S7BWQNOSRB77VHJEFA76CVFJFR5TU6
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V6S7BWQNOSRB77VHJEFA76CVFJFR5TU6/>
Archived-At: 
 <https://lore.freedesktop.org/4c5ca917-1ee5-4e2f-816a-25e77e842af8@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/21/26 8:20 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>> +        read_poll_timeout(
>> +            || {
>> +                let released = Self::gsp_lockdown_released(
>> +                    dev,
>> +                    gsp_falcon,
>> +                    bar,
>> +                    fmc_boot_params_addr,
>> +                    &mut mbox0,
>> +                );
>> +
>> +                Ok((released, mbox0))
>> +            },
>> +            |(released, _)| *released,
>> +            Delta::ZERO,
>> +            Delta::from_millis(4000),
>> +        )
>> +        .inspect_err(|_| {
>> +            dev_err!(dev, "GSP lockdown release timeout\n");
>> +        })
> 
> Once you're done with the error, please just return early with `?` and not keep
> chaining.

Done.

thanks,
-- 
John Hubbard

