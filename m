Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894ACE9A048
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 03:14:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0A10E554;
	Wed, 18 Feb 2026 03:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VNoprSK4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07EE6433A7;
	Wed, 18 Feb 2026 03:04:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771383873;
 b=wHC5hOYwZ/Nb0+aJ3M2DTb224oRWDmj+tTvC9vwGb4BhJMBH0yFtt+GYT1d4/D7aPy2/k
 sPoQDx3Uu4wPxpFzwhezArycLO9tctZp24RGqYjwidKOYcINGf8jKk8SQgiaDzd1cLSEJJO
 CwpSka/V9V+O2MGnF4of+JtCWEqtWKX5j+Dkf3OeA3GvlnI7rZtzitZLxIp7u6ES1DFKbt0
 Id0uMpInxvpRjlc1+mA0+GedGjU3lnFtZfXxGE9RIyNkDoDKzru22b6eIb65mEvHSp/vgH7
 Do1sqXSo8tN7rvqcY7xTMvWTWTTJybLhFaVCvRSAvekOoGXPSL0OzlbeH1Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771383873; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FlQ/4wbWoGSXI6l7iZAkvaJXwSKePLshzAvYltSrqTw=;
 b=iMlHMa5zXMk0KSP1M5Ojuu70qXYn8HQu0w8fKevBPNT72lVObu1+zwzdxbmPmkcs2KYM5
 qK8cMcMPJFpfW4Ri1qYWRukv4peXgCL7zAKEQ7B+S/4Sda3emUiNz1in68fNYfMp/IG4CYd
 GxDyZ+OqUo7Y/cIMTdgnRxKtxVvRhjNbPSU+W+dMEp6gt3LaRencJXvPHF1WMXtNvnF497D
 3llnwslY0hXuMOqyzgnSgG7YEaDhwXCcWRmo5GCxSAbp1lElI3assNnUAuHZWZqzzclrl4l
 jb8YCcSFEtlJl68yXK6An/qBlf1qcFDga23moVTGh4flUVv8DQ1wvAbTiJ3g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D609940371
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 03:04:30 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9387310E129;
	Wed, 18 Feb 2026 03:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVRyIicWXRnu+n/qzsnyIQtx1+BhDaKrscR1sMTPpECOQx9lF+rjwDgVYDNyxIyzBMScAl9AZeBzT3G89FN9xLpBnhz2JZMxpgSLtv7ncwsnsyOUJXOZe4aKVTZp4sK6RShLJxa+rDXtVrXv0E8v7NnzSLuLAsjqqpe8pg6vpkasjUHOtjTQ6XF1fgkNhX89JP13Ow5yis5MfTA0ACbhItIleAIj4eQJ9OJuVvDI8tk/KZmdkhb7lRPr1+h8YJO6Aidbzuj1Hnmms8txS/wvC7WOjFbO0PLP3ZKo8vaC6OGLvH1ZUkmxKgPbsQqPKoGVYqiCXtZRHezUepdDeF6NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlQ/4wbWoGSXI6l7iZAkvaJXwSKePLshzAvYltSrqTw=;
 b=xaa7Zjx+w8egSEvJOmLpOX46Jmg1ZiEWyD6VZXENYmZC1zW1iIpqcekGcPFPqJlQE7e4D/jXDwxDbdMq5ZRZPlIXziAjcpmkXLauFYcfarL4Bw+1kYuoW4YlSbZdq0zw+C19VDb4/Id1D67t+/WXuN1oZMMtD1kQeChaPC1BOt0t6DS7w3+J5cDCP0caf4UkKV5Sr31suL6T0vIAyMPeqLZZDrfDyLVJiJcaoX8h6DB7j8g6UXV0osqosNAVXF/krCS3NdkEtp1SLlYzgGuFJFfW4SjeKlORDWk07IRcS6ZDftBfC9CNEw40OdNL7bwBAumgPpxjsr2u2A+FC1bC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlQ/4wbWoGSXI6l7iZAkvaJXwSKePLshzAvYltSrqTw=;
 b=VNoprSK4Cr7K+sVs0Indl14U50fKcgPFuFMIYWRBx4Sli56fsb+UGNawSwnpwMLfgXxkL0adpmxHoZSMg21aonkMBqA7+AdtAzk2JLg5y5JsSTyIuJ/ro1rUfEf3jATPwigLlS65ksKgw7TrFPEYYx5PZrW1LRp6QEIfrFof4kTk1VfdnwQ4+vM6o8JPgG8g1/Nvbsc9pZrakvxSw7tFaFwnNKxnkAtLpTcxR72/xMJ31g3mD8Z2LABDqpUOjL3fQAbaoC34AxFUvv32RoEG+CjkwDXVrNASDQ/5R4YzJp578c9BoKeCAKhfndmRxEHqTvkwjO5lRa/5mc/ZS3JEXA==
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 03:14:14 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 03:14:14 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 12:13:46 +0900
Message-Id: <DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Subject: Re: [PATCH 2/7] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Transfer-Encoding: quoted-printable
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-2-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-2-73079ded55e6@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e7d7de-1b20-44d6-8047-08de6e9bc025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?elZ4dFdCbWlWZk43OGZOV0tNRmwzWmZIOWRBb3lCbnpiZlZSV1QzbVpHRHY0?=
 =?utf-8?B?N3dMUVBTaFJKUzJoZFBrYXJxWFBwQ2JtK3IxNFBtRjk1S3FtUXFxbEVrSGtt?=
 =?utf-8?B?WGI2NkU3RkRVNmV4dWxVdFJ4Qks1ZWZOZkxaV0gxUTVHdCtYRWswenowQnJW?=
 =?utf-8?B?bVQyRHc0VmtUMzhCUFZDbXNFL1o0SGV5SllRYlV0dktzbEpDTUUyckpDcTAz?=
 =?utf-8?B?SkhVdFFsMmhlVklqSmhtNXJ4bDZITTlnRlg0T0cwd2xEOTlaNnFOK1FFN05r?=
 =?utf-8?B?M0hrWjM3TE1Zait0UWZoU0E4Zms5TVJ0TGFCTm5Ca1Z2MzdCTnhtK0s0VjE4?=
 =?utf-8?B?N0doVm5ZTlN2MlY5aUh0R05ETjlFZE9tSDVDbS9HOFVrRUMvdlVIVDlqVlhh?=
 =?utf-8?B?UmllSnlOejBnZG1iZlVyQ1pBMjRXTWcyNHAzSGRkQlJLK1gvTExndFkvaHhy?=
 =?utf-8?B?MTJsdkxraDFlOTZUcmM0WmFzbGQ2OW5lbWJZTEtqS2srMmlTSS80cDFNQXZt?=
 =?utf-8?B?SXZOSDU1dnZid3hkUWQvdEt5dzdZUWVUZkZmZnUvNHpRNTRWeldWTXdtL3VD?=
 =?utf-8?B?S1YzN29pR3pTaTNDaU5XdDJsU0J3MStKazBpWENnb1EyLzBiZGF6R0ROdEx2?=
 =?utf-8?B?TXJyYzNKV3lXamx5dzlqSnZjVHY4cDkraUg2bkRjSnp3eHRGZEJ2dTVBdnhx?=
 =?utf-8?B?WFpkQi94cHNSRkZCSlhrQ0QxL0g4SXJhakpGSHp0b2djOEJzd0syRTRTVVBY?=
 =?utf-8?B?ZnlzZzdtRkNJVHZHYlk5QUZiUjJyTW84ZTdNMm84L1NoeUhKZldDbzhCS09Q?=
 =?utf-8?B?czVxM1g2c3VqZGJBVm1aazRvUEtIcmd4SFFnUWg4bXVKU3hwNWdRSEZsL25a?=
 =?utf-8?B?Qk4zVjVDKzJTM2cxclFCbGNsTWs2WDMyNEdtTW1vdC9mWFhmUW1yY0xzSmVy?=
 =?utf-8?B?ZExQL05KMnh6ak93NUhUcHNFNHJjQWRMZ3RqRGx6bDI4RjFRTnRQL0QrS2J2?=
 =?utf-8?B?OUVzRU9mRmdFVGtoVWhmcXI2cC95VzQ3S0h3NU1VcGl1ZVl1QzdpYzBuL2lB?=
 =?utf-8?B?YkhQbVlaR3lscDd0UWsrdlVYNkdIMDlOK29sLzc1WVoyS2lwWU8wMElBWHpT?=
 =?utf-8?B?U3R5TjBpc0kzbFl0U2tqUHdGdGUySVV4NmEyY1hzVXlEMmxveG9maHBwU1NW?=
 =?utf-8?B?dElBT01tTDVnY1B0ZXdJTDRsajRsREwrMWI2MisraUI4T2FsdVZaYXpaeXhB?=
 =?utf-8?B?a1JWdnR3c1FBd2RyLytvSUt5QTlhRlA4NTEwSWY1Q3ozWFpVTDQ5SUx3aDZy?=
 =?utf-8?B?QU1VYlJUeHhnZ0RVVkRRVzF0ajFLMzJCeEYyb2ZJTlBFWFk2eSs0a2pwbmpm?=
 =?utf-8?B?dTNkL2ZWU1hsVGduOXVkam5QUGhZWHhIVDBhMFkxMkJvRXhHNmRHUE9leU5h?=
 =?utf-8?B?WVhNM3NsWEp1ZjFxMUZ6VmRvdkN5aFd3UHlZeVNzV1MwK2NIRXY0NW1KUDkx?=
 =?utf-8?B?aUlFM0crQ2lNV0QzSVNZcnA2N2MwMnc4UmJXSEd1U0pEYkxLS3pacll6MkM0?=
 =?utf-8?B?bzdsUjJPVTQ4cFJQNWFldkpvOFlHOWwwYUI0b0pUREdodDNha25TNUlIYndm?=
 =?utf-8?B?c1JhWlFIOW9yY01LNkhSUjNoYUJtYmx1YUFSdGVrczJjazZqd3RSekdON0lh?=
 =?utf-8?B?YWNUTDcwS3QyUVJveGo0ZTlnWmRoVjlWQzVyTlU3N2VtdTMvN2dUMlpPdDU1?=
 =?utf-8?B?ZmcvaTYxYWZJRlBkMGVxM0F2cnpzdFBPaHh3NVdpRVBZYmpVdTdJOW9UQkpt?=
 =?utf-8?B?bTEyK3R4SjdUVWJjempQczU4NFNxeFNkMjZkSVRxSEJ5VWpCWkM5VmhBa0dq?=
 =?utf-8?B?Q0dNSzF0bEJRTzRqUy9PcHdma3QxZ1VhTHpwOERQNTFpcWFENXlEOWRtNW91?=
 =?utf-8?B?SHlvS0d0WmJKWmovcHZYVW5RZDJCQThWd0VDZEdEalN0OG4vM1o1VVNsYy8v?=
 =?utf-8?B?TjhhMGNjSENWY0dWUjVQQ2hQQnpuT3prdGJTcytGZTMwc0psRTFCbm5TTUxi?=
 =?utf-8?B?c1BMSG4wV3J5L3RZMFV4Q0VYeVYwNFF2YThaRGNhcDZQem9STHJLVU1QdVNu?=
 =?utf-8?Q?JW5U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nk5DOWFsZ09hdUY1R3FZdEZoMk11dDRleEI0MTBsSDhYeFd5VDI1U2pVK1oz?=
 =?utf-8?B?K1BobzUyQ3JMcVUzN2NrelRwazdzMis4R0tFWEpLZE83R0dZUzVnaE1kVDhM?=
 =?utf-8?B?QVR5VzROUTNpd1laU2dYdUh5WVBId0JzMVRuY2Vzb0ZrRnlxNDJsbGZGaWNy?=
 =?utf-8?B?cm1PcEo4czAwWEJRUlorUTRtcnBmQStyTDlEQ3RKOTZYRE1IWHNoZUhMZnpN?=
 =?utf-8?B?dE00MG1Wb0Z1ckJKbCs0LzZhL2I1WlVFRGVpd21YN0dtbG9EQjFPK1NZVkFi?=
 =?utf-8?B?VDRGV1VNVUZxREs0UjZHK1N2eHdtNjJrV2VkODNvTVZDVEJNRGd6V0V2SWRM?=
 =?utf-8?B?eW1FT2s1RS9ZcVpzVXMvZ1NZaG83OWwxS1k4SmUzQWdaL1pzaUx1TUdZeDRO?=
 =?utf-8?B?M1NEdnhTbGgwcHkvU3NYKzdUYXRpL3lDdnZIdWJ6V1VNNGVvZ2NtTENpb0Jq?=
 =?utf-8?B?YkdaRk5wU2JKQUR1S2QxRzd0NWhYWWtzMXB3QkNwNC9kbmowd1cwMW9rSDZq?=
 =?utf-8?B?Mm1QdkFrRU4wSThtbDhGN2xTQmdUSG9EdkFNVjk1ZjcvUXVwRTdpUFF3UmU0?=
 =?utf-8?B?WWJjQmhUc1NveUpWRkY1WTJCcEZPME13UzlOQ3hjZUZDMksrRE5GQ3Y2eCtq?=
 =?utf-8?B?YU9RWXgwSzl1Tk9DcnZnR0RLcTlPdlBHdHk1T0hHSE9qVjJWZW9GZFdaaWdQ?=
 =?utf-8?B?emkrQlVZY1VFLzBoQXkvVzRaVTB3VXdxRm14OUlwUDYzSTNxU1dKTFFWLzJH?=
 =?utf-8?B?RUw1RDhrSjhMU1l2c3NFZXIwN0lwUWFyNkVhdTRwTWhjZExTRWNKKzQ2Ui9o?=
 =?utf-8?B?TWVDLzZkTmZseVJNYUtJZXNLV2NITmJ4SGo3aEpEZ1RldE9zd1pZb3lxc25X?=
 =?utf-8?B?T3JhY3c2UUZNUzM5YjBxOVJFWkVUMlQ5Y1VhUEpweWgzeWF2ZlZhSG1qaVM3?=
 =?utf-8?B?MXlrSXpkajdFMU5FVm9INGgzS3dQN3FBcEFrMk9LK0Q2NGE3V2pTN3JpVXQ5?=
 =?utf-8?B?MVRZRFEzMVE3b2pvZndUWlBPYTZDaVVvdTZoV1F6MFI0R3BkclRJbW0rSjQ5?=
 =?utf-8?B?cTJsVG8wSkkyZGQvZzBRRVlza0FqT2Z5ejkxNDRPUDhuYmtzSUoyZ3dpb3Bi?=
 =?utf-8?B?d2Q0aHRwRXJPTk41Nk5XRkYyRU5YUGRLa0R4cWh1S25MbTNCOXpHRGc4MzdH?=
 =?utf-8?B?UTM3S3ZBdUN0ZHJybERNY3prRFgvNVpUd3V3VUtPejVpK1BqK3Rma0VsTE5v?=
 =?utf-8?B?K1hNNHN5MzIrcW43c0VDM2FlbWV2MmNta3FmV3V4NG01VlR2WlRPNGx6MFJC?=
 =?utf-8?B?Y1Z2QVp0SExmd3RScnJHeU9ZbTVHOWEwR1o4S3Z5TmZxcjJrWkF1WkZkSjFs?=
 =?utf-8?B?cEdCbHZEZTVFeDhYWTJqTXVCd1NmekZEQnZuUUpnWHpXcW04dnIyVWZYYjRK?=
 =?utf-8?B?NXczUjdOMGRuWTRHL1MwckQ4dmduNU1WUTIrdU8wK1pPdkVsbzhRZlJlay9C?=
 =?utf-8?B?aU1nWUJWaHE0UGYrelhBd1Jic0xBWDhMQUk5WHhIVW1oL0REcmRKS1NqeGs4?=
 =?utf-8?B?UWpTR2FHTEp4cUo5c2tFTThWdmVqaUpkMDlNekV6SHVnREJ1L3BiSjRmNENx?=
 =?utf-8?B?QzhjUkRTVm5NZXp4R0ZvckVlOHIzZ25YWTAwalBLTnM1VU9Gc0lyYkNGTnU4?=
 =?utf-8?B?R3hSU2p3bXBOdE15U0t0UHBLcU1PZ2VyL1BzdFR3UnFBVG91Z3V0V0JUY09E?=
 =?utf-8?B?M1dkME8ybWNsbG92TjVmVVBuNWVleTJSblp2c3ZyZ1ZBK0RlTGdvZE9YNGkv?=
 =?utf-8?B?Q2YxN2dsK1VFeU0vTWxDd09va1AxY1Bvc2UvMTVwczFOMWFTUGZNTmlQUXU3?=
 =?utf-8?B?Tmhkcm95MTI4Y3N1aHF2MmRsWndBNjFrWjlmZU1yTlloRGFrR2RPZUROS0Jw?=
 =?utf-8?B?ejRWQWZ1R1prRmtnRFk2TGZYVklEQjIwY2tya2hJdTBVaEQrVFhUQXdTV2xG?=
 =?utf-8?B?cyt2Ym9xL1BKZVMvRUh5ZGNyekdUdzhXZGppNmtQSU1MVXNsUXlHeU9wY2R0?=
 =?utf-8?B?THhvSGlkbEFuRGYyNWpvOGV0OWtTeEVXSllDbXJaTEpEYTZlOFpzOFFPRlB1?=
 =?utf-8?B?Uzdta2RRSUJ6eDBsWUphYnBySGEvL2E0bGtSdzNrWUg0TUYxUTdpbTRHMmcv?=
 =?utf-8?B?K2hHK0NiSGMxNFovQVd0VEdIUzlFMW84WkY0SytSc3lhbk43SWhLUnczcnRn?=
 =?utf-8?B?Y292VllTNlBqZjB1amxXdTQzNHRVb0x4VzhzZ0NKUk9uWk4xcGloZHFmMVVy?=
 =?utf-8?B?dEJFSDZYeUdGS3kzWFdCRjd5Yk43MnZOVXZRL3JXSnRtOXVFYWxBWnlDU1Bn?=
 =?utf-8?Q?D5M35wYiwO61Rc4jsDx5xrgZytsBe+q3kLKhUcLPaZI6c?=
