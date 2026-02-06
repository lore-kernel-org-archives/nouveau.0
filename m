Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F64FEE6B46
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 18:07:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6314010E8A1;
	Fri,  6 Feb 2026 18:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XYWf3Sa3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC9EA41B4C;
	Fri,  6 Feb 2026 17:58:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770400694;
 b=FTOxZ2I6qs6MBdHPgKZ/BOcBKsbXWb2rXkgXhtEnrCoXhAVu7iRcslncJBrGWc5IpgMsd
 J1mWZLqn+HgIi7Qvxed65TTdgR3OKiYKtIZr4nJD37GLIJeaXGGL7a43Agq0A9Rqlwc/HkV
 O5c78sXa8I2MQpGwg7oieqL1dMrG+G7rnTgjhbLDnsGwz/TTCI1cEyw6f1W86nJpWRlMdTp
 QQ9kle3a9Y/ZEJ6o7ACmyRJqYQXrPPr6B21mtizh/ZHyExRxZ1T0yBC0tFf5GqgkkCNHSQO
 DynGZEFkfLy7f7YyOeLmZgmXSeWY9Tq9dMrLB6vuOaC2PvFQQGWIDoaAx73g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770400694; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2yjCwJ9hY6fv9F5RfsSAEeXbpFE1AuTpJSJChR0o1ho=;
 b=h3n7HRthmTVzTOzUoAOht0PVkk2DLIBnOBQF6hRlj4/ReU7FTxHxscZBO2Py3YJOAttdT
 bQJeeJlgNYBCXJVRmmfd7g18M3KzuMEWMg3uWX4TeeJED7UkGBRTEoZUxgSTupflYpepqw9
 9HXPbv/03IdlSsQ/dLKaIVuLIP44+aD3+ltMHEutklSDqsC4+h+r3EA/lcqjoHGpVFboDSo
 No8DcF8f2YQoWRm0uFK1us5QcpCYRTCdNNb7eBL7xqQFv2ZyaZDvYjkoDSSgeCrUVwXcj2c
 dgHhbZQqFWukXaCOU6X9ClSTpXMXu5sqeMXy9SOmymkE77pyb+0zbeJZolaA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9220740492
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 17:58:11 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4E610E0D5
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 18:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGcaDSxRtnjldt6MV4jZGhqtODLIdmsZfDwuXMFzV3pCm/Y2tL0j1IjmPMPx02v/FzfNFyOUp3f9702Hfr2P6jA9HyNvDZhoaXVRYrnzDw5H11SJB5u2XFFiGZieUHknrcwp2WwxSgrmfm+zUqFTjMRbBLywMQZCbiXhijGWJgDf9Qf8r93nlrmQKGMx6ODofGhdkftUfdBnFE8hcLFCEoaoHVXEdeD11vvGOBQTCk7j6uH66V5l47SEtiFo/8c9w6aDZb8ZLRFs6oUA2pZlhjp1N1gjvFrKjqOSxTddiqQfsMOBGFjd3ot7UnpYck/8Pd+dBFeYjZZUxS6MorWNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yjCwJ9hY6fv9F5RfsSAEeXbpFE1AuTpJSJChR0o1ho=;
 b=LJA/8bSwibjKkSBaNFmUKEOminZQVM1fswHIxEILHwisTsvSxwmFvufFs43hANAxuF8M9Hf9vCsDptQ2LYB2f6GgcH6jbEyeczmxGCFanJ1OL4w7bJalT9McbsdSmKIR0co4GNeasp972SpRh3p3uor7z16WAfU2wEED9yrnRdhpFQ2ltRL+VUNiKXKMDfLdFkn9yzc9TEHnskABnDNmbd1k8oXfMcqnKOtwovbwb0eLW0Fe24e79JsjtsPiZTSzQooOMF+JoQgi3N+LStjlbLq/cvMkQLvwVgfwQBfa10ik3/LXNJuiioaFdLqLumsueUj9f2k6GfhylFMndPQ47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yjCwJ9hY6fv9F5RfsSAEeXbpFE1AuTpJSJChR0o1ho=;
 b=XYWf3Sa3h4itMPfVmnZC8x21AFZCKaBB8UVFD7+3DbwJogm0ebHIU36gic/kfQXebRFmVwHnqoxkr0c/ofQOW55/fNjlaYxjxV6fGp1su5T7ohsqF/y888/1zBGQsAlSeEFp61snRAtELUStxs5KWV7LxFyFPjhMyjOqggxeyzh83NDY/gX6ZMcoRA6075HbX8maUjWPM3Mir6ajkZzhsBlDGsb4Cyz8n4aI1RMjbZGbev10NjeW/zuw7qDzwWyLXaK+wO+xJ/cRVGqhPGZ/FCm5gJr/aeCES3UXKTj6tWKdpWrJK9n0DG0z2nKMk0UUST4nROlzZ8PC4dYKGVoShQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:07:27 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:07:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 16/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
