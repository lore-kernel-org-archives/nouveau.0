Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECEDE63F3A
	for <nouveau@archiver.kernel.org>; Mon, 16 Feb 2026 08:28:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28D4A10E1A3;
	Mon, 16 Feb 2026 08:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="N9vt+XwG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A2024042D;
	Mon, 16 Feb 2026 08:18:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771229907;
 b=pdW05SjEaAfpXP1Nmwf2GXmnneaku2J8gPnHMPM82Gzl3cybW2GwR3cwBuSAFGVBI0ndl
 1JPbo/M8qN5JLML01R1uZ9LHEiW+Jgm+kM7Rw502eIQG1DP72gr5dkzibeFbcSkPHR4koeI
 zUgEY31cM6lpcVSJBNxOrNlhEHvoVF7KRy/3r0RQ/sowAy49nacZrtKKLQ1uZ2xbBwj/xZ9
 ILBso2K0Hl8M1FOINxlJEzzp0otVVdrbmTDcXW6lXJmkakaVQKHDK/+DvNO211wwuaKN8cq
 CA3ZxtfBYCrQ/NYj2aHk12tWr0i9GLWd1p4cbFkeR5jStdjkG7SFd1AqLMHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771229907; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uyKLqz1crRcUbyi1X72829vpnIEFARBgPrteMdXASnc=;
 b=WOaBzt4JSqKp4CI8rhZ+uSf4rxq7q7MHfDkP8LObvOGrvqpZsg6YKObrajChmVia2S6Nj
 arbmk5qn0/lKPTCxGSRWfTcAnC0lQ62N80vZgOdHbK9vpiCdCdCVkuBTyINIjB4h6r7CyCx
 4JIWq1w4y8JJhoWSLIj/l9L6nYBjvsrngTaWkELLvuccrqfrZY5UlQsLdbK3J0UXvoRA1Qs
 h3Rhl2b+h5YhiFeRy3z5Vo2UiifMsZW3XhHGn70tQ4UHYi7m/vwzsaTSvEzix59TaAMPavC
 lCdvQ2cSDFH2Y6Rrni5PgzMHLDQX50w8u9SP5vaRYAnugRNYUielwdmJgqLg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=de.bosch.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=de.bosch.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=de.bosch.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=de.bosch.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6316440399
	for <nouveau@lists.freedesktop.org>; Mon, 16 Feb 2026 08:18:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 525DB10E1BE;
	Mon, 16 Feb 2026 08:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/F0bfXUuibI6NjSS3ay2RfF+Hcl7ILKEPV9bzdrywXTTLISW9R+fnlHBetALRU1+u0VbnapWNo3nm6vtxSRpgxWvCTDD+0uDBNSssID1FtyMc8wZBTPYC5X6juTArMBNrqOrmv6eR4qDVXlNcditdyOOFjZivcweTjGKCZJ99PgXT9lPjRjFz80HLwyUuxM/UhyFUcW6XAjILVTaAzOLzBEKigMZKJMDvDuoU6wdcjdJk8Z0JlRVK+oeVjKcl+s0IB0Dt30A4VcCwwEGvJLnU5mxX+Hd0IoBGfRhUjJ/i2fcG/8ssHFg0sHbuWPdOjss+y5b0a/g3s+7qazPhLFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyKLqz1crRcUbyi1X72829vpnIEFARBgPrteMdXASnc=;
 b=YLQqGuGa1Nd3BHlP1tb57n3t1Pr1g2d9CVOqCmYnS2MkwJk9CIdoaOnLCCzdXM5UkI3Wh3v4f9SNGaIJleV6yNDba5JieXNzpohvruM8TfByzNvRn8qltM35NudfUJbdGxCnhTbSXomN6yUVFviIXTbMmPtqSh7hybwZGQMg1ATJRN8J5gttaU0GfwUGyd1QdP0q0oAX52D7bll9g62or/GiGQxe51lCyx+NQhxY2JOKn0bfTo0yUnjxIvZVzzAtwDnpDSvmMvkzGQkOoeZuWW8QLrVkqmW9Z/Eqr5bFaXOz7Ye80VswNZdKSktoNfH3kAmrKnBT6miHP/QPwU5PBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=redhat.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyKLqz1crRcUbyi1X72829vpnIEFARBgPrteMdXASnc=;
 b=N9vt+XwGGVbRnZatZMixaz/BYMvQNdIQjKCIdrwslm/FiRTHyypGqhvMlsoOzzC6otAUi7R40H7pYSF5OaRboiNrPs4wn6aZ9qrEldqS/AOPrxxJzB+TnvsXIr6scxcxOs6YpjVjk+d224DR4P98E4uhRKKHFhId24CWVu08lqRlGSYPwroxhsk6U80VOHCytLsESVRZBjSNjUMQgkGSNk501fKas9hxQbyB1e6w4OkG/4a1hPoVN+iLK7+o3LyBoaZrsBJ+tSzQuSyfdu6KylsYJdxjYm82ScSSYG6S4SFxMleC8Y9S5WfZwUE9vwL8P8ToaG9pSPOVougj1q7buw==
