Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCFCD778AE
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 18:41:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC0CD10EBB9;
	Fri, 23 Jan 2026 18:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FoHd1W8z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 34CF14053B;
	Fri, 23 Jan 2026 18:32:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769193161;
 b=fbZ2hKR1aDWQTMYzcx8F4ZZ2ZoSoGJcFBHMf2odmf+vVeF6j37Bbn1FX/ebvuzVu4zTaj
 UcyQ9W8KVKrXQqSauKvz+oh7D70bSM3ozAi8xz5Gl5MMJQDezwLPkg3Gts33/dhNWVzub/X
 lWHWYt49mcFyS1/pqsgpM2mLNXh6OdwGcNkYcOe70umsrpm+QehAu2pDulUu+9+FTspgZ6G
 DRsyjUszGKIJA+H1uWcjtCb1ehLdZJ/66ThhMYyDJIT77pfKYLcTCRSV4OQSVqpL4CjZ9h8
 fqBoSm+XkG7ERVnmjFtPMfYGvuHJfjOJL+j3E9gP5AP3NTk3ebJ54K//HI5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769193161; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U9YUFDgrbWGCavEYclTTosd4PoR9ZZA7LBhbCTJCCCI=;
 b=XALI7qXbwV+MlW5GejjCTfeOrHDc8zCB17/xi48Ngddi6TulWzLLXTEJfoP3+lXtPxQ0F
 5lV6vBx1ncR9fvwyy+G2f9etM5zZ/0lf6CYK1ybZ2yRb63QQnwyS/bRwtwyhi+xOsQIa4e5
 TLL+TmgEfpBT3zO6znQt14gDdQrYTZYZudHCRoXMDx4lzAWlkC44711ZQX53sKg/h/rrS7g
 TPfL3fkr9IPT7lSjIOqx9zmkAf54J7Pv29egN1QGtTDW6JM58/oIfPnOKn6yR0UanZ2uq6q
 fdQqiR2p0KCyGx/yi09tfR8uGKZqznlz+qXuOSqtOyHGheDJVZ5gdUZVpb7A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8197B400C5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 18:32:37 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012001.outbound.protection.outlook.com
 [40.107.200.1])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AEC0010EBB5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 18:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvpgSFI1NgcHVWuZs4ImcwBqRdUv/k4ALUIuf1ECUtr0c6sEOIghR+8R3tsJZJHCy95FMAY4Tjk360FDpy4vFj5Pgqfker2jbgsPBzv2fiG1+4ZYOiBfMA5NVOF5SxWOX+wF9xWM0uRY0y9mD9U2MCeexZTkW7wTmchHMfRbnEG9+5A9Ti5JdoVmTCzNCdHox+JhGm7m5FuneqC+u8oNy9/50+mhyOEJBy6rfioBjWLiICiV7nI9karl75imGeEekv4BtRpPjN0f4E/l5VyRUY4LIMEe3VpRQtJhMaazKvD3QH60nBZBnojP2zjueaxTub0Q6tSUBZfh/pzmp+5Fkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9YUFDgrbWGCavEYclTTosd4PoR9ZZA7LBhbCTJCCCI=;
 b=fjMYCCpecjVKqFgzY4Xaq1Ag8PnV4nXUcVT+ElkhgwJZSzH8CnHd2Q1Xu6P2J4E17lmUBJoFz3SXRSnhBmhw3XoaXA+UIhS2jrmRY7o1SbS1dGCwbQS6CAJiqhnakiAM5I2OLrX+HlD44CsGsjJqnkqT44py3Ut4icWsRdrnfpJW86Cima7D2z2pCOQoVKBgIyYMedgBerD1ZUkrQeSEZ4umCuLod1zoYbttPKpvOv12MSYRVldTG066LWkF8/pl9kKAO/mIlRXWpLPxPMRFz7aWI62wA1AQouSCq77SQxdpEVUa9CDt+eS5gxFdgCJMm0JrRs2nd57ydaunJXvxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9YUFDgrbWGCavEYclTTosd4PoR9ZZA7LBhbCTJCCCI=;
 b=FoHd1W8zOh02+2EK2qY+gUyQppXzS1LuvQ2CuDIrb6vhC66g/vXheD3E6q/2//bP00VNf8r6hOvhHGfA5BIUvYRSNw3CLy5yp8G0qSuFgsUw81u8ps9tpD9/jZj5qcl1XwimBIVdeTY6kGpSHxW9rA74kalXLoOjNUA2+ZTkisE4Pfzqij/lWwU4Yz5IEXQfpXv0PIhceyxCz2MO6qx+j2DhC/dsiil7htlhHRv8zcBkzQQ3kJYXHmzI1lwoyp+Y0i3BqRvhBepaj5kApZY4MIhf3OdcaeIH7+9mnh11qgWTcyow0wTqz7RB7K0TlhayXfjBvgqVEIcjCoUe+JDgGA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 18:41:25 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:41:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 11/13] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Topic: [PATCH v8 11/13] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Index: AQHci+7czn0zaoJw00SEO1bgHqNAi7VgEICAgAAHYgA=
