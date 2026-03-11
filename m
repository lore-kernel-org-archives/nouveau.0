Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554AFD0653
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 08:01:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18F0410E383;
	Wed, 11 Mar 2026 08:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RCQ3On22";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE2254506F;
	Wed, 11 Mar 2026 07:51:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773215473;
 b=zN04r2uDQ1b0wu7LhMTW02X/bCp236CLDFQa4XQqc2c7lS//TdJFn0pG1fjp9O+3DmiuS
 +gsdrNBm4n0GZeB1VCFdImx+Tzqms8e8l2qmNth6KrFjwwUxpR6biq+xTqTi9q6txptIsmO
 mt9xzhUjLbsrQdUJS//hiz7kNMtZsMmqcRpaXdux1+FqGGxlZjhP1nleaTZJg0zEs284rPN
 zovAToqp1uJv1WX6DneAPi4aLukk79iIHlsUzHrkRWXbat/aOl4K/EHiTMDKwsrCgGOnklC
 K0J0GnGAL/5whTt7WvSz++UzcihJbIZN/+PmI50ffdPIKFDvHo3gQXVpuX0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773215473; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2Rd6ZQ20pfSLPvG1FpfEVr1tzF3tZe3BvebIbvEGcTw=;
 b=RBvIEBCNp7/XPqi177SqYzma/a2H4kzSKjoIhzazLHVIpNuLQpY3tMefgneX6/U+XsmPC
 F+mX5Fb1Chdk9ilqJJNIR/8+ycdR7Yj/T8P4KYnWx2pl3vxnfq5N8Fat17haaawmtuEiFNF
 rnoR0dXLHb7dY9kW6swCFwKVqr4y6qtEt424z1vihWISV/cC9s8590KQomVnlDzcIHW4+Si
 vXhgX0yYfI4c6cxBmwbgPN3ra979QDTRuScv8298wKZsS8IBj0Wh05Ae7LU9o3s7+78gn8B
 ZLVpoJRG+h/QiVnaCVLIp5NGM39Nck3gZNJCXAnkD+ZdlAv6s7WvEDP4XbNQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C95DD42BB3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 07:51:10 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB6AF10E37F;
	Wed, 11 Mar 2026 08:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbYT7BBQYIiRf3k+hxeuD9AOdN6XnS+dn3OlHRQ9gBcywN0ptnfbrTXYXA2wvdaMTmklNlMpPN5UkRn5XBmNckOj3p+xc2/HekRYxK7AbI8wgnuwe1/BQW85WIYknZx0UwFApcp0QWXqZdqZrHrodpd9nhPPXQLZhTo6D73ri1rYqyi9A+fJguLepmcrgyBXVwMEDaqz02lVqVp4FsnHIc9mMrfHrz4VMklC2CBOhzyYneIsOyRLjNAPN36JKPrqNbfwd7Y4Vz37jydxjrgxVpvgwvKuJoVaSDYdo64tZLEC/pyDzOmDzo7GlTII3xKh9k8gkzqWnLBTMUw1YT77Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Rd6ZQ20pfSLPvG1FpfEVr1tzF3tZe3BvebIbvEGcTw=;
 b=Oas/BQsk63Hif5kyI2zCFrWNGRE6y9kjZE/t6GRKkjI1rpc2OTVXFjsycs+SK4A8QwT/HbU2F2WSVTDp9CQkI5JcCjfS1OfgwkqwzmsOcRF1GJsfxuliae1+0BVFpf24Se6uN0bj/XlyXTTQ2QbO99nirDT/XLS2VlaT+0hiDcPJjl2Wqwbqfy54kcmnEVgWvTTC7GUzcDZWu/F6PYpKWtnaDUfoQhTUYtpes+ixMrOs61kK2WOGFH+YFm/U8Hwh3QlDLKrlVYaKYtBBWxZvbJ4d69v2AsSgYJRdlBHpM+ojoTQ5cCopvNTUGh0LRE9DycIqytzz3nk1fwfMV7gj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Rd6ZQ20pfSLPvG1FpfEVr1tzF3tZe3BvebIbvEGcTw=;
 b=RCQ3On22EQleSYAn8EsNs/h6V/dpNmyMIfyobbzYy0Lri+UgpEAvhcrrOZsK33MB4Y6NLW1rnYDL9yxWuPCxoW/FSQWcEEGjdXX4xD2YTuVUYuX1qu91VTlOsSvfO/fMLk5fGdGgK7AQwV2z4jTHq8SmX3GIVo7MZVY+Bt7rVnmDSMH0weVC+MfW04tba3UtLVNkyAxW4mkuZDfCzQK0sHhoNAPtd6hhBj2md6lMGxtYVE8xgjWT0CAnrTxP5iFJDch36Vz3lStvOAAsg8a43KY7TFMvDKO+yyWdSZjIAPEGbjMpoouyFmiSacHiZZjkc/EX/HAlzD0MJv/4iy3WIA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Wed, 11 Mar
 2026 08:01:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Wed, 11 Mar 2026
 08:01:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 17:01:37 +0900
