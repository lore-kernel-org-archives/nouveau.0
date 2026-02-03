Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECBFE8B370
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1F10E4D9;
	Tue,  3 Feb 2026 22:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uLi3VsYP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F405241BC7;
	Tue,  3 Feb 2026 22:39:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158364;
 b=YKWGxHuyNdouJIw2C71NQ76ofPp8OcZepAfFF2XtblrA5XAEHY1oVxuGzzL8fgB5LCfvL
 eB3llrLTakLSgweSM2Vg0Ez9/MYp/QsaUPciJjnJ1u/Do8yDPg1YD9COgZSFf7GGpJG0xBe
 4dnCpLnDl8ryyxVBPU5TbsBn9V+QLRwmmKMxrn94CIHdNTJrZ8dtUNffNfEE9A5+CmB2PdE
 9MNzh/+4QMzRBIV7KJ8r3kJMUxw7CP6hZk7aQUkv7o6jIGi/ICIJXvYfJCDWS95QJAYnxd/
 p8CaOuI5k3VWbE634v0M71vFKLOh4oLK/2yNBFg57SsshFZki53uii8R1ZuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158364; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bdtngLbZO09LGUqWTsozwdgXwqaQpbEN2nfOOe4tLBw=;
 b=WHQbFrvT2Bqe8VPnCyhi/SLoaAkSe8pBvIX58GMa6E6pBtsme4kkWU+yuKVACZXwaf3ra
 rQLmnAqVliCcJ0HTBTNasa3iNOUJA3hJVrrDd0g729gPapjgrxXedKra4YD0BMgiH4weUO4
 sHvEOOI4Tx+wenLAG+5jfpj4cUeY4sY+yUeQtz2FPUXcIZqiKEzGmKwyH/YTXT6kwxgjmKh
 DSkxxHWN7M8jnbUtkmQ/LuqLDev64LseYJK5SZN6NB5qDizyqSH/fikYtatoCNMkUmHkDmo
 4PWYEMMW2sC4/fModkhjo2NXmpQaKfjUIApoq7t5F/41aJLZy1pOjMYaUTBg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE17640B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:21 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012030.outbound.protection.outlook.com
 [40.107.200.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F11D410E288
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz79vs1OH01rLFs2YiUnXQWKohp6cpC8dFBDeKxgmSKJUvejPqMoiRm1bBYdZ1okV4ww754NgT7jtPGvoDurzoD88BCK84P9ntMNkXKL8Ps4iItzqn3AN1exKIySasPMAyyL7WJbvM8GmhWmc5i+YwIfUHEBsKD8qDql+Y0ZEBerRpkjwo+OCLig8SQZJOlZUPbuQXlpNHeC2dWQjVXY+jspdpY+SgTf5t09D8Z7azOg4wYevgUCYz/xNYTOrAIsWZ9NbPH3cQLQCXgB0ZyGZrOIrh4ajM1OidAAHNfah/26qP7XOc7xM+w4cOsVTJELXhiO5vA6jjsId5eaL2tf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdtngLbZO09LGUqWTsozwdgXwqaQpbEN2nfOOe4tLBw=;
 b=rnWPnrZKup/XNb0mNMsSRm9o7TjfthKKIZwfet3fUHRzsmkHSd7I/OTFPF64/2nbwdFG+mtYLPPyNG3c9pLUOs+O0Oe1gCSfdKjhJkXeGG3rmYh0dde3gav/IM9e+OVuhYBT1JRKQ3WODgwFpVU72WB694DDMz+U+1E3rT+TYW10KEbRKr6w2AbIKtHq9TXBXWop25YPqbn+FkEMVKVfe5Bo36z3QN7Bu8jOH60IBOYvzwqmWsdwTHDA+/V01qPBIBuRF+vFgLJJZr4UNwo+FWKeMAGQQHN/HmEQhjDNp1tPF9YkAHW8/W/o03kYqo8JYX6EXcd9pBucYL5l5Jvrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdtngLbZO09LGUqWTsozwdgXwqaQpbEN2nfOOe4tLBw=;
 b=uLi3VsYPEXvANiWDtWJdwqAjUyCrxdxsRw7irCGz58Vjzumo9pVP6LEGBD6gp8XMKZMCupdivwfvIf9XKOEH5pCZNs91dvNNL5dOrISd1BaEgbgXy4C/EbT6Q8trbRLvHtkNV2xOI0zFSxik31hwph3wwFNHQcwk2cJmndWAaiK7qAIxjmH8STvBFxSgPdZm+Qb1iTxVHiulqpuzqRtq1enna0R1q9Fl2RprLyAGvibYaK1zizgrj+B7XWQd2xqZAC44dd69t3bpqRnzBvUnB7prfhMV1QyF0FcCGqVlfDdLWvvhlSZn4pTkhpQs3jqQGCHnp/l5rn/sXwh89CF6MQ==
Received: from BN9PR03CA0808.namprd03.prod.outlook.com (2603:10b6:408:13f::33)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:48:34 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:13f:cafe::8f) by BN9PR03CA0808.outlook.office365.com
 (2603:10b6:408:13f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:08 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 1/7] rust: device: add device name method
