Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC9D77898
	for <nouveau@archiver.kernel.org>; Sat, 24 Jan 2026 02:27:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 13BF310E317;
	Sat, 24 Jan 2026 02:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aBNRSrPs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CD4B640695;
	Sat, 24 Jan 2026 02:18:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769221122;
 b=h8xw8MHX5P1CBjgd3BhB91zege/3oSltQJhK0rRzJRqC8S/El3Rqu2m0IK3Rl2Qfbc5tP
 L0ba62RAk/5gXzLdgNJImFb6fdbnXWAwFG+4Sd7Dd1KK5C2TcwAf4434T5nZbR6CSAuI5fG
 NsaIlXnf6eI/11Yi/Q7WXsT/oOSpPzd5613ov5zF2liR1BR7OPHyvaP6HqKacZYlIDNGPCG
 /cloJuscFpOtdo28I7WI9WFXKr7K2NvxrDjlVvdi/5KOXEUBf4Szq/n4zHDRyCe5G0SFBBF
 hGQqGSrBQwJ7lficmz8N6AoTIuAQ580ra02kh8wyG5deVtw14/6fXMJvcYIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769221122; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b3SAPIijPuewhtEkMsmJ2/ZsQtU24blPqIZzF5yILGA=;
 b=c6qB7UglMjTW/Qth7UAzJaOW7r1sPN+P5zJ/NBAGt4+R+isvWwM1ZsRNXbCc0p0N9BgX9
 1HVD6grl6c5VvUaocNWwtNS3bBcZ9GBMwaNCXcECRVTZtMWeRGhMIH5AA0Ar6W/CD5yXcSz
 gBDoAqHhq/1IPNymWFgN2lM4lPwXedZxqkKFTKyTBsXtZ9oBpTgZC43Z3F85Ags2GoBhBcg
 WOvQSj8Gmca8JJ00pR9TC8xHbPxxLo+wgjqObRBNEmQIyjozixUq8e3LOS3jODEkUWqf22X
 d8t3snX4FOZWGBpf3Oz8IbPjNSvw+pBKENt/bWQtrq7xQw/L5arkgMr75DCA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2D5AC40490
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 02:18:40 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010001.outbound.protection.outlook.com
 [40.93.198.1])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3839510E30B
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 02:27:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHwVDIsX2IB1BeHScvoOXbVO+T0046WYlH6TtQ8J90zRgaQ8sEIBAZrwKaj7wtr6+lVa/6JHHjlMBl4pBnCkjQr/PCCL6ohR7QBzrgqbmThLfoU61ewFxESx/YL0aEB8uesJ2JjVdErPS3IvInmEZRAHuS8F/HYOtfG2BWkXbmJkxG7+xPm+zs9UHfcXsYS166wOV3pqi6gTQjjMCBUL59QHndvpc0X1tQYmwIPu53l4Su3dhb8zHnBAZShdY/Ge8grXl7tFE2lXGgLiO8LsqZ0s9kbQMAOflpFBFFeQuy07KDw2BW/kOz7f5s85jHJdCMukEA5FwlbfFxuzpTvW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3SAPIijPuewhtEkMsmJ2/ZsQtU24blPqIZzF5yILGA=;
 b=IyJctNicnWK6U2WFYEHitk2A0XBNJgecAjIEapnbsG0xUO9oujlDNmnHXSiwSWxEdti8idWluKpaPpa6dEzMBroin5QnMFxxxRIFJDRqbFd6Lmcfyo7gzEHgATEUkUB9GndAq6dfbnW8d1GkChHii+cots15HKAKxHlfrlhxxsj1gClvodLlG/lH3PPboaJDjtOlscksWrYGeEpEAyoXiT6At7iTwjLa6KiMwndXozhXDZ5bfK94q5HGLNWy50VnflNjBTzJMYws2130T3LX9olykFJRWvMXYxVnKsaXkLxA1A1FSbKuKeNKPs1PfWDLPcKGsj6WlvVAQ0qavkPLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3SAPIijPuewhtEkMsmJ2/ZsQtU24blPqIZzF5yILGA=;
 b=aBNRSrPsMt4YpYy2fuqP2721vlGA8JH/T1DvKiRjgUQLIS2pyABDCqZhEpeYlwyvQiv3iTjOylnDxghZFvx25FSs2eJI+6OOeqGGq6Tcb0h2Vtql5U55t6bB7k28wTlzpIYSJAcSqKysSzCCawdPBfJWO/z2l2EfaHzXhnKmfFG9/qpEyxSzJBym1KVxg5n2gIpKUCnLtNb9jAvomVJc1wJC4ncWNaW07gMFSp/I/oGoJfk7i7YIo3madPD/SQGi6II55G0jRQ/NGnVI02/R72vXKnP8iHRdecd0xcjI9/DDggbtyUCI1KEAhUjb3mflT2UzQh1Wh+NYa7gXB/0/4g==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Sat, 24 Jan
 2026 02:27:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 02:27:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 11:27:25 +0900
