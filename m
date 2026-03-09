Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF0EA854C
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 02:06:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46CC210E192;
	Mon,  9 Mar 2026 02:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c4a6ez7B";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15F6444F5C;
	Mon,  9 Mar 2026 01:56:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773021366;
 b=eCghAcadNJn9tYtyk3MldU2kNZQ6yTjl4W+KdYvQdVJ5njR58gP7kWLX3K2WWNFMvD7LP
 DLCjBbB7DDPakkBlrXqG89TWYslGhmTVhYNlm/msiCFzfXqg1YEhvblkTIYasN3Q7JspOCl
 BFidv9JRJ+vcrVbBo6hD7o5J7BP4RY01S2isz3PtbSn4B4ebTp2z71IixjnB5G4JppS3DKR
 4+GruqQi4XC3GjP1UOuD/FxMekkpOLJibE6Egpio9I1uTuQsfEFl2/sQlk0X86Ca2rj6aXK
 uHqr/Goa26puX4hqdQ8GGWQHmtmFU77nRlEDxwb0h9AS6yQASKK7v5V0HT/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773021366; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=R4AhZVxC65ineuGmM9LWhC3sF5tFwBGaftbRU2uGNn0=;
 b=rLmdFYC60B5sw5CNtkQwbOXcTbgoQvMTdq2MkuNSGwhT1GTblvzJcX6Z6isUafkc5/Wkb
 GzOdhfxYLhayRAQZELe/QCtWTMH41QYi3jnYkm/sIUgax/KuS/S5T5sDLhWnl/qIBn2akME
 SzpNHlcwhXer4U269gj+K16wU1ISqyMf4SkiH4qEw0LoPIc+AwtHuhzEfCwgQGCu+UN+bua
 Y48DZxb3eTIHIJDBbiuRbkRRIBnaQ/oxdN4IeCCwCnKd6EgzX+BnUMoO2jPuyWU3wJARXn7
 6KutXiJ2Ue4s7m9WSynSmktq0f3zY8DRbJLSdIgJ48x5y9ye0S7uZrLhm0/w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C89794088B
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 01:56:04 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B6BE610E0C1;
	Mon,  9 Mar 2026 02:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKjLLluGzVCP1MyIgFb6elO+CfQFgAd0zFp1uLbgSfAVH6Pvgd+/fe//kYXCCRd8/83lSNZ/gfDetoFiU6QWPKJOXhrtve+S0HH7Zrcm+HKIu5m6+voHXZukhyFWjQHCqc4kOdY6XcaSebNSamFn9fX8BtctwWJnMX/olrBvEWe0KxjhOL9ZFSg1Puqpj2/MXkxIza8tQquHA2UbUsAZMEDJuPoZ2lOeFw8BWYTFVzswIrHrAPH4LeLZZZ6Z+Vvyt12tfmfYmMmvPGoXnI4wK+OqjsZW9OSDAwHHtGG/XzNclXDYoMsdBC9X2F/h0WLleT2ankCeN59EdpWzdPbwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4AhZVxC65ineuGmM9LWhC3sF5tFwBGaftbRU2uGNn0=;
 b=Z7mGbg3X30z3SA5Rh7kaSkFhPmGlqPLsv+5Q6ejSUbsFYRHHD7Sqv57U0W0kNepPROXPEBWZ0N7F5TNFsXeiAmfgWEThqaipIbnlIWXFV2wNRcfsjG7iuwv7SsHFh4o5GHQZyU54lJl4vM6FpRL0T03GqnC8koLuh1vMFBQIyS/TwZOMIbvomn3sAtWDy+1xzxQN2tQ4kGVaTuVjAY0HleNkfkOjXB8klAHqjvx1cqsLHCHXCe8a/Vfi0v3yg3TS3CXvV/GEX0TBhqW7hm4Siykm3IDqkspSaSW4MhjcNnhdRVffTjEUMGONpTLauadxeqHqWnp7yIJbKca4OMKa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4AhZVxC65ineuGmM9LWhC3sF5tFwBGaftbRU2uGNn0=;
 b=c4a6ez7BHvervoj6yMSbI/Uwaa4IZyUdxcQPemFEC+rkTYhHC2zjAG8yJJWT6/cM1m4cwtXlrFdD9F1hXye10Zvnl/jwhrnvw5aaqdNPrDvr9bc7DN/ngI36IeLtQ8qAlgC3m6DZ8SG0tf/ztVErymZvd76586pgEpj2GCbz8EbM7ppHqb0MTJJh/Y3DmTPaqKxhYprcJqilU+OXY7ghH6d8HSLX8Sbf65+UBGDGZvas/bOjPi/RRv5YtbgFXx4EgD9y9GELhOWfQB7YvO/jAI3F2eoPbi4ytE8TlLaBTITji+Q3wNGrthXvnGvjaKcb7YKhgbnZR9He2U/ECWFnFw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 02:06:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 02:06:30 +0000
