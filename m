Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775ECD2FED9
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 21:04:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1913710E5C7;
	Tue, 27 Jan 2026 21:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEAs2DOV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 658D940ADB;
	Tue, 27 Jan 2026 20:55:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769547314;
 b=q59VeW4bi4Ua3BK9JyZAAU+6pvrScgjxAZ2eNExHEUEuGtidv6UpdOFY6XaS8/N0JZDOx
 Mitd593XhGhOfA1tCrV82YxfsgL7PonKtL/Jh5Mq34HYpWGq6qG5OduVBewz+iCUgmgKoNo
 RVUzm560m5xzRQWpiYbBMXsWdK2KZfleDXUSnMQjbpEsMGZMiJ+jRs1+SzwrPhbG/GL+5Ae
 jyHoTHuWKwwG9r24QoiO7AhP3/qc+L4sY+/tF89mMiQaPcoIVWHc6lkGPr8ERzcJdM0inTv
 IZ4y/W6ac0FMhC7IoEiBMnl8PkIRkAHIPTxp4SPLkYp3Qc5cpRPqF+pNMfpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769547314; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
 b=pyMiqmzgGapcDKXKLa+SRZQJLfOSTV2/HRg97CXt+IvKwZ4CZWYAh6Cisy4TlHZj1Vgg/
 KNr2HxcIdxCRtfuOiAofSJrCvwVMXVGyM3wZoVkbM369VoWI2h6wq6tlL3TK8ui2Zm4Sf/G
 u0SITYp/FLbd+KJRSlYTWTDoQqc4PSd3vqVlIhNRBqZMuu/zl7mio6piJrIiyWgkjp5R0M3
 FPO7RbEQjEIpfN9g+MVXMDEv50fUeUw8/AtOzdAogaayaaxnIg1KuHBk9UJid7rP3dgy5Cp
 RWV+jhF4Gcdc6ENXyHmfV/qvq97bJlAw/WONpTON7up9iwhno3yxT3sDXEqQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E289404D9
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 20:55:11 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8414810E170
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 21:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqqPsAPqMgJKehUdk7ueC2V9fbl8mKJdCDqQYJwD4+D9bVwfD7SeA8iOLapAxLradx2M0EXRqNeLytlJfcerVQSu0RnnHgpLRf5wY10O5VSlRJ0W8soXfNPlAoREn5VNUsQHL0OoDs63TAI0TMtH8S/S1cwZeO48DsVVQHWf6IrFASK0wl/irUoXeNFBjFdrM5z1XA/iZMPWiXOeN9LHvaEWQJeWiSQKMeyAp/Xh9ZZl8+SuflmTzuiXVCqmofdGFAJ0+jl4o9m8YddR8NmDuaSGIwrMsambChLQRpDSXrbjORnVcRgnPtZBVcnr7wLGIB9ZGzoQqoPJuldgecG36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
 b=YjqCWdH9Qn/FWhBWhCRgmd5VhZSorJVLDYGZjCmHcSCBBqUxwRvV0PscZ1cNhcLXiQFMYggVhkMnND66HLUwWyn3dt0yuiH/JQOuRo73uX50fkQ6eyS8mz3tbt7T4hY7LutbA5qQZ4t+HcD01VCshSy+dJ8W3hEYwQK1JKZcgwpP0jOvP1w3wpGaM3GbrJ5+Ppx6unmwdyz0dpC/0e2A5OxBb9Cisf2xOgzE7Vmt0Khy4GbnJBujzwJOecJ8u39Gp7AN2DB4fwNdmr/SUSI7EVlWx4y8mMuKuyc4Ijy+FOydwAtX3VmSxWkMfHFSKxQTG06X9qIoe4xIalH9XZPvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
 b=hEAs2DOVu3xuGiZPigkzRPY2d6gq1pWg/Tzpyl7GVidHgFP8bq9fYlR1Xe1uxez7bcKih9QYv/mBeUcahwJ+Z/kLHzZxkqOTq1Am2mdyGhJWSfKdip0r99q2Uccha1aqHpOy2uR+aK1Tbx+QxGC8hPPj+GY5YQn/DAJGuqXHlG4trOH2k6ONxKxkOVpqxYe4IUXxDGKrpo2OH9D+ZJ/ozsRSRxRBLJBbq1sXBCzkczGdFDBWLgsGGgxOymnWrTrb/PYyRh6zNtaSYrtGXhjvH2u/b6P6n09yslPpamkb3E9aA0aoNTAbLNllvdfAkNkM77q+UUBnjcLZYS8FxVwlHw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 21:04:06 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 21:04:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
