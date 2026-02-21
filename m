Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828EC5DF6C
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 02:11:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D34FC10E0CA;
	Sat, 21 Feb 2026 02:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IasNu1py";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 44B7643469;
	Sat, 21 Feb 2026 02:01:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771639273;
 b=SmlVdn6IxYbMX5jpi+3zvkJxTvtEjJdJy19O3WL8nDTz/z9GTjYoOLLWZC4Xec9oxZZo/
 xW9mZM49tSAfB4HpehOHmoFEpbrW6XEHXExJIOLuMtB/0InJNf1nFmER4DUhKYJ4w2G2Qg3
 i2hUy3VkK9AXI2GW0SPW+MoygVrLheGatD6gvcFpUlk8BNh03HDAXTdI99QrNwiqrHHC2x+
 YsM4pJ683OC9MxEQTBoL1Zm+4GRgtIB3oJfODEYijOdeUAnGIMTV95gck5ljWAobmVCv+Oc
 GXWxbDjkVjYNM/Dw1hpiKM9++axlfTOAovdLOH8ulP80sXVGzm8wKpDCprEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771639273; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uXeNMmFti5G/mamehuvx5Xr7KZ1L9DWhcBmORpPuMr8=;
 b=GYBBDF5fAmJ7fPqNhmdlI8f+iCiepS6wiXpSk7EOsqn9oi6G2CDDsZL7tQZvQma+9fc4V
 GkKPPSZA0WVipIiLABaQQnelzKVnaxLdYpUWFEIVjkGpL410C3vdHvYgpZaS2gs27aWv4bp
 1mVLcdS0Vyve1Afdk6RjUZ6SANxGuQn84jmD6qTpOXo/Qf206V046iaEXrhwBNO+ARRdKOQ
 9oy0BGC4greiBKIeQMOoMGfoTArMiTRAqoRpf4En/USYQhzf3KVaHZGN1fZKAMbc+FS0sJr
 dHX6oUN5hJ2vh8cs74eb86EdLvNWM6V00K/8SvFb7B8ChgqzeSFZkrwJL+GA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AFC1443453
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:01:10 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1582010E0CA
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bToA+r4M3djCwgK+7BiYTNlOyIfNHZKXVQc3GJSvWvibxi3xX55pxu5kb/lDGLZix5uvtEZHr2lIxSw7JUti7dedndP/pOUNVp76IXOpymH98joPGz40yUl/yUhUevaefC9UmvluBkXyBCDl+lfu49B9fDo7mg3DPAoHSFW7Nag3IRTw7VoDVlDsXXsJijLDwkv6Hal8K2cW0wmziao6f3iMRabNaDQhTYSMJh50MdJTMoOzny8qgObtWGZ91i+/MW9eRNfJ8DPNZZ2QBMLD3V+v8kA0xNRDJL9NfrdVQWpwIK4sGNCXwaG4sGNSweGYp6NUnoGHC2I9+IiacojmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXeNMmFti5G/mamehuvx5Xr7KZ1L9DWhcBmORpPuMr8=;
 b=HMNgDY8PHNfvWYSFeWmPxw6tWXqHOOG4uArRgIM7DcN6bmuhmXV7eR29aUxc/SOEukYdnKu1+gF+LL4NkaZFoe7rDm6aiQB3nr4pbnoea6vOY+5li5AzoVK7JUDpbuIoY3KRIKjtOTL6bclj4xIx3q2PFXRVSa6ZiGFQ8aG9Fy8ePRVwTPf82ntlKfORRYqVrmyoknI6T3MRjPOBds/hAisUaUMnC3rG1L+tF9UKZZm6vS7UkOV6yOajweQ6cOepdhoPSSXbSZqKwQXTyM7yOwNjWwr0uT3VPcQ2aCKrNI/XOnhEL2uLSepvWdBvLs6TtklBOF+CiX3+MT5WTx7u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXeNMmFti5G/mamehuvx5Xr7KZ1L9DWhcBmORpPuMr8=;
 b=IasNu1pyEQG22jJ6+uO0VROQgCQdvgzwAHw0Pg0kKkltDi7oaO2jKJVjJoX6NZg5ob1IJN5IGhSkY7FP6okXlQIbZsnrAcAE3aTd3Bia+YeXcwDWVPAIgG2NHQd/wF2HZLR0IHN2ja6TQFgyAnzMUQf7zhh7XQnaj7VEvyADmwxVNp03gQc5tBA4wx+MCyzTabaNMM5+vGylsGb+rm6g0rkroZADaBjYMDnW/TDAJ61lMhev1uMGWBGzhLbbc96OaXI3OIGHmdadD7spW9B15Gs1IjEH+cZchXsszhso9VBfoqyV2l124RJWwvJdicEVM0949LFacn35cmPzd5gzyw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:15 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 17/38] gpu: nova-core: Hopper/Blackwell: add FMC firmware
 image, in support of FSP
