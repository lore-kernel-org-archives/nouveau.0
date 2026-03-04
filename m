Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9633FEB7ED8
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 11:58:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 73BA710E9D5;
	Wed,  4 Mar 2026 11:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="reTITURL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 80E3644E1D;
	Wed,  4 Mar 2026 11:48:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772624901;
 b=txZ8BrcSDvPs18Hm4CwldZAW3lS2d+mwOvGhAI33AQw3kEL8tsEpQId7boUWOF08kb45T
 PDPnW6XI9o1xbBowGBoc6PBi8V1d5HgAyjlu+akwfE3RCvs41t8NL5qwcV6JU9w9bn3KAqh
 ktqjkKtYMp3btHpN6FaF+JspZu1uYu25586HLT4MAxrnAtWCM+7wb0ysF/68gUs6RmjJH1u
 us6MzEzbsAiUUC6ly26ZqjrbwfZDEgSgl4ytn+0THQccUxmc+O0+aOWQfcy9qiN7ra7qNWt
 c7ObUsH/9ErG5b96CehCy2UJoF//r6yKtcPpal9CvJOKCpfgIlC6L7AiPJ0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772624901; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8PMMbm842BCilyUGhbx/ISlWmMFwe1kIvCZp8szx+no=;
 b=RnYX8HX1RW6DOdolCtlL/YEcWiuSDy3IL4bEbU9StrkgIMqYzmkEG8itdQ8V5kFdK8ln2
 NUh/gLaqvcinPVNp4Cm2NuTU46TEyud+ieGZGrb3E31p84s0YeLVjmf7Gg9LxTpjrxDAGIS
 bkVcR697Y3qcNIZk/ONqKmzwi8pbeaS3fdOfRKFYrrVx9hD3bFztH1U0PYqRSxOr+uFIOAm
 MJ7gR2R7P1f6hT6n/PKBI7HEAS87LYiJw2LPy6iVnctQzCJTJlxYsyS6Tx/ZLcW3swuCcIT
 BbCtqTvaSp4gWPSSLL1pw0yHr4AbkbdzGoKJr0jErvUFlyOEw+16/NMhPdUg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8627D41E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 11:48:18 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4F310E9D0;
	Wed,  4 Mar 2026 11:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/u0/PZvg6JepBPZzQ3MCSDEAhriv5iLS8s2F13E4NE/8xu+o4wDYlI6yiT8NabhZ/64Ns47/jafRCjHvky3JGTtDZXBzo84UvOINgWMBKxyrNiubGUphAjnKUSKxSG7ZMU7JHS8lQ+ahkqWSedif6Hy7xVSchjyaSwMmFemZWbcXwLvwwORXDFe0HXSpK9EZ37gWrs//Qcu6Z1ywfioVaUnwQo9oVPy5nJugQu4NQsPqf5Hmo9/UsqVEdmLISGBFB53XYQu8Bdf0OPRX0Bcic5wPWdc68o1cu8HkTpR6IYCt4x9hKB8FIJynDLPInYwueKKYZOYM1TevKGYHfeGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PMMbm842BCilyUGhbx/ISlWmMFwe1kIvCZp8szx+no=;
 b=IOz4uLkTYl9IGFss3Ph9Z1kG35qKyKeuPu33RS2LTN00dc5US4DwqCE25Zj+F/vgLb3OLCzXAJw29q1CZlCm12KoPC72eR7otryFU4V3Af56eIZ1+qhatqEntFfoFdxqyx7D7bJ2gLsLTWBAhCT9UsU/ppYdY5au0LTRhndeICggqsu8Bn/TQwEpLe84OjeURFKPIslXKIcEY4nLWmZbLnz4dDuvUKcowbN1PVhm4+BcPddLVKe6cTzw4BQhO//+50jeugxXJ9nHE5LAv8FB3m9tozPZ050NxDoFMzJaMOBavs6V0R5Q1OUGzeGEOjx4cHf0UttZtSOmsWVuwXf3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PMMbm842BCilyUGhbx/ISlWmMFwe1kIvCZp8szx+no=;
 b=reTITURLFN7EYFJDQz4DEblNPnzmgj89PN72VZrDo2qv5Ifvda+vOZoR7+XjR1b5xekSH/TFLiOYc0E4ceGNWtUZe9vZkuNTwl8N/WdnDDvLgYrkRYuXdAVRwZVflffHQeGsrNLJmswJEx1VbSpg8cj39xJHWZLcZN0lM6hmiqzasTnYjAt7A+ClzJ4XSZG5hN0264VxKqAx/46if5QFmqv0iS8KNVt5X6ZBtnsHpPEoD6OlH4XbO0771PNXyRoFBVtbmZpGNCWIPZRP7qM37oZnYJe8AIkrj1UEFCBSVkDeryAyWqOhYIDJLGDMtGXioWSEM5PbOBtaAMY5z508KQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:58:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:58:34 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:58:31 +0900
