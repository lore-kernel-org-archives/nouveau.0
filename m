Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DC2D6261F
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 12:52:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F210E9A2;
	Thu, 22 Jan 2026 12:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="zKbj2sME";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 991D2403C3;
	Thu, 22 Jan 2026 12:43:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769085816;
 b=R7ZiGO28Kws/8km2oP+0Shws5Iu3MJzEt1NQa0gF3D7xxQq07CK66OAAQhI4OqPYpCwiW
 B3OXn4fY7bKGTCKiSIl6qLpgpL5ssMI93Xoxcd23d9U559tnZREhdpRwakgAgNgzQlpsdr7
 sAntg4aRypyj7wUUmGs6hIZZqIKt86z7Jng7sUMenewIVmv0mCthts1LmY+FSEliID0E8GH
 lSlTzB5aLQORnwNloeo1YTulK3r1Rdk9AO12tpQ2m3JyNZwu3klTrLn9EdXjasq1UfDsLZI
 QsGkVRNrN3TWjGqiO75Q5h88pZJqyLVJsm0p7MX0YnTeZa9LoZritFBhjdUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769085816; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TH1pwiv8r7Je6CjgvXn34WnLlYDuFouUcEsioQjaYbM=;
 b=zzNw+lC/q9qiUBl3sF460mLZoY1I5fXNeNbtsiGi7rD/YPIjb9qXonAlk5O3O68p1VRWL
 dAi39Gs5JeHraplmslrwqReZh8AEDEUTtogVwrh1hBpBqIUW5+oue1XQ8AfvxacBimdb7jn
 DGWrvln8F9zUqa87aFimAtmCEBDzdmr9bxWapFlUoEp9rzFByUCbymQ4X0d/GrxDULzoEAD
 PDZ7cRQQU8/yyJZ7ZrxX8gBKJdQkI0xEWdeLZSwJdHqDjiqEub6gvBgHasuul+3OOuZWGDq
 NsPqtfQX0nqCKEPgj5PYu21YxJ5B0Gm43/vthNAac87TmgnSR3XzeR63PYfQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E63F0403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 12:43:33 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2723410E008
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 12:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q27tfdZhfzPV+XFo4ulEPOgH6caotw6mZ6D7T7xeAM20vAK4rc2gOfzrrHwyAfz47WnIVFC1qFC3P4wy+GWcA/k0xlCh49nTasCRBjua32I54qU2IkMzaavRP634W3v7bARZXPuNt3FriJ7AQvQastq+2yzo7UqIygsxZIy88Ej2r8q2lQyqrJJUxsyXt7g6X8/2x8a9j25WIUGXwmqAPaG6tDDEw9bKLYEHz7WRAD550xImPyKkb0fWddxqk4Dn1h+H8JdqEZw6w+ZzumWjKRrP2kh3NAKSCCNpRGyXndw0NHWaKQnZyzjKV8TlFxqXdoSJLbaOCsoy552zBJ9n+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH1pwiv8r7Je6CjgvXn34WnLlYDuFouUcEsioQjaYbM=;
 b=hBHBYpej3JYbNTgPJ+652ut/O8ym4kqFZkhP4v5AscWImhWFR0fhsvnivOqsDcDAE1kYCJlGF3cA8bUxaw8Uz/gMdF+mnwS7w+QhjnRA8up2ZXZAh3RqYhPSbtsVbwvxrGHy7t4wKlWRXq/fuCjUwJWn9oBVsbdKuXvjfSJ3blEA/T/HVeai3/i1di0wP3f2Eld7LwVeiIbiEUJjLK8mHrQD6k4rBcBiiKTUEU5c0mmOPt5S+jWQmFLJ4tvsRMfAy/2L9SAsagUqDmwiviWw0FXUs7h5NIZqYXlOo65YBAs1nfOwhGBdj/Bcba4IXnzMV0J8cPrzKg+5eR5mh5AB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH1pwiv8r7Je6CjgvXn34WnLlYDuFouUcEsioQjaYbM=;
 b=zKbj2sMEPHq+SZlNlRAdmlNxY4XxrlVXFjrF25ITHRcPBwkmWDodJNm8qjM6fN0961dJ/hiFNdCftg5SE+g2JY+WdZFVBBHdPaPGGSHv9qirluKPF0G2vorMlwLZISML3Prr5CmHq+KxhodKyvlyveO08zMMMBwWnFnJCde+FE8=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5738.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 12:52:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:52:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 12:52:18 +0000
