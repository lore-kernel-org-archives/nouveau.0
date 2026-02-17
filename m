Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13071E8384C
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 02:46:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA0F010E42D;
	Tue, 17 Feb 2026 02:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oz6sJEuN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C26640675;
	Tue, 17 Feb 2026 02:36:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771295783;
 b=Pqgf0uCBFgF8ignvP9sU7oM2T2wkac7si867XtSgezk54wtvbpBSXPjZVhqP7XY+9nBV2
 gkF+MZxJymDckAyTKSZ3b5U1fqf29nVdh4OFnO+WnA4/+YZXa2pWS03r4STwQkcISXKOYNv
 ug/Kyhvg8DFtKQze+BTmaE3k04YLvTO3Zj7OZKdsdkFdd0tBFLeLKUOm1wld9lTy+fnKI/z
 IsibXKBcI40eViLbCAKenjtXtR/N3EOKhfTIIgU5zFGQUZEtawSmIQORCzqw3HO4UEW1hf9
 AycTXW77wQC+0wjynF+FxQpAtnCK9OIQqTlAuwtxCycaCjWfG45ER0b8misg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771295783; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+FDmSy9O3NrC6/0YRKao/8Y2rEN5k4FbXsnOceb/rss=;
 b=ZJIndOH8TYTZykrnzRJAhjT/OZ2R4Cv0XToVZ2m1t9qITDklSHU+LqXeZnidT9ge0LITt
 ARcu0efscngx1jzglPY0Mjgr6jhbZSEu6qM1FCZBIEde1Esl6jxHPDybdp/Ep18ZA3XdwaY
 nLQ7fwOWwMDa4wbxoA1TKJ8/EdGJbHV9q7pD7qoOhPaX4HokFz+EZ2f8WeNPWzVz+rsKrxU
 AaKnL9p0/XGVE6AkPubg0CluLVJMrYrfEILktMqfguIYlI085LThB0mSnlqAbQwIAo0L7p6
 o/4jKgedl0WWJwlmrkENZoYeDdq2WtnflvWrN6EW0Zhec1iRi1zpc3glT75Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 54984404F1
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 02:36:22 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B8FBF10E420;
	Tue, 17 Feb 2026 02:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DANmo8R1ab2PiTwfd1QT7i+pFvynd9zQNgOVZKUHQUPxdT0nJNihD3q/I8Fr64rbpEYmRX64vwxUNAO2SH9YJpQe7hoDTSmD5pws1G8g8gRG69Nibx/mZpABNF1eAZZf0jRPEB7BmuAGhcaYTmURQo5ju2Uq5mFBycWQ7EGUTVGee8noMu+J01F6aDjJb5RnWEBJyOggE4GtHqwb2Ps/+odJqZUPmY+RoPGKmnrO3it90WTyDCcOp2kwyQTbPHIg0QPMITvScaf86pRwfIPa8AYiFery7umXFszL+o9le/H0rVHs6/R1MEJKZgXpCduwcnREyYmqLxaGYcdh9oXGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FDmSy9O3NrC6/0YRKao/8Y2rEN5k4FbXsnOceb/rss=;
 b=BVb2pxNZpIkGgmggo3lqkuQg6ntEZf562eCubN8AHYqaTNOawNv9+KmeLMm0TXhJ2nL4/naMFrgtfdeNz1s/877iw+DL3Cq6iz86+EdTPfc7KK3IqCz9GHYx43Nt507U0jGmZHAP3wRwELxLwkeTQpEvHDfuK0SE1StnO0z+ySv6GpXAEjx9iLZjE+hsp7iqPmMWmJXPXzNA0Vhkqg2ofOgUgunC3L0HMEm6bra1wyriZCpRai31RX1heI254DqfS6z+b0pkB9f3ADYDKp0BPrIdxOZuTlUH/GVBsGSYzd8ioz0nn/izrZrPCsfYDeysTZINkQU1S9pNfK0fplGrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FDmSy9O3NrC6/0YRKao/8Y2rEN5k4FbXsnOceb/rss=;
 b=oz6sJEuNRIp7vWi5t0gNcNG9Qceespv0h38x6R6aNR0nkBM/DocGFciwIeUeFrfsf6tbDMQ/BhNDux3LvDvYg8FTAOciqhUzxWdzb8YxwGwelqWtofnBdCx/CM84xQqutBhdvCdJWS1j2m9ZndvZqbWr/0CEBwCYV4W5WEVfEoL7SkRFqxci8N6Z1s0VBbzEx4q6UVmkdnrnLp4jk8iHe60HLx4VI0gU9eYM27j0YE/k2qw0HvLuswiTBDrJUkaeWCxNDMOonoGxPkh4/pEJDNqY8F8T/8q/pFDBwMLDPo5TxoRSKBwM2HhLnv7o8cs1bslgs9g2re1SCABE+URIKg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:50 +0900