Thread-Topic: [PATCH v5 1/8] rust: pci: add device name method
Thread-Index: AQHchzIlEBxzvkLqKEeU3XNB5ViborVWNSeAgBBdZYA=
Date: Tue, 27 Jan 2026 21:04:06 +0000
Message-ID: <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-2-ttabi@nvidia.com>
	 <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
In-Reply-To: <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SJ1PR12MB6098:EE_
x-ms-office365-filtering-correlation-id: 56837453-29ab-4b63-92a0-08de5de79bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YnRCc2I2OVQxQTA5MHdGTitaOVZvTlQ0L3pLVldPTGw3M0FQcXE5cFZaQ3kw?=
 =?utf-8?B?MlNmVWNEN21GRG9vT2dweVE1Q2hBNUM1dlFKWG1qZFFtbXRnSTNvclovQ01a?=
 =?utf-8?B?dkg5eXc1V0dZT0p5ai9ZMU5jYi9PY0lVbjlINzdEN1FMVE93ellDU0tqQk5j?=
 =?utf-8?B?YUhGc2dlNVZmSjdNNEd0a3JFT0JMRGNOQjhFcEZaV2I5WXNQZjdkL2JIQjZk?=
 =?utf-8?B?QjlQRXF5ZU1QekFGcGs0Mkx1VERVc3c2ck5xT2c3WVR2bGhKNmw2V0JXSXpk?=
 =?utf-8?B?NmQxNHlyblV6cElKWFR3U3NhZW13cU9QV1p1L25GOWppbjh6ZW4zcUJKNFlz?=
 =?utf-8?B?dGZWTHhZZFcyMG44akZjejhrOEd1OEpwTXNHUndTTjVpbmtmelhBbVJpS2NV?=
 =?utf-8?B?VUtKYkloNXM5TENNVWVUTWt4TWNHRkd4a01keittK0djY3BSVjJNRXBxUjBp?=
 =?utf-8?B?SEFGUzJaczludC9UdGdTUVpZR1lGdHZMUGRsRTJlM0hlSldNY2VoZFJZbzQ3?=
 =?utf-8?B?K2pwaE1OYnVWSmQxd2NEWXRVTDNZc0FNOHV6WXNlOXJySzFTYlJiRTk3WGYx?=
 =?utf-8?B?TGp1eDdjMmRyejJVd0NsRGJRQURiOWVDRHlXMEJVVXIrR09FcUE1ZDRYSkRt?=
 =?utf-8?B?cVVNOVVNR1Q5aTlKZTVwYnd6QmpKTkxiaDRlbXhhUWpjTVFtT29mVWs1T3Rr?=
 =?utf-8?B?SXVIc0xXSnN5a3J3RU9UN3hoSC8wZ0g2M3ZsbHdFRyt3d0V2eDRyN2Y3SDBQ?=
 =?utf-8?B?eEFWY0lFQldTK01WTWhDUnc2V29ucklvMUNCalFiSEFaOFpHb3Vpa1RRUUF3?=
 =?utf-8?B?K0F5VGowMnhxN2hoaGxiZ0RkUXdyRjBRRVJjMjNzMGZMKzhKMlJ6MFRMbVB1?=
 =?utf-8?B?SWZrZUpCc3FsVk90MnNpWkhMbTdjNXd0Snhyb1dWamVFdWtrR0VwN3J3MmNK?=
 =?utf-8?B?NUl3L283NzFDVmJBVjk5VDhNb0JsSFRoQURpdGVHOWpsT3ArRUluUzN4ZGN4?=
 =?utf-8?B?Qms2bk4xaldEVEF5L3lQSnZMWW5qS1hlOHJRazNTME9NYTQ5aTdjY092Y3lV?=
 =?utf-8?B?RlhvbFZRWmdaZGhHQXFwQlZJN0tJcnJ4MHpnYUdWUkh6eDlndy9jZndsZk5r?=
 =?utf-8?B?ZFV1bENyVHR2L21NeGVodCs3SUF6OWUycVRoT01ac1RyNW1USjhzdGVENWNU?=
 =?utf-8?B?YXhqMG00M2hTM3RqcEE2YldIMGMwU0k4eEJwMDBaWU5BRUZTZVRZVlNFWmJy?=
 =?utf-8?B?OVFNY1lTNmlFMlFIbXEwV0lDYzNhUnhjNEgzMDhCVVRzRG9FS2RLc29MaTFN?=
 =?utf-8?B?YVNPcmE5NWlpcDJ6eHJkOXl0NytyV1BhNWlVUUltN2VtcXNPSGp2WkEydDQy?=
 =?utf-8?B?ajFZNVVuWlR1RWlVRTVmbjdWeVJydW1tWWlnM3BPNDAxa3RWV0RRMDNPeXZJ?=
 =?utf-8?B?TTc1MUxjcmxBT09hL216VGF3WXU1RXNtZUo2OHU0SzRRbGtOandPcjdjbDNI?=
 =?utf-8?B?YU1uWGs3aEZiLzRIUVhHNWlRdy9tcHpJczd5RHlVajRFdGt4ajhvbkJraXRk?=
 =?utf-8?B?K3RaeDgzclFDQS90WU9JSVhZK2lOcmJrRDlJVDN2dit3SjZhQW9uOUQ1VUdG?=
 =?utf-8?B?dFNLMWJXTzJmVlZOaktoTjNQOGFLMXRWYWpoWTZ0Mk5zaEhxcGFITFZoUTRy?=
 =?utf-8?B?blFIWjBETTRiYnpWOHllV2Mwa0hxL2xOU0hoZWlHMWpWa2RRRGNEQ2lPa2w4?=
 =?utf-8?B?K1RjeEYvR0xpeDEyL3IzbW1NcDhNVmw1bm5qM3ZQcitnNE9Ea0xGMk42ckFr?=
 =?utf-8?B?Z0lEZU9sdm1ncU5kNUVjbHpIVkdKanJ2Vmc2UzRNT2U4T1krWWx4RENsVklq?=
 =?utf-8?B?cFdvMlBhczRkOE5iVHRsV2JNQ0hLekRqaFdXejFWWFk5YlhwYnVyOWtMVFRu?=
 =?utf-8?B?Ynd0clRocTJZcVdDUjY4aU1rbWxTTHlDR2I4UWVubWJYMFMxUnB1b1JDNjFu?=
 =?utf-8?B?S3l3TXl1Y0VHaURSNHlheGlCMEphOThnTlZha1hkTDBtVS96eHAwQUl5NmNI?=
 =?utf-8?B?clNIZXZpREV4V1lXa2lnVktFRFdBNFd4QkRXUytTWmdlOHdPRHZ3VHQwKzBw?=
 =?utf-8?B?eG1SMmpRcFBvL0QwTDZOMVUvVG9ZSEMzejh1S2NHMVphTGl4TTJBUnQ4Mnpm?=
 =?utf-8?Q?JShuLJV4QDo51zRDBD8fvSc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGdyUTdlTlRzM01naEtVaHlORDYrcS9nZDRhMDFod3JVQmdWajE5eHNOMith?=
 =?utf-8?B?RVpNTVk5eldXQklpTmJaTnNIcXpmaUNkdVRSYVNoL2tYeUdvbTI2cmRTUUNO?=
 =?utf-8?B?ZjIrWmlFaGUwYTZLYWJaOXBFb2FMQi9XRTNCbWhqV20zYWNOMi84TFg1djN6?=
 =?utf-8?B?N2t4U3lkYXpLR24waGpKYUVXdXpVRXd3Vzk2QnVBQi9HTFUwRGZJd2RiVTVq?=
 =?utf-8?B?Qnp4RGpkUTliVVZFMWNxci9nTUV5b0ozQ1BuOUpjNzk5UlY0aWhRQjhBQnov?=
 =?utf-8?B?bVRLVS9wc2ZJVkdLeVluYnRjWkZiOExiWVFmdlB0dXhQQkRNRHpiNzlPVFBH?=
 =?utf-8?B?b3RJM1k4YzlIeGRacDBGSG5BOVhPZ3hTNHl5eUNnY0p1WWtMeFMvTkdIK2JI?=
 =?utf-8?B?TFZqV1BqK2dzZlRTa2tZdHE2NThqdHRrNjdGUG9HdUZCRm9QSlZSMmhMbmhi?=
 =?utf-8?B?WUNBNE9DWVpPZy9hb0hISE4yamlXQmJvamprZVZJMWFsNGZTcHo2OHk4NFdD?=
 =?utf-8?B?S3dDSXA0a0x2Tmg0eTE1WVcvTm0vWHlWUE5zTHk1WEMxMGZXWldkVVpZYXli?=
 =?utf-8?B?bTEyWWJCRFlTbDRKR2tlbTdyRnlyM1F4RlJtaFRka3lwZlRVR2lvVjVEdFQr?=
 =?utf-8?B?Z1d4M1d4ajNDMVpGQkYzbFI3ZnUxeGxvQ2YrU0NkZklUMmd2U0svTHAwUDNC?=
 =?utf-8?B?NUR0K1dNQnBYNDNIQWdjUFBVTy9ZQWdSRkRZUURmdENCWm5JalJmVkFWTjJL?=
 =?utf-8?B?SXgyeEVrK1ZrRlZvaUE0aEdnY2dMcmM1aXJaVis5dTh5YVpjTVRwWExIcUJ6?=
 =?utf-8?B?TDVMWk8zeURvK3NBUU11dWxZZmhRT1E0bXQvdThtQ3ViaTBDZmF5ZC8wRWFi?=
 =?utf-8?B?Q0NUdnUrK0VILzUxSzltaHdLdG9ZejZBRjN6M04wcit2TWRKNWZYMUhrVlh1?=
 =?utf-8?B?Z1YyWUhFVFI2Unl2azdRVUQyOEF5d1pPZlVFVjVSY1ZDU2tWd3F6SE1SSFZt?=
 =?utf-8?B?b2hibkt3ZFJ3QU1rcjFLUmdIK3kyRU80VVdwL1B1NTY0U2dOczVZWUVxMUV2?=
 =?utf-8?B?enNQRCtTMFhvakdheXJNbFBBdUlTdjZWNjVOUUVYZ2JtL3QwZkxWVFI2S090?=
 =?utf-8?B?OUJNM2dzaDY4Vkd6SER6MEgzMU52b2dIajVRcTFnT0Z5L3RYMXRpR0grWEFi?=
 =?utf-8?B?WVZ3aFNwZWtxYTBveFJsSU5mY1F3VVBscnVoZktMek52T2dUbUpMRmJNcFhy?=
 =?utf-8?B?ZG5RQnBnOUhUOEl4MjlmOHJPUGRZdEJpSDhaSkdiVVo1NTY5WVdRN0xseVNx?=
 =?utf-8?B?UzVvODlHbHR5dUliVm1SSTdnVkZtV1dRMTNDWVRJYjQxL3RldDM3alg5Zk56?=
 =?utf-8?B?OWdaWnVSdEZQNldhcGlqL2thTkpod0JuWVBZN0gxQ1dSblBORGpyOTZOSWUv?=
 =?utf-8?B?QTAwSHhwSWJKWTZCblEvdGJxZnFXUUF0OTZmQzhpWWZMVUwxU1JUbTV6T2pj?=
 =?utf-8?B?VVltTTFFanVjYlBDRnQ2NnpmOFVIdlluaXErczRqTTZMclRjWnA3SEdlNTFQ?=
 =?utf-8?B?TXFWYnAwQm5CN1dEY29YRmZsZThYMWh0VWhlQW5KcE12dGpLY2JWYm9wZmg2?=
 =?utf-8?B?WmdpR3dPZUZFRmk5RUVrTlZSSkl3ZFVCUjZPU3RTc1JoZVRXcmdwVmZJQXN6?=
 =?utf-8?B?LzVCZGhKOEQ5TXVvZ3BMSXZIMWkvOWE5eDhSZVZUTG9YVk15Qlk0bThuc05o?=
 =?utf-8?B?OXlHTUdROTFEU01ZR1NoMVJzdnprcjk3Y0QwT2UzTFpreFFacm9TVW1idE1v?=
 =?utf-8?B?Zm1BK0VnM2ZPVHBxbUtHbFhBUjh3ZU1OcjBDc0FnWTU3dVQ5VkxGVHJNanMy?=
 =?utf-8?B?dytmZ3FoVWFETzhnb2lLODJiNG52VlhKQ29nclg0Mnl0b0RJZXlLVm1QbStw?=
 =?utf-8?B?NUU0amM5WG1IeXFHMTArY0pvYzhWeTFqSjVZZW9FczllV05va24wcmcvc2Vm?=
 =?utf-8?B?Z3dXVzRlNGxRR1I0NkdwUW9mcTgzQUpMeE13UnhmRDJ5dHJoZlhJL05WMzJ4?=
 =?utf-8?B?V0VqUkx6U2wyS3EvOVQ4L3pTTkJnUkdOWStWUktjTy9IU2YwNjBMWDNsclhN?=
 =?utf-8?B?Q0l6c2QyRFI0MnV1cXMyODRyYXk3OWkzN0JRaUgvVlBmUjhlc0FHek5OREZh?=
 =?utf-8?B?TERtbEIrRTdUM3A3WmFsUjV0TGxOcFFOUjNYckp5T0t0R3RwSVBmaGZYMmFE?=
 =?utf-8?B?M3BkZEUySy9icGthQU9pVE04T1lRdnkxV3lJeDI2T0VOREd1S29uWjJzWVpx?=
 =?utf-8?B?QUgzR0Ztd2JRai9uaFhRZm5Sa0FIeXRFUTErT1hBS0NIT244clNIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D43A432E29BA5A41A1BB725B846A32C3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56837453-29ab-4b63-92a0-08de5de79bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 21:04:06.5398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UZKuc3If6vDSB1XpIBELEzArVCtePZ4OzLlc/uEJcDr6ghZyzz4xFxiRhlR7hK094EIcO65sDLKC0awRxxUQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
