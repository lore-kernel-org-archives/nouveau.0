Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDAEFEDA07
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 18:44:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB86610E5DC;
	Tue, 17 Mar 2026 18:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wd4lxMzP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6C3C9451EB;
	Tue, 17 Mar 2026 18:33:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773772405;
 b=tWZ18ToMatiA8OLfmxHEMSpZom+Hn3lbs8Piapw5BEpdh3ud5c+kAW0539GGBkkZQ5PUS
 xdqe/oUlnvWHJgCdm7J7PJaZDJuuTHWoPsUbnjju4bVAdjyRiB504vJltVEGP6d78Zf0zOI
 mpPxnRdM7VWuoyuXCZqHAaeNUUdaEzLOpTpv4LQ6HpgQjPWlUHNKpI2Dk1gTHhNTbeCyc5Q
 KnlDZ/w+XvGUfDe2+C79MIYPIZRKo0BuZsC1Kx2c8Jch28tcpcV6Y6YMwvidmcyZHDDsrqb
 uEm+bicXPyD/DOKzQP5rB79t5OeipJ2hKnIkfrBFfbjp68C3LvLfCizVnLWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773772405; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EOoLtISl9MBcOfcFNylXhHlzxLrgX/ri5ArQb1wc57Y=;
 b=Wl0qQuQCuObaz649eAKXuweCwP6lJ35u3zLYPdZX9R9OTMdjSi1RgK0NDxVwIIiF+RDCS
 a+C8L4PS3GvNs63oW40kgf873YbLb5AW9f+8KGf3Iea8UQMq2KtJMQLhYb0Mvhq/GNOI/MJ
 9W0OLL0tRyEBrKgGuhd6kzOKxQTeuDgx9E3ymnr34H1/FsALNt3uLdvfD5T1KJrIiDAQHdX
 qegBbBCfenOtpLm5pIK28H0hBapg61Adg2JfP7NRGbQ+P22249Pe86mo6DJD/98+BqDWbv4
 7rB5nLvXax9ap2J3b7Es99h842yq2GVHy4kngVUHfceCNl6qobMEqJsIjmSA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C8CB45168
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 18:33:22 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013052.outbound.protection.outlook.com
 [40.93.196.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4048010E415;
	Tue, 17 Mar 2026 18:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aStnPmNYY5PssoZNlaigTLa5UCWtjI9YxpyMnwhVfWWFGk9Wbht8uL+FsmQV06quRTPQJOV3GvjIEdjSgmkoWn6sjfDU7cqmwvC8y5FgM4bqcvDzfsXRRAFY1Pa7VrZpGtpmpJg3NTs5biGUpaLchi57fBntVqh6x17fVaFqoQ1n/vT9XUSKpPWst2sgBvp1dERulmNAKc4GRxmbWzpSLrthn0tMOUFRia2203CjwgQ81BKldxEaG9jD7HjxkbSPwGuCzKLKiLOdDODlWDNb1y5rII+JnmT+eQlpsuRiGyt3ukDQULAHile2Yk04qEWg48ZjwCJHVcR/u78GpoK/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOoLtISl9MBcOfcFNylXhHlzxLrgX/ri5ArQb1wc57Y=;
 b=YcybpSGU07/eNkSJpcUXHONnctYvH7YNy1AZZILmo4/XYqrAdNvLkkfIrJlGXz0x/nmYCl25ftAvFdqGQqmP+JbGd740AnjnzlwY2XoJAEe8XEguPelyDVR7gHdFnqoXf4URvtACLjkW+5G8qjts64JduDdggYnQ1KU00MiCWY6CHhRC8+WEBLKQm+0l3JEHL+y2IJkiwZi0U2aHcP5dUVOicoYKInb3tMZuyQ+Aht7u+KCPqmQhcOikyYvoj84ZTOMeItkcHuNBoIfy4yt64xGw+7hgbSYp3MmxtlJzz3RDGtvmme7i7Y/dopxQtmWYPJZbFiGTYsrbCBcgOUIPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOoLtISl9MBcOfcFNylXhHlzxLrgX/ri5ArQb1wc57Y=;
 b=Wd4lxMzPZOQvu3d2+AyZcxjQDqOc3jKqk7ISQX3BUrU+PC0Zom+5Qy7+V1pWUC1ROEM0935GFggjN+GWfdd659cdcN2MA2eVuvt+Q6lTfQdqMCTChzyU6KJj/CmfajCVBF8DCnGM6SsRRWyJcANsUNjB7otrMb6cOY0LIwevymhm5/+v5TZHGYnPZ9FMw1T1jAkDm1xZ9R958m2ZC+8V9HEDq0DE+kjjex9zJGCZi9o+JIdwRhaMcpuRkThMnzaqB+YvSL/wbBGAwiBRKGEY50nwpXtNpUzUKFHMPNw2k1c/HmseI4lLUM19oGyhcksb/+i4XFFFWE0XhbjRXP629w==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 18:44:05 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 18:44:05 +0000
Message-ID: <893f5393-70e8-4213-b0d1-57e4fc9c68ab@nvidia.com>
Date: Tue, 17 Mar 2026 14:44:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.1 1/1] rust: gpu: Add GPU buddy allocator bindings
To: Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
References: <20260308180407.3988286-1-joelagnelf@nvidia.com>
 <20260309135338.3919996-1-joelagnelf@nvidia.com>
 <20260309135338.3919996-2-joelagnelf@nvidia.com>
 <DH48DNAQCE0Z.2EX23VD27CQVX@nvidia.com>
 <efc10902-2ee9-4cb3-a4cc-442998eef01a@nvidia.com>
 <DH4NHGJ54F7M.2R42KYTV1700M@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DH4NHGJ54F7M.2R42KYTV1700M@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:208:329::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 35125e81-1dc6-4024-1998-08de84552a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	c8yfyJwX7fTBlvEixSYsgMGa5Yb39CukiFZfnEhsgDd3HSCuPvhCmtlNEewoYmQonbdtc+645GCQs3Tg3KpTDnM6vxWXJNU2qDFZjd4Pt/LYckaMVzUSte/JwyIJNzFoTrxT1zQgN+LS/clsXeEs0aWi9hlS/Di4uNRsjq9i6ZcUCsDZXtTpPxx8VaYAIPXMBcjihRInVR2IA80eB1Jm9xy516fJ6O/Vz0lRXkMBn3r7SkvI/WmOG3odT1K7BVK6wuPrmJdUb7yJMidi1Y1VyOXlNcCzpsuLvB+eBZBCyqyoBzeyu4ITiyv/6DSKlvkNzPDmMliF9GwfrAO1cD4QEIACuBETQZgpSqmQlNUUhHYfAtB4EQ8WbB67NLZgYvcQvSM52dVI72l+Z/hVq5ClW3ZW3VfGXUD7IDlpuEnm46lHMvlfOs6WEV+L6MqQxDW2AlEY9wreszWMZf67vcDmAlqbODXXtKMz1VM15RjtCMSn2LjoqviiggD9l7Y8tkGQqB7/61W3j18TQkYLWjic/k2RcU+YeB7cBBvmAS3Zb3rcHJZtpwOYJiYW1Go6XsmRE8p4e69BufssQ10wj98cP1Ud88J930HYfErvMdbNGp+Q83l5PUl/nEjE64xiy5c+n1Xv9XPyA3b+S9a8oYmSRltzD7ZWmywhb4bID5Eum0rBPCXxHlh6UzXFGe7/wM+hN4+tCLIsiPKl7eTjSdns5c0LsFdD+VSIt32uLtdWcpA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1RwRHdUMXVOUGVlOGRkcFhxNmFmUDY3YlREUzlMTHlXbmJUTmJrTWlhUUFh?=
 =?utf-8?B?ZEd4SEhuS1hPU0dubmYzcUZyUmRNNmh5OHZ0aXVtaFRjUFNFOTdNSmdWVzc5?=
 =?utf-8?B?bEYzSTRRYitSQU1vOThEWGlCN3FCanljcEYrY01GUWs2WkxmZlRFWHlWNjYz?=
 =?utf-8?B?Y0hZd2RIQlM5NDE0bmQ3L1lTRUtYTlkvMkdkYkV6N013YWNUaTF4eWVjUGZP?=
 =?utf-8?B?UlpJaG9DL2RjQnZkUjR0cW9Ib0ljZ2VBOXFNOXlwaDFaWnpQTWZJWTBSQlY5?=
 =?utf-8?B?Wnkwd2J1WlRUbEZlckc5NC9SWkFSbzhpQzRpU29BemJkdVBHczY0V1dYdkFC?=
 =?utf-8?B?RnVCelJFMHY2aUZRLzBLc2VXeHRJeUh3a0ZkMmhTWE5zRDZ0L20xMTQwMnQy?=
 =?utf-8?B?aDgvMXJzTmJLRkE5OVRkVnhSKzVwakhnVU1xTXNpRVBQdHd0OXZTUkRQSC8y?=
 =?utf-8?B?NUhoNVNtUHIzdENML09URUg0OXZacWJ4U3BxTXhSQmpXWlpiak5nS1F2Qy8w?=
 =?utf-8?B?aVdGcnZFUmMvSW8xWEdBemw4blVDR3lKMUU5Sk51QUZhYXluSXJtcGRmZlVl?=
 =?utf-8?B?UDdzRSs2VUdTYXovUWxuaGZ3UlNpU01XWlNVTEI4UGcvMU5TMWdWdW9Qdjdm?=
 =?utf-8?B?bjY0bTc5UDAyczlSUEtqTGVJaWEyY3duWnlxc0RiQU15czdwR1ppTVZQWS9y?=
 =?utf-8?B?eHUrRzJDRThEdTU2bVFMN3Frb1NGdHovaHJ1RFY3Z1NiS043RGxBYyswOTBB?=
 =?utf-8?B?VTZ1N1BEa01icGNaQjNzU2RGRzBPbUwxbm83UWs4MEI1b2p6UmtrdHZOemRk?=
 =?utf-8?B?S3hvUXh1WFpWditWZHgyNmowRzhrdE5BdXJ3R3ZrTjdGUXRjU2h6NGlHQ0hC?=
 =?utf-8?B?RjMrOFRrcndwQjNVWkZ5elRFdy92TWxQWVFIcmFseVVJdmVxbnFXalp5NmR0?=
 =?utf-8?B?a2YrVmpQMCtMY0piU3RHUjllRCs3ZGZaUCtwZlZDSEhuTGMrdHVvNW4rOWhV?=
 =?utf-8?B?Wkp2OEZhc1FlM2dvd1JaZVVnY2pWa3dZUXJ1UUVDcHJWZEorYmRpY01UWXF3?=
 =?utf-8?B?VkN4M0ZGQXNIRi95UzZsMWJnZS9tZ3NoUmd5VXlnWkl2WW92dGJ1bU5vWjlU?=
 =?utf-8?B?ZTBGK2MvcTdsekJhSzNmb2g0S2hIRmZpazVIMDZtOTZ2SEhxZFFJMlRsSXEz?=
 =?utf-8?B?Wm8xUUxIQmU3NWsxV1JoOE9KZ0dZY0FROFRJWWwvMkZUMUxCSXkvd1JPS0dN?=
 =?utf-8?B?ZlRRNVhQQzN1MjFBdHNPTWhKdVlzWEhTcUdWK3N2ZEJYdENHMmFGSytMeU1Q?=
 =?utf-8?B?NnA2dzRiTVVsWE80WE5veDNBdXRZOGVRK1N3UGpibnNhVUxIV2loVEMxdXVI?=
 =?utf-8?B?MmkzZE0zeHN5bmR1TVl3a0R0cnBaZUN3R2J0NEpjRmxZYjUwbGZzUHg4ZHRV?=
 =?utf-8?B?Qk8wOUc4TGdyM2hRTnVOT3NaYm9hNE95UWtKMTdVYnRlUTFIMlNNUGJZKzc4?=
 =?utf-8?B?SHFqbTBFLzkzTmJYYzM5cXRxQlB5ZTY5cXA1RjRJOGNPRnA2Y0REUm9IZmhE?=
 =?utf-8?B?SXkvK2Z6UVZ1MXlta1IvRm1WVnFEWldhQ3pQY21RK3pZazRGdFlvUjRjcVN0?=
 =?utf-8?B?cG8wVVExWlU1YWozTFNqQU9VZk5jN2I1UkliamYrY2lvdnRSb1VKTVo3aG93?=
 =?utf-8?B?MmRwUDlOZnprVncySkYyc2NnaWVQbHUxL2NOazBFOWIvcU5vTENZOTdWb0pQ?=
 =?utf-8?B?SGVsVWZ3THlXQm95UHMyZXZzbTdjZW1oeWxHUFRNRjI2SmNaVks3a2Mva1FM?=
 =?utf-8?B?UVhOLzl6a05rNTVvb00zWTFmaWM5NmdHZ3c3Y2tFSXNGMnVJRy92ZVJtUkpv?=
 =?utf-8?B?SXlSakUxN2ptRXE3aWJrZ1J2bC94alRWbjd2UlhPNGR0NGVGZ1Yxd1RyOTZv?=
 =?utf-8?B?TmRoL0ZnK3dtQlJXaWl0T1Q4M3NzeTUxMEFFeWdveWR3em9CVDYxYndGQVNx?=
 =?utf-8?B?SUNXMGVVRzFQMWU3ejQrd0FReUpLQ0NTQitHT043Vk80dW1KdFZ3amFBYzlO?=
 =?utf-8?B?VSsrU1N6UzhYZXV0aW9iaUppcXBwN3BMeWo3SU84amtaMnozQmhIbll4WWNt?=
 =?utf-8?B?ZktXTG9EbGNRU1VWVGlxN2tpUlRlbGYvOHFKWW5sZExUK0t2SExqN1lUakFr?=
 =?utf-8?B?eUlPTzN0RW1iTTlUOVlkMmFXeEQySHg3ejJJZVk0Yi94M1pMRlgrM0tQUE9L?=
 =?utf-8?B?YVYySy9KUjJhOGhpWEQxOUg3S2F4MUhSaHBrNTdzMzhNOXRNUTQxUGtFdlE2?=
 =?utf-8?B?WWhGeFNxdWZheE9LSTJTd2ZoSzFHb3M4UCt3U2dHOW81YWFOTE9EUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35125e81-1dc6-4024-1998-08de84552a4d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:44:05.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WVeF3l2EiGWT8xpowJ11QeMRMW1P9zgAxvZnxeONRMkGOHjKKmE31z8qQVL/pkyDX6uzlOpvo3Clw3S/AdBw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
