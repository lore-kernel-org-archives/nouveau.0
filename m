Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21932EA7959
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 03:01:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 171CE10E79F;
	Thu,  5 Feb 2026 03:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ktV1PVZY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B1BE41B4A;
	Thu,  5 Feb 2026 02:52:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770259932;
 b=JeYIreuL2pK4KgX4ooYWQ7Exf36F4a8BK73pj0fhY1N0twDfuYp7Vc+IbRzWJwJ14cpqo
 6arsA++kkXtTacdhpGFVvTX7/aBHGmqbRewFTwliA90+eGekqj//T/2oxHTWGW0fJgHXjwg
 re0S7mj9WV8MceL/esbs0kQgeGW5/YUfH3Kztm1JM0zwxc6F7FLoL20BkuUR71maLD9dGvF
 sMLEmw7Dd2lBXI6hZTKQJSeplJal5M9fAHdOVlXxDJmknKk7f39iK0vsBLsIDRLgDSMNFQZ
 heZmKKFmi6wix5JZxkU7zwY5dsNvIrCMgJtKOvKk302e7NzPe03Juw8S8BVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770259932; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SuzYSH0j6Y5cX1Vn4BUqgssFJ0VpbT5le9pzqs7SOXQ=;
 b=ZHKn2tlQnCX2mItMDCE3kTE4kDuYLyaDTUWpa1ZZWU0pipHuqW3Q2FUleak8xghlzXr00
 IFIS3P6RmPX2+XXJdTSQywJEAy3z4vBtIo4NWEj9KILBi6+yn7T48Tix4gZGPT7WYjUhbY1
 P6UIySKAwuVN0hMSrEbfUziGEx++ksB7jMffijSKwJzacKQtSz2bmgHeBndxYHwWt/t1KqI
 pcESL8HcQk9fAXqoWOj9cxFEnSNUSrkXU4HOyJYzDF9rk4YcblUXz8eDzFgxRRgb4jOUdVx
 CGfHO4gWWplQedqtD5y1yAFTUheGkJLhzwRTAallpYJRYOFiDq/YHMRBIYsQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 583A540382
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 02:52:10 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB510E79A;
	Thu,  5 Feb 2026 03:01:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUfoZ64v6ekzmYfbCWVD8mZAorPL0HU+cDSDtdhCdtW/9K5yN6OXWzNH8DwLvyGfeJca4UNRpEyD3QjNl4VTtG40u3+Y5uBvKCmy2FSKqkY9PSEtfo5nqzLN1p4CzJbbVUpLFOuDqXDCmjkP49SnMki7P8E5Z9eM2h/V2vhhh/8rSCQa4ppE6cZeNPBzPvRe7FnePpFefUydnUMlfJhuPG5v4nFmDCre/PmX8DeQUgDp5SoUHzskURbItc6nCYX+JBtBLriWL3X+oxz5sPYyjn05HJmt8UKD42zGhmzPT6ry1qF5edl1DQ1Q39rYdnlJVDKjqCIYJ2GZgszsT6dbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuzYSH0j6Y5cX1Vn4BUqgssFJ0VpbT5le9pzqs7SOXQ=;
 b=X6WW6/KwX+0P7sQj9hQhGz86u0UsSw317GeSfBemx5I8Lb0KxkFidAGgVdDL0s12Yc2VM/Y2Tu+SWhz5Ay9tlEn810FIoI3AYDG/sSwc/wx62wWuhMkpUIAnGnZ/8h5FoeivFK4a9p1N45OGZFKbWb2YBiDm4HGW5h+RZbIqxG8WQ75TKCcXLfUpb6+nLVxPBLQwGRodaHaiR4sLOzw8eNwunyDDbOQDfRUj0bIi8xj4gkd2CVuXc6zGLn99rKlmeQnIBPAzMMRY4PptGNdTaYMXY2xGav70wQHCHZ1qfh5ne418nAp2UW7xWO8GknBRmVY+q7uRnPMQZI9omLPiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuzYSH0j6Y5cX1Vn4BUqgssFJ0VpbT5le9pzqs7SOXQ=;
 b=ktV1PVZYLIbZnbrScwCQMkQnC4nZrSIY+zfTFYgVdSI2gbEDRmHOpzvFPHzVPfAYqJbk5CiU9hIwfxHcC+B/wvvPe8CW3KHhcEcYjLma9ZhMM4GT+SptghjsLj94j0M5+F5bz/dSz0GvXlIwzDWb3NR0aU68wu+Zb49v61AkAivqHsvSKuiafwPaSOaasZb4JiWqNuaOKWrj2hT06fjJax1zdItmQrgLCBD9C36mtJZyCgBaDo/47F4m60h3kO4ZQjY0VAaCX2YVdo2uWu1RyShgJSSrYUovS9XlDdHSUtj6mW0swQ2aVN2tBh40FfNlLn4seQgVuDyBIxKKwg6AUQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 03:01:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 03:01:24 +0000
