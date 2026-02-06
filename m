Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11B3EA7955
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 04:21:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5F5010E37F;
	Fri,  6 Feb 2026 04:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KuP+n4FG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5A2BD41B48;
	Fri,  6 Feb 2026 04:12:18 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770351138;
 b=f1KwavFma5CPiTfsARQ1U+EPXe4kVmTStTrOwFW/r9rnrgodTLXvQ1RyW5grA+MotAfVt
 o7sXqKLdwImux1REi+Ns28+kAFjmddWPGK5OPdyqdf2KFRHeLztqpw8JiFoVYr5ndIlOzd6
 p/GwCDG8RSu/EbdkZ1rqiJcjy+x+V7y3trqPotk9W73ye2f8LxuDQemsPKQwcCuSbtDE6EA
 vi+BjUFWaFqMUuaPu4Bl3QR3U0UVtq1SDXmei0glwqwldYr97fZU2lWxed3NQzPH5p28jvg
 +NDj8lx4XT77+GzXw1QeBv9NyIGrG5PLUsHNK7wOJ0ZCJ3XNtlyYKWSVl8kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770351138; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WdYM8BVmIFn6YxTO+XuFY12UyRiggdFxk7uSCVFCOnE=;
 b=QicDH2DlqdXL6Xe9SPpvALU9ob954tAus9GNcBxQQQMCx0ClsNYhphdYEW4QB7fxbF4Ug
 l6uXJJ3apOxAbg0k0eH/xU+8jp740OqnHy31CrpD4FLsIcbQ4jgmS3t+p+CRHwSxi15Ptkp
 AeMgV7QJsFzaemLL81lRdLYNUC/dLe6BCN2aQFkV3GwEuQ78KqVxwr0lbjakb0ZXcJQMXbS
 34eEmD6KaA55F1ouL9PODQbTc8siz9Wwj3z+hc5aPgaRyqYmnO2iyEH3y/+qeoUDc7UAyq7
 njX/cDdH6/5VJlRGiVacE6RQltKgAV2zEOSgxMO/JrvtBdfOOhFuBTSZKSdQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4BDEA41AF5
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:12:14 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013024.outbound.protection.outlook.com
 [40.107.201.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DEAF010E364
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 04:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gwso24g9Z/N+W4HHtHn4t+3nMON1FBVaxCp02okRYY3C/O0h/X5VMs2LVebgMqc+zGPI1IBHIOPaP6hp5fVbYuMcwteL+kYCZgxPPm5sVzMjGx9dk2WT0l1ivFjh2q8y5QGlz7Y2e8ND6jvk7TC8gw2vNUnt5b8HFAt45iBs6fhfimdU7xnJGd4oeNvGyWQAnazB/XB0SJ9uLF5X4fqDUCBvxgeQpWTjMtF0Pxqjn67xjIRQOSheKbQh22KG1yhugBPfLm2wUwIx9n25UZqrQXOq87Nl5y/huYtpCnAs3wROumRZUw9ugzPMArG1fStyD2yAfcUQzwF+JVbdIWCB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdYM8BVmIFn6YxTO+XuFY12UyRiggdFxk7uSCVFCOnE=;
 b=RD+XYWYjFEbs1YGtd9OqqmiZiRRFrzOflqjj2KCoEhi5PrsSPfoPlNWVL1dZTnuNCn/JkwCcPnQfIWBYiLOnFqsCNMX435pTspXJRBUWB+Da9r3mMdkU+oYcai5eboALK9bVh+KSF1j3OpuFqN948c3eeD3BIilzN8SfjFojNGh8rQwsclhNnMXP2Me9mqEBL4Bun67qF7Ow0Z9siwIihGFV7jfGnJm91GgepOqfCWYuE1oq8rLhWg9ZH1DIZdQ7z+tCpt6TFckfNhdTX84/wwK2khi4mlmPUUakxmOzQmTTKSB4ryOrQg6iYhkrvzCepJPbOyu4ZzUy3+FHYtmhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdYM8BVmIFn6YxTO+XuFY12UyRiggdFxk7uSCVFCOnE=;
 b=KuP+n4FGaRLW1f5NQ0Mj+++PwStSWaisgB5HpplrJhh1QOa62OzGDh5VbfUK9yqTuF2qf6beOc5UBHvnwY/N0wORCEHKDu7FYfT1UqE49OSbzBrc9d1Lg1/WRvR2hJAGpP4xzAA0p6b/94b15+3J7yrRcvgRsmdkxTrDjPNKIAMNifaXoeuthcsSunBshrKS50tvAtNvyoS5tadr0NBu3wmvBrlGb6v9MFHMysqUKv+b+Ly0EI6fiWlcdGE0wUV/ZUF4Q9RwWZnn7GCK5Hmla8YaYXZpUtwKwWaCARZeKJ3HHBWi02kt2/ukA0OvNCyKtqA0rKoyhSW+v+Xos6gAnQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 04/30] gpu: nova-core: factor .fwsignature* selection into
 a new get_gsp_sigs_section()
