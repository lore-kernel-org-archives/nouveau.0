Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098EFE9D827
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 00:19:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4D210E212;
	Mon,  6 Apr 2026 00:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="p9qaW1mF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2A56E4563C;
	Mon,  6 Apr 2026 00:07:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775434051;
 b=S7oDqpsUxp6TdCygvcVshryG6ietE6ODzTo/BK536/vDh90bcy43eI2BayHzGi7+3fr6D
 tj1qVUUfjXHg0q91AUBr7CEoeT80YHpWaATe7ro/RtvRh+Gch1LuQPfDegX/xFteGySepyY
 hOmjWp5nSch0bvNTGK2WAq92iAqO8mqVqaBFDVSJLkv/JX4Hl0W+0h6jn/aM1sgQyhhMz81
 /lx2LTa3FeKWG75Wg7XNX6rE4rbz9AbKPaOUaN5A0b5h1vijFgW0AWbRzUFdcX4zm90x1Ik
 PKWrpZcaDS/KZpL1Z9EcXIjf/Ni3vq0uFMaTMDKbYNsX9AH0coHB99vARmQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775434051; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0urtsX1ZsBfytQ9Rq3gciCAK0Stwhe+4c7wULc+McAo=;
 b=bsHV3wT2cpUnFjze46m1xjSnK0F6owD7fb2sac6ik5GQt3Yukfju2Gt6m0irciKCkGS+N
 TC2uIVJN/JkTNXCSw5Qb30t8VP0bbzP6TeUMeuRrJYzBLx7Hydo+tvceeHYsU4C45W3uCk8
 j3zxnjAhLyr6wYVr+YQi2qllDtcElEDdtfwxhLFau/jHs7clWBegXssoHsO8grpox5h4pqp
 EigeOyf3yExr98VCzqjLjfVzXJ98z7K3y10gYVz/kPh1N3WHtUwrHASjPFFEDncKfYip1cr
 7NQSpupzJ0GNQk5oQtQB+Y1acT//8ky45/o4c0ouGeQZY66SaKdw8+rGOS7g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A005E42D9E
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 00:07:28 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022128.outbound.protection.outlook.com [52.101.101.128])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 855F710E20D;
	Mon,  6 Apr 2026 00:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq2EMueT9kwTdGM/F/johr5P8xyJnC/KboiDLsmOP8tOZXlqcrM2LCDTULZFz7zeD/kJr3ZXAk2jShKGi7WUHn1v4Kj8bwzQfF6mvte5bKIBNswnp4rB3TpnQw94bHWYMYowIH7Z3+E5hP0mN59CrQgA/8yDdd40k7KpoVGJnlEYRNptSdcCDlfX0WblA2+GbXWWMtF8nuBj8adtlVzCUCqW9kqAYKkhvVpZAKlKbq/Eg3wBm1nZwiDjofkB4m6LD29L6wgX3f+lwxBFUwsD66jJH7q6Ilj4dp3L68LWytWbEzpeeocVHrngBdjLgxkvA/1wCx1ie6UAPsEp3nUAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0urtsX1ZsBfytQ9Rq3gciCAK0Stwhe+4c7wULc+McAo=;
 b=yxvPHZesDxn0tYZHOe5RCx3iMS6/afCmDjYjq0ldyRiRREddJ+1jkx+kh+fLKoGdjl0iFESFXNB2mWw8jBsrghHd9RyxABqPb0LVcvC+t/+nEU6S/2324JMOHt7wyRcgXlRVEaAS2DS2RICDvDUzPWsW/7K3yVzh5FCWLRvlXFBbv6eBkS9hVZQsb22mFtdsRilFhg++tQCX2eVHl6mMm6M2VsDoh72aSmkYJmoGoCcvvvWJ47gnuCzTu3yKGMmBUPEFDJSUkD/REwq/WFEbx2k3ibIUHgvVbw31+u3833awR6Oz2X/KI3aVWNrfUOtWiJ4B60lHWeUv8AIurRyFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0urtsX1ZsBfytQ9Rq3gciCAK0Stwhe+4c7wULc+McAo=;
 b=p9qaW1mFS6bV7Zi6EJyM6/kA1lrEyciTeFbeijVNX/kS6a60TSAE3A++9hBTTIUoY5SmLHIfxovvv9YW3z2SBvUm5iYkuu9VYnOfvddPNB+LjoYwYBJaTtJX6sN1Gwj9zZlvXrLsHomqG0CQsaHJGW3E/k8ZSPUT7ZG8WZsDaAI=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6050.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:18:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:18:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 01:18:56 +0100
