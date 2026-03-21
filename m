Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70841093170
	for <nouveau@archiver.kernel.org>; Sat, 21 Mar 2026 06:37:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8037810E2EA;
	Sat, 21 Mar 2026 06:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DnztRIRb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 378BA4522E;
	Sat, 21 Mar 2026 06:26:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774074417;
 b=kg+zW69JbgHI0vZ1lh48CRzLuXzB1QgoB/r2z4NonHMcoK7qyvWSglirLQHfdJeT8N51K
 d7HZZttXqt5ec95i3fyNccQ/RzzDdqceyMwz+G8o0VuRpEFMvaY8kA0UynK71suU4OTEagX
 3oASarWETAh2iaOs7Z9qFSL/epR+gom78a9HoPBjjDnFvLaNwQJxZLhfRgX09wUxHEhQ5s3
 G0qRjO4kXGNMEGe5WMRMsYW2/RbsqeDiQDc+39yYtGOs6nzMmZelBflxvwb+5odKUD/v11O
 wgKSKfNisWjpG/G4MwNUOpdmq42w1WWKKRJg9YMTtEfi4/VzG0cCIYcVm1+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774074417; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z0LK+/k7sULA0+fTeMNrT1psy62oBiL1EgNslewxNqw=;
 b=g4rMiG7/sUfjZeyt7DQBhxKdptsoYwUIMfvRv638SHmzaoXTLqVba6gMfnHBKpHmSZzWl
 uZWmR/mIemVT07vJR9cDztVYp80WTuvZvh7E3wWipLYPdyfioCnnVgQoHmkHUIPZxmNK/iM
 lVEXuLI/p7XVUlHEmsoyYLEqRPv9s/XzNWd1kW8Z2wbt5zxSBOofdGhvrEePNBJyXG//Jeh
 lJqN2GV8Mjzgn90A5wX5OdUqbs3NugaA/8Pul4b9/5qGXq9fSigoBJh9WqxeQGfG2edWeOQ
 dj5fCxh/S0OIJD4Lgm51icg/0jKqHvub6ZbYrdht8O4QBiurC3taMebl2a7A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BB190400D8
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 06:26:53 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAFEE10E05E;
	Sat, 21 Mar 2026 06:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8F7Cyh8c/vLG+cAFAJ89eHlRkPhk3nxq5omcuI9rb80QulWCd5vf6IqJvxlaiJGzKqECWro9DOG5lRym5ApOEaDFRqkcZDFUDs4hKRzbLX0QHPGz6sq7ubfMeUopgCFpeQvpdWtGAZMWF4M8bNEffFSklADkh3NoNAFbM8lpsZmgJzOe+wR4aW1z+mXBUNyX/B2n+vUP7lYBkLv4JU5NHG2yRz1fGeQjlsHAYC6mcLxUkMZbj3zKnjRvnmMRKpKHb+KAuc8QakIDQFOOISgSgNf3fp5VWJYWuAMY/fqut7zPG7zhdlnp/Nz+DfKVg770pe1RSsCJfx7s2siF9nCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0LK+/k7sULA0+fTeMNrT1psy62oBiL1EgNslewxNqw=;
 b=u/00z2bi97NzhhujD/uxHwM9m0jQXbK1sDjDo4B414/T4qBRz68maauFQTznXJZ9xnoRhJZ2zOzlynUT2d4o8V8Dsalepy/NkCY3uhP3T8fJ2800knFe1BVR812D5DA6B4wdIwmfvErJ6T/S6Jfh+pu5lDnwzn4m5VOPUJQHiyfacL6tcg3otG+Ad/Aslk85Ck9GLgOAASETlIyiq2F/dDnBk72Kn6lXEXKy9M6KKMFLOFwplqwtDMnYyG7hWH/kzPG9ifP/dAwNNezZ9Cj2dryfomipIRc1B30V6fFci+93hze7yGgf0NezOUF+4g7mU5T3f4FGW3RE6v47TYV85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0LK+/k7sULA0+fTeMNrT1psy62oBiL1EgNslewxNqw=;
 b=DnztRIRbjhQeNwmsRrFJ/Ap4Ta5C5PhI0YUG5oYP623V/K0zOgPMAeDBN7Mo2dIB5Lbudq52Sx2Vm0GWtb2Bv4xGAYRHF50zjI0SuqVKJWs7ngS/ebY69hJFFVxEvZkiYTv+mMScKRpKCM5zZHuHsSWYu45e3+0m5xAXpFLk9mrffBRqSFVl1x1n7VxBAk39gEJbBWnwhJo46EppnaRXtl+RLGe/ixW8042ks+bzOvGG3nddT9Lr5E+2uzEtVoChFPeUxmpg1XZh3hOnlyytkiajlZ21qo9jgWJ1GiMvsK3UK7md0iKHIK37jzQHQAEn1sBdLg59M95uqfmlsy8cSg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 06:37:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 06:37:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 15:37:42 +0900
