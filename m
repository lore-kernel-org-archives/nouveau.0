Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638F1D2F032
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 13:54:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1610E587;
	Tue, 27 Jan 2026 13:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="knuTd+a+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E6BC340ACC;
	Tue, 27 Jan 2026 13:45:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769521557;
 b=cG8NqqSQqUnv0fJL6Y1z47440Su87oYr4T3sWKGjVYj7BNoBupDFjoEIPFjSWQq8BCqrc
 RV4TTFCfRy3wRY28d3M2JBLCD3Q5+cDfN0xAZSIg1glyR4BQz6hXIkVOUsL2AD+Mt0efiKZ
 V4nQtXewXI26qAeJgy3M/QZ3oEHf78Ysie+w5f9No5DJNbNQBQYRGtbbmnz0VwmkExprjlP
 Qr69mYFc7vKc/hUAmC+TOqJIfsCZOZ+7CN1yljuKdOsd6pKNnbEMbmR9/1/6f6LRDWozb7m
 mkzBtjv8pNiazrCFH7SX7okwv+FBFlNaxypHchE6qbvCRutFouEqwaYfic4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769521557; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fUr8mGSZnEKIkH2nyPMG7ASZAkdR4yDBf2ilcTfvBic=;
 b=q66AxPN3GCQSz4c3GJRLpcFnfzlm6Eq3cKdWV/BOm36tA66w7KqTjdnD3OCU6Rv34rzb3
 UFMqAYKiS0DLAaMSThOSsWor8OM1IIITjJZ+xqB273LWaI1KPD7/xi91iodzMvSmEsChiPj
 YapxRF7v+jQ0upjrHg/4ANsxXtAl6B1pu9Re+ZNnsSxbi2pFbtMd/rm4cG53ri1ITSwIAH0
 PT2rJL/g7MZyiBebMUBGG9vG/6BQ3Mg0fGqafjGS/fnHdn2NotJtsfreCb/wit6R6+xnf/+
 PE85QxyCuctvi83xPCpdsg3T2rIUGNL63gFv4PsXeMeiatKJ8RPVa9oOfARg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A4A8D40032
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 13:45:54 +0000 (UTC)
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022132.outbound.protection.outlook.com [52.101.96.132])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFDD10E577;
	Tue, 27 Jan 2026 13:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDt1Q4YHANDWxcX6QUxu2LvxxYjLDphmCdXE51erMQ7zMfRbDQQnALUYc1jzu/mbxdrQCd04MGt+hIReVDyzuIopVJSrZ4OR3twhBGMnFTXI+jmfVOy8v0wEw6dEGs/zp7+1c16/ukbelle7/aPJ9f6+sNJVlP3sS0m3J5XVr50u63b6P6Uz/O/U9aW6xJN6RxGU881xUgtV4DfpcqijL+tot91k4NXfT66wrKOADrDZuQPyu0F/9ziosIHLT/tVjsuUrmGmCBc609qSRzGcUjXhdMe90L8i1NMNMntaz7RfblPMWBKIJ4DI/qFPkgWAcZG4otm9SCS1oIgTJZ/KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUr8mGSZnEKIkH2nyPMG7ASZAkdR4yDBf2ilcTfvBic=;
 b=CC0rLeI22BOXbrLo5z/PJmhn0DnU2hkN5xw7KUbg9BGbIfWlMXl0dPaz2QOoVfMT1bXXP5UkN0wjOZDV8I4442APCFxkaFAtfYOQEzalquS6L+rq3W4QfL+wuYm+PU2lPExLXScjvczjfsClHe36BvhN/mJa9NjSH0dTgay3N7tlJx+n1hwXmr+GFTNG8EG0QXgRjGNbCraSlWrnD4zbxQTVBydmCuskPoUQ9jzm+MJaDWXjHQQTBwdfUgpqVb4nnR3k105jXAffMRa63cNdS7wNv/1LaagE3uGCguDuOA+weK+HQk6lUuBSECMmZJ/wT5arAeL1F9zOnLtZe3zuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUr8mGSZnEKIkH2nyPMG7ASZAkdR4yDBf2ilcTfvBic=;
 b=knuTd+a+Iq3y/ybKJJcd2AfvIA93DC7N8hT8Klw6cDbwzKiAczqfrPWA1bttIdaf0ffKZmM/RN8ZfrChp+7Z1AHhaKr10g7txcfE512S77ZSfLmkXf5f4+fmv6prTwPhtcWfglkGEHUmvA5qvvVDp6PUnhCfG2aozrcBzOB2lDg=
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 13:54:50 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:54:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 13:54:50 +0000
Message-Id: <DFZF89UDGXF7.22T2PKFSMTQ3U@garyguo.net>
Subject: Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for
 firmware parsing robustness
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a28b8c0-e4e2-4fe4-fcba-08de5daba417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGtGdVlhRGs4U2NrZkdEZ3dPU0NuZUUrUTN4OFlCUGFWUHU2MG8wTER1RzZ4?=
 =?utf-8?B?TFhqdXlnUTNjaExoc2lRN0Q3S09rTGs3cHhnTjk0YTRKSVFYbVdRRmp4NDdm?=
 =?utf-8?B?c29XZ1NKdDAweUR4Z2NyaU84WjZjd0hCLzUySkxpbVBYTWJGNjFmVVZhVmRK?=
 =?utf-8?B?czYra2Q5ZjY4VzVITTdKMlFWS2phcFhGZVFBQ0lMTWEvaHIxSXRIUkpiMUJS?=
 =?utf-8?B?ZXlqK1NSR3hwemhRTTJ0czFRclI0V2NRMzRLMjV0clNOOW9iL04rclk4ZDAy?=
 =?utf-8?B?ZzhYaFZZSzVDNERoTVBzNmdjSkRxMklOL3JPVDgvZU9FOFJ5eXk1NlNyVmtQ?=
 =?utf-8?B?UEpPcEh5RHJyR1JoVXZBNTJxSEpuK3J5TmZJdkJQZTI0dXA1ZU9OaEFrWURp?=
 =?utf-8?B?TjNnZVZYQ2JnWDIyWDQ5YWt2NjBpRFlmTHJEVGhabmtNSGEzb0VNRklway9Z?=
 =?utf-8?B?aUVTRkpPRytvd1hYVlExREp2VXcxRlZSVFVWMUhQWldzUVNaQkNVNW5rNTcw?=
 =?utf-8?B?V2Z4eE9pcncva0hFZWV4UGdsaXhIYWJoRTFDWHhudVo3b1orcUtCcEthcGx4?=
 =?utf-8?B?MUt4dFJiTTlLeU5sMzlTcFl3NmlZTXlyWkFLZjVOUzhkVEJPV0NJbDR5VFhp?=
 =?utf-8?B?aENJdzdlUEV5elBYT3UxbmpNcjNZbVM2LzByTEhpREtaaDZ5Ui96VzFoMFlD?=
 =?utf-8?B?MCtlN3RlVmFjQ3ZpSENRYXJSM2E1N1o1RWl6VURvdzJFYWhFaUZneVJXOGlS?=
 =?utf-8?B?blN2ZWdTbmJNcEhYRFNjbm1VRVRlcXRxcHB3dXgvekZMa09yVW43V1F3Yk1C?=
 =?utf-8?B?Y0hNZmdHMlJrMWNGeGIyWVBDUU14MzhlOTRvNmJscnQ4Z0s0VXNFaDZ4MGVT?=
 =?utf-8?B?RjY0MUhnZzl4MEUxbDJITmNHdFUyeFQveGxPWWxPbUZmaGxuY1dGS1dnV25I?=
 =?utf-8?B?dVhWa3lpc2dnNWJSUHdBZHZtMWpyQVloVm11L0cxT3FaVU95MVVRK1p2SUcv?=
 =?utf-8?B?UDJrQTFZWHNzYzVBQjAxYk5VZ1dlQnBZOVRLL2RaQktqK01ETExGb3pZUzND?=
 =?utf-8?B?aU1iRHhJWkljRmVUZnByVHNwWWNPK2NzU0xCeXRYVG1nNlVvK09NWERtbW03?=
 =?utf-8?B?UkZPU0ViaVFWa1dmOXRBNWYySGdjbDFXWTdaOStHWmNlQnpJaFpBeFBpb3px?=
 =?utf-8?B?RUlmWjBTdDVOck9Gais3R01hUVdBMmRmenFrSWtMb2duTW1EUmtlanZBaEpN?=
 =?utf-8?B?Umt3NEhVNHlEMTFpNjhOZWJaMExESFFuU3p6WWdVQmVheldYeGdhdFVLS3E4?=
 =?utf-8?B?VHo5VlJoUkRZR1ZaZlBxWGdvcC9WbDVhYTB6YjVnUWVIUS9nTHB4V2xVaDJO?=
 =?utf-8?B?Ylg4K0loekVFVFNjS0xzeWc2dkxPZW1oQ3NCNGNja0d3ZStONWlCeGUrdW5h?=
 =?utf-8?B?aktKU3hPbXp4dFJGS0NoL3NiZVNDcHpVbTZudGdYb2NWV2ZTVFpCWjlBQ3Zv?=
 =?utf-8?B?NUMxcVN6NWNWbXBqTVkxNmd3MGV6M2I2SFZ3VXVBSnJmaWZuMUduUko2ejE1?=
 =?utf-8?B?VERYNUExNVV5eGFwS0VRaUZ5YTkxUTBuYWVwWkFmcUNCVXcxK0RxS3hNa1Ew?=
 =?utf-8?B?YzdQL1JpbFJaYzVxUDQ3MC9udlF5V2xvU3ZZSmQ3a1U2OSt0OEJaTk9mMlZ1?=
 =?utf-8?B?VkVxNEN2TENVWHZ2aXpGZEM0OW5oOVBWSVd0bDQzQ0duMUxwQVZVMzZFTXFa?=
 =?utf-8?B?aDVseTJLTmpTSEFKV29PdGVqWVpVQjZ0REhDdksrRjRPTldoV2JnUTRoRVNQ?=
 =?utf-8?B?bm4vbTZRNG94YlBFUndoRmdXcGVuNHg1VjNxWjhkMDhBY1ZsWm8wZU5JS0h5?=
 =?utf-8?B?VklOSTdtWmU0VXdsOXNXdHkvYmlFQW1UTGdjWVN0enVCZzhDWGJUbVBHWTdw?=
 =?utf-8?B?eXprWUhGek11SHZlR3hoMGNBY3RTaUE0SWUrMGRQcTZqNlpvYVFacWtSbFVM?=
 =?utf-8?B?Vy9wazJVL1ZLOGpZUWFESEdHWXhSRHZwbHJBWitVZGoxMnMraTgyYTJVNDhP?=
 =?utf-8?B?SnV1dG9KSi83QkNxNEN6dmNyZmROLzVUQklRRGNrU2hsekdsQUx3K2ZVdENs?=
 =?utf-8?Q?wCFk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEZoVTJDUU1mdzZ5MlBRRWEwb3ZCQUw3aDBUdXpRbHFjWS9vZi9jMTRHWC8x?=
 =?utf-8?B?VCtBRzdoekQwclJZVlAzc2FqaTFWOVVtYk1udzd5a3pmRTR4OFVqeHI1MVMy?=
 =?utf-8?B?QzhXVWR6TE5DQjN2cm1LTWNDVVE0U2dac1hVSWp4NGx2WnRBK2E1cmJqM2Fs?=
 =?utf-8?B?VWlWajhvajRQL0s5NWdOcnlvKzZGbk1SamtxdjdtdG1xd2Y4Q09kQWRXc1pH?=
 =?utf-8?B?MlkwVmZxMjJEaEdaYm02dGtRWjlLYytyWWFucDNOMGdIWVgxMlVIb3pxV1Fk?=
 =?utf-8?B?SC91ZXZCUGpKdERJT2hWQlhyT1AwN2pzMVFZN2t3bURnL3RuNWZoVVJoNmR2?=
 =?utf-8?B?QWg0MmdyT0JjT1pNTFZlaWRCUzlwU0l6R3FIUTUzL2o1OUphQlYySkxnanpS?=
 =?utf-8?B?OVJJUEJ5RWhKSTFFVHorck1oVDdJbDFzYzFQdGpsWDR4L3lCc2cydURCK0dN?=
 =?utf-8?B?ckxVRk1FRGhDVi9sY1Y4UlVrOXFMSCsxQ1V4eWVZSVBLTVFXZWN0UGRMbnpr?=
 =?utf-8?B?WWEwUFJJVWF0RkxldURyK2o1MzNHQ2lCRkZlcWxwelovV0E5dDlHZ0NQYVVG?=
 =?utf-8?B?OURQYm9ZTjhhTk5yQ2liZHR1RUVqdDRUaXlhTXpQZ0tzalIrTVVjYjlmNy9j?=
 =?utf-8?B?RWFKdFNReDVWb3pPUjdNbjF1cGxVL0NJQlZoQVVKbFhTWFpJMkFneTFqeVB1?=
 =?utf-8?B?SEppbjMvS0Myanlmc29xSU14NDRIR3FycGZQODVCUUVJbmZHb0JmakxvK0Vt?=
 =?utf-8?B?U0Q0ZG1jdUtKS0pxOU5wLzhEQTNlK0tCTDVqMlhNS1VMakJNQVFDRXREVldj?=
 =?utf-8?B?c1FsVGF3WFNTWUFDYndacno0c1k1TkU5NmZ6blB3ZnN3dHNMaThUbmpPZzJ1?=
 =?utf-8?B?Um9GQTBtY1VBU3JoSWF4c3JRYmxjVWpnbmdOU2R6VTRyd1k1c2NIRWY0MGZ4?=
 =?utf-8?B?L3BhRmFEc3pacTRoU0IvK0JodUNFT2tQYkZHS3pFamI4azhmRG5NdlUvV2ds?=
 =?utf-8?B?Rkg1TlIxUGtORlZzNTQ2bHlKZW95a0FFMlozL0RUMXNTcmt0ZXNBNzhDY1pM?=
 =?utf-8?B?cE1qcmNKRjlHV0xqdHlxcUhvalA0TXlkQzZpZ3ovRldXTjJITWdIY2RPdjlL?=
 =?utf-8?B?b29nTUxuSFUzdU8rZFQzR0pFYlMyM0krczMrTkdKM3BNcDZlZzJld2twOXRm?=
 =?utf-8?B?anVXVFM3YVBZRURXaUNzL3pnY0N5alZLRnJxSVFrck5CU0RYRm1Kbkxtdjln?=
 =?utf-8?B?WjZWTzk2VjY4dFVaZW14dlNwdW5MemhPcHpJM1lveFp4cVUxMlI5YjBNTDhS?=
 =?utf-8?B?QkJDeHNlK25TeGN3MjdSTkN4S2ZBQmVBTTBCejlyOVl2UlFNS0xJeDBGOFdG?=
 =?utf-8?B?VFNHTVJYSUVwS2ZXV2xKZW5XSHFIUXNENUhQQmpuSzlzL1ZJUUNsMGdRQ3Zr?=
 =?utf-8?B?SXQzMXBKMEVpQWFOcHNZN0V2eXdkNzNQZWRZQkFQQjBibVNPcU55L0tndkYy?=
 =?utf-8?B?QnhVYVA0L3JxVHc0ZG9yVHlQdWY4NEw5QjNnaU1GMEhLS011cVpiRkt1Q0tM?=
 =?utf-8?B?ZEJBYjdUNG5DbWg5ZHRsdEhPWFBqZnBBMGRXR3RaN3BORTBLaTgvWnpnK1FQ?=
 =?utf-8?B?NTZ6RmdodFh4RURxbFBvQUk1MVlsTVAyUGxLQktmYmJQcnB5Rit0RG1LZlBi?=
 =?utf-8?B?c1NhYmp1WDB2SGsyQWdIZWRmeEUzT1B3U0loNDNUb2FVSmNnSFpwdWhPeFpo?=
 =?utf-8?B?MHBiTGhVV2w3SlBZNEg4T0ZwZGZ0NkdNb2JWQ3dCYjlvL0lGYmVGVlE0VkxY?=
 =?utf-8?B?ZXNKc2J2d2dDaTMvbUdOZGlmZ1VDMGZhWHp6OTJxeC9wYWJYLzJxS285enVZ?=
 =?utf-8?B?eFJrVW9yR29WQWlqaERYdXlUbEFKL2N0V2tNN2NadCtxQXM3REEyVUZiU3Np?=
 =?utf-8?B?aUZMZUxseDZqSVdTMGo1V2xtU3ZGMGJFb3FGR3B0dXRTbmhvbVdwQ2htbkRQ?=
 =?utf-8?B?N2F4MkhBa2RCRUgvTDJ4V1pUbzdNanEyYXhuU2ZpVWppcG1FS2U1c0JLSEt3?=
 =?utf-8?B?WEluWlpiTENseGh0b1JMZXhZOWd2bElocC9XanlGNktSQUdoQnpEeVJXOXdZ?=
 =?utf-8?B?L1YzOU9uNHZQU3JTTlBPZlRwQXhnRXBMRFU4T0F0NXkxMTJabWVQTU1rNnhZ?=
 =?utf-8?B?LzdWbExXVWNHSE5VTmpBeHJHeFdXMXVSU1hKd05GdC9IamZHZ2dyUENWd3ZS?=
 =?utf-8?B?TWlPRTBjUFZHUk5uWUpob1BOQkErUHUyN3F1cFVZWEd5Y2R3QVNUNk1lQ0ha?=
 =?utf-8?B?dDQvOFh0MGRucTJ0U3FYb05FdFl3YWZJUmZCZWFYd0FFY3FJdmxJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a28b8c0-e4e2-4fe4-fcba-08de5daba417
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:54:50.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U5sB1b/ceduO/kiM/WMQJ9tmeHUdE1qYa9Yx+c/E9+IFtw961kzpSpbvc1dJctKUsh0zsSDlgi4SEvSUY3wXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6326
Message-ID-Hash: T2WY4DSU6EL4XHFH3WSMUVT5Z3IJXHPV
X-Message-ID-Hash: T2WY4DSU6EL4XHFH3WSMUVT5Z3IJXHPV
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T2WY4DSU6EL4XHFH3WSMUVT5Z3IJXHPV/>
Archived-At: 
 <https://lore.freedesktop.org/DFZF89UDGXF7.22T2PKFSMTQ3U@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 26, 2026 at 8:23 PM GMT, Joel Fernandes wrote:
