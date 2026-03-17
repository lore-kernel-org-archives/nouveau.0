Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE0FED9E5
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 15:22:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1AD10E6B7;
	Tue, 17 Mar 2026 15:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bkUg3+/G";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 14D61451F4;
	Tue, 17 Mar 2026 15:12:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773760326;
 b=S8pKeQ06VcxCP2+dvbuQVSpZOLQ68hB4DWoS9myGGDGtljdwoGeiW3L0OYisYoqk+2aSt
 iWG/e0tPZ5GKQTQvEMBrhOPFqTnZuJ7AnZhMHd9DldHrebJQdtMxi9y4bmYGXSHv2IfKTz9
 FPc8Ma0z5UiR6ysHz9vOmbVO2u6+PLfpLSacBx41MwrvGktO7a+LbrKH9Ek0AbIak8Obw2l
 TJMjS3gTO/KFlutd4+5UcoAGqdEtY1dX6PkesfmoHQFBCUB3v43PC4KPBRs/tjHmlkV92pC
 0q5tSxxeKpyGYjaqj/vz7KGkJXnJM8WiHvNDeKu/j9ayQfi+6DKCl+d/Px1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773760326; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YbaNTsGKmAAAD/ux+ecqpDpq+XhbbyjtxvXeXZ7xSd0=;
 b=vNvzOqQoCw8X9mLxVaRkGyU3NfKQeykBYjBkPVxAU+uoVvQ4bvPHuAHLtJXbOsEP34ilD
 czhWdilKHNjN5D6udB1PsFLMBfGPviv2GilWYfUdwex+o60GB/OI8ljos688J5WHthZR4zc
 hi1L2si0sGNK2oQqWzibyTrxXGtBpDYy8gGeorxzMI3HAHgeQH3rYf+kNRbPFzxJMBaO3N6
 clABN8py9xpVaCVWHtMcZIPoKjG6dtunhuDUgEkpdx6oIIfsOA3PQqjKjgIo62q79/BjQIC
 H43dmIZkM4Rs2vigv/48DOPWX6/KfyeE5hiIvlf7g6kFhfAjumpBOkiJflQQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 77826451C7
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 15:12:04 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4907810E6B4;
	Tue, 17 Mar 2026 15:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBGbhtFfcr0aNwM9/ZrvpLyQJVY12G2rDh4TZn85MNx//UbZGRXd3umtRSPu8N7azIiSF909Zm66R2NBlT6dYQNAf/Af+vb4dQ17qRSHvqCYuJUX6Xd95N3sond65KvZ05JCOZB/EH1DnfVvChTEw6a92zjp/5W436py6n3BmyER0nhwZhSSW1ACIzHi81LXl4sya3ZnX1aMoKxX+4O5Yv/dxAJMnvTIozCAp8XPqBAhw3hS5TrmqbniXMn4c1H3bpS2kuof0Yetj07BESv7/dAwDpKzs/X+AGglKuxa8xlBcBT7O2xVT7mPWgXFNdp+gKQW9SqV8guYR+4ZN04f0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbaNTsGKmAAAD/ux+ecqpDpq+XhbbyjtxvXeXZ7xSd0=;
 b=ggDegNVUh5p9xi5c8Qrf2HrbvLaDG3OVSFSBJl0+ws8jURoWgkxIOlWRWRPlI9kt69JUtYor8fo8JslT6ifX0xcea8P4y9du6wUT2xgFtvY+g6FK/IiUg1LhbaFsMFgx0QW2b96+7EjAnO7zTn4VkuhlXUa1ItCkYbzugu0jcsdpU9WV9gU/d9med2jWlCE/AdJBvR1bhpLbGNJ5xSQ2r98QfeNW7H41NhAIykViIKdcCxcUTD8TuYLm+SsSkAoFApGN/CFkPvISm5PF9oJ8bJfde9baYXtEtvIs7tcgGPVpx6Rctw9Z2L+sN2eqQgpWp/C4DNKKR8C9XEMnGuZXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbaNTsGKmAAAD/ux+ecqpDpq+XhbbyjtxvXeXZ7xSd0=;
 b=bkUg3+/GUzQ/jw3WWyIHRy0JPO2UCTuHxVVviJQqdoa5fbpst0PxQs8rMqX75Xndi3TM8sg9HSK93SUGx2tpDwKmJG0PF3vddlamNmtvlFJeBpoE39IzS3KPZKGwcMis8PfkcSEu4vZMWvHBSV2doyjkP86r4V63Sg2xhS1AXVnUIQUHJTiZ/F/vOfRrpcgD68hdMA3jgJtlSLvFuMZaB4WymWaUrgd19Zcg0aYyognPLEUg46M7tt0zN7fMXLcLXLn5vTkZEAperBHyfdTchsXzIVayThNfpfxY8PT3qxoq0eSPwVwNNOQ6m1hda1UDVqvY7kEiA3/Sxx84Ug6Vbw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 15:22:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 15:22:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 00:22:43 +0900
