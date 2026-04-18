Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314CAF99C88
	for <nouveau@archiver.kernel.org>; Sat, 18 Apr 2026 17:44:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A875D10E369;
	Sat, 18 Apr 2026 17:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aJHC4lrd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38A4945A41;
	Sat, 18 Apr 2026 17:32:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776533532;
 b=VRF/knLocJSWAS4qqusZ/vY1fD8h2vT3E6ug6DmWFNv2QS2we5mzdU/ycl6JV+Ta9CgYz
 HpUXqOzKxDPjLjakSUe2mwe5CclO/haaI86kbsbmQoNYsSJT9U0wzPeOs2liNo7dd6xAJj1
 RAv5L6EMEb3wMFg06Mg2YiEvuU1tMryltCWr6vkydzO3T2lN+4PEbaemjm68xIrLd582Thu
 wFBYzY4c6AtlJEKHz2/8w2DZ6X6IVQdble/OQYLouLGYXt67jt5O7HiWclv2/azXJ5tuhKH
 2xou4d3DlfzsJKup+ms0Ltnhlq7tqPDbQV9P0b2BXiomPejkxdjT2IgMu69Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776533532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ir6YawC30m4cQYcLYttPJfZKkSW686YlUTaHz0eZYYo=;
 b=mQ4ObpWZyQieWznGzgTieDKu1f0O7QskRjkbCIV8PPgoP+gecVa12cNJQwHhSB5T1P2Zg
 CuKQrY9K4wLuAs0H++y9iklxfMhZDOX1qM/ewEXMzX70j0hEz0EyKrWkBm+hyCT0gjBHbws
 sbpu5WObI76ZDYvZQrBW43Q2Mdfi0sdXRTpyvEdS3q/1Sky2ti08wdi5MlZY32V3VNf7WAW
 1SDVk1uQi7z9Wi6XOFJfbJQTIukVNuIsIq+YeqnPygVZkds0hLNR2WH/tgBFE4/MN+lNCFo
 cPLyWat+Jc1PUkiFeK2x/D0p4xD00oMx+zkACmmIU59vGJEF+kPiIqMWfK9A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E090145A2B
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 17:32:08 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010004.outbound.protection.outlook.com
 [52.101.193.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8410E369;
	Sat, 18 Apr 2026 17:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuJ7ng0ueQ0BXz091EHdV0UjP3JUnryZbg+o0AOYKxXQKAXdDsNblcoCobkQNEt9PI+KVhfrBH2bbis0H4tHwFblV/44Yot/SmPxPbApahq+U8yA2gAOPxzX65dMwLQp2Jgxqprf5NnAxTBtoTs0n2Uqxi00asR/D0AUs+4aMUlDoLTaGehW8D8NmykOFAyoGOKG+vmtjf549knEQYTH28ICOh776cWlBPDW12a3fFZVO7gk6G185Rx6wlxxzcxUeNQWG/uSJZF/UO9OdWclUFgZ3iYAbps3iRLzX+F5JUSykrHv/u1CoMqnLWXqP6lHXglfwBJp3DxtimRofI0w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir6YawC30m4cQYcLYttPJfZKkSW686YlUTaHz0eZYYo=;
 b=hdbd932txd5SIyB/glIQwypXLRMF4pwSX/yUrgddQ5cr+078ZramgF+PPEpOh0aXnc0SI+ZNW2qrisIYtlQefyrZb+sBaY/2eYPXT3hAxGVls6PuMGqelV8caF7KciTCAbO7KN3pue5D7GKGpJckEz80DcD5j/18QrfKJQ1djJKtt03Ve+2JKAbMZ16KR/pw885KBwLKDGrBZPSTQ5jRe7IW92RpCWwqZBbXzTHHo9MYza5v4ZGz9xMTNTDyf+vrLBLqlRpkbWNfSQtHSH4onadJbAFGWIF/UrCvZjTkxzKVGlBk31OwFu5yQ4ayFT7nqbkZRv2a/E5fGlAjV+kOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir6YawC30m4cQYcLYttPJfZKkSW686YlUTaHz0eZYYo=;
 b=aJHC4lrdwMQDr/RhjNtMGuBUV2Iiki7M0YZnX65oVlDYKcnwiTeMBS+MX3URli5U7AZ36q4RgkiYStLJecbTaFiXQS7QXznXPAiCLTxkaSrOiRYjPA6Ryf6AADb4wy3JPVHbb+9GI5f/5k6xvf4EQVEN4UV55j1xtmj2JyamN6Z2c74ZpVBWlePpzyCgUYcnqnuWUVhh3WmBCIcZUI7wFiaaRO0lbaTjzNCQBk1v4wzffEHYxV+a3fbgIwt3Ew+nrNC+Ln1KU8TDpG58Sq/3D9MBLff+IVSSALEFu5CljggOMDhWZxYL0GZFzFs9HgAbydnz3QZt4VR7Vimt/zjvVQ==
Received: from DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) by
 SA1PR12MB8642.namprd12.prod.outlook.com (2603:10b6:806:383::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Sat, 18 Apr
 2026 17:44:03 +0000
Received: from DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2]) by DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2%6]) with mapi id 15.20.9846.011; Sat, 18 Apr 2026
 17:44:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp:  Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
