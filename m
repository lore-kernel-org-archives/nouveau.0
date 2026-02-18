Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E6DE9A03B
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 04:05:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0757910E554;
	Wed, 18 Feb 2026 04:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t+2TgDeD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9CAE433B2;
	Wed, 18 Feb 2026 03:55:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771386925;
 b=WxUsUkLqUbVNdgr1QkL6+BFxQoadjjkn93Sg1yPc/rA1c0knTzh0uju0Xs8SlpMMhIeCn
 r0xVc6F6cYtoyfwBi1Jf6hBOkjTSuI7EkHXXUAipm0gyMx+N3KCb5vLctCdDJVNCJ/Z1GaZ
 A7fXJAxjX0pqdN1DTIbIcy47ftRXM4bD4emwFeom6dNZ2NtqTC6n5VyAwNFHx/s79tai2NK
 JEKt0I0Ub6hKvtoz8zJURF0vo/8QXxFuPY9HhrG/1MKawY+Zqs/aCii2a71CtguuvS7LRgf
 SBAnXrif18xKZ1xkPpjjmcnyMT9fxr1xQzVIrqCbX3cYITr1JQOFlc1rz5ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771386925; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Zzq9/MwqiJkif3oZtD4OCwBxqMqQVfilvl1E4dzenv4=;
 b=hsHYGLG66pXvwKBQ3SihjTm5HdqTH/CelrDpJ99/x4j93JAQpBkpkEuM29LB+dtgt8RGf
 LeJhmkkP3/LgYI7MRjzSx+Qy2iTB8gp/+KcjfMsTeUu6cR2vozhQBddn+k9Q3QLSxtsljKI
 lyqHG/eQhb++xWG9cszgguTYXWhHKzS3TlOy7wyzwa5dHsho1yoLkp6rykku5F+Lz4JXI8p
 3gOaOuj+hUuMId0P/+ZCgb8xNjsO/HhuS2/90LeUCdCRZGMw6rrninMe6AgQdl+18lKewnH
 KL2WVIud8Co+SXuXHliI8uwcutChRkWQHXqWncUZCyO/ewTB1rdbtIFz1b3w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0AA4340042
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 03:55:23 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE2C410E2D0;
	Wed, 18 Feb 2026 04:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+aRkMr+ElQ+aP6VvdMvPEqyHcbJV3kUx/ygePCc1yXtWxhgFvsEPrd6XpR1y491IbZKExf0v3iLrNBt2YACVcyJDklSzWSyAM/+QO2h9xfR+qyF774wbAxtfzed2V0cVjuIK6I3ZCL2fymKM41Nds3U6VcAxB8R2l3n1EcLp27ehKbskmTTSiMAfG+ujiAeODiKqRlfqiEb27V8PugGIs97vtG1V++Zh00Knsy+0cqa0Pvzw8gC736pm+kMrHM8pkvJvQkGHx62scrcjts3ArUMFmgDpb6mYAkCa9jHyp0XCyIp5YWrbQODaxRuO+51tjPpuWy6EYyOrMOOu9Ql2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzq9/MwqiJkif3oZtD4OCwBxqMqQVfilvl1E4dzenv4=;
 b=Mb/Z38+ueTQcMXXkkrt2qBZq1AXfD4OrFoaheY41lznibvXAlqi1kIXuHdB93WNGuLtAnpHa3v8lPNJ/T27lCGC5aIAi6UCTywAn9vjRKAJrzRbmkLFXwuOh3kJMdlVqedJLRMMCHVsoXztWQ1OUNwbQM69mDqM56mn5r1pYlVkC08YYrXAx3fohxjHBCcDueLgaNmATY2UWa0OqEnBcljMrq3ULD4rBQKdgjYh8kQ7EyurxYbFcdaky2G25DhGgfc1zU1Ysy1YnghlgNzIM/FBPfl/Gvn501V4UxxtxIAg5TFp3YthBUyY8JgCC7j2T5UyNhPPCJOFYYPP6BZOwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zzq9/MwqiJkif3oZtD4OCwBxqMqQVfilvl1E4dzenv4=;
 b=t+2TgDeDu0BClWxr/5W1vUZllzymh0NpUAi7cuwFqwDIIj9tGC997sWZRvVCB9hk2nATvg4GPo1l8mwrLJ4m2JMNRIj9AZ5RtYjNsFwtKiHgJv+bBYPPVAiqiQEe0mW99a99BIbputVDAAwOT+wzVl1Yh/Yymnzz0GfVIWvXT1kKofr/OOqIsUOyZG0c8DB+p/suuyU7HcEf8lAXLQrtT5/Wq6RUbD4FRotqWbzm8EnYxJnokrd/69bPP+odzs8ZopNyRC6pTxaQ8gVlmPbkFuprTgAWXTwhLP8CE/6Ljtb/OzRF1nS1xUVVeEEZ8oBvdlqljtt/t55ms25dxCvZpw==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 04:05:06 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:05:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 13:05:01 +0900
