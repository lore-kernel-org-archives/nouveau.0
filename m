Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B08BE9A03B
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 16:20:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B15410E71C;
	Thu, 19 Feb 2026 16:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F/bqFjGi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8908F43430;
	Thu, 19 Feb 2026 16:10:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771517447;
 b=isKy+Pm+RneRRLlsSIldyOj7D/QtmWHRvHlH2j75Eto2g9yE3rVSjQA5+qqGSntt82JHy
 P2NN1dNluHWCTts5uCh7EDweRAXDFyIM1967PGhVqLF64VurDoHLqfNNs49djtmNB86dm2o
 AVJoX+uXssJvb9z4v3Q2Iv8CG9VBT5HBuMu2miDHWb0ZGoNGh4/k8teQA/Tl5sa97YuGGN/
 3TrjKnDy2WteDhUV6ISEi8NlxZgbQeScpD9qNhEe6gI3aZdgzHiOOBkXll9smYVr4x8IR4T
 32kkQOROfmOtC/41033eja9K+ptSydQkaiF3siHx2+S8FVszu5u4MVG3HhHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771517447; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ba4Nua15fkzG6dMsbemjrQjEzs565tAlm5y47SKrPC8=;
 b=KVABlf5/z/Vc5ygGhV24Nq/xyvGHr7RcdXVyXrQPvRfpXltw2gu03j6jwq9jX1J5Dibmq
 ZNJMPBjjoEw67hX0FcAq70WHFjOH4p0khjO3QjaNCD8zP7DKHvSBuIiKm9k1vzngu361gEU
 6tBK3abYbLgOqzSS2+IjgvFivwiXVlRqlk/nPhyjYHrpVWdg4m++lsGtaIJi7dP3ZOk6vvD
 20xX7e3tiEH58Na2OBmeQaJNL/UoXR94nUIe2pRtMVIB3WkvBKq4LYoIqjG6XABR9LU8LLW
 X4PdnYnAekiLvvWc4JIm6WE8tHZ6tCeE4WOTLZjQCZqM91DtES1T7HmRFwtQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 24DD243401
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 16:10:44 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012006.outbound.protection.outlook.com
 [40.93.195.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D910E146;
	Thu, 19 Feb 2026 16:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0KBbAwqw2sPW8hiYGZ1rixu4z4egkRgpIZ0uhU0dIAYsurRdcGvSbm+OyuhYbzFGEpggrHQXjgjuQaj/Iypi8noBxQjIhqz1V8qfztoZQRaOv1K2s8mjyKfSmmcwvA7QGbxxuRxPjXobxvRU7HUBh1TWGFtLBCPr58yNqB74WirumpyiBN6QPDf27Cfk6bueVwWs2ew82WUrMhxgqve9npEEpDjSpAppgd38sdJK5JVe/cywueTG8Kzk3nsmCMBBvjUJnkm0ZdAopHxkUsThN3p9KhtgODTd8Q/wd0+3BFH7oRSf4sioDTzCj1SSdH6E/FzTrOsF/hr04lkTs+sZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba4Nua15fkzG6dMsbemjrQjEzs565tAlm5y47SKrPC8=;
 b=CoOPRJ8iZWCfiXjnHvsjr+vTKEcbuC9SxT2DtIgHDMAtAurauNB3vpGpxhqXbJlRPeA8ayxdc1g5c0wgVCkYt4hAckB35oBuIsLHxgg9zPvy26AjtItS2aHIIK7gULKUzG+IlHUmixfsitPUeoTpJYEzITZCBl9vW42WzhN7GVDtjuAgfbHnVJRefWCyYSWIptqgsJI0iQGip1btL37e4FlyV2/dw97VwSNsTmOFMpAlPgOiId8PNnXwWk2qsd1luIAPF77+IBHziavKx0321y43qA6XiI+nzpbL6wDvAU5mbGBfMwlsgtZASoQ2v97R8eZS2cCHA6BEKPW5yLaWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba4Nua15fkzG6dMsbemjrQjEzs565tAlm5y47SKrPC8=;
 b=F/bqFjGibfX0XfT43E0jPmuHYAzKFzEP5j271+laopBhGXVmopBnDKsmQsIE3loSbhwpRxUfQ1ZBADpl0dWYlsBddlRmsJJLIsI+DohmDjaO+XrmRyBdqx7/DAhFLBURrCS7zrUxbJ5d5+K88OJZm7xmK9Gh56ywbSdL5giGoIpZFVVKraAeYBHqFVL1PuIf745VUh2FxBL431IR084GrK9wQHBIEmr/kW+khcrfQ7Szy9u0gqQ+QfxWJ2c3of0KLD0QYRWtdA4HuXi6s+41ZKTqDPlkN6fSK4YfEk7nqNZIoW1dbe7PJw1SjKze+EIbk3JGrK4KlG7uUuNk4xMFQw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 16:20:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 16:20:23 +0000
Message-ID: <d5060b5e-08a6-4f58-8554-d2fb2ef108d5@nvidia.com>
Date: Thu, 19 Feb 2026 11:20:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with C
 linked lists
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
References: <20260211-v9-nova-mm-v9-0-a8e261c2e734@nvidia.com>
 <20260211-v9-nova-mm-v9-1-a8e261c2e734@nvidia.com>
 <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
 <ebd17ac8ab6d1e1ad6a8eb8defa49915@nvidia.com>
Content-Language: en-US
In-Reply-To: <ebd17ac8ab6d1e1ad6a8eb8defa49915@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ec73be-b0c3-4e16-04a7-08de6fd2c88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZVpjSXRLSUJGSmp6S2JtUm9pTkdwbUh5cGxwV1Rkd04rM1V5UnlwTUhXRVV2?=
 =?utf-8?B?dy9pSWJEWGJqSmVLT3dEaVBuNkM4RC9xSHpLTnZmYm9BZnNMM3B6UldMMnRE?=
 =?utf-8?B?cVQ0bTFCYkJ2OGhrd1hjdkRUWnIvSDBOZFBYOXQ0UW55MGE4M2hkNjhrRktP?=
 =?utf-8?B?Vlk1dzRrWmZxRFh1VEt1OGdNalFkZFF5K1cvZXNvVitXejdHQ2E1ei9pNDl2?=
 =?utf-8?B?dWN5dHVNVUtXZHFGc1d4M0UwVmVPamN1ZVVNZksyaGY1R0RPM0l4L1F5eDBH?=
 =?utf-8?B?anhmc0ZNdzA4aGZNT3BhL0NrNXAvamI1VDU1RkNXbTliZDJVYUhzdnFsckJ1?=
 =?utf-8?B?b1VHS1JEKzhQL1RPak40cXlRUzNWUWQ2WWZSSERFVlRBaVZ0OC9lRVpUYnYz?=
 =?utf-8?B?aXZXeEZncW9jY3VJK2YxY1Y3M3IzYm9KUkpVTkNUb1hxMEh0L3hUWWlwRzJZ?=
 =?utf-8?B?NTJoRUMvZWtNNzRQeS8rLy9qM2FqNVlaOGtTNWROUDY0Nk9weHhESXVsRzZQ?=
 =?utf-8?B?QmFDT3RwaWxNS25UTENlN29aMitHZXlHL0tCeGZDUGdqam8weGZ0VXBoc0lk?=
 =?utf-8?B?bFUyOWhRUkNkeWxMVm5qNjFTa0pJU095ZGl2VW1nbDkzdDUvRW9DTUtpd3hP?=
 =?utf-8?B?RU1WejJYUmxNeWcrSThIczBDRlNOMmRFNUJLSExTdW1uR0Q4R3pXWnRNbEpM?=
 =?utf-8?B?cktXUUNieGQ3T3VRd0pKWlNwYjlnODk3emJDOGdaSE5abnlvK1plcDVKR0c1?=
 =?utf-8?B?a3hpSjFQa0Y1SVl0VklnLzlYdWdzbXFjb1UvRVMvT1hXWDcwZStjKy80YkE0?=
 =?utf-8?B?Q0l5UWpIeWRPVnlZUExnTXFPc25NS2xCUHlqcndNQUR3aFVBT0JsNGJEMGY5?=
 =?utf-8?B?YU9aZEVZcjk2b1NoMldVbU5nanB5bHlOVUJCUUtYTWtEZytNRnBNYUFBYXVG?=
 =?utf-8?B?OGZoNUtsZndmUWd1Z1FJK1k5SGt3OSs2N3RhVlU5d1VuVEt4OElDZVN3cEJH?=
 =?utf-8?B?OFU0MlZBYlFiblJPN3hXWXBUVzVYcmJxTlVFTzVTTUtWSDB3MUxkUzBqK01X?=
 =?utf-8?B?ckNKNmhjbFZ3Q3lzOUU5QkhwOHljMm1TMTVLNjk4WFFlaWNJVE9jUU5rdHhE?=
 =?utf-8?B?MDE1aU5oTEdwNHRqay9pV2pjK1JsSi9qV2Q5TXBKVlVyZ2tZY3RFS3p3KzRH?=
 =?utf-8?B?L2dmWU95cEFLbTFDMW4zUWNDMXpHeEtwOWcwOWlldzBSR2N5MVpxRFBNdUwx?=
 =?utf-8?B?N09yL1dtdVpFeVpiUlRhOStYWS9URzQzenZXL0w0Zk5nRmlSMnZrQnlhQURu?=
 =?utf-8?B?VVlVbFEvQXVoRWxsQmw5UktLYUtQWlZ2L3UrdHROa3hWVEtFSkYrcHpJN0hY?=
 =?utf-8?B?U0VmK0JTRldoNEhBUEtKNnVLckhLa2w1Qm5IZTlTRWVBUUs1NUlVZUpOcnBr?=
 =?utf-8?B?eWVLVHBmVnNUc1FzNFNpcU8rS3Z3bUowZ0pZeHN6MG5jMzFqWnB2RzN0MmVG?=
 =?utf-8?B?SlhRWGVKVEU2b2pNbXNSbEJGMC9qeTgrY1Y2NVFFazBRWjFOOEhKWkFWdVdG?=
 =?utf-8?B?Rld2Rk0ybS9NNzFtOWxJUzlOZkFHM1pJNXpaS2NMVThpaGZBK3dlSE84YjdS?=
 =?utf-8?B?UGh1cldDNklIWjZzVG1HdENZbjB5NmVzZkxsZnM5TUZrM2ZraDRrM2daM3Jw?=
 =?utf-8?B?Y1ZGTkhranNzNmlvSS9zRllzRzBVQVRsTnY4SnJtNG9MdjRWWFdlMFgyOHpp?=
 =?utf-8?B?U3NUTGI5ZEw4QVUzM0dNdGdYMlgweEtDNXBjYnQyQXV4OEx0N29KUzBBdUpW?=
 =?utf-8?B?U3laVVBBWGdWVDNQajhuR1hVVjFVNkpaaVNjdGZwaVUyTDVpK01vQ1RZMHpn?=
 =?utf-8?B?THlsUHVpTzRHN0ZCdVJ4ejgxbFBtZDR5dUwrL09JM0lhMGMwdXhxUmp6OVkv?=
 =?utf-8?B?TW0waHh5eUdITzFVeWpyRDNrUGpITTN5ODNKcmFLWUNISnBpS1BzQ296eUNT?=
 =?utf-8?B?Z2l2aHc1Q01QZEhLSzVBdTIrQ3pERkdyZnFHUGg1WFJNRTFsVzJwV3VWb1Zq?=
 =?utf-8?B?anZlNmxoblNCOUlUTGphMnJ0SFdQWUtpRHRNemFyYkVpREJZYWhKY1ZmU0ZS?=
 =?utf-8?Q?Hnb8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bm9xV2p3NkRHQ1lZVktCZmJ1R3YzMDV6LzNiZlJsREpUK05wSVg1V3JUYXFx?=
 =?utf-8?B?RjZYQVlWdmp5cDNuOG84ZEhGQW81QWNKM3B6R3lsa0lvbVBkWVdjSHY3VUhi?=
 =?utf-8?B?WDIwMVFyK3hHelJ0UGhvbGdZL2xpUy9MTzlQMEsxZ25LcXROUVpGS3kxNFVt?=
 =?utf-8?B?SWlRaEhZNFg3dEl6cjdMZWFBS0VJTHI2d2dFbDMvVHYyT053RTVlVEVEODFE?=
 =?utf-8?B?Q1BnS0tZblVaeEE0TkNCTGhiTzZRb0R4ajhyQnRURzJrbjZlekJxV28xMEVk?=
 =?utf-8?B?em83YTR5dGVjRldvVzhmTnpscGd6ZjBaM21zUmFoVVZjcU5tR0MyU05JTzFQ?=
 =?utf-8?B?amN6MHJmRVMrbm1zUVRxcTVOdzZUemZOM0V0N1UxVzlJQWtTbDFxUmdXZmdX?=
 =?utf-8?B?Y2JhbE9sdldkN2I3eHFzenV2VGRVWXVmNm1oekhkYncrTHdvcWFBYWhTaFg1?=
 =?utf-8?B?WGF0QnZFSnh6MUUxYmluMEYxODd5MnlWc2tjU0I4RzZrcXMyaEIzd2ZiNFpa?=
 =?utf-8?B?NUoyS0libVVLMU9jR3dGTXBQb2FSUTlmTGZkclV2Y1hJOERzNStNWDZCL0NR?=
 =?utf-8?B?VTI2NklIMjRnMlVtdTZSRUdqVmhWYnpHWGxrR2xjY0VPNFNyUUpOS0x0a1JV?=
 =?utf-8?B?SWVjRk5WUkhRNkFOVGJheG5OMEh2NVRtb1dpNFFJYXZUNVo2eitPaFlRRTVk?=
 =?utf-8?B?MlQ3OGtuRGZvb2N5cWllS1pxMldpQSsrQXRDQUI0d1c3MmFQa3QvVGsvb0dU?=
 =?utf-8?B?bzFBZ3lFNDFUNjFJQnpicDNpeUlWRS9ENWxtY0JycXdSTUpkLzVnVnM0S2E2?=
 =?utf-8?B?ZUJKYmw5d0Q1NkMwZHhzSzhkaVM2Wko5cWJxUUhVY3l3RnFhalh6azhEd3hW?=
 =?utf-8?B?ZTdkRmY2MHRhN2dSU2h6bDVnWjhLYlAxbU9YZzNGamZmMXNmQ3kyMlVLZXdr?=
 =?utf-8?B?dGVYWHpiZHNXUnVTWFR6QkVkOTdrNWZlM1NONTlsNzV4L2MxTzNEYnNtSTZy?=
 =?utf-8?B?OEcvYzZqVU1Mem9pay96QTNSYzVpRUQ5TDFhS0N5U1Rrb1ZKSEtJODZwY2Vi?=
 =?utf-8?B?eWhLeUEyaWN2VUNkNXJNWFFEVGVUczhPL3BqbVcxdm5la2pQOTN6WFJaUnk2?=
 =?utf-8?B?RXM2MmdMM2xxelhUbVJiOVFyT1dDWFpQNUl4bnRQSzRWblJ2VFRIRmNqNVUy?=
 =?utf-8?B?aGtUeW4ybFl4YXp0WEc1MElZc0ZXZU5DMTVpczd1Q0hJeTF4eVJTaUZVV1R3?=
 =?utf-8?B?OXZtdUYxZmVVZ0ZRV09QU3NjVzFQY21TS2hqMTlPaFZHVTVOa1pnb0s0aGpK?=
 =?utf-8?B?TzlLb0VEdHRsd0xwUW9ESjRWWjE0UUlpN20vU0xqODlxM2xkT3VDREJjcitz?=
 =?utf-8?B?eXd6a09jSWE0cWxPRno0SlFEUFk0Q3ptV1B1bkVhMTlkOHN0U0Z5NnI4blox?=
 =?utf-8?B?ZE9HTVU1b2R2M0g0VG15ajgwSFdLM1pxU1lhbHdNTTBqUkt4WVVHeDlHVEpa?=
 =?utf-8?B?TnN0dUZkbDhEcDVlR0t6M29kWURKVUg4SjdneWowb3QvTEd3VVVCejh5Njc4?=
 =?utf-8?B?amREbG0wTndtT3ptd0YwODcxeURTRWpDZXRXMW53VXNKZTYrU1RKL1NhekZU?=
 =?utf-8?B?aS92UVozWmIzcExnOTBuek9iRXNTQXI3NjdCSXFoMzhsUXExTXgrS09lMDJo?=
 =?utf-8?B?aytTVFoyZXlGNC9qT281cXNFU29ESVpFQTVRS2FCaDVLNXc3S2tEM3NqeDRS?=
 =?utf-8?B?SndmOXlXbXlDUXhsY0I5T3dFS3Rna1JhN2x6WVFWdmVWK2xGcFhha3BRUjFt?=
 =?utf-8?B?UkRwaytIbGt0T1FaNW82V25xR0RmL2dJU2lJaGxHQ3AwQXhtY1FPbTdFeXRS?=
 =?utf-8?B?M0lvdXFaZ2VnaEVybmdTS2tMTFYwWW1nd3ljL3J1aWh3YlNEQ0l4bDVtMFVG?=
 =?utf-8?B?WmVXUFhERW4vQmJDcmlkSWVTYlFYYVZrSUxpcXNFVnBiOUdEbkVXYmdvUXVw?=
 =?utf-8?B?T2VIaGxmdG92M1ltRnptbm01RUowWkgyK3hxVG1Ta2hFaDJhZmk1Q243aWZQ?=
 =?utf-8?B?RDBaT201ZU9Hbys2eEZ0QVN6VUpWcHdpR0N5VllUZk9Fb2k3eDJGdXo2ZHhi?=
 =?utf-8?B?YWxMUWVnRkN5cjdSRHpBcGlFRmdTWFY0SEZscEFYc3h6UEhzMVdWeVFDQmt4?=
 =?utf-8?B?eHRTTnkwWDBLRjc4RUNQUDJTQ2p6L1JOOW1xeHBxQWVYaU9xa2FQVkNWOWNk?=
 =?utf-8?B?M01FUTNaVkkzOEZ4eFd3MmZIMzFXNzdLaFZvRkptT0F3R1JwYkVpdERIYlcw?=
 =?utf-8?B?UUZheE1yT09DZ0JrbHh1R2VwbzFPNnBRT0hvc0J0UkJxNzliWEM5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78ec73be-b0c3-4e16-04a7-08de6fd2c88f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 16:20:23.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 INjQ/9IQH0NbVtSf6gwS2L++MRhe1qCO0l2FpSk59VXCaaPhdWUyvtsomzUa+ygSD/WG2Yvp0PlRSyiaQE27iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
Message-ID-Hash: XXJSQW2LYY7ESSX4EIGOL2J7KDEAGXEO
X-Message-ID-Hash: XXJSQW2LYY7ESSX4EIGOL2J7KDEAGXEO
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XXJSQW2LYY7ESSX4EIGOL2J7KDEAGXEO/>
Archived-At: 
 <https://lore.freedesktop.org/d5060b5e-08a6-4f58-8554-d2fb2ef108d5@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/19/2026 10:29 AM, Joel Fernandes wrote:
>>> +impl<'a> FusedIterator for CListHeadIter<'a> {}
>> I asked this a couple of times ([1], [2]) but got no reply, so let me
>> try again. 🙂 Given that `list_head` is doubly-linked, can we also
>> implement `DoubleEndedIterator`?
>
> Apologies for the missed replies! Yes, DoubleEndedIterator makes sense
> for doubly-linked lists. I'll add it as a follow-up patch since it
> requires a prev() method and some additional iterator state tracking.

And looks like I am short of sleep, I replied yesterday night (now you know why
I don't work at night :-D) saying we did not want to do the DoubleEndedIterator
yet without a proper usecase for it. Anyway, the point is I wont do it in this
series and file it away as "future patch" in my TODO :)

-- 
Joel Fernandes

