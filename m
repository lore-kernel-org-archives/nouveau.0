Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BB4FC592F
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 11:47:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E0F8210E904;
	Thu, 26 Feb 2026 11:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jTudqZoP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5339444C75;
	Thu, 26 Feb 2026 11:37:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772105828;
 b=ix0chpF2TL5kEsxchMam5cpS5Yh0zcfyLKfhMWho63riwaSh+CYvPqA5M9OZ7NI72jSPh
 pLS+KXTfP66sHIlyQ/46jHdM2ppRcvsfSCq9iKglkZgle5YXD3tCBtsfkFcP+mEW/cW5RSa
 uQApqwoij904DJTBI/a1D/MU/QF66XsJtChw+iSsRd3buO0gp8eUVopRN66uo59uxUo9dSg
 OA50y2zrQTcDShVWiG8hlLCnTnMQ647ZntnDW2xmvpPwd52Ua12g4cBYFq/qKJe9pA/kDMP
 dY7PghwUuV+YW2EelHpBQdZtLDEf3Xp7zTQC7faOV/Bbb5nLjrAECECEiXYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772105828; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=WTXqWdkcdVGxAiprP5C04D6IAwqBREFVr8A9vW1n4O2ChK/NoPQnolASoYKKO2ytlIMZh
 tsEJ/m4UeN+xA/Cei45F0AJRve2FfVj2houPhLp5hQWzm2Ttp9DAuzqpskWHWVoSxITCTbb
 YjI4urSV8XNTE1sBjoKKBdeuJu9XFfyctPrLqllgupS+ODsrdGCyEE9EduZZlcrVB2qCJc3
 FqLfUwJ9Co8lC7gzm8yE60Q/Z0yKAeXy3UAkWmHhyQTxxyk5W9hw4nRTF78MFVOigu8x8sa
 1pUeZdHibu2tG14vDNBCRU5Smh5wmVZxvgTsPnhDaq1F5bOEsRUbYUffRIiA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A7FC40805
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 11:37:06 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012000.outbound.protection.outlook.com
 [40.93.195.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D862710E8F1;
	Thu, 26 Feb 2026 11:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INsZh8T+MwHsEsZ0D5CvfrC3T5cs41g1Ktd96ut6KxyEqnXoviwLjoK6iPmG3SIhlDRhrqdyDRDUJsuGYkrCfWWoMQjAaiMxnxzJXsAznaAov731HsG03QsCcB2RA4QhESr4KOEoILSn1QYahj8DjWKM4KbI5PGCpU0NxR0G2eU3hvr/6Y9LcvbbUefOe1P0+VAVhnQcs9hBGLp32ERZ3CbCUAZtOzvzZBH8Irrzy55n7MkvdhS9WUxWOGn7zPcIQ+wUrEAoVgqUn+NQ1BOgzeQG5BKx/7gTRAHpCHCaYJlWdf3xCugKFNE+18Yfaif2WA/YnBXWr+v2xpqbPYHXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=YiT+bFVJVGLyIRqxcTQVjuHLa5pqYGj5I9seZjvyANrbs+ffjeJsMGuJhSFJpR3Zzc0j2C7HU9wrQAHAkDn2E9mQg7mq7rtoGqOHO2HT525Kg/OrD3UHLA09cdWTs9xpczX+nFFWe77S5iJc9LucE5FBF+0o7muuP8Mn6EndedfbmMljrzYhTr5O3gn0buV5ESYyuBoC0nroNTdXgoyHSaYC/VxVIFAUu8x2B5NdkOA8Yj++f3b1eAxRI441qOTY64UkPBAnO3EWs3V1BR31F7VwbyqSEJeoFMGootoy1bpnoY19WRwTSx0BOLBsbx79FXJa0iiWrzGlucLoeeW/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHyYwFhSGalfP502Ba8nE94zzxFZO1J8n1P1B4869tc=;
 b=jTudqZoP+1pT4muv8Gly9LO6hFjcESAwW5ODyybrU8sIt6AAqbRb7AG7POWh+Uc39Dg2c1yoQEgcoaRBI0FhU2F1ZBPUt1Ay2SHjaHEzgmFjEJnduJW6tvk6PSahYfpEhaHUktpO5VDnJBz/NEj2xe6BbGj56/DGH9RaQsE9zAb+1Gec8AR621QjK+xTQJ/IF7816ikxKG/R/1FHcOWVv4QLUiLpVpYuCKvgBJkJhvzBUVhkhnedxXdcGcEw93kXg2QwpQU8Wav+rN4AMnhVvP+yZd1PNCJXHer3n+ZX2wE+nY43qDllfjwK8AUVcZGJB/Xm2YLqEHFsuG4lQEKj6g==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:08 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:39 +0900
Subject: [PATCH v3 7/9] gpu: nova-core: gsp: add command_size helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-7-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 15969664-1bae-4a96-78c1-08de752cc554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info: 
	VRajRYLyJWVrfTEEC8guCm/geh5DIoxArHLSKM7FVJuYfRTDemUoa2x9MIWG4UHGcUsaJpZkR3CSzMEvFCRgjqrQl3CuOuKpmai4WDeWBPu8oxDUGuYQrV2LYOevjJPT7QgnwYm4xZCLcJY7+9s3oy9qwEgGwl9MCQfDwgZOHlA+C2uvWpjRpJxpsm96Z0uhZRB+lAIy9F9Y9rilm6/I8oMt90iSln7sXXQK74q73cVrfC59LQzdtbO+z7mVzhXwDNFCv0ZFXN92NVzp99E0IFOhRew5fuYjvrQ2+wtD1jRbVOuMENhJ9gJy4AlkkgxHDkWBzlqIhoqqA1KXyF2l6Xq0Y18QHgkvduPtnZQR5bmDuOa8VVkKUkjceRtok4FBt+1lzxo89Ckk0NURHGKRp6OiDu88Zhm6YtajR+JjAARkkVpJR8+LYgGboWZ1EF7+4vWBkmuEZDOo+SEjgMac1QmUYOawY+9ESm9I2UXvnE5fDQtQPpFg8pFsmUYL1Oj4vGCS+jTjsONJ6TFXgxjrtguWTXaAltV4w+JQDAM1hktIhZjMb+I0chQ0uMKacpq1NjyCNPDaFl2w7Va2lHXncmrS7uCHoVdURr8r9X3fkl/gZBDGz2HzdPDPQ+T+zFxMXg6UufMc0B4wnyv48sv8R1avzTL+rvEtRgU5whJtEHrLe+e+/ePWOSaxqKO/r1fe4p7joMfFZ1eDOLLsbDkGXMoEoa6ue2jtU/q5vDtvpZFunjebanaSXLSTH56N9aWnJN9/cupDY4YxsFiEiosEvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVk1TDhNVzJZWk42RlRYbEhoKytQT0wya1NUa2xlbFhvczIwUXByTVp4a1hj?=
 =?utf-8?B?VHF2K2RYNWhzS2oycXUvVjRvWWpTb1QvalUzaGFMd3VNTklVTzRMZHRIakxV?=
 =?utf-8?B?bFluam1IekhaSVl1dktzZVpiMjY3OWpXQTFjMERKTURwdERaN01mMjA1ZjNO?=
 =?utf-8?B?cncwbjNLK0tBdlVudjlOTkNhUmliWkkwSGJWMm91VTlOeEwvS0dndkJjZVdu?=
 =?utf-8?B?T2htRUFDUnBxWWpGWGc4N0ZEck5hNTlaRDN6REFSYmIvNi9DSmhTQXRKM29y?=
 =?utf-8?B?WGE1bUxFVm52MXliVGRVVzZJS2pzdDluWnNWSWNja1RlK2tjUHR5U01JdURs?=
 =?utf-8?B?dEYwWnVzWHd3aEx2OHpRaXpxQ2d5L3R0QkVmSUQva1M0M1VQcnMyN1Nnc2Fl?=
 =?utf-8?B?ZWVLV0s5dFd5Wm51QVNld2dtdGdWeFNSOUkxQU1zaHRZSndLbm9vcCtTQ1VX?=
 =?utf-8?B?cDU3VnNXdVVOeXlrTVBkMG5MZXZHSVZQN0ZtUFBZRElpazFDdVFBUENHWXJC?=
 =?utf-8?B?SW1kRFZJUTlNdFBONFR2cVhrbFZZb1F2YWNHVzhUdmVkL2IraGw2TlZhRHZy?=
 =?utf-8?B?bnNYdFpNQzg0M1l3c3lQMW9obkdqQ0xIOVc1cUo2b2Z2NEU4UEErUWI5SGFZ?=
 =?utf-8?B?ZGd4WjZXWFZiVytZZTU5QXpOU2QwQTl1dldZVzk3VGt3WlowQkpzNWNoNk5l?=
 =?utf-8?B?RUVBc1hmMzRNaDVmU2ZHZ3AzUTBEWXhRc2VDSkpkSHZ3WVBQQUlVcVhJaDl4?=
 =?utf-8?B?bWVuTXdOeWd6aWZnZnBhWlhMWUYyVHM3VUFvMlZMYzdrdHBnN0hGTFEvNlQw?=
 =?utf-8?B?cEpUbUh3dVNYSEI0QTROVWVZcXJVUVE3bXV5RmhMUEtIUE5vbGphU2JNc05l?=
 =?utf-8?B?d0hsWWlOaXJRKyt3SzY3V3lERDhQYVlUMG43bHdLM01nMEhHRjB0a1ErNmF1?=
 =?utf-8?B?cWliN2dxejhZL2RUYXJnNzI5OHBjZ3RqY291ZlFaYkZoRDQ4VmtINW9CUWsz?=
 =?utf-8?B?b1NrTjYwb3FoUEl3L3N4ZTZZTGJjb0ZuSVI3T2tkeEhjNkNMZ3BkVUVLQ3dT?=
 =?utf-8?B?czBKZ0ZtRnRoMDY1UkQ4U1FURDlUTEZTSUMvOU9vM0ZNV3pQMnRmS3RvdlhI?=
 =?utf-8?B?OWRPeDJMRW5zQUtmVzhvYVI3NG5HM3ZEUXdzb3d1bkMvVnFubnYvZ0g2MjZP?=
 =?utf-8?B?MmY1MGJqRVhWeEZtT28yR1R1bmNLTmFaVGNoK0FQR3RLSlNWZ0RpVnNLWEIz?=
 =?utf-8?B?V2F3TzZGQ1prL0s2eTF2am9YQ3dmUVd3TUJ5QjNsZ1VlVUp0eTJJb1QwUWEx?=
 =?utf-8?B?Y0JOVFdSQm8ySVkyWGNYZ083ekhkZGlUby9kWjR3akE0YkRjZ1YvOHNZQWZF?=
 =?utf-8?B?NGZ2a2FqNHl1YnNGbmdxTG11N2dsMklIejRqL1R2ZjVJc2hBdzQ4Y09yaE1q?=
 =?utf-8?B?VHlwY2V2cWpiTHpCUGRQTnFmUDlmR2h0YXFHKzAxRGpHUDRGTDk3QWU2dTBs?=
 =?utf-8?B?QmJOQkVwL2h2cDJGVnJYNGRMU3lPR2FmMndsejlmVDZEM2VzVFdRa0liZWEz?=
 =?utf-8?B?SzJLaXdWT3BzN1ZHWlhySjRpU0xDZS9vM0FsZHRIVXVRclp4ejN6cDk1K1p2?=
 =?utf-8?B?UjdRY0U1dGRBa0Fmdk16UUt5MkFKU0g1WTQ4OVJtZ015TExkWnlpSjFLVDVU?=
 =?utf-8?B?UXJqVGRiSEhIc3B3bVFJVjBwQ0x3b3JtZzRxWWtiM0p0MURzOWtUajVmSytR?=
 =?utf-8?B?VlhOU1BEZjZiZmE4QjJ4WUlWQU14U2VxcWhmY25JL2FKTFlXY0pNcHl0aFpK?=
 =?utf-8?B?RXFpYkVPdHRsZnNzd1NZWko5NHdITDg1dUQ4NjE2bjhvbmdGMktKTjVjNmVJ?=
 =?utf-8?B?OEtIYVlkV0VEeXFxSWNYZEtiT0EwSnpXOEMyUTNpSWhFejROVjZ2U3lnKzJm?=
 =?utf-8?B?dDFRcWpNbU4yMnNLTU1CVnBUdDIrZGdjWkZFbFR0bExhSGFZb1p6YzUzNFZR?=
 =?utf-8?B?Z21QY2VxQzJ0TytyTkpPU052bkp5L01CRFlKN2VZNmJ6NTlHd0U4WDYyWFZH?=
 =?utf-8?B?YVQvcDdKcjZhcFphMGVPMmhaRWVxYzA0RnBZTC92eXlra3lSSE51ZkF2dkJw?=
 =?utf-8?B?czdXOTNUUmJ2REx5QXFoMmN5a2VCdWNZKzhhazZoWlBYdGZWSWs0eUlhWmtX?=
 =?utf-8?B?WjZIZ1A3REJhbXZvaXhpSHdXKzgvM2dicmpDYWhMdnRsQnJPNURVODZVYjlY?=
 =?utf-8?B?L3BZZGFOQnRubU1BMlZVUk5oc2p1UUZIUkJ1NTQ5Zm5WNFBYN2Q5cmIwQThV?=
 =?utf-8?B?d1Vlc3lVa3NLMWVlOW5PQ2NySFNlbU1sZVM2WmZuV0gxenBJdjBVZk4rZThs?=
 =?utf-8?Q?OnqvYPDaMELhDIgPFztre56znAXXJPRN9yQ65jYu0lv/B?=
X-MS-Exchange-AntiSpam-MessageData-1: V4Sd8ke1MajJbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15969664-1bae-4a96-78c1-08de752cc554
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:08.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QXkEbOB5p+rXNIo7d9rBF3WUXgpasIZKFj5wmakUWC3XYeHpjudwoixmHQ3Ej2PJ20pmRRX43aDFwseS/2tB7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
Message-ID-Hash: 3CLZVWGJB45EZA7B45NKD53VQUZXVA33
X-Message-ID-Hash: 3CLZVWGJB45EZA7B45NKD53VQUZXVA33
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3CLZVWGJB45EZA7B45NKD53VQUZXVA33/>
Archived-At: 
 <https://lore.freedesktop.org/20260226-cmdq-continuation-v3-7-572ab9916766@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a helper function which computes the size of a command.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9f74f0898d90..4a663a5b3437 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -450,6 +450,15 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// Computes the total size of the command (including its variable-length payload) without the
+/// [`GspMsgElement`] header.
+fn command_size<M>(command: &M) -> usize
+where
+    M: CommandToGsp,
+{
+    size_of::<M::Command>() + command.variable_payload_len()
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -526,7 +535,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let command_size = command_size(&command);
         let dst = self
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;

-- 
2.53.0

