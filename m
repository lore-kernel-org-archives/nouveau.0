Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923B8E8B376
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 60CB610E6EB;
	Tue,  3 Feb 2026 22:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TQxYdmXU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F280341B0A;
	Tue,  3 Feb 2026 22:39:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158367;
 b=KfcH7csvTNsQCRKSXgCNXS8rLHgALCvoysdV7owDIoJu912CqLKY7z9+tPFrBR3N1nCkL
 61qGRMiEJz5296/LNU6a4RXeCRgyeVoFwj76RmZ2h070iHwrP8ANP8+igwqnTYZcW/W19Fz
 7XAXYb+7P090DyZMho5odElFa8nVBm0GHmwc2zlpMcrXpRyR4NlGUTp6DL5p3kgooGGnjBO
 6pWHS7Tek3dEiFx+84MemsOWZa1dFH3EzeSknVWzPZlv316Z7rxB5xK/8jbYPdAgnmqN3Ck
 07XNQPXNO0DvzQN726Eys1H51Wn2+cVtoqUypV4Qm5MsBHgs7vrmJk6VTe4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158367; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LNRxmwf/6/HPLmQV33fbJLBjdsix9LUVKmMuFyrceMo=;
 b=nhvv06q66YUdrS7U5bUHOnn90KYeOBSIKmTW3iDua7zt5ON7JiJPt6erkByXCuvFUWNtM
 nIPb/tNmXEoHzsToloFIArFJVTvLrVFpZ/3jH2+tPAjMcbWO15z9k1oCnsTRIoUyR/7EAkU
 VL2MvqIuRMH8KYkKKENLUpJqwd/eoRrkVbh/xIZnhEDSIWaUWcUaAZYb7XmwiBUfM8C/+cj
 UFS9S+vCWwjKgQVDVPVXWqJXtfhLWb1XlhiPq45AQqNT+drV4AwEEGAMbKDYG6Vua5QikMg
 XZEupiXSCe3WHHabOkmWyrxwatcHy2rLqaliQVwwaDYHA0JSdfWFzo30pz3g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 50AC740B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:24 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9910E29A
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSb+2TrQ+JtZj8r2+r2GIeHvmU0YkIlvATM3fRuvRpXn5gVAa0qKMrQuB1MWEtNxyB5Yg+h5RSQZnn6RvQKYOYQeSTmuFLUDiJV+atFkFVBgW7y364LqVwKTi//JBl5i9SxmM4wwnKNbGvCOUMIstk5CukHjjrfdmJclBsN8Wx0ot1O5RDcjg3t8Tnw+eBBvV72y0ICZUKdDFV0hhIgtwM8/Lx7TTcXHOu0JSA6Xir91N9PAtxc03VqfOirtCPAmVKUeJq9szY7BeG68KHj+cqa4GL/w0jtfLN5j8snKfQLx8UaXxCmhD9EBmK0uX524na6KAaJZ4iR15DgLjDRVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNRxmwf/6/HPLmQV33fbJLBjdsix9LUVKmMuFyrceMo=;
 b=nopgA3xqbY693N+fV7QFQgQ/4NUd2FrJOqGPb9o4/r6nErgMngiFEr/pXUksXvgs9raCndRWw3fykQcfRO5Rwak/EnuK0zLyvgZBHfuFKJSe5tR1pWpfm98xuzTOSnlrr/Ygt/L0Hox2imVZE5zsVhwv71crQUYLvTgca9m+JeQ7X+0wEPWu9RWQgO56MzycVYoCpuVKDi0s57h2Tv6Uf6qy9CKrtRg9lhlTtPiFGH/1wWY0acqlBQyo37mDJ3QuYquA0LvN3a5L/XLyXyWhGyyog+57f4ZqwZU2R9CYUSXFgQIZJ1Xjs5O9xmTItofEQ8aSkr0pgR7O+mwpnKRALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNRxmwf/6/HPLmQV33fbJLBjdsix9LUVKmMuFyrceMo=;
 b=TQxYdmXUtOvxkgb9GiqZDHAUibxgzwgYrN7UrrpeMiT5cJVqddIf0k33CAitXihH8xOp+cMMlzTP1NqWX64v2CpCUQZ1cq1fWDsTFQUweaROorMqenlDwz6PP0zSyl7HAoLZI4c2Wn3zHRAyp2eDaac2FfxQ/Ucd3ft2x/uh31aQ/GtY4U9UTih/aJzMH9iF4vELU4h0yeeC92GwA8E4GJoZizzGhFL8tYQTi4W4ngV/N17glIvUtS+JP7aI9ISGc/AUcBtETt8sIrf49pOLWnd+Fb1D+DJgoSY+aeegHC6YaMPBRE7LYnKBYIEjN0MI573htzPDC0oTyvAl2Bb2kw==
