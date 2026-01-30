Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DEED73EB8
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 03:39:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C8D1110E8F5;
	Fri, 30 Jan 2026 03:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pfrgcMeF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 103E74015A;
	Fri, 30 Jan 2026 03:30:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769743804;
 b=Gdqhvo2rRb0Q11cVRCuS3df48SCHfvUgBuDsIjCkLa9xOw8q7ExkUqCPopOgygTruV/xI
 o12tdsN1ZIOG1sZrvgpHcq8a2shHXGe7Qm4Oks7Dav5360JBgBVXShT+5LV5MCG3vVVhz3T
 IL7mcVMEjRvTlhJbKdvVjkH8vugwzqoZi2/F9g14YpNgieDAofAPxfXcsoK0MCHzYN5M1s7
 UidYvo+513r2EwuMb0FjvT3/7hlC8/S7Si/vWzCcjPqPUs48uIAiIvo6LOgTp8Zz+k8W4A3
 N0Qk2A7p3DQHypbmkLqPSTuImA3EE8WFdyKmL7hwkUfvLkL88bza5Xu9KLaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769743804; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3EguTx79LktGjiopR9RwQZlBTKh0yHVnGyZfJDIdTiA=;
 b=0LjkhEfJ9Z1nha+IePrsfsXR4jR2X2Dll8sge5kX0iLgxkcB4wbIESkf/rOMLzcyhH7e9
 vuWxVX6VAWMHv/SMgOCZ43W4bRLN7xQ3aK7BHIA76pU8KUTwV6FUy2lT23+nzSpoUNy92GU
 p5RWLjeF4kHwODpSmT97SzMpyVz0u0j3U6iDz1YZSOUjJ7WLmAM3BYpdOONpJsCMskIkyls
 aDAr4WwYpnJdzJLY1rl6KQIRffQMG6rm1l5rA3xh8cftnNcZSU/yuDDjGOUj0wcrmLiwRU8
 9HBmFYGIzrQ5yl8j2qAxefX7poc09mS70s6WlB461aQvOw3HlnKbv0ZUXi+w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E5BBC40106
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 03:30:01 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50FA010E8E7;
	Fri, 30 Jan 2026 03:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0ofqGLURk+M3wZFrAGXmri8wmilg7Fz+pN+rlk2u6OOepIiNd5VSeOBPddZOUbfqekkk5bBf1sREKFDYdnNCFXAGkBOkbawrshANErObtSbBZk+8280GBUe4slw0+ijbQDqV4fNzEVAbZc51sxjArvirxhTYpGenv4a/whx+yGW7TVkoBGdLNvc7zviUfWlac4E3KzDnN3/95ILvAXQkBQGvKHYg3ggpG41NskOIDVIFgxpaIL9MiGoMTj5agyYguODdkkNJHwQgiHMxiRkzgKatcdxaAtH0TqATaGGf/wtSTohZm4WfLgc8D4fbMVmNxtc5k+jvmuuujvOoKusSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EguTx79LktGjiopR9RwQZlBTKh0yHVnGyZfJDIdTiA=;
 b=IAvunRM0lm5rbe9RXodGnE/rrWYrz/ZnHDlYsgWkrg+Gn3i9etLwrR1AXqu+T3nHEQJaa7AijM82lVH58az6U66XJaR4gobh2rEW0Idozymcss53AxN02rlLaoW2eOLp4RNOohr8Z0mQDXvkPubCCuSk/tkA/zehLhCLTtP8GnmJCSeQwQ7wMRRc8sJa91SM2hPjx3WTB7SoGCRBNRP7i/uBHqj8YIZ9wX2PLfIIDrKvH1BnqY5YaF93PKs547xH/yAAlMAhNgj9DZ+7y1c8EhBmydx08FagEA3TIrhw3xh7PfCCN8rHTyq5lMlK1wDBb+BOAWHzarEDrADSp3rpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EguTx79LktGjiopR9RwQZlBTKh0yHVnGyZfJDIdTiA=;
 b=pfrgcMeFzZN0aVfzG5zHtXjFq8ufwY5512R0cRwRBpdmShqAl5Z2WPpx3i7MKV3UvKlgw8V6FvDY0hzdn0nbuPVPwG73/dN3SD1pkyBjApNIJi8Wa4hDe6GHEU1doEfhVnrry8E35hTJ92dSJ/tjUxB4Ni6wdu31nuHgST/DFY3Vcg+ToIe8vVud9n+qLiTx2nDDWjIexOVyjG72XVWBlneurOd8WhiJdoVdPsPDG1lBFRaJ3suU/w6P/34J758C0SHqJsK6X3xmjxp2bDVZdIK3O9FjvnFH+VmeRZtQwXZ54T4aOnCPo79ZhJgjEDV6qfs67QvyiH5ge9Zv73ma/Q==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Fri, 30 Jan 2026 03:38:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 03:38:59 +0000
