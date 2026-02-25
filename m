Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A16FD45E2
	for <nouveau@archiver.kernel.org>; Wed, 25 Feb 2026 19:18:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19CF910E80C;
	Wed, 25 Feb 2026 19:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uppp+0Hb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 00C49448B9;
	Wed, 25 Feb 2026 19:08:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772046521;
 b=dj9E+Fj1fRa8FgNUgxTzGD6qppm9rosLTU2mV4qocWmudMsbZsoDiSSGGRlFzZLUTLDcr
 NzrJCRUVslMqRETTcvoZ/PSrAAPEOkGHO59+okM/LbWduzPnjni983gynfJEvw8yU4xG9xJ
 1w5X6b+Ze8g9YsHih6axMN38zJtUDBF6HWLkjO1yKm5upIQnDNiT7ZBTZAQDbin4GPpcoxY
 mFip1CFMVC1uuD60r9phu0jIcN9gM4CX9vxu+xtHn2MPx5s/Y278V4DSIx4D87ub0YKbVfQ
 kKVXoKxRxvzGD8+AW7Jhq/jEGtnwRGbCDLnhsYSuEZkWzbCIwpJ/uXhI4WpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772046521; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NyzL/fsHbv2ZMpapjypAwpDqKVt9wI2RRIACGYLc7rs=;
 b=WivbEaYPqEKbX6CJoCuw3i0x9fOK8UFuItUC3z3apE9mmSgd7JF8VqGEkXLW5Zn6uXl3Z
 mQhf5FXJxX68lhLsPrxvWgX3gpqhw5YpRpoQ7UWFbSMn7G35AB1wG9SWlSqiCKEHlXMWzob
 +2aSO2NdX4GNy2q71NT6w++e+ece2ToZcz9HkO6x6gaaiENgle7tVKM/z6FM0sE+TeWFUWq
 cJzFekZcnK+G89UGIcW+3PV3g4H6alRctmVVnxyhLh2Pcna+kigbRYK9eemrhd913ORKy2e
 jdiYwipBIejWFFZEeFQHREJexLMiinaOPd4PFrJzc5RLaIaWVwmuPBw1E+ug==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3D84543716
	for <nouveau@lists.freedesktop.org>; Wed, 25 Feb 2026 19:08:40 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E80C310E7D6;
	Wed, 25 Feb 2026 19:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9hGAKhl3pkW2ubl3jjYrfU9JCiAFmQBSyMvzGZ/OVpkXLNSG+nnDTJMEC5PHGBNz66UBxxxSyyEddZwwZWd2AiAzQRcMz7rFrOWo6fumyfG5Sr7ru8eMmyzn6LaYjIlj7eEKKNy9ph8g/DykVLdPglLNVJ5KAGBReegrcJECYfsUPmYy/r93v7apJYQOq+LzW6liuWErAmnsxxkiSTlXbuKrCHKBNjN92V5yBl83sRVuZiWhRvH10xfWZ8osfHqP0AXiDxWpmP1HXb30qnqgtq7z4s4patuzFA3SDn87zVWlk1b0IxglSZlRANVb9nFC7mIsmGrKm3ZsG0ZmyYzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyzL/fsHbv2ZMpapjypAwpDqKVt9wI2RRIACGYLc7rs=;
 b=KojfHfmNVWQqKncuRV9O74EPWfr/hWNlSXUq+e37WjE70f6GkeKieeroCCN2xVLAEy1CPQIPN8aB8bQXealckpmopW5N9h0ZuL8U+pGL1cE5D3qDmNLpXn6iWEdAijxNKj6M6QBmR8nX3oFoxWLgjP2lZPZh52Z02/oPnR4GZDzMENWHEbcWCYuS6aPSeOmAgxIJxS3QzhwQdiUG0tNPTvZh38KETqc0gF5+C+VoeaVJBqvSsgKvguYMdVpflcEuCPDXULbdnXefTsyUSGsybj9iyiubXIezPB8K5KIIvEDt5lMnPRI7h5V1fNkIC+LRjhL6fkQI1S1oce9pncLJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyzL/fsHbv2ZMpapjypAwpDqKVt9wI2RRIACGYLc7rs=;
 b=Uppp+0HbVL/EVasMADGjJ9y41hK2UXxP7/zCQD1u92NAozDuqjMDVcI/PP2P99lx6FdRoJfhN262tkZNDQYDzQx1G2r48shNzl7rNKWGOVj7Ty34DpJRLdjBnuJTxAZ+5gNtepp5g4Qxy5iStrZYQtN5lGLV+sKoXO+IrEYnnEQdzSiXrxGcMctq5Hsddg982cZnyl/fHNpoe9pKZFkaIdJ0GSXzhGC/cO9EAgQAFGasizguWoiNvrV5GvFu5Kjs7hg/dHwO6HI5lZbR4E+adM0bFK3X5ySMye6L8vq/Uy9P+uRgwVwKYMo+uR85RQrvka210guUwtRDAk8fbmJNcw==
