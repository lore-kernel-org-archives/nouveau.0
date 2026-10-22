Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C62C606A319
	for <nouveau@archiver.kernel.org>; Thu, 22 Oct 2026 16:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rSZD8kMt
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 253EF11276E;
	Thu, 22 Oct 2026 16:34:00 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 27FFE47B21;
	Thu, 22 Oct 2026 16:15:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792685705;
 b=Ln3A7SkuyUdeCfiZw9CXG1XOsret2VTn+uj/hNHd2sswIlnxOU2ydYwzafNHNiA8Kg4QI
 rVWQVCJ3f0Vtvl3Hxn73HNQd2yGlXIuyPmv9OE12T8GX3m5eRCjJ8k1JWayyiP2nq3+mVVw
 dSc5GCfQ/gX6tHUEw3XerS+SRMzIFGcASD/OCk2/wysY1js/KjCKITnF9Re1eTArzoexQKp
 /AtKqBxTZctOP7hAX3mMiIAyyvt9zQ0K4SMe6v4LstrkvJSZt1Lgt/t7kAgRDWvp+iWOI7v
 ma9dKZtnPdT54+Ib55uKzd6+1VpkCeJnYwHsZKoKAY5mfw2oFfJS8IwPVwjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792685705; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
 b=iNrWISGVippMwhp2UB+Bi11Ft0b1erzjVOaGI1UT9bGzK6bPFLVoWqwYqe6vHhZiQncmZ
 rLJ9SKmL9NhG61k3wJV3FLWmissLOMul51k2qU+gkWbIwNSlCjcvsKUbmuYWjbR2+RTvet5
 fUh7mj3JTGNbKEVCFBGtMVSRVGDKevbIHUDP77o6q6paU0OTvk3uuHYqPJB38DhKGf/EwKi
 E9+5Y8d3sPBidCwAotNtDXdpUDjqpc00D7QQefHciOwihbB5r9Shoz/bjdI6v1PJCaOHCDO
 t6dp7s2hS9tRvFzJLZmWxZNI25uUmrTroBPvxSHWcRXqAonqJ/Y7P8iX1+Dw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4611B4713D
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 16:15:03 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EAF1A10E468
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 16:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBfCVLrm65+wsYNq5QyJMdW+sbQb0ZvckXnvYBP1FvUAU5dAV1X2c/6ta1U9dqFOSjXpYzPgJ+1ahuvXyEfsXSsIo2vW/P5LwWVb2bRjKwVuur+lz3ir9VSmuubNzIZxliPuTuAEy+DeM5JiyZTbSoMrKWGhDYeNPBUrMMPzxpGqKB0yxbIhiJYB9jhGahD0UIftf9dqAsxTMHSifTpwkRlTOuxUhcMPBgq3GPJ5jvksn7rZFaiM2eC8GHmWrdBDcKgRuO46u3k0+1kse2SZsY9nA94mkCYRrcq+vnvw2g7xKcDt2xHnSkZK5oVumKEa9paUenZpyI9P+/3LgpabyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
 b=LujyhxWx6dE+P5oB7Q+GTIkCWzR1uj7OYY5xWJ4+QWT5B3han5gNsGrksNfzCQNYB1/sw+GlCMPRN36Yc9oBVBeIuZ814rH7i0GqMTYx8Oa2YynSIil0xNdZmfEr18xI34KI9EmDDuIDKUemyFgrtFX/enwpQ6SuyoTKhzNnQOYwqQALYe2d0y2TBI29pFpKWh3Fc+YEWeWiVYHWNpmWtVSxCUSX88V5VE2AkoXCLCND2IPb59c70VSUNfpdwpSmwxW0xplfn0kLtUAmTaeVFDBc5MrlpFy5vevoRNamQ7Wpnr3bBVD5LHc9Kcpq0OSLAtqQj0BbqVBmh/DQl7c31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO2YWMtuS4wnOtWDIHs4tEdrqDt0Joh3sWu1NeTUphQ=;
 b=rSZD8kMt5vcZaBv2uETvgZFKZK4siPjLuVyWW2NKiAf9zy0H/yONtW6BV+WFSPztZhUtu/Ae4OMn9zmtDtvPW1WRUzxtPDjLhUGHU4xALKdP5A/eg/ViCnFgrN7koLum559va6BAQdvAPn8utJkFXKeEe5nFSypcjJoUPr3dBLa2+qD8eSNattKNt2JzwEc/D/4N8mEE6aLo7QinapvESsOfqII0kLRSJ2cPqSdMv5hsgsO+zIcrCZtVgPLs5sgAAiEQCFmGWHRV6eB/1+KVjVAqqePdB1t+fATS94+XMUteMSGquKxyMAmaKlDuoIm8AzZPS7S/NgILYWmYMHK+ww==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by BN7PPFFF39339DD.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:33:25 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 16:33:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"eddi.salazar.dev@gmail.com" <eddi.salazar.dev@gmail.com>
