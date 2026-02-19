Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C37E9A04A
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 15:31:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F27F10E70A;
	Thu, 19 Feb 2026 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L17GDro+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 34B174342A;
	Thu, 19 Feb 2026 15:21:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771514510;
 b=LIix70gvl2rDzxcbShcor6k9BwKJE4+wI20VT/Vo+59LlRba6lu14sMqJ/j2cDRe10BxE
 q412KPVJwbUVaPwHPUXqm22Si2uUHZrEd/zazEazMx8Hiqdtzu+d5JUO/QifR5046AdN45i
 ClMH4ti/0QSr/LPJZadjUN/cOG4IOVIGh9rZZbywKTlm5f6RblgwY7ssh3WHL+Elvs8PecS
 ZfWk9IdLIa+ft2/1Fbu5ehuXVQl6/DcUVlQhifVpW0/WjqGSSK27EOMvAT98uQIVb1M2QaG
 qBucTSMyMEZwkBpHiHTNSAZtd3id2RGpR0kP3s+8UI6DLdFJwBUzYnyxVZFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771514510; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yD0dnDHA8vYXTf6JY8SWeHODLATrCEbD8A6hbYLqypA=;
 b=wjjV9zL2y+0lZFMB58ESlcwKn7PX56oIIIUzycFvhkrxO7gUyu6NBgZ53I/6zeP9EHE5r
 aD+RHjEkZj8ygstMiEBLfotFVcQMminlC9W1/yZG8a/6yhS7tK7qtJwr5iw5ghmkoM7pvH7
 60WNiS6+TS/SuPeSTcQcACzBRi1mc2JlEtOwQTvEB3YoGWvOXUqxKcyIHw+1NzwFKydXXXN
 zcabJqyi+MxufAe83ohqZ+9uA7cnR2bQ+NYTCJfDr4qf76Em2nrTf3VHdf81KeL/jxT441P
 ndThdmdXmPj0Y+oJ3cCbr1MgXIClO5dnXoC4NvGoCyWXQTuR8FoGjxE7oz5w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8F624430BD
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 15:21:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AFF3A10E6FC;
	Thu, 19 Feb 2026 15:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV+1A6Eg+QogM1Q2t1uzoueJ3uzq0ptQZ638gAWebYDl0pmM+/OPKLvyrpCDByOz94+mAqy5N9XgFfKRuK+wfA39sGQCjMPqmAUcFW5eLC7RyFaVMbqcZda/ylMsYwGkH3YTDCwGru2smq4Ml1cz7Vjya/Gjb5MxZsGGOHrNmocyUpvzyOsTYnc7L4NSZlIXZGmH8EXhCM9GROqkKc9lv9PkZlXtipSqpxVVbAfbGeK+eA+3V0QNSG25TxEMF1WdI5nn8nQyskYXCe4FwJ+PxhMEXbOqWlShH6W97XPrPnbRxrZWqQJJzMdOWM3KSk+USAKCcR3fqFqUdbUSTIklFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD0dnDHA8vYXTf6JY8SWeHODLATrCEbD8A6hbYLqypA=;
 b=vfPHkYQMSrfQbtDL0RarVufpkC3OobeexNs1FInXbgTcMn7vXdlw2pf8Xii56dpQi7L9qbNfRtoioMDlLEn6qflXcPdPeccUVHBy4o62rSmnq6wbT+J2amHrVZkgYSz9VuCbwko5uaLtIWv6Ajy2ZS3WAGqzZakWdxd5XmyWbU0aUhWW+bF8mRaVhK2wYeDi1ChPau+1iMKL/EVFbNMA/sLEUpx9Y4fbS6DGDrwkN3V126R6n6AhwETFVtc28YUgR+CnpyKbBQPZMnGXJNFtO18xFFhYP66mBKOTOP+u9AiXGvefkfHEa6KAG7GS2X32imWvtfvDr2i76ZHU4GpVbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD0dnDHA8vYXTf6JY8SWeHODLATrCEbD8A6hbYLqypA=;
 b=L17GDro+LsmJpSsmro6ixSg2sSJIWwY2rvSd2Vw7K0ZrnxRlGnTFI4cArJocPKtIsViwPSHP8srWLm/fcIuTxQ99TNcbKPngvFrRLLyCzr0FUD9OfblB7+7vSLIgMBRF7SqI4mfPJ6GAcM1swI+VqJV3LNrazHv+DdIPpJ1sJnajVCxGJnK7/pKDrh7lw8Hoe82ayPxNUUXw0x0Xg98VXtda+IBPaFF94fRoWnHmeO88JEeLMrgcdWyGOgkzQzOPTwhTA0/YnQpQ8SCpdThplxGOc78SXUPISz0iSsRS7A6uZoZMzSdNEQ2icgQo0jNqH0JxYOpaf9Je1SLHv/p3rA==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 15:31:33 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:33 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in drivers