Message-Id: <DGHSGO2E0U9F.2M8MOSKBNA9JY@nvidia.com>
Subject: Re: [PATCH 2/7] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-2-73079ded55e6@nvidia.com>
 <DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com>
In-Reply-To: <DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com>
X-ClientProxiedBy: TY4P286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e69cb1-4282-4388-a0c0-08de6ea2e589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUV2YXRmdHRZYzhWSDhWNGNDVUNCNjFTUlJqYXRLYVZya3M3T3NGVFRRaG5s?=
 =?utf-8?B?blUyY1hXWmZhZk56MFBmY3NOUHhDbXc3a3ByM29jV2JDZmdWbmNpZElnaVA0?=
 =?utf-8?B?ZDY1VE50YXBpQ0xLZHdvNDkrTE56RUp4RWJlSnVSdDBJVVpkZlJvcmlwYWFm?=
 =?utf-8?B?Y0FoYWhmVGVwK0xEQVRzN25jYU9xVHhXVDhtN0tURjliQVpSbEZGZFJqYUVS?=
 =?utf-8?B?U3FoS0pDK05NY1JCWTBuZVc4bytmZzgyYkN2aGFsc1B3L0hrVUkramIxdTJJ?=
 =?utf-8?B?RUhtSWZaTGIxS3ZtMnBNcno3NDQ5Y1ZXdGRkeVdFYXh3U1VxSC9xdU5JVUxY?=
 =?utf-8?B?eEdrS2o1QWtKWWtnMDZJc0RtYm5WaFYrOHJqZzZ0WmNtMklVNy9RNmUxZFFq?=
 =?utf-8?B?eEovOUlaMUNRaDlQa2c4Q3REZlJzYWpKNTVnWGdyNzVjVDAvMi9Lc0laNEVy?=
 =?utf-8?B?K1RjUUErbm84WG5YQ3MzM1NtRWNhcjh1RmRJMEdrRW5Kd2FhMnd3Q3BoMHZt?=
 =?utf-8?B?ZTdJQk5DSklMbXU4NzdhNGNPT3JybFhoVnNSVmdYZVFBUkdzNWQ3M1BWOCtq?=
 =?utf-8?B?K05vNjNTTzRJdU9iQkszcXpwYTBjeDVtZWJGc1dxbXVla3ZzNnJySHE3RUdn?=
 =?utf-8?B?Rkw0NWh6Q2ZLT3VaNjdnQmxvemtENitwV3ZsaEdwVUVKL29BRGdjeGdTSEk5?=
 =?utf-8?B?akg3TVB0eGtHdU4rVjQ3a2pTSzNRY1pUa1d0OE9JcEltbXlsdDUrdmFHNGFG?=
 =?utf-8?B?OCtsR0tqRTRpQTIwODA5QVRZeXhWR0p5OWJ4WEJuZ01ENHRLbktsRDNvNmlY?=
 =?utf-8?B?ZXk5N2YxTDV4K3crb1k4cE1rWFBGeVNBY1FXR2FIQ2dPZ2cvNlBWUjJoc2Y5?=
 =?utf-8?B?bUFrUEVRVElDekhJMVVQTXN0cDg5VERueTJ6Tm5IZzZ5cllnRkczbVV0WjJq?=
 =?utf-8?B?c2Q4OG5lRm92bVJQcEZOemxHYnpKSG5yTTU4aUQ4K0tTV2szWU4wQ3FPcXdr?=
 =?utf-8?B?eUs1cnpQUjBWMWJhWEhldGNvcjZVNHExbXNndUt6QUNyaCtxd1JEWkh1Z01G?=
 =?utf-8?B?ZXJCOFBmZ0FxOFdIM0VVdlQ5QXVMbHJ3UTBpMkhkVTFua2dVUWFtbGg3Q2xT?=
 =?utf-8?B?ZyswZ1REOTJCYk1uUm4vSmU3Uk5zdzU5dFdYNlZlRnJHbkFNMUp0NjlvNkQ2?=
 =?utf-8?B?VXBtVzFMZnlLLzlxK1craHBJTXZZb3JPQ2NyVU1OUm54blp0dHJuOGQ5Znhy?=
 =?utf-8?B?YzQ1cFMwRVNsK0x4eUI5enRoMWk1TDAzODFTMFhTUVVWNy9aNVZUa1ZrQWRN?=
 =?utf-8?B?REo0N3drTEhidTV1Sk1RUVpnRHd2WXlMc1FrOHEwQnhvSENGQVMydVJ3TUsv?=
 =?utf-8?B?N2E2V01KZisyVmNSaHRJV3Y1U1BqcElPSjV4OS9HTjV1WGRERkhlOUVqMUlq?=
 =?utf-8?B?RGJvTlRoZGsyZmVZemV5VTQrR1J5ckZIcUluODdzUzBsN2Q3bFYyZXRiTnY1?=
 =?utf-8?B?ek55UGpOcEdZQzNLM1R2ekZycENQRWx2czVnci9mQ21VRDNadlNCZDUvT3hO?=
 =?utf-8?B?NHdMQXVtR1lNWmlrM0VSd3lnTUwxRm95bnI3cWdoNGR5SC9IUis4M3VtdXFT?=
 =?utf-8?B?anRqZ2tXSlJSTFdETFJiV3dPZzRkM3lDcWh0NVI0VXFLNjlCTnE3VzlRU28r?=
 =?utf-8?B?ZUhyWFd2Mmg1UlluZjVDSmh1VU96U0lEa3J1K3d3S3pqTzRCdExnZ1R5Ri9i?=
 =?utf-8?B?N2ZheFhMQ0R2UExzSk5XNmNqeFh4ZGhxeFQzbXo4cVpwQ0psRHdOZDIzYmpO?=
 =?utf-8?B?TWEyS3ZWMXJtc20zT2FwMWI5ZDc1bWZ0NnpHN0dLM1M0NTFhOGlvQVZXU2ZS?=
 =?utf-8?B?MHpla1E3TUk3SDQrMFAramNHdzdFcDgwWEJqNTFEN2N6MW1TTW9zVlRlRFM3?=
 =?utf-8?B?bmlNcTBneHdVTmxIMFMwYXhrVFJTVWEzNThBbWRIZzNaWFdsRkh0bzJaL1Fq?=
 =?utf-8?B?YlZ3TXNPYlV5K3lDNDAwU0pod0hpeCsvNzV4SEFOWG02QU9PdGY4TkNVTEZs?=
 =?utf-8?B?eUZqeno0eGtQVmtoeVRuY1pPcFNsRVZLT3JwU0VtM3diRmMvUVgwYmFyRmE1?=
 =?utf-8?Q?awuo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGdPdFZINy8zcGIwSmpqR2xxS0toZEFaRytmai8xeFIxMSsweEZSN25FYkp3?=
 =?utf-8?B?MC9zZG10NmdUdnVIUCtjRGg5a20yaVJaZmVsSE1Fa3F2dExDWC9LL3diZ0Jq?=
 =?utf-8?B?aTc2U2pJTkZEcHhNYnJkeXFaUVBDdk5rSEoxQXNGR0RxN040MFd5VlpKV08r?=
 =?utf-8?B?ZzR4Z09oY1hCOUQ0cDRHSlNHRHl6NEo0ajJIOE01UFFTamVSMldHWTM5LzRD?=
 =?utf-8?B?eTdKUkJCaDUvQ3hXT050dExQSnVNalJYT0RXYUlPci9xV0hTVkJ5KzFWQkNQ?=
 =?utf-8?B?NXoyR0k0bDhuU1BzWFVlODVqZElERkxrQjNQU05Sc293MXAzc21sbzRxMDNG?=
 =?utf-8?B?QktlNjVEemlLUWVCbzV2S2dKa3VNL01WTTZyaU9jWGM3TjNnTkhWaE03NEdT?=
 =?utf-8?B?amRvQnBxU3BPM3FadDhjK0NQamxxSkJRNkVTYUpUSWFtc2pRamQ3UzlPUm0r?=
 =?utf-8?B?c0ErMTNUcTNpQ1NnOGVqNlpYTGY4RkJSbFVvVmVnLzZLeHBSTnE3WHRzVjlH?=
 =?utf-8?B?YitNdnZhQTlCUFRLaEtsNUx4NW80Y2Q3bmlmcUl3Y1lyWkt6ZjBJak5mWFA0?=
 =?utf-8?B?NnJRcDVxay9YbTdNeXNJekFvcDhyUlZLMXFzQ1hkZGt6VjNDVy91eE1TQkk5?=
 =?utf-8?B?aElmSG9GV05iemswVklPeG1PeDUwVmx4YlhJS3JuaXhaZUhHOG5GSzhlZjcw?=
 =?utf-8?B?allValRmb1BuNFJkd3R3OGhjR090VC92Z2ZoVXUvTEhPWmhqTkhQUWZQelZS?=
 =?utf-8?B?d25tbFZyWTYreVluNzhXYitkbVFIM1dlRFowTS9MbWV0bGJwaUx6TnJGcGE5?=
 =?utf-8?B?aEY0d3NHMUlpeWp5cGRjaDdUMEh0dll2cXhoV0NoL3ZpZEtzMmxpZUQvRXRL?=
 =?utf-8?B?NzBaL0VJTGEyVXZPWEpJSU95NnRCQnNnTHluSlVnM3ZnU1l5cEdKaWcrcEY0?=
 =?utf-8?B?eEU5T3EzZVZVc2NPamp3M093bnIrUThFeDR6akNETFJYNUUrRkdneXQ3TFo4?=
 =?utf-8?B?VGpuK25CYlBjQm15RlErRXZPNjNYWHZaT29VU3JNMTcwQkJMeTVCWS9ESmwx?=
 =?utf-8?B?TFJzbmZ0REZQMS9CUnljNjBnZmxSaFQwQ2RaWnlRYVJyZllkcWdnVUtPeno3?=
 =?utf-8?B?dGJ3TTRUUzJIenM1Rzh6V3ovMzV6eUpNUGVXZlp3eU5FOXFhcHVKSWtKNkJZ?=
 =?utf-8?B?L3BET2d1aUh2VDAvbVRIeWtuZGo1QWtvQmVJWmM0ZEF5THMxZnZCRDFKTDFl?=
 =?utf-8?B?SkhkbG1yZUFJcDhyaVRHeE5yNXA5SUtuVWRQVXhSZmdoSmwwMTVuejFjdHQx?=
 =?utf-8?B?bTV6emVCTlpLWVk4cGoxQktYZEVyWWU4SEVoRjNPdFVvN0R1c21BYkR1bDlZ?=
 =?utf-8?B?REFzdmZhUzZmUlJCUk0vMmxWKzJaUGVYY1NBN3doTXNTdXA5U0w3R0hoK21s?=
 =?utf-8?B?bGcxc05YR2hVL2F5by9yZlFXMjh3TUZmeGdLb3dxZHNrZWVpbDRkaUNiajR4?=
 =?utf-8?B?THpZQTFYR0E4NU5zQWIwN2doNjFYM3JDNXNzUDl2Wk0xci83N2RPOXJhMWlD?=
 =?utf-8?B?V2ZFOWZQQW5ac3dRS2Q3aTFlc25SdW4zUjRaam94M1AzalYyUjJLM0xNSkgy?=
 =?utf-8?B?VlN2NHRtTk1EaEZuRzEzMlJ3dGM3N0lUZllFTGt1TDl0alAzNnZpYTVYV1Nz?=
 =?utf-8?B?bzlKRjFabkpOQktMNk1LdEx2a1NhU3VGY2dWaGxack9HTndzM0JOUGx1eGJY?=
 =?utf-8?B?SVR4VUJjYzdQSDc5SmR0VUx3cy9TWDk2SzBXRjloaGtqdFNPVTVlektBdHB1?=
 =?utf-8?B?YlljZFRoR0dKekd1NEQ4ekRjYmJyZW9mYWwzNnF4L000aDBsZVlsTGFvM2hq?=
 =?utf-8?B?RWpabll1L2JzcWpTdlliY0NjeUwzZWp1eWwycmxRckY4KzlTSVprcW0wakhV?=
 =?utf-8?B?N1YrSVNSaFpsa3pLOERhZGlXRC9CMWcrUzlWNUErTG9VRTE1WW1iWTF0Z212?=
 =?utf-8?B?SVF1VnF4Rk0xODRiOUpnb1I5TjlQMUU4VXF3WlBmeDV1WGhBaEJqbkY2Tm40?=
 =?utf-8?B?OXJVekNqcFQvRWFUNHcxdDlMU3U0ckNsdmtxUWFIRzJ6SmNZcXZBR091UlRK?=
 =?utf-8?B?SThSS29iM0lQRkhCVkRjdkJkUFhNbXg5cHVtOUNGVHAwZm8xejV3RXZrbWFn?=
 =?utf-8?B?disrbkt0T2NXSnFvUm56bjRSdFhDaHZ1OUo2Q3QxeGt4Y0V5Zjc4MHVtN3Ns?=
 =?utf-8?B?aWZwaG16YlI1MlNMWHQwSUltdkJPMlFWOEQ4bVc3S25Rb296WXpyMVoxa3lC?=
 =?utf-8?B?aktOcWFLMWQ2TytkS3lZaFZQZENnY21RZnlqZlN2L2wvQzZsU2dNdzJKUmg1?=
 =?utf-8?Q?Pt3NshEgl04j7sYd71dt8DJuCo4+nKlhsli1gcbr2nmZr?=
