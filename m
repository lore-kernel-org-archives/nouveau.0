Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E1E9B36E
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 11:42:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF9CF10E4A7;
	Mon,  2 Mar 2026 11:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uNMavztD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7EDD044D45;
	Mon,  2 Mar 2026 11:32:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772451160;
 b=FhaSEUOfmqhFwZFNpaz5O6HmGlZI/gwP60kkBUigl2s+3zjdQ5yqJvEYODWP5aZDgEo2+
 79OGD0OW2Ufl2jRYsroYGgdUEEE331nP7O6ecGZzON3BMhth5hXXLHu2Yv8auB4MX7cKdB9
 LJjdCGQyD5bbg2M17EUYteCQe75trPfo5MeuUcldONxjGPKmtMLj2mD0+sqV4CiixWGWeJ6
 6LcIeiHvBChcMU8E6i1FvfTl9RfJGasuIjoayqs6xYS7+wxI4UUfigb/pqoeKDPBP3b4KAc
 /ZeEwxwug7ollTzmiLoE//7IDUQe3hhgNiJjIjUEVkQDxjyHNUfx7UafR9SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772451160; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yLnBNSG3LZd9hKsFkZruHcQsngzYJOAs65QeLA9FC/E=;
 b=Sbvai2HYuxsXX6huen5cqumWqR3EiY+h+/xEyDw5y4hxpq4wIQp6+Krs9CM5DKpK4yrsd
 swQBRxBJjV9yjQUDPZNXPMjv65XOXRKYnWhgsQ/hu8O6BpiYBYGw/As2rX7jQTFlXsBUXUc
 315HiE5ufqkO5KoL95BxunCHfKqvHPf5Qd1x5/LOnNHprvEFkKJGGpLmsAwGOHbmVF60DlN
 horrh3rPr+DV61z7nvMrgEDtoLRZrygNiVt6MLRjH7mQY3WY9CUtNe92NqU+XdsS6uKLpPX
 h0iSd418mIj+63O5Xi2XlHa3qvI07jJG8S7npv6gZJPxrDZl+WTfC1SdVfRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B1B3740368
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 11:32:37 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012067.outbound.protection.outlook.com
 [40.93.195.67])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F040910E4A6;
	Mon,  2 Mar 2026 11:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML0XW0mZ1CspFOPCFnDaUahE53CMnBHUfWH1/6BHBT5QpiIqcK+yhfF8duM3n4gVOXpkNSQcvhbnXuLt3mmJFbr9c+l7X6mHlfD3ICqUQ1kifIDoriFemMvS7nt/5c0s/JhaM2J614Q29zbUOvu96ZYwH6ddLoO5Gj8MdCdpZyzIllFgks82pTUrUa9/Fc4A4jYpRyWGDusnjS6wOA+VczHqqsW+2ZLhYZ2jKoZIx5vHgGfWSymAH+fMiTO8t1+Fz5TWSIFxE2GFS+ILTwWedzZLmsTjDSR4wFUQrzRBq/KDOuZQtgT/uiqrYVAgmUMvf7/fnqaeLzNZ1mKJq+5Yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLnBNSG3LZd9hKsFkZruHcQsngzYJOAs65QeLA9FC/E=;
 b=jp4V/jk2POUma1LenuAQIrDDyt8LOMt2iqr4s+xid8/htYsgMD5XsCDLkV+Y6M/HvCa8BmKBzLVEj5p5ye67TH7G4J8WysDp/el8pX4PDFNxjPFE3MJz7MZC2/ovZir0Bs6g8yxgx1Ju8Z2cQbl0NalW+ETXRCJwoD0pVRM5cQrqOIv0hHRbuzpRvoV1FtfXx8z4jYw+C8FeTLIjh0NS8nf8OQwFqDMwP6lyMQwBif+VwWJ3i3FBx3hGiHAPYnJnHBuLi1Er2QRlILq0bxz8CAO+iZr+LPsdsHkQxKQx1QxoL5LqBS0ArQW9otXc+1E6sJmotG9GFpdRS2vI8YC9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnBNSG3LZd9hKsFkZruHcQsngzYJOAs65QeLA9FC/E=;
 b=uNMavztD8LeCKhaRA70LLv/FB4Lf2zjLjEFkAWFesfaIWlQtUazGDzKFv0Pq7kA8+ltA8r0NvKqA5o5/gK4pQrwmfe3sbpLJ4cBUt2R5VNhrL9D2y6R65E0AorCLoaePfcTWx8kTtr2v+Hs5qiTvkqoc8NT8lu4oGZDPLmMHZJM4A4Kz0TKaIZVVNIFohL5xc636YkR6qBVAlyflG47+j4/z4kOZQ0/78wea8QOI14qwgIqiniD3mVRqTb76ubj+Zx8wxlEwiTyYugVXsEDFH8zcl9DUJudDDfixVg+qLm+0gblLgBa7dg76Niy8e9tKAufDTfOybMsrOYNmm0Ohwg==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:42:50 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:42:50 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:26 +0900
