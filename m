Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D996FD7F97
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 11:40:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF5A10EB11;
	Fri, 27 Feb 2026 11:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BBT+cZVp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 95A0444C9B;
	Fri, 27 Feb 2026 11:30:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772191813;
 b=G0Z5/uPNuIQVhCc3qhE7y8qrPUCzGumuWYbkmPH/a/uog6nobFowCycWWjSpSlVNB33PB
 KmntHbTk1MvhYE5Z1JjALbBNZvGkIZzxzFY3WTMcyCAi0OCXJA3HRpcBXkowj9lnZ1rD5zZ
 mFqs1wIhdckoM52sUjg2+SWMXLptRS/M4s2EimGW6cwFR354niFmyR+LOpbfQR4oMQ3wvGA
 nGPXovfzfcj8bMNky8F2KJ3p87QUVOJ7vOXBGEWrSgCAQxPdk+ELjsLYlUE/BKhEZqhn3xS
 ShrpWLlnvtRc2vgieA5f8wlqGN814EpQbw7JDxsQj7X8xC1mACebsT/fXciA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772191813; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lGjDjF/E6OpHStnUOC7LT/NKQQlpeRWLhuQ0YnJkIRs=;
 b=VZLTwDb6KQS4qa0r1LDL152bbNvU+f9O61BuxNqVxCSg6LoAxq8OIfp//4QP5lNRrmfYl
 bpAcAUd75H61krB3cTmYhHBR8QQ2tpgSsnxPHGozsRlIEXBUsj/OtFMDcP8nCel2HnSeBGQ
 ISWPDAXkfgSqRhVAsOCGyPboS30IZFihHQ/SJ4LngDl8Rp7rUXFvnGiYvq9pxHi7QIrdIEk
 uBWaJLgtB4PBUYV+TOecimou16rapBsmV/aVWbDmyFFNUmMK7LLGtFdLMePpyHbcFB7dtoe
 48+k/Uahh54wkdCWSF7zzBaRTD+bOQNWWZ5AvkKELQwp+phEQDkIVhgg9USg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6A56841C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 11:30:11 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 05CC810EB09;
	Fri, 27 Feb 2026 11:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em5HdQMptm86NnCF3rbimucHQ1gdkq1Xz/UtFlZC+l+OBKNAe8d1MY8mwF0erZwMhZd9aWw2Nlro0ugAzH0llzcYGTRxsAXHJIE1LcWvHbzVFO7QQPRqWlHaItEJiAgwKjQfEwVHcsNg83cBfoNgnTzR21VLERoFpXH5tnCTlQDs5g751JW/TngtQvYMTSWJ5sen2Wyb/DC638rTZXfU8Eel0Q1gw7FizXSfRYAu/ynM+PIQicUws7c8HfnkTszDy43JldtqOts0xH4cLJlr78Ik6O27bOUa+xqMLXmOQDN5RV/KaC1FQzsIrlPi9XMnAvNyIo8UA79UF4kH8Tv0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGjDjF/E6OpHStnUOC7LT/NKQQlpeRWLhuQ0YnJkIRs=;
 b=WFxGKaAMh+4BBSJmcS8oI5WnQYe+uBEUNNiwBhDae8ACuM3U8SqJabIUeRw4/R8yYHA7ZUYSgmBW0v+gBOtTcM+hbV/HARkWQQbVhN/GRy5I02SEaTVqqDyN4UX5vJChtYPDWTDdz6UisIl3lxDesVpD5Gv+ooFja6dp4IRtpsz8TGIo5lAqC07G7YZwFBwWYxuVJhSxnlliebFlAFBH7CWM8b7HtpU+ue2eJvd0HtAtMN8e6C9SdTv9GWSoCByn4YBeG+Y2xXc0vxOoRyPOnOc7fG/3G+DCrvihLK/1Usxc5UlQyv1A7QG0dDMfzI3XGiXalWEhUTxSCFBSL5CxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjDjF/E6OpHStnUOC7LT/NKQQlpeRWLhuQ0YnJkIRs=;
 b=BBT+cZVpvbQVMyaAMJ9hac1UtXEY/oaKjiOx89+QU9mQhb7RB/63+HPFmSngql1lOP4HL74UB13siOALN1yKfzawx9rdFL4GEr8DDGL9Ko4qg4iV1cTQ92DLPTpULPHdYfo/9zF5E7SbUigdVkIg3LQG5B1tJpNh12zMYJyuPV+QPNr9yAJjuHPMWDxuE/gHMEXzAWQFhz3OB+dNzvCtA1+hEsahaJOKeTEP0J+cMG/7vRwdluA0lKnHand7bgmZixFo765J08RnfOKyWMqbiAFT3T2E9d9GcyVv2vTlijMVH2GBk6j8Zp3zBtQhcTEu5HGEhskfgOjZOajuemno7g==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9254.namprd12.prod.outlook.com (2603:10b6:510:308::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:40:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:40:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 20:40:09 +0900
Message-Id: <DGPPS1PDUJE2.3SK95Q93G6IMZ@nvidia.com>
Subject: Re: [PATCH v3 9/9] gpu: nova-core: gsp: add tests for SplitState
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9254:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c514879-d660-4157-cce8-08de75f4f891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	vSnyMnQUxLXBoCKCyJR1WLlYHUfh++Sc5WposRudvMVDcgdGKtL1guCpxLGGu4o5I8dZGJHUdyXdq9zNng5P77YsQ8p60DzoAHrzMnNPlqvbgpJVqSDYDzXmWpsiHaEOZaxY+bjXx11dA1Tmiu4NKnN0kqtJfzV/sbYF1+UaaWm1PdLb7HM0Z0HLeM/bCjMEQMKTu8By8Z/Rwed2AjMfrh/PVSQV1VPrEJVJR+fuqOYG4M/5OZ2uZx81LGzitXVc6/YHgLpaXnhNQ2Rlq7hLo7Wg6Bpp8xmiFkv0qREWnt+4Egy7ey357EWojLkdeQ9IrINjKSvZENi1hT/aaj3tMSP6LaCvzwCbYrfmNfzU9QrejHRuBoduRRv9v0vGYaZ00OKL7FmPS1dVJPeCbUTz4WhGaCzTerIcO/qt4i40R2m5gpBbEoqM1HfgTaBsjumolsSO1J443g1Pne/SRMXRezd3Uf5BV+aKPp1VpsBjlf/GOfXl/yQLxeKt1b6Q6blkytpgbyQRVckGL6jXhuTj9HOaMAg5Tu0YNhyKEpPH6dGiJc914hbSJ0FvoOgh4if5sfx7c20Bx4cilCE+6PV7pp4RZfsdAGDUo+ptxf/jJvit1oZjTsjIIdJlzGsbPQvq3Bfgyec5pSNcnt7Pn2/KmuvozfokYr88OG8rA3Y1lMzZb+u6i/AiM+eRHWRHus/TGJjAqudZqI2ymSMTKAf/kgnL2Y8x0W3mSPBaXHIuBsM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWp0NVBrV1Z6aHZmU0ZhZG4yOFFwVS81dHlMdUdKdDR1MllRZ01vNVJ3RzlV?=
 =?utf-8?B?bGtCWjhvYnMyd1lyRG5hdGFKRy9IMXozcnpCRUR0YnFDOExlbHVDZHFTRGFp?=
 =?utf-8?B?Nk4xa3NjenJCTEhnM2twK1ZKbTV4VGNyUlk3OVhVeXhOTzBFcGVYQno1bGdS?=
 =?utf-8?B?VHhxZnJmUmlkbmtZVzkwWWErUnRFK1JaaHpwK0FpMTlTRzhVSXovdTBiaWRL?=
 =?utf-8?B?L1puUTQ2b29aZjcwaFdER1MyLzlubThUcjJodlpzZktRWlZycnlBR1VtN0hM?=
 =?utf-8?B?dk9kUlhjb3kyRGNqVWI3Uk1mSEdnRG10WHc4QUdEaWZ5N3BhOUZrZkxXUDBj?=
 =?utf-8?B?Sk5JMVgzb1RQVDVNTWZoOUdMUlVURVN6YzA5YXRlbHFlUVdLSmhvcS8yMncy?=
 =?utf-8?B?dmM2eDhhaWJPMTNMd0JEcm43b3VEL0xkUTg1Zy9pdVpRUlhLa2NvRFNFS1Fm?=
 =?utf-8?B?RG9NSitiR2R4TnlpVkZhS1pIbmcwUzRWemZSMzhKU0x3RytxckQ0cFdLT00w?=
 =?utf-8?B?Znd0RjV6cFRtT2w2UVAvR0VuM0RMNE1LWTFoQVJtdVFhbFNCVzhWU21zU25N?=
 =?utf-8?B?WHQvN0pxOWJaeTBhUzZmbFN2ZzgwdTF2YUdLSXJUaDBGN3ZiNzNlbUdSc1Yw?=
 =?utf-8?B?QW10REQ2VUR0TUd5dG9vYUFsUW1BNGVFeCtIM3NRTmxwcnJQQUJ1ZzlIbTZo?=
 =?utf-8?B?TzB1MCt4V1o1MHhCR0E2a3R2Zzk0Mi9vcnlIQjlMRnN3R1pYckhMUkVTRUV1?=
 =?utf-8?B?dXFnMzMxQzEzaDN2WEl5Zkc2dEw4U0xWeHBYRis5Q2tweHc3OS9OQWdtN3Nw?=
 =?utf-8?B?aUFwL1dwSmZqWktGRnRHb21GUVZVOU1sd1V2L2swaUJxU1E1V2xIYjJvbTI1?=
 =?utf-8?B?Mk1BWHQwQkNRck5TemxPOEJBOFFaMjF1WHRQcU00SnlrcUJ1WFNyQlRQREg2?=
 =?utf-8?B?Y1NDYWJWRXAzeXNVMmg1Z1UxL2lGRlRSRnh5bklpaEZDSUpjdjBIK21mTGs2?=
 =?utf-8?B?R3JsTk81V0FYRzRMYnZHNHN0V2J2cmtYU1ZGdnhmTFkwZ0NMMlFUbGhseklK?=
 =?utf-8?B?Vlp0dGJwMk52M1RnNmlyYXpUTHFpdFkrNm9EbDVjeHZUTWZ3SDBHSEhxSkJs?=
 =?utf-8?B?dE5mKy8wVi9CelljWmtWVG1nbXJ3alFBdjdVbEN5K2xWTkZEWkJPRTFxWkZl?=
 =?utf-8?B?YThEQk9PSlJ3anpEQmc4L3VTYXdLL012czRPUHlKaGRkMjQyUHNLaXhBTkYx?=
 =?utf-8?B?VlJLa1dnWTc3U3NsbURmeTQ1ZlM2UUIwQlR5MUZiRDBXaU9uYm1UYmcwZ3Qw?=
 =?utf-8?B?MzFBV3N5REhyaFRjVkJlZDYrVTJKS2RBaEEvbjJ5aHZZNlVMcmpUREFqR2tJ?=
 =?utf-8?B?d3hTZVRCeDg0M0RhU0Q2TXlkbXRvQjNZWUZabnBaL2xqeVZnOFNPSWVZRGFw?=
 =?utf-8?B?Ky8zK2lZWWRneHRhTHpNdlc0Zy91ZjVUQlI0UmxPUVhUZjJvTHZkU1Z5a1Bv?=
 =?utf-8?B?eUVMbkMzTG1Da1p2Q1dSRWswRHZTdVZxOGRQN0Fvc1F3YVJhUlJkdkkyekZp?=
 =?utf-8?B?RWt5aE5HRDBJRGNzOGNPank5anBtaCtyQnhhUit4SkNWU1BiSFA1UUc0V2RX?=
 =?utf-8?B?TitaaHhkb1VkalhtQ3A1STNDUmdxTHVhMkZqdzdvNHpTL29IWlNITzdhZ3Vq?=
 =?utf-8?B?QWRDR2lpQXBrSDErT2ZQcjFKeXZxSHI1MUlXRTV6cHkxejI4YkRmV1JseG96?=
 =?utf-8?B?aVlwMG1MTVFkT0FiOWg5UW1iS0kzdFVlcVQ4VGpNSlIwUzI0VTJJSFdURits?=
 =?utf-8?B?SWxuSCtXbjFid09UVm1ZaFRLOGtuRHYvZnFqblQyL3NOejkrbmJLUUZiRE5v?=
 =?utf-8?B?ZUZSSTBQMiszeTd6cEJTRGpzNXppYUdBVURCb3VNaVo5eERVUitKdHZWZEVP?=
 =?utf-8?B?WnM5Qmk0ZXRSbVEyUkpZdW9SdktZd3dSd0lQMDhZeFJ0aWQ1V25WZ3JSYW1l?=
 =?utf-8?B?T3MzYVhzNFh5RVg1YWVXQzBMUzhEbEh1M2JFd1Y3RG01SFlXdVdwSUpwU2N3?=
 =?utf-8?B?TFMwVVh2amIvUHJaTEJQWFZUZW43bHh1RGtzN3RIZHI3OU9XeE5ObDNSU0xl?=
 =?utf-8?B?dm8wMThtbnB3VWYyYXpNVnA3TWVLSjNPTlNTQWllenVkUGRQNEhsclVBWnpp?=
 =?utf-8?B?c25DR251bGRwOWt2bVR1OVBFUkU1cDVOUW51RFdoSU9PYmZ0dERYTlpPeGdq?=
 =?utf-8?B?bUtvR3lMV0JsODJvRUE1dVFyei95TmR4OTBlSFVlR1BISXVJY1JuME5EUG45?=
 =?utf-8?B?SGNDRkpIaVVxUnNNRm1xY1pPemFnZFV4Y0Y2YVZBcE0yQmU2c0ZoYzVEUHVh?=
 =?utf-8?Q?X1YTJCC9TeF/A16oH46QNTLTdzN7ZbT9W90NlTpTZ2IsW?=
X-MS-Exchange-AntiSpam-MessageData-1: FpZ+Bvh6/S5XYQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c514879-d660-4157-cce8-08de75f4f891
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:40:13.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6vC5kr9B2DGbZtQfbyODA1lZtLYGVd//xttcm1ZGg1EEzluUIAaslk8FJSBZPrWGDbCnnXvgCTs1WJogW5f+cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9254
Message-ID-Hash: KSCU5KRYKCEMFLMZZ75XHNG7DUVP2HEN
X-Message-ID-Hash: KSCU5KRYKCEMFLMZZ75XHNG7DUVP2HEN
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KSCU5KRYKCEMFLMZZ75XHNG7DUVP2HEN/>
Archived-At: 
 <https://lore.freedesktop.org/DGPPS1PDUJE2.3SK95Q93G6IMZ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 26, 2026 at 8:45 PM JST, Eliot Courtney wrote:
> Add tests for SplitState. They cover boundary conditions at the split
> points to make sure the right number of continuation records are made.
> They also check that the data concatenated is correct.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Also I'd call this patch "add tests for continuation records". That's
another reason to move the continuation record stuff to its own module,
that way these tests can be contained to it and named accordingly
instead of being mixed with potentially future command-related tests.