X-MS-Exchange-AntiSpam-MessageData-1: 1GHA8WkZigHHDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48e69cb1-4282-4388-a0c0-08de6ea2e589
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:05:05.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LLt1yJY4OiqQCKRkIcf3EJS3CgZBhyYoMsn2KrpLUPSDt2DrA0o1hij06C4jynUE8R7/N1lDIGO8HERXCYV4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
Message-ID-Hash: NMCJVXJDFA4UH2XUXDUECXN5DMWKCHTC
X-Message-ID-Hash: NMCJVXJDFA4UH2XUXDUECXN5DMWKCHTC
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NMCJVXJDFA4UH2XUXDUECXN5DMWKCHTC/>
Archived-At: 
 <https://lore.freedesktop.org/DGHSGO2E0U9F.2M8MOSKBNA9JY@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 12:13 PM JST, Alexandre Courbot wrote:
>> +    /// Allocates a region on the command queue that is large enough to=
 send a command of `size`
>> +    /// bytes, waiting for space to become available.
>> +    ///
>> +    /// This returns a [`GspCommand`] ready to be written to by the cal=
ler.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>> +    /// - `EIO` if the command header is not properly aligned.
>> +    fn allocate_command_with_timeout(&mut self, size: usize) -> Result<=
GspCommand<'_>> {
>
> Should the timeout be an argument? That way we can simply add it to
> `allocate_command`, and invoke it with `Delta::ZERO` whenever we don't
> want to wait. This is more explicit at the call site, removes the
> need to have two methods, and removes the redundant size check from
> `allocate_command` which is now done by this `read_poll_timeout`.

