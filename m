Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4D2D58B21
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 05:58:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B42B10E486;
	Mon, 16 Mar 2026 05:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OZPrEiyT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7816545117;
	Mon, 16 Mar 2026 05:47:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773640049;
 b=IjWWK50Ooq0l3Vtx3JMwIulJdXbCAmMH9140etBldexo+/z4GlXxy284bJH3rj+TkdkAj
 F3prqLY86ilJ9SqhRu7qXYuS0ZX5w/pP4jwclwW9J1xtoGeZd6xpHOnC6j+joAqSLojuuGO
 Z9z9g/IapN0bOBdLp3+Hzfe8dWhgZaMSrefTD+kMA3TSMcv3vcq0SRf3TbfFq8CeALVAwWM
 2/VQYOs9A7ZIAdKIY4s/8Tl8cur6ycNKQpvGmo5/qCNgT53V10bdGS3f42PgON3bgGcEiz7
 q/mWtkZhzRdResKF0tDllC0iAE+ewkrBadvjtsT/tjddPnb7kwZLRd1XlG5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773640049; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lRz6JNHdMwFTR5Ny1InkJWv3kvtLjgcrXnjnK9X1dc8=;
 b=LU9+se7TIZG3/yihH5+iIRYKTbhIaqjvQuTAFLnmgRNSG/UvpcfRXxaI1x8GpP97bh38P
 sTdOymgnhb090shT1EiAevn1EOPP5Dk2RvZYxCnl36xFyEIgOVMacH14pafYt3KWPtyp4Hi
 3H8Qs51ryTyTX3rD5Gay/brXn42kV/m1xADDIeLJ0lOEZkHqQQ/zMectIRE8qnSpeWpXcUh
 wXz6KN/5pRklhvtU5fJe1EJgJnqo4EtzIe5l2BGjuLziJZUxXrfrpV3XE/27G1sFEL3hLn0
 OLqw3ffXW/z7cVwNZx6iueWrlc1E15/D/X8FLvZ/NB87XI5sYEN4dtagR2kQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 754AE40696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 05:47:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 59F9710E2FE
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 05:58:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1TosDt8Ck6kZ1y7msW7XoG1EYhHtCIHqOS9DWbVLYCBcLhkme7dMqqiPUfe3UtGWDsUu5mKWgJu9IGHYOpFxCE2I39VVtIS9ay0vCI3x+JJ+eVWzHT8wzPmkgZrax7fbrPedkxAiRVIkfsPgc5CA2X5H10HLrRyJp2XPyn7Pt1JgmL0coeSjAX4/kqUi7E8jjN0MVwhbt60Ogy8aPp1iAGIRVGcylB1I/uVThGiymfydjJDUKgsfrLwoum5HMOljfsFUwuOJqHlqTsTXVFLGy8QHs9Ugq5GNXB5XqAbIcvMM7oCYjHZliHnNlAB0IwpdMACDEXKPs7WMtIOkBlCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRz6JNHdMwFTR5Ny1InkJWv3kvtLjgcrXnjnK9X1dc8=;
 b=lrXlaRg5RlYgr4o5MqZyTtfQuhe0WwRxxZaJcHrwbdtFTsHzBiqmAjKBr3uBOn9Lwo61HULRaOgxMpBNmERYpBG4y393WAm09j6dKd6ObTAsjDsb2NJqgsp6/1GeuoeDhusJJgTnf1yzGeeGABGaE5g0TX6NLPviRuNidedLYGfGVPSw2VUh/hIGCeizWqCfOuY6r2gBJx4WnuVIQaxyaa/oRMheY+YASBtAv3+wgaHTIvgmtVont9y8lggjnGuFSM0mKkr+RQmod45BjBi3YyJC593ZOLcd+xvlFjEfhhnDGbxFS37N9P4YYWqOkQ17RhjHqTdEMusi3agVpQ9eSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRz6JNHdMwFTR5Ny1InkJWv3kvtLjgcrXnjnK9X1dc8=;
 b=OZPrEiyT+YMQdu0a8gj5XH7239lCspmpsfTRjPpmyFWlOupEvJihalnD/zR38fiaH92Sg86D7WkPQ3siRVIDdKtQAveICwdcOpH/f14FUMPyXhPtb8WR3cgq/ASPXblvyLCIaTd4YnMLSy7BAWYWvKjG26mKZj3izIKtqXP/56uo5Fh+iJWAxAiO5iflwVJby81e8yuvauTsNNBL/adrxZbraCAAYI4Fbta1TR3yk6B7e07+0VFhiLqAmyUqSugXrwel3x2yJqCATMckKQDZCF7QUp4JcEQ3T+1F1cqdQ5p0xRuHSzr0sK37C39hpJVyeGEX/90pxR/tDe4LFCwC0g==