Message-ID: <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
Date: Wed, 4 Feb 2026 19:00:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: Dave Airlie <airlied@gmail.com>, Timur Tabi <ttabi@nvidia.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: 
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d64c7a-5d15-4225-7316-08de6462d8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2NiTjcxSkVKYjg1dDlEN1BxL1JtVkw5WHNHN3NwL1hob3BRZktYcWRQWUlI?=
 =?utf-8?B?MDlIVmpiTWVWaVd2R3BQR3JMZVdvNXJtMUJjMUJ3U2o4MGxEamJaTk9wL2Ey?=
 =?utf-8?B?MWY5YnA2Tk0yRmlXRGRQZ3NaNEpOMUFCYVhkODVtZkg4bW1oWnY0c0szK0da?=
 =?utf-8?B?VmxOUHNFaGg3dlQwNmVWa3JUL0RtbXNHdzhieGRxY2Z0TGVnRmRaanhGKzFK?=
 =?utf-8?B?K3J2bUJmYU9yUkVzcjRDN052R0xTcGVZbUNJVEtxWWozMFRMaENULzlvbWcx?=
 =?utf-8?B?cnVnQUxMc0ViWGZxeVdxWHkyVlc0R0V5cFFZdXVmcmIyM2RhRGZ3K0xvaTYr?=
 =?utf-8?B?dFptUUxyeW0yRjh1VTk0aWEvcGJqVVJHOEx0aGtCdnhMUTlNVXF1cC9YcjlJ?=
 =?utf-8?B?NkFIenlJZG1uUmcybFJHM0lWckpQK1BQWW8vSCthdFNRdEtkKzRkdUZNeGlB?=
 =?utf-8?B?VmVOL253Y05qV25yYXNhTlUraElyZnJOSHhjaEthMnIxTFN5MFpuWG41aTM5?=
 =?utf-8?B?Y0Y4Z3g0UlpwNS8xRWx6aDAzOGsrSUNSSFhld0tCcS9ucG5tbFh2V3lkQXNp?=
 =?utf-8?B?SjRDWEJJdzM0cTd2VGRhS1hwRjdPYjhMek0rZmJPSUNnTkhOaGU2VFNLNlhO?=
 =?utf-8?B?dVUrNFNPVWFwUk5DV2ttcEhrOW16Wmxra0Y0T0FJT3l1bUVsTjFtN21VYzMx?=
 =?utf-8?B?K0JzaE9pTGY4UkxLZXhhSUxvL2FlNXRRM3BITDJ5TjIvak9aTnI1N2NpVk9p?=
 =?utf-8?B?UkYvT3dDODZwT2Q4M3RlaExCSWYrUzFaQ3d2dnRhTzBkYzFCWlBRS0Z1Z0tn?=
 =?utf-8?B?SlhCZjN6TktPTHlWUGtOMHRlTStKMXc4YWpEamxqcU1HL3BsY0VRejdNalcr?=
 =?utf-8?B?elgrV1duVXk4ZjIrYU5JQnNtSkNORFFrRHVkS0ZBRzViaUpPNUlSbXBtR3o0?=
 =?utf-8?B?YXhCU3pFWG41MUlGaEtSUmZTZE9nMEVEdW1tWnYxdjNjenRwYnd3Zlh2SzdG?=
 =?utf-8?B?Nm91ck5WSTdlWE51RnZEQ2lMS01UWU1PQVd2dC9VQW1nTk5EalRGQWs4b0JQ?=
 =?utf-8?B?Z2lUVWZHVDRPWk9LTUJueHhIejlVUkgvdy9YenR1RzBGcWRyZFZxK2pEYjIy?=
 =?utf-8?B?dWRYRGZ2TEw3RzltYWluQXcxdWszV3pvUU9sVDRScC9TRm5wT0NSV2EvbUgy?=
 =?utf-8?B?OUpGK1R3R0E4M2dMTDJXcnFycitPTFJCaW5vRjlWbXgyUFZGUzIwVGZHczRU?=
 =?utf-8?B?MU9yb3ROQUtDZEhmTURzcFZDNGM5NHhOcG11WTVoUGRJRlZadGJJMzdKUXpz?=
 =?utf-8?B?YXMvaFhrQTY5cno5MGUxbVdrYWJMUWhldUkvcmhQL3pYd3hXOGpBMmV3WkFT?=
 =?utf-8?B?Ui9zdVpCcUdWYitBS2lyQ0h0T2hibE1nekY4Vm83TUtxemh2b3VWT2JIVHZI?=
 =?utf-8?B?L2NRWndwMTA0RU1wL1Y4VlNCTUY4UmgzTzJnclkvOXVoM1pocUw1WmtBanFT?=
 =?utf-8?B?emNjQmp6QS8rM3IrbVdKR2cvWUpoYXVqcmFKeW9ydzFxdWtzcHNJc0VEbnVM?=
 =?utf-8?B?WlBpZkhPNjMvWm1WcUdMb2RjeUlhU090YzdEUGZxVkZIUVVKMWtPNGs0WnJ4?=
 =?utf-8?B?UDFFSXFSUmpUTjAxVTYxNEZjdHBVbkxZS2FEYTl1bXJMN0hySC9qQWU0d3JT?=
 =?utf-8?B?TUt0aUoyRC9PY1BwZHU1Mkk5anBBc1JETWFqL28vWksrN1h4UHpxT0w3K29T?=
 =?utf-8?B?czRtMEFUUXVuNW41dFRCZ1hMM3B3YUY1ZDFjVmhVdXlQd1NCdlFkL28yNmU3?=
 =?utf-8?B?bUdudTVldlZxVzJaSDhOR3R6OUpCMG51U1NEd1k4LzF1dUo0TXpFT0JNYVMv?=
 =?utf-8?B?S20zNk9HcVIwN3BRMkI3U29aQzJnaEp6NDdjU0hvUlB0Vm1lbDNmUGF4REUw?=
 =?utf-8?B?L1Q5U0cwblFraVdSaVRTK0F4RDduVmlWN3ptVVR4WXM4alQ3TlJ6UFVKTGhS?=
 =?utf-8?B?b0xmc1lkNHhzaEVVMVFaRGRuYjJrUHV6R2NkdWhPaVhCTFNXZ3RKWGM0cVNw?=
 =?utf-8?B?cnp1MTBKS09UZjBLUm1uRG02ZnZwSUZDL1ZMa212NmJiTlpLVHN2QThKN3FB?=
 =?utf-8?Q?iIpE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1l5MUlVNnkxM3VjR3ptUmFxVDNGYllkZUltM29pUFgxWUNhbWtDOHB1UHZU?=
 =?utf-8?B?bmEyU29jazBoOExuRFQ0ZXV6QXlwbVJpanBCbGk0SEt6OHVMRVVaWXBHMXFJ?=
 =?utf-8?B?cHZOcWdvODQ0a01jSnV1eVYxSTFXWFJZUTQ0RHlycjdvcnphTnRyVFl1RW5Y?=
 =?utf-8?B?Ky96OXJTL1FnVTFLdUhWUDg2T2R2ZTNFNUpEN0FsckQ4cE9VVjlPVVlTVzda?=
 =?utf-8?B?WldUVXRGQVF0NEZnUW5xNUlFVlhyUnNBODdpRTZTa2xBdnZOL00yUEhQQ3lT?=
 =?utf-8?B?UGo2NzZ2bXg0QXVtc3krTXl2R2hTd1kwS2FCcy9saGhOMG5yTTlQaDlKcGF0?=
 =?utf-8?B?ZzFHZGt6cnZUSkVhbmlaRUk0YTh1dW9YaHNEK25wZzhDcjVSREdlT1htMEZq?=
 =?utf-8?B?VTZVSURWRmM3RmY0NE4xcklPQ2h0Y3NVaDRSVXJSY2RCK2k2RTMwQVNJQ1Aw?=
 =?utf-8?B?bE9ybFprUEo5V1kwdkRtQlMyK05JYnBaMXcyeStpYjBVWUU0SXM3QlZ3VnNT?=
 =?utf-8?B?SDVPOTB6TzVaT044cW5hV0JmNEwySXRPdk9URWFrUkNZN1pWeGpPeDZ1empz?=
 =?utf-8?B?T05raUdYNVVuZDB2bEJZRWw1eVJiekkvWTFRNWJaVDlIVnc2K1UyR3BNK1VS?=
 =?utf-8?B?S3dvMnYydzdnT1RDRGhnWEE0VTRWNS9WTUtSV3ZDZVdQTXVsVk9WM21pU1Av?=
 =?utf-8?B?U3dVYXVnbXpPc29nQ2hWSENvMWpLbDhBWUwwNWRZRm94YXFvMnAyMHp5VCtK?=
 =?utf-8?B?RmNCMDVTSStKQU5oTHowcFZXRE1VelVzL2VlaVZlU25Rck1EUGx2WWFOM1ow?=
 =?utf-8?B?RGw3anVIa0J2S2h0NXlsY200VDB6cm5IalZtUVYrSFpKNmVPSUVDZHdpd3RJ?=
 =?utf-8?B?MTgyR1RVd2N3WElqMmFjV2lRbWJndjZONENlSFY5cXVKY1Z4aGgvV0Q2dmY1?=
 =?utf-8?B?WDk0Um90cG1xTmJZOXptd0p6QTJHQ0plSGVhbEFSTEt4UmRhWUx2MSsvcDVq?=
 =?utf-8?B?WXhwRjU0ZFluT2FvRFROZ0dISjB2S1pmVXlqUHlOUjZjVS95RVlaZi81MDNi?=
 =?utf-8?B?SzFPMUE0MVh2dldCMzQwWGNtSUpVWlQ5MWtLMWRKQlBFYU1iYWhwenZVb3Fp?=
 =?utf-8?B?dGUxM1BTcUd3QkZxNkdMYWtINFpFTUh3UnVybUJPUEVpanZLZ3c5eXlxcnBM?=
 =?utf-8?B?NlJLYkRnK3hOUXBQTGtIQVVnVVRyaDdRL2NaUDdzUkM1NS9XcWVJNnR4NjZT?=
 =?utf-8?B?YXdjRFlTUzFkbG1vbzg0U0FkSXBjR0pSQm4yUWtMRUw1Y0JmNGwySThobTdt?=
 =?utf-8?B?N2Jvc25ja25veWdLMXhRQnFrYnMyaU5CT2RBSjROMUVtWXdqVEhiTTMwU2U4?=
 =?utf-8?B?VERQSUN3ZEhHSEtWZUY5enNwU3pMZUJPMzdzWlpKZHpPUXNuMm9DTUxnSVZu?=
 =?utf-8?B?RXN5NnZEY2FXclJvSVRvcmdXaStZNkM1Tzc5VjZ6dksvQzlNRVB2WTBGK1pO?=
 =?utf-8?B?dHUzNkQzVWI2UW1VV1dBNzBBUW1OQ2N6RU5oNTB4S2ZFQ1VPSXp5VHFWOVM2?=
 =?utf-8?B?L21tSU5jSmJXQnlabXFPaVFyZHdXNWtGWVUrYWJrWlNJK2dad2pSTjRvdDQ5?=
 =?utf-8?B?WkRNWVo5N090aEtEdXc1V2hlc2ZMeURSMXRWaWp4SmR2dXh3TzUzaHRDOXhT?=
 =?utf-8?B?VTRKYjRsdlBkK29xeXpGU1Bta0FEaEFDQWlxT3ZGL2VIc3ZkUDQrSFFTRkpj?=
 =?utf-8?B?WTgxdWlPWnBleDhlNi9wdU5WQVpnV25TQ1lwc1M1MEJ3ZUJVSEZDQm5TbENW?=
 =?utf-8?B?M0pncnJ1dHRKYXNqWGVISzZrUUNJTmdPYVh3UjAwRGJkSEFvaVppRGQ0VmJP?=
 =?utf-8?B?QWh4M2ozMzdJeFFTYkVpcW8yS2JmM0o2Z2pwN05YSDkzQURoOTJUbmlTQkVQ?=
 =?utf-8?B?SmhRbWlZR0huU0puY2dXMmdjcTlCQWVMU2FQNDcrZHNBckluVGVmUTdmdGIw?=
 =?utf-8?B?cXpmT3lkSnRNQnE4KzJkZkxxaWNBRUJYZlg4WUR4ZWtpc1VhWUVhN1Z6Y1p0?=
 =?utf-8?B?YzdPNG0vZ3JwUy9mNjRycHllNG1nYkNmcXdFTFN3WGtTY3FwQnYranlmQnhk?=
 =?utf-8?B?MlBkMjNLcEdRNHJoUmtraXpLNzg4SWhIbk9WcCtFeDN2RVpTUmtoL3htR3V4?=
 =?utf-8?B?Y3F0YkRuT2VhcjlxYVllbkExTXR1cDdORE96OEgzbEtXMHNsSmZ3NVBYcEEv?=
 =?utf-8?B?RHl5UFVtNWRsdjhabTV5TFAvdjRkbkVxYUU1TC8yZW9lN3hVMUVGdXVnLzZY?=
 =?utf-8?B?MXJkcXJKQ0hsODR1RHdNUk91cThwa1J0NmZlZHFOTUlwaU1aVFZlZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53d64c7a-5d15-4225-7316-08de6462d8f9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:01:24.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JoTmlDYnuksAQJznkumApMeQEThBN/KK8H45+4Y8H4eAWGXkQMEgSnCXfHb4I2H/UofhcWN9B+sSQyZ2hpZomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697