Date: Fri, 20 Feb 2026 18:09:31 -0800
Message-ID: <20260221020952.412352-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab0ae08-18c5-4412-596e-08de70ee5a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CMVxIZPAUlie0ldQq5ScFQJNxZyOUwRE4asnoa5Wsz4IlE4BKCIWlrWhW+Xa?=
 =?us-ascii?Q?MIZgFclLqnrmMnHJz8sFEXHBTjkKvXUC94DZSvaE36Fr1bhmblWZLWgsfAvM?=
 =?us-ascii?Q?ZbTjMcBoz/mdxuQGqD12W90TIcJzHmqYuKtcM0XxISDUOPU53XraGYtIAh0s?=
 =?us-ascii?Q?HklUmSXy1/UajjBSOwiIXD4sXdFcntfMlV/84nYpFsMLaLjqPNLjjAyxAsj0?=
 =?us-ascii?Q?vYhA/s/ksEXp079/dOqOcPnFflG+IqgCTI5lPnAbhhQgo6eGuMWI6l+vdTuJ?=
 =?us-ascii?Q?EvZ/alKbc+EXx3ewPHUro/bhed0RkEwNjBwjmmKJlpu3G5tI13GYX/pQSV4t?=
 =?us-ascii?Q?pBkhn0+iRYqYqsvfW1WPXlZ7nKHobJzvaWB3/vUfjxZqECXRtPETaKsbDOyS?=
 =?us-ascii?Q?ylbQrTHEwtvr4SlRXpwTYrth5IUtqcw9J9ygVkX8aqFGTLxc4d861RmznUvP?=
 =?us-ascii?Q?jcJLakEUXD/Qx/vvbm++nq13T8pUIjMqUzJiPW6QDh/o51O3yQabXg2470Si?=
 =?us-ascii?Q?qaVqt239iNxubsE629rc8GYnJGMLYdqt6hZZKJiSbet96ep4CJswjXJ/JkS9?=
 =?us-ascii?Q?WyvrpRV5IneOQVzri69eLvFNv050H3+lYGRIMnlZACtDKcqLq7VUNUg82nh9?=
 =?us-ascii?Q?WKl0pXtZoKiyDdUYk6HetF0Q+zFn6GfxhJGVjSEoKpAnNieQfGMGxS1uHdVx?=
 =?us-ascii?Q?NDfICYn5lFEGdOGkPZkOOV5FQ+q/8yTue1hUDgztFu1RPDY3WXWq04zugyHz?=
 =?us-ascii?Q?B4fGHqVj84rzcAAa8BmFVqIkcCxlJlAqczUs56UpWrdV7+hPF8roicbuzkui?=
 =?us-ascii?Q?rTUUolrd78WjRyhxLR8dOB1CTSBaUVhyfQ8LHRrEcN+YuCDmYd1sFJRvbAGs?=
 =?us-ascii?Q?1E/Eo2EJN2oHr6YzukIBOWupqNtAXLIPu1O/CbGMtvYTMTPpo5xSYh5U9cWw?=
 =?us-ascii?Q?FLj2KWzFgy15/8KmLcg7PRb8clbA4gSJaG9HmiTiu9BWH6t1wt+E1fw08FdK?=
 =?us-ascii?Q?e5qTMiLtNnRIS1w7Afme42YERT+1XfK+3MtC+L/bCsTXaM54X8geJLz+lg8j?=
 =?us-ascii?Q?eOrYirghVXFMuugruU8AfeIAVYHLQXw8Rv0f5vWulXDdBrateC96/IVcmtBM?=
 =?us-ascii?Q?sLh33NGm4sPnKiopx4p74VKw4rYXGsdQGwocSWUhmErCVBEP8mebVeBDe1vz?=
 =?us-ascii?Q?N6Q/WJ60Jy2kaZbpxS1/z5+2VkeXz50hoz1rkyLMRC8JVZwR3UCbsM8L5AfC?=
 =?us-ascii?Q?HL3xvBzUkZOPeXneaQPLKGhZodlHLiC7qPh1OoXvcr20DgUXHURFoY/lQiUN?=
 =?us-ascii?Q?vmR5JGd9W8zOXshaptbBID2WBQA4ZDGNRQHeZzI/3RVaKlOL1F5dMU/dlhG+?=
 =?us-ascii?Q?cVwxjcXpFdu+booUSznoBwpfLz6vChY6iWk1z9F95l7S9ET1euNhzGHdQPK+?=
 =?us-ascii?Q?oaYNV3Gf2QU+JxJYkqJN3oXHeQyyZ7QzDx1fVhlDQMUzKni3p0t3g9DEsxiL?=
 =?us-ascii?Q?1b8XYNp4glKg3AHfU+1CvEK89ofgYC6hSDJXypWyWl+m6q1oPnd2/GVO0qpF?=
 =?us-ascii?Q?HnANTxRN2QieqClKFn0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nq5MeawCeGK0ViQ/PTeeONjAyFnUpfmPSjVUN8mwxmcuBSugt1l5aSdTEcWc?=
 =?us-ascii?Q?UT2U6MC2uJiQUWND72VBnN5qQGdOYgVZkYdQjMLkxcBQTHWfM1JKrTfEMsYU?=
 =?us-ascii?Q?mrpfTB9a8FDp3Q96l1GeAWqJm61XWjzgcde4NWbW9rFO9zfocEv0wk4Q1e3o?=
 =?us-ascii?Q?BFqlEGAzc/bp8GYuwUnmR38WAcYlb97Ryxnds0lI2yAEpBR2C0OR90DUO/Xb?=
 =?us-ascii?Q?wdlKGnjgqRIduXn77NUy/dTy01mSozSQE3RR5Cq0dByo0fxu9eps3wz3uwtI?=
 =?us-ascii?Q?1Bi7H9S91UaWLJi0WffmQUnea5VSqxZTU4O7UzHLf5ot099AwxGErMulNBcl?=
 =?us-ascii?Q?7P+dCa4JlXBgguep7og5cxnLU0HyGvRXKBh6+En1ykiMV1OM/gfhraecMz8c?=
 =?us-ascii?Q?4VFTJCMkiWQMl2bixnWbkjcbXyZOVPwJl38MfIxvVaxF3sSCud0WzA4P3I7E?=
 =?us-ascii?Q?Ejh7wKNCcftzVzUIQqPOko9u7nL01OCN0SW1rQvZE/Lq/UyhVAYJv+GsyjRN?=
 =?us-ascii?Q?++wVg0G1027FYq2Q+np00wGA3bF/CKIuYRlb6mTVEyJHaeB1TMviHNGiMXl9?=
 =?us-ascii?Q?wWYHlFSASPP4kCOFm4GAXxxzD+za17CQRMCkTe7ILx6LvIXMzv0OJQDavgf3?=
 =?us-ascii?Q?/kHvbslmw5/UW6s/b2dBCPBziP9BE+WQ3smmlefwjBWrnn8bogggqB1TyEn9?=
 =?us-ascii?Q?0Cq3Am+jOgg5PoP8YbAUCcpN0HO2WmhMjz+3bnD994wljv2OgPwnr6gYMaKM?=
 =?us-ascii?Q?xhnldfB8qU6KhCYL1L9CIqX84aoqcbcP4Ib7SdATMe5ZZcDsC2gMTjEdufYS?=
 =?us-ascii?Q?R8jtpcWkgim2OPdp2lKs3JQppP85y+H+evBTwuRAyK4vHQQdnQEBIPkHubDG?=
 =?us-ascii?Q?yIuP9Ss+QJq/osEcwyfQ1/TSPDKez1EI2S11L64NUAWW3lmJWf+yd0hHXl4N?=
 =?us-ascii?Q?0yIz+lVFLQVqoAqibi9uXGjwhWMSfNo9+BzougjWLbpKU4mvMCa1DqkXBftY?=
 =?us-ascii?Q?nV6JUWfvI8E5vBjNxk5AWMaoHM2qRZ7a262Z9bzSZKJFdfqBD72UF9o9ovio?=
 =?us-ascii?Q?ncn+t3ZjRPOqs3tQ1A8BVzpQqZbQg2TP1AtY6x4cTKAJ2zf7ZSpoFGOGm1E3?=
 =?us-ascii?Q?3kX9nonfJobhlfVMr+olbY2V+jaNPD96+u2AjUxig80zdqh4ozd7/+HD8jSW?=
 =?us-ascii?Q?E4GxaqqLEx3Yw5s4AoXntUfGwQJ920f/yIgREwId0jWDwq3CZlsp4jUvZqCa?=
 =?us-ascii?Q?F3AylD0crFg65yTZTaKsXv8/FArlRAaBaqoI2aee/DpBLqpbHGtYsy+DR+jc?=
 =?us-ascii?Q?0S3NPb6Z3AQDO1BRzNgcXzrZeZzT/fvSJqqQWsQIl6+Km4YOr0Iv4QkhPLiX?=
 =?us-ascii?Q?FTYNQ0ethJsnzDkUPRoCdnPGQ6qoMKafsSf+78yvf/mH3sDEnJxWmTp9yoql?=
 =?us-ascii?Q?2o90oaZUuA9VV7QYcSd9PPpSqlxDTJjBTE5AfA/pL5OEAkaLUUortkI46TvN?=
 =?us-ascii?Q?MXKO6gHZ9YSmDAK68eAF9SxOKFVtGq70zx5f9uJ1PxBsQVT8qsi/RIIMUNtA?=
 =?us-ascii?Q?Emvy29Cfvc0/WfXpxJknxVux93U/6eDHyVMHAaWzqvRBfPLnNCVAWhspqBMH?=
 =?us-ascii?Q?uZAKhO0oCHHf1exOZBJmzLEHKYiUrObSwlXO8lf9hraO9iSGvGPVhMKb3BnO?=
 =?us-ascii?Q?MFAJak6pJ80JSo7BoOzyMNMi9G9Lh1HW58wCvqQtn5xbjqBPuVAuVMX04aoS?=
 =?us-ascii?Q?D4Nc4JwBcw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ab0ae08-18c5-4412-596e-08de70ee5a1f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:15.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nhWuTWHWEiDC/wqosPm8+F8YhMw187Ib8pTp6LB5xfXwtKpWQtgW6YnSXMBPbAsO1AYqQBb+HrigQ+zF6YeWXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
Message-ID-Hash: NCTYIH3QCOFEJI4IHJOB3XBCOK7GD2VO
X-Message-ID-Hash: NCTYIH3QCOFEJI4IHJOB3XBCOK7GD2VO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NCTYIH3QCOFEJI4IHJOB3XBCOK7GD2VO/>
Archived-At: 
 <https://lore.freedesktop.org/20260221020952.412352-18-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

FSP is a hardware unit that runs FMC firmware. The FMC ELF file is
loaded and stored in two forms: the "image" ELF section alone (which
FSP uses for boot) and the full ELF (needed later for signature
extraction during Chain of Trust verification).

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 57a919b7e0e8..396f96716d6b 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -28,6 +28,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..cea9532ba5ff
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction).
+    fmc_full: DmaObject,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.53.0

