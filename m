Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F75E94629
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 02:46:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B93C10E4D2;
	Tue, 10 Feb 2026 02:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VogEfxD3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F23EA4241D;
	Tue, 10 Feb 2026 02:36:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770691012;
 b=xcbOELmpNvHY3tLggoyhj/EMWkV5YNPhhMIzfRqcuGTzt0Pnk0O6KjvOkE2qSQg4T47zV
 7XK6Mo2ot8IcqmP0eY5KILTAcegPwF7p3X9QfRkQtascQltwvftf58oZ+AwNEY1xR2IIMk9
 PiYYggElF+CcDo+sgjS4MAGkLOz/ntp9kwwnUtNB5CPGjdxVr61d5+p/k9EyaOx+ImwrsY4
 CxcIfEw4ST1iIXR/L/hhSNrEfw75yuYj0bmpEbjbr8YLi3Hkkb3VPIxKzfN0EY9CU/ZqCnX
 H7YXLf1V7Vzut+4QdNPh4whNaWg+tEGZ7Taz1GGBeyGaSmAY4WQbX/L4bMjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770691012; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=BS7/5BEUVU38fOBVKDE6zEHhv/l740t2muHIrMlewMYa813oL6fZcAR8W/46R88IeL2XW
 AK+zerDzJ85mTPcnJlMpazYuYymlb0BX/ED3mpS+oM5t5Utb013d41Z76BR9KJrXPryx0Bq
 RRJUjyW/9PiiPi0QBnKHuSrsnHhzsabPDVQwD+YKi8x0X0yS41vCR6hU289vXoaWIqelopP
 KAAcxIwE9NzoOY1GbdXsw6Yxb4aXVONAwXax4XyQ5MSiBr26rGwdaypYv4SLpyTD8IW1k9v
 hWfZrKzI/XfQcxsM40CqjusjRZcphE4Zk9/pQw5wVDaCxVkEnmvsPStA1pkw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A539141C6A
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:36:49 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F84110E4CD
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 02:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQl6Zq70QBNt8FSv3Lle7W6caF6mTICZkSCqJd/axFp/U9Ysragimgm+zQuijMqEzgtvrwVkEY5dzoOTaenY4gPn1/PWZDaEWC231fiFRLwemFa9dzAs1RL/Tzur9MDh5GY9Og+tQRiSjMJ2SpPwO0TdQjcHbwl7z0fP+B/EAwp98kBynv9fq5eMLUcjM1ayA6/vjzUR80NVpKUx8MAjf4YV33DgY9WtcOrjrxy904KPrN5CEqCgJnphQthjz+Ts3orYV8LUfDeArhdfG5r+1MJ90WUEPgEKvZqH1wwGZSwgfZy2HSvCe2bOjU7d8331Xs9HXIumtjX6GUAYGXX4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=HYwVSsqZMGNThsxE6hXcY/N7gBPcx0FNRyVRLJGjlDsLPmyhITV1OgV2tQ7miv7jofNsd41EiFHbrw6cFO0iLBKVZRoimiVGoXwv49gQrw7mqRwK5/oaxCJ6p/BsFMCAdFflukfhg/E4aPS266/RkQ6I6djKoHAqxD+3W/sdzASE3e7D9+N+sMsRM64pIQUuNn72OfwzxuiPUEL8S5hvkQXPz+UcQaI+8I+nVzbyemNmWkpnm59YrNTZvcv2Y6Nxp3uVEwxDyxW61lQ75B77oBMsQW+wUeNw6P8BHH5Qd9YieVxdJhvXs4CxtvAW9bGP8Sn9WTNsZkl1H7xruhMAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=VogEfxD3wk6wOIXzXiXv+Yu/OuS9ihJfvU6XS7CyLGNF6Y1CJXy5JJ5C+7UkvlEaH7bnN6jtgXqZkGCQhjHf6HXr/Rsvwri9u7V8FAvxqz+g5DFqdd6DNea0YH8u9L+SobTBsRwhWDKEfEgqQEqJCr/gT31Vog4zhLdwqTIKhjCX5z/l9y0ZbrhJQbZpdycvGbgTK1bDe4OzV+HvtxkSCdxxO9OkDv+HB33T81c+Ai+eqGYE6bTR3BMD0QBUGq566XJPzk/aIdUmdwzbqND0I6Ulhp5RIS2Ypa9IKOwlZ2OwJ1ctfH1Z4+XygE3v4B4aTqyTRFw0bnLYfPO2vE0fSw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:16 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 07/33] gpu: nova-core: apply the one "use" item per line
 policy to commands.rs
