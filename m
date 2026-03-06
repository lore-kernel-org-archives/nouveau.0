Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B730F513F7
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 05:22:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1D10E36D;
	Fri,  6 Mar 2026 05:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LH9vKzIy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB67740760;
	Fri,  6 Mar 2026 05:11:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772773894;
 b=dPdZcHKgRBjaf3cMH2XINW6yyDNT6DQiam9J1zwSiRK5h/P+8KFt/ruTeOFQp6leDi//I
 Joe2Dqib7l+bh/VqcK6OtuQBx7KAZODaTOMRcL2Uy2V94nGocP9dogd2rqZozF2zVaXLlFF
 Na+63y5OVWH5o8dpCV0YsHiF/HnTUz/ch7mGLHhj3E4kPthc2RS2hVRJ8Yg0IQJDSNsSJYk
 /7xQB3aWf36oro4g6/9AYh5bbPKAZMLzI0sILSWtBw2uSYM0PiF+Rqkk8vACr62gkEJm7th
 lR9CS5J/JZCHvneuKaejd47t7pt6kt04LLl8Kr/+ZckFmiBCFVwf/hdArk0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772773894; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WgpmGe1XUFHLXZbPGYOkNY61qPAs/zKGOBeT9SQJ8Ps=;
 b=JzhNuV1cksAw0J38vo1W9CZ4Ei8lqACJwtLin8HFO9f3QvlqDZguFbUcn/c4+jxXCDKFf
 JHiRy5KWA9PLV/OPn2V+RrQk4YeX5h+xjyvPlMDBOQbLa5iIH60caue2YcUWoXOj1Py0I42
 nc01AL4FKOTo9c08XWh2klav+I2pbkCkhHEJtVR1NOI8+NBYTiK4mBijzNX1PFvg0jeXV3t
 79GvJCjmkiIQ0sGa68uY0lXh5aext43vQPPSlitgJUQ/2jqhzRyXiS94z6aO5B/U6ef1m9Y
 c+o0esuqGfSAR/aDHfYqk6xuYyR/UnZoh5OdTfiXB2Sb6hlni1/N6nimWWRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2296C40760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 05:11:32 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011066.outbound.protection.outlook.com
 [40.93.194.66])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AAB3910E144;
	Fri,  6 Mar 2026 05:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVV2ZI5n7qTOY/NXi034pOeD/YcpSFDAQ0fLNVbt8SjZwGfRvHw3x+nT78mQqp+lgGPcs9MWUTto4Wb9+BuWhB7+FqN0Ew2aDAuxYviyTdJwTBq7Z2u1huP0rBRSpaQA37fY84ieJmHKk9M2C8XXpieFHzkT7lel12AUQgp1MTohg2rLOB9SflPxcitLv2cSFr68oTDBJlkiFF9GE2LJDGdapyiDo4U+DUGD4oIhw18BT0rObywN2bEcMQyuyVV9qw+wki4tXIoGLLdFleg+KdMP+ZPxClWR3Y4nLyN34X5xqbRDdISe9lBwTxRwwgWZ3tfnxIqRjdOpNA4lTuSRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgpmGe1XUFHLXZbPGYOkNY61qPAs/zKGOBeT9SQJ8Ps=;
 b=L9isKKh0czWJNVNqcfP0ebdRe5Zk/9vPQy+/ETgSCW2ys40nwuOY9Lan0atj2xUWY1uHLtQpUgWjDRqJRxRjpVcakAi/4L3qv7npH4hHSpqIcbjD9pQiqIby3zT0w02LHwU7IFsDSkUVDFfhNgnvfX/t/rh6W/WnK9wq34OHPu7zyWoRhuifQP8maZ9Edna81Jbjlsi3lcHpNt/ALVQyrHrq0RMD92kbRM00lL9NrJu7JUR8qFkI08kLK9p+JAQ4kd/QAW1L5W+jgrNLuJ/xvb+HLDeM00jfMy+OannCXh76oxEHqMvxiJXSNSUnwmr5oOi72o8YfYuonwp6u9sWCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgpmGe1XUFHLXZbPGYOkNY61qPAs/zKGOBeT9SQJ8Ps=;
 b=LH9vKzIyJQCtc8zM4e+faGISPvhmh/F0AiPyZn6SrznbYKpqutTF0eAZ/HuuIrgjwdL3+SpRj00SltS4iweYcgm1WLvLKLndEzT03WgM5yFxidacsZqZNnPrG8HxrsJk1/tzgNdZC9opkS2SocyFUDiPCMv9LNaXwDfkr7uVngaJ1vO4R5crN4XNOgGAV9o9DM/flCkqFSlgJkJ9UOmlRPKrpvTX5ZAw7A63lnQoOHQ2od0S3QbZf5iBp1dttM6m3DvN3tcHb2mYBy6LbKqQsJFTPyHg/1ubJcRA7yE+0Ou8Zb8CbhmnWzC9W62Ur5mpPeeFIafaCEA9iUgrlfC72w==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 05:21:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 05:21:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 14:21:45 +0900
