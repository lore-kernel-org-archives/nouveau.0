Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C640EDEBFF
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 02:54:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 797EC10E93A;
	Wed,  4 Mar 2026 02:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MUwJ8qAP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48A9544E10;
	Wed,  4 Mar 2026 02:43:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772592236;
 b=r+GQoLrsMoaIV43KOgKgbjLrtOWrzDOm9FtZobMdCvP2YeuM/FpIy6L2b7fblT4cliYHc
 MrhHPPUtAqeG+VdMt9xlz/2WYMCzGIucIQX8CYiHikIOQu76axMITHm3USdoH50vvNt3DXO
 a0ICbUVLnU3EMhqMy1X9DQjLcpOMb1r95yeqNrQQYvYVTRBpuxvL6NsRcedCGWBj8X4lBqs
 Gu1e5WvJ4PGw7FL2VQqQ+BdDUGtZslVoirXmorbWCk0Z/FQjdW4CLzgdW8SReik6AfMBzDJ
 uvt+wDQu+glSPf3GW4imtnaAOLnJzf/P4HKWpqfe1SilguOZO3uVbDxm7Qqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772592236; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PKn5iJYxA0e7uybFAtEj7f9GLfgUx+kqaroypgBR2vk=;
 b=o6zOgrnHJb0DlEMIWLnntbQJcJsiZRQL+QgOjl+F777ic0gXMwPCRO1Cz+cTcmgTvJLSZ
 2S+0ol17gQj8+drvHkvihHnN/Cvcd7/cUDcsOP1Uop5/kAJ6d/CcYiyOcQWnaBV3USrp572
 dXJwp4l/3F1WnKZEFCMS//u2j+rP0Ua+hhJ0kG5GbsgusX1QqkadOUU2wYkTkxRZHrmuHCy
 jmeeyGKuoVOz7LMMaAVyhreyf1qEpl6TGeE5TC1h/hQYtlGYLWaTbTjWcBrqG1lAojVIh2K
 qYoC2ZQGJzdpEtr6cPzpz2HRUNLzFGlUP7JAWujYK10C1ZuaeZHhpnbClgjQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 45B2244DDD
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 02:43:53 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010027.outbound.protection.outlook.com
 [40.93.198.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2481E10E936;
	Wed,  4 Mar 2026 02:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg3ZkAJtLkqs6NpXs6Ww/VzGvjInhO1LFP7+4D1RT1dQrdQKdt5cbHbFCoLLCWrnL9MP4fxe+mJzpcQdwEQt4JbeoxJ3esaB3G7twsz6IPmmeNp8++WCLyo9trqIt4nP2uQjtAMCoJ1qLnhWhl6TpXdt4YIrk8qNoEv1DG6zpLvWBWQaY+Jm37EGvPdxARkHN1po3bnN2VnBQEPJ7egKYtkVUBEDTdi8wZlXg1zOhlvhfzIIsxLlmZHmP+6kiGD2N8VtITC9LxrHQBB32YWBMdYT9Zy8+PeDRcMhMFVLwnq6BNx3Pg4ZS9eI+mDWyJGODXPc3UR9rDMI8ueOewdBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKn5iJYxA0e7uybFAtEj7f9GLfgUx+kqaroypgBR2vk=;
 b=zSyf5tU+B4v6figl8yvSxx8drfIcwyXUSXvoZOdZV9fEIdLD645MP5Eh8F9JuPSQi8qty8JhtgpTFbEDYuwiOPht3M4/F8KuOZY8TiMUIliPzineGf7rPGytj6J7T8+3SwBgjUdOmyO7Jugj8vnPX+VWCphTe4zmW6jeR1eKvv3TrGtTnWY8FygZ0mJXlagDPJ4LL+ica94jzYJoOupJIPRzsSC3UaU5ttF+nVmsS/joPwc6pCeKTKXT737AIcjBzlSXSeR/u0vZagHKYwfEZMUyia0DqNTvFR1EpVCpaMbJ40hF3h8I2Zx/IdufI104SccsQJtJR7sXtT5uWRt6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKn5iJYxA0e7uybFAtEj7f9GLfgUx+kqaroypgBR2vk=;
 b=MUwJ8qAPqVwHNkH+EjDqmwrYUagEnTcksmaNGcUb1ASXH8OMWQgBAaZKmebbHVYmno13oJ65PAvESJmzHc2wt4/o75OL+RITLLsQ0Q/tPekomC/Nvk3GQR5X0MPvrACYo2QnDEWD5r5Ih4vR0BNbmiVVY5Q9LgNJUC/tJKL4MTo8E1WYMeffCYREF09cHKhPUDBDYCqp0N3rKtVfZOoZv3Jc4pdoduIbcZdhSCsZwEfIg3IzQDXkFvw5xwfh3RMCeE2wX4EffGZnJJ180mriuh6+AFUaTo3lLqCJnY7Tu6RigBup3Fi6XmLO//Xj7VxnJ1HbsjfCXYipyyvDeg94/w==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:54:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:54:06 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:53:43 +0900
Message-Id: <DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Subject: Re: [PATCH v5 7/9] gpu: nova-core: gsp: add `size_in_bytes` helper
 to `CommandToGsp`
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-7-3f19d759ed93@nvidia.com>
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 878b1863-edff-47d6-e128-08de79994166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	+mPNdumM8655V3UhIPjOTX7PL5f8sZR/vwl//oJ2zLc2hFhSvjjJ5ddV5x+jySCK5M2auk/GPh8DiREyHV8VJew09bOMfyqvAThcW7GNm5fLZgAGufiq6KysfTzWwp+2lc1QWP9Obi5HdunDh6zqNz26r//wF4CUT0LVuzlJJmPwiE12KunIJ8OjK4BuRl6AaL+IcNrSAi3MGwTNlzK4NckREqsu9VirYM+gbvtPGPNVp9p5LSrvmNf1Oc9+1QtY8DO1w7WvO2Q9GTpzA38tGBryReThst42SqHRqBQpg0zldYla4MvijLzkKkOE2sdNBGiS+5BBb3f5JAPtu7CAS+MgNse9vCLSXgxgR1owhpanng36zKcvQCW67Tn3jr0p0Ltf4I/jbv/5LcrfiKpVrliK44fj5nDv5UHda3FLCicI8IalZ7L/O1uruf7/bZUEN2FgqYJNsuVlqWxDY6OHKyQboT6B5RPcwdgvY86ME7uz90AOG3RcpbH3B9YjNi2lBtJ9kpnNBMsUagLvE3J9uuMP6oXZmLIQYbIfqZY33lv2SgGCRfwqrWYZOSL3g84y7ryPsPVEfzFzsn2k3h7vLyxWRVYzFnhVt9KTApMZnnOS83i9x0IpQVYetYOlBdjOKmYa6KQLfVJi2XQc+DJzWFRNNP25kCjhPs4tFzG0R+zLbAFy3pizPHs7tzAP4fc73hRYUlnpWd0SaHhXCRaJgUMNyj/Z9xg0iKJ0R6YOrvM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGJFdDFCR1hSWlpzVDh1Y0svMU9sYTBVaHhEMkNHb3ZZd2E2M3dIbUZEamFy?=
 =?utf-8?B?M2RVSVJrZXBzb2wrUFpnOFBhb0ZqckFhaGNOMmUvclV1V3JwQTJISTJPT1B4?=
 =?utf-8?B?bWwrenlPa08wNHRhWWl1UnFpL0NoRDk4QlZVTXc1U0hIU0pJV2UvNCtTelBF?=
 =?utf-8?B?ZGp0WUlRMG1hWHRVS0NqK3F6QlVPTHdrZlMxR0JmK001eitwak0zMXIyZDJ3?=
 =?utf-8?B?b0p5OWxzSzVrSkFMZjB0UWpoWHRXV1pXVGFOblpUeG5JcEhQeWwvc1VJc3Ew?=
 =?utf-8?B?QTNCT3JaZnM1VjA5UHdIRVBQUnBpKzFFc2FNc3Q1RDd1d3FOZFBwTXlORTVn?=
 =?utf-8?B?RzhGSkhoblZrNGRlMWZDVnM1d0grWUl1aFhCNzRiZ29tMmQ2dDJhMVJ3NmJi?=
 =?utf-8?B?TTNENFNoNVVPckQ2ZGpNUklEbE1yZTd0b1Jwb1lYdWthZ3pBK3V1aUxtUTZp?=
 =?utf-8?B?aWFXTFR4UTFrNjQ0NWhTN0pXc2lVZWI1a25nOVBBNG8yNHp3ZmhpZE1wc2Ey?=
 =?utf-8?B?ekhDN0xxcVFRZktOWXV0OUZSQjRSQTdpRDRGRmxob3RJNlRBc1FrUDJCMWgx?=
 =?utf-8?B?bW1zWjFxcXVzSWJsZERDMm5GNlBWTjV3TktlZ0FqY2ovRE1RWTgzTlpoaThk?=
 =?utf-8?B?bE1FaUg0UnVndjlQcm9VWER5bmsvVitDMG5ib3NUWXpxYzhDR2ExeEdVbGpU?=
 =?utf-8?B?dlNRT0ZZVVdYY1dSVUdhTklVV04xTFJNRjNieGM2ZUFtSTZ2SnJ1VUFod1dV?=
 =?utf-8?B?cDYvWDlSNmE0aXp0c1BmeDRxd0w3cmxBbzYrN1VreStTOUN4Nld4dXdoUjI3?=
 =?utf-8?B?MVFFaEFMVnZzOUlzczg4UVF4c2tnQjhodGRKd3hpS2gvVFg4MUFYVUpjL20w?=
 =?utf-8?B?eWIwVHBpQ0MrRkdqQUlseXZxRmN3MDdvT21ZMkR0NkZlbFI5VEF1N3dUaVVk?=
 =?utf-8?B?aUY4dTQ3cXJWaVczdHUzdkhVNnc3aG14Q2E5NCsxMXVTSlpaVlduM3cvSXRD?=
 =?utf-8?B?UHdKREVDdllrQXNiMkZVN3ZGTGt4SE1PajF2Skt6Q2xSeUo4cFQ4a1U0NE54?=
 =?utf-8?B?WmJnRHpUZnA2aG9KWmpRelhITmxEVlNYUXBJa0pZQUJCRzlJdU13cVFtcXFx?=
 =?utf-8?B?ekZwRDJnMjVVVkpyb0wveEhDRzg0QXlDcU5xdzB2VXA5VkFkRWZSMVdXWHJi?=
 =?utf-8?B?ZFFxY25xdGYveEg5QVlJbkp4WDdzT1FrOGFOZ2crR0hhYUdDQWRKNWtxVXN2?=
 =?utf-8?B?QlcyeFg2YlBuQjdmK0RXKy9DK25MV3A3eVJ2VVd3SmNWcndRZVl3b3JXQktB?=
 =?utf-8?B?Z0xLc3QyTFMwN2ZiZyttYWdGb3k5aVZMTUd3bnVTTGFxZVRSOEVCc0ZGY2tG?=
 =?utf-8?B?OVIwTFlabTlpYWM2dHBQcGcwQ3h0bzh3VkxsY0oyZUhmZ0pMbVRyUlFnUG1H?=
 =?utf-8?B?K2hxdnJLYnc3VmhyNWFpU1NBcHhMUGMveTViOWliaHMzMjJZc09hc3lIN09o?=
 =?utf-8?B?NVRTOGhIQ2RsMUx5S1IrZkVnZGp3UVNRbEY2bm0xOHR2S1llNFQrWnVVdGtn?=
 =?utf-8?B?WU1odWQ4TmdQbVZlYTFrSDlXY2h2cXgyV2NzV09HNllMVy9MMXJLdkwxSUhy?=
 =?utf-8?B?aDFwV283RE5BYzFHdUFpSTBSVC9ySXpDOUVVQTFETjdsQlZuUmM5a2dzUGFI?=
 =?utf-8?B?dXFnVDhDaHZpYzNBZFBkN0RTNW5sL2V2TnFZbExJc0oyMXV1am1CaUJrTklv?=
 =?utf-8?B?MHpKY2lrK3FZRnpLbnhSZ2tkQnRCbVFzcjFuNnFPWXdYaEV0WVg1QVlOWFVN?=
 =?utf-8?B?OCtmYlNrRlA4NktUVDRqTHJ3VndBQ2V6NXh4Z1ZxamE1elpCT3VaeGhXNFkv?=
 =?utf-8?B?anZzejdqTUNNZG1iWkpGdFZBQnFBSkZCM0ttUjVaQXRZeFdKcDZ0ZERHaVI3?=
 =?utf-8?B?K003TGIvUEE2dFd4L1Jza2RpNkJWZnRQYW9oT1A0Q2NjdHlBZDJESWxQb2N6?=
 =?utf-8?B?bThjVnZSd3VMdUljblFoaEpDc2w1MU4rdERjY2gxeXVYSVhRSlNDc2hRQmdK?=
 =?utf-8?B?b1hNSkp3UzR3Rm16djQ5T2ZFMU5saWRaVjI3NVRWV2VVTVhSU1R6Rk1CM0V0?=
 =?utf-8?B?TmszMWROM0RJaDJKOUE1MFhjekgvenM1RVlpOEhadEVqZG1yUHZMd3FDemMv?=
 =?utf-8?B?MG8yaTRFQitmK1MvZHVYZ2N4VVY5NHFaNW1KZXRnUUxiMGJSanVPS0txNE4w?=
 =?utf-8?B?UytYOTh1OVhVdWFjdHRJU3JRd0wzbGJQSTVZRzA5Q2thUU00MTdlQUdySDlE?=
 =?utf-8?B?RmpVZEtYZ3h0aTFEU0Rrd0FqMzJzL3BKdUwxTkp1L2NQbTJya2FqQkhaVnJl?=
 =?utf-8?Q?aP/3O6jM4p1gmHCkPoGk/oWkNsoGX6A4nwSJtLVpu/zCv?=
X-MS-Exchange-AntiSpam-MessageData-1: q/1p6ASRzsB02A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 878b1863-edff-47d6-e128-08de79994166
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:54:06.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KsIdUz+1HI9n0LoxymzFOoFFxzN+eNeTe09zJB7vlJJkfR9oqrozJxvanwytMTSHl1HxlllI4wuK7K4tRv62TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
Message-ID-Hash: SFUZ3DUDK5JS2RZS7EMJNWH55FPTHYNK
X-Message-ID-Hash: SFUZ3DUDK5JS2RZS7EMJNWH55FPTHYNK
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Zhi Wang <zhiw@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFUZ3DUDK5JS2RZS7EMJNWH55FPTHYNK/>
Archived-At: 
 <https://lore.freedesktop.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 10:42 AM JST, Eliot Courtney wrote:
> Add a default method to `CommandToGsp` which computes the size of a
> command.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 48cf28b41f39..3424be4e15f8 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -94,6 +94,12 @@ fn init_variable_payload(
>      ) -> Result {
>          Ok(())
>      }
> +
> +    /// Total size of the command (including its variable-length payload=
) without the
> +    /// [`GspMsgElement`] header.
> +    fn size_in_bytes(&self) -> usize {

We usually don't specify the unit in the method name (the doccomment is
a better place for that). I can fix this when applying.