Received: from AM6P191CA0079.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::20)
 by AM9PR10MB4120.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 08:28:01 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::fb) by AM6P191CA0079.outlook.office365.com
 (2603:10a6:209:8a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 08:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 08:28:00 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 16 Feb
 2026 09:27:48 +0100
Received: from [10.34.216.22] (10.34.216.22) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 16 Feb
 2026 09:27:45 +0100
Message-ID: <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
Date: Mon, 16 Feb 2026 09:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
To: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy
	<robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dave Ertman" <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Leon Romanovsky" <leon@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Xu Yilun
	<yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
	<mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.216.22]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|AM9PR10MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 1222abf5-359d-4576-dab9-08de6d354bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|7053199007|921020|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZGdqV0dIQ1FlTjFxV2w5VzNLK3hQSzd2eFRua3dwR1hvSllkNEZnSktVcW9u?=
 =?utf-8?B?VFlObTlYMCs4bHNNMUpaeHV1MVhTcldteWZmUTNGSHNLTElKaGJNckpuaU5x?=
 =?utf-8?B?M2EzcEN4Wm1lRFJ2Y3drUWZUQW92WlE1RTk4ZDAzcW9xVEdqS3NnQjRBM29u?=
 =?utf-8?B?cHN1eVc0dmc1REM3SEVIZ2VRU2lHY2grdU1BMnhEbmZscXBmYXRIa280WTNZ?=
 =?utf-8?B?dDhXR3dEVXMxaVZGTDBNLzlSMFJUWmN4bTRSaHJrUlAzejFUS01TUEhVRFZU?=
 =?utf-8?B?UlNRWU1oSkJLSi83MjhSZkFyTHJjaGh6eFVoRjZidFcwR0lTQks0RW1QMjlX?=
 =?utf-8?B?c1pwRFByUkRDenRZSXZCM1NLVTNLdW5NTXQ3RDVtZGh6ZmU1bkJUSEdMTG9B?=
 =?utf-8?B?bEx3SHVSZVY3YXBTL3RQZmFDbEdtbUVxQkwrUWFaZmVwMnJVRW5ua25YdEI4?=
 =?utf-8?B?U2x6ME9MZFJraTZKUFgyS2FLVTQ0NDZNUHgzaUphZ1k4Z2JOMG1IUzBLL1NU?=
 =?utf-8?B?UGZoazFFWXlteHlsZkQrMThNdW1LaTllRTdEMjNsYXBPdHdNK0Jnamozblov?=
 =?utf-8?B?TWNQYW5OOXdoWGs1THNudlpTRUxiTHRVWFNiVG55TFk3Wjc1dHVaRk8xVExu?=
 =?utf-8?B?VFc1dm4vc05sWmRKV1N0b2lqTGNZY3dmaFplVWpGWDZhbTYyWm8rT1NFeXA3?=
 =?utf-8?B?cXFmdXR1VVVsS2lNdFo5Y2hJaG5vd1JWMytiMTB5MVRha3N2L2dSanEvY0l5?=
 =?utf-8?B?RDdiVFVwdmFhSDVwczlZVGhXNWhEalZpOXY4ejU2V0huNjNFRVl4YXVJYm5w?=
 =?utf-8?B?M2RkTzQ5bkVEdkR4V28zMEpic0U1NmwyVkxPSERmMUVKZlB0b2RPMHFJNkQ0?=
 =?utf-8?B?dDg2YXRRWTVvSUkzT2NBOWFvZDRDRkFiUUNhM3Q2T3V1U2dhbWxyanVyMlV2?=
 =?utf-8?B?WjdqanlmQU5PbGtIUTZobmFvVFEwVXhLaFBhOEtaVGREUnNwQ1E3Q29oaW1N?=
 =?utf-8?B?SUtGWWlFdUtsZzl4aHpsVUxTQ0NXMTg5MHNSZ3FVLzdqSzd5S0VBcUZBa1M3?=
 =?utf-8?B?dTRpVFRud1FsK2YxU0FVZWhPeHJmd3NCUUJaUGtpRTNUVG5UK0ZxTjBEejRt?=
 =?utf-8?B?VytKT25OalVOWU1lbmRXVkJqVWRBL0xVclhVRjhTcjZzWWNBTGVoVWp6ZUxI?=
 =?utf-8?B?YWVtZ0JWZHFqOExXalFVNEd5TFVPbk9ab3grYXZoaFlrM1ZvUzNqZ1M1VUpV?=
 =?utf-8?B?R2RwMGJKcURmeEFwcTZGT21LSlB5MGhkMUw4R2M5UGRtelY0bE1rUzNYcXlZ?=
 =?utf-8?B?djE3Q2Vpek5iMGNZOUdsdThPNXVHQmhBM3JGUzFLRVVDMGFBQjV1bXlYQ0xs?=
 =?utf-8?B?b1JBODVHVzc4TzlocEx1UmltZjZTQVc2aGFaL2NZNkJLZXZ5M0hhanVmZEFa?=
 =?utf-8?B?b1AreGNIa01BZ3FLR000eC9lMlRSSXRyK3lCdXBRUFdsRXE5UmNNNXpZVmJt?=
 =?utf-8?B?VDYxTTN3NFRuVTVML3JRSHpXZG05ZmhiTm85T2pCUlRMVm4ySXY1eEUwVnJR?=
 =?utf-8?B?ZlB3WU1VazdpNTV0VjkwMmNQSk9YTmtmeXFjaHhGSktlR1AzUzhyRnAyVm9Q?=
 =?utf-8?B?Uy9KdEVCWDBIdGFhN0dsWm5jalpwNUxCMHdFd1kvYWhIK1JHMlE1MzM0RU12?=
 =?utf-8?B?Z3grVDk5Zzh2eDJYK0dTdGhEQThiTUdKVktDdThzQnJpbFZTQWRnZWREV3dF?=
 =?utf-8?B?VmhLeFpXTmhQRGlDTmdQSWlJY2VtK1VaQVowM2Fxa2l4YkhtYjRLNUZqNXBD?=
 =?utf-8?B?S1cyREFQVGZHRUxvWXQyRzJiVG9qTkNoeWxhVENaME9vNmpnUlhnVzVOMERT?=
 =?utf-8?B?aUJQMHJieWxSRUgxc0E2YXlLOHpONjZkNTUrazR1RlQ3RVNRMnZzZnJFekhR?=
 =?utf-8?B?YnA5K1FzVmMxOTZvK0szaTRTcnN4QlFBVmxwSlh5WXk2SllsVVdDeEN4NzhL?=
 =?utf-8?B?NXY0RkFaMFBtRjRFTkZ6NnFrTnJvYUFVYzhnMTNheWIxdnpHeDdQcDU3bmFV?=
 =?utf-8?B?TUtTdXFSYjBIbVcxdmVGZGw3OWp3bWp3dnhQTEhxM0JPYnVGTnV6eWtSWGZu?=
 =?utf-8?B?bFFIUm5haGM3V3pHVGFUQlJoNWo5SVJIQWxFMGhUWitRdDg3aTZOVlNWZFpJ?=
 =?utf-8?B?aHMrTVRrT1QyWmU3VHFjR1AwMjlUNnpiVzJ1MzEwVDZnYXBXbHZMNEZmSjkr?=
 =?utf-8?Q?Q4X3KD2A3qja25z7KEdDnVpZPP/2M8xxAxdlM4JYnU=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(7053199007)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EqvrYIi5+AJNIvvLhH6TaS7LWgRIISswxcRwxLBuZ1ycl8SqMnP/KIe6DidTOyQtq2+ZVybRPtqhtr58tFC9+A57vWTISAvOpIRjsY6XCvHuzkdZxt1kx3bFW5A+L6ASk7UrwY7ylRBJ99iDnT28txrJCFP5oT/0VV/gnoz/gwZ3Dt6jmJRQbmk7zNAKixn4AuedcmWsC80vW/5vdMurh63G7nR0TQsifav4pYi8ATxjxWUP9aG64DbFk63uPL+LxPBcJSBP0FyNAvXZvRf/scmvEW4YryHrsgqrrnF3qz8wWz0eWwXv/tmcarsag49eyx5D9fX6eYW9yQT9g63bw8zIPr6ZGaZN95bVFF+aWiQhdz4EzcdZxmeTu5T128G8p/qDn36lesDGGK20U0vVZ2qG1TpiB1TDYYU7/33XOlLYHFi2kQ9+0WuyU5C9GKUh
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:28:00.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1222abf5-359d-4576-dab9-08de6d354bdc
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4120
Message-ID-Hash: KSC3XTNV3NXJ27MTWII7KERO6SRFQGEW
X-Message-ID-Hash: KSC3XTNV3NXJ27MTWII7KERO6SRFQGEW
X-MailFrom: Dirk.Behme@de.bosch.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KSC3XTNV3NXJ27MTWII7KERO6SRFQGEW/>
Archived-At: 
 <https://lore.freedesktop.org/0e762787-7270-426f-81ee-b24761617c18@de.bosch.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Peter,

