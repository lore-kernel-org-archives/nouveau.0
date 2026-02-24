Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6620EEC2B3
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 00:32:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB53710E46E;
	Tue, 24 Feb 2026 00:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WPLPfvlR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7E4F4349B;
	Tue, 24 Feb 2026 00:22:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771892534;
 b=Vx3EWHLk9SRPZaiQgW5dc3xVOneV5cWsTOjygMY/9DQsq/DJ7KugVlTovKVjGj0cMYVzp
 OCUeiSy/gw8YXUpSBaBszVztiwOaSCi7yl0Z2xoNKGaOAEeZh8RrgCrrQEz7IZonNksqOoA
 Hs2uap5ipbSsa0GZXvPN8WTw6bOhTPJeI5LIzzVNOUYoiH878NCiTXrEKSrH5BUdpvjTD1z
 azG5z/CfJsz4knzMCocc0X3wbOX5WaUvgtWIWArLLszTveStoEn+/TN+6UDu444HNuFb7P5
 VvM5uOtKAAeHuzeMLgb6tqzUyYohSW36cgJUkdEGWLEamXtqVLgj01L6426w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771892534; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vLy5BXBvJ8A4aJ3Ep1S0qKKMpGpgQkQM7vV00nyULGE=;
 b=s8+FRHUKJllMCbWF6B07KYRmRFTXQl0XCggoGmlUf7xgHccemc5F6C7T2z2yJ1KlfNXeF
 wEwxChp7XvLGqd2vNqo0vduJUYhhP/DiPD4UZVUJGSlyYVxef3OiFE2LWFgUc9XqAgIj4h0
 xLGQodJiL9l8xfrUi0pSYjZyy25M3C7RBW1YJb84YyiuvBU36ntwVsr0dnMtkzG1Y0iZBb9
 hMZAvIGklmmpY86peonU+tuzIda93Y4FXUqXzNCI2OntbafPGJrvidJGraSSuD5S1Wc7AeP
 r69blNeLsNtdRUGi3/1wp1WorKyTGeiOF6bVJFyYrhzfL7DEF3a/aM8keNdw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BE06B40ACE
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 00:22:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72710E468;
	Tue, 24 Feb 2026 00:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNcWV2EIY0kzNXAu/f+4G5bF7c3ILPTSKysCsARvrHtywT1kgvVMmBk1Qg+CrH8FjnNfbJrWQxLxf29bQBJoWOQq0TVPWTfslfIh2Ln5ZdXnuEac0c3N42Y2KSOwQX7jd5qt83/iM7cTnvPgdVXIoB/dzemw78cTBza7oqM+XbMc0z0R4QRFr/b4JEGdYQ65tsCCgKWdA+rWCJUxhLAmsNjAB2qdDhA5z6jHoKrD6LC6/mJ5xv33B8BfrSX6SQHf4gKSxT2mDaXm0j0IdgrBtJj8jBz+lTP3kih7FrVdzuRMrbZDz2CRnvZrhdOaupyWjj/eHTsrxrvxSmh3k3Ax/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLy5BXBvJ8A4aJ3Ep1S0qKKMpGpgQkQM7vV00nyULGE=;
 b=duIO+xxIfuzAQ+06SVJAbV6OKKCDFf8+zaLGMowyVOBw8se9tDRzWddszVu8GLRODBcFP0XDkBMjTxa5CBY183VhWUCCJPqxmSRBfXMLh/eIeY+Zd1wsYYupGPzKgNVhSn6M2Zr/sYEj4rgwETgpRsi+ODs/RjDuCHtENhFfdysDGqCv82rFt5fID0A4JV1L/I8g1bNL6A/pFdz/1fUFIdRCxo9zLFbhoQKZoIXVGeVbmz3m3vxfJH/xAJAoT6qsYoOeS6jAqJuGUqfBUm0PEwS+br9CXY2FbEXpbU9WUkB0Psn8cs1Z0N6SRmpuobUFxAdPWYgnPJU9A66s0BG8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLy5BXBvJ8A4aJ3Ep1S0qKKMpGpgQkQM7vV00nyULGE=;
 b=WPLPfvlRcKpR29pWyDVRZBdxoFAxescK3lSA7cJKDGtAjI8/pm8Ib1lpdPBUlyvMgQX9W2cXwZHnjlrApAehSOcJt45UEjBTbo8FzPmfwyvEcHdxl/QNtxDmv4yeO4RK79EwFGxPSCWrljgqD8WCxkuyyDUSREVp4bRd/ROUHFhHMpjJSxJDdFomK0TXIHDzpPYk30c7SG4R931Hr89dZv+NCNvnrlMYuVkmzKq8boRxZqXqfuitgv0LO/rJVbSi7hpGmot1kYMcLUlSF4mB9ABCpPTxYK9g5xeCBz2Tkc/dMM1X3lOeUNFcCDtTlZxXv6gKH+lmCFH0olGyqfzajA==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 00:32:05 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 00:32:05 +0000
