Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B39D58E4B
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 04:54:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA25510E432;
	Mon,  2 Mar 2026 04:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NKYiGONJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01DE144D39;
	Mon,  2 Mar 2026 04:44:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772426652;
 b=pwYglR+70LzBaxmH/9GNs0+Yusn4rMjaLcunYDmeK6GIaVhaXLGcFkvZqio53gVW8qv/Z
 WwjoxytMNvc/4vc0vveWXR76sOzCGsrTE+0xCt6AgxceqtdhCLqe9k903E2+Mk96LqeXC4U
 tgIRheosoR5ZEDcVjKt4mq/esXOfoMiBOBe3+ezQeW8WCv8pkOFoQizetiaI8qX3pFZphI+
 ttSHicEYM2d5oMveCqS6f3ndqqNSeARQNCHMU/pFVqBxgHkI7i00xnMaOQEBOXoEs7gviYT
 Q9NHe1uz3nLksIC+7N0zWIpA89ggX09fIEBTvDkoHhX4Ch3OI0toJwAqbNlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772426652; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1UEh1elHWQydfih/CvQcsES1ta9rKtXx3vJFhaIXxwc=;
 b=xQ7FqujJKYV5I1qYSmt+s8tcIqosorF6Pe7HaJ5dCahW4x9K7dcVVl8olcwWQFJraQ36I
 z3PrFNAOcqVrmBkxYLO3o3LJmFlCJlwbTlDdSF+irn0M8ZdOOY9XHlRKRyGeWG6JeN07tCG
 aLO167u6lm6q56LqcIZ0Eih/yoEu67HSllMi170UkySkwG2T2NI80vv4xKnqsluHwFRzgde
 tKaK/m00qXKXkNk/zFDRk3tb6UYQAriLEFpsFWxvwiy7gCMf68RVVu2tNW57RLx8OkhTW6U
 Z4NI+r0B6rXXVcKo/5ZrFdEw763VVAiz8qBttMRnpeeYGVYXrJPb33d5Dusw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0011E4032A
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 04:44:08 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9213110E427;
	Mon,  2 Mar 2026 04:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLsJY/T4eJXjkPjfolmWOptzPvArDaTtMDetwEzw7AxO0ALPUUYugZi2o3Hoy5lJqkPwv56BCQAefkK6wL1n9AqOyaoydkMII0AhVwdk/5g/azXELhvNTGEFlJx09ZMWsrOJ7zq3wFwGSt3IH9e2YQBiXar4J0Pl1fUjP8OaqP3zxYuK4ZAqiIvY2QiF+BSTWKAFIlanXbAtgQCl2Gv838JjVT80J33/m7NN6EHEUXj4BwRvgEy11Hrdi9i+yUUFSkpIGHnEcIrtdQ9QAEyL8OymIB3TI+dlrmeEcGB5Yi3Wg64tJ8Wx5oFGeCD2IMeO9AYE3ca8KPD89SJEOok+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UEh1elHWQydfih/CvQcsES1ta9rKtXx3vJFhaIXxwc=;
 b=RHhx1Kp5vW53+hS6QxyGOO5rIKbE/GeZIrLLjEWAB/Px8NHCfAgloaS2C93vAvyT7mi3tSR5XaxjEes4a3QI5DHEBcWHD6zv0+XQHbvnRO5s1OL0cnKSwh27sEtadpCM2LNAMcyFQleV3YQFB8IbZpHfPM2A5sz08YzJuXxaqotWGKqc5Yj+TG3KPChTyluYntp44BGWXUTScpF4SY1LZF16VPUgsTrUZRGL0FYaU8ScgmPmfukddYBM6JVEF2TBhHnLf3/LVjRxKqW4Sk3xZRBhq0JNQI43cAXMWa4b5YS+xKiJEDYgUDuH74HyTmLiEXWfMk6BQlQPRBrFo94q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UEh1elHWQydfih/CvQcsES1ta9rKtXx3vJFhaIXxwc=;
 b=NKYiGONJ2h6ymjjpv3Qwjq6zRhQF0Tv/Z5EVV8yM7iFSbogCUCYBedxalma8q60ai72y/Mxnj70DTxpSAUHxzQue+QH+REeFz04LdVN/Cy8/RDhnokGxOGw7DjdN1FYM91K2JxhWHHfVfFtqbXZ0a2sI98K+abvyHOX/7UrW/AJm+dH4blDaPnADELIQWZWxuvEmoDRrWstBPiKAMQk7MBHHI7dI4FKU34ya1uZ+k9a19S86P7Qy36b5se0PBK9cYCELq/kpo/yhja1f9o1VmSQkEW1zqeocArpaJpZxSAxpoMU3l5UljzNSGcu5gSU1QLskySORikg8Ofa+eES8zw==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 04:54:18 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 04:54:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:54:14 +0900