Subject: [PATCH v3 2/8] gpu: nova-core: gsp: remove unnecessary Display
 impls
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-2-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: b312b8c2-0fd9-4790-6463-08de6dceb0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NnpNTXpZQThlazVlRGRwVVgyMjNEdzhBTkp5NzZhWlBRVGVyU2lSTkpyUG5G?=
 =?utf-8?B?c1ZrcTgwK2pyc1J3NXRqVmZxajEzRmxwMlVNVWdEckVreEd5ZkF4eC9vSjVp?=
 =?utf-8?B?ZHFTOEZuSGFGWjU4VDBObm04RzN0My95akZtWXlVVUY4K0FzcG5DclRXU01D?=
 =?utf-8?B?b1BjTHg5RXZiQ2Z1ZURzMzVjRHNSOGo4YmQ1aFlMR3FmYWZtU2xoQ2xtdmE0?=
 =?utf-8?B?R2xWMTRJYlp1cHlUaElUdnlCV0lWUUZSYmw4OHJIaDRkVWN2M291K3ZsZWFN?=
 =?utf-8?B?ZmRhZHh6S0g2ejZGR0ZEMVRDM1c2TXpBQk5aVDk4THBialBkZWVuMzljWFd3?=
 =?utf-8?B?a1ZRK25yN0t4TmdINncrYUM4RDhoMFdKWHN0SjNRMjlxZ3NCSk16NGF2N0pN?=
 =?utf-8?B?cnhCK05XZ2NqL0dTYmlyRjhvK0hsSGZKZFpiSnZsMWl2ZmlrYmdqcGRiRWEy?=
 =?utf-8?B?YmZjUmhma0NqcUNXTElHV1dxVVp0NG1uclJPZ2JkaUlvUHNSejJCem84WGgw?=
 =?utf-8?B?RFlYd2FsaU9vYmFJU2ZZTitMNkdVd3hJUjg3M3NsdkJuR3dTUjJrT1ZKWmMz?=
 =?utf-8?B?dklnS0loT2tzdXdnRnduTkVlZUE2RTE3M0FzYU1sS0ZwbzhDTkpFTHBMcUVp?=
 =?utf-8?B?eTVPQ0Ixbm5XQnNTeEMrMU1xUWE0Q0VxUnhRUXU3cWQ3eE93ejBkNGlvNm1Z?=
 =?utf-8?B?Wnp3REE1MGE1bkJCNkxyS3RJTHMxVlJJNVVpN25qczNIN3ZZdjZiOUxHRnln?=
 =?utf-8?B?Q0FQdTIyTzRNTElwNHh2dGRTLzJSZmU1Y0NSOURKbnBQdTN6OWt4TkhwN1A2?=
 =?utf-8?B?ZTFDdmFaNnFycmpHTW1tSUFUY1hnSGVxSUpCYlZKRk9nak44bE1FdE9BM250?=
 =?utf-8?B?bTlxazdtREZ2Wm1oTVJjbWZpaHY4WVVPK2drNWFaM01FTEtsTUEyK21nOFlq?=
 =?utf-8?B?aU9ZQ3lrMzlndmNjYWtIUjd2SXJIK3RZOElCNlV2czJBTE8vZDVBVUVpOFZI?=
 =?utf-8?B?QlZ1b09ZVXpDaVZMVHhOa3Q4emlRa2VQSUZ3eDd2TU5tcDJBbW5VNFVxVis1?=
 =?utf-8?B?U0gvZkRPc0lRUE1QTWtoR2lqaEVTMGJuN3kxS3V4dHozNHJEZm9tdzlzNTNQ?=
 =?utf-8?B?bHB4KzJtZTRaNUx2MFM4ZmxnQUgwZlBSTjV6dWkzazc5S0tDMFVPTHRObXNE?=
 =?utf-8?B?U2NocmROdW1pTy9GNVIwWlJucEtZMXVUWm1BK2NCK0Q0SzhVa1IvQVE0TlZi?=
 =?utf-8?B?YUZVeERxYnFCRUZmOTRaNVFWdGhiVnljZHZ3ZVI0eVBOdUxPdFBDbFVFTVdz?=
 =?utf-8?B?MldlRDNTN0dZSE9OVTFkZ2d0Sm9adXNPZUJmaDZ3M0RxeDM4c1IyclV0ODVi?=
 =?utf-8?B?WEFHSlhVY1hVZENDZVZyNWZSVEU3NEd5UVZINkI4WHM5QUl6b29xcUVQWXBJ?=
 =?utf-8?B?YmNMUWZ0dmpkTit6ci85QTJnMlFvQVdmWDFYYjQ5RXdKbVpVWXN1TnhlWHBn?=
 =?utf-8?B?cHZ3U3JraE1yZGowdUpobitPMWxkTnJaQWc4OURQSENLbnhRbkM0UzNmdHJt?=
 =?utf-8?B?enlVclBwVVc2bmZxOTlweStQb1dRcHhKd1ZZb0lWV3JJMmVhNlVkenFHbVhS?=
 =?utf-8?B?Z051ejE3VG4rV083TkMrQ2Rka2JXbVRMZW1CTlFWaHk2b3lNTHhpamoxRGd1?=
 =?utf-8?B?OGMwU0FIT3FUMk92NjBLQ0RVb3ZST25PQldmMjBSaEtCOVlsckdCSThhWnBz?=
 =?utf-8?B?MTJCSzFHb1c3Y2NkbGg4SUFEdmtTSXd1S3BXRWRZcmlKN2FtektDUHJXVGdl?=
 =?utf-8?B?L0VndzVhZmZPZ1MycUxtNzYwL2pETEtzZUlVSlZ2UVViNVRHNDMxYSs2MjE0?=
 =?utf-8?B?YWZEdnFBYmpWcFl1L3FvNTdvZU9JcFU1ak1NNys3clZxRkpYS3pkMWV3bUts?=
 =?utf-8?B?SFE5cjZEaXNoL0pNZ2k0UXBZV0RQTUV1amVDL09sTzhhZUVyYnVIZUNqVWdE?=
 =?utf-8?B?a3R0UDkvS3FmdmhLSVVhMlVvSXUrajJwYVMyc1Z6TXZWSlNzNlNUVUtxaGwr?=
 =?utf-8?B?dVJqRUwvMWJtTXNRZFdJMDYzWGtoTGNlcHBFcjdSKzROczgvQlR6SHhWYVFM?=
 =?utf-8?Q?LLfc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eE5kcUhFL3VSckVPalVEeGtwdTFCcVg1NXNuelFBYXdSZzFPQUJlcCtBT095?=
 =?utf-8?B?Q1REdTk4d1R2Y2lWV1d2eitTTCtBSXZwTGpnL3lhbGpMSEJyQ3NiTzlseGVN?=
 =?utf-8?B?ZWY3ZUU4UXd4YmtKWDg3dmdRQ3VnK0VYQnVVZ1NuMnpmK0l2SlVVbTI5ZFdO?=
 =?utf-8?B?S054NTE0ZnRsTzhYRlJaU1EyZjJnb3dDdmdrSjFKbXNqWVMyRTRSajVOejhy?=
 =?utf-8?B?WWFtc1NGYzE5VFZWRGRIRnRjemdaMi9QTVdyem9wQ1djNUZJdlhDU090ZWtZ?=
 =?utf-8?B?V3V4T1B3WFdrb2NiMERiVytRem11VEtIVGJQVzcrNlUyamIxZFEyeWVrcmhH?=
 =?utf-8?B?eGJwRFZ1U3hEQ0Q1WHUzdGNmdVMwR2NSV00wUXYxM0s3U3JBcWpnR0xJOUtq?=
 =?utf-8?B?ZGRhME5rV2hoM1pxRmFmaFBlOTZBZHpIcWM0ZllsOVB6Tm5tYUxPYkgxZG5t?=
 =?utf-8?B?YXpUM3BRL1ZZWldZWTRjdkkrSE9xZlo3cGRvakRwdVYzeVhxNklmVWtDcFp0?=
 =?utf-8?B?dTNyU0dWZU9UUERZMi93RGRueFk2b3hPT0cvM1E1ekhSdkJQTG1HZTFLaHN3?=
 =?utf-8?B?MHNYZHlmWmU5VEVsQmNzRWRTdTFSRHdVQ2lZUW9kNitWS3QxMkRYS1NYYVBu?=
 =?utf-8?B?VzY3NmtZRHV6TU13T0c1OWhsQTh3STN4YzJoeUxmYmp0RHVuSjNJTHFKdSs5?=
 =?utf-8?B?ZTREMEp6L25vNUZXRHpIMERWd0dDcWdvQ3d0My91eWVTSktWTHlCYUJDSHlI?=
 =?utf-8?B?ZU1SaGxYbFFDOHdkdmYyRHJuaWJpRmFaRkZXTXo2dDM1YXJvT1pWSDEzZDBm?=
 =?utf-8?B?RUNCcFl6ZHJNaHpBSkhWT2RUVGMxMXJ6eFpSWXE3aEU1OXk0SDIxR0NaZWVm?=
 =?utf-8?B?cng2YnNTZkpaa1dwMy9oSWRmOTZsSzFwQXpWaE43S2pid3RBRy8vbmY1ZXI5?=
 =?utf-8?B?RW5KN0FhRkhmT2tCSW5Zc3kyNzlzUFNQNm1Xd1pjbGVxNmpTUHNSd1l1ZTVB?=
 =?utf-8?B?NXFaRnZ5Y3pFUTRqT1ZkSHoyMmVCVXl0M2ovTzk0RHVWT3NiYk9PaENlWGh3?=
 =?utf-8?B?SU9QbXJZWnRlMmIyOU1LdUpHdXpxWFl0VVlyVmVsSzJkRGZPOHhRKzU1ZHlz?=
 =?utf-8?B?SkxNUlpZczQ2UDZnV0JHME1PSzBtUXhYeUVjM1kxdmJkV2dycnY1ZXdvM2Nl?=
 =?utf-8?B?cGVwNjMwMGlsUFI0RzBVVEwvQUlsYVFaSnNueWJYVmxFdEpzUkxyKzh3Wkp4?=
 =?utf-8?B?UHVxSk8yRGErNERIdlNXN3l5NWwrQU1qNk5zcmJQNlIyTlJBRXg1Wm1QLzhQ?=
 =?utf-8?B?K0hDQ1ZvajVid2ZlVGpPYWZsOEpUYWNQdnJFQVVJVVZyYWJvUHVCWU8wME9W?=
 =?utf-8?B?SG93ejlFL1ZFZzNMaDc0UVl1Vk44UFArQ3BrS2NKSzIrRFBVRTdNUjVHMmtP?=
 =?utf-8?B?RTlDcmFVNjdSbyt3emdXaDNjVWdRS2VkTU5JemZiM2d4SGM3bW5DNW1ZVXpT?=
 =?utf-8?B?T3ptUk44a1RnVGo4RlBEZTY5U2V4c2tFUFVkOVRzVStIaVM1cXpTcm1QMkJD?=
 =?utf-8?B?MlprUDRIMUN1My9laFdSQlhFbi93VnF3RU1Dd1NIdis0TWZEVEFKRnJxSWtr?=
 =?utf-8?B?b01DREU1QitOZXZRRnFncnYrU3I1eGhNMnQwakRyMjcxS0lEQ3lNZ1J4NDFw?=
 =?utf-8?B?Q21PaE1vY2VQRW5zejhDc201cWJKeGczVW9qSEt0NndubTI4cElaU1Brd1dL?=
 =?utf-8?B?TERkdEp4ZUhySHJIeEZ5MWR3Z1BpRnlQdytCK2RxL0s1M1hLblAvM1AzL1NM?=
 =?utf-8?B?Z1ZIM041SFkrWitjTTN3cURoaG9JL2JzRFdQaU10MjdwSFU4eElIS1QxQ01H?=
 =?utf-8?B?TUMveXB3a0Z2aU1HQk56eDNpSXhNZWVOSytDb2t2cGVCdHV1VVFuSGdnejBh?=
 =?utf-8?B?bHVQNHFFZGVZQ1NYZVBoQndGQW1tRVcxTU9mRjhQNmNXTmxyT0NxVDVWa0x3?=
 =?utf-8?B?Z3JSZ2ZaOVZDb21kWjlZbEtQSFAydzdBVmQ0YXEzaWNkcmVUNlBreDFMZ0k0?=
 =?utf-8?B?K0hZNWVzcmJraGhYTDY5NFc5d3JSY0FpRU5GOWdJZmhyNEh5RHNWeVlzVVA4?=
 =?utf-8?B?ZHkwTXdQOUsrS3VtYTBsVTNqaGhWVGpsSWs4VXRnRDZIMFdoaW93YktScGRY?=
 =?utf-8?B?bk51ZVFmYmNDYzdsdWNKdVVzclloNHZxY01NZUVlVzJ6ZDNobk91UkVnc01w?=
 =?utf-8?B?ZVk3aHJaMFkvOUV6TzRqb0RMZ0YxMHcrby9CUVhVbHVsdHBFZDNsMFVlcXkv?=
 =?utf-8?B?MndyN1BYdkVVMVF2d25zMDlBYjdvS29XUHJnclYzNTZDcWVHaHpYODFjY0RH?=
 =?utf-8?Q?OhCWzhgusPeUL4TpAbfHr37hFzNN6H5asAwLau513Xbq9?=
