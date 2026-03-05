Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50170F47CCE
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 20:49:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27C3010EC7F;
	Thu,  5 Mar 2026 20:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wgivx2Fq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C89F44EF4;
	Thu,  5 Mar 2026 20:39:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772743163;
 b=wh2spV49ZrIZHTkVbO8f/kNtqgzN8a/uNkJoqfplm77q2bpB/kzAN2OAJkyXRDcmVJ0JG
 +3OsBXwIhaVEqnwfHzPIrn+u/nFBGrHqTnhERWGVIShNNB+wS7Ze6N6RaKU8wT8kwoKfByC
 KOqifgdsziCayXE17zm7SwY1bMn8LvI75+8GQ/1QI2mzkKsPQg2xAF51yVP+GqAh7b34Hnl
 yDdkI0gnrIYOZ/quXHOwpTWmEtwqhEv6JbCvwUrUnABQcFrud+hME/h61jOo2kGDJpy4uYM
 dBBlHxsdHcvNzid4oIRBiVRKxqNDp6BmVB9EPcmkrmnhffYU7QRAOLPUaE7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772743163; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V1TIXzUXU0/1uMn8LmkxDnjs8fc4+qD4iSHq8sId/eQ=;
 b=cTQjDZSKZpIMYc1A5Ytdz3u8Xoae5bUeiFlao02GHZFMVg/QxGU5pl+ohIuDQZy/xqNs6
 w4wjvMuUQ5mqvJnmtQ1/Zj5HlPvXKNG3wsRNQPtPobhl0JckRrB8moP1aXzm/J1HLnnNu3m
 qRzyyVC5x+MWBm8B2XeSvif6qePkSTHydfvLXEeKYeE7r0UCURNuTuS63/T+5YoGzoe6kL9
 tFw9V1QSzr43x9HxNT6UOFb0YhfssExA3pCVc8CyNUt5Usgqdkq/Xjur+cMe1KaJccnHzuK
 T0SAJqJVGsXz+JAcUO9F35owtIA3az8iK0XWFBif/aw7j2yVFyfnoIK3or0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8C1104349C
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 20:39:20 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 290BF892AA;
	Thu,  5 Mar 2026 20:49:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr1aHfWm8idWtY7WQX5XSZzGDMlP4WEeernl5G49pcLMDPz/D58AOpfiTujndgEnN88tg+8d/Mlnwd+7ElsauKd3q5fIqKts2B7wGomrePus3n5l36YgqBbGYrZbe16J2oSlLtN8H5kAbG28b42rlcoonh80ccrKzbKXbA2/PY5BqOxl0Y88IlF2cmmG3h/deTh4BNjztcnRVFchVH680zSgyHKwzblGjUhk69lEFBv08gmnI4cyFoMbX18qALvu7scbHzhz2vbeB5ZgiijctXLHZyMOD0gy5IYUppRJmftqE+ZPGNmZMlz2Gnsw0aMx2WtFxTFXWxYYdymOoFmIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1TIXzUXU0/1uMn8LmkxDnjs8fc4+qD4iSHq8sId/eQ=;
 b=LnD6Jg/awyYrPIrjjK9IR9jByFsMu2UFW38V/0GptNpEvDgQyXSLQ5D8oGKOzRMPDNAgeXpTdOWb3ZAFmQoYZBunxpm/FSePi+NX71HfFUT3XXjAIxcUgMK29g0Ko9MdlTDj2W6loZIcB5ro/C1hHPJ5awk+6f9f88uA0/ypSL2MGloClCdCREyEX/nWwvMXGzHtzmb+jrF/zqLYRWl6HXOhk3w+5dwniKq75JRp83AiyMk1t4bzDe8qXPG1qM/gISwKnfEepAk0iUyj7U2IClnBxFoN+SmHV7MdZnHf8F63+vDed8j29lQFLIdyjEcqh21oN5mQH7fUJkWJ7tqtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1TIXzUXU0/1uMn8LmkxDnjs8fc4+qD4iSHq8sId/eQ=;
 b=Wgivx2Fq4abQ9xeYg1DFCCKy7CGe8eIbEgrDTd8WRCqBVO9USE3OhhGFydq/Yul6KeDkLGEcdSbN0MDr9dLorh1bLBzoPdyjbft43CjGWXw8AG3tHDBgwg0e8MgmhxfqrfKRjjMBa/YR01m8uQ6rIwspNcgJpjROLl8/eCpFVISV7r+GRK8XYfygw2HVa+kTBxe/3RKfsEIh+MNeQLlipS9UZQ4BMee+AqPial/joK5XYEb//VxiRSNAEu9NQDXJBA9hAk6ZV9CZX7X9DLcHIWsKvY/MqWNWjKuuRgssf+YDfMzf7u6MfAgFmb5VpbA/Gcnja4m2Xd4RMB1fPlRpOw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SA3PR12MB8000.namprd12.prod.outlook.com (2603:10b6:806:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:49:39 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 20:49:38 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH v10 07/10] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v10 07/10] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcqYRRXxzMSZJ4Q0Oial6MBROLJLWgcB+A
