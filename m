Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257D6FEFB4D
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 12:34:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5AC10EB57;
	Fri, 27 Feb 2026 12:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J/tMN/ou";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5CFAF44CA3;
	Fri, 27 Feb 2026 12:24:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772195040;
 b=ZuMjr4+AOlOHUOTBNC5OouWeFOkRUWIiJw6BbjrfnmrVcoGngyA1xst8blTG/x13vHXSO
 MRrWRFpaEduQeBZgj/zzJdTkvhKgHo9DdNEbcl8KUARW29zdLt7D2A0R+pF/JRnKCj9b6TB
 SXD/PgQBPqsTgd97K0cpVEC1BugaxPogQrx39cNXIiQjcRKSxmKhbMmacEBmDPmltsQaet8
 9WeoHWSlFBFm95pRlKxwnx4iuTz0R55kjCqbOPrvTeWqxhNphuru9n+bVHZTc2UrcgtsFAb
 MwD1WybCiSsUR4dVSisNV+es+qr7E+F/6NO6SUwHQYARt1qAaPKWCC8n0TOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772195040; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+cx/rHVrbSGINlDs63mZF1XN06AvbQrrravh97m13lQ=;
 b=NP4G+biWAQ3tcaBG2VnNssU/tOUxrXJWTAqALVIhX4n4B650tCrXOjp1++u+87OH5i06n
 CW65MWQvoUkv3dxALXlX+Bdhdjqhipl9r8d+doV2t39kHeWe5GO1OpjiJktg/Ue8meRSXDP
 JGPWKifim3lYDsvsckXF9tqUjGaxQSTuHCDdsMYLkYiJxhEBqzoqbissnT/nA68XutyMpvk
 vj+G4BkvtzbYJx1ZXre4BuUmvRctAQL98YGR2en6KItPpD6yu+eskaBuDQ8rF/T9R6XaeA/
 PaIta9+l3mg3QMzQY3n9wA50vp1iEZv5gIjY/hgVsmTaM+LHWBQlbxFA93/A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 360D444CA8
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 12:23:53 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012013.outbound.protection.outlook.com
 [40.107.200.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB12310E5F1;
	Fri, 27 Feb 2026 12:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgb6kV5x21vuTKbnwIg4JxhfodD0gG5Wl6N+NLyV/0SyJGEe1hNy/bScSegwfHVUV6X7dXZETwtChNKKs803FO0uLdJemQxswCEryRBuOpnYD2nI5PctkWn8ov+tUfs6JikjODDSbdCHzqJ6EnvyLahk1lpzkt0EJI16mv6/0LxohJOwgAmzwU5qABTHFT0lOkc8mJcoug6E4N+4XASx/5mMcz1zc793VMiQx4J0HEpfLXB7H/in1u9hACrdVgS4sYaC50jqnEpw31HevDYtBTCOWdlVPOxywLyF6XFczH9ytkd6y9+8Gwo8jUJG6D1IscYx+DoHXL/gZChntXSCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cx/rHVrbSGINlDs63mZF1XN06AvbQrrravh97m13lQ=;
 b=u50dF/w8bJ7jqbHXZi0/R20MLnxNH3Dqk5+AasSnAGIkCZbJgYr70ar/8yZOX5Rb2NWccdHXDKmJ/XKMJFPzHOChmElLKuj2WLTnMgbzORZxYDg6euJc8OPKerrS8xWvR4rOGZppMJouSA/NyXtkKy6rPFko+Ef9dSzciFdDCcIJFqDYVa0i3go0IYq3G/rV/XIag5odlRKDetAB0jr6ScgrcKiPOXlqZj8/oSiHXsqcBVUinUP58JXK248fCVZHhdDjdN61AKMKB3FZNz5QfSXE4eNt0i+dul/Zzw8PKWNGOYiZna7mUT35POb/u/OfdliJ4i5W1CeMVv0jKm3yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cx/rHVrbSGINlDs63mZF1XN06AvbQrrravh97m13lQ=;
 b=J/tMN/ouzTLjhr8MgkF2NYVF0ln1PXsezUeI7U97pMq9QuvVOGp923Qh/dNX60M/Pl4hynqhH/vETAhK4traCHeuHV29BhV5z5OKZ8JYEF4yXLJ7n4RfH/ZZwL6yph+w+oQwQ8L11iIjuKFmxl4Wmfjfi+mi5Dmf6Ih7XBvpMzzeXWU79QLecJF/3+jljpeBy8zTXGmYWnGZaXTVSHomUGpMj5WxgKXsa7Ek89TJEdS3G0eCvTAz9VGHRWX5/Cc/EaRflh8JYek1t2x4637mKoiX8cDQ9iV2gZDHnHW8q3uhY7cIxmSVefljtsC05dsHWSDYH9DmoKwl94U6RhiWDQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:51 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:32:51 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:07 +0900
Subject: [PATCH 2/9] gpu: nova-core: gsp: add NvStatus enum for RM control
 errors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-2-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 601831b8-93c6-409b-8f5e-08de75fc52c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	yuX68+F2yi8BJ49qzXChTM0Oe8kYNujTr6uqXTsrIFar6jhTs4BFW9MfFJmlc1C8PDQa5s7xBL1d2tRrnRljSpYDUJcldFC8jOCaO0zsGxvIbNN3vAbXOnwQiig+LQiKOHM3aVDBb3IFIoZ+0z4dTT4GP7nT5Wtbyfh75C59oN067pVScihh/z9I+hOVpFRp/XWUPHti721Q2MdB2Rx79yqUiohjBxTzPmMyIZvYrXtgwVYLmWj9z5oMXmAA89qR5oaT5FTmxyf8GvuUwoybqc42uJQYLCWP1MOLB7xKNuZE3YyTAB0BLoN4bf1LspZgvm1R/rnITIgmkLldUc4IXjn3TLhiMJDwrMiuEMjTKEtMkKxcZaLACODF/oRwJRh05uTS65AJg+p3sWVc7A+lI7RP4YDwO5Hs1DsdfGP3GLIPM7UoKrb1oCkRuckpwQsX5mGeL8+BewEDBY+/uRgtgl8DDs84mDt9xwimPElbieBS5cnwREeV/rcgoVgvtWddDgOb6pzdp+seu5gEh9PXLwE4t8cO5aCx3rxGpf1jN3S52jBO4oydooKP/G+Lv6kpakb+b/6t5PhVYa2V471Gj/s7/6CzrFmMB0ouCS32kXUghm5qCANNa4V33ya7mFfBGP7sxA3iy1f7kX2qwrk3494tIcAB05yzlq+AylTrTOl6IORS36IWSAAnjVshXMHBaNxoTeLxfuhMedcGsJQtyU3E0rj23u2hnrQZGc8PDH0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEpSVVAwWFVob0toMGo3RkdoTTVwZjNGdGpFWWEyaWxSeUNKQ0VURld1a1NP?=
 =?utf-8?B?bG83d3VVS3IyZUdzeTJRN2dsWm9rOExqNW9aNlNqaDJCc3ZkS3R5SWwzRDhV?=
 =?utf-8?B?cFlLMi9BMGxHekR1WjFtSVBrYTNLV0RBTTVodFd4alVhSGFEVkVFRldhMjJx?=
 =?utf-8?B?YVp2bytCZ1hhSlEzb3Z0ejdaM2ZpMXFjUVhNNEx5eXpwTEV3T3dZOHgwdzRw?=
 =?utf-8?B?VUdFZGtBUHpkSkhRWFRRc0hlYUdlaXh5L29VNDVMSGtOTGpFSWRONS9LY0ht?=
 =?utf-8?B?UnBXNTZpMUFuNFdMdVpvM2RWRXRybnNmY3crTndmTEQ2eDFSWEEwL253TC8y?=
 =?utf-8?B?NjQ1eG1ydE40UjNpaTVWRzM3UXN5TWVjc2hRYWxCeVlFMmMralJJMXVuYTBC?=
 =?utf-8?B?RC81Qm4yWHVuM0orcFFkSGE5Q3d2bUxmSGNmeklyRzdSTmhQSExiamRrbjhZ?=
 =?utf-8?B?WTQ4dGp6N3ZCdE9FZjlLTjhBSWtEa2lQb0w4WU12bzVNV3NOTEtGV0Npd29T?=
 =?utf-8?B?UlF3QmtCakdsTnRQVGhPUDNFWU4rR3pMQlBlT1FFeXpWMjVzTWF4NWhGb0pj?=
 =?utf-8?B?dlNzZFJqY1d6UlhPQk4rSmJ0R3BWYlVnNmlyQkFxcUhOWmtyNEYxaXVLa09s?=
 =?utf-8?B?UktXMmpyQ3lMNWd1bXQwbWhpdTVsYUhQeWtubmZJSUFXVUI0OTBjYzE5dzhq?=
 =?utf-8?B?b2p3eTArZmx6UThDUS9scWh5c25YRE9YL0p2Zk9ITllOQUprRDV5QWJmZ3Rw?=
 =?utf-8?B?S1FCK2ljaUl3cExOQ1JpVndVbVppQWlBTkwwbVZVUWNCbGw5aGtzdmxXQnNQ?=
 =?utf-8?B?TjBncU5JeC9GSCt3VnQ2U21Ebld6bFlPeEJTRTlickxEQmQ1bEkzNkE1OW9r?=
 =?utf-8?B?YUV3ek5rUXpxZTB3SVBXZkUvdmJsNTNIZnFzVVRsVTg0VWtWMFA2MVBIWkxq?=
 =?utf-8?B?VHB4MWtkZkpVemY2S1haNkI3TmhlcmpWdXdJdDdabVE1cmZ3bWJabm5ZUFox?=
 =?utf-8?B?akUyMkN5ZG0rVEtUUUQvWUJZckhTWk13OFhGT0NCYzJRa2lzU2ZaMm9ERWho?=
 =?utf-8?B?VkxBY1IvQ3VqWG5uVm1XWW1WT1JRTW1Vem4zZGhFa2p6K1N1c2xpSWtUSmlj?=
 =?utf-8?B?cUdVZFpxakxpMElOTUV1M2RnczZnQWNYYW5nZEptTXkvMWZISWJyd0VKNEZD?=
 =?utf-8?B?eDdXTmZrMkN3aFExQVlqYnVEVjA0TEJlU0VqOXZLNXJZZXBhczVpQWQ5ZW4r?=
 =?utf-8?B?RGtORWozU2RERlBheGVLV3FveWF3YSs0VDlEZHRHRWNUZG1mWHZydEFVZ0s1?=
 =?utf-8?B?TForZlZIcDJ4c0I0ZkpuU01qODdwSldKTm9zVmR2M09YdmZXeDlFTzhLSFFD?=
 =?utf-8?B?MStHK1dEZURVdjhmYVRhNWwvUUpiMEpNRXp0UFk4SnVTc0IrZkF3TXljcUtl?=
 =?utf-8?B?b0g4YkJGbktYVWIxRjh5S1ZTUUNBTXdtcFgrT0Z2NWRqM28wdWU2ZkNXU2l5?=
 =?utf-8?B?T1ZZbkhvdVNLVzV1eDRkQjFpNlVhSE9mcEhJMDVYSHBjV2hWcndQanRiMExF?=
 =?utf-8?B?TVZUMUZaRTVDSTlEdkxRbkRSdW9BdGFRaDMwbWQ3SWdDYjlOc3Q3d1Y2RTZr?=
 =?utf-8?B?cytBKy8xb3ExQko4azhZR0NHYVRSL3dJRHZOcGVnK0NpRm9oODhuSHA4QXMw?=
 =?utf-8?B?RFExQXYzeWNrU2VPaGw1eGdxOG93T2RDK1I3ak5ScEhocGRSNXJNV3I5b3Rj?=
 =?utf-8?B?bHFBOFZ6dzM3dE51bnpsQUxlWlpCYWhQWlVjZjZQQzJjRkhsN1VPTU4yYmpp?=
 =?utf-8?B?d0V6Qnp0OVdpSHBVN0tZdEdvNnJHZlE5NjliQy9NTHVvWlhEblRDMStHTHFj?=
 =?utf-8?B?U2pJZVYrWW5ycWUycGF4am50Z1VzVE9uT3NLMk5XRksvSTcxSVVSTHlyOWpY?=
 =?utf-8?B?VTJSMjdMbC9ROTVNZVVKVVJTU0NnVVlMeC90VTNJZXRmTzBkeVRSWGJCMjVP?=
 =?utf-8?B?UmpCNUtjazFtTmhsWlc5UFRqYm9TNm1rZno1Smhtc1o4aWdvOGZCRm1wa2c3?=
 =?utf-8?B?Ly9iQzBkRmJ4YkJuRDI5Sjk5aVRaK2JFeU9sR3hNbnYrOXROeWtSdEtweWtx?=
 =?utf-8?B?UlZTL2grREYyUS9FWFF3VzROcnlDcWwrbGhXQm80cHlXTGdBRzBwa0pDSW5u?=
 =?utf-8?B?eEVNRjhadWVQN2s5eFZTU2Q2QzAxQkR1dWF6eWpFVFp6cnRuRmpZMDluek1q?=
 =?utf-8?B?ZGEwTmhucGQwRzBJQUxnT1lYQ08wYzFxNmU1ZVE3STZ6a3huN3FJWWFNOEJD?=
 =?utf-8?B?M1NLYlF2djJSdjU0alpyZUFtRXJuTTh0OTNaSW1VZUdjSEwxMjlLK1VQQm5F?=
 =?utf-8?Q?j/CULSyN12Zz+wVos9Fk5mdJBp3W57Yh8p3f64NaPDl6g?=
X-MS-Exchange-AntiSpam-MessageData-1: c8yZ1/2GIsU1BQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 601831b8-93c6-409b-8f5e-08de75fc52c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:51.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UzpAMpp71iumPDoZ8PdT2P6m76IzcxnuRP4eD9oiYm0eULvYJoZzF0CBGMEGHStjI5iBXQN/gyzvecBB3tHmPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
Message-ID-Hash: TS37TZ6ETWOO3GG37FRY3U7UZKFPUY5Q
X-Message-ID-Hash: TS37TZ6ETWOO3GG37FRY3U7UZKFPUY5Q
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TS37TZ6ETWOO3GG37FRY3U7UZKFPUY5Q/>
Archived-At: 
 <https://lore.freedesktop.org/20260227-rmcontrol-v1-2-86648e4869f9@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add NvStatus enum that wraps the raw NV_STATUS u32 codes returned by RM
control RPCs.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 401 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 401 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 25fca1f6db2c..c71c45462efd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -43,6 +43,407 @@
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
     num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
 
+/// Status code returned by GSP-RM RPCs.
+#[derive(Copy, Clone, Debug, PartialEq, Eq)]
+pub(crate) enum NvStatus {
+    Ok,
+    AlreadySignalled,
+    BrokenFb,
+    BufferTooSmall,
+    BusyRetry,
+    CallbackNotScheduled,
+    CardNotPresent,
+    CycleDetected,
+    DmaInUse,
+    DmaMemNotLocked,
+    DmaMemNotUnlocked,
+    DualLinkInuse,
+    EccError,
+    FabricManagerNotPresent,
+    FatalError,
+    FeatureNotEnabled,
+    FifoBadAccess,
+    FlcnError,
+    FreqNotSupported,
+    Generic,
+    GpuDmaNotInitialized,
+    GpuInDebugMode,
+    GpuInFullchipReset,
+    GpuIsLost,
+    GpuMemoryOnliningFailure,
+    GpuNotFullPower,
+    GpuUuidNotFound,
+    HotSwitch,
+    I2cError,
+    I2cSpeedTooHigh,
+    IllegalAction,
+    InUse,
+    InflateCompressedDataFailed,
+    InsertDuplicateName,
+    InsufficientPermissions,
+    InsufficientPower,
+    InsufficientResources,
+    InsufficientZbcEntry,
+    InvalidAccessType,
+    InvalidAddress,
+    InvalidArgument,
+    InvalidBase,
+    InvalidChannel,
+    InvalidClass,
+    InvalidClient,
+    InvalidCommand,
+    InvalidData,
+    InvalidDevice,
+    InvalidDmaSpecifier,
+    InvalidEvent,
+    InvalidFlags,
+    InvalidFunction,
+    InvalidHeap,
+    InvalidIndex,
+    InvalidIrqLevel,
+    InvalidLicense,
+    InvalidLimit,
+    InvalidLockState,
+    InvalidMethod,
+    InvalidObject,
+    InvalidObjectBuffer,
+    InvalidObjectHandle,
+    InvalidObjectNew,
+    InvalidObjectOld,
+    InvalidObjectParent,
+    InvalidOffset,
+    InvalidOperation,
+    InvalidOwner,
+    InvalidParamStruct,
+    InvalidParameter,
+    InvalidPath,
+    InvalidPointer,
+    InvalidRead,
+    InvalidRegistryKey,
+    InvalidRequest,
+    InvalidState,
+    InvalidStringLength,
+    InvalidWrite,
+    InvalidXlate,
+    IrqEdgeTriggered,
+    IrqNotFiring,
+    KeyRotationInProgress,
+    LibRmVersionMismatch,
+    MaxSessionLimitReached,
+    MemoryError,
+    MemoryTrainingFailed,
+    MismatchedSlave,
+    MismatchedTarget,
+    MissingTableEntry,
+    ModuleLoadFailed,
+    MoreDataAvailable,
+    MoreProcessingRequired,
+    MultipleMemoryTypes,
+    NoFreeFifos,
+    NoIntrPending,
+    NoMemory,
+    NoSuchDomain,
+    NoValidPath,
+    NotCompatible,
+    NotReady,
+    NotSupported,
+    NvlinkClockError,
+    NvlinkConfigurationError,
+    NvlinkFabricFailure,
+    NvlinkFabricNotReady,
+    NvlinkInitError,
+    NvlinkMinionError,
+    NvlinkTrainingError,
+    ObjectNotFound,
+    ObjectTypeMismatch,
+    OperatingSystem,
+    OtherDeviceFound,
+    OutOfRange,
+    OverlappingUvmCommit,
+    PageTableNotAvail,
+    PidNotFound,
+    PmuNotReady,
+    PrivSecViolation,
+    ProtectionFault,
+    QueueTaskSlotNotAvailable,
+    RcError,
+    ReductionManagerNotAvailable,
+    RejectedVbios,
+    ResetRequired,
+    ResourceLost,
+    ResourceRetirementError,
+    RiscvError,
+    SecureBootFailed,
+    SignalPending,
+    StateInUse,
+    TestOnlyCodeNotEnabled,
+    Timeout,
+    TimeoutRetry,
+    TooManyPrimaries,
+    UvmAddressInUse,
+    Unknown(u32),
+}
+
+impl From<NvStatus> for Result {
+    fn from(status: NvStatus) -> Self {
+        match status {
+            NvStatus::Ok => Ok(()),
+
+            NvStatus::BufferTooSmall | NvStatus::MoreDataAvailable => Err(EMSGSIZE),
+
+            NvStatus::BusyRetry
+            | NvStatus::DmaInUse
+            | NvStatus::DualLinkInuse
+            | NvStatus::GpuInFullchipReset
+            | NvStatus::InUse
+            | NvStatus::KeyRotationInProgress
+            | NvStatus::NotReady
+            | NvStatus::NvlinkFabricNotReady
+            | NvStatus::PmuNotReady
+            | NvStatus::StateInUse
+            | NvStatus::UvmAddressInUse => Err(EBUSY),
+
+            NvStatus::CardNotPresent
+            | NvStatus::FabricManagerNotPresent
+            | NvStatus::InvalidDevice
+            | NvStatus::ReductionManagerNotAvailable => Err(ENODEV),
+
+            NvStatus::FeatureNotEnabled
+            | NvStatus::FreqNotSupported
+            | NvStatus::NotSupported
+            | NvStatus::TestOnlyCodeNotEnabled => Err(ENOTSUPP),
+
+            NvStatus::GpuUuidNotFound
+            | NvStatus::MissingTableEntry
+            | NvStatus::NoSuchDomain
+            | NvStatus::NoValidPath
+            | NvStatus::ObjectNotFound => Err(ENOENT),
+
+            NvStatus::I2cSpeedTooHigh
+            | NvStatus::InvalidAccessType
+            | NvStatus::InvalidArgument
+            | NvStatus::InvalidBase
+            | NvStatus::InvalidChannel
+            | NvStatus::InvalidClass
+            | NvStatus::InvalidClient
+            | NvStatus::InvalidCommand
+            | NvStatus::InvalidData
+            | NvStatus::InvalidDmaSpecifier
+            | NvStatus::InvalidEvent
+            | NvStatus::InvalidFlags
+            | NvStatus::InvalidFunction
+            | NvStatus::InvalidHeap
+            | NvStatus::InvalidIndex
+            | NvStatus::InvalidIrqLevel
+            | NvStatus::InvalidLimit
+            | NvStatus::InvalidLockState
+            | NvStatus::InvalidMethod
+            | NvStatus::InvalidObject
+            | NvStatus::InvalidObjectBuffer
+            | NvStatus::InvalidObjectHandle
+            | NvStatus::InvalidObjectNew
+            | NvStatus::InvalidObjectOld
+            | NvStatus::InvalidObjectParent
+            | NvStatus::InvalidOffset
+            | NvStatus::InvalidOperation
+            | NvStatus::InvalidOwner
+            | NvStatus::InvalidParamStruct
+            | NvStatus::InvalidParameter
+            | NvStatus::InvalidPath
+            | NvStatus::InvalidRegistryKey
+            | NvStatus::InvalidRequest
+            | NvStatus::InvalidState
+            | NvStatus::InvalidStringLength
+            | NvStatus::InvalidXlate
+            | NvStatus::LibRmVersionMismatch
+            | NvStatus::MismatchedSlave
+            | NvStatus::MismatchedTarget
+            | NvStatus::MultipleMemoryTypes
+            | NvStatus::NotCompatible
+            | NvStatus::ObjectTypeMismatch
+            | NvStatus::OverlappingUvmCommit
+            | NvStatus::RejectedVbios => Err(EINVAL),
+
+            NvStatus::IllegalAction => Err(EPERM),
+
+            NvStatus::InsertDuplicateName => Err(EEXIST),
+
+            NvStatus::InsufficientPermissions
+            | NvStatus::InvalidLicense
+            | NvStatus::PrivSecViolation => Err(EACCES),
+
+            NvStatus::InsufficientResources | NvStatus::NoMemory | NvStatus::PageTableNotAvail => {
+                Err(ENOMEM)
+            }
+
+            NvStatus::InsufficientZbcEntry
+            | NvStatus::MaxSessionLimitReached
+            | NvStatus::NoFreeFifos
+            | NvStatus::QueueTaskSlotNotAvailable
+            | NvStatus::TooManyPrimaries => Err(ENOSPC),
+
+            NvStatus::InvalidAddress | NvStatus::InvalidPointer | NvStatus::ProtectionFault => {
+                Err(EFAULT)
+            }
+
+            NvStatus::MoreProcessingRequired | NvStatus::TimeoutRetry => Err(EAGAIN),
+
+            NvStatus::OutOfRange => Err(ERANGE),
+
+            NvStatus::PidNotFound => Err(ESRCH),
+
+            NvStatus::SignalPending => Err(EINTR),
+
+            NvStatus::Timeout => Err(ETIMEDOUT),
+
+            _ => Err(EIO),
+        }
+    }
+}
+
+impl From<u32> for NvStatus {
+    fn from(value: u32) -> Self {
+        match value {
+            bindings::NV_OK => Self::Ok,
+            bindings::NV_ERR_ALREADY_SIGNALLED => Self::AlreadySignalled,
+            bindings::NV_ERR_BROKEN_FB => Self::BrokenFb,
+            bindings::NV_ERR_BUFFER_TOO_SMALL => Self::BufferTooSmall,
+            bindings::NV_ERR_BUSY_RETRY => Self::BusyRetry,
+            bindings::NV_ERR_CALLBACK_NOT_SCHEDULED => Self::CallbackNotScheduled,
+            bindings::NV_ERR_CARD_NOT_PRESENT => Self::CardNotPresent,
+            bindings::NV_ERR_CYCLE_DETECTED => Self::CycleDetected,
+            bindings::NV_ERR_DMA_IN_USE => Self::DmaInUse,
+            bindings::NV_ERR_DMA_MEM_NOT_LOCKED => Self::DmaMemNotLocked,
+            bindings::NV_ERR_DMA_MEM_NOT_UNLOCKED => Self::DmaMemNotUnlocked,
+            bindings::NV_ERR_DUAL_LINK_INUSE => Self::DualLinkInuse,
+            bindings::NV_ERR_ECC_ERROR => Self::EccError,
+            bindings::NV_ERR_FABRIC_MANAGER_NOT_PRESENT => Self::FabricManagerNotPresent,
+            bindings::NV_ERR_FATAL_ERROR => Self::FatalError,
+            bindings::NV_ERR_FEATURE_NOT_ENABLED => Self::FeatureNotEnabled,
+            bindings::NV_ERR_FIFO_BAD_ACCESS => Self::FifoBadAccess,
+            bindings::NV_ERR_FLCN_ERROR => Self::FlcnError,
+            bindings::NV_ERR_FREQ_NOT_SUPPORTED => Self::FreqNotSupported,
+            bindings::NV_ERR_GENERIC => Self::Generic,
+            bindings::NV_ERR_GPU_DMA_NOT_INITIALIZED => Self::GpuDmaNotInitialized,
+            bindings::NV_ERR_GPU_IN_DEBUG_MODE => Self::GpuInDebugMode,
+            bindings::NV_ERR_GPU_IN_FULLCHIP_RESET => Self::GpuInFullchipReset,
+            bindings::NV_ERR_GPU_IS_LOST => Self::GpuIsLost,
+            bindings::NV_ERR_GPU_MEMORY_ONLINING_FAILURE => Self::GpuMemoryOnliningFailure,
+            bindings::NV_ERR_GPU_NOT_FULL_POWER => Self::GpuNotFullPower,
+            bindings::NV_ERR_GPU_UUID_NOT_FOUND => Self::GpuUuidNotFound,
+            bindings::NV_ERR_HOT_SWITCH => Self::HotSwitch,
+            bindings::NV_ERR_I2C_ERROR => Self::I2cError,
+            bindings::NV_ERR_I2C_SPEED_TOO_HIGH => Self::I2cSpeedTooHigh,
+            bindings::NV_ERR_ILLEGAL_ACTION => Self::IllegalAction,
+            bindings::NV_ERR_IN_USE => Self::InUse,
+            bindings::NV_ERR_INFLATE_COMPRESSED_DATA_FAILED => Self::InflateCompressedDataFailed,
+            bindings::NV_ERR_INSERT_DUPLICATE_NAME => Self::InsertDuplicateName,
+            bindings::NV_ERR_INSUFFICIENT_PERMISSIONS => Self::InsufficientPermissions,
+            bindings::NV_ERR_INSUFFICIENT_POWER => Self::InsufficientPower,
+            bindings::NV_ERR_INSUFFICIENT_RESOURCES => Self::InsufficientResources,
+            bindings::NV_ERR_INSUFFICIENT_ZBC_ENTRY => Self::InsufficientZbcEntry,
+            bindings::NV_ERR_INVALID_ACCESS_TYPE => Self::InvalidAccessType,
+            bindings::NV_ERR_INVALID_ADDRESS => Self::InvalidAddress,
+            bindings::NV_ERR_INVALID_ARGUMENT => Self::InvalidArgument,
+            bindings::NV_ERR_INVALID_BASE => Self::InvalidBase,
+            bindings::NV_ERR_INVALID_CHANNEL => Self::InvalidChannel,
+            bindings::NV_ERR_INVALID_CLASS => Self::InvalidClass,
+            bindings::NV_ERR_INVALID_CLIENT => Self::InvalidClient,
+            bindings::NV_ERR_INVALID_COMMAND => Self::InvalidCommand,
+            bindings::NV_ERR_INVALID_DATA => Self::InvalidData,
+            bindings::NV_ERR_INVALID_DEVICE => Self::InvalidDevice,
+            bindings::NV_ERR_INVALID_DMA_SPECIFIER => Self::InvalidDmaSpecifier,
+            bindings::NV_ERR_INVALID_EVENT => Self::InvalidEvent,
+            bindings::NV_ERR_INVALID_FLAGS => Self::InvalidFlags,
+            bindings::NV_ERR_INVALID_FUNCTION => Self::InvalidFunction,
+            bindings::NV_ERR_INVALID_HEAP => Self::InvalidHeap,
+            bindings::NV_ERR_INVALID_INDEX => Self::InvalidIndex,
+            bindings::NV_ERR_INVALID_IRQ_LEVEL => Self::InvalidIrqLevel,
+            bindings::NV_ERR_INVALID_LICENSE => Self::InvalidLicense,
+            bindings::NV_ERR_INVALID_LIMIT => Self::InvalidLimit,
+            bindings::NV_ERR_INVALID_LOCK_STATE => Self::InvalidLockState,
+            bindings::NV_ERR_INVALID_METHOD => Self::InvalidMethod,
+            bindings::NV_ERR_INVALID_OBJECT => Self::InvalidObject,
+            bindings::NV_ERR_INVALID_OBJECT_BUFFER => Self::InvalidObjectBuffer,
+            bindings::NV_ERR_INVALID_OBJECT_HANDLE => Self::InvalidObjectHandle,
+            bindings::NV_ERR_INVALID_OBJECT_NEW => Self::InvalidObjectNew,
+            bindings::NV_ERR_INVALID_OBJECT_OLD => Self::InvalidObjectOld,
+            bindings::NV_ERR_INVALID_OBJECT_PARENT => Self::InvalidObjectParent,
+            bindings::NV_ERR_INVALID_OFFSET => Self::InvalidOffset,
+            bindings::NV_ERR_INVALID_OPERATION => Self::InvalidOperation,
+            bindings::NV_ERR_INVALID_OWNER => Self::InvalidOwner,
+            bindings::NV_ERR_INVALID_PARAM_STRUCT => Self::InvalidParamStruct,
+            bindings::NV_ERR_INVALID_PARAMETER => Self::InvalidParameter,
+            bindings::NV_ERR_INVALID_PATH => Self::InvalidPath,
+            bindings::NV_ERR_INVALID_POINTER => Self::InvalidPointer,
+            bindings::NV_ERR_INVALID_READ => Self::InvalidRead,
+            bindings::NV_ERR_INVALID_REGISTRY_KEY => Self::InvalidRegistryKey,
+            bindings::NV_ERR_INVALID_REQUEST => Self::InvalidRequest,
+            bindings::NV_ERR_INVALID_STATE => Self::InvalidState,
+            bindings::NV_ERR_INVALID_STRING_LENGTH => Self::InvalidStringLength,
+            bindings::NV_ERR_INVALID_WRITE => Self::InvalidWrite,
+            bindings::NV_ERR_INVALID_XLATE => Self::InvalidXlate,
+            bindings::NV_ERR_IRQ_EDGE_TRIGGERED => Self::IrqEdgeTriggered,
+            bindings::NV_ERR_IRQ_NOT_FIRING => Self::IrqNotFiring,
+            bindings::NV_ERR_KEY_ROTATION_IN_PROGRESS => Self::KeyRotationInProgress,
+            bindings::NV_ERR_LIB_RM_VERSION_MISMATCH => Self::LibRmVersionMismatch,
+            bindings::NV_ERR_MAX_SESSION_LIMIT_REACHED => Self::MaxSessionLimitReached,
+            bindings::NV_ERR_MEMORY_ERROR => Self::MemoryError,
+            bindings::NV_ERR_MEMORY_TRAINING_FAILED => Self::MemoryTrainingFailed,
+            bindings::NV_ERR_MISMATCHED_SLAVE => Self::MismatchedSlave,
+            bindings::NV_ERR_MISMATCHED_TARGET => Self::MismatchedTarget,
+            bindings::NV_ERR_MISSING_TABLE_ENTRY => Self::MissingTableEntry,
+            bindings::NV_ERR_MODULE_LOAD_FAILED => Self::ModuleLoadFailed,
+            bindings::NV_ERR_MORE_DATA_AVAILABLE => Self::MoreDataAvailable,
+            bindings::NV_ERR_MORE_PROCESSING_REQUIRED => Self::MoreProcessingRequired,
+            bindings::NV_ERR_MULTIPLE_MEMORY_TYPES => Self::MultipleMemoryTypes,
+            bindings::NV_ERR_NO_FREE_FIFOS => Self::NoFreeFifos,
+            bindings::NV_ERR_NO_INTR_PENDING => Self::NoIntrPending,
+            bindings::NV_ERR_NO_MEMORY => Self::NoMemory,
+            bindings::NV_ERR_NO_SUCH_DOMAIN => Self::NoSuchDomain,
+            bindings::NV_ERR_NO_VALID_PATH => Self::NoValidPath,
+            bindings::NV_ERR_NOT_COMPATIBLE => Self::NotCompatible,
+            bindings::NV_ERR_NOT_READY => Self::NotReady,
+            bindings::NV_ERR_NOT_SUPPORTED => Self::NotSupported,
+            bindings::NV_ERR_NVLINK_CLOCK_ERROR => Self::NvlinkClockError,
+            bindings::NV_ERR_NVLINK_CONFIGURATION_ERROR => Self::NvlinkConfigurationError,
+            bindings::NV_ERR_NVLINK_FABRIC_FAILURE => Self::NvlinkFabricFailure,
+            bindings::NV_ERR_NVLINK_FABRIC_NOT_READY => Self::NvlinkFabricNotReady,
+            bindings::NV_ERR_NVLINK_INIT_ERROR => Self::NvlinkInitError,
+            bindings::NV_ERR_NVLINK_MINION_ERROR => Self::NvlinkMinionError,
+            bindings::NV_ERR_NVLINK_TRAINING_ERROR => Self::NvlinkTrainingError,
+            bindings::NV_ERR_OBJECT_NOT_FOUND => Self::ObjectNotFound,
+            bindings::NV_ERR_OBJECT_TYPE_MISMATCH => Self::ObjectTypeMismatch,
+            bindings::NV_ERR_OPERATING_SYSTEM => Self::OperatingSystem,
+            bindings::NV_ERR_OTHER_DEVICE_FOUND => Self::OtherDeviceFound,
+            bindings::NV_ERR_OUT_OF_RANGE => Self::OutOfRange,
+            bindings::NV_ERR_OVERLAPPING_UVM_COMMIT => Self::OverlappingUvmCommit,
+            bindings::NV_ERR_PAGE_TABLE_NOT_AVAIL => Self::PageTableNotAvail,
+            bindings::NV_ERR_PID_NOT_FOUND => Self::PidNotFound,
+            bindings::NV_ERR_PMU_NOT_READY => Self::PmuNotReady,
+            bindings::NV_ERR_PRIV_SEC_VIOLATION => Self::PrivSecViolation,
+            bindings::NV_ERR_PROTECTION_FAULT => Self::ProtectionFault,
+            bindings::NV_ERR_QUEUE_TASK_SLOT_NOT_AVAILABLE => Self::QueueTaskSlotNotAvailable,
+            bindings::NV_ERR_RC_ERROR => Self::RcError,
+            bindings::NV_ERR_REDUCTION_MANAGER_NOT_AVAILABLE => Self::ReductionManagerNotAvailable,
+            bindings::NV_ERR_REJECTED_VBIOS => Self::RejectedVbios,
+            bindings::NV_ERR_RESET_REQUIRED => Self::ResetRequired,
+            bindings::NV_ERR_RESOURCE_LOST => Self::ResourceLost,
+            bindings::NV_ERR_RESOURCE_RETIREMENT_ERROR => Self::ResourceRetirementError,
+            bindings::NV_ERR_RISCV_ERROR => Self::RiscvError,
+            bindings::NV_ERR_SECURE_BOOT_FAILED => Self::SecureBootFailed,
+            bindings::NV_ERR_SIGNAL_PENDING => Self::SignalPending,
+            bindings::NV_ERR_STATE_IN_USE => Self::StateInUse,
+            bindings::NV_ERR_TEST_ONLY_CODE_NOT_ENABLED => Self::TestOnlyCodeNotEnabled,
+            bindings::NV_ERR_TIMEOUT => Self::Timeout,
+            bindings::NV_ERR_TIMEOUT_RETRY => Self::TimeoutRetry,
+            bindings::NV_ERR_TOO_MANY_PRIMARIES => Self::TooManyPrimaries,
+            bindings::NV_ERR_UVM_ADDRESS_IN_USE => Self::UvmAddressInUse,
+            other => Self::Unknown(other),
+        }
+    }
+}
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 

-- 
2.53.0

