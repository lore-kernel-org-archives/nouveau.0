Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12691106FD68
	for <nouveau@archiver.kernel.org>; Fri, 13 Mar 2026 02:11:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DEF5910EAE4;
	Fri, 13 Mar 2026 02:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hdY/Haj3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D3855450E3;
	Fri, 13 Mar 2026 02:00:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773367230;
 b=pOWI82hJ62C5AhTnwvmC1+l82tVQfabWjU8Bnm0UN9sNOKIGnQZ3b+Z/IfgDFP907pHul
 324azBcuBXMeEJJU2RswA+BWQk/B92DIexyH59uJz2qDQD0/wdiRevBn6LyyOspipDnVEXe
 3WRg1OexrqJhmB+N+Xv6HV8lEV/z5NRsxDOYvle6K8yTATHvcb9kAvOhPFd/GSV447kbrL5
 DdF1kE41TuO0aG92G3TLIT/C1QBF80b4DzjVMjN5jvdKouBzzd1qyOCtXHvZvcxtya1KRBX
 qri/p4S93Baq4auBbBuwS+L0d/8a48wT6iNog4SFNryb5O5S8q+9/sGP7GsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773367230; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RA5T1PGFTt8PlUo4F01wllklaBQkUR6LnniG718fxtI=;
 b=IfkCQyM/UnDRTwYsA9IJjZzzWDFoaiMWSYfUPPGcSg9rNnQZchyV1hFqT0g5/9KWPVSBy
 CNCWnx7ZYf4jadNadurin+9dZ84BByoX164a011d1NT4rBYZuKMij9VqddcgwyU0sG4U8Do
 RwD5qagc2m6NzsectA8k+Axh8emmyU35sLHpfY7m0DPjw0U5JVjxWJ/nuG1iy1wSGg4J2p+
 8qNpFH82sJNW0hUE9LFoTafUYKbjI6hQmt8UTXEg1BUhRvm0GtJvgGiUCUsUILeC4LgEt1c
 USa5dAelt/xoNE5gFWyuMH28RaJuPgU8k1irnWygo+h+W2N/o2Wux1ILQHnA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CE83A40696
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 02:00:28 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010063.outbound.protection.outlook.com
 [52.101.193.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA910EADB
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 02:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrhOv1lx8ToRwH1k219Lnhm4T701h9i4Yk2R5A7sjfWqbZMYe7xHt6tCfGV7TUGC6X7aAEcgxdMdLe+MnrJX9/t+50bqrUx9rpYHVRthDexUbHP/o4jC5rxxsE+f5IWcMytW4QZd1Gmqku94bvbz633S/JDGuS41K4RK1gQDKczQYkBu2x1NBspoKrrtolc2nZS1a5GEtT5x1lNrHbKSQTEPwEAEN8IQUvvKLVQ1Ds6CNmUwW8OXGuyqP8ufwW4KujTPiJvzMX9RyZJfZfsOFgrBFSOxNxM0Io/1E2sMOag4a+/S70JvvDYdnGfXHBUVqPAN6CtMNchobH3m2bSNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA5T1PGFTt8PlUo4F01wllklaBQkUR6LnniG718fxtI=;
 b=CZEEQx9bkJ6SCX3U7M871LgWkQG0QVfmMIdx8kkUPYQXJlS6ozOKxwbvFg1rrSLC8yyUIbRZHnbtxnVfnsvRIK53vVLlukp+a2Wy7btSTboo0lx1vZ1MDBu+m7tAOHulf6H64xMYVVZOnofdOO0P0p0MbfDJ9NRd1UOOFbTPbkXosqlYpI80RnYur0SuH8495KLLLn9D1cOkvFOnxdJPgysZWUCojIol275smjxDHlH/hfH4/HJT+JKndorHAK8uqSRGZSvawIhIDwCiyfZOXjvKNkJQkBi80pO0TzMizAE3CC0jwaRBC0G4IBbPzzevRnFzQhKE155VNAQyL9RZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA5T1PGFTt8PlUo4F01wllklaBQkUR6LnniG718fxtI=;
 b=hdY/Haj3Zg2o4ThUXXgzGbNqUsLwaOqyrMP2kYxZXpZkRxR8xNqcrwEtz/dFsxMvh0ABwKrifaqEx1hUWz8FDaSoKB3YEotHb3/Q7Rd2iXHJ36xgFTTITIIytO+V/VB3Jr962k7pDw40DST2hudtnnkssEgpA2FFogBH3nSV/Fi166uK1Q0KiPmyUdgrrQnQpA70f7qbzi8V0KX8p2TFYzBGkvMiGxBA4C9wtQ9skxvx75QnomtNehD2/pkVoh2EYffBNzsZAplKMaj3npAkFmq+LK73v6uWgami2Jo3nm5rzrTWRcAtVyK5KorMBo+2icfRRBtsbxLpyVErnMZLYA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 02:11:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 02:11:04 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:11:00 +0900
Message-Id: <DH1AFW7NXUIJ.1NZJ6680XB5UZ@nvidia.com>
Subject: Re: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-3-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-3-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0233.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2f7046-4c3d-40cf-b8a9-08de80a5c786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	v7LCxLBwchiUd+tKEzXrfTuhwWrho22AtIdI22CCuAvW0/ew6XbU6fZQxYRYA7HHOIpBU127C2CNcgzJUGTNvi7lhmakCtiDS7R2OaTaw+//wpXsxz6bvUlmgT8Wvz/uIz/1iKajcfsu3ClbX46FqbVsboDG33hrHnn+pMQh8AdDlr82TEtJR5Zvu4RlfXoxI/gGMsQj+PlASNx84//oRA3evkaGsOQQEN26RlnB1cu5in+jxhicAz78B6LiTNwyZwhU5IdNkC6E4VpN6RGK/eYW/g+l5+wXUNGQW8Dl2C1eOYFzg1R3KTYnMmn/yRPLUYW5PiKLwM8gFo60eM71Jw/WNTKHGXIZwJWz2xrn+8JqKp07YFVem2C/pxcwnBMSQZgWrykPBnMM5fg+g4PmMx8nPNgUcocn8rtBJo0cRSH9DojUQGoiUdGU2dgo6Kv10WNTvLGiTJ9y16Q5dUiGCGc/5QrBwztObEMHj5aqQwHlFfNis3pH2hlONnnOe4/Jly6eXbHG2ot4jruQ3Qio7AY1tOfX8nLfuq3HjZ5yLyDpTs5oW+K2iIQJx1ADJecnNEBoI7FEL71ayazV8J7f4hWtlCJ8yl7aOX0kAYMtimqc/WLp4Yo5BJqK0fTki7FP3MkCFIKN98sBcLCYNYWdfsWqfYnRcl/yljjKG748pYXrd7Ft63bNpL28CtOw60QMTzerb8bf8fLIYyuEsIk3MEUvEvzC+o8of+zw0zmaL40=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SW04bVhSYU96RElkenEwckFUbkh1YzJVM05mUnhCYzlBUm9SL2VXZXJTNVNa?=
 =?utf-8?B?NjRLdHNObld2V05MTG9IL2VCOHdMaW5oQnc2NHREUUxYcSttTDAyVnUrNTcz?=
 =?utf-8?B?cjJXSDFNb2o0V2Raa3d6QStmMDRoZ281bXVoQlU2ZVI0cFRzZ2szOUcyaEpi?=
 =?utf-8?B?eUZ4UGlVaDJFRk5SOXZFV2lnZHFpbHBhQVovMnphUDBuMXFPZHFWY2VCM25a?=
 =?utf-8?B?eVVYYnVEeXRtUWhRWHB2cWNTSUhmRkg1bys4SjVjNzFGUjdYRy9EL2ZpM1gz?=
 =?utf-8?B?dWMxQ3pTVkxzSFA3Q3B6c3dlVDM4aEpod21mbVdUbGxqVVZQbnRqa1VvVDhq?=
 =?utf-8?B?MGs1OFpMMWxuOVRpZTc2T1k2VG5mWDRVdy9jUjl2WTExdHVnVGVJZkhHSnh4?=
 =?utf-8?B?VUxhY2QyTlFHdUwwNnNvZkNhZjA1VGUvaXRDV3lrQk1uT3hQcXhEYVZhRHdq?=
 =?utf-8?B?dkhvWldBczVIY1pKbTNLRE5sbU9id3R6OTJtZ29SWHN1MUtNdDhBTEdhVFZx?=
 =?utf-8?B?ZjNlaWNpa2xKU2t3TWtXQk5ZUHBzQ25RSVlyTG5SbHczU01nVTV3RkgvWmxS?=
 =?utf-8?B?RzNmQVFJUEJxRXZaRUd2UDBRUXR0cWxpTjBBRGIvZmpOVmRCY2x1V1orbVJN?=
 =?utf-8?B?N0J5OENJUWk0SEJxKzV6YzZKMFplZDZJK3VzODFjK1I3VE5sLzErQ0gxaWVP?=
 =?utf-8?B?VWlvR1MyeklUZ1lyMXFrUmowak5Kc1pFNzhoYS9sQk9oaEphVEdmM3Ira0ZZ?=
 =?utf-8?B?OWhnR2ordjl4SWUvUHlQcEpkcGFhK20xVUorVVZsWkduOWo5WU9OK0tiTlpp?=
 =?utf-8?B?MHNFZWpZZDhGdnU1azRZTmwveUVzcEVxeStLQStkWDcvYW9EYnU3eFA5T3Bt?=
 =?utf-8?B?dFlDL0dOOXV3QkllejdrOFJqUEgzcG5GSFU2aExLZWNoRzJibTc4SVVWTE1G?=
 =?utf-8?B?bjgxZUovMCtzaFpTSk5UemRYckJ5UEFSSmZmdTg0bjhkVmtKdC9QK0dKTXBs?=
 =?utf-8?B?TTZlaE4zRFRqVmpwS1ZUemN3RkxkSUUvTzcxOW9KQi9FVkNOUFFSMzVkZTU3?=
 =?utf-8?B?cDd1Y2RKQ3BPK2hGNW5Bb0JSNXk3TVhpU1JxLzMxK1hRZXRvcHgyS0NQNGRs?=
 =?utf-8?B?ek9Yd3RzeWlSckJKZnVWZEt6RDlnY1ZyTGxGREQ1eldTWHBNV3F3NmJEK3Uw?=
 =?utf-8?B?Rkh2NXlGYUFRVFl5eUdGbVZFR3N2dU0vWUNnODZxenZOTEQ0RE1hZExmSEM0?=
 =?utf-8?B?cWRUREFDRklxT0lZOWJMcWpZSTYzRGpydTRObDNaRWJObDNBTGFOVUY4YW53?=
 =?utf-8?B?Zi8wbVhqdnRxT0s4RDhDeHIyaFFZdjNIZk5UcWF0WmNDK29aRHlDNUI1K3Jm?=
 =?utf-8?B?cEhiMnI3azd3dWhWOEg1L3ZSZFpyblhNN3UrNWVkblB5c0RzQ2orMnhsbVdl?=
 =?utf-8?B?RmNPMU4wYzRzTGJtazZUV1NYbUxDakkydnlVQUFFYnQ2eWROeTcwV3oxN3o5?=
 =?utf-8?B?OWNVcjh2NExicW9teTltNDZpc2VZWHhOVWR1UEw3N1l1Z2MwYlVDTFZ1M3RL?=
 =?utf-8?B?UHE2eG5ybTNEVGh0MzBkaUxxcWllQ1h5S1RNZGc2SitqRTFoK1E0UWMzdllh?=
 =?utf-8?B?SEQwL0JyL09UVUR5VVZLc1dOSE1XK1hGMEEwNU1rVms3bnBsK1NkN2ZQdE03?=
 =?utf-8?B?M3dYMkVMM1ZhOXpaUTEzVE5US0NXZ2RLSFZ4V2VmRGRoWEhCLzI4eDMzbkVi?=
 =?utf-8?B?a3g3cDdaUUR4YzZaNGhYY3RSWDBJeFZwV21LV0dibDJKSWV5cmJjd3Zna3Vx?=
 =?utf-8?B?cVZ3YUE0Qks5UEpHNmNpWElrM05UOVFQSHVnNXNyUWxEbkQ4ZndrR084WG45?=
 =?utf-8?B?YkgyRnRrNERvZ2ozTWU4ZVFYMFV0Yllmb1lDZXQxR011U0NSdGtQRHd6K3lz?=
 =?utf-8?B?NSt6aGpxbDBmNnl4ZTl5VzNmMjlHNVhDMUZFSFFJUEM3WDFRWXpFQ1dVUGcw?=
 =?utf-8?B?VFN0VUxxT3hQekQwMHlWNmJNTHFta2J3VlM5N3VBQzFYcXNWNU1VQjVZcVFT?=
 =?utf-8?B?YUFzSzQyeG54a1ZEdVJiVWxQczRlVkYvcFRySlJWUXhrZU9jWGZzNGRjdHRD?=
 =?utf-8?B?dTdSSEJUTVhlZUtmc1NrN2h0cndPMm9SN0xFMDJ6QUFPeTNQSUFYaUxpSlBh?=
 =?utf-8?B?Q3dwbmhudUtCMlRzSkRKMXVPdTlSbUxhKzlaS0dkS3JxbHNtSGt3VUV4bVBx?=
 =?utf-8?B?UE9DWVlCS3Q4bVlPbVJJRm4xeVVGZGFJa3dJbVRNVXUvUThXcGNWZHM3YXZL?=
 =?utf-8?B?NkhGOEpTOEJ4K2JmRjkwcGtlNXQ2M2pnSXc2bTFpQk5tZXlxT21KUDhQcE5j?=
 =?utf-8?Q?aheofLE/OeIgPsY3TgxmrYVEW36eVUT+/5JpcWdCe0LhK?=
X-MS-Exchange-AntiSpam-MessageData-1: BQZQbU1xYyy/eg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d2f7046-4c3d-40cf-b8a9-08de80a5c786
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:11:04.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k/in6+Z/nEgoPDANLREog98saWQSjXMYJnQhNB68ipvpNgRNUwx0RM1TIbPYB+ggmubiBH+10ieuRAyhY9/Hrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
Message-ID-Hash: 442XZKU6BJCXPB2HVYVFSF4OMI22T5XK
X-Message-ID-Hash: 442XZKU6BJCXPB2HVYVFSF4OMI22T5XK
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 mmaurer@google.com, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/442XZKU6BJCXPB2HVYVFSF4OMI22T5XK/>
Archived-At: 
 <https://lore.freedesktop.org/DH1AFW7NXUIJ.1NZJ6680XB5UZ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 11, 2026 at 6:59 AM JST, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 84 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 10 deletions(-)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..3f569acc3718 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -7,6 +7,7 @@
>  use crate::{
>      alloc::{Allocator, Flags},
>      bindings,
> +    dma::CoherentAllocation,
>      error::Result,
>      ffi::{c_char, c_void},
>      fs::file,
> @@ -459,20 +460,25 @@ pub fn is_empty(&self) -> bool {
>          self.length =3D=3D 0
>      }
> =20
> -    /// Writes raw data to this user pointer from a kernel buffer.
> +    /// Low-level write from a raw pointer.
>      ///
> -    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> -    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice even
> -    /// if it returns an error.
> -    pub fn write_slice(&mut self, data: &[u8]) -> Result {
> -        let len =3D data.len();
> -        let data_ptr =3D data.as_ptr().cast::<c_void>();
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` points to a valid slice of `le=
n` bytes (i.e., it is
> +    /// valid for reads of `len` bytes and is properly aligned).

Bytes arrays are supposed to be byte-aligned, so I am not sure the
"properly aligned" adds something (it's also not technically incorrect
so fine to keep it).

> +    unsafe fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result=
 {
>          if len > self.length {
>              return Err(EFAULT);
>          }
> -        // SAFETY: `data_ptr` points into an immutable slice of length `=
len`, so we may read
> -        // that many bytes from it.
> -        let res =3D unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(=
), data_ptr, len) };
> +        // SAFETY:
> +        // - `self.ptr` is a userspace pointer, and `len <=3D self.lengt=
h` is checked above to
> +        //   ensure we don't exceed the caller-specified bounds.
> +        // - `ptr` is valid for reading `len` bytes as required by this =
function's safety contract.
> +        // - `copy_to_user` validates the userspace address at runtime a=
nd returns non-zero on
> +        //   failure (e.g., bad address or unmapped memory).
> +        let res =3D unsafe {
> +            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_v=
oid>(), len)
> +        };
>          if res !=3D 0 {
>              return Err(EFAULT);
>          }
> @@ -481,6 +487,64 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result=
 {
>          Ok(())
>      }
> =20
> +    /// Writes raw data to this user pointer from a kernel buffer.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice even
> +    /// if it returns an error.
> +    pub fn write_slice(&mut self, data: &[u8]) -> Result {
> +        // SAFETY: `data` is a valid slice, so `data.as_ptr()` is valid =
for
> +        // reading `data.len()` bytes.
> +        unsafe { self.write_raw(data.as_ptr(), data.len()) }
> +    }
> +
> +    /// Writes raw data to this user pointer from a DMA coherent allocat=
ion.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `data` - The DMA coherent allocation to copy from.
> +    /// * `offset` - The byte offset into `data` to start copying from.
> +    /// * `count` - The number of bytes to copy.
> +    ///
> +    /// # Errors

Nit: missing empty line.

Other thank that (and the test robot warnings),

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