Subject: Re: GA106 booter error 0x15: root cause found from bare metal (no
 Linux)
Thread-Topic: GA106 booter error 0x15: root cause found from bare metal (no
 Linux)
Thread-Index: AQHdYi68/kGMjqjDUEm1pG54qLdfS7cJwb8A
Date: Thu, 22 Oct 2026 16:33:25 +0000
Message-ID: <b26b398a83786047537f46b728d012e4b042bd6f.camel@nvidia.com>
References: 
 <CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com>
In-Reply-To: 
 <CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-9 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|BN7PPFFF39339DD:EE_
x-ms-office365-filtering-correlation-id: 2f0bc949-c03f-4eee-8059-08df305a3220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|10070799003|366016|261021123027099003|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 dUwQlzMBOk+snQ4hVotvAQPYpF0Bjb5F+8N+I8GGZSvCQVmOauFpcr9DKdFbAEXuhRXcW7UHDMDRel7/NIwNN0jd5KIiyVYgYC+s0FT+bc5RnZd/dEEJIXqSPh/iL44LX35Dh4Nix7k8YuLxrXwzpU8e+sBHNO+2hA5q0wbQ0BpvQ1c+u0AEvNgcFq9QSNjHz2WExyLfqbhBkhvmLWOSHy5DXcB2Tvo8Hh4oBzMfkcyVuxzFTIy5nsaH07AZ1e4iLFuSfkZy5rDkhCD5OkKnKnwHPVtpdkHq4OR58WCxWOd5l47JqIHzbafaH5itQtcYwegsOpoNuA8AahN4F18tx049i8a/i+ofdvtpYL0Dpd1fhk5j20PQIRclIol2JHuA/YNJWv9mTjnt1FY1AZqr3j5wR83kGVDCovA6J1p36Ec1b966OWMKWTvZY3jEUzofGFq0jKOn1BLNGR+JLTnaUxbAHVYP+Nn86YDxpsBBoQWGmNwRHUIKVLSCKGiQvOCmz2PEbDzuX7JG1HeA2mMbou8VaSxorTru8HiF7lI2D0hNonRfBppfZFo2H94AqNI+CrZzI/c7zf4phq7O+OnyYX2HUio4OJY4z+odEegSeh2WnaxAbQSzIio3PXQ5k3+UB1QYbjp4Bvrj/O3D2NBTEEy+nI9jBz/vdeooeTN+x5nmt7p7+wcAsX7h89dFTeLA0U5KvGG0tZfy7cheATWUtJt2GmwobIpV/+MCUqIvRHw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(10070799003)(366016)(261021123027099003)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eVlmWkJ1MWlJUmVsNDd6LzBZTTNDaUM1Tnl1V0s3cHU2K2VsZ0d6bnppRTk1?=
 =?utf-8?B?N1hnQUM3TzhHWW4vN1V5dnFMc0dhWTFTTmhUd3NBd3I4WlIrejA2UVUvOXR1?=
 =?utf-8?B?Ym5CeVAwMGo0T2F4d2h6UU1Hc2ZtaWhweGZ3eHdMa1NnYjRmSGpETTNxY0lP?=
 =?utf-8?B?NWJJZnZoOVNUNk9PaHVtWFdQREcwZUs1eVcrRkFpWXhHTWpBSjhhbmdsemZh?=
 =?utf-8?B?Uy96elBYRmYrOGFIQXRvTG5JL01MYkwydnNxK2JNeFpUZEhqdnlJN3VIdXI3?=
 =?utf-8?B?Nm9wSDZPSXhyQU8wV1ZxWVY4cmw5MG9QTWRiVldlUDVCZ2FDUmhraVhXMUFj?=
 =?utf-8?B?M3hvblZvVkVmUTVITjgzYm1rbWoyVWNzTi9ZbkV6K2lGQVhyTTdCOEZSNXFZ?=
 =?utf-8?B?S1JudWs1bGhkY2RlejFKZ3Z2ODdkZ2sxSXhiTjRqWWZmcnRMU1NSU2xTdUZj?=
 =?utf-8?B?VFlLQzNnTmp0UHpacVFoUzhTYlhtaFVUeENqemtmVVRDRkFXem5rRk5MWlRZ?=
 =?utf-8?B?clNMbWVXYWNCa25BYjdLM2g1T0lrN2lZZkZ2eDFrZndKSUtMNXVlWEs1cWZR?=
 =?utf-8?B?MEF6dmpWa1lScUE3SUtyMkIyaDZHNjlJUk13ampld1hxQ3FtZkF2QWc4OEh0?=
 =?utf-8?B?UCs1bzloV05sSnlHUHBUSXpCSHgvR2lZR2JDdnR3TzY3aXh1bUtldit2ZGsw?=
 =?utf-8?B?OGpmSHgwcTRocUd2a1c1YnAzLzkwOTN0K2g2azcvTXJMbEVrOWpvNFpVZlJm?=
 =?utf-8?B?WFZPekFsd2xTQWNEbzQvdGpXTGtZUHB6a0hTekFybXZOM0lyRFE3V0pKeW0y?=
 =?utf-8?B?Nm5BUXFodTN6MkQxUEtqMjFtNnlXUWFIVlpucHIrYTFaUkZMMkNSVkZQWTJ4?=
 =?utf-8?B?WFY1enExbGw3ai9YT0d2c0kzbittOGc0WHFwdUtUcmVKckJOUnNuN1VxU2lt?=
 =?utf-8?B?YmQwOVpSdDJ2cnc2R3VHNWs5eWtLSWlkQmVxS1h3TW50REJQMjdWczJEOXZz?=
 =?utf-8?B?Y1lSeUxBbk8ydHJNZzl4cUpaSVFnRkdoakMyV0dmay9ZSzhQMzB5bzZtZzRp?=
 =?utf-8?B?cXFUVjBYcUQwTmhhMVYwdjFwVVVHUnJMSUZKNFFBd2FNanF2MmlldEVQbkVr?=
 =?utf-8?B?dUxkTHdFTk5WUjAvVm54N1JIbXA3eGIzZnhMcXhUd2xuVFQ1emIvMkhVN3lz?=
 =?utf-8?B?TkNGd2ZVREtNVXgrenpHb0MyRG83TE1TcW5lQjJhTVhWb3A0eUZ3a215QXdZ?=
 =?utf-8?B?MGwzYmZoUWZXajZOOXZZU2E5dER6aEM1YWZ6TVNRSHl1UHhMRGs3cVFZblJ4?=
 =?utf-8?B?ZXlxZUkydERLQ0RUZVQyWVFERWNBU1VOd0ZOQ0lJZ09xemU5dTNNWTJMZlo2?=
 =?utf-8?B?UFdTUUhqTSsrMGFQLzNZQ3dzanBTL2VOWUJrTVlFZ21yVnlrMUF4U0hkb1VG?=
 =?utf-8?B?dStBaEJKaW0wdmFWTmRlR2xWQTZZT01qei82ejlHUXFUNWZSdG1FOTFHa1lq?=
 =?utf-8?B?YXNSem02OENwNzNaU09kN3pXUUN2RGw2cVdBNHFSYjNhZ242d05yem54eHdy?=
 =?utf-8?B?dm5XY3l5RkE4NTU3MnlYY2ZzYkhoZGJja09nUGZEaTJVODIvVjBiSnFxbW5E?=
 =?utf-8?B?aG1QeDlkWjZNTXR5emtVelBzenRoRlJZNUU0cHNoYnlSanpoMkpaSkFjdlVM?=
 =?utf-8?B?eXpFYzJwSXB6OVZDNDdmU3hMeGdLMjRxMlByL1ZuTmNuakwzWHRLQWJkVUtt?=
 =?utf-8?B?K1dmUWZtUlNnMndpeTV0dkVXOW9SNzVwR0VrNWNIZXJNVUpSUngydDdhY09V?=
 =?utf-8?B?dC9rbHpmcFVpa2FQeHk2M0tNSWpab2xsNnB6YUU2ZVZrNEx2enh2T2sza1pj?=
 =?utf-8?B?S3FyclJwbzU4Q3FxNVpENjM5emFldUl1aG0yRDVYdUNZQURjVXQzbjA3YkI1?=
 =?utf-8?B?L3hsSWV5NnZjelVJa3lZTENCSU9BY0RKYzdHTnBUZC84amNCM3N5TjVwQ3Ar?=
 =?utf-8?B?eTdYQURPUCtyeXh1S2dWbkdKTjUwdkRRS1hpT1FUZHhya1paMXZkamRtaHhN?=
 =?utf-8?B?dERDR0NkbHhzTTBFZGtBb2NDK3VVZEEvRlhlOHNWSTlrVGg2cVpjS1lWY0tI?=
 =?utf-8?B?bmJYckhrOXczVzNWVXFnTmhteGhUamM2aEVVMDh2RHZMWGRTME96K29nc3dE?=
 =?utf-8?B?ejM4cS8yUkdCVEk4TE1ib0JqUUVueHBCR0lVVDk0L0JUcUo5QXNZSUxYaGNi?=
 =?utf-8?B?Rno2UWc3ZXJGQk54OW83UHJ2czc1U3NlUTZORDBSVUdlUTliNStNL2lEQzVZ?=
 =?utf-8?B?RytTL3ZkQ3kzVmliaGRlY0dGU0drMGNCbXZYQkU0R0hrVHJwNjNCdkZiVkRM?=
 =?utf-8?Q?iA47jpUazX04tXAApuYdC2cCT/dA0ZIqdDttYpnf/PqU1?=
