Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24DEEB365A
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 02:46:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0BBC10E611;
	Tue,  3 Mar 2026 02:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SA/+T8UX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBD7A4032A;
	Tue,  3 Mar 2026 02:36:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772505398;
 b=Qzu9Wv4Sv4vt0I40OZif6Z8gu5FSu3y/NbBRfBKMXmilkIpCb+glNuEUGGzW29yelc8o1
 u57ffXh5FOGvRcsqLwSyIPy8xn4J8c2LV7ncKV1Vcq6Ry4lZJoDoQ95alk2XoKDjQJ6U14u
 X4JQN+KchynS8B9J39NqvYuKY1jhhh5memJCKLucvuOMlT/5lfcxvfrjnd+/X0O5guf5xBD
 RhApc66/D1QjEuGXEKdLqQcH78PbnLT//YK51/OlwWRdeTnIQYa3CuD3Ob61PnpHvhMBaCc
 sPS/Zs7qZrwCrzjwiDTCrBahskCKAvom7InfHDhZNP1HmiKqde5kzr6AX/Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772505398; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TqNC5cHHnbXd323HsB7GGGLZBFIqOOEndrdLd7lMoEk=;
 b=MQMT+0vXM+YM8M+iPDxJOZo/6k4oM3Y0Uml9OL49ydg1nC8dCjRDLuou5eLUF26FUz78t
 vojcZ8hLgEFQ0vyCjJXAL5qkQS2vB2VqrAuaR8ZdSzorn8JaOMaqHkeYK9SyNSwCD8KQhNM
 PNIDbLjYDEX9mS2M06joDgV6t9EjuMkXv4BisJ5sQzdWN2+NHZxLx+TkmuIUadJR/fZ+pLN
 a0UirEyGSarb///V5PXCKuDXIHdlWU9L9DKZYbdgLCkR8zGcKf03QAJT/WGGm+L4dk+whCq
 +TDAdZkoihsh/qgg+TIkzQ0TzDPj1LLWEJYbCgc0FrTXiTmdSD1SDdqO8cNA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CDB114032A
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 02:36:35 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36410E03A;
	Tue,  3 Mar 2026 02:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPOTO6qfjOJQ1xY8G/dPX3N9Q4iyO+GulST+hEhMgm/HrJCpmaPyhfhek2bdwPTpLVX14OP3jptUbfA7KvkBrej7GRKXa36TVxecfi1zmJCm8kFe/VyjENlUMk2+KmTQAlWPMCP02rEjLRMInMdBVZtL1hDuVVmhxEcex0yaMbryNaUnr8F6w4JWiLu8i+qfIod1WYtTpnJW/iyhIWl1kWMQqYuJ9Ly/fFuuE+2nrV4yfJTYGNqAHm2XeBFm0hzMPfGmB3sbrMxd1ib/+mUiO8yyHcebfDqt2PunPZYGjRjwoUK1wZTe7onG+21PzuaJJmqlk+EBt8wWRHpkMiZ3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqNC5cHHnbXd323HsB7GGGLZBFIqOOEndrdLd7lMoEk=;
 b=pxF2JOel9TC8O2PVlHC1VIKU4cnQNbHGGSIE6zGbhYnzqK6mLo/Y+oSLYyjUZglwlzzuf42cN4AVvT58yn0H6mOLnUdg2vm6c/trHcSIgWdoy2rglHS7dbuEyoxZWEPe1JGx5O5HG6AuKE+EWR7TQzabiDGNWWCVJONJ6H3dyXHGelckHCaeGYMjzeLOKS+dgFzhBmNgWNSSGgklPLBG4j1c6se38HUJB9PsRZncK2uwLooL58C28H5K35VYn1kX49Jv6iHX4K78HjiNr8x1gwBLpfS8o5OU1sAVKTFwhEsw4KoAyG/vWSRI4NnPFFbtcZn7ob21NBjc1oMyeV+CFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqNC5cHHnbXd323HsB7GGGLZBFIqOOEndrdLd7lMoEk=;
 b=SA/+T8UXrsvOpwnBxa5TvWbjiW1b7nfKy1Xen5TmN4GdK8ISbuk9bjnu23PAB1ofmCCpV84W6igzBIo7lLp1/Zp0Qufg2r8Y6YqXiFmHGbw2V+nEpC27wE4irO+myISEBOd7tx6kZtyDEXOLilj4i2QKjfPvSQkrnoUoC7RPyNmeb/6aTYsptNhv2GNXW7nNXz+nui3KSQ/PhxkScf8eihUaYkZlrG624Mb731tOxgubmM9jGOvq/BbFCcF0rRYPQYTHNwdUYCGhfWbGm1JI2HkZd38ZPQFPyvEdnpU/BbrZlK0tBAHFyfP1UgGUk7BoV3KEk8TemQotYI1b/wgDHQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 02:46:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 02:46:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 11:46:44 +0900
