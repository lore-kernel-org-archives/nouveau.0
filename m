Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89612C54FD2
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 02:20:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6AF10ED98;
	Thu, 30 Jul 2026 02:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mlEUCFen";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EC7B5474D9;
	Thu, 30 Jul 2026 02:05:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785377107;
 b=YLiBegLOg3YTI5tURxGAkH4ivYyocSSQ4oV+TV5CDpCbxLMmChYhmaZiKVO+15TAVP8+P
 Md8AwfCOz6uN/9kwYyEKu2RSjBHv9tXl5EmoitfdA/FRNo3sJvYJ4DJQAs/aI6KNaKsEDzE
 RIsRCRSEOy5JrdO6Hq8lEBDtLdpOShEzPxORiUVwXAbRz6wktNRlY0oB3vWuwv0R4Gcl6g+
 1eu2bYKRiomCxw98hHMRphiR/kjTGryEs4KTxEGNaXpZ3ByB8L/QvbOOczlLdiU6zgq4UAL
 bRN5xel7makVBeb/mmd9nKX6d8HBf1BwvYxZFYRx4T0D6hk3Q5YWNMw00o5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785377107; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YWTt1Imo14j7p7V3caBKmt/ZYpC6/bdVvCw+TFuy7eY=;
 b=xJ0bRXLyx3XL9feA3iV2kzFJ/TEp9Ke9GTV+1bPmjNUx4IK2fiL1Y5IMrdl/IR9zs/bZj
 SOvpudDJd8RskTNKhWELtcwNcYawcqIM2JTcLHRqIhfWLajqwqWr3Wj6tJPJaXNmmEsQwkT
 efwivqTf1TB6vIcLZD3A/silce4ib+VnqQpozTsqpuAdTY4xO3TO7aFKPUhUycvk716NTgL
 1pX277vkMtLbZoBkaPDaEudfKUdzdSqZSXbNbE4FIrMXG5DpSCgqrnTT4OooCPg96yG3a3L
 W1DtQc2alRg7ji63mmBB0A6rvWn8nVf1REok5A2FV+39aNVStJ2qfMNSo1DA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8065E474BE
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 02:05:05 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C75BA10ED78;
	Thu, 30 Jul 2026 02:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBUvyGK7x9JGQCRfSm7yGDikfzBUm1iDma3A/R4Gu7vR1+LKCbuklH9yAPLFR9V3PbEW1UYDh6axYMYfvISZiiKpfWJk4/8GLvgK0YAcUlg9v6M22lrP5p7isJJV2txuHa5dx3anewqA1eZY7QFOiRuxdxtL80JmY1a3H3mEP2zvAZ+XzK3IVE1vlg6/8cKndKY1UycobBRftvbDjL/V0cqDfNwTmS2qyjyOgokKHA9s6zgnq/38QsV+O9NC7dCnz7kXIV9jBxP8HS6gPgEwUkw6118gTw48of5y2vvieHuAq48pZOcDPrHUVOxQCHV1twr3uOE8/JTUkYwo324GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWTt1Imo14j7p7V3caBKmt/ZYpC6/bdVvCw+TFuy7eY=;
 b=KfHDfHi+82zb7Zs8q0/qypU9tsnRv+D8pEgRWcolL8wAjHkVMCng7C5A/xke/qhxYIVw4ysJree/oYBAF/p0eeY5GrKDxdwgmkb7y21HJ5tiyvRS9UtdFpOGNEglr9TN9lD5qyktkTXhsz+QRrcqU8HLvNbqAuNJcwfNi7zOtPXSb6Nt7FT8HjXLxLlujX/AFlHWdZgQLqBTHKLbOZw6rgU50xUgBF1y9tYBBb2IBlU7PQafjA2rH5MTlvA+gaf7sGQi8d/1OSclZ/VDOk3pPMzcXH374ynLquOcbZbjE+eCzNP0F6bH3gS0Sc2eqvWA86erARMMKUQc6xfDkArpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWTt1Imo14j7p7V3caBKmt/ZYpC6/bdVvCw+TFuy7eY=;
 b=mlEUCFenNtg2t8Ap4YJIX6m1Ag8mKpdTH+imQ7M5RH75EC7ETP9GjTJSt2Px+K1j4SWMROnPriVm9aZkbmriqoO680zzQu8You7BTM4+0uQ5wbgpixvDbfn4p5r/jvbjLZViKBE+kENKAQTjDkQeIsdBwPcZltQyXhZKC7XDQdAfZaPnmnborPXCIPtB2/NrWZ2ww87BhP0U38idsH3cSwV2WarVJfF7FA/0F46xUNk09Ln0kgfjMlQc9nlCI/kZz71dFfiGDC01eMxN6kJz6elkRi+UDkZNZ3UwSZFb2Ik2G01ufUi1IcDGKMBi0HF9nvL6GKi5oO5YAafkFTnAEA==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by CH8PR12MB9742.namprd12.prod.outlook.com (2603:10b6:610:27a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 02:20:50 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:20:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 3/6] nouveau/gsp: add logging entries for r570
