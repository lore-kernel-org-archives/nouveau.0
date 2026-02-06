Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54590EE6B59
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 20:44:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2710E90F;
	Fri,  6 Feb 2026 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A7Qf5P5K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7DEC941B4D;
	Fri,  6 Feb 2026 20:35:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770410106;
 b=hIv1OfYk46c/WcccqV3LUKpwuoOB+jOSRopKznrNBobwQmuCWWMHnsRAq7UOhgeD1dH9/
 oihXntSUssS9ocnf88wXILAHLpK+QGAshTADZyyjMagaGEFl2hOX2oY+2hpf4vSa+YqYCXf
 z6NkfLTttAh+GajvvtlR/GJh71SbsSivLZ/N7ERLBFaH3db1Je0uRHOZx4U2gaUPOa8QKKj
 uvU+sPKaO9oIfINaT9wg5ZjzM69kGdKqQtW46M2j8lHhLW+ZW+RONY6PpJQlrUkQiS3U16F
 SbN0DqAyfYbmuGcEsAzqQGZG659MBDXfviBSW9bYJ7yFjSWX93OQOyTomdXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770410106; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hxqDGU/8AbMWDOOOnzAweceBYH99N9ErE+zvzwnza6M=;
 b=HTw8c3l00fWvlym6W4/HrqDZkmsNEhWy0xT4InS+9PJ2kta/uuTjnB3eylVjc2FXlDCHF
 t40t7f5gSvDoIh3GM98qcLfDEvfFlae6sBnPC5gbWUq/OW1yDzzfzuAjlcODDVkAQHmGcSO
 7ajCBS8GDcp4W/YUwznFS9nKSRDtIb0WLhXjHMF1yjyZ1uE3iGTsaPTjlGnYxwtLT1o7tu2
 6Zqp3pDU9AzyfE4pxadAYshMah0lKKJPJ2nuoO1CoOIu1zHfJtBBKK/ifqiZN55sdpOd0sY
 roGe0vpXpMFaJTC9QFGFKiVfLnaRZFJwfVOnFwjMn6Mi+6ihZPunQWtrmJbg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=fail header.d=Nvidia.com;
  arc=pass;
  dmarc=fail (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=Nvidia.com;
 arc=pass;
 dmarc=fail (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D3F4E402CB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 20:35:03 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 729F610E8FE;
	Fri,  6 Feb 2026 20:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzOx0o8qZQGQLezNBkeHqM2DOah9kFq3HfZ1oc+Tb4wuuqX/ZrEH3Norj8gVM7SfuP8zT2uFgOVUu60AmF/roF+r4WmVAWP0bLI1NnoGyCovCyzrbASsJzWW0pXcrf+tlgbcocWegjR2Zy7CTi75vTzqk09Qf6jqMXeEiwZ3a6QMQoE0fj/kAuNXMwVaE0M8culpB+msJigKKMQCJISmmlyRAXxZik4sd/xSIafa9c5mDpHssDEokTs1WzUghPfzokRaX4Q6mQNF4nQmQ7ei52z6xjvr+/TFaMJNlrb9jjLtotUKz31LzU3rd06GMEzsryqiG2+T9C7Z0KcwTbbaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxqDGU/8AbMWDOOOnzAweceBYH99N9ErE+zvzwnza6M=;
 b=cXknFGI/gs890Hc4umg69Upbw0HcF74QuVu02SMveBhJxUehrPRPirRhx5FBQE4arVI+SVSdBlGRGHGXTHu3n5dOLMkQnnGeTyFupWLCA1lypLjag1HDLCQ/k2VaWpH6USRHGhcC4noGW5BjxveafVDe10YgOX/SjFmkNGHyCtpzxyZwrbnykKdlTKo/WOtbNev/6gCxLnXEeoII0Ybnk2Yv8OyBlExXE0unHmOYOCIL/jmKU+XTHGHDv7LAC7Jlb/w408gYCmiiNjmu57DhMy/bKjEqjbXjuzwYcN+NwVpKX/buTWLpdyL9mWxkcfr+2yy8ijHaGdXT65jtwkNM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxqDGU/8AbMWDOOOnzAweceBYH99N9ErE+zvzwnza6M=;
 b=A7Qf5P5Ky/huwOU2RMdsoAF1/UhLsFXI8jvB6jcq1TtTZeiXH/gq0/oH4Hl/uu7cc7BZJTKdVy9S3vtvpviUVw6BsQO9N1haA0vH5Rq9+KoZY2lYRJi/dz5adQGmTAziwgfVCc3+Hkr5dzF5/aoNDiRHPMGiTGV7mQmhbEIqRKBsPVJj3EzGgBkWmCAj57t5uXpeRvFTgWL6zYNT3X1bHvce8TaLN2/E9OGHtINPdPpMpKwHyx2BkHPFGARoItt10o702TgJw4KRtg27U12pNeQrCvHfTMs6BacELi6p4oAD2L8+dDw5cmz1l5dzRjTtrw4srxt5ha40cNGVCoq7eQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 20:44:20 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 20:44:20 +0000
Message-ID: <c9ed5fec-90fe-458d-844f-8fe78d1cd79c@nvidia.com>
Date: Fri, 6 Feb 2026 15:44:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:208:160::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2a8bb4-1214-4835-7c4d-08de65c080bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0p0MVcrcm82bTFxMWJkSlhZb0NrbTR2a1FKTVpCSy9IOWRuMVdlZDdyeHRL?=
 =?utf-8?B?bDZ1Q1NHZEJ1d1YveXJBRDhqdlRpNG9pOURjbmMwK0ErSUFFaDN2TUFJVVdJ?=
 =?utf-8?B?Zm4xeU1KTE54SEY3Z2E3ODNSRGVHbDRZSVVlaGd0dEV6Tlg1UTcvTjJJUVBR?=
 =?utf-8?B?elZlMGEyc2JRbklRQldoK0MzM25MVmFtSHlmRTU1ckNHcU9YYjE5cTdMMU44?=
 =?utf-8?B?cldVNVEwcHJHWU5WTm1VaVF0anEyQ05JTzBDLzU2d3JRWVZ3THhQeU4zVU1S?=
 =?utf-8?B?bmhoWDdFQVhNaXFyblQrSTNXZEZKVTFVWnR1blQ2TnJsRmVWbWJLZnZRQ3RB?=
 =?utf-8?B?SGNFQzgyYk4veVFUbklrTmx4alRrbis0V0hqb0VoVVEybXhaNnZIUHMxTXRa?=
 =?utf-8?B?MUtsTkRrYW1HLzdmQ0Z2SFF2OXIrMVFac1lMUUVvTEJHd3dQdUl1MlNPV2ZE?=
 =?utf-8?B?SjFrZHZQQ0M4OXJsc0YxM2M3eklvR05kZUk0VVZ6dUJCZkJaZ2NJclB3Z2Jx?=
 =?utf-8?B?bnJlejZFdGF2ZzlyYjlYYkE0a241UmdUNnd5ZmhrWVdkYUxFQjFTWk5lUzNi?=
 =?utf-8?B?eTJVQW1hTXFEZUZPMHBhbDFoVVpBUTVmY2l3N3FsTEZTMWhzWngrSkMwUVha?=
 =?utf-8?B?TC9TSityck1qMXQ5cW5yWjFTTDFDZW9WREw2cFhRYVNzZXhwZzI0aHVyekdF?=
 =?utf-8?B?TDNiTWZYaWZ4Qll6dUhzdzc3NklSVmxoWm1IMWNOOUxzM2FTOXd3U2szMnYv?=
 =?utf-8?B?WWlYKzl4MDdoTUNmaW00eDY4RjJNSTFLSVgzRVBmR1ZlNjVJWmViRlExZklr?=
 =?utf-8?B?eFIvZDlVNE5UYlFMOW9Mcno1dHVBNVdiQ0F3ei9ibGkydFZ3bFdCdURhWTJp?=
 =?utf-8?B?M3RFdTEvVWJZdlpTNnFNY2cyYzJoU0c4dzN6UkZSMlBHRkNyWWRNVmJteTJq?=
 =?utf-8?B?VFEwdkphZnRBOEVTck9mU0ZFSWs5K2J2Qm5vczlQcElrVFZndld3K2tDcWFV?=
 =?utf-8?B?aTNaR1hkNkM2UTA0WEJxRUVyUzZMNUF3V1ZSN2tpY0lyMmlDd2VPZnA3NGhW?=
 =?utf-8?B?N0RST3R4MkxOcXB4a3djUk5qUVI1V3ora0ZCWlpQai9PdDZlS2plcFlIWGpC?=
 =?utf-8?B?VzdkMXpoUkFBMDNpQlg3b3VGMUVHWlExNHRvRE9QMzVvMUM2SGR5QWpkWks5?=
 =?utf-8?B?SjAxbjJUSk5rQkhyWTZUd2E3NS9KUW1jbGdpOFNncWxyZGo1dzcyME85TnJs?=
 =?utf-8?B?aStsaFp3QTJKSXdSTk1XOStPTzFYbFRiUVlDVy9ZRkZjNjQ3eU1FUGdqcWww?=
 =?utf-8?B?cmdDcE5nNmFhM2p5MHJwN3dmbzUzcVUybFhMMlV5a2pJMVZsYUdrYTJXY0NG?=
 =?utf-8?B?aGFjQk0wYWdQRlpBRjczbHlXYnJTL1BMRkhLOTFMWnNuUmtvNmhyakoyL1Uv?=
 =?utf-8?B?Q055a3k3OXZFb1BKSUtHOXBwbVlZajBnUmptcW0rTHd3UHY0WnlqTWVwZlJN?=
 =?utf-8?B?TDBzWTg4WTc1cWtFdmVVSUFKYlZXRjNYRk1KanBLTjI2Qjd1RStUZWl5RHlL?=
 =?utf-8?B?dE84UmdnS1JtNytYL0QvS2tZUm16VU56K1VpNkIrRUxkcmZTWWMzenJlQXFl?=
 =?utf-8?B?U01zMDNIOGNKQ2NuOTcyNG0rVmdZTjR0Q000eWV2ZUloMnJ6T3JGZW53eDdn?=
 =?utf-8?B?a0hjeTBGMjAzdlY2c0hwR1BDblNhL1Z2Y21pMXJ2cU9uOVE4a01ZSWR1L1NE?=
 =?utf-8?B?cWFEdmR0blphQm5uSzRqZGNGZnpGanErSXhsVmpjZmpuWFBudzhnb21EWDZz?=
 =?utf-8?B?Nm9QRVpKRDVkOGljS3BTZFo3TVltdEE4dmJ6dHRnQXRIcVN4RytEMmN2Z2t6?=
 =?utf-8?B?VnMyTFBFVlZWNWtwbzcvUTJHbkJJbkpaMkdXVGtqb3hBbitJK1VNYnZlNE44?=
 =?utf-8?B?bVBaa2lJSUN5S1ZTUTBGV1JiZEZvdXBWR2dpMWNFaTJXUTA3YTAwMDY5bEhp?=
 =?utf-8?B?Sk1YOVlZN1lEMXBLa2I0cHFnSVMwWXpjQW1XOStCYVZyTE95Y2FwT2ZKb1lW?=
 =?utf-8?B?eXFodHRlakptM2twLytDeHF5SUZKQ3hhai9ZSXZ6MmlLY0NRaTdkOGVUYXJw?=
 =?utf-8?Q?VxrE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDU2TS9wdS9JYTMrTEZtZzB2cmt1VERoMmNFYlBacFVmZExoU1BoWGp6V3Vp?=
 =?utf-8?B?WXpNMjFxWENFSHZjZkJNcnB4cGM2eHRLaUJvN1gvTnhtTFhmb1VSNkVmYWZV?=
 =?utf-8?B?OWplL0FQUE5WQVFZZXVKczBpVi84OHExOUhuOEErU0RCS0FIeUFKZU5vSjFV?=
 =?utf-8?B?WklLb2taczc1N0R0TkR1N0JubUd0TWFSRUs3UTV2ekFtQkVOVWNLaU13SmI5?=
 =?utf-8?B?aWZsekl5VEI1TCszdjNvaE1PdEV3V0lPY0VwTHhpK3JJQmJnMjFxWWNOZUtZ?=
 =?utf-8?B?N2dmNStHTXNReUdkc0ZtUnpFS25haEFIdDVEWGFCL2RCNmQ0eHpuNGErNXVT?=
 =?utf-8?B?OTg1UFg5SFhmSTdPVVlzc0RDNlduRG40TkhQTjBaMDVqUUE3TCsrR3lNWnJ0?=
 =?utf-8?B?dkVoVjR0WjJOR09WMHA2a0tvamVqRWtFMDMzQVk3MTcyVUhCNTRBRGJaUGtH?=
 =?utf-8?B?OHNIMnFkQzdpck5oNXhFdHJJeTl4K3VkYlh6RmZvOEVZaS9BblcvTlBnbkxr?=
 =?utf-8?B?SHNZdjg0QnN5empYTGs0RXgrSlV2eHYxbW5uNjJJQk1sTHRjbFpnVTNtdXl3?=
 =?utf-8?B?K250cGp4NFBRRDZ2SWIxYWZkTGZXVzJuMmE2b1liZzI1S2dxdmt3SVkwRUpm?=
 =?utf-8?B?VHlwTmZXdHNBMjBobWhoMWVQcUxOZFg4eWY2Uy9sRkkwQjUwVnFWM3BSQ1Ja?=
 =?utf-8?B?RlowaDRlallKTm1HblVHeU5aeDlSamlqRklzYWhKWVV2ZVJLUlBUcmNlOU9G?=
 =?utf-8?B?cDQ0enFDQXlTa3hHMFNvVVlIcUdqblVpaG9CL2VTeFM0ZVNQbXMzS09KQlRU?=
 =?utf-8?B?UW43dkkvRWJWOE5yV1krb28rbmdIZEJLRUx3QU5xYjZrNjIzbFVMQ21LOEQr?=
 =?utf-8?B?VXpKRks3YVg5eUVrVHpVc2xyYzBMK04vZE5GQ2Jwcy85eUQ4d3FyaFhSM3RU?=
 =?utf-8?B?SGpWVUM3dzdhRlVGZWkyN0hWcWU5UXRnam5WcEs4a3J1a0duckpMcy91OUZv?=
 =?utf-8?B?K3hTRHZWeTIvTndDRk9kTEtTMUxaekFtMGRodE9OZzk2R09EZUNFOWNwVllJ?=
 =?utf-8?B?L3NmSXZuTzVKcjFHU2IxOFF6cVFFMU4ramJDSVhBQ1R2a3VBbXdUMXRnY1RQ?=
 =?utf-8?B?S1RVQnJXSTVDWUNObytIT0w4VW5KL2dLUDU2b3ZtUnYzRlJ2RFJJUXdBU3Zm?=
 =?utf-8?B?eTkzaUVuMFRYVGtqU0paSUVjTUw1Q2VEQ3VFcXRXMng2a00zeUlyOENBNC93?=
 =?utf-8?B?TW5kT3dLcE45SWxWeHBKaGsrbkVpOEEvZldUOWg4Yzl1aDBGTDhGUkNBeDVk?=
 =?utf-8?B?NEVxS2xGdWYxd2lTRzUrOTJaV2JXM2tKM2xFRWN0N2dYVHFEMU84NG42SlMr?=
 =?utf-8?B?aVFuRWVYL25VQzhJWGpBRXRhV05HTzVHVUJBOTQzbFhXQVBsZDRnT05sckts?=
 =?utf-8?B?YzU2ekFCR1ZMdUZBdlVHck5Na081ZW10S0cyV1kvaFZLNXJoakkrYno0dnhR?=
 =?utf-8?B?R3I4U3l1cjQ1NElMVGxMZ3Rlbk40VGxUUktIQ0dPOUpDZ1VQRjd0YUFOc1Aw?=
 =?utf-8?B?SlVOak1FZ2VaelZFbUZCem1VMXJWaUc2N0VIUjFXWUFZaXBHQ3FKdXJYNW1x?=
 =?utf-8?B?Ny9qZTE0eThFK05qWHJ4RDBOSG5nRkNBR3ZuaExwcm5RMzU0TzEycTZhMUxm?=
 =?utf-8?B?WERpUlVUVTVYK0FHaVJpNW14NSsvc0ZJbkk2Q3E1ZnU3V29nTjJ5dkM5ZmNO?=
 =?utf-8?B?cE9ocnloOCswb0NQZmhpbUtVS3A0ajc0ZUFtNnlkamEycm9qV09MN1BONjA4?=
 =?utf-8?B?ZmdDaWM0T2xtRnM2NnBTVHZVYkFZNG9yVjZWWnl5TktxcVIwRGtyYXhYV05p?=
 =?utf-8?B?MWU2eXFZWW1BOTI3akxqV0Z5b3NxTkhSdDBJNy9HQ20zeHdzNnVySERtWS9I?=
 =?utf-8?B?eE1GaHBDV1JzUnRaN0YycldRSzNESlU3K1NVTWczTUJZU00wYS9yV3EzMlph?=
 =?utf-8?B?TFh0eWk1UExlZXJ0bmpPaWltYnNzMWdMY2Z5YkRZNlB2TnpyTGwrRUlSc3Vi?=
 =?utf-8?B?bGpSYlBjeWpXdUZHdzBESWgvWnVya2JqaUNCanFBbEdrTXJkdmkzYW9nbXJV?=
 =?utf-8?B?QVlBOWNXVVVNVnRkb1NpWk9jYWxScXF1amdYZkVLMy9XSE9QcmY0OW5PblFm?=
 =?utf-8?B?d283SDRaNngyUWtOMTJCejlqcGJ2WDhubjRROEJkYi85U1dtL1pjN3dOTndU?=
 =?utf-8?B?Vnd6NWhQZnJXOVJBbDZvc3RoSUF1OEhveSs3b3pNL3ZaNEJNK2pDbG5RV3hO?=
 =?utf-8?B?bTlKU3dDTTZTYmVBUkRSVjUxVDF3TWZtSUhZTXkrb2NQVmswYUI5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b2a8bb4-1214-4835-7c4d-08de65c080bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:44:20.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AbqQ74xccs77Nvtj71xEJSuip4Bkx0UDHsReoDTNZE8Kygk1tL+PRqp0wSdPIWLZfJyxs+7mJhAlYiBN6s+FhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
Message-ID-Hash: GKBZBQPLGSSRGSJYTZ7VCCR2F76DHX2N
X-Message-ID-Hash: GKBZBQPLGSSRGSJYTZ7VCCR2F76DHX2N
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GKBZBQPLGSSRGSJYTZ7VCCR2F76DHX2N/>
Archived-At: 
 <https://lore.freedesktop.org/c9ed5fec-90fe-458d-844f-8fe78d1cd79c@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 2/6/2026 12:13 PM, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 5:13 PM CET, Gary Guo wrote:
>> On Fri Feb 6, 2026 at 4:05 PM GMT, Joel Fernandes wrote:
>>>
>>>
>>> On 2/6/2026 10:53 AM, Danilo Krummrich wrote:
>>>> On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
>>>>> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>>>>>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>>>>>> index 22dd29cd50b5..2c3dec070645 100644
>>>>>> --- a/drivers/gpu/Kconfig
>>>>>> +++ b/drivers/gpu/Kconfig
>>>>>> @@ -1,7 +1,14 @@
>>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>>  
>>>>>> +config RUST_CLIST
>>>>>> +	bool
>>>>>> +	depends on RUST
>>>>>> +	help
>>>>>> +	  Rust abstraction for interfacing with C linked lists.
>>>>>
>>>>> I am not sure if we need extra config entry. This is fully generic so shouldn't
>>>>> generate any code unless there is an user.
>>>>
>>>> I also don't think we need a Kconfig for this.
>>>>
>>>> In any case, it shouln't be in drivers/gpu/Kconfig.
>>>
>>> Fair point, I believe I was having trouble compiling this into the kernel crate
>>> without warnings (I believe if !GPU_BUDDY). I'll try to drop it and see if we
>>> can get rid of it.
>>
>> If you run into dead code warnings, I think it is fine to just
>>
>>     #[allow(dead_code, reason = "all users might be cfg-ed out")]
>>
>> the overhead of just let rustc type-checking this module isn't worth the extra
>> Kconfig plumbing, I think.
> 
> You mean because there are pub(crate) in clist.rs? I don't think the Kconfig
> would help with that, nothing prevents people from enabling RUST_CLIST, but none
> of the users.

I think he means add the alloc annotation to suppress deadcode warnings and get
rid of the Kconfig?

> Besides that, once we have the new build system, the users of CList are likely
> in other crates anyways, so I think we should just change things to pub.

I agree with both approaches. Perhaps changing to pub is better to avoid churn
in the future when other crates use it.

-- 
Joel Fernandes

