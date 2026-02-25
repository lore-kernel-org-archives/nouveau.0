Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97BCFD3764
	for <nouveau@archiver.kernel.org>; Wed, 25 Feb 2026 14:26:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E612B10E797;
	Wed, 25 Feb 2026 14:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PCgFefxG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47BAB448B2;
	Wed, 25 Feb 2026 14:16:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772028989;
 b=bWZeRPyxu8PQfoCfEn9C62sXeP8osToBVSaA+wf37DnlT8s69CtQW+0y2pFATneArgwtD
 NO7KuYeReV89M5z1t7TYNpeGRYxycOcaALCOIBRtr45YKjCeWb2mu7sNul8JFwVVEYvrHRG
 MdgtHarpiIquoqfA8/YVz0XJ/UbSxQqlobOS73/4ROCvFHvXSF8CXhGfS1Zj0seNBwPzRFG
 atMrywD42lTfCATwc6Xa4Xlo3io349GbntgHPFKk6v8bWaX1PhoiS5WYDG0cfCtPpcUvtzO
 2/DSL3CaoRXx2Qilxted6DiKExN6F/n6/Nt59NC5tHBAkbxvE2pNUBxOFpkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772028989; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tH8NTdo3O7wN/yFZAl4yRGkbgbzdmX0NbKaXbwQcPSo=;
 b=uWnFhOXWp3nldrTP58Ex+dhAkMnWMZIIZVgm7L9Gtye6DvsrxXZsJ/YBixrsoAkkxjMW6
 8VIL16g+Vl3euUdHEP23R6oJhLNl8sKuUHzJ+ePaImNDWwWGybgEJvb+crIUtcSSc/e5qIW
 M23e/PXJV2pK6fm61XpWHcuaTVZ1aEyBuNKeM1V4JlM9hR1emzdiouOQ3VEUDjWbd8pazxe
 9CauSnpe3eS83IDmdIUYDDPsT0vVl4+huIPEwXGLWYkVaYpzqhEOsP4QllwLZA6kJwr3zsP
 jnd+O1jhRIMV4Rah1Rrhh7bXt+nNzfPJv6GuwBN4B/B0aSplDB24HQt3JfHQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7AAFE4029E
	for <nouveau@lists.freedesktop.org>; Wed, 25 Feb 2026 14:16:26 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D47B210E17F;
	Wed, 25 Feb 2026 14:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqW8y88MR47jXob8+S9hPd3uG2D8oakpYSY6K2lOVN01gBHrOyBNromJr47Hd9+5gpgW6BYZPRbGYi8noBewopAc7iDby34T37dnxFz1i6wlDuYTmy8+C3vAiFoq9fcto4JwBXOaGUEXsyiYoe35I4BvTezXoxwJqGsFxA2RuYK1tbhECpugpJxB0NrGvjQsx2wGQujQFK3pAxfmoqGDwhMkjaNvs+tS8qK3UJ31siwYH/PNxQ1lydkBLF2lsc8MioL0X3AUgrQ8aAsFbFCs70g7WHe1mIXMyooJ4aUQsSXhd62A0LMC4lkb48TsdfnlMFT/nQHfc5fJFC0cj1eYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tH8NTdo3O7wN/yFZAl4yRGkbgbzdmX0NbKaXbwQcPSo=;
 b=Hzq75i4yBBL6htZmV274j2AsQVL9qS2B3YCxdJtgAZB75uOQdlWDvGTowdvBiW70gxvk74MmZ/NgYkSvq0HDuF6C1GxajJXV8Bc0E7YpeU+hDm2cLWFC6nmW4coMC8vGHtWqjXk/iYZh5V0lciI214lmWcDxLYbBJwVhRog/PfK0Y2ruMfRI555iN7ezB42//GVmMiT+hmKM23mDTK9pDxgedjrBVQCfQBrR4aJlLK7k2/JtibH9XFWiD+XUW0MXkpAS+Rwzs00JQuZfAFc+JPDiAwRSHXyMcI/T9Xm9FgrlWENF8MRss78qjFAlfr9Av3B0+TjcyNFviIiiRtu+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tH8NTdo3O7wN/yFZAl4yRGkbgbzdmX0NbKaXbwQcPSo=;
 b=PCgFefxGpBT32dhbHCmg14jjsSXRE39dOxQ01dIxH00T0xM7s2tl91HuN+Hw4GSWVksty9LO+5dHYyWfvvId6r6HeoXneP6VrOQJ2xUQNEyh90GltPC/Jy2uG41SeEuG3Do8wfvNG42y1Ek3cJu/qTa6McrOhTlDj8xSuzBJjTDBEAx6XEWLDfCT2P8GUJXfWU88PwmSrQRjATnTfXulYEp4NG5LH+JVwKkpxBr77hpP1lQ35RAJ4LHDCBrS9t8xRy5rrg3KtBcXxtFbprBtixQKJHiDDEMWwgamQYfc7peR3DPzaMJmQ7SMD5jnlmvgJeqPXACXeQtTAlL6GM8ITQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Wed, 25 Feb 2026 14:26:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:26:21 +0000
