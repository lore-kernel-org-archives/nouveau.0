Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1E0D6CFA3
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 19:00:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6E10EA3E;
	Thu, 22 Jan 2026 19:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FqROvH47";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB936404B5;
	Thu, 22 Jan 2026 18:51:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769107888;
 b=IqOruuuFwmNMRiM6cyhW67m+tySJAZAqePX/+CB3qXGRF/CJEzgbXQNZ0TW6xJFUej9rm
 xt3IIXGjrRkLGal06yKkbu2K5Yz7Zq6NPRj7h5zUAbh4NARRkQ/N4OVuBc6dqJvMjngHfvK
 NCmRL6SXdOiKpL3HLbaraey9gX3vwHNTQNL1/5FiTq43No3yNrKc7ddUTBQcv3BFq55Y0t2
 /5VqgUF3fbW1yy/2vmsvR+aH8qEfaxeM4BIcnczhV6hRrDsDXjtwnavwPnHQEeDGFRapGGs
 7qsqKPmJt8fLpaWM2ML7K4D2kcDvVRrwyK99mcitCDbbmPejoqhF8P8/s5aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769107888; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6MxGGIL42EL1qHuJM5AVMFgyZOPCgm2R0leVXmT3Auc=;
 b=of37HhUpA72S0elmpoWYzz7vD8SLo5ZZTO6j06vVzcg0Pa3a6oZZ3Jbrsr2zXqjSgU8JM
 oDu+YeRkc/7519MCHY2dapdjrBCEbsdYDpoqSVu7po3at6hiFXsEAF1LQ+KeJcd0t5QsnlY
 dCPomF3S66q8GU9VIXKBwUyzPaH7ChxlxLvXK8dERaiQsDH7tIBma2jq4cqO8IE3K7FRwIB
 VzS/AY+BC16zw4dyXS+05Xsd39N5GKjtIn+GPWHvqYDMt3Lg5rLOGMMIaueiFLW9MVItdCR
 xOHWXG9CjRY67ChzDcF8RYxKMA6Vv1gDosRZjoLu/ugAsBZlhOKREr/2IpwA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9AD7E4003B
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 18:51:25 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013036.outbound.protection.outlook.com
 [40.107.201.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A35A510E00A
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 19:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9twc6LXHgIezLV0tKoDxs+6ZbAjOA4SQte5hSn4LLlMTXd+X77C+12+w2P5Asl++buPIUfwBzCiARcoPMBoZVqdz93rEAleyaLAZb3R52zvEx+5Qs2kFI9TMUMOB31H5NGTJug45xHnXM0a8Qd+/U5JCWxvzfjpGRT513wk/8p9z6co2Ty7dPZcEeHSN+XRVUqVQxJEodEzSXdquamU5QH2QxASF8fCCxzanYrd0zoeJHMfjt7BHYLmalgItb/FaLzo4l3KZbZL8q998WKipYyROZgQHm4HYHhKXNBY/rmO9+yZhuRKXHOW+pqAAsv2LxzHdWSsWuyhSqMRh3DIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MxGGIL42EL1qHuJM5AVMFgyZOPCgm2R0leVXmT3Auc=;
 b=LLTuPO1ZNBTiLo3/cF/0vDsJGzgo/PeYIbCe7jYeYB2dqbB+UZGDUz0BfGpkQWM13Sd+h5zk3Uq8jQX/lBdQvyRDvmfK5Lbau0r7L6QhyUCbR1EYwG/2OghQXBwld30MEgyUylzfYFT5g7A5Z3hcnx+N/qCzN0FOfFH5J2bt/SpSdgXovvBrpcK8QoOwXMSaKzRyHZMY7gHeow5zDKCQw6yRCUbwn2mzkBA2hYWjSK0w3twRcpMBVDOThtf6O+wDUrRP9WLhZmrP6CeTpRiG+QF4+Rwu561+n/0GszvSbKorrim/TUcoPlt8IE8DkK29AzGg+2cY8tXk1T9sfBYznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MxGGIL42EL1qHuJM5AVMFgyZOPCgm2R0leVXmT3Auc=;
 b=FqROvH47/ABpriZQd5/3TT4NiG8wvozCwKTHuARAN2POsx/rze8E3oiUksfw7t5vLIEW95XnPqwJbfDpPcfgxkjxMM+0E4QEim4VTjPxBcObmw3cqd4Ca8M0xIy/noM6WN2bAgBWB62t4mYy2gbf1x9j5rH+XUoN0vHCKYpgp/3/64B1PAvXAFrG09VV9epG6OjWumxhPw8rgugYBiBfOi+ARRT/LS6D9/aoguFQTKJI4DrBDYFH9tSc8++kYv/jwa96w4VMYIKP9sJRqvSeKijOcoRBLAc5PnlZicKQCvmtYxy0ufP0HFGvYCX9NmF2FiznvDZDXRLlotSOdrDqXQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 19:00:06 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 19:00:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
Thread-Topic: [PATCH v6 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
Thread-Index: AQHchYw8A54GHJMeBUivfNLlMC3qB7VeMMkAgABmwoA=
Date: Thu, 22 Jan 2026 19:00:06 +0000
Message-ID: <8561d353d25db4119935d2250ea6bacf754d59ad.camel@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
	 <20260114192950.1143002-3-ttabi@nvidia.com>
	 <DFV4RO6NFXQM.LD680MTZNYSM@garyguo.net>
In-Reply-To: <DFV4RO6NFXQM.LD680MTZNYSM@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|BL3PR12MB6378:EE_
x-ms-office365-filtering-correlation-id: 27c9d8d7-b5f3-4375-2250-08de59e874d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WjJQWExEQ0lCRjVESkJXcWx4NnlUazFtaGdwV1NXcmNlVktVNlg0WE50Y2JJ?=
 =?utf-8?B?UWRsZkZ1bFdERU5OM2dmYzZ1MWFyb0RJSHZYRkM1NVIxMmJPQnVRMjIzTFJz?=
 =?utf-8?B?MGxnaDVEYjloNCs4SjA3L21LRnJRK3k4SVJzc21XVUtXOWZqSUVYNER1QzN0?=
 =?utf-8?B?Z0R6R3M1d1RINkc1cDRVZHc3TXlwSnVIbXRkcEhPMlRNMFUrYkJmelpEK1k0?=
 =?utf-8?B?dXZGY1pYdHh2anBUYzBUUmJJd3RRQmdFWEoxaEtHRWc5cFYvbzdMUktveFJP?=
 =?utf-8?B?V05sc1lKMkxyMHJIbUZxSlkzRXJFdThvVWorZEVhVE5SYllTcmtxZE5OdEZ4?=
 =?utf-8?B?VUpWZzNqYm9sa24zWWlXSjZPY1B3VHFHbWIyTndQUnludTJIRVZ0VkM4KytR?=
 =?utf-8?B?ZHkxREJxY3hJaFFFZzNYeDR2Umo5UjIvZXp5WXlIdUJQUkdBMWRnSmlmenNr?=
 =?utf-8?B?eFpoQzNLYlllZ2ZrWGxhemEzYWVvZVhNT0dIcUhTcXFoY0E5N0Z5cThnKzFi?=
 =?utf-8?B?RTRmMCt6OEhwZE9oZmJjc0ZOeE84NVdQUk4rUkZHN3ZyVUljTjBELzR0K2pj?=
 =?utf-8?B?ZXpIcXRHVjBLVVY5eVh5a3VEa3lNa1FtVTRuM2hvYnFnMlY1S3pVYzZ3WXZE?=
 =?utf-8?B?Rkkybk90aHA4NTBhODdWNzVuUHB2YlpzUE9Gb2xUUzlwNjU1Nk9GSEFhM1dx?=
 =?utf-8?B?aHRIQXM0M3pmQnZQaVlwZzhkVFBwenJ0a3BFVDZUWW9ZenM1UlZTdkVXbUlB?=
 =?utf-8?B?MDZRcmVTQ1JjSmhpZU5KUHlHY0MyTTY3RlMrWjJOTnJZbHBveTk3NElLK1lG?=
 =?utf-8?B?aVpERUNMWDVZWWYzVkRYNnRsdnlsVDk5NXlCNkVzN0tJbVRIaDJNd3Z6ZE8v?=
 =?utf-8?B?Rks3Mkdub3Y4QWU3Y3VQZnNqb2REbThrQnVlVG0yL1hlaHE4dndrYzJLQkJC?=
 =?utf-8?B?Z1NuN3hZcnYxdGpCd3pUS2QySDBka29lbENieEZCbEpJRnFmOUtZSit4V1Jo?=
 =?utf-8?B?eHBuTzdKQUdHN3hRN0JFaklQVWVpUm5WanJlWTdtOS9BRk9LM0pXUVZySU4r?=
 =?utf-8?B?Lzh5ekZWK095WFp0d2N3VmJWUGJ2cDVRTWNJUSszb0gwS0JYUzhpY1RMY2Q0?=
 =?utf-8?B?T3RpcXBmUFkrdEJGOG0wMzhwdmlvcUFhL3lON3FCYXAyblAxMkdWWnBJRW5k?=
 =?utf-8?B?aXh1Z01XTnI4eExNZFBKdnhWOVA2UURKekd1NlZObXVvOEROY1kzY1VTOGZS?=
 =?utf-8?B?eWg1b1ZFaEFUeUk5alBHV1BUVWZvUHQyZS8wTW5MakJmV1A3YytnVnhUcW9I?=
 =?utf-8?B?ekpIak45TEZLSlZiNkE1OTJoZlJtN242NnZNM2EzSmNVbzB0MkdEdVRiYkV4?=
 =?utf-8?B?UzNwbm5OQ2U5SFBzQkhid3BKWE40V0dYcmJEaTA1K25YVFgvNWhRWkQ2dmp6?=
 =?utf-8?B?OTJEeHE2RS9tMkhaV3lXdlNwWU5ENjUyK1pta3p0UnNOZUVYUWwzb2ZDemk5?=
 =?utf-8?B?MzFTbDRsUHp4QXVmaTdJUGJqTjZZejM4UlUxa095NmgyZjVPdDlYY2Y4WUp6?=
 =?utf-8?B?dTkrUXBsRWFzWmdaYWxnRFB5RGt3cWJiYS9zYXIvajF1Snd4Q1BOMzk5WEhn?=
 =?utf-8?B?bERPN21RQ2ptYUlwaUJHVjg4T0dpK1J6c1c2dUNnaWtZNGMyWTNLcHR4NjFt?=
 =?utf-8?B?MVlZYzFPWExaZEk1YXZ1RjRNb1M2Y2tScEVabkdQNXhqcTNVMUJxVHBzWHhP?=
 =?utf-8?B?TXpRUkxzbDdxU1ZxOTNkNGM2RkJmaFVtODRqUDhQMFkxWERncys0WHA0aWk3?=
 =?utf-8?B?anVBWVhDbWlwdmJqUUVPYTZJRVA2bEN2R0N5d3ZsWVYvQnFXdURRcGd0TlM3?=
 =?utf-8?B?L1lURGVMM01naFJvenQ0eXA4N3QxQVkzTVZkdDRjb0lZUU96QkZ2QVpOY2l3?=
 =?utf-8?B?NnpjYTFoYVNOcWpzUUIxOS9XVFhQRGo0VTNPeEtzalV1Wks1aTZDQmIveEQv?=
 =?utf-8?B?eUtYLzZqdU5TZXRlaUlrT25KdUxOanpiK3FiTE82NldYcW9xME1udWhMSmF2?=
 =?utf-8?B?OEFGMERlSVNCbTB3UkoyS0g0bFZKVTBSSFJTVlpGaGM0cVgxZzdzcXJqQXgy?=
 =?utf-8?B?VmJtRkhQQ1J6bG5yU1pwZit5NXllVlJkSU05RFVqZUJhWmZDVUptZ21HaStv?=
 =?utf-8?Q?gFjE3T4XiPkzS5Wgw5ZRZDM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?em85bnRPSU5sNElBRE81aUNEY3I1dkdFTEV5VXBlSFlwelF6MEhrenFoeVJu?=
 =?utf-8?B?UkNUWjRHWEcrTkdDZnNobENPWklvT0o1MXlwajFWdlMxbi9hL09kWjBmekV4?=
 =?utf-8?B?OGh0R0NGMkVMTVJ2Mmlhc0dOWHlYelY3akMxdXJPendoK3pkVHZ0eWxUR3hn?=
 =?utf-8?B?aXlzSWJDOGQ0VWFxdlBtYW9zREpRUzdLMlN3MC9NaEVPNy96LzRraFM1bWZ5?=
 =?utf-8?B?M2MwTUdEVUU2dGxibHVFWFdkVWgyRUJ2TFRaZGJ3ZDJvMisxRWZraGZ2TGxJ?=
 =?utf-8?B?WExHY1phQnB4aDJLTzB6L1RwWTZkajFIWFhUWlVsMDlpQ2xaMGhmak9IZ2F3?=
 =?utf-8?B?WTlaUlZ6b1VIdG9BR1U2Ty8xODQ4Y3pNWVhiMWVGV0dXQ2J2UVBqSzJQTWs4?=
 =?utf-8?B?aEZTdFlDK093dE5mMHUwaXJma0xDZFkwdlk2TEk5dzhlU3o4TUNQOWpNTzFn?=
 =?utf-8?B?NjVRUk5EQXRndmxZa1d4NG9EdXo4SWM1NXhKbks0ZFh1RzVvWlY1U3A1RDVa?=
 =?utf-8?B?eHc5a2VUT1dkb1VSV2szSC9oYitOYmJtVTI5NGFFZjRheHloTjJMeHgxZ0pE?=
 =?utf-8?B?eUdVSlFDSDdwWEM0SVRTRVZsb1FvY1UrdjN4TS81bHlST1ZraCtla2lZdDBU?=
 =?utf-8?B?QzdrNlJxYk04UjJoSjEwR3dOUnhMOHBDcFdqL0hzWHVOUnlCNGVYQmhndHpw?=
 =?utf-8?B?azVYbm9ZK09FY0xNdWlSdS83Z0poTXozTUVMNm9Ea25McExwaFU5TXdIeHhN?=
 =?utf-8?B?QmZCWGIvdG4rMVdjRnlnS3crcTYrU20xRUQvZk9HdVM3UFhzK0JlTTRoemVT?=
 =?utf-8?B?eGs4N1ArOUJMTGJCTCtxMjZjbTFQOFc4bnQ1bStidWtBMVExYkJXaXdseUJi?=
 =?utf-8?B?ZkVid01LN2FOUk40S2J3NTREbk5RMkpXcTZDeHV4NjdzMmdhUzRpQzJuYTU4?=
 =?utf-8?B?anV1YlBmVlN0L1ZFS1Npa0dyQ1p5dFRHVW1yejBRam1WNUJEbm1WV3IzSUVN?=
 =?utf-8?B?UFcyS2lRUktPVzBSQitmWnphM05EM2hPbjVoWkxBY0hJZ3JiVDRucFJXWDc4?=
 =?utf-8?B?YytkNXdMd0xibUVWWUo3RXFWR053eXVkQmdMQ2JKMldUbGQvWEp3RXlESVg0?=
 =?utf-8?B?TEZ4K3BMQlA1Vmx5Qkc5cGlJNnZkei93enpEZjVkdWprU1RiZTZPVTRqa3NS?=
 =?utf-8?B?YUdGVUw0ME5lN1ZiWGZmQVNDNk5PZm5MOEROQlhNZTJsU2xaeFh5T1p3c1pT?=
 =?utf-8?B?MFUvYkdZZzg3TXBoNnZld0ZFcmZFalRFVnFJNnludjhqekNpVzNBcEN4Smw1?=
 =?utf-8?B?Y0tYejFrN2FPdFFnekNBRGphMTZkUUJkV01nais1MWsvVTNPcVdKaXRnemhx?=
 =?utf-8?B?bFdQUko2QnU0RmI4TVI3NmZ4OXd2Ti94a1RDd3RVRHZid0ZxemNXWGlpbko4?=
 =?utf-8?B?WEl4RWRSeGxnMTIzOXk0YS94c0VHODNlRldNdURiSlV0YlZsYVpjWm9IdFJ0?=
 =?utf-8?B?cGhPS2tYcm1CMDhuTDVEREdvMFhBQjJ4bis4cms3SzVxcS9vM01xYVd0VGcr?=
 =?utf-8?B?OVdLZFJTREFSTE9CRk9xTUhaR3N0bS9MTkMxS0hUTHRwNERSNHlnaFNwRHU2?=
 =?utf-8?B?NWpIcDVCOUlpRmVrQTdsOURMb3RoclkwZk9ReFZ1UjU5TGhGbTJiMnkxb1px?=
 =?utf-8?B?dWc3bER0UHpVQ2JINnJKeUM1OGVLZTJtT293dEpTUjVqWnNxNHp3bFFvRGNs?=
 =?utf-8?B?am5rQlNOZUdmUGpRUnFwMzk2S0dwVnFIQVluR2xndUswenJTcm1OYjhYWGhh?=
 =?utf-8?B?Q3JRa0ZPZWw3SlRteGFHdXZiV294S0FKeXUzbjQyK0RPWlErVHJFUXg4NmFl?=
 =?utf-8?B?Z0RQSmQzQlFOY2IwQzdvZUFLRVMyaVBtcExiREg4d2pmbW9uZDJtTVZQWnJZ?=
 =?utf-8?B?NGUwUFdIWGl2QVhpWFo4eEFSWnU4L0IyN0prK3VHVHRGUE8rL1FDZWEvNVJ6?=
 =?utf-8?B?TkJ6RE9uckZ1MC9FbVJOMnYzVnpEMllmWUdqaVFpUUUyakF4TjM4dFpSY2Zr?=
 =?utf-8?B?Mlc4ZG9nL25iazJMaXdjT2h2WG03bVpwaWtGS21YUklVYUVIcnNsY1hzYThw?=
 =?utf-8?B?YUVCeDAxYWVobEFVSW1tZ3ZwQ1JiQ1F6cVJOUlh4KzZoU1lBeXpnMlltRWFr?=
 =?utf-8?B?eTg4N1BNdE5YeVN2cEhHaTduNnlidjBLSklDanFCYm01UU15cG5WVXlBamty?=
 =?utf-8?B?RmRGTmxJZjVVMm5kRk02NS9jUHQ1RWxHenhiOFk1VVF0b1VydTBCR0NXUmRM?=
 =?utf-8?B?dS95elg2UldWNmllZDV3RDc3MTBlMmlzeGNxODVQZUpieDZucEg3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <449BBD41159AD74E8091DD240B00EC9A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27c9d8d7-b5f3-4375-2250-08de59e874d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 19:00:06.0546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 HHtQJv+XC9hfxlKyNhdl8tN6HdX22O7+loi9NZxaAmfhssurdct2m4SRo9HMoNki+MnejvhxtKMIuw1+EynUBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
Message-ID-Hash: L3TGWRORWKWRJ4J672FSIT5BF443V5M4
X-Message-ID-Hash: L3TGWRORWKWRJ4J672FSIT5BF443V5M4
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L3TGWRORWKWRJ4J672FSIT5BF443V5M4/>
Archived-At: 
 <https://lore.freedesktop.org/8561d353d25db4119935d2250ea6bacf754d59ad.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVGh1LCAyMDI2LTAxLTIyIGF0IDEyOjUyICswMDAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiDC
oMKgwqDCoCAvLy8gUGVyZm9ybSBhIERNQSBsb2FkIGludG8gYElNRU1gIGFuZCBgRE1FTWAgb2Yg
YGZ3YCwgYW5kIHByZXBhcmUgdGhlIGZhbGNvbiB0byBydW4gaXQuDQo+ID4gwqDCoMKgwqAgcHVi
KGNyYXRlKSBmbiBkbWFfbG9hZDxGOiBGYWxjb25GaXJtd2FyZTxUYXJnZXQgPSBFPj4oJnNlbGYs
IGJhcjogJkJhcjAsIGZ3OiAmRikgLT4gUmVzdWx0DQo+ID4gew0KPiA+ICvCoMKgwqDCoMKgwqDC
oCAvLyBUaGUgTm9uLVNlY3VyZSBzZWN0aW9uIG9ubHkgZXhpc3RzIG9uIGZpcm13YXJlIHVzZWQg
YnkgVHVyaW5nIGFuZCBHQTEwMCwgYW5kDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIHRob3NlIHBs
YXRmb3JtcyBkbyBub3QgdXNlIERNQS4NCj4gPiArwqDCoMKgwqDCoMKgwqAgaWYgZncuaW1lbV9u
c19sb2FkX3BhcmFtcygpLmlzX3NvbWUoKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIEVycihFSU5WQUwpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9DQo+IA0KPiBUaGlzIGVy
cm9yIHBhdGggc2hvdWxkIG5ldmVyIGJlIGV4ZXJjaXNlZCB3b3VsZCBpdD8NCj4gDQo+IGRtYV9s
b2FkIHNob3VsZCBuZXZlciBiZSBjYWxsZWQgaW4gdGhlIGZpcnN0IHBsYWNlIGJ1dCBwaW9fbG9h
ZCBzaG91bGQgYmUgY2FsbGVkDQo+IGluc3RlYWQgd2hlbiB0aGUgcGxhdGZvcm0gZG9lcyBub3Qg
c3VwcG9ydCBETUE/DQoNCkNvcnJlY3QuICBUaGlzIHdhcyBjaGFuZ2VkIGJldHdlZW4gdjQgYW5k
IHY1LiAgUHJldmlvdXNseSwgSSBoYWQgc3VwcG9ydCBmb3IgbnNlYyBpbWFnZXM6DQoNCisgICAg
ICAgIGlmIGxldCBTb21lKG5tZW0pID0gZncuaW1lbV9uc19sb2FkX3BhcmFtcygpIHsNCisgICAg
ICAgICAgICAvLyBUaGlzIGNvZGUgc2hvdWxkIG5ldmVyIGFjdHVhbCBnZXQgZXhlY3V0ZWQsIGJl
Y2F1c2UgdGhlIE5vbi1TZWN1cmUNCisgICAgICAgICAgICAvLyBzZWN0aW9uIG9ubHkgZXhpc3Rz
IG9uIGZpcm13YXJlIHVzZWQgYnkgVHVyaW5nIGFuZCBHQTEwMCwgYW5kDQorICAgICAgICAgICAg
Ly8gdGhvc2UgcGxhdGZvcm1zIGRvIG5vdCB1c2UgRE1BLiAgQnV0IHdlIGluY2x1ZGUgdGhpcyBj
b2RlIGZvcg0KKyAgICAgICAgICAgIC8vIGNvbnNpc3RlbmN5Lg0KKyAgICAgICAgICAgIHNlbGYu
ZG1hX3dyKGJhciwgZncsIEZhbGNvbk1lbTo6SW1lbU5vblNlY3VyZSwgbm1lbSwgZmFsc2UpPzsN
CisgICAgICAgIH0NCg0KQnV0IEpvaG4gc2FpZCBubywgc28gSSBqdXN0IGNoYW5nZWQgaXQgdG8g
YSBpZi1zdGF0ZW1lbnQgdG8gY2F0Y2ggY29kaW5nIG1pc3Rha2VzLg0KDQo=