Received: from SJ0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:2c0::33)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 19:18:39 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::da) by SJ0PR13CA0028.outlook.office365.com
 (2603:10b6:a03:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 19:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:18:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:18:24 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:18:23 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 11:18:16 -0800
Date: Wed, 25 Feb 2026 21:18:10 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH v2 0/9] gpu: nova-core: gsp: add continuation record
 support
Message-ID: <20260225211810.3142ccd7@inno-dell>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|IA1PR12MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff17ca3-e42b-4ef9-706d-08de74a2ae84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	24UuwQwqhXw4ROK9AsVM6ySYBHm5U1oTcB1nBHWjWRTAwbPq91u3jgwEaqe4+gyT5FfR3JgfZFgCALlYg9pzz9y+ctJqE+ZuXG7l1/Y24qjEJxFFDj2CjvxQe6MAXl+C4gQpE4lDlH0agHodMkoMaI32LUj4HiG5R1muDYvfjI9mWDyomfjrp0c1mTZMU4FKmcBmdc5QZhPN6bcRCWYfBTzXeWDDE0/ILSFrg69dItPRPEZfcmuXqF+5m1BUd0260mGZvNlCyo3BLtXDOdndspLGKscudSttvkfki/t5q5LCFWet7/W7icX7F7egJDqTYJNEfNdHSgHNjLgLD7+NWPyZox15xV1nTYNMfHCkbmVz9+EhDPhBflDNm/Ana4k3Au835YzQq0FMTyurdQy+Go8ZUrZFLYPTIJY68PWUDlhF1p1ovkRbfPjvlxiPBl8hYSXeOB7c3d1oS7xfF/wKke618dP7LksureoZky8E1ZOzKTdLzcaAXt9GY3PnvLN9r/y5AWNf+pvoxv/NbXgtrJhC32VthUnWaZLGp7g4QPbIcucugav4mLOKL9xdQDL/3s+4yfZsU9JUWwJLt3Lj4zzWWasSOptgOZngou7AWzLVSEmKG3yq8XUM1PJJFjtwDg6CMu3zou+RXUK0RZbYYEJoIZ1NNlmeCJMuXgNlyCzKOLQXT5n/0Y1E0388HHIy2zU9uoU22I5tj2Q57AqevJAYI8HiliKu/FC5wQkoyW73XTmjYgYCDgQkFAVrQ52/JOymGkYumtsSKQ/Y196rmKfKcvLQNoKA4AdhW+dMfHuWENDAfvSXNgU31heXBF1E20sNKcO75C7pNa2EA2xyMA==
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5pLvKu5nj4LYK9eDzx1Y94qhduApQO0wz/t2H9soIElXjrxFupzOyX4pcgumqSRn7OY6VK+3EZsTFsj4x6pS/zASRtLo6GUYF6JhEUBcyIGlb4h5updKj6GG3CWTQBZUiJGvqb4ksvcGmskSS4oMfY3BfUJthEsUWCZNDmR0omRMZW6OuWnUlyp3Ki1Y1ZJ1l/7E3bvRXFT/XO4qol/dp8jDLCrbCk22ijwNE6Z53NyjhfRNY20Zgjwcw7gLkT0l6mCPB2Dwze0EGOh/mx3CDhF0AIZ1N7K4ncTyZvBSTZnQb4PWPzo59TtVOygsfslDwFJe15k8pE82l6/bC9j74J0VqIvXL9VqeWByGoD2O7RBsJmMEG7K5jJnj4MmpQXdvWFFNavG1441P2a1MbNFgPscN2pSmI/mIK2S05pS7OBe573+a8qp1LTWNJH//T56
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:18:39.4360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ff17ca3-e42b-4ef9-706d-08de74a2ae84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524
Message-ID-Hash: 3ZYNEF652FAAX3QYFPFPRB74ZCV4QART
X-Message-ID-Hash: 3ZYNEF652FAAX3QYFPFPRB74ZCV4QART
X-MailFrom: zhiw@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ZYNEF652FAAX3QYFPFPRB74ZCV4QART/>
Archived-At: <https://lore.freedesktop.org/20260225211810.3142ccd7@inno-dell/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 19 Feb 2026 16:30:49 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Tested-by: Zhi Wang <zhiw@nvidia.com>