Message-Id: <DGVG44QGABIU.2JES0BUBIWTV7@nvidia.com>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
In-Reply-To: <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: fe253e5d-b0db-4e94-f4a5-08de7b40441c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	kfW8elklToaRybETUXViO0JNrkO6W0RD0MQpPoX+mlrgKsv6KMk+DN965hzwfetuJwYsbMkNkNI7UUo9PubSuo3lwlQj1U+O6Ttcg3bxhH62XxrKzvSyiXJcxAtatKGv5ZjTMWz9WqF79g7tuHmz7Z+up6/jGBzqaSLCMbol+VmqMgn7b6JzFXkL06Q4wbDwMJvSTYzs5y2O33FLfe6dvtEl/LTRgGVSIG56MmJdwJGwercaF6QbEcd8NqDobajJs4q1c/zeEhLv9F7BAf6l+n4/6N8IyZa07cfl+OnVIh+dEwMfvStaMDS8uLlVHkZi1ziBs8JzTtq7lI4H+xqwW+eX55YG/Y4LkI4TyltkrN2O1uahuEbnYAivuk7e1LkhXi/PR0daxhaUaCKvxw/bR/O3vKrRe1f/wkKdJaDvSSe3rP3vJTKMIwC4tKfgz9XCuuySNvk+uw8Cr6qMB31g96pr8K/JKEkeMqHIOrNJ8O3a07y1LxJXW6VuzmX4ymOT2h2wHEniNJ9NoiOn//VbSik02+Bir5vaReMycr2A5h1QoQrb97Z0Zg8rJs/j6SELy5pOEDKypT5KU9ob+p7W376oatGETVUkZtARp1sGKwFtNqzcT+ojMRf1COQMPRVdiAX91opcx+O+66YA8VVLoY3hOc36CEUfc71v8JxaARcjFW46bWJxBpnfD3Vu/EmPqL5luy++rMcOfm/6l74VpJFyRdaU96L1UW+a9GXiRws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3pRTHk0eXByOGd4bVd3eE5yMU5JelZsbXVYK2M2a1owdmRKa0NlTjJ5TjVP?=
 =?utf-8?B?eGM2dGlCUWxHbUNtTEg5NmZUR3U3N0tpR0Y5aFEzTDdpemw3OUpzMGNJTmlZ?=
 =?utf-8?B?Nzh6QllvMnhWS2NKVmxaN25zWStpMm1GS0hRcU9qcHVTWi9adHBzVExsdjFY?=
 =?utf-8?B?TUxQRm80ZHpuSmx2cjJCUk5jaGxLUm11Rk04SzBYTzNSQTdzTW1BWkdKUHpl?=
 =?utf-8?B?TkRZcHFVUUJseUtCdTFiV3RqcnFUMDRqQW9MWHFQR0NuT2RQT00rTm9sam5Y?=
 =?utf-8?B?d01vUGdIVlUrbWp0OGxjRkRwNkFLSkcvN1p6UEJrN3pSQVJzMTUwTVZWSm9G?=
 =?utf-8?B?dVdKVktLQjZNSkNISWtMZjd0TlhscUVGVHNZcnhDV0xObzVwQXZQVlQrSU8z?=
 =?utf-8?B?THJ5UUhnRW5YQUFZa0NwaUJiaUlzd3FVVFByZ1pNd1lKNjh1QzdqVGdXMFNW?=
 =?utf-8?B?Z1dZMGhvNTdMcnMyR3VUWERYZmNwcUpmQ0ZHTHd6MjBTV2VkY2sxbVNBZTBh?=
 =?utf-8?B?UUNFcmZkT0w1RHI1TGNvRWhwa2xKbnE3SkQ5NVRMYjFLbGNxZGp0MFNhMzFG?=
 =?utf-8?B?S29rVDRKTHlkVzY1YjV5ZVpaV3ZaNVhUL1JpdDZxT0l3by9oanZOYjFocWp5?=
 =?utf-8?B?VVZwVDJPVkZXbHdScW5kS2U3Tk1vY1EzeGlHSzI3RHdIbnN6S3Rzcm9lbTRq?=
 =?utf-8?B?cVpBbEIxMFFnOHNTNm16K2d5TXppVDdRRlpQVjkxTkhKVmMzSDBmd2NFUlJ3?=
 =?utf-8?B?R3VmdGNKaEh3dFVETWpnUkxRMlhUY0VJK3crZWZuTkxJb09ZQnhyY1Y3ZW10?=
 =?utf-8?B?ZmY5V1VzaVVUaHU2eUJFNUJmUUUvVU1JZWZuV0RRZTBPYlFnZ0NqSk1hMWlP?=
 =?utf-8?B?S2JaTWtYUU43Y3dWMERucFZlUlo4cWFzejV1eWZjbWxmZmpoRENXSGpndFRS?=
 =?utf-8?B?aUt5dmhuWGh1YWxSRHhLOE96YkVyR0VVMytIS1BsRnhQR3h2U0k3OW4zcUJi?=
 =?utf-8?B?ZEpVNGJCRHVPcEp5cmo0b2E2aW5QSitwRmhaMitmVnorTUpEY3VWemVxeDdC?=
 =?utf-8?B?YnVtT2xjVHpRN1ViWWpWbEFxb0NvbWxrY3lsam9RQ2VBYjE3KzNJS0lqN09l?=
 =?utf-8?B?dmVSSjM4U3RnLy9YcU10a0QzOWZMR0lTSHF6S0FYRm4rNDdUWDVrV3ZJTkpY?=
 =?utf-8?B?alExYXRBajluWFJYbFpVQ1dkTmF0QVl6VkF4Y0ZyT2pZR2k4TE5wbStIVm5a?=
 =?utf-8?B?NDdPTmFVYThNREo2MmN6S0Q5cG9pcmZVZ1hxMjFFVXkwb0JQWTFlMUJnV3J4?=
 =?utf-8?B?NEJYRERRZnRYNTcweFJwK2liam1ORDZ5cCs4eXdqMGZMMlQ3QnplZVQwYUhj?=
 =?utf-8?B?VDBqNjhPakxNQ3k2ODVYRUN0MjhuV3QwZzhGb2dsaTFHdlhvbG5IUDErU29H?=
 =?utf-8?B?aUp3TlBUVW9sakpySkdJWTBGSnhzZXE1SmIwVElxSWxaM0dkMVBsdjRPc3cx?=
 =?utf-8?B?Q1JuRVRXL2U4aWZVM1RVb3NuWkdZZ2U2Rm5yYytpci8vZXRtZFh6V2U1em9h?=
 =?utf-8?B?UHU1R21tQVVvSStUdW1KYnFuakJEeHZkZmxHMWZRZG1leENVa3Z6L2lmdkxj?=
 =?utf-8?B?L0lwSHhQZ2o3WjJ2N2M5bzZydkt6M2xRYU94REVCUWRDQ0tHbmJwS2w5ZjY0?=
 =?utf-8?B?Y1FwQ2hGNTN2OFB5VHIwMTlhOEVBN3NpeU40c0UxMVRkV0pZVjA1bGxtMFUz?=
 =?utf-8?B?SVQxRUJneFNndll0SFhxbDFOYkVOZUpvOUIvMWYvbGF2aTBVUlVlL3BEcGZq?=
 =?utf-8?B?MTBQSlAxSWljV3prcmNmQ0p6OVZ6di9FeDZtOWc3b1ZPY3N6dWlsMjlLR21O?=
 =?utf-8?B?M3lCZHVrS0VWbElpQks0UjJWL1dEYm9kUXBjMkp6UDJsVmtIMm5jKzRFbEQv?=
 =?utf-8?B?emk2ODM1OVQrS1RPWTYzallrcjlBOTVzVTRCVHBQS3l4aVNIRHNLeVZQam5Y?=
 =?utf-8?B?TmZLUHQ4T0wxM3NWM2lON0U3SDdFNSttU3lyMGlEM0J1N2ZNeHVhYW9zb0FR?=
 =?utf-8?B?ZDJhQitqa3VmTjBESHZpUmhodjJXRDZjdXIrM3F2bm9XQ052SlYyMUg5QlZ3?=
 =?utf-8?B?UVNOTGF1aklGL3hGVzViamhNTi81TFVOSGR1WGd2KytodFZzeFJMMWk4Umhi?=
 =?utf-8?B?VHQrQ0c0UWJtSExLZS90UjBINHlGRWdLSGxzck4wRnd4YXpabm1HQ0Fpa0Fu?=
 =?utf-8?B?ekplb0FKMDExbzVRMXlZTFV5cnhaZU1uZk9mb2RWSWNRWXZNeVZCUGhrT2RK?=
 =?utf-8?B?L0FSbEJrSm0zM3ZmQWdrNC9CLzZKTjZRMlFPK0JzZUl6eTdQVVJnZFE5eXM2?=
 =?utf-8?Q?/Hg7RUT0/tjzVduKmFEzZPPCiQnspJhgcW1I1Mv2Nq7ZD?=
