Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E232AD2ED0A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 14:11:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26B6510EC9E;
	Wed,  1 Apr 2026 14:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="zd9VqGr0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ADD6E4543A;
	Wed,  1 Apr 2026 13:59:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775051983;
 b=eFGTEcMJOIZsjHy4GqcAIYTqC2s5Mu8jOxTZ6TuOClELn73CFAIn5BXRvSLuY3GLCYVlO
 60TIF8XjeIetQyybWbbrBLOjGJonK7cXUdjcIN5FLz9cFbvwkLLppc7tg1z4cNxklpB52O2
 tPC1p35CUOY5VrEv8jw7DftZ6BPf00g9NqU1kbQ8YgkLZThXyrNGFoY5w2cvHpvTLc142JH
 lQSj1kyV+GHpHUWzw6R3Rb1G1iweBzioqLz6cKF9x7h6tW1n+90YqrOSoV8UnnL8tmOafoa
 3+qJCgd9iDjsSbB5SFK1IfyYqpOefJ6YUSR4WsKx4k2rIPV5R/1M+vNFvC2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775051983; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FTAOait/Ei6XeI9JIrslmORBpM1kCqoz1yiKsUX9CwA=;
 b=PCmN/dXBf0U0/4ucNrJi7ViJAnvlRtyUEJEAyFTFxbL6hlnlO7L0nHMJ0zuG0H15i/uVi
 XDw+pMiJrjP5llRtvuS4qTjioWLVojrizL8A1ISqj6M76OxBVDa4k4Wqt39xWQQdDnypiYh
 0ElraEcZo2S0JkRJ6NYZBYfPqk2nlIM1Mk4QJfg7t+48PYSlkO1tE4ISAv8cay22OJ6jXxW
 tmMKTy+3cIzzJ5oJdyfua1lwCdP/GXK3f6MrQW0TX1xP4KoUzUM27PMjWaqhfRcQMQHrQhn
 oDizVAE4uDKltifIC+KPygWVirHQn7kJuka+v/0m4yF8z/0903vTubNpf1Bw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 02FA8453A8
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 13:59:41 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021089.outbound.protection.outlook.com [52.101.100.89])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8CA10EC58;
	Wed,  1 Apr 2026 14:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzLFrawO7ITAXuj81RrPgIbhl8yrRfvMgYTgdmwA4CfoVRWqD+rhoXh3d4VMV7DnY+3gpaoU8x7xSQpwjte4GSG35ENtStmGG0NZC/L462FbUO5iMYYBSw0Vu0UX3yiDnxwtheKXKy0dt295sQ4gACRpi5skxgGs5Y3ehTvfizTOxlaowpRMtfAYGxcZG4CDmLCgqbLY8DKOaQZDcnhvqHayra1p3cfW1EoQ0iydokaW+cyYMzMYgIBK6AXBzS6JCun9jdrunh9DQhgFe/QS6DYc3ZFluCgK+BmJzewtMysrIEOz9PiBYmVsJ49p37AgAm1pU+/X85wzJnuoveiWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTAOait/Ei6XeI9JIrslmORBpM1kCqoz1yiKsUX9CwA=;
 b=knE0w9iqJVJLYEfxS1LpTBxeQcoI7wTLDscajvMwb7Xw+NJIkvhJQ9QpEEMA6VUo550gnEYrezNEnuaD/8VR2/voKwX38994yPxSwQHqI0c0MQ/R5GR/hh+LuwZEQnJxrSA9zu+JeKaSfKhgqXs2RtFl3AJw5HSdnhYlwZad1aLKTmoKsibdjItQuCZucU1Yuolouk8Jea+NwyoB6vl9koqmFu8ptqcJwkMcIDyVaUI+2v8kvtd72VTu1qfC0UlOEBm5fsa/dxLasQ5+BMuSunh2XVPrj6R4oWsUA3q+nyZ1tjbqtfSLcFmeCBBV+mwlqCrFibsi0gKQ4hHod3UPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTAOait/Ei6XeI9JIrslmORBpM1kCqoz1yiKsUX9CwA=;
 b=zd9VqGr0q5lMIgS13UBxtIdSrJqMERwYyZgCI9iglAk6deb1itqWg4HRvbbTVERNkOiyM10etI8jazF/oJm86svr+zfrbUO9ukrVUDRcz6okoTn0Q1e/9topOm3aiFt0P044KWbtiyq9dn2PMvo4dwjxDNiE8Nnd166cPBSArHg=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:10:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:10:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:10:58 +0100
