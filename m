Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD924FD4F3D
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 20:41:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB02710E785;
	Tue, 10 Mar 2026 20:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gyns91iO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C676545025;
	Tue, 10 Mar 2026 20:30:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773174641;
 b=hKrN0C7+4M3Vuj4YQvRn/1oEa8zYepZA9K7fV6vDIO9GLm7pROOzHMIfRAr/7LGP0GcOS
 DRBsDT84MI35i8uR+veEl++mY9z53mLQloyaDH8gz8hTBtp1iszV6fXXxRQeMIO27oTzrId
 guv0iDtY+KNADCQrevCpIgRBUiAx5t16tWnuRtsrF33cK5T6b20NWeDt202oK6mHGwnNjxF
 h8JafJGRshebGAufbdhL2jpgJ3w/3VjUu/ydQdvsdWGzv1wTAPQ0ELWBpvc9v15JLNfMEVZ
 nFqcEyhDb2NsbApBrG1V9NxVWhSnbAmlHJZ+I1pPYaU3pXTigJKxAD7cTMvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773174641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VZG8EOmKwa66YH3aI3w2pIb5YMXRrjswF64H75kY95I=;
 b=bYP1o1v/E8i1WqSdzoM3/EQnZJfr/kbfHGmovN3JwsFJr5IlzX+h+dIQCoybhw8FNLaKe
 WEQTQhW0i+V5ec9wZ7ul3ShOK8PU8Afek7W1vvZEAT8SFngo/Tn4N1RtAw40EwAIHFiHr42
 0us6DZExnTbyC5OCx+GF5Q0SGt57avJ4UwgJB6K9T9Xvj5Kh35ge/QdUW6iblNomgB4o/tj
 jnqYisf8xhW3xVnzwC28QvGAnszLTxwt8lhUqjXIE8NWfVMrSgSMXA6SYzjg849iO+n0mrb
 f0/csLkR8kGMU1nwclCjYTD/uOR/iJaB6GGs4eeRoaiei4OZIH5XA53Xx/DQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C534944F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 20:30:38 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011027.outbound.protection.outlook.com
 [40.93.194.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3B10E781;
	Tue, 10 Mar 2026 20:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWEEsivNWZ3r0L/+z8hSxdqHpaLgtbLLocTsjTEP5lfOnF57/SEX0WzYHYqVOllRuMfXRLH2H1axO1o5bG3FwK5ly+K0mKmtpwvrSvy4IOUwwBnJmJs1nqrZJ0j2rd0AqtwJcF4Dab6LOHLQ4tDLxOPzIiaa1r4nfWnD0BJG22BJWGj3XegziiuD+9knWleSLpqVvesqzpKP6L4vPYsWmOUXB3Iy6UHbj592J1gtkRZxUduovpTqv44DKKjSVeqLYj8YLVF01fHguWO3F1EGIX7OYTzE7Ghq3uSUdobaVq6oKoGuG5qQw3zIRFfUGtEU+CI1nrXwKmQjAkJ4J4IluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZG8EOmKwa66YH3aI3w2pIb5YMXRrjswF64H75kY95I=;
 b=mqkXSPgntrfpn970yL64OrbkBV3bLrPdoTL/A1fxte8uckYw6FP+X3VC3G5JeObava9nlmxKDScS4LQ2mN6g3YA+jJMR2i4pgRZgT1aAp5ee2mTfrp1yJrCNQbTZlWmPs4Tl1ZNJhPtOQgdPHO3EYHvKbixhvWQB0Dwni4MipV2EY5qnAcL8BmYZm+iuz9OvPclX+d4FKPw50JvLZHnrlxRcs5jIdYLKJg26ULyDgtVuUxBeR5EEjoxUxXs9bcM6Z5eGDBZIHxxLKApuP6dLM/xDCN1NSkxehG+sqxTIXvW0uoO7VoQ3ogyy6Tv/yh6oAE0OBUL2c/C0FYd4qeQoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZG8EOmKwa66YH3aI3w2pIb5YMXRrjswF64H75kY95I=;
 b=Gyns91iOaGbHsJxiDblskZbRQHrWQbJH8coc+sLUxLMHjvAS5JJtI/1dGRk32pKaQvENMsR9oHg4R9rvYsVEkEb/LLhMfJ1alVw12DI2zUZECXzBtjB7z/ZeI2c6OKmeM7fECUWTu3VZziLGuLZUiRLxamRACedGJKjn2WqTqRhpoxFhB7jdz+j5dHFfNBGLiXv2xLh7f9a8j+g4RJdVdWFbyE4ZmX7ROvW9bqymFzwk120R72aK6nkjPPJAfs96zO7lU9sANm4tQWrQBMkX4fdal/M0ghVeKm3vrcFreNoxFBqOwDNsYfD+pUz93luYG7BPK1532yIPY2JKMVrpXw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 20:41:08 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 20:41:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"yphbchou0911@gmail.com" <yphbchou0911@gmail.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH] gpu: nova: rename drivers to use kebab-case convention