X-MS-Exchange-AntiSpam-MessageData-1: Y5T9WKqRTcsl2Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 00e7d7de-1b20-44d6-8047-08de6e9bc025
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 03:14:13.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q+g6/RVFmzMD2LKky4pNjoND/oZ1vsJVu/hP2Pj7fZT/WFMbs8Ww7CHHyF+H1iOoB8jjdF5r3kwDLtioa/pP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
Message-ID-Hash: K4EYV2AHSOJUWQXSOY4O4YP65LR7XN2Y
X-Message-ID-Hash: K4EYV2AHSOJUWQXSOY4O4YP65LR7XN2Y
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K4EYV2AHSOJUWQXSOY4O4YP65LR7XN2Y/>
Archived-At: 
 <https://lore.freedesktop.org/DGHRDFE9M6P7.L7JEOCLL3VS9@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 12, 2026 at 3:28 PM JST, Eliot Courtney wrote:
> Add `allocate_command_with_timeout` which waits for space on the GSP
> command queue. It uses a similar timeout to nouveau.
>
> Let `send_command` wait for space to free up in the command queue by
> calling `allocate_command_with_timeout`. This is required to

I'd name it just `allocate_command_timeout`, to follow the pattern of
the existing `read_poll_timeout` - but actually we might not even need
a new method (see below).