Message-Id: <DFV4RO6NFXQM.LD680MTZNYSM@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
X-Mailer: aerc 0.21.0
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-3-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-3-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: d8296cf6-95b7-4fc6-d061-08de59b5137f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1FJbkxsVnpEVzFaWTVqaUlwOHZ5TmoyWmVSY0JTOHhGRXhmZVozeUhpWERB?=
 =?utf-8?B?ZVprYWN6VUlKUWRLWEpYYTBMbzFVR3d0Tmd3QWFrWnMwV0w0NjR1aVF2c21r?=
 =?utf-8?B?WG9KZjgyOUdKT0JDYkJYTmg0MUJuSjdXSzNIS2lXdktpZHVPTWsyQnpZaWxK?=
 =?utf-8?B?SkloOEZ2N0VJcE4yVVk1ek9DQitTNjJTai9WS0NjOWR2bUlVVTVpRkJPRDdj?=
 =?utf-8?B?by92WHNMZUozMkVuaW5VcDVlUDlqQnV4bWFPQ251elFDdTd3akhCamNUcTRB?=
 =?utf-8?B?UFJDaDdYR1JqTjFVT3NPWUwxZzAzUENxOTcyRy8wZWRscGRzSmRhZjNTNGdm?=
 =?utf-8?B?NnhUZXY5LzhMajNONWJUY3laUUR3a3AwRWNrUTZPRWxMcDhZVk1QaWhiZUFY?=
 =?utf-8?B?MkpSZnhxbWRkVmc2T1BsUTJ4M09EeXI2bjBnUWNsUlVJTk9iZlI4OHNFYkh3?=
 =?utf-8?B?N21hYzZQYXNhaVpVcXJKME8vdFpaMXJGUzRjRWdwcCs4RTAwRWtTeW5FcUVY?=
 =?utf-8?B?Y3hZWFM0SklZU01FWGx1OHBZTFNPUmtON0YzcDZ3WHF0UHFqRzZEZmloYzBE?=
 =?utf-8?B?cDltSnhiUlh3aEdFMXdQUm00dkJoUGw1T1NxZlp2WHQxNWpsVjNHbnc3aHZs?=
 =?utf-8?B?LzZ0QkJiaWVKVnB0d2Jna2paVTAvSFREYTA0cFU2MmJRQWQvdnJHRFpPd3NC?=
 =?utf-8?B?aEtUQ1lZNlZPcFJuQTlCRjVlOHVlaWFDYU4rL0NOWnpvdUZPVUlFQ0NBcEpm?=
 =?utf-8?B?MllQSFpYcDRySHV2T2NxVTdnMjFGNzB4Um1FNXNTMW1MMzdwL1owajlCZTF6?=
 =?utf-8?B?QU5vNVdVZVZUaW1QZUtGNXpRby9vem0ySEp1ZVMwZy8yejZFYkhpMGM0VmdH?=
 =?utf-8?B?MlgrVjJ2QUYreG5TY3FDazNQdXdSdmU0V05oU2cwNFBjUGJaL2sxc3BCd2Qz?=
 =?utf-8?B?OEVKdjMrQ1JLRWE0aHplK1lxUnQ3V3p1WlBxdytuVCtlYUhsaHZRNDZVV1ZR?=
 =?utf-8?B?c0kwcUFsNnRWWElGK0NuRWtmL3h3a1orSWNZMVlzb2FuQS9WMEhZNUlQdFpG?=
 =?utf-8?B?UmdhblRyeWZncUdhN0JteDRweFlVRkpWdmZuQnBxSXZZTlhSVzc1MWFiVldN?=
 =?utf-8?B?OThTS0pycnhvbHhHQ01kazhQRnpobGxSUm5haU5tc2c2U0RZRkVValNkaDFr?=
 =?utf-8?B?UXpqL2tySWU2VW1Pc3BsNU1tWVphTnQ4N1lzaEM0RFBoeWVUNzJEUVBkVTN4?=
 =?utf-8?B?dGtFV1BSd012VEs3Y3ZVV09UYXh3NW1qY0pVNDNObnRjUVA3TlVscWFyaG1X?=
 =?utf-8?B?OHZVaFg5UUZzQVA0VmhoWU40T1RuYSs3MkVCUUMyRGFCemEzUkFpcTdpdjBS?=
 =?utf-8?B?dUpaQzRvRzIrcitpMnBoZWVvUi9ZSlpHaTh2Um94RC9GOVJ6em9BOXo3STB5?=
 =?utf-8?B?N1Y0S1NxTWI0YUpCbkVxT0ZUK2NROHhGUUtFWU5OVS9Id0lLSXRWRzMxbVcz?=
 =?utf-8?B?d0RwSmRkcGJLTWFhNHNHd2xTYUwyalM4U2NxTHBvSXpEcldnQUZIMklwbkpL?=
 =?utf-8?B?SDVEMDk5RnJ0ZlBPQUZ4UkEzbDBiM2tCajdteVZzLyt0KzVNZEdhZSsvZGJZ?=
 =?utf-8?B?Wk9nR2hXMGM2ckRGVXpVTlFKaWxZTGMxRFUxTnNtTTh3QnZxUi9sWTBiUVJl?=
 =?utf-8?B?eVVzMjVxQzA4WitPZitzVldLMXUyMCtPY1l6YVJHSzV4d3VHVFRjdGFnWEpn?=
 =?utf-8?B?NGt0dVdKUytDc1hUcHNHd2xHejBoUHZqUnFJS2pEWjJWSlJuMlRVcHY1Q0Mx?=
 =?utf-8?B?L2xWNW5xcFhYTUhLR1hDWkFHV05zRVRPb3J2dEdJSGJGQ3RDcnVUZjZDSHhC?=
 =?utf-8?B?S2UzRkdJRi9FWmdvTFVZUHJWdGI4M1IxZ1RnZEI4RGlqQkVjSTEvU1BJamVa?=
 =?utf-8?B?VHlGQ2hhdjc5WWhJOWpPellKTGdjNFczSmtQV1B6OGhZMytnYzZwNFdqYWVE?=
 =?utf-8?B?WUpNdjJCQU1YOVJzMFkxOU13QlVKTmVFSkI4a1NScGhaQURkY2VBN0VhSXhC?=
 =?utf-8?B?NTAvQ05zZzdqN3lVNnNhQ2UyM0RxMmJnNlI5bGs0OTExMmJHMGNSbG9ZV3lO?=
 =?utf-8?Q?7pG4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlhEaUE0cTUrVzB0V0N6T0NRM1BnaHQyTDhINVIyeTdlcmRrc1p0TXV4VEtm?=
 =?utf-8?B?MXpkb2dLOU51NVg2RFUxUVo2a1EzNG0vVGI2ZUtWTUhVTUtSZmZZb21YN2gw?=
 =?utf-8?B?WmhEbkRRWk9JMmo4TlZRR2pXakJKQ3lDSkpzUE4yd2dFUTV2TzZZQ3lhOGk2?=
 =?utf-8?B?RktxZkFCWm8vWWdGNVpJS1R5ZzBqRXRBdlpyK2wxUlpMNXJBZXJrUzNTcTV5?=
 =?utf-8?B?NG5jN0orU21wRGlmT0E4dlIvKzZadlJxRUFCeEVxZ1Z5dUZpT2RCSElvT1Y0?=
 =?utf-8?B?aDlXeXpXZWpMbG0zcm9HMytOTmRvTWsyclZKajU5OXBXZkZMbStmaGZMQ29z?=
 =?utf-8?B?UC9NVlg4amc2QlJZbU56MG05LytzSnpzejYwRmJHamVuTzdXN2VsckF1VTNR?=
 =?utf-8?B?T0F5MnN4bW1KeXlJSnBQWkdWU2dlQ2VSK2EzVDQ2Q0pNbUw3TXVEdmVhUTgr?=
 =?utf-8?B?dllQVXFFdEVLZlpqYklHUU5hUm9nQzRWNnFJSDBoUUJKR25Xb3BtOXhKZjNU?=
 =?utf-8?B?RVZNSDRNT1grMUR4Q25USysyTXUwNGM5TVNWbnhFcVcyV3NleEVzQ2N3aGtY?=
 =?utf-8?B?VGJXYXRYQlAyOVRYMlJ5Qm4vWlhiN1MyU2ZzUll4TW1iMnZQeklEeXlOZVNt?=
 =?utf-8?B?dUhmb1lldUxlSXo0V2FqYlZ1T25TVzZIaDJLSDZ5NzNqa2E4WXJTaVFCL2J3?=
 =?utf-8?B?dDVKNjFoOXhZaTJNWUlweDVOY0ZxOGFZc2tBTHF5Y0p2aE1GM1ZHMythUlR2?=
 =?utf-8?B?MkQ1b3B5SWRSdlhDQUpUTTZaSTJub3VWVDFiKy9xK2pZZHN5T2dmb2JmQXFT?=
 =?utf-8?B?OTdHdG1PYm5xUFVDLzM5T3RBTTluZHBDd1hhemcybXlGVURKSkwyTzZlTFZC?=
 =?utf-8?B?T2FLWkxMeVZoV3JrWXlIRVNkTm5YdTkyL0kvOElaWXEyT1ZWdmNuNllSMVBS?=
 =?utf-8?B?RDlTb28zRTFnTWtYQnZVM1ZVZ0c0ZFBHREFsYlI1QTlhVkNvajc4MEtySG1Q?=
 =?utf-8?B?ZC84eVJtbHEzTGNEblFGUEE2RjQxSVpiNUFTaGY4Q05Dc3haL0dUZ0R5RHhm?=
 =?utf-8?B?bjVZSms2UlZyekxOY0FOdUlQZFBEY3BhbThTWTZnRzIvUllmWlR0YVRYeUlu?=
 =?utf-8?B?MHJZdktzY0RtRk82ZWR5ZmNBQkZucEVNckFXbG9aZjRFREF0cUJVczNyUTJ2?=
 =?utf-8?B?TGJubnRNeHlkOVNQcndVa1ZvQjdhTkFtQmdlRFY4VlR4L3pxUjArTW5WWC92?=
 =?utf-8?B?a3BUQ1RYenYyLzRHeHo4cWJLNHhJdThJNk5MQVh5VjBQeCs0S21KZlFMWlp4?=
 =?utf-8?B?MTBzalFhNWg0a2hJanVmQmFNVVZlZzVnNmJNeHpROUtCSTl6bUJudC9rUnBj?=
 =?utf-8?B?WXJ2KzA0amZoZ1Jra1JXYWVSR2ErU2lLclhDTTIxaG8wU21oV2E0Wk1ZVjJJ?=
 =?utf-8?B?TVF3ZGRTbjFtczM4YnNRNnorNk1GUlBxdzdPSnUvTkpvZFh1Q1k5VFBEOXN2?=
 =?utf-8?B?KzNjb2NGMVErb2dwU0ZEcHpEQUMvMVBhalJNaUFETThBTndnVXYxWkJLQXZz?=
 =?utf-8?B?NjNKQ0tqaWRWLzkrbEFDMTdLQWN5eUI5K3p6YmtTaUg5R3lnbFRMSXY2Qy9G?=
 =?utf-8?B?NlhGNlUxV3FnT1ZDMWNxaW96ZmNQT1pBYjcyUEJ1YURrT0Q5YzZubXpQN05K?=
 =?utf-8?B?ZmVqYWdNWHNqK3plclJnVmtjSUV0bjF6Vkd3ZHpZYlAzc3c3bUVaSnpXeXhw?=
 =?utf-8?B?OFVhbTNIQWtZcWFpL1ZVbnJXSkVKQkZhS0pmVHJQMGVxaVNQdVE5dElQaE9K?=
 =?utf-8?B?cGlWNVQxT2JydDFiQ1FoOFBTTHhMNGhTQmQ1T3V0Mm02UVRNUTRhTUxkekt0?=
 =?utf-8?B?dHNrcWczaDlGaGhjV1BXRGMxR1BSb0piMzd2R1huOTFseHpTZ0x1U056WTdk?=
 =?utf-8?B?Y3BkM2lRTCtEZG1rc0hCZG9nbFAxZGdLMmV1STE0VmE4d1NXWjZxM3dCdlIv?=
 =?utf-8?B?RXZkSGRjOUVheUFIdUZIQkczMTU0c2lTenIxY05hS2NIWkFPblowUDJjeUdE?=
 =?utf-8?B?L3YrL0NEeUlDM3VtVldNK3lKS1JDbFpkbWUzZHNCWnpubXFVMkJKSDc5eDEw?=
 =?utf-8?B?VU9JaHpZejJwNmI3aTQya3N0UWxkN1BkSUdsMFM5L1k0UlBXNVhQSll3Z0hW?=
 =?utf-8?B?dS9oQUJqanhkTHAwbWVqa1Y2ZytZY2FYeVNBUWRGK2d4LzNac1lwUGxsU1gr?=
 =?utf-8?B?UkdVOCtTa0sva3dZc2lQYi9XcFVJdktDaiswTzhxYnlmVDVvRHhTNlZCR2lW?=
 =?utf-8?B?WWZaU2hHN2VXSWZXMzkyUFN6MDRBa01kenRHTVcyQ3doNFUySEdNZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8296cf6-95b7-4fc6-d061-08de59b5137f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:52:18.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4l3xCcI1BDwMbkYcG4+ru/rq6IWCwdmGMIi06o9Kth8I/iw7512dtzAuBnnUYGzaick/C+EUBBu+jLi2xGHgsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5738
