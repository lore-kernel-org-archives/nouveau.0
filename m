Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE432F428CE
	for <nouveau@archiver.kernel.org>; Wed, 15 Apr 2026 19:58:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBA8F10E751;
	Wed, 15 Apr 2026 19:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="K0Wh3t6Y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 006AD458EA;
	Wed, 15 Apr 2026 19:46:18 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776282378;
 b=G6/ktVFCQH4fvIynQmZpbuBrUiZKe90Fp0qk6IE/NQI5wtzVKG+YUrgu/5oE3TdB8X0wO
 uCDXn31SCEJHUnXjA9qIb3emzMtuNGzfuXVlPckJ643sQWRVz8NAOOgiX4xNFWWyR7yqkeC
 jpEVeH6UALPpP290i92OB22VCjZsoywx5TKBhk6yQDD7+NN4K+Xp7qks4GjN5sad+mKjFwX
 aAEwJRO77Q7pEEY2A8m5+w/QQnOfXYznYzvGJZq9P19Nz0nR7HhfB4p2p9eZclvXYIOmpbx
 fHzfcx7tknXjRCdsiNNlgVyRCPfB+Mh6F9URRoKXsQUTJXEGoX5whl29K4vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776282378; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QfX0xC8CRLMV6kMNs7SKADvkmQyLojcY4lT9nMODHNY=;
 b=hQPCGO3Rd6FuCQOTg5EhDenH3PqFGcaPyEYHypAJOzH9ofSathMYqot9ma1dzSXDu4mrk
 sE+xOGBIM+TkPe8JkNLpuMCZ7haB5w7c5No4dt4jNFEsWsFMcXePAIx61dBbIPaKizTwisz
 QOLsddO17Rla7F5IYzSUJ94bkF76nrYS5pcya8sL22dwr7QxrQ/qEiHAdP78SyqS7+ufhKs
 7My+76LyjO2jGvupRoK3Plhgp+YtWJFmKgNIAkOGMB5DdEXOY1tJagjz0GMC5MOyIExpYdC
 NgIrSEaWSWUvAPA6Z95Cf2HwYAjoxge40d8XriS9hao5xR2i4xpRoDCKoQqw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A8C54582B
	for <nouveau@lists.freedesktop.org>; Wed, 15 Apr 2026 19:46:16 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B228510E18F;
	Wed, 15 Apr 2026 19:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEOhY7dMfJygmL5G5gK3g4v96vUKa3bgabLqTAQELJjP/QnnIe0ggFiICm04Dzpa8RF9vdjpOwdPzc5gRWXgld9Csm/Ze3/FnGjFihoWqs3YV2HbZGfkMDrt8DhBgWlyAmNfAy7qgCqqi6Tr375+yBhwbqC9WMqaL44Ork6ajTAVVDTK+YmswDDlq67FlS1InXWgU38kwpy8r1+2MD54v1Jfun5Qxjlvjwd4rAj7oqFFxBeieY8H195q92rkUnBsehkGiRJC4xdYNLInVMSZydVqIhHqs2r5R7A5rJKnIOJQlqntyJ9is5XGyBV+s9gd0XIpQ8ZBA91Yl0MnP1Z9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfX0xC8CRLMV6kMNs7SKADvkmQyLojcY4lT9nMODHNY=;
 b=G6/SfxM9/sseiYGbR0HkYkrDDJWtWAeF2W60LF6NMFw48JsKP8rFAkQ/ca7x/9mZ+EBvZsQLFJ7L+o0d0pdvocGH0UNyFCQEKPp0n1aRU13x8cfpSMkds2LpzHXAZASWTypDf4mAZTc1ln38Die5/+5B9NMAcTNGeYQW+1FBJY7vrscRRAAE//QXqs6ZvghBv9C0KVNK8DHDuMyO9HSix2vxwGT8rXW8Jv/RqomUGOwwHp9S0329sq6YJkoc9eumA9MEfTkkGtZJnUIe6k7CvjFtTApKnp8dieOWawQjkvVzqyrvzLc5XJxyCEJcwe4gnvitp6wrc6C9bQ0yEjYyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfX0xC8CRLMV6kMNs7SKADvkmQyLojcY4lT9nMODHNY=;
 b=K0Wh3t6YQ9zvXeiJQxg9Y5bow6EhLIBQXCq52vE1Z0hhqRSfy6FgGRZNxgSjtMaGBM7b9S1MpAtU1y14o7QGPouF6BgBfhsqe871E4tRsB4TT+skzy13mJ1qqzfW7K3QoVpjDqGEqqMn1mJgIN3HgrXXmRKyRBRthJ/gJjLetHE=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1910.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:58:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 19:58:05 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/5] Rework index projection syntax