Message-ID-Hash: GFJSXT6YSNMINKEXICPFSETWQOR3GGY7
X-Message-ID-Hash: GFJSXT6YSNMINKEXICPFSETWQOR3GGY7
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Maneet Singh <mmaneetsingh@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GFJSXT6YSNMINKEXICPFSETWQOR3GGY7/>
Archived-At: 
 <https://lore.freedesktop.org/4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/4/26 1:56 PM, Dave Airlie wrote:
> On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
...
>> So are you saying that some RPC commands need to have a sequence number set, and some do not?
> 
> I'm copying the behaviour of opengpu here,
> src/kernel/gpu/gsp/kernel_gsp.c
> if (pSequence)
>         vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
>     else
>         vgpu_rpc_message_header_v->sequence = 0;
> 
> src/kernel/vgpu/rpc.c:_issueRpcAsync
> doesn't pass pSequence
> _issueRpcAndWait does pass it.
> 
> The SetSystemInfo and SetRegistry are the two async calls in nouveau.
> 
> So I'm not saying some RPC commands need to have a sequence number and
> some don't, that would be up to someone who can access GSP source
> code, I'm saying that opengpu does this and I'm copying it :-)
> 

lol I love it. If only someone here had access to the GSP code and
the GSP team! :)

OK, then, I just had a very enlightening call with one of our GSP
RPC experts, in order to learn what the sequence number story really
is. The notes below are sort of Nova-centric, but it should apply
equally to Nouveau.

