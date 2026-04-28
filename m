Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E5FF886D
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 20:24:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ED8D810E378;
	Tue, 28 Apr 2026 20:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fCFzC/CW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0CDA945D0E;
	Tue, 28 Apr 2026 20:11:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777407096;
 b=zBec9vlbwZOz8N6Xx+CsurcNKbnBYCXHw3Dp7qSy1JhFzAxJ7U8LnYh5/lqV5oKUbWBYy
 RkWJx6Rp7QRakgKwyr1elc2mUtadNG/AM25Zv7zoMWeNRQZb4kItlYe7oR9QifLTSjvonEP
 gtsaBlE16kWdRX6XZiTZXuzqcIYBeiyhgigndDFx7gJofL4yn0BE+c5OGBTk8JUZo3hYR5d
 J8w0xft3TVIWH34fsGEnLD8msvTJjAnuOnUCxlbrAb49E+KhcycDBggzeCLYFdZFOhTVV53
 lPEJwkLZMX4/6HCUFbNjePw/Y3CGQjwtyfI1X8iD7v9qAaUK1kxBMkZiD4cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777407096; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N7nwxd+em1yREFHeTw72YmRPd6uQKzrJ2Zw6PO8VtQo=;
 b=KEjGOuo3F7bTo6qaVke3DCwGqZcVNlZWnmRBgq3X3o1ydBw/UMSciwUzMwDWZ1ZFI+xfG
 ikPFtcIQ4WhD++cg9a+j/mTbpkd8ZfXub8lz/L0KGQGQEHynKRzVPxLiIOt8BYBtd7WGOSa
 jSyCv1WGnlaxfHn7LQCHyc3OQN9F6j+jGEPibcNv9CD/qeh1j+YA7Q+G8GjLUi+X6XAm/Ey
 akuljOAvxVoIsXOMuicQd4QQeuCNwjGDyynwZutXZtIbioXT8hQD562dQKLf6ijaJoKQYqC
 sZxEFQJYBaRKRTMkiwHenK2sGdgz3GgeZRtWWvJOf3mHGAAlRYpV+OxEhxqg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1624C45D01
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 20:11:33 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 937CC10E0DB
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 20:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGe2o1Sellfl5IDTZ3sRnklUu8wWDbvtWKALdkdXv79LXhfcg0VJdlffuOlXj+rIL12ibeRoXJmLQSCWEs2kOgu0YmsO0EvGUBqFhDNo2jtsECIlMollxRF8S2Zg5Ocg2ryqJ3hNgo8MHmXH/t0tpJyDx8mBn51eLbOUZI47PFtQK6J+iuSvrvKiYSlOSSyUeHg7m7WiayxMFXmTIAGPpGBk5ijf0Z+OwOAafv2KfnYwU5npaAJlNj9ZQ9pl0uMJjPKROMNkW4Zm1hhlMpr+nALajv96QIglSPBs/IJT9kVTCW8mNDYZKVbJPFzkkXmSRPjpWcQaiERwGLxl5+ZB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7nwxd+em1yREFHeTw72YmRPd6uQKzrJ2Zw6PO8VtQo=;
 b=aypXudumEzN6Q71gkHN+GOLKLav8YYXD8LVx9LzE+sO7w0kKohSh5TgQUyYYg+SqGZf4cLi78qrhGojU8r8UrWEuPG2JIlekzvamqzT+2f/6BgoZ8OC6KIbNJm03o9ruaj+RO3BmfmaUolPnM8ZVYCXJ6pFg/X5wmEfHG+rhuDH0NoH7O98KrQTV3phpYtkPSbs4TdWqQiDMsVJ1YJwkuu9lBEqMI/EJNcu96ZD/MtC5ufdrxIMDnnvJlEdjRmhF7NkrP0qIEHRfDWFr/NBlBa9sNnpWBpYRFDzBbRvtQvFbzmgCwYJ+ApMBr29/k8M8wkLVvY07wjXTFwi3+BOLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7nwxd+em1yREFHeTw72YmRPd6uQKzrJ2Zw6PO8VtQo=;
 b=fCFzC/CWhaWLB3sCi2tW5LY61yZlW2d+AWca8+QSSffLlPFBtLNd8LBuEliJNxiKMvrF8VAPbFK1eGvUP3GsrIv51ruBDBL+u388Wrsoz5Y/1MS/IcKSGHAd8dW7YKjpSu4cYv4DRlpjGRGwKDsPlWkB+gm9H4aHfNKQFoGre67KUH+VeZ+nsQrtCdmOjEwblq/KCPlxwq3XWmk6ru3njxZGE8ijX8tZcz2V2yJk8M2HuRK6xuZoELJPaZ5EMy7LJPG6dnUkPjiZoY+xbi306G58m+109/J+2cPXEa10hQihTYXU6Cl4TIH8ZJ/flohwu8W2a0UnBiX09PGCMTsI6A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by BL4PR12MB9479.namprd12.prod.outlook.com (2603:10b6:208:58e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 20:23:51 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 20:23:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
Thread-Topic: [PATCH] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
Thread-Index: AQHcxr/cXbD/rSZLEkK/9jEBDzGKnrX0wL2AgABLlwA=
Date: Tue, 28 Apr 2026 20:23:50 +0000
Message-ID: <45dccce37d37d4a2830f10f3cfb79f55fc203b7c.camel@nvidia.com>
References: <20260407185306.3024695-1-ttabi@nvidia.com>
	 <DI4WQHWHRT4Z.10GC877YXSKWJ@kernel.org>
In-Reply-To: <DI4WQHWHRT4Z.10GC877YXSKWJ@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|BL4PR12MB9479:EE_
x-ms-office365-filtering-correlation-id: d78ffac6-7b07-4724-842a-08dea5640f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 GtqenLKQSvDN215+l2LiiEA+SrTiqhT05Qc7orUFCFOS11ARiBK3P2XMQaKFP1c9AlgiAhmcGxkCgk4N+q1oooLL98pqdN6Quq5Qpe5o5Q9iiDmppot27330q8Z0966v/V5EgDgIhGB0w/9mC1BqIWxbfUbbl1A54jM1zgU6ANcG0L1mQNMjCElv2fyTohHQtenlOUO2cqhVgyUMd5cBQjCMPK9NyAuHC+uGyrFpajnN0eiw/WjWBQj199MXDyY1goeD1/zVsrYZGiJHjte7Ek/6Yv9/Qaec4RTVvSazFJFgmlGxOOAIbaanNqiMV2lwagSIl9bo26YgCM3pJXqwZ2regwFtDzoz+qsLbkHujMd5oqFU7/YiMnrdTJWqj64WJoPIewvY1WMg/tU1+wh0/XucJCF6OwfIQOVjOaStSywx/uSrKOy3LSdmsfTlhJuRhSO02kWvC7+2E9voCvJh8OXF7MczAiBIddgh44aKfckJohO6juZRNkMhnxTf/D5W30kUlzAc3Vjkzc/45NwEHgAfNnd4/Yf0681Y9LLuoyrNQGYcPN5zXWjePAPopbRkBC2WGrQgoBkknfmzgdyFDjKUV19GRb6VgjLC6JpVZ6cRnJlUDNEZGy2MGh1GDh/QUNk/fBpbFjgYwBNewVdkMUJCZKVe0SWUdQZWf2QOT0E1zsO4Ogs+hY8Jt7HkeN/Mi9nBxtzlDQw4Tz23Tszxj1H5SB8Amlpgwb6QxkkYAW9/9qOHjX2Y4bSaWpDNxhF2xbM5Y67QKztVgOoTKqB3laAaPAvqWFXO/IYekDr4lwM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TTdVaWNLNWRHVC9UWC90VXlIU1hXL0s3eHF4L3RtM05vRFJKVjZJK0ZzNmIr?=
 =?utf-8?B?MXBkelVWSjcySjRueTdpUi9oSHBIeExSQ2xaMUZYRGVhQTNkMkRLeG9HbTZQ?=
 =?utf-8?B?OTBUTEtqYlNwR3ZqbEJxbGNBRktRdmZkdHlQYVlwQmdVQzhyblFiR2xuYm1q?=
 =?utf-8?B?SmJBSG9wTVgwVjA1TzQwQzQ1U1hLR1RHQkNOT1NSVDB3ZmtwMlpRSVFnbXZj?=
 =?utf-8?B?bVBXRWNlS1pTd0psc2NjUlNwWUVRWnhlQUYxKzc5T005dDcrQit3WVNKS2oy?=
 =?utf-8?B?UUZCTlBIRWJ4V0NwNHlwV1RRVS9vOXlJY1hBRGplMjI3NUR4NFptM0RWekMw?=
 =?utf-8?B?ZEFjZkJyTlptMmF3R3JIRnlmRnY1WmwvdzVEVWJyTGgrcHB1Rm5nY2ppc1cz?=
 =?utf-8?B?TmxwRWtMc0s1Y1pQaC9ONFgyTUtwMzVYK0pOVFZEeFhlNVlLT252c3orT3Vn?=
 =?utf-8?B?RGVXTmxQOXlJelcxRG51cG1QOU8rTkFQYkxtS1VDWnN4QndJMExGeS81VmE1?=
 =?utf-8?B?bm1Db2gzUkN0RzA3b3VkakhNUFp2bjk2RkdPdC9XeDdPeDl2MEFxUTJJOWx1?=
 =?utf-8?B?Zmc3TUQvaWFEU3RJWFA4UGNXUFZEdWQ5RkhRZWZqYlI4aTFkTXVzak9IbTJS?=
 =?utf-8?B?T1hkOVVnQmF2emRhNWYvd0ZpMUFkZElnNTRCMTFGbGpmdUdiK2NHSktRbHdN?=
 =?utf-8?B?c0c4QjZ0TEl6SUt2OFNpdnJ3NHdpZWpCR1g2ai8yeldVZDFmdEFuMEJiVUsw?=
 =?utf-8?B?Y1FISFNxTUhsTzkvU3pTdGwrWlpLVURlTU12TUNuYTUyZjUwV0pRNVNUZDhZ?=
 =?utf-8?B?VkkwTjUrODdIVGtvUm4xZXZBbW1WS0xHV1QzMU5WKzNpOVB4U09FTzFqOXRE?=
 =?utf-8?B?Tmc1aWd4MzlHeVNqdnRZbUpXdDJhOHdML3ZHY2NNanYwZ0NVQ2tsZURvcVY0?=
 =?utf-8?B?MklBU3JiSkJSZEt0OEp5bTFJeVh2OTFualRBeGRkbmhJRWhtb0RXLzFyRkV0?=
 =?utf-8?B?REVxNWlqVnhMaTBEMGs0VXh3WEl3d044dTBkKzZNK29lSWtsdTBLZTR0RVo5?=
 =?utf-8?B?dHY5eUpWeTJMc2NBTXM0SUNLQkF1cmZiblVpV1RVbXpFbXo5T3VncFVzK1JY?=
 =?utf-8?B?WmZZdHJsSjdXYjNFbzNhTXh6bVl0R2tZb3pFRkdOdU1pbDEySWdoNnI5eDBW?=
 =?utf-8?B?alF4aFJSbTRCWVZsbVZaUUZpM0VjbnFoOTlNOGVzUmM4M3hNZkN2REs1enp5?=
 =?utf-8?B?N3lId0dMaFQzdmZXWDlDNzNUV0lLbzdVY1BvZ05TY0Q1VFJuaXR0OE16bEta?=
 =?utf-8?B?R3dSM3dYWGxoaWlxS3BoNVp6SmdzdHlSZks4WEw4b1o1S29mMERWNW5xN1Q4?=
 =?utf-8?B?Slp6ZFVXeXZPVmRFTlJpU2xsNFB2aHRReUUrOFhiVkdvTU9FWi9KTTNuTjBW?=
 =?utf-8?B?NHpUOTdNSFhPMnFFcWFTaUNOdHRhcVVwWTVsTEg1cXcvMkxSZUhUWlJEaDls?=
 =?utf-8?B?bVhyZUIvQ09ja1VQOGs1Vm40cjRsdlJoS1VKUU5Qa1BnMkN4c3dTa2YvRmZn?=
 =?utf-8?B?cEM4Mys5dklITDU4bUdLWHlYN3U5SjZZYk9YaXF2QTd0OVRFVUJWellBd2kr?=
 =?utf-8?B?VE5JdTJsME9mTXgyWUpxcmFCUWNYNW5sVUxvdVZVcnpmRzVxUnBSUVA5MGtB?=
 =?utf-8?B?YzBDVk5JV3ptc1F0Y2daTGd2REUwM3ozWTV4WndxNWh6U0lMK3YzekpjS3I0?=
 =?utf-8?B?RjMwR3crSUkvQm9KYkhWZ0VYNHNTdXUzbkV4ZVN6QldHcXN0N3laU0htTDh6?=
 =?utf-8?B?UU1EZy81UVk3RUU0VDNURjhQRXRldlRrU0J3WGlXb0dRUVNubk0zNTZJRUx2?=
 =?utf-8?B?U2ZFczdhSWZvbEZqeWhxOVhMUVJHVE9UbGkxNWFmQW9nMmc1MTJRUkFmeEZS?=
 =?utf-8?B?UmdQUDMxYnpEczIzRnFxdk9IYTcvRk5sVVE4VTRySnhXOWtIMjlBK0Jyb0Vk?=
 =?utf-8?B?SjA1TVZPSlFwdWswZlQ0VGJBdzNmMjBIa29sNE1GT3JvSVdRczhvM0VNb1U1?=
 =?utf-8?B?eVBEK0Z2bUY4empoTmlldjZ0TEhYb0VQWFJqOFIxd0FnSmtkNU1ZMS9VZTZJ?=
 =?utf-8?B?WEUzTVFQczVuczJyOFVxTnpJL21uZHpNTWdLUHNoaFF0dHdyZkhzNXBzQ2tS?=
 =?utf-8?B?eTJqbWpYeThoQ1JJWlNEakk1VlBGNkoyNWNiR1J4aG5SME1GdzlLWU1zT3hD?=
 =?utf-8?B?U2wwUVVDdVlFWFl4eHg0R0NsT1ZEZDJiZFM1RzFWdnk4MGRPRWRxOTgzN1VG?=
 =?utf-8?B?bWJ3RDhLdkhlREFsNWN6bmI1N08wbnR6b0QyMEhjeU5KNUJWaVQzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E01A64282CCD345BFD5D09EF1897059@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d78ffac6-7b07-4724-842a-08dea5640f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 20:23:50.7568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uXCq7iau66ZUhlBR3pQ7ajFygck85j3qxRDtxr+Jgw5GrNa/DHdmtqevM6TrY7twPeNorg6vEvTYd9vYyP87SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9479
Message-ID-Hash: MX4SD66ICQEB3OO6G6OLQHP2DLIVYM6N
X-Message-ID-Hash: MX4SD66ICQEB3OO6G6OLQHP2DLIVYM6N
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MX4SD66ICQEB3OO6G6OLQHP2DLIVYM6N/>
Archived-At: 
 <https://lore.freedesktop.org/45dccce37d37d4a2830f10f3cfb79f55fc203b7c.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDE3OjUzICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBUdWUgQXByIDcsIDIwMjYgYXQgODo1MyBQTSBDRVNULCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3Mu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jDQo+ID4gaW5kZXggYzgz
MzVmNWI0OWRiLi4yOGJjZjM4Y2RkZGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9iaW9zLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Jpb3MuYw0KPiA+IEBAIC0yMDg1LDEwICsyMDg1LDI0IEBAIG5vdXZlYXVfYmlv
c19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ID4gwqAJaW50IHJldDsNCj4gPiDCoA0K
PiA+IMKgCS8qIG9ubHkgcmVsZXZhbnQgZm9yIFBDSSBkZXZpY2VzICovDQo+ID4gLQlpZiAoIWRl
dl9pc19wY2koZGV2LT5kZXYpIHx8DQo+ID4gLQnCoMKgwqAgbnZrbV9nc3Bfcm0obnZ4eF9kZXZp
Y2UoZHJtKS0+Z3NwKSkNCj4gPiArCWlmICghZGV2X2lzX3BjaShkZXYtPmRldikpDQo+ID4gwqAJ
CXJldHVybiAwOw0KPiA+IMKgDQo+ID4gKwlpZiAobnZrbV9nc3Bfcm0obnZ4eF9kZXZpY2UoZHJt
KS0+Z3NwKSkgew0KPiA+ICsJCXN0cnVjdCBudmttX2Jpb3MgKm52a21fYmlvcyA9IG52eHhfYmlv
cyhkcm0pOw0KPiANCj4gQ2FuIHRoaXMgcG9pbnRlciBldmVyIGJlIE5VTEw/IEJlZm9yZSB3ZSBo
YWQgYSBudmttX2dzcF9ybSgpIGNoZWNrIGFuZCBJIHRoaW5rDQo+IHRoYXQgc29tZSBHU1AgY2hp
cHNldHMgY2FuIGhhdmUgYSBudnh4X2Jpb3MoKSByZXR1cm4gYSBOVUxMIHBvaW50ZXIuDQoNClll
cywgeW91IGFyZSBjb3JyZWN0LCB0aGlzIGNhbiBiZSBOVUxMLiAgSSB3aWxsIHBvc3QgYSB2Mi4N
Cg0KQlRXLCB0aGVyZSdzIGFub3RoZXIgZGVidWdmcyBwYXRjaCB0aGF0IHdhcyBwb3N0ZWQgbW9u
dGhzIGFnbyB0aGF0IHlvdSBzaG91bGQgY29uc2lkZXI6DQoNCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL2FyY2hpdmVzL25vdXZlYXUvMjAyNS1BdWd1c3QvMDUxMjM1Lmh0bWwNCg0KTG9v
a3MgbGlrZSB0aGUgYXV0aG9yIG5ldmVyIGZvbGxvd2VkLXVwIHRvIG1ha2Ugc3VyZSBpdCB3YXMg
cmV2aWV3ZWQuDQo=