Subject: [PATCH v4 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 0739b6d0-1d31-4c96-7973-08de7850d508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: 
	YzOB3uQNHk2KE7SHlELlMLs45gaCO3eB5VncZVhlQZIkagZX7Z0fj1lT3WW/ceQfd+nUgnEVVkmsQaEJ2ihy6V3Z8VZSuFdzL7Rzy6lrfXvHDgRv0mNLIiwZ2lCGZDZuWLeK8oHcYPJ++HFR45t7RBE+JTmS/U9efcEWAZ1l9TiwtnoNCuVlduMLl13NI2r/mkcT3M2cfHSqwocuhvSPW5bRDHaXe3NZbm6vwanmpNB2g4WXWlNqm3ViuIWQBHQpvN1W+YBjKejWAHnKb56ZCbccZuS7ph/3Uy5+R16qUZIqO5bKDiQe4YNhrCBfmbwxgQiwoB2cavOuXWT27if3HgJKJM46DOdkq5THo+pve7x4LOt29ngQ1vDtQOKPUhTfc3DQ2HmOJWTDbFex4WLI8XDGywVz3pSHN5gFR8i+0nrGp4SWZKJtrxnALRSbYnRduEGFBTDbZ3WThTGQRjpZBLZC3oC7L4NE35/LDPQ5QfnngEqf6X5o6RChguPHzzj5NNbnWHE2KYBT0aHdIaA7QEiMuCi8TeMJNM9UctEwETKsCUOxXM2vAW3fm1Jy2bC+Zck+9tOXps1Jlcnozc0+d5fsl/jzFbJM+4K4Uqc2E/bR0zOtECaNK5M7TeSdybh1u41Qb2rU4DsfgTkFLeczssqveddfF2LYEMeMj18kDZa+vDcuqPCCVP+b27fLlcqqib7tJkO7f1Yhza4w0V5PpdbH1rJE98bS3+KgMIQDDDBw/A1bgDgdNKXiH+q/EFyD+4TY3TuEpKKOuPlJnds6nA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M09BbGJRVUNyVjYxWTIrNWpyNEFON1pQWk1hWmZ5aDFxVUdGODlCclkxZ1M3?=
 =?utf-8?B?Zk5SN3pJa0RiS0NoOU9tZUtWV3k5WEJXY2cvTVBMQTdncTZhZmRRTFl1S28v?=
 =?utf-8?B?NXM3VnphLzdQNmlWYmRrVmtNYm12V3hFUGVHK0ljUG1pRVgrQ0JhR3R1Q1Yw?=
 =?utf-8?B?OTVaMTQyWjJWRUhmTzVSM25zZ3BnODlKUXJoZ2pYbzhJdnBUUGE0Zm9vU0lm?=
 =?utf-8?B?YmI1eE5OeGY0VkRRWjc1ckNMWjhpOTBqYjdnbklsVlZuN2pneGxQbTFwTkx2?=
 =?utf-8?B?OWIzRmhMSmFjZ1hZTWNHbW1wOCtUQnRTVGo4dExJd3JmVlRsTXV5NzlmNHgw?=
 =?utf-8?B?QXhhakt5eHVLMWIydm9OUVYzdXhlTndaOGlwU1ZQMm1YdlFKaDJmQlVBaHJN?=
 =?utf-8?B?QTdnVHRVL0FpMUEwcUFBOE5SOUg2d20wSThEMXEzU0FPcThBeThIbThDRThY?=
 =?utf-8?B?eW9lVmszbjhsMVByS2hBR1AxZTZaayt6WS9vdXNKbEN0VWVWVXlhNForSFFq?=
 =?utf-8?B?alc5YjNkeVF4TzFwdTR3THhJeUNtSFF3SWRRelNiKzBTOEhoRzJCNC9Fai92?=
 =?utf-8?B?SnZJVlRkUkM3TXlQVmhGZ0hCQnlwY0lMUGpSVG1CdURSbjJJSk42Y0VPY2U0?=
 =?utf-8?B?bW5PN0svcVM0ZGlqYk5yVUd3NE82dnFFbi80Sm5tYWtnRy9jbmIxVlIrTGFY?=
 =?utf-8?B?c2xoNHZweFdKSU9LazQxaXNqS25rNzN0VUgxVlNlc2gwbDNjOUYxcXlHRDd3?=
 =?utf-8?B?MnhrbXZOMXV1b1AwZGRCYUNKR0JCTk9SakdnNFg4TVRrMEp0ZGRiOTEvRHE0?=
 =?utf-8?B?QUQ1eXJ1NTdGZmVISEpadzZXNnVWNEFKTk5xeWxDelEyTUJvMUMzMUZmbERV?=
 =?utf-8?B?NUFDOHpheTdoM1F0cVhVZHVqN1ZMS3N2OG5DNkN4cFV0aVJyQ29RVEU1VlA0?=
 =?utf-8?B?N2J2OC8yTDJlemcrRUtlSDhSN3l5a3pQNi9kVEpvdkpQeWpIeGl0VXpMZ0kz?=
 =?utf-8?B?Uk5wM3NaN3VFYWtsSkUzakk4S0NFQ0NRS0tSSnVXOHFyWUluUHFpN3hjTkx3?=
 =?utf-8?B?WEFoS25FOUsxa2pFWDAraEx0WC9OSkxrNmhjMXVrSUlIVnBTZ1BLSHVrSFZV?=
 =?utf-8?B?OFVkakRrNlBCdEs4WXFIbmxhNkdZc3c5TE15MHN3Z3BTYWxJRHdWUEY2R05r?=
 =?utf-8?B?RmJMR2ZxbzRXSGcwRk9aRng3dU5ZWmw2RmdtdXhFcFJERC96NE5OeXNUalQ3?=
 =?utf-8?B?dXVnVUQ4VXUvTlFJMnpHcjVYYzNOa0l2eUtVUmlmVlovUTlGTjBwbUdQWkNB?=
 =?utf-8?B?MThKTFZTc1hkNUFBZFdySXhadlNTVjdlWmcyTFNwZE1KYXpkbzdoS0RrSWF0?=
 =?utf-8?B?SURneEdIYjZHTUF3MmZXQzN5UTcyQ2lPYVNRcjA1d0M1VmdlTk03VXBCUU9M?=
 =?utf-8?B?MW1Id1JCMVc4cEpGTnlRajgrY2N3TnJOM09WaWlIVmQzMlJheW82bjBLbHJE?=
 =?utf-8?B?Q25qVGpPVDRuVHpaUkgwcVkyUWJmaldvVjd5SHc5aWJ0WWVpeFNJNDQxK3Vy?=
 =?utf-8?B?bHNMQkpUbVBCU3FkNHhYZUxJNTE5aVZmN2U2d1NteklvQXlEZWcxSjNyVTBZ?=
 =?utf-8?B?U0dCRnp5RVBmZVlFSjhZYWdpdDVUakJnWXVQWUk2eDM5eEpGbGtLaGhGSkRD?=
 =?utf-8?B?REZPU1c2R1pCZTEyU2VKQXpRRjE5Sld6RndUbWNhRm9uNEhJOEo5cU1ubTR0?=
 =?utf-8?B?am5FRzk5eU9lTmEvMG9EMVVGVUQ1bDFGd280YkNRZ2RBZWNuaDdOYjJ3VUFt?=
 =?utf-8?B?TkF2RFhKbGNoQVFsR25GV3JoVDNWcEFVTFVzMlIzayszeFhGc2orekgxcUtm?=
 =?utf-8?B?VFZ2VzlteHV4a0x5RmJ1WGh1SnhzNWF3dXpnRlp3TGkvcjZuc2RSRXlRU1lU?=
 =?utf-8?B?RGpVQ0tJdllWNHZTZmN4MWhqMGtLOEtGVGl0bEQ2Y1dzQmNYQjgzcldtOUJ2?=
 =?utf-8?B?QTlGRFplbHdnN0dXRjluVlM5WndBTTVNRnp4U0tNRTNLR016eEJVM0tSelZp?=
 =?utf-8?B?UFowTUJOeGdlK1dQem80bStET09QQ1N1c29QS2UxYWZpakRubkJxQWNsT1Yw?=
 =?utf-8?B?N1AwbUJNcUhFMEgyaVBscE5pVHZLSGtIcDJDeHM3a2NGYUpsZk0vWTZEMGtm?=
 =?utf-8?B?VmhuU1EwUXhPczNKYmU4cXBUQ3pSVXJJY2ZIdTVRck9vZlExOER6K2plU2E1?=
 =?utf-8?B?bGt6bTBwQXI3TTZMeUR6em9HZ3o1alZ5U3FKb25hbU1kdFh2YjNWeTI0YjRU?=
 =?utf-8?B?SHI1UUZoendubmlDdDlVVmhYMjZXYkZCNzlpcnB4NllkWlZsdHFBM0lYUkgx?=
 =?utf-8?Q?vtTk4r2zYsdjX44VXXLEOI4fIaAxZ0H0S+h3n/hdLsMRi?=
X-MS-Exchange-AntiSpam-MessageData-1: QarF42tS3PijaQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0739b6d0-1d31-4c96-7973-08de7850d508
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:42:50.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 54Fcogc9yIrf0bPgwIzVLFb4m9eyie39iMHZWmHpxyms+qa2IaORAbzyVdXxiU95m5ld2omKf0Z4LcOIsMtnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
Message-ID-Hash: 5X7FOSZXCTDMWKZX42XGFPOBY7FFUOJE
X-Message-ID-Hash: 5X7FOSZXCTDMWKZX42XGFPOBY7FFUOJE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5X7FOSZXCTDMWKZX42XGFPOBY7FFUOJE/>
Archived-At: 
 <https://lore.freedesktop.org/20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a timeout to `allocate_command` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

This lets `send_command` wait for space to free up in the command queue.
This is required to support continuation records which can fill up the
queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..efbbc89f4d8a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -250,6 +250,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -281,15 +294,22 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-    /// bytes.
+    /// bytes, waiting for space to become available based on the provided timeout.
     ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_write_area_size()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::ZERO,
+            timeout,
+        )?;
+
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
@@ -298,13 +318,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // If the GSP is still processing previous messages the shared region
-        // may be full in which case we will have to retry once the GSP has
-        // processed the existing commands.
-        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
-            return Err(EAGAIN);
-        }
-
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
@@ -497,7 +510,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -509,7 +522,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Error: From<M::InitError>,
     {
         let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let dst = self
+            .gsp_mem
+            .allocate_command(command_size, Delta::from_secs(1))?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