In-Reply-To: <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-4-joelagnelf@nvidia.com>
 <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
Message-ID: <f0ef5d7f715d2f15829171b5dd23ae05@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:30 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e13d4f2-365f-45fc-1a17-08de6fcbf4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGgwN3hyV0p2dENCVnhYUWp4dU8yQmFXSEJWR0hxT3ZGcEVObmFjRjEvdkRK?=
 =?utf-8?B?RDN0bzA0SXpFNDRWTWE5eEx4RmtMUDhlR2R4SEZZREZGd0NPM0ZKbGRacGlL?=
 =?utf-8?B?d2Q3YXNEL3VLY2xkWE43Snphcm5nVkNYZXd0VlJYZFBCaEFXMExoaWZmMHVO?=
 =?utf-8?B?NVdxMkw3QWl4bnM1dkxDNlVrRnliUm5DU1Z1amk3ZnRlakF3WXdHZjhVRDJC?=
 =?utf-8?B?ZzJUaFl1cWRSanZCZGluUGxMQzdPRTg1eTdtWStFdHhHVklZeDhSbmwxcnY1?=
 =?utf-8?B?VU5HTy81SnBEUzA1MFNra2FRcEFHMk5XTEpwbWNubkZvSkJhK2xqZHJ4NnU1?=
 =?utf-8?B?L2Roem85aXp5amZLZU1NR1RyQ0xIMnFsSExlSFpwN0F5ZFFBT20zZ1d1L09u?=
 =?utf-8?B?Ly9hVXBFeUhTd3loTGRlaC9pckM3N3cxcUJKSmVDVTRCNGhVbDR2YVY4NmZI?=
 =?utf-8?B?SXczL0g4NGoxRG8rQStyL0tlNmNWU0JLUXE2bVVvYmVMaStSanBSN09MbzZn?=
 =?utf-8?B?bEZ6RHk1TEl2RUlMMTFsMzNMdk1SUXNNR01IK0JZNzBOcWtEci9lYjRseWVx?=
 =?utf-8?B?TkhVZG11a0FiUW1IaU5aU05jN1VGbngybndUSTdiVXZCWnkwRkFJU0lScnBw?=
 =?utf-8?B?aVhNdHNjUEpCeGpGRXJFby82WXQzUnJTcDBhRzZ3c2FLK1Bqek5oVDFpRnkr?=
 =?utf-8?B?VFlUVGJqV1pNN2ZPRVptRmRzcTRvS0VRelA5NEtyNngzaFMxOFFSYTNiamU4?=
 =?utf-8?B?SzdSWmFqSWxqQVhENDU1Y3FyZnRIL1hmK3pKSlhQQ3o0TlUvSFNwUUgralNF?=
 =?utf-8?B?ZU4yVnZIbU9iOUdRNy8zcW9QdEluNDYybERvWXY0Q242SFB0QU9Nbk1IcFN1?=
 =?utf-8?B?NG5HeThuMnpXbjJ5OFVpL0JIQ0VVTlNKakpHMXFPbWtJYUxqanl0WVI1bmo4?=
 =?utf-8?B?WHMyN1ZRYUhFMTV0QlVLaU15aGtuSGRWNUU3QzdvcENnOUlOdEw0TzZmeUpK?=
 =?utf-8?B?K21mTm9XZHY2NW5yZ2tKcDFMNHV2WTJwSFkzR1VyUVI5NTRnMXNUZktJVjNE?=
 =?utf-8?B?V01xcjQzZE56Sis5ZzRsMU9jU0h2NHlIVlMwSlNVTUlyL2ZaQWlNK2JYUlBD?=
 =?utf-8?B?UlF1aGhrVVZqKytlUCtyb1FqWG55M3prMmdjSytKaldxRWZwTlhEeS9tbTJk?=
 =?utf-8?B?QmtHMkJPZGU3ZGR1NkpBSVFVTW1ubVRaME5HbkpNd0JZdUMvei9pQjJZSy9E?=
 =?utf-8?B?RExmNS9CT0I0Ly9ZQStSQksrUHNDbTZzT1prWkxGTUJ6bFdLS3pIcmVTbGdL?=
 =?utf-8?B?U213L0VuSjV4N3RNcWF1VXdvVmhWZ3o1ZXNBR1ZsdmdWYlZTSW50NjYzYy9y?=
 =?utf-8?B?SldJRnd1UXpxQitlMXhTM3dxbU5Za2EyT2JGZU9Uc3d3Rjh2NHN5RW8rMmsw?=
 =?utf-8?B?ZmZEcmwwdmltUjZyOHZMSklFYVhBSWlDa1EvSWZmTGZ3L1hrdmVRUitWSDVp?=
 =?utf-8?B?bE5wNFZaVEpnREpIUVNrbXRHcmJaYnNtTG1JWG9ZZHNUMUJaZzIvVUMrYktC?=
 =?utf-8?B?dlhseFJtYnRzU3RaTkl0bDM2VnBMeXh2VFQyVGxjQ1hmcmNFUWhNY0hxUEJt?=
 =?utf-8?B?enNWUk9LVkxSZUN2S25CcE54a3c4bkFlNS9rME9Yazk2Tm0xdW9iaWpXNmxl?=
 =?utf-8?B?cTkrQ3F3U1JnSnM1dkt3MmNHUDJiMC9DOHlZVVFRQU93TStsS08wV054N2dI?=
 =?utf-8?B?U2E0NUpucFFRTWZuYm1rdi9QaStBdzFFUjMwMFhFcWc2cklJUU4zNnJZYndY?=
 =?utf-8?B?dHpIRERGSUJHOEhSWm4yajBqRjRqN3R4N0tXWG9LK1UrOThGTHdQR3U5TE5V?=
 =?utf-8?B?ckdRMkV4WkJDTm9wbm1DaHMvQm5GRlpVaDZYZ0dOSkdzVHZ6bUdaanYxckx3?=
 =?utf-8?B?NlFpcHg0QXIzN0RMUVBWeU1hZVV6S1Z6QnJ1TXB4NHJFSk9xMVc0TmM0d3pv?=
 =?utf-8?B?c1JmR2xVVDZLd1ZPMWxxR2Y3NndhbGpwbS9aVk9hUkF4cE44ZEszREh1TUJT?=
 =?utf-8?B?T3FVWEFmNStCSkhSTDIxUy8zNFdpYjcxcW1UVjFxTXM4bzQ0SG4xVmhGN3Zi?=
 =?utf-8?Q?usSA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXpxMjRPcXhQT0RicUtySU5Rc1IwVEo5Um9iU0h5M1ViVGpXL3FiTXNmRUNu?=
 =?utf-8?B?NEdEV0xhVW5PYTVRSG51ZlFITnVJVE9YbmxLWjgxQU41YUZ5VHJwek9rUGxj?=
 =?utf-8?B?RWVPb3pEZUZVRFBrNTlGOVVncmRYeXBZYUVwQUFNaG9CT2lRZW1iQUJGY1Mv?=
 =?utf-8?B?M0s1YTExVVBUSlp6Zy9EUzU3MjZXTERPWjBIME0xOHpTT2M3cER1U2plbk1t?=
 =?utf-8?B?MnQzc0RmNlpGaUFoOEdyc1JIRzFBYlhqcVpvNTRiTXlpYW1pdWVEU1h3SUQ4?=
 =?utf-8?B?ZEo2bHRMSnFxaGUyRTFmTHFRUnRVQ3NWTE5mM3ZjbjVUM3RCVTVhMS9NVkVV?=
 =?utf-8?B?NHREVG5EZnBCNWJTbWRmMkUvTG96UzFONi9lN0txeE8zbkRaNXVQQU4vSHgw?=
 =?utf-8?B?V3kvMVBmdDdNVVJWUFREbG1rUE9jWGNqRnE4MHM3d2NaT1VFUjdvYk1STXhy?=
 =?utf-8?B?WEVXeXhmWG14U3RGMHh4NUVSNGJIVVNjbWtVWlYvc0hTcmdENzNDTVRBaitH?=
 =?utf-8?B?QkZ2RVlQS1pzNUZSaHBuYVR3WlFuTlc5dU9GYnVMK1FqTlYvYnlUcDFzN0o5?=
 =?utf-8?B?TkN2ZEYwSFJoMEEyMHN4d0MyNi9iQnE1SUQ0Y0NRM0IxYTF6WXhyOVU5SFdD?=
 =?utf-8?B?dzlyQ2NFVmtmQkJvVW8wOGU0dGs0anY5Ukh6aWlrU0xvSFdSNnFMdVVNNUNH?=
 =?utf-8?B?K1VHdUcvWk9iZlIzRkVKV1JacDNCcC9USFZDL3V0NTRObEY1Mmtsb3VMbEVw?=
 =?utf-8?B?ZlpvTmNVbmdmZFp5WlZ5bkc0d3VOS3lRTVBjOVBleDBmSTVpSTk2RlE2eWp3?=
 =?utf-8?B?QnEzWGthUlFKbmp3VEI3TUhLM2daUmRwUHFWZG82NXB4YmM0NFBaMEFyRG8x?=
 =?utf-8?B?enR3NGUzbHZyVTBKOVpRa0doeEwxYm40Wi91Yk8rVU1CNmp0ZXQ0bEhXS0NL?=
 =?utf-8?B?OEQ3b2pSVnJ0cUFkaTQ2eXdTV0lpaVIzdGZvN3h5NTN1UStJTGlBYTlNS2NJ?=
 =?utf-8?B?R2ovZFZVOE91aTlMdnJzbmdxSFU2SkFrQmJFSFZ4ZWdSQ21DT3EweHFSS0tZ?=
 =?utf-8?B?cVNvR1V3cUxhTWhpVmpDSDArT1M4dnpDMDhaMmhBbUZUdWgvMnEvdjg1bGIv?=
 =?utf-8?B?bGs4UFo2RzkrNTZUOFFNcitxdlQ3NkZ6M3JiVW9VZXlvdjVZMTUrVHVJT0FI?=
 =?utf-8?B?R1prNitoYjF1ZW83RlJDZmxkQnVtaUNqT3dnNUhWb2krRGlIbERsOGJjaVUx?=
 =?utf-8?B?RlVOU3BnaDJmUzFqVVNKeXliZUFKdzR3SVVzd3dZNHpZZjVpR09LamMxeGVp?=
 =?utf-8?B?Y201R2hFanZNV09xY0dCMWMrbXZ3L0V6NTdFMXdWRE1xK053c1VVVGN0ZTRN?=
 =?utf-8?B?bFJEcWlLdXYrdk4rZHVaQWgyanJuNXFjYUpZNnludWgyMDR6eFp1djBTQitu?=
 =?utf-8?B?bEJQLzZra1JCc0c4WlRFdURvWnRrWXVQOXJOY2hDeWlUdjFsa0pQdVk1RzV2?=
 =?utf-8?B?bUtjWmI2M2UwUkp0RWN2OHJaVDRuRnJISnhqL0dmaVl5emFJSVAxVzRJYzBY?=
 =?utf-8?B?VXh5RTcxTFQvS1FpWHUySXlPRDJPQTdHeDRNSGd2TXRGc1drVW15a2pKek1G?=
 =?utf-8?B?MkQxdlNYd254aUVQeTZRS3g1TnZpbkorYWxoQmFDV1BIQ0lnUjNWYlMzOFNa?=
 =?utf-8?B?Sk0xVU0xWS9kRUZqMng4VmR3QkxXSDZRSFJKOURFN3VVemJqV0hYL3FWaDNW?=
 =?utf-8?B?TXp5RnliL0s4K2hmVGoyOEphRkFwTXpIZTRmNDlRUG4veGZ6cGVsb1krVTM0?=
 =?utf-8?B?T3JuV2EySURUQ3d5eVhWVzVraVdZdS9mNzBRUVBJdlo4QnhNYnpVckUxNmZW?=
 =?utf-8?B?eXBYRXN1K1FwVDVqeXZQRWFyMHhOZk5rcHBhbFVBL0ZjUDI1VjdSQTFsUURr?=
 =?utf-8?B?VHhGZWhWL08rWXBTQ2QzbDRMbk1RalYrOWQ0L2hJUVpSc0lIU1lWVmNsa3Ix?=
 =?utf-8?B?UkpEVk9OU3ZJZ2lTZ2s1ZVZ5UTlvdjQ0YmtBR3VBcDJpSmJaMmNnblN3WG1i?=
 =?utf-8?B?WWdWSzVhaFFleEZnWU0xbmpBVk9Yd2V0L0JSQzJjaEN4a09LYVBqcXlEbHNP?=
 =?utf-8?B?V2hpODRZSG5pKzVianc1d0IybVZrbktPUW9jZWVWdUlCenVpRm1GUW5oNFAr?=
 =?utf-8?B?OHErVGJlRllDL2Q2ZnpzZzhMUFVzZlZOUGk4dm1qM2puYWk5aUsxRnZFQTli?=
 =?utf-8?B?cWI0cFNxZmV2SWhYRzYwQmdwNXJrWkx6MmJDWXN5TE55c1ZaN2haL1VLZmEy?=
 =?utf-8?B?aFk2bnZ0V1hCaHBGNHcxdU9FaXVWbzhMSE9aVGxvTW5pM3puR011dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e13d4f2-365f-45fc-1a17-08de6fcbf4fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:31.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pM72rdYI865MixnJ7+eYHMvADk/V56JYkUJHY9b2ggjxYzMshK/YkhbdMgI/Y8VjyF2SfEpxhs2RX4JL7+8pmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
Message-ID-Hash: 7NXPXFRD56Q3YHWU2WWV24PJIEKUPGW2
X-Message-ID-Hash: 7NXPXFRD56Q3YHWU2WWV24PJIEKUPGW2
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Koen Koning <koen.koning@linux.intel.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7NXPXFRD56Q3YHWU2WWV24PJIEKUPGW2/>
Archived-At: 
 <https://lore.freedesktop.org/f0ef5d7f715d2f15829171b5dd23ae05@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 19, 2026 at 11:09:42AM +0100, Danilo Krummrich wrote:
> > Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
>
> This Fixes: tag seems wrong. How is this code move related to this problem?
>
> This should rather be:
>
> Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common drm")

You're right, the bug existed since the original move to common drm.
Will update the Fixes tag.

> Also, please add:
>
> Cc: stable@vger.kernel.org

Will add.

> I also think this patch should be sent separately and go through drm-misc-fixes.

Agreed. I'll pull this patch out of the series and send it separately
targeting drm-misc-fixes.

Thanks,
Joel