Message-Id: <DGSSXT7E34FS.1WGP72D9O4K3R@nvidia.com>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
In-Reply-To: <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: f881b1e5-94a9-413d-5325-08de78cf1d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014;
X-Microsoft-Antispam-Message-Info: 
	DfJcZzzxx1TpNnB/jN7tI2VsobpfwBKpY0Ryi7CvVMRBsGNVHt4ryPVuxGG0t/0QO8sQl+qazx/IplrEOAIYRAKI309AyYIl0gKdZtdjTWYVint6RN7dJjnLAQS7cy+sdbbCuI9HgZSiqyVh9IZGoHF4HevKoSvCA1/BDtMgnu3bkpjGYkWRLfP5gXSlnBmLZ4aC8pCLCuLlCaOOULAzpfuNx8O8KtZedSwo68TLgRLLqZGA2KG7YO5r8K7SD8Km7nEWH2iOAYyuqC0yfj/qoWYDZZf4JkyRUxTMlLq0YHoNfNo1+8WDMt8dMYgqibuuVOkYxMpHfXl+FxMPKEo3cO5Z39bHY6gEWlFmJyGaiNHlujNAvvxWytGQVnuC0jBCYQS7UZtIVAn0/othuMqm7rgbEaWh3NQFsyxdFA/xdFEE1KjLDPj20M1kVKqe6rTFcC53CJCIHPX/vMgzJX8rcfN3k4CH9rMmMR26Y97THh/zhwriRtKTcmkmDpb4r9cMgMe4dGkVR6/w84ox7YpMyK+0amQmD7NMExAXU6QiIzDkWeAqcwWdQWksliMVxtHI/52fogK83F05+9EYPrksM6HeRuX3XutoiZ97arxdhgJ1UKz/I90HHfchh3EyAPy/AIU+0a/gf8pj+WscXcgPDVPHFkfVNHtJx2GA1+41aZCUF97pIvyMmZGR3DmZBepKDh0iso8TugynmEwTJY2fecZxE/ZaMGpgJtxpWQol1lE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STAvS3JkY3g0QlFmZDZUczBFbXlSNXhhSTZ1SThMb1NETXduTFBreVBTMG81?=
 =?utf-8?B?bm92cVBLL1NybUk2cXlpR09WYlg2Y1FWSkZXeHpsa0hMTTFMZTNSMDhkdWdS?=
 =?utf-8?B?RnZLWUs2Y3BoYWl0WktQanV0TEpoR3FIYlZWUjRaOU9xcWdPUk9wRzlOclF5?=
 =?utf-8?B?WXFPaWVPK29SWkZyVjN5UHdBb0tKRTc1eFUxRUZmVnBDa2J3MHJYd29COFMr?=
 =?utf-8?B?NzNFYStaeFdESlpWS2FVckJ5eldWaG1hbWZTekl5VXpUaUZBTTVBdUpaNjM4?=
 =?utf-8?B?dmZsR0ZvenNBUVBlUUdZTUVFVUlDL1c3cWhKNmFSVkZDbGFGbWs1Q3ArY3Iy?=
 =?utf-8?B?akVhandjVDJUK24zVTR6aGJPOGlObUhCNVJESGpacU16TVV5U096bzdGK0ZY?=
 =?utf-8?B?WW1hT1J2RXh1bGdURTVTMzA5V2pUVkFUY3c5S1FFc1ZUWU5ZSXg1d201M2dS?=
 =?utf-8?B?YTNlRWJQUnNwS0V6MEFuUFVTenN0WnczTlQwUHl0L0NwWEZHd0Q2OXYvOThy?=
 =?utf-8?B?MUV6TGV3NzFTUm1nOGJUdUM2eWdVdG1IQld0eGxhalFtb3NXdzNsUTlQVWlt?=
 =?utf-8?B?OVBJUC9tdlRNODFHbERWV1NtMyt4MVlKNjBmeXU5TXJza0RVRnVjZDRHRExj?=
 =?utf-8?B?QzRlL0JmUE5uRytzbXdxM0xMcUZXQSs0Z0VGR2NVbkhCVWxmc1dFQ3kzUFNT?=
 =?utf-8?B?OW1peVBnZHU1WnZaVkpTQjRzKzhKNE1vaWpuaGorQTk3NW5hTlIzWGxvTW1F?=
 =?utf-8?B?L25QN0tWbkE0WDJFYkp4UlAxWkRxQ3c2UEtnd2ZLcy9iRkVqRUMrL1FuR1pL?=
 =?utf-8?B?aEJiNFVkdi9TRUk4UUVaZCtQbjZpdHlLRFFKK3AxWXN1SnFCUTBEVktyd1c4?=
 =?utf-8?B?NHhGcHg5TytYZk5FOE1TL1cwVzFScUNzemgwRDVmTjRhaHJnZzhXMXBuRkFm?=
 =?utf-8?B?LzdlUlFRSkdkUUNRMGJvK056aW95ZGFpckRXSzhPR2RESi8yMUF2K1VrZkw5?=
 =?utf-8?B?dGc4UmE4d1ZGUGtudk1JTFV2VDNkY0lCNnZDSU9OaXNqTG5DR1FFRUZOVTdq?=
 =?utf-8?B?eEFDVFZMcEdwM1lsYThsanUvbU5RL1czZ1lKODhaMGYwQ3VSM3Azb0lPV0pD?=
 =?utf-8?B?Y2x4K3MraUZjR3NrRjFzWmlqRkh0ZGc1MFJCN0M5ZmJsVDN1eHUrRHJlR2xt?=
 =?utf-8?B?OEdHLzR0SDlLY0lSYmFyaHFIMWhDTm5zS0xNMU1sNkdjTG5yZU1LRW1ndVdu?=
 =?utf-8?B?aTVmcW9kZUNOZXJvZVJ4aXpSR2pKZHVVMEcvcitlcUpXR3NlcnIzejF6NDk5?=
 =?utf-8?B?U0REWmhJcW5QamJ2U09SZE5ONlUxRVFRR3BzcGNBTXZGYmZyamxTK3IrYWln?=
 =?utf-8?B?eVNrZW90Mmgwa29SaFJLRllpMUVmSmhweWdsMWR6NjlmdEZuVUtaNGFITFlh?=
 =?utf-8?B?SmhzN2dlc0FXK25pNmtQM1FWTW1kYkhwTExIVW16N3JLWWFIK0Zzc1hENVNO?=
 =?utf-8?B?aEhKVUZzMjlyRHFUSldJekJGYlBCL2ZCWjlwK2FMcVZkcktoQ04rcnd0ajJs?=
 =?utf-8?B?L0xJRDhacDBDZkRBWGpOWG9oay9Rd0Iwcy9saFh3SFA3VGx4bG9may9YV3Zm?=
 =?utf-8?B?emFOeHZoc1ljWVdJMW1wbTVoVDF3OFdWNThkUTFXZWlpYlRjUUNESXd1S1JD?=
 =?utf-8?B?L0hXcU5TMHpkN081ZEtJTU8vU0JaQ1QyWkdzT3VKMjVPcFBDMzltaXpOQ3ZU?=
 =?utf-8?B?bkJTeGt6WjZtTEQ1UXN6QUs2UkRHNmxlQlRIOGxSd283Q3VMOERPS3FYYStK?=
 =?utf-8?B?YW9tKzZxOEs4c09uazc0aDlKZGROR2Nmd09zL0l3akZCa2lOemRtVGtVRE1a?=
 =?utf-8?B?SE82UUNMb0hTOTJwdFdzR094akNRUStvYzh4U3VQVmVNczVQUHlRN28wVlJP?=
 =?utf-8?B?bHRwR2R0ZXhNZmxWQThuTzN3aytnTnIxbTFFd2hXMGx5M3ZuRkdTeXBPejZ0?=
 =?utf-8?B?ZWdENEhqWU1ZV01jOU9aTVhPdFplbzBrbENuWmZFT0lodVYyeXJ1YWZrdFRR?=
 =?utf-8?B?QTlteE9YcmZkTU9naGI5Y2ZOYzFZb3ZZNEp2eWNEbWpveXphVnhnVklLWlhh?=
 =?utf-8?B?UnM4SjlWb3d3UHJ5TFBrZ3YxUGNEYXhRNm9qZTI0RVRqSGZFTmRkblhRaVRK?=
 =?utf-8?B?cEh5ZEtGdm5uTkNGRlhSWi9CUGVLSkkrZnhZVGFBSCt5SHgvckFpKzZ3Y3dt?=
 =?utf-8?B?R2lYVFZ1K0VBMWJXbWdiOUZjcStySXk2NmRsZGsxZ1ZPbFV0S2EyNXZYTGo0?=
 =?utf-8?B?OHkzYzA4WnlqSzBsVFNhL3JVSW1lc3IxamtCekJQZXloNkdsa21TYmVabGFJ?=
 =?utf-8?Q?Yc9rZKECpOnQsnjbFWdey4NADt807MfFd/Y6FB4Le0lnJ?=