Thread-Topic: [PATCH] drm/nouveau/gsp:  Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
Thread-Index: AQHczwPne9cdBcOmh0+6PLwGBafOrLXkuzSAgABXJ4CAAAMOgIAAAnOA
Date: Sat, 18 Apr 2026 17:44:03 +0000
Message-ID: <f3ea592561af59cf0d677e66a70165e2d7b7edbb.camel@nvidia.com>
References: <20260418071412.86022-1-sunliming@linux.dev>
	 <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
	 <abb12ec2c8d72d6a369ef7b29d0453736a07f90c.camel@nvidia.com>
	 <DHWGN6Y2J9X6.3FMWWDU2NQ2LV@kernel.org>
In-Reply-To: <DHWGN6Y2J9X6.3FMWWDU2NQ2LV@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB8420:EE_|SA1PR12MB8642:EE_
x-ms-office365-filtering-correlation-id: 4772ee7f-cf02-455f-67c4-08de9d721511
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 XEVS8CS2o10a/ijNYVW0sY5As2pNuO3QaKtMn3DLVActkodlfYEwepLlmILLuhXQxLA9Mri7+s3JicY1LfDRsgbx7ZPl0Ec178VHI7w631E5S9QRIWn5j0ZrbNeNWM1Vx4JD7qT56TN+jhEE95phO4ftEo7wDyqG01xdQk2AUI+o2v3mRZM5HtpMrqHmDtV9CgggWHNEl2F2wU285iG8uQruC5DhObQZrJPWdU9k5ppTR2dX6/gmwoagM4UcQWfAAFMSL5uBw591btzGnntL6IIl8als3V3CS9zhe0HyfVcEaRqroyVyfBAfuMPsDkBnj+CFlt5LKGRLENaGUloEnsYP5NhvCBkpjKFpPUk/Idqo5m3I48T119+01rLdoa+4ajVOsiEVX+Z4vKnw5213+DxFhz/cMFHsrtOS0+qAKr7Qo8NkRbFuVGxa/U09XdpxM+9HMTdkoGz0SjXq+y/ipsRnrV/fYGD8oQZRVmi+uJ+oCdkTPyjQj9wXBhhwTpQuk8Rrz5yd+A4vE68i64eKVNj3yd1hxUt6h+857FYjYO63j/I7cRilcVQVgaIzyNZmpeD7uR/nQMNd84fzXaEh+fNlQXqStSLQlYqFb1upWxvcpEC8xl8V5h1fnuhaqDJLAvm4diIU1/Sy5LzlPPFeSfx13vUA1CjeVslJ17ubcg3L2on4aWSECj951TyMMf2VcVww0RGLqmRCE2BWijza8Vs6pc7zGfseUMhu88CVciKTfn7bYbLRzs8YujwzYVFXYA15SgYvu9P+FNMmcOH2FTZpV/Dicz2Rn2s+RaVSgNc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8420.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zm9HQUFmSm11ZnBtVjZiaTJPRU45eVpHRXJPRVFOWjhKY2h0c09XWXRTQmYw?=
 =?utf-8?B?QzU4ZGpheHIzL0RET21xNXQ1MU1UblBwU0VOKzU3ZlZDS2J1NytITzNZMHdm?=
 =?utf-8?B?ZWxBd1pxeEhzNnRKTHkzZC9UU3dBQ04rMm1hNllWRFFDV1VUR0ZKbnh3MUo2?=
 =?utf-8?B?YWp0aFFYN04yS3V4TFRSbzFabFl1aUVmNFkrRTFndktQNU53eVJQbWlFbnJF?=
 =?utf-8?B?eHAyYzFNOGo0ejdFcVdaYkxWTnZUQWhaUC8yaTVyUkVvWFQwUGw0WWFTV1h3?=
 =?utf-8?B?OEl5b1duUnRDN2plbXpxOW9zV2tzYnFrZEVVR0pKWkVKS1VvM1VtQVBFWXRF?=
 =?utf-8?B?WDJCY0MzSmROcDQ4cWU0Sng4RXVjZjVLb1lHcFFwd3M5T0tQOWYyMjR4SVM1?=
 =?utf-8?B?eTN2SlVoQlJYcjR2N3FQS2RoTG9NYjBhUmN5VzBJdUNqWDg5dlJ4WktKWHBo?=
 =?utf-8?B?THNLd0pRa2ZKdDRNS0tRZGdZMXVWdjV3amFJZkc0U05oanptYnJGSjk4cXFk?=
 =?utf-8?B?Yy9KUEpUWnVJa2pRSE1aZzFncWxvWFYraVVDSXdQY3gvQUlTZXVoTTA0Wi92?=
 =?utf-8?B?SktFbUQrVTZKSVR0c2RPd09yUksvSlpwdVRWSVRPcVBVajBWVURsU2Z0VU1Q?=
 =?utf-8?B?aC8xWmN3NFRNV000eURGRmhGamVZSnVpWWhoTXdJem5GaGpZd1QzVWRodzNQ?=
 =?utf-8?B?dHFvOXRHNGpiN0JaaEZyMnBFRGxpd0k5MFhBczF3WE5tekZzWUdsUFExbzVG?=
 =?utf-8?B?alJ2Z2pRMWg1enh3WTlWKzVxbWg4Z3NIN0xIazV2Q1JFQ1Y3WXNzTmhrMk5F?=
 =?utf-8?B?T3RzbDFsNjVrSkk3Q0o1Y01JQUtIcjJ3R292YlFUYkdHb0lpL2FtQXNMcHlE?=
 =?utf-8?B?MUJUMzJIWkVJNExCM0NpQnNKV1ZseENLdWRRYTBwTTNjK09nZUNLd0NRNWZR?=
 =?utf-8?B?eWtVcDJmQS93bG5WV2N0Ukp2cFR2aG0vVGhETEdOekxpbjBTNGhoVnR6QkpL?=
 =?utf-8?B?QjVUa0R6amtTZmN3U0ZXK3pSVlFMQ0t0MTE2WGJZVTkwSE5SZXYzM2FHZzhy?=
 =?utf-8?B?UXkrWVhCcUpOYXgwZkNZTjNVU0kxQWFSbVNzTHFKWHk1Y1FVNzdQYXh5THQ3?=
 =?utf-8?B?QXNadXNtanBFcUV2L1JCRHJxNGEyQWNhV2Z1c1AzZURmSUJPSUpVbFpGVWd2?=
 =?utf-8?B?Um5lTmxFL2g3UVJnZGVBT0ZiNnVRSGFZbytzcGpHc1JwSTEvUVQ4RlVOams2?=
 =?utf-8?B?Y2xzYnVUYWNGU1VhWkh0SUpvU2ViSDA1RHJUODdCMEs1YUJmdDU4TWNWdHdo?=
 =?utf-8?B?UVdMOUcyS2NmQlBQcjZwTHZQOUFpcUZxK0ZSTk5MNGZ0Qng4WCs2aEVhYlJy?=
 =?utf-8?B?dURaTmhzTktlVmgzRUVLREt6K09HYUhISzBSZm5JKzh0cVRMT1ZleHRQaysy?=
 =?utf-8?B?dU1oUm1jLzMxQ0hPSnlUUUU1b21HWmttbVdoVFpmREw5L21HbEVqMVEvMm8w?=
 =?utf-8?B?eHFxZGJ0bUtqUWdCTFJ6alkxSi9JRzcwcENVblZDdmIxb2xwV0QzWDR2YU03?=
 =?utf-8?B?VEJCSDdzd0hjQW55Q0c4MFhxOHUzdEF1c0VGM0hyeEZtMEZmNnFHd0VOd201?=
 =?utf-8?B?RWhqUFg2VDJFNC9heWR5clVRZTczTzhxZ3NlakVvUEFNNlc1MyttSEZhVVZq?=
 =?utf-8?B?NkNsTnQyaEdDalNyNGhvOWo4QzcwT1RuKzU4MWorMFpwbTQ4d3BsSURKYUFr?=
 =?utf-8?B?T1NzUVI5RkZwd0xXR2Z4UFVnR29JakdrL0I3cndGMVIrakJxcFpsMVYvU2Z6?=
 =?utf-8?B?MlhzUk1UeUVGbmMwTGF2WEVGRkxlMTBxeS9odkhYTzhkb1dBNDh6WWpZK3Jm?=
 =?utf-8?B?aUhJUVB5d29EY1NZWlZDTzNTZVUrTlhUbGUxWkE0czU0MXlqRk1tQ0tvaWxO?=
 =?utf-8?B?RW1nTzNTMnRQL1ZlQnJ4Y0k0VjhveGdBNVM4aTZEVXNUMWplMTFBVWpxbXpJ?=
 =?utf-8?B?SnBabWNzS290QTdPbUkrMTZSOG8vUDFCbkREV0NjMmlIaWEyRWNHT1EvZGYv?=
 =?utf-8?B?UGJ5ejJmSnhtT2dEbENZVWRialBMcTVpb3NSU2Y5Q3E2UEJxUDFTYnYvbXlu?=
 =?utf-8?B?aWNBelF0ZElLWXJoWGlmTTRnNHQrcEN0Tk5EMzkwdW8zTFVBWEJvRDFpUWlI?=
 =?utf-8?B?V0xmNHdKUVdCbGE2akNCcUFWcmxRZHA3dXd0NGZTNjJUbzhwUTN3TmZXWDVp?=
 =?utf-8?B?UER6MGdxZzdUbGc0TEg2c1BiUThSR1ZlYzRNVWdqNUF2T3dUOEZIV0JzVVNW?=
 =?utf-8?B?VEtyVkhHRnhiV0N2WDUzTmNGQnp5YXBTT2FNeDRqemY5OW1SblBSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <939EB151BF98054EA0E4E8EAB06826DA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4772ee7f-cf02-455f-67c4-08de9d721511
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2026 17:44:03.7857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 D/EDImjn2M4d6hMO5blBuFQtg7UmjlFASqugikd2BMGROH0xF47nnQw5Z5/6dI/smHZCD6yaoiKSxq6oe4NvnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8642
Message-ID-Hash: HJAQFH5LROK3CYP3NWWBGD62PUQCIVZ5
X-Message-ID-Hash: HJAQFH5LROK3CYP3NWWBGD62PUQCIVZ5
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "sunliming@linux.dev" <sunliming@linux.dev>,
 "sunliming@kylinos.cn" <sunliming@kylinos.cn>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HJAQFH5LROK3CYP3NWWBGD62PUQCIVZ5/>