Thread-Topic: [PATCH v3 16/30] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
Thread-Index: AQHclyAd97FLF5Z+JEmwANiq8q/QLbV1+KeA
Date: Fri, 6 Feb 2026 18:07:27 +0000
Message-ID: <54c65bad972e792a4e8c27b79d3c0b58596f5ab0.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-17-jhubbard@nvidia.com>
In-Reply-To: <20260206042123.303281-17-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|CY5PR12MB6372:EE_
x-ms-office365-filtering-correlation-id: 634eade7-3769-47d2-efa4-08de65aa968f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZjVFUW1NYkpKcHBFdU81M3BqMCtiM1JIN3ViS2NIUWZpUmpTNDdNWktmbFBP?=
 =?utf-8?B?V3BNbGp0NW4vZHZ1Q2RnUzZUcTlORVV5dkxUNTcrd0FqOHZ3U2Y4VDZuWWpS?=
 =?utf-8?B?V3dNNzM5VkJVc3hxY0F4bGVSYkVOd011VDlaNUhpSnIyZGFTS1pDSDFhMmo4?=
 =?utf-8?B?TjByUGd2S3VVYkJONUdrUFg0WTNTN0hPa2hCVHdlazhGbHpvZTRMc21lRjFh?=
 =?utf-8?B?aHRJTmo3OUpObjFpU1lEeDR5QmVXd2xjNXVrSnNHN1pTbFFCemlRdDVBWmQ0?=
 =?utf-8?B?Ymp2VmZVeGo4KzVKMTQrRjExRnByMUM3d0VZbytiaENVQzBZVHNibDg4SUVp?=
 =?utf-8?B?Tm01OUkzMU9mRjRGZEt4K3NLYW4wd0xPUXN2ZlpKcTA5cmRZQnF6SnYyVm9r?=
 =?utf-8?B?Nk1CWThhcVdVMUQyajdiOFJ6ZlUyNElkNG5lbTFiL1dQTHRrRldJUmd1SnJS?=
 =?utf-8?B?cHNoNjIrd0JIUEFERWw0QW5RcHluVEZPWjdPSW9VbFhXMU95aHliendaOGMx?=
 =?utf-8?B?eXJrbnUzLzNZYk9VMEU3cW1GaDRDd2QrY0pWb2FvcFJCemJLYWpOUE14cGxD?=
 =?utf-8?B?Z0RLb2YrMTMwVm45NUlaNDdObE9wczd0ZUdaOHFOM2FyS1dvYzgvZ3BubHY1?=
 =?utf-8?B?MVRteGxqWnFXejhnRGl5eXZOcVlWWjduL2tQU2lMYWVCNDU0VW9wbDFNb3pv?=
 =?utf-8?B?NVBwaWh1Rk1WamxhREZnL1ZFZ0ZrYTRnL3ZvSDFLT2U2bnh6c2h5ZXFWRUk1?=
 =?utf-8?B?NzVUS0JGNEE2aDZwRDdIUVNIRHNjMnBtQ0pWb0l0WUtNc3Rma0Q3QkFQSTFn?=
 =?utf-8?B?MktHNnZnbklZSlhENW54VjJ1Q280R0VTRk9kT2VGTk9ENWpWbVFiZ0dRR3B5?=
 =?utf-8?B?N09KdzUyMTgxQ3Zqbkl6T3pkN1JKbC9ieVFScGV4M01jRytqVFdDSnZVbUln?=
 =?utf-8?B?ZndhMktwTDJVcGo2ZVYrY3I4TzkxRkVrU2N1c1VHaTM3TDQ5VFE5dlB4NW1C?=
 =?utf-8?B?MEx0ams5RXI3RXNVQyszQkN1TFhJZEhHTXA4dG50MDM4K0lpTEZQRkwyZGFL?=
 =?utf-8?B?MFdoc0NCUnlWMU9CUm1JTEZuNS9SUHBsdnlOZThvRVFSaXc1NU01Z1k5NWZL?=
 =?utf-8?B?T2NJMXFmOE03aDNRZmxvV2dVWVJ3M2VPVFBlczM5WVRYUThuakt3anFhLzZE?=
 =?utf-8?B?a3AxdkZ0L2FzUTVESEoxcUhrbzJlR2xYVVlLZit3eDhDNWQzTTJ0NmxkUlY0?=
 =?utf-8?B?ZU5NdHA1bitOM25rSnBGenlldWpUS0xHTWVTZW5zOC9yelJDZkNEL2pnWktx?=
 =?utf-8?B?cklqZVQ3eHZXVDFFOWh4aHN0UGZEZEV3TFNuRjBHMUgxQnhHN2xQZUhtNXBj?=
 =?utf-8?B?K1RhOTNqOEoxNVJyM3R2N29BRG9iVjFHWWVBTE95ZlczYzZUOG1ydC9KUTA4?=
 =?utf-8?B?c0NkeUp0aVF2ODNSRmR1ZkJwM1pFcVdVRWZwSVpoZmRGdmcxTUJIUmJMd1Jl?=
 =?utf-8?B?a0tTdk8wZkdQbEFIVzlYSk5tdXhiNUpObkJUZ3lyY3VObEFJZ0MvTTducUFK?=
 =?utf-8?B?dTd0ZkpHUGRmSjVKa0hHbmRNd2pPWHdNU1pEa1RJc2NtN1JJZHl5emNBaXlm?=
 =?utf-8?B?TWpXQTFSVWFaeEFzMGh2b2JTa0RwNnQxRlc0VWpIYlovTUZmdlJXbnAweWFS?=
 =?utf-8?B?RDVhVDBlYUNGbEY5azRKRlFOdlE4LzNnZFpuMitzZFQ5NkhQRkY5Uk54U3Jy?=
 =?utf-8?B?LzFMbkZBT1hBSXY2bnpHNnh4QzNYbEFDZnhjbWRqWDEwZlFKM3hoeWVFTG9F?=
 =?utf-8?B?UHBFaVdheUFvS0Z5dDlxZXJiZ2NPaXpidENSQzFNZ1BGdXhsMTJVcVRQZllJ?=
 =?utf-8?B?bE95ekJTUmhTVHgvWkJaeldSWXFieTRncXV3RE1kSG41c21rQzBrWFY0c2tM?=
 =?utf-8?B?M0xOSTlMbENEd1ZVRkVlemNCSnFMbENnc2tXelltZkhHUjZPSk8wVjh3R3dk?=
 =?utf-8?B?QW5aZ3JJclovTmtCYkpWYiszbVZNdjhBaVdpQzBlbVcxZUlBRGJEcUZ1Mk5U?=
 =?utf-8?B?WDJ1dVBXKzNHeHlSbFRhUTU1SHNVWDVlbmhuUUIzeUV1L0JpVk1ucVFsRUxy?=
 =?utf-8?B?QU5DRU1vcGJpQ0FLSUVWdjJ3TDRJRnk2SE9zc2FQaTNqMkFyTFl0MEszODV0?=
 =?utf-8?Q?nYCRcTjE476O/I/KTdUp2Yg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3RRY0MwRVRGcGw1RnlMM2ZYOE1PVCtRdm1HUWtOTythREJSbkMzZ3RsWFQz?=
 =?utf-8?B?cGE5QTQzU0k5Vy9FWEN6eWVSYXh6Mzc5R2RIc01IWHlMblJKL2xpbE43VXpY?=
 =?utf-8?B?K1dDSGhFVDRsRjN5RGRCOGN5NEpBazNsa2hMamRwUXNtbXZObElDVDJCVWd3?=
 =?utf-8?B?TkRxVkk4M0J1TFJpak1DOTcybHFRS1Y4ZzQrbnBPMU93THE5RTlnVFkweEdX?=
 =?utf-8?B?UWlLVTJ6ekxMdWg3L1RUdnE5QXVjV0xvekkvWVljbFdYdzVZNmpyR1JISTN6?=
 =?utf-8?B?WDI5QjZ6aGlSU3c3bFRGbWxZaE9pcHlDTEpNQzlHYmtkK01OOHdsbXp5TmEy?=
 =?utf-8?B?cTFQTjlENFkrdjV1MlFsMkQ0djQ0V2Exc3dBSEl3QmFicHFGS1gyUytnTTJv?=
 =?utf-8?B?VW12V2gxNWtkaVh2L0xpQ1JLTDBUWlhxeGJ6cnljZzRRQXJlUUR3Zi8veE5L?=
 =?utf-8?B?Tkwvb0tjQWlOSG1renNpdmxlYm1Na1dNeFV5N1JWU2RiMFdqRzZNVm9VaGlr?=
 =?utf-8?B?V3cwRDY4MmtXRjhTNGtqb3RUNjg1bUVHS1ZNeGppekFIUC90MjAyd1VBRlk2?=
 =?utf-8?B?OFFCSTJMNzh5Z2RoTWd4bFFFVklkT3dUWW1Qc1BHd3JnTTVsdXVoeDdQV3JG?=
 =?utf-8?B?ci9JWFVpZGxLSUIzelk3aXdNRmhBMWlYSkxtVm1rNnQrd3NmNVRDRUErKzdr?=
 =?utf-8?B?bWw2WlYzL1ZmWDZnbGxQNlB3YVMweW0yY0Jualo5VW04VnUxZ0x0VFA4cnR0?=
 =?utf-8?B?WXdCK1RGK0R0d2tJQ1ZuN21icFh5Qk9vT1VkY0pzNTRSdUw1WnNnTjRsanp1?=
 =?utf-8?B?SzFETG1zaDd3UDdDb0tFRU43WU5mcjRmc0REcU9mbmVTWDYzMGcxNzRPQmpU?=
 =?utf-8?B?ZGFycHMreDY0Q25CSjA1VlVQNzlGeVRoVjN4WFpTZGxtcENZc28wWEY1SjlN?=
 =?utf-8?B?aThBQjFnMmtCWWh1NTd0RDFuUzkyOTlLWVBicERsTitadmhQa1pYVkRtV2Jh?=
 =?utf-8?B?azRIQUVVR2dCb285ZFk1am9CeXVpejQxR2hwdEM5Y0lLd0ZZQ3luZGNoblA0?=
 =?utf-8?B?Q2NWNy9WdFcwQjVnbmZIRkFKZ0wrV2xiRnZOK0p1WmV2dEhvVDVRMnYrRzdN?=
 =?utf-8?B?Q2orUGVLZnJyZXdJQ2hSajhaS0Vjc3N4RDJWSjY0QlZtSk5xWUcwL1BzeXJ5?=
 =?utf-8?B?WHN6T21Ja0xtbGFPQzdFdUp5VlNiNXBzS3k2NHEyditOWnBkZUw0c1FiTXFX?=
 =?utf-8?B?Y2VVemZjK2kyTUZVQnlmK1VXOUx5QVhiN2c0Rk5FVzFKSXZtcmJydTIyTXR0?=
 =?utf-8?B?SjlQMm9udnVhZHFnOU9WVVUyU21HZWFBa3dUajdqUEMxdm56aDNQU2IzbkJT?=
 =?utf-8?B?dldleC8vemRnMC9YU0w2bWtLK2tjVUNKOXFhVUtkNTMrby9nYWY3RDgrZU0r?=
 =?utf-8?B?MWtneG9TUEh2b0dOaXVyWE9aL2c5SDFmMnFPNlBSSWY1MzR0Tm0yNFBUajU4?=
 =?utf-8?B?Rml0eSs1cGRKV1BhS2JkVzRDYkxXdlFtL0pUK0RUbFllWURIQ05MYS9FQnJZ?=
 =?utf-8?B?MHpodlRvTDhqNWtYVDdmVWszcURINlhiUXBkaW5tSWtaQkRPTnZOaG14ZXhj?=
 =?utf-8?B?cVVHeUZ5eGRpKzJYbEZJTFJjaGVCejZYT2xXczZuLzM4bjNBL0ZlN3QzejZl?=
 =?utf-8?B?bGpBdkRycHNraEdKREgrZHJxR3lzYkRIbHhCZ0NkRVV0UDlqWk9tL3ZycjRo?=
 =?utf-8?B?TC9NMUN5QUttaVNTblVoMElJc3MraFVpUVZWY1NyL3VpdlNqU2U1TWtPT3Ji?=
 =?utf-8?B?VHBrSXBKakVQaHA2SjYyOXA4djlOUWVreGs2KzFFem56ekIrd1hncFBPQUhP?=
 =?utf-8?B?QUEzUk1FaW9TdFIzbG5Dd3JKN2RId3R6bkozRDNjdTRhZGVEZkJOd2grWEwy?=
 =?utf-8?B?UEtFREcvWmljVU5IRXVmRGhXWUxiVkxEK2VxZFpZbVZTUExCVE1lbWZHVHpi?=
 =?utf-8?B?OWsrRHBLd3N3ZkwzQXRXL0twSkRUSEdEOUFoZlZzR0dId1ZLNkZBVHdYTGhN?=
 =?utf-8?B?dEExTytOSHZaVGxWRVJ1VHVoZTVqcHIwREgwYkVOUEk0SHVJODRXb1BpL1d2?=
 =?utf-8?B?VmR1ZlM1ZzJrY3NLSHpYeHQ3WGFlKy9vd3NmdFFSRS9kcm9rWW5KSC9yK1Bl?=
 =?utf-8?B?K0hjM2hRc3o3aTZnbjE2aU1qKzczQnNqRngyT29sR25OUjdkZW1saXNjR01C?=
 =?utf-8?B?Tjg3ZWM2Y1huS3gyZ1lxVzcrYUp4dUNQcXZYZG9RbEkwVnQ3ZW9RQzArcEhW?=
 =?utf-8?B?dDZYWlN2N0dRL0g4RkltVUJRWHBXWm9Mell4WTEyVGNUSFNlTW5UUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <027E60ADF79044428944A076D8A3653A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 634eade7-3769-47d2-efa4-08de65aa968f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 18:07:27.7773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +XIB4cGniHd3r7zxXOTkZl/RkY7evBwYdXSJKX7hBE2l5Pi382C41lyW8inwNkdyb8+yFAp/y9lQxSflEniAfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372