Message-Id: <DGS10W70UDA6.V6T2GNR20Q2X@nvidia.com>
Subject: Re: [PATCH v10 03/10] gpu: nova-core: falcon: rename load
 parameters to reflect DMA dependency
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-3-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-3-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4d2679-64fc-4461-0bb9-08de7817c320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	ZAZ4fsIZcd7WDyb/pZmpyXkFD0gANu7YduE8uUGW12yBQ2bNiV0L20RvX8gXGXymzKhc3nf+t9sW5ITepUHIh96JhBWTvghbmirBm1Z+RdJ/gEQOUeA7piyHId6BrHshfelJz6sVnZT06pQA2nOL91gFA4xPa/5qj5ZAzVZd1lis4avp/iISb3NUaeYRel/zhoJWmrXJuVa8MAMv8IQh8pwBpZtL/24HmxPNbPcgFQHU4u3qbZVW17+3hEbyGSJojNfbydUwuzEfY815vKUX3UaRJY9kBsgoQoKhIGbb4nAHTaZiu+k4FOZ+jc1d5AJHc93xvtkmDwMLmBydIkGv4zLGDNVzukgRVL/rfNXwSCwLN629DfulCXD2LgNDR+/dePzUrqecB/v/b4Njm/45KPD0Wg3atcZFo5K0b6/SswjMeWVxeUh1dHgv/RgrdRPoD9X+nYO5o3apD2txK3BCZELxT4B7O3eTbr1/ciAToe43ed26yi6yNOJVq9hs02GCvJrsFLzXM88/w9Rh/+0Kfbo90Hl85hu1v7UOzX/yAfPgXyBJN8nI+jtJfZKmZnuIY8ntIH9A13fdTzz+BbTufpKtt7Kl0imE1b9JE2pPq6n8Nnr3wPQ0lVq693bXsqn7LsLeJr4NG89sXwCH+QxGCemW8AomlK9q3pBS1ZpiMczOGOs/hsX35ptHwC6g+iRZ5C+OG2mFz4SeRFxztqnJIohDMEgvVGZqmOcGJ1pKCNA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkRjOUtOQVZ3NHUxSzZKWm1vZnphWXR5YkFxdHhPWEh4TkZLWWZxQ2ZWdkwz?=
 =?utf-8?B?Z3VyQVkwajRhUTlOSzdLd0xUYWZ1aXArUFE1QmQrem1RT2Nsdnd5T2ZzNmVo?=
 =?utf-8?B?SHpIT0NnUGlobytBQXpTZWNYTFVIR3hzVGFQT0JRZ2NxRjRtblJhanhGbjVN?=
 =?utf-8?B?TEY1SU16UC93djVwUkZjcGV3a25FV2g5OGg3ZmZieSsySVpXOWU2VElKdnl3?=
 =?utf-8?B?QnZuZG4rcHdnWTR3Vmw4V0cycFBVcjFzcElxcDlSVk8vSEdOZTQvUmo1NjlD?=
 =?utf-8?B?R2dvcDNncmZwalpyVkRUQjdvbUhLZkdRNjNoSWhmemZJS1JUT3RwbkdhVjNa?=
 =?utf-8?B?Um5ocTNmblkvTEt6TVNYeTQyU1NzS0tYMGVtUnRvS3JFd1d0NzhUdEtkMGFp?=
 =?utf-8?B?VGdleGI2c0JBN0lveGE5TzQ1L2JiYmhtZEEvZ25yRnkxS1BrUjg1d2Fzanhz?=
 =?utf-8?B?cUxkQTIvK0lpQjFqekliMUovV2ZwWjZPR0dWU1BkWC9kdk5ySDRtR0NJTS9C?=
 =?utf-8?B?aDFQMmF6b3NYUUpJaFRBMzBNZUgxZzN5MzQwTDRsZjdHais3NVVjVERpQTY5?=
 =?utf-8?B?dlRBVDVuZnpUbUdVUjRabWo5TlF6YmVRNXE0OWJpZnBTN0o4V3pBa3B4N0pU?=
 =?utf-8?B?SGJ2bFFHaXRoWmc1a013OWlMMjBJbllSN01LcDBKNXZKQjM4VENYek9iVkYw?=
 =?utf-8?B?aXBRTmowclJsaUZXN29CQ0ZzdmRrMUs5bFU4U3FUY1ZWOEpBK3JPUnZOeG14?=
 =?utf-8?B?UmdRS25Vd2VQSWVrYXo0blltMDc5dkZOMWl4YjVuUHRHcllvZVorRHRGZkN0?=
 =?utf-8?B?SjJFNmZwNlcvdGV5ZGtLSDV4dU9jeGZkUHY0UHNiMGVaeHlrc2kvU3dqT3VJ?=
 =?utf-8?B?OThpZmh4TU5VR1hzaE5JN0hPMit3aVg5bUNZR3hxbFJzUFZWeTFaaWhRSWdY?=
 =?utf-8?B?NDFCR3VJdG15alFCNC8xcE4rUlJWcnVZdUJGQXRCNWZOaU13VEJINFpMMWRl?=
 =?utf-8?B?L2lzbm13b0YyZk90aTZMWFMxRlFLaGRFcUdsSW9aSW9FSHNTRXU0emo3bU12?=
 =?utf-8?B?cGt1SzluWHdhZmx0MUNoL1N2U2x2YXJWRDNjRlpGZk1Ha3V5ODhETUl2MUMz?=
 =?utf-8?B?UEg2eDNWVUtwU1plZktYSTBwb0JPcE1Ocjg0V3Q3bjdHSGV5QTQ1eGpyYkRr?=
 =?utf-8?B?N0xvaXhxZ0ttdkJiMGRJTjBGWnliZytDVnRaMzNoVkJNeURYS2dMODdrNG5J?=
 =?utf-8?B?bkh0OHR1VGkwemZkaFdDaXQ0bGc1N2swZm1DQ0orRnRUSC96dHN5SlR4dUg5?=
 =?utf-8?B?REhtOG9qVE5kYkJBYkNqUDNGcExKM3RwWEgvWUpxdHdCbzQ0OWs1dEVVc3lo?=
 =?utf-8?B?dUI1RzBOMWVIUmU2TzUvSkVPZmtrUThUdWtIV3RwT2NHUUxaNHZHSUtuRm1p?=
 =?utf-8?B?eHo5Y2lwa2RNVjJ0aTlJNVc0czEvUnR6N0F1RGNLeVllSEFoaGFXSzBKTGlu?=
 =?utf-8?B?QnZRRkFSUjNTaXhaT2RlL2ZBTnp5Z0NXcm1WWGU2THhzR1lzaHpDZTJmNWdR?=
 =?utf-8?B?Z1Qwb2c0TDlZLzJDb2t5NWVOU1lYeWwySTF6Uy9ocGYzQ1VoSG1hb3F5ZCt1?=
 =?utf-8?B?QXl3Rnd5QnFEeWk1UmlEU0dYc1hnTFRJbmhTcnl6VkxFdFRQNTBqUGlSc1M4?=
 =?utf-8?B?VCtOTlFZcUtUTlY2Q0MxM1hJczRlK1k4dEg0TndtRFdhcUZOT2JLZW05eS83?=
 =?utf-8?B?eldnK2hpalN3R1d1Rko2dVhpY1V0MlFhOXNqaHF5czNGTmR0WXNXa2s1QVR1?=
 =?utf-8?B?TlhPekxaZzdteDFzQ1JvV2QwdUdneVVIMk85TmpGQ0JxVXJsRVdJL2VyeUtL?=
 =?utf-8?B?S0toYlNEaDAxTExaQzNYZm90eFF2Ylg0NXQ5MWQ5UGhVKy96ZytSVkIrNHRv?=
 =?utf-8?B?TmZNR1pvUTdFMi9RMDI0Ykgzc2FRc1hnOFl0TWp0SnRXelpwWGdtWEZYSEV2?=
 =?utf-8?B?S1R0TUU3THhTUTZ6SnU3OVVDYzBwSHIrNVZCYllDdy9YdytkUEEyNUxwbU5P?=
 =?utf-8?B?MnhGelVVcnhPTnYwd3pROTExR0RZY3crZ3RvT0crckNGR2hib1pWeFA1NEMw?=
 =?utf-8?B?bDBmSkxGcitCNU16NTh6RUhTa3kvUjk3aHFaQmNwMisxWGlEaWM3Uk1LK1l6?=
 =?utf-8?B?SnBNMVRPWUJyUEZDcUJKZ3J1azA4L1FWbC9sYml5QnRyd1pVb2ZDSWpyTC9O?=
 =?utf-8?B?d2ZyZVBhcFZPSjNSdlExeDBRb2k5WXZGRzQ0U1hDVUxoclcxNTNsOFk0L3Fm?=
 =?utf-8?B?ZGhxR291SVlYMWMvOG9MeUFBWVVwMFY1cFAwWllnVlM1WlhXVFVvRnRiVitO?=
 =?utf-8?Q?lMdBk+ttqXCa/Cux2jci/xosnqdLrCP/TPc0GUhgQVTer?=