Message-Id: <DGTZATU21WV2.1YRBLUAXFHMVJ@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Subject: Re: [PATCH v3 0/5] gpu: nova-core: gsp: add locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f975af8-ca69-407d-ac21-08de79e55cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	yrg8tqQDzjY7wjuARB0IaFtAp176lY7RNFqV2fjBaPioebZXtVAB/BDNmqxzspBkdieDpM9uI+jcJ2dZpx4UHOBRKZTRaPYHYXXdYjMV0M3Te2mpxcG5874GfqlLAF5YBQQyoLlDDGFfz+gVJK54x0YH3tlE8Da1E8J8BhCrXBJIOXz8x05k5fdHipmij1KcHOpqBI2OvTjB/wXhJqDUSzWDF/cLphhFEpoISd4GhuNOoqaK/9OGHkG779RZi/VUCenwe7wzNN2m8/XEOpN/nlXbjHr8Lf+y5ymPHMrDxYpd0xeuSUKwzDt6J2gFc8Wz9LnK2mLdz5+6yuFRr2cSzOSvMIRvHEjnlqX+C4lP5Km7mFyTNGD6xzZgFwhsGFVLrUxqQvKwp/wtlD9Ehzpscpk5magsbw5tMCffyQs6UmKQcg31eaQJ57idjVkpVJsQZqkilYflW6yB0xYwxAAIcBdkYOxpV11DjeGL/m386wgWW2Mgnwh//LvC+gcgvETB3BLkECBdHPsxvfmzy/CWWG59GYtTefSuT5PdwfFD8tSxSbrskStugtLqlEOa9AsAE4ziu2ZHW/Yv/MRMnEJPvTQQpEFZBhj+CrX8CiCHMh3PFlSKzh63uXcUip9nRIQnBBN3bmBzTDEUy3BcNR+H67dFK5KT1nT0m+hCdyXCZznxqOQH8Mpsm8qxJ0HFc5DiWCu6W1QKurqjjKk10HE/ctNRZOnes+sd22d1NlR4D/g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHBKUDlSSlVWNGVUSFJhYkJHeEVBQ0hzbW5yZy9CbTljeWplRGtaVmdQRDgy?=
 =?utf-8?B?TDV0RExVeGo4RmVRbFoydFUrR3lXeTE0Q0RFejZUNHY4TkNnd2xwUUp5a01u?=
 =?utf-8?B?SEgvUXFxS3A5S2tnaGR0dDlWb3R5Z2RWbGlXR2w1UjFsNTI2a3ZBKy9LUEJ4?=
 =?utf-8?B?dStFc2xGV1lwaHlKRVhlR1JuYWVHd05ucWNmeEk0aU1NTmpLNnlFVllmaDlu?=
 =?utf-8?B?T1RyS2JEK1JDWXBpMzhyYVBlVjNQQmxRSE13amFud0dsMHREY3lLMkkvTmk2?=
 =?utf-8?B?bndsT1A2VjFxNEM3dmx0SEovVXlORkViMXlhbm5wTXdienNVSDFDSiszVXFK?=
 =?utf-8?B?RWdDTUpVZlV4ZVcrVUw5K3p1NlR3YURLWmxzWjZ2TS9raW5zeEhBZjZCazM4?=
 =?utf-8?B?QU1QK2s4MHNFNEpDcEl4Zlo5VU5SeW9zZENVVkFDWFZOK0dOK2dpWUc2UkRy?=
 =?utf-8?B?WFBIV0NWRiswbE9JaC9SU3FwaG5hZlBsc0RzUVNpODF6MGRpZ085OGlmSDhN?=
 =?utf-8?B?elNHWmFtQmtBeTRpRE5NdEtZalFqSjh5N1BHRFNKSWswaFR3TFFaMlNDUExm?=
 =?utf-8?B?WkkrQVJKb2NSNXd3clRnMFN0N1B0SWh5RGsrb3BSNXVOalIydUFocHRVZWtm?=
 =?utf-8?B?MEhlNkErdkJCWW45WmdFT1YwR1IvbHFGaVdiSmxGOTFsdW9lOGt2R2pJYkJn?=
 =?utf-8?B?NVFFclpHd0VEVUx4cmNaVWlyeXpsRnJZTW10aXZzL2IxZmFRTVRhY3RyRGZX?=
 =?utf-8?B?eHZZc1pZays0bFpaNmNCeHZ0NTc5bjlmL1E2MU4veTh5eHUvT2dnb0NzZFVh?=
 =?utf-8?B?YTF1MXIwY0VPU0tXUVEvTmRQYmpreElRWXVMSXBJK0ZaVlVIU1RsVWZiU05x?=
 =?utf-8?B?QnZHRzhqMXBOUi9YTlpuSzZnaUdOdzlHSWNVcHNEUnFSa3crREJQN2wyZFVV?=
 =?utf-8?B?MGtSWGZHcG1PVzEzYVdoYVhjbHcwL0RLWkNHR1VScUduVzhHMTV6TlRvM3c3?=
 =?utf-8?B?YkxnUUxLTWhENTRvRnd1TXlqNG9Tdkg5amxRQzFseGo2c2xuMi9DeEYyR0dW?=
 =?utf-8?B?U2w3ZDhqOVFDQTIxSzh2Z3FqN0xrSmhmaER5RWhTTkhRbDRoTVo1WGF0MzFq?=
 =?utf-8?B?RFhSZnNpTjhTeUQ4Wm9uMEVSdHBoUjVDNi9DNkgzVkpZU1htZlduTHkvUnov?=
 =?utf-8?B?azExSEtxNk1yWERJNWxBN2lvMU03V1l1Zk5OQ0hWSnlXRGNwNDhwMnhaOXAx?=
 =?utf-8?B?NUZHSVQ0dHZkeERraytDSkh1TzNhWnpZODJOcnV1V2FJMG4wc1ozYUFPdXNJ?=
 =?utf-8?B?ckRIV2h2dW5kRUQveitBeGxxODVGTzNmYmx2VjYwMjg0S3d2c2htZzhxakhV?=
 =?utf-8?B?YmpIZWFiT0NpcTExaGNwSlR5ZFFneHNoa013blpnRCtPMDgvVzdLckpwaHVW?=
 =?utf-8?B?bUgxMGV4S1ZvWDlJY0RTaHA3ZVV1UnRKZ1dOaXcwb2dwdkptYkJZN29wU0RU?=
 =?utf-8?B?RUZPUGJBdmJMSWdqK1Fab2RnU2poQVlqV0wrejVTckcxVTl2UXkwdCtnRnhT?=
 =?utf-8?B?RGU3dnFZRXcrbDVJTjZHTzRWTWVTRjkvS3VPTjFxTHF0Y1Rqbk4wdU1tTGlN?=
 =?utf-8?B?VWZZRmUzTWc4OHZpV1JQRHlmSWFNa3krN2JFcVdrYzBMQllnQlJQcy92QURP?=
 =?utf-8?B?elRFeXl4UXR1ZHpFRVRLS3ZJbDVkaDVVMnhGK3dKdm5hQlJJN01lOTI0R1pZ?=
 =?utf-8?B?cUFBeWdoLzZ5SWY2U0FxUmEwUUJkSThlS1hpQjZIYUJCand6SDR3T2VPclYw?=
 =?utf-8?B?STRTbk9BcngyTHZIRGxJSkNQK2p5Y01jVkZDSjY1djJoS1JTVUo3NnZEY1l4?=
 =?utf-8?B?eldvSHFUdmRGZFBycFhoVTVFR1gvRCtSejJRUXc1UGRrSWdJc2w4UE5qWjlz?=
 =?utf-8?B?eWh6RTcyTXRuSTBwTmp4Y3hjUW5Sby9IOWdkWU9wRUE1STk4NE1xY1pqUmc1?=
 =?utf-8?B?UjFpTFJ3RW0vUWZYMnFZeHRhMXR0UlROdGZaV0djWi9OcVdQemNiYVQ1dG11?=
 =?utf-8?B?cDdoSUE4dlJueGpMc3BIWFVRQ3JXbHJXczRORlJpWFowbnNtbWdEejAvZWlH?=
 =?utf-8?B?S1IxSEcwbDJMOVBIMm1TMnJOdTREcHNHcFFObUlDQVozOVZtT0w2R2xSSEsz?=
 =?utf-8?B?YnZOQTR4WWJtNUtaSzJqbjZjUTZoNEErNjNpbFZoTm1INjhYeSs5b2paNmlN?=
 =?utf-8?B?cW5GK1o0djhSTDI1QkRDZStLdjRtbUFEVDJtOVIrYkxGdHhvRldvRzJmdkEw?=
 =?utf-8?B?Qk9VcWppdkhUZnJGK2xhczNZSmZ2VUx6Y1BuWDVLNDQxOWw3NUpQOGxsamxL?=
 =?utf-8?Q?+S7ejWFR3i9rQalgaKQkJc4AEJ1IvMtu7XPGCWByAHpH4?=