Date: Mon,  9 Feb 2026 18:45:34 -0800
Message-ID: <20260210024601.593248-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 33be5086-8d65-42f1-ca16-08de684e8d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3fK/54x50k338BSqs6Q2W8RYomLWOwUVdLmcr4tRxJmgqyEfl0OMILVs8Yol?=
 =?us-ascii?Q?MWxi58Wt4IDQrYSdcZtEzXeJ9RQ685C/WKNn7YJ0nKNtSeYr/K8HCTR5eP0h?=
 =?us-ascii?Q?TjalJuay3gXTjWV/VRhtRSmGZ7vWWzovfj53V2tFIrveL3vb/pt3m/RQuh6V?=
 =?us-ascii?Q?LSPFHoH/GjXvs+1h5TqsaZ5NtA2mDAqXVotVepgyPfRmXn17CVRGoJzErzjM?=
 =?us-ascii?Q?6itvh3Se0Tfe/z6wm68UVCgW3TqirnQs8Aiaoop7BjSP0G39HMRW8PWQ+nN5?=
 =?us-ascii?Q?dDsDctV32/JpPWaRYG9AeLlsDso2z3yqon3wnHTMibOIFMQyol00qNuZuP3q?=
 =?us-ascii?Q?KsQnm9ZaUR3h5Sy+EL/W0fnH8rs+0TSSB/3zQjAC2tnUbbBi1U5oeo5f6Q4R?=
 =?us-ascii?Q?ONK5Hv6dxSHwc8mDttxAWdBI0esNmqk3aKWAoMbAh/x98eKBv5sJsilw/LAJ?=
 =?us-ascii?Q?/pyAdYk/8QFnEslCwTthlCr8HCOZ2LjZzq3LvLmlVTgC5/EjnF6esyjsAnMe?=
 =?us-ascii?Q?kFQgIuRnCL29tigIZil3v1wxJcOk7UxyG/pxzHKCk+7lwJaMUgZAlHQGYGaQ?=
 =?us-ascii?Q?7aBRyUxgMpH28eO5X59CehXBjUmxplzBlgA1xKIQI0z0sly6KbPoyRh/w2VL?=
 =?us-ascii?Q?Bh/oXFtKl83ukXzuW2H1zqP0XZ3p9h+XeFYhRD1LUQuLa3fxS5efz4jBhYEk?=
 =?us-ascii?Q?gG1W25aOrdM9YJj5URSk/FGSTzERUR8YcMLVWABbyegt3y5TlRfpJ7VLQ5Xe?=
 =?us-ascii?Q?BFQr5sJwq1kkfNn2sbWXcMeywaLKTAT51m/E904Sq3+eYwFxBV9BhE/n/Jw7?=
 =?us-ascii?Q?oOHHC1Qmmz5dkAVa3dHCHrEjwRCtnsyNcBES/Uirr19ww+NnsgOp7bWA1dCW?=
 =?us-ascii?Q?cGcNmlBCFKKYQKYFczVu9ESI0d3Zgwqi3/JCxNYs7BAYTayuOZz1MHxAeUlo?=
 =?us-ascii?Q?xkzMb4CZog8gJPfvYZt+w5/yoZhYrJtr5ILmhSMntTaDfP/4NaIhCnFfBHED?=
 =?us-ascii?Q?Y1jxlaLMraSz0bkv60x4CQzVIiZCcDtTgeZtbytt6XSIqsGP14j7BJd89iZP?=
 =?us-ascii?Q?RufWbZxcJN66P6MG5/MTG3d8663ulvi57CnJJpbMKH6wxO+Nv3sNAtLjM/ts?=
 =?us-ascii?Q?3v1xaz27PitUFemIVoEnDbJh8T3QNuvaQ3Mn7hDED842is2X5HVAPOAuXtJv?=
 =?us-ascii?Q?XxyVhDnhSL/inKY61xjJqhsSEZUcyeLtBaF+KO4Yqm549xzuyV274DOsM/G6?=
 =?us-ascii?Q?M0PPtD3+Jj1G4W9356rWQF19CwHaI/zQAnGI0pmAR+KOYP/iPZMVUGf84+A+?=
 =?us-ascii?Q?TDA8e36gTVNHym7iP9BHgQHo0ndZUfRpQMrYs72ZyJI6U0TCNxI4qLNGOajX?=
 =?us-ascii?Q?11hDVxo2+JXSZ1UojAITC9Lt3a0t5UGe96lm0fKAIPUGH37oH2pO6p0N2AN9?=
 =?us-ascii?Q?4baOb1xXimFeTHVD039H+wnb9Wmzf/De4ZpopoO9csSmF4UxRwHz35OlFlgJ?=
 =?us-ascii?Q?3DRxmJMD/5+k+U3ugLdpidvCCoFbY2p1QYl/jSad4iaBZBFRZ3PFO+NN0XzG?=
 =?us-ascii?Q?gELpPsLE8O0DSSTO4Rw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BWRrnbjp2cKh0WIppCoLwKgwCVIo+bmsHhCNBohnRE0tS6JxW/qYVN/moF5e?=
 =?us-ascii?Q?cxTJUoEcuDeBYhIa+6mcEGKCIhoAsz8Mh9H11v7lcAjZvp32vRbN3LPQDhT3?=
 =?us-ascii?Q?Pur0PYupl4kaeXE8zmRfOWpg8025qJpRQHhFIgxUcbddjb7ldA+VW3/a2c7R?=
 =?us-ascii?Q?ncHjeTeNzTk6dNUDOwuANYLAWE6L/7obEjt5WAdZizWX1L1B9jNTV0py15ZN?=
 =?us-ascii?Q?CIrwDndwAPZYIMEvavrXgwkTi91HAoVgu06L6JwZnCWuVfrIZ5OPJDNgM16T?=
 =?us-ascii?Q?HHl66M8hz6LQMLYJVIk9+QhvA5Lxw7WXBN9yBVsOVnG/KJEelyxsDvPe+RrD?=
 =?us-ascii?Q?lvvSKZ+ts0i6dVBr6AL6lZULurVxsyB5gQgMQjQAYLsLR5dkiJQMcl1i7PD+?=
 =?us-ascii?Q?QNXiU7zPKDq7U9yH9x1xeZaoz0WAobu3RqdtvU6weZveiWqi5DcSU1UgbKnR?=
 =?us-ascii?Q?qmNd77j+INVn2adXjiuF2wyx9bLPccSnGvanoBloarLPEwDa9V/W6JG/eHLi?=
 =?us-ascii?Q?C4UZpfM/7MBQkWXbtVy1zC0PLeo8XwKsXHDQ1k/THg/DubFNHlm0NGMqbZRu?=
 =?us-ascii?Q?USlejScF3vL0qxL7/emiwYx4rPpRE+UY4lHLYm3xM43rJKruxQdiLadXPXRT?=
 =?us-ascii?Q?6ekA0wK9rRk0PL3KAcsz0sYx2TYK9HCFcUm5fGCJAIB+ZuotS//BwmPIP9DT?=
 =?us-ascii?Q?j3RADqXgUy0euIlOKTTmbpwLe45aCNNN8y+shGhU1seQELcHvGMw1GJWXePl?=
 =?us-ascii?Q?cLJqHU5ITk2jFYlXDj7pHzaD+rpmX3EV6R8nhF4DCkPHLsbwSWP95DJmbrvQ?=
 =?us-ascii?Q?IiMV6i+CrQIMifI0HidUlNy2KM4rcTQj3oxEVcBelymaokIM88HUoWFOGCVf?=
 =?us-ascii?Q?ikRGA7LT6p6e1zpW10BVyoOkSl7RGb9SXaHyGlOaDqfZsMRoDS4mhG3noQoB?=
 =?us-ascii?Q?ZbcnGvHA/cNlRGtXO2swq/ZJLXujk10in/ZFN2GZiZa0sUh8C8juG+XCuc1D?=
 =?us-ascii?Q?Z8H26A6ehdh03pFpgSKf9JGd8eFYUZOC2DQcITT0fq2EcoEQWMBcI+7SFj31?=
 =?us-ascii?Q?mpYz2c+za3LdP08Hq+l4q0iY5/cY9pKGNPhn2rGwUkDyCftoF5pD1+wFKVx8?=
 =?us-ascii?Q?cUwqJ3dsVUlZvQ4RyzHPrwQ51AtrkmRV53wHI6gFwho+T5zrmW5cnqT+Q1jT?=
 =?us-ascii?Q?T40QIcO99Fy9echmaznJmTKsKMK9seVBz2TFbvixCWcIHmESY2QvtA8hzlHp?=
 =?us-ascii?Q?VnXIhD7OO4GGWu8bTXmWpco9FzYU2vfsprFVGcpASAX7+DHnHO88SL+3Xo+w?=
 =?us-ascii?Q?kb1iw30NtBhGhyEhK8owak14C+54ATNXmAj1WuzWUbUG6fNnKedUHb6Fwfrc?=
 =?us-ascii?Q?4EAnrZR5pm1pCnM4+BO2HMr3wZq6O7FbDZYy8rWPfvzTmN5M+1GbVuzjhSqw?=
 =?us-ascii?Q?zIy5edJiiW5iCNzGlssFbhAcf7rklTGzj1Pa9LKmjvT7U9pgcwiNWETywhlm?=
 =?us-ascii?Q?RvzkGVYwIUOxNeJbVdrTo2DDoNeADY+edccvSCVaBEdbWzXUQKdp8J/Dn/c6?=
 =?us-ascii?Q?PJOieFRtghNeEPpi8sk25/iBAKKH+OVG58NYNBMpJXKE2TlMGKXE0vuEe+R3?=
 =?us-ascii?Q?43Ka8TeycSrj8lZgQNe3fhKoE84nhiDc4xRUqso82nFXNdV+upZYE42FhXZM?=
 =?us-ascii?Q?pZL347ZSr+g7TKAmQ82NwqNzDyNwWhx3M3gkWwPpW/LGVuQ6bbyiL6q7wn6y?=
 =?us-ascii?Q?YDC8fcNqow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33be5086-8d65-42f1-ca16-08de684e8d0f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:11.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iPlClgmgGi5mRDDgObVI8H07W/Yco/pV3kVT0dhGMg7OZkmjASAs6B9/MNuHSVJfSwvAqJJwwB7tcLOS7o67XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797
Message-ID-Hash: J6FK4ESR6W3BIEOGEZEKELNHGU3BBQAM
X-Message-ID-Hash: J6FK4ESR6W3BIEOGEZEKELNHGU3BBQAM
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J6FK4ESR6W3BIEOGEZEKELNHGU3BBQAM/>
Archived-At: 
 <https://lore.freedesktop.org/20260210024601.593248-8-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for commands.rs, which is the only file in nova-core that
has any remaining instances of the old style.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..470d8edb62ff 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
-use kernel::transmute::{AsBytes, FromBytes};
-use kernel::{device, pci};
+use kernel::{
+    device,
+    pci,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
 
 use crate::gsp::GSP_PAGE_SIZE;
 
-- 
2.53.0