> Changes from v1 to v2:
> - Added Reviewed-by tags from Zhi
> - Fixed comment formatting nits raised by Dirk/Zhi
>
> This series adds checked arithmetic throughout nova-core's firmware parsi=
ng
> code to guard rust code against integer overflow from corrupt firmware.
>
> Without checked arithmetic, firmware could cause integer overflow when
> computing offsets. The danger is not just wrapping to a huge value (which=
 may
> fail validation in other paths), but potentially wrapping to a small plau=
sible
> offset that accesses entirely wrong data, causing silent corruption or se=
curity
> issues.
>
> This series has been rebased on drm-rust-next. If possible, I would like =
us to
> consider merging for the upcoming merge window to avoid future conflicts.
> Tested probing with GPU name printed in dmesg on my GA102 (Ampere).
>
> The git tree with all patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-=
checked-arith-v2-20260126)
>
> Link to v1: https://lore.kernel.org/all/20260124231830.3088323-1-joelagne=
lf@nvidia.com/
>
> Joel Fernandes (5):
>   gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
>   gpu: nova-core: use checked arithmetic in Booter signature parsing
>   gpu: nova-core: use checked arithmetic in frombytes_at helper
>   gpu: nova-core: use checked arithmetic in BinFirmware::data
>   gpu: nova-core: use checked arithmetic in RISC-V firmware parsing
>
>  drivers/gpu/nova-core/firmware.rs        |  3 +-
>  drivers/gpu/nova-core/firmware/booter.rs | 22 ++++++---
>  drivers/gpu/nova-core/firmware/fwsec.rs  | 60 ++++++++++++++----------
>  drivers/gpu/nova-core/firmware/riscv.rs  |  6 ++-
>  4 files changed, 57 insertions(+), 34 deletions(-)
>

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
> --
> 2.34.1

