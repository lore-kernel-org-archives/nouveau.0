Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE174FD8FC1
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 14:54:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A835910E985;
	Thu, 26 Feb 2026 14:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pwtEgjzp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C94FB44C80;
	Thu, 26 Feb 2026 14:44:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772117060;
 b=A7GfVDws8P930hKaoV7ZR6wsBDmIpWWmdnG1rK5bNBZT19/Q7/i/BJAmwlwf+z/PXQ98h
 lLrHMzgsaHazQREfX93qo5WX4wJqvO+sHg3XaxrstNdsKsRWdYzQztCiIJxg6E9oR2IbRiq
 KTNNyu+nLtNtT9bjvA8JVxpmHY371G40W78DzGvrOxSG2N6D/x9hWjlkff6mV0auv64NaMd
 O2ONbkY/V4HGrop7CK1cGn3WWlP+Zj8ctbSqGtxLBz7Bm0faIJfmssLzl+kcCvFX38CZBxg
 rHvzmJbcU/gN9IbkD0luBxrLj6d5AfIhGj0GC1aWsz0tdS5afALsa5fqPfEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772117060; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xt4Osgdah9SijIzLsYtn6RjjhLQGf2V7KNqzfiZwMrQ=;
 b=iscKmE5qyc/JW9bESg7FxFQf9sNSQZOLospfhuH3NUpKwTMSXI8HSObjWu9DbSzib71mF
 Jy6Q5vOzyLhZVVDr7XiK5GISrYS7oYBt3rhGUsmFl9ri9Yqfe0UYgSh6j/1PjfhsfO5AUyY
 6Dre5FlpcwsFc/4MRo0PBIBYHqpDqXqzl/xH3u8hbkRWs+1AdozfwwTHzLN6ECjfnM9IzEh
 2+151tZkfNc1gPSA5Yq4+u8uRI0O190SVs/uuhNTVfpytkAT6o9rOdyQAnupNeuKgseAlQf
 lQ2z886yE5VBn5yLeJI74sMH+XQtlhjd2+I2AWMjhwCNBhVx2Ux+ZwMsD6eQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E36E04429E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 14:44:17 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4E10E99B;
	Thu, 26 Feb 2026 14:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti34ejNJzbxybprbs2JU3MbfhmC0f8Nk04Q/EuFFzKmCerk6pxL/r6lX9f0czkutz+Ds66C5zF0UfKCIOA+yYXpjR+NtA6AzZQ3Hi7sGX+VwDqBaVMX5m6SCr+0k+ertwghlDImqH2IGFElYESZK5jCl1agUBEc1xFWgDxY4uN9GqVxxAAc8324NHIEBM16ZrCMBWBuAqSpP1kIUTdyHLwuRRp7bm63dN0WfWwvMZ0zbLdTIdW+4XPzPK04j6PbJnvqQ6NsreK7nWnCiXH52RX/Dao5VXT5G9H6LWm1gI4Bkba3ocJ1aHi4JsxJsx/qd6Aw0V4rlNwrwqeQNkWXlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt4Osgdah9SijIzLsYtn6RjjhLQGf2V7KNqzfiZwMrQ=;
 b=Yv75c14qS0c5NflxE1H+HPqoF2FXdVaqpchdtMHzJvPLwk7Le1NVn4HvXuXNIWlNM8luhc3iev6kttUvw2qDXmYeEIi9VHVWFcZWYUQ1cpmXl5vIBxOdfkTcpU3XnIVA2xeIjNRlz2JUKklz7GwAAH/r8ajBvLFNMFHHvZcQkGXeCpnaOTP+U0X38fSOP7mHxG++D2vIDb8/uA/0RhE16fVcegCP3zqoo8DWbMNolMMD8rsfqflsxGycQTCaePBk6LrhDY/9lm9m2TTAlUZTS9Fqa7bkYXPpErcNkBoqAseGD39rldiFWdvHEzSeBFC2+zjAXAJrOCBVrAVULtk5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt4Osgdah9SijIzLsYtn6RjjhLQGf2V7KNqzfiZwMrQ=;
 b=pwtEgjzpZuKbIGTEfFrhiR660YlZeggfH+ISOMnLQRo2+5MK3Woy+glqxJniju3kFd1tjwcMUd/gFik0Vbr7dyb/OX2h9SIFCX+Y32isxIBSSYbElxj/XfHW+mqoQvDvWmt6oosXwWIpboQR7rRbUFOYciAbFBM5SGE9RaMLAiMa+++7ULEcYTI505jXspDLS3FIWNISBLGkuykhfwwiKSGFQC8NK0xponbrwxdHvLIQgjt+Wlhb/QHHAQI7xTaGpHnDfjQAapOgjuQtFYAG3jbzEt8PDFqtGvmnWgBNoHfv7mGjAw3cbYB5ZwP3JACWffAIqAkkqIW6va6BHapHSQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 26 Feb
 2026 14:54:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:54:19 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 23:50:24 +0900
