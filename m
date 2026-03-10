Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03697FD4F2E
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 20:11:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 25A4710E2E9;
	Tue, 10 Mar 2026 20:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aFcf49Bc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0E25445023;
	Tue, 10 Mar 2026 20:00:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773172837;
 b=PwXmsWaBHWGvdFYsQoLDg1mfF3tC5+Tu+05nRCsylQZvusHQSphRrkdWXM5FOad7top9z
 t3zCZ6oFOECVce4uSvEUmVEQ5UpnBwmnh+F6KAXuOAcw4BGTdBhbjOnb2R/6MCgX1VqvgzY
 Y5IQWU+VBpRavGqrUvTfe4bwQgTU/N0KQfU12LLwhirz+RqeACTmvMWjQnxcIWXkVXP3so1
 EZ554irnzLGE+DZXfcVa9Z30o4SEUkT0Vt88kYGNi4IDqU4/dVw3Jnsi5LxXUqP8kAmqmYY
 HRIHuVtnSsCn7YsRObAXGHfduapsjWNMRuGtiPBOEWhyEXjJjNoIcaQXw2wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773172837; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
 b=RzvPeiJO65xVjciYMSSNp9OJNJ3L3tvlbmbFnVLaoNFr/vjRJnq1gPTHuFn1eugwzLqGt
 3voDDJkx91LTvbDC7fLZbfSqoDeCR3JyiGHruNUqTqD7MJyYpVdZbRkcsURGz9D28+QJSBd
 JjGMpgJhiVNNllq+HvEYr07OOE/HOhYTXTBliQWj8NqXA7/PSRoqG7nPL3NcFY7+KgsFiJd
 Y5htKe8PmTppCUI/i6/8M71nYtdNbXkHSn4jw1lzuKBi/eFSyLqyEGWIOjRiLHwUAuiw+kb
 EOOjIL0quZtcE9wcSN/l5Nc80QUhSMZgiGLUx4uYtw87MMCI6XGDSr4O5T8A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 041AD44FED
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 20:00:36 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAD3F10E2D1
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 20:11:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmHtG+z/eEdQEPedEy6rmxZhjJ/Mobpjr7TrZNdRaQuV+pmpQgnS+FpXgu0TWLOwJBOs+IUV79HF2+pwOI5JSoZKm5Ns162QPgpRzF4pMrUL0sNuTlKr9E3WbmtC6r7YlnorV5uSz4H2YBCcqvo1kDP/EX34mlcCk2O6rgJkPolMeAWpfNOlJkm80ANDBKyERxcJb64jbjYteRQSPcSDc1gXmVGF4sC66p2PqWVLS/I+QCrgtZH0+kaz1OxG1nGOeir+ChpMQxwwR6PfmwkVwV2ycBgQa0r83rLVrQ4uzJF6PeJOLA8ORcgXpTh+9kuuzJDX2rmMomaUc4NDFyjeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
 b=LhBDy9a3ZzB4dKiHxMTIqOsUHAQpup5KZA/tYN9qFC9B/PyDqTSU6DOKdIX972qXRRDpaOee2e6fFYpq7TTi1bP8022HVOIrwG3hJCrPuQ/8nCHx/lq6rcUhQY3udLBH8oA1TspQr/iqbYoZkRvcuViHNJGWzV60PtQp/gwHgvMbLh5DfPbnksG6g2TS8ikWc9NaBkJ8FoO/B/xe/0uhIbltcl9sgNVBT1bgBTqHsimmB7A1S/LKLqigC9TGOvO2UCxkm3PYB9s7C/iyrzZnnBUOEO16j6bxiOuATBOHveiO8i2QR4svtHm9A64FAIacveUXP5cTSeX7f07Oz0Gv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
 b=aFcf49Bc0eJ85CH+rWhHLTF09UaNw0oMfasM0r4sp3qYMb+7qI2DXTQtnmeqtPASeDlF89Udj212yIgU8QILys/Ba7rn7ennolEphXeVYMTjQ1nfbNn+XR0dXd7fqU9C+7ZlGIKJGJoJUrb0uwpenG9zzHdCkPw8CgMPE5afN8PJClJ7ssaHDAJiAj7s6y4Zo7LSpwxb1bJMNanrf8Xw7wEb9wn0iVgBVKx1MzvP0J4FcieH4FbIAbWipSDG7lM3BFdGMhxUFx62XhAvusXPgyJbYeooo0F+scgR+g+/Z8NP9eVNKrLDBwwU+GK+ivy6ge2vnH1U1x+iWj7eoHdF0Q==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 20:11:06 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 20:11:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Topic: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Index: AQHclV8+E+e1YkC4CUS9TNMdRwsForWm080AgAGQZICAAAElgIAAA/kA