Message-ID-Hash: XDIR67KNY6GDVOV65SBHMWRZSIDL6Y62
X-Message-ID-Hash: XDIR67KNY6GDVOV65SBHMWRZSIDL6Y62
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 joel@joelfernandes.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XDIR67KNY6GDVOV65SBHMWRZSIDL6Y62/>
Archived-At: 
 <https://lore.freedesktop.org/893f5393-70e8-4213-b0d1-57e4fc9c68ab@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 3/16/2026 9:02 PM, Alexandre Courbot wrote:
> On Tue Mar 17, 2026 at 3:51 AM JST, John Hubbard wrote:
>> On 3/16/26 6:12 AM, Alexandre Courbot wrote:
>>> On Mon Mar 9, 2026 at 10:53 PM JST, Joel Fernandes wrote:
>> ...
>>>> +//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
>>>> +//! let buddy = GpuBuddy::new(GpuBuddyParams {
>>>> +//!     base_offset: 0,
>>>> +//!     physical_memory_size: SZ_1G as u64,
>>>> +//!     chunk_size: SZ_4K,
>>>
>>> `chunk_size` is an interesting case. The C API uses a `u64`, but I think
>>> we can reasonably consider that we won't ever need chunks larger than
>>> 4GB (or can we :O). I'm actually ok with using a `usize` for this one.
>>>
>>> One of the first things the C code does is throwing an error if it is
>>> not a power of 2, so maybe we can even request an `Alignment`?
>>>
>>> I'm a bit torn as to whether we should use a `u64` to conform with the C
>>> API, but doing so would mean we cannot use an `Alignment`...
>>
>> Alex, have you seen my Alignment patch [1], for that? It's sitting 
>> around with only Miguel having responded, but seems like exactly
>> what you're talking about here.
> 
> Not exactly - this patch provides a shortcut for creating an Alignment
> from a u64, but it doesn't allow to store alignments larger than 4GB on
> a 32-bit architecture since the value itself is still stored as a `usize`.
> 
> But that's really a theoretical worry of mine anyway - nobody will ever
> work with buffers larger than 4GB on a 32-bit arch to begin with.

I think we don't have to worry about chunk size ever exceeding 4GB. Such a large
minimum size will cause massive fragmentation, essentially defeating the purpose
of a buddy allocator and not even for work for any VRAM with < 4GB memory anyway.

Per Alex's other email, I will switch this to Alignment to constrain the
alignment requirement. I agree now that the robustness of doing so is worth it.

thanks,

--
Joel Fernandes




