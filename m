Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11736EDF04B
	for <nouveau@archiver.kernel.org>; Thu, 12 Feb 2026 06:29:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC610E6E2;
	Thu, 12 Feb 2026 06:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qghApmAA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EB26E4211F;
	Thu, 12 Feb 2026 06:20:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770877220;
 b=0aCtaB7evfBf+MS5JMd5zmI6RfZ/HpqWsa6RTaVFoj6V/x/bCSSTL7DD9N608N5OzEQKI
 sn9Z7Jxx/f4qBtdofkj5ZGU1weEiJEtFtLKRdzqcges7JQsUdqiCb20PBlT9q4lyo3HLxrZ
 33k4GuGVoC6Y0BF7W7ZydCQkURi5IGJ4gSrayrwPKuMKzV+HvNxYpSRxWlVNZ/B9My4+8WK
 k+0GyP1cu58yDldtPlc4BT/RZpIXDLav21LPAItauomprDGTTGIItCU9oSKr/pksSmQKcnu
 08UI5vtMRw/ZY3lHtZ15+flPDwFYR8gT9QwYjTPF7ZOwLQ7fDbVMZAUZ4p/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770877220; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S2T9IXFwUiYZTRMhp33CgPKcWN/I0lee7iqIsH8d9sU=;
 b=E5g0DFCNfzoOxZJqKRhDlJ0u0LB9RfWkbNiTaLcA+7GOj9qe+uTJneQF4GnURkSXO3ojc
 bxraXw954mWNgCf9+ileH4MZmgzXhwVbkGglSYY9Z+cWlXggBxyUHojT83z0soBql+CbJMN
 kjI7pW4mP98JSDB7YtUxVgD04ky0a3A35pV/YsH43kIRtcIws+krUUaK+CvV6Lh8XPCL33z
 uqIzwIQpiluEGYZ4MhhIqKtdBFwCvCAVE/V5TQp2bEkzW0fUMb/IJ3L2+pZNgyLYbSxogYN
 gyfKq5VkaxTDn8uslJfnxyBJJMtoTqgvdkeZMYn7ViewBXDO2xmWwRh5Vtig==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 132EE40469
	for <nouveau@lists.freedesktop.org>; Thu, 12 Feb 2026 06:20:18 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7AA610E6F1;
	Thu, 12 Feb 2026 06:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UInRBus+Q733c0rAeFSWAQ8REnlIfNjy2cIVHzQSR1LpWZA0/0mP/SXBGeGJKCvkW1nOiK/5DBKpig1lceDQ+GVvnfccUY0lB/WUyIxduzMHUNHTQdEQXvjXmlMUKreSL9PAHPzppbjBZMc0kIAFgMZ60ThV5cH/sNd+FSiO9bsvasHGUeEpwC3Hznd0k0dWPJpQzL+uf2DSNuMSGTUyRKvWnmzWp4jMNWfpQHXd3IVQsTsiaNio9VNRV8il3gG8Jobd6fpoW8QwNPIjMd2P2eMflN6XIPNmclH5hD5eyGqmby+CyhYDBpt/RBaM5O8EU70O6DEzSTZoxEpHekN7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2T9IXFwUiYZTRMhp33CgPKcWN/I0lee7iqIsH8d9sU=;
 b=GiGNk59AdbQ1i5bO3AVNiKXVkg6V8RuhDH7Tih99M7IcrU4CROs6Bou18abNzYV08TJAUrfnnRuk09hXMYLj0Hc2+RpCwkUwRGRKzglaaQvmOLBQHB3iZLHqlF1V4pJ0VWcTuFJwJUmWYIVTQ9MG5G2T7DTSSdUx5C1T46nNgXcGClks4ddAemWC9oNJV4RbAZ5XnU8LJpTwdgk4adCZK6w08XK+1YT8nTRIGXLHeTWWwKWAu4WzgEARzCIxmXVZjwZ3+Oiupz1l8ItpvxzT0dhdXe3arIlgE4X/2I+jDhy4ppPX+6NLyshIJItU703n4IOYqBzOJc42Dbw+O/MvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2T9IXFwUiYZTRMhp33CgPKcWN/I0lee7iqIsH8d9sU=;
 b=qghApmAAqKmOGKlVEn/kcAf7FNmpQrlL38gQJXHcn96YfLqZ08k89yUpFVApIjFEFIg6lUNH5UPJRztW5fcZctEznEInCNBHRfELG6bv0JYWDHVd8nlgzFFX8BjZNck0H3+hNTQ5H8U5CT7cxvxISzP8F130SI7+nIXDQkURoS6E05Frbr5wQBQ0Hy60/J3nxXuzCndjNitqfC0b/y+Z9Dfg15BYumDzv4xoyJN7kCKEiqqhyjiXGWKHmAXA9/M5KPQHiUw7rfc53ZZ1UCQhUVEt8u03F5fjue2YWJMA1Kgmh9zHks+73QB+06/IkerzTP1xCY8qSp2uSRDUFjB/RA==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:49 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:49 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:06 +0900
