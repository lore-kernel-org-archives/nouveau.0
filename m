Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D1EC88E64
	for <nouveau@archiver.kernel.org>; Mon, 26 Jan 2026 08:01:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B900110E3B8;
	Mon, 26 Jan 2026 08:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="en0MR3Tu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 766A040AC9;
	Mon, 26 Jan 2026 07:52:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769413939;
 b=EIVHXykGaYH/ZsH6SWf2jOoO6shdLJWUhP9amwB4Xk6vJ6QrovP4Y+uB0loKKCz1IKpgA
 zX/J/sEwvvUnFM3IMI8B1uobX8Z22gfAwboqRM/NojGdT+ODUIYdbriUP4b3BLsMyNfjXzy
 eu7M9YIL9rO5UM84AmQISPuPuQLm1USPB0JNFacFnznI63q6XrgY7cq3sm1T8H6vbj3nCcc
 2FjjCJrtNBhy/znF6CcjLt6iWEUYA67XmSxbtPXRUrk2cBBA7wZCt+SHA+mtwMq/imUZ7Tx
 s0kMthrKUOWsYww/cmlmsxLh17z91OZfpT8Hx8nVVlJSY34vEEvf5eJLAOUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769413939; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+ISs0qLx7GWbw07pHnNJ78tyh7Ejk9G6sF1tRGIdrL8=;
 b=0uozh2J113QgNvdd1WAAK0qodfT6gy1mlmBoft1Xl7QPjO701tm6BdyfKwAPb2r5yPtEy
 bG9YgY+eA+Iy8mD6mS7/ZVUtaokf0husJqALplxHG23tWipC+RTcgj5iOFadYawmFFuyE3f
 Tmi7A8L6aMLzSQ0PU8jtOIBkEi0b7fe3IREhRiRop8TwDVfD748jAnWhVPRs0lTq5x8NiX8
 oyfAmAUpayKsDG20fxBacT8UgA77c1PcxxYTn8vRrRaZg1411gAkiPskrEpJESCchuNMBtR
 C7YoV7FL130G11Cp0SurtNq9CL8/l5jFekdTScR6SLBx/ku7m1PwpUPuLKXQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B336B400C5
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 07:52:16 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1D10E3AC;
	Mon, 26 Jan 2026 08:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6dpZA/R/DH8UZrUrkJs7JIIpyTPiiCeLXFFXj/ts+Sw9xg/Y6pKWYbyZ3pEyYaFESZpc7MNsHF9fdzIxbCb1N4XDpqboTyVIrD+f5JeMxYar2701h+HqFRVBoKGxk1n483lXuWt521mdv0kFN1tbvyvTj5kJ+a7VAHOnqis8szLhkeJnMGwrI3BJrTtiT8jT9i02EtujMT530I0ghF456K+vCEO9FUhzeq6niMPVVnfxZxdgROT7IOtsTMV1DgIZLF3sIR60ksyGzsUWasWQ6MHgwGVfoVZ2BzClPiT0AGY9zXFzds/Zf8MkTantnl+5K4aMy7/HQzZUMGrbnLTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ISs0qLx7GWbw07pHnNJ78tyh7Ejk9G6sF1tRGIdrL8=;
 b=fA5xY/au+VZU8C04ek7Iit6/y+sD1mIXZmeZUy4kivDz9dztaA5/tVMitFHAMJgdc241cHB0mJycvI/S2FAgRpiH5EboGeyeS+ew/vWlI6tDzSqwWI5n/1Jh2ZlfYwHB+RvGgQr4f2dHgIbqQkrZRU3pL8hUP8xGWdBVJogcfVEZavZjZ6YpuioqQ/h9/bDLPy5s+aScQsUnfZQdJUTjbIBQ8Ij8b6NP+dXYfN2tKXJbhbFDfKsm2/u+UrErXZ4m46owrAiPLMkYZsXmZ2gxmc6VCaTTCQg624L1WzJ1tNPG9j43IzAIPL1w6xO3DIlk17eLGejOXJuXHmFeVlLdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ISs0qLx7GWbw07pHnNJ78tyh7Ejk9G6sF1tRGIdrL8=;
 b=en0MR3TuVfYpi2y+Wg+8ctO3e0UgzdJsIckzBjimnnMZozkKr886HN3pSjQH0vXmjn/TsLWuyvniumqaPgpOM4V06KxSnKIz3v405mNWHQfHtXWD/CMNIkSKYkw6CpeAdJJFCWQQcGSVWfYawDu71l7J0OihM0CHJlLAsTmECO1INkEy2oUUbRhd6XqYPUgWakZ5Gj8aa2RsdDKc20dNI5bI/z5/Rxvbani6gXCa8Uiz7bIOICDrXlqV9Gdi2aE0G1JU+VR39SFSp9NRjN2yQAA67ttqItbI5qQBpDr/UanjoPN3oF2aomKfSBCJ2CpUad1iQ7DGuWYhYNHiDn2exg==
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:01:09 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::23) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.6 via Frontend Transport; Mon,
 26 Jan 2026 08:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 08:01:09 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:00:51 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:00:51 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 26
 Jan 2026 00:00:46 -0800