Message-ID-Hash: 4KT5MHYICDTYSQXJBMUEZOZIPW33GIBF
X-Message-ID-Hash: 4KT5MHYICDTYSQXJBMUEZOZIPW33GIBF
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4KT5MHYICDTYSQXJBMUEZOZIPW33GIBF/>
Archived-At: 
 <https://lore.freedesktop.org/54c65bad972e792a4e8c27b79d3c0b58596f5ab0.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDIwOjIxIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICsvLy8gRU1FTSBjb250cm9sIHJlZ2lzdGVyIGJpdCAyNDogd3JpdGUgbW9kZS4NCj4gK2NvbnN0
IEVNRU1fQ1RMX1dSSVRFOiB1MzIgPSAxIDw8IDI0Ow0KPiArLy8vIEVNRU0gY29udHJvbCByZWdp
c3RlciBiaXQgMjU6IHJlYWQgbW9kZS4NCj4gK2NvbnN0IEVNRU1fQ1RMX1JFQUQ6IHUzMiA9IDEg
PDwgMjU7DQo+ICsNCg0KU2hvdWxkbid0IHRoZXNlIGJlIGJpdHMgaW4gdGhlIE5WX1BGQUxDT05f
RkFMQ09OX0VNRU1fQ1RMIHJlZ2lzdGVyIGluc3RlYWQ/DQo=