Let me Cc Eliot, because he was also fixing up other aspects
of GSP RPC calls on Nova, in case this overlaps.

==========================================================
Background
==========

Today there are some loose ends and inconsistencies even in the
Open RM + GSP scenario, for how sequence numbers are used. And these
are being cleaned up and fixed. In fact, I was even able to request,
and receive some nice clean behavior, which will be implemented in
GSP soon (we'll get it when we upgrade, likely sometime this year).

Today, there are 2+ sequence number spaces, one for send-receive pairs
(command + response) RPC calls, and another for GSP-initiated ("async")
messages to the CPU.

The "2+" is because there is an inconsistency (it will be fixed in
GSP), leading to the first two very early RPC calls being in yet another
unaccounted for number space. These:

NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5

...are not included in the counting, by GSP.

The GSP finally starts counting up when it gets the first "non-async"
(command/response) message, here:

NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8


But even here, it's not what I think we want, because we want the CPU to
get back the same seq num that it sent, for command/response pairs. But
that's not what actually happens (at least not directly).

So for now, seq numbers on Nova and Nouveau are generally "do what
you want, it will work ok". But actually, we will soon be able to
use them for

    a) debugging aids,
    b) detecting missing messages, and
    c) recovering from "CPU sent a message, timed out waiting for
       a response" cases.