Received: from BL1PR13CA0431.namprd13.prod.outlook.com (2603:10b6:208:2c3::16)
 by DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 16 Mar
 2026 05:58:07 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::2) by BL1PR13CA0431.outlook.office365.com
 (2603:10b6:208:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:54 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 4/6] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Date: Mon, 16 Mar 2026 00:57:34 -0500
Message-ID: <20260316055736.1690546-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: d543caaa-253c-49eb-6acf-08de8320ff31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	LGFrqdMicvuVBergH6S4zMkld7N5RbzLsi6XqD0JrncHnfIOylczbQzu1idcFp1RUwha4hW60WF3eTmbqJuxKym03Re05TbtkDwUzkf/cJ4uSBTLG4v2dsa0GO5qFX4sYTWaVcfzJvv0lbMnpF93XKbs+Q0A02TUYMXxGE43r3yZIVFIo4JvcNlvF+PqOl7oe5r/aRKJSeh+hsDbqb5GPcz5HwZ6RmbWwPux+Laq+TtQlTGB9cAlwwzHhCQoBdljJmn0LA/ZsWfP6Hul5hwFlXN2eyXeYcyys4d+S8meQYGGU3U4g5EA+lVlJ6PR9cOfvSReHMhzII1sbE4bwM7V2oD4YHEmCSg//StRqMo2cDgbCembBWBEEwODAaqgXDE12qcJUrFy+y+gXyvqDmT0N8DsqGmmmZ2B+MHFPcyfYYljOMjC73ryPlXyBrO+ydO/gXq1Mkvdb5uQFYQGoVu4EiwZ4NrHSRrGu+rxupFyEqKtgrcL36frI2vJ7ND47CiAK2yhcTG/1xBGDTQXXLErilBQiNeYsN4CwLCG4lL0ISkdlEQMrvhGjk5MFgUSihKLnwp3zbqZocaUUIAfvio9Ys2x/Nn3yaLV/RjWRauWCACCANDhpmbFyGN6+zhbEGb8ElrayhOYm5fT2F8ZOrObRRHOnzoTW12imdndccIC3/9TLbALAk5Sg+xjozlnrCvnGXZ3IXJ/JoYpPZkaXLmJHOehru1HOxxUB+84G3G850CdP1R34Q9c0trTTPIOxI4P8dbvqGRGAJ2G0S4B/Sj10OBT0ium8VzyYUQ1ZS89EelPx7/HHaAdZ+MvAjVFie35
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uNuanixFbqkbs7H3l6dD0SXGAtv/NlA6FKXYfo4FnEe7sPf5ZFEtVFqF4e+sHx1TjqVHbmUQOcDXAX8esTHuffBICA+aptHAb2T0hO8Zw6bPzXrXabwW0pa5Bae5K9yBqit4NOw3+ldIoEABeZmPZ5xArEbgZ5eviIFLmgqF1u3OTi2rKdwQPLjkrppn15Dr6TgUXyiuG2bFDXEVWXbU+e7Ono5/01jME2NvDMBgbgQaNs727QK+1E/+u77NB6VnbJ/9mU6rXf1c9ReZSFC6dMexGtvE1TULXIx81/pz5ngmjmGH23DzHtmV68KznbDkthNKgQhd/m0knWracMSDOrajwLUIWCjkikICofJcnf8rwvGLtd7q614VF1lMKzFdSvHpCNju6gjjnZ+SiqsW3OXW6+ZWB4r8AtCPHIMPoP0T6vsKcg5xOxV85q+C1BjM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:07.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d543caaa-253c-49eb-6acf-08de8320ff31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E
Message-ID-Hash: CRM4EZ5PYB6Y26ELF27EM3V5SYZ4MVDE
X-Message-ID-Hash: CRM4EZ5PYB6Y26ELF27EM3V5SYZ4MVDE
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CRM4EZ5PYB6Y26ELF27EM3V5SYZ4MVDE/>
Archived-At: 
 <https://lore.freedesktop.org/20260316055736.1690546-5-ttabi@nvidia.com/>
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
index b5caf1044697..0114a59825aa 100644
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
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
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
2.51.0