Subject: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d2566e-764d-4ced-48df-08de7546eb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	NA8+3VCiuaLoYazm+VYt4iU+gU6GbIaFX5ZHclCnKgBZGssff/ZyQr8wr49Zou6NPoDy0tE7aby/gIozhtYXFBK9fTBgm0Z8K9wE7Lq6+vfdZIPQze8X+nAlVYbTvJGdoFuPyzLjYzYIKXQBZ5W0Jigf4Zdqxt8AfDXDuAraruIJaMLIX61HdVVb5uOivtCz4d4E25P6HF+js4kmiLr+4YtD0CVzXJ8KOvKc++EGup4jAjsL1Vi1CIZbxe6WrKfxvqnn2hs0SXnSlN41lo8IJ8hHXa0HpKmMUqfKZExClGHn4HMZn/x0U7xz3WRZNaQ0+ySSSOgYUt3xYBT//tkmtQ0slxxWPUI/EfHJGYkhoV+gy1CZkgpdtYXWGLzV4WUOA+Kpap6vSxGzcUx4PhWD/lZeX7CDVUApVJo7JhpjyQ+XK7525yk7tulhWGgG3PNYNXCrhGwcIdi1goyT04u7wbCt3JN7pTO5f0PVmNMVDkFvjVPJ0aIPdxJLgnFYtOHuhkU4g9RYqZWtpHD/X47ziesCGHF8NOpiRZQIqIMRHo/I3VCc63o8rE2YQtih6XOSeai5nxz+APK3ZJl8HKq/7h75f79cc+gPaFCA3XJckr6aQFd+d6C5LGJUVOR6H/1UzieOc26EnWfDl7XpR4PIF7q8VUp43c7Bf3znLz9CeOdC1yLIQFf+tA2kfDBDNwbp7pCSxyDDXR6ughbBlKzIR0pa7Zu2iD5EBvt5Go0vZVE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUprd2V3aW1Rd2d5N2NpdmdHNThBZnlxTnowcUNacmFabjVrV0o3djJWeFFH?=
 =?utf-8?B?a3QwK0V0c01zb0wvbTZTVEpjTEluZmlxYVhkRThDZmhWRHJsbTBpeFhYT3FJ?=
 =?utf-8?B?ai91N0dWWFAxRCtyc1NmeEFYWHBCbGVzRWpHekMwN1laRnFTZ0c5UnpIZlBa?=
 =?utf-8?B?T3NIeFFqcmFySnMwY1FwZDRuSm83emVVclZGRkNCQ1hFU3BHYzhseTQvUHov?=
 =?utf-8?B?T3I0UDVYTW1nNkd1SHo3eDJYQ2FlMHI4aWM2dklIakhIS0lRV3EvQ0NPOExw?=
 =?utf-8?B?eGtLZ3ZRN0wxbUlzNHAzejB1WUVsbFZDYjRURlRlWGdPRjRidXJPaW9RSUlT?=
 =?utf-8?B?enA5czdXWmdrQW1jSWw2MTdXOFFiQkdPaWptQnBVZTRabGRQS3o3T3QzQy9v?=
 =?utf-8?B?ckFtMGhKMVcrdklnWTVLMXI2c1JmVHB2ZDR4UkhhNThIQlM3dlJ4eUxWelFy?=
 =?utf-8?B?c3JmMW5iVWR3UmhGbFlIbzJtZmJmaWdlaU16aXZmZ2tvSnFwd1FXTElQUTJr?=
 =?utf-8?B?UGF4VDBBR200SWZQeEtlcDkyYVE4TElYV0RSZTAyOTJKT0pnWG1tUGRtbDZL?=
 =?utf-8?B?eTJ6TVRJbERGMG5yNC93TTI1eWZFazRreE9kQVU2TzZXekJXRVpzNFBEdzZk?=
 =?utf-8?B?RzR4NWUxcFBtZ3VLTkxqSlJNMDQ2Sldnejg3RERubDUxVnIwZHdEYzlTNEMy?=
 =?utf-8?B?c3lRYW8rMXRGWG13aTZpYlZmMzN5a1NvWGhqQUcxN2Q0VDVJckdQZVlnS2ZX?=
 =?utf-8?B?MG4vcGhYK212OWZNd2Q4M1F6cHJBTDRCeXRkaE5JSE5SVTJOWnR0NlJKbFJ4?=
 =?utf-8?B?U0RvSzcxdVpXR2VLZDlYVGxXcU1nenFWeVNHKzJMcHllc25XbXVUSDlxKzB5?=
 =?utf-8?B?bnhzOGVVYTY1VDZsYzl1blo4bExCaTJHOFZTbkpHaGVmckhpT2dORFZJeUhD?=
 =?utf-8?B?RU1qS25IMlVWU1RnSy93SFN3L3VHbzdUQVNPWkpqbFV4bHdMbkh3RWIvTWpQ?=
 =?utf-8?B?UXNkc1lqR1MvVldyZjdYNVpabDI5UXYySFU4b3QzTHIrTmQ2Zk83TlhoVk9E?=
 =?utf-8?B?aHlLZGJpTXlkZGg5bDlsTy9pdGxPN0dDWDdRaGtONVRuTWVKM2JPYW5lTG9l?=
 =?utf-8?B?Y0J2S0xJc3hVWVVka05LZ2pNNEZMbUl5c2x1TnVDUC9oWExtNW1Md2dwSC9P?=
 =?utf-8?B?QlY2TkpsZnI2MHVwSUN6dUNBMEpSdXhiUTZQdGV5a01Ca0tRK2xjdm54Vjdo?=
 =?utf-8?B?dlJPMFVYYnluUDU5ckpHUGR6VUpqTnNCdVIyQng3TStLd3VCS0t0eHBRYmdm?=
 =?utf-8?B?eEx5QnRsUWdyOStCSWh4VjJSZmhQN2YvUUVOQlh4TVgvSnlMZ3RIQUZibjVk?=
 =?utf-8?B?SEpYNm1uR3ZOOE9xcmc0L1JJTmVmMmNCWUF0RmNpNWhnakduMFdVVXhKdWhK?=
 =?utf-8?B?MXRnWjNQem94c3FNckRodVVUWVl5Rmh2bzRtRk9PUFd4Yjk5QUhjZm1haVcw?=
 =?utf-8?B?UHcrQ2c0b2wvQndtcmFHVCtTWWM2QzArZUw2ajJRc1lUeExxYlJEWXdTL0ov?=
 =?utf-8?B?Vk95ZlVad3l5YTIxZkY5NkNXdS9YeTdHWlh6cExmUW0wYnpmVEw1YnkzRG8v?=
 =?utf-8?B?TGZ0eGhyM3JUMjhNclJmR3NqMEw2OCtoU2c4VTFlVS9tK1NLc2FrWGlJaTFq?=
 =?utf-8?B?NHdpSHVaRWJBTkZ2T0hjeVpxRVdUUnd6NVVNRDBSdENDa1BWR3FvRFg3czRh?=
 =?utf-8?B?T3N0OEtyZW5zVUg4azNjWHAxRGhhcjcycFpFRG1JVWNudkd1NjRPRjdVQzBt?=
 =?utf-8?B?NWhucTJ0bzRsSjBmS3pGZDQ3ZUZJblBkQ2VSbDVLZVNoQ2oySkdwYzlFYy8r?=
 =?utf-8?B?MlozczNUTUM5OFBRajlpbDkvNXpUQy9iRjc1c1c0K2lnaUxsY1dhRm9vQ1Br?=
 =?utf-8?B?dmJ6U2EzdFpWanlQK2JSTWl1MzJHalBZak9XOWdJOFFPY250RHlJZjlKSFRl?=
 =?utf-8?B?UEZhNUEzcm5KeDFnbEhoakNkMSt3YllNOXhMYUtJRlltZThYeHV2eEtOZ1JS?=
 =?utf-8?B?bWhUVG1XT2V2WDZoRnY1eG1GM3EyVWFNTEM0Wkd1a2grZlpFdmVkMWJqb0xn?=
 =?utf-8?B?bFAyY3R3Y0drTUxYcjZ0WEVmd0MzVU1sSEdVTXJ1NmpOd1h1UGtpdElxaWxG?=
 =?utf-8?B?b3Y4M1RFcGo4SnNSeFFuWDhrekxWZ2pXRnc4Rit3SXVRTU4yMzFCK0luN0FV?=
 =?utf-8?B?M01FRit3eHVHMG9QRnRKNGRtVldLcXNlK21yckdFbGdOVDJIYUFPbnJmZkN3?=
 =?utf-8?B?RUMzaHVobFlWS0ZENGtvNHVuU0J2aWdhd0kvQjZ0OEtkcjZpTVk2K21KMkta?=
 =?utf-8?Q?s/ucNrlaA+VGHSifDNa6Nq6e26IzDRPLg3YQBwnowUDhM?=