Date: Tue, 10 Mar 2026 20:11:06 +0000
Message-ID: <8eaaaf65ce5a8525e3b4469bb8763effe37d6acf.camel@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
	 <20260203224757.871729-3-ttabi@nvidia.com>
	 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
	 <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
	 <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
In-Reply-To: <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|PH7PR12MB5593:EE_
x-ms-office365-filtering-correlation-id: dffc55a2-c1ab-4591-e157-08de7ee129cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 uypyLV5COlpoS8B2t3k73ovxynXfC6PW1rVKl8V3xZ8h2RdMhVa4gPkE/WSSFoZO3DqjpEPWl8FeyKH5oM5KYrxWNzEcjpnBG9BeHg2eYNYRoDkQ3e7k/72BQ8pepzjGp8BMdZHMU/NAGDihRzAEP+EKmvdggaC54s+lBFK7t+Ju+RTAykDbkMHfOEObHug9e/VUwFxjkf5T64yP/j4Cn5Zdo8mNvQZ1RD4l3FJn0tlwWRArQrPHWHzsFL8EM4cYO2POIH/Y0CwRdlC9UcUVRbyRdZ5X6QgBQCx1MVJhyQZcZ4JDzkPhJpRHr11CfgMT5b/FU9khMW1++RUT+jxs9gFAm3ZioAltARKWrc4laozVcPwf6ctimClx+2iXrmV0X6j0kvlYB+NaIw7KtRYxvGQQztC8uEs953eMuue2MW5vZhizvAA3LzVyvfWSxQiOKsiAmXxyslG+yP1eVSUIlW5AlHdnsvLtznfowGMDJInXyRBnXi2bBuneVz/ffNIELTNsYAKz8VFhGay6qXgasgRIeb5WFE3Nxb3DuW99B98tv/MXvr0DlC70niX2MQbeEp/qUTCT5JJfmeq+EcnfnYnI1I0QHlIZPDAiXWzFicj4IXmEuczp5hOzMNaG3iKAuVANOjxpdTDW+W9s0ZJ8ofr67DNpVNTyz+woytFlA1z7lvYRy04TedfnYnCMit7lILa7Z5M+Bfii5RaKwzWB9Ly+VgrkcoCIU2NDESKByu3IKiOL/7cI2X7J71ftH6f0jP8WxQnUaTWvFQG4WmuHJ3pm+9eLecBkCDqPQ0nshcw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXhlNUxTWGRwU2lYZlFZZXgzd0prNGlaSnZKWFZ6eGxCeW9WMzVxTUh6K1Bn?=
 =?utf-8?B?YS9zdFE2NERHVmF6ekZYS2Z2bXJJMUFZTzBXK1NCbmRlSlllV2s4VnBFajVl?=
 =?utf-8?B?V3NBOWRSc2RqZzV2MVlaaGxCOWNNVzdRZ3VCeGZvRDNTbDVjOVRtTFZ0ejBH?=
 =?utf-8?B?VlhaWVAvZlA2bzZmVzU2Y0hjbEJ2dTB3TDIwY3N4S3hEa2Z3VVlpV1ptZGtF?=
 =?utf-8?B?VVpzcm9UeFBNcFh0TzhydTRKd1htRWNydG0yYm9XdnBwVWVKV0xsSDRUT3hM?=
 =?utf-8?B?NnhHMEdGK2V6OXFkUi9mbGI2NERETTcybEswNmlWYnpDUWo2TjBGQ1lpL2Vy?=
 =?utf-8?B?T1p1bWlUbTYwak9xdmhKNk9lc3dZVmdDUC9TUk90VTBMT05VY3EzQnU0eXlY?=
 =?utf-8?B?clUrajVoUnZWTFl6c2F2RUY0WmdNRnJQaU82UWpwTkM0YkNmcWpUcys0NVlX?=
 =?utf-8?B?dmlTa3QreVBJK3NPZlFYNUhEcy9rcDhac2dmZDA3ZndQeFkvb3hzcklTWmUz?=
 =?utf-8?B?UUVrTVlJTzFCRnpyTFpWK2MyajliUWJoOVpRUmVtWnowZG54SnZxcTNlQkV3?=
 =?utf-8?B?SXJ4Zjd4YnVyVklGWGVxOVJ2emcvWmxDWHhHUnlQWm5kZjZDcGZRMU9ubGNG?=
 =?utf-8?B?eElFZU52OXhEUFhrM0NKdEwxVGhxSkxabjhGU2FWMDdPWUxjaFhvdytaRVd4?=
 =?utf-8?B?OGJRSDJlMXVWa09lanVia3p3TkJrOExwMnZHQktuSzViQS9iNWU5Y01WUjg4?=
 =?utf-8?B?VUc5R0NrSkVmRHUrR0lWWUhiV2czRktEcVNLbUNFa3ZpZDZkdkxJcnpSMG5s?=
 =?utf-8?B?UENrSWdHdjVjb09KTHRBSk15Ri9hOGpLV1RiWEtnaXM0ZzVUNjBRUmNnekdK?=
 =?utf-8?B?UFpSODJ1RW9ZaUpkbWJIUklkYXN1ZGJhbzZaZmU4dk02R1E1R2VRc0xuL0pM?=
 =?utf-8?B?cjI5WEd1Nk55M0lodzZhZlRjNEZvUlN6bWV1Nit6cFFmdm5CTERyejhXUXdz?=
 =?utf-8?B?ME12anVPcEVqa2xtdHdzandTWWJLaGhLZnh5N3ZoVEtwVXFPQ1NBWHRyOFpD?=
 =?utf-8?B?V1RuUnpsVW8yWUk0RDJTV3RsV3V6YUM0K01qdkVXWUYwVDExZ2JEaXZZUEhB?=
 =?utf-8?B?di9HaHVYWHJqUW5Ua3lNak90bEVtelo3MDlkSTNDbHZWRU9HUVE2R09MYmE3?=
 =?utf-8?B?MmNHamtNcE9KYXV2NlJlWEEydzJwNWowOVFtRmZxQTJjQkJqb201WVViNG9N?=
 =?utf-8?B?SkZDWSs1cS9DclhWMzMvbFhtOEZFbFJGM01wRXMvZ3dITlZEL3V3OXU1YlR5?=
 =?utf-8?B?UGo5bHIweTIzeHhwRDZHZDBTcnlIdjI0M0NLKzJEREwvYnVTTjU1NytpanMr?=
 =?utf-8?B?bnZVV0NuaXdSTDNuckRsaHV0UnZvYWpWSldEa0dpdTYreGxDVFhUSVZSOEFL?=
 =?utf-8?B?cFRzOG0xMlVKZm9sbG5wN2xlekM3Z21IK0NzM1ZIZnlBZ0tEcWhhVzI0MkhH?=
 =?utf-8?B?R1pnbVE1cDZJMlBZS3V4MEhVd2ZTSUFQRDMrTk9GNkZNVExJbTFPY3Z6a3VL?=
 =?utf-8?B?bVAvQ21yK2prU2FMTXpCVUlHRm5qQ3FiOXJseWY1WlQvaXkwWlQ2RjhmY1JU?=
 =?utf-8?B?YnViZkdoTitocWtPem1BYzFPamo1WElNRmNRZ3hvTnNpK1NvQXpVekUvRFl4?=
 =?utf-8?B?blIvbmphYTl1U3ZselUrYThKMHZPQ3g3MGNBTzQ0Vlp4cFljVHdRdXMrRDUw?=
 =?utf-8?B?Y2t3NXp2aDVFNTRZY2taNnVVWDMwa21yRXU1V2pOSmtlRi81QkV0Q0xQSDFy?=
 =?utf-8?B?Q0wyMHN0aE0zNURERzVmWnQzYjdDcHQ0VjRlNmdkS0diSTBrd3JDVHh1eGE5?=
 =?utf-8?B?aGx1Q2xZS2I5N1hQcXlITi9qcFVKU1JiWmM3WG4xMitjNFRablg1dWs0VjdO?=
 =?utf-8?B?YWxnbWhBRzNkMkVyV2RDWTI1b0dkYzNNRkpOMnRYUU1DWW9zMVhidWVIN0hP?=
 =?utf-8?B?QUlpQVJvdTRhRUNEanpsQmJiUUpSNFhKbFZ1VDh6d3A0RWU4QWdEeHB4MVpq?=
 =?utf-8?B?RWMrSlkzZE5WUElDWngyYVBZM3puSGowVkdOck9tL2NaSXpWMjRmWWVScERa?=
 =?utf-8?B?UU1CTVRFUThWVi9jbG5Ob3pqd2RyeFUwMllEYlI2R0FQQ3VyU0hZM1BnbzJr?=
 =?utf-8?B?VVpOUk9JN1lWT01kcmFiRlFoQUxpR1hjWFplaUNrSkhraVlESUxZaEYyS2Ix?=
 =?utf-8?B?QlluSUhJYW1Ta21UMUVqVndZeCt4UXQ0bEJSR2VIT3ozUXk4a1VCUFZDalNo?=
 =?utf-8?B?OXQwQjhkbGJoMlAydDRMdUY2VzZmeURWYkgyZHE0YUNtNDlMcGVvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7EF24DD5E9D9C41BFE807AD00088AA9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dffc55a2-c1ab-4591-e157-08de7ee129cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 20:11:06.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CFnsk0/EEp7Z9b3amjY2lS3/yTifO4KakB/UW2WwHUsA59u5/fb0wtXU53if9gTI9vsHmVn1S1Qeoy/niIRFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