Message-Id: <DFWGQBPX4MXE.2P7S1UR4SD381@nvidia.com>
Subject: Re: [PATCH v8 00/13] gpu: nova-core: add Turing support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <DFVYPIHCN0ZC.1PFXVN4U6Y46B@kernel.org>
In-Reply-To: <DFVYPIHCN0ZC.1PFXVN4U6Y46B@kernel.org>
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab44615-2d4e-43c8-0f9e-08de5af01ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blEzb2x0bHd2cjczZlp4TU5ReUxURXJFTEw4ejJSS0RaVlQ4anJ3c1IvUkVH?=
 =?utf-8?B?Y0hZbzRyaVhqQStlOGlPUktTdXNOTUVZM2dUemU5RjRqT083MXp6Zlk2U0Na?=
 =?utf-8?B?ODBva3FTaDhhUFJ5dkt6OEg4V0Y0dHh6cm1kd0pWc0VFbERBc1NLTTZZMW1J?=
 =?utf-8?B?cGE1djY0a3JkbkdNOHI0dXI2RFZrQzRSUDFaVlRHWUdaQWhpSGN2MFFNYWpt?=
 =?utf-8?B?d3hiVWZZUU1MQ0IyV0U2bFA3UEFDRDNhSlhETndsSEJkOTAvUm04cERCdGli?=
 =?utf-8?B?d2d6OWJEcGpmSy9KT1MzLzVzdHdLUUV3Q2ZKYlFWRGRyWjRkZVpESnVmVisy?=
 =?utf-8?B?K1FNOEtzSTJKYWR2L3VsQnRrejNBeHdyUmkzQS8zaUxsOHFpLzkyQnFUZGJ5?=
 =?utf-8?B?WVlpMXQ2MmRHREQrMWlmeEZJd0hwQ3h3c01hWTFQS25IVHhOT0lEYVBUbFhq?=
 =?utf-8?B?VEw3VmNBUllOTVpBajdrRERQbnBGTFBRUlMzdVRZR2tVaHpIdGFpR3NwWHhi?=
 =?utf-8?B?TXpYdkgzY3p5c0s1dWE1R0xXZmg5MU4rUEU3WjVITkpEYnk2OGc4TXVXNXNr?=
 =?utf-8?B?S2pCdEo3cmt5RDQydndOSzFwL3Y3ZjJ3b1FJWEVrV3FibzRJQmY4dzhuR3N4?=
 =?utf-8?B?K3F6TzR0N0hkNStiaXp5RW9HN09sbGFWM0RJUlVpZHIwTkZPVk5tdzFRVHRl?=
 =?utf-8?B?d2xub0swOWlDekFlWWk0TlQxQU1FTFRiT28ybWZqbVpKd3BzYVNSU2ROTlov?=
 =?utf-8?B?eUxuT0pUMEovVzJLYXYxaDhGaGJ0cXNCV0lXZnhORW8veHZrMUtsL3pZSWw5?=
 =?utf-8?B?R2VTbE4zU0RLYUhwQVcyOUN0bEhOMEhNTVZmMFpBL215bEJSR1pQL2hlZWts?=
 =?utf-8?B?bHZweXdaZnluWjU5WTVNbHovS3NMVmw5Q3RaTjBOdnRqNW13RHVjRFpTVUFz?=
 =?utf-8?B?ZHFVVGl6Y0o1cXNibmZubGVnOUlwb2tQTURVOWhYOUllSU1wdUhabWJpUitY?=
 =?utf-8?B?RjhwaW9PdU1OSndycmJFN0l2cVE0elE1cFRDck1HZmtQWTc5QzVwcDhUY2tr?=
 =?utf-8?B?SjhlM25tWEdmaThSUlZHTFZ4VThWVkVET25wM2x4c0hJMFZVYTMzTDJ1SmZU?=
 =?utf-8?B?dklXWThlMW55OU1wdmwxUXRrODZWUEhvMFVZc0JXRlF1bDBsYnVHLzdScjFS?=
 =?utf-8?B?MnA0dVI1UVl1Smp6dXNVL2Z2a2RrT1pCa2tUUk1wbVpzNTg3YVJIZUQrNC9Z?=
 =?utf-8?B?eC85N2RZU29JeXdXNFdNOGUxQkJjTUdkSHhjUUMxNWkwWFd5SHdGaTdFN0FM?=
 =?utf-8?B?UHlHaTZrblVlSWlOQzk3WVdaRitTY2tBYUYxOU9xYXdKUHhiSXhrY21TU2lj?=
 =?utf-8?B?MmRRUWFYdEtWSUpPc3A1c2pQWVVHNXAwZkdGcmQvMU0vc1lub3dlY1VRWVRx?=
 =?utf-8?B?cmx5RS9oaUhOelFFNEJ4bUFjWmZaVkF3V0FPUTVKMCtWSzBobkdyM3NrY1FU?=
 =?utf-8?B?M01SWUpDQUZmMm5IY1l4bnAwTXAvbGE5UGVRR2VKbmJkTElGb1NHS2RrT0Fz?=
 =?utf-8?B?Rk9TcUJ6U2RLK0phS2xUaTBPRGpHb2lSTjl6UCtEUVpEcVRQNWFUendqK3VX?=
 =?utf-8?B?VWtEbkRYYm1sdHlUTi9RUnNVVGVCQ25DQlF2NVNoRXdTeFdnclQvb0pWN3ZM?=
 =?utf-8?B?czc1TjhmR0NQTWxGL2V0R2NtRldZRThZUTlQSmZHU2l5VmVEekFGYzRtQWpo?=
 =?utf-8?B?SE12eWtjVG9FSzBjN0NmT3pTNk9XdjR1ZElSR0FYd3NLTUpBZTNpUEU5a05V?=
 =?utf-8?B?V3RWckExaitWcjRraFRXdGtNKzJLQ3RITzF4cWRUWnpwT2lhY1ZWMGJlRHd4?=
 =?utf-8?B?dldyTGl2QmdmenlSRHR3SG9lZGNvNHFlcWZxeEVjNkdXM0o1QVhFdE0xd3ZV?=
 =?utf-8?B?M2ZkbG51NVROMWVmVEJvVjR2ZGwyTEh3SEtEVzFtNmwwcUpXNjVvNlc5aCts?=
 =?utf-8?B?WDZMKzcyUWNjY0wrVmNxczFyN0hjRmk5T045bU5MbHFwWEMzbFQxbnY5RVVS?=
 =?utf-8?B?NkZZeWdIRU5kRGpnK2N6WFhER1RBdVd3VTcrOEUyMGx5R01CSWhJdVZzRXBR?=
 =?utf-8?Q?KvxA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aExXQU1iVFNtZEhRNVFLQjhUTU9nMlhrdXZWTHltd0VGdEloYms0TCtwaVF4?=
 =?utf-8?B?TWFzZ1dKWmdTQXI2VjRFeU5vRVVMc2t0UkIrMG53dDNsR2NuN3BEeWRnS0Nv?=
 =?utf-8?B?RktpQW1hQTI4Z2xnUHFXWVArMG1mMTUvcy9weU55akNHM1VJVEFBalQxaUVx?=
 =?utf-8?B?UWdVK0FMbEdTKzA4cEYrWTZxVWhLZUdlYXdlZmVkRDhkaDdNeFRaazdpRmxM?=
 =?utf-8?B?NmRvMXpSWThHNGQ3M1R5RW81L3ZBeEVhY3NMYzJsalQ0T0hZUUZEQzlCdzZz?=
 =?utf-8?B?S3I1RUcxN01EeHFmOHU3bVFSQjB2aFRLZTFNVmVUZnM2Z1lJRGY3Z0lwT3Rh?=
 =?utf-8?B?KzdpanFOQkxHN3ZTVWs3ZzVEUlNrMFVHa3Jyb3VDd0U4OUFocVIyUUpLNWtI?=
 =?utf-8?B?ajBaR0NIQWI4VTRHalFrejJqWnJocCt6UVdEb1hOc3RlbzZSM056K21FNEtn?=
 =?utf-8?B?azQ2cEtzVU5rM1YyQTlyeFE3QjdsRGdwTWZzUmU4VVZnMGkxV1ZvRnloZE1K?=
 =?utf-8?B?b3dKZW1mMmVPSG9TUURVYTZwdWFFc1haWmUyV3N6aGxMY1dBUWxZOVladk0v?=
 =?utf-8?B?NEtmK2xXT0ZENndWQVk4cFZqR1VDOW9nTFVCbXQ0Q015Y084K091WGlLeTRw?=
 =?utf-8?B?TEFJb2lBUFc1T3M2Z2xscEJBWFZDSUxmQm95MFhWQUl0VERjMzZsN0k3eVYx?=
 =?utf-8?B?SFV5L2RTNFVMckVCVnNCaTNvZmx1SGh5b3dnYmlVZXIxVmg4OFJHU3QyT3Fw?=
 =?utf-8?B?YU41ZWhWa0wrYmx5a0owWHdJcUpWOWpUbThsbU9WT1g2ZTNBS210dmxDcy9o?=
 =?utf-8?B?RXp5aUNKTVVUSGo3eEhkMHByN2dWdkRQUENQZVcvOS9uQ096S0pVYk4xT2hs?=
 =?utf-8?B?eW9Pa1ZVeC9VV3lVOGszeGVKTUtGMnZGTXRDb2hQUDVkNXNKeEsxZFE3WC9H?=
 =?utf-8?B?T1psSGhkNXZvOWhueTdZWHJqNkcxR3EzbURVVVJLRUhmcGhQbENpVUpPcDMx?=
 =?utf-8?B?cnMwMXAxdUt0ODVMVmhEck56RHA5WTBzNHhwcUJKajVGTVZUdkNHZHNyM1Ev?=
 =?utf-8?B?eWYzblBNNUZnY1IzaXB0RTRYY1Q2RTVhMXoxYXc2VVZtNG54cFYrdEMxalNM?=
 =?utf-8?B?cDRVUjlySm11b0g3a3l3Q2FNUXhtK04wL2pZS0hpU2ZsWWtIQitRcXVtbjc1?=
 =?utf-8?B?RmM1bWpqOHljQ1JKWHMyZVJ2eExBSDNibjQ0c0tvdkJlR3hDaHpBTHBnSmNO?=
 =?utf-8?B?SnZhZTNUdDZUV0ZiTHp6aXg5dGk1dHJmeGV5dkdsZmxoUFF1RHNMWXdjRHAv?=
 =?utf-8?B?c2Y1R2FZZXlvajJtOHhtTlBUcXZ6UjlvdEllWUVxSDRhOG03cTFLTytkMG9O?=
 =?utf-8?B?bmhRUHJDclFLdGRydmxmUGRvd1pueWZaTE9Oa3ZUWE1RdjVqcmo2MlNyMURB?=
 =?utf-8?B?MTdsSWVnaU5oMGtTRHlrZjNFNUFNelNuRTdCQ05KOWVHUUxza01uc01WeStI?=
 =?utf-8?B?YWRPTXQrNi9LRDl5YXd3REl0dFpmZDk0OGR0Z3FiRmtPZFVxOW9xekVCalNv?=
 =?utf-8?B?azVJWWo3WU4xa0RPWnZrNFArODFHV0MyckFtWTRycklHdEdZY2JJTHhoY2oy?=
 =?utf-8?B?WjdCV2NGV08xSGNkZ2Zldkc2K0VKZzJjdFlOZjJxTXVOUVBqZUROQmRxYmdz?=
 =?utf-8?B?SlVGaUVnbWNBZTBFYTBNNjV2ZVgvbWVjQjZFczhvYVMxQmwvSm1mQjEvaURJ?=
 =?utf-8?B?OXVpR3NCQlZCczJIVlU5WDNORmsra3dSU3g1dkFqY01jRE5JRGExVlZ6UzhS?=
 =?utf-8?B?Q3Zuc0tvdnVoTWg5QVNRYzAvQVEwYVBuMk52UURSa1FXNFRJWkdyYlExaHo4?=
 =?utf-8?B?Y3JMc2pHTUVXR1ZiVUQ4c2JwZnVCZ0U2a051NDFRTFVsU20wN1dTdjh3Vm9Q?=
 =?utf-8?B?OTFua0FPVXNoOUxzSnU2eTJDV1RwcWNDUlE0M1I5ajBodTBzVnltTkVCZXJ2?=
 =?utf-8?B?Ungzem9uWHdvMExheE1lVlE0WXF6SUNRYkJxSHp1b0hZbkU1Rm5ON0UrTXFO?=
 =?utf-8?B?SEUwcWtqd2JidmlEQWh0UDBsR2U2clRjOUxxZVY5QUNORUpaeEpTY0JFZDlO?=
 =?utf-8?B?Z0ZFT2tGQmpUQVZ1TnU2NUtDMEE0bDNvbWtHRlV1MnM0dUlma3dNb1d1OW5l?=
 =?utf-8?B?Ri9hTXZhQkM4dmtQbEo2TXdMVDdHUXQ2WEFTaUNUSHduT0NaTEE2dldFd000?=
 =?utf-8?B?UzZHT2Q3RitVN0JZWFNkSmN0U0xpZ2c2MWZnL1gycUF6TVV2WkEwSjRhWG5a?=
 =?utf-8?B?RTdvbWZ3VnBIdlNjbmdSeG9kQWJmRERaRWJGZGxKM1lReWMvNzIyTTJ4TDZJ?=
 =?utf-8?Q?NE2RzOKXLBOjuya3RW0k14r4sTF/ySRN5+MnSf8wh8DVe?=