> GSP commands over 16 pages need to be sent using "continuation
> records" which essentially means splitting the payload over multiple
> commands.
> 
> This series adds a command type `ContinuationRecord` which just writes
> its header and whatever payload it is given. It also adds types
> `SplitState` and `SplitCommand` which support splitting a large RPC
> into smaller ones while transparently letting regular sized RPCs be
> sent without extra copies.
> 
> The send pathway uses `SplitState` to send all commands, but if
> the command fits into 16 pages, it still writes directly into the
> command queue. If it is larger than 16 pages and needs continuation
> records, it writes into a staging buffer, so there is one copy.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> Changes in v2:
> - Added doccoments
> - Renamed driver_bytes_available_to_write to driver_write_area_size
> - allocate_command_with_timeout merged allocate_command with timeout
> parameter
> - Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
> - Changed oversized command error from EIO to EMSGSIZE
> - Added EMSGSIZE to kernel/error.rs
> - Split WrappingCommand functionality into SplitState + SplitCommand
> enum
> - Made max_size a const (MAX_CMD_SIZE)
> - Removed send_continuation_record + added comment for type inference
> - send_single_command now consumes the command
> - Extracted command_size + used in SplitState 
> - Link to v1:
> https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com
> 
> ---
> Eliot Courtney (9):
>       gpu: nova-core: gsp: sort MsgFunction variants alphabetically
>       gpu: nova-core: gsp: add mechanism to wait for space on command
> queue rust: add EMSGSIZE error code
>       gpu: nova-core: gsp: add checking oversized commands
>       gpu: nova-core: gsp: clarify invariant on command queue
>       gpu: nova-core: gsp: unconditionally call variable payload
> handling gpu: nova-core: gsp: add command_size helper
>       gpu: nova-core: gsp: support large RPCs via continuation record
>       gpu: nova-core: gsp: add tests for SplitState
> 
>  drivers/gpu/nova-core/gsp/cmdq.rs                 | 118 +++++++---
>  drivers/gpu/nova-core/gsp/commands.rs             | 256
> +++++++++++++++++++++- drivers/gpu/nova-core/gsp/fw.rs
>    | 106 +++++---- drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
> |   1 + rust/kernel/error.rs                              |   1 +
>  5 files changed, 408 insertions(+), 74 deletions(-)
> ---
> base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
> change-id: 20260203-cmdq-continuation-b99f3d5966c3
> 
> Best regards,