X-MS-Exchange-AntiSpam-MessageData-1: Kbc5M/p0iAiEKQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36d2566e-764d-4ced-48df-08de7546eb9a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:54:19.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +Aa5/lZ4HPSKAj0ISSW73a7rmOxhuBZqCOgbMMDX7j5FZOyXG4F6uBubXr5S9B4qFwecoQD6ijcrFdByfBiNmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
Message-ID-Hash: NRLD3UVBT7OVOF5DFMJ7TSLEAIPZZTHM
X-Message-ID-Hash: NRLD3UVBT7OVOF5DFMJ7TSLEAIPZZTHM
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NRLD3UVBT7OVOF5DFMJ7TSLEAIPZZTHM/>
Archived-At: 
 <https://lore.freedesktop.org/20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add sync and async command queue API and the type infrastructure to know
what reply is expected from each `CommandToGsp`.

Use a marker type `NoReply` which does not implement `MessageFromGsp` to
mark async commands which don't expect a response.

This prepares for adding locking to the queue.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  5 ++--
 drivers/gpu/nova-core/gsp/cmdq.rs     | 54 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs | 19 ++++++------
 3 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..55899eba75db 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -160,8 +160,9 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+            .send_async_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_async_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a3e039117120..daf3e1d153d4 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -48,6 +48,10 @@
     sbuffer::SBufferIter, //
 };
 