X-MS-Exchange-AntiSpam-MessageData-1: xWhckDCoft1AEw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f975af8-ca69-407d-ac21-08de79e55cea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:58:34.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vtjOxtbVzKlnBwvvGUlYgb79Vn4plGuAad0BCpxOrZcFLVaQjfgU6hjBphk0irtXM1FesA7Q97/iHkIbZZJXnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
Message-ID-Hash: SZ6JHRK3SED5DOQIUPJ52C4HT5P2QS3H
X-Message-ID-Hash: SZ6JHRK3SED5DOQIUPJ52C4HT5P2QS3H
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SZ6JHRK3SED5DOQIUPJ52C4HT5P2QS3H/>
Archived-At: 
 <https://lore.freedesktop.org/DGTZATU21WV2.1YRBLUAXFHMVJ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Add locking to Cmdq. This is required e.g. for unloading the driver,
> which needs to send the UnloadingGuestDriver via the command queue
> on unbind which may be on a different thread.
>
> We have commands that need a reply and commands that don't. For
> commands with a reply we want to make sure that they don't get
> the reply of a different command back. The approach this patch series
> takes is by making those commands block until they get a response. For
> now this should be ok, and we expect GSP to be fast anyway.
>
> To do this, we need to know which commands expect a reply and which
> don't. John's existing series[1] adds IS_ASYNC which solves part of the
> problem, but we need to know a bit more. So instead, add an
> associated type called Reply which tells us what the reply is.
>
> An alternative would be to define traits inheriting CommandToGsp, e.g.
> CommandWithReply and CommandWithoutReply, instead of using the
> associated type. I implemented the associated type version because it
> feels more compositional rather than inherity so seemed a bit better
> to me. But both of these approaches work and are fine, IMO.

The associated type seems to work just fine. I was wondering whether we
could mess with it by using other types that do not implement
`MessageFromGsp`, but in that case we cannot call any of the
`send_command` methods so this approach looks good to me.
