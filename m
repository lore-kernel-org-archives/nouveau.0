Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB49C5DF6B
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 02:10:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A17C210E878;
	Sat, 21 Feb 2026 02:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qxfR54G5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 129E843452;
	Sat, 21 Feb 2026 02:00:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771639216;
 b=l0Tj9wGFhVJZ7HCh4m0IMF9IEu7R9HEK6m8vknMswUddt8JHrmyA3xL/dFlBp8FmhegwE
 BneRb4peFGSvb9/edySba8pIRYCPuN43DFW2irIoAWznfjs4Cvv4gF5ugWKYQrBnEdUzxll
 JG8a0KYhdYgOnM48A0OBiTAWlhgPa4OzO049Ka9TwuMZzojK/WCnjBCJG9vZy+lHD2yIHhR
 rAvDXmXB9U3dw5ID1fzwS4Vb5TaS4rTa2egGTb+wiKx0dBWNN/hwgs6pGL24TdU4HMJeouq
 dB4GzPSLBpKc0ddMYheuf9H7soW4zUepqL2D+KEfmZu5vijjCJb73zLlLvyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771639216; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L5Ytf746wD40+nTjA6X1Ba/BOgUNz9XKKhb5JBHFoHc=;
 b=bj1L5ueYKGtoqQ4yOfB6whWsCpAUpAcC6G36RAEPiU56f9ZfoX0WhNxLW9XUrhYZThQZf
 tN3trPHYpU3qdahBufdtowKIMtrloIACY7Pr9BDhDQjepOuTlC+Zs5bgjAuYUOHr7Cx8qsK
 OunfvEIkW3NPBFGQ4tb9r1wz2mrcZhFdA1p9bxTPlyvscFtwt01pzKNAbfDbZ8KLsZDq5nT
 ajrcay2OAyN/2Xdpj5XO9ngxoLKe8P35f2YuVAaItoVkWi9m4LHCvgvUWB/pyjdj2DCXj4g
 od1FI1IavrxKCAb1ZBv5rhNkmr5j+aWRoWCzo4mZVL3WZpOKRdVOKPK41uCw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BA67E41A0C
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:00:13 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 033A410E871
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UezKzdqYVKu2A7y6/dAD8t35f5Kp5iMIcvqWqMwgRz/bsjBXh5z4EO1G4QS5Lrftopj0IeGuOh7t9/Bwcg8g6TwmYijPj5vE2u2NvwrSolrY+4j+Dn2SH2hGrb1eqEoyVAyy4EQro4W/DtRpj/plDNxxahTsXD6qphpfX2mPIDfwEpNqX05VWhMhPE0ylmgdma6TiyTeMpVDm1iMghCVOiu8Z/aIoU9wm8oWC49/YWEnNisKmi76yzaZ7TDG8qCrlkOtGDxM+5a5IL14Al5vbt5xC19yvnmq5MIUOI2X6sKFJ+vE/aJ56BF4TEDjlWmQYUciB2IHYQ5Ln6SIUMhKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5Ytf746wD40+nTjA6X1Ba/BOgUNz9XKKhb5JBHFoHc=;
 b=WoUsSG2FwJabocSPPUz08Uc0arXb338JtAlUq19QXyYryKTNWnqLtFkNOuny0i3ItuyknxewLxX+ELGgxicMsn3wy1URf2PLXE7yjcz7Xn1AdttfqQpVAbhOMk+bWaI33QGwgjUGWvYUEdD8C55gduXcmoO7jJgLCqsodsLCMqhIzOwnYeJqMfTWwJUKliUDT2swztiMgjiuGEublqufUiuAj2OLzEBBDZP+uOrV7bc95tkzmwhIwHEv+DWqMoAcnFwTqyADIWuMddqMSGVurKDzpqt94diFYcMZMMSvBkWiMZ0UJs3dJbxQ1ohIaysXxis4kJKfb1bZoJPpEG2Pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5Ytf746wD40+nTjA6X1Ba/BOgUNz9XKKhb5JBHFoHc=;
 b=qxfR54G5Wn9Reou9g1zyr+8Hz2L4eouZSTb74IANYSs9HNXDfvW04rpHQ+trZHepUQ/YErHdX7XhdVF6tHUxBr+C62dh2AAW1HygiP+X4Lb0NI4yod8BJSxMDzOvGkdHRQZrcDs20JyP8SI0Bk0xnRmBdjePWk8r73QEN7nKNktWZxQPvmhBX5mbLIMec7n771An0FSQfIvwXKw0ZHGlHFPfiWdvj0BYiv/cECWCjdAz628/GjJZM31RTs97x/P2iCEvPVeEkkCC6xMvNttbrwLWhXZdSORymPPJgRA/iafMHrYZfAqxjMTFh9GcGWlpUHSfOp0cG43+79FkG3Pjeg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:00 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 05/38] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Date: Fri, 20 Feb 2026 18:09:19 -0800