X-MS-Exchange-AntiSpam-MessageData-1: SwL4sRZdax1EAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f881b1e5-94a9-413d-5325-08de78cf1d60
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:46:48.1250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LXjuYmkfe5g08lqa2O18WogfuZJrN3ob9NIidc/GmNL8JK9M75Kk3IUxW5IPG5CdA7WgMpyr5apN8QFuxr3BYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
Message-ID-Hash: UQGOCO5CTVGW6PNUK7VWFOXDGZ5CMXAZ
X-Message-ID-Hash: UQGOCO5CTVGW6PNUK7VWFOXDGZ5CMXAZ
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UQGOCO5CTVGW6PNUK7VWFOXDGZ5CMXAZ/>
Archived-At: 
 <https://lore.freedesktop.org/DGSSXT7E34FS.1WGP72D9O4K3R@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 2, 2026 at 9:28 PM JST, Danilo Krummrich wrote:
> On Sat Feb 28, 2026 at 7:11 AM CET, John Hubbard wrote:
>> The sync/async naming that GSP RM uses is a little bit "off". I
>> spent some time discussing it with them, and the problem is that
>> sync/async is a concept that is somewhat independent of whether
>> a reply is expected. Usually, sync means a blocking wait for a
>> response, which is not necessarily required in all case with
>> GSP RM calls.
>>
>> The naming would be better here if it reflected simply that
>> a response is expected, or not. I don't have great names for
>> that, but "fire and forget" works well for what we have so
>> far called "async". So we could do create a convention in which
>> no annotation means that the API has a response that will come
>> back, and some abbreviated for of "fire and forget" or "one way"
>> added to the function name would mean that no response is
>> expected.
>
> I think the relevant information for the caller is whether the call is bl=
ocking
> or non-blocking; i.e. do we have cases where we want to block, but discar=
d the
> reply, or expect a reply but don't want to wait for it?

Such a case (block and discard) does exist in nouveau (RECV_POLL type
command queue submission) and IIRC it's used in the suspend/resume path
(code was added in 8c327a0660a4 ("drm/nouveau/nvkm: introduce new GSP reply=
 policy NVKM_GSP_RPC_REPLY_POLL"))

But, we won't have this issue in nova-core because we can explicitly
specify the reply size. So I think your suggested naming is good. I will
update the series with this naming unless there are objections.

Thanks
