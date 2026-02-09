Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165C5E94615
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 22:54:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E508610E493;
	Mon,  9 Feb 2026 22:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rpyGYUxD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1BD7341E84;
	Mon,  9 Feb 2026 22:45:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770677107;
 b=gY+M/yxa1W3+Bmp/E2qwXgxjtLagHetBki+jpcCQOgSw1CEhiW4NtCF356CJusydvsojh
 dnsqhEKv3qCVfRyTT2kYtLcI2uvnmTGENmw1Jq51Q4K2CB8YRA0AogFF6mHG4upZNu2e6qe
 4CJjt7IERQajR6elEZkZ8n9u3l6L4spOVDcv3I6RHZoHzO/nx7j+0QJfm+1aISt6BtcdN05
 y78e/TpFFdn75wgwkKZ5Cd/qKucXs8JRsWO63wnM3g2k3ALjlHrzMQ5kH0k/vGuEgxdSKLf
 6MCl1rXhlzO90RpGtiq2Ah8kfS97JIGK0jwYa56zlexJ7glG+AwCcSl7ABLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770677107; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KJ6gFmr7LCFoaedtG1JLQSKdFAKWVlaBHPueMWYjcZA=;
 b=KMT5by2E37BmUwlbptst8QqZHsEoSZlRlYOjOHxzddPEdFGC8erMEOMEQ+L/e6/byR4Pg
 AOrwJMwo3WMZ/WPON8cRNXJE0b3FaqahLJxk9HQ+yYbVIpuRzvH65e5UX7fjl07CHp3DMIX
 DL9Y7kDwkw8NdmQ5rNGkk2n2NFGU8spOf1fWtXx36ApXZ96kyuo9FHR9EQPU95797FK8VDp
 wXa0BPhDS/2k5TMSHOOecL/CuSUNtr1wGf52ljJ6G/0SJoaEXncF0K0V2y2J9vfh9dkKJxN
 qvw+GQUJy+lPkA8fiXt9Nw9P16GwgemaGA/o+9d9MGCh4gQ5F8CWBLlrxNQQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 569DF402B7
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 22:45:05 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AEDAB10E48D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 22:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8ndY+YykuRr9jmkIE1lkCEDNErmIJkKmC4PVG45GzX/bASBLE4g3qtCjHsUYDP/ZFgF7/6omW5GCttzxZ58V5xplCiWVktEgh0/5/nwqjOMqOWRBzUwx99POUdi/1dNHbn6GNwmfq87+FGjQsPgUy5jH/Pd19vadxBjPqVJzo5Xs6AdnYqooXUSyIX7q6okK92Jcn1B542+3SWzViITnR7d78jaGI4WcMTeVXCk0xZAAuhOkMJ4gILUs58dVfHrhg8sCA0Z/I7drFKUi6Yk7U9Oux11J4p5qCNWBEBTa0HBCqxtqSj6LlUN+dV/Bmp5uxPWig9MlZNN8El+3cXYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJ6gFmr7LCFoaedtG1JLQSKdFAKWVlaBHPueMWYjcZA=;
 b=hyc7mqysLNqHaoRNvbQ33KD8F3S5tNSX2cIgYbXRRXKnN/l7DICVT0ihztqcWFLxKRHUXPNXBfIm9o/SI5kZ4X3EGxv6VgbYabluoTFwGzN6sK6LzO1JuXz9XeN9fZe1Vn4fKPLLv34kJGWJi2hcRMI0++35qyen3GsBqcfGFeyQrYoAYO+1s8v9HMqkazGvDlxJb7F3fWbEIe0vm5r82+8MiVdbgcCc02WvmqPwCYe+aPKm5hcGmD8A7oGJiPnY2pfq8GLyFB3lIAesnsgRMoAY5G+hjWikvju+n/2Hbz2//3+GQp6X9AD56bEzXCbyXY2hRCptAETw+T9zWpA6Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ6gFmr7LCFoaedtG1JLQSKdFAKWVlaBHPueMWYjcZA=;
 b=rpyGYUxDnvAbZ78+nNpP3BAMmEBWRSaK1apIoSYgjPz39PTjEN3RV0XbpGckMLPxPRN/ec0249zqj/9yJVVZ3eRfX6/+raC/AD7doHDk388H6A75HnnpE0+y1PV3cj11phMl7zKNLvHyuYNvhHLszWUZV9jNDI9hhvalgGPOoUOzbXj0jDUMTweQx5TWVGNvJumjYIAHgA+EfYa/2WNXE4xvrvI3Ajrsm6WEtkFlSnHwhL37b2tzMGS0QfWBNTswXG/9FY/KY0inL3xhhmc4x292fH0BHJcP7i2BbkngI4SQ2jKeiKfD/qy7nPN7Ea8KyPZzWW9LdEvo62JV3q2XAA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DSVPR12MB999149.namprd12.prod.outlook.com (2603:10b6:8:383::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 22:54:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 22:54:30 +0000
Message-ID: <29093339-6562-45d2-a4de-5081c07b6898@nvidia.com>
Date: Mon, 9 Feb 2026 14:54:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: add support for GA100
To: Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
References: <20260209224036.3283326-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260209224036.3283326-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DSVPR12MB999149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8430ceec-95ee-4e87-8f23-08de682e2ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnFsakJHMS9weGV4TFI2MWUrdEFMMGhkakpCd05sYSt4SHJMWXZDK05TNjFM?=
 =?utf-8?B?dnZUUnIvU1AxWkdPRUxZaHhWQ0NCZXplLzdCVHUrV0FsRVdJVTIwRzlJaENw?=
 =?utf-8?B?WjF0eG95WktqWlAxb1UwZ2FnNHluSzU1akErOW0wR3BITEk5OWdIN0dFRFUv?=
 =?utf-8?B?QjBveG01RlNheURRek9pWXVFdjVZSUdPcEdEY0I1ZEN1MGhkSWlvdUpyOEt4?=
 =?utf-8?B?UU9QQWV6S2svRXhzQlpIQzE2cE5KVTk1Z2w2N3o0dnIvYm5HR2E1UXJRT1F5?=
 =?utf-8?B?U3lDdWo0QUN0K2VaN3JtRmJVTjJvUlBRaStDa0wwR1pxOGNsZXJaMWs1ZkZ6?=
 =?utf-8?B?cXNHdFdFeG5wekJmTEJVc1o1WDZ2ZzNXVnRsVU5hR0QvdlZyOXUxZXRJemVk?=
 =?utf-8?B?enc2YUtVbk9tUG1OTkFWUkJGdytYQWgrZVJodjBYb3VDbHMramdjMlcrcUZ5?=
 =?utf-8?B?Z3ZCWUpVbE05cGtPb3pORy81Qk81alZrWmV1aHk2U1hYZ1IyV0NMZjlSallI?=
 =?utf-8?B?QlFLT1FFWGZhWmlCcUdUN0VJU2Y5ZlJFSWRtYVVZdDZON0tQUUdHVzlSR0lk?=
 =?utf-8?B?S1dobmtaWVluQS9ncVZsUnJER3U1RzZPTmppZUVvWHBuUWVKWGtyc0FVVGhx?=
 =?utf-8?B?c3NFdHYvOE5YMGdyUW9hRFhZRkgzWGhiNFIrYnduTWFrbmFQVEV5RzRpTXlk?=
 =?utf-8?B?cm5wMVpNSXBDYVhzbmZNc3c2UDZZeFdEUXBsMW9CbDhEbGpPbytLSy9TSnNY?=
 =?utf-8?B?NXpaT2lNTURFNnl5MzE5d3cza3BmUGtNbnJla3F5bUtIaEFvWkRreVBmd05s?=
 =?utf-8?B?VDFlWlREQnB3b0QyWDNGSHpqcTRaZHlwazQ4OWhuNUVackVESzZ1K0lDbWJp?=
 =?utf-8?B?OFRELzZDQWxJUk80YmNacERNQjhONkpEejdqWmpQc3lEWDdaWGZzTmNQNWph?=
 =?utf-8?B?bVlWMmJpSGVqc0pDWjByb1JPZGtOTmJxR1ZBRnU4Zkt0UTBaM2t2MkRBWXRa?=
 =?utf-8?B?blpQVUZtdnlxbHBsR2VBcVRwQUY3U2s4Z01zR0dDcHc1MkVNVUY4NnNqVUp5?=
 =?utf-8?B?SEtmeTJVS3BpaTc0TjQ4M01DSll6UXJlL3lBZ09nTVhMa2NNWWluNWdRVTJX?=
 =?utf-8?B?OVoyd1BGci9UWGdTM1hrcWtLUWpQdmo3Q045aUNyWk1FbFZ1OXdieE9FcWl3?=
 =?utf-8?B?T3BucVdyWUF3ampnVTBINTRHVUhSRnhMM3l2NFl4akUvbnRjbjIwRUo4cm9t?=
 =?utf-8?B?bEZPODZpYUJvOUpmWG5jU1hLeDRVeGFYYjNGSSsxVkYxSmZQUTJyWnlvT2Fr?=
 =?utf-8?B?T0ZxOU5HNFlFcytHTW1HWXRmY21oREtudzRvbFpaZEVKUERNcEtLRUR6SzVN?=
 =?utf-8?B?cmdOMzNadzJpU1NHVzJZYnZqUzZISGFZWTlLNlE4UDIrS3FlVmtJS1BzdCtG?=
 =?utf-8?B?Y1p1V2xyQ25MYUU3STBvaTFTQlJVVzZlTU5LSHJzSkxGdkVmNU8ySTZMM3ly?=
 =?utf-8?B?WkpUeVVuaFBYVWhZREdwa1ROMmFrT0FEMmJLOE1hc29uVmY2alJrMThPV0Q5?=
 =?utf-8?B?Z2gwWllLNWMxVkNZL2pRT01GZCsvUzlpODAxNVd3K2JKN0tlTzZ5MW9JQnp5?=
 =?utf-8?B?LzFXZkhiNmpDaklmbTI2WGhWNytYVHpyaTBsNEsyVWdHd2p6QW1LR2UrUEcv?=
 =?utf-8?B?N25iVzJxNjZGZXd3dEVldEw5cnV6VC8rcFNEVDFiVGxFR01UanVkdU13a0o2?=
 =?utf-8?B?QXl6NGZUNGVYdnEyZ21vMGVSTzlsdHVEZmdrYjRRR2pOOVZiUjlDV1htdk5K?=
 =?utf-8?B?QjdlUTZLcUR0cDE3aUFWc2FnSXU5TUhWVWxSTTEvb1lDSjk1QnBkVy9OL0lL?=
 =?utf-8?B?Mm52Wk11aXh3Z3dOK1plY3VDTTZrb1VxdWVEWTViTUJPaFM1SDhMcktWK3lD?=
 =?utf-8?B?OUZYK2FXeFlqcm5SbzdTYkp1UXRKK3JFcTZaZjVyKy96bkxSVGZSSGp1U0Yv?=
 =?utf-8?B?dGt3cXhDdCtZdzl1QmpGbElWdjR5RndPVkY3TElwSUZ3QWN2dkVndHRISnVU?=
 =?utf-8?B?NVpnUWs1SHJWMVhpTDMwRmVqTmRpZ2p2eDNqd0ltWXg3aXVLdSt4Z0l4YU9G?=
 =?utf-8?Q?mi9Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YzZUeXFtQVFuemh6b2YzZUFFNFZuSVc3WXZZRGtMUmxNV0ZnaWlBZk51UE9W?=
 =?utf-8?B?cmtaa1BFUlVoM21kKzRpU05ZNnRGMWZGSXQvUklOUUdoYzYyMnZxRmhDT3Na?=
 =?utf-8?B?ZS9oZmNjSnJKODRDa0pCM1QyVmlTMVU3MzMya0ZYYi9EM0phQjh2WEo3Ri8v?=
 =?utf-8?B?L1E5cG5rREJiRWc5L2VZUWdib3NOK3YwN2hIbWtYaFRPMm1UYytJM2RxN0d1?=
 =?utf-8?B?NGZOendxNGhCbTYwVTcxUGVianZHZ2tyWXVFUlpOVTE0Wm1hbnNqQ0ZOQ1RO?=
 =?utf-8?B?RlI5VG4rRVFsWkRtcmp5ZDF4RTVBYUhkTWE5d2Iyeno5NUdhZ1htMHJzOWp4?=
 =?utf-8?B?TWpITHJjRG5OYnphemtUeUk3RDFzeVpjMjkrK0NlazBLZnJpYUl6VWpuM2RR?=
 =?utf-8?B?bVdIeVZCVXA2YUFsMHQ1VnFiLzFBbGd1REF3MXFGUEZ0b1dJR3lIcXhZcGNm?=
 =?utf-8?B?OVpxcG1wQWtXM3MvMGxtbU5XSWpobndSaGt4QW5XRHMrRXR0aHRwSldZSDZX?=
 =?utf-8?B?T3hNa0VkTEJOOFRMcnZGY2VVRTZqSVM2OFVZakpkV1NFVnh6TXVJQTZUeTZU?=
 =?utf-8?B?VGtZTnVrT2dvaHlMQ2NBY0JjSXcyQVhuQ082YkoySzh1U25lcVlTZ0hLUWp5?=
 =?utf-8?B?bTFMTXIxblpHRTNXbzRNUDNGZXBWNCtOSXM2VXgzMXBSQjVxS3dEWWl2cFFs?=
 =?utf-8?B?T2JlckNMK1ZTd2dqelBnMWtEanVYcWpRYjcrb1NuZklKakdMdnpoL1ptZlJ3?=
 =?utf-8?B?Z2M2dHRaL1BCM1hxY21FWVN5MXoyRlc1LzZmOWtndTBmeEdrWTdmeUVqbit5?=
 =?utf-8?B?c0JoV0o1d2FGMWJCM096UmR0bUZ0UzZYRjh2MG9GWVN1S0h1UjVvTDM5Q1pn?=
 =?utf-8?B?cnFNR3JhTlVaWDhpb1lnTnp4WXhEMDU3OXp3cXR4Nlo5YUZFc091ZU4zcVU2?=
 =?utf-8?B?U3lOdXE5VE53NFlLWWh6czA1RkZwaFBkeVZIUUZuNHRGSXN2WjhHN05mM2VU?=
 =?utf-8?B?c0huQ3N4YXVtaVAwVDBXdUtQa3FCSEdlcXNpZDExNTZOcEVISFFoakx0cll6?=
 =?utf-8?B?ZGZTMHZyZmJVTlRWbmw2aFUzWTVvclI3dStwV0xQUVJrRllRYjBkbDYyRmE4?=
 =?utf-8?B?d3ZQMXdMY01QZXhpZnNaNzVaN1ZCeW03QUUwaExMN0VVdGF3dk5yenRqdGV6?=
 =?utf-8?B?QnpXUS9xb1VncHdORHlUQXVDSlJCbWxJTmJHcXZuT2JleFVOYVZxYU5QL3pB?=
 =?utf-8?B?MXVIRkpCSC9pVHRiM0pyQUFrMjJ3a2ovTER5MjZvTGIvQVZTRWtuODNTOVkv?=
 =?utf-8?B?Y3k5d3RiQVVLeU5hM2h5OENJMytWeFdPRzJObVhFc0FMME56KzUwYXJTWHRw?=
 =?utf-8?B?SXJydkFBeGN3U3IvSy85T0hMYld4cVFqRk15MlBtL05VRTM5T2o2bXozVGVh?=
 =?utf-8?B?WTNUaTEweEliWkJtVnNKQzBVSytBLzAzaVdnVkh6MzV2czF4UU1NU3FqVm1u?=
 =?utf-8?B?ZVJDY1doR1ZhdmxyL0hrWjljT2x4bXhva21hMEpPMVc4ZVRJSVhCMG5tS2Fo?=
 =?utf-8?B?TFpnVUdLTkQxY0IrTm1HZ2dUWkQxL0MzdkhiUGZFRWZRSFpiS3o2cEk2bmMr?=
 =?utf-8?B?b0dDN2VDZkYvRks2WTR1SXBsK1Jla0dYMndjZmpSdXBicHpQK3U5ZEovTkdF?=
 =?utf-8?B?Nm5yb1hQTHp5aXBnc1cwLzRYQXhWNCtxL3ZIMFBzZFNGUStvK0JQYmJPelFm?=
 =?utf-8?B?TFl5SmVrWnMxNmFiNzhvcm1rc0ZTK3R3MWYzSzF2SkJpWGhlVFRSUWMwT09N?=
 =?utf-8?B?UjgrdEZrWWlNMGQ0UXIwU3J4cElBM0tYMVVaUzRGcXU3eWJ1MG4yU2Z2SUJC?=
 =?utf-8?B?S2FtNnNYSDN6NG01Uk5wUWdaSzZTKyt1Ni9NS0g5ajVTanpzSXVHalVrbHZD?=
 =?utf-8?B?VVNBR2xCS08zUXRYZVlkK1I5clRWUkZvd1hZYTdxWWkwZys2K0MrWC9pbWN0?=
 =?utf-8?B?NFN2dE5QNnM3L1ZGSGpCTDNEQlQwZ3FiUWFFNGwzSmZ1dDV2Q05zcmJLYWZL?=
 =?utf-8?B?R3BWOW9JSUlMQ1EzYnlWT2daQjc5SkVqdkxSVHVyczlYdSt3NGltREFpdG4v?=
 =?utf-8?B?UWh4SzUxWmlzbjlmbTI4N1pVcm9KT04rbVNxTXZXVzVRRzBnKzNHNmJ2SjEw?=
 =?utf-8?B?alNXQWRBL1JyUjdIMjJUU2YxQk9Ya1lBdzBxT2VGU0RXSitTcUpsQUR4VVFv?=
 =?utf-8?B?MkNxUUNNRklqNXM4QjJsNS9FbU53emJoY0dqaEFaQkpvc3NtYzZKcTV2TFZ0?=
 =?utf-8?B?cjRRSmI0VjdjOXI2bG9EbHJqN1pPbGFqckdUbkNLYjZXSy90VlVSUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8430ceec-95ee-4e87-8f23-08de682e2ef6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 22:54:30.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n2cGpP+X4GN0WhaQk5UcaD0gCsMweC4CojzGKSv9GfmI+hVl+VZb8CqSJxZgwDr76Lf5lplXHWBlg02gb7dAsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999149
Message-ID-Hash: 6OGDBN2JXLKKNOW23IB4YXUOAUWMJQC7
X-Message-ID-Hash: 6OGDBN2JXLKKNOW23IB4YXUOAUWMJQC7
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6OGDBN2JXLKKNOW23IB4YXUOAUWMJQC7/>
Archived-At: 
 <https://lore.freedesktop.org/29093339-6562-45d2-a4de-5081c07b6898@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/9/26 2:40 PM, Timur Tabi wrote:
> GA100 is a compute-only variant of GA102 that boots GSP-RM like a Turing.
> 
> Although architecturally like an Ampere, GA100 uses the same GSP-RM
> firmware files as Turing, and therefore must boot it like Turing does.
> In addition, as a compute-only part, GA100 has no display engine,
> no VBIOS, and no graphics (GR) engine.
> 
> Since it doesn't have VBIOS, there is no FWSEC firmware, and so there is
> no FRTS region that needs to be reserved or initialized.
> 
> Although Nouveau now supports GA100, there is currently no real support
> for this GPU with either Clover or Rusticl/NVK, as both require a 3D
> engine.  This is in contrast with GH100, which does contain a GR engine
> and is supported.
> 
> Also note that this patch partially reverts commit e8b3627bec35 ("nouveau:
> don't attempt fwsec on sb on newer platforms."), which added fwsec
> pointers to struct ga100_gsp erroneously.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c  | 11 ++---------
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |  4 ----
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    | 18 +++++++++++++-----
>  3 files changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 2517b65d8faa..fc730ed05fcb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2513,7 +2513,6 @@ static const struct nvkm_device_chip
>  nv170_chipset = {
>  	.name = "GA100",
>  	.bar      = { 0x00000001, tu102_bar_new },
> -	.bios     = { 0x00000001, nvkm_bios_new },
>  	.devinit  = { 0x00000001, ga100_devinit_new },
>  	.fault    = { 0x00000001, tu102_fault_new },
>  	.fb       = { 0x00000001, ga100_fb_new },
> @@ -2530,6 +2529,7 @@ nv170_chipset = {
>  	.vfn      = { 0x00000001, ga100_vfn_new },
>  	.ce       = { 0x000003ff, ga100_ce_new },
>  	.fifo     = { 0x00000001, ga100_fifo_new },
> +	.sec2     = { 0x00000001, tu102_sec2_new },
>  };
>  
>  static const struct nvkm_device_chip
> @@ -3329,6 +3329,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>  	case 0x166: device->chip = &nv166_chipset; break;
>  	case 0x167: device->chip = &nv167_chipset; break;
>  	case 0x168: device->chip = &nv168_chipset; break;
> +	case 0x170: device->chip = &nv170_chipset; break;
>  	case 0x172: device->chip = &nv172_chipset; break;
>  	case 0x173: device->chip = &nv173_chipset; break;
>  	case 0x174: device->chip = &nv174_chipset; break;
> @@ -3348,14 +3349,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>  	case 0x1b6: device->chip = &nv1b6_chipset; break;
>  	case 0x1b7: device->chip = &nv1b7_chipset; break;
>  	default:
> -		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
> -			switch (device->chipset) {
> -			case 0x170: device->chip = &nv170_chipset; break;
> -			default:
> -				break;
> -			}
> -		}
> -
>  		if (!device->chip) {
>  			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
>  			ret = -ENODEV;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> index 27a13aeccd3c..fdd820eeef81 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -41,15 +41,11 @@ ga100_gsp_flcn = {
>  static const struct nvkm_gsp_func
>  ga100_gsp = {
>  	.flcn = &ga100_gsp_flcn,
> -	.fwsec = &tu102_gsp_fwsec,
>  
>  	.sig_section = ".fwsignature_ga100",
>  
>  	.booter.ctor = tu102_gsp_booter_ctor,
>  
> -	.fwsec_sb.ctor = tu102_gsp_fwsec_sb_ctor,
> -	.fwsec_sb.dtor = tu102_gsp_fwsec_sb_dtor,
> -
>  	.dtor = r535_gsp_dtor,
>  	.oneinit = tu102_gsp_oneinit,
>  	.init = tu102_gsp_init,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index 04b642a1f730..1f7360276744 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -318,8 +318,13 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
>  	if (ret)
>  		return ret;
>  
> -	/* Calculate FB layout. */
> -	gsp->fb.wpr2.frts.size = 0x100000;
> +	/*
> +	 * Calculate FB layout. FRTS is a memory region created by the FWSEC-FRTS firmware.
> +	 * FWSEC comes from VBIOS.  So on systems with no VBIOS (e.g. GA100), the FRTS does
> +	 * not exist.  Therefore, use the existence of VBIOS to determine whether to reserve
> +	 * an FRTS region.
> +	 */
> +	gsp->fb.wpr2.frts.size = device->bios ? 0x100000 : 0;
>  	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
>  
>  	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
> @@ -343,9 +348,12 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
>  	if (ret)
>  		return ret;
>  
> -	ret = nvkm_gsp_fwsec_frts(gsp);
> -	if (WARN_ON(ret))
> -		return ret;
> +	/* Only boot FWSEC-FRTS if it actually exists */
> +	if (gsp->fb.wpr2.frts.size) {
> +		ret = nvkm_gsp_fwsec_frts(gsp);
> +		if (WARN_ON(ret))
> +			return ret;
> +	}

This looks conceptually correct, although I'm not a nouveau expert, so:

Acked-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

>  
>  	/* Reset GSP into RISC-V mode. */
>  	ret = gsp->func->reset(gsp);
> 
> base-commit: 310326bb7df4bba094a3fc60364c641c547fd923

