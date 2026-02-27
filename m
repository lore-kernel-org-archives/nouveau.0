Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA17FEFB4C
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 12:34:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5246E10EB4A;
	Fri, 27 Feb 2026 12:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OjoPhStL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 71AF044CAC;
	Fri, 27 Feb 2026 12:23:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772195038;
 b=iXlv2FYRj6BECuf/qX/Zpy9jFwWI7mQOmGeIibLBNRiXqvErJfddVEsm1esNUtJI6iqKo
 P86sdNvS0BeYN4zCrjEiLFCURXhwKP9D3i3dxcbkQIL4VZTcuHLsZBNRAmeT42nWgUCC7n9
 LnUxGb4emfd3FUPg/ztV5kB0HdFkhVsOw5GfeRDeLZOEB2rlwRDihVDdKW1JkOeByG7GSfF
 9sFQKp/XlwNE0AEdoiQaeR2jVLkDCKiSgz+1m8HO8sgfPNCJcWjiTfnFr71znJGAD3ih73N
 M7C3QIA6VlZPlEocCtIjIf1DxuUE7fbd36yl9Sg6ha+WhEUOCnX6WwnDBAvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772195038; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qZ9S3HQHvMdRn4u8U1LV8Zcbl4liAGJkFutSnpVVJiM=;
 b=Z3U80HW10Iv9HsScAl6psXCEz14KmV7KWebdvXcG/OUz56Ei6fMl7iaf8fwLAUe9kEHqo
 UNzNaB0VIGlM/hygtkbDheqnGGwS0YT1kZZjxBOf8xA6Lw+V0Mrh3OGsYeWy7HsOG+KSz5r
 k6xIOW+GZMeJsLIs4iKsjxSqImQko+Jvw4jl9KD7SBVuiY2X5A0xcX0h45ASKMRIox/C6JX
 QOmFjww5E4nX0Eieyb6O1ntV7V9qOTKYAtm5MSc89On/J8WBuEJ7GC1yhZxcKmxk6F3tPPW
 MXlTqobYYKKKtzRsAKUzrA3yPBI1oeonMFpUaEflApynMt3UIZPcJGpuGz6g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0237444C9F
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 12:23:53 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5D9510E189;
	Fri, 27 Feb 2026 12:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a36FOqLyUFU0zB/FA/Og+00yFiJlzNhLSr8G/Og+J6MH8tQ3K5SfzA7RILclNklcrtY1GbMIMB7JktBdCpErVOX6bDJmKlH7hjgCk37nEqpob2IcBKDIvVgRwB9roMDGN4TknNhx5tYBhYJQwaTCauyNb1XB/gz97nG5DOzD+7b8AXZN8Xzd6gPhdXmkkvU/XD5ouimZDN3drFa1U3/zD6sEufuniBqcABGbXQ7cl8Jm3l/DCXQMctaWDj6TkW8A++5ahBspbLW3+A9k9GUmfx4bMZw9GPoxp/HR/iiutjTBwQ+xakPQ/x1eitxB3Nz2D5len1GbvTaKeXy5LO9x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ9S3HQHvMdRn4u8U1LV8Zcbl4liAGJkFutSnpVVJiM=;
 b=agNoczqFkWO0roiSE/Zo43Q2yOcctByQszCH3Aa2uH3F8bUcnD1ARZgoVlCUGS8g0pgbQg3yGgRq4BmT2zwlOPLSROj4NNlbCVA8d8x12/C8DcmsqE/33t8/wEdaAeN/lh80bGacCE8nOgIpbcdJN/2uZltrN3L1tzAavI7jSaekzog69Zo5nmeeTDGVvakoTD3B7L1TnnK5cjJGo73un7CFwY3W/E7vEoaimfUaB8vbv+yNc4f2LsutOHAv1HYFfXhY+23XbDf73+lkzKDtQsb98jrmXdFknAjPR08e+4W4bJLHGhxuRqtCTZY+OaAgbc5xf2KmsNTlPxTrohDr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ9S3HQHvMdRn4u8U1LV8Zcbl4liAGJkFutSnpVVJiM=;
 b=OjoPhStLCM5E8jqnsTozKmqEjPUw/znoRxfV/i9kzgelKHKcNUoFp+mtVYKVCZkvsfjo3+lo5EWQ3tiFwzppFPF+/APJzEhUSWLnupFNUYl8jvEP456t6u5mgKOqhSXXFbLS5Nfs5busQGW0tGhy4Mrmc6YF5rZ7j0JQXVs/d+eR7TeOiURnij91DxZPoxk5YiiO8zZzSC0CMDH2b8VABxzHLa1XFDmflSgf+MoYXkAm83pyiDzXNVjuMSJbh8uwPtNG7ooqK2nNPDwIRiFMvLhXT5VgnJXhaU+08DH2tP1DfIDtAYY8rUNXXYPJDvF42mEd0P4bm1lccQsO6YVo1g==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:07 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:07 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:11 +0900
