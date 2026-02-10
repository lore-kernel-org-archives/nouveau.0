Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F163CE9463A
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 03:29:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B347410E4AF;
	Tue, 10 Feb 2026 03:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UbItoIkp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78FB441CAA;
	Tue, 10 Feb 2026 03:19:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770693582;
 b=aDHSA35x9mZEXtGirU0H8MTBKvgFk2HgsiTQ9S8VC5Iy7xBB+OAsTVPMON2+3X9u40oQz
 aAE5cfFtys81j0KiZPKP01J1+P+JKMA8cQMUzWuHCyf9Psan798GxtF0PUHhSxepwsZLSe/
 UZdWm/8UTDMURtjyPrOcjNE7TRfRs0sx0YeMl5qH87jKlt0X7hZm4lErXbjzyEujew86X+9
 btk+2gWOLRXuI3VAhhqy3SFIzt7Wy9vkzGGyqNsPPElliUhROedczTK+TAZY+D8KKJJtVfG
 muUNKuBR4naf6i9qGDXfrXdlZdBUnSut8wKrUpbOrReJmwB9PkuP8iTKolRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770693582; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MA4XzAFmUiSAGpF4KaFpO3NbivvL4j+nvLA5vVndUxM=;
 b=r0UpG10AZ+LiLgvIagICELo4WeVuAfPaiachtK3yAC9SyveiIZQgAOQLMgPu0EFJRdRtf
 +vKKVRnxL1lWXAUwF05JhGCqSk2pxVoJ67UmabocJYcumqAEjcYya1POgSVZYnGZgwiJZ57
 ASaeEHLo1U3thXYFpBo8AD5wj562vM1xGs3mOcr1S0GtVaaBYOhulPARpqkPeC1dCAY3aea
 Lv58AlldvnhGv7sL8+BF6Kro69BYIKc5EBmRbVzPz7f3RamQ3lHiAD5TxbywVDqzKKtHuTv
 xLtgqNaza0XyGKrxd//faBiyWFWZQCl0ni3ZQimYijy8t9ebaupzY+YBR/fw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F13B6402B7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 03:19:38 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAAF510E198
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 03:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCxluwZJvAPdXQEnYck5lR8NTHi0ClCcv86RxhvqG3XEEs60ozNbtMSaiWr2tC1s5PWa045I0WYCaHvUpaj7i4VpB/w3Qw8e9GyjUgPBdn+JHfAFtLyn3xLX/rx1JJqybGCFZdVSsIMNTN2T8envABTubI9KEXjuIhhiVTjMlZSM2UFL99INWWpKBkJQuuEeRXO6O8jdWkIfdBE+xF30aoBHkQq/aXfkGsX94Pgz+mj2iT3CqgILWxD0KO6PwDtq8Z4/OprneQ4VLuGaep7ZxvXf8v26jH6Wh7hagrNiGbQNfW0/2ggS/+Wn/Oim8Hpdzn2dFs1cyOzTegHK298pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA4XzAFmUiSAGpF4KaFpO3NbivvL4j+nvLA5vVndUxM=;
 b=l8J5lSfKRQYahaYFLHPPYUuUEXCLhzDCT4xghH194nAQ+WsnSZMSnsbzqdrgl3KkQzqUKHc+cJD2rYm4q8cDHjOlyMxGAv3/Ga1KT9m4scnBfGsBPDn2MSnhHxY6xTlhVfxuxDw7Cyaz8unSZgYFj0eiLqBRIQmBm7KtYfJYbq7+yyvZvq5WuyDOacIHcflzU2zG+5mtX0/ZqymNIOeaMgdnD4DCuDz8qpVgYvmxNKwy8/AlbkI9agTkcrazSq/KEs95IAejIMgtlQrM8YbNZ7EBV9cNVtG2GHF3a+4pjKSytg/qvOMWea3p3QbgfOZ3nObKBn0ksyvlHh1axT/+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA4XzAFmUiSAGpF4KaFpO3NbivvL4j+nvLA5vVndUxM=;
 b=UbItoIkpRD8rhScEliEErOWJMugGTcQIsbJgIVIWiv9HupphSbwD5fw1Ph3a4Xc9zzupuIdoFtAVmydIpLn1ScBS+7cTQIDvUmVqmE4Y6VgqwcTo8E2tdrSN9P3HmFh5Tw/nroXaziYFR1h+cnGCea/QpcW6llVCg4zoYhp+JZCKC2kK32fPUGBIkdy3Qx2g0WlaXqcNsQpZVucJE6ru4auxHYl6lLtaIP1FbK6iN2ukZ8hBWCwzoagG9/vuwbwdTpXLdt476cHypaea57yg9bO2+aSt0P78GO7xTGdFtRbVfl8+40hlp7FZuddgOnbFXYQqbYNuzMBzbZbD+pFgAw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPF7B9E98CB6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 03:29:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 03:29:02 +0000