On 05.02.2026 21:59, Peter Colberg wrote:
> Add a new SR-IOV driver sample that demonstrates how to enable and
> disable the Single Root I/O Virtualization capability for a PCI device.
> 
> The sample may be exercised using QEMU's 82576 (igb) emulation.
> 
> Link: https://www.qemu.org/docs/master/system/devices/igb.html
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> ---
> Changes in v2:
> - Use "kernel vertical" style on imports.
> - Demonstrate how to reach driver data of PF device from VF device.
> ---
>   MAINTAINERS                       |   1 +
>   samples/rust/Kconfig              |  11 ++++
>   samples/rust/Makefile             |   1 +
>   samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 140 insertions(+)
> 
...
> diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
> --- /dev/null
> +++ b/samples/rust/rust_driver_sriov.rs
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
> +//!
> +//! To make this driver probe, QEMU must be run with `-device igb`.
> +//!
> +//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
> +//!
> +//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
> +//!
> +//! and append `intel_iommu=on` to the guest kernel arguments.
> +//!
> +//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
> +//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
> +
> +use kernel::{
> +    device::Core,
> +    pci,
> +    prelude::*,
> +    sync::aref::ARef, //
> +};
> +
> +use core::any::TypeId;
> +
> +#[pin_data(PinnedDrop)]
> +struct SampleDriver {
> +    pdev: ARef<pci::Device>,
> +    private: TypeId,
> +}
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <SampleDriver as pci::Driver>::IdInfo,
> +    [
> +        // E1000_DEV_ID_82576
> +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
> +        // E1000_DEV_ID_82576_VF
> +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
> +    ]
> +);
> +
> +#[vtable]
> +impl pci::Driver for SampleDriver {
> +    type IdInfo = ();
> +
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> +
> +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> +        pin_init::pin_init_scope(move || {
> +            dev_info!(
> +                pdev.as_ref(),

The `as_ref()` in the `dev_*()` prints can be dropped. Example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/samples/rust/rust_driver_pci.rs?id=600de1c008b2302b56d69ff27d12a9d8d14892ac

Best regards

Dirk