Message-ID: <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
Date: Thu, 29 Jan 2026 19:38:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260130015901.GA301119@joelbox2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd5568c-2b0c-4c31-6499-08de5fb11a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmZNMnhPSmJ0dHdDaHJmZHRxYWpzVEVTeFZNcjNHRFRvekFUNEVlMXVxUUMr?=
 =?utf-8?B?b1o2M0drZW5aVnNOdWQ2WWRsOTNwQjlhTWdvSzJrb1pqdkRWelVienFOdzRM?=
 =?utf-8?B?TzI4U3dDTFJocUlZQWx6SVRIdzdNUGVzS2JPQXNzNHRoL2RzNkwwZ2p4YjhP?=
 =?utf-8?B?S2ZNVDlCY3lyMk50MTRVUmtlSXg0QW04THFTaVVzdlRKNWFhWG5HdzJVdU1m?=
 =?utf-8?B?eCtDZWNTZFpmanlrUm5WQnB5ejBOcHFBRUxrRW1yM1IyeFByQVdwT0ljVUFB?=
 =?utf-8?B?RXlRWkpWMXdWNnhVVzVXTUw1Y0ZtY2wzelN3UjV5TkxoSHpVZVIvZ0VYQm1n?=
 =?utf-8?B?RnJFZml0cnFEMm1SZ1ZPMFZCdFNQaldnZkVWd2NJdlkzUnZ6dnFmeFozVHQ0?=
 =?utf-8?B?SWJ3eCttNVBPdlcvT1E0VlVlMlpPd3l6TzB2S2tIY3VZZndQRzV0R2F4SXU3?=
 =?utf-8?B?UUxDNnZINHpCamU1WnB1amtqRVZ5c2dWd1B1emZKMU8wRm9zN2tvVjU2SC9C?=
 =?utf-8?B?WEcrTXkwcGFNenNQdWhRV3VMN3krOXlLU0VCY3J5WGIvbUx6TWhuM3NhcHc5?=
 =?utf-8?B?dHpiTUxmZWk2N1J2Y3crVWhRa0JkeEloemwzaFN6S3F4ekJBK1FZNTFBc0g4?=
 =?utf-8?B?bFhickV3L244OWZNazZFZXZiQUJYZWJpM1hTdGdmRUVTeWN1MVdpdVlldnZl?=
 =?utf-8?B?WklRUmdqVkhQdUxEUjZlNmZZbzBRS1VhUDBVQXJweDFxb3lqOVhHT09zZTQ4?=
 =?utf-8?B?c3RBd2R0WVRIbGpkeFpjZysrVWJEaGJwb1N4a1hhWEY4RWhVd1JSZnVPd0Jl?=
 =?utf-8?B?Z1NhZzB6T093UmYvWk8rQk84NmFFbG9ySG1ETGhpWlFiemprUU1ZRTZ3Smxq?=
 =?utf-8?B?T3NRK2VDeWZnd1ZuQ0JxUDVKcXhRZHFxSndvNGdZZ0s5cktCbkdOZmJmVDk5?=
 =?utf-8?B?NGJROElDcTBXN0ErNGZrTjVXTyt1NkNNSDN2KzlFdGllQVNKUUZ5b1NoOEo4?=
 =?utf-8?B?Qm9rek1FOE1oODNCaUx6cTJ0RzdNbXd2TGtjTlV6R1dkYzFjYTcvRHdhVmxp?=
 =?utf-8?B?N0t5UlRWcE1zcTE4dzdCSXBpeUtnckdWOTQvSk9PKzd1RjIxSmxoQkZaZ0xJ?=
 =?utf-8?B?bXFFNk5LKzFVRzU3T0dFN0oxdlVuam5hS3YrdEI2Rlh1REszMFJtdWtTOEhm?=
 =?utf-8?B?ai9KMlQ1M09lOWNxTkpKQWFJaGpabVJSMkc1WkQ3cVpEQm11cnE1a3dKOExO?=
 =?utf-8?B?MnVOOHhJTTRaMUVjb3huTk1YT1NXN1YwOFQvMVlBTVp3N1hoUmxrbFEyYm9l?=
 =?utf-8?B?NDFFRkE0SG00U0lrVkkvbVlJUWRSSmRPZDMyTVp6Vmc0QkNMTVBTcC9ta2tN?=
 =?utf-8?B?M3diT0lySDNtV2JnQWN1Z0ZDZDdyd1F3aENGUHVncXdMSUIxWE45TEZhQ3FV?=
 =?utf-8?B?SGdnOUhnOE1NTFZIWlZOL1hCWk5FTnhxdHg0cStYdnNtQWFObzhuY3NJMXFU?=
 =?utf-8?B?c05SZGw0Mk5PVStvaTdjOUNaQ3lkM2UyZXVHRG90ZW04bGFsSVppMjV6clpS?=
 =?utf-8?B?WEpzdVo4V3NIcm1EQUdmR0JiVWtFQ3hoSWFzdG56UHkyZkpnMm8xa09nK0NC?=
 =?utf-8?B?NkVnWktrQUhxMmVMdkFxVnpjdThtR3hXNEFXVDMrWkg4Yi9uZFVTQUxiNUJo?=
 =?utf-8?B?MjQyUWpEUjJTRUJXaFYrOGFmZnRpejRNQjBWZktHVEN5dFBqQ3NhSkl2enRT?=
 =?utf-8?B?U1RWQ1hWUXdicktLd3NHQ2ZEWjg4Q0x1bjV3YnFTS1piYkk1R0VTVHZCQnoz?=
 =?utf-8?B?aHEzakFqWmhaUFlSWDMybFc3cHRnSVBYMVRGL1JxYWJkL1UxQ0d1MUVEbHRC?=
 =?utf-8?B?VnlhMEpVa21HTGJBZ0FaYnNuT3FGSGp6Q0JXaHJmOG1idUpWY2MraWJrdGMv?=
 =?utf-8?B?SExsKy91Q1RQWlljS21nT1MxWXhyMmlTM1pXeXdRcmJUNGhoRGk2Q0E0S2Zl?=
 =?utf-8?B?aGthNVV2bkFYR3VCSHFWUFZaWUpJN2cwK2gyNzRaMlRnYlJOT0lNTld1QjRZ?=
 =?utf-8?B?ejRzb2FWUXJrb3RKbWxwL3VlakJKbDBwK2RHOGZzQnF2ckF5dHFVVnhGcFlN?=
 =?utf-8?Q?b3hk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGlkLzJMVUxVZjJPcXV4K24wQ1gvL0xwRHd0cEwyUHBxK25LTkV0bmtrMFZP?=
 =?utf-8?B?ZTYwZGk0MzR3UnRpZzU4TjJSRkJOcmRFWER6T25talRHY3JzQ25ibloweE1M?=
 =?utf-8?B?emk0U3IyYzhZNWs5Ymp4OFE5QVhGZEhKVE1uL2hmYmtlOTB1dmlKclF1bm1K?=
 =?utf-8?B?NEZrR0tTaGZNMUVkekZrYUxraUwycXFSZ3JrZHVTYmR2QmlTQ2pWbHVIMmJm?=
 =?utf-8?B?cU4vL0kveXVtSU9iYURvRE9udm0yU0ZmV1B0NEdQRnZVSmxvWnl0bXd5akNl?=
 =?utf-8?B?eEZydVdKRXQxaW9LMWwrVjNnZmxMc1UyMElGeDNoT3JRZ2xFS3hxZ0UyREpv?=
 =?utf-8?B?LzRBSHBPVml1Z3M3ZitHd2J6dk5FUTFBc0s5UGtXKzh1MVVabWtKZGFRT283?=
 =?utf-8?B?TFNzK3dnVHNmSlU4eHRsMHNDTEFOdXd6QmZDVTR3OURmNTAwNHlKYlVCNjRM?=
 =?utf-8?B?V0Y4bHlPdDg3dnhlUEQ5ZmdPOVo5c0ZudmVTRElrVUxpTE9vUnB6M2NHZHh0?=
 =?utf-8?B?UjNvTENPYzdUNVNYUGdHMnlmWER4UzFhbDZWTVZkU0l0UUYrbVhHTmh6eWFO?=
 =?utf-8?B?TlpGb0F0WjJkQU5vY3JIVVVtZ1VwQ00rTXZaZ1RGakk3aWx6dzhva1hKaGll?=
 =?utf-8?B?eG9nRWxlaWxIQ2JkRUtsb0FEcWJFZ0t0S2UxR2RHK1E2cDlJVk15cFp3c0VB?=
 =?utf-8?B?WDBPaGlOWGZaWloxellqajZERHQ4VmZrWmtXak5yYzNQWDV0UmRQcEttMDdD?=
 =?utf-8?B?dVp4bktBOGFscU42UTd5cTJ1c3dlMEh6NGtRUGg5MjJ6YjRwb3h2Tjc0aVVi?=
 =?utf-8?B?ck9GSVZMWkxBRXlycGdMeXRjZ3RiTjVBbGRzMHdHWHREckh6ZmNySW1VRmV5?=
 =?utf-8?B?RDZyTnBlczBSeXZYbVo5NDM4YXVSTFRKd1VsZDJmOXA1MDVTYzAxVmpOSHNY?=
 =?utf-8?B?RE1hdG5ZVlp4Q1BXVGFpNTlhdVNlUE9CREJOWDBZWnVQeThZUVpKZEhqR0Ny?=
 =?utf-8?B?SGZyMjRqNEcyc0wyM3VrNEZ2Mkw5em1JSXlzNlBYc0xpNXFibkFCaTlyYjBa?=
 =?utf-8?B?TDBBaVhpbGtGR2NXcjM4UDRkRVRZZkdmbTR6REdpdDlSUlVoY2lLMEtCSkJU?=
 =?utf-8?B?Vm0vdlk0RGw5eVUxYzRSTVgrMGJENmtsdjVNUmNuQ3RnWlBnTGQ4UFNrOWdB?=
 =?utf-8?B?ZVcxYXRjaUZkd1FOeGxpTmNjYk1mdnpmRzVEb2N4SEFzUWdaazdYdlFKMzRr?=
 =?utf-8?B?NjU5SUZod1c2NHY2QmlMenp6TEMxUUN5MTh1cFRXWTd6bnNxMUlEa2xqdUJL?=
 =?utf-8?B?NG80Y3ZML1hmbFpmeElCNXd0NlJGTkdSV2xUR0RzSzBLRGVrQ2RJc3R4MTB0?=
 =?utf-8?B?bHYrWUVLWlpLbWg3cytBZ01UWk5NVGplaFh6a0tjZmVaemhpbTQ5MDR3cDVw?=
 =?utf-8?B?bVRWUUY5VXQ0aDZTZHl3NjNtZXRIVTdtYVp2dFFHOFFWVlV3Z05MaFEyUnJ6?=
 =?utf-8?B?WWlROHFxU0c5ZnBFejRveXQxUGV4YmlkVzU5d2FPUTRTVUFvcmpzemRiUEZV?=
 =?utf-8?B?MU1XR0tTK3BOMlF3L1lqSzFZRklNZGlPWmFLWlEzblB2cFFmaFUwamsvNDFi?=
 =?utf-8?B?ZXFNQ090ODFTdEtvOWJxWTFXQVNyRjlGOHlxaWdERHA5YVRFZkdMcUxIVWEz?=
 =?utf-8?B?SFZiOGMzb2trRjNpUEVLR05ob1F4QmcwMXRHTUZ2cFl1anZ2cDNOa1hjaDU5?=
 =?utf-8?B?ZUhKZkRPU0pncUFtM2w0SVh6RnZZME4yS3VzalhQM09rTWR6Uksza1FhbVAy?=
 =?utf-8?B?NDRIWFJMOUtVeTZ0ZWJNZi9UN1hCM3c3TEgxeFp3VGlZeFB6Vi9IaU5lWi90?=
 =?utf-8?B?ckRCeHQ4NjY2YXd1NWtZZjNsYmIrcnJkdS9sUzF5Z1RBTmo4bXI1MkY2MTBT?=
 =?utf-8?B?eS9GMmlScnJPcVdFcVJ2a0RUekE1SlZ2djl2TUJiVG1Ub3ZDK0szbmV5Ukdq?=
 =?utf-8?B?RTJzc3NMeTVZNkJHbDdnM01obmxvOHE5WDlKekJXQVoxWlplV2FRdDlmejU3?=
 =?utf-8?B?Ni9GNkZsM3UyVXBXMXNVNXN4cFhEU1c0ZmxCczFRWGhpcWFIb0s3ZWNSSTht?=
 =?utf-8?B?QlllNXVicnlKNFpiNkNYRXd6WU9sTFVjL1kvdjBmTEFFVHJUVmhDMjhPN2Fi?=
 =?utf-8?B?VnpuNGpRWWtBZ1ZqVk5WNHMya3ZPV3BSc2t6L1BGcWswaVk5TmxjcDB2TFN1?=
 =?utf-8?B?VHF3WHpPWlczOHF3VkxxS0oxdUVDdHl2UnlFaG9XNEV5SzR2NnhMTWJNczNo?=
 =?utf-8?B?VzZtZTRVQWtmbFAvWlZRUHZENHlNaHZ3SEhWOU5keWJTempTRzIyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bd5568c-2b0c-4c31-6499-08de5fb11a6e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 03:38:59.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 00yWLPK9WcuAwyvfY1U0Zyoyw/vAOE/Omp8qVelhE9o9Qd7epJq8NvIKwJjYnRQnM/kAVNcS8Sr0e22q79xU0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862
