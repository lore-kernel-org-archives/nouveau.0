Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF6C43458
	for <nouveau@archiver.kernel.org>; Fri,  3 Jul 2026 15:19:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CEA4210E62A;
	Fri,  3 Jul 2026 15:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mnMlyBtK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E6BF646EBB;
	Fri,  3 Jul 2026 15:04:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783091085;
 b=QuRWHN3R7eiODUoNdLrkL+j7CssQkqjq8CnKSbnqC8mYxRGjM4wOFrqaMjnCVTR7XfxWO
 KDlnRRedB0qUbNbmyxKvOZNmW19/sogPaE3eBFiwjQNNeESmDFvT+rsLeUHxFPLZS5JZG1b
 TqBRmnxm+mPdjsrWW+WtkUVe0K6C8BdXxWgeE1yZWarX3eNL6v2T8k7pk0iEDuo4ErbxTi5
 7iLCt7pgBj+cpRQJbIr3hDLBY1Ixd4gCHiow4vDyiVXtNCWTIkbqTcVOpe4dXB/T7zMutw1
 10pyQILb4iHqCT8PfjNVwsjxuLESgIU3ATkVSDBWirM7E/rU6/89ZIwpMPJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783091085; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PJsWbDxlK1lfEc9swedmNLuoU5uhFAQRmSm+tgJfwMs=;
 b=NLN+sr24ZgY0LKQ68vG9c9E+ipPCqN+mrcz5K92SPxhyRnHgYACt8rVWvzZrdueYpjbZd
 vEU1JXEMNoj5mRHH+PxEASxZHJWur/TnJouoDG/HZKkyaYffUUckdccdzydhhRmz7viR0Nj
 n8MX8T40LM48ueIoskv/Ek830XGWALyfgtt5RlrXJxiDcQTJRSj3pM63xW7tz3vs1S6JARn
 HkR4c49WnSSEKAPNMfrCks/CVTOxk0Jd3h+E8jQlMvv0bqvcaCneJzOGqhSc05Fh0cZ8tuh
 m7FaJIsqBO0OZvqg3qCuS8ArKuMG9jKWGHa0tkginA7RGCIY13feq3JSjjdw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 01DD546E56
	for <nouveau@lists.freedesktop.org>; Fri,  3 Jul 2026 15:04:42 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A042D10E61C;
	Fri,  3 Jul 2026 15:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd5m6Emj+TW16fmXTB1pci+NBqwXYENjsKVlpGD9ECAMCq4EcFrxnPhVkkMIW4RcBBI34HG37RaG8Led8uF8M2iHrVrQhWK0ccbQVS97v/TAk8XweX7IU+Im+ztTSRWr01bT95TmQVED8847wafdlWo0alwby0VEPrXLaJBYqd1qna8fahsLtay9GBEHQkZelBLdDUBRqRCdp6q5++t3mjkLOshLuIMEObh3eWu3aCjsib4zYzDtSuX1s2ZI4MKmvbl6Sg6FprEiJjqnSItTfENlHySq7y4E2btiZUFnzKRv9ZmvnwdIJ2hTV8ICwEmJ/p5UdY1af2cxKeOf1lphMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJsWbDxlK1lfEc9swedmNLuoU5uhFAQRmSm+tgJfwMs=;
 b=MlVpoqHTH5ZYuGcvTo6vQxZA6Q+ZxE+n0kqcyo0CHUW8OzzzU3R+YG0Xk7iVG7BIY8GscI80LAzKFruvS7JRoWgLCMnnVSCfzPfhQeTaPtlEJn60ndflIMTsW/V/EmUZR2HLExQ/ew5kD1VFvDtf1hFVrbyh8+L9uh7jaFUOPGMYCPEeMZpBIjXcGjWwGAZjmbSjKHVD7RmG1sfNtW7KvaUQu8+8sdTbGYrtz++fAbn+xA3YfIFkluhIzjw8GmvIRLGcxKcCcA5sivFJ0tqfe5BEkgEUbXe84jqVgO73hHpXrCdlAvDAcNowP1n+1b/iWw7bPkEpQ2edrmJoRjCrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJsWbDxlK1lfEc9swedmNLuoU5uhFAQRmSm+tgJfwMs=;
 b=mnMlyBtKDLgxm2OMOM0mkmruD50fISkEz0+Rm+W8d9qTDm8k5EzC4Q3/8cx1JgWQOS8tPYLdVYIkTY19mOOH12wdO6H9G0SrjIYZE/9oDIZtJiWO1BfN5drpSK7RapWDqpnIAwIgo53cOphJ4MhLrRJv9Y5xq2GkaeWUIDPMrAf7Uv6B439nR/YQdSgOzevGmaTP/v/4/DxTYP9XtMsDyRyqHf+IEvLadGOW7bA/7ZiAPMhnMqJshOpYXFQBXVXCOxGhiHJ9UzunYdxaS+1ZvY7HagMXeCCs77ohgUMUuxtU0WMyOp9GuYgmcxgs0NxNoqKsXfRV4OaEnw5ikaO1Og==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 15:19:24 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 15:19:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:19:17 -0400