Message-ID: <90454ed3-5ac6-4169-b849-e7ce18fc68ae@nvidia.com>
Date: Mon, 23 Feb 2026 19:32:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Alice Ryhl <aliceryhl@google.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <aZlz49VtPA0JbEGx@google.com>
 <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
 <aZwgKcdEnSHyuSLG@google.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aZwgKcdEnSHyuSLG@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR19CA0068.namprd19.prod.outlook.com
 (2603:10b6:930:69::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbd121d-2c04-47a8-820e-08de733c22c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFU2WmJnVklYbzdabCthWHhMcktFN2llRlAzZW11WFZJZ0ZhaDhGY3ljNEJy?=
 =?utf-8?B?ZE9lUUVLTEdhak9JbEx2K3E2WVN1UHM2MWpSVm0xeW4zUVp3SWNvMVlZelVC?=
 =?utf-8?B?dU1DQUlwd2dFTWVHZDM0a29rb2luakszVy9uK2FzZkpPRGFjL2xKYjVxdG91?=
 =?utf-8?B?ak45SEozNzZvdXJWVElMY0c5QTAydFhTNU9aZUFEZnYyMDF0ZDhBQy9DVkg3?=
 =?utf-8?B?WmRua2hBMHc2bUdGeTA4VXlXWGRCNEMwOTRKN1pCNExoRXZPMTBjSTA0WjRY?=
 =?utf-8?B?UjFHN3VIRVVTdkZ4OWl0MXpMcTBoNHFRaE9MN3F5ZjB4ZlFRUkI5eTZYYjBY?=
 =?utf-8?B?UC9DbjRhQS9RYTRzZTBXSnJabm01WGVJZWk2TkIvbHlqVDBQemtlMjBrOGU2?=
 =?utf-8?B?NWZpNU12SWg3NFQvWVJyRHVyUHVVb2VINWJWVnY5bU5BYVkxOU94VUxVYU5D?=
 =?utf-8?B?QmdPKy9aZWdvRWFXNTcyTW5XYllQckFiWlhSUGtSdTJxRHNtRnpHaml3dHBk?=
 =?utf-8?B?eUVMeWNWNlpPakp6ckdmVG5obkp3REUzaXVwR3pBNTdhbTVoNTFpa2tET3hr?=
 =?utf-8?B?VGN4akM2amxHZ0R2ZzlXbC9QWmo5cVlxT2ZQZ0RoSERYVWRmL211UUp1M1pa?=
 =?utf-8?B?NHFnTXlOWDFBVkkvclRoOXcxRVB4ZlJ2bEtoQkVSdUdwcUs2aUJ2aER4b3Vm?=
 =?utf-8?B?QTF2d011cHRFcnk0RFNNWVVhMElPN2lnYnZyaDRRT2t3YXdGb3JsMjFUTTkx?=
 =?utf-8?B?ellGc3V3WnAwTjAzaDBlaDZxcGJkWlVNUWdJT3Y0Mm9nOUlxcDcwdy9ySUV6?=
 =?utf-8?B?ZThXdG84a2NvaFpVZzlMclZNTWhQU1RyQnZ4bENjMUZhUWV3SlR1RC9QQWt2?=
 =?utf-8?B?MWtvN1ArTHhPNFJ4NEN2SlhCd04rSXpyZ3ZpOW9ZSWtkeVhzZkMrTjltRDZ1?=
 =?utf-8?B?WUkrU25raWR1TWNVVng2cFpIUWUrZ0k4WW9yZ0tlTDVjSjhiU09EblpLbjIw?=
 =?utf-8?B?aHVaRkRWRWZ5dUpVYVU5NTJaNzQyR1MwNHZETHpZbjY5T254NGdDVENDb2dr?=
 =?utf-8?B?ajVvK1BjL2N5VGlzMzhtYmp2ZEYreVZhSFNpQW4ya2RvY2F0c1cxTUV3N0Nh?=
 =?utf-8?B?NWVmUWhTWkJpMDBFUHRwbmdDUFhTeHhIWExCdG93M1VKcTZOSjRPMHNyMXZX?=
 =?utf-8?B?ZThISTJnQk1zRGdUTWpBTmc1dkpzMFFENU83WTRncGlaSDErRE9yZENUcG5m?=
 =?utf-8?B?bERCQ1I5UVQyeVhKU3B4K3dJc29pUE5KelRyUFRZNCs5Rkg2U0R2QWNhOFI0?=
 =?utf-8?B?QnBTTGF3dUpDblVNaWs0eW5NMkVsSnYvM2FJNXg4YTlER1RkY1R0RkhUb1RI?=
 =?utf-8?B?NnlaU0JTTDBsTXVpZHk4YUt3UVlhbmk4dXZReGpMYTB6SnY3b3UwUXBkSHAv?=
 =?utf-8?B?bFI5YU9CR29wZGZCNXVBRXRndzlJUTdJWm1QWEF0ci9uZlV5SGNFODBuRHZX?=
 =?utf-8?B?KzVVYnZRdHVkeGFORWYvZlo5MVRYUHo3WHh5cVpucWZEZ3VTMWxSSW5oTm5q?=
 =?utf-8?B?Ny83ZlZmc3RQK0xiYTgvQ2E5MURCYk5aOWhvUTJOeHlIV015YTlyckcyM2Q1?=
 =?utf-8?B?NEVGV2hmbjI4bUtkbk4rOUUrZlhmem8zamJ1Wml4Y0NtTktpektZc2ZOM0Fr?=
 =?utf-8?B?R2hiRjFPU0VITTEveFc1b0ZoRVNMeS8yMDZNQkVPS3NPV2p1SzFQS0htNytR?=
 =?utf-8?B?R1BtUnF2MUtsanduUm5LOWNUV3NyY3FzckZ5OGtVNkNCQ1llaTREQ21RTGhN?=
 =?utf-8?B?TXh4cklrcWlSRytQMC96b2VsbWVyOUwvUXZpY0E2L1FodjBKcDU4eENJUFZV?=
 =?utf-8?B?azVjZWZNRTJFV2lmVDYwNjJtaWp3RDZEN29TMEtMUDBUSUFuTUFoOXRwbWdC?=
 =?utf-8?B?bmxnMXJ0Y0NlOFJYRnZHbTVUVDNMWTlwNWoyb09zci9MT1NDVkJrQjlFdi81?=
 =?utf-8?B?MGtTUWE3SHZnR0NqenhqUGtpZ0QwK3dBRnNLdnhYY3Fkems0SFNVVkJ2MWFx?=
 =?utf-8?B?LzlRVEx4SWJnb2VHd0M1QlpMemxDeDR6K1FqeGZpQmNhT0x2ZS9XRG5qNjcr?=
 =?utf-8?Q?lr1Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVpCSFhjV1JpRllqTHFJTCttS2VXUE05OGV1WnJXMElQZ0g5MU1pQUIzQWsx?=
 =?utf-8?B?eWpGOUVqdjRRTlY3TUlZMGdvSUVJb0o0Qm9LdDExZ05pQ2IwYUxnZUJzZ3hG?=
 =?utf-8?B?dWtuY1VpdlAwWlE4OWU5SXhUclgwcXZOOXJMMlZtcDl4ZDM2ZnZBOGVyWDlm?=
 =?utf-8?B?L2NldTBOanlRdENGdTlZVldsWE1ZM3RNZkoxNHFBeU9iZ20zdjVOMVNHb3Jq?=
 =?utf-8?B?Nlg0VXZoeVdGQUFKamJYRnNhWlo0am1CMDdSZHBqME9nRGpsU1ZlaXJmczRM?=
 =?utf-8?B?aFZFckZ0ekhZQzNraUREMC9na2w1ZHRHb05odWxoamRBcnpjOUtPYm5JNWlZ?=
 =?utf-8?B?U3NNa1pPQ1lFSDdWamFDZTNGMXlpUHcrRlF1S21qdHpaaGR6Q2FoK1l3SGdI?=
 =?utf-8?B?aGt6aStvamI4RjRSTnIwOUJvVy9lcXF6Q3BaR2lsaUM0L2h4V3YydVJXZWI1?=
 =?utf-8?B?Vm1SY3pXekZwYXZ2QjNqQlp1RkxmaWRiN0tocGVZa0RzQmlpMkRGRmlTWElP?=
 =?utf-8?B?cTIyZVZxcXpzYU1yMUVFVXlBRWNKdnF2a04rcFc4TXhNWHk5UXhwVEpYVkRx?=
 =?utf-8?B?VnprVzNSOFgwNnFiOG5GTmZsTS96UmdIdDJFSkxlbXhvNmQwa3MxckhjeTly?=
 =?utf-8?B?L0pvdlIyRVY5cW5vZVduckwweEl0ZEtEQjZ3TUJDOGVOV05NTEZGYUpabDVq?=
 =?utf-8?B?RDFsazJEQmU0bFNvajVjWnZueFVFNTVqUS9QeC81VFhqWWFWMDQvWHlyZUVO?=
 =?utf-8?B?U01kanU4czJKeWx4cUJ6YzJET0cyYTFVNjYrdFpocUc1N0s5dG5Yd21CRE4r?=
 =?utf-8?B?KzdhUkM0cGd6UXNOd0RNM1NDQnJGRFc4WnExZHBLcmJEaXc3ZkJ0VG96MTNm?=
 =?utf-8?B?eXM2cENsNUVNRWpyY1lwVy90Rm1MSU8xRDFhS1hhSFIxUkZSQmI2U2ExTUt4?=
 =?utf-8?B?NGZMYnhRaUFKaVpzblVuSUNrelBvSko1RkljdnpHSDhtQ0FjRFllTmswUGdX?=
 =?utf-8?B?Qk5zLzQ5UXorWVh6aXorcGVpSndIbmNWTy9DK3BrOTZ0WkQ4YitZMWVWSXlr?=
 =?utf-8?B?NmZBYWp5eEhnRmlwT0hWRGcrU2h4d3ZYNzhhWVE2N1dqdG5VaTYwcGxCdU9I?=
 =?utf-8?B?QWZCRm9zT3dldDVoVDdFNXN0OWVjOGFQWmx4REVtd016bDRUMjBsZThDMkwv?=
 =?utf-8?B?QXhuRFYyb2U2ZW9jUm56YnVpZ2czVU1tMjhic2krWnJSM3N1MHU0ejhEa2tH?=
 =?utf-8?B?em13T3krQUgwallhK29sRUQyV0tUaXRsc09WdVpSbkhoL1FucXpqSUM5Zmts?=
 =?utf-8?B?OFh3QnByc3dhU1VQNVhucmFkaUx0ZjhOMm5PZEtJK1l1dzJUQm5QQVVqM2g0?=
 =?utf-8?B?c0Mzd0xHT1ZKNHdrUkxJUHV4Q0lsWWtaR08yakhRTkRiTXBQcU1rWG03NTc2?=
 =?utf-8?B?YUs3aUdOeHZRQnc3YVJKVThrWVlPQ1I1VnoxRVA3UHI1OUVrUUEzWnU4MjBa?=
 =?utf-8?B?YkFMN2o5Z2NZN2xFV0pQMitlV25NMnJ6VVVpR1UyRHFwSnRIQjRJVDRZSTVz?=
 =?utf-8?B?OGJYN08rMFNkRWoyWk9FdHZRSVd2VnpmQVltcGhjWnZYRTA3YysvaWtsZVI1?=
 =?utf-8?B?ZzBtSy8rZGJBSlcxYXRPT00xbkFKSFFaQURQMmtBS3hzSE9tVHQ0MUxycjBm?=
 =?utf-8?B?YmFNc0djSkpJQk5ETnk5bFJxR0NqckMvQlhWVHlHVUtEd1hBcTR6bnpHRk1y?=
 =?utf-8?B?ZERPV3pYamd1WUNnczQ0WkduWjlkbW5zTHNydjBVNUxWZnlQL0JYb0o2eEhx?=
 =?utf-8?B?VmJZOEhONWlHS1V1NktudGFhaDdOWUt5SklxeGtnVHhaNmQxTURoNUhHQitj?=
 =?utf-8?B?Q21YS3I3cXRrd0dHTjJ5THFnaU5VNC9MQlB0SUdpYU5TZWk5UWlLSllyZXVk?=
 =?utf-8?B?QUlsNmIvMk9RR0ZXRG90UzVnWDBtWGdLVW9KYURQLzhMWmk2cSt0am83UG5v?=
 =?utf-8?B?K3Bra202alRnYnVIWTkxaTZqSXNHaDVSMW94MUhtbS8xVE9rR1lCTGxDQnha?=
 =?utf-8?B?Z2lPaWsvQmJzMDV5U24wUGhBUFAvTGV1d3pKbC9GdDZMbHZ1dUlwSFExUmk5?=
 =?utf-8?B?QWVCYnlnZi8zaXUybUM5clJScWd2TjU0S2YzaVBqRGpaZXFidHRMaEhpWlFN?=
 =?utf-8?B?aG1lbUp4Q0gyZUYwcERTaGlZUGZIc2haRmVhaW92S3RIcFBkdEh6N0lvZDRz?=
 =?utf-8?B?RHF5U2grUU0vMUF0dERBd3RtYUFCSjZqandCTEN6c1NrVjQxUTEybDJGQW5o?=
 =?utf-8?B?Qmt0ajdNeHpCNWNwc1UrMmFFa1Z2dTZ5dk1hYi9PSElkMjVBQk5GZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dbd121d-2c04-47a8-820e-08de733c22c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 00:32:05.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KjzCQeXEoRIwa3vDvrWO5t7pMVY9Bxz/VnfgOB32apr5578fCsg9EDWG9dbuSewuItxS96cKDE2URmNnU7Qn5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
Message-ID-Hash: KWXGF4J45XPRY67EQLTONCFEUHN2JILD
X-Message-ID-Hash: KWXGF4J45XPRY67EQLTONCFEUHN2JILD
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KWXGF4J45XPRY67EQLTONCFEUHN2JILD/>
Archived-At: 
 <https://lore.freedesktop.org/90454ed3-5ac6-4169-b849-e7ce18fc68ae@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/23/2026 4:38 AM, Alice Ryhl wrote:
> On Sun, Feb 22, 2026 at 07:41:44PM -0500, Joel Fernandes wrote:
>> Hi Alice,
>>
>> On 2/21/2026 3:59 AM, Alice Ryhl wrote:
>>> On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
>>>> +impl CListHead {
>>>> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
>>>> +    ///
>>>> +    /// # Safety
>>>> +    ///
>>>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>>>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>>>> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
>>>> +    ///   for the lifetime `'a`.
>>>
>>> I don't think C vs Rust is useful here. What you want is that the list
>>> is not modified by random other code in ways you didn't expect. It
>>> doesn't matter if it's C or Rust code that carries out the illegal
>>> modification.
>>
>> Yeah, this is true. I will change it to the following then:
>>
>> "The list and all linked `list_head` nodes must not be modified from
>> anywhere for the lifetime `'a`."
> 
> Ok. Perhaps you should say that it must not be modified except through
> this CListHead? I guess it depends on whether you want to add methods
> for changing the list via this API.
> 
At the moment, there isn't a usecase for it but I would predict we would want it
for other such use cases, so yet I will change it to your suggestion to
future-proof it:

"The list and all linked `list_head` nodes must not be modified from
anywhere for the lifetime `'a`, unless done so via any `ClistHead` APIs."

Let me know if it looks good?

thanks,

--
Joel Fernandes

