Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ABBD46C1D
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 23:58:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 999C110E1A4;
	Fri, 30 Jan 2026 23:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="hJwnEuQ8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F02BB40F4F;
	Fri, 30 Jan 2026 23:49:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769816974;
 b=SJTKYCvUW7DI88216uW7Pohv8JBG3AhtynLJxJOYW+6fmvu225JrMqjSLgf7YPuB/Solx
 /6jxDmSfNvGld8trg4vykfcrMMj9U+QAGyJe9VFzXKVhv8ndZQCJ7ynP1hrICAT4Ta4fr6N
 ifSZKR0710Q9luBHMs5KDhYuvddm81dLBHZpKOG/fUX6VR4T9y5gXwjwJkv7xlfjuYa/qBX
 EPB8h+ZZ/XzLKZwA3Qhmq2Hbv+HjcA2owOH9vTl9uW0RiqK5pjaZQ5nL/YymnrMyaIlMjHT
 wIqhXBr3WMAhAQYuUK5q4DVjxbo7DScP9Mfkd+k4Wyu2xj1mOPkDcBTkSvjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769816974; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ipsJUBZ7nY2vh7XORVt+e+F73FcuTJ6/iHJLlGhL364=;
 b=i8HgxPWXSpDu9vcn6pHfOfcaS8zg3+hgbADfsQzneoZqDJkmEgJVbS456zcdYyzRHI7gM
 hL9d6J+n6Q0NGkQuZlzoAl/aXENnw489ZF29phAe94SDr4UHM978hGIQlawgVVaV6wXoX2M
 nd2FskMeKH6lBfCS16McL3dF7+0dA7KH/XLNuyAynZ7z1+ojz84nA9sY9DT6lFhPFSauHPe
 +EcwfxxiVHvzpUO8NvSIj66upzlB9iWTjEayhrtojM2Et+40Dw/UM2VYA6BOxhJn6a/W061
 gr/KBA8vxEV3DZzMtwAGUOC2yWJyHkBIxQXGtWbCfvoRs/sLG9g/sM8jLxMQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E24BA4015A
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 23:49:31 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021073.outbound.protection.outlook.com [52.101.100.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16FFA10E079
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 23:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSE7JfzUmGjpcsLlaztJuHfk7JHnhAxrGUGXqI0nmlrHSye73zZdl2YqEHAkp6iJyMK6bVyD8jttvf+zMDIC70wO6ZgNmGLo/0zRbyC+i08NGQ8nklo43dC6m8eWLXRh87KusdoMjKCKdBuB07xwQQE3Xp0YOFCzmYzEsR8bX96Y2nbyvI3sDSifMnofryJmv8Lzng/tBlT9w1j3GgqN6qoJQZ87g0vvuXMEA6IsrC6oeBwA9LmLYh2tjctvnzjXnria9iBZaFPz4+luddoe7KRZfS94CsQJeFS5mIWdtEWmOGUjanejsHiIEvMqYkzI5LVuicC4KZiYT0pY8MLT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipsJUBZ7nY2vh7XORVt+e+F73FcuTJ6/iHJLlGhL364=;
 b=m3GssFGWV1vd91Y11m8zLZ6JqnbvKR6TTclMHGMl6SSE3NmtqX7ENOOK2ReJkEQX9H/PH5yckiUknzSwFS+Fz5atQnOYG2Dj9IEqWyYXD2+17pY1A9P2l2FYLpDfdYwl7VEiYWjKuRp8v6sjXMuGewjaWDpNUiLBVY0lnsm4yNyygBC0hTGfN5yBozFIXa9GCBm8yKV0/KUUhipcr3I/zDvGOIGTftQwP8/NSqpN1nF8AU9jV94h9ZJqI6Y5LkNHUPwvhM28Hw3rEYgBfcj0m/aJrzCRQ+53qjA9XUwoJEaj9ShPeGth+K+6Qq+mqLebpBB2KSb3XTcW+YtXOeqPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipsJUBZ7nY2vh7XORVt+e+F73FcuTJ6/iHJLlGhL364=;
 b=hJwnEuQ8/VdvV3CyxdQ8Q0kYqyg48TfSC7ZV+jxqHuSSthi4R1yOqP8LCQvkmW3MwKTz2Zhr1/3NyMYpiqXpqCQZTXNqaUQlvKWxOWwmgda8qOi7BAMRfKq83QkRxg5+nfqLPAnSMPhOoEl+C3dppZ8228RvLstpZ71ptGD5Vvg=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7527.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 23:58:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 23:58:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 23:58:35 +0000
Message-Id: <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "mmaurer@google.com"
 <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
In-Reply-To: <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
X-ClientProxiedBy: LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: d029c25a-e961-4e0d-57ba-08de605b7af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjBTdjhENmx5Ykl2MFpLNGp1WjEzMTZSakF6RTluR295b2drenBka25ZTUw0?=
 =?utf-8?B?eksvTEJ5RlM1VXNWdHBLQW1kMHQ1ZkdQLzVKMXVVdzlQNzIvZldmdFNTRlA0?=
 =?utf-8?B?VVZzYVlRV0QwcWdNQnRlRzhWV2VMTzlUdmdYM0plVnNFTWg0b0FDVWlCaTBq?=
 =?utf-8?B?L0oyVWQ5Tmw4OFprNVZoMkhkVk1IKzl1U20rTklyNytuVlFxakF5MnZXYlpH?=
 =?utf-8?B?L2RXSVNuR1BYTHZYR0JKTUl4MDZWSWp1ZkxvZzkzbkNOd0FIZjJaUS8veFJ4?=
 =?utf-8?B?VFZDMFdST1IwZi8xZlAzUllRYWFPMlRzME12TDBhTDYzWFdaZ2VZTkpYRktx?=
 =?utf-8?B?dW1iejkreCtpL1pXRDBWQ1VZSDdvcEZjZm5SMXMrdHQ2WDF1QS9mNXJ2KzBW?=
 =?utf-8?B?WFRmRGZyL1RVcTlzUWxLOHpQVmRMcmZFR1VlUC9zcksrNU1kZkRKcjFPTDN1?=
 =?utf-8?B?MW8vSVlILzI2OW0xcXpuaTg3SnczSzZzR05xMmhZSkFEUXdVeDVma0wvaDVz?=
 =?utf-8?B?UnVNUEkxN1h1ajFxeXpFdVF4TjFLbFFSL0xVU1RaWldOem8walgrVkoyN1Bj?=
 =?utf-8?B?UnQwQSthVk5zNXVBMGhkMGVuNzJYckYrTmtFa3NvZUFydTlHRE9EUTdVSlg1?=
 =?utf-8?B?MmtGSWhNbVNNM1V1NjNzQmU4VFhTa1FVMjV4czZ1UUVsaG8wR3hzOUVJY01w?=
 =?utf-8?B?Sk5tclovRXVaL0N2d3F6N2xxbE4zUDFvYVNlVUVOODIrU2lCWndYQmNrY2lQ?=
 =?utf-8?B?WkwyZ3ZGSVZXa21iVFRLZm9OMi9PajRSZUNHcXBaU2xzOWszeStrbmtqMmMy?=
 =?utf-8?B?eDlhT0tPZGZYQ0Y3TDZiejdWZ2xDSE8xcDRHdUNjRjBzaUJyWVVtYXVnRFBL?=
 =?utf-8?B?NVFWNHZyL1Z5VHZGVHIrRnoxVytNNnh4SktGeDhlTlpycEhXcHdTMWV1c01Z?=
 =?utf-8?B?ektqRFhZZmdqTUNsWlZ4djhIdlVmMDh0ZTBHVVRqNGYxUGFqVHlNN1h0cC8v?=
 =?utf-8?B?YmRLME15RStXZVk0WDdwWHhqWkhTaTRWNXlnUWY3eFJxMEo1THd3SjNENkJo?=
 =?utf-8?B?MmFJdkZVVGNHR2xRY2ZLNWhhRHJSNnUySDRocjh6T25pazB5eGo0U3hCa0th?=
 =?utf-8?B?UG5ZY1M4b1c0ZEU0aHB4aVlXQUlTZWZoRVVWbm9iam9Qd0hBUzY0TjdiMjgx?=
 =?utf-8?B?RUdxY3djU1RYTWFwRTZmbmFsN1ZaK1kxTEFzb3BydUFSUm1qd0ZycGsvUXNk?=
 =?utf-8?B?Wll2TWIrWjhjSmxHeEZiL0djVG9xUnhkdUhZbWVCZUMxOHNORFFmakNodVBz?=
 =?utf-8?B?b2ErQnFEYnZORERmTlh6bFBBLzV5T3A2UXBMZVIrSHJNWDR6WXV1WmQyZ29r?=
 =?utf-8?B?TW9yNkp2c0ZXM0NFcHNkTlptZVFqVi9PZG5BVVN4UzRrUGlrZFVzSGcwR25a?=
 =?utf-8?B?dFNldFVxSUR5ZkFvOVB6cTVuM0JTQ01sZGRyMHR6dkljWHdPeWpZTnZHcVl2?=
 =?utf-8?B?N01KY2lCSlZ3azAvVW8xcHFrRGM2Z1RjKzdwM2NySUZCL3ZLYmJBYXcyVFo4?=
 =?utf-8?B?bndGdDBPR054cWRhcnlGNDJQakF3MVBxZENkbDVVaFdzbnZMTUxXblE1cGo1?=
 =?utf-8?B?cUVpazAxMC9EZ3dBL1ppRUMzZTNjajhIbkhjSUJHREdnQTkrRUV5aFRwSjdi?=
 =?utf-8?B?bktXWjg2UVUxeFhZK0tqd2luZUU1ZmZob2k2ajRSNVlUQ1dDc1dvVmNPOVdX?=
 =?utf-8?B?c2FVZjhMbkc3a3lremFLN1JVNWRDUTZEekpMY0prd2RTaG8xNFRHTkhmYVY2?=
 =?utf-8?B?S2w4aU5sVkZwR3V3bnFwY1lkVWVZR3VOS0JCK0FhYjF4SzVXaTl4R3FLRzJN?=
 =?utf-8?B?cWl6a1dYRTQ1b0lITENyU2g4Qk52cERFL2NmeFBORFZ0OEIrMFpuUGx4R0d5?=
 =?utf-8?B?UW5FWnRZS0k1RHhVWTRubkFWbHRrMUhobjcwNWpGbCtKY3hEVnVINUtVZ3BU?=
 =?utf-8?B?aFg1TWZlSnpUb3ZQWlQyS2xyN0QrV3k5aU1oY1ZSemdDUUw1Nlk2ZGt3THF6?=
 =?utf-8?B?SW5jV3dIWlVlSzBZWlkvYkFSOFlYN3JBamh3TVBBcGl0UURLSkR2WHl1b21Y?=
 =?utf-8?B?RE5PbEJZODZLdXRBcmRlbm1nRFpJRDhZOHRISno4N3BzR2tIa01CLzJQR2U0?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnFNZGJOVzBSL0lFV2F1NitKeUtvUHVteTl2THFzdnQ2MjdLS2JJTDU4ZFFr?=
 =?utf-8?B?Q0ZtN2hsSUVzR2VTZHYwY3ZiMFpzV001S2pEc21ubWlxMFp6L3ZuWXBncktl?=
 =?utf-8?B?T0hNa2s2QWY5MDRwcnFPS3V2TVZsUHA2V2J6ZVY3Y2VQVTlLVFBiV2ZPcnZF?=
 =?utf-8?B?RWlxWnpBRzkrM3VKd1IxZ3Q4WDBYTnZlalNyajVOQlNCYlJwcy90QjhLR3Ev?=
 =?utf-8?B?WDJpQ0dWMm93cytzUEIzUGVOMnJCSkpxeEJQcERoczNrTy8xMmZHdStQdDVG?=
 =?utf-8?B?d2xYcUJIZndJMFFBOGowOVJ0dndDQUc1MDMxa1NOSUVqK2NIbTJ4OEVod0xR?=
 =?utf-8?B?MXovZWw1OGo4b2YycVphSFZ5RXRrSjFMU2NUNkNOSnlGeGJUSUlta3hFQy9R?=
 =?utf-8?B?d2FWSzlWVTIrVEFKd2VhMjBoMkJKbFVWWHlJL0ZUdkFuVkFFMnpYTnA2WWFU?=
 =?utf-8?B?ZlBKNjhKRU5lOVdVUG1ETXZHTEJrbDFVSnFMV2NkbXFVMVVET0JXV1FER0ll?=
 =?utf-8?B?MmF2ZE82TDc3cmFnMHdTMUdjcjU2cll0U1I0Mnk3dERzbVRSSTdsalFrOEpm?=
 =?utf-8?B?dTFSM1JkdThXTXhaYWtCZWJkN2IzUzY5RTRvUnFDQWtYYXkxVE9UeEROK2E0?=
 =?utf-8?B?OFY2bjEydEpoTjlucXU1aGRQZStEVWd1aFF5SVBjN3dBR3F4M3VoWElQbW9I?=
 =?utf-8?B?NUU1bUdrWXczZmxHNVk5SmVpSFlIYkF1NWxqd2JQcEVGSW9VdTJzSG0rYjhF?=
 =?utf-8?B?dkQwWWxZT21zazV5SlJrNVNKaGxhbjdlOTlEL1NtWlIrQW05dFBRWDdiZUVH?=
 =?utf-8?B?ZGpmb25NbUxTQ3pTZnRQcGw0ZTJEUmNmMW14bU1YRzF4SVBENzdvUVErUEl2?=
 =?utf-8?B?eDZ1N0tHWWJPWno4ZmRJMzNyaWttYVVScGRVT1pWVmZ2bVNjcUlVdmwwc1pt?=
 =?utf-8?B?WmUzVVB0aERjZ0FZVEpQZjE0ZXpjYXJ0U1BjeGxpOFRpQ0M3bmV0OEFJeW1C?=
 =?utf-8?B?aGUwcnY2ckoyNmx0ems2Yll2ek5pNU1BREJBU3F6dlZqMDdoQjE0cVluODF3?=
 =?utf-8?B?NHozV0wzUW5EWEJKMnZNZVJWRWF4Qkp4QU1kOE1tbVZXaFpzdE1LMDJzSFNU?=
 =?utf-8?B?NVFMelhSeW9uVEhWQTZ1TmF2Zi9TT0dRWnFWOURsbGFla1RNL2tSZzRtWEJG?=
 =?utf-8?B?OHBoNVFWMzVNZDF0NEloeHIwa0R5WlR2dHNqU3d4aFRHMDVhSGlWUVJzZ2Jq?=
 =?utf-8?B?UzZwamlqNWxUMW1wZ3ByY2drYkRZdlN1YitxNFdVb05XenZvU2ZaaFoxaHht?=
 =?utf-8?B?TGFxa0RRMFB3Qmk5N1RIR1lWb0p2NnpoQjB5WHNDVmVta3ZiSHNMSGNQR0Ix?=
 =?utf-8?B?YUF2U29QZjdOQ25Ddzk4OWlrMzFleEtjeXJrcEJOdnJ0U0hBajZwb2xBSmx4?=
 =?utf-8?B?Kzk3bkJUZUtYaU42bXg5cGRGZkgxMXlyTU9lMnRCUTk3Z0hESTl5MnVxTWpn?=
 =?utf-8?B?UW9kR0lpSEhNUHV5cHJpT0h3TERjMFdYSGxEUy9teFFUODVSak00ZDNpblV4?=
 =?utf-8?B?RjdqT01nb01xODBQKzlLQUlvL0RhdHNPc3FnWVVjNFNremdybGJkeUhLUUZp?=
 =?utf-8?B?RlQ3WXQ0U2hEZzJTWGg3NHpXRk1zMkppMjV2VVVUTkJ4Ylo0dmdPcmlrY2Vx?=
 =?utf-8?B?L0xRaEdOS29tRGVQa01tcXlJaW9vdkhuSlVuK2VOTFBxV0hMS0tyWk04cWh2?=
 =?utf-8?B?T2l6bDcvQmljSVBvM3dPdWZFRTBSbnYvNWlhTVdscWF6N1FNa3hqSWpjUjN2?=
 =?utf-8?B?dWZDQUZkM1pqMnhHWnRvWDVTYWx6aURmSUZZRklTUjhlK0hycm84TSswcWtT?=
 =?utf-8?B?anV6eEZabmdxTnNpWUhEZXlXZC9OUjl6Z2Fsc1pSbXhOK0EzSlh0NG5nWFVT?=
 =?utf-8?B?N29tZ3pEYnNDd0FlK2lqU0pxMGxaeGhTMC9uZXAxMU1IOTBCZ1Y4bWE1N0VD?=
 =?utf-8?B?YzZEeWxEZUYvelp0MHZnamNHZjNYOUI2dlRENkw5NVM1LzQwT2tudW11ak5M?=
 =?utf-8?B?b2wrK1BycXpPOVhlZzVsazV5Wm9URGx6dTlrTXJvTTd2Qm44bnM1VFIxWERy?=
 =?utf-8?B?NE5aSmJaUm80UmNGL0crWEMzMzZNaDdFeHFZdTIwczhpUjlGbnRTSld3dXlZ?=
 =?utf-8?B?bkVJZUQ0QkpabFY3WUFHa25xMXExNjZYYmJvdWdLYVFtK2lhdC9uMkR2SGY3?=
 =?utf-8?B?R0MxNUV6Z0lvNGNRdS9tcnFXRVlndUFrTzRCOVhSdlpGTkEvTjZQN3hIbkE4?=
 =?utf-8?Q?UrB+kvvUvrbhKqW2iY?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d029c25a-e961-4e0d-57ba-08de605b7af7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 23:58:35.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xIPWU9vp9E5vWve/P8OFKsZ+yUMflyI/LL+KO2sFfqBdlJnmur1034W/HflXfDRatHtgdws8ykygnFjG4DLkXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7527
Message-ID-Hash: HVZK22GREGSQQ64NEVZIAOBRDL3WIUKL
X-Message-ID-Hash: HVZK22GREGSQQ64NEVZIAOBRDL3WIUKL
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HVZK22GREGSQQ64NEVZIAOBRDL3WIUKL/>
Archived-At: 
 <https://lore.freedesktop.org/DG2BY691US2F.36NWWJ18OPTBP@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
> On Wed, 2026-01-28 at 20:28 -0600, Timur Tabi wrote:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[allow(static_mut_refs)]
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `DEBUGFS_ROOT` is =
created before driver registration and
>> cleared
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // after driver unregistratio=
n, so no probe() can race with its
>> modification.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let log_parent =3D unsafe { c=
rate::DEBUGFS_ROOT.as_ref() }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .expe=
ct("DEBUGFS_ROOT not initialized");
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_parent.scope(log_buffers,=
 dev.name(), |logs, dir| {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dir.r=
ead_binary_file(c_str!("loginit"), &logs.loginit.0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dir.r=
ead_binary_file(c_str!("logintr"), &logs.logintr.0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dir.r=
ead_binary_file(c_str!("logrm"), &logs.logrm.0);
>
> I think there might be a problem with this code that I don't know how to =
resolve.
>
> If CONFIG_NOVA_CORE_DEBUGFS=3Dn, then DEBUGFS_ROOT is None, and so the .a=
s_ref() will also be
> none, and the .expect will cause a panic.  We don't want that.
>
> If I remove the .expect(), then log_parent becomes None, but then the .sc=
ope() won't compile.
>
> I could wrap the whole thing in #[cfg(CONFIG_NOVA_CORE_DEBUGFS)], but my =
understanding is that
> the call to .scope() is necessary to ensure that LogBuffers is not droppe=
d at the end of this
> function.
>
> It seems like I'm going to need to do something like this in struct Gsp:
>
> 	#[cfg(CONFIG_NOVA_CORE_DEBUGFS)]
> 	#[pin]
> 	logs: debugfs::Scope<LogBuffers>,
>
> 	#[cfg(not(CONFIG_NOVA_CORE_DEBUGFS))]
> 	logs: LogBuffers,  // Just own them directly, no debugfs
>
> But the design of debugfs is to have it not care if debugfs is disabled.
>
> Any suggestions?

I think the rationale behind current debugfs design is that when it is disa=
bled
in its entirety, then all of the code are compiled out and you're leaved wi=
th
ZST, so code don't have to care at all and you'll still have no codegen in =
the
end.

However, when debugfs is enabled, but CONFIG_NOVA_CORE_DEBUGFS=3Dn, then us=
ing
debugfs functionalities would *not* be compiled out (so, for the `Dir::empt=
y()`
patch in the previous iteration, all of the debugging facility would still =
be
around with CONFIG_DEBUG_FS=3Dy and CONFIG_NOVA_CORE_DEBUGFS=3Dn, which is =
not
desirable).

The straightforward solution is thus sprinkle `#[cfg(CONFIG_NOVA_CORE_DEBUG=
FS)]`
everywhere where debugfs is touched, which is non-ideal.

One idea is to create types that look exactly like `Dir` but always ZST and
no-op regardless whether CONFIG_DEBUG_FS is enabled... But that feel a bit.=
.
weird. Matthew, what do you think?

Best,
Gary
