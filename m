Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C54FB5EB8
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 05:23:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB810E3D7;
	Tue, 17 Mar 2026 05:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F/MhA5JY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 24D0A451E1;
	Tue, 17 Mar 2026 05:12:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773724375;
 b=OCBKZ3wh+z15BHXUs+9FGYIGY8ZFH+XAEYPr8z1132mgn9sSiQJmdcSvw2x/Q1Z9YNK8Y
 DJA8n2d78ncYOfifusRIKS4LGqA9AIGiKJBli9YLuwKl3bQBrILCWRA6N45Qy1ras3YkGIU
 JDux+SYew+niHxHsvauxPLYFEvkGr+Uo/QLQx+s17I3i3VGWi49ncP3gSDY0hMgJRb+F4pl
 LPLaCZP72sndKOO7JaOejoKWWz3iOeIolzVw7c7bSu9M6iVQMKEoA9y/MhBFKZEvKTL4L85
 SE7K1CTgIkXLRF1nXgdGG3VbW/ujRCkZT+wOvzja2kAZNOhu9nd7uI4jzPzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773724375; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PwqTFFIUkARcSqYMY8CE1WI9m6m5dg8/g1vboI3/GLA=;
 b=agnTMBzulWntuJ1GPCtTOJ12j3c0ZNXyzvDXrL60shiEpU9FlNJvfI5Nawt1HAiveez3g
 B+OVOBOyfsFyvK9XdCyxMONaFMgxdVgY0XLdGDSCpgOnSI+6e/1MoBxNQ5+T+aHb+bTYqnQ
 n5Jf97kqwDaZKCMakAwsW/X4+AXy/fQdJTATL/lVhAOsdfFzJZ57f4DdWpoFzbUVa9KNJI9
 0EcYij6IOCgxrlLsXqgmhQij082xlqH5KNJkXRARl9uIDmw6ZRc4d/osPIuedh0/Yj0bKn9
 Z2sdbvjSMsH+PHBOWIobAvvXBTn8g18wktxiAMLoX7bgYvVbyR7GK0MH7d/w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B7AD451BF
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 05:12:53 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012029.outbound.protection.outlook.com
 [40.93.195.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5E10E21B;
	Tue, 17 Mar 2026 05:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2h2k/VQAFlOAG1YCW9h11i4pEfZeB5SVgkSs87clDJ5+8h/KLhlj+jTRFkNi6+B/kF6NhNzfYr24YoOEUu63A/hnojJQuCJpySiVSfR0Uqd/aP9sJQAZD+M5nLq79xe7A1Lx3uIi6KzmlU/QI+VKIEmujdTzwRtIICqZXOpf41w8rfYlTdE5qCcYLTQEjn1zWZNIVFn1AR1zKks9COe+TNQHCLFin82fqNjEgkIyA3AI1DepfsqdEz59HKiw8JGRgS5jDIHNh6eg3M2kEiePjyFo3DsHCIUAThkn7wAYsOxRyrjA9tQRkYZ0ASZocBKTBcwVvuqqYiixsE9gJ2FqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwqTFFIUkARcSqYMY8CE1WI9m6m5dg8/g1vboI3/GLA=;
 b=E/it6hqjlrHDG9rL9nmGYAIZCoqdZrvQul9wMx/JWWPAdpLpKCRwa/Wy7SvPXfKX+jNeQ34Ao6OUL5FxErDWbZ6BudjZkHPbjikRvEz7Uq0jTtah+/5OBtGeeKXTRNkQZya2Eb3xNeurp3uKd4i5WCsF42k7MI3sIgDnCflILFlbfkV5alW0avcsBg06PMAvAROFeQWr0WJbuyjxLH3zDETBMkjHIxFAoLYZh1IXgVpSe6f/yJ6E7UY5/R7ANzqPA354UZU/+xbb6pT19OSbejylDVZwv8LGIB4+66UFi75ee+wyZHwwQRaglk19pV6jtwG86Q2OZzemv3N8h9UcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwqTFFIUkARcSqYMY8CE1WI9m6m5dg8/g1vboI3/GLA=;
 b=F/MhA5JYaC8eRo2tZtCIAHSq1cqlYKfwgUu82jX0oMm1vgSdWZy5BDEVWDUTl1vCD9O7yWwfOJavp7DowiRc6jCoSFoQ4wVnvWVCJTAzEV1WPKrXkkW2GfTKs87FKrBjFEESp0OErWpTpsB2k9pFqMRXclAvrT5FKSt2tjkJpkduuOQzkIowrgkBAwCDWq8L+TgbZo00DcGqmAR4GnataVsYxlLpYthdp4ayjNKVFt3DGWGSrdjIpMVvjuNwy2qMfPi6iJKYJoJPlnVrkju9Hyby9WBWIxPAYntXMJFpQYaWXwPo4rPsGD1GN4VT42lOeinR09tXUMzUJfq3UEI16w==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.17; Tue, 17 Mar 2026 05:23:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 05:23:37 +0000
Message-ID: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
Date: Mon, 16 Mar 2026 22:23:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-drm: rename nova/ directory to nova-drm/
To: Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
 <20260316120820.2117081-3-yphbchou0911@gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260316120820.2117081-3-yphbchou0911@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 026703e9-16e0-4691-2e3e-08de83e55749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|22082099003|18002099003|56012099003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	N5iSm/QrH8Bwo30P7RCxv2Z7t2ueqt4w2eDjSyIOeGQRoYuputEqYenAL0hEYJ6ZxOZvarje35XgHFP+/zvztHgCuioYnP9Bwu4MgS6VAnXEiFGv5aster6N6ZdvU6sqxXcTskeVUXLCDtq2FEc/TAnTLlwFVWKppfdhNPIWyKlzGaiYJ/dGOWCZ37akqWZJLXpLOc3mO83l+iziRbaf6GE/896jFHBYcnpj1Coq18xAhjublaMuPTvpBdg4sFgPcFpN4cSy6oPyW24FMEFD2Pb09vpqBEqMLW557AhDW13+eJw7qABWWxv6yGVgj+FZSkNGJABmeVfRI4JjQUPNm4PuTdN8qQFeCqqz+3oOKxyTE0TSFUs5jjcnCkECpPiBc+OeMS8mg+d7SZ+zSNwewPdBC5AIyt36tvTvhuIAapflL2Gd6zBuHsjoT2h+GJvX3NTHduqm+rYp9axHsWdrAUrV/Ws/qGHpFLQ3JF0SiEFXr6mTMm1/DA/Tzl5zHDA6iZv3g4qqWYUnHoOZTEHwF5Ul2ysbekbeZZq20g9zA8rUE8xPnsozqGNpUh3IQbyqBNh2rD2g6U/PZj226EhfdIdjgX6V3jIm5n2I6ndhJBtmhb/+R+mn4jBnA6TRdU5/e6tyx5x+M0t+0k4bCpGiB5z3lyUK0gwrz3eL1xIfbr2GCyFCPFCenPByPsMykiYPjqxHYQ3Dg1nT+Ij568wpvNj/h399h1CxX2m4fD37CC4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(22082099003)(18002099003)(56012099003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnVaaUpaZGt0Z3pmR3ovbFYvU3piSG1kVGlRNndyZm44S3VWeWdtQW9WZ0pX?=
 =?utf-8?B?NWZ3QXkzclQxNGx2YVhGcW1ZSW1aYk9kaFNhRDRBdkxqRmx3Q0ZuMHR2RVcz?=
 =?utf-8?B?V2gwUFRRQjczMStrQ2R1aXB6djJVZTAybEVhZTNuWllmZ3ltUlR4QnQxOG5i?=
 =?utf-8?B?WE1GZnR3QjlWSkRZbWRuQjNRKzZqenoxRzNyRVVJUFJzMGxQcVY5YWVkT0Ir?=
 =?utf-8?B?a1MxYzRQTC9HM1VNajdXellRT0tHRHNCaUZRaDc2dFA2Z2dTSXdwbGpzU0k1?=
 =?utf-8?B?OUNrVWc5WS9JODBkZ3FlMGdtZ1g3MDJQbHlVYWZxQ2R0YURTTGwyRlh3bkFS?=
 =?utf-8?B?end2UXV6Y1IyL3dZNHBhc3o1eFlrYkNLYzZGUi9ZM0RZQWZqZXFLRnVYeUJR?=
 =?utf-8?B?ditXU3VwOW5BanpmeUwwZ1BicERDMjE0V25jK3dEcVdvSllmc0ZSUUJ1UnBQ?=
 =?utf-8?B?clJGVmNTdFhnelUwZ1owUHRaT2F5Vlo0eVo0VkxjbjBCMjRHMFZaVHV1OElq?=
 =?utf-8?B?VWJqTGc5VDFwaUhLZ2ZGbllEUlgweEk3L2lBVkFncCtmNG1Edmh3NWxpYTlD?=
 =?utf-8?B?bDZESWIwclJYMjltbEFFM0UwTGFpTGJUVDJ5UWk3SzBCb2pBcjJtV2N1bHNP?=
 =?utf-8?B?dGJUVlBJa3VSOWJKODJiRm5UWkx2UFhlQ29YZ3VQNERwaEFJL2Z0RFdlMWxZ?=
 =?utf-8?B?N1lORTVxaFQ4NnRKSittMEN1MDZoNXk1WUZVdCtMWW13MnNvR3B3c3BYdndK?=
 =?utf-8?B?aXRmcGwxWVhjNVYyOUVxWUJsUG1xM3JueUNWVm9mbFVDWkZlTFYvMkZQYTI3?=
 =?utf-8?B?aUdtbUYyVDlaQzRpdnJQaEhMUlg5eEVvM1ZacXYrdHJna0pDL0V3RnlrdWI2?=
 =?utf-8?B?ZGdFaUxIQmQwT0dLZ24xc212cmpTTFBjcGNrMkxURFpKU3VzT1B6L2tJOGFR?=
 =?utf-8?B?Y3hqeU9ZbU5rNmFpd3BaYkV4QkpjakJCbWg0THI2WVRlbkoycEt3S0ovZDhR?=
 =?utf-8?B?NGZNQWkzSUNJR1hFOWNHV0FlL2N2dUw0OTdUV0RkN3JwZDFwUkQzWlVLRjZv?=
 =?utf-8?B?a1NCVXFUMFc0Uit3bWNvWEg3T1MrTno1RnB0NXJkNzlMRnp4RXNLTzhhM3ZV?=
 =?utf-8?B?NitjVmR6dmlkV08va2UxNTNKYkR6Q1RkL1lsZzJDVHpHdUVISGpNRVFmbjA0?=
 =?utf-8?B?UnJ3bVlxbklHdlM4cG95QUp5MWlYdnY1TXZ1WEh4TkxaTHdzMS8rclpRU201?=
 =?utf-8?B?NnBJdE1xMm92YUxXd2ZuSFRUTkFHQmk2Q3dLcC8rSGIrMjIzWnNZK1pnL0ZS?=
 =?utf-8?B?REs0elRkaDZjS0xTNWhaVS96QWNBV1NobVV0M2dEUm5BbnljSmNkV2pSTmZH?=
 =?utf-8?B?eUVXU2ovYzExNWZZdEVlS3RXVFRMdGVWaGlINjVkMmJnWWw5K1Yxc3BwSGZa?=
 =?utf-8?B?TkRUN25ncy93VXROUmdhYkhuL0JKdm15dGxNTzkyVjNrNmlFM2hFNXI1eVBn?=
 =?utf-8?B?Sm1ZQnRoNUFxRjRGRDNyUHh1QkZ3RjdKN0ZBS1g0OFp6WHNIRFNPd0NwYytr?=
 =?utf-8?B?eWo5aEN1UTRFUE1lZnIvdUtJVnIyOHYyMFJ6Y2dzSlQxdkVMaWZSOWRFaDd0?=
 =?utf-8?B?SDBZck1XTFRiWXQzQUdqVUw2RzFRbnNld1k4RTlLb1FMd0JEcjNBNnJ2MFg4?=
 =?utf-8?B?ZGF5ZTFENmVwdWRuTjg4cWlKQVlzZHN6TzBWWU1oL1krYlAwTWxhRVp4NjFi?=
 =?utf-8?B?TlczL3padDROVTNiN0dXSytNZlJjUVVmRHN4b0hxNnBjdSt4QWtxQ1RPNDBP?=
 =?utf-8?B?QmxLMHoxeHIvSWJNUCt4VmQ5dHFRcTRlMmhDa1FpRExIcXVuRnRCOFE4NGlL?=
 =?utf-8?B?SDVHQ0JrUVlQT0ovMGtnaStKVmczTlRNSmZqS0RLTWdxVXpyR25yS1c3MEx5?=
 =?utf-8?B?d09GT2lERitENzllNk5uM21qcWFyQUdRaHdFWVBlWUhadCs5V28rOE1tSGJR?=
 =?utf-8?B?WWZWVkZBK1BlUXRVTGZWV3dEQjB1bVZSTGhGYlV1VlZZY21aZUI2VmhpUmx0?=
 =?utf-8?B?L3hXK0dHVUtuZ3J3SVlRQW1sQjltN251Zi9SQk9oY1pJRkg1VXkwbGhhd2E0?=
 =?utf-8?B?UGY2NlNhODNxMEk4RkRZMEF2cG5WREhOOGxhdXo1c1lWTzJTelhhTzFJSXhI?=
 =?utf-8?B?V3dIYWtVa1FaSENWWTZQc0ZxYnBlUmlZOTVZaUVsVDlUdEpDNkhmODBFYmxl?=
 =?utf-8?B?VytBY1NYQm0vMDdvMENHTjhXMmZyaW5abmVuRitEYUVaOUdKckcwVUZnek9O?=
 =?utf-8?B?TWF4cnRtWHdhWVBGN2x6bSttU3FXVForOTVRQzlDcEcrSkY5RVAwL2k3L0Fw?=
 =?utf-8?Q?HhPHTL7D+JZ3bV4s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 026703e9-16e0-4691-2e3e-08de83e55749
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:23:36.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 31Kd0bKeeZgJLulA8fFOoWTeY4K08spgPtPInOckGbtlejbKEuQxZp+VbM/ikKukeTUFg403B60NtBTTM51UjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
Message-ID-Hash: IDLSF7LSFQ6DBTTRLCHC45CONC5GLURK
X-Message-ID-Hash: IDLSF7LSFQ6DBTTRLCHC45CONC5GLURK
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IDLSF7LSFQ6DBTTRLCHC45CONC5GLURK/>
Archived-At: 
 <https://lore.freedesktop.org/e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/16/26 5:08 AM, Cheng-Yang Chou wrote:
> Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
> drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
> to nova_drm.rs (matching the object name nova_drm.o) to follow the
> kebab-case naming convention already used by the auxiliary device name.
> 
> Update MAINTAINERS, Kconfig, and Makefile references accordingly.
> Update the Kconfig help text to reflect the new module name nova-drm.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1228
> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>

The subject line should be changed to:

   gpu: nova-drm: rename nova to nova-drm


Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> ---
>   MAINTAINERS                                            | 6 +++---
>   drivers/gpu/drm/Kconfig                                | 2 +-
>   drivers/gpu/drm/Makefile                               | 2 +-
>   drivers/gpu/drm/{nova => nova-drm}/Kconfig             | 2 +-
>   drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
>   drivers/gpu/drm/{nova => nova-drm}/driver.rs           | 0
>   drivers/gpu/drm/{nova => nova-drm}/file.rs             | 0
>   drivers/gpu/drm/{nova => nova-drm}/gem.rs              | 0
>   drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} | 0
>   drivers/gpu/drm/nova/Makefile                          | 3 ---
>   10 files changed, 9 insertions(+), 9 deletions(-)
>   rename drivers/gpu/drm/{nova => nova-drm}/Kconfig (84%)
>   create mode 100644 drivers/gpu/drm/nova-drm/Makefile
>   rename drivers/gpu/drm/{nova => nova-drm}/driver.rs (100%)
>   rename drivers/gpu/drm/{nova => nova-drm}/file.rs (100%)
>   rename drivers/gpu/drm/{nova => nova-drm}/gem.rs (100%)
>   rename drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} (100%)
>   delete mode 100644 drivers/gpu/drm/nova/Makefile
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b277d5bf3d1..7ee486627420 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8201,7 +8201,7 @@ B:	https://gitlab.freedesktop.org/drm/nova/-/issues
>   C:	irc://irc.oftc.net/nouveau
>   T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git drm-rust-next
>   F:	Documentation/gpu/nova/
> -F:	drivers/gpu/drm/nova/
> +F:	drivers/gpu/drm/nova-drm/
>   F:	include/uapi/drm/nova_drm.h
>   
>   DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
> @@ -8484,7 +8484,7 @@ X:	drivers/gpu/drm/i915/
>   X:	drivers/gpu/drm/kmb/
>   X:	drivers/gpu/drm/mediatek/
>   X:	drivers/gpu/drm/msm/
> -X:	drivers/gpu/drm/nova/
> +X:	drivers/gpu/drm/nova-drm/
>   X:	drivers/gpu/drm/radeon/
>   X:	drivers/gpu/drm/tegra/
>   X:	drivers/gpu/drm/tyr/
> @@ -8496,7 +8496,7 @@ M:	Alice Ryhl <aliceryhl@google.com>
>   S:	Supported
>   W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
>   T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
> -F:	drivers/gpu/drm/nova/
> +F:	drivers/gpu/drm/nova-drm/
>   F:	drivers/gpu/drm/tyr/
>   F:	drivers/gpu/nova-core/
>   F:	rust/kernel/drm/
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d3d52310c9cc..958fa142b6cd 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -308,7 +308,7 @@ source "drivers/gpu/drm/mgag200/Kconfig"
>   source "drivers/gpu/drm/msm/Kconfig"
>   source "drivers/gpu/drm/mxsfb/Kconfig"
>   source "drivers/gpu/drm/nouveau/Kconfig"
> -source "drivers/gpu/drm/nova/Kconfig"
> +source "drivers/gpu/drm/nova-drm/Kconfig"
>   source "drivers/gpu/drm/omapdrm/Kconfig"
>   source "drivers/gpu/drm/panel/Kconfig"
>   source "drivers/gpu/drm/panfrost/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ec2c5ff82382..acdec9e30a27 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -186,7 +186,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
>   obj-$(CONFIG_DRM_VGEM)	+= vgem/
>   obj-$(CONFIG_DRM_VKMS)	+= vkms/
>   obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
> -obj-$(CONFIG_DRM_NOVA) += nova/
> +obj-$(CONFIG_DRM_NOVA) += nova-drm/
>   obj-$(CONFIG_DRM_EXYNOS) +=exynos/
>   obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
>   obj-$(CONFIG_DRM_GMA500) += gma500/
> diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova-drm/Kconfig
> similarity index 84%
> rename from drivers/gpu/drm/nova/Kconfig
> rename to drivers/gpu/drm/nova-drm/Kconfig
> index 3e637ad7b5ba..48a731bff9b1 100644
> --- a/drivers/gpu/drm/nova/Kconfig
> +++ b/drivers/gpu/drm/nova-drm/Kconfig
> @@ -13,4 +13,4 @@ config DRM_NOVA
>   
>   	  This driver is work in progress and may not be functional.
>   
> -	  If M is selected, the module will be called nova.
> +	  If M is selected, the module will be called nova-drm.
> diff --git a/drivers/gpu/drm/nova-drm/Makefile b/drivers/gpu/drm/nova-drm/Makefile
> new file mode 100644
> index 000000000000..bd3a5e703742
> --- /dev/null
> +++ b/drivers/gpu/drm/nova-drm/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_DRM_NOVA) += nova_drm.o
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova-drm/driver.rs
> similarity index 100%
> rename from drivers/gpu/drm/nova/driver.rs
> rename to drivers/gpu/drm/nova-drm/driver.rs
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova-drm/file.rs
> similarity index 100%
> rename from drivers/gpu/drm/nova/file.rs
> rename to drivers/gpu/drm/nova-drm/file.rs
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova-drm/gem.rs
> similarity index 100%
> rename from drivers/gpu/drm/nova/gem.rs
> rename to drivers/gpu/drm/nova-drm/gem.rs
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova-drm/nova_drm.rs
> similarity index 100%
> rename from drivers/gpu/drm/nova/nova.rs
> rename to drivers/gpu/drm/nova-drm/nova_drm.rs
> diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
> deleted file mode 100644
> index 42019bff3173..000000000000
> --- a/drivers/gpu/drm/nova/Makefile
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -
> -obj-$(CONFIG_DRM_NOVA) += nova.o

thanks,
-- 
John Hubbard