Thread-Topic: [PATCH 3/6] nouveau/gsp: add logging entries for r570
Thread-Index: AQHdHxEoWZ7rcRcrdUC3RHOi0UsMg7aFVWkAgAAAhIA=
Date: Thu, 30 Jul 2026 02:20:49 +0000
Message-ID: <128fd7f75d632cab33928998555b4c13b42bc96a.camel@nvidia.com>
References: <20260729041653.3985549-1-airlied@gmail.com>
		 <20260729041653.3985549-4-airlied@gmail.com>
	 <06fe1ba027b69a8687f421e3d4864aff5358b5ac.camel@nvidia.com>
In-Reply-To: <06fe1ba027b69a8687f421e3d4864aff5358b5ac.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-9 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|CH8PR12MB9742:EE_
x-ms-office365-filtering-correlation-id: b1fe2652-32fb-4e0c-1931-08deede12c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 
 zYD5rXw/VtRwNEGp4DF7RxkOv5PaSUHSWqkXSnPSdu03LqlMzq/FKUfkL2ByEAvlIwF3rJmn8FhNjbFDo3m9nOCelJ9ZAq6FjTqHt4jEMhvfi6BwTce7c4Dd9GwESWtyAp1byGDVp11WfqVEUwwelsgI+IZdFl6F9dMlPlQsp1QRTQZBn8kK4laVNUTYB9uOaWxJpuOcTh847/2PecuLjE91HST1qMrZadwIbXJq3kyHF7nFY+kAvKgGpN3pXCcN+S7s1Z/pO0j8ZqKL5sOzAMWygOExAMgkgHJGctylwSRhoO1SD6hn0Mrm2j9JmHwBM84lQ1csJ04Sr4cT+hoxqTXC5/fcTqOTpZ1ZpgbdToBy+grFeowBxC2HqARKa28Nf0A2vlwo4/w4xylRzzwejk1iY1FoKLHdOPlUbRkhGYCBQ0JuWIcSXqqYQyrO/T3ZxgLqYUxpX9f2P97osHJQKNXF0tys76cO2JbKgF+YM6JeGxml22kcUIz+gXdDKLJuAOdjgHRVJPsNaMID7FV500QzbPIbRrf2xiVo/Ir3aUtDSI39VmP+wp9TdHl+Vpfd0wtTKMfz9ysQYaYxySKOqCbUqQMyJdQxl2Yo4gsZnqZ128fkdCIZzmQauGkTUh9CwS56apE/6nZiUrWTnJ6kYY+yIupor0488UxNDJEdHdAJHwrjIy0yZmBzDviLxe7R1J9fCc1XIbqsWWmhEK/Drfruz2SamL3QnzHBBTIaXKo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tm9rOXVZT01ybmlhWUlEdE5FZVRyK2wvU2JTek5QcVprTUZob09xd0tCVVhp?=
 =?utf-8?B?VWpHRUJ6Sk5JZ0dUYTMxOVNWdkYyUkhFNkZzc0tnMjhQQ2cyTHFKQldDQ09U?=
 =?utf-8?B?OThvRmU5ZmpScHVkREZ2REtsTkoxemltV0xNUWlZTzVqaXllM3JZc0t6Q2xN?=
 =?utf-8?B?NFRYOUxkaXgzakJxU0Q0YkJOMFlHNjU4UkQzYmJHN2Y1QmJreCt2djZhRHVQ?=
 =?utf-8?B?NnpYTDlSbnR1b2VkU1hyZFg3TG9BeGxDTlIvMFBuZjl1WjZraGhFcGg4OG1y?=
 =?utf-8?B?cG5QOWJ1NiszNkVhTkN2UUZyV3pTSlpMMWM3OU5DZi9tNEhQb2tPODNuYVNh?=
 =?utf-8?B?R1E5Q3BoYnRyODRRMkdIbEhIaUUzeE9COG9ZNEtyU25ocXdRR1VsLzI1YThh?=
 =?utf-8?B?cVkvVXFudHNaa1Z1N1g2bzFZc3JLaUNsSWVhMjZwaE9WR3N4Zll4Q0lDYTJO?=
 =?utf-8?B?aXNjUXFzaG1CSWl2b2ViN3lNZzk1RHprNVBrdkFObkQ0TjRlZTByUE9VM0pq?=
 =?utf-8?B?RytTUFh3TVM3VVJNZVI0VGNpeFFtUGlqaVVGUXhoTFlob3pHQmp1bDVjV3M1?=
 =?utf-8?B?bVpscG1RMm45ZEx3MmZWalU3Wkg1bTVSRkpjeEI3akNGVmcvR2dJYmR2cGQ5?=
 =?utf-8?B?MWlBeUpLNmF3OUEySEJrYVpsdTFNZVlDTG1GeDdPakR3TkFYM1dCbXdianVR?=
 =?utf-8?B?NUkxa2Zkd2dUSHFZNUZyMDdpRTBUSkMxNWV0RjVOMXd4Q2wycWJTV2dzMmJ6?=
 =?utf-8?B?VlFxUHRjaThUYWY3aGlkemtWRUl0WkEvTk1waFFmK0ZCUUcwbUh3MzQ0M0xE?=
 =?utf-8?B?dzJqblg1OTdlcUpkZXVUWm53bFdXLzJsQ05INUlpYVdJYitVZW1OdXlBWitB?=
 =?utf-8?B?VlNOM0FJMmZFdWJxaHczSXRjU3VoYyszSlZyQUsvelQ5Rzdxd2RYVHFZMUdk?=
 =?utf-8?B?L0pnbnBTemRzSmJqemp3UjZRV0I2Zmo3eUlENklrblZIZ29CSDRIYndHVmVa?=
 =?utf-8?B?RVFGT3R5RUNvRXlxK0JSdmh2L0dPTFFrdXN0UHpianM2M0RBdE1obG1kVUU5?=
 =?utf-8?B?MitKalNSNHpOcXR1RWtDZEpLY3cwVUhMbldpN3Yxc2QyUW5PZ0w1eG1rMTN6?=
 =?utf-8?B?WGlpSXBVd1laUkFxYmxWcHdIK2RUUkx3aHFER1kzU0ZYN2lPOUNhRFZzaXJZ?=
 =?utf-8?B?SHRONXVmVkFodTJBK2Y5aVAzZER3TlpYSkozcmd0dElFZnV2bDd5N0ozK0tu?=
 =?utf-8?B?ajVscmc4YmZyU0oyS21la0RDVitEV1M5TGZWQ3V1S0RQTVhjL0xjNzZ1c0ZI?=
 =?utf-8?B?VlJKK0lMZ29MaVcvdndEMUFzekF4MkxjQW5hbkhjQnFPZ3RHay9QNXR5ZldJ?=
 =?utf-8?B?TUhiUVozYi9GMUZ5cU41NlRXY2o3YzdhbHR1d0YremRnMjVGTnNIaER0UmVP?=
 =?utf-8?B?YjdxdGhXM3VkWVE3bS9aL1E5Z2RCblA3L1VVN1J3VTFoRE9rVEFOSzNJc0g3?=
 =?utf-8?B?cUxkeTJPYlNIaVR0NWNyaElJOVdhOGQzditGSnRWdWFEd3pTTGtDV2FJTjBt?=
 =?utf-8?B?K3NhL0VscVl2QmxVbGxwb2VHLzc4TXFvK3VDK256TzVPeEQ5eGxHVnpERXRF?=
 =?utf-8?B?ZlVZVThrWjNRWVNYNGVOZTRHUmFTNFhOaWxNQmwyUjNpL05KdnQ3SFF1bEU1?=
 =?utf-8?B?RWxXaldTd0wyWXZOcGdMYTlwblVmY2JCb1dtclJCSXZwMUp1SnNxV1JRckNv?=
 =?utf-8?B?MjhhZXErUDIwU3JETFhFOUt0d3lBYlE3SVo1cmw4TVNMM1V3My9FRmhNLzVm?=
 =?utf-8?B?RTNrV0xNNDFKay8rZUp3ckxXNitteUZnOVpkaEhsYnZ4b0VxVEFVNDBkOTlJ?=
 =?utf-8?B?ajNQOWdaL0pjbVVSaU9XTHVrWWFObE4wTm1IL2hiRGpsN0FlMElJMlRGUGNI?=
 =?utf-8?B?dzNtWEZmM1A5Q2lVTWs1amdLMVBSVzduVFp6MTdXTEFjTFlaM0h2VWx1MzRq?=
 =?utf-8?B?OGE0czNQRUkrZEdCcmdKdlpXSTNGcjJqVDdBRzJGYk5OMFNWbzlrSmxjdlp2?=
 =?utf-8?B?RlR2U09ndGJ1NFFIbWRuUG5VcmRZSEp1UmFOTitWSjd3NE45a3JXNkZFK0hB?=
 =?utf-8?B?d01IdzZpSkxEMjh1WTBaNE9Hc2xtUnFOYlZpZkIxRzYvcjRnY2tGcnFiU1JH?=
 =?utf-8?B?aXFTQ0lqb0F1ZVF6RHB0bHZIOTNoWnlrU1hGKzIvbUQ3cCtuVGprK1ZVamZi?=
 =?utf-8?B?TUQzTzBVNVN5SW9TZnFVNmIyWVNwR3krRG44U29aYURPYzhLcUhVSFVlaHh5?=
 =?utf-8?B?SjlRODBuci95WVBvV3pHREpUQU5lcUVVb2Q3ZmN0RU01dE1zdUNkTEhtaDhU?=
 =?utf-8?Q?mVoYI1xPH1BYMsKfAv/gGdrQ7ZtAp8+8UyvJHcQ57qgf9?=