Subject: [PATCH 4/7] gpu: nova-core: gsp: clarify invariant on command
 queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-4-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eaccad5-9f50-4779-ce05-08de6a001f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2FBMzhtVDNkcTdTcnc3MkJHWGhCNXdhRGQzeUg0L1ROZkk2YnlzVXNzTCtW?=
 =?utf-8?B?ekQ1TnkzRy90ckN0ckdmMHI5Wkl0RnI1cWQ0MjBWUGEwWlBhSnhMcFBiRGV2?=
 =?utf-8?B?L3A1cXVrYkMzOUZYSDlCUWRFV0Yzbnc0NXRwYkdIM3daOTZ2anlCY0hYV1R6?=
 =?utf-8?B?bUl4NXJSeWVTNmcxb2grMm9VU2lFaTNsTDRsQm1LWW11SmgvUlN3M3hNamlH?=
 =?utf-8?B?aG1uU1B6ZzMzbW00TUNQdzRHcmlNL1lqVGxodTNnSTM5NXZZYWRjLzh6U2dZ?=
 =?utf-8?B?d2phcFM1K3FWSHVLTmhEenVEQ0sxK3BzeE0weDRxdmhWdHEzN3NUbG5oQW93?=
 =?utf-8?B?Y3RJck40VW5HY3hhTzgrdndVblNNWWNBVW5HYmtqaG9kR0pDKy95QkFrTTVF?=
 =?utf-8?B?Mmo5cUdZaEtSQUdUZTlyb1Q0RE9DclVnOVRGWTZsOHhJWUhSTmxLTXhlTk1N?=
 =?utf-8?B?dE1Ocmo3bFVSKzB3Tk45bW1aVTR1eWhCNHZabElwQThTZWV2UHVRNGxIaWhP?=
 =?utf-8?B?STNtRlhQMnhPOEhPSm95WXlISmxQczdtOXdPcWIxOUVIK1Fkb0RnVlVnakYy?=
 =?utf-8?B?QnhjNHAzR3JiTTZiV0dKRlZHVTlCeEF0WEZKZ0NzRUVpY3I5R1JqLzF5TUZF?=
 =?utf-8?B?TzFPdThiM0xkdGdqazc5M2J4cEJRS3lwYnROWlg1dVNyUUhoWTA0VTZLUFZ0?=
 =?utf-8?B?ZE1BUGxLd3ZMU1J4ai9NQjhUSGdmUXF0ZGtuZXVsYmxjOFdNMGFYVGY0aS9J?=
 =?utf-8?B?S0NGM0ZuN2UxLytIdC9aKzJ0ZGlqSWRaaXlhNUhQRHc0K29PT0NwZGNoRm5l?=
 =?utf-8?B?VE8ycFZvME5JeDJ5cjhWcGRBNFY4VEw1U1BPRGd3aEZuVEdDTy9sSmNGWnhl?=
 =?utf-8?B?cEUxU1RSeDNxSExuZERuWTl2K2lwekJrcXZZUDFJMlJ2WGVzdUJmUGhRNzVB?=
 =?utf-8?B?N2lzc0dIR3NFNWVTajBpU3ZBL2xaQzZ2aEhkSGkwSitYUWxweXlXOHp5T214?=
 =?utf-8?B?ek9KYklWaGZ1YTREUERpQThqUDBmOCtRYlNNaml1WXFkSHduRzZabjhJUmxH?=
 =?utf-8?B?R0JwYVhsSU84elZuVjRxRlFhcjFQQXFLc3UxSEFIbGM2Z3l1dkxob1M3OGdr?=
 =?utf-8?B?c1UrZnI2ZTRlRGFvME82SjU2Wk1iSmd2UmUweUdsTVlxU0JuVjd5aUpxY1Vh?=
 =?utf-8?B?RlZYanBTTDN5ME56YVc5YXRVeVN2aGZTT295NzZOZm5CZXFSd3BzRFJmM2F6?=
 =?utf-8?B?NWFrVzAyV1BHc2FFWGxBaURHZXV2YmhtRUJGdytTeUtQTG02c2Nvak1rYUJZ?=
 =?utf-8?B?eCtrQUxOdDNsT1d5d0FxVFlZQi8vVkY0N2twc0ppNWJpdkV0YWZCRC84c3pp?=
 =?utf-8?B?RFpnU3lnb1U3NFNkbTdFODVYaXhLejhFTFE2eGJIMVNpN0x0REpvSEkrOExq?=
 =?utf-8?B?aWY2ZGtEZTArVzhCWHdmK3lKYkk1Ti91R0dTdFlJNzBIdk1lcGlsRExhWEVi?=
 =?utf-8?B?N1ZiZjF4Y3A3b01nNjVOa1FCRUtKbXBIemtiN1N5ZHRpc2syUUJNVUlRbmI0?=
 =?utf-8?B?cWI1VGFhVnVDS1BsZjkzdWRuN2RiNmwyd2c0a01OM3UxZEdrcHVaVmFDNkZx?=
 =?utf-8?B?Y0xQUzJhR3VwSEZvOUs0S2JxK2N1eXFqMlhab1ZpZStYWlNUNDFJZEFxVEZu?=
 =?utf-8?B?WmtVYjc3ZUZROTBLcHN5Wk5Hei9UL1lyV2N1d0tJclpOL1pUOXNuNE9UWi9Y?=
 =?utf-8?B?SVAzSHJ4SGsraVliRkdGZXBFN2VNN01odkRqOGYvSzJUeVBoOURsR1pIS0dU?=
 =?utf-8?B?cHhXN3ExVUxCV0lVa240MkZGL040UitCTWgvc1B3SW9uZkZ5cUdKanR2YUlu?=
 =?utf-8?B?bXFqaVNJa1dlWW9Rci9JL2FHSnlvb0I1Y2laUFB2a1VGTDYxaWcyeS91SWtq?=
 =?utf-8?B?ZVBzNUpyN2NaejBoZVhUenp6ZmxMamwyZWl6ZEJpT1hkdFFGSURCME5sTzE4?=
 =?utf-8?B?OXFKZDQxUUNDVmFsUUo0YndlSWoyMzJxL1ZpOUVuNFo2b2NYNGxBZlRhS29K?=
 =?utf-8?B?a0ZsU1NjTjJRdDBaemJLenJ2Si9uamFoWmhyVDFOSXdsYmQ3OWhUMHluYU5Q?=
 =?utf-8?Q?Z6Vs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck10emljUVJRUzVqVXZnYnR3RDkyLy96U0dBQWR2S01yQlNtMzM1ODBhQTF0?=
 =?utf-8?B?Z2hPMGF4YUhXeFRKQ0xsYUNjWS9YRUJTZnpvOVc1VElGdHVFbCtzNnFjNXlB?=
 =?utf-8?B?enZIYzR6VTJycGxnMTRoV1ZrUVF0UlBkazlaelFWcXpncUxmV3RFbGo3RFRR?=
 =?utf-8?B?bkwzeE10OWlPK1hqWmlxeXFsMFZ3Q1NUUzJGcWV4Zmh3eTFxZjg0ajllc21y?=
 =?utf-8?B?Wk53MFdONllLRzlUQytiRnR3ZHpiWmVPaThKa2hveTBhWnlpOXJGOW13b3ha?=
 =?utf-8?B?OUNsU0h1SUFoSFZmbWFObXhFenMxY2ZhYUpLMVV5YllHTFo5bW5vcVZObG1W?=
 =?utf-8?B?aTg0NEpqanN2S1hlbS81bnMzOGwxbDYrUDgzVnhtNDUwKyt3d1VuNGNLZnNZ?=
 =?utf-8?B?ZWxFZWpONDNrS08ycmxzV3RlYkszclQ2NjBVTnpIbk41YWNCSGtSL1JQU21N?=
 =?utf-8?B?UUFYWWdwaXpWRGFLZjcxL3A5K1g2VTNhblBzZVkzZmJpRUQ1b1E1azhwQzBM?=
 =?utf-8?B?elJ5bVkvRzdTZ29rYkRWb0k2Y1dkOXk1YU1oWUNnOGZXR0hNRHkrTU4zbVJq?=
 =?utf-8?B?VnMyVHU2L2pGVWVzV01Xa3pRa1BpRGViV0htZVhyRmhnMzkwMDk0eFdadGlr?=
 =?utf-8?B?UmtyOERiN2VoU0VPL1ZDM0xMQ0xrOUxkUStZWlB3bW5UQS9RSi85SFZqdlFF?=
 =?utf-8?B?S0RBSHUvQWxPRDZlUlllQU1wSkVtNmZZMUhsL2Nod0p6NjlvN2ZiSGk0Z2tM?=
 =?utf-8?B?VWxYQVR2NVZHTnVuZm1YWGZtM3Noa1ppN3Z0VWtrK0ZraWw2bktHd1lFa3V3?=
 =?utf-8?B?a3YvZVdXUzFSNkdhSDBVc2lJVW9ZOGo0Rm52VGV0aHNSZ1RpNUI2Y1JzMUN1?=
 =?utf-8?B?RUtNYzBLWHhobWh6YU11NXpST1pWamZ0K0lWM3ZsRWpMQTRlMWY0SER3NFo2?=
 =?utf-8?B?R2k5MmRzU29ja3NkQ0ZlSzZxQmtWR1QvRzRYUlF0c0RBTzBCdURMdG5rdTRX?=
 =?utf-8?B?bEhNazlQTnVjakYrdzhoS3FlZjZPWjNZV1BQbG4rU0hhdnMxaCtndXVCRE1X?=
 =?utf-8?B?OEd3QWh2UjBpZ05NYUQzdE1PRHhFNUlPNzlpUi8vR0tUTkpZZUxHaEh3eEFp?=
 =?utf-8?B?TjBBN0hGZFBmckpvaGhNUTAyZTA4RzE4MlJlY3VXQlVGdmx0YVYrSnkzLzBV?=
 =?utf-8?B?ZjliN0pmQUxrcHNCbUtDNEx3UjZxaWdEVHFIdDJ6aHdzY3BCaURuMzZEWEZB?=
 =?utf-8?B?ODMzby9ZOXJMNEd4cHFqL1h2UlpHVHY0V211cERvOEYweklzZkFpcGVoRkp0?=
 =?utf-8?B?c0I1ekNxb2dSNnlOMEJ0dWtkT2x2eGpCb1dhV0hMTG8wQnQ2aDFZSm1OOW1M?=
 =?utf-8?B?S01RbGcwOFRLS0JsYmVUQkRUTGZRZFQ5a0hOU2t6VG00KzVOQUlhQlMwY2Jl?=
 =?utf-8?B?cTJMOHpyRThZMUVwSGJkbStqaWJmZlUzMDNYR1ltK1VGRXArSHQ5S2xhbmQv?=
 =?utf-8?B?Q3Q0VGhvbkVIdlE0U01WRnM1KzRkSmM0UXJhN2Z3VVJyTFNJMVpnZXRQdFEy?=
 =?utf-8?B?K2J6WGVESHo3ckJ3Q0xKd090clE0MFFYSUw4LzVncDdEdENSR1k2N05aaWZj?=
 =?utf-8?B?WkpTUkIwSXNib3VJQjdyOUt5NnZFVVJ0S3lPV1RCSERpR3kydXNEbC9xaWNu?=
 =?utf-8?B?LytVU2JFSDF6dkl0MFdBZzJndmd5ak5CSi90RE1DQmgzUWs1UXNtTGs4RXdN?=
 =?utf-8?B?NmVxdmkwMWFWdWl2Ti9OUHFOQmVSMGNzc2dhaUNLbVFXWm1xdVBiUG5vdUE4?=
 =?utf-8?B?QmJBNzNxaFJFSHdlVUVxWEVMSEpYamZxUGlWK1N0MFhHQ08wVkpqbG02TzdR?=
 =?utf-8?B?TndtVUE1SmZraFlneEdBTDVSTnorbE9XYmV3b1JQMS92THJsQjFMSHVKdVlK?=
 =?utf-8?B?SkpuNHJYeDd1UjUzZUJ6VlFZSXVvYk56QWw3RW4zKzBZdkxXTlJ3SGgwWDZV?=
 =?utf-8?B?anRMbDVRaXVZVkNXeEI2NW9kODFQazVZdXM5Q0ZFWU1IbFdqbmVmdXVXUFFD?=
 =?utf-8?B?L3p5ZFo5MTBvK254WEtVRDgvREdkeUhTR2dNTG9KcFJwb3BZRXVlZ2FxWmpV?=
 =?utf-8?B?YXVwamh3bkswTDQ2VHRmUDEyUExUYktoWS9tQWJuVERqaXpHQi91MzdCbHRz?=
 =?utf-8?B?K2dXMTJJU2ozTk9VdllhNUxYWlBFcEYrL094V1F0VGtBczUvOU1LMFRHVFVU?=
 =?utf-8?B?WEtwT3J5QXAzSTF6K3NzL2pGTDcvS2FCQnFUVE83bFdrWWwxb0d3aEdjSlh2?=
 =?utf-8?B?NktJeDFkZlg2Mm1TZ1BtVDhibDNmZmNLNVVVWCtLRDd1bUNDQ3NqUDJVM0t4?=
 =?utf-8?Q?8L6EAVLy+wrCcKDsQh0mKdw7X4H1QD+4O3UiLEXYCLjIV?=
X-MS-Exchange-AntiSpam-MessageData-1: 7SRal+t1Kgcxdg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7eaccad5-9f50-4779-ce05-08de6a001f54
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:49.3985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tvjNAVwuz9bYn7Fn/Lba784oKEKZD20WV3sdWr0Bzp9DZCIkDhD5Ug4bvi1plm35/tBhWdN/LkLO5xgxwfqAyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
Message-ID-Hash: ANSLCA2Y5LZYDBYXZRVWBU47SGOW3D3U
X-Message-ID-Hash: ANSLCA2Y5LZYDBYXZRVWBU47SGOW3D3U
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ANSLCA2Y5LZYDBYXZRVWBU47SGOW3D3U/>
Archived-At: 
 <https://lore.freedesktop.org/20260212-cmdq-continuation-v1-4-73079ded55e6@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index dbc9e95f1b17..78f0b1a0e30c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -542,7 +542,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         let command_size = Self::command_size(&command);
         let dst = self.gsp_mem.allocate_command_with_timeout(command_size)?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0

