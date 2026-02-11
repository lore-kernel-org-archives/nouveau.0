Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CBDECD6CB
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 17:29:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F387B10E63A;
	Wed, 11 Feb 2026 17:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MIp03T/R";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3C4A941E87;
	Wed, 11 Feb 2026 17:19:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770830385;
 b=MSfem7567UngnRrgbb5E3lGDG+4LkmRyDqkqsM582rObTBl0tXKGXJ4ogfnD6DrojEuqx
 mKKOYkmurlDd5gStOxgwAYd9dISUha/HP76wm/rQZdjLrnc1y0Ovd6NYEgOap1pUTujSiRs
 CQOfGp/H6BBQiX/XeaksFRjHg51TGRYtZeapIoa4riMyTVg3bUEsb5PO/yLQWE5Ed+PK/8E
 IHzutcMdv/aNzSOihOO5dHS9Y5Y/Px9zfVWzkDz2ZG2pjVI4l6+qaOXFTvRT8Y0JTPTVnVa
 Q35CDnZ4Xf13TWV0cZB9RRnHOrAc+Ij7NuR2/nk3VK8o2EichDLcL3WIduEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770830385; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+lk/3G41vph5voXUQdxEohmcYTDl0x0gP7XaWjUHnK4=;
 b=mrZeUF0GWGxSdJxmmpQuN9yIZRalhVcECDuFspFZItTsB/rCWfgBYagipvccI3DjCoQJn
 GEXJaBkiT6nSHcJ+LVePoXsEAm8QWqVGtxLOK5T75pXbK0+UBCWZNDJVJjkMyjVH61yTd6s
 jJzXdbhjOLpSemNcIM+CzVJhv1uUY9kHwh1Nvaq5DmHw+gnZtiMPaJw6K9rQMrcsW3LNLA2
 k2Qy7urPbcENJZdHX1rAc0fF865m3qSbPBxor/R/nAxM6IJSvixpCVKVP9YoVHAsLyG7yj7
 gJxMiGk2VtRFO5iTlvOVZN/9c53SP9bx/OmQ5/In1t91I+QAWfvGRg/Rbqow==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C566F403C3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 17:19:40 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 357F610E039;
	Wed, 11 Feb 2026 17:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIs8DhvyVJCZxKxxHbIrr8CImX/jRCHp7gBus6eHBY9JJvXnDKybPLWULD+a6T6oI8hmY+7Y5yoNDLZucqSqeHH3NPUch+Tv2ObQTrxh8zGAVE9uBCCDOIu0MAoBYZqUB17Ra9BLx1SXxl1EUj5cZ7NtjxItnktt69JY6IbNDytGg+hJ78CSSSOw/WGtt5jumcNaaOzHRDfnK42Zy88vlHTqNKUFQa2Pl/sDeoElEBgtsc/UMDowXNriwqfmYFKRxWW8HhmYLHhiJpPPLF+yB6JNVVNhiBao21ETaGc6w1ZIX259tzj/lfnwlHKb/pUMvtebQgrkTTWN3HsFW2RE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lk/3G41vph5voXUQdxEohmcYTDl0x0gP7XaWjUHnK4=;
 b=FQIf72U+lAmJS3lg2ntjNGtzOslM8Z16uDBsN5gmnrM4WNg1ElrqvYzrvf76/ORFKGsPQqjDWBnsZIE13hiQTN6pRANMP3xtcuG6WPE1tC2oRTlzc8zG6/9xS8sCRPNok5esJMf6YFOiMs8QDFQuSEMdKAuRFa7akQ16plGXzjE+08YeDs5vGaP0GHXNv2QZUoyX7o90K3H7nnNiV6HwnArmagYkv5dTF+U/FEMxZeO8NctebvX4zaoJnW7vJ58u+jV7/r5cif+1KDT/7nGK5npM+5/Ofs4CAsaatKPUr7+S9NTSosXv+eOarI8n2Z3E8SMQxkTd+uBiXYrp9LMA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lk/3G41vph5voXUQdxEohmcYTDl0x0gP7XaWjUHnK4=;
 b=MIp03T/RMQALG5eued+/F/sV83kiDv1SF18jfiwL1kO4oBcdWe1LiAAZOpotRlv3oEth3Nx/tZ8jpsKIIX5G01t1OLMJkY3W4wfVg5IKktbmHoHaBbE8213jUVqQpsdXXpn7mHh+IVKCcCM7lH6NvguWDD1GH8S7sQOraE85N0ek9MviDKKn+K3Std6vKhSiO0ZGDsigZ4n+LwN/7261I8eL3d3nWzTvQWqzQsU0sdvVy5qCQA4m1hrVfcqGCUgfVwgJ1HSlQvNI5AZ1AmAJw8lfYgvbnI+giOubrS9YDmSpLNZ8hi6Omn+kQe96Qy3Uogt2WDPRCWIiNN/9t2wH7g==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 17:28:59 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:28:59 +0000
