Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4285CEDF04D
	for <nouveau@archiver.kernel.org>; Thu, 12 Feb 2026 06:30:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E224310E6FC;
	Thu, 12 Feb 2026 06:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnaagRWg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F13F242FB2;
	Thu, 12 Feb 2026 06:20:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770877231;
 b=AG2P7EFE3fQv6DdoBXO4lzN1vU2i7uUAMGodxIToM6D6Msn3ZOHD8OOR7SVgKhEfveEsQ
 +glO+jEuzO+ASg6cy+rBMOElNM/Py7Sm1PBwVV4v24pcgM8gGYn0T7zMWHnxTGQlbSW6pug
 uE6hOCauc0E3kMshQILzqTe7yyv6yHiwQBKZXG/5dtuKvnWkPYLcx8JUJ+Zw73xgxRmnKvJ
 UqgbOggV3KixVhWTkaCy4Dtxr4BKAxaPL7VEhRvowNungXG66lNp+pAqG96Kakupxg+RWKS
 Q3I/P6RMK/MsZucPpSrBgibI0RMpCDFCmKBZ0nIL5DFeqEIo1sGqnwzoflxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770877231; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tqjBOaqlx4goueRCMnfXo+xPHM5piYh5UXVaRXOKQU8=;
 b=O2yOoMq1bW9bELmW29/ERv+a1bHynOavAVcgQ0R/pC/nMTWgeZYewcUFTd38SjUtCqQqc
 WhXUopYbk1kIFu4+eLN1GIwSV2EN80rhB9iI9pGRv/zGmSFmc8Yz3RkwqIdTC+6ueo+AwGJ
 sL8QiGAaT8QdCf1ZgSA2SuQBnTPki59r/yW34ADg5XP6tDGMFZ3xPcY9BzrV2Tp2GeQMZ1y
 oW4jXNvdLyAhf/dMZWiofUXzJIc/JBwNpKFr4uY+619iD66NM+XEy1UGrh+/zS6R7n445t8
 AZtiRsDZTZ7EZuTcXbuBS3djoxopgBAYM/gdexyJunFhiAl3AbngRiuXs/Gw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B3DB41E96
	for <nouveau@lists.freedesktop.org>; Thu, 12 Feb 2026 06:20:30 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013068.outbound.protection.outlook.com
 [40.93.196.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C74BB10E6F6;
	Thu, 12 Feb 2026 06:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQ4WqZQZala/MY+Sf4yLRvICRt1iGfh9d7SqLGZVWgqLAnD387s3uNjHPapFowi9xQn0vqHbsG/wWeaga2nJ0c7qjid5zMAuk/SiMu+re6haEUC6WTIzFWWk4ox7Leq2kRfkSfAfWesed8XwYmBlY+kYbN4zzxPHWa47WYWXbC4xmwFjLa3oST5oODeYpUlrRRytZjGBQvZQ+980JJO2kBi5IbzcS9uVN2By7kMFLXKQWq1Q8qutIurQtNFGeYW8f4udV5K2ekBc6twFloEpqsHnPGDnAuFbjCMNVJWPH1beV0TRJbP5bw+g1jl42SkRyRNFe0i0oCHu+1pycd/a7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqjBOaqlx4goueRCMnfXo+xPHM5piYh5UXVaRXOKQU8=;
 b=vEJqwMwygGPExjyr3pkX0f4LAR6P8qBgGuDtuv5AJUjC49eBgxLbsI51EG5DqAdaCJmd2K+7mAi/g7in9iSJ1xomLlJXJtkk+grCbY3Pi/VuLFdibMHFziaSmd7X73sGh6iUZyu4tZ3u3SyZtsm9c3UdQocI9OUIYLzRFwPwvdhXAc0BB/w0b+ujRjZ0bvuVu715y6LVDWXfiYN1+F0be6UZ7kkKWE+/ZIOWB8L3Kr6/U3ob1X0ePNO8zjYORS4hfbVxxMEdIeTtyaWu8G1CU47A22lZCbBeEcfJeaqTcFLelfqXCbRLFv/bC/VoEoD68id+DsZDkpfhkNjHqfqqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqjBOaqlx4goueRCMnfXo+xPHM5piYh5UXVaRXOKQU8=;
 b=KnaagRWg4iXErkZ7GeMsQDA4K1sYxwWxgNBbsi2Yw2oDeAbXNVNrY1BcEftT2jfvDdnrtVIL7hLuZhzWHja6dYmK6THmBGH6mGeNG5WNjtHK166DK8kdeOZNH7jTiQPpVGJ5bUjlHUhitte22MQXwuYnhauazPaj3ZiEcuOXo/fqaqSZTDdlbsW+aNDkWfwj6aKUpKc6YsK7fETcRFzN/RpDuRJZ9OmTSg06rlBoO1Gj8+mvcHkOsbz10Sqm6cccsJcHyAzXJoo3pNHtgAdnYh5DX1C8+nuKVeL+F5z3vN2FcpAH7ONaPEYxNPmoTgf0S+JJqg0TL5vtbCaCFaTxGQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:30:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:30:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:09 +0900
Subject: [PATCH 7/7] gpu: nova-core: gsp: add tests for WrappingCommand
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-7-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: ffecd04e-b038-4d7b-2e27-08de6a00263a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkxGZXZQcThYSytPaitJUFdvNkVHdFFMMGpzWnhobkIzTGY3NVFoaE9kK2Rp?=
 =?utf-8?B?NlE3T1d5cUh5VnFQb3FzWlEvMGJMR3o3MnJuRklTaGpDTDhKdksxN0ZBbXcy?=
 =?utf-8?B?OGhEeWYyQ05hS0V6V2NJekdtdEJTTFBjSCtNb25JcUlrTUl6Ti9TSVFzbTVq?=
 =?utf-8?B?NnlDcnVSNWpia1IyQ1VVMkhYYi9WcFN0YkpjMlpRMHlPUTlFZXhKYVJ6UWJr?=
 =?utf-8?B?RWdvWUUrTlJ1OW4rblJOekkwWHVaei9CYW4xNHFTK1pmb0llbERTRHFzam1r?=
 =?utf-8?B?MEJiOW9LeUVYT05ZeUc1UGVNZSsrU1ZRU2xrTjI3dng1QzlyTVF6dUhacjlB?=
 =?utf-8?B?RUFzaWFOVmRJdXdGOE5WRE0yRXB3RzlpeDdXN211ME5ISFN4ZExoTHUvbXJq?=
 =?utf-8?B?Y0tZa21FVTkyM1Vmcm1EcGZuTTVFNmYyUWFPc2tJZnBxUDhzYzdEMFJRT3da?=
 =?utf-8?B?amFJaGt6YWJzVzlSUWZ5WitGdGhRdzdPdno2enl2akVCeGJxNjZVRDNJYWpj?=
 =?utf-8?B?NVBCNXlTUFVQOFNDUlhlYlZ3SnNjTkdBTk9MVEkrbjU4NkgxTGtjKzl2TGxF?=
 =?utf-8?B?TWVjbjVuTTE4ZjNXdlEzTWFsMzhyWHBKK0xzRnp0cVhDZDdLNUtEcjJqakxu?=
 =?utf-8?B?SmxKWTdidGFyNWJhdG5qMXF1WHEwMjhzVWV0WER6VmNTM3U5NzVQZUVoRHE5?=
 =?utf-8?B?YUFYMitjOUxMVTJLcVozWXY0VndnOTNDU1RENWlBVlZ1T2RSRm1tNjdDZmFT?=
 =?utf-8?B?YjJ1VGdJa1Z4Y0dvckVZVEI2bFRoYWV4bDBBNGxsUlpSajF5UlBMR2Zid3JB?=
 =?utf-8?B?eTZQM3dLek05dXFQdDJYMkFVRVhuNnEyelJvK0xrY09HWGhVVlhPN1V3QjF6?=
 =?utf-8?B?L0k5SW55YVlUdTRsQnVESTNWcGZmV0dZNXljcnc1L0E4amdoNlMwK1NpVGY0?=
 =?utf-8?B?NlR1anU1K1RPM0FYNWQ2MUZpZm9XQjJZakRiUTk1Wmx4MFh0WGxmWkNmYjdU?=
 =?utf-8?B?YUJON0lWeDdHVWVNM1pvMENXQU1uTUFrZk1WbkpvaFRSYVhOMFFNblQyN0xZ?=
 =?utf-8?B?TWlkTDMvcjVxY0Q5d0NXYmc1MXJVcEVtU0Mwc013alNCd2doT3B0R2FuMnY5?=
 =?utf-8?B?RVg0UkhVZ3lXOWhtZjIzV2diWWVwZXdKdXRIclQ4SnloeVFEYTRuell0clU4?=
 =?utf-8?B?L0VTWnRxN2VxWGRibS9SMVN5ME16ZThBYktwVFdCVU03Q1BmK0Vid3pCNFlS?=
 =?utf-8?B?L1pORDdmQnF6bnpYVFFLUloyRXgzTm9JNnZuK2ZrSzY4S3U1NXFWcitEVkVJ?=
 =?utf-8?B?RitlSDVRUURXdlJNZTJDL29mMWRmKzVCQmlTNWVpOHRvQ2FnWXQ5UVlCTUMw?=
 =?utf-8?B?OUxTTXRjS3pYUVN4Y3ZFZXNVKytXcHpBTmxEZ0pIc2tZdXZjbm0rMmNaQnp3?=
 =?utf-8?B?d0pqRlYrT3M5ZHZlRFJDMkZiU283OEd5R28vQUR6WGFxVzlSbm9oSGFqMjJs?=
 =?utf-8?B?VjhoQWJ4UWpjNVV3VitRMmRRVEtOYncrNHFPWmlzQ1ZhbFBTQllQNml0WklQ?=
 =?utf-8?B?STZyYmgyeDNQbmVYS0pkM2U1YjMrOTV6Yzl6ZThtSGh6YUVGT3BCWXVUOFB3?=
 =?utf-8?B?WFBTSGxMWXVnNVVCVW5pN3NBUkp6SEtMeGZrZ2lZSkVGckNBVEFmeEZyUFVW?=
 =?utf-8?B?QzJUVHc4NDR5dVBudmdWdkJZRWJoOVF1WkRvandDQzFjS21ydHAxdTV1U3J5?=
 =?utf-8?B?UDM5KzVaVkVPK0hzd3c0NTlSeGdQeXNzRGVFejdhN25IdG5lWnY4aUIxc1BO?=
 =?utf-8?B?S3RUUGFhNW8wWXdGU0xDZHhXdEEyT0hGenV3bldUZXJPVDYwSFRWNkxzbTJD?=
 =?utf-8?B?YjB5Z0Y1eldhUFcyR2VHa2RUNGdFeENjSEh5RDA5dGI1dVNEaFRuNGUrcXRF?=
 =?utf-8?B?UE9EK2JXUzRjRkp6S0hYQjcrOW9PNDZGcld3dnlUelpnVG00MWk5akxCMWFv?=
 =?utf-8?B?OGNGUTY0SktwemI5TTZaY2RkM29QSS9NR2Y1MlhncEZwMldSbm5XZzg0bDZR?=
 =?utf-8?B?aExMMnErcGFjNEozUWhtOEhMek1maGo5ZFZsRjZvYUc2NmVYRi9zckk5U2xU?=
 =?utf-8?Q?tsno=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXZVc1NERGlhbWo3dEJ6ZTh6YlVMOUNuV2ljRVZqcFpPZzFvR3QzZVQxVmxw?=
 =?utf-8?B?RjhMV0E0V0VsMkZhWDA4ZXZuQUJCOTIrL3pUa05DZFdqZ0JhVG9sMDZwcU13?=
 =?utf-8?B?dXFuSGNGSWhTaVpVaTFZVWoxNkNHV2JQd2hUYm56R21pQ0VhaWNOL2I4OFBH?=
 =?utf-8?B?QXlNcmJETjM4alpLNzZaMjRBNTRIaUUwOE9EbkJGUlRPTkU3YVAvd1FEVGtt?=
 =?utf-8?B?R1RQRFl0VnpHb2xBeHFVZDRTN21Ha0J2bzQrQmw1QnhNdVpWc3dQWnRETGdK?=
 =?utf-8?B?c3Q3elRTUDdXYWRsY1dTV1JoY05GUndJZ1ZUMWh1bHZUU1kwblk4M1JMYVN6?=
 =?utf-8?B?dkhGeERJcHk1STBFRmFSMk1wVlcxZE5QNzJWS1JPSXljdldrUzJneDNDdVlC?=
 =?utf-8?B?aGhqaXVMcmI1TGZrOW1WZ296SGNDblVyWkliQUhCM1ZUM3p2UTRRaENocjZF?=
 =?utf-8?B?aGxqTUI3TTVhYzlNeHFBQXZsVHZKT2trSCtFVmNsU08vOU5US0lGbGRxck0y?=
 =?utf-8?B?RVFORnFPby8ramFNdzlpMXNramdyNjYxNWxQcU8vWGVDVjZFYkxuVlNpenoy?=
 =?utf-8?B?T1pySWhwWWVYSjRtMDV2Z2JWQTcvb2JHSUhDZkFSY3JwSjJCTXlaTkZDaUFB?=
 =?utf-8?B?Y0VJUi8zOGNTZ0hMSzNKcFdRbUNOWVFSTjZneXZMNG9tVmk1WEVBbUhDNEdI?=
 =?utf-8?B?Q2pTa3BMcVRlZExVY2dHMHArL1F0dHFFYW1BU0RPNTc1dWp1TFM2ZFRrTCtE?=
 =?utf-8?B?VnY3Ukp6K2JJazh4S3BJZkp5QVBZZno4Zm9ZQkJFbWZUcUxoL2FuWnMwbC81?=
 =?utf-8?B?aEV2K0ZWUjNyRGo3TnRIM2hwMUNtMjNrdVZLZHBYT1lUR0xPdFlTcnJIQXJh?=
 =?utf-8?B?eVV2QUw3OEpJaEJySytRcU9iN2lXQmQ5RHRpbXdpQ0lRL3Y0ZER2NFp3cUZ0?=
 =?utf-8?B?MkhWRWRvQWlDWUxZUzYwWVlNTGtibG5LYVdDenBSRUxIMFBoZkViR0lFNFJm?=
 =?utf-8?B?dy9IQkYwRi9YeG40dmZEblNXaGhld0pjenpDUTlVditWdmt3aFpPZElzaisz?=
 =?utf-8?B?M1BZZTlhNDJ5SlAxV1QwbkdVd1JPMEduSE5lZ3pDUVZFZXpSL1NHK3gxcmp5?=
 =?utf-8?B?Y1RuY0NOREs1d00vdUJSeEc4WTF0RU9PRFpKVCtNV1RHbEdDVGhHZHQ4emRO?=
 =?utf-8?B?R1FINWZzLzBYK3daK0JobGVIK0lDVUdqN01EdWFTL2x1ZllaRXVHUlRaVTNR?=
 =?utf-8?B?cnVjZ3QweHJUdzZhMUVNMUZCSHVHZHpjWHRDdTZJWjFzYjVBdXdQY2pCTmsx?=
 =?utf-8?B?VVVnVkZqOWl3OGxMSU96bm13OHBQT0h4UHp3anlWemtxMDZYam1iK2J4aWRK?=
 =?utf-8?B?Z2tVOFBLMTRXWmtwcUV6eTdMb2hFZU8waGN0MXBzM3JhZFBjZU1ONC8xdUtm?=
 =?utf-8?B?ZTFRTzRYRkFERGh1bzJOdmQyb2MzK2JWOE1GNnFDSnRMQkhzTHM0cHBoZkJs?=
 =?utf-8?B?SEJkVitqWVVSNFJ3MjU1c1A2S1VTRE8zRlNuelpwQjY0bWh0Q3k2VDFaUG9S?=
 =?utf-8?B?TzJjUFN0T0c5YTU1RDFEM1RmYWpudHJQM1VxYzVTK2RJaFI5WEY1djUzOG5w?=
 =?utf-8?B?Zy84bWc3YXJsbjlhRVFVbE4rc01YNy94NjkzM1doTFJPVC9qcGd0Rit2T1hj?=
 =?utf-8?B?QkFWTkZiL3VvblpqSjVqZnV4T3Qrdk9Dazhtb3FOd2JVaGNMaFRHbjZLcVJR?=
 =?utf-8?B?djJDcnZhSkVGTHEvU1J2dUZtTFl3Rms0YnZtOFo5Uytobkthd2o1engxVGRq?=
 =?utf-8?B?a3M1WWdkRnI3L3MrZVdTL2p5TEp4NGFFcGZpck93TWVaTVRqdW5EbnBpODI4?=
 =?utf-8?B?cHpFQjBkanJ0cUh4a0tFcmJuUm9xVDJiS3ZuZ2JFdzlEZHdxeFFpSHZYSUVV?=
 =?utf-8?B?eXRsQm1vOUtXVFRndjBNWksxMDU0aXBlbFNKbjdmemtMSFpVM2NFN3JxTWN6?=
 =?utf-8?B?QVdyeW41ajJmcUs4U1JFeHhxbGdWdEpRemVTNGREYU5wTW5CTDFBMWRNaytM?=
 =?utf-8?B?QmQ5b05RTlJGMlRLQXRKUFB4Mk11UUZHbE83VHVpclJEeno3RE5KOWpDRlBq?=
 =?utf-8?B?QzB3L3NsUmsyQ3lHTkszWGNrOG82T2dqdjgvbFpGVnpQZXZDNGRpcDJYMTNt?=
 =?utf-8?B?enFrSndSSzgyMnBsV0JrcHlzTnRWcWcxRnJUd0UzemEwVjVHd2pmdXhZc3Ux?=
 =?utf-8?B?VnNKVXBQRW9POEpGWVF4b2NUb0J2cmtIK3FkTE41cVpXZ2Q0aDFodXp2VnNJ?=
 =?utf-8?B?MVJPcmxyVm02cWo1a1FMWGk2L04rSkt4cFBLZGNlSXd2QzVzZFhLaDFnYWFR?=
 =?utf-8?Q?3YwVkM2MdiKPHN5DFsNe5RBZ/D2ntonJeHFMSjtsH2TiX?=
X-MS-Exchange-AntiSpam-MessageData-1: qDsGnNnEte6N9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffecd04e-b038-4d7b-2e27-08de6a00263a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:30:00.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O3Vh2sgFn5uN3clSf2W3R/Jr9wxq39+jTn8pkpKvq38n803BSxDEMgNYyAnG9OmbaL2taY6V2k/OfKSvlF5zLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
Message-ID-Hash: T36MZZZKRJZQTSKTGRBUQXRILSDENXV6
X-Message-ID-Hash: T36MZZZKRJZQTSKTGRBUQXRILSDENXV6
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T36MZZZKRJZQTSKTGRBUQXRILSDENXV6/>
Archived-At: 
 <https://lore.freedesktop.org/20260212-cmdq-continuation-v1-7-73079ded55e6@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add tests for WrappingCommand. They cover boundary conditions at the
split points to make sure the right number of continuation records are
made. They also check that the data concatenated is correct.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 123 ++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 99603880d56f..9a41c4a9d90d 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -366,3 +366,126 @@ fn init_variable_payload(
         }
     }
 }