Date: Wed, 15 Apr 2026 20:57:11 +0100
Message-Id: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJft32kC/yWMQQ6CMBAAv0L27CalWol+xXBo66qLSUt2QSCEv
 1v0OMnMrKAkTArXagWhDyvnVKA+VBBfPj0J+V4YrLFnc6od9pI7ikPRUJc0+BmFpixvDM3F+KN
 xIToLJe+FHjz/1rf2zzqGvd1/sG1f5BNNhHwAAAA=
X-Change-ID: 20260415-projection-syntax-rework-b790a305bc52
To: Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776283085; l=1474;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=76zt5O2tjv+xHYbiGWFQ2t1XGoY03LLsBSirzFPBISY=;
 b=04LilGSVmlOYueRpNfmQnvJd8ohWKngDYs65XedbFyJv6eGeIOCoSC6MR2ksvLnlGjNPFwsmV
 S9yoCCEqQSrAr31hYe+G4lW6bgZE7/bLOFcfColAsrBXonp8EI3iGJg
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1910:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a08ced-9e90-415a-a41c-08de9b294f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sA5+SX530BhRVrrPX5ML2uFpMqaEP2T4DuKP1++w2v5K3+jSTz/ahhyohgqhk4xrmP/E7q74VjlkB4mzWwyXv/0AgJ5/Qg/kFuHhEM+SvRQuzZ4E4Hq5195W8znZfqrlfZMOgY3RqEp3kzFLWxVj1If7eFvrBtrSzNhIZrsX/s/pzDCY1ErorcwmVMpOq0RpiZ6w3HzmOKX16aP+z25AXjRDfZ4WXVyWzuMTF+Xyo5HkVDivZ2QWMXMflpIdKsFj94XuQ9acy+ePYx5fr9goa9Ldm51iNzCRGj2s0T5Q9agPNZPAP7pHzSVocdqMGLAvX6n9RaR3g+U0ep0Awyv7T0IsZLTPUxnAYKG679bmRhGUPiEl88uibPJAm9r62oa646fu87WC7YJMjZnJNbTqg2d9w2a4CvcbOz8ODWAHexsChl8/DnifRB+1J0AXMiUuPpW3wb9Yr6txPgVtukhvZdmQ7NbLkM0M8kfblRknFdY8bZYc2E5SOgoyP113hO/Ic/n6ycLlMlkLrpd/ierZLjDyxg565ib/2ITK1N0jbKVCCaSv3I5VddEOYMGeScAXOwYIUl2jf50feNWEi7FcEjcQyxuS8owzYmkvAl+oeFm/ihrzYEZVQJxvgibM+udjVZwhtEhzOj2rb3pPLBLphteb+r4oJ1uxDcN5nBbD5JWW/zgo9BR3gWb+YNEWR5N0J7Zmf5qerXWTELSPvve13fJcdW4rp7ftS5xcCTDhZvO+2409uz354s0AedExj4RjMXkspyo0nmtSGazjEFrc7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alNXYS9IcFByV2s0VGlIRll0SEthak1OQkw1elBZZVk1V29NQWU4NGMxSUww?=
 =?utf-8?B?ZXBhMGJhSzBVNll5SVBYRXNVdWhJOU5NQjJZeEliODA1N0hqTWxVcjhnc2pk?=
 =?utf-8?B?SUxWYko0L21QMXVyS1BRL0lFMmE3UHcrSFpKbW96SG1FUGJxRkdyRW9iYnVM?=
 =?utf-8?B?R0FudlpXUnkwMXAwTmZ0Qm9pYlh4N1hQYUJlY0t6bWV4NUZlSzFrN2JTNHpK?=
 =?utf-8?B?N1dBNXpOQXQ1Um0rN01YNFlpSENxRytFQnVvbTlESmxrVVBPNXM0TGlkS1hR?=
 =?utf-8?B?NlVHQmc3dExGRXpLbDBpaEJhN2wyaUdaN21FZUtLcnBhQUpHQmwrMEY0eXpO?=
 =?utf-8?B?c2Z4VVN3Wm9STXZpNFVZVm1JM21lcGVZc0VxcE01Um5KNkk3UCt5Y1VDcitM?=
 =?utf-8?B?Y2p6UEEvZWRLelNqYWZCMi9ZT3RnR29HQ0ZVbWVxaEl0cDhFOEJUc2RZdk1X?=
 =?utf-8?B?eHFQSW9KSmFsb3M3dHFCTDBWakFJMFJnOWs3RnNyeVBudVk4UjBEV2RFM29O?=
 =?utf-8?B?Y0UwVFNmN3ExUU9aZlpxOG1HT0MrSmlPdy9DdVNCakZubURtU2N4T1lFTkJs?=
 =?utf-8?B?UTJhVEVxcExxc3c4L0JpY1ZrQnpPUTlzbVpwZnN6dHQ5dzJNY1RuYjV2NWdK?=
 =?utf-8?B?aTk0YWdRTVJIN2ZWL3pEd0ZYRlRuRUp2eFpORlZ0MFdJdER5L3lUYXJzVlBO?=
 =?utf-8?B?U3BHeWRUTS9vL0xKaG5wT3Fjb2hnVThlY2xKMkcwOCtCYUorbVFwR1A1WGN3?=
 =?utf-8?B?RXBsdWJUOFp3bUJFNUFTZDdheVJscUIwbE1tcDlRcEZSSzdYeTFuT2M3YlV4?=
 =?utf-8?B?Z1FxbERsd3RQWktYUTFKMGdVb3c4ZmpVR3VKbks0cWZwZEhoLzkxcVRrVFpq?=
 =?utf-8?B?REtrRkdxeWtKUWxSQ0J0MW8vRG1pZTdTb1B1UUM3U1FPUlVBN0tnMHFiYXVX?=
 =?utf-8?B?SCtHaFU4WTFNU0tNcld1NnNSNHE4Zm83OWl1Um4rQS9YMVhNbHhkUkFDdFZz?=
 =?utf-8?B?ZFc1bjloWUlINGUrRUVwTXFYSm1lSmhIOEdtTDJhSFNkdDNGNXgrakNuUEJw?=
 =?utf-8?B?YjBDb0JuSmM3d1g3WXVSbnJtb2FPTkZ3YUhUcFMxQXdNQXJVa0h6Y2xJb1Yx?=
 =?utf-8?B?Nlpzd0VHOWlrd204N2l4U1dSWmozL3FlSXRndzBZN1k2eVNnUDNuNVFlcVA0?=
 =?utf-8?B?Z2xDd1gyUzR4M3diLzVibzU4UkhkVjZJTm1RbGpwNGlBOEhFU2pDMlVraUIv?=
 =?utf-8?B?M2VTd2VCR0g0MFRabTNaL21YV0xxTFpsSVEwM3ZhdkJHd3NueDF6YmVuaGVC?=
 =?utf-8?B?NGdZUUR0WG5WWFk0NzdhQWQwd0Ywd0JWTHpQVU05MFJaT1VMNlZRUHRGQ0h5?=
 =?utf-8?B?NFVSc0h0K3UyYlI3TUtkcVlwT1NzVGZPYThmbzk1QzVEN29vb1hCdlQxZ1Bx?=
 =?utf-8?B?Yll4bjR0M0JVeXhNV1U2VlVZbDhJWDFwRTd6SzVmR3dEMk9ScmMyQ3NpOTBR?=
 =?utf-8?B?MzUxTDdEUXpuQWdVY2FTTmhDQ3huc2x2QVlMR2xldjBpTFZFZklSVFhVcFZY?=
 =?utf-8?B?WjI2QWIyNERqVTNXTExCdXFJVU9KdDAwNVJtRU9JaVdialQxUjNZMnJOa055?=
 =?utf-8?B?amNiYzZxNkhubDlWWXNyb1ovMEZVUytrMkYvZGVxNGhVMndhM1UwYW5NRWN1?=
 =?utf-8?B?a3c5U2F6UFhaL0RKcjNiMmZCeS8vc3RTN3FQYjJrdC9hK2xCd1F2NWl6SHlY?=
 =?utf-8?B?K2VtN2hTOFJUb3BibVFtOVRWM3d4UFN6cEZ4MnVUKzc1MGxGMG92WE9leEdI?=
 =?utf-8?B?U3Y0ckJicGxMM3lHK2JYblcwKzlhbmhiVTJNSFRFcjEvUmVlRC85cXJteXkz?=
 =?utf-8?B?RW1FQzcrL3ZXa2kxbzBma1lMN2haQWdtZDJaRzZRZzFRVjAwYmJvMDNzT2wx?=
 =?utf-8?B?NkZTMmdHOU1sMTJ6VFFBYVhKcnhRa0N6TTBYbjdHMk9LNml3Z0pHS21DTE1l?=
 =?utf-8?B?TmlOL1JHZEttSTJmOFVLNjhPbEV5a1J5di9sQXhZcGtUczZuWjhQd1VVMUl3?=
 =?utf-8?B?bitFNDBtVVU3dWh4azB1TTg4VzZFTnNFeFdWNjdVZS9ITmN2eVhQTmRGTWNK?=
 =?utf-8?B?WXpneUxQNHczd0YrZFViSXlKSDRHWncwZUZBMXFCa255Sm9mclQ2WVRsYWJy?=
 =?utf-8?B?RDdlbHdXbm1PcWU2RXVvM3pnaUV6alM3R0paVnQ2MEtkZy9DL1R2cnk4cUdT?=
 =?utf-8?B?Lys3b0RSbXp6bnR3Y1NMTUpFV1BKaDdNQTBRb3dLTjFWWWhQYlNkSUgrbm42?=
 =?utf-8?B?bnlJK2g3WU5xcENveXNFSENOUndiN0YvRGFZVnRzbmNlVVZHMXI1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53a08ced-9e90-415a-a41c-08de9b294f18
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:58:05.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sOZpYyYYkk4RKki1w1K2MjPk9ykdFCwlmKHuz0CabHVpxv0UmvQSGKin6uR15MPpLXnXBfLxMr+8saF+m4p1tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1910
Message-ID-Hash: JGV7MCWAX3PDCAW63ZPZRZMIQNAQQ6K6
X-Message-ID-Hash: JGV7MCWAX3PDCAW63ZPZRZMIQNAQQ6K6
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JGV7MCWAX3PDCAW63ZPZRZMIQNAQQ6K6/>
Archived-At: 
 <https://lore.freedesktop.org/20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series reworks the index projection syntax in the pointer