==========================================================
Next steps for Nova (and maybe Nouveau, if not already done)
============================================================

a) Change debug output to print the seq number numeric space,
which is either "async message from GSP" or "command response
from GSP".

b) Put a comment in the code to indicate that GSP_SET_SYSTEM_INFO
and SET_REGISTRY do not yet participate in the incrementing seq
number system, but will in future GSP versions.

I'll send patches for Nova soon, to do the above.

==========================================================
Examples to illustrate:
=======================

Today's Nova debug logs on Blackwell:

NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GspLockdownNotice), length=0x51
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GspLockdownNotice), length=0x51
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x68
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x70
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GspLockdownNotice), length=0x51
...more of these...
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GspInitDone), length=0x50
NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8

Future (after changing Nova first, and eventually upgrading GSP):

NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 0, function=Ok(GspLockdownNotice), length=0x51
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 1, function=Ok(GspLockdownNotice), length=0x51
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 2, function=Ok(UcodeLibOsPrint), length=0x68
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 3, function=Ok(UcodeLibOsPrint), length=0x70
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 4, function=Ok(GspPostNoCat), length=0x50c
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 5 function=Ok(GspLockdownNotice), length=0x51
...more of these...
NovaCore 0000:01:00.0: GSP RPC: async received: seq# 12, function=Ok(GspInitDone), length=0x50
NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
NovaCore 0000:01:00.0: GSP RPC: response received: seq# 2, function=Ok(GetGspStaticInfo), length=0x6c8

As you can see, the CPU side can then track the two types of messages
clearly.

thanks,
-- 
John Hubbard

