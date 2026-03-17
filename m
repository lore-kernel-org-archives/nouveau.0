Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64988FF6E97
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 23:02:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 100D410E363;
	Tue, 17 Mar 2026 23:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LWiPIolT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2382145208;
	Tue, 17 Mar 2026 22:52:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773787927;
 b=fKXn3GDAG69gIFH0ZT+gVHsEsZooseYTYQkw0TbtkAE4EdN6HX0jaHGjDHfDVPJ2//0k1
 cJ++xU6LQHpd6fmqXdc1zYrJMmVvkrEcVl9IMpFWTq3GZGwVqlnCzObaECNGZzjEFE/1Hps
 KJtF5erpPZvApg3n3jAwKwSjzG+a0gP1hBnzq7OSkogjI2UoAVivG/a5QmjaXsMOrHTHGSJ
 BTgo1OUh0h7xvCsTR+tPMnz1GISSe0e77jucT7E5ff4bv+m13yd9Q3HK0v3OSE8KXBcjSV1
 LXzXSxpjsJy1n6nymOG9w9OG3H4xDd6QSDlimQ2S5M2wSdhOIAp5ZkXDPyMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773787927; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yTJpIDNv53IwEomQT0Fs6IU0pge3rme5uw+p/tiapwk=;
 b=wlUwjkMCiUswFveZ9Bzo1haQpCH5LqRxLpn2itASNUkiEBue+0gyNs9JXBHMJ67CzNP0E
 yGEbogEzwpTyfVpcL/vBeEeUAyc6syUv8JQD7Pb6ZNfmi6nSTQrZHp3y7UvtFw437HcqG7g
 YEpNoq/Iplo8ffFY/MDf7kzBZ3UmgOEJFtlnZU5lPUVS99LXDu3Sq1SBFAetGxFpGRRceca
 ggdoPAUpARqUDRlWsmsOAyC68gMMtM+uYox5emEXkltVMN4hTath78Rc+2S93aLfoPSN9wS
 Bd1I9RoAGbAc99quF1/6gKJARYKLCVZt/QlkQK513mJIZnJbHb3t50FyLZAQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B30E645168
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 22:52:03 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010064.outbound.protection.outlook.com
 [52.101.193.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 57E9210E1CA
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 23:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGYm5QkiixhNxn3AhmG6RxqIy8M86XZfAgmc37zJmhLjN6KODXJo/VPDO9rUaBCcc8n6h3VuZsGI5QNVGLPOVwsswUJT8IldZaj+mDvFs4fKMtFI2jO4EZtttoEk94ZyhVnL1+ylzTAH+YNMEFcBCZTeO8mgFIeWZYc8ZvXEmx/LMrJVMzD9JoOPiqNoVJJSWUCR6xvpPylWNOOMY27q1T/nBxMvLnZ6wIHIAoesoa8YGCLVnTeb4wdUpBi9IOa/c3zIwzB2DRBMpSHNP1wfEY8Jdn/BBZ2OIHxacRIyUgXfrgxWopaO22YYbZfk7qgnT7BL/h9AsXb5nuLk9W1hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTJpIDNv53IwEomQT0Fs6IU0pge3rme5uw+p/tiapwk=;
 b=Y7NoX8luoZmoGwRdlLu8A+uNCyCzUaezttGgNXlxa0diGM9i5nan7LbluYmhGMFCDtvOAYrLAcDPPzIFoPI0dJLPEiQVXkCHE73AuBtrsqBcOTGEe3ylLjj9KizeaaJ9VVKVMK64IueXNgPfugHvn1TlVfhPZfhYxSKXaKx6ibHUuyoe7Ky/xH4uE69BdHLI1zL4mniM1WntIeAeS7zVio3fJ0YepvzQ408c4rWgkvLq2bHwjVPJ640UdKUtHJ+MkE0sv+PEpjMiB3108eNti6Ul1UdpO48rtAM++Og6mymmK32XJndMQAr7pYYuAeWHgYB6VbDkg5lxlcuX5YDgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTJpIDNv53IwEomQT0Fs6IU0pge3rme5uw+p/tiapwk=;
 b=LWiPIolTuNJpeLj4MGfMo87JuVIltnV9/T6ZfAUV80moQyfLHOU0iGZ7vYNwK2UBFx4pbjF+rILYuyLlrrPhNzRUCZAkHM8qqt2GBb502IgH0pN2MJPE1H8SkugC54/szVQB+B2urlBznk5LahYJj3gzDXe+RnaF4fkq6wB+f2NbSubgTHZcw7VNkg1odO9UT3hrzfxJF0pTwmz1PC4NoInYsAT12Qfp6ruHVwpZ+cEv7mxIXISg4RhvTt4895sRuWlr9pJEV7bZlYipkJMvxUfC35zgifZvvu60AWVtJgHHqGOPbRvNvg/4yGODx0f1I7fRrNPqDjoknaGDgudobg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 23:02:49 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 23:02:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Topic: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Index: AQHctQndq18hMzcaTE6ci0QTa63qA7WzRD4AgAAWBgA=
Date: Tue, 17 Mar 2026 23:02:49 +0000
Message-ID: <d33f63a955b87669f8026f3498fa9bd509180aaf.camel@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
	 <20260316055736.1690546-3-ttabi@nvidia.com>
	 <CANiq72=6y4Mn=i9MnqwTdL-a4ujABcYpWe2P54naR=rutpMS6w@mail.gmail.com>
In-Reply-To: 
 <CANiq72=6y4Mn=i9MnqwTdL-a4ujABcYpWe2P54naR=rutpMS6w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH8PR12MB6916:EE_
x-ms-office365-filtering-correlation-id: 52d0281a-115f-4d19-ac86-08de84794f62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 x5mWj2eMQrwp1RbT/MsYCznuiCekeKS/n36PMz4E2ArPK+F83k0B7gQX2lJ0VrxK4uWKCOpvutGFsXLk706xrxBfNnI4j+nFin9BscEPFpu4LUKdL+ATPOY8ay/C6J0qmrampfgibpb4btHu+0tiMYXdcFBPKt5AeGSvA0KFLuZgVXJoO7Yh2ZS3rWRHxz9VKliGB4F8w5gXW05/+GNQIZCN0a/c3haIKNv+YFotuPC3jrVm1ch8m0yqaLdq9DqaNAROr6UGxDLatlDDaMghBrjD85t0qMzctyuXT4NuL3HLo2QW86C76zTy5GZoCz4FMP2Gzqv/3HwHmg1mm0vP04zvQMvmGX8HZn7W5DxJxBd1V4+jWoaM1WBEYpK2S8qJQpF778Jx1JVlBr+Aq5nCaGGQ9y8y4M1t+kPzAH1ZEVofWqS2JqWC5AKPkRrvAlaq8iOWL61qbmjAoXImjNZwlUVUa11ythZW7wtxJFFA1WinsFks5e2ZHlnxy+jpt1nrzFTR2xfphM+H74PtWBgFfhanTIMmjXGjxHjH0o/jJZ/9r5tUlZgAqk5W24COCxUhT7QWcQYJv8YwQOtnvBq5nfEFdPWSS5VvJMGDXICL3psg6T6cOjn0LDJBrSrS2Zmi8+MVDawVgOCzCpIXqoCDClYousHrz+i3XPe2Dz6gA5lt1niJ74sKiP8Ym8Z/0BciC3F4a4ApYUVyCrVlLgui6hc8tcOLGuAXGAvfjpqFfDzRFXZLHrERbj3Nefmv6z9gbRCUMociUvqbClsEDbYHcwiJDwwjJ7QHbxkDQcEpI9A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzBoOHRXNmx6bzBWaEhjdUl0clpFcXFuQnNGalNsaWR4VHhwMUVtUnVPaFJT?=
 =?utf-8?B?WVZSMVVSZUYrU1Z0enA5bFVlR1lNNnorV3FrNjc2Q1pCL0RNZjk3S1NkVDdF?=
 =?utf-8?B?Y2RQa0RsSFc5N2MzUVNjSFNqSEU3MVVlUDlGdjV1NTRVa1Y2N2dFYVp1cVBn?=
 =?utf-8?B?cWhZOXExSjFHMTJXaXJTdmJNeEloaDZoY1dNM1JrMjA5U3JyTTJzM2JDRGtn?=
 =?utf-8?B?dDRhd2xqbUNkcjJYVWd4SVQ2MUNkU2YrNWlBc3NnLzlDRCtZUDJ5M3puWW94?=
 =?utf-8?B?cnZ3a1VMQlEyd2ZHMVhQQytPQzFZMWFMM25KbTJzY05mRE5UNTFERGpqZjU4?=
 =?utf-8?B?RVhXMDkzdXFuUWZTT2RRQ0NTTFZlZnllQzVoMFk5c2ZuS3V3ODVJaHEwNWRF?=
 =?utf-8?B?UVdaWmt2NGc3Z3phNmx4cUpnWlZGRllWM0krZ3FSV1pNOGlhcWM4YjdGQUZ0?=
 =?utf-8?B?a1M5WHlMemFid0FpWDM2L0EvVkpGRUdEdW1KSU1Yd2ZtZkF2M3JnRTdHMmRq?=
 =?utf-8?B?bHozc3BMUTB5ek1CRFBDNkM5R2NFeWd1UEhmY29kRkJINlhQMisyUEFBcnNK?=
 =?utf-8?B?TTgxWHhQbWJKcElxdU8xZ1I0dGMzNVJ6aW5SVlc4bmtLb3NyaWVuZEFzMjdE?=
 =?utf-8?B?ajdXeVExdU8yeFRoKzZYV1Vha0pDRklTbkNPcmRBcFh3MURZaUtQY0Y0RE9T?=
 =?utf-8?B?RU0yL1FWTVRkUTdLcTNxQmxhR3IzQmt0cGFtWStTRStLN09kM0ZYYWhLNG1D?=
 =?utf-8?B?aXM0VkRwU0JzVGs4Z3hlTzR5Nk4vSE9SRFJrcEJhbXF1UFIyd1Q3Wk0zdXlQ?=
 =?utf-8?B?cnFzYnJhc04rVU16UW9HRkdxZUFiL2hNWkhNOXZKOCs3VnQ4Q3NiZnRtMVZ6?=
 =?utf-8?B?QlFyRkZ5R21UM1ZGN3ZCQWVRTVNCZEZBUk1LbE13a2c4RW1adksySjROc29m?=
 =?utf-8?B?alllTm1jZjh6dU94R3NRM1FtcENzczA5S0ZvQW55T2F4NWYvK0Fab2RsQ3ov?=
 =?utf-8?B?anpNV3daVkRDZWxHalVnZ2d4Nk9qYzN0VzlGSGZMVkV2UnJrVWFwa2VRblds?=
 =?utf-8?B?cFIzZ2RyZ1c2cENKMWdZWUtzbXhpOXJGeUVFTVZXdmRaNHpBSE5pbUJTbW81?=
 =?utf-8?B?MUR1NElZQ240TVIxa3NFOC8wOWltVXNUaXBmN0FlVmFWc1lKcnc0RUI5TWt2?=
 =?utf-8?B?ZUJsNnJnQ05xc0RpV0NlaThxaVlVaXliOTFtTmxZaDV6MDRMTm1BV1F6WmYr?=
 =?utf-8?B?SUpLVEd5OXdGS0E2ZHU2VTVVMk5DVlhveGFWSm4yZ1BYQUNsSnlVMmpQM0R0?=
 =?utf-8?B?ZnhDRU9Hbk1SWVpQUlpmL1Evd1hVenFoZmZkYktQTE1TNWRyOVRSYTdIY3pl?=
 =?utf-8?B?L0JZaVJ3MFNJZjBtRnJuV3VqM2ZyTWt4QUtwTnJybGRmRyt3SXFhdXU5eXln?=
 =?utf-8?B?YWFEVFZSV1N4TTBkeEdWUVE2WHRjS3Vtb0liRUE1S2hMTkN3aFNZWEdjY010?=
 =?utf-8?B?OVN1SER3NUJYbkwyQ2drU3lSU0RSc0E1YitZbXRUc2I1cE9NUVdUZ2pscTNv?=
 =?utf-8?B?YkZBaXBRQWNybVNQRENpRk1LU0RPVGJLT1Mrdmk3cDBNbGFYVHVZM1pMak4w?=
 =?utf-8?B?akc4R0UrcUR0UUFHNHMvTkJiQXk2NC83VDl0Y0FwOE1QYjFjSHl4QTNIQlM3?=
 =?utf-8?B?TktQb0p4NkRLbGgrajFFNWVUWEx0elV3MDR1Ym5UYkg2T2hMYzQ2UWluWlh6?=
 =?utf-8?B?RmIzd0ZXT0c4bkdld2VSdFR2K0JWdTVaeTJta2ZNRlROS3RJNjZKQnJtc3Ir?=
 =?utf-8?B?QVN2ZlpaTTVpQVZFNmNzd3N5U3NVZ3RqbU43anRCbkRhRGFNZDI5ZUtTVFo4?=
 =?utf-8?B?c2N0UjZWYitqZTBpQ0RSZlNNQ0NqSnVrVUFmeHhaSXlCY1dmMU1ZKzI0Uy9K?=
 =?utf-8?B?ZEdYblpKWlVGeC9QQzBnR1BIOTRIZ2xmV2hhRUpBbmpVK2tGdzZ5Zk9PSUFH?=
 =?utf-8?B?Lzg0bEx1YVB6R1dyNGoxeSt0cmpVdmhOamo2bU0zNVZRckVDTkg3TjJDTnpu?=
 =?utf-8?B?clVCN3VsNVFMTmF6dGcrdzV3U2tvRVhkcUlPNHFWWWlzNU1NWUN4K2orTnFM?=
 =?utf-8?B?c2FEVWlKbDgzYmthVkpCQ3NSdEhBbEJMTVhHdGNhVUY1N0lTMTZYM1Zpb0Qz?=
 =?utf-8?B?RHBySTdQNTZBMEZKWHZhajhIQm9RNkN5blowamgvcE9XVGtKVmNRS09FK3dt?=
 =?utf-8?B?QlllZms5bkxLZDdjTDRtaER4dmxtK012bVBQQzBjUDg5QzVtMUhGSnNmNkxW?=
 =?utf-8?B?ejVPQUtRMGJMbUZkYm1VVkNZbFFUcEpab3RSSzcyUGtESUM1MzZhUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0762F8B5356834388ACA988B5431846@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 52d0281a-115f-4d19-ac86-08de84794f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 23:02:49.0428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 yB15igusV1lINMBZxM9NdFdsgjBphqQv//btVRkjsGlTdBfSL6kGNqLAQsx7Mucn3FyZN1Fh+QUBsGOWhZ0tJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
Message-ID-Hash: BH4PONE742YKYMRI7FIRSHRJU2ZGSOEL
X-Message-ID-Hash: BH4PONE742YKYMRI7FIRSHRJU2ZGSOEL
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BH4PONE742YKYMRI7FIRSHRJU2ZGSOEL/>
Archived-At: 
 <https://lore.freedesktop.org/d33f63a955b87669f8026f3498fa9bd509180aaf.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDIyOjQzICswMTAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IEJ5IHRoZSB3YXksIHRoZXJlIGlzIGEgdHlwbyBpbiBib3RoIHRoZSBhcmd1bWVudHMgYW5kIGVy
cm9ycyAtLSB0aGVyZQ0KPiBpcyBubyBgZGF0YWAgcGFyYW1ldGVyICh3aGljaCBJIGd1ZXNzIGNh
bWUgZnJvbSB0aGUgb3RoZXIgbWV0aG9kcykuDQoNCkFoIHllcywgdGhhbmtzLiAgVGhhdCBzaG91
bGQgYmUgJ2FsbG9jJyBub3QgJ2RhdGEnLg0KDQo+IFNpbmNlIEkgaW1hZ2luZSB5b3Ugd2lsbCBz
ZW5kIGEgbmV3IHZlcnNpb24sIHBsZWFzZSBjb25zaWRlciBhZGRpbmcgYW4NCj4gZXhhbXBsZSwg
ZXZlbiBpZiBpdCBkb2Vzbid0IHJ1biAobGlrZSB0aGUgb3RoZXJzKS4gSWYgaXQgZGlkIHJ1biwg
dGhlbg0KPiBJIHdvdWxkIHN1Z2dlc3QgZXhlcmNpc2luZyB0aGUgZXJyb3IgcGF0aHMuDQoNCk9r
LCBJIGFkZGVkIGEgcnVkaW1lbnRhcnkgZXhhbXBsZS4NCg0K