X-MS-Exchange-AntiSpam-MessageData-1: FYrwSTixHVdyfg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe253e5d-b0db-4e94-f4a5-08de7b40441c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:21:48.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K5iwm10HdesKhEmpGMSpz4i5sKXgWbZh7u2p06WaJ1wY1SaG4Lyz0inl7mQcEKl0GgF7mBX1PPt6wBr5t2OJbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057
Message-ID-Hash: KWJO46P64IPN7DOGUPHUYGZE5MKLZLG3
X-Message-ID-Hash: KWJO46P64IPN7DOGUPHUYGZE5MKLZLG3
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Zhi Wang <zhiw@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KWJO46P64IPN7DOGUPHUYGZE5MKLZLG3/>
Archived-At: 
 <https://lore.freedesktop.org/DGVG44QGABIU.2JES0BUBIWTV7@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
> On Thu Mar 5, 2026 at 8:37 AM CET, Eliot Courtney wrote:
>> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Re=
sult<GspCommand<'_>> {
>>>> +        read_poll_timeout(
>>>> +            || Ok(self.driver_write_area_size()),
>>>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgE=
lement>() + size,
>>>> +            Delta::ZERO,
>>>
>>> Isn't this either creating unneccessary thrashing of the memory control=
ler or
>>> unnecessary contention at the cache-coherency level?
>>>
>>> I think we should probably add at least a small delay of something arou=
nd 1us.
>>
>> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
>> openrm just does a busy wait, which is what I replicated here for now.
>> GSP command queue not having space IIUC is meant to be very exceptional.
>> I am not sure which is best, maybe Alex has an opinion, but also happy
>> to change it because that reasoning makes sense to me and I don't know
>> enough about the distribution of how often it would actually need
>> to wait to know if 0 delay is justified.
>
> Well, what this code says is "let's hammer the cache / memory controller =
as fast
> as we can for up to one second".
>
> This really should come with some justification why it is actually needed=
 for
> proper operation of the driver.

A 1us delay sounds very reasonable. I can add it when applying if there
is no feedback justifying a respin.