Message-ID-Hash: U7PX33BQHZSVLSQ6DDZ67KVMEOQDTWRP
X-Message-ID-Hash: U7PX33BQHZSVLSQ6DDZ67KVMEOQDTWRP
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U7PX33BQHZSVLSQ6DDZ67KVMEOQDTWRP/>
Archived-At: 
 <https://lore.freedesktop.org/8eaaaf65ce5a8525e3b4469bb8763effe37d6acf.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTAzLTEwIGF0IDIwOjU2ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IA0KPiA+IFNvIEkgdHJpZWQgdGhpcyBhcHByb2FjaCwgYnV0IHRoZSBlbmQgcmVzdWx0
IHdhcyB0aGF0IHdyaXRlX3JhdygpIGFuZCB3cml0ZV9zbGljZSgpIHdlcmUNCj4gPiBwcmFjdGlj
YWxseQ0KPiA+IGlkZW50aWNhbC4NCj4gDQo+IFRoYXQgc291bmRzIHdyb25nLCB0aGUgb25seSB0
aGluZyB0aGF0IHdyaXRlX3NsaWNlKCkgbmVlZHMgdG8gZG8gaXMgdG8gZm9yd2FyZA0KPiB0byB3
cml0ZV9yYXcoKSwgdGhhdCdzIGEgb25lLWxpbmVyIGFuZCBub3QgZGlmZmVyZW50IHRvIHdoYXQg
eW91IGhhdmUgaW4geW91cg0KPiBwYXRjaCBjdXJyZW50bHk/DQoNClNvcnJ5LCBJIGd1ZXNzIEkg
d2FzIHVuY2xlYXIuICBXaGF0IEkgbWVhbnQgaXMgdGhhdCB3aGVuIHdyaXRlX3NsaWNlKCkgY2Fs
bHMgd3JpdGVfcmF3KCksIGl0IHBhc3Nlcw0KYSBwYXJhbWV0ZXIgdGhhdCB3YXMgc2ltaWxhciB0
byB3aGF0IGl0IHJlY2VpdmVkOg0KDQogICAgcHViIGZuIHdyaXRlX3NsaWNlKCZtdXQgc2VsZiwg
ZGF0YTogJlt1OF0pIC0+IFJlc3VsdCB7DQogICAgICAgIHNlbGYud3JpdGVfcmF3KGNvcmU6OnB0
cjo6ZnJvbV9yZWYoZGF0YSkpDQogICAgfQ0KDQo+IA0KPiA+IEF0IHRoaXMgcG9pbnQsIHdoeSBi
b3RoZXIgd2l0aCB3cml0ZV9yYXcoKSAtLSBqdXN0IGhhdmUgd3JpdGVfZG1hKCkgY2FsbCB3cml0
ZV9zbGljZSgpOg0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKgIGxldCBzcmNfcHRyID0gdW5zYWZl
IHsgYWxsb2Muc3RhcnRfcHRyKCkuYWRkKG9mZnNldCkgfTsNCj4gPiDCoMKgwqDCoMKgwqDCoCBs
ZXQgc2xpY2UgPSB1bnNhZmUgeyBjb3JlOjpzbGljZTo6ZnJvbV9yYXdfcGFydHMoc3JjX3B0ciwg
Y291bnQpIH07DQo+ID4gwqDCoMKgwqDCoMKgwqAgc2VsZi53cml0ZV9zbGljZShzbGljZSkNCj4g
PiANCj4gPiBJIHRoaW5rIHRoaXMgaXMgYmV0dGVyLCBidXQgSSB3YW50ZWQgdG8gZ2V0IHlvdXIg
b3BpbmlvbiBiZWZvcmUgSSBwb3N0ZWQgYSB2OCB3aXRoIHRoaXMgY2hhbmdlLg0KPiANCj4gVGhl
IHByb2JsZW0gaXMgdGhhdCBjcmVhdGluZyBhIHNsaWNlIG9mIGEgRE1BIGJ1ZmZlciwgdGhhdCBp
cyB1c2VkIGJ5IGEgZGV2aWNlDQo+IGNvbmN1cnJlbnRseSwgaXMgdW5kZWZpbmVkIGJlaGF2aW9y
LiBIZW5jZSB0aGUgaW5kaXJlY3Rpb24gdGhyb3VnaCB3cml0ZV9yYXcoKS4NCg0KT2ssIEkgaGFk
IGZvcmdvdHRlbiBhYm91dCB0aGF0LiAgSSdsbCBhZGQgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0
Lg0KDQo=