Date: Thu,  5 Feb 2026 20:20:57 -0800
Message-ID: <20260206042123.303281-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9248d2cf-f017-4a77-47a2-08de653734be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QNWBqTCbJssb10E4u80/KYD7wXc/eEazfaGalECNlnawlZyQHFewKBxzZWxD?=
 =?us-ascii?Q?/zrDeZSViOOjc6DFRdBFBkBcNTnkYeRru2Hb3UUFuMYsFwkkSv5SvkuGd8Xt?=
 =?us-ascii?Q?lNsLx20fW/q06hUmtG34s4gK77gmNorPWFC8rGXAta9jGW5hhJE7RRLKkvlg?=
 =?us-ascii?Q?LjqRoW9B6QWvX15nmiKPbmJirA6gRR8UU0wi0U4STtVXdOSDQHiOs+VmdZwS?=
 =?us-ascii?Q?/1/Pu/cdWLQN13nw2IN2b/8BWb9udSNRP5IeLIEDgcWYXW7YEOrCQ0zy/F2N?=
 =?us-ascii?Q?2tV+hWf+YLT33o7CGdSP5AYuQK/4KdNLMEvVidwHwEnDoHSDtzwGSDHp1006?=
 =?us-ascii?Q?29aqFIeAvGKX9QBZk3A5Kk8DQqC2/0ibnTRh9f704jwtHSaoX3nFg22gLFWK?=
 =?us-ascii?Q?ygk+WheRhkgWSZtIgbeW0TgDf5itP10yxkMCdKYsm/p5INQ7iE/3i7RHZmDn?=
 =?us-ascii?Q?2MIfhMbrlkeWRh75hUHhmVNkcUTsIjNvFka3z5RFK55sWHsIvdhfaZ92VPQz?=
 =?us-ascii?Q?TQ6UX84UXUX9bxO88ve6gewyRSm6ipRh1BS2c70omjpTbg2jPMAVGKPfWN4d?=
 =?us-ascii?Q?Uy9CNQlULw3n1LuKaQhGt1R38OPm+zniAHxr4uHUoFKI8CC2Fu9fMbtGSc3a?=
 =?us-ascii?Q?XOVwNdbmoaRy/BazgCI13vmMTbRpXyNhGxXK687stUpYmyUWzzR570avHf71?=
 =?us-ascii?Q?Qp2aA477uZaWZcOMg4LPfT8maILyKbbdB9kd0N5J+XGdx9vGo/cMQyoxphtg?=
 =?us-ascii?Q?PIHBnAJ/QO6ziXzozxfmOTsg+GjScYLn+58zeL0fbHrfrsASJ8tllgjP8NAa?=
 =?us-ascii?Q?wmCKslf5CFveqGPnyRXDHqTC8hiT2hwzXgnZLY6zF9sXLB/vKw9zQpHK/igB?=
 =?us-ascii?Q?SZzKvHK64zIR3wQmrB0EzNabgJmrDw7OjadFGGSxNID5rxkZRPgT4ALRQ4mq?=
 =?us-ascii?Q?+JsAOkaZu9FLFKwdiPXkCFBPSCL3ajwYdx3XKd75ePlOKFkNfTJK/C/Zd8n4?=
 =?us-ascii?Q?StBYGnJw4nhCUZ6nDIIiLx8DUhHJ/293y3HDI90obUGuRuTH9DASuERwoAOX?=
 =?us-ascii?Q?dlwGkmB1x6M4GKcpupE/xZ68m6pbAybEWp56pQunC5s+GIBuzleNXK0Uous6?=
 =?us-ascii?Q?zoQFItGumNJ1z32/kMMDA97GLP3EQA/Nx9n9iDwmz0mcnMO/7IgD/wmsqUrl?=
 =?us-ascii?Q?LUQg/1w9FAF43UlNpImLZoloWdRNd3SgbQnVw5rvpAKwlD1Oa9dJxSA1KVc5?=
 =?us-ascii?Q?+Ti4ZskbW7KwZJ0hs+7UpBBsi+3PJpPOZYlgrK2YoGj871AsS3Nks8pzoQvm?=
 =?us-ascii?Q?1Jf0mY+IopldtzyFTF2W3IOxqPuxFyaq0euG/g3d1A30MZMJzAJGsV5szrfR?=
 =?us-ascii?Q?2bfVCr0FUJQ2YJnYYQBZWhou8JJU1aB66bQagm/HtewGDs0zf4ZQ6XcxGDZJ?=
 =?us-ascii?Q?xQk7M+DGmXQbJBmV7TWq2BwZh6lcSqzZCsc3ZfZOO0VPn+FWCcz8BgqNaaND?=
 =?us-ascii?Q?zVWXZ1+C2aQfTFcp4m9g9uP2bnfThGK2xb4Ybfqh0CQC5LLkcm8LCz+iI9MC?=
 =?us-ascii?Q?aY1Lhxo4PKiWFbS8lgA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8yz224hIQar86Y9ruzwa2rP9gSH9PBgrJGsV/5e06NdEQdIbvWALVRaPUqpT?=
 =?us-ascii?Q?4EyEGAfGhZfzwNK7T69Jevzm3ZgLkxN1BHTlHd6uy+FzDhDpluG8c+59vmGu?=
 =?us-ascii?Q?iC3IOzRvinUryrDZ+D/2AHd6c/iLj5a/t22TZHRDxrjD5j6BDlWqVezKUGyz?=
 =?us-ascii?Q?mZIzqx8olU3/Maz9VDAny/e1cTbzPRldGGa1Z/5511GVK99P3oHflO1qSqTQ?=
 =?us-ascii?Q?rVQyKXZ0jq55hD/6mbk3xMdGy2L1vKrZbOD7cuUXBBzy6/dMQaTKdVtJi5vy?=
 =?us-ascii?Q?7bFOv2U/oKUsgrZFng02NnM6b3GiXmw2ujE6dBM1Vq82FQj8/krmR2k4YfFQ?=
 =?us-ascii?Q?r47gEyWzfmvsXnKbDo8UUnjFf+75qrE7rEpQ7G6pNIXpu35E6jUU7lA57LOS?=
 =?us-ascii?Q?5e0ga4aWMu74FO4unTUHSKfSE2DiXk5ZXjfJLS0W8M4cShmYzUADxZqUjX0d?=
 =?us-ascii?Q?lPWQ88W/G6qBCwPLp+sXN4w5jTfOM4C52tUdhm3lnFi7h+hkYUBpkl4xvqGa?=
 =?us-ascii?Q?9TsqAmZRoIohCZ107T0WvwFZ96FYDX4XHTQe8v6RV6Oqlh+Y0t0mmViOxwsh?=
 =?us-ascii?Q?FeBay4FIXT6Ikwro3goSi9v1Ktu3RNbSWUUusqrZUTw3otbEBB7A2TKylTj4?=
 =?us-ascii?Q?FZimvTYF7fKHs0gP6OvZhPYU2MBJIh83HUDyIUvij9bUivkNwLT/mTfoKhji?=
 =?us-ascii?Q?6S3grzT/hL4tzORj6rLXIO1FDSPrbBwzfZZ8VAf3A7AdmycVSZoAWJeQSsrB?=
 =?us-ascii?Q?R8K9//9WnXQvY9mBu/PyRpAECdh3xQ/mYBR+tPoySarD98DgPAXbsLH454PN?=
 =?us-ascii?Q?WRwVI/8yFicfZld/lq0mBxBqNErsTayn13TjPKKnkV4b+cyJUZ5z8m4xamLC?=
 =?us-ascii?Q?0IxFkyf8yG63cD5GIdKP4+9X8NlieTpkGysB6fae0J0yId0wFSrTPr9Lu30b?=
 =?us-ascii?Q?NdkXPXrNZ8LA+aXkm44UES1OS1NohyyYh5AeqoclxScX7h5+nUttIX3IAuhn?=
 =?us-ascii?Q?s/GBzMpVi/t8C90gGmmrcKyEXKaXLN1vpqUcdzp9bec9WSXXOX0w+EJohLFT?=
 =?us-ascii?Q?HCnD8A8+/HdJbnU3TxHA+aNUjtE8UOR1RXK/yF7ie9lHOt6WswCN3qoADtiR?=
 =?us-ascii?Q?DcU+kE9yzMNBLJpnEey8AMmf/rMR6W6eASiBsj3oR9EA9QFki7qg/ah6Lmaw?=
 =?us-ascii?Q?Y5QSpV2DREB8BaEmk9qCX81yJ3F+teAvjj+WPXkX6emrScrxy0KQq47hqy+p?=
 =?us-ascii?Q?6ASH/jv199tK9qfKNUxuKAUi2UP95CrY6a1Ihf37JZGuf3Bz/mP0nifHIhXN?=
 =?us-ascii?Q?aaNF2O04l4jZBs1L25QP6AB0GUibp396MgaAIoWrfKvPpEPtIFl53XkrfyaM?=
 =?us-ascii?Q?OZSsYQLtUstK/WnL565FkZ5YnBNTfzfR+AyycG6cEhA5conL8Bs0UT9zXFta?=
 =?us-ascii?Q?jSB0VzNxb0EoFbSo8NSZl053zltvRlas9hQ8Pz+9BBDC9FZpJg460jLTVq14?=
 =?us-ascii?Q?u6qObDdlghuyDoj6b46ImSPiMhfIpN/CrRbfI2W4U8A2jExSVdZ20ryt9tpR?=
 =?us-ascii?Q?nCmOKXe8UpiD1oD0zK+peyf80NllrOKqj4JpB/z3lFxXLn931stFiJfLjNTX?=
 =?us-ascii?Q?t6crdhD5icHrjJtMhwwvOuYXjecOHYh8r25U8icbjDHNwL1QG3tNy5aJeaV4?=
 =?us-ascii?Q?dtX5pbB5ZcqK8cI7B2yqGIYPGgZtjQieq4QR6DYP2JUgbXk3r8/quOs4RaMF?=
 =?us-ascii?Q?5vfxn1ok3g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9248d2cf-f017-4a77-47a2-08de653734be
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:31.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oTWNMlwbagqm7OndjYLVSl2jeWFcS3X8kkpb8JbXrfnPzf7cwLjF/JRnsdFdftwTHKhegJwpLbRKxP1gBthfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209
Message-ID-Hash: TZLB5LYQNJBAQDOHU77C5ICBEO77IYPM
X-Message-ID-Hash: TZLB5LYQNJBAQDOHU77C5ICBEO77IYPM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TZLB5LYQNJBAQDOHU77C5ICBEO77IYPM/>
Archived-At: 
 <https://lore.freedesktop.org/20260206042123.303281-5-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index bc2243450989..10761716ed93 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => Some(".fwsignature_gb10x"),
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => Some(".fwsignature_gb20x"),
+                    // It's not possible to get here with a non-Blackwell chipset, but Rust doesn't
+                    // know that.
+                    _ => None,
+                }
+            }
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,35 +241,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell => {
-                            // Distinguish between GB10x and GB20x series
-                            match chipset {
-                                // GB10x series: GB100, GB102
-                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
-                                // GB20x series: GB202, GB203, GB205, GB206, GB207
-                                Chipset::GB202
-                                | Chipset::GB203
-                                | Chipset::GB205
-                                | Chipset::GB206
-                                | Chipset::GB207 => ".fwsignature_gb20x",
-                                // It's not possible to get here with a non-Blackwell chipset, but
-                                // Rust doesn't know that.
-                                _ => return Err(ENOTSUPP),
-                            }
-                        }
-                    };
+                    let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