Date: Thu, 5 Mar 2026 20:49:38 +0000
Message-ID: <35d1882f47c6001feed10c305d1c70a374f930dd.camel@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
	 <20260301-turing_prep-v10-7-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-7-dde5ee437c60@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SA3PR12MB8000:EE_
x-ms-office365-filtering-correlation-id: 6e137770-e9a6-46df-ab1b-08de7af8b7da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 9hT0q64A/SFwB0EbvF8H8fmnOPNqlituGMu7/aQGAqTXoRblPdulsnVWvkX0mRb5nxKS3zAEL4lwc0d0ZHYV/eJBfb/Zrw4WwpHI1vFn3gmtCjKLAy21V5q4RYRKlxq9xXj+vThZdz8/oujhgxcR4JDGYWpyimhRn9TiBdvHPkEo3RukkNdhO/kHx5vJHAz8klzYR+qHBmcEcJX1NqU5elUVAl8UasMieXAakP8KSKRJNz4tYFqc0ylA250Shy+/KX4PcCOJOl9bJ1pnZmAoio492NrLKP9Ka9qN30deGT5zVjMXu2SrXPC97jv/JZxR4xd8EPsZblZu/LaWNEdt8UpuiDhBlRbPCPoRDocCuaUio540AM8R6xvjin7LFkCRRFzFeE0YMha5BuAKJW6PK8SNoil6XsXjWBhrqyFfHO7vxw07iEUiZ1ck//vJ6kfOlgaNgtOSC2R1LesMMtv193PToNZHVTTPo6PPNoVBOthw3wMMwvupy61qzfHl3qOqnEcDarfCBfOjC8u1/7ZFXRiHJnNmPrCyH5cF7h7sSqERrkRF1m9DxPTsRFnzRIYskWYaWZeQDRHfRHxNN1PPm8YTTd+eTpQj2ZQUOyiAMbrJcAMyyn0CVVt2X3IwMdR8kQoYoN+S7FcSU+zj0ikD9LuQ4s0ex1S5A1vkGzojIkphp9qrWq5SKLiSRahqun0IeJgzdakeLrCD0xjdNQYsQiAslkA93Q6b3sLjIgirQWJPZVrKS4wAYDD4VHEnh5t88h6c+GRZoHXvpqoo4vXNaimJVAjD3sYC10AGbBXV0Wk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VjN4RzdvbTI1a2NMNXFHYy9QYjdUWlFsNHozaWdUTDdyMkp6VnlNVG5GSjNY?=
 =?utf-8?B?VGlnMlQ1VnJSQWMzZEw5UEh4Z2xkQlhPbGVvOFRFODlEK3J2TGRJcWUvNkxm?=
 =?utf-8?B?OVJXRjZVWlpucUxJbnR1NXRFWGp3VndYWVdXTm1xd1BHMFFGUURrVlExTG1k?=
 =?utf-8?B?K3JpOXJuS0lpcDh2dVNWY25FbFJVaDRiSlFPeUF4WklpeEhLUVZ3MEhSY29Q?=
 =?utf-8?B?Vmd1UFZXYU1rbTREdkdQWW93c01vZHV6QTR6cTlDTWVEQ1F2TUY0TFdGRVJO?=
 =?utf-8?B?TWYxOU50YmNrY25QT2FjU2dqcUFqd25DV2twWXp5eXhnMG9zTjRMY1RFK28v?=
 =?utf-8?B?UUNOUC9TcWlvUFU0WTlWb1cyZmY0OTlMZnFVUDJ3QmRDNXlzVTRpN1pLUTVw?=
 =?utf-8?B?UFBqZkhUajZZcTFzWkZ4VE1hZjBGeGU5bFh1U3BFaEQrMU5Xc09Ib2gzL1Rl?=
 =?utf-8?B?L04xVWhwYVg4M3hLeThYMTRRVXJKYjkza2s2Q3FiMnlKeE1pcm54bTRCT2VC?=
 =?utf-8?B?c0p4V01RRUZSRHJhYjVBcWhWd29MdVovOEJwV2lERmtWUUIyY29ZQ0VXMlhN?=
 =?utf-8?B?NUJVVVNoSk4zWDR2SWNhQUFZbWtEZEpyZ0NKYnhJZCtSdWg3VkU0bEJLNUU3?=
 =?utf-8?B?SzJYWldMbEpWRW03TXVaU2k5OUNGYlMvZmJzTEZ3THQvY2tGTzFuTjFsd2g4?=
 =?utf-8?B?aklHd0xOS1Ixd0doUUdYc2VhQUNwUDBCbmxiN25oOFFPV2RoVEtUSUVTbEc3?=
 =?utf-8?B?bG1HMm96eFhxdGVtTVNsbjBnWWtueko3SGoycjhLTzd6Ky9hSkhsZFdDUW1s?=
 =?utf-8?B?ejdIV015VXhpRzdudkpnSDVoZ3NyVFB0L3IvaW1VM2ZYV3hFR2k5R1paeVRs?=
 =?utf-8?B?WDVqU2I1Z0lKY0tCTWlsbE9nYzRRdThmVnVWcDlMcnQyVmhydktVYnZ0dUNO?=
 =?utf-8?B?RXBxZEk5YjYwM295LytjS1lvVTlmNEg3T3pycnVxL2l3Y282SXAxL1FoZFV4?=
 =?utf-8?B?K3QxUHQ2VFBSZGxNb2g3eG95dldYVnNnTXBhY0JlL2Y3K2kxMHAxaURPUDhD?=
 =?utf-8?B?Z3FCc0JmcVhldUNrQTB3ZU5aelRwb2dLWkNrNFY1Q1JiTVI1blhiM21LMEY0?=
 =?utf-8?B?WEdIbmRMNm0zeUkwMHRyTmh3TTVtbmtNNERLOTFUWlBjTFJHdzBldVdmMXN2?=
 =?utf-8?B?SWVZWE9Rd2diN1l3ZzZTYmNoVFZvaEdDQllnQWNZeDFySDNScFpjektPemFk?=
 =?utf-8?B?MzRheXVZOVhVQUhkK2ZEVk0yV05VZTFScmxZOGwrSGZSQjNKcmRqdGlMTklN?=
 =?utf-8?B?clh2OGE4UGVOb2ozc25DQ3BVQWVENW9TZnEwMXgwc2k5NlZPN1I0SFpPMUtF?=
 =?utf-8?B?SnRaNGFGY0pHdDlobHZkcTVCWnRVMzBITUtnYmV1clNOdXJRc0lsU1lEZVBx?=
 =?utf-8?B?SlhSeHRaZ1B0WmxWQjNzUFJhK09WRERoY3cvNHBWeHdaRDkzaUdaQUtVUDhV?=
 =?utf-8?B?Z2dmaVJwN1poSFBIM2I0ZUZnUjRkakptZTU1N1MyTURCL1F1dmJlMk56Y2c3?=
 =?utf-8?B?bWpzOWh0ZERCTlF3VjlDV1hEUFdSRWFlMGdBekVLNWp6dDlOdnMvc0dMTzIr?=
 =?utf-8?B?cjFKUy9TTEhFSVk2M0h6ZitWN1JiUmFpZU1jWG1WdXdtS2VtRHQvNVlnSFY4?=
 =?utf-8?B?SW52M1lYT1pXaVB5SGZIL3p5MFlpR3R3aUVqSHRybEpxZUtBY1pMOGt2QjVI?=
 =?utf-8?B?Z3JTZWFPbUh3cFVrNGxZd2E0YmxBREtlUmdoM29SWmZreVJvM050UzcreVM4?=
 =?utf-8?B?T0pYejdrbVZOWDloby9sVkRsL0FXQVJMcnlzT05RUFY0SVpTYlBTWlplM3Ni?=
 =?utf-8?B?SXJ4L0FhT2JDTGsyR29HVm1OaVR0Q0pHdHpDQ3ZkRW1jaTVOVE1leWxaWVdQ?=
 =?utf-8?B?aFA3VVA4KzF0blBicFREZXdaYXRqUWhKSG1DYU1ITjRTYW1OZjZzMEpXbVE2?=
 =?utf-8?B?SmNqNVZBMEhzYzhxVTlXaXlVcTNtNCtLMXpXTkFKRDIra01hOWVsUVZOV1ZJ?=
 =?utf-8?B?dk5OL3QrS1BLdnkwSnJKV0w5RlVMVGo5MCtzZ3lpZE9JaUcvaE1pMjViWHRJ?=
 =?utf-8?B?dmhHWE1nczEwNytQSWxWVEdVSEVtbHRnb1V4dDNTVEtLdytqNk16ZkFCdDls?=
 =?utf-8?B?Uk1UVHNjS04vMk5VUUgzRXI1WDA4VG1ZMjQzL1VWTzdjQWc1YnF5VTduZmU1?=
 =?utf-8?B?a0NadHQ4NSsrV0Vmb2pMd2N4UFVBdVdiazBiUU5mc2JhbHVZK3FUcnljNWQw?=
 =?utf-8?B?OFY1cTI0OTRvNHpBMi9ja2RxeEhld1RrWjcvQXRTb1VqZ3RuYTFNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDCA45EF1A6B3641942E823BF520A44D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e137770-e9a6-46df-ab1b-08de7af8b7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 20:49:38.7982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 F/4ubgK+kqHhkQbzTAzQNzRtlBZywaiLhlobhnNkAii9DP8aRQm1egG3g3dhGBNzMabOJ0E4mGLZO5tk+sNt2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8000