Message-Id: <DGZSN9MVEHWA.ZJFLM7W3BQ6K@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260309225408.27714-1-dakr@kernel.org>
In-Reply-To: <20260309225408.27714-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: c12b950e-3f88-4d12-4931-08de7f446df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jz+OqvZL0YbRn6TVKPlJgv+N7WayWNnAR17G44h9tzT5PCooo0JWywADwYRPfzFwt9rFhBZPeDSDFF4tIFm+5DxdVyJOyloZE4OaELVq+eBtRhFSLtjxA1NN9UAdJNaFcSpDEOMPg8ZCSbP1BP3yywsIZ88lvcmTZ9tUwimtsEU/KRsnEBuhYN8x57yvfADTbsuYNihuXYjyBTSq+o4mJkItXA5Iqqd+mQ1nw2tGYiOfOvCe0u9tGSj5mY2Nq86nL4jtCdiAJx/YnjNSfSQOcwdmajFzsp1CQ++3XWIK9P+OFN2W5PIZsmsfu0nFXMwciC5+33YbwjBRkvqOXQhlYlKlTgQoSPoLx2T7L6agKdRzxywpv+qOuQ6HDXRAoI3GL8tiEsmxwOLksBdCxChMBMLsx+wTxgkQfNUB+DhjjDmjuoitq2PPHxp5LEJyM7hf3rrIcD4/rq9rQdu5Qk8gLSwa6w/rayut6Bj1ctWjkwk383iXqeuFcbQVd1rQUV/zABosgaf8MRRvERZAc8tVaLOdp8JmS7i5skBSQU9m24eCJO/iXYIqCmJwC4iErzUX9D1z4RuYTC8oQs2vBabkuZsNtORe/XUkyRnOHhh9E4ERkZ0J5RU7kJCJfVa+X+y886in77DTTbYSeKfEfp2O3R3SJsOY2ajUlMuZgTZXpHs5lVVFbb57OkbHAhDs1HEj299/fpIeyYr/NwVMk9aUvhfkRipNBfdR9wVNpdErI2k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a09nNG9adDZheGh3bHl4Y2tUSnE1OFBkNGE5YmNVM21EeDladzA5K3VOL1Fi?=
 =?utf-8?B?N3M2VmV5VnBPd0pyWThUTFNWUTNncU1LUC9QNzhJUWx4OXVMdzhRazlkRVhj?=
 =?utf-8?B?Z2cxNTdhZXliVWFzWUp2ejFhSFhhSDE5aXQreUh1ZkxYY3Y2REJmdkk4eHZ1?=
 =?utf-8?B?ZndZYnpnbnRFeXVyaWd3WDhzY0lEUTBIa1lNeTZaVG4wY0RwcEdQV1RNRG1F?=
 =?utf-8?B?aHRBN3d2a1pOdVhHVmJIN2dHaUF1OGZ3VzZNdU9XSVZ2SGY4VEM2NjVVb3ZB?=
 =?utf-8?B?MVRRZDEwa2o1bExvYndkRzRrYitLaDk4U0x6cE1SdGY0MFlwRDRLSURaMkxR?=
 =?utf-8?B?dXBOV1lBaVBFc1FyUFAyRURWUy9QWFlSQUltaDdtbFVGakRpRzlYVitZREdl?=
 =?utf-8?B?NjhSR2RKYlViN3lJdDNrbGcvK1k5TlM4MEtPWjB4NU1WSW1LZkZPQ21YTFkr?=
 =?utf-8?B?WjBuVW9ocTFLYlhBV1VEQzdUUHZpdFduWTFlUFUwQUpRMFh4SUhPdHVjZTE3?=
 =?utf-8?B?clk4Rm9UZy83V3ZRWWJ6emVJeDZZcDRSVFYyeDVQMXRCUGUrbEtSdUJBTms3?=
 =?utf-8?B?NGxKNmVFcVhJd3MvUEx4ZlhiZVZwcHdWT1NsMUdlaEhYQkJJeVhIRGZ1c21y?=
 =?utf-8?B?NmhPTEllUGNrb3Zwb3dXWVREM3FtYmQ0WU5DYUtKR1hkNlBYZ3hEWnJiOHFK?=
 =?utf-8?B?WDBsMEZIQ25yU1J2Zk81MFZXaEhJR0YrR3BUQkhOdlFXaWZuNXlTS0RidDVB?=
 =?utf-8?B?cTYzZTZibDZ5aEJXMGk0NkIyS25zQzlmeG1Sa2d3emU1TzhJTlBFV3dTbDF1?=
 =?utf-8?B?M1grMVdHdFVzeTRjVytyMWRzWHhnUHRNSlFTRlpoRWZBbVRueWwvbmhwckR1?=
 =?utf-8?B?T2VqMmVQeFhHaWxodkxUTFloS0wvTDk2YWE4cldKbHYxYThmSHo1eStCZU1H?=
 =?utf-8?B?VnFYcjcyS1lDQUE3SXVtSnozTDdmVmJFWEoxUVBYRUNRdVNBQmFhQWZ1K0Fh?=
 =?utf-8?B?KzZ6eHBJMEh3OFg1cEZOVFhuRWl6NjM2ekZlemx2cjlObXU1eXJHbTZ4TUpW?=
 =?utf-8?B?eW1BMFZtQjByblFEL3lnQ01vTUZxeUJWblhkM1JOelZEKzArdWRUQVJkMWhP?=
 =?utf-8?B?OGprWjhGUG84M2Vac1hWYUFCQ3Y4OTc5aWRHNWpEQU1YQnduNTdUZkI3Ykl5?=
 =?utf-8?B?M3E4VWVDT0lmeUQ5akoxQU9aMXNMRGZodVVGN1dRZ0RvZUJkNzU2NU5iQlVs?=
 =?utf-8?B?ZUdIaFF6aStuMFkvbjFhMTNreHNRRmJMN1FVczJ3VUdKcGZrSzNjNXNtUXJE?=
 =?utf-8?B?WWhUc3JYNTV1a0Z0SjNrOUFLZmdPUW1sT3oyVXRDbktQWlNIY2F5MU41UjRI?=
 =?utf-8?B?QTUrVVM4TDFlczdxTFl2SFdOVSttaDNUUkRTYlVVcVhCSCtqUGdYczhqT2tN?=
 =?utf-8?B?YVNST2FrcncycmdrVHdCWUVLRDBlNEpWalpaYUgxQmxHMm54cmVjU01NYjhO?=
 =?utf-8?B?VWNkeW5pdlVzbktuQ250OHVlVktXKzdXU2ZIWFZWZG5UOUZ5cmcwaFgwQ1lq?=
 =?utf-8?B?VkNjU0hISlIyY2grOGlLZWVrQ3F3VWhLKzhKWXlITHg1S0kwSFdiWFhzOXJw?=
 =?utf-8?B?V3NuK0F6dDlWZk5vcmVReUVxOUFyMUpwZWZmSnZNVVRRQ3pWMkVLRzZIVkpN?=
 =?utf-8?B?eEJtdzRFQ3V4R25WSVd0SFVKZkhXSU4vNUsyb2tUZCtsLzhtSkNBS2pxa0pM?=
 =?utf-8?B?MlhGb2QyNStMTm5GQTAxWm9iSDU3L0FrU05JeUUzbzdRRUlxa3J2bDNEQTVO?=
 =?utf-8?B?KzlRY0ZYMjhyZ3g5SGtQVEcwN25UaVhPSHJIYy9OelVObExCNVFYazl2d01V?=
 =?utf-8?B?bmtQcTF2U3R5MFdqUDZSTkxDOVg2cCtKQVc4elVMa1ZtbHlCZmFFNE1hNkNq?=
 =?utf-8?B?dmZmRHJkLzBpa215dzBsZWJOZy9xM0t3QVd3Y1ZtTXVmcTJrdUFsN1Y4MnYr?=
 =?utf-8?B?TWVVVjRVTkJscmk4cG56eXVSMGM0K0IyV3IrUHB3ZUQ3WFR5WmhLYmp4c0JL?=
 =?utf-8?B?NjE0RXFNUkFCdjkyL1hVS2w2dGFyLzVFdjBycG5WR0l3WkRkRHhENlArc3Y5?=
 =?utf-8?B?VExYSGlVckZiL0JXZmFoeVFSQlRjM1ZMZGczZlBGbzR4VjB4SzNvL1lVY0tE?=
 =?utf-8?B?cVlBd0wzWk1DcGRHWmVxWFRaczI3MGcxUTNrYlFIa1ZMRjhneUI0WGNURTM2?=
 =?utf-8?B?S1FtckxuVU5vRWpHTFV1ak40Mlo3WkdhNEhOaTdIRnFpS1ZNdGFKU3cxWG9M?=
 =?utf-8?B?dkFSemgzRVE2YXJtaWVYN3o5WHI4ZkNDVmt2V3RQUStsMkhCZlUxMGR5ZUNE?=
 =?utf-8?Q?l4kwr0woiKblNgauStLCwY7pWdTRIbC9HLs3g236Cte3c?=
