Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0931EF513EB
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 01:52:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D840E10E2ED;
	Fri,  6 Mar 2026 01:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bGnbSoOe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5D27A44EFB;
	Fri,  6 Mar 2026 01:42:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772761346;
 b=oAaH4s4+iAHvH7PgpJ8hEOOA/Nzxd9M0gsz5ng+E2HiOS+uxaReKjcnSJG3n3Uye5v3gd
 JixkXdlrzQzZycHTGK2cT3tgpQYzYrUQVhzrnPYU+/z80w1LeZ7J0/VCFzoL8LsWckRNDGY
 RCVHWx/5G3t7BHmpD6aGaV32rI8gydQ896AGRzuRDKS1TBwB0S7PvVZL0vVgTDmavWV+Orz
 6qpDCdoY2s88CW1CtmnFwEE1YZ2niaSfoP+h6c9zBsTh23LYBRBmO19Xh4s8IiWBRL9E9Ja
 Q8SJtI1m4CJk7L5bUA0USkpZyaLyMDebP034JsFa7qPOu4zx2V9i7hPafdhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772761346; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L0inzSEqk2YVPi27cUICCSjmQD2kFguEonn6eqz0oxI=;
 b=pIRwS5pbxngmdd+DnVQwHwgveGvDwZHoVE6HSXin5346ZEVnij6FXZAPXWGIzweTqEAlz
 220ka3TV1dDAF+e75UIMf+FTm+rHd0HyEwCZhxwcGrhVBAUwe6NBoik42UJQ4t6yE0Upgrg
 cvcSWI/eVSafLz6PSnZ+QaLi12AV9hI/EScDww2oPEEW6nrbCIjbHv1DfShU4V1QTy391x3
 9NUAVLCVFvmhsAuKdqNf+RTV0RYqkj9qrc79dQvTUiRfq6wIM/rwsPaRScEnRdlokAxYdEc
 96pp2lsHo0Lrlww7pTxHvIgJ65nxW/m7jcgdJ6926LTnYHLY+VEM7Pdfj3wQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E0FD840760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 01:42:23 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010038.outbound.protection.outlook.com
 [52.101.193.38])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20DCA10E15D;
	Fri,  6 Mar 2026 01:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4SuayGmyU7XG34Kt8d/NwrsYEuNXxMWb3POT2FkkEk52Hq5guuzvvCBFNwjakubnXFcPN2S9pP04RN1dsF3ou8jJoiZfquI8/iu/9tqlE/1sL81cPufgONk04hnFoLKKNzaqcdZ6kISUK0kTeeRlyTR4GSKH2T2DjZRqFdcqIvro3KOV1CVuRtTamlIgc6wamR6uzQaWnBu9uqQ3k5eXTiZK3c7MWyqRXmF4cQQS32zgt7CLqFZou9gAfyY2UtB6in49kctMT8csBa2fiGe7ZIvwYeko+KA5ha/L8FRkpfvUzg/P2mPs39Ge37MWmdANNzNQI9YhG3g7IU3N49PQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0inzSEqk2YVPi27cUICCSjmQD2kFguEonn6eqz0oxI=;
 b=xSmt9ykQhyid3ve3As/g0S4h6zl24eDaqCgbOBHPHgRm8stpAi3gipdI2Gzy4tbBCV6b6NmHabhZhD+O9QnVzw6yYGaf5IewAdAazAb8GKe2oNviCxyIG+hKIkcheP2OYa6LxAzduic1OZFVR+AZ/R4Vn/MgEa8/x8xTYY8oTZuvHTPX9EIlubvMbWttFdBfdmSZJqN9rjN1huK1XUxldOu7luBS/8hORkaTGR323ywUuJlEk8Ub7qxlvaknHP8AoSzKF9hYWETKL/RwtqBXrLTl21IamukStaLz4DM4Iho3i3OcURwOlA/xHdLl3aL7UEvc3v5d/OOwm6lganTYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0inzSEqk2YVPi27cUICCSjmQD2kFguEonn6eqz0oxI=;
 b=bGnbSoOekfLQxPpWGEpxq/V+PfIVqthFKteRiI7hVoeBLeI95vEVtnT9J82C6f+1occnTnJTX+Kp1gdSWhN352AWCowcuLP79q8MwcBHqaaC5TbwpvnujwKa/KrCqHmaxlkg9Q2E7RqpgOvKygDdigdJXWy2x2NS1mT7ApvuBE6jBRS2IcbswuEVfNW8dcncgcRZuEVNa/k1uv5+maZIvU1KzVVRZ/FLMEFTF4fx57jMesaTAvejg/aGdnUuzqmXoYn4yZHXBqUFBxXh9UDjFSZ/DF23a+hEgAuPleIEDTbxHsPenDus9z0QNeg1DbBc2nU189WL/jJ3om89b9AKrg==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:52:42 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:52:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:52:38 +0900