> support continuation records which can fill up the queue.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 42 +++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 46819a82a51a..baae06de0e09 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -243,6 +243,16 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
>          }
>      }
> =20
> +    fn driver_bytes_available_to_write(&self) -> usize {

For consistency with `driver_write_area`, shall we name this
`driver_write_area_size`? And add a doccomment mentioning the returned
value is in bytes.

> +        let tx =3D self.cpu_write_ptr();
> +        let rx =3D self.gsp_read_ptr();
> +        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invaria=
nts of `gsp_read_ptr` and

Nit: missing empty line.

> +        // `cpu_write_ptr`. The minimum value case is where `rx =3D=3D 0=
` and `tx =3D=3D MSGQ_NUM_PAGES -
> +        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - =
1 =3D=3D 0`.
> +        let slots =3D (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
> +        num::u32_as_usize(slots) * GSP_PAGE_SIZE
> +    }
> +
>      /// Returns the region of the GSP message queue that the driver is c=
urrently allowed to read
>      /// from.
>      ///
> @@ -311,6 +321,25 @@ fn allocate_command(&mut self, size: usize) -> Resul=
t<GspCommand<'_>> {
>          })
>      }
> =20
> +    /// Allocates a region on the command queue that is large enough to =
send a command of `size`
> +    /// bytes, waiting for space to become available.
> +    ///
> +    /// This returns a [`GspCommand`] ready to be written to by the call=
er.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the command header is not properly aligned.
> +    fn allocate_command_with_timeout(&mut self, size: usize) -> Result<G=
spCommand<'_>> {

Should the timeout be an argument? That way we can simply add it to
`allocate_command`, and invoke it with `Delta::ZERO` whenever we don't
want to wait. This is more explicit at the call site, removes the
need to have two methods, and removes the redundant size check from
`allocate_command` which is now done by this `read_poll_timeout`.

> +        read_poll_timeout(
> +            || Ok(self.driver_bytes_available_to_write()),
> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgElem=
ent>() + size,
> +            Delta::ZERO,
> +            Delta::from_secs(1),
> +        )?;
> +        self.allocate_command(size)
> +    }
> +
>      // Returns the index of the memory page the GSP will write the next =
message to.
>      //
>      // # Invariants
> @@ -480,11 +509,18 @@ fn notify_gsp(bar: &Bar0) {
>              .write(bar);
>      }
> =20
> +    fn command_size<M>(command: &M) -> usize

Shouldn't this be a member function of `CommandToGsp`? Please add some
basic documentation for it as well. As a general rule, all methods, even
basic ones, should have at least one line of doccomment.

> +    where
> +        M: CommandToGsp,
> +    {
> +        size_of::<M::Command>() + command.variable_payload_len()
> +    }
> +
>      /// Sends `command` to the GSP.
>      ///
>      /// # Errors
>      ///
> -    /// - `EAGAIN` if there was not enough space in the command queue to=
 send the command.
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
>      /// - `EIO` if the variable payload requested by the command has not=
 been entirely
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
> @@ -495,8 +531,8 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, =
command: M) -> Result
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        let command_size =3D size_of::<M::Command>() + command.variable_=
payload_len();
> -        let dst =3D self.gsp_mem.allocate_command(command_size)?;
> +        let command_size =3D Self::command_size(&command);

The addition of `command_size` looks like an unrelated change - it is
not really leveraged until patch 6 (although it is still valuable on its
own). Can you move it to its own patch for clarity?
