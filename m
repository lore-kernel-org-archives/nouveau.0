Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4ED10F92EB
	for <nouveau@archiver.kernel.org>; Tue, 31 Mar 2026 19:19:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65F4510E956;
	Tue, 31 Mar 2026 19:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NdTp/TCm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE49D45334;
	Tue, 31 Mar 2026 19:08:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774984082;
 b=yMy/vHOz60lj+pi/EhM0mVMyZ9cubuFC+2DpSnE6w2E5zGNpPaqsKmj6kw+DvyiBF9Rpy
 kAihwqwxw4b+fx/GpPZ98FsBsBs/DTaYDLyUWLZzfdWJJGnROIcsWqfUlmDLgnYK0RJyj2D
 QLWEDU5kbHtAX+F0haf0XQ2Mu4GMvcK6mag16mDM3JQyX3AV2Q6y+RCOqWJSyJBk6mcOhHr
 a0UYvN/2jwx2bHxlEZxz7w/syKI09cmAw9yMyLVPCY4ZFUv2D8EVJcN7MHh+Ev0MZbcAqx4
 Zf6qsWMxnH0EzaGclgjppajww5QYWyah4O6rEOHXvE4v6glOYbQ2/qmp3ufQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774984082; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=geq6d+wPpzCJQjzxASdTKxEhby87HhIhAAVADJVoZcc=;
 b=KQSZboOhxTKr0KN8JTFpOtI/6PgbhDzZs82ZtoH0xcctE1SMGuoH2O5DGKu5FGtclOow8
 KADQxsEjJdlatejnHzxZ5ql+HPoJ2QEBnxPirT6ou04QKPwewnx8vUI3NbfhqTv+AfIZMFV
 Zw94C/AhsDKf113Bd2sDDdqF0CUKBBv7daWsIFPLIyhbb88pXDlvDWhOa0CulmgHD3kVUPD
 y2kict7g4kx87KhuMNu3gJ0ywjb4BLQLxedMBwMzuYytur9CjieZ0MbcsgcdkVKByqzDybw
 c+lrvVm+F3nHFl64iwLQLmad5N+eUOmoak/MFnSa++3740AagEUInX19Voyg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0037E4503C
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 19:07:58 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD3D10E2A8
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 19:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc3mMkCBJC6PuD23Zh16EQ7hfh7hu9n3IEeANS2IYN9ndqO8UK5AKDfaSSFukVrLTu2DzUfnb1KuqR8PUxSdAwNX5rvGUAzrhGECjsOVe915ItUXTPzCQd6yTttiS9tZSLhhZGPhvlGHE0jsQX6WElBnHhLvIk9Dvg59X3G/sX4+QJJvxKhF4Sp4i4mcaKXj+46v6BU5WZD2tktK6XfKTXyurTesuN2VPE6QrkuHhQhEa/o5UJaMX9qDmvWnbBjL6ctSbkjZ17joYvHw3aHdqLy2a8xmxLw2Jo/8WdxODQjbDttGgtYvQUCIPp4Fk5NH1ks1j/SrXIcBfeZohPJxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geq6d+wPpzCJQjzxASdTKxEhby87HhIhAAVADJVoZcc=;
 b=M7PFLeEzQ8kUxOpMpT94LLshoo4lz27UTu9jb740l0nrqx2+HTciO6WM3gyVG66UWSiWtPEx6392utPiF7feXdAMl+GfsWohpofeMMYZst3tAbMtfTziBAjMcPPYicZAc/9HvJQ3CkzvnluuHB198/t+EeiWrD5at660lmCkRC+M9zqJHrJPGeVzD1GtDO6kHTFxWQ/564CM3f0mDzPOFX3Gt7nxFMDZHrmzHYVxrRXLh7j9R31jKVF8UWKLrH/xv/nI2njuajqKBgRpdL3UX+sSNKJZy4jngc4uPXt9g4DS3GwRbybkuO65wW6HMJKMHqYDoSuBC/lP9ODIjz85lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geq6d+wPpzCJQjzxASdTKxEhby87HhIhAAVADJVoZcc=;
 b=NdTp/TCms+Mpg6EDdEMi2JcvlOG2ZpvoEwZ3cQMtEJpy1eCCkUlNKg0ORtc8b4rV6lRzY3rqoLFSXlNvEpxfcBdaZPnFpeWOTQU2JSuefjFy4k5qy/GoiwvdVM6SRj79OoJuYRnmu1pk4JgHYDL0TGKmlZYbAOfZc6N8ZRN4jyY1e0f7nJ8+L09P6QiDEZwtPEOcEu8V0Rs7rqYtiFt5YmRSFqhNn8A2b2TeCwezib6SWjzt6hwzJCUNcnol8e/lFXEnsQzBiZDM4m7ChtnfHfB2B15Jl+Sfz2/xA8LchIxtSSOxlc26S27Ct7XKujQ38ZCbtYjSkR74mi+42xc6hw==
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 19:19:14 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 19:19:13 +0000
Message-ID: <df39d2ed-02d2-4b2f-aa50-f4447ac058cf@nvidia.com>
Date: Tue, 31 Mar 2026 12:19:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: fix missing colon in SEC2 boot debug
 message