x-ms-exchange-antispam-messagedata-1: GBZgGakNlV7GvQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FE0CCD15B6E8B47B4CBBCFB982D8512@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b1fe2652-32fb-4e0c-1931-08deede12c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 02:20:49.9464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4b0g/q9AtJrOj7wMUG7OOIJWncq0NR3Ew+yMWjhsQqAA7Yb9Cr4OrG63ElL/QBvwOZSa2xvO3VT5Dwcw4gbXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9742
Message-ID-Hash: MGXS7CCURSMCQO7CDSCLD2QDYG45ZMQS
X-Message-ID-Hash: MGXS7CCURSMCQO7CDSCLD2QDYG45ZMQS
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MGXS7CCURSMCQO7CDSCLD2QDYG45ZMQS/>
Archived-At: 
 <https://lore.freedesktop.org/128fd7f75d632cab33928998555b4c13b42bc96a.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVGh1LCAyMDI2LTA3LTMwIGF0IDAyOjE4ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBP
biBXZWQsIDIwMjYtMDctMjkgYXQgMTQ6MTUgKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOg0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9ybS9yNTcwL3Jt
LmMNCj4gPiBAQCAtMTEsNiArMTEsNyBAQCByNTcwX3dwcl9saWJvczIgPSB7DQo+ID4gwqAJLm9z
X2NhcnZlb3V0X3NpemUgPSBHU1BfRldfSEVBUF9QQVJBTV9PU19TSVpFX0xJQk9TMiwNCj4gPiDC
oAkuYmFzZV9zaXplID0gR1NQX0ZXX0hFQVBfUEFSQU1fQkFTRV9STV9TSVpFX1RVMTBYLA0KPiA+
IMKgCS5oZWFwX3NpemVfbWluID0gR1NQX0ZXX0hFQVBfU0laRV9PVkVSUklERV9MSUJPUzJfTUlO
X01CLA0KPiA+ICsJLmlzX2xpYm9zMiA9IHRydWUsDQo+ID4gwqB9Ow0KPiANCj4gT25seSB0dTEw
Mi9nc3AvZ3NwLXh4eC5iaW4gaXMgbGlib3MyLsKgIGdhMTAyL2dzcC9nc3AteHh4LmJpbiBpcyBs
aWJvczMuDQoNCk5ldmVyIG1pbmQsIEkgc2VlIG5vdyB3aGF0IHlvdSdyZSBkb2luZy4NCg==