Message-ID-Hash: ZXJO75XMMZACEDQUTZWZPWXUJPI2ZUC4
X-Message-ID-Hash: ZXJO75XMMZACEDQUTZWZPWXUJPI2ZUC4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZXJO75XMMZACEDQUTZWZPWXUJPI2ZUC4/>
Archived-At: 
 <https://lore.freedesktop.org/04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU2F0LCAyMDI2LTAxLTE3IGF0IDEyOjA5ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiANCg0KPiA+IEBAIC0yNSwzICsyNSw4IEBAIHZvaWQgcnVzdF9oZWxwZXJfZGV2X3NldF9k
cnZkYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkNCj4gPiDCoHsNCj4gPiDCoAlk
ZXZfc2V0X2RydmRhdGEoZGV2LCBkYXRhKTsNCj4gPiDCoH0NCj4gPiArDQo+ID4gK2NvbnN0IGNo
YXIgKnJ1c3RfaGVscGVyX2Rldl9uYW1lKGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRldikNCj4gDQo+
IFBsZWFzZSBhZGQgdGhlIF9fcnVzdF9oZWxwZXIgYW5ub3RhdGlvbi4NCg0KU2hvdWxkIEkgYWRk
IGl0IHRvIGFsbCBvZiB0aGUgZnVuY3Rpb25zIGluIHRoaXMgZmlsZT8gIE5vbmUgb2YgdGhlIGV4
aXN0aW5nIGZ1bmN0aW9ucyBoYXZlDQoiX19ydXN0X2hlbHBlciIuDQoNCj4gDQo+ID4gKw0KPiA+
ICvCoMKgwqAgLy8vIFJldHVybnMgdGhlIG5hbWUgb2YgdGhlIGRldmljZS4NCj4gPiArwqDCoMKg
IC8vLw0KPiA+ICvCoMKgwqAgLy8vIFRoaXMgaXMgdGhlIGtvYmplY3QgbmFtZSBvZiB0aGUgZGV2
aWNlLCBvciBpdHMgaW5pdGlhbCBuYW1lIGlmIHRoZSBrb2JqZWN0IGlzIG5vdA0KPiA+IHlldA0K
PiA+ICvCoMKgwqAgLy8vIGF2YWlsYWJsZS4NCj4gPiArwqDCoMKgIC8vLw0KPiA+ICvCoMKgwqAg
Ly8vIEZvciBQQ0kgZGV2aWNlcywgdGhlIG5hbWUgaW4gdGhlIGZvcm1hdCAiRERERDpCQjpERC5G
IiB3aGVyZToNCj4gDQo+IFRoaXMgaXMgZHJpdmVyIGNvcmUgY29kZSwgcGxlYXNlIGRyb3AgYW55
IGRldGFpbHMgZm9yIFBDSS4gQWxzbywgdGhlIHN1YmplY3Qgb2YNCj4gdGhlIHBhdGNoIHNlZW1z
IHdyb25nLg0KDQpPay4NCg==
