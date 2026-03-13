Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D3106FD68
	for <nouveau@archiver.kernel.org>; Fri, 13 Mar 2026 02:13:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD3CC10EAD1;
	Fri, 13 Mar 2026 02:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uWwoFgIp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B1829450E4;
	Fri, 13 Mar 2026 02:02:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773367376;
 b=nY7TGEmTpFe7jMPBGP714XUzi7zPj3vPfIOUYlq7Dkxgb7tejVxLeQ6AjwOx2K1BxL3GJ
 g7379RLMGQK7I8ouaDic8LrIFav+DSoRtx2Fua0va8n1dT+he2eM34RrzN++37HTqsE7uFY
 GwAKon/GP3b0/kzxZY8j9L8SYmov3233f4EWU1dCZayj6b7k1E4SH2xb//Ws9p1iClS8PWo
 PDSoXo6xr8pNfYpIQz7PmVXdSUi4QqQfE088KC/0+jf1VZIo6uz/awiBglXAyhGA4jF44Xn
 XK31y2wq1efg3tN5smdstgDf3clVnSCbh47DmVzENchL9NKMSnQkfMXGdytA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773367376; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=l5/jyUQvShbOTT5ITc7T7nCSca736+A11pF9a7hVo6o=;
 b=tdazL5Jm9FQ1LZgDJO7OqYY7XWCxUMpxpOLedPhNKFecPTkVYJrMAYZVNHWi62EXJLy+M
 QIplaq1iHPU47Pva2adyz1lAKKylAAEK7J/5Nx39LhuswJYeDBySb2D9fRH7q71hTOxIGs9
 4Jl0VGnwT1RxxTPsxeYAY2MJmLVCd2a9KPnfcYn0AuijDJWfa6vpGzs/F/1i9EiFLlNR4h/
 4n1lfqbAM0rciqHEedADYO7pvAbpcxrqpPYP+A+YMV3VGhTpOnv+tLjq/7lFXT3GsYVgMY3
 UlNX5dVJrL7LAYvXQpbKT1oYuKfKYSlQHp+H85JUfPXFMPhYgVb9mXqnDMiw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CA74A433F4
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 02:02:52 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010011.outbound.protection.outlook.com
 [52.101.193.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A29B410E441
	for <nouveau@lists.freedesktop.org>; Fri, 13 Mar 2026 02:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6cwdZM6adNwtn0ckIkiK9NbPoJEfmBqJuF/nIy50vESmJUmpN5oM5KelVwk0pZOIBwqwW36MY43nQa2Z+NO2fXKQVoBukahPnSU/s8Gxi1x+ly07QVFpJKaolzEK0RXWyLeWuq+49fryMADWc5HOMKR6X3Emsuh+vKjSuwFvphfgVMh0hl6JQHLBnaWpiAapuouqIsN1NNNjlXSV5EiuNPHDGjGRrlsOMYWdKi6v/ODy+q+hZfzVhnchMkxIGjIjXhGSB8lSv1XycqBCQIRK/lg9vGu6B6DkMK0FC6qTRX81BKM9zlAC5hqq2WLTYxDRIrmnoQ/Kwf/hUthHLPhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5/jyUQvShbOTT5ITc7T7nCSca736+A11pF9a7hVo6o=;
 b=PDN4ljr+TKwb78IfQpPNM3MwlCEj1IrYDbzj9irXDty97NHGpP+7k9pKCirzm8Yvy69pVY+DhxxzO/feOYdiWSERE61vlMz7d5DIlK6dDUabtudZKGmpCVf+qItSABIn1xXTb2N3ejBGFydI/CwylkIzUn0jNGU19wz9YxQ04YcenaTMHFzuSBu7FRlqDLeWIvWa/vhdHlMydFfRvI8uKmRVMa5TZ543suIyVZyacGNEs75ygSun2JO+EuUlDynWrnQ3xvcY40q4rVaWSFhrtIcy6Q3OEWuTfLJm2Uv5p2p/fqrFwbFslkD/sN4VSoIINn75fpKyizYfrcl68ELrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5/jyUQvShbOTT5ITc7T7nCSca736+A11pF9a7hVo6o=;
 b=uWwoFgIpS03zyyKTYlF3l/k7qSXM2uqAfg38/ORexi7daMCYX4GujvUJQQIzISj6sg49y5NrsXcvQawADjCG/0KTfAR6OB3eWUU+DgonBLeMWaiGDiknQ+EtPAu5n4yn/Fo68Ir8UcrV8MeDSGLtxBZJCJr3z5ozV3799s5RmzZpM+WJoWMoHFWGSb7ZUt5oJl3b3Foso5mfO8KRDt5l23vAKJhLdrgo8LRxEGtVmyH8WkLeuGm24hF5Ry4HOSOOJHbOJo6GanrHmthh0/rGKaq9ugqHwZrA0gMYAUVwpj6xm3FoIsSyQUxP0B7HisYTbZjzKjM5NpNyf25ogstkvQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 02:13:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 02:13:29 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:13:25 +0900
Message-Id: <DH1AHR75GRMP.3K4RVG31XF24A@nvidia.com>
Subject: Re: [PATCH v8 5/7] gpu: nova-core: use pin projection in method
 boot()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-6-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-6-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: b9089450-3c8b-4935-5659-08de80a61e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qFVxgdyt3Q8MPXvkHvz7VWr9ua+OWlfJfFb8h7UNxkF1K8hvlnNhQNVnf7dcdd0xlyy/yqx1dRfb4Ev2XQM+sJzimn1w2GAH6vRXOXSgpeASQaOhSUT9eE8LfSnri2vU4Ubq8K3WzCAK6R01QO7EjsZ1qc6Fxi3Uj89BZoIpa3qPdicjUkBRtbzamy6k4CfS6AoCSzG3Hf246vcLyNEeHsy33MCfB8rbbwCTPjSwi4ZQIsuWFDjVaUplxgCzziCA6SQJZQmPa2rGv/HsIPKK29dVnvGNXEd/A9SlRR6lR1QC4GSDGypiFI8NacDDJz+oNpfDrD+JM4g0guGaIsZRNRPeyMrXXOJRD1Na8MXE4C0i3qWILG2pwA8EeseZcQRvmNbivU+lb5OtE/lKZ9EkfmVNxL6SAv7rhNomHnY15mVOxFpVR4bJKQg2PKJV/xacLXOk3fOiF5InuEogstM+TMgfVX2/94kBbkdmgVa6DDSkCUslkZy3ohT18BS3dfMRbPsILvUZG4+GbPHO4jcQBpcz7nJVLxdslVbrjGt+4t3cieFn3Fj1Rft/sdJ9meiz8oWuJ5VUrLZgx5+fEAsYwisQT0/urQ9thix5scEI6KWsWc9gR+9QIeqlRSy/pDtq33+hNh3tHKxFrxehQZrP3pkT6tYWIX0I82FyKR3k2Jntl7KNvIFZ9xOBtiePOGmNk3ptVoZ63YTLjKGwNV3DKHyiPhzywrs1ccW2QpOo0VRYjvxDaKEZW0xGM2CQGfU2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SE9aRFMvR0FpV3JXTDNJMmVPUUZIL0hvQm1wQVp5SElHZ1JIQVdlYVE5R0Nm?=
 =?utf-8?B?Wkdwd3NLZzNkd216SWN5ZGxpVldiaENyY2RtMGVodmRzYitiZjBPakJSbGNS?=
 =?utf-8?B?c2JNVytUZHdheEJkdkNZdVo0amxFNVBTZUQ3bFljNExUWTl5RzRsS2NraytR?=
 =?utf-8?B?cmJVSU1WSEV1NnZOamVGeUtjUllRLzBjM1k3SVRjZ3BpYUhGUEhiSVRWSDFD?=
 =?utf-8?B?V1JtZm1vcXNxVm5oQ1R3T2VlNjlSNmpaNk1qKzJ3NGJrbUhyU1ZINEY0QjRm?=
 =?utf-8?B?V1hCNlJWMUZmclB1SERCMXZldWgyeUkrYXJvWm9sOXk4Y0sxYzlTeG51eHZs?=
 =?utf-8?B?THVGVTgzaDB6azhzYmgxblk1MTluTCtxZ3RESk5nbXJLVGF5TGU2ZmljMm1N?=
 =?utf-8?B?b0s2MGthMmlsdVBkdVRNUnpQWW1lZHl5dGU4UHZwR0Z1NHJUU2YrV2ZNUzcz?=
 =?utf-8?B?RDhDSkdwWHQ3Q2F4SjE2bXRjcmsxOVN3YjJtK3R2bDNsSjBuUWpOMzQ5Q1E1?=
 =?utf-8?B?ZENKR2FKVkxzQXdNL2lobVYvRWl0NVA1YXo5MmZQRVc4NU03TGE0eWQvM3lP?=
 =?utf-8?B?Q2lDQWdyK2s3NzdiSlN6YVkwdUIrQWN3cE9XdHRxV0JFYi81NW1tc0VRMDVh?=
 =?utf-8?B?bkFGZ0lFbE01SEFNblJhOWxBTmcyZGx2M0NpVG1oUlZKRjNHdDcyRW84TFVt?=
 =?utf-8?B?QVc3L3NjRXM4cEdTM3p2Y0pUOTkyZHZGQzZtSi9OQnMxYTBBeDNGRDVTZFVU?=
 =?utf-8?B?R3hlVyttRmkxdDFiQ3V1TFBZalhzNVI2U05rM1ZJMU53RkpmR1R3cEdzM2R3?=
 =?utf-8?B?QnFuWDlvcDBjVDNlbForT21OODRwNEJvMGthczdCenRQcTUzUjhSL1plZzNi?=
 =?utf-8?B?T0tDemFHWEh6c2piMUU5a3NDcTQrZnBpUTFZdEdBNlJOVldRZ2lRVVJLSVBx?=
 =?utf-8?B?cy81eWNESmJhZUY4bjdVQnBLNjVoRmFIV1YvTDN2T3FiV1VIamtwVVI3RUkz?=
 =?utf-8?B?L3B3UUg4WVVCcW9HWWE2THZ3YTZ0aWRlMS9vMnZIVTZid1BlVW95SFMrZ01n?=
 =?utf-8?B?cUtWaDNVS3dNSU9rMDhSQ3dBc3p6M1MxQ25iQnRWYjBrWEcrZm5Bd0diZGxo?=
 =?utf-8?B?emJEei8vSkU0cVRSdW9aUVVudkNGV2l5T21JNkJwVjhmZVVMNFluY01IRXZD?=
 =?utf-8?B?U3h3VnFjVHE4cjFMWndKbmp1UE1kaEw2Y0V3RWViYVN0cWNWSGZUZnF2Rk9E?=
 =?utf-8?B?TTZacGpmajJuMGtrU2w5RjFTTVZhL05ydytIWWhwTDBDOENZaGpXRnFBbHRy?=
 =?utf-8?B?MVZ3K2Z2YzNnS3B3ejl2c3V2NjJFWE9IZGw3bXRhaE0xb0FvLzNqcmhaTWhl?=
 =?utf-8?B?N2FMT2hTVm82YlRwc3NYZmZIcXIwdTBoSGp1WU14YXhjSHdaRjRQZVZGanZY?=
 =?utf-8?B?UGt6ZkJyYVMrSklaYStOMnlLeVhzRmRrVHhwdlhucmo3Qm8vWDliOFpmaXJB?=
 =?utf-8?B?aVNGYmphdmttWWFpMVZXYzhvaUd6MCtRNHZQQUxCNE9qdEUyYW9uMjNvc0w3?=
 =?utf-8?B?dVpua3ZhVXJTT3dCNm1BbUkxNUxCbWZEUjYvSUZoREZqQ2lZYUJOZGNxUGhj?=
 =?utf-8?B?Ukp6UHhRVTE1ZlI5cHNid1RvUFZlM21Jd2J6dVd2SG54TFBGL0VaNHhQbWhy?=
 =?utf-8?B?VWgzUkZTKzJvZEJucWZzcEd1emdha0k2VXhnczNCNVV5SFFVUGVqdTI2QlFQ?=
 =?utf-8?B?ZHJ1UjVwb3dPRlpaT21QT2ozNWdmc0dhbTVTV3pkcWFOKzluSEp3eUlqS28w?=
 =?utf-8?B?OUVtczQyTEJtcFJQdEdHaVJobi9rR2VVcXhPL1Q5M2dEOWI4amtEVVk4MlNX?=
 =?utf-8?B?TDhKL2J4aFBBQWVGQjgydGhocTd0S1pVNWxkeUc1MHlhQXBvaDJOS0Y5dVdJ?=
 =?utf-8?B?d3Znbk9CUjV6OFJNNWlKZE14eERLZldWbFdBWVp5b2lEdVRPYnNzU2VZV1py?=
 =?utf-8?B?VGdESE9BR1N1QU5uNnp3UGUzR3ROQmZKWEExV3lNaGlpVUY2UUQ4c0hTM2ZK?=
 =?utf-8?B?NytpeFF6SCtib2xLUkg1bi9td21RZlg3azlxNXJ2b2tIbURKL2pkMUdLRmdY?=
 =?utf-8?B?blljRkZDMHQ2UmhmMVBKV1BNM3M1WUZQRkZWWnpqUGVnUlBWWDE2MENlN3JV?=
 =?utf-8?B?S2xnUGgwOS9qSDIzQ3ZOOXlmUE14K3d6Z0FidE85WjJrRDdhblFjZTViWi9j?=
 =?utf-8?B?ZmRhQjZxVEZWbEJHNmpoTU9obUtWQWZHU0FGVjQ0eHlaWTg1amF6U0tnQ2sw?=
 =?utf-8?B?bHgvLzE1Z3YzRlpqR0haM1BZS2dEN2Z4eFg0NWtTTjQ4ZmJma21PeUw3dm5K?=
 =?utf-8?Q?+aakmNvkwmH/VEI9l3lh9vx4Jx7bFoccEtf3MNae6AW1r?=
X-MS-Exchange-AntiSpam-MessageData-1: B1kiexilpqZGIw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b9089450-3c8b-4935-5659-08de80a61e12
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:13:29.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dkYAvY38w5T7PC7vEg99Um2v13EkfOYZFtSJvWnQrhlCd9yDCayo1h4vqMQIB/+KB/+5Kb1szIkG0sSzbX8ZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
Message-ID-Hash: HZLCRKRUSFBCZTE6QFO6E55QHVGSLDZW
X-Message-ID-Hash: HZLCRKRUSFBCZTE6QFO6E55QHVGSLDZW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HZLCRKRUSFBCZTE6QFO6E55QHVGSLDZW/>
Archived-At: 
 <https://lore.freedesktop.org/DH1AHR75GRMP.3K4RVG31XF24A@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 11, 2026 at 6:59 AM JST, Timur Tabi wrote:
> Struct Gsp in gsp.rs is tagged with #[pin_data], which allows any of its
> fields to be pinned (i.e. with #[pin]).  When #[pin] is added to any
> field in a #[pin_data] struct, fields can no longer be directly accessed
> via normal field access.  Instead, pin projection must be used to access
> those fields.
>
> Currently, no fields are pinned, but that will change.  The boot() method
> receives self: Pin<&mut Self>. When struct Gsp contains any pinned
> fields, direct field access like self.cmdq is not allowed through
> Pin<&mut Self>, as Pin prevents obtaining &mut Self to protect pinned
> data from being moved.
>
> Use pin projection via self.as_mut().project() to access struct fields.
> The project() method, generated by #[pin_data], returns a projection
> struct providing &mut references to non-pinned fields, enabling mutable
> access while preserving pin invariants.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

This is going to clash with the command queue locking series [1], which
we will want to merge first. Can you rebase on top of it? I suspect you
might even just need to drop this patch and things will work.

[1] https://lore.kernel.org/all/20260310-cmdq-locking-v4-0-4e5c4753c408@nvi=
dia.com/

