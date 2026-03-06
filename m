Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B4AF5141B
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 07:22:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92EA610E39E;
	Fri,  6 Mar 2026 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7kcvCDe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8EC7344F41;
	Fri,  6 Mar 2026 07:12:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772781133;
 b=T4VesdbjY2YXsXQ5oT9TXYIVFRFh2RsAuF7i8jNCWzFjriG8FVnvEBjrTpCPSzv2x4ph9
 1uGFxlbwMxPWszU5uiV1Nra6petJ2KlJa2wJLCE5E68aZkSco7kJN/AAoMmZpUXviPbxvJb
 uIfFC9t14dGG94ziJbHJ+YBp8YFDPWBTu4ZKwSv85ptec1z4rQPwdnAmCNi3hNdIiuypz7d
 DS2TB+yOX0fPy9U5xo9KKJ/onussFS4ID1rt79gZDoBrD9hUpqiAJGo6TO1ZRf3t+TCzxtr
 FSdNEvxPceV0C6buWrFUPfOGitD261f8x2JWDQKRaj4KGbMFuZjjwv3P6ubw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772781133; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i6+8ZVIrOnRtHmpp5Cegv3D2ZNRFsYmQMXZVMQ/K1oE=;
 b=RYT0SqBab4ukgVHkyVNYXtCbMumMnUcmxd4yJSe1h2908ODzDES+E5sz4zU7tsFls98cg
 bboYb/ZJiNMS2V++PfDab/sBC7nD7d8YtVtSg7UGQNJHzMrhBjjLoB0xGdL5CKRf9I16Zee
 LyQ2wRCk54IPlpEa3lqPv0LHR52M/fy58z0T2cdnwwKohjJSDHB7S+alnXK229FRV7tVEPV
 r3SMZUOa+2sgQKrin1x/D6cS79lF4kT6PKNjvsBl2JpWN3Mfh+/CVpYJagUfCkNG0HYuspH
 TNTFzYv7uXGsbSbooA2DeO4gkP0kCJ4JjMdjauXL7/K3ST/ZN+JlwSwTgoNA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9D15C40760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 07:12:10 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6684A10E390;
	Fri,  6 Mar 2026 07:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teWLN3vyEnlgTaJPm2aIZNiLMZmlr8B+l4+SZ+knzAtquKurSHva+1c1sfy+0xvp0S/rYLO1s8K7JlfJDPEuyFMOwofL0J4WA3GR04IoKT6WZDiLsSVYxDHOB+XKWjMQuls3OMgXuSulIEb8eqM3+o5dP2mrX0WmtXvz7BW+cfJ4ot8PXHIhf31V0kENV47Xqeqpwlh0fYUi7LheaDi2ODg/4w9VpcQN0pVxDY4eD0WTraUGRvIi8TZ18Dq9gW0rG7yB2FS+/9CCwYZ2pNWQ+n+dgvlgfKKpNvoS9wvd6oulcb6NXrO7fn9agEwCUN92S+f7e5f1ZCSIMA43KtuCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6+8ZVIrOnRtHmpp5Cegv3D2ZNRFsYmQMXZVMQ/K1oE=;
 b=kyFCn1S57J47JIoWbx9Opioj/nEDsmL61JTF/g6tkRbxZZ6cZzSJrz62d94LBGvhiv6SbmIZshai3Q6J91ZMa06BTKKZzgcPI1N2t5I+dtzp9YsU2BhEmz1xlIAJwOCfVxXR0gJwKYnUhBfy0pLcZyb1b4Y5MByfFHXnjffPEBPSbJ2SgQ6O98zJLOcSbxUibvB+yXfP8/oAQdgQJah3CPugBAh/8OPVAQKdAItnq/yakFynZ7dQYoep7n+rXCI9Idw4jHhIPuL325PKajkp6+nGfTDXDbjE9KDArByhGiP0I9d7HkNvAN0R5oci0z7ozLE3fo1jH5Uk1TjE3cDgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6+8ZVIrOnRtHmpp5Cegv3D2ZNRFsYmQMXZVMQ/K1oE=;
 b=Y7kcvCDeoGwyKFgREVeTyst6ND38UKHxuRLwMxI1QNp9CK0HuXjEd6BsgkXKI3mx/Edp4BrdfvZDFtn9q3ZuGToyXMOAiQQLXXJmuKUS31ICaUJj+cgAEXxtW1Ma99/jmwYg6e0ZUiNomnXwGY3qZvuWL3AmwGFvHcqA21mLl9QHc5w69wG0hNZqhrYDoAKgVLbiha8/nq2sn5xPwQMGuW+NPfZyIf5m7Jt3PcowEvejAWEm+BwRdpXhXSnS6f/6ySgg72LClrNwvDjMiDk9am5oV1p1qCDDiXQd238ubH8XurXhv2m4kXrCaWJvjDrBQoImDCacwsw33AF+Pj6p7Q==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:22:30 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:30 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:03 +0900