Message-Id: <DH894GFE1FG7.3LZPWX3Y9ONZO@nvidia.com>
Subject: Re: [PATCH v2 3/8] rust: dma: add zeroed constructor to `Coherent`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-4-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-4-dakr@kernel.org>
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 892f3f81-54c4-435a-3648-08de87145cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iiQycbL3vdVHojsIdHyVYp8Q5fG8BnO5DtKYJyT1/8GC5BA3n8rkyHDpFEXSb3ohJ37GqMAU8No+6/xVoJLi3InzCKGXwtU1//zEGapX5WXW3RSUUvEwECLaD0Eb8I1SbSFQZdrFJO62cD2NA3G4icg4m3H3SRCmTOKAmgCGck/6oPgDMMt5tNM9xSSjwc3Bjq6DCQttl99F/CDTougxL3wimABIZcuwIkPOX3qdDQZTZvEtiCxM4RADgMVPkF4bl7zqQnY3vtVYD0CewLOE8GfhlIGEyd/in4WUsQYeyRBb0t//TodDO/X1mtuTwbKVAMcdx6ikbsfzgXjs/gm0gxyTkZkFeMJIOJLWCEJeNoStIPetrO8vx6yhozjJuJhxpfR8CZyrQGS/dD5nYjBEeq9vdwsowkuGiv/D8c66nvQf6npKpUHv5WYJKlLimhjiSwt6Syf+4MTGiOgmEuJtgOv3OX+0VbRlsxC/VGxvByhn1s3pJ0DJuIeggh0TSDrpqZdT7LZEDrNSwRi8+1JZT/uH0KJ6j2plBOWguSTyX5voMkHlO2q+5MO8WvMmFgsaiZKOyjFAYLtFQfZ6Ge5gfGtgx731rywYz2LtpT3dfwfJYk16Ei+zhFcf24kJ19h/Cn6g5KIwIMUR3UBjcIl7t0SfM9yanJFzCeE1WJmxZseZFS47QiXe0t/zfCWLR8xlj6grpiMdSc/cKN6mCXlaze9vcAB/VYtpFm01sd1UsBc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K21sWXFPdEMxcFM2Z29sZm53YXR6MzlJV0FyNXkvSlVMcG51R3ZFOEZFU1hN?=
 =?utf-8?B?YkhEVWNRaDk2NEhBNzlwUkFCQ3g3MlRNR00yejFmaUxETExITVlGbG0zR0xp?=
 =?utf-8?B?TlNPWXFXNW1TeWJMVWRUM05ORExmdmxaQ3BiSTVrWHpoMzdCNzdUTGo4YnJu?=
 =?utf-8?B?T1dSTVNrUVYvRnRiMnlCdTlkRnpUUVpoMHh0aC9GYWFVa0hYb2FpMk0rcU83?=
 =?utf-8?B?R1Z2MldlSUdjekNZQ3VEWTRNRDE2V1A0bjMvQXE5RGx5b0I3WWhvS2JsdXdW?=
 =?utf-8?B?cFF0VXVVenlpbklZcnFaaFhsNVZSSyt6SmFIeG9pME9IWmpEczh6MytzbmR6?=
 =?utf-8?B?OGNsdlg4ZlBwTVV0K25FWi9admx1NkczUzY5ZXlBOUxRdmVDRkFTVncwcWE2?=
 =?utf-8?B?TGJsblFycW5jM3ZOdkQ5elgyNk5hWGNEZEQrSVE5b0tZdkFrdXJIMXlMdEVE?=
 =?utf-8?B?a1V0SEFtVnpOS29xVE9pQVcrZmZmME5reWxuVFlzeWV6ZXo4V0V4WU10Wmxk?=
 =?utf-8?B?M1hCRWxCYlJzbWhGZS9Vb0NxMEJ4bE5rNHFqcURCL0t4V2dUYTFvM1M3ZzNY?=
 =?utf-8?B?R0cxTjREeVdGSm9lenhOMzFUMzBaTFpQOHo2d0VrbXB5aEFKS1hZZ0VGRHNh?=
 =?utf-8?B?L3hkd2FGQW5HTDRBejlyRGhGUDRmQzhBTWg5d01BeDh5bm0rUHppbHBENFA2?=
 =?utf-8?B?VXhLV3FuRVFCWFU2elBwSzNBTS9NWUdsYTVjT2dkNUkya0xJaFRkRUQ3OWFL?=
 =?utf-8?B?aHVUQ09XWXBoWTdzLzAyRjhCRDVRV1YwTzdPTGppaEZjVytaeXRQOGNRamdw?=
 =?utf-8?B?Y1FReVVmc3pzNkpva3ZWeEFZVGdRTmxWL09CbjMwVHJHd0lmWHllMS9DZTJO?=
 =?utf-8?B?Y0ROZ3ljMUpjV2trVzN1aVZtL1lQenViOGJqZjNQVHI5cFQ3K1RCR05mOUlZ?=
 =?utf-8?B?Rlk1NWdRek9CUG04a1RicTg3YkM3TmIvVGRCQ1lYWVI5d1pvQ1hHaGsrQ2ZZ?=
 =?utf-8?B?SG5jZXlFdnEySXVJc1NZWFowWjdCV3RwOE82U3JOd0ZQdUhqUlV5QWl1cDQy?=
 =?utf-8?B?RDFtd3J6cERKcVBqdzFoUlVrVmRabisrdi80ekV6RE1reE5kcTM3c3lya3g0?=
 =?utf-8?B?VDNKSmxBM000ZmNzZW9kUVdlaWlTZTI2MUh5MC9sampMbXp4UFNWUUJmMTRN?=
 =?utf-8?B?TmFoTElVa3Q4cDlVWDR2aERDazZ4NXNhTVF6aHFlTk56TjN6citjTlhVRHpz?=
 =?utf-8?B?RG52NzFjd0NxSFN2YTVkb1lYYXJyK2FldmFISXRUQlV4cUpyTjJJc2RYWXcz?=
 =?utf-8?B?T1ZqSUM0MkdYZlBCNXhubGY0aTF0cDh3eDQzTU5adnNjaG1zK2EyYytCZ3BY?=
 =?utf-8?B?bHJIYlRQdVljRjBHejFiRFVqRXZLV05RRGNDeTZPajJWaTBEZEFwOGRobGlr?=
 =?utf-8?B?QThvdXZOSU5Ra2ZHSG5ZR0g1eE12QWhWMnl0cE5ESEpkNWZCOUd6OHJIbjBu?=
 =?utf-8?B?NURTNk5XRXE3NktxbTJmVmpua2lCcHFNTU9VckVHSUN0emJGU0hPTFhVYStI?=
 =?utf-8?B?N2tmQmVmbEZpZFEvYXhMbTVDdS81QzZXemlVejJsRzlVMWpLQk9oM2xrYnFL?=
 =?utf-8?B?UGE1amhYdTFRcmVzOXBES001ejEvL0FlM3pPeEg0VFRtQzhHeGV3OW5QLzZJ?=
 =?utf-8?B?NzJrS0dzZU1DQW9iWSt4ckxCbGEyMXNwamVzcHE1ZkxNcXN2TEVzSGlBdGFt?=
 =?utf-8?B?bmtsYnJBMzFlb1NHLzlZaFFWM2ZGVDR2ZkpjS0pYMnVUeWRmakFLa3daNXNi?=
 =?utf-8?B?RDdHdFRDaGJ6dlFNdHA0bUJuZUxkSnJJSWF5NVlWR1BldSt5cHF5WFFMTDha?=
 =?utf-8?B?amxpSkd2RXBUQWxnSisrOGNuTVc1eERrb3BUTlFXU3llelJnckxodFVSYUJ0?=
 =?utf-8?B?ZkJPS25uYndtNHlEb1REQklEZU5qVnVmOFk3ejI4K2Z5VmhnLzRIUlBNWCtq?=
 =?utf-8?B?ekpRNTFiZXl4VW5TZ1FUR0RIM0tiR0U0bGpRSFlFRnVDR3l1WmxtenFRYm1p?=
 =?utf-8?B?MllCUXUrSUNmSStHRGViZmlqcmtBSkltVzBoYnNmQXJXbitLQmNmOHdJV0Jr?=
 =?utf-8?B?VWcvV203K2pXdmk5dldIMEwxcjRibXNweHVEdjc2eE1ySHkyck5zNXZTSWYz?=
 =?utf-8?B?VGhyemRhSE8rNkpCU3FMaEFhUUtMaG92N1dLZm8xWElEQ1hUYUQreVVNTVB5?=
 =?utf-8?B?b0J0VzBiTFJZUHF2d0xhaEZBRXZFUDYwMmJGL1lzdVhPeDVJcDlWWCtwVmJX?=
 =?utf-8?B?ZTh5S2lLS0c3dU5zMHVDMlZOMzlKNzJMUy9hR1Vza2hndTROLzV0dUd5QnF4?=
 =?utf-8?Q?qqQJrJdp7VeoVRskT0XGobk1JC7S/Ws+o+vieTQZ0Csvk?=
X-MS-Exchange-AntiSpam-MessageData-1: Wj2A1+LtLWKiBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 892f3f81-54c4-435a-3648-08de87145cc1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 06:37:46.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bjERDxOALuiWTryfXqv0Co0S8kHfZZbFS4oqMZTlceVVeVz4sbnfOWQwcYAKN8XuZfHuhj7HYfxGsQQAnknhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449
Message-ID-Hash: WCVDULJRBRLYKLUDWSRFL6AJNVS6DLDL
X-Message-ID-Hash: WCVDULJRBRLYKLUDWSRFL6AJNVS6DLDL
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WCVDULJRBRLYKLUDWSRFL6AJNVS6DLDL/>
Archived-At: 
 <https://lore.freedesktop.org/DH894GFE1FG7.3LZPWX3Y9ONZO@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Mar 21, 2026 at 4:45 AM JST, Danilo Krummrich wrote:
<snip>
> @@ -529,6 +528,35 @@ fn alloc_with_attrs(
>          })
>      }
> =20
> +    /// Allocates a region of type `T` of coherent memory.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::device::{Bound, Device};
> +    /// use kernel::dma::{attrs::*, Coherent};

nit: aren't we using the kernel import format in examples as well?