+
+#[kunit_tests(nova_core_gsp_commands)]
+mod tests {
+    use super::*;
+
+    struct TestPayload {
+        data: KVVec<u8>,
+    }
+
+    impl TestPayload {
+        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
+            let mut data = KVVec::with_capacity(len, GFP_KERNEL)?;
+            for i in 0..len {
+                data.push(i as u8, GFP_KERNEL)?;
+            }
+            Ok(data)
+        }
+
+        fn new(len: usize) -> Result<Self> {
+            Ok(Self {
+                data: Self::generate_pattern(len)?,
+            })
+        }
+    }
+
+    impl CommandToGsp for TestPayload {
+        const FUNCTION: MsgFunction = MsgFunction::Nop;
+        type Command = Empty;
+        type InitError = Infallible;
+
+        fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+            Empty::init_zeroed()
+        }
+
+        fn variable_payload_len(&self) -> usize {
+            self.data.len()
+        }
+
+        fn init_variable_payload(
+            &self,
+            dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+        ) -> Result {
+            dst.write_all(self.data.as_slice())
+        }
+    }
+
+    fn read_payload(cmd: &impl CommandToGsp) -> Result<KVVec<u8>> {
+        let len = cmd.variable_payload_len();
+        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
+        cmd.init_variable_payload(&mut sbuf)?;
+        drop(sbuf);
+        Ok(buf)
+    }
+
+    struct WrappingCommandTest {
+        payload_size: usize,
+        max_size: usize,
+        num_continuations: usize,
+    }
+
+    fn check_wrapping(t: WrappingCommandTest) -> Result {
+        let mut wrapped = WrappingCommand::new(TestPayload::new(t.payload_size)?, t.max_size)?;
+
+        let mut buf = read_payload(&wrapped)?;
+        assert!(buf.len() <= t.max_size);
+
+        let mut num_continuations = 0;
+        while let Some(cont) = wrapped.next_continuation_record() {
+            let payload = read_payload(&cont)?;
+            assert!(payload.len() <= t.max_size);
+            buf.extend_from_slice(&payload, GFP_KERNEL)?;
+            num_continuations += 1;
+        }
+
+        assert_eq!(num_continuations, t.num_continuations);
+        assert_eq!(
+            buf.as_slice(),
+            TestPayload::generate_pattern(t.payload_size)?.as_slice()
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn wrapping_command() -> Result {
+        check_wrapping(WrappingCommandTest {
+            payload_size: 0,
+            max_size: 50,
+            num_continuations: 0,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 50,
+            max_size: 50,
+            num_continuations: 0,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 100,
+            max_size: 50,
+            num_continuations: 1,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 101,
+            max_size: 100,
+            num_continuations: 1,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 150,
+            max_size: 100,
+            num_continuations: 1,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 300,
+            max_size: 100,
+            num_continuations: 2,
+        })?;
+        check_wrapping(WrappingCommandTest {
+            payload_size: 350,
+            max_size: 100,
+            num_continuations: 3,
+        })?;
+        Ok(())
+    }
+}

-- 
2.53.0