Message-Id: <DH55S9CU9YCB.2Y3G50LUGSAZF@nvidia.com>
Subject: Re: [PATCH v3 2/2] gpu: nova-drm: rename nova to nova-drm
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
 <20260317092304.424377-1-yphbchou0911@gmail.com>
 <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
 <DH53WAJHTQFS.ZSO15BGJLQ8M@kernel.org>
In-Reply-To: <DH53WAJHTQFS.ZSO15BGJLQ8M@kernel.org>
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: cc206692-0be5-427b-175f-08de84390ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	djDRxr9/EPjpXpE+U8adfSMxYhCWWRs7PZI4pQz8E44CtaoKFrkAjY9O5U4yDD0o4bUlBiEC7yXtTrUhDEMzSUTZuPWpcbuW3yWd9MpLTBQeJ2B4r+sNqvkt4aOM1HOCGD0i0ZsCEJQwBarQLWcFfM2WDcYJ3qTpH/JvXLQ44bf0xMcbXkhjMUBZ3PzvcjQjOCx1sg05PSkEwcX1JurQTipQUgI+89i8R15gE2OVZYmczr3/mMPflLre96RmA/i4FcIYMCqzXVC4iVyCL/hu+kvKWUlCBuMh7gvYqiaAM8cI+5YBN0Ig7PwyKM2bKsrjLnpPZHQ4MaNMGEXxjMJuyRh5eoxUUw8NwANCqylDcQkg9FbrMTWBFgeM/elBMfHlQVQLiJA41T7nP/tA1YQrZHq7hx28r1wLGlh2+l01aj0S5xD8lMh+sKaXqAOG02pzvq18F/zYRjCs1iQ057Z3Ij6c72gOjEq6vfR7Qb9GpFhNz5rc+MRHMyjQfk5RICjy3+rA/xu5eIkyggEmjgp8Db1Zk1gIMmQioTmBgniXUP+c7MmnOhVFYunxh22kW8/V3zGghspVRMVCDPUrVdUxtziXbXuCxTxLkfByUVxPgzOqLMdq0R+w3ZruND2Qyybzwxf35DYAHQkzogZeeVHKBv5dC0/3E4f3daBj6/U3/5Li46ZX0ybS2MxvrmrKdzgX5+m31a4O1nwN2COSt6FegwIF17KpQymfocfucUVwLeE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RlAydmE5Vk5WUWQwakxRL3NKYzJQVjBoWm5CWmg5Y1FXRkt2cXA4b2N0TDgv?=
 =?utf-8?B?RFl3bHhmVTRWRVBqTmtrKzhCZnVFMVR1dXlTMWNrYzk2cXQ1QVBjTzBldU9R?=
 =?utf-8?B?Tmk0WXhzd3RpSkVFWUY2eU1zNDVrN1hPRWhhZVM1VzJmSWh0c1dpVSt1V2Nq?=
 =?utf-8?B?T0I5RTVLTkh5dC9JUlhSUUV6SitvS29uOTZBMDZpY1BqWTJaT2J6SWNNZjhK?=
 =?utf-8?B?WDc4SlhDWlgyOXc1NjZLQkVPV1dhZ1ZOcXpxM3prM2dKLzYvTXBYUUVLK1Mv?=
 =?utf-8?B?ejR2YlhWSVo1b0VvSGZpcVpXdTJ3d0xZbExyTytlYVRNSzVJcW53MnpNanpm?=
 =?utf-8?B?QlcxaE1ocHNOTGtEakdXVHJieEI5Z1luSm5XWmlUY1Qrem9maTBobFYva3ZJ?=
 =?utf-8?B?Sm8xVTJMRDFKa0NxMys5Wk45ZmUwck5sSU94VmIrT0xpdlVSZVkrYWlMYU1B?=
 =?utf-8?B?R0tMOENxTnFncVJCVW5VNnlPa012d05Zb29EclhKV2lpSVljKzg4eG91cUZo?=
 =?utf-8?B?Nm0zYUtsdVRtVEg4Q3p6dXlyRUd1aExBbS80OVFIaW1uYjRTbHRjQnBacmQ1?=
 =?utf-8?B?UG5DMW5FK2dBKzNqakxrVjZtTE5KaTdpVStGeDJqekYrc1FLbUkxTm5nSkpx?=
 =?utf-8?B?UlhnYnR1U2tmRUw2N3ZJMW5mZXZIdW96V1hqNXYzN3IybVo1elYwQ1NnQnZu?=
 =?utf-8?B?S2tLcGI5WUpuUmNJekNrWXZlZU1PeVU2MFMzOGFSSkMrV3FNUW82T0t5R3Vu?=
 =?utf-8?B?M2J6WEdZRHpnVkhMM2kva0g0WG9OU2l5TFE2ZHdYRWRTV2pDak1vQkRsSmZ3?=
 =?utf-8?B?Q0FpRTlPWFJkVnFVTzJGYjhONjY1RzdxOG95T0FrWnhKTmIvSmx2S0xPVVlq?=
 =?utf-8?B?U1VNRTJpNy9oUVYzczMwbTRQV0lZRzZkZGFwam9DYUJUMFF0aytDWnNDSXZH?=
 =?utf-8?B?V3FUV3VNWnh3M29QRWNrNms1QnkvWlFrOWJEVUhGdURjRmowcStqR3VEcFpE?=
 =?utf-8?B?WVFOd0ZleEFLMTBOTXlHOGJVSzZoNlpFKzgvU3Q0KzdDMDF4d2phQ3pCLy9a?=
 =?utf-8?B?U2ljekZjaTZUTk5wcHdwakNULzNwNEJLbm02K2FHRGd1UHE1MXBRQ2JIWTRv?=
 =?utf-8?B?UUVOQlNkVm9ncVlJSGFzYThka2xzSFY0S2NKZ1BoSFk4d0VQcVNIT0VST2or?=
 =?utf-8?B?QW1FdC9PZ09vZUswc1JHVW1hcW5TaXV6eG9pK0JtNGNUTFpKT1Y2SmhVZnZP?=
 =?utf-8?B?M3AwaTNnMDB2OS9VbmdyYUd5UkN5cVNRdVdHQWhjeVpjdkMrcHJ4TmZqbVE4?=
 =?utf-8?B?U01ZQkExRkVzYVFLT203SmF6Ujg1Qk9sdlBlVGJ6NEFlOHpRUUxjQzViOFQy?=
 =?utf-8?B?ZTNBeVovSkJJWHI5Z1JqR0ZqQnRReU5VME55WS82SDdYQlhZZnVsR0lrUlNP?=
 =?utf-8?B?azhOWnR1ckFMMDQwSzIrOHBBT3p3SUUrL0txbmdGWEhySWpIczJFTGRyUnNU?=
 =?utf-8?B?OG1GV0Vlb3UzZVRYamc0YjFRT0ZRTXRlTWhCSXhTREU0RFNFUmIzSFpxby90?=
 =?utf-8?B?SmgwZkI3bWxZbGNHbGMxQWpNV3ozTmpOcEU1enRSWEhQT1VJWVl1czRvdTBN?=
 =?utf-8?B?cU9oOGZ1TVJiYTRxakp3b09HS3ZKU0lMNVJkVTN0NDkwc0FzdnVqazE0RlBW?=
 =?utf-8?B?OUxobWo3b3I1b1hYa1AwNWV1b0JKZjNmYnU4bnl1L1Z4QktScGxCWmM5MXl4?=
 =?utf-8?B?SGdxVm1hZUR4SzlhbzFUTjVxZzJuVkt2UFZXVi9DRTBjZEx2QnlMUVo1clo1?=
 =?utf-8?B?YXFSc2RTYno3OExpQmhMNFRhQnp4NGxwYmZFb1RLWUtqb1J3QnJ4RENYMHVr?=
 =?utf-8?B?am1WUlZyU0UzOTRUb2lvNG5hSWhmZGNhMmxZZHF0SHNPMitPVm9xUFd6MTRz?=
 =?utf-8?B?WExHWm1VejMrbDBucHNCNU0rMFZqa3M3bk1mTkRMbm53YTA2ZW9YRHFwK0px?=
 =?utf-8?B?VmRLMXU0dHN4T05rRzc3dS9BTVQ1REsybVh4MkpLTFJmbnJ0ZnQxaFdBSFIv?=
 =?utf-8?B?ZUQxUVJIbU1BNWt1Y1pVMjFGRmRST0tyelZOUDZjMmsyckZVTSsvTjZISTF3?=
 =?utf-8?B?WVhJMVBaYUdyZnF6d1Zwck1NUFVkSVlteUV5V3B6cFd4S0xLUWVTNmxjbEtk?=
 =?utf-8?B?YmZ2YmE4ZkNyWjVpWnhwSFZhdDg3QUdDcFdhUVF3WjJFRzJtSVVrSU8vZFhh?=
 =?utf-8?B?WDZJc1N0SDNQSTRNN0lvYkRqTkNFUXRma1l3dlY0eWN2Rk5SVWlhRlBOMVZH?=
 =?utf-8?B?ejRpSFp6a1JoazA1RDNZOXlHUFIzV2lTVVlNYk4yUnUxTndacjloMEtSd0Jn?=
 =?utf-8?Q?/yjdqarXn6PwnEOpD+RIi6/A+u6760xdB6XIOny9vtgkU?=