+/// Marker type representing the absence of a reply for a command. This does not implement
+/// `MessageFromGsp`.
+pub(crate) struct NoReply;
+
 /// Trait implemented by types representing a command to send to the GSP.
 ///
 /// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
@@ -66,6 +70,9 @@ pub(crate) trait CommandToGsp {
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
+    /// Type of the reply expected from the GSP, or [`NoReply`] for async commands.
+    type Reply;
+
     /// Error type returned by [`CommandToGsp::init`].
     type InitError;
 
@@ -604,7 +611,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -626,6 +633,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_sync_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        self.send_command(bar, command)?;
+
+        loop {
+            match self.receive_msg::<M::Reply>(Delta::from_secs(10)) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_async_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.send_command(bar, command)
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 74f875755e53..47ca31611927 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -26,7 +26,8 @@
             command_size,
             Cmdq,
             CommandToGsp,
-            MessageFromGsp, //
+            MessageFromGsp,
+            NoReply, //
         },
         fw::{
             commands::*,
@@ -53,6 +54,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
     type Command = GspSetSystemInfo;
+    type Reply = NoReply;
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -104,6 +106,7 @@ pub(crate) fn new() -> Self {
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
     type Command = PackedRegistryTable;
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -183,6 +186,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
 impl CommandToGsp for GetGspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Command = GspStaticConfigInfo;
+    type Reply = GetGspStaticInfoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -236,15 +240,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
 pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
-    cmdq.send_command(bar, GetGspStaticInfo)?;
-
-    loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
-            Ok(info) => return Ok(info),
-            Err(ERANGE) => continue,
-            Err(e) => return Err(e),
-        }
-    }
+    cmdq.send_sync_command(bar, GetGspStaticInfo)
 }
 
 /// The `ContinuationRecord` command.
@@ -262,6 +258,7 @@ pub(crate) fn new(data: &'a [u8]) -> Self {
 impl<'a> CommandToGsp for ContinuationRecord<'a> {
     const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
     type Command = ();
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -356,6 +353,7 @@ pub(crate) enum SplitCommand<'a, C: CommandToGsp> {
 impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
     const FUNCTION: MsgFunction = C::FUNCTION;
     type Command = C::Command;
+    type Reply = C::Reply;
     type InitError = C::InitError;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -412,6 +410,7 @@ fn new(len: usize) -> Result<Self> {
     impl CommandToGsp for TestPayload {
         const FUNCTION: MsgFunction = MsgFunction::Nop;
         type Command = ();
+        type Reply = NoReply;
         type InitError = Infallible;
 
         fn init(&self) -> impl Init<Self::Command, Self::InitError> {

-- 
2.53.0