Good idea, thanks.

>> +    fn command_size<M>(command: &M) -> usize
>
> Shouldn't this be a member function of `CommandToGsp`? Please add some
> basic documentation for it as well. As a general rule, all methods, even
> basic ones, should have at least one line of doccomment.

I thought about this, but adding a function to CommandToGsp with
a default implementation seems odd to me, because implementors of that
trait could override it, which does not really make sense. We have
command size defined as the size of the struct plus the variable payload
size. Adding a function to CommandToGsp would give two methods to
calculate the command size which could differ. So, seems weird to me.

An alternative would be to make it a free standing function. This would
let it be used by WrappingCommand later as well. WDYT?

Will make sure all functions have doccomment from now on, thanks.

>
>> +    where
>> +        M: CommandToGsp,
>> +    {
>> +        size_of::<M::Command>() + command.variable_payload_len()
>> +    }
>> +
>>      /// Sends `command` to the GSP.
>>      ///
>>      /// # Errors
>>      ///
>> -    /// - `EAGAIN` if there was not enough space in the command queue t=
o send the command.
>> +    /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>>      /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>>      ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>>      ///
>> @@ -495,8 +531,8 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>>          // This allows all error types, including `Infallible`, to be u=
sed for `M::InitError`.
>>          Error: From<M::InitError>,
>>      {
>> -        let command_size =3D size_of::<M::Command>() + command.variable=
_payload_len();
>> -        let dst =3D self.gsp_mem.allocate_command(command_size)?;
>> +        let command_size =3D Self::command_size(&command);
>
> The addition of `command_size` looks like an unrelated change - it is
> not really leveraged until patch 6 (although it is still valuable on its
> own). Can you move it to its own patch for clarity?

Will do.