Archived-At: 
 <https://lore.freedesktop.org/f3ea592561af59cf0d677e66a70165e2d7b7edbb.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU2F0LCAyMDI2LTA0LTE4IGF0IDE5OjM1ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IEkgcG9zdGVkIGEgcGF0Y2ggYSBjb3VwbGUgbW9udGhzIGFnbyB0aGF0IGNsZWFucyB1
cCBhbiBJU19FUlIgY2hlY2ssIGJ1dCBpdCB3YXMgbmV2ZXIgcGlja2VkDQo+ID4gdXA6DQo+IA0K
PiBUaGFua3MhIENhbiB5b3UgcGxlYXNlIG1ha2Ugc3VyZSB0byBzZW5kIHBhdGNoZXMgdG8gYWxs
IG1haW50YWluZXJzPyBJZiB0aGV5DQo+IGRvbid0IGxhbmQgaW4gbXkgaW5ib3gsIEkgY2FuJ3Qg
cGljayB0aGVtIHVwLiA6KA0KDQpNOiAgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCk06
ICBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+DQoNCkhtbW1tLi4uLsKgSSBkaWQg
Q0MgTHl1ZGUsIGJ1dCB5b3UncmUgcmlnaHQuICBJIHNob3VsZCB1cGRhdGUgbXkgZ2l0LWVtYWls
IHNjcmlwdCB0byBjYXRjaCB0aGVzZQ0KYmV0dGVyLg0KDQpXaGlsZSBJIGhhdmUgeW91ciBhdHRl
bnRpb24sIEkgZG8gaGF2ZSBvdGhlciBwYXRjaGVzIHRoYXQgSSBuZWdsZWN0ZWQgdG8gQ0MgeW91
IG9uOg0KDQogIDIuIFtQQVRDSCA2LzZdIGRybS9ub3V2ZWF1L2dzcDogZW5hYmxlIEZXU0VDLVNC
IG9uIEdBMTAwDQogICAgIC0gYnkgVGltdXIgVGFiaSBAIDIwMjYtMDQtMDcgMTk6MjEgVVRDIFs5
NSVdDQoNCiAgMy4gW1BBVENIIDIvNl0gZHJtL25vdXZlYXUvYmlvczogc3BlY2lmeSBjb3JyZWN0
IGRpc3BsYXkgZnVzZSByZWdpc3RlciBmb3IgQW1wZXJlIGFuZCBBZGENCiAgICAgLSBieSBUaW11
ciBUYWJpIEAgMjAyNi0wNC0wNyAxOToyMSBVVEMgWzk1JV0NCg0KICA0LiBbUEFUQ0ggMS82XSBk
cm0vbm91dmVhdTogY2hlY2sgZm9yIEdBMTAwIHNwZWNpZmljYWxseSB3aGVuIGNhbGN1bGF0aW5n
IEZSVFMgc2l6ZQ0KICAgICAtIGJ5IFRpbXVyIFRhYmkgQCAyMDI2LTA0LTA3IDE5OjIxIFVUQyBb
OTElXQ0KDQogIDUuIFtQQVRDSCA0LzZdIGRybS9ub3V2ZWF1L2dzcDogcmVxdWlyZSBHU1AtUk0g
Zm9yIEdBMTAwIHN1cHBvcnQNCiAgICAgLSBieSBUaW11ciBUYWJpIEAgMjAyNi0wNC0wNyAxOToy
MSBVVEMgWzk3JV0NCg0KICA2LiBbUEFUQ0ggMy82XSBkcm0vbm91dmVhdS9iaW9zOiBza2lwIHRo
ZSBJRlIgaGVhZGVyIGlmIHByZXNlbnQNCiAgICAgLSBieSBUaW11ciBUYWJpIEAgMjAyNi0wNC0w
NyAxOToyMSBVVEMgWzc1JV0NCg0KICA3LiBbUEFUQ0ggNS82XSBkcm0vbm91dmVhdTogcGFyc2Ug
dGhlIFZCSU9TIG9uIEdBMTAwDQogICAgIC0gYnkgVGltdXIgVGFiaSBAIDIwMjYtMDQtMDcgMTk6
MjEgVVRDIFs5OSVdDQoNCiAgOC4gW1BBVENIIDAvNl0gZHJtL25vdXZlYXU6IGZpeCBHQTEwMCBp
c3N1ZXMNCiAgICAgLSBieSBUaW11ciBUYWJpIEAgMjAyNi0wNC0wNyAxOToyMSBVVEMgWzkzJV0N
Cg0KICA5LiBbUEFUQ0hdIGRybS9ub3V2ZWF1OiBleHBvc2UgVkJJT1MgdmlhIGRlYnVnZnMgb24g
R1NQLVJNIHN5c3RlbXMNCiAgICAgLSBieSBUaW11ciBUYWJpIEAgMjAyNi0wNC0wNyAxODo1MyBV
VEMgWzk1JV0NCg0KPiANCj4gPiBodHRwczovL2xvcmUuZnJlZWRlc2t0b3Aub3JnL25vdXZlYXUv
MjAyNjAxMDMwMDA3NTYuMTAwMjg5MC0xLXR0YWJpQG52aWRpYS5jb20vVC8jdQ0KPiA+IA0KPiA+
IEknbSBxdWl0ZSBjZXJ0YWluIHRoYXQgdGhlcmUgYXJlIG90aGVyIHNpbWlsYXIgaXNzdWVzIGlu
IE5vdXZlYXUgdy5yLnQuIElTX0VSUl9PUl9OVUxMLg0KPiANCj4gWWVhaCwgdGhhdCBzb3VuZHMg
bGlrZWx5Lg0KPiANCj4gPiBJIHRoaW5rIGFuIGF1ZGl0IG9mIHRoZSBOb3V2ZWF1IGVycm9yIHBh
dGhzIGlzIGluIG9yZGVyLsKgIEkgc3VzcGVjdCB0aGF0IEJlbidzIGJpZyByZWZhY3RvcnMNCj4g
PiBvdmVyIHRoZSBwYXN0IHllYXIgaGF2ZSByZXN1bHRlZCBpbiBzb21lIGludmFsaWQgZXJyb3Ig
cGF0aHMuDQo+IA0KPiBBcmUgeW91IHBsYW5uaW5nIHRvIGxvb2sgaW50byB0aGlzPw0KDQpObywg
YnV0IGl0IGRvZXMgc291bmQgbGlrZSBzb21ldGhpbmcgdGhhdCBDbGF1ZGUgY291bGQgZmlndXJl
IG91dCBwcmV0dHkgcXVpY2suDQo=