Date: Fri, 23 Jan 2026 18:41:24 +0000
Message-ID: <accb58c1792f771b6543af9adb9228b34135302b.camel@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
	 <20260122222848.2555890-12-ttabi@nvidia.com>
	 <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
In-Reply-To: <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|BY5PR12MB4129:EE_
x-ms-office365-filtering-correlation-id: 61986240-eebf-455c-01dc-08de5aaf030b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MzJvdGFKOVpWU3JuWnUrMnVOcXVrbjM0YnZKU2FRL3JOVHpsaHFITVR2Umxx?=
 =?utf-8?B?UjVBVlVmeUowd1p6RDYzdExhOFFDRTVEZmFrVlB1eEoxM2NJWVYyZzM4cVJF?=
 =?utf-8?B?OGZCbHRjTm53VWNzT2txbFlISkxGZkRyUUY5VnhBT09NOVhDWEplck13Z2pL?=
 =?utf-8?B?Q1d2cHpiRUNnVHVpOGZZcGNkcHVSZzZwcTh6aVRDa0RyT0hUb0h3emZzR2xx?=
 =?utf-8?B?YlRoR0hkeWVBbVRyeG1udUQyVVV3cUh5c3pOT2U0VmRsS2FnbnZlZVNlRGYv?=
 =?utf-8?B?WVgyWGRJbEJOM1hXcEdYMXZocW5YOVhNRjV0MXF2THc1N2w2NDJZMG43ZkY5?=
 =?utf-8?B?YXI0L0tkZ3VQaVRlQkpBaVI3ZnFxOWVEVGFBdUJWOFdYc2Q1MVMzeGFsU1ZX?=
 =?utf-8?B?cWF0ZmFyUGx5cHFTY2lXQitiamdGWWlqMktzM3liY01UVnh4aW9TNjZnTXJO?=
 =?utf-8?B?dDdOMWVpN0pYODJDYm91RHhqTzJPcURybFlFRDZyVEJVT0ZtZ3M3WFFhQTU5?=
 =?utf-8?B?cU55VmF5MTNtdWRpeGVTWUZqWTl0Q2JDMUQ3a3pMdWJBQmJFb0FuK0ozL1l6?=
 =?utf-8?B?emY2T1lmeUNGRUZGYkwvWnVaTEJzcG5rc0FSVFV5b0lKUWE5Vk9lV04zRDh4?=
 =?utf-8?B?LzBEaWVmd3ZjbzRiMkF6NUlrQk1iemdycElEcXhYRjBoUzZEVWVYNjJpOVVR?=
 =?utf-8?B?Y3Zha3FyRFdPQ3NzS0UxT3VnZSt4WE94dmZKTE5BUTZXWVppNUVHM1lqS2M1?=
 =?utf-8?B?SThXOW53ajcxMFBLZFFLMG1WeERPbzVMMnFYL3JLT1Z4di8xSXFJR3g5KzBY?=
 =?utf-8?B?K2M2VUwrRWY4bXpnOFJIY01RRkdSMVpMazRPYU1XL2EwNmJ4R1p3bmlqZzQx?=
 =?utf-8?B?bGdQeHhzdmpjd0NLYWNxMFRlaWFSNzdDc0tjWGJST0ZQUjlpd2IwRlFpdUlt?=
 =?utf-8?B?WlNXRzU2cXAwQy92TWJnOVRVSmIzd25vTGFxcFJtU3h3R0hRL1FNd1BBdGNr?=
 =?utf-8?B?bkJ4M1AxUFhqSlBBZFlUU2NTUGkwSjJsQTVORE9qdjBFcVZ1SnY2UDFlMyth?=
 =?utf-8?B?YlVKUk9leVp1M2I0SDNEQWtJUU9ZaDFZRm9SNkQ1cTNsN0ZVN1R3aEFaRUdB?=
 =?utf-8?B?QzNSZEowaUxDSG5iY2krMnY4VVVoR0xGeDNSc1hpYmkwb3pHWWJZc0hFY1E3?=
 =?utf-8?B?OEZCWTVCZ2NvaWZGZXpvY3N3Y2N6YzY3WVZuWmZnVjFwQjVWLzZiMUNhMjNk?=
 =?utf-8?B?WmRlVGFoN2wrczdyRlcrZnRUVDVBK0FtZE1Ua3RzcEdtV1pMV1I4amFSaXQ2?=
 =?utf-8?B?V2EvVUluRlFxdlJ2OTlKMW9FSVBMaWdRTEpQdVdCZ2tydTJ2aXYrSEJzcXls?=
 =?utf-8?B?bnM4UUN4MndRZGxiRXVDNlUyMW9hT1RCaURaVDRWYzBXTlNiaUxseUdxNVFi?=
 =?utf-8?B?WkxjQUQrRzlGMk9ZTEczS21OdUo0eE5HLzk0cm14cTZlT1llc3FkUTVVUXY1?=
 =?utf-8?B?cFc0RVB2QlN5bmdlRUptcWFrRjdjeGFQQ0hBL3FkQmlHNGdjb1dSclh6MFNo?=
 =?utf-8?B?QjI5SE5HcHJtOENlLy9KQnpoTjRaOFhvNzE5ZFVURHQ2UmZpc21nb1RGNWNS?=
 =?utf-8?B?ZUtOM0FyMnlBQ3BJSUcwK2lMbE9zdEJUcW1ka1k3cjZXUUVVT1lZdUh6ODQ5?=
 =?utf-8?B?R3o0c24wazlsM3RqTjlFQ3BGYjFRMlFsSjNKOXZGNDNxSnhUYTh0a05aY1Vl?=
 =?utf-8?B?N1BRbDkwTXpncUtnZ1pBV1RvTDFRM3JKV3FlSlJaakdlVWY4eTc5UFBONjJa?=
 =?utf-8?B?RmVvQnZMb05mWkVNV0hMUTV1Tmt6aHEyVEpyckpQem1jeDFwc0J4eVNralRF?=
 =?utf-8?B?MzhXalFsSVh5Y1Y5c1Zzd1JJTFJON0ZnYks4MU5wUHRIUDNMdnI1ZkJJMXFk?=
 =?utf-8?B?cWdhbFA3UXpiaUtOMHkxMk1HditRdU16L0dIc2dVKzFYVERmTXl5MCszclc1?=
 =?utf-8?B?aUVjN1FYeDhoSi9aa2hydHZnWkc2L1M4YU9PcWFaSm1zVURGaUIrRmRJbmpB?=
 =?utf-8?B?YnllMlJZTkpwYnBGRlMwLy9oZ2hyaDRJQUJXSWhYUnZYdEE0dzRWTHNvSE5a?=
 =?utf-8?B?eGZyQ3VyS2FrbDBwZDRrTXBuUnVtOEJoS1ZzcHNWVVZCUlBpdmFNaFV6M2ZY?=
 =?utf-8?Q?tTkClAPhHLlAWq1mKV+q1Ns=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajdnUEFKZU9PaVFYTjdOUlRZVHZPeUY2KzNGMkxmK2hWdHFOa3I5Qy96S0dV?=
 =?utf-8?B?WC9kVFFOOUpTTW53YVRrMlNQTXE4MlQxZm5PVlUweVdKQkJ6Mys1K2RybmFq?=
 =?utf-8?B?NUx3SUhydUowSXBreEtZOU5mb0xReEgybzRyMXZkNXJLM2d6UlNLMW1YNEdj?=
 =?utf-8?B?RXkvZTFFZkZNdTdBcXZWd1g4UUNqUG9zNk1IcFEyZm1ua294cmZka0tkeVor?=
 =?utf-8?B?ZGc4ZThwNmtZTkx5OTJ5VWQwYjZnMWVnZjVxcTRlRXA1YXZpNXJCRFVlUTI2?=
 =?utf-8?B?aW1Eekg3OG1UcU5OcjVUM1cxeGEvYzZDc3RLUGNxMnZiTDdtbU1mVzVZVTNW?=
 =?utf-8?B?bFk0WE52VW1WSDJaNlBwM2xqdEZ1emZvYTN5YmlaYlNCVTkrbzJRd3h3TkJC?=
 =?utf-8?B?UFBHMWhSL2FJWkJPS3YxdW1iUFVSUXFNSVJmTHY4NW0vY0kzZHp5bGJmazVa?=
 =?utf-8?B?OTB0OW9DdTZUWUk5TU13ZW52NkttTDFUMkhUYnJ6RSt3WUpRVnBuMjc4bnJS?=
 =?utf-8?B?WnFyRG5JN0Z1RTlZSWJLQ3VOSG50L2VyZzJlVitIQTZ4L1I4ay9NRUI3cU1a?=
 =?utf-8?B?Q0V6ZDlQdjBGQzhGNG8rZXBFWnVuTko5cTJEYW4rNmxYWlV6TEtTdWM3dTdq?=
 =?utf-8?B?M2JENDdYS1NLQVJTRUtvSGpJSnRLV2ljTzlLMktOeG1FUFBSUHpuS0dHUWdV?=
 =?utf-8?B?U2lndjdvckJ4UGpiaG9Ya3AxZGxZTTdzSEszZzMvb2d6WHk1U2V0akJYaUc1?=
 =?utf-8?B?RnRzUFExditqbDcvTThDZmIyODJBcDhhcHV0ZU9aNi94dCtUWjVVV2IzR2Zh?=
 =?utf-8?B?OFFmZmp4NlJjVksvQXBqTUJ0QmgrVGU4MldIcHZIb29vZzFvVXBMY1JSR29J?=
 =?utf-8?B?NXlsK1N3RzFNMGdMNlZ5ZC9PZ0hIV21UVVFnNGpDTUI2Ry9qb2xPcGQ2aTMx?=
 =?utf-8?B?azVOUTd1Q0JSQUdNU2hvSVNIWTVwZ0tkc05HamhuaUxrYVN1aTBKa1grZGh4?=
 =?utf-8?B?ZCsyWk5ybVp1ZDlGZG1EWng4emtoZTNUaWEwUC9XMVQzYmpZaHZNWERKZkxk?=
 =?utf-8?B?c3NiTCtERFBrcUtUdDdxYXE1VFJHaHBDemtzYlE0YjQ5bFlHcUlGdVdQc1ky?=
 =?utf-8?B?TktiMWNycmdLaTNSQm40eERzaFZacnhDOWpybEhrMm5NVUxIUEF1VU55dTVl?=
 =?utf-8?B?Rk9LMjh3VnZGZDVuUjdOR0ZyaERpak5iQnpITXZ1YUJ5b1RLZFlhL2RwK3Iz?=
 =?utf-8?B?MUhaeTJwYUM2M2t4eWUvdDhmbENVVnB0bEVQVWg5MjRvbHYvaFVxUTFRcXVk?=
 =?utf-8?B?VHFwWGJSWWRKd0tySWZRdzBJQkJMYnFrMHBzSlBEdlhYU3NCaGlXUE9Cb294?=
 =?utf-8?B?ellDWUNpMUdIZU83OWNydTRHc2VCMHpBRTVZQWFFWEpCYThSVG50czZyNVFa?=
 =?utf-8?B?ZzYwTFZlcWcva0F4RmFyOGlLbSt1UTcyaHlNMVBWM1g1YktRWG5haldlT1NS?=
 =?utf-8?B?cjNUYURDUFZQTE4wUUtyOG9EOUszUTUwQ2V4NjdlclBJSXdLL201aHBPVFpG?=
 =?utf-8?B?U0dGM2hVb2ZUcGE2R24wcVFwMnpTVkhCaXlBWXlOTTFkWVRrRUFYMEZWeFBL?=
 =?utf-8?B?NFl3Z1RKSC9SNnlYQk5ZS1VZZTUzbzJ2ZG5yTkFuMEtVTGNRWXJlSk1SVzZ3?=
 =?utf-8?B?YXBaNlVrOUcwaktiQ1hWMW5jSGhPMGY3SWd5OXVyMUdsZ0FlZnNPVWxpa2M1?=
 =?utf-8?B?TkwzNjArWDdLZ2swVStQQ0x2KzBaSHhMancyWlZZclR5YkRtcTk1dm41MUJo?=
 =?utf-8?B?bkliTWFsU09XbVlQUDJHYWVlKzZvaU1IZ3ZWYTJjMk5XRzdDUmFFejRNMTUr?=
 =?utf-8?B?SWtocXRvbUZTNmU2VUhBUDVDMEtZVzFoOUVUZGJIaGVWUXZQdUk5WE9iQldp?=
 =?utf-8?B?d3N1L2drMDgwMGM2M1FjSFJiZ3QrU2hYUStkc0l6VU1TT3ZIMko2V1ZkMzlS?=
 =?utf-8?B?RkxQNmMzMGN2NWFRSFEwZDg5Y1Z5NzE4NVBMVllhdTJSRndEcGRjbm9LbE1I?=
 =?utf-8?B?ZjNPUWxpTnNNZ3liZnNSblNHWSszV3g5YzJuaUE4VTFNQkZPbjIva1ZHaVFF?=
 =?utf-8?B?cFVzVFUxNlE1TjZKZTkwU1FQVG1CTkFKbFR4eGRXTXBQWngyTlJyNDEvVmVM?=
 =?utf-8?B?NFo3elFJR2MrYkhCcDUwTEJWcVlPTVJoN1MyQ1BmQk9CUEJKWXJCemNQVVcr?=
 =?utf-8?B?elFLKy9wWUhwekZXMEF5aGZEaGtxN0haQnFzNXJkNTNoNmdTZWQvU3FHRmRn?=
 =?utf-8?B?ei8rU3dVQTdQckNka1hwN2RSeUNIM0V3SFlIOS8zV3NnQVYyTDFjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F05A2A357AEB441AC248F570275FD4A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61986240-eebf-455c-01dc-08de5aaf030b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 18:41:24.9714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 LBYGTQqWrdYITCdlEcJf34hPppwYPOBq0gjXf4Zvv51ZRVY/PWfry27rENySE8f76YYQ4exs/ux5DY9q826fwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