Message-ID: <20260221020952.412352-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b073e8-98b6-4ddc-089f-08de70ee519a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ggQzi47vt2n+3oGtVloYKVla41Y3jCgeTKEbDFNpAj437EGy1sH4wKXys2K2?=
 =?us-ascii?Q?np+rNIPJHXzYj303LUiwjNmKfe94c8H6KfSsmYCg7Rrwd6pOQ0mWbxKOyQ2g?=
 =?us-ascii?Q?+QHx0osEhi8LWmgwAofzxN/rhy/75qdyr6YudCrokx+r5nhGcgoL4myGVoTf?=
 =?us-ascii?Q?LtlC/PzRJHYB+zYrEK/6Y476Bvd3/DQe5f6LYl1SgdcVq7TN29aEIWvVIIfc?=
 =?us-ascii?Q?TQtqGu99iw7MBV+hDTyQy0tS0++emfp/UZ0W2xsACtCDPgfGoGg0WVor8hyY?=
 =?us-ascii?Q?P7vD+vJCtSp5YEM3+3HyH/99tvuwvCc0D+x+H1aNZkUgzLzZ/65OpQa6aZx7?=
 =?us-ascii?Q?lz4t8LT2N+wfQq4pfe7cW0NFczZzrDeU5UDU+iiy7fXlA2pBobR/Ep5vUKmw?=
 =?us-ascii?Q?NxgXT+ZJSqiOzoRRY/0iN0Kjj3bR4p2/OF9s2+nORlL1wiqsmM0u2I5V2BPY?=
 =?us-ascii?Q?cy8owJ8JgWHvWbz6tZM4Z7wdMjmo3/JMJyvW7HdekDf68Ug/xJY1b79A7bon?=
 =?us-ascii?Q?PkorRJvO8pKuHcpTUNme8ImVMHFxNAEdupZeWHUQjEMXjTl5ohO5XOasj8J2?=
 =?us-ascii?Q?T4taXUG1+FEa7OY5zAt7c78PcOlpB3gnohFRQE6e6P6SYnTXRQSpYp/hXzom?=
 =?us-ascii?Q?lQvdZVLZoclssL1xNcPs2T2oqr8vPDdeJrvvfKiq32/zUxJY//0Hlgtuv7n2?=
 =?us-ascii?Q?jWG8TFm3pQWaczPSwgF/nHywPJ2TyFPolaElEAJRE5nPaWTiycqaasoWudit?=
 =?us-ascii?Q?PsZ0FFNnC7+oCX9bcTsFaH5bFfOOtPi1n3W8Y47+XiIDiw3HmB10PqJmVJ8v?=
 =?us-ascii?Q?MdEe1ocKwBiDoHnQBFXzIJrFVlAqnvXdYtw9vYoSydo1BJmgfaJBuZhOhJcj?=
 =?us-ascii?Q?cbQfBORLtPJjzBO7s5gB8t2K0rEKWRUZx7lsmbrfipyGLAG0DosdZI9bTaNL?=
 =?us-ascii?Q?WoSZZP9OHZACc3p8GIJ0YACqGtMuh6gjANS3Yu1JD6PlFEYyA2ydlUhG8tdc?=
 =?us-ascii?Q?QhqchSqffnlvw815uZKNKCMtSw9oRyguG1epBrZ2bgPZBnL5AdyjVZeyNIW7?=
 =?us-ascii?Q?RSU513mHLT99bhMTwHPZ59vGZ9Cu14m451oqiSFm6NKrkwD/AxXgz+Ix8xtw?=
 =?us-ascii?Q?Frzh5Kl3hq7nvGIf3ivalB+EmvcRKdevckVCp1PMM0qgNXXWsTNoLn573HNw?=
 =?us-ascii?Q?e5hBVFaqu2ClJrUG0z4RfxH5a8popfLAFbzec9qVD7hW75KKXIx7MJ6gQF3c?=
 =?us-ascii?Q?pgShYzFe8N0KrggOw7GuC7xJrpO9s/3PQrlHHUgoDflbjV8xy+PoC5ZCmooO?=
 =?us-ascii?Q?Iz3JqX4/GjqQ3QNxxp+mDgxrQiT/jqJtTb/iDe28NuewrjcO13WSVgjpyO/w?=
 =?us-ascii?Q?N8S8RMyNHQHnEMLz62uZbXz4tWfinkMEpL3wsxk2nTMVWa5ZHWtlYmGgUfgJ?=
 =?us-ascii?Q?24S6TGuoAGW8vCRJyv4ggseSysI+9z2Z4M2r5/PZgUBbZrRN1KwVP1H7iNh0?=
 =?us-ascii?Q?5RGSXsHpQQqfuomsRaKwREA600ny36B+eS+ZvPDDiMmP2KZRVz7ZXeVveKpY?=
 =?us-ascii?Q?ukeBQ95JqU7sdjFrK0Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GSONqKL0aXZb7jEVb0AJT/IhsIlA6KNQQCw1TAyrpRimolvHxHBujLclQGFo?=
 =?us-ascii?Q?eymUvljAP/8YhkAMsV5I0byDOlyg3vEPkdWh7XFF+igNxaSLIpJ43MoFttnq?=
 =?us-ascii?Q?SgjBpgwj0VIz9n/ia1rIdErV4YEordNcbyuGV4ySMLOsRLs1GJYao0v00y28?=
 =?us-ascii?Q?LEvn6qoBCliocwl0og/8Ou3gwn21harNVjrp11pRRbwOJ7nX0yDFOl8mOIl4?=
 =?us-ascii?Q?gmyU/Z86bNnIXp13UslbebhaEgMo4YwQLD/e1n/q0g9u+c11qRoXQXlop4H0?=
 =?us-ascii?Q?HgJw8mM1FQosPwPXPh5tFzaoSknP6+TyvCJGaneryZvM9b+BxvHwUAa5QMQ+?=
 =?us-ascii?Q?bXSIIHdqxEj/uVnDdiWNZXkzF3AZ79BqfwpceomZpOy3YQjJEB+VZHz8Qv4/?=
 =?us-ascii?Q?OBnyPRmCrL8Okk8IkdHGKCwTaPiDbPfHr5+NF1AMGHTm9P+e8GxshxKh78lA?=
 =?us-ascii?Q?nA6eilanvNGw/Ohv2Fsd5fHgl8sHGIMcExvpOr+rcMzArEtpdjz4Jkilg6uU?=
 =?us-ascii?Q?TdBA71q3DtPyT5dWqG6qrq2ndZUYZ7SrSxOOJXd/bIwD04/0r/BItbxcn4s0?=
 =?us-ascii?Q?zSblGr5uIxNNRYBvFc28Hs7wTzKFRbvCgPXzIJxr47P4duLKCQvpHm9/xEhA?=
 =?us-ascii?Q?pLFL0yCIgMGQrju3v0y2Z0acvXy+W5/ejDa14AYHzZ834ltE3VbYBjQjvJN2?=
 =?us-ascii?Q?DNpFqn5xumZ+N08OHYRkYRlB9x6mOC5CkxtIBqxfdod/9FHaq1G/Yt21aq8d?=
 =?us-ascii?Q?z27cP7Q1bWHdtegGaAw5b5QToGKnCBKJ6QwOgv4vj2yxMI48MUU1dKY04x1R?=
 =?us-ascii?Q?rsk2XeylO0QPqHrp56bjl+ZleaO5uw6xlXNLLQYoLZi7uHnBc2cceNsp4e1y?=
 =?us-ascii?Q?fFAdLG+zQGmDQkBFFIcjdDcOI9ELUKpWObkmSutrt6+ffJED3T1DbVHSACFy?=
 =?us-ascii?Q?U4/XDhjUo6t9gSyCnd4tvVnUezpfnicPozG95xWJT2iaymYYFTGDw8umNC3C?=
 =?us-ascii?Q?3p0ivkfAxBoH58bHahb1xnsLXVvg0NtGeILBfEo44FOqj8g9hXqv1uDGJd2W?=
 =?us-ascii?Q?ifje7Sd4Q64Pg+7ZG6+5XP53Vf9y5ur9T5h7xnIuya5pueVOLxs/FrjxLHba?=
 =?us-ascii?Q?Ubo13FW7LMLj7F0KeidZI451kAiZs321awdDHN6qYJwGsJ7CIdreFDVtj4fV?=
 =?us-ascii?Q?BqqbDI24cShwc7UCyRpBBWF9+Sd2h1PEbCb/WkJ4RPg6Rtm4h5A3y+cC6Zn3?=
 =?us-ascii?Q?Owb695wK/h0MxMLNwOYh335tEtCauyd911qM190TawSd/rvfpyJ4w9OepZce?=
 =?us-ascii?Q?1pAw1Vjzy8cmP67s7j24cP+kiDwuNK+Z5ZpPC4zWKS1c8MTdl50flUmx/iDX?=
 =?us-ascii?Q?cmOtIEw45rRD6+7XhPeJztCbv0s5tifQWah+4DmGAJ5nJsDSqtKxF2Gv+TLQ?=
 =?us-ascii?Q?Bz2hza24KAWyPlz5irvmr7Eek6ljgfjjVDyt6XF6bQMmb7N/gDk7OmVQDSi9?=
 =?us-ascii?Q?aylsGrPahLd1DUbcwdS5N++uZxD27ZjEl0DiX7ckodXHhXMaw6J6YTqtRVZG?=
 =?us-ascii?Q?zm0zAEEGWma8HIH58bjcfqVWtDgbyqUdOghLuyPM/yNCatdf0VtVFJQKtA3S?=
 =?us-ascii?Q?ZG5+3swRMwuZiKrjfNMgx+UT0qU/UGJyyGrg2UDupNWtq6lnFdhdoSn3spbB?=
 =?us-ascii?Q?o1lxDHFH3zPugYZVKvJujPju/aLrzscsqs8hsxUxx0u4KcnGXmEROpwt20sp?=
 =?us-ascii?Q?Ps0mtNn5mg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60b073e8-98b6-4ddc-089f-08de70ee519a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:00.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C/Jw3KLkw7jiKQSPZO6FjkN5aOLIwVJyJlGLlwt5e8upUJcpHME+dn8ESFCzgC8VM3aTjBJ9cml1obpIWDF18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
Message-ID-Hash: 5F7YG6DZZAQVZRCDNC4DAIPISVN74K6V
X-Message-ID-Hash: 5F7YG6DZZAQVZRCDNC4DAIPISVN74K6V
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5F7YG6DZZAQVZRCDNC4DAIPISVN74K6V/>
Archived-At: 
 <https://lore.freedesktop.org/20260221020952.412352-6-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..444c95fd4ece 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -76,7 +76,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..e709affaa7e8 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..bc2243450989 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -222,6 +222,23 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell => {
+                            // Distinguish between GB10x and GB20x series
+                            match chipset {
+                                // GB10x series: GB100, GB102
+                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                                // GB20x series: GB202, GB203, GB205, GB206, GB207
+                                Chipset::GB202
+                                | Chipset::GB203
+                                | Chipset::GB205
+                                | Chipset::GB206
+                                | Chipset::GB207 => ".fwsignature_gb20x",
+                                // It's not possible to get here with a non-Blackwell chipset, but
+                                // Rust doesn't know that.
+                                _ => return Err(ENOTSUPP),
+                            }
+                        }
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f5907c31a66d..b6a898008a59 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