X-MS-Exchange-AntiSpam-MessageData-1: Dc+8gKaOMrxQyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c12b950e-3f88-4d12-4931-08de7f446df7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:01:41.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6lphqEFJY+CsvKna60cOx4Vn/DDHBFvOS5SDwe9eX2RcIrGOFazAmvIdYHMP+Gb4RxxdY0vIk9iKsa57+1ZUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
Message-ID-Hash: HDUSCBZN526YH2YYG7PJ6LCJQWN6CRI6
X-Message-ID-Hash: HDUSCBZN526YH2YYG7PJ6LCJQWN6CRI6
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HDUSCBZN526YH2YYG7PJ6LCJQWN6CRI6/>
Archived-At: 
 <https://lore.freedesktop.org/DGZSN9MVEHWA.ZJFLM7W3BQ6K@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 7:53 AM JST, Danilo Krummrich wrote:
> The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
> cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
> advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creating
> an intermediate reference before calling volatile read/write methods.
>
> This is undefined behavior since DMA memory can be concurrently modified
> by the device.
>
> Fix this by moving the implementations into a gsp_mem module in fw.rs
> that uses the dma_read!() / dma_write!() macros, making the original
> methods on DmaGspMem thin forwarding wrappers.
>
> An alternative approach would have been to wrap the shared memory in
> Opaque, but that would have required even more unsafe code.
>
> Since the gsp_mem module lives in fw.rs (to access firmware-specific
> binding field names), GspMem, Msgq, DmaGspMem and their relevant fields
> are temporarily widened to pub(in crate::gsp). This will be reverted
> once IoView projections are available.
>
> Cc: Gary Guo <gary@garyguo.net>
> Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kernel=
.org/
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks, this also removes 10 unsafe statements, which is *very* nice on
top of fixing the UB.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