Message-ID: <3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com>
Date: Sun, 8 Mar 2026 19:06:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:408:f8::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3de39c-ef75-4dd6-b350-08de7d807ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	YU/Bqffyvfzxe/cMOyj+vCHgADTET/Cej+s1kVO6L1EDjke69iHx3EOaFnX9I8LqhpjFmmn1Mp7ACo1/ltR5m+fwBh1lpcWjMOh0Y/AWbr5H4r1bWQLndR0DhYNqoDWap5HrzBqB8q4ZOpmg6dMAYAUxkksmJJ8hGyFcMAvqBFJge49vNtaSdZl8bpo84M8QoBtTtEMa6NguaLBjtm3JTSgXtEwZscni/dVIZKMGntlDPQNnnvZDdXiGdIvBxa9LuBxQhrTVag5dFSctFYb3KDofOHwzeU4rURIhzOPeI4DLsjZCKgTv+hmGkurS77C3Llg3lThW+tNSagyioLU3WI2NV8BMgUbPaLGLQzNWACv0Nmfe91m7zgpjOqAa/p5XrKhrStfTnRmzsVWgJqh64LlSGJ8NFPBUdaLgIGsVDdSVFzRGAF1rhrwey+dPWCdyEBg1XiFUBBvhqoBU67lZqYQi8W7/+blB0x9Me6YUwgqnb+Wb7AgQE0zQIygumeWDJjWI3afcHvVFuKshvAGimNrjNrA82DH2hEojYAuDz8fBDMDsdFunuGia7JcHbAva1blFM9lzjCSnQjD4Wc6QZX2YSc+J5YN3t5uVgi+Csb1PKCZbagBKeSZv8egV9/MFm6G+ACg0AWMYyQZGXIvRSmxJtKf8IPsKlNx9QO7VBcZ7SaIKq7qAqMsEhVEqELovQC7vDaPWwSoJzqyK8X+Io5S04zquq2hAd7JSZCByYbc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L01DZ1pydlM0U2lXK01XVlVnQVFIY2pJSWx6S1RVTm1lQms1TmFIS2pvcDFS?=
 =?utf-8?B?T2ozYWNod3d0TXlSL1c4Rm4rS0RNeHEyRnpDSGlIVHJ6M0xuSmJpc2pHRDg0?=
 =?utf-8?B?M0IvSjBwSnkvSGZqL3l6RTZOUHJhWU54U25xbThHNzgyWmNTeHVTZFFRZ2Y1?=
 =?utf-8?B?VWloTUk2MFVaQVI5TUJ3a2k0ODRlWWdZckVTa2F1dWFmYnVCZjZmUlZ6OTlP?=
 =?utf-8?B?eHl3aVF1T2NCYlZVU2lFcjVSeHBod0N6UHI2WEVRbTU0SDZGMDhUVStnK0VI?=
 =?utf-8?B?K0djNWZTM3B3V0F2TEdNSGFkbGpJM2FnZHRac1k2TjVYN3R5NkRIZkNhUmQ1?=
 =?utf-8?B?ZUtxNWxaSTJtZzk1cGNqS3VZOFpETHJIeGpJVFVDSVhIbENDQ3lOQmlRM1ZJ?=
 =?utf-8?B?VUY4b0h4bDNnay93bUVzeVRHVk9pakZHdGlFMnZXV05lRktobFZEOFI5dUZP?=
 =?utf-8?B?cUFzeUUwdzZxbFRJNVV6M1hzbzlGa3NNRGZ5NkNXK1Y3NUZJUzVVT24rRGdQ?=
 =?utf-8?B?S1AxYi9wVUlEVHBXWTE0NktvT053ODVXTHJmQVBKZXZEQytnajUwS09xYm1N?=
 =?utf-8?B?T2traUY3MEhYYXdQTnVYbHF2TTRLcTNLLzRXdi9DV3E2eFFkcFZkK20wSEMw?=
 =?utf-8?B?ZmRWNE1RRGFZUVRTdkVSUzBGZ0Rlam0xVC8zR1ZxaDk4ZFdnUTNzelRNUUhX?=
 =?utf-8?B?OEViZHBOck1KTkdCdWVDMnZWWldrVWx5cW1namNTQnBzR29LWG9CdEZoOWFB?=
 =?utf-8?B?akJjSVh6NmxvZEdOYVpjcHYrL3JKdGlsTjNYaEIyUmNZUjRmYlZKMWgzanpm?=
 =?utf-8?B?cDJja2pJVkI4K2E2V3U1NHJVbzZ5SGQ0S3B3S0NVaXZUUm5vc1lydjV0NUIx?=
 =?utf-8?B?OW9KeUs4UGQ4SStqTURKMmlsV00vNTVxQy8rUlhoL3Rnalp3WUR3VmpTbEpH?=
 =?utf-8?B?MmtESWg2Ri9YZGoxcUIwNUFmRjV1YjFVNGNoM1NWNlRyd29KN2lnOHlwODhN?=
 =?utf-8?B?OVF5NkZpL3FuSFMxVE9PZm5lWXlMdm85K09DQXMvWjBzang1VXlybmVrSWRo?=
 =?utf-8?B?Z3FZSGV2Z2lPbjdwNXJBUkpSdE55aURvUG82MElnZFJiQmNRMmxZVGJJbllK?=
 =?utf-8?B?cEN5NlNWODRXdmxCSUpaTUVVak1WSlVpSVJoZE9IdnpBR013d3JpK240cjhV?=
 =?utf-8?B?RWdmZWFZQ09WTVhSdUtnMDZFcndYYVFiTTIxNXd4d1NXTHVscEV5YXh1R2c0?=
 =?utf-8?B?cUlxNTFjbWFxMDZoampPZjlSZThtVHJFOUxneVJZekRSZm5ITnBocWtrMGJE?=
 =?utf-8?B?bVA5TnY2MURtNlozRHlKUGVHZjhRR0xaTGt2SG9Qd1Y5OEgrVy8zS29kcHNv?=
 =?utf-8?B?UHFselM5NHVSZmM5SHdqVGJwNi9YR2RVdWlQV3pqZXk5NktIbVUyMldPSmZM?=
 =?utf-8?B?cFRvWHdQNzgrOWZjMjN3LzNJeUN6VUpteXh1c1duTGlWR0JNSmxkRDl4ck5B?=
 =?utf-8?B?Y1k3eGFuWEVIZmM1L0FSUkZoSGpQaWhUalBIREx3VmVpY2daTDhwbWRpYTFP?=
 =?utf-8?B?ak00bFpYTTU3Mlh6ajZpYy9GbEVhcTg1am55WDI2b2hzUnhOdm15c09EMXV0?=
 =?utf-8?B?TVhWWmc2WHhwU2tsRDlPazV2QkhpU045Mk9rRG9UOW9ZMjJwK3Zrb2tsVEMy?=
 =?utf-8?B?MVVLbzVyRVNwSS9NS2dqM2g1NitFdEZFeENzRi8rd3FocVB4WmV2bUQvbGRq?=
 =?utf-8?B?bTJvbW1RZ1I0cW1pQ2l2M1ZQT1hhNXBUUlJuS1VFd2FXZURXZ2RHczFiNTc1?=
 =?utf-8?B?ZWI3MkJ6cXhoUUovbVFJSFR2anpsQzRKVU04WElUR1llSG9BYjdkUzhMU0Zt?=
 =?utf-8?B?cXBOZEZZVGI5bTJLOTRGbjRjSmpOVzNhMm85K0ZsQXBTTFVtdmFwU1JFVHhq?=
 =?utf-8?B?VHQ3VEFUY0gzYlRBM3JQeG1xWEU2OTlVSXZaRW5EN0ZxbTZtVFlzMnBGemlY?=
 =?utf-8?B?YUYwNU9kbThzUUN0ZjcvOFJQVnU2NHdSYm1JR0R0NVpPVnJjVEdFZjlGc2hH?=
 =?utf-8?B?YStPc2pUY1UyOE82UGtpSzV3Z05wSnVtdHE2TGVsVklDaWdSQkJHOHIyVE9X?=
 =?utf-8?B?TUNPN0Z0SGIrU2tLbmM3ci9aTlZtRkZWTTR6aEgwOU1Jb3JaSzhPR1FZT09Z?=
 =?utf-8?B?VDBFdnA1VVdFaEptcjBIb05KTnBFWXVUS2lHOEVRanVGMEFITFdtSmM1M0lQ?=
 =?utf-8?B?T25DSjNVa25IaS9JTzNieGVydCtzSzdzcVJMOVlqcWVqbnFQR2ZsbkhlL2F4?=
 =?utf-8?B?Yi91RkNuaUl2VlFuZ1daOXlhZXAxaFJPbEFpZGhGODNoK0xOS0dOSStMUHRU?=
 =?utf-8?Q?gDgslqmUr0qBw13U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc3de39c-ef75-4dd6-b350-08de7d807ac0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 02:06:30.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fQoxtp8tQ42590gtoglXJX5gHp2lPbSp/SJdANYvF71OIkOEPIFk7sQNg6nP7u0BrXaMgBQCdKaVd6wGaHtArg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083
Message-ID-Hash: RP63COHS3YL365Y76N54JTQ547YWY6Z4
X-Message-ID-Hash: RP63COHS3YL365Y76N54JTQ547YWY6Z4
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RP63COHS3YL365Y76N54JTQ547YWY6Z4/>
Archived-At: 
 <https://lore.freedesktop.org/3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/8/26 6:52 PM, Alexandre Courbot wrote:
> On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
>>        gpu: nova-core: create falcon firmware DMA objects lazily
> [acourbot@nvidia.com: add TODO item to switch back to a coherent
> allocation when it becomes convenient to do so.]
>>        gpu: nova-core: falcon: add constant for memory block alignment
>>        gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
> [acourbot@nvidia.com: fixup order of import items.]
>>        gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
>>        gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>>        gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>>        gpu: nova-core: make Chipset::arch() const
>>        gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>>        gpu: nova-core: add PIO support for loading firmware images
>>        gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing
> 
> All the above pushed to drm-rust-next, thanks!
> 

Amazing! I'll start testing on Turing locally, in addition to Blackwell
and Ampere, now. Exciting!

Congratulations to Timur Tabi, and all of the expert reviewers and
refactor-ers to!

thanks,
-- 
John Hubbard