Date: Wed, 25 Feb 2026 09:26:18 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v8 16/25] gpu: nova-core: mm: Add page table walker for
 MMU v2/v3
Message-ID: <1772028959.538096.8539@nvidia.com>
References: <129e9988ff8d3e8747f724fbcc88c5cb@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <129e9988ff8d3e8747f724fbcc88c5cb@garyguo.net>
X-ClientProxiedBy: MN2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:208:23c::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a40440-044c-4596-76d2-08de7479d8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	4fDsgpLTNkBc6yB0n6ykAc9rIMW4mRMok+6drLWG+tSFdljaEH/ExHfIwsK09GSZZ9VgsUZzjm4836A3nOh8UZxOa874e0irgDBuc+c5By0RiDmuhombuAetxxflOLGH4AxM5mnzMKCdPOexixdJ6yHu14+WB9uZ2cZHDj6Nf9/nxL59U7i01zsvxovKagNbIV6p8gH3dJtYslGcT74C+MECtRlOfKdfoFj5Ug4rzzPJFjAgtqILMRa4P9BdLzs4leeXHdLt8C0iOoHzodtZxctanMPR6tfBW/H8gcCT11lb6vp5HQU3jXaIhPf83hTOgtmj0YwRVeuqK0hLGEMiCNTXjXG3xfA2R5vx1tFAXrQJ4DwRCDjx+heFtiHBdyWWmj4Yf+WAh6Ve3IU4STBlDlfFS2HxO0KieNb6/PGye8mrv9cxj1GQh8EXvS3JTCr+qaOpCOZqKNY5IW+EnAJ17WTrL+AgriWmS4iPaqPigs8GNhLrXpJoVXDC4eu5//LdnuIx1LdhiS9ExgNWTe+suAOO7q3WRfn4dFhxog0fBI6tR2hrXF1Ld6qyU3QxmNs9R/cQm0FTC4gwz0Hlr0E5VRkHD2d4JA/T/5T9TLRDp3+mrAxdDkZ7yW8Nl6BnpZjSU9o9qIJaIsm7TNpoo5GN0dj1chkYB2h1uiinWf7KlxPCCQJr0J+fUFxAUjkU4c8TxDHpyc2M35iHM5Xvd+DKWQbroc5FcUgXfnQ48tj95wY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UqxjBOVcup4F++cMvesxl1q+sH35ER1TFSZwBAb7drxpElRbWITf/ETsvdiM?=
 =?us-ascii?Q?DGIfvJzveQm7GiHip0s/5ViEgU3QhBHAMbtEuVWuox3rYIeYIY96Ep7FfnCh?=
 =?us-ascii?Q?C7lL1MZE0yH8KOIrqA+tOKksyuSPmI2GITBfLX7rz3wOapx2jsFTsN3lNXdg?=
 =?us-ascii?Q?99TdmbMP7LU0iQCaFJ6UPiwfoTRLz8oPxubfYlyKy+cdrDVri/kCoAqzzV0L?=
 =?us-ascii?Q?h8P/jP7eCwAYGoONIsopiufeVyFC2maISLKocjcpERfv5haqzUZBwCh+kysJ?=
 =?us-ascii?Q?Erx0yjbWTF+MaeN5DJn8NhetAvveCxR6dWqDGPuXQIGVkv0wNl0tevqSlIU4?=
 =?us-ascii?Q?xkCAv8TP8R9WpWio/WYw46qQ6ViN2Qhn4nkAEIZg/E+8aw/4tI9Txzju38uC?=
 =?us-ascii?Q?y5POlqMw1DKNakRmocIlxO2NxrLf/dCoAkE0sxL6rcLNhrIkYa/kg2gvdf5h?=
 =?us-ascii?Q?JDFbN/0xCVHpJcxZXb+SLIXZwIOrLBFyF7fFlfTAPPdmQSQQ7uqb6sw5Yj7C?=
 =?us-ascii?Q?R5vRej3YSX7w+RhfKLRj58rKqRS9x0NwIYwNaGlmpHvbSucHhIyizdTM1qiR?=
 =?us-ascii?Q?0IfCtT6p9hoL8skC5vKEvEfvzIaUDvdRCmgSJKfzskKJAkslLjmH7IrxdHaB?=
 =?us-ascii?Q?WBTte1RkU5tGoEb31ea+lAW3esKhILJEa3mBNng1G3KgQQZFQPXhDLYibN4L?=
 =?us-ascii?Q?93pvRVaTuomN2KbdAJbPTM2KFjkoPas/2zXf0vfGk3dNtZK2EWvgt+U5ldFG?=
 =?us-ascii?Q?tPgwxOQc2Ve744M4a6xaidaieC9HoDK1hYwB3QmGA0c4UD0X2bF3bjB7X2TL?=
 =?us-ascii?Q?vjso+jFs9FnpWc3TgBjK6QN0VIK9t831IoYNxaLya08Htu79tLxpZJrFcK13?=
 =?us-ascii?Q?kcNcke3TdDM8OBvSTcSlOCXEOeqKH2D964JvWXJa1HaLIRQBQhRd4C8TTDhA?=
 =?us-ascii?Q?/ZtnIJ3dQDuKlTCVOeIZt/d3tzNduiQnHAo2JhHMXvOL2kdY4YGMY4jQ3rPQ?=
 =?us-ascii?Q?XLtuc/hsEzChmrTxm0d2K6NDkWKT5vVko6bJ6d5urcaY++hnI0HA79+w1Nki?=
 =?us-ascii?Q?rvNrgaXUJ8OmhiuLrI9ekyONXzFtevo7EqJDg+Fz+6MetMe/zjVbiZec4U8k?=
 =?us-ascii?Q?zBYGElkWzOHjl0q6aAwm6bI+gK9NfFTMrAgNby39CH+3SZPladSie/oML7+w?=
 =?us-ascii?Q?2sfl1ftM18yTGrDZMT/mSihmTklbIfShxhsfCxi/d14HLs265YsEoneK9TNk?=
 =?us-ascii?Q?PWrU475DmFibGOxPAHJRrMH3l8LGLyJ4Wn5AS/ysiGSmAOe+6HcvAcCmtudF?=
 =?us-ascii?Q?LB6SvQqx+sh9u86KO6ZOEw55MgsuSa9yDrYkFlQSomcmdTC89hP/DRGnzPum?=
 =?us-ascii?Q?CKU7bY5wDufpgn2fehYf7j8CRDAl5ZoHn2N4n5LEb7jTPHpBSBsnnXOY1j6d?=
 =?us-ascii?Q?ZhCrlLQxCunWPlT5rIdNPHSeEei3NA2O8dKwubeBHdAkNSCtld/J9J5fJXT6?=
 =?us-ascii?Q?Lb47nAbfpmtnBJ6vtgBwnfAVQYApH+Ud1YnN2jLlkZUaXy9o6vg/qe+xh72r?=
 =?us-ascii?Q?drQZjOQThGlKLApJ7957HabXI0a/o/GVjutXlCofsOS1LzrMaaBtYK0RhI0P?=
 =?us-ascii?Q?7MhNeP2q8r+H0QsfMj47TLtfk4WGPKvuI1u7raL1F/9LjfFGs7GHzYrXCg4X?=
 =?us-ascii?Q?0sbHolZbLG/MfFjkUH/iT9OanZjBc/t6zzbpULuaAfa3Rx5fIoq3WnFmhL6X?=
 =?us-ascii?Q?rD46s4yDog=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71a40440-044c-4596-76d2-08de7479d8b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:26:21.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4jSnY2VNjF5P3ct8jgslBmK+LwiSJkxdVV+AGM3omzHiMp2X1Kr7EDz4Qy9+KRAF+3Ks5iLrSQSe+icsBgLD8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