To: David Carlier <devnexen@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 nouveau@lists.freedesktop.org
References: <20260331103744.605683-1-devnexen@gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260331103744.605683-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: e89a30fa-2006-4523-29bb-08de8f5a64db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	GG7XHMS3ebeyavFlAlMBl8B5ejePib+EEpGkh/atqNk9Yiz6YEx4765wEcoVNIazg+Vdk3POlhNTwkddLH43q0yLxb/RdcNmGwFl2zVte7hvpfFA242eOSlXKIRECjwawKPCHjhnWaNaCQArHzOKGPmIfrl8ZSltmABdWGNAAGSwOu7C/005ZYodDIZdGTKmp+G9IzJYAF1RvgwI+1mlfHcNCIRJbSaP1gD2PyiOu7AkAiCY9fxuA9Xh+rXLWsASaCJfHxtMLWT8/5fxrkfx6kDVX/Q6+WciHr8bJ8ZSwsryhl08X4t7UXYh4R+GL+Pl1E/Fze31R+c6Oqzwhqm9/DjjvFh9sk7a2qon0lxWYlaHXP5oVAtXcC4vVMgYv+2w4rBQbSDXXY8JZHyIgurPYoRE84LG7uTxCUqCvVRuK/ESqD1/0lEEUKKPxTnRHNehKG2vFbH0RtDCz15Buh15rjaFLJR032eFufnvswES2/vtfj9jVRdkzThO8H480aIvauze8fXU9DWGaDYQvLYx447jm9o293oQHcWqmtGhi9C5u0cG7SJ5DnhYBNWMWUSTuaSTTjPrhIHKLRYBH8e2T9Gmstprf+NJh+/+uRpVRfYarThwfG1ASWptnFrNmgEyuOcfpwKfkm0XjgfkO7bYtV1EcrG+iFVF9piJjjxKV2SAWG7eeP9y2C0kUdbQ3FFyNezBQdV65m0UgwnjPcvUFxHRSUAHSNgy5hgMEd3InCMj46kmHlS+pOgA+kSAVTntiL1pI0EDP6geAlRV1RWFXM6xz6QbWQE/IEvCk40ysWw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3hSWXl0MXByc1FLU2dOcWZteG9qdk5HVUJ1S2NZb0ZKOUpQeXJMSHVYQ2pG?=
 =?utf-8?B?R2praEFOdjV0VEhSYnYwcG5RdFJ4RVhOekhGVE1kMTdueUFiN2VXQ3ljWHBH?=
 =?utf-8?B?ZHV6OGthU2srcGRWdVo2UExYcjR2Q0E0UEdpNzUzYUpjM0ZORXhzeFJMbUdN?=
 =?utf-8?B?c3VXNUo5VlVTS0JvQ01qalN2NlZFbVdpcFVHTVowV2RpelhTTXowMGk5azZ1?=
 =?utf-8?B?VGErRWE4Q0FwV3FmZ0dNVTlGMkw2ZFZEajNUUXBxb3RYUU9KMEVpdjc2UDcw?=
 =?utf-8?B?ZWx1cnZ3UUxIWDJNYUtBUUk1bi9md25Md2Z4TW5ESytiVFE2Sjg1V3djNDZs?=
 =?utf-8?B?bGRxc0RoUTZSdlNORVJsOXJYLzkxODdvalI2b3BkV2dBeTVYSnN5TzU0ZFkw?=
 =?utf-8?B?R0ZEVTdSbFpyNWdkWmh3cjRKdWRFd1JRZHk4QUFMVnFkREhsYlM0dmRJTmlh?=
 =?utf-8?B?WDhrU1BNMVJtb1p2OHMvRHBwYmtGNE5nR1l4MXh6a2xhQ0h5VDBiODJ3Wlln?=
 =?utf-8?B?ZnJQbkdzQ0pjTGxvTnhMbEY0UUs4U1h5eGdNcnhWRVREbzQ3anlFVmJsZE9r?=
 =?utf-8?B?dVZkMWs1emM0c2poWDRIT2NMbTFUNUd2WiswWU9IbThFbDdFaXJQT2pOcWhD?=
 =?utf-8?B?UGVVTXAvMEM3cG5GeVM2ZzlFWUFpTU9YTGVSOVdXOFR0YmpMV0REeXlFVnhh?=
 =?utf-8?B?UERTYWhDWG1NTC81b1VjNGxZWFJwUjhxc2xWY0Z5NVF0MGtMaDhiYm9FNGJD?=
 =?utf-8?B?ZUZmMjBFdnowdVBzUHh2d0JhcFcySlp3SFN1ZDJPTXRSUXUwa2V5Z1JrYkJu?=
 =?utf-8?B?LzNyakMyVDlscjhuTlNTS0NmaHdOZFlGUnJPN1pPYW9oekZpR3Izc2dYd2tX?=
 =?utf-8?B?M1NiVUh0cG1tUXZRVU5mcHNJRVFhOUlGVFhYN2dFSXB1TjVET0RFTWVkcXpn?=
 =?utf-8?B?U0hvYTlpVXQ3Q0J3UUdpb3FKQmVzc0JaUU10QUxDVlBWZjZBV2orYkZhRUoz?=
 =?utf-8?B?Rm9zczdBMk51TldiRkx1SDFaZmRSbElEVTlDVDk4VVRoTktTa3VzUzYxRnQr?=
 =?utf-8?B?UUlmUFNGUXF5eGlLVm9LbFY3Zk1FQ2ZVTmdsWGJVVE5pL012dDJqdkgwdlg0?=
 =?utf-8?B?LzZ4UzBkQ3J3V1dJZjlqdlBzZkRxY3FoYjc5QnVzSERRQ1lBSU96bXVXQita?=
 =?utf-8?B?WUFrYVJTbUZZbTlEZ1RFNjB2YVIrbExSeTFYcUFYcUF3MVIvR1d1S2daVVoz?=
 =?utf-8?B?WHNKWDU1QkI5QWJzM0lnZTBtV2ZtVEFjWEIxUVZGZE9TQzJ0am04UnJLNElF?=
 =?utf-8?B?bTlSc1RoTHduZWU4d3hoYTNYdDc0SHhWWlR5U0hYeER5N01VTjJsZU93RmR1?=
 =?utf-8?B?VnZ2dEs5bHgyVDd0MFZ2TFAvTlJhNnVsN25raDJHczlwVlZsdHUweXpLbmR1?=
 =?utf-8?B?NnRiOVl0OWhJbWo0elFRa2pSbTdlcGtYNUk0cnFBRFhpbkRHbkN6NnErL3Fv?=
 =?utf-8?B?L2xBTmJ3blVLazVkRCs0ZThNb0Y0SlIydGdpeVc4RDVYamN2MDRnVm9iT1F3?=
 =?utf-8?B?eHFXZlROeGVqZmtSaWxHS2RucjNNWm43NnlyWlVoSTMwK1BTeGM4WXpoWkVF?=
 =?utf-8?B?OFA2cUxNd1VrbCtHN3ZIK0xFTjJkeXJvZlNmZU1XcmZUd0o1YzU2MTRIdk5G?=
 =?utf-8?B?cG0zc21YSTZ3SWVxdmNyV2MwR1JwMFlmUzdmQ1hkTlZxZ3VVRjBLNlo5d3J4?=
 =?utf-8?B?bW10ZE8ydUJacm9PeVUzam9DQmJJYlZSZGdmbmVwMk0zMWdLckJvelpZUDRC?=
 =?utf-8?B?L1hRYkttMzRFL2dnaThEWFlTQXN5dVF1NC9rdjJwTHcwNzQraWpjY3IwSC9n?=
 =?utf-8?B?MmZYeUYybW5ReU4wYkZyZzk5YTBVRGpPVFVhMFova3o2cWwrMXNsVlQ5NTB4?=
 =?utf-8?B?NmpjZHUwbUovcys0M0VKSzJaNVJGaDEvVjhUMlJxVWNyM09CWUhhQ2pueklx?=
 =?utf-8?B?M0VXM3JtcXZxQmR5V3dWMmZadlgyb2wzc0FnVXJaWSsxVHN2UGxNVnZ0a1Bi?=
 =?utf-8?B?NUFXRHdJK3A2U0VSdXdMK0YyTXMrd3FSb3pqVFdtYUNCK3E0L0Nka0Q3a0lu?=
 =?utf-8?B?dHdpOUJqRTRhMnN3YlV4ZU53cDI4eWVnZUEzR1VvT1U1VklSSW45QmdGY3Ay?=
 =?utf-8?B?NFRSeUt6SCtTM0tqV1RodGpaWVNQTThqaDl4cnYyTjJNUWU3VkNjNm1NNEJK?=
 =?utf-8?B?c211MWZ5cVQwYWMyRWxXKzI2Ym15Vjl2Qk9NWENWVk9kd0gxOWx3ZHRzME43?=
 =?utf-8?B?MnkrbzdPaHlONytyb0orS0JtMUFlbHZQTnRNM0taS1Mrb2RFMzJVUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e89a30fa-2006-4523-29bb-08de8f5a64db
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 19:19:13.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MQqr7QDJQtCufqwbfnX+ed4YP1qoaKw2wUBj1+KnyxekW9mz2DYzOzJuZ39utKv0wvFUjDHBRFJnKGYq/oC6xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047
Message-ID-Hash: NG5JVCDX3OEO5UIR2N72TZJOPQQIXEQE
X-Message-ID-Hash: NG5JVCDX3OEO5UIR2N72TZJOPQQIXEQE
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NG5JVCDX3OEO5UIR2N72TZJOPQQIXEQE/>
Archived-At: 
 <https://lore.freedesktop.org/df39d2ed-02d2-4b2f-aa50-f4447ac058cf@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/31/26 3:37 AM, David Carlier wrote:
> The SEC2 mailbox debug output formats MBOX1 without a colon separator,
> producing "MBOX10xdead" instead of "MBOX1: 0xdead". The GSP debug
> message a few lines above uses the correct format.
> 
> Fixes: 5949d419c193 ("gpu: nova-core: gsp: Boot GSP")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index 6f707b3d1a54..18f356c9178e 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -195,7 +195,7 @@ pub(crate) fn boot(
>              Some(wpr_handle as u32),
>              Some((wpr_handle >> 32) as u32),
>          )?;
> -        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);

This is also fixed in my Blackwell series, see patch 28/31 [1].

[1] https://lore.kernel.org/20260326013902.588242-29-jhubbard@nvidia.com


thanks,
-- 
John Hubbard

