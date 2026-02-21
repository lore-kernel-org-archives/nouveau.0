Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6BCC5CFF1
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 01:07:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE6C410E857;
	Sat, 21 Feb 2026 01:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SI6vcgYp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3028D4344A;
	Sat, 21 Feb 2026 00:57:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771635443;
 b=EoBUzE1GX6Q6vv6//SsWcS9Bw6PsvnL8bkZwGqjITWFFXFHhTeQDoT1zNZKu6Riby2UX9
 Aed+nqrjaOXSiiq6lxj8HJgWpnrFxh4AKAY0mlZztEfsLWt+EOp5SLtY6yZg+L3E0vSXQqQ
 I18LVsfMUDCcRAwunuwsgdtqQn+QVraZLu0Vc7XSXx3cuz6R7ISIMkgM2y/1OKi94nrZsnN
 ax3LdlnqfOGWvKjaNBaOlJTl6h5hHAZswQKPenjPLER7x5b4Kkg05YFnqC/kS/WzLIjVZ5u
 0hE6PN9PH7bbqR9QGKjNfVu45uFOclDKQhB4DTsiCeh1nbi2RmiiShoHZ4sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771635443; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0SIVfdhq32Tx8UWxl1W/GMsHLpHRZQrxFOZxt2kV208=;
 b=EiikuORxuMQyjcMQGwXV5vM9EU6lL5N6+C2/TFoXLMltuzAa7M1yUgUU6Le5uQrlTxJch
 XftE1sbA2veXrfqyYDAhwbapSmBbvE1s+rLpVBKVXRB2A5lU9viUtcDEQgsnFfioeCGIX6S
 71Dgv+LyJ4jb5gEFpWR6ghMEIUfjlqCHIwpk+BzlN0nzjVMfZviiHzaugmoiEyHqn/NhLoJ
 BO0tQQUu2LJy1AKabkmXdoVDuhNM2vbSVQR409O+m8T8+BQhtJDvnaiuOI2Nse8J1hsF9tN
 e3gVVL9LHN1zaG9cf/llealS9G489OODUVJjzZyjeGfNHpBp5QCwG9CY1XqQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6A21241A0C
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 00:57:21 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013044.outbound.protection.outlook.com
 [40.107.201.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE55E10E0BD
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 01:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOdyP8MjTIc/elLM/uW56QluY+yTquT/ebwMBlDKv7cXNPq49T3dVSiE8onQiDlRWaAq3Ju+zAzinZl2Ne98bq4qQ1QQY6nKJPXhA+I+/UaNA9eBBAjJkyHBseVJADBJg6DTUxiB8pO1vEWoa443yZPGDxogl7KHly3pjMyLctpZKC1NCUAw3+PTTDNEUTlmgrmwf1p/ioqUsheF6Ok/GvFY1jnqoVtrbfb6hqU/Ft98Q+ClVFhCVDkmqUu0R0KAgwk19DcSSdzAFRx7gUm6lGaNZhW9qIaJbgr3P2H3pZw39uhXTlr7tCE35rp6bYNZpag6l/UQKPoWthb93z0RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SIVfdhq32Tx8UWxl1W/GMsHLpHRZQrxFOZxt2kV208=;
 b=BC/1cln0+bPxuP74D2ivH09YdRYoA2/SOCKvj3suMD+bMSFhkt7HnprvqeV+VVZteTb9yTle1DiaxNWFpNLaS+FLtnl0lkJXPyn0Sp/SEOUHMuRN3XeQe2KiafD84osJ/mCofHehnf7Iq1eO15giFWuFuv5LAnYy0ilYGo5ufHSVrJH6vyVRcEbVpK3hYcFQPoTSRNheGcWJBOWvGB5816nP3qbIZEG8pJ4jnBYRG4aZSRRZ+Fd4ZWW258TU4XfDEBLfV98YTViTp7znBVrD9P2u4MjmBNsqMDRamI2V9MQO0mHLYKiK4mvgCv6GvfJW6IE+Z04lr7rYwnOBYBBf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SIVfdhq32Tx8UWxl1W/GMsHLpHRZQrxFOZxt2kV208=;
 b=SI6vcgYpaflOkDCI26hsLYD13JWmhMVQD+scMOhaaImsOiKdaWVu4YOGLy5UbaygmoZsQgy5DdAey5F7TlnJWxT1Sz5MuKc/CBFRlKWguFf7xsod/6gyGo1lsWgu3MDkXKp4Bit8LrEeUtl6mvS5WmNCKDYsaU67peRwMCMHyrNZojlJwuhFC4kXLn2L2HCeInVs46ecamdmU/PliACDoDKpEDExLBAIyTjqvCL+2S7IjZYa8/pz+rjU7Zbunnlr9MqbmF4QrVNNK8U+z0TWhUHGsz2GZR2/fbfUuF9Ms8omNEQG7AJipDZeAEUZ95lP1Rdlz7/c7HTddxWylq63iA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.17; Sat, 21 Feb 2026 01:07:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 01:07:06 +0000
Message-ID: <5f896265-8be7-4843-9ce6-8ebc5c121c8f@nvidia.com>
Date: Fri, 20 Feb 2026 17:06:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/33] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
To: Danilo Krummrich <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-30-jhubbard@nvidia.com>
 <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: ce97d557-05ea-44db-9ea8-08de70e58784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tzl3VTdmc1NuMlB1bk1LWUh1RDFQYzc2WW1lNTRraEU4cTZMK0t0Z2FsNnhO?=
 =?utf-8?B?Mkh6UEo0SVhJVE9MTEpOREJ5eU9IMklsU0VUOUZXRzYyNjhpYWxsNFhtQ2Na?=
 =?utf-8?B?b2RMazEzNVB1cVVGeXNJREVQM08ydWNoRVc3dnhSOHA4WHZPK0dDNm5IZTdx?=
 =?utf-8?B?aDEvUzkySmFpdlFQL0VNWXVVVVJXZElFL1hBWndOS2djaENiZ085cSt3ellK?=
 =?utf-8?B?aTAxTWU4QmRJWEF6WFlDQXppSkFlbGM2SytYY1h0U2wyTUVwY0RHZGlXd3Uy?=
 =?utf-8?B?NDlSV3I4eFFSbnBieFFVZW5QMmFQWGhGVGdKcURvcVVBaDVCYkdWNjF1eGh5?=
 =?utf-8?B?Y0tkVy9zNCthTGZxTkYzZm5PaUpvK0M2Tkp3eXpqZnc2V3RNaXFkME80VEQx?=
 =?utf-8?B?VUxBT3NIekJuT3E3WjU0N09tTllFVytZbm4xZVM5Nzh1ckduVUFEY0x1WkpP?=
 =?utf-8?B?K0MrSGtzVkIrUEx4Vyt1cG1kYVJXZWtKd3dGL0k0NVZCcXhva0NiSElaS2g2?=
 =?utf-8?B?bGwzeHlkTVZoZ0N4RURuMkF3WHpEZkJVWWE0SFNWZEhjckNtVzRXbngrdERJ?=
 =?utf-8?B?eU1TS3NlWVFiSEQrQW9nall3cCt6QkJteWg5N3lvUnRFSEEvUFlGQ0RITDlY?=
 =?utf-8?B?WkUya1J6QkJjSUVwU2JjWnl5TlBLRW1uSlE2VkFmZWxlSWpWa0xYYTB3Q2Mr?=
 =?utf-8?B?bU04NkNoN1N1Q2ZBYXdqQVkyditJa1RweFNxamg5Vm5USFMrQUdKdGpRS2M5?=
 =?utf-8?B?WHR3MHRvMmF6SFRZNUtaTnFJZnJEWHcvOTM4a1BvR2V4dnUxSXBld1pnMjhU?=
 =?utf-8?B?ZVAwZXBhTXhaZlZxeFlMVnMxUUxkWC9TQ1plL0FJTDVWcmF3RGFJdHQ3RTlV?=
 =?utf-8?B?dFpZNENrNHRqaFBJZ3Q3T0xHMWc2MXlWbFN4Q095cDY4NWFncFBpRzJaWitW?=
 =?utf-8?B?cHBtOHpYNzE4RHQyM0hYWHdrU0hwYmZORjNONjAyWG52b1NCNkRrSCtqMGVB?=
 =?utf-8?B?a2t2SlBnemMzQ0phSERGNzJvMFFnQnhWL0l4SGhCRmovQUJwaWIvb1V5bXdM?=
 =?utf-8?B?aS9BTXh5OUd1OUVObzZNbUxmSnB0Vk1tWFgzL3ZCMlVNaUZZM1duMG1hQmI5?=
 =?utf-8?B?elZQc0xNWEtPc1hsNHFoZWVYOTNWWkh3NWpkNlhRcDRKRlhOYkdDRHRvT25Z?=
 =?utf-8?B?RUZPdHFvTCt5aURUTkZXVFRsZjdWcEd3b2cvcVkyWlBLUlVZQ2hZM01aaktZ?=
 =?utf-8?B?dEFkQTc5TVYwNXdPVDl1c09zWnhvNW00V285VEN2aHY0VDJOaHR2UEVpcHdz?=
 =?utf-8?B?Z2hGRWhnTXJkVkg2bUJwUkpkYWZDWE5DM2Y4R2FGRkRTc2Q2Y3pBalM4akRR?=
 =?utf-8?B?TFF2SUYyaFJmZE1DTjV4NjdFRll0Sy93OWYzS20rbVEvQTY2NGxQT1RDTVVM?=
 =?utf-8?B?U1dJbTAzVENSWDltbEZTZ21UTk53dFZtMXlBcE9ENTNwSEJnbFhweU94SWlC?=
 =?utf-8?B?K3h4RlFZak9ZZHVJNHZtcU81OER3bWh4ZmhTRlozUlZVOWg4cTZoemxDSWR1?=
 =?utf-8?B?STNaMG8xNTBNTWgyQS90MjcrZU5Tak5pY1F6Y1ZZb2NxWWRxZG9xUmpMN0R0?=
 =?utf-8?B?VTZpNTVJQVFueVZydkxsYXJTa08vR2lhT3FxVEVQUUhEWjZCWE11RFAwWDNv?=
 =?utf-8?B?UWl0dS9kQTdtazY0SlpIMVJTT2dmR1lIczFtQmVSWitzQVVaVGhOdDNFSXJM?=
 =?utf-8?B?NTJyUmNiOHNzTThKaGpJWnFiZ3p3SFpKM1FYZUdOU0xSZHhQUlNoVEx1Q0I0?=
 =?utf-8?B?OWZSR3J1MFpJWWhOV1dOUHpUNk9kZHVjWFFCSGQzck9mTXNxaEJwSXRJSGFB?=
 =?utf-8?B?Y2NXQ3k4SG9ET2tnSHVvWXFHR0RVQ3FaNHBYSXRsZ3IzL2g3VEROWkN5L2h3?=
 =?utf-8?B?V0RobFovM2RvZktFMjJGQXg3VTlLOFpCMkpjQWF6RmprSGY2UnA5NkJJQnds?=
 =?utf-8?B?ajZWYm9KOC85QWd6RFhub0QyNExVaU9Lb2tieWRUOGZwWUtSVnU5VHd4Z0do?=
 =?utf-8?B?akkzZ0t4YmFzdDdnamZKSEwyb2ozRHFZL1cxV2tKc3BROGtLSnlMNjlsVVZ3?=
 =?utf-8?Q?cm3k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUwxa2hnS05odHNtODVmNTVHQk5VeDRNcWxEbURHamtHb3RuZWVNeUttc3Iw?=
 =?utf-8?B?UHcydlNCL1NuTWtMTVE0cEhqVTRZdlVKRHNab2JUTGZiMHlKb29BcHFYNGtx?=
 =?utf-8?B?MXFDdE5PTmdXYTk0Q2F1ZWtkZHBYWS81S2lKZnBvbm5WaTB0K05CV29VQ2Iy?=
 =?utf-8?B?alMrOWY4Qkg3M3dKc1Y5RVNmR3ZueG9hME52R0ZTT3BpUTVmbTdiaURRVHps?=
 =?utf-8?B?TDhzbUtnc2lqQWp5Y0tSMHZOZGU5RGJ0dHRDb2gwRnV4UE5rVUNOVTBCNG5U?=
 =?utf-8?B?WFNYNXZucUZtcnZEZENUT2hFZnRrK0QrVXJNLzVGeXZOcm9xdDh4Q2ltTy8v?=
 =?utf-8?B?TWxaMmN2M0FaSW02R25XWFRZYWpDVVV6UkM4OGZxSHdrZWdQY3NhcG1SNUJS?=
 =?utf-8?B?dG8zMHdaeUwxaXlBMzZJdExwMEdqMS81cHlFWWZwbGpJLytwZUhiMnMrM3hk?=
 =?utf-8?B?K2xyamFKUDl6TThLU1ZTUzRqb0RZN24zMkJ6UlliNk01WDRZamU2RStXcE5r?=
 =?utf-8?B?S2d2cEF1amt5UTQzVC83K0VSYWJ0UHRDVzFkTVVXck82aXo3V3NkTi9nYmZ5?=
 =?utf-8?B?dXI4QmJJVi9GOElXQlNYUU50TFgvSG9sb1FmWlc5SnZoNEx1L0Y2eGdoRkZi?=
 =?utf-8?B?Y2pQVVA2R2dvdnF6Q1dFSnZoK1FucnpRWEVrbVlDcXJGTWg5Smt4cFlORFNQ?=
 =?utf-8?B?dHZmQStSQXlFbzhEemFBZzdwbjhxYXlXSXNtcWx5cFI0OG9YTGlxTGR3Wkpu?=
 =?utf-8?B?Q2lFSUlibGJXblRKaEpXcTcyMFVNWlRza0dRR25iLzlOeEt0SEtvTWsxVW9N?=
 =?utf-8?B?TVMzWmcvdDRDV2dha1FUZVRKcDUyRFRITDRGbGdpVG43aSszaW1nSkJXY3Fv?=
 =?utf-8?B?dHRWOHdLTDNWbGpzT2xFdG5GOEpocmVkT1YvaElOb3V2bEl4djBCT3MvSjRN?=
 =?utf-8?B?dDdMb1l2V2xCVWdKTk5KWUc2VldJaDRDUDNIeHJRNlBuUGVEa0ZXWkJvNmZv?=
 =?utf-8?B?amdVK1JPUlh6RzhIbkxOWWVQM0tDeUJjSnlkL1FJblFLUk1BUjVlb0I5blFQ?=
 =?utf-8?B?WEswV0RIMTdtSDNpZHRYdklqcmJNUG91R1JUWVlwekE3aklGVmRxNlRrZ1ZF?=
 =?utf-8?B?SVRuU3k1QUdKV3lWWWlwRnQzdis0TXF3SXdtbXczeDNTU1RybEYzWnd2QVBa?=
 =?utf-8?B?RGFWVkNFUEEyUll5dlQvblFuY2dOd29sQXNGcHBCTEptNDJ3L1JSRXlMUStT?=
 =?utf-8?B?T0xPOGxWUlkxSklZUk9td2pPcW5lTGpSaDBiL2FOVUxMRWZ1RWtEVlVCSEVD?=
 =?utf-8?B?cEdCd2RNYUZ4a21xdmRrNzBvekV5RGtBUlE0bU5QeTlTRjZJRzVRdVBkeTBo?=
 =?utf-8?B?Y1VJYkJjSFhqNVF0aVpQZStFQlR0UHNaeDB6R0JXRWUrSFYxMEVkdTE5K3o4?=
 =?utf-8?B?TGIyZnZpQldFOHBUdEU5QUIvODBlblpYTnBxT2FrRENlLzFKRWRtRy9PTWQr?=
 =?utf-8?B?TGhUZnY5bVBaT0hHUTkyZ0R5MWVqWGk3RjgxT21JOVVRMkRCOGorcnlkek9o?=
 =?utf-8?B?WkcyRUZqYUhJSUFLdXpTRld3OFhpVEtlZWk0ZUpaNDdmWHRVTEd4cTBQV3JB?=
 =?utf-8?B?L0drMU5FdDFxZ3lKdlN3dk44c3JhN2RwZW5UMHVKcjh5WGFYZzdNWXI0Tk1O?=
 =?utf-8?B?dUVkK0E4T0xQM3lxUktESW0vaUVrS3FpenQwQ2lDOEltNk9mUFhXL0NSZjlu?=
 =?utf-8?B?bkduQ3JJRjRQNldWaTBTN1I0SjRmUWZEMkE1ZmJWWlI1VFE2OXVQc3lLUisr?=
 =?utf-8?B?R3FwMlZVWFg4d3dIZ0NackJVSzdod3hTWTUrekNPVnFsVUx6UEJGeDFDUUxy?=
 =?utf-8?B?cktSM0hJMEwzWndXaDYrQng0cVh2TmtSWDk5a0hPM3N1d3FlN0dVYlErdDBM?=
 =?utf-8?B?TFgrVnRFbzlvZkRNR0ZZelN3UWpOK0IyeEJQKzUwWWdockVBZm5mQnpmY0E3?=
 =?utf-8?B?TDhwdUpMZW1GYnZLZ1pERVdwN1MxdHp0RkpuOVZTcXB4ekxmR1lRKy9kVnh3?=
 =?utf-8?B?Znk3a2ZsUGN4eC9ZZWpMUXVFMGRLa3FsQ1Fxdm5IdlRvUm56bzhkWWl2MDhu?=
 =?utf-8?B?VUV0UlZzb2pxZHlXdFYyVGN4MVdrSnFoVitHZlljVHFKK01vT1pKZkthcjJw?=
 =?utf-8?B?WThBQmE4Ukw0QVNwbjRQZnNLVkZxMDMrcVZqUStxOVc0Zjk4cUJLYk5LZ3hX?=
 =?utf-8?B?VXM1KzFwdnFpQllsVzlTZittWmlkdDZTcXdFWmxhOHJjR1R5VXZOaWpSekRs?=
 =?utf-8?B?UmtsZURCK2Zhays0czd4WUZYWWZiVFlWNnNPZ0ttMjRtZzZjdlYyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce97d557-05ea-44db-9ea8-08de70e58784
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 01:07:05.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Zou/mfge+XHO0VynwVribOAnhoM/hjEj6lmHLnYBC0TWbcOCqOR94FPWh3FWwSZXFtVT1sRtlvSoN+sYgLBKnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457
Message-ID-Hash: BREK6Q6QOIWCN72K2LK6BOVTLZYBRTQB
X-Message-ID-Hash: BREK6Q6QOIWCN72K2LK6BOVTLZYBRTQB
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BREK6Q6QOIWCN72K2LK6BOVTLZYBRTQB/>
Archived-At: 
 <https://lore.freedesktop.org/5f896265-8be7-4843-9ce6-8ebc5c121c8f@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/17/26 12:20 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> +    /// Check if GSP lockdown has been released after FSP Chain of Trust
