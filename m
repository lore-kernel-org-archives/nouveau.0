Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4936EE8B370
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D81F10E710;
	Tue,  3 Feb 2026 22:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="URh5Pc03";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3DEA141B4C;
	Tue,  3 Feb 2026 22:39:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770158369;
 b=dacX+eYJESzLQaw6dLj8APKnpqkPdMaDW1GmNiezPLc7AfE9pxQ4z+TUXCj43yknvJIzd
 rwLxEGvmPfPKSLkhQgIDnxvBE/7+EOK52nDAvNz2ig23wMWiVlLhI2RswXu3iK2W7kJJ7O0
 zRj1h850EBdIgPpljqYuWcIHkzAotp4qSpdm77bU1inMWzghfEnLs+/HQv2kOscJ6LlCq6F
 xdHeXsZcoxpxSIWj39dQ6Bt7p468qQpAJAzDTSRakOyhKmg6nKIq8KFHYgSnzTj08Ud04ib
 YXReoInAj2fwTV/HZup4oWcFs3tIxgaTJD82+i61qYQ6M3Kd/ZT/B7NcvRWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770158369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JrevmnCW33xWgmI0Q2BhejWdKq5tjyO9EFg7EF5rHNU=;
 b=JeqL1OMayJHNGMmAitNwlGh4QwdAk7Mi4zdTwMShJP/dXd0LI/shj3dYZEtbkwqJi32yS
 OMhOVBD/kwjc+elbYhjk1hh5iriR+0kgTwhleK18Hh7TBvIIJ8OwCHGlwHwSxfVcDIycagm
 hqf4kXAS6LfBuXsQPj0hsG4moINY+Gxp9Je4iYBseBAScuoP0VxNq/wIxLpSGQioFwXyqSH
 E5x6SZsTy38LCXXwOpyjzuXZshB2U6/1pEyvFSE8S9W3YuwACxCi5+hF+Mxar4svDFH8dOM
 4rN5E+dvdhamOIHX0yae+dnv+T3bUpC6af8Y/48HdcKJzDb5OgYDtJq/e3GQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C8D2C41B0A
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:39:25 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011055.outbound.protection.outlook.com
 [40.93.194.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6816D10E332
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 22:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br+Kij3Bkw6znfYD4VxUT0p1hyrR4kTffpPKEZqgt4QH8e5Hc80HKx3hn9XVIMCbBuXEcdp/+UnbIOUs1gVzm6EOA+jQ81jsIryCpz5wjDtUYTe3vJ29S+P33QTV03GqWlKOeToUB2yCT7rZVM1urigsT7PgPMMNSaNADkyddN3+MnQeRygFKFUbAFadhqeNw918WwphuWP+82S4zC64fQ1WOwUehjI8Z8r4jG/6Mb5hCQ7s9Z9IV4YOLZwXfJVD5caK5nwMIxebP9h4/ZupdHpwVNveJIF96U5/OopprJnU5IgzXQn/5yr6bsPhEwwkmRTxNzvCw5/m4+2E9lDgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrevmnCW33xWgmI0Q2BhejWdKq5tjyO9EFg7EF5rHNU=;
 b=EJAvgwVC+D7uCWqkyJRnVR10aldV70EQx4wuAHuQGmH98X9ogdgWLz4J26NymY6rFcv+n7GEx1LUVvy2CcyErlk2SdodiGbKYk6N62hTqDk3gMZICQ44dZEJCZA60b6ECgdSo3QUyawF2xUe7s0dIz7qqNN4AtF5vbpLDAOqyui667ZKjkSAhMv8WqzVAVb2vLJp83JRE/30zZ9JyEBkOY0dKo3Md+TruUk35CreTm3xWs2VFekhwvAHt1nsT/gfpQ5raZHCWtXf1OfNhvdP7bKGqKqPBZdOIIFeM6ZF/Lu9Pk5xKoBtzk98vSqZoZCfmzINuHCLQWY3sKYeaE5Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrevmnCW33xWgmI0Q2BhejWdKq5tjyO9EFg7EF5rHNU=;
 b=URh5Pc03IQZl9aqw+JrylIcMlrbmCNynlOjUo0HTb2Sw2Sybsma2oAtXJAFcHs2w9pq6Oj2ioBHaI6aq558Ea8hoyI106sFN+8KjIQ+GFwK0ZOiFxHISiQffl9y4U9qFUxCkEuNYRpClsha0HARBO+KEcNtoloB5zd8ojxovyXoY/nrEq32WZFJWRAMBQN4isaFJ+Ut/l/aGdZ2QQxF0VD/cU+cChDBThgqgqgLuaEyg65DRg/VyYIntaOfXXqB7zd4G8Jm5gZdzrg4uzx/C5i4MdC8/aopf8r5pOvY1x1+0OjugpZkybjbnz7FPMb9d5l6WftKQ7NqKp7TKF1jvuQ==
Received: from BN9PR03CA0567.namprd03.prod.outlook.com (2603:10b6:408:138::32)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 22:48:36 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::5d) by BN9PR03CA0567.outlook.office365.com
 (2603:10b6:408:138::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:12 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 4/7] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Date: Tue, 3 Feb 2026 16:47:54 -0600