Message-Id: <DGVBO0WP3TM8.VSUZIM8FDFMS@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v10 06/10] gpu: nova-core: move brom_params and
 boot_addr to FalconFirmware
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-6-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-6-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: e856ea77-86ee-4fa3-915c-08de7b230e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	aGqwwCZFS0Gpc9VgnZC4hRKIK2t5tNPlkOO9RoWzaCwdUcBUX9VNvJDGbmLv1ZydtjkVP2KF9npYgiIyxRVkLHCg690sFKQryVbZXg4lCdHPpMW/8osGlkDEQv9xBSLJLM4K9jLgdPHrfsnc7HHy1G8w84urxohV+tTxvMgkNL96+zSYfP+E6AAVa3g07d+KCzKABPdEgTC4pAekM2jd0+Ki26OhE7LxB+wuyQaJA/IUF5CCgdIdEE1xlPR/uQQrrsH5UewqCYx18u7tI8A1EZ8BjDJHxxA+mYhv8uFFtGdrgSA1EGmUa9MDSPwMmT0ho5pIOj7/gUCmR4oW4YVRRNu6wMrTUasCMb6iDcfZd+/TEzRgP7K6VZ4bFIrjPykWCBBcv7+FmaGb1aCv2XXRgixP3rk6XKCEvTuqZHtFdrCvGd38LIu3/hBMrxzQmG4CNTCYAmSkwTUhU5dDR67DN+/nTUmrs8gEb7JQxNGkdwbelg/GwwdreCtFfgkG2UXHbiists72JtRbESZocv1U3AoJf/QR5t0c6C4vjC3sxqjCBPCzARfoD+URqvOZeP28Hd4Yyi96y5CubuMGD2jmHR85JmiL7syDTWCoz+2wXk6rVgZB8urHXBBDS8OJDYuHj0B8LqOMGocilSCf4mUzpEfQvR9wbC0gELAbRQu9udMwPJ76iLgzyKpkuncw8vccp8K0+LJHpUEqGjnQyuscPOUN5z1RMJtrtqFwWZ546/E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHIxN3FNZFVreFZLbWZReGp2RSt6SGhtRVVrd2xzcENIVUtLTlVtNElJb1Jn?=
 =?utf-8?B?Z3hYTEFDT0xMM3U5VDlMdm1ZTjFOMThTaTVaVVZLdXBNSnJLdXJmcm1ZYklP?=
 =?utf-8?B?QWxXbWVTd01QOEpjdXI4S1E2eEtVVWFiQjBhWFhmTGdhMzNtNTVsVTJBd01J?=
 =?utf-8?B?ekVDeWZrWFpDTURFaWJBTUZ4SUM0Y1FYVkJZUjNmZ3plNWQ5aWQwYmtMc0RP?=
 =?utf-8?B?akFNek5CbkpVUUlIOUJneHY5Rjl0cHFCVzhUYWRhTkJ2b2ExZU1yV3BoV25B?=
 =?utf-8?B?ZnYrOFpXM1drNmsxenNXRDVwNXF4SG1WTmEvWmdkRXNTalpsd0VvUFRxenNM?=
 =?utf-8?B?bUZaVU9UcnA4NHZUR2dSZ0RMUmxaZXFZY2VjdUh1Mm56akdVNlRDRHh4Nkx5?=
 =?utf-8?B?T3I0WHpyOFkzeE5FYmg1ZFVHVWdQaXNvWnNRazRYb1NCNVphSmFJRUJiWlFt?=
 =?utf-8?B?dDVrZ3psMlFFdlg5eXoxV09nc2xJUXVJN1VlL3dFVGZEdEI0RXUwVDg1U01Y?=
 =?utf-8?B?eE1nQmZ3emhwc1hWTURoS3liU3NILzY1bzI5a0hsY0pyV0Y4ZlB2SWJXRjJG?=
 =?utf-8?B?WDUzTlJpMURzSGg3SjlrVEpZTFVWbFF4VkFLZTQ5dStCUFY0TW1mb1lDQlQx?=
 =?utf-8?B?cGtmSEloZk40dE5kanNzcS9qNGRSdDNQY2JWU1lTYm9xT2pscnVCLytFZFh0?=
 =?utf-8?B?S1hJbndCL0RuanZTaDJtQ0xOTmFGSXE1dUFiYUQ4WTNuRzNQMmhlRm9KU1Ba?=
 =?utf-8?B?ejhjUXZJL0RsUXFIVlM5TFJqN0h0MytFV3d6WXFINUprQmNUQjBIU1FTNGZG?=
 =?utf-8?B?YXU2cjFIWkdTMnlwYjFaRGFPUUEzZm9OeTdoV2tsU0kwZ1pHVHErWVFzM2Jv?=
 =?utf-8?B?elNWNlE4TEtsVUJ6Ykc5c1ZRaDRib0J5bk1sVnAxSk9CeGFnVDFrdklVSUpJ?=
 =?utf-8?B?V09saVFrakU2WkZwUk54RVJac3I2RUJsS1U2ZWNYQm9BTnBtNGpPekUvM2JZ?=
 =?utf-8?B?WUQ3Nit2b2VHMXIyRVFzTDVCczE1VjRYaXBzc2tSbDdWbExDbG82bGRzZjh4?=
 =?utf-8?B?Z2RPS251UStGNmloaTN5QW0yYy9RdUhicDZSd04xZTltUWRMVG5uMDduZnIv?=
 =?utf-8?B?Skt4ZUJTcWhWeHNDeGdZdXNvUE83bDI4N3R4L3FRUEFDMXFSTm5oT3JCbDNu?=
 =?utf-8?B?SjMxSW9idzFtUkxScEpWY3dmMjJOQ3RmRzJZSG94dWEvbkFRTi9ERkJaK0h5?=
 =?utf-8?B?ZXM1SnhzRkp6eC9uTXhYU1NmNXcwSXFvUHFFaTdmOVNidUF1aUVsbUNKSXNq?=
 =?utf-8?B?R2JLcEVJSGR1cGVEdDQyTENtSVRUS1c4bzFyNDlYUzU5SWJDWEtlZ1ZHczJu?=
 =?utf-8?B?VVUva2lSdXdCMDdhQ3RPakNBUDlnUVpUQ3l5R05ST25UWGNNUEI5OVhrRzZs?=
 =?utf-8?B?SjI4eW1HRHprYi9rcCtOaWl5MXg0NWVSU2FxRFBNM1ZkZ1UvbGpDQ3J4aHFQ?=
 =?utf-8?B?WVE5RUoyejErMVYzVlBQclY5N3MzRi9KSU1FMXhZT0hWUVZzMVZGdko4WDBT?=
 =?utf-8?B?ZHRqNVhac3RTR1QrQkFqMy9PU1cyTU5qRTg4SDRBaUprZVcrRWptenEyczk2?=
 =?utf-8?B?YkRHODJnckNGOFJ1b0I0WG5HS1lwbVJOcGdZOGtWNkVJcUpvSVNMZkxrdEph?=
 =?utf-8?B?YnlrSXhxL3JudHNBRk1Ub2dvamNuRlhEVW9ZTlJsNkF2bmgvUXYwTEQ3OWZR?=
 =?utf-8?B?emJYUjlwaDBnN1JOM09ka2pad0xUM0Fsd1lFYzRVQ0dMWlZrc1pvVGlqZUN6?=
 =?utf-8?B?MXZLSkwrbG1US2lWWUdqUldSQk1pU2JhSW5RcjVzUkdGSkp2UUpPV1dzaXIv?=
 =?utf-8?B?TndWNms3b1BCdlV0a1BqNzNsTFpFck11OVpVekRsN1RBYnduamdtbktkVkM5?=
 =?utf-8?B?VktibDFvY0xyUjg5QjZaVzZVTmlvczJ4Z2I4UG81b3h1QzE2L1hFWDBTNWQ4?=
 =?utf-8?B?N0VwZEVzenhWYnRqbjdKaEFCQzlDdzNJSFdmai9kanlwdDZEcys3blJnaWFk?=
 =?utf-8?B?MllpaFZrVG1HZDVTWWJLMjFBNXFkRGxTNlhJMnM1TTJyRXdrZGd4d2tpTzdP?=
 =?utf-8?B?ZEljcnhvZXNrRUpsSzFXcGhhdTlvdkpOZUhrOFNINWk4RENvRENHeVBQMTZU?=
 =?utf-8?B?V25XeHlBaWhtZlU4cUxwRVpoYnZBZ2g2bkdoOEkyb1kvSXRqREVrUnVmR090?=
 =?utf-8?B?ZFl5OGIyL29hM3YvWnc1aWNxVms5enZzb0ZHSmE0R0Yxa2VUYXhlL01ENXR5?=
 =?utf-8?B?d01CeDk4RHpnbGpMRXpjanlINm9rc1EwOStscWh2QWVVVXgrbFQ0S3N6RVhX?=
 =?utf-8?Q?U+kfg9ydo2mxRZsuN/l0/osTd5b12giBo/ODD+/8VOANb?=
X-MS-Exchange-AntiSpam-MessageData-1: Bk7XU+G0Id1wMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e856ea77-86ee-4fa3-915c-08de7b230e06
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:52:42.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6S0sOfnIIrglxDravkMaHjo9kkK5f2LRZMDHShlpZo7wA6gUi4WbS/hTHkWvEe/bNY3IgC0gjpwfpSMAF9mXYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
Message-ID-Hash: I2BR4OODEBC6NXQ5WJJKGYC463SATXQL
X-Message-ID-Hash: I2BR4OODEBC6NXQ5WJJKGYC463SATXQL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I2BR4OODEBC6NXQ5WJJKGYC463SATXQL/>
Archived-At: 
 <https://lore.freedesktop.org/DGVBO0WP3TM8.VSUZIM8FDFMS@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> These methods are relevant no matter the loading method used, thus move
> them to the common `FalconFirmware` trait.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