Message-ID-Hash: VPKTQX2ENQN4I6V6O56TAB4EVF5ZMBDP
X-Message-ID-Hash: VPKTQX2ENQN4I6V6O56TAB4EVF5ZMBDP
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VPKTQX2ENQN4I6V6O56TAB4EVF5ZMBDP/>
Archived-At: 
 <https://lore.freedesktop.org/DFV4RO6NFXQM.LD680MTZNYSM@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 7:29 PM GMT, Timur Tabi wrote:
> The GSP booter firmware in Turing and GA100 includes a third memory
> section called ImemNonSecure, which is non-secure IMEM.  This section
> must be loaded separately from DMEM and secure IMEM, but only if it
> actually exists.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
>  drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>  drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 310d4e75bad3..60713fecffc9 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -242,6 +242,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>  pub(crate) enum FalconMem {
>      /// Secure Instruction Memory.
>      ImemSecure,
> +    /// Non-Secure Instruction Memory.
> +    ImemNonSecure,
>      /// Data Memory.
>      Dmem,
>  }
> @@ -351,6 +353,10 @@ pub(crate) trait FalconLoadParams {
>      /// Returns the load parameters for Secure `IMEM`.
>      fn imem_sec_load_params(&self) -> FalconLoadTarget;
> =20
> +    /// Returns the load parameters for Non-Secure `IMEM`,
> +    /// used only on Turing and GA100.
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
> +
>      /// Returns the load parameters for `DMEM`.
>      fn dmem_load_params(&self) -> FalconLoadTarget;
> =20
> @@ -460,7 +466,9 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>          //
>          // For DMEM we can fold the start offset into the DMA handle.
>          let (src_start, dma_start) =3D match target_mem {
> -            FalconMem::ImemSecure =3D> (load_offsets.src_start, fw.dma_h=
andle()),
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> {
> +                (load_offsets.src_start, fw.dma_handle())
> +            }
>              FalconMem::Dmem =3D> (
>                  0,
>                  fw.dma_handle_with_offset(load_offsets.src_start.into_sa=
fe_cast())?,
> @@ -517,7 +525,7 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
> =20
>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem =3D=3D FalconMem::ImemSecure)
> +            .set_imem(target_mem !=3D FalconMem::Dmem)
>              .set_sec(if sec { 1 } else { 0 });
> =20
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
> @@ -546,6 +554,12 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
> =20
>      /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare t=
he falcon to run it.
>      pub(crate) fn dma_load<F: FalconFirmware<Target =3D E>>(&self, bar: =
&Bar0, fw: &F) -> Result {
> +        // The Non-Secure section only exists on firmware used by Turing=
 and GA100, and
> +        // those platforms do not use DMA.
> +        if fw.imem_ns_load_params().is_some() {
> +            return Err(EINVAL);
> +        }

This error path should never be exercised would it?

dma_load should never be called in the first place but pio_load should be c=
alled
instead when the platform does not support DMA?

Best,
Gary

> +
>          self.dma_reset(bar);
>          regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
>              v.set_target(FalconFbifTarget::CoherentSysmem)
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index 096cd01dbc9d..1b98bb47424c 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for Booter=
Signature<'a> {}
>  pub(crate) struct BooterFirmware {
>      // Load parameters for Secure `IMEM` falcon memory.
>      imem_sec_load_target: FalconLoadTarget,
> +    // Load parameters for Non-Secure `IMEM` falcon memory,
> +    // used only on Turing and GA100
> +    imem_ns_load_target: Option<FalconLoadTarget>,
>      // Load parameters for `DMEM` falcon memory.
>      dmem_load_target: FalconLoadTarget,
>      // BROM falcon parameters.
> @@ -359,6 +362,8 @@ pub(crate) fn new(
>                  dst_start: 0,
>                  len: app0.len,
>              },
> +            // Exists only in the booter image for Turing and GA100
> +            imem_ns_load_target: None,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          self.imem_sec_load_target.clone()
>      }
> =20
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        self.imem_ns_load_target.clone()
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          self.dmem_load_target.clone()
>      }
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index 6a2f5a0d4b15..e4009faba6c5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          }
>      }
> =20
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        // Only used on Turing and GA100, so return None for now
> +        None
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          FalconLoadTarget {
>              src_start: self.desc.imem_load_size,