X-MS-Exchange-AntiSpam-MessageData-1: wDpsPAejMyfrnA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b312b8c2-0fd9-4790-6463-08de6dceb0e3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:03.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C8yGkWZFdmeh3OOghdIG7u804dYdzeZOuH16si8j2wfJSwBB1DgXjnuXRCXdJkydJRGqgRa0XbweJH22aAK37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
Message-ID-Hash: RO534OEG3UWS5DMJUUDJHHT2KDHUF2XU
X-Message-ID-Hash: RO534OEG3UWS5DMJUUDJHHT2KDHUF2XU
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RO534OEG3UWS5DMJUUDJHHT2KDHUF2XU/>
Archived-At: 
 <https://lore.freedesktop.org/20260217-nova-misc-v3-2-b4e2d45eafbc@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

We only ever display these in debug context, for which the automatically
derived `Debug` impls work just fine - so use them and remove these
boilerplate-looking implementations.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs   | 54 ---------------------------------------
 2 files changed, 1 insertion(+), 55 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 607fb9ad69b0..9eabec49849d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,7 +531,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
 
         dev_dbg!(
             &self.dev,
-            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
+            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
             self.seq,
             M::FUNCTION,
             dst.header.length(),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..3c26b165038e 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,7 +10,6 @@
 
 use kernel::{
     dma::CoherentAllocation,
-    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -223,43 +222,6 @@ pub(crate) enum MsgFunction {
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
-impl fmt::Display for MsgFunction {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            // Common function codes
-            MsgFunction::Nop => write!(f, "NOP"),
-            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
-            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
-            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
-            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
-            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
-            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
-            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
-            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
-            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
-            MsgFunction::Free => write!(f, "FREE"),
-            MsgFunction::Log => write!(f, "LOG"),
-            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
-            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
-            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
-            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
-            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
-            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
-
-            // Event codes
-            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
-            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
-            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
-            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
-            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
-            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
-            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
-            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
-            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
-        }
-    }
-}
-
 impl TryFrom<u32> for MsgFunction {
     type Error = kernel::error::Error;
 
@@ -330,22 +292,6 @@ pub(crate) enum SeqBufOpcode {
     RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
-impl fmt::Display for SeqBufOpcode {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
-            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
-            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
-            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
-            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
-            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
-            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
-            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
-            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
-        }
-    }
-}
-
 impl TryFrom<u32> for SeqBufOpcode {
     type Error = kernel::error::Error;
 

-- 
2.53.0