x-ms-exchange-antispam-messagedata-1: qdngh75B1AcQRg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBA24777E8B43846953BD9D07A4B696C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f0bc949-c03f-4eee-8059-08df305a3220
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:33:25.5819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 9jTN4gXfPo6Mq3NfLxxffVqCJTleXSNR4aevXcocsKCzKfar8dbzf1cN9R+HEsyY90otfkJfHqvWqHO0ygzxuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFFF39339DD
Message-ID-Hash: KHCRJQ4VHBTHXBLQM6S54FXY3JPPIGVS
X-Message-ID-Hash: KHCRJQ4VHBTHXBLQM6S54FXY3JPPIGVS
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KHCRJQ4VHBTHXBLQM6S54FXY3JPPIGVS/>
Archived-At: 
 <https://lore.freedesktop.org/b26b398a83786047537f46b728d012e4b042bd6f.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTEwLTIyIGF0IDA4OjQxIC0wNTAwLCBFZGRpIEFuZHJlw6kgU2FsYXphciBN
YXRvcyB3cm90ZToNCj4gSGksDQo+IEnigJltIGRldmVsb3BpbmcgYSBiYXJlLW1ldGFsIHg4Ni02
NCBPUyBpbiBSdXN0IChCTU8tWCkgdGhhdCBkcml2ZXMgYW4gUlRYIDMwNjAgKEdBMTA2KSBmcm9t
DQo+IHNjcmF0Y2g6IEdTUC1STSA1NzAuMTQ0LCB3aXRoIHRoZSBzYW1lIGZsb3cgYXMgbm92YS1j
b3JlL25vdXZlYXUuDQoNCkp1c3QgRllJLCB5b3UnZCBiZSBiZXR0ZXIgb2ZmIHN1cHBvcnRpbmcg
dGhlIG5ld2VyIHI2MTUtYmFzZWQgaW50ZXJmYWNlIHRoYXQgTm92YS1jb3JlIGlzDQppbXBsZW1l
bnRpbmcuICBBdCBsZWFzdCB0aGF0IGNvZGUgaXMgYWxyZWFkeSBpbiBSdXN0LiANCg0KPiBUaGUg
Ym9vdGVyIHJldHVybmVkIDB4MTUgb24gOSBib290cyAoNiBpbiBhIHJvdyBmcm9tIGNvbGQpLiBJ
IGluc3RydW1lbnRlZCBldmVyeSBib290LCBnb29kDQo+IGFuZCBiYWQsIGFuZCBpc29sYXRlZCB0
aGUgY2F1c2U6IG15IG93biBJT01NVSBzZWxmLXRlc3QgdXNlZCB0aGUgR1NQIGZhbGNvbuKAmXMg
RE1BIChvbmUNCj4gdHJhbnNmZXIgZGVsaWJlcmF0ZWx5IGFib3J0ZWQgYnkgdGhlIElPTU1VKSBy
aWdodCBiZWZvcmUgdGhlIGJvb3RlciB0b29rIG92ZXIgdGhhdCBmYWxjb24uDQoNClRoYXQgZG9l
cyBub3Qgc3VycHJpc2UgbWUuICBIYXZlIHlvdSB0cmllZCByZXNldHRpbmcgdGhlIERNQSBlbmdp
bmUgYWZ0ZXIgdGhlIHRlc3Q/ICBJIGRvbid0DQprbm93IG9mZi1oYW5kIGhvdyBkbyB0byB0aGF0
LCBidXQgaXQgbWlnaHQgYmUgZG9jdW1lbnRlZCBzb21ld2hlcmUuDQoNCkVycm9yIDB4MTUgaXMg
Qk9PVEVSX0VSUk9SX0ZMQ05fUkVHX0FDQ0VTUy4NCg0KPiBSZW1vdmluZyBpdCBtYWRlIGV2ZXJ5
IGNvbGQgYm9vdCBzdWNjZWVkLg0KPiBUaHJlZSBvYnNlcnZhdGlvbnMgSSBoYXZlbuKAmXQgc2Vl
biBkb2N1bWVudGVkOg0KPiDCoMKgwqAxLiAweDE1IGFycml2ZXMgd2l0aCBXUFIyIGFscmVhZHkg
ZXh0ZW5kZWQsIHNvIGl0IGlzIGEgbWlkLWJvb3RlciBmYWlsdXJlLCBub3QgYSBsb2FkDQo+IGZh
aWx1cmUuDQo+IMKgwqDCoDIuIFRoZSBHU1AgbWFpbGJveGVzIHJlYWQgMHhCQURGMTAwMiBhdCB0
aGUgc3RvcCBvbiBiYWQgYm9vdHMsIHZlcnN1cyAwIG9uIGdvb2Qgb25lcy4NCg0KU28gQkFERiBp
cyB3aGVuIHRoZSBkZXZpY2UgeW91J3JlIHRyeWluZyB0byBhY2Nlc3MgaGFzIGdvbmUgb2ZmbGlu
ZS4gIE15IGd1ZXNzIGlzIHRoYXQgdGhlIERNQQ0KZW5naW5lIGNvdWxkbid0IGhhbmRsZSB0aGUg
SU9NTVUgZmF1bHQuICBEb24ndCB0ZXN0IHRoZSBETUEgZW5naW5lIGxpa2UgdGhhdC4NCg0KQm9v
dGluZyBHU1AtUk0gaXMgYSBmcmFnaWxlIGRhbmNlIGFuZCB0aGUgZXhpc3RpbmcgcmVmZXJlbmNl
IHNvdXJjZSBjb2RlIGhpZGVzIGEgbG90IG9mIHRoZQ0KYmxvb2QsIHN3ZWF0LCBhbmQgdGVhcnMg
dGhhdCB3ZW50IGludG8gbWFraW5nIGl0IHdvcmsuICANCg0KQWxzbyBrZWVwIGluIG1pbmQgdGhh
dCBhbHRob3VnaCBHQTEwNiBpcyBvbmx5IDUgeWVhcnMgb2xkLCBhbnl0aGluZyB0aGF0IHVzZXMg
Qm9vdGVyIGlzDQpjb25zaWRlcmVkICJsZWdhY3kiIGFuZCB3b24ndCBzZWUgYSBsb3Qgb2YgY2hh
bmdlcyBhbnkgbW9yZS4gIEhvcHBlci9CbGFja3dlbGwgdXNlcyBGTUMgbm93IGFuZA0KdGhhdCdz
IHRoZSBmdXR1cmUuDQoNCj4gwqDCoMKgMy4gVGhlIEdzcEZ3V3ByTWV0YSBjb3B5IGluIHN5c21l
bSBpcyBub3QgbW9kaWZpZWQgYnkgdGhlIGJvb3RlciwgZXZlbiBvbiBzdWNjZXNzDQo+IMKgIEZ1
bGwgY2FzZSBmaWxlIGFuZCB0aGUgcGVyLWJvb3QgQ1NWOg0KPiANCj4gaHR0cHM6Ly9naXRodWIu
Y29tL0FuZHJlZVNhbGF6YXIvQk1PLVgteDg2LTY0DQo+IA0KPiBIb3BlIGl04oCZcyB1c2VmdWwu
DQo+IEVkZGkgU2FsYXphcsKgwqANCg==