Message-ID-Hash: KH3HLUZAD5DYHR4LPXGKVEGV434OAT5Q
X-Message-ID-Hash: KH3HLUZAD5DYHR4LPXGKVEGV434OAT5Q
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KH3HLUZAD5DYHR4LPXGKVEGV434OAT5Q/>
Archived-At: 
 <https://lore.freedesktop.org/c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/29/26 5:59 PM, Joel Fernandes wrote:
> On 1/29/26 8:12 PM, John Hubbard wrote:
>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
>>> Based on the below discussion and research, I came up with some deadlock
>>> scenarios that we need to handle in the v6 series of these patches.
>>> [...]
>>> memory allocations under locks that we need in the dma-fence signaling
>>> critical path (when doing the virtual memory map/unmap)
>>
>> unmap? Are you seeing any allocations happening during unmap? I don't
>> immediately see any, but that sounds surprising.
> 
> Not allocations but we are acquiring locks during unmap. My understanding
> is (at least some) unmaps have to also be done in the dma fence signaling
> critical path (the run stage), but Danilo/you can correct me if I am wrong
> on that. We cannot avoid all locking but those same locks cannot be held in
> any other paths which do a memory allocation (as mentioned in one of the
> deadlock scenarios), that is probably the main thing to check for unmap.
> 

Right, OK we are on the same page now: no allocations happening on unmap,
but it can still deadlock, because the driver is typically going to
use a single lock to protect calls both map and unmap-related calls
to the buddy allocator.

For the deadlock above, I think a good way to break that deadlock is
to not allow taking that lock in a fence signaling calling path.

So during an unmap, instead of "lock, unmap/free, unlock" it should
move the item to a deferred-free list, which is processed separately.
Of course, this is a little complex, because the allocation and reclaim
has to be aware of such lists if they get large.



thanks,
-- 
John Hubbard