X-MS-Exchange-AntiSpam-MessageData-1: 6Sfgl4DtVdOQdQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc206692-0be5-427b-175f-08de84390ad0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:22:46.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qbwfa2/Z6BqpPgqXKkmVAN1IzS1H/95AT1OB/kdeBU2lsr+Y+SS72mer6wi8YUokQs+KrG7kxDUAyDrofII2Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
Message-ID-Hash: 3ALC62PE4CPOL2H7WHQMFBMRFTPVV7KR
X-Message-ID-Hash: 3ALC62PE4CPOL2H7WHQMFBMRFTPVV7KR
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Cheng-Yang Chou <yphbchou0911@gmail.com>, aliceryhl@google.com,
 chia7712@gmail.com, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, simona@ffwll.ch
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ALC62PE4CPOL2H7WHQMFBMRFTPVV7KR/>
Archived-At: 
 <https://lore.freedesktop.org/DH55S9CU9YCB.2Y3G50LUGSAZF@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 10:53 PM JST, Danilo Krummrich wrote:
> On Tue Mar 17, 2026 at 2:20 PM CET, Alexandre Courbot wrote:
>> On Tue Mar 17, 2026 at 6:23 PM JST, Cheng-Yang Chou wrote:
>>> Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
>>> drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
>>> to nova_drm.rs (matching the object name nova_drm.o) to follow the
>>> kebab-case naming convention already used by the auxiliary device name.
>>>
>>> Update MAINTAINERS, Kconfig, and Makefile references accordingly.
>>> Update the Kconfig help text to reflect the new module name nova-drm.
>>>
>>> Link: https://github.com/Rust-for-Linux/linux/issues/1228
>>> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
>>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>>> ---
>>> Changes in v3:
>>> - Rename subject line (John Hubbard)
>>>
>>>  MAINTAINERS                                            | 6 +++---
>>>  drivers/gpu/drm/Kconfig                                | 2 +-
>>>  drivers/gpu/drm/Makefile                               | 2 +-
>>>  drivers/gpu/drm/{nova =3D> nova-drm}/Kconfig             | 2 +-
>>>  drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
>>>  drivers/gpu/drm/{nova =3D> nova-drm}/driver.rs           | 0
>>>  drivers/gpu/drm/{nova =3D> nova-drm}/file.rs             | 0
>>>  drivers/gpu/drm/{nova =3D> nova-drm}/gem.rs              | 0
>>
>> That `drm/nova-drm` reads a bit awkwardly to me and feels unnecessary.
>> Even `tegra-drm` is in `drm/tegra`.
>
> Well, that's why I named it "nova" in the first place, but I don't want
> KBUILD_MODNAME to diverge from the directory name and I also don't want t=
he
> driver name to diverge from KBUILD_MODNAME.

What is the rationale for that? I like consistency too, but also think
it is not particularly difficult to figure out that "nova-drm" resides
in "drm/nova".
