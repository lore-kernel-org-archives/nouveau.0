Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27CFE9A04E
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 07:32:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8149310E6A3;
	Thu, 19 Feb 2026 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KTsWjOz1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DEB0E4340D;
	Thu, 19 Feb 2026 07:22:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771485766;
 b=UelhwULoOK8bFRZUhjRYGV547ay1BmqaZ6r8cKHi4BHpmK3NLeb02GY0Gw2kd164ZAnPP
 Ug/Qw+nU3NvSxoFJmAIXJxpZ7RLsBTeCsD2Y1H3BcC5TgqFF9dlOxLW7+zQqVr8uphKfrF1
 rS3rCNdpxynUqhd2fR9NWrJhRbhJ7A4lvtwcRc4Rt7ujRqa7WSpkfEaXg/BeENpztg15ExU
 ONmCYbXFKK1cBVPcl6Fvx+ehR+sZuKN2q0O/w4XAvbf2SEcFx8xrLB2GnwqUUgzAA/PCa/P
 MM/JG/Eeadc3jks2RStnWGfVXeP3vygKGxvl4X0Dr4xqGdv74vOX8kzP/KeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771485766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ISqCkHYikvpFBEpH7RzzCBFy92BJrZp1ByqICCS0ae4=;
 b=sf5R73Equ27bM3qFsCfP07PADk7POR0Byna6jERYnxAEr4t1FFl7pu2tBJhRygAL4i8TX
 RRQ0zei5vJTJibjeGdJIkmrGDKRmbHNUzm7r6Lq6Cb2DMypV8mTRg2Jl2euVuOdw88DpyW4
 QDoURFyTwgynsCX6mhNwiQPMuLdwjcZdAvffs5HUmD9fTD13wvjLhhlT7hfJlhxcgI64/Gm
 o5qy62JTYs6DLfHxckw1aTbRl+Mbbh7+MJCMbHN04Fiw5O0l+4Wjj9lGzeEq8Pi0pTcnz49
 2CYvtQ5M4YHcqGLeWJHLgp9oHq9N8uPX1BGo153dJlP8jw+84SmSPBtthijQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C67A433F2
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 07:22:44 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A943010E68B;
	Thu, 19 Feb 2026 07:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiKnUHf7i0RYPLlUVzeNNNkRzGORZ8xa0XrlkFA2JtSYpfhUffi5kC8xwWQ6M0/wlMzfePD2uprbiihaXy8dklxhtWhbNOp/voQ/NNcGI4DnzOIzZt/ifbv1Z2WKU8D4PnEE947/kKLOr11LQFIYoHCbg70DSgPg6hmClW7mpWNiqBSp6Ag8Dz7/hUSyg/YRoMIC6B408rmtB+Y4Q7AWPy3/vV4W2Vh2v/dHv4FrO/gUmUYLa5mQj8HD75kWFKU3CKxjOcgVXjrpJeHjuY44qpIP9WRQbKLxHGv66cXS4pv4j55sG4vZyTzQnpHHf9xVKRVaXY/Dqjrl7ktdWZpxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISqCkHYikvpFBEpH7RzzCBFy92BJrZp1ByqICCS0ae4=;
 b=e32VE29HUWCDPn8b4dioUyVGBIiqS8mwwKYlSqSSxWmqsB/A0pne7ayVlPueeSZLiPpzrsXbDomzXiiy1o29IQ/EqBfs0xZzTO0ZQP7BFuaJFSqfE1oswhFxxei5Ng53lkVPIKCes1Tat0nkWla7pzmcgcQFQYRpaKOoVAAmJZVWdBfSAN3/IG7RR2T1A+Ao82utRCPm/fsi7v1qpkOJaSjuKNevqMNGyp+4nU9xst8IlwhDctTfvKua28pvr8cQzWKGC1MtQWd/6V7m6f0ffN/bek4GdBgBv3Z/wipONSrY03McJH1r/uNJotPRPQ0YzSEWIOVbJzXpbtMD4pW1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISqCkHYikvpFBEpH7RzzCBFy92BJrZp1ByqICCS0ae4=;
 b=KTsWjOz1nwpYDX1Fl+R2fsjHzXJtfIHrnRtAgGWEiisrBFRHpVYjsxzthgmPjYZuqDPkPTeTrJks8+hAIbV43e2MeAVfuMvOzjDo29dUoVXlkOb9OWVWQNHSbDIptE3m8iaektbyHlJZCJzq4h+74rtjngRVy+By3XuEJRSpPMPvVAWzLMSFm9SZMbRm9Z+C73ypmZDNtRSYJ4eBbzpQBuVY6aOdNgWCGIWbdu+vx/Zfzrw6OHBx7rhpsh9ArmfiKudCXR2OalJU0TWHviyPoYvFslk/eCNbdsJHs6ggY1NnGnrpsOI0iOadof4+LQx3qgi7OPE/P4cciVIx/VHsvQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:31 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:54 +0900