Message-Id: <DHHVNHVHWO9O.1NCHKQ8SDVNAF@garyguo.net>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-11-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-11-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3423:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f41b4f-3584-4030-0fae-08de8ff87fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	oUwFZpcO8JmYscJk93cfsLhQD8ZjFrOMoVhbY6FGw8fx2cfqaAIEWlYi56sY2iI3LCmIhOv7Xtq0KVXrdGxQ8JXuMrI4eBqipgEtyMgV5IpohzHh4lzCFDRo+NalkpkdlVk9IuzaCvXB6gbhUbSAAPTRt3bve9pzaZg9aePdRuOJKL5lyMRjKh+tQQz2iuuRwtRocaMYfWeeMQ7gzW1+D9H51mt79xfE8fet54cBEyTvULAXUa6AA14X9OzM9sZ9LXFklb0gsGHAMxvoYXgTJdt6i14bi9uV5Fo+HsjDWbJsSTIWWULf33HD0yhWiIT3x38QpvBDyhC31q7zVifQV46/PhoOAVtoT78hXThqbm8aM/vESq3WJtV/cORDpyqDe5QVoLzoV5LOE/Lm7P3wumU8kTARy4FFzOpMKa4CJXmtcAvEq+WXLWLlPufc1AL/+ljeofSv6UqQCjW8ahKf/LdeJ99TnsbfWLFY7FM4r6GRB/Y1QzJL7+JNud9Cth3l9GglYQYtERGKtyPp5xJ2/Fs9hPpq2+Ntir7bh7gJdTps25wAFIUSyuhC2bY6FVuy/9ad5wPLQf4Hoks2UUyQraDOICFMHdMq84vqT0caZRwJQeVLA/y9YOW2U7hk7qKK4s672FjDOEp3+Sd5nL4PkHuq6m0xgu214F2ltRTmR9tDEI4UOsuj//CN2+3O/MgL2OD6eb2Fw1AKtUlohEEK8ZU5cgavXxmwCusTrZgDj1xPg83CWVRDS0hX1P7yCR31exTLg7fvmh3NB86mn2OcDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlBXSmJQUkJQTm1vQlR6LzlhTmEvZWVkNkVLUXZsNGpDaHRFVEsyMHd6RW9Y?=
 =?utf-8?B?a3JEbG5tb3ZpUXhicXE4MGVVWmx6ZEVpdW83ZHJCNmRWdWtiV2VNSi9UTmRU?=
 =?utf-8?B?ZHNUZ1RMb0VKMmp1dkRXUDBDV3o4VnhDQmNubUtVNmJoK3g4bGZMaDdUS1U4?=
 =?utf-8?B?blhmWW9kVGp6dW12UFB0emdDUUQ5dGo4QW40cU5FKzZqa1VMUm04aDI0MVdu?=
 =?utf-8?B?TnRXSUgxQWMwTm9KWnM2NjhLV2JvR2JhR3dhaUZOeVNCYURCb2VqK3dhcXNC?=
 =?utf-8?B?MXRIVHVyRHJITXlQWGV3aHJWT3ZyMFp0dExldno3STliVGt4SXJyQnpLazFu?=
 =?utf-8?B?U1VJNEJucTBKN1hPa00zckRhWUZXK050UGViaTlqVHZSWjRCK0lmbHAzeFg2?=
 =?utf-8?B?VXM4UFRSWU8wVG50VE1OOGduUDRydFQwYVJNL0c3dWxsUkJIL2kveC9wbU10?=
 =?utf-8?B?WGhLRmZMTjRBNWN3dTllaVVDSHVhTTVad1ZpZlJESHF4MEVxWEJ0bnNBYi9S?=
 =?utf-8?B?S2FTV3B2ZXdxZXgxZjFBaUpyaGFWbGU1UTAxdzRnR2tNc0c5WUJMSDNreXRG?=
 =?utf-8?B?dWFHa3llai9GVjNvRklvWS9zREI2T2lFM0duS0cwbGVEVjFpSUprQ0o3cmk4?=
 =?utf-8?B?b0tTbWh5ejY3ak1pdmhMcytzbjJ1WGEvcmxsVjlGT3FmY2VUcW9yWERqbjV5?=
 =?utf-8?B?dmlId1k1aXB1L1dHK3BJd2ZTU1ZYekFvLzY3RE1KOE1TWHNkTGZuSk5vQUty?=
 =?utf-8?B?ekR5YnZRbWJqQ2duWlFFNjh5MXg0dUZlYUgvNVF1Y2N6T1BaajlmdVgrOVE1?=
 =?utf-8?B?N1pFeXdQSVQvbG1BcGk4dExxcTV5ZVRuOEs4TFhTSW5Kd1Zta09nWVpHcXM2?=
 =?utf-8?B?VjZQa2N2YkdwbDNXRExJMjNoUVhoZ0tJMm9saVhUQVhGa1FTK09KUmZReHpl?=
 =?utf-8?B?L3pzd0k0Q1BQYStBcnI0SmhQcnJpSytyeGZscFFhL1FUWU5QYWl3b3NOYUEy?=
 =?utf-8?B?WVRCMEhMWGpEYit3TThOLzVXVlZmc2FMR05Rd2owaCs5d05nTUhMZGlNMDh0?=
 =?utf-8?B?QTNWd2NOUHZpRFVrTGVXM0RqQ1JPdHM2ZkRtbFdnYW54SzlXVlNrVk5QRXJI?=
 =?utf-8?B?MWJjWm4vSFg3aldRVzZkemZDam9YSHNZK0JWSFJRMjh2cTcycm1LTVZIZUVD?=
 =?utf-8?B?eitkZVd3QVBsTnpJK0V1dUpWVmE5VllDQlYvdm14bFdSbjlvVWtUenJUUTNt?=
 =?utf-8?B?OTNHcXorNVlZYnFPbjBBMzY1OUh2Um1hVUF3Y2hHT3NEbzRWVFRrc2ZEU2FU?=
 =?utf-8?B?ZzZzSnJtNDJ6Zmg1OVY1YmsvaXNtengrVDJOMVVoY3VwalUyNVZua05JTkpY?=
 =?utf-8?B?M3hjSGVHYi9iUUJ0SVpKQzZvTHJ3ZWFjQk1odUdMSEV2TFlCMjhqdjk0VUQ0?=
 =?utf-8?B?NkxLSjZrVGZ6bFFnSnJTMk1KVlVvRGY0bGxHV0t6Sjl2SFhDRzBPZkZrbEgx?=
 =?utf-8?B?VFJ4NHYyUVpHUTZVNFJKUGFVNE5XbFpzdDN0a1lXbEo5VnhYTzZ3RFRYcml3?=
 =?utf-8?B?eXI0eE5zVmwvOWNqVkJmU2ljUDVxNXRvTDNKSkJJT0tIaFQ4VVdybmJ4T3Bx?=
 =?utf-8?B?c1ZqcEhRcm5TNktRdU9DTGY3bU5aNTFCVnJXd0xuZGdXRTNObGJvV243TlVx?=
 =?utf-8?B?Z2gzYmt2NTIwYkx0VFpIalI3L1VOdG52djRjb1d4TW1MbzVrak5nL1NzaVVR?=
 =?utf-8?B?aTd0WUV3UjV2T2tLOUx6QU1Ib3RGMjRVUEVlUDM1ZE1XZ2t4RHhzeDM4R25Q?=
 =?utf-8?B?Yi9JR1pveE1zUXozUS9OWTlRSTFuTXRIb2ZHcXBRVlR1UElrZEd1eERCVjJK?=
 =?utf-8?B?VmtHT01udTNncU9QaXpic2ZmK2dFUTcxeEhNOC80QmJmSlBYcUR1VURtaVU2?=
 =?utf-8?B?LzA0b0Y0czBSM0x5ZExBTzRCY1BsQUpNcVhCMmREUGRuU0VrRmYzZzd2ZE1J?=
 =?utf-8?B?RmIxN3cyUVgxYWpodmtmMzB3NUxxZEUyV2lKZTZ0UC81eTI3QSttS1lkOG1D?=
 =?utf-8?B?TUJUM1RxUTRmYS9LMlNhY3VpL2RmTGFVRXlyWTVCVnZKN2g3U2NLalRod1Ry?=
 =?utf-8?B?TXpBclBRSVVtM2drS296YmNtYWwzaHdsRU9QTGxuaVg5UmdYWGp5VEdPUkd6?=
 =?utf-8?B?NURyY3J3ZSt1ejFpcjU4YjRxdmZNSHlpYTl3WFNsMEdMSG8rZXcwQWY0anRX?=
 =?utf-8?B?eC8vdEhVVjNzaUk5NFJ2bEtFRGJ2S2cwSXc4ZTdvYnM0V3RoNFlzNkNXLzB3?=
 =?utf-8?B?dXRUSURadGg2R21vbDVwb05TN0Q0Zk5aRkVXRjdtanlvMHhWSW85UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d4f41b4f-3584-4030-0fae-08de8ff87fd5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:10:59.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wjMx10W9Vb+bESz+ezSQ5YMIm9X7Bippdaq6R6jKLekvr5BkMfovlNBVK1T5rrPl8q/bReAcgaNWYrLS2M3+JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3423
Message-ID-Hash: CP6RSWHKZDBKIH2TC5MEGFYSIMB7UCHD
X-Message-ID-Hash: CP6RSWHKZDBKIH2TC5MEGFYSIMB7UCHD
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CP6RSWHKZDBKIH2TC5MEGFYSIMB7UCHD/>
Archived-At: 
 <https://lore.freedesktop.org/DHHVNHVHWO9O.1NCHKQ8SDVNAF@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> `feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
> which is beyond our new minimum Rust version (Rust 1.85.0).
>=20
> Thus simplify the code using `split_at_*checked()`.
>=20
> Link: https://github.com/rust-lang/rust/issues/119128 [1]
> Link: https://github.com/rust-lang/rust/pull/124678 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/transmute.rs | 33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)