Date: Mon, 26 Jan 2026 10:00:44 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v1 3/5] gpu: nova-core: use checked arithmetic in
 frombytes_at helper
Message-ID: <20260126100044.01b5aa0b.zhiw@nvidia.com>
In-Reply-To: <20260124231830.3088323-4-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
	<20260124231830.3088323-4-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a87a9fd-bd2d-4d2c-8be9-08de5cb110c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?knVrIRAIDD4tO2WiJvJGyUytgeqX+VUY0oZSxZjLNCk8xKNZSfqF2cn7ROXV?=
 =?us-ascii?Q?Uhbp4utzy4upnDrRw5fRgqF8m3J90YlzpcrYb6m/qW5ZnCGCO0Vi0Z1W4HB4?=
 =?us-ascii?Q?DL8gjSgH10S6KNapUPnr+E3qNn3cORcGE2/aoAZZ0uv0eXwNB2TEZ6U6y9hS?=
 =?us-ascii?Q?mso5HdaNoviy4WAAkUSms5CuYL4VhkGt14dUd1YQxIPcjIDC0O2Kb90GCjX8?=
 =?us-ascii?Q?lDO62hnav7DAqqYyos9SGrbpt7vP+nKznVOo8U9xmXDov1q/FUQEKFqYXM5M?=
 =?us-ascii?Q?0XZVX2g04FIaRJN/tl2HoUz3B0deTHwZy9OSXFbb/1fva/9Tc3kFHhuVMMoT?=
 =?us-ascii?Q?lZABb/TwVi75lDYN1ZJJwfjFO+0wyaQll0l2N7zqjWrGQqHz7+wGgITTRveA?=
 =?us-ascii?Q?/fjG9jJVKrX6x2CtdICLvkxyl3AuBlKhTUVwAx1L8D+K8kXqrVN+G3Xe67Ok?=
 =?us-ascii?Q?M6JUAHEMrqrW9J0SVqZX5/nrsexp5R7UnzCcVdZXj8Fv+nlMoeXOaQW0JuGq?=
 =?us-ascii?Q?4kOy77mucNQFkCsDflf+BQ6n31+BIgjVSprD8E1InVQk4Eb9vcph1oDSai5I?=
 =?us-ascii?Q?N6RlED3V1Oy+0tcehI/7gccawPNsj/6PXSLGNHZy0yqhnuLAVRuUHnr+0It8?=
 =?us-ascii?Q?kJ6A8vki/0VSeTSgZVrNuM445gqmQYPffgKDsudcDOPPYFvAwzOR5l6+Wet9?=
 =?us-ascii?Q?CVtxskdVC+odJHTutHnO2X5o4Y0zx9de0h6sKSeWDsmaAJFCUiOsnbDDUW1V?=
 =?us-ascii?Q?I0/p/hSFzG9CfdHqUQb9YsBfzfk5PfGWM9H8P0oUSuZCQkN+wCQrhvrQKG+h?=
 =?us-ascii?Q?QmjNARv4Pez87bbUFb3agp8mu8Q7cCEZjBTLHlAsoZQOajTBmM8rADlIXLbB?=
 =?us-ascii?Q?EbuRQU8XoX7otwGXx/DHnHgoR9Gg7hS/HTawhwRIyFunCv29tVLlkF8Hd2y4?=
 =?us-ascii?Q?vNU+DNQEcvGgKVwFWT7/NN5UyJYLM98g/R/5Ie9U4PvqjEXnrg7kFVzmlksL?=
 =?us-ascii?Q?Xsd5vBpDdLzpmtW9QJ+i2LGOYsVQNiytb/iGsCd1PucH3TGkOQtCk5aAnd1/?=
 =?us-ascii?Q?9VdMF/djOdRxN64Ri6ylCjk+TnJeW1zaWu4I15xP/vEm69YOcpldAOxY9lVP?=
 =?us-ascii?Q?VeTIpCfcUr6nKGQVjHb5WBxVVyDzur02jkM903hodFI6J2FiE/XaPWretrT8?=
 =?us-ascii?Q?5+/MPOxoYdzX3h5hnt0PNAUtQN4IjMzJpgNEWL1RoP4InZllixHwn/+5m0Cd?=
 =?us-ascii?Q?H3ukfezfZEGg0s5mibShKIEXiW1N1y4qMNiIQbEET9K3HErfF/V1+t62qacA?=
 =?us-ascii?Q?1Wst1ifi3yPHNvcO6tgVdu7vK249GVl9fWMrM/kWdNLp5l8ec1BrGpuAlqwo?=
 =?us-ascii?Q?Rd6ri2K2ukCfNZuIk8dvGJ8oFAD6RtiCYKxnAYUz/2/6zT7210jYE6vhj0I1?=
 =?us-ascii?Q?+KgiLg94rFeH4Ksm3UBLfkWkfaWn45uDenpQNuwVEclnSE8Vz+oIX4Pox3Xt?=
 =?us-ascii?Q?oiABwUdXaH4bPTu1q7/UVD+D/mrCcM53y1Uo++y7RJ2n1wxUQMubiPMNWQnh?=
 =?us-ascii?Q?lIJlOfeZXSV3w/tVx48Ub6ZurqsUGMhyqpLZU4QuaEsR/aEcBRv9L/pWCuFX?=
 =?us-ascii?Q?9mxZxUcI6zAL1W6mqWa2jB7YAsuWwhCDeKUV9qxGmUHw+7eQaCSGUk4KFK9r?=
 =?us-ascii?Q?fr3MWA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:01:09.3129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a87a9fd-bd2d-4d2c-8be9-08de5cb110c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
Message-ID-Hash: A6KALSNAME3PB4STCV5CZH4CGOGGKB4Y
X-Message-ID-Hash: A6KALSNAME3PB4STCV5CZH4CGOGGKB4Y
X-MailFrom: zhiw@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A6KALSNAME3PB4STCV5CZH4CGOGGKB4Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260126100044.01b5aa0b.zhiw@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 24 Jan 2026 18:18:28 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Use checked_add() when computing the end offset in the frombytes_at()
> helper function. This function is called with firmware-provided offsets.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/booter.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs
> b/drivers/gpu/nova-core/firmware/booter.rs index
> f5ad619dc055..1e2b2efe838f 100644 ---
> a/drivers/gpu/nova-core/firmware/booter.rs +++
> b/drivers/gpu/nova-core/firmware/booter.rs @@ -43,8 +43,9 @@
>  /// Local convenience function to return a copy of `S` by
> reinterpreting the bytes starting at /// `offset` in `slice`.
>  fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) ->
> Result<S> {
> +    let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
>      slice
> -        .get(offset..offset + size_of::<S>())
> +        .get(offset..end)
>          .and_then(S::from_bytes_copy)
>          .ok_or(EINVAL)
>  }

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