Message-ID: <20260203224757.871729-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c01287-b3c9-4317-66dd-08de63765db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cKt3Scc3KQLPCEabPU2fBpQ65X4GZds547+c+GzWuWudCxAlTiV0pGRV5Hka?=
 =?us-ascii?Q?kPUM3RXvX8H7GJndOIl6sHfyaZwWMu0rP50stpx4dsyXS2toTbopJhHx7zKp?=
 =?us-ascii?Q?mwRe8XADzMXkWZ/320spK5RXJXdciy/vrJwi1DYYR7mi+zoQdR9AKqEbmdpQ?=
 =?us-ascii?Q?/RBdCmnPYCXBD8KfZuDFX3ikqCHZJ1Sn/WhXUBFxCrbDlgqMjDU0xj/dr9ag?=
 =?us-ascii?Q?tH0h3KKG23oqVP2Sr7Y6pn4Vck5OVjrOwwK5zQ2uDkmA5UAbubd5IHXM/rVE?=
 =?us-ascii?Q?4d3HWnQdcqePVZFuhQD0SSIG26i3am44mZRP84XmM5g+G+8c40yWck/prC96?=
 =?us-ascii?Q?op7ajETTqeEtCAC3A0JEQ0cw9d3vbsXlFMg404hx8tNjjei6HSGDCREkLmaQ?=
 =?us-ascii?Q?MElqdV3RTMMlfhffPzwz6ytoKi4rB7NPnc6ThxZhB4LAwTuoHWP2N/0oKLs0?=
 =?us-ascii?Q?QcnmQ3B1U+kav9lXy1lUzXd+pCiiN+idH2YTmOnDpiQLO99Tw9fkQYSzu/Ro?=
 =?us-ascii?Q?Dr+g6ptOBmSwiqkkggh52HsNbtNiOYfpBOYYSGwbSdBDQ6AZj7RfNgiCat9l?=
 =?us-ascii?Q?DqBKEzL6qTD3Txk28F/2gnqgcEF5KHB4miEuccxJ0W5+nDQb5Kis+43mxnPg?=
 =?us-ascii?Q?OIsZ8LB247aEn7kTBpXY/VRqD0kLHJCKViFhazGf6x5KeJlx1ibuWCcX78n2?=
 =?us-ascii?Q?Ze/JrTCH6bVnkMwvDUi+6AyC1qhtAOsVb/3v/pPJxUHwTBFUu9pjw7J9IB7S?=
 =?us-ascii?Q?KX0O2Hr8pxjQgN35mY6cf0ErJ2ml+t+1/acwvmyaf/43KYTxWuOcc6FzRWVz?=
 =?us-ascii?Q?ibOMbhpYicml6SY1Q65SQunoYMQldwQz7tJo0Cgtjg9tEAuuUiyFQ9itw1G5?=
 =?us-ascii?Q?036jtbQsaZcjNO0/f8kVnScZ06Zx4NIwLGqQHxXbfPdGppPdcL+bZqPOyLWz?=
 =?us-ascii?Q?fgPaGP19d4x0IrVeDIyOV+CKJb4SxqLE76UNQ02qItkeDu7PKE7QTReTwMTW?=
 =?us-ascii?Q?I6QiX9/H0b7n/dgubRD2Ao0mveT0gJ5QxrWN9AF8vgwO5Gk1D63BN62yb3xh?=
 =?us-ascii?Q?Gf1onYlrJKEfufDCiWSsUNv3VXNXPlsHzQlwFDyoXe9/rq2jnIGi3wapZF4c?=
 =?us-ascii?Q?MlahZvU2c0K27zUcGUg6/LWAhSKVE0pYITCe6ppcndMNLnUKd87bGP4e137M?=
 =?us-ascii?Q?/NYbti7bxlbPElzpIqEKygVTwoemgRQ4Axq8c7g+tI4Y8IPW50uWks8XG/vZ?=
 =?us-ascii?Q?H+vcHLADrjq8x37ZuMPzV3H+BYSmazu4VcNCjjeY08KrcInjnO/w+NmhtA1v?=
 =?us-ascii?Q?iiDL1wLdnaSmgFlk0pAJ2tVavhwFGCamClNYTG1zdfrN32OLz1f0Tq81QF0X?=
 =?us-ascii?Q?mkcU1O0YRXzsB5JsZXKnm5INq3Y5ctIgCBG+60NPXyX3trs25Z8BceM7cjmT?=
 =?us-ascii?Q?zIHT6eA2CtzjtaeOkimrVA/8NHD4dAxTbgPfCF3aLxGTvGGJeHNSkfygZAyH?=
 =?us-ascii?Q?gfBqlXT1mAQlPRdJsKD7g4CTuVk4d7GJo+oc9txMIEm1GaWbN34ucx9hXM2O?=
 =?us-ascii?Q?aLHCht55LYPqWCisrQF4pg1l97YV1LfP/yfuCEAT7y/gTTdkr68YxvPWCWfE?=
 =?us-ascii?Q?NQ/to74reTc1xESaa3RIHMeG49lJ9W6LN+k7TGxuK4SagtknJgXL5/ix6j5T?=
 =?us-ascii?Q?Mj2YxA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sLS7wubwtI13lCF2vtU11tZwje21bbYcfAN1EbXX9E8/VKCJn2NMtd1W6A5GLxubHVT2cMyFRpspXxl4YaT7w6z0kr4DRPQDywrTgZBiUGkg9EfYdXDBS8SR5tTFXQnEH39xv1p1uSegjDBtYfD+46FkxO+09KO+RGqehybPVugvOtSkpJgQh3ksS1L0rQQrZStT4uoM1D9VTGREoekAKAE21j+NVr5s5GMmhXV6HKS939hsvSrFcPnf04WTMqwRwqMUouqMhR8jF06Cm/Wc1LcWXW7FYklr0jXStT4QbZ4XdCWSZFyLbrRIu5FLxkRYcejOHJ1NiUPmM3JT6kAv3xOCQRcAZ0edSQYenIba4/Ztmwm02xrZSEDosO33sWAz7BqkTzwAbwR2uftAMcWLusLaIhrU0tyTpV23lOyxuvu5/j8Ed0aWSZQzOHinp5ss
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:36.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7c01287-b3c9-4317-66dd-08de63765db8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
Message-ID-Hash: P4624TIFEQ2GLMNEDQHSBIUKLP46MJTP
X-Message-ID-Hash: P4624TIFEQ2GLMNEDQHSBIUKLP46MJTP
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P4624TIFEQ2GLMNEDQHSBIUKLP46MJTP/>
Archived-At: 
 <https://lore.freedesktop.org/20260203224757.871729-5-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Replace the module_pci_driver! macro with an explicit module
initialization using the standard module! macro and InPlaceModule
trait implementation.  No functional change intended, with the
exception that the driver now prints a message when loaded.

This change is necessary so that we can create a top-level "nova_core"
debugfs entry when the driver is loaded.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..80ecbb50ec82 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,13 @@
 
 //! Nova Core GPU Driver
 
+use kernel::{
+    driver::Registration,
+    pci,
+    prelude::*,
+    InPlaceModule, //
+};
+
 #[macro_use]
 mod bitfield;
 
@@ -20,8 +27,22 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-kernel::module_pci_driver! {
-    type: driver::NovaCore,
+#[pin_data]
+struct NovaCoreModule {
+    #[pin]
+    _driver: Registration<pci::Adapter<driver::NovaCore>>,
+}
+
+impl InPlaceModule for NovaCoreModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _driver <- Registration::new(MODULE_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: NovaCoreModule,
     name: "NovaCore",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
-- 
2.52.0