>> +    fn gsp_lockdown_released(
>> +        dev: &device::Device,
>> +        gsp_falcon: &Falcon<Gsp>,
>> +        bar: &Bar0,
>> +        fmc_boot_params_addr: u64,
>> +        mbox0: &mut u32,
>> +    ) -> bool {
>> +        // Read GSP falcon mailbox0
>> +        *mbox0 = gsp_falcon.read_mailbox0(bar);
>> +
>> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
>> +        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
>> +            return false;
>> +        }
> 
> Hm...we could create a tiny type wrapper around this value, and do the check
> with a method, such as Mbox::is_locked_down(&self).

OK, done in v5.

> 
>> +        // Check 2: If mbox0 has a value, check if it's an error
>> +        if *mbox0 != 0 {
>> +            let mbox1 = gsp_falcon.read_mailbox1(bar);
>> +
>> +            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
> 
> This could also be part of the type.

Yes.

> 
>> +            if combined_addr != fmc_boot_params_addr {
>> +                // Address doesn't match - GSP wrote an error code
>> +                // Return TRUE (lockdown released) with error
>> +                dev_dbg!(
>> +                    dev,
>> +                    "GSP lockdown error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}\n",
>> +                    *mbox0,
>> +                    combined_addr,
>> +                    fmc_boot_params_addr
>> +                );
>> +                return true;
>> +            }
>> +        }
>> +
>> +        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
>> +        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
>> +        !hwcfg2.riscv_br_priv_lockdown()
>> +    }

thanks,
-- 
John Hubbard