Subject: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a30342e-780d-4082-9900-08de75fc5c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	Dzn4b297p3rzk5ugqv+xdLx7zsZzVMbkF32Gis8o6p/zpJYVSLegTgSvCNpPX4bdkiDHeFyLXBTy92iZ8B9WEh5gxqDgays10A7kqflspwp0ZGGI1P07k31xUVEBsO47uGtorxmZPVd57yOqOW4Ip6iopWJw1mjvopq20VJdfcOpnj1frXBxEE0eAmjiX8WwSyKJDd8OvPVuq3pYzStGG4KDExZ5NBs/RtEhEVXQgxpdJiLqi7VsivZLsCdGx78CWDgzwmXhLlmaA1L4Wxpb/88rp4X5JApg/CJM2nUCU0aYF79sa8LOQER3H7dvT/7vK+sCuxUsOf7Btqy7Y99th2HhBdGBnA0UgZp0qas07U5D7zTLCEpU9JEavw4aZWAHDnlj/LAvTTfzkLGgdMqjZrf3caB/q5OCe9u1eC0GZvk+ZNAKIxQp4Yvc0zENdp0TPcii+bLjjtnWCybD5+MwSdtkakk/Q1l01MWAGjUZtkYFLqr8sWL3rmsWUW7LIcG+rfJmWLnWZl6vFm2UgnJvGLucwydV2AlMgtIfqAADqpOsif1lChbB01Me+Ny1bun7jMk2W7P/XrEHWe1YgmDmW5/r/jGWf7//sXH3dEP2xpiFuT+mvMbgfSLPU4Y1V9RDnIMTOBqK/84MrILbmIbtErMdg68zbhc9kxf9jlB+++P9rUzOYHZsU/A4U9heWY+rs1JbP4znU+48tCMY94gHRazjwFD2zbmmDi3/jkp0cSs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dW1RNE9VWkNkMUR2TlViUThhQ1VuNVlMWCtkQXU5Zlo4NEhKL2VPeU84L1My?=
 =?utf-8?B?TWY2RGhHMVRyazRQL2ovblNVdGo4OEF6M2lYSFBKUGl2aU1JVWhPM3ZlcVgv?=
 =?utf-8?B?cGtvdnUyTDEwQmUyeFVpUVFWQXZ0Nk55bkFMUmhQRTlROEQ5ZTFNekEzY2VK?=
 =?utf-8?B?REZmWDUrcVIzYmxKR01pVjRuUEppWEhDYkxHcFRJYXkrdVR3RU5ZbVRmMEFx?=
 =?utf-8?B?b1h6eDhLSzRXS0UvejExZEFyclZtdHpLbFlLSjc1NHo5Q1kxQUtiWVZVVDVI?=
 =?utf-8?B?YXhGaTR1MkordVdsQ0VJT2V0ZHNqWUgvUysxeW1hbnpjb2dFemwzRmw5ay9u?=
 =?utf-8?B?UlFYRjMrVjhNL3ZYbVJ6RGlMTHUzM1pHb25SY2dPVTBCd3B4L3hJdjRaTUJw?=
 =?utf-8?B?SzlUR3Z5cWNWWnZieUdERkorMUJQOG5BRjh2eEFPS1BJbmF2Qy90cXVGRkhk?=
 =?utf-8?B?aDRCaENRcFIyK1lST1dQMjhZUUF6bWtqejEvWkxTeDU3STcrQjhBdFY4c2w1?=
 =?utf-8?B?Ny9OQldNdjhDT2trTk54KzNMNVdrNGVHYkdlOU9oR09RRFNnQ09RK05LYVBw?=
 =?utf-8?B?VldZeVc2RVZOa2hYdW1KV054VWxrQjY4cDNFVEo1Sjh6dXZ1L2FOY2NJOU5U?=
 =?utf-8?B?MnRncnE1K2ZnNUMwWTA4L05WNklGVDhkeCtySG5rSEFFREMyTWNBQ283ZXlj?=
 =?utf-8?B?SjRMcDNDVE1LOERPTnlsYzBXYmxXZHQrMGROcUFGS2RvZHRlcjJuQVBTNldw?=
 =?utf-8?B?NEg4cmZrdit6WFdjKytNc0Y0ZGI2K003SzUvandXZUV4b2c0Qkw2cnYvaHlV?=
 =?utf-8?B?Z0ZYYTh4Y2REai9Ud28weC9KcTNEeEV3S3NwUGxEL29QZ3NXTStsb1F5V21L?=
 =?utf-8?B?Rk1mcEJ1Uk80NEhyUGZSUmlXVEVWeVlPLzIvK2pjSXQxWlZ5bExaL25kWjhD?=
 =?utf-8?B?eCtGVzVsb1lFeDA5YnhpTVEwV1IraUM4U21DRitzdk1XbHQ4MjU0ZjRuNUZo?=
 =?utf-8?B?OGRKQlNodVdIdU10cjNhblN5eDVHbWNrQVlqOFpHNm5rZFRaaDA0YVR2T3c0?=
 =?utf-8?B?azJqRDJXUjA4NjZLbkRQTkhUWStMMnovQ2t2b1N6bUNNT3c0eEtNOG9UMVRM?=
 =?utf-8?B?QzZ1ZU15Tlo4ZFNjdXQrR3dXTWJ2ZkoxMHVjUFlKUk80L3pub0dZaDZ5NnRK?=
 =?utf-8?B?RlhYVExNbWMxVmtNS2htQ29aUXk4Qzh6dGtDUzJaQ1ErQTJ5NjV4MDRpdEFQ?=
 =?utf-8?B?ZHE3SnozOUI3OTZIRnJNYklVK3BHRnhjS212RTY2a0huZ3BCRUN3cHRzODVZ?=
 =?utf-8?B?UkRUWGdkMHEyU01RemV0M01PUitNZHB6aFhQY2JKazZCZkU2c2JpWWg4N1pn?=
 =?utf-8?B?ZjhvalowOEhPSWc2S3RnUmxweTgweTlvblQvOFFnbVVxbXM4YWh3MGtNRnRQ?=
 =?utf-8?B?bkdNWWJGV0ZoekEzNEdFdHNsR204Szd6Mm16N1ZxNkwxSytuWFZmVi9DU0RT?=
 =?utf-8?B?eWdCcVhrL1NkUWtvTXpGNjlWZkYvZ3JTQ0pjOVdmK1J6UkpuVkN0dVFQcllI?=
 =?utf-8?B?bW85c1RwSzVPSzdwRG51RkZlOHNYRUNReVNzZ1kvWDkzN2IrT0JOSXN0WGRG?=
 =?utf-8?B?YXNtV2VlMnJJY0liTXFoWnErUGxrL1NoYnZOYndWc3dWUmtyODRTT0tIMEI1?=
 =?utf-8?B?TWpIamdZQXBWaW0yMEJiNjRJamlaYUZsRGZUVnRnTWJrTkt4cWNPbFJodTNa?=
 =?utf-8?B?SGd3Y3pKK2lzMXdnditWZXg0Z3NnTFYzV1BFTjRzYzgxWi9GMmJhQ1dFc00w?=
 =?utf-8?B?YSs5RGh5bG9Ta2o3RnA5R082UVNZT0ZGVXg0eUt5anhOYlZSa3BwVER6Q1cv?=
 =?utf-8?B?L2ZZYjZBeEtQOENzYTY1aytEZG9oWktWbW0rOFJsaWtYRUYzeVo0NFVwUlk5?=
 =?utf-8?B?RU1KQThEa1FDZStuVjRSaHlPa2V2cVh1di9aNXZJMVFweXZkTm41YTBZV3cz?=
 =?utf-8?B?WTE0RHNFYm9DZmlHMEFpdVlFVEV1cllaQkFuM0pLbC92djZRUi9mMXZZd3dF?=
 =?utf-8?B?Wjhsc3JiZkNEa29SQ3lwRjJxUzhUbU0rdmJBVG8rdUhOVTkyOVZaNVA0ZEUz?=
 =?utf-8?B?ZUVtQzRjelVpN1k1ZW13UG8xdCtSekFrbzhVNHYrRnRrMXVSWklsbURBbXdY?=
 =?utf-8?B?VVQzb3JPVDRPN0o3cWlvU0dmUXF2clpORU1HSUp5MDZkTWY5dUlBQWlydUwr?=
 =?utf-8?B?Z2ZFRG90UHNzYzBhTWRWODUwdFphT01VSi9xVmpuVnpLdmQ0eFVPcWlpNTlQ?=
 =?utf-8?B?NmY3UDYxK3JGSTRxV0dSWERYSisrbkNxcUdHQ0NiRkU2cUF0d1NNREZMdEJM?=
 =?utf-8?Q?NcWp8ayfWkj3McVpeTBUbH75JM0WYjaTerbuYdHP11ZBZ?=