Message-Id: <DHLN367TV9AM.DEQG8HBNZXLP@garyguo.net>
Subject: Re: [PATCH v2 07/33] rust: allow globally
 `clippy::incompatible_msrv`
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
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-8-ojeda@kernel.org>
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: a8557003-e1ce-461d-cee8-08de9372184f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QmFvDTJbgNWDqyy5dMzMW9qvmpSKVLlHd4DwsH23IeTuSQMJtl8F5GFyBGuGWKQGYEVOPFuKcJwvWCjfv0UqP6uwDxucOrc/0jbJJWDjn26FKJeFQOZTOs5ao9Fe6fNU4MPjoMzXL/m60vlWcqZ2h43K3HXZ0s706F1g9jJ9wzv9AQb2+p2DbUMy2Geag/VPT9d/8RSybCAOcyD5FXZbTle9G7hddiSGPTtz+7Pl2Fpl4ld8TNlz0jryLMiE+K9+pGBlNJ634HmDJLneVM1wSuXtZ4nyWomAHyxaNAOpPDB5Pi/4hlrI7Q7G4ARmAnvZUPRDob5THFb6WNGoIyR/wYlwiOuDxaL3b69QjU277Dg0XbayNuxNMHN/AlhvoJzukarQ1tBgNhHELn5T41jB/+LSTTnzre0KClEHdW+cI4xaU4Xuv+2W+yvY0CFhkU67kaHrSjgNv+pkWllIu6PNagTjW/YqmqqPzg2kj0l+O7Iz5Ai+ptIlkCAVuB90DuX8mw9adcUDGLwNJc5Vs8VqVbaXg7PPStyC2t908NctXWyX3bpM9KWC251Lk1p464uB7VWZ+NwYT9LmGE9KBsLjsu7Zt8tT7WNxLlayL904H9FpY9yDWbTf6eGgDEuz86uCl1rIEun96ipMCQspF/t6gOQ+wg9cUJe9WXldB6Oz8zeme/qdh0s2zb8v0eMHVYspFOWMtWqV12hkz8ci8n4u50F6u3ipYUCw8wN8u8c2nhWy8Q6tPqlxyU5VOXqEurMg3aJwFrFJ+HoihHvt117jyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STlsZm1oRGRxOThEYTdvY2NXR0R5eEJUR3ErZzhQbjRsSmtleDdUdUxaSlA4?=
 =?utf-8?B?SjFpcWNnT2orUGovUTk4UVpFbDFJaXRzTDdnZ2cyUXFUOHRlVldLSHVWV3d2?=
 =?utf-8?B?R0U4N1F1N2RqbUFYWDRJekV2WTVGcUlaNHBJR0dCdGVrdU1zVWZMbnZYWEh3?=
 =?utf-8?B?bWhHNkszd1ZOUC9ZMktDQ2FsZFZzVEtaWnZUeEhzdCthSk5NVGhyeXJkbXNr?=
 =?utf-8?B?ejdBTkplZTdxRkE5SnVDVVlTMTJUOVRTcmtERzVWSGxBamZ6WTdsRE55S0lO?=
 =?utf-8?B?aXBTbmN0UWNyWXlSVDJZZ3E5MG9qdU5vRHh5aSs1OE5SWGJ3SjVtdVJoVlJs?=
 =?utf-8?B?emVSME1uMjVnSHdhN1JxYzJsODZzbUdIL1gzY3p5aGlzK3J4OFBqWk5UUGQy?=
 =?utf-8?B?Wi80c016MjZkMWNrVWlMRFpsWHlLaU5qcEhNSTYxaWpURjdONURMaFVSYkcy?=
 =?utf-8?B?UzM5UnRySXJoL1creUgvRS9US0R0b0tjemhFK09kMWduVUkvNEJGRGhnZmVv?=
 =?utf-8?B?YjEyS2Y1N0VWMi9Ob2tseFN2bGc2eFZ3S2JyK1NuZ0QrRVBVRjRSbDJQRUhF?=
 =?utf-8?B?T2V3a0JaMkRiUVgvcVltQkZmUm5zWnJIclJiRTQ3eXowMjB0cGpZZUVTNVVY?=
 =?utf-8?B?S2w0K3dCczBNV0EzN3JoMisza25ZRVdNcE84WVdsSHNJaTR4Rjk4VTZiNFFi?=
 =?utf-8?B?NzRUMXBCejRpVHRCSEJacE9yQ1EzNkUxZGI3YWNDR0J4VnAyOENiTFZJL3VN?=
 =?utf-8?B?eC9aRThhTHZhTXlnVDFVd3ZneVUxSGNQOFlMS05LRzN6TzVkUEpzMlJrNTUy?=
 =?utf-8?B?TXVIRHNXUC80NXpJZmpDTjVQRW1sU3ZRZWhhZUNKRHlibFBQcGpKSlRZTmtM?=
 =?utf-8?B?ZmJGdXRPb1piR2sveVBPSmpRUWlabi9FcldDWGF6aURIZXZFeDlvb2lORlh4?=
 =?utf-8?B?WEhrMzRrWnlneDg2WC95VUx0OWlCZlVUZFJidmJKZkdrLzBaZnZDaVJRM2tF?=
 =?utf-8?B?bGhBYnRrV00yRTRqTG9jdVJFaEZmVGkwMGJUbU56RTFSTlZaWlM5MXZOZmhV?=
 =?utf-8?B?cVFpa0VlbVpaRXlOMStqZ0lIS2dWZnN2aDNMdUJwU3YzRWl2R3MrWS9zRDN1?=
 =?utf-8?B?dys4Mm1veHMzWkpSYkw0S1B3UnZSWFN1c0tPNGtFK29NM3JMalNMelliUlEw?=
 =?utf-8?B?R3RxWHNhdlBiR3E3WW1HamZpd0VmcjJtNkNXdnBCaXpTdlF4cEdkUGtKVGZr?=
 =?utf-8?B?T3djcFhkWU9XbVN3WGt2WUZ6RFpwOUVtQTNkakwwVlp1N1FHb2NubWxhQzMw?=
 =?utf-8?B?SnNvcFU3VzJHTkIzeDRHeUtiRmVrWWJsenh6WVVuWitsMFB0dzloTUdzZVU3?=
 =?utf-8?B?SXFFbzViWkZUaHk1OXp0L3JseU83MXRjZmhIOGwzTVcvWkJyZm1JM0hqcGxz?=
 =?utf-8?B?T1lrTmNzdGtObHRzblMrb0FBVzBCcWZRdnJHeFZjTWxjaDJZZU9aZzF2d1Np?=
 =?utf-8?B?OWJweWJ2cW5YWDgzSjRsOHlRc1RlTUFuUmtqK29lbnFKaGNPL0JVVTNNbDlU?=
 =?utf-8?B?SWpBRmdXSGRyOGZlT05hdHd4cWdtR2JOYTNUK1JRNkNic2xqbU9GWXdVVDBu?=
 =?utf-8?B?SkVjZDdSZVN6UWg4dENIbzZDenVRWmM2NmpFYmM1MHRrZ0pvM1lZVStDczFD?=
 =?utf-8?B?RHR0TEtZaG9NU3E4a1ZzRUw2V2lPYndTTkdxL3Frd1NaVDM5Y2k5d0hxSjZZ?=
 =?utf-8?B?dXBrZTNPTDl5Z3kwblh4eVRiVXM1MCs4bkxKUGhuczdYT3Zab0M5Q3NXbENL?=
 =?utf-8?B?V0NqUXpyUkZ6SjgrL2VMZ3p4c3B3UlRNQ2I4Q0pnUURkM3ZxSzg1QjRFS1RW?=
 =?utf-8?B?dEJEdUp6MDR6OFB0dlBmTnY0dFpWM0IyVjM0TitRWlI2VzJPTzI1R1ZHSE1p?=
 =?utf-8?B?c1NrbmZuSzZpTlRmc1VvTmF3NFZEZ0s1S25rbTZSQ1ZRL1o0K1lHVzNIQ1dw?=
 =?utf-8?B?N2J2NlZhWWRpbVppanpCbHNjclJYdzZYMktsL1FHZjllekg4c2hxQW5kZnB2?=
 =?utf-8?B?WFJtenRNYlNHMk05Vy9FM29OcFpJL25TdExLZ1gxeVZ0RXJNRkU5NXVhcGZn?=
 =?utf-8?B?a2JLdDg3T1dub0lFV1ZYQTNZQ1krQlo4aitaM0JPNjdTVnNZMXNOOGpGSjdU?=
 =?utf-8?B?ZER2OE04ek1hekszMlB5cnJrajZtRnJxYU9WN0dsZWNzSC84Uy9JRUEzdk9k?=
 =?utf-8?B?bTVkdGk1N09vY1BnSFJVeVdVdVV6dmhGZlVEOUIzS3pBUk5hR0gwcGRRMXFF?=
 =?utf-8?B?YXZpSHFSOFpPMy9yaTFVZ2tRSFdFTmFySHorQ1draXFxdE5WWUt3QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8557003-e1ce-461d-cee8-08de9372184f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:18:57.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 41GIEQGjwWtWlQBHCAxPPghuS8envm6U/n99NT9FYRRKZ828RDnJKemRqLn9Uk3NMtxq8agELpKLfQ3b3q3TNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6050
Message-ID-Hash: IVR2AXSNPWKHC5AKFSCPSV2L6GNWEJPU
X-Message-ID-Hash: IVR2AXSNPWKHC5AKFSCPSV2L6GNWEJPU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IVR2AXSNPWKHC5AKFSCPSV2L6GNWEJPU/>
Archived-At: 
 <https://lore.freedesktop.org/DHLN367TV9AM.DEQG8HBNZXLP@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Apr 6, 2026 at 12:52 AM BST, Miguel Ojeda wrote:
> `clippy::incompatible_msrv` is not buying us much, and we discussed
> allowing it several times in the past.
>=20
> For instance, there was recently another patch sent to `allow` it where
> needed [1]. While that particular case would not be needed after the
> minimum version bump to 1.85.0, it is simpler to just allow it to prevent
> future instances.
>=20
> Thus do so, and remove the last instance of locally allowing it we have
> in the tree (except the one in the vendored `proc_macro2` crate).
>=20
> Note that we still keep the `msrv` config option in `clippy.toml` since
> that affects other lints as well.
>=20
> Link: https://lore.kernel.org/rust-for-linux/20260404212831.78971-4-jhubb=
ard@nvidia.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Makefile               | 1 +
>  rust/macros/helpers.rs | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