Received: from BN9PR03CA0161.namprd03.prod.outlook.com (2603:10b6:408:f4::16)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 22:48:35 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::d) by BN9PR03CA0161.outlook.office365.com
 (2603:10b6:408:f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 22:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:10 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:09 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
Date: Tue, 3 Feb 2026 16:47:53 -0600
Message-ID: <20260203224757.871729-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 16603a45-f843-48cb-cfb3-08de63765cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CNuzxGbfOucbtDFTT+A9poiwQzGOgVDE9akepC1g24z5NGk0VDg6LJIW4xG2?=
 =?us-ascii?Q?DOl6EjQGJcQgujZnUbNnLixi/G1fZX1xj3EnYWKBqNxDePsPOup3xoVcE/L3?=
 =?us-ascii?Q?nNrr4lvMSTE1krblI+dFUDue8p/sPcSTrgzha1bB7XPHU6qiTX7aGhd9nxLL?=
 =?us-ascii?Q?qgX6qR7RKKaJS17E3rjq3JiGR4TCag1suQobmwdYJnQmb9ewMdy2oCIvIfIp?=
 =?us-ascii?Q?+/0xmd/SATFKnTP5jbZ2J8oAjV3YuOpvZtX6/zIiPGyZCdKdCxMppE3lvmf6?=
 =?us-ascii?Q?Ef80ydX5uyGilTsgpoQTfysaPeMEsEWkiwplCCAI9aPB8gXAt23SLrllq30t?=
 =?us-ascii?Q?9YPKeUGMbRxH9c0RPstvhfc4sV8uxsJHPQa0/Z9qedyJfqmp9xLfKg6hB5uS?=
 =?us-ascii?Q?LkR78W2Zvbq5vCbemj6rc9OvD0IPXcNARd0Qq7vrZiFORKir4GUzXAmKu0y5?=
 =?us-ascii?Q?+feaGftVI5qucoiDbE1wlkDw5OhMijJqYilFOqDphPVZzXrLzvnIaP4iwrcr?=
 =?us-ascii?Q?fgE+GdhgSvBmwwePc9HVcAqiaTCNVmJARCBYgDuemVuT7CwQ+js4gduAcU4Q?=
 =?us-ascii?Q?T4v692lLO2OWZIGvxsnTgC4nIqvnJpTWLWOqcwsLFHZbkABgVoJOwWhN94YR?=
 =?us-ascii?Q?qeXqVFmgTv7vaadktJ5EUYn9BkQlBxsTCQwGv3rixpZvsSvEMXcSZAYxJXEN?=
 =?us-ascii?Q?BfytBkNUvrHw/yL3M6Sy+CcCdwa+AXgu/9l/4u4/npqT6u1FmEfpc7fBHq8g?=
 =?us-ascii?Q?g7+p7lXIQ8/JoZJTmxQgzlghzbGdXLQ4xSacS8eU29pAAoawit/C9YFVu298?=
 =?us-ascii?Q?d9yDV3jn6JcXO7ghhSgagXqIGJmX4NqWjIdFcSUUB7mjs9Awu7qS1Gw/VAld?=
 =?us-ascii?Q?ipwfbA68ImfXlZG9b3Xb6OwjlSaiC/uOEDOmaL7zrT2GczJJ+lxTRm1j1gpw?=
 =?us-ascii?Q?s+++pdzZyLYbUr6GuRlMEeamvKSUf1ARJbCfINdbvA3L7sRD8RJO9A5erQVu?=
 =?us-ascii?Q?lslnqrKl73w8PXBw+xSBeggbrEWAi0m/AwbTl2ivFxP1ihScAKO25kZydp2K?=
 =?us-ascii?Q?/C01pdWNBuY9sia1C1UyJe8CYJQLt7TjzzkI89i8DrekLta7hHzLHgvy+9ds?=
 =?us-ascii?Q?FokMF5Guyd7E1VaJ8vPfiJrAPWaGUpACrku/fJE3K1Ke7kmT4q+6afCgCmDc?=
 =?us-ascii?Q?w0pJq50q1Sbx/ynFmR3dRKe24Qt6TmNCQxtPYdU/s/xE+GmTJReiqUPW+gRJ?=
 =?us-ascii?Q?LFWaSHpGTLMw9ASBoiQVeVVrEjj3LWBrYNRUEeSJ35pBF0jAx3Hbj3eAkuj+?=
 =?us-ascii?Q?XCA6nMz2EKAi3XsGZmS7/csi+BxnCL1HJN4CHOpU64Q2HPHUYT42lb/UfhlS?=
 =?us-ascii?Q?Mdp75a2v4hebs08zMXsc+X7VoUJTizKjK7kxLkJhhhKwkPMPLlCYJEVE+GWa?=
 =?us-ascii?Q?dOFp7I6pg+TuTjUmvch1CwVPZ2P68CV0oAVyLV9yPFfnNEUMuHdLVmTy5UNM?=
 =?us-ascii?Q?/a2iw7vWZUavVupBpWIQ7cgnBjof4k8sEuAUuNPg0b/d1h6jWmx9otZ2Mycj?=
 =?us-ascii?Q?rV/LYNYzbS/Z1UWTKGcuIfKH6kkOEtojlK031TKo3BQGCx1jp+Yhwo3ecIVO?=
 =?us-ascii?Q?87V5XWO2pBUEcEuevIkVbvq3UGzMWb6sD/aG8qUB3dt3Ccdj7mHNserZU50q?=
 =?us-ascii?Q?4f8H0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9lf9GxJXhcb3P5l3Lq3HaBOHSUdb1DcdOJBr9bxuo/Bglemyq+c/s/Ut+GlWsoKRVVMC+4/EDXbat8XM55h8/IQ9iq8LD5oeR0ta5ZTI7Q8R15Yzbmg6KgVtkXB0MH+cnGVtB0vJHPtxB5hrVWnrQPfJWrlBFOrf+/ionVGgxBOoCwqkM09FcY3jww9HtSx3sU4wTdl1OcYm4+O8mIFa8uPQ/Tcvx5kL9X0IKItMNp3WB3Dz427u3gfXEcWGk1wV1Oi1j0yCqEiadlXjNRBgvQCAgcYsFpDXlos0E+gglJHlz4C8k5BAo5R1n85z4sqCMYxAjHvrmuY59saDkt2VAY/CfDQRyDWl1/yO+oBkXDOqDF+JeWKZFH0gwdUUz7MruornpH2MhJM6Hg9SoaTlGFhihkz6kFCIlELYYrEv7bv3iiOMoMR5PRFXNM0WRvHs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:34.6263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16603a45-f843-48cb-cfb3-08de63765cd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
Message-ID-Hash: 7U46ARIAM2MFU72AWCJMHTXFK464RQDF
X-Message-ID-Hash: 7U46ARIAM2MFU72AWCJMHTXFK464RQDF
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7U46ARIAM2MFU72AWCJMHTXFK464RQDF/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
DMA coherent allocations to be exposed as readable binary files.
The implementation handles offset tracking and bounds checking, copying
data from the coherent allocation to userspace via write_dma().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/dma.rs | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index acc65b1e0f24..dca16fb5a2fc 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,12 +5,14 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
+    bindings, build_assert, debugfs, device,
     device::{Bound, Core},
     error::{to_result, Result},
+    fs::file,
     prelude::*,
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
+    uaccess::UserSliceWriter,
 };
 use core::ptr::NonNull;
 
@@ -651,6 +653,38 @@ fn drop(&mut self) {
 // can be sent to another thread.
 unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 
+// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` is `Sync`, because all
+// methods that access the buffer contents (`field_read`, `field_write`, `as_slice`,
+// `as_slice_mut`) are `unsafe`, and callers are responsible for ensuring no data races occur.
+// The safe methods only return metadata or raw pointers whose use requires `unsafe`.
+unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T> {}
+
+impl debugfs::BinaryWriter for CoherentAllocation<u8> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let len = self.count();
+
+        if offset_val >= len {
+            return Ok(0);
+        }
+
+        let count = (len - offset_val).min(writer.len());
+
+        writer.write_dma(self, offset_val, count)?;
+
+        *offset += count as i64;
+        Ok(count)
+    }
+}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples
-- 
2.52.0