Thread-Topic: [PATCH] gpu: nova: rename drivers to use kebab-case convention
Thread-Index: AQHcsIhSAucYuvfUKEaYnzf519PiILWoO2CA
Date: Tue, 10 Mar 2026 20:41:08 +0000
Message-ID: <f23905110a0686ede8f7622f8912e572f7e89ae9.camel@nvidia.com>
References: <20260310062443.2763230-1-yphbchou0911@gmail.com>
In-Reply-To: <20260310062443.2763230-1-yphbchou0911@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SN7PR12MB6984:EE_
x-ms-office365-filtering-correlation-id: 4ffa705a-4aac-4587-9b08-08de7ee55b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 AYkRJmsMH6WyZYpADGZmL80iJ/wiJbKSa2OUlBzWyhiEdBPs3heqLdPSWgqj3xRxYq0ZepD72Z56j6vGi70bJ95JPCm23fVrrGWyqtzdURzY1VL/AKlrmIpC2LR6rJyZdO3RcYMD65G9oMvOEhilPI8Biwp9A9urTx/mKoVxXfY3euQ237kGNwLGXtDDg0nwRuV31oGPioP0mpTHn6bThdsXeiUTWVolT5pWEFy49ifyYLZq/gI8r9iU1j36whCVZK9I5ICPR4NQCRhrQL+xKmQT7oqvlIMQqx0+zbP0pmncDQo2ApOtdDNo7hKhG+sFfl08I3FxjvxezffWoYS/1RB6Az9zJWTLYLJLngHOz1gVAdOyACO1w+LXJYFlcJm9pKox4hWS8QsOviLcz4a655To1dbFttZHWp9iH2vPa4SVqOtKTVMo6zfOrWnxbM4XBywgR46HGSh+DhZuPwndfYwHSLSCnnFMjnoHSN8IhiXjX3xTR7/DaVrguNHD3v8IOHVl3CY8mGlE3NHHVlKAL62Z0gkJ+OZgzb02F2qLoXUmpNP5dWC5UhgpfnBcVdY6VRYdHtkvs9wJKNTnE+9FFBfWWtRGJplamQL1gqUqLge7UZWZufpx4BC/yGr95S40oCySRn5POF0tgNDTnz5DJUc6ptpmjlDrWwhEJiHm0kCm5T0FE+tLCSz6OwJLpX7YjvH32rHwuZZfvZsM25NSfotgMz2Rdpt+f4TBfr6H+snJS8ItKZGhD/oyPzGVah2cTM0Pc8M1RDQ0etzfubdh4fEjuzA8j6eEQX2fu7D1nno=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHcrOGpIMVVFcVo5RG5jemY3Z1NkYlh5NDhBelNBSFZVVUptVE1SZ2pCQ2Z6?=
 =?utf-8?B?a29KdFRrc2xtMXE3QlVhS3hCTktVWG81L3R5NXU5Z3Rsd0VqN05CRzJIbjNJ?=
 =?utf-8?B?cm1wNlN6L2Q1Wm9vUTA0ZEQyT2tJWGJlZ25mTWd6eUhmL2pCSzRJM1RkR0U3?=
 =?utf-8?B?SVhRREFvazErWXE4YmJoREFucVVBNGkyOXBBYWs3Z1MxN3JQRHZRd09WTlIz?=
 =?utf-8?B?Q1MyOHI4bzNydDNETXBSYVV6dVNZdmVUNGVaalRQbUprWlhBbTZmaGlvMU1X?=
 =?utf-8?B?a3dOUGN5WXpmUWRqN245RnN4YlV5Vk9SRzhBVmdHcmdFY1o3LzJxcUJmNXJZ?=
 =?utf-8?B?UXpCRWh1d0FJQnZmaDVtSTJkOExpc3UvMzlJcmwzdjMrNURDZVJJbDNQQ2Y3?=
 =?utf-8?B?Mis4NVpQVjN5TnRBdmo3Q1VJc3BQWDU1dUdHbWpVTTFoN0FDN2dCeXJjM29a?=
 =?utf-8?B?Rk51b0pJUjQ4TlVLWlQrNXBtYzRmWXY4cU83NWN5a3piam93ZEhFR1ZtN3Vo?=
 =?utf-8?B?cWMxVkZBQlR4TDFYU0ZqRlhXRjMzNDMzVDNIVUFoSmRJNEYvYThBZ05OSC92?=
 =?utf-8?B?OC9HWUdwNUNvczg4YktNZkZBNlJsSzM3YktFd1BFSXpzdXNtVFdRQXFWbzN2?=
 =?utf-8?B?aEtBMXlSM3J1NzZPUzRkby9Ob3JPZEttVTVvaFdHMFhQYlE5bW9BZ1VXNjlw?=
 =?utf-8?B?SkFLN3dpVXVLc1d5eGdnaVNTZkQ5ZUdJek1sV0p5dVJBd0lHTjFFWGhSV25s?=
 =?utf-8?B?WmVpbWt3VEhUb0daTFhMdHpLYUwrWk84SU9zaUhYd3BRNFpsVmMrcE9lcTl0?=
 =?utf-8?B?eEFmb2NadWpLa0Rucld2bWVxY2J4eU1ydkJBOEhaUW1Za3VGczJZNFU1YXh4?=
 =?utf-8?B?RDEyajkwc0JwOTR5T0ZMTm9PeURNa2l2N1lMU2lUeWJUNGJVekllSE1uSEF2?=
 =?utf-8?B?OTdtczRjZHF1bXNxdjFreU9EUFN0azFYYkFUcWdFQlQ3VEVIaXVacmVRamZW?=
 =?utf-8?B?em1FaE00aW5rU2kyMG9HblNDTG00VGJrYkdmMTlpZFVqSmp3cGgrTXM1a2dG?=
 =?utf-8?B?WmJybm96TlhBZUxpeEZ5ZlFZRk5VVGJQN2tjb1lPa05FbDJ5ZmM0Tmt3emhS?=
 =?utf-8?B?TjdZVFlCOWV6dVhWY1J1WlVxK1lGazZlQ3dCcVFCUHRmbHZNYjlTci8vOHFR?=
 =?utf-8?B?L3JDOW5pQ2lreEZ5ZmxtVjZ6azNJb2ViWGxyT1FMcjAwa29GOUZ3aklCSmU0?=
 =?utf-8?B?R3BlWlJVcTJ6RU5IMnh4WHhnMGZCMEptVGdwYzdCbmVmcEVra2NTeEIzeDJS?=
 =?utf-8?B?d0ttditXYkJOM2M1Qno1cWZSd0pPbHBJSzlyTXNIK0RXRkJmWitScEdNNTEr?=
 =?utf-8?B?U3NlRHp2SzUzVkRVT1hiVmRRR1pjU1EvZGVQT3NQc2RJd3VzUlVMclNELzN2?=
 =?utf-8?B?L244TnUzeDArZDZrVGRKNWFCTThXWnBHaXNySnNhWkc4WmNHUHZyTXJyRHdO?=
 =?utf-8?B?RVhac05ENWpmRU9vRWZ2OUNUeWhLa2tzOGRYNEdxMlZyRERVN1IvazFsMGFJ?=
 =?utf-8?B?S0swaDZGL3NGWEU1ZVdWUWF3b0tuYjc4dW5ITEh6T2VBZWZTMVdURlJNM2g0?=
 =?utf-8?B?bC9qc3ZhMUY0OG8vR1BIMWdxQy9UMXRLZ2MwMVUxL3BSbFVJWXFzY0pQOW04?=
 =?utf-8?B?R2hUclZ1eVJNQUdGU2lLUXRTeWxCb1JlbENtNTRtM2FBNnZPRStFNnNjNUNQ?=
 =?utf-8?B?L0xVZ3hOUzFDRk5GQ1hSQ05Td1hyK1ZTME02aFowcURESmpkUkhDNDQ3RnJo?=
 =?utf-8?B?Y01LcnlqcG1BMFVHL3pnQzNIK3RkejdIQnpCTnM4dHFNczVRdmNQcG5jQ0xw?=
 =?utf-8?B?bmgrckpDcGo4UGdBNUE1MFo0ODUvaGhON3JRdSsvSjhCamJsWVBuazhjK0Na?=
 =?utf-8?B?TmY2ZzkwYUxSajhFTm1hT1lybXMyK2Z5eEgyZE02Mi9BTXVMcUhVak9tQkcx?=
 =?utf-8?B?dUk3dHFtTTFTVXdUbXp4b2lVd1FGU2VBVXNQQXVzWlo2OGhWampqRVBpN0VF?=
 =?utf-8?B?YUhwZ1RzUnY2V3d5ZnNMc2ExQWRWdWhQbk94aHB4TnpMZEhGNVdYMWNTVWJ6?=
 =?utf-8?B?cHlRbmRHcFB3NTUyWTNqdFR5WG55a1hLbHZKMkw5Y2pORGZPSXB3YUplMXI0?=
 =?utf-8?B?Rm1pZmRLbUo4N25MNVozUmVQRG9TQ0t5OUlyVEZmSWFDZXY1TmhpdTZoQXNH?=
 =?utf-8?B?VTdtaW9rY3NVYkt4Z3RWR09qYnM5Y0RVWXN5bUFkdUVBR3NoZDZpMGlDTXd6?=
 =?utf-8?B?b0JMQ0p0NnQxSjNVcSs2Q3V0aTQ5V0lwRDB0WkkwUk1CTDlnT2hqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E58DD3A2F021414CAB5CF3B5BBBF09BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ffa705a-4aac-4587-9b08-08de7ee55b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 20:41:08.1428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RlgMoQNgM/JNg1v959JtUJK9UF2EaBK2mIySyWJkufba+lA3RcVmMZ8Ilewi1JLYig2yh9dYxRq3gNzsolBLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