Message-ID-Hash: YQTK3T4YKTNNG65YPCF7S4CHDWGSGICA
X-Message-ID-Hash: YQTK3T4YKTNNG65YPCF7S4CHDWGSGICA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YQTK3T4YKTNNG65YPCF7S4CHDWGSGICA/>
Archived-At: 
 <https://lore.freedesktop.org/accb58c1792f771b6543af9adb9228b34135302b.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI2LTAxLTIzIGF0IDE4OjE0ICswMDAwLCBHYXJ5IEd1byB3cm90ZToNCj4gDQo+
ID4gKy8vLyBPbiBUdXJpbmcgYW5kIEdBMTAwLCB0aGUgZW50cmllcyBpbiB0aGUgYExpYm9zTWVt
b3J5UmVnaW9uSW5pdEFyZ3VtZW50YA0KPiA+ICsvLy8gbXVzdCBhbGwgYmUgYSBtdWx0aXBsZSBv
ZiBHU1BfUEFHRV9TSVpFIGluIHNpemUsIHNvIGFkZCBwYWRkaW5nIHRvIGZvcmNlIGl0DQo+ID4g
Ky8vLyB0byB0aGF0IHNpemUuDQo+ID4gKyNbcmVwcihDKV0NCj4gPiArcHViKGNyYXRlKSBzdHJ1
Y3QgR3NwQXJndW1lbnRzQWxpZ25lZCB7DQo+IA0KPiBIaSBUaW1pciwNCg0KVGltdXINCg0KPiBU
aGlzIGlzIG5vdCAiYWxpZ25lZCIgdG8gR1NQX1BBR0VfU0laRSwgYnV0IHJhdGhlciBqdXN0ICJw
YWRkZWQiIHRvDQo+IEdTUF9QQUdFX1NJWkUsIHNvIGNhbGxpbmcgaXQgYEdzcEFyZ3VtZW50c0Fs
aWduZWRgIHdvdWxkIGJlIGEgbWlzbm9tZXIuDQo+IA0KPiBgR3NwQXJndW1lbnRzUGFkZGVkYCwg
cGVyaGFwcz8NCg0KV2VsbCwgdGhpcyBpcyBBbGV4J3MgcGF0Y2gsIHNvIGlmIGhlIHdhbnRzIHRv
IHJlbmFtZSBpdCBpZi93aGVuIGhlIHB1bGxzIGl0IGluLCB0aGF0J3MgdXAgdG8gaGltLiANClRo
aXMgaXMgYWxyZWFkeSB2OCwgSSdtIG5vdCBrZWVuIG9uIGFueSBtb3JlIGJpa2Ugc2hlZGRpbmcu
DQoNCg==
