Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE53FFD88C3
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 22:20:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC76310E790;
	Tue, 10 Mar 2026 22:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FNwl32Ae";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90A7D4503D;
	Tue, 10 Mar 2026 22:10:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773180610;
 b=vsiQx1YuqLvh9Hp9GOs51KQJ72RFL0Pwkcw7r0uLHsF9FNzTV309s1942sxyV+N1qEeA5
 acBd1XCQx2EidL/ZmwIOsu1eU6ozE1++p8f+Rm5/wua68XkU9Kz5tVD1cOYt9gibMnP+7Av
 Eq6mdxNUNS2M5VcN9cLGjzVszMq3Q/23wrtlC92M9Y4urprzvkaB+Iwjm7cEmrepE3Qlo2B
 DUTg58+AV5GTF+tGN5dt1OjFPeQkGvRyckJ4+SK/6m6KTXRbmQQJYwbxPJihBF3KddDosI4
 9fZ9/+U0DTcYx0n+DDUKtchLxNjTAf6GHtpvWR1Ouzx340rPtcdf5xcHPo6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773180610; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hk6sonUL3O0iollcqyQojmJC0AZ6fl3bI6tj21+PN8o=;
 b=et5jxiOwpSZ0JD/00Ac2HniQU6kvH4mWgzzvAkgZuqmGl+wnzKkyVwGuynAfUw39oTT4b
 Lhy/7gisw+p+1FOtcL+3JZ5vgrGwrkKSXKwMy8zYM1hORf35tKJq4bTQtK+JBF82gnumi9Q
 oGCj0KrlvRlKqVlyPk8MiLZceQg70Mn44sevyTanSrNd2vO0wdMA859ix8uOoQlGKLk31PE
 NqKhEzxkwufwZXu8PSF6xW4w6AQ5Rl/tkOhhXa97pbZ5HaDiYH+Ik8ekq8GLaVfqzYtXQGB
 p1/c9duynBLKU7kKg7rWVNXLeqxkkL4LNX9oS67ZsaIcq6ghQgs/X/vqT40g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0D81345023
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 22:10:08 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013024.outbound.protection.outlook.com
 [40.107.201.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC3E10E78C
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 22:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUEFT88DrbHiHEiRpCCpCROTSJAipazDQ3ArxThT5Yo6D4QBSk6Ts4Vx81j1co3OClFx2RtHk085QgzNjrS8xeYxrptE615IPsbCWLjCw+ix+Vbxz1+2dD07jJKHuKFQS6klr/GOodfNrp9LGx4YW/RREyf+vlo6sbE1S+98okel07Z50lz3SqO9G2WZ0nB9nXADq4bw6ZfEMu4JjjcqhT8/6p7Vl5uB+asflZvZBXnUIUQik7wvCV05Yr5kayX4ZkTJGwhT6RIwVu2Hfyjz7UpoDu+CrINN0pGbi04dmqv+2QJJzAzuYgTnBWLJn0BgiTHGFofROTqidrk+7sqKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk6sonUL3O0iollcqyQojmJC0AZ6fl3bI6tj21+PN8o=;
 b=XA5ndRVacqevEfKJMl7dDNsLgEbOW8qeZDYkC1+y+Mn1kwByqkbmSPoLhZb4JC6dB8bUPMzOOa+Oq/8spIXI21V9YGJD5lcShNCPDwwUtRYbUt8AHdb5Ed5WBpF5wncNu1wWMdq1GVdYuZcI2kyV7fzuyP1Jz0q53hYxaxXqfL6lGsqkCII4AabqYKOVn3HangJp3LHyCSSwHzz3kf6B2Zthjs/JlGUlz3v/XdJSO3g/JsKtWuA1KAsjZyYnJDIPaNGImQoiKm/LMBq2K7SU4nT7zfgJNrDe0pGuMnZ2H6zxAoso14QOkqGF9uZA2rXm3u+ViX6nqZ1xny0CWPoKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk6sonUL3O0iollcqyQojmJC0AZ6fl3bI6tj21+PN8o=;
 b=FNwl32Ae+hy+0xI0sX8FMrOgltqyFwPUKLcAw7Hp0E+XI6pzomDV4c8MvcoN0YPpi+qXZoMeB3YvqUycPS7ndir+4fIZXs2HoL8hHAH9nx0fBkD+yTUzlK/qClvM+LfECJhAJsliNt6F3Ah4utdwxHGHNSX6IyqHR7hoxN+PucGyy3YgDEn6KDlYHdjKeqpu1cMEEgXrz5VqZ2524J3BnjnFV1CCE5IWLw7/QSUgvG87sZlQX63bPZvEMZQC726I/aFrLhsO028QrYRWV8L6AEWPgHH0x6QTcvAKO3au5jZ1SFROtcLYExCXPfSZLgBg98bkvd9cYWAOxghcqyQyCA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:20:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:20:29 +0000
Message-ID: <ac9783ca-ffe4-431c-95d3-3c221d17c8db@nvidia.com>
Date: Tue, 10 Mar 2026 15:20:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2c61d9-1847-494e-5ca9-08de7ef33c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	x5vpnF5T+eKfpAMAGSq73JsCj/b5o2tV0V9fHLsLr6qYVZ9IiZZJG4Ns9pOD8eUIMsLh33iBF3oGDCHl4bbP9F3KLXa9aLbuWO0Yrtf/sojeFtJNzqd5DgJCFF//uMLUqjuOegePFgsKLJ9mGvmXDHIRq6RtPVqsa47eFJPF4voSq81kY5/Aq30Y853XzXDn+k9x6+hazLzB9XaWMjJVQ1cjrYXPJW1cV1Du/Vv8h60kO6moPCxJ+Vv1bzhqI8EFme6zVcyliMPNNb35iFtWfq6roih+3lW0Qm2iZEqsFg+FTLNiPW4kfrmFiGENYd81TMXkY5XEhmS6XA6siirIbQlCi+1m9PZ8YBsp6pJwM9HDOIw3c09g+zuVcIpgOoOoExnPmdRJGEWPpXpUhNTKcPVK5D4OOqBOVGX0URo0h2MxezNNxqFEknrpEIVHsFqmhiqeh6quRBR3n4uJYnpaNmk+JbG68LSn2mFDQlg3Pdi65Y2z1O8a0O5mpSgxqiBznC8oTYDXL+kRfGm/P9IadGhgl/+JvALlcf8q/rHLHH77zZrVVXXCl7bKSJZl3y0z5mvIFKJFY+ZXaFhQtWFB6aW9bKgd5N3MU2lTtsmE6U6QDl+/+KSQjz1fha+mDXCdSEEzn49MK1DE3NDDM0BXxYAccaoPTvy9CtE3JZLnyp4OZIX9iDx35tQbBM2NBd51R9ezgdJeotDR04y8nM0AYXEdhDRgUPI5hon+ibmWjxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3N1ZVllRVpuNmFlU1IrZzQ2bTFnTFpCQXp1cmNadW5Na3g3VnAwaVQweVQ0?=
 =?utf-8?B?UjlyZUVoWTlqZU8vbFkrZmNlczJKME9SYVZvVU1rNS9TTG1IaGZaeFpVLzdD?=
 =?utf-8?B?L2lWNTMyVlZaeVU5Y0QvZ1Jvc0MzdGk2MGQ2b1U2VHFtNXo2L21TYVpaSzdL?=
 =?utf-8?B?WUlXN1VFRHZFbTUwZmQwdjZYVXg0aUptWFhoaGxJaGRrdyt6RFgwd083bVg0?=
 =?utf-8?B?RXZyYTB2eHBjcGVzbjhrTUhwY2dRYm0yZktQS0JZN0lwVGhPUktidFFnZVZE?=
 =?utf-8?B?TEM2bngwV2UrT1llVDBLRHY0RHN1bC8rOWc0cEdWeVJabTN6cHF5TXJZeGVE?=
 =?utf-8?B?ejBPbVJQaVJ5bnU4SDdMbkwrdDVVdmRmcUw3MHhLKy9vYzdwaDc3Qi92WGFY?=
 =?utf-8?B?R0dNL3QrVmYyOHI1Mi9RWVd5dGMyTmgxRlJMQVRJNXc1WjRwWDVoSzh5aXdD?=
 =?utf-8?B?NWxBd2IzbHZRRlYrNDZmOWlidGp6TmcwcWI5MnZvSzcxanF6anFVa2c2d0hl?=
 =?utf-8?B?Tmo3WmcwWjY2QnNWS1l3QjRpbXQ1WkxGbndkZHdjdzRjbE9MSkE1QkRjTXlq?=
 =?utf-8?B?K3lYWjZSSG1ZcTArcTVYTEwxYjA1RjVVUWIrNy90SDdsVGZHREJaZFFLdGtX?=
 =?utf-8?B?YUc3b3hFYUt3MDJJTDZMaGZMd3UrbzRCY2ZKQzQyL0ErcFUxVjRYaG03LzhD?=
 =?utf-8?B?MDk1NHN2V3JCOFp6amNhanBOS2hZeERpRUxjOWhMcGNJQkRDK1dxRTJvalI0?=
 =?utf-8?B?RTl4OTZWV3JBMktDNHM5S0EvWFF1RkswWGxBczMvdmtpbTNuYVFZQU12Sm9V?=
 =?utf-8?B?SVhRZHNQSnp5cnYySEdWU1pFWXdzS2lVbWQ4ZWNDd2R6cjdrREhXdDRhVmVa?=
 =?utf-8?B?bjY1ZSsybExUQWt0UDJVbUd5NG1ZYmg2WWdrTS94MTBHaGQ1TFEvNkM0UWhz?=
 =?utf-8?B?TjBSY0tkZDBoNlBxU0lnRHBiK2xnWE5NNUVCMHp5eE5IcUxxTjdzajhVNEpm?=
 =?utf-8?B?VjdRakFaMzhuVXZSM0V0S1VOT2lGdjlHeGtRK09tRFIwV1lJU3gyL3FJc3U5?=
 =?utf-8?B?VHJYekJjZmZWNksvazNFdGNoUS9xektFK0lTem03S3RmRHNBdnVvSHBoWStD?=
 =?utf-8?B?cDluU0FyZzZkUm85N29SbWNQcjRmb2NsSTZFaGxEd0VWK0Q2emlWMkp3UkVT?=
 =?utf-8?B?T1BjVVdWYmwyVUJ2eE8rWUdXNFFYbnV0bmJ4SFNsbGpRU3RQcXM2MmNOenpK?=
 =?utf-8?B?QzdmOGZlbjhzU1FmdUhqRUw4OEtRNnhnWWlINFBoMzVwZjVPWFNWU0lLeU8x?=
 =?utf-8?B?YUhndXQ1YUxCRXdNTm1jMVNpNm5PNkxFYjNGNCswMUNBK3A1RnVOeG1iaXY0?=
 =?utf-8?B?MFMwdUMvZjRKLy8xck9KaWRzTy9HaUdwYlB2VWZIR29VVUJnYlp0eUxFbE1j?=
 =?utf-8?B?ZVFZMDEwKzFqdzF6QUJkVWo1UjdJY1dRallrNkZiajB1eEZpdXIzelJGU1JM?=
 =?utf-8?B?Wi9RcG9QeE1KelRzQUtxU3YxNEFxUVYxY1lBd2RqcmpoWFpCanZIQ1U4OGVQ?=
 =?utf-8?B?c2J4Tmx2NVpYRFZ3czJSb2U3M3F6U1JUOVdPUXl2TXNqODJkaDIwczcwd0Q4?=
 =?utf-8?B?N01ZeVIvRXlyZ01nQUlDSTFjK3JIRGFROUV6QWFET291OHdvWG9IcEVxWEMw?=
 =?utf-8?B?Qnptb2VGM3ZDb04yQllGczNZYmFEWFk3UzVYUm11Tkp1enozdVQ1MDNUdjBB?=
 =?utf-8?B?UXg3VWRtajhUYUxld3ZhS3hwZDQvczNPeHhQbG1BejhnTUZQRmE5SjJINldK?=
 =?utf-8?B?ZFdSVWc0amFXb0E3TTRUZXAyVmxyZlJzekMvMEJFRDN1YThkK01UVjhBeVdD?=
 =?utf-8?B?YTB1VVpTZ1A0em9pQmovYkNLekdYRkRpWjhuVTI3NlVtS3dnMk5FU0VvR3JH?=
 =?utf-8?B?OWx4ZHJwRlZXYUQxdjV1a0lVeEVLOVo2cTgwc1NOdGcxMUczejhKMUlYenBD?=
 =?utf-8?B?Q0JKcFN6bE0vK21YTkYxNUZSZ1N6elZybU1HcFNaTDRpWFdDVWNRSklTVVJU?=
 =?utf-8?B?a25kaWdGS2J5b2ZkM3ZNYWpUZm8wdHp0dEk5eHlseWRBOE44L2hIbnhibDZQ?=
 =?utf-8?B?TUloMXZUcW9JeTViY05ibjFzVkl6TzYzcHMyTFpqNXJ2Z3UvMUxRT2lYeGZM?=
 =?utf-8?B?NEYwWVNMekQ1R25hSlFpSHBadEJVNU43bEZFWXgreDVoUk0xb3lBOUpCVVpG?=
 =?utf-8?B?ODZVZ2t0SHFJVjJMTjJRUmxraTdCQnNqQ3YwcWZUY1Y2cjRPQmJQMDFCY3o1?=
 =?utf-8?B?ZVkwSzVMQWt4K1FKY0dwV1ZkRDNsZzNjWllUcWZEM0Y0ZWV0ZFBBdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b2c61d9-1847-494e-5ca9-08de7ef33c93
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:20:29.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5C5ZOAu5W21VwS6wfBCyuJSJ2Dzqrq0usBQoUaDrmnu/L4UxQbFpVhJijULs6juHkS99wf3BRllsfBpKyjXmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519
Message-ID-Hash: DLKT476BAELIAIUTB3OAZOSTP67WOYUD
X-Message-ID-Hash: DLKT476BAELIAIUTB3OAZOSTP67WOYUD
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DLKT476BAELIAIUTB3OAZOSTP67WOYUD/>
Archived-At: 
 <https://lore.freedesktop.org/ac9783ca-ffe4-431c-95d3-3c221d17c8db@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/10/26 2:59 PM, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.

I'll give this series a quick re-test and if it continues to work
well, a tested-by tag at least.

> 
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
> 
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
> 
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
> 
> Changes since v7:
> 1. Fixed rustfmt complaints
> 2. Marked write_raw() as unsafe
> 3. rebased onto drm-rust-next
> 
> Timur Tabi (7):
>   rust: device: add device name method
>   rust: uaccess: add write_dma() for copying from DMA buffers to
>     userspace
>   rust: dma: implement BinaryWriter for CoherentAllocation<u8>
>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: use pin projection in method boot()
>   gpu: nova-core: create debugfs root in module init
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
> 
>  drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++---
>  drivers/gpu/nova-core/gsp/boot.rs  | 14 ++---
>  drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++-
>  rust/helpers/device.c              |  5 ++
>  rust/kernel/device.rs              | 10 ++++
>  rust/kernel/dma.rs                 | 36 ++++++++++++-
>  rust/kernel/uaccess.rs             | 84 ++++++++++++++++++++++++++----
>  7 files changed, 221 insertions(+), 27 deletions(-)
> 
> 
> base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba

thanks,
-- 
John Hubbard