Subject: [PATCH v6 6/9] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-6-cc7b629200ee@nvidia.com>
References: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
In-Reply-To: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7bbccc-cdd2-4584-3bfc-08de7b5120a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 
	O0sEyvaseOgsjUm3dfMvi1Mwgkr2+MIAxx1giuiCZB8sIRtGTBeHWlokEfSJ0IqU/DUMQXEADgVt7SDoQ6ll5LDQnPQWPd7BNeJY5at7qbRISpdkl45Gy5z+EqAmn/YGYCf9b7P2aWgbFhjKVtStjTxbFLxuWa+L2KgbKIMqNXR7RdRpcvXZ0E/QRPqUs7JUeaawXEl2h5uOlWFq6I9+sZuE9hm8n0OqIancfvRt2g1yfiYQ0pezN+wsotEAzn/cMMhNeA0htumKaV8R11vgm6NqQmWcTwD9ZE2D4gT4BeuX2//sjyGEnRIFWssakcnMqTKUUvYWkx/0V2dQ9NO7JjZv7NT8jdhkJWZLPNDAXYnTgVDTVOMkTnY2FZP1XboKAU5Bus6ethGnf6w41rGsocrYYPsv1058iFLEy+wxFcrNQ4LMe8R2ptXyXjE85Ou0DlEEyem+dRrGKjr9/HT6RFg8Edaxek6sPDmMNtFy8YVNE3GC/8cXOCFmSlbuQdSUcfm0UyoRHembafs9I+BOs6agvFrMGCEcCsB/Zp47VnC6LkUSoICLBtg6U5L1GupHk4aolbsjddMY/eZsNA9ezXtp3WEluFWT1Jsod1JRRY8C2JKM5B9s3Mj9OUrPossUQRpp0hH1wAfo6MZp+CxFZp7ACtMIaMgUs06Vv7egZt1V/WfZ09CKmUMcksU7yZMC6Nc4GVCclevho82Qm6Pq+yaYQXQi/i/v2N2h9Ue/PKZdOUoFefUs3Oyf4Z8nGQ4cwkHdZSetPqcMS3dlyLWXBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGlZSmtwSXU1KzF2VjJRaVdzQnJyNmxydENTNjlpUDRlY3h1OEJDeFVoelFm?=
 =?utf-8?B?ZnpCSzZDTVZtUEZ4NmRpUHBrWWlleVRTclltblpZdHdkUDU0elVUS0k4TWZa?=
 =?utf-8?B?bWVBVHFyUDhJdFBRNVUzbkZKZisrd01qTm9DdXNzenY4YnNQbjI2SnRkOGg1?=
 =?utf-8?B?UmJlSlFpcjQvVXpZc0ZIOXZyY0xnSCtIVGVvYVcvbzQwOEhxaVg5eVZoNXhT?=
 =?utf-8?B?U1ZHeVp4a1k3MHdHWTQxeFZpVkJ1RG1ZTkJMU015STR2ODJlNWNiaTJpdWhP?=
 =?utf-8?B?N1RjMUdyb2s3QjcyeFZQSDNJcmliS21DVXZEbzVpT2tSamFtWUlrVG0rKzdF?=
 =?utf-8?B?QkZMMVJjSmFMc09uMnZlOHZBT0JtVXN3cE1DQXUvcCtJVmdRemcvaTBOVE9D?=
 =?utf-8?B?WlFzRnJGNWI0TWdjd3N6cThPUEwxOHNMcWZvQndGdFZjNTFBUFVHRk1CemNR?=
 =?utf-8?B?QU1rM29DMW9HOTJSNHMvYmFxdENLa3hlaFpHRFdPYUg4NEhva3hFV1J3d2V4?=
 =?utf-8?B?c1NHUE52Rkl1RE1wanNRc2ZBMTNJVkIwd2I2K0pMSC9WejZGTnNURWJ5czNu?=
 =?utf-8?B?c0Z1a3lzajFPcmttKzZMS2lnbjFWNzlZb05LWC9LWVRLQ3F5Qkx3Vkp3YWJq?=
 =?utf-8?B?T2FSVWZUZmtjdjQ1NWkxNk0zaDM2UVZ5RVFSN01zTWNTaklzRzQyR0lDNEE4?=
 =?utf-8?B?VFUwc2orTXlMNE1UUnZXMUpBVFZWOTFYUFl1b3IraHBwSkNuV0JRamh2aFE0?=
 =?utf-8?B?N3Zib2dZRGtveS9ueGYzVUtHby9RU1lyZStEdjl1ZFdiQUlCSUhKYitsUGNH?=
 =?utf-8?B?Q3M5VWRscGVQaHdQN252dWFJVUV5eXRiYks1Q250elJSTWtOUHlNc2lzbG1R?=
 =?utf-8?B?TFgzMlNuSGNzajhMUjVVNTFsb2hEMTBDUi9kckVycWI4Q2pId2o1d0pEaERZ?=
 =?utf-8?B?a29XT3EzSC9wWEVxQXA4UGRncGhVMzhnUFYrNTZYWUxqd3NwTmhiUldkcFVs?=
 =?utf-8?B?di9lcjRRRU9wR2V4a1BMSWtzQ3QrVUFiMklaZEtYOW1xNUtvaGxGU0N0bWF2?=
 =?utf-8?B?YmJmZVNxNERUSFJFNTBiTUNWc2VqMUg5VFBVdWp1Uk9MOElWQTF1T1RPMW92?=
 =?utf-8?B?Rm5YcjA5TlJZbGlrYmVWKytYT3I1ZWpqaFY5Rkpqd2lrOUNnMk81bjA1eXg5?=
 =?utf-8?B?ZnIyZ0huZko2RG5JSytxQkVPTmhpMFd3Q1BzQjVCbE9iUGg1dWZleGlPNHlT?=
 =?utf-8?B?QjVPQSszMi9oeTJzWU1WM055SDU3THVrNm9xNTRKWDdKemRnMjJUTjVZZGZG?=
 =?utf-8?B?UEpkZGdOSHhqQzhVWjlBZUhubnBUZzluVkhZZXIyZFJkcXRiZkZ3MTFUbXRO?=
 =?utf-8?B?Q1BrMDRZQXdjNjk1Q0hGK3hPVGw2M2RwbjF1MXo0eHVGZW44cENJOVZNWmRD?=
 =?utf-8?B?cm1ETHpXNWdEK2JyMVNBcEJ3cndIb25MQ1BLYXl6UDlnTVZVTS9OWmp5cmYx?=
 =?utf-8?B?cHhQblZHR1E3SWNCeG85Ykd2QlYzWUZhQ1JBaWV5a09SV00zZmo4ZEIyMG1r?=
 =?utf-8?B?eGxUa3dmMGNYOHp4TXowaHU1OFhhQnU3ODVGNGk2NkN0ejh0NXFmenRtVVI5?=
 =?utf-8?B?YzRFd0c1NmYvdkRiS21JcGxWK3RxRFl4ZVppOFAyd04yZmswZUlZTXhCMCtr?=
 =?utf-8?B?T0dVdEt2a2JaM2ttczBWWFAvZUl6Q2RYbGVKb2RxcG1Yci9PVW9oRmJRbGJM?=
 =?utf-8?B?ZVpFT1E1eU92T1BlOUU0U3AzSlpWdlE0TkRYcjFLK3prS20vOFNsVjl5NWdG?=
 =?utf-8?B?VGg3RW05S3JGT3Ywc1Q0QWFhVzg3eU9ZNWRnemxOWmZxWWFhMHZnRmZVZXNH?=
 =?utf-8?B?Q3l6NCtRMlhNWksrN3ZpM2c5N3dwamkydjNiSmtyaFFEVXRDS0RwUExJRzdE?=
 =?utf-8?B?eXhGL3VVTGtMbjEydzJZWXF4RDFlcWNrYUVJcnRwUnFUZlpLR3k5TmYrSm5C?=
 =?utf-8?B?ZllBYkVTOXN5LzFMd0dVNFRBMnBBb3NBRUd4SFZuSElYZ1prRjhlS1VHNzQ0?=
 =?utf-8?B?dExSb0FwNVBTcWhaczVKeUE3OG9HL3JpcFUyZklsbE5GV1FWVFZWT3VyeTVC?=
 =?utf-8?B?dDV4NFdodXJoN2VTL1E3WTZkb3ZLQzJDNzVNbVR0N0Z4cnBJUXVmODAzY1lS?=
 =?utf-8?B?NTFDZzJDKzdSblpXMkxjM0NLSTNTd3dFZjU3YVllUmNFZyt1ZFZ5ZGhabjZM?=
 =?utf-8?B?a1ZiSGx6bFNTRitYaHlBU0lFNkcwdHFpVkl6VUQ2cUxMTTJkL1ZoWkhTME9r?=
 =?utf-8?B?RlZQRnF6V0JIeW8xL25abFE4WVluTEtGTjI5U044SG8xL2w5VFdEZ010OXpZ?=
 =?utf-8?Q?0NYf6exCvz+bvNu3weiXrfIE3gGstcJOGNNlEkWIkBiwj?=
X-MS-Exchange-AntiSpam-MessageData-1: KAuGGaRgiFyX0Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb7bbccc-cdd2-4584-3bfc-08de7b5120a9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:30.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7AknO4XpHh+b+zL47XVeFfSnARJRmOF2aSrR6dA8hziFscSR1Urc0xnzcmTQEflMnk9/6M4MLrVaQ8FHbbAVIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
Message-ID-Hash: C5VUG6BKWTHWRYJ3DVC6EIM5Y2AILAKW
X-Message-ID-Hash: C5VUG6BKWTHWRYJ3DVC6EIM5Y2AILAKW
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Zhi Wang <zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C5VUG6BKWTHWRYJ3DVC6EIM5Y2AILAKW/>
Archived-At: 
 <https://lore.freedesktop.org/20260306-cmdq-continuation-v6-6-cc7b629200ee@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 806b1e02715e..b41a866e24da 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -548,16 +548,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
 
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