X-MS-Exchange-AntiSpam-MessageData-1: Bp4mws999l5Mlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e4d2679-64fc-4461-0bb9-08de7817c320
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 04:54:18.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IWiLm1tr3LUGrjyAFl/8vgHurQT4kviz7iADqauJqVe2F3zrBaPzP4Q2etStxIGXIhLLAGzOkkky4gJWNZIMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
Message-ID-Hash: PIWE7SO7AAB4CTQTWHGCNP6LVXMKX3ER
X-Message-ID-Hash: PIWE7SO7AAB4CTQTWHGCNP6LVXMKX3ER
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PIWE7SO7AAB4CTQTWHGCNP6LVXMKX3ER/>
Archived-At: 
 <https://lore.freedesktop.org/DGS10W70UDA6.V6T2GNR20Q2X@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
> DMA loading, but not so much for PIO loading which will require its own
> types. Start by renaming them to something that indicates that they are
> indeed DMA-related.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index 2b7166eaf283..d569151982d1 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -19,8 +19,8 @@
>          Falcon,
>          FalconBromParams,
>          FalconFirmware,
> -        FalconLoadParams,
> -        FalconLoadTarget, //
> +        FalconDmaLoadable,
> +        FalconDmaLoadTarget, //
>      },

I think here but also other files in this patch are not rustfmt'd (e.g.
import ordering here).