X-MS-Exchange-AntiSpam-MessageData-1: F+mqrC1p9DnjbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a30342e-780d-4082-9900-08de75fc5c81
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:07.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GE2R9cQ+lac8O4PiIR+LZrG6emWinMMc3mOvvERLSFwo5xFBmcXf4sCr5JsxGGARjC4DPtJDdUYXuZWtU/5cvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
Message-ID-Hash: C4FFUAXNBGGHVGY5IWEK4QZMCCDSQRQD
X-Message-ID-Hash: C4FFUAXNBGGHVGY5IWEK4QZMCCDSQRQD
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C4FFUAXNBGGHVGY5IWEK4QZMCCDSQRQD/>
Archived-At: 
 <https://lore.freedesktop.org/20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add general `flush_into_vec` function. Add `flush_into_kvvec`
convenience wrapper alongside the existing `flush_into_kvec` function.
This is generally useful but immediately used for e.g. holding RM
control payloads, which can be large (~>=20 KiB).

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/sbuffer.rs | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 3a41d224c77a..38f8a8426521 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -2,7 +2,13 @@
 
 use core::ops::Deref;
 
-use kernel::prelude::*;
+use kernel::{
+    alloc::{
+        Allocator,
+        KVec, //
+    },
+    prelude::*, //
+};
 
 /// A buffer abstraction for discontiguous byte slices.
 ///
@@ -162,11 +168,14 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
         Ok(())
     }
 
-    /// Read all the remaining data into a [`KVec`].
+    /// Read all the remaining data into a [`Vec`] with the given allocator.
     ///
     /// `self` will be empty after this operation.
-    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
-        let mut buf = KVec::<u8>::new();
+    pub(crate) fn flush_into_vec<A: Allocator>(
+        &mut self,
+        flags: kernel::alloc::Flags,
+    ) -> Result<Vec<u8, A>> {
+        let mut buf = Vec::<u8, A>::new();
 
         if let Some(slice) = core::mem::take(&mut self.cur_slice) {
             buf.extend_from_slice(slice, flags)?;
@@ -177,6 +186,20 @@ pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<
 
         Ok(buf)
     }
+
+    /// Read all the remaining data into a [`KVec`].
+    ///
+    /// `self` will be empty after this operation.
+    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        self.flush_into_vec(flags)
+    }
+
+    /// Read all the remaining data into a [`KVVec`].
+    ///
+    /// `self` will be empty after this operation.
+    pub(crate) fn flush_into_kvvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVVec<u8>> {
+        self.flush_into_vec(flags)
+    }
 }
 
 /// Provides a way to get mutable slices of data to write into.

-- 
2.53.0