Message-Id: <DJP1CGPF8ZW3.3BI3XRFCCYU6D@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 01/13] mm: introduce vma_flags_can_grow() and
 vma_can_grow()
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
In-Reply-To: 
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: DM6PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:5:335::30) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d166c3-9eb7-44b5-2305-08ded9167693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	waK9HC66LHyvBqm/X6oa+SmhtU6o8X1iOE5NifCkoFkl5td3cp7RXlP+HRoyh/cPFfi70qQO5DQzjzA6/Tubl7xExcVdSWQd+1uWXGR2/gZnGhw4MqYnjDvjFzQBfBBDyvbTxCAthTYUGWdeifgcBwOPeuRIdFPiiFRrUf8cI8NyQLgNhYG1d9toWhc/iTV/sMRgjuC0gqZf7KKvfczTA/r5DoDHE8+8uw0r0waNlUYq+kVtsogTd4HMeap1Q/ZGs42D2YrV+r+5WQkQWUapt0DojyhDAdAmhm5LrxJpJK5EtINZouQbNgQHddP19XtOobJmcUt8jShLMIJocHpoBUnvaALynq3QYcf3VBJXViaATppkrRwmpHWnhW9MoQaFLp9BTE3SbavKLcA5+Anm6t+qECfj0oVTwXb2i5QOQvWEe074SxPlzNCClQ6OAFZGUJuEWuCn9futMXAribhavfRqlwDtPIMaz2obrS2xVTK5R2ZKOxYDiTNfSZL85RJTGnykaasKwCuBFvLX3U+DscbIUXiSF/qxXs4R/q6jP3tNiYzOl6jM/E8w+7V/mCisjndwxIaC2DrRoSjttxMZ6IXYMQZBdUWQ0gMF335ajCA/GS4nm1PUrfUwMqdVRVfSiqilkJEQMTsQvGZqvzNXMXkjxvHcG3sxuHOFhqZeEzI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGpZaHFMRFpUd2wzWXozWHFHZE9SK1B5ZHB0c01aVldkSTV4eWRWRWU5OWFS?=
 =?utf-8?B?Ri9rM0MzSjdwMlZyTHFkalNyb2wvQ0ZsSTJUSnlyOThOQll3MEFTcDRHTzQz?=
 =?utf-8?B?NEJIUzVUSkk1Sm96UXlNM0ZZNllxNC9EV2dTV3dwN3JhdWdDYWVZSGFYUWt6?=
 =?utf-8?B?ZjVYb29udGpJTFQ1U2tmMzVBa3FwamoyU3c2Q3JyOW1RZW1RNUNaYjQ2U1Iv?=
 =?utf-8?B?WjRNMHUxckZxcnArY2xtMWd0MXVlMWg1RjZzMGZTdjl1QjhqaEVNeXF1bDBJ?=
 =?utf-8?B?aXd4eW83U2IxdzhCV1VWUU5YdXcwQWFINTM2ck84TTlQdkpsMXRDZEZBdEMv?=
 =?utf-8?B?eVh1REs1THArbElVQi9RVzZuQW1wMjZoRjZJN0M4U0NpVW9sS0NQY0tXVjc4?=
 =?utf-8?B?aXhQM2kwUGE5ZzVGUVlOdVp0ckM5MksrWEluNUhYeENtdzVaNmt6MGh0QjF6?=
 =?utf-8?B?WWlVaTVRd0JUR0x1UUtMYklDeEhQRXJDbHNHaDN2Ly9PcHJtRGljelJvcUtV?=
 =?utf-8?B?aGM4RU9YY2orSUMxLzBBMHkvNmVlRkwrVlZMNzRMR09kZ3BlenRyT1ZZN1c1?=
 =?utf-8?B?SHNTY05SUWFoTDdLTy9ycGF1b1BWaWJSSjYzNTF5RFBvZVFwMEZqd3hEV255?=
 =?utf-8?B?bVRhd3dlRWx3ZUczQzN1Uzk3NVM1ZUhMeEszcWZ5eXd6Z0RONU9qaWRwTjc0?=
 =?utf-8?B?RzdrcEduZTZPS0I5UWc2U1ZlajNQVlc0cXJNV1pNTHI5bDZtQzBnRnhYSFRh?=
 =?utf-8?B?SG9vMTNuRittdGxrZWNmaFZTZzNiamlpU2Riay8xRVlsL0lnUTVKQkgrOUdG?=
 =?utf-8?B?SC9SQkRvdkd0L0x1VFR1TnBYSDFoYXNKVG1GcFVOQ1JLNnA3VDI4b2FRVU41?=
 =?utf-8?B?UlVTVHB3YkRWVFhzeFZtc2YrQzZSVDlwRVYwSTFodlhNbm95MkQ5bjBhTCs4?=
 =?utf-8?B?UGZKUjZKODhnTVI4SU1wRjgvZjZwM0t6Rjg2ZnBYcUQ2VSs3d3VUOUlyYklu?=
 =?utf-8?B?Z3NkMUJUQzJpMFY2WmxWRkh1eEhhbDZFOERtdEh5NE5WUTYrbWxUQVQwNmky?=
 =?utf-8?B?NlpTTUwwVWxtVHlJOTl3cjFtSDh0RjMwUlVIcThYU3FJZ0dlOHdTU3hraTl1?=
 =?utf-8?B?TzdlMHlIaUVPT0d0L1c0SzhEWWlpUGdsbWV1UDFmWDNtYzZzYmZWVVhRV3VT?=
 =?utf-8?B?a3M4Nkpscm5tZnhYVjhMVUtNRk9yQXg1K1QzOUFObURza091SlYveU0rM2VD?=
 =?utf-8?B?cDNIYnhWZkZQNG8vWHVEQnFWcFRVTENRNkF2eUVBYzBjT2FLZm5HK1NjQTRK?=
 =?utf-8?B?eW9HNkRwRXBZWllRRGgwODZqTmNXSWpBVVpPaUF4cm1LL05BTVlLcFJWclZQ?=
 =?utf-8?B?eXZRM1dyMjRVbWM4aytMTDkxc2djWVVacFFMQWFzL0JrczlzR2J2ZXhBUjlm?=
 =?utf-8?B?ODU3WFhwZmRWOFlKUDUwcnMrR3MrQWJhOGY4K0lmKy9qOU1rVUhlRUhtVnlk?=
 =?utf-8?B?TWdvanpBN1ZJaEpZY3BCbmt2aDBWd0Q5QzVONm94Z0doVHVnVFRHRlhYR1I2?=
 =?utf-8?B?SjRNVDgyZm9MYzNiRHhNMnEyL2NONDJtUkN0dVV0aGF0cUNsVmovM1Z4dUgv?=
 =?utf-8?B?dHlyb0J4eVlJVXpkME16N0Jqci82UGdKQmkwNEFaVUc2aUJEZ2Q2NTd2QVo3?=
 =?utf-8?B?b2x0SHBSeGkwVXNmQWsvYlZ0aVIyZlJVNW96R0xkZWpHd2EwZkRFVEg0SGdH?=
 =?utf-8?B?VVM2MzArMWF2K3hsbmgySllIaFJmZlQzUVd4SmRhWGZ3Wmw5WTlKRXBCb0JQ?=
 =?utf-8?B?cTVzT1l4UlpWNU42cHpnc2lnSk05QmZsekR6aDJKNDR3SWs0b0tLTjR0dVJR?=
 =?utf-8?B?UlVJdmhIQTRlcFZ2M1VsVHcvWFVyZWFNMzlsSUFSdGVUV0xXREdaYjI5YXky?=
 =?utf-8?B?VU5zV2tHL0VHdEYyREpSd3FFaUtzaUhDYnMzWFpnOGd1ckJqaS96dnBxbE5W?=
 =?utf-8?B?ZGNSaDdEY2dsQnk2RVBYUzMyOU94UzY0QWRQd21hUHFDV25qUG9ObW0wUWQx?=
 =?utf-8?B?RlM4Y2l3ZW1QQWhCcjhmaVdqMU5QRno3QktZbndYNUhWbENBZCtXbm54OXFo?=
 =?utf-8?B?b2F6dk9XOTY0OG84ODZPWnB0L2RzbVpxdm9IM1JYZ2ZPYkRlZUx6NlZmb1lk?=
 =?utf-8?B?MC91eVNkVm4rekk1UVlyQ1J1anQxRmxuZ2IxSlNVdHh4VlJjSmFyM1hxMnZt?=
 =?utf-8?B?QlBTK1FpRk96U3JZUGcvSEZaR1pDMWs3QnRPVWlnZzV0U1lINjZzSE9pOENE?=
 =?utf-8?Q?FLvWesTPpyJ9tzjTvw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51d166c3-9eb7-44b5-2305-08ded9167693
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:19:23.7516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ve4DjdZRKH5W6DDGg77kv2BkqOMwB0CUDzxD06BnHw7k9x0Ex3i12jMTXkRZN8oc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
Message-ID-Hash: TDOVUHJN5AALGZSRVE6YW23I4FUAWQHT
X-Message-ID-Hash: TDOVUHJN5AALGZSRVE6YW23I4FUAWQHT
X-MailFrom: ziy@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TDOVUHJN5AALGZSRVE6YW23I4FUAWQHT/>
Archived-At: 
 <https://lore.freedesktop.org/DJP1CGPF8ZW3.3BI3XRFCCYU6D@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> These test whether the VMA has stack sematics, i.e. is able to grow upwar=
ds
> or downwards depending on the architecture.
>
> In order to account for arches which do not support upward-growing stacks=
,
> introduce VMA_GROWSUP whose definition depends on the architecture
> supporting it, and use vma_flags_test_single_mask() in vma_flags_can_grow=
()
> to account for this.
>
> Update the VMA userland tests to reflect the changes
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  include/linux/mm.h              | 21 ++++++++++++++++++---
>  tools/testing/vma/include/dup.h |  4 ++++
>  2 files changed, 22 insertions(+), 3 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