X-MS-Exchange-AntiSpam-MessageData-1: 1musa5aKoE1OTQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ab44615-2d4e-43c8-0f9e-08de5af01ed3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 02:27:29.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XTtl5lz+qgcj4Ls4XdkGKhW6KiUFIjcg0AipuT93dCNdr2xu+y0XwgwZGs6oSo/dm8h4I5DebjbIFnaPomb88w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645
Message-ID-Hash: 3RH5X4VUJXYSIMR5JZ3OPS5N6BDJS4PZ
X-Message-ID-Hash: 3RH5X4VUJXYSIMR5JZ3OPS5N6BDJS4PZ
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3RH5X4VUJXYSIMR5JZ3OPS5N6BDJS4PZ/>
Archived-At: 
 <https://lore.freedesktop.org/DFWGQBPX4MXE.2P7S1UR4SD381@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 23, 2026 at 9:20 PM JST, Danilo Krummrich wrote:
> On Thu Jan 22, 2026 at 11:28 PM CET, Timur Tabi wrote:
>> Alexandre Courbot (1):
>>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>>
>> Timur Tabi (12):
>>   gpu: nova-core: rename Imem to ImemSecure
>>   gpu: nova-core: add ImemNonSecure section infrastructure
>>   gpu: nova-core: support header parsing on Turing/GA100
>>   gpu: nova-core: add support for Turing/GA100 fwsignature
>>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>>   gpu: nova-core: move some functions into the HAL
>>   gpu: nova-core: Add basic Turing HAL
>>   gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
>>   gpu: nova-core: add Falcon HAL method load_method()
>>   gpu: nova-core: add FalconUCodeDescV2 support
>
> Up until here,
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks! Pushed to drm-rust-next after checking Ampere was still probing.
