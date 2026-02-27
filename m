Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1AFEFB49
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 12:34:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7810EB5C;
	Fri, 27 Feb 2026 12:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h07VZzHb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC62144CA3;
	Fri, 27 Feb 2026 12:24:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772195040;
 b=ynXQGrGQuInZqNUa3djZ2uDrvNLbE+rYhnFzb/G1d2uF3kNXfT0M6R5N06c+Wb2KyFcF5
 6FXLY1AeA9mmPrdrSimANhJpARMiopXxJal5jcQ2AKbMJA7ORLe+Eg0d/o1ichy6mkG8u9j
 9je/QyyZEuR8X22NFb2S8OTF4ac+Wuom+7duH30O2ggisMZed/IB1wJw3YY4YBQnJ4HorVQ
 nZAwl3/SyMw4WYss1BDdqnbDykD+/GOBAA1KSUk+8eSblA7/nInpnsiNZ52dzStcDTzL0u5
 r5xGfMVVYE831p7T3/+E3snzs+DZz+t9natsL3JHczysxC0LI2Pm41Qc5tOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772195040; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=o5nhcZAQ2gJL9MOPZGcrmtYVN8hyZP9rB+yj5vICLNg=;
 b=h1As2g8nLOLPvT1wwslvQXRwRNg0kJlvs/vi5DYkHursu7zkF5vewzHh/vhuslIh4mfcn
 ehsJ0XdP098lqLDRFMc6czPwYoy8pV0s00de7Dx65WBYYTQ3Dv85HEBnwc2TAJ3/n4NdlJD
 YT5/fg0T/NEJh4nU6xBu7MGchZkAwffkhyyCwHa2aSqB5xVo6Uw0xmU4unc1YO1m9sF3Uda
 B2aNw7bVFoU924hI4xxBs0P3DxLFp4uuS3762oOggfAoeVq1Bv/TZY/HQ5Kyp61TUA7c4Dx
 JDCwrJe1KY73LtfLfEUZTxHaeZn8DL/afws96yvV5Pnlph/Q532cmhquqsQw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BAFB44CA8
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 12:23:53 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3710E189;
	Fri, 27 Feb 2026 12:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg3sqGb90gaUSetBKLLHsDT9eaNEhY54UsxzOWh9bZVmrHSLJOZjWu0umMur9pG230fUFp83IvoWzOwXC0RIsJ1pH5nU2t1yHJbaiZzQ6bh/BVwblITbaf+6eY579Ah0m61qJGz1/KNv4/ehRt2g6qRGJYCJ+IFlv8aqawDwNgbSpmfXIdtwPXPTk+8/I1KYoST6AR4Wu7SVJE9NHW252gkAiiO8yqedUq1siuwqoYuW523k0xrRdtnxSi6gyHlTI2/9iSZLz7b1kCoZrWI+DvKMUo7gchr+vuSlwDH/pZg6M6qFB7lYymhMiaqeAiYU75uD0snqIMFeF452RXyeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5nhcZAQ2gJL9MOPZGcrmtYVN8hyZP9rB+yj5vICLNg=;
 b=v6V6xoWQKWyDvPYdfPzREzhrhgVoG+7nDxT2kC/n/khbST0jjOMTRQix3kbARuBHxe6Vjn9tQfPsekXAB3Gbf1f+5z9BgNcVNXCamvWpVV9WhsxAM/RC9vTUvXNhs97YXyr3LbJ0GKZw4PJQukgK2MXbrQm0vCEPUTA9ORlUYGHuYCoiVaYcUygMUC1dLGbyWtL2WldXJ8+Z06TEfOB5czFAOqSevbgPKXDsNYxRRAdwxWBJkUKB2uzoK1yMGfqzqCNKGOPBTJZd47xFN0+WGwWe8bTA5gz2ntBHF8k2mgF/RBzdm46xWB3RaBG7ib+8beXJaNIjQRUn0T5fpGnwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5nhcZAQ2gJL9MOPZGcrmtYVN8hyZP9rB+yj5vICLNg=;
 b=h07VZzHbsrXaqq7FBgtBs+WInIPQcmDdqNDtgT6Tbj8cJgQIP1TsdZcMOOXHShI4R8X7ths3/FMhtAmkw+4sZUvUh9TrJOjPMyWqmVX6ATkyNrUgpPdgWOjzgrQP0zg4dF9Yceu6Q4GQacDkRhB3XqgeW0Hd155MGyejt9bsnug29LFCWYXAck1fJ0mpcABRP1wI2lVXS0WqCGnsfc6ukOYvKxRjMPhx908PFHRz8pLhWBxt14RZAJd3pBBuzWrzOMrj396Loe9EsG+gGb6qd4gOSvVFPhrMQoRgblcYNgHulJd0VYuUXu5XeQS1jQr5McH+VXQ7g8za10KTcGI7Eg==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:13 +0900