Message-ID-Hash: YSOZWNFHY37XUE5EY23VAGCVYPHADCVO
X-Message-ID-Hash: YSOZWNFHY37XUE5EY23VAGCVYPHADCVO
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alistair Popple <apopple@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YSOZWNFHY37XUE5EY23VAGCVYPHADCVO/>
Archived-At: 
 <https://lore.freedesktop.org/35d1882f47c6001feed10c305d1c70a374f930dd.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU3VuLCAyMDI2LTAzLTAxIGF0IDIzOjAzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gwqDCoMKgwqAgKSAtPiBSZXN1bHQgew0KPiDCoMKgwqDCoMKgwqDCoMKgIG1hdGNoIHNl
bGYuaGFsLmxvYWRfbWV0aG9kKCkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTG9hZE1l
dGhvZDo6RG1hID0+IHNlbGYuZG1hX2xvYWQoZGV2LCBiYXIsIGZ3KSwNCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgTG9hZE1ldGhvZDo6UGlvID0+IEVycihFTk9UU1VQUCksDQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExvYWRNZXRob2Q6OlBpbyA9PiBzZWxmLnBpb19sb2FkKGJhciwgJmZ3
LnRyeV9hc19waW9fbG9hZGFibGUoKT8pLA0KDQpXb3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGhh
dmUgcGlvX2xvYWQoKSBqdXN0IGV4dHJhY3QgdGhlIElNRU0vRE1FTSB2YWx1ZXMgaXQgbmVlZHMg
ZnJvbSAmZncsDQppbnN0ZWFkIG9mIGNyZWF0aW5nIGFuIGFkYXB0ZXI/ICBUaGUgYWRhcHRlciBq
dXN0IHNlZW1zIGxpa2Ugb3ZlcmtpbGwgZm9yIHNvbWV0aGluZyB0aGF0J3MgdXNlZCBvbmx5DQpv
bmNlLg0K