Message-ID-Hash: 3L7YS42QRQTUGLBGV76V3TDVTX3JRNJ6
X-Message-ID-Hash: 3L7YS42QRQTUGLBGV76V3TDVTX3JRNJ6
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "jserv@ccns.ncku.edu.tw" <jserv@ccns.ncku.edu.tw>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3L7YS42QRQTUGLBGV76V3TDVTX3JRNJ6/>
Archived-At: 
 <https://lore.freedesktop.org/f23905110a0686ede8f7622f8912e572f7e89ae9.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTAzLTEwIGF0IDE0OjI0ICswODAwLCBDaGVuZy1ZYW5nIENob3Ugd3JvdGU6
DQo+IFJlbmFtZSBub3ZhLWNvcmUgZHJpdmVyIGZyb20gIk5vdmFDb3JlIiB0byAibm92YS1jb3Jl
IiBhbmQgbm92YS1kcm0NCj4gZHJpdmVyIGZyb20gIk5vdmEiIHRvICJub3ZhLWRybSIgdG8gZm9s
bG93IGtlcm5lbCBuYW1pbmcgY29udmVudGlvbnMNCj4gYmVmb3JlIHRoZXNlIG5hbWVzIGJlY29t
ZSBVQVBJIChlLmcuIGV4cG9zZWQgdmlhIGRyaXZlcl9vdmVycmlkZSkuDQo+IA0KPiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vUnVzdC1mb3ItTGludXgvbGludXgvaXNzdWVzLzEyMjgNCj4gU2ln
bmVkLW9mZi1ieTogQ2hlbmctWWFuZyBDaG91IDx5cGhiY2hvdTA5MTFAZ21haWwuY29tPg0KDQpB
cyBhIFR1cmssIEkgYWx3YXlzIGFwcHJvdmUgb2Yga2ViYWItY2FzZS4NCg0KRldJVywNCg0KQWNr
ZWQtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoNCg==