Message-ID-Hash: PJDC33RANUBCD4JIRWDRUPXX6AFIPBDD
X-Message-ID-Hash: PJDC33RANUBCD4JIRWDRUPXX6AFIPBDD
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PJDC33RANUBCD4JIRWDRUPXX6AFIPBDD/>
Archived-At: <https://lore.freedesktop.org/1772028959.538096.8539@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026-02-25, Gary Guo <gary@garyguo.net> wrote:
> On 2026-02-24 22:53, Joel Fernandes wrote:
>> +//! ## MMU v2 (Turing/Ampere/Ada) - 5 levels
>> [...]
>> +//! ## MMU v3 (Hopper+) - 6 levels
>
> I think this is called "4 levels" and "5 levels" in kernel MM rather than
> "5 levels" and "6 levels".

Actually, I think "5 levels" and "6 levels" is correct even by x86 kernel MM
convention. In x86 "4-level paging", the 4 levels are PGD, PUD, PMD, PTE -
the root page directory (PGD) IS counted as one of the 4 levels. Similarly,
for the GPU MMU, counting the root PDB (L0) as a level gives us 5 levels for
v2 (PDB/L0 through L4/PTE) and 6 levels for v3 (PDB/L0 through L5/PTE).

This is also consistent with NVIDIA's own hardware definitions in the OpenRM
headers (dev_mmu.h for Turing and Hopper) which define the page table entries
for each of these levels. The virtual address bitfield spans L0 (bits 56:48)
through L4 (bits 20:12) for v2, giving 5 distinct page table levels.

FWIW, the existing nouveau driver also uses this convention - NVKM_VMM_LEVELS_MAX
is defined as 6 in nvkm/subdev/mmu/vmm.c, and the GH100 page table descriptors
in vmmgh100.c list all 6 levels.

-- 
Joel Fernandes