Message-ID: <45edace1-cb04-44f9-8086-f136130eea25@nvidia.com>
Date: Mon, 9 Feb 2026 19:28:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20260203224757.871729-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260203224757.871729-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPF7B9E98CB6:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf35f2e-9db7-4153-0944-08de68548972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDNTWklnOXV6aktETVRlQURWVUJDZzhWMGM3Skgvb0F1S3NFczRZakN1bTU2?=
 =?utf-8?B?dHY4ODNhSW10UFA2aDVGNTdQaVJ5b25SdWdxVUp3TUhhb0M1SGlvK3FwVmlX?=
 =?utf-8?B?Q1czRGc5RHJjbDA3TktHNFJreUphNHNHelYzVWFCWm51R09wWG1vZjlRT1Nt?=
 =?utf-8?B?UGZsYmsxZWFYWVNVaENPWGZianVFQ0U5MXUzR3BKT0psci9lVVB4Zy9PK202?=
 =?utf-8?B?aEJ3RDR4MENKYkY2dXZldHU1SU40Z2c3RTZOazFTcjhoUGdLRktveU1JVjZG?=
 =?utf-8?B?SDJONktEN010WXZYdm9iU21hSEc2bVp0YUNsektQb1N6WVJYM09tbVY1WUlq?=
 =?utf-8?B?Rng1WWpTaU1uVkFEaVRtbmhDMERFL0NCMWRveTRkcTBzL282OFZXNnVRNnlS?=
 =?utf-8?B?M1lrUm9wWVFYUUk2Z216a0d1aFM3ZEFwK1QwdTR6UFB5RVlDWXBHenM3WnNt?=
 =?utf-8?B?MnVJRkJsNlNjMkZBTStUelMrcHlzQW5DT2JRWk92RW5DY3lDTU9kR09uWHdC?=
 =?utf-8?B?UWFHMFFuRFBJZzB5NEgwdFZlaHFiTkpjSUY3L0pVVUM4QXovQW1WY2Y5ay95?=
 =?utf-8?B?bS9LdnR4VzFEN29OcVUvL1dHei9HRXo4YzZqRkQ5RTBIUlVJVjVNcXQ3VlVG?=
 =?utf-8?B?cjhrc3FvMWdCWVcyOWNMcjV5RDBEWDhFOE5tVnpzN25UVnk0R2Nob2VsNHBl?=
 =?utf-8?B?eEtMNitNWFBOQk8xL2htWmVjM3FhbjNDQ2xrSmR2YXFMWkZPZTBtdDN1eU5M?=
 =?utf-8?B?Ym0zbTNQK1hHbzY3SWsvWHlSR21MK0VSV2lzSEVXVkRkdS9UUjZVL0ZodVNM?=
 =?utf-8?B?MW1HSmZUMkZZOVdVMTgyTXByeS8xSTJSN21YSWVFZDhKMkR3WVptZEdISGd3?=
 =?utf-8?B?R2pwZDRKWHphZHFzRUlmeVdaVXV0MWtaRkZRR2RaOS8ra2VLVUY4SXliS0hP?=
 =?utf-8?B?djNVZWtNMmw0VlZiLzQzTU1EN1dhWkxXaVkydXk2aDRNcitXa2kwb1M3T00v?=
 =?utf-8?B?Y1RlOVJReVlXN2FoYjVDem1uUTM5aWkxcWVLeDNnSEZnc1UraGJkZTlwUmZz?=
 =?utf-8?B?SUlWcnZHUEhIWjNXTUtjVE05bk4wT2RmQVVjR0hFWVJwMlBpcE00RVJCdmJ6?=
 =?utf-8?B?bkI0MWtkR0tPUDdIYW9aVU9tbjNWRHFZV1FWb0sxWmt1byszME8zQlQ3a2Rl?=
 =?utf-8?B?TVpFa3ZJclNzVUVpYXJVSDI3anA4enpoQW5zNkFhZ3dTVmZkeDM1MVhpUnZr?=
 =?utf-8?B?VnhmOGNxZWFEWS9MdTFaZ3RHV3RTNDdoVnBEQlYzcDRaVjBOMzB1Rnp2WjVn?=
 =?utf-8?B?cmgwQ2lBRkRHMjVOeGd3YVlJTVp3WUhnTmZxSjVTSitzeFh6Rk5WVDV4TFgw?=
 =?utf-8?B?ODZUeDBrWkJVbWRncEV2S0hCMjRXQmZ2TEpqNko3Q1k3M0x0Sk54Mkh2bFZp?=
 =?utf-8?B?VEJOMkpCTEVoYXNtWUF0aTBJbjVRZ3V4R3dkN255N1J4cUx4VGFzUHFyVzJG?=
 =?utf-8?B?NlBxbVg2R3lEVUsrWHVtMlYzOXMxeUdiVDhsNG1NM0l6Z0JYTUhXWnpsWnZw?=
 =?utf-8?B?S3d0WmMzMjgrNVJQVkw2MTdhTE5MS0o2a1k3dWFBVkNKb2YzVjZ5clU4S1Zw?=
 =?utf-8?B?Um8rVW9HUEo4dmlpVmdxYm5XVDltejFONWZWWkJwM091aTVSekk4aExrOWJY?=
 =?utf-8?B?bE91NTladjVic3Y0TEhweEZMeDZBSVZpUDBsWC92SXdrWEI5Z1k1VTREZy9w?=
 =?utf-8?B?aEV4L2JQa2tnVlZBU3JSVXBZRk54cnNWd1BWVnlVUS9OY0ZDZTF1WW5HTW9m?=
 =?utf-8?B?ZjU2QU4wcmptQkU3QU9KdXRPL3JTNlZOQjk1Q1pRWUlaenllNTltbE54QitP?=
 =?utf-8?B?NWsrK0tDeGZZTDFWb1gyc1R3TVViK25qNkdYai9Zb2dvcGVlYU5Na2lCR1NR?=
 =?utf-8?B?VWZuQzljNHBTajZ2Mk5obXdFQ2pUYXpCd243QUd3d3YvTWFLb1dZNjRUVnhC?=
 =?utf-8?B?Qm5ndDEvVHBNWmNmUFlQOXJpV21LU0ZOTXBOZ3dXS0FOTkxjdTB4S21PRVNN?=
 =?utf-8?B?cUdnVUJUYjI3RU1WRlBuOWlFZEZ1YlJNbXZMb3lWVFJMTnhTdlAvUzJSaytm?=
 =?utf-8?Q?nQuk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RE5aZWptNnppaUxRVTIwUHQ0bXp5TVRvZ1hXRWZkQUJWemRRNURKR0theE16?=
 =?utf-8?B?ajFuQzVjaXFRQmM1MWJVWTZSUGRGQkQyS0ZkWVBiUnh5ODNVMHB2NHltL1Er?=
 =?utf-8?B?M0J6WldjUUVJSGZOUVlnVTBaTVp2NEtsNk1Ed1lwWXR6SmU3RWJ1VDBrcWFF?=
 =?utf-8?B?OERFVExpbG1BRUFoeDREVCtHRmNkSkg3dERUME9wNXRrTk1EWGZBYk01K2hH?=
 =?utf-8?B?a2owbkdyRU5rZmdXYzlDQ3F6VmRVZFpEQkJNc2Jmb1VSNnFmVjVod0l1cnA0?=
 =?utf-8?B?cThXWFhKZW5oZ1JicFRLSWd4d056MmZSVzF1S3ZHY2c2RDdRY1RPcTMyaEJ3?=
 =?utf-8?B?ZjNIOVpKRGY0UkhvTHdoUW5yb01KTmlSRnlxdVltVThvTm9yMGxFSWhFck5T?=
 =?utf-8?B?VHAwWlg0ZERPZkdFYzVSR2dxeXZqQ1c2b1U2VGVXd1FkK08vbHNTVXdRdkMv?=
 =?utf-8?B?dUI1NUVyUCtDRG5RUDczam83Z1pBZy9INUMxRFdSMkpNalFCRjNxZkZteGNC?=
 =?utf-8?B?NHd0bUQwMGhWTjJaSml3bStvOU5ZMVJpUEpHYy90dmk5akpZOUU1OE9EMmZj?=
 =?utf-8?B?Rk5pN1FDN1I1TXBnaVpWUDk0Mk5PNXlHWWxCVTR0L2MvVXZlTnVpMFdtYkxU?=
 =?utf-8?B?NmpDVmN3MUtmVm1SSXU2ODYxeS9nMVBIQzBCeUZZdDEyN21nQ3YvdnVvNzA4?=
 =?utf-8?B?ZFF1dmk2VWJFcTlIVndMcmhreTVuZ0RvbjJodkVTb3VGbi8zUURBbGUyMmdV?=
 =?utf-8?B?eDlDS3RxMWFSRnlCNDdXK1ZWWXZSdC9VMWl0R1k2aFZYTUpKejZwWjMrbWRq?=
 =?utf-8?B?VEpzWGFCemc5dHdZaVQvRXE0YmI4Y3BWMWdJSmpMMS9IeTZNaFR0bW81bElp?=
 =?utf-8?B?MVBVcTdqTHJDaFl4OHR4VTNqM1YzOW9sWDRDREtrTTAyM2pZcjJTZTFEYjlp?=
 =?utf-8?B?WG1nTTN5Z1dHeVZ5WUZXWnE5cEZQVXJjNzh0ZklDZ0paemxFNmYzRys5cUs0?=
 =?utf-8?B?NHp2YzZ6cXZHbTBheUEyeFhjeWlNTjdSdUY1UGF5aDF1aHUrbzR5U1pidlRF?=
 =?utf-8?B?OTRlQ3NSYWFwWUhHZHZlR0U5dk5kU3B3ckhlNHpDa25rYkVaRU1PcEsrQ3V3?=
 =?utf-8?B?N2pjWGJlOW9CS25vVnBNN0hwWHpDNXJpVG03aUY0VytQOEtzL3NLM3MybnhU?=
 =?utf-8?B?NjlqMExJUEpFT2QzSThQaDk1VXNOUktEc3hnR0Y1VzlVenZDQ3RYK25hbHVE?=
 =?utf-8?B?TU1LeXVCVTBESndtWTJIMWdZdWRMc3pweU5VTStvTFJxMFY5RkIyQWlHT040?=
 =?utf-8?B?VkpqaGJ1R3FkYkdsMk5wNUFxRGovTWdNTlM3akhsQ3FnVjg4bnFheUtSS1ND?=
 =?utf-8?B?NCt5Q2lTdE1VNzJLdE10a3E3dEJJTG5FVFpWMWVEbDAxanJEeFU5b1VXOWFo?=
 =?utf-8?B?ZWNNVllZdXNqZ3ZUVE9rQnJmU3g0ak5FdGZ5TWFZTzJ5MWFTZHlwT1VJWXhj?=
 =?utf-8?B?Kyt0TS9vSmpTcmdyck9xQUpyNXhtOVUyY1JXdm9oZUpUdDQzNStUcURYekdI?=
 =?utf-8?B?QXRIbEdYSlc4NThQVEkweEcrMlZyNXRBd1hEb3FLNkdaSlBDbkdjNDBpUFpu?=
 =?utf-8?B?dzlmdTFPUlJEeHFLMFAzb2RWUmVPWDU0UjBZbGt0dVpqZkFUeE5HU2xEdXNi?=
 =?utf-8?B?b2d1VEpxWlMzcC9kTGR1dXhYQzhsbnliOUtaRk1SWUVzdmFCbkt1S2hYMTFl?=
 =?utf-8?B?cFV6bzJPdC9leFpGT0N5SE52VUJoWjNLLzlzZkhIU2dGWXA5b2pQWVBmYWV5?=
 =?utf-8?B?WmRSYkxiZDFKUW5wdTcyVi83OW5DTU11ck13K08wdVA4RDRTWHlaNGU1bU5L?=
 =?utf-8?B?bEdlQWp3Nk56dkx6cSsvNUtqSTBLRDc4ZVNtMzVnNEVoRk5WTWgwLzdBWnF3?=
 =?utf-8?B?QyttSGdFT2VyMmhtOWVqUExSN3NLdmVkU2RIemZvNU1rL2hxcDdJZ2VzMlpo?=
 =?utf-8?B?TXZ2ZWtmSVhWUlBIRlgvaTZrWXZzVjFkdjcyQ3p0LzhBbUltbm5CVjFzVDJi?=
 =?utf-8?B?Y1h4QU4zQ3V1SXhoUU9oN2JrdEFWaUNEMlNwM2l3VVFFdVRXWFJmOE9acGoz?=
 =?utf-8?B?VXVRc0NJWkl6c1JEZ1ZGdEdqMEh6U20xWG1YTUsxM2RlL2pwQXJNZnRFdVFp?=
 =?utf-8?B?Q1A4c2gzdGE4R21wcTkwdTlCMkhVc1VRL3A4WXEreWVCV1AxbHJOOGt2N3Fj?=
 =?utf-8?B?NjBqd2VGTEdzUnRqT3pia1RIOUxCMVYrTjRiQWhCQys2QTR3VVdnK0xjcCtW?=
 =?utf-8?B?ZHNBdnBKSUZ2VnkwamwvMFJQQWdjaEdhWTR2VTMrNGFRVU5ESHRiQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3cf35f2e-9db7-4153-0944-08de68548972
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 03:29:02.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oLMNsNr2gESc325d1GW1SNWGM/YB6hPc2D2fLYP4S1uyzZu+1IMKU1r6BJCql06KJe9hVSwPYlje7Tpd2QfyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6
Message-ID-Hash: C42K5N2PW33ER3UKBD6YVG7KDXAUL4YA
X-Message-ID-Hash: C42K5N2PW33ER3UKBD6YVG7KDXAUL4YA
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C42K5N2PW33ER3UKBD6YVG7KDXAUL4YA/>
Archived-At: 
 <https://lore.freedesktop.org/45edace1-cb04-44f9-8086-f136130eea25@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/3/26 2:47 PM, Timur Tabi wrote:
...
>  drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++++----
>  drivers/gpu/nova-core/gsp/boot.rs  | 14 +++---
>  drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++++-
>  rust/helpers/device.c              |  5 ++
>  rust/kernel/device.rs              | 10 ++++
>  rust/kernel/dma.rs                 | 36 ++++++++++++++-
>  rust/kernel/uaccess.rs             | 74 +++++++++++++++++++++++++-----
>  7 files changed, 210 insertions(+), 28 deletions(-)
> 

I've been using this on my multi-GPU setup, and it has been working
just fine, although there is a somewhat related patch [1] that you'll
want in order to use multi-GPU with this.

So for the series:

Tested-by: John Hubbard <jhubbard@nvidia.com>

[1] https://lore.kernel.org/20260205221758.219192-1-jhubbard@nvidia.com

thanks,
-- 
John Hubbard