Subject: [PATCH v2 5/9] gpu: nova-core: gsp: clarify invariant on command
 queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-5-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 650cbc12-adb4-42f0-d8ab-08de6f890ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2xNaWloL0V2Z3NWUWE0cE1yM2gwQ2pBa1NuTThRRlRZNzRlZEdrS2pHb1dE?=
 =?utf-8?B?WkJLbzlEMG4zaTEzWk55WTREeENka0RwakFWOTZYaXJUTG9oZ0k0eVQydS9R?=
 =?utf-8?B?WEZuU3JHQUdGUTlQVWpmcHo3Nzh2eG1JS3VabnZWSWRrWHBEakNTNzJxdWtM?=
 =?utf-8?B?N2hSM1lvQVNFSjlMZmNaczdwWDNGS1B2emtoYk8rNDJKM1JPL1ZaaFJkTUd6?=
 =?utf-8?B?b1BGMHpBdGdqazFIVjVDbzFXc1Vmb3FLZlpZMkJMcWZrdi9mRHRHK2ppRjJX?=
 =?utf-8?B?S1RNV0xZNStrem1DVm9oUlB6M3hYUnJJMFNSaXVhdmNRZ213RmZKWCt6VTlv?=
 =?utf-8?B?S3F4Qmp3N2NDSG9ISjZ2QjE5UDVSUDJBSDlpbGdBYm90aWd3d1lET05iMTBt?=
 =?utf-8?B?aEtpSTNJUzdiT0RlU0duL09xbU5mM25ISnprUnFkN3VmaWFKMDFoUWViWVdC?=
 =?utf-8?B?cHgwZUJOZm5iNVloUVVoeDlLVlpDTG9td3NERCttL3d4ZUlrNEVmUitUWkto?=
 =?utf-8?B?OTdja1RxOEF5blE1MlEzNi9peXFmOXNzZ2t1QkRKRE1UU0VZck92MFBwVXZV?=
 =?utf-8?B?ZWVXNzNQV1VJRkZ5b1dUT3BmTFJBWHlNaGxmeW9kai9ZMG5meE5YWmlsSzFJ?=
 =?utf-8?B?ZkVzaW11dFFGNmNMN1RRZWQ4ODNsTytwRm9KQjNKeGJCQ1hFeDFlZ2hGSkcz?=
 =?utf-8?B?SGl3QW9Sdzl5WGhsUXgyRGU5U3FsdmJIOW1nOU5jVDg4WkFNNFZrUHFrUTJY?=
 =?utf-8?B?dmwwYUZGZGNuUmYzNTg4VHdYM0RFZzJXZ05iNXJlMjBiMmw3RkVac0tNTUp6?=
 =?utf-8?B?VlBvTzBOSjJUQVhGMlhNVldSa080YmNKTDZnMU1Ya1ZzWjRudHZlZG9jMVF3?=
 =?utf-8?B?NjI3aTNTdjVxTU5tcS9vOFhrSmtCSWZ1MVA0eWpGZzhXTjRLRnFZMUJXcUU1?=
 =?utf-8?B?ait6M2pHaXYrRlQrMGhNWisvaWFRbEZBdkdtL0dneXhqUnY1TGpaSUloNnNs?=
 =?utf-8?B?NFpqS3FOZ0UyTnhlclRhSDJLNitVMHJHN0NSRGlFMkx5R2FwWFBEZzNJR044?=
 =?utf-8?B?STNhWW5UdkczQnJ2dVlXSXV0YjQwc1dYMmtYN2ZSS1RCdDB3c2xac2Q4ajZo?=
 =?utf-8?B?NnhYODl4OGVPNWVPYlBOalpsSUhiSFJIdUlGUVdVSHUzNlZiVS92MytYU0R6?=
 =?utf-8?B?T1hZRHp2TEhVUXM0UmlCTkV2UVNSeWJUQ0lPWUUwYm9VSVFOaFdEUm5GemJR?=
 =?utf-8?B?eXdzekVqckFCaWpzMm84b0N2MDRmRmdxY2ZqSTd6UlM0cDNXWTk2MWQ4cXR4?=
 =?utf-8?B?ZnNIRHRnVDNXNUM1aXFEK29lWWxFSStkNlR5ZjdlSHo2dDVtWEw0SkhUci9Z?=
 =?utf-8?B?UE9KNGxub0t6Zk56QzNMb1dOTWFsbCsySlNBUjlxaHh0N3N0RXZBbER5eDFv?=
 =?utf-8?B?ZDhVUzhOZW56ZG9nbGpqU2Ivc1NZVFNqdFk1V0JrSWhEbHZUNHJGSGpEVGpa?=
 =?utf-8?B?TEYvcldZUzdBZTRlYmVvOWRLV3JoQlVBYzVWRy85ck9zSmlacE1PcE1iVTRl?=
 =?utf-8?B?c3dmZzlpWUw2VldMbWxUeHV1clNTbVdlNHhzQVI5TEpTZkxGYlN0VGFHcU9F?=
 =?utf-8?B?WjQ0dlhhbVdRMlRrYUducEVCbHhYcHkzSlEyb3lCN2ZITEVMQk55RG9jZ1hv?=
 =?utf-8?B?UHpia3dmTGVUd1pMS2ZxTkdlZVhWRkdKN29USlMvbDd2OUVCbVNQenJ3VHVO?=
 =?utf-8?B?Qjd6QU9CZStTdXpoZXdnT0t5L3hrYmpjZXY5Tmc3MXAwQ1BZYWNQOHNtWHZs?=
 =?utf-8?B?QzVza3A1RlBnSVVRV3pjb01HSzZJNmE1SURsbXJ5S2ZkU0UxVXBvS2c3bWVq?=
 =?utf-8?B?bnIyZlVZTnZvTWxKTGRmNVhIemh6dlY5MnFFNGVHN1dESXFiVDVxa0NQK012?=
 =?utf-8?B?eWwvall6NDlmbnpZTk0wVEk2ZHlVNjFiTEpuNFJtcytwWkE3Z244bEl0YjNE?=
 =?utf-8?B?VWFTdUdjeC8wcUF1UVdENE9CQ3J1cEJiOVdkbDRiNzVaTVVGKzNKTW1EK0Jx?=
 =?utf-8?B?b2EyVXlYVlJWSW9lcnF1U0crazhVTWpXN3Awem9jS3FHaENZaDJNeWJxQkZT?=
 =?utf-8?B?RzVjREZ2NVB5VzhwTjdaQXNnZ2FZWDJpRFhzL2h0S3hpb05rMGlJajRtaUZt?=
 =?utf-8?B?MGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2xoaEtsNXJMY0gwUnlQQ2hiQzBEemxWM0VHaE9GN2tKb0M5cEhmREgrNFVX?=
 =?utf-8?B?aVIxTFpIZjhwUHFYWWx0T1JzTUVRMFRESjZGNnBLcHBpdnBocENOeDJzZGpC?=
 =?utf-8?B?eCtabytSbmYva0FRVmlHMjRXVWhTTXZzREFBVGYwWGNHNzJicWdLL2RySWYw?=
 =?utf-8?B?bWx1cE5QYTZlRHgzUDkvanUrU0RuVktWTnU5cWJtYXdDRlBXcmMzVENHTWRu?=
 =?utf-8?B?M1o0RC9SUWt4U0FBZmYxcGQrb1YzenhxbkU1dHdjNDdxbWxCZitSV3czUDQz?=
 =?utf-8?B?VkxPYTJoY1hhdjVLekFBWjJQZC9nWnlqYzBKYUhodW1nYTRVMUxFZm5GMnVo?=
 =?utf-8?B?c05iOWEvdThTa2V6YWp2aEM1VTNzQitXYkhHY0I0L2JuaXZVNUxNOU9FQnBP?=
 =?utf-8?B?TjBEUFVoUUdrczFkM3ZvdDZBYW1Db0lUb1MrSHdnTENkN3RVNU1XdEowQm5Z?=
 =?utf-8?B?czRzQmFnemNMNnVrc1AwQllibkNSSjF5YmNUcmd0Nko5T2ZlL2JyVEpIR3Fw?=
 =?utf-8?B?cjRlZGZjSGwzbmU5QUxZQkdPTVVPdHFWa0g5OWNJcnRyU3lkd29JQXQ1bEdJ?=
 =?utf-8?B?SURUS3RJV1g4ZFJTZStKS1ZNNW14RXRYUEQ3NW8wbDArd3pKU1IyRnZjYWdV?=
 =?utf-8?B?N09jWUtJMkFWcjUvWS96eEl0WVVWQlRqcVkxelV6T29ERWlSck40QmhHUTB2?=
 =?utf-8?B?MVhINEQwVnRWK0lmWi85OGNZYUQ5ekFzYy9LZFZ4NEo2bVZncEpPOHNJTFJx?=
 =?utf-8?B?cHRUWjNud1lLQXllY0tnMWlPVXZFTk1rZG5ad2tKclJ1bHhLU0Fld203MGZX?=
 =?utf-8?B?SnNLamdyR2VGSEdHMGJhVXNMZElwOWc1bStZSUtDa25WU01GTlNtVXNwRWhl?=
 =?utf-8?B?VTB1Njl2c0EycXRJdUFJYWtpSk04U0dxdWo3TVNGTTRJbW5DeEEvNGFCaDBj?=
 =?utf-8?B?M2FXMHA1Z1NORk9NSDZKazRkdVNIUklndUlDaytsd0d3QmxrSGZQdTFBU2hS?=
 =?utf-8?B?QzJTcmpzVVh0WjA2eFRmazFGMlllTzVsd3pDWmN0Yk9EVlZJSDJOSU1nYkR5?=
 =?utf-8?B?VUNZOXloWlNFb2Q3NXYrbng2UkRqMXRLbE1SMFg2ZmF1c2tMdENFTlpoYTd0?=
 =?utf-8?B?b0l6L0xNWDJWYWx0dFV0YkVkTEVsUjFXd3Fka1JmNDFFK3B1Y255Vi82b3Zi?=
 =?utf-8?B?VWZ6RDFxOTBjSmVSVXE4RGl3VUJsdGpuK0NXZm1OQUl3eTdEa2RJRzVzTkYx?=
 =?utf-8?B?MmtYMS9DcmRjVVcySVFNVTIvRUQxZGZOeTlRRDZZWnBsMlZYaFJPcEo0OUFC?=
 =?utf-8?B?SkJGdEtURndISmpURk5scVdpTHdablZrSjF5U1JpMlJzbC9hd21nQUxnWlpC?=
 =?utf-8?B?NU82RTN1eCtjNlh6Yks1K0oyaGgzYi9ZSTdjNWE2YVJQdW93V1ViaFVTSlhO?=
 =?utf-8?B?VC85VmxBQkdsa2pqVDJEUnBaOURDNzhKTUg4NzdJZSs0MG1heU0vNUlXT285?=
 =?utf-8?B?ckVxZHV1UHFNNjlNVUZibFhNbVZYYW0ySERLN3NMU1RBNWNKQXZHMW96RzRF?=
 =?utf-8?B?cDdGQTAwbDVDakR4ZUJ0bGVyMGlZdFVZdStqdDBjRGJmYUZjUGVCT3BoUmhZ?=
 =?utf-8?B?OXlROUV6NEIrdkNwTUNEVjI1ZGdHTXpYS0FucEl3ZDRsK1VvZ1o2Q1JMY2hu?=
 =?utf-8?B?R2oxVFU2ZDJXWTQ0UWhMd09IOGxVQ0NYT2JKLzl4eUg0NExrMkVWcm8rQ2VC?=
 =?utf-8?B?ZWhMS2hlNHZ5V0s5cXZiNHc0aDZWRDU2L3d3M2tlN1ZzUDFXM25WU05FQVhH?=
 =?utf-8?B?SHc1RDF0aDVIaGdOdG4wNFJVZWhzZGhId2ExbVV1N0VhV1RzRWVVcDFHbEZ0?=
 =?utf-8?B?UXY5N1UvK000TkJtMWdmQVFUdExNRE1WMG9SUm1QNmx0dG5KU0JoK3hrMStY?=
 =?utf-8?B?MEM4VWdJWVI4SUxIZkZVVHp1L1U1SHZZYkR6UWpKcmtCVzBVaGNwUjNjTU9H?=
 =?utf-8?B?QzVFR05ha2t1RzZGZTh3WHlLV1EyQ1NhdVFlMHJJNWpZYjRnbXRTWFl1ejR2?=
 =?utf-8?B?UHE1YkU1WTFTNVN6c1MvN3FuaWU2cjcyTXNFeExudytpUzdiMXRsNE05a1F4?=
 =?utf-8?B?WEwyN1AwVnEvS2RlM3JRbFBSU2ZCN0dXOHBGeDMrMXY0aXBwQWxBQ2hMTFhF?=
 =?utf-8?B?TE1MK1V0SkNtMlFKaFBzZ3dsTDQ4M0hUN2xBM0xuWGFLamdmSGF5R1VhcGFv?=
 =?utf-8?B?c29CN21TcC9NZ2Z4UE05STZHN1l5K0VYS2xVZXZ2SG1yVXpIZUcyVllsWWlD?=
 =?utf-8?B?YU14cEJuVTUxR1Jua00zbU9WK2VMd0lqTXlnVDNZVlg4czA2N2wwUWxSN3p2?=
 =?utf-8?Q?Ovkurzv6LEx6xr2qWQn78LS6WDsPb4UQlNM0OMN8rZGPN?=
X-MS-Exchange-AntiSpam-MessageData-1: 93kVJTwu3x/mBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 650cbc12-adb4-42f0-d8ab-08de6f890ab2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:31.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JLpMUS8MuZTjBQDtm2N6QU6en5w4YBtmaWHXFVjj37/VpI7C8TkYyeZlT+R3JkSqYQoQxwEx+gnT9z9HOd5vQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
Message-ID-Hash: 3WMMZ72AHEFY5FFE3YMRYS5HDNBAZFUO
X-Message-ID-Hash: 3WMMZ72AHEFY5FFE3YMRYS5HDNBAZFUO
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3WMMZ72AHEFY5FFE3YMRYS5HDNBAZFUO/>
Archived-At: 
 <https://lore.freedesktop.org/20260219-cmdq-continuation-v2-5-2e8b7615536f@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ae4aa7562dee..08b8c04909a6 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -518,7 +518,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0