projection infrastructure to be use the keyworded syntax to be more
explicit.

Doing this allows adding a new panicking variant of index projection,
just like the normal index operator. This is useful for cases where
compiler cannot prove (or cannot reliably prove) access is inbounds.

The new syntax looks like this:
- `[try: index]`: Fallible indexing (replaces `[index]?`).
- `[build: index]`: Build-time checked indexing (replaces `[index]`).
- `[panic: index]`: Runtime panicking indexing (newly added).

DMA sample driver and nova-core have been updated.

---
Alexandre Courbot (1):
      gpu: nova-core: use pointer projection for command queue code

Gary Guo (4):
      rust: ptr: add panicking index projection variant
      rust: dma: update to keyworded index projection syntax
      gpu: nova-core: convert to keyworded projection syntax
      rust: ptr: remove implicit index projection syntax

 drivers/gpu/nova-core/gsp/cmdq.rs | 108 +++++++++++++++++++++-----------------
 rust/kernel/dma.rs                |  15 +++---
 rust/kernel/ptr/projection.rs     |  90 +++++++++++++++++++++++++------
 samples/rust/rust_dma.rs          |  12 ++---
 4 files changed, 145 insertions(+), 80 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260415-projection-syntax-rework-b790a305bc52

Best regards,
--  
Gary Guo <gary@garyguo.net>