Date: Tue, 3 Feb 2026 16:47:51 -0600
Message-ID: <20260203224757.871729-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203224757.871729-1-ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: d91b2e01-0d61-41a7-5600-08de63765b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dNTLELSg2QP3lN+M0ojRDeO7ZpwAnFt4+3P+p3Cvm3FK/vUL11rz7iUbSUq8?=
 =?us-ascii?Q?lKmpOroMSRlEBX3JTAMgx6mZUyn4EiroMlseYq8hxOjJKxdXx2RSLg8B108x?=
 =?us-ascii?Q?pb1oGey9sWBwpcIe+9SsDlaIhiLoj5b1DNLOfCjND4uyvBULkYFDV7lDVkdD?=
 =?us-ascii?Q?nqThDv6eNsUsPxovvDBMo8ss/aixtXFNK7x+O9LlLZmb6z3Ef2pvCL8+CBNp?=
 =?us-ascii?Q?xRag0J6dHI7xn5VIv3Xwc9nqcjiMbbu4RuokX3yOwEVNZX/EMr76r/scj4Kl?=
 =?us-ascii?Q?y56r4iaMyylpqhz7AQbIm4xFs0lvZnOVegofrwvQF1sT6QG3gVjd1gs+oyb9?=
 =?us-ascii?Q?6ffesmIoRltzrDzJ2BsjEeCqmBtOlm73xtvrz/yQQggcuGOumv6JILghuNgL?=
 =?us-ascii?Q?EU8S7EQDHepfv66nHv+NkMyI+aXPZQZ85c3qQRSop2JxX5h3eCAeOkeTMbfv?=
 =?us-ascii?Q?nutBvbg9VuAIePaADAQPSReN2ydCSbSWUnb08OwPetCFxvKQVQ9IHvguX3hA?=
 =?us-ascii?Q?+7HSiOXmkxQ8NRXpxDU047xs7HANRfMxryPsZAdG9dZCTzdt/Qf087zsXpx7?=
 =?us-ascii?Q?sxsrMc7htlGA4roJMxY0oBVaywvsTS7TcN5PUDTtV4sHjIIHg4npSJhCD7/B?=
 =?us-ascii?Q?MpCktWGwGoiyXhpVVMk8+DSQuEmE3BqniCwVSiiHRAE/uADK97556IGN5Es3?=
 =?us-ascii?Q?HCGvR3ThMnogbeZunoOwe50tQ8sFj+Y9VNbVCnC5Bue7Bu97Wubfg56+eWKs?=
 =?us-ascii?Q?i1pDtxHpJfjRJ9UiQUL6YJsw8EvAANQjYImty+utPn7/16f6cSjV450yU+R2?=
 =?us-ascii?Q?Jdt831729WqalPketuHjkfyixFT88ik4kPAEZ1a83L62+SeHdxczxTGzfyl6?=
 =?us-ascii?Q?rrYCta95OvU2+ON/aSG2J5vLsq/rT5RQutwmsTqU1ftdwj0bHiqXaLpDQPrq?=
 =?us-ascii?Q?PHWD/YRf+7oivXKVnkGku/71uqW7CWZIfGkhUn+nhNpYVrEIEhvFj2jX5ttk?=
 =?us-ascii?Q?wD52Pd/cRgtF8CABmu1Uom7vlnBgVrq8a1NbiIui0BvXR0k9lATJ7RYx1YsD?=
 =?us-ascii?Q?ObsU4PaNlFe4kXwKeZhHDwOCScvtQcXXLjNyS5CMZMGyxBfANf2gvoVs9AIf?=
 =?us-ascii?Q?0Qg22fyi/b82ltXuLBC8ePh69w7QqWo6s0Y5f6Ioc0NnksCchv8Dr+Z0Ky+O?=
 =?us-ascii?Q?O7f/MWsw70q+7ZSSlwXdECVaYQP89/yFQSZ7hL0cv0wShA8MBO/xEt36V2c/?=
 =?us-ascii?Q?AgoCQOXnuRuJYke1gc3A4esCsElUpYUtYy82bQV1zAF6aXsgGd1lt5Ldj7xg?=
 =?us-ascii?Q?+ZiyHSjSxQDOPlBBg8AnALurD8pRLarHaOnsGqmg92vlIlGvqvPuU4m98j02?=
 =?us-ascii?Q?KqCJ/5Tb6K3H8efsMYmavta34Kik4Pk01SdB0uk10WCCF8HZwOVdpuu8Yuis?=
 =?us-ascii?Q?5GzBLKlcGwmwxINC3a3N09V5vyNYin4XLQ6KKMAUqijRsXEYJlzvLrLWPcOy?=
 =?us-ascii?Q?fgsxXiwJ+Bgxbo51mf7thAdCmG9jenlMQSsNkvHSriKgmUEuCgtk4ljtgmet?=
 =?us-ascii?Q?NF41+YBoyyaiGjMhRVq2kKTFPbbgUxeIG2J1DYjNH5iniYSrYNp6VKW7/8uR?=
 =?us-ascii?Q?7G6vbl+rbITJuN7UnMEJekhiVq6Rtj0UWd6Wf+VtfV1Km4EMu80WFHH1M0CM?=
 =?us-ascii?Q?CXqC2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Flu7LpvB7RjMPLX08spJzyRu79uFDC1KAWtPbOUu/0VyjOOx+7tWP7mh6UFZLz3CIFRHSuqUodCIWX0Lc9gwtZJaxUySBpUku297epVbDx7dStVO9cEetnVOqOt6sOBuFP9+0Jo2sOoEd/CxcuGHKBTTWOEXAbs57sr/uUg+73zdBg5/yNvfAD9xApBfZoeV0Em2eRzLmkrLgu/5b45pN5nLl8yBiyUa/odykehGNpXt+btgTJTRhKV6aC/RvNxcp3FVcLMQ3GuARWfQL9V4+Uw2J3+H7NvIvPzymCg7oPRAmghG2MklcNse9aoYQadW4eOFWYLyHWj+yuNEuh2MMpvJ+X6FYWoZ81+xnGSoo9an9xynpv2KvlLHDYnFaYaXtkjMpirrG7F6NA50665XmAd01xusWv7tqS06yIKKb6mYduPFB0B4T60foNUhBkgX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:32.5251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d91b2e01-0d61-41a7-5600-08de63765b96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160
Message-ID-Hash: PGUUWSASKKXSEZEYZSYTBMDTVPEDUYBT
X-Message-ID-Hash: PGUUWSASKKXSEZEYZSYTBMDTVPEDUYBT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PGUUWSASKKXSEZEYZSYTBMDTVPEDUYBT/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedf..ae02c199b11a 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+__rust_helper const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f40..69665d275e24 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -482,6 +482,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.52.0