Subject: [PATCH 8/9] gpu: nova-core: gsp: add CE fault method buffer size
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-8-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 15eb758e-c107-4f2c-03d9-08de75fc60f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	ejZI0j1eejd/RQTEPzJFqBJFIR9Itflbb1VspPFoDQaDULSsaMuCqdYhMsJRaz2uCtl5wyAJ0GOuvE2DRlPOjXbxboZIwQ+z01LGIsqF6ZykO4HgpjoCBdtPEA9B93ASh/Y6jJmMhAwihxvgJl7MIAtMK0xolwyBQi2vIEVqIiVoreqMQysxi0DnneUT9V5Sefd372bGs7KKNajDZ823Dvi8+HczJT2Q2nH7YeAmc0uo7iM6wf7p0IcGCFrrCoWZs0AqWZV9LM6Ahm5UgA4kixn4QXfYOePAdnrbBaw0XRpYk9Mcg8RXdNBIl7iENpOQjdkF3vNAAoIrL8L5QqqPAQ1k26fUXrjou2uUQJx03aqP5fLzVxsM4m+xd0GYiyify2xSxKT6LlcpN+sqNsf1g7Q7QLeBdKA7gIiKmL1+v5BiUaZygIQ/NE+AwmSjr8Y3e0IaZvLa7f92O8I3kydxQG+Pb1PfECSjcSQIoP23DlNs6kLRPmuEhvmJH1M8fuhPeH6LliISupfJD0LH0K4JOXATf9PzLEvltqHzL9evrA1zgz0KeRb/sPG/fH3N/uqDQd6x7NuR3kQ1OgJX5EcZGFpQZ7NuAT6pP51QW4hCL0UgAONmBdjNbIa9cmOcu81D8q0pr1A5aOosXYmXvQqRwF4m5vnGTP4+L6EIiPywTkdWOeM/NlI6SJOmCQOAaIUgFbVadbnTGswF0dA89hToX+z6Wa8DgkMthZ1Sh8j0EEg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlM2NTdoOXVVKzJiRzJia2Q1NVA1YnhPVU54SnFpVjJpQjZGeTFETFZGN3E4?=
 =?utf-8?B?VXM2UVg5eThuUzlOVDVTUG1wa2t1Qy81Sk1KRkFWbGcxVzBmM0FycEZqb1VE?=
 =?utf-8?B?SHVuejJ3cjlJRUVSYW42NEtKaHBvMEhLbS9HeGNoYStTbCtTRXVaaTdzN0hX?=
 =?utf-8?B?aTd3TXJTWFRVaTNuRHRPUFJJWUN4TkJyYzUyY3AyMzQ4dExBMFA0Uy9ZTGo0?=
 =?utf-8?B?eWRkaDI2cDMvMGJrZXlzWVhWSi96MUltWkNwT3VZTzVBVE04ZDU5bHh4cEFh?=
 =?utf-8?B?Z0lhVVpvUDJPYXhzUmVUY3lselJvQ29BcmRtN3hLQThWRGF4M2dwOFlLVGxj?=
 =?utf-8?B?b3ViOVB1eTlpNEFjeGFxYzFGRTh4cmJVaEdUUll2d2tWQjNzd1g2WHJxR1ZY?=
 =?utf-8?B?eVVmK0YrSUdCREJVWlY3RmMvcktEbC83L25TK2hzeU95dVV2RkY2QmpFdVF6?=
 =?utf-8?B?WkpVaWFzM2w5aHNwMXVKWmgrQTlMdFRxVWd3SWdXaldGdlZKV0FQdzdrbzVq?=
 =?utf-8?B?bS9xNE5jeXF4WFhnQjFFdndqdnJIT2ZFckZNVysvcW05eGhtd0NSaXlxcHRR?=
 =?utf-8?B?VXF3OCtZMVRMem9qQVM5M2RTdnRrWHU4SUFYVXBRckFJK2lEbmRZK0wxbFQz?=
 =?utf-8?B?Tk5JM1hKdndiMmY0OGlkRlJNeFB1VDByVVhrMldNTVk1MENPanFQNjllWkw3?=
 =?utf-8?B?SHNmNVJoYlM2NFAzajVHNzA1S3U2Nzc2V2dDdXlTVzBjbDVJVXBFaXV5Zngz?=
 =?utf-8?B?WGpPTGdXOFp0SjU3QkJaTmVNYmdlR2VBbU9VYkNTY2todWJHZUh1ODhrOTY5?=
 =?utf-8?B?WWJQbEpXVkJnVmVhaE9HQWt4dGNWb2ltUk5tNmIzdUNhcFBWTSthU29sRHAx?=
 =?utf-8?B?eWt4SnN4MHB3aEVFbjhVVE5FR3dSN1UyU0NCc3I1L0xyRXFWUVRRQldYQTFM?=
 =?utf-8?B?aUR5Z1c2ekxYeTlGVjNFekFOS1M4M0prajhjSHdDaFNyNEI3eUQwMkVjM0pH?=
 =?utf-8?B?T1ZnUXZNa0dJSHZCQllNM1c4Y05VVFVmWEFRZktwb3JaMythSUFOOXpkSzNn?=
 =?utf-8?B?VnFneGlCYVhKR1pDNW9uM0pBY3JwcFprSjEvTjNoL2swK0UyZXo0amUvNUhq?=
 =?utf-8?B?MUZZUHU5ZWY3cG41QmpVWDVrcTFFWmIyOFFlYTFjVjl2TmxISGplZXFqY2Ey?=
 =?utf-8?B?cjZOaElJU0E3NGlYUmUwbm40Qnh2VjhRM0ZrbWRHKzA1akkybnd4bWtkK1NP?=
 =?utf-8?B?YTdnaG5qTXlKZno4UC9HMllTMkJxcjB1dWNyOWxIdVlDZ1NoNUtjbG5yWnZN?=
 =?utf-8?B?MGFkZGFyKytOL1IzcGZuWjl0aUkvQTdieVBhODF1LzhOMVV2Nk51MFNkWDIv?=
 =?utf-8?B?MWpQNGxGemlyazYweHgzUEJ2L05XMWRsY1M0UkVuY3FvZnRHQjAyT0lDbVg2?=
 =?utf-8?B?cEdmOUt3ZnQxc1hQTHU2NWFDNlVhaG51bE1tSm1rSldjRTRZN1A4TXQxb0xm?=
 =?utf-8?B?NkhSR1BXa0tqS2pRNDNyVENJekdXdGtaYUgyNzlPeXhnVSt1QURhYk1mSjR5?=
 =?utf-8?B?RnFDYjhHU0I4R3ZUbndQL0tsL1QyV0pqeTRnTUtJdm1BTHY4QkZ1Y3Q0ZTQz?=
 =?utf-8?B?MXpUT2NBZE42V0Y0UG1haExkak5kcG9xbjY5VHFFaWc3eFBJelp0c0pyZEJR?=
 =?utf-8?B?UlJIM2ZYMEFyU1Z3clZieXBWNEdxK0NJdkRtaitBNFA5YkFVaHplbUI2bEZL?=
 =?utf-8?B?NDVOS3lhSFAwdW1MVXliWXlleE1Ib2RucU1ac1p3UUFSOGNCZTF1TlV6cnV5?=
 =?utf-8?B?Z3VmeFdVek1hQVlCeTd1SG1NNWZTcVc1L2g1clpLNW0wRDFhNXVIanZDbTZl?=
 =?utf-8?B?dy85bUlzbUFrNHdkV0ZUdG5obEthc2VkVFdhNEd2dVNkcXV1ckFMNmVEdUFx?=
 =?utf-8?B?VDVrTVMvMDR4VTNOL3poNjU1Wmt2YnNpUWxtYWhoV3ljamxCQjJXWE1wdUd6?=
 =?utf-8?B?d04zelZBTGlEc2xuZFpjcE5ma053SVFYdWNPSjVyRjJteExMMEl6Y3lYYzhw?=
 =?utf-8?B?YXpMWnNNUFVoRHF1ZmYwc2lOTHRVN0E2WUVsVEsxMTBvWER6QmtEa2N2QzBT?=
 =?utf-8?B?RVlTSmZHZnFQaGxVaFZ1ZnhzazdDc3JzSURURFZyb0NhaXRNZ3FtaW1IRUMx?=
 =?utf-8?B?eHBDTmhyVkVVYlZRNGpnUmVBSlBrVlhQM0JHOWFHNGNmSlNsUFo3RDRjT05t?=
 =?utf-8?B?WkxkTE5CaXFJWWkzRmo4eklWNGo1OE43RzBoMW5OcytzM055V2c3N01QL1JC?=
 =?utf-8?B?aFhvODdLZXliZ2o4Rk1iZzdabDlCWVBtVEdLUGpiSDNRY0VPUU1NUkNDTGND?=
 =?utf-8?Q?tn0BkPC5EOMydOWoWmSexZz/EofGOrExJharCDIU9Irl8?=
X-MS-Exchange-AntiSpam-MessageData-1: djPRMKPFbxs4/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15eb758e-c107-4f2c-03d9-08de75fc60f9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:15.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QtUgOKddju842gsYO+tWxUqYr8PCAQrZt4xswQ/FbimEqiLEum8LdYKbl3ZMLsoKJqezBBowGNy5x/7Ve2JtNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
Message-ID-Hash: Z64IUGDZ5ROEPYDK36FAB4B2Z2OLYS4F
X-Message-ID-Hash: Z64IUGDZ5ROEPYDK36FAB4B2Z2OLYS4F
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z64IUGDZ5ROEPYDK36FAB4B2Z2OLYS4F/>
Archived-At: 
 <https://lore.freedesktop.org/20260227-rmcontrol-v1-8-86648e4869f9@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the bindings for CE fault method buffer size RM control RPC. This
will be needed for channel allocation and is also a simple way to
demonstrate the usage of the `send_rm_control` infrastructure for now.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index ece31cc32f5b..354ee2cfa295 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1025,6 +1025,11 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS {
+    pub size: u32_,
+}
+#[repr(C)]
 #[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_gsp_rm_control_v03_00 {
     pub hClient: u32_,

-- 
2.53.0