Message-ID: <fbc0fe7a-769a-4b0b-930e-8ad0f2828e45@nvidia.com>
Date: Wed, 11 Feb 2026 12:28:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-2-joelagnelf@nvidia.com>
 <DGC0UXBRSOPZ.PG0X6KTEA3RJ@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGC0UXBRSOPZ.PG0X6KTEA3RJ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:208:32a::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 021e39a9-bfba-44f0-5a09-08de69930a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UThObmU1NlBJVmVXK0pWMUl4NXZCQlF5WjB3ZGNoSStWVjUyd3hWQVF1OCts?=
 =?utf-8?B?ZVlnejlRazJaMGFSYUNEVzVuOFVwKzVZTkgvNjkyZVd4ajZZbXNYdGNyVllC?=
 =?utf-8?B?cEtjQ3VtT3NoWHBNZHhLcFRMbU40RDhLZlJzUktBMnc2MjJ0RTVBMEx4dFhu?=
 =?utf-8?B?OUJRVjZHNVhOV251Q2tDd3FhaU9NZ1JVQ09SaG1VODI4cEtxMkZHdjQxamNz?=
 =?utf-8?B?UUNoMTJPaDNoNGhNUENDTUpPdk5HaFVtVzJUMnBpSDdtdnI1cEcvZVkwdmE0?=
 =?utf-8?B?RkJYQm41M0VxdFJQTk43N3FkRUpDRGh6Y0NUMER1VjZodEpST0VGeFhRMjRW?=
 =?utf-8?B?VEYwMHNxbTV4VkthODRRR1JUZkg0NE9meEVMNWFsTnlXRGJxUks1U29aaldP?=
 =?utf-8?B?anY5ajZESGNMNXl6RW9Pa1dUS2U5NVpMblBWTzNhT2REUkhFVG1aMi9QbG12?=
 =?utf-8?B?M3FQQ0tPVXA0Ym5yakIvaFRPY3d4b2ZvMnZGS0JObGhpVllJZWduZHBueTBp?=
 =?utf-8?B?SHR4STB2d043eUJIQmkwS0plUEhhV3NSeXdudUVnZ0FOcjdGYkRuWDVVaDZV?=
 =?utf-8?B?Tk5ieWZhZTVQS0NJdi9kOXdXM3oybTQ1Skc1azJic2JZb3MzMjdHaEp0QTMw?=
 =?utf-8?B?bm9SNndKR3lPYWk3UlQ1V0RibGlWM2xuSXNEWE1CQ1RxZ2o1N2FpaXF3VTNh?=
 =?utf-8?B?RUN3OVpSWUlMS04rNUYyT3dzSDFaWE9yQmV3WWZlV0pmeGZFZXRDQzdGeE0x?=
 =?utf-8?B?cXpSNFcyZmlldzA4L2pIUnJVUEZvdVlZTkdFQWhpaGFaaW1jNUlMV1h3azUy?=
 =?utf-8?B?QnJEakhJeFNyUFJzY2RVVXdSSlFMZ1BwWGFKU3BvZG1jcDVTamdQNUc3TURj?=
 =?utf-8?B?c3kwM2VmWEJsd2Ivekttb3dndnpROGRRR2JQNDFNOTE2S3NsYTZ3OWVGbG5S?=
 =?utf-8?B?YXFPWThNNGZFRjMrYmlmSGJEb2dPV2NuZ2JFVmhVa1MvNlZielVOdGNtT2pk?=
 =?utf-8?B?QnlEZ1E2NEtlTGtwOWxKVzh5OXgrYUJPTERpeWp2RExLOFd6NHRLcUoxUS9a?=
 =?utf-8?B?MjRNcmltRUxBQlRsbng1OVpwVmx3K1RUcWNaa1pPRE9keTMvMG9TRFlhWElC?=
 =?utf-8?B?cWJ4Nk9YbFdUa0lNb213dWRRWi94RmlZekQrSklpazVZMHEzWFc2Yi96ekRC?=
 =?utf-8?B?VnhtNVJ3Z016NTRHQ0l5WW9OdUM5WkFhOThJNkhXUVFielVySDcwNGEwaVkr?=
 =?utf-8?B?Q1dOZkZTak04RkNDR09yb1VZbzk1c0NGby8wNnlFNFZDc2dFbWZxcGw2eGxz?=
 =?utf-8?B?UzdBbXYvenRaMFdFT1JReGlwZmNIdkZSbEdGRVczWURCLy9HcmJtbU5iY1BR?=
 =?utf-8?B?ZmNDdmxUZmVnWGRkR3RsMmVTTUxDVDMyamNCYk9PNXFkVG5FMk5WblVja2tM?=
 =?utf-8?B?QTM1dmswRXg5YXM1T0V2R3NxeS9aWHorN3kxcGpRWnM0TGdlNFZRdFBmZU40?=
 =?utf-8?B?cjNZWE1aTXBXaFhTcjdIVmo1WllNbHcra1lySDJFZlhITXRkU1ozK2pUTk9Q?=
 =?utf-8?B?R3VDcHBNVUlKcndGUXZxSVRlTnIvQ2tDVHZuNVBud2xxSHBiZ1BtaEpNdERn?=
 =?utf-8?B?VDJrZHQ0Tm4vM3Z2TkdPTWQyL2ZJYTdqVDlJN0VlSTJ0N2pWanh1QjVwYzFU?=
 =?utf-8?B?NlBpYm5uWlhIZlQrYTMwczQ1ZzFXL0dDREVKaDZMM01CNjB6Rzl1blIwa3lB?=
 =?utf-8?B?cVB4a3l6VlVlaXh5bTlMWlpjTmF2Y0pTWjl6M29oN3VadkdxMUM3ZzlCQ0h6?=
 =?utf-8?B?QTZCTG80b2V2NkVFNk0zV1R3WENlaVBweE9DVE9ZV09xUEg1SmhwclM3WHVj?=
 =?utf-8?B?dklKd0k2d2dsZ2pyYnUxWHJZSkl6QzFGMnZlSlIxbnVwOWlwcXZaTWxFcFg4?=
 =?utf-8?B?SEl4SHBmdklNRlhBVVhLNXI3SGZRQ2tGS0JyWFhGanFhL2lVd3dDdHVkdTRQ?=
 =?utf-8?B?cVdaZUl4S2JDTi94WjgyNGg4M3lKWERJcVNSTFlSV0NhaHBXdzQ2Y0h0cEN1?=
 =?utf-8?B?R3dnNVU5ZlhaRThidlRqVWVERnl2RU9wemNFSDU4WTZ4VUt3Vk4wWU9lVjMv?=
 =?utf-8?Q?rx80=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWR0c21aMGpKK1BIbHYzemhGWnRMNzIzZHE1MmxndHhRZWdYajh1aERZK25l?=
 =?utf-8?B?NFY1eHI2eTB4Rlptd1BhdTVzUDVCY01ubXI0M3ZBT2lYcWZrS3dWdU9yUTlF?=
 =?utf-8?B?WHV1ZFpXMmpsT3NwTnJPMUVoSW9uMDhDdmR3aHJFUFdya1dVZlZoek14Z0pl?=
 =?utf-8?B?aGFGaTZ0Y2M5NmVGVEhDMGtRVjB1d3pjRzJObm1tdDdvdlkzbTJEb0owYnV3?=
 =?utf-8?B?bkJvSlozWWdyMlF3SUV4V3AzTlIwbG5UYlhHRExGazZzT0VnRU1tYkFHVTBG?=
 =?utf-8?B?UG90NTQvUlhaWUFLaGdHcU1mUzd0ODBxWW40OCtCei9lazV2VjRLNjNkSkY2?=
 =?utf-8?B?WHBmMXJyeWFYb0xXYURkUVJLakw2cFZXU2hEaldJSTVxSFRxMWoyUWdRdnly?=
 =?utf-8?B?d1JjOG96THJCVHdGc0lhSlMwRERSemkxYW54cmlTb095aHdEYVdEaW5nTFJa?=
 =?utf-8?B?eVBlUGt3c2FrRENYVFZ5ZW8xR2FUdkVicDBTTjRMZ0tBMFhxM1hjRzJxbEd6?=
 =?utf-8?B?MlZJdWFRdE4wUHBTSDdoREViVVA2a09GU0N3aDhlSy9JM3cwaE4rNGhXUEIw?=
 =?utf-8?B?Uk16YmZjbW4vVkhSME12bGJrbWJ4cjlQak15OUZVRi9hMTJPV0JLcHZvdTdM?=
 =?utf-8?B?MmJFTWpSTVpuU0F0dmJsMm5aV2VoTExWQVJSbTUzNUVsWlJUdWpJWm1mWS9a?=
 =?utf-8?B?RXNkdjgvdUhWck01VldZTGw0eGVSVVptVFdHSVlINkxzYW50cmZuRWsrRUt5?=
 =?utf-8?B?K0hYWW5NOHNSUGJwU2lLRTJDTnRaTWs4ei9Fb0xFcXdWWmhHTTFuWWowdElS?=
 =?utf-8?B?eHpHYTV4WTRiR0RqWXM3b2M4YzlLckJjRFV4U2JoTk8zcnRySHU5VTNDMVlQ?=
 =?utf-8?B?VDdOc3poWndwT08rMmFWUlk1aDlHM1hZdWVkVWdjcEJLTlZLaGdtZkxmOWo2?=
 =?utf-8?B?RUlGQVZXN29VUlNGUndkdlcrYzhpUFpQeVlwK3RXbE1BUkhka3pwc0lxY3N4?=
 =?utf-8?B?emJTeUI5b3gvZE5kd25KS25hTWsyWXBNTE0wTUdTZzRuZ1ZDOWUzQ2JWMXAy?=
 =?utf-8?B?WVlXcjVKVmZReURLUXkyTjEvMmxZRnk1QnBoYUxQQm1EN3VHUXRBbnpDNUdY?=
 =?utf-8?B?WkZvVFNERzJjOWZLTHB6amVGdGUzSXdQVERVVWJXdWJyQnowNDZNZmo0SXV0?=
 =?utf-8?B?b2xoZFdpamF6TVd6TjdlR0F4VFoyaDhhK1Z0TUpYL0RENWlzYytnQ0JpOStw?=
 =?utf-8?B?RXpyQ3U5SEZtK0xHNWU3dHBlV2lVK3M4bFpSRUNqQlRQaUFyMFFweUJhVncz?=
 =?utf-8?B?SlprZFNrVFM0ZUV2WUdHY0p5Z1ZWeWI1Z1AvZmdXV2tkeFRVVjRMZUhIMHc4?=
 =?utf-8?B?K2RjK3U0Z1B1UlViWk4xK2tqNEY5ZEZxdjk0SFF6ai82RGRiYklWL0hjVW1k?=
 =?utf-8?B?K3cvYmlHWWYrYU05SXFZOUh6Y2o4UGZSZTJPN3dlTHZiMVF5cnc5Uk1CV0Jn?=
 =?utf-8?B?QkFwRGp1a1B2SXRFSmhXS3A0NWNCMDlBU0JwSXhWK0RQdGN2TzNITjRRNUV5?=
 =?utf-8?B?NE4yNHUzUGlGQXFQNForNEN0aWlWMFYzajMyNmZ2VnFmaTdGS21Jc2ZSS2ZP?=
 =?utf-8?B?QzR0NW13LzZBa3JCSFk2UldCVWg4OWlOWVZSdThELzVlMEdubkRzMEova3Fz?=
 =?utf-8?B?QURzVk1mVFBiUVIzV2dNNGdFbjJ6WnUvZTE5YWJsdm1tMFFDV1RXcEIyS1Y2?=
 =?utf-8?B?TWpOb1F4SDZqL3VyWEE0UlZhaWpGcFFzQnF0YWdRNFd6dTdlUTBOMEt0NEJv?=
 =?utf-8?B?OTY3aUJGTmwrQVVCOGM4Rmt5WGdlY2k2dW5CdFpWeDNIUG1OellVV2wzQXI0?=
 =?utf-8?B?M3RzZlh5dC9sMm56TkJjNEtiMnlXbVJrVUxWUk5tNDFYa0VOM0ZPOWkwK1di?=
 =?utf-8?B?U0NEN0hrVHg4K21yaHdFZUJjbUFudXBNcno1L21sc0ZvTjlmZmc0MGF0emtr?=
 =?utf-8?B?eENwRW1nT3A4MG4raFVqeS95RmpZeFF4a093blVTdVlCWDJOR3h2YlcyUzR6?=
 =?utf-8?B?Lzd5YkhiT2MxZ0hCaXN4aTNZWFZadENlT3JhaHdpK0YvbGt5TEtORWpBWFJX?=
 =?utf-8?B?MFJzOW9qNDFld0ZyVnBTUmcvZHBPd0xMVEExeG4zTkFMYXFISVk3NmFFdFRu?=
 =?utf-8?B?NTBlSUxJT1k4Qk82ZDBpTzlzNHBnV3hpT3JUSXk4RU1FNWlGN0l4UGhQNndK?=
 =?utf-8?B?RWRQRUpjZkU0WWZVS01CNE56WndtdTFIc1BwNkE3TjJXNXRRS2M2MlAvdHIx?=
 =?utf-8?B?SnBBbFJ2dU5XaWorTE5YRUJrQ1NIZnQwbzdBSVIveDA5QnYveTBDQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 021e39a9-bfba-44f0-5a09-08de69930a52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:28:59.0998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QkjH33tpH/g490LZeI1nPiQCayx2GGl2MoL5vu1GvJDvKlnjLt8BnD0p/cEf52SObGunu0/2UmrsH1KJa6viRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
Message-ID-Hash: CXPJVRIESKDQCLGK27W4QSG5GNAQVEHA
X-Message-ID-Hash: CXPJVRIESKDQCLGK27W4QSG5GNAQVEHA
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CXPJVRIESKDQCLGK27W4QSG5GNAQVEHA/>
Archived-At: 
 <https://lore.freedesktop.org/fbc0fe7a-769a-4b0b-930e-8ad0f2828e45@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/11/2026 4:23 AM, Danilo Krummrich wrote:
> On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.
>>
>> Typed iteration over actual items is provided with a `clist_create`
>> macro to assist in creation of the `CList` type.
>>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Acked-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> I think you forgot to address my comments from [1].
> 
> [1] https://lore.kernel.org/all/DGB75XMWML8M.DFZY5L52EBQF@kernel.org/

Indeed I missed that reply, sorry. Will address them.

Thanks.

--
Joel Fernandes

