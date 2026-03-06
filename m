Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE78F513FA
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 04:24:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3B10E346;
	Fri,  6 Mar 2026 04:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R9Nam9AF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 96BA344F00;
	Fri,  6 Mar 2026 04:14:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772770446;
 b=eD+WGYcSNiUFdC6CkRty7735FZUmCQpIVju44LxDc/ngpagOJkufUH6YiZamZznbBh+jw
 9frrY3Jqp8MGzW3Zts3MqoUBHX2ZBcRu0LP+TxDtwuDVSGtUxsIKcgfHOso/EFI/3n/ICkS
 kUrRjkMHIlphBDU9jvizwPeLkWn0zy9cJ3qJgs4d6E/4/ONTAa4LQj4Vr6d1dxiMQpK3a5l
 0zG0dchpu4MoKcSLoDT0B5rzvg2ZvRRVfyR2lKVZcFkRG0wyfd/DwBoJI7EQCcV+IShkCFB
 VVz5heBOrjSIv8y0qf9B6yJO4mQweKhm96XWTXkxchIyAWWckrWeqAmjCPRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772770446; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5mdymEnii5MAtZdd5MTokCzttFAjKJWDUsTyYA0SQEY=;
 b=od6A9FoG0ptptIYZFwfazxKKBZbi1dOlysr2hzQDZstWwO9wS9elpSnaS1yNUkaEOq5JI
 RfLCqBjc6cKx0OER29senethU3e+0CLd5CT//5z0nlmb52R+nEp9ZvlKyXU/oDJh2B08DZp
 /KU6MN3HZ41RSUP3l1RDmjWMO/w1R/XzRD1URqyov+HLDYV3CEANGoTul06ttuy46NdXqLH
 nTEksIJy2F3nXjPMOQFRw2Hod+Pq5kSTmmuVB6G8liMDZwlIeXcSMW0lqN1ebxFM2cHu+TR
 y0vdDztCFzHBXRRKr8rd7zYrTtFqD3nhdTgTxtBkFQSW8FVQt4aaLDfpuWXg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5AFF4404AB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 04:14:03 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 93DF110E323;
	Fri,  6 Mar 2026 04:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2anF3aS7NqpPlF4cE4NS0/K+k1Ql+XunoctB0NaGO624fLB4BUlE6zW0u6poHdReG996vMcg8wz/ZMRdgheI/wqkY40rCkCuzOx4eGCzK4NuNUqzQE+tzcN0JOK6gCEHF2r5EGt32TvqjWUrImvzk2n9yiZocc4e0iMDySrTdZT+g/ksEjCX563SBFp6fZcJlLBI9gqYezIecnBCwdpUqWwYhZRN2BLbsuCyUzefh8spfBWU3MToo7m618fJYZkL+YAkUIivnuoaCdni4xqtpediCWbDUps3QU3+F++njBS9eXRtlPpKFN/ig60BrXEUnIRM22Hblp6q743mZ9o9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mdymEnii5MAtZdd5MTokCzttFAjKJWDUsTyYA0SQEY=;
 b=oCXnpy78723rh8tCmGSyiPKsaFfGwqUeTUZsqK0WDZpFJpR4/3GBMuP1UqGBC9w2Zo9mHSi0pAiIhvc/W+2GIiowl2EhgfnFDm99222/O1boz6sxgmKG5RfkenKDVcnE9bTAF6gmxJRv1tTSP9OE7rVSyLasCesShuVJhddjqWQmFGrtigNlI/i81PMKqX1xokiSMnjpQ1qFLXaZMVJr1vsfrbikjpqlM8OryNZWID64JLD8Ur5+2xHWuouEip1Ff8rpkuVVbl94rXPmjn7YaR4NEaZCiYzUYf5ktgd9x7hXXKy4PpY1XjWb4pWBdA8sdZKybU69uWLtIgrDQUKAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mdymEnii5MAtZdd5MTokCzttFAjKJWDUsTyYA0SQEY=;
 b=R9Nam9AF0vXTp3tBX3MpzBLbCryuIcp1HuxUJisCwWKHinsl/p5pBp9oTtt0sGjWkKLGeHZ6uCVsKdlG5nbINl38CWrcPqtjUAIkx/Nky+x3BBVeKAKLhdp5n/yYkngJFnhOMd1cs//thC9k8swFaZElyNF2kMgjRnIzFFUl4zjBXHzERwuBFCUwo5K7Yw5vDN7QVLenGBXC8bhBCLgBfdzjWGyp4q5mPkpxEmOQBX8jR+v8OqwSgllZ19ZAykgKtcfBLkvo00TfFukkTBak07dUp8oLaI8OIzEGGLIz0I/LlTeAS8qQLWGvm3IPz5ggt1Tv3TPUu90/4Pd4+2s9+A==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:24:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:24:21 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 13:24:14 +0900
Message-Id: <DGVEW3J77TSW.OHE8A3H980GG@nvidia.com>
Subject: Re: [PATCH v10 01/10] gpu: nova-core: create falcon firmware DMA
 objects lazily
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-1-dde5ee437c60@nvidia.com>
 <DGVBFO7P95IZ.24M3NHJ4N06DF@nvidia.com>
In-Reply-To: <DGVBFO7P95IZ.24M3NHJ4N06DF@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 115b64f4-1c55-4c56-4cf1-08de7b383cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	8PcCWB1iSpxJLN5M6b/METOfgJJ5QwyKczVjPVFxY1lDEIbwEiEOTlaEmgR6IshIKbYAgH1UtUkk2P/n96R2PE0aUQtcH6+X1CtmfmYvdHKWciS4bx5f634egbMsEt58j47sVsGd6xY6x9sw6ClRGsv36TXWp9+UaWXoSNvy9MJxXIS09dBzMHdLnch1T+Myi9bboT4UWhPJipkLTbTc9mlRTtEvS1kXP7nMY3BLu0Ggmo1G/1lKZ3ZQUuhbGyTzog4cFLAER9s0c6VPJAXtoFeCsNd0tZcrf0UuteCrYibKaxmRiE0HqGNRfRXeVrje3LKe59xlOEYt6qEHMENmmrZh55GHDF0Lu3kV0Y5EFojh+oFfn6LuBxqTqr1D1tVuWCTd9rmsOxNd4lr38nXHgFSbS3FGjeuP+BQ9AqDqLGLgH2VZ1avj0MVVVrF/y1D+T2H8uBslMg4Uh46ki7A8xH+AeFWxRcGcNUMl898jQIwocQ3aSz5fMYoYbIWsQsGaSDVDX6kmhnI60PB8ZfwsvlXdVCt7Q9ABrDP0k4CM3oKLmjRCL5WUJ/Dtg1sYCrqqYrePyGgQLdywj3/hTTSkUEPwOJrGIzWbB5eyzG/tbrob2hvB3tiGuRhg/5UgxZS4PpeHE1qYpO9/FAy0Z4frel9suI1WUqtvm5rkDN6sIM+cXt35jom0xkFzg9chDtXvgfpZ+Ayb2nTBSdXOxurBPBy06WF0PU6JvYFFkn4Nhgw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzdPd0tncW5TTDByME9kdHcvTUZSWnloMkdVazJDTWxEdFBvRFVhY1BBN2FQ?=
 =?utf-8?B?MEJsbzArS2U0OHFZUHBRUWU3VW1RMkovSzM2UGd6QSt1OHErYWdMMWRkM29n?=
 =?utf-8?B?Qy85bkJrcDBhY05ub3ZDOUxRdGlXdzVTNnBTNktEaU1NcjNZSjZwUlYzYU81?=
 =?utf-8?B?bExjNlJ1R0pPTEw4bSt1eEhxRUl2Ym03NmpRTXFBWC9QWk9VNzNiY0xhR1gw?=
 =?utf-8?B?SitUaDNKdDRBZlh4cVRCaTRYZVJYMEphS2lWRFBHa2FhTHVzbTJ2ekhYcTNu?=
 =?utf-8?B?NytmUzJFWlN4UUlVU0cwZmwvWU5mdk00WWZXSHgzWk11WWp4WWRwN0thOUZh?=
 =?utf-8?B?aUJYUWVtclp6d1V2SzZwdTRBZ3k5cllvNWE2T0g5S2Q0S05OZElRUGgxN3kz?=
 =?utf-8?B?Vm9oQVpqZlZZcDJpczAvQkFwMmkxdU1tQ05ReUprOFFBWkVZV0Z3a0M5eklJ?=
 =?utf-8?B?eWJMckFOdGljampmeEJuZUZwUTBYQUF4MmlBMlNBdWRzckVxTTU1bnpxNzdI?=
 =?utf-8?B?ak01bksrbVVYWlA3YkhpWXFyZDY4aEp3SDBqck1CMlFVbU1xSG54cWU3eVBn?=
 =?utf-8?B?RXBOZ1pyTzBTcktzNzRDNW5XajM5VXVFSmpWV2tudTlsN0ZIY0Z6aHRpaFVR?=
 =?utf-8?B?amxuZ28xWlJJMXpQUmRzNmlkYjVub3Y1WVQwVm9DUStDdDg1Sm55YUVFSTFZ?=
 =?utf-8?B?VTMrR3NkNkNPM2JnT2R2OFBkZ25NUFRhSmRSMUVvckQ3a0FST29CK0J5dWZR?=
 =?utf-8?B?aHJIUU5mUS8yNWhEclFqV3JPeDEycnFBVnZENDRhUXpQbW1ZNTJqNWJwZlFp?=
 =?utf-8?B?dWpoRDBjZldvUmlvSUhab3l6RER1UGV0WXBvUWNzN3VzS2xMa3AvdGZHMVlq?=
 =?utf-8?B?UjBteXdTZGNBYVRqbVhTWlMzZElDYythS3loWWdQbU83S0xOV1prc3BDdnV1?=
 =?utf-8?B?UDE1Yy9TVjQ2U3ZHaDFrRkZYMXF0SFo0bko5eSt1TTNyM01xRHJQU1lYK3N6?=
 =?utf-8?B?QlI1STkreU5vTjBobng5VkRwUk9zSTB3NXhGZnBQNE1POEtON0VHLzhWTGJL?=
 =?utf-8?B?ejhmMkJ4WDJMUDRaUnhHd2FHTENxWlBONjlXNlROcDFyU1NDV2FTUytNKzJF?=
 =?utf-8?B?clFqcC92NDY5ZFdHb3QyMVBHSDhVSFFhUnBTNTRUQTRQN1NnQVNqWWZaNk9H?=
 =?utf-8?B?ZXFySnF3aGdMK3NHVjJ5bXZrTktiY0J0OWYyUC9rUTI2Y1Z1NGpVdTI2dkNo?=
 =?utf-8?B?K3d2eVliWENxdG1BZU1KbEQxblJnK21VSWRkcDd0cThyUGNjRkFFbHhzOHBw?=
 =?utf-8?B?WjM2blRLaklPQnBZYUU2Nnk3Tnk1VW1PbVhuVHo5bFgrbHg3OXRsWHl0bVI2?=
 =?utf-8?B?RFhlNG9zK3o4Y041Vlo2Tk1MbUk2TW5PZHh6MDFvWnZpM1JkOEl5aS9tb3c1?=
 =?utf-8?B?MGFLeHJwbE5PcTdyVUQzRmlPSmdWbEk3OUpBL0VQV2RvaXdkWlFBM2JlMUds?=
 =?utf-8?B?dVNJblNtN3V4N25reEEreFpVT0IvM0U0UzMwaFFQRWlHYzNjcXdZTjM3NDBO?=
 =?utf-8?B?WENwRzRjWDZXcFIraTNsMk9yTlNNbm9qMGN1TVE1MEpWVnBQYXB0OFpLY2RT?=
 =?utf-8?B?R3pNN05ZQTJTZVIrdlc4QWxmMVpxVUxaamp1a2FtUEhZVjNNK0Nxc0lrWUdV?=
 =?utf-8?B?M3dRV2k2L3ZkWFA0U3NSUWV3QUd3UW5JVkMxT1pHaVdtS21aYUFIcW1YUWht?=
 =?utf-8?B?UDg5aFVRd0tIZVNsV0JEYnlpVVY4ZS9GeDNEcmNZdTRaZnU0ckg0NU9QUWph?=
 =?utf-8?B?MXI4aEpsRGc3NGhFV1FBbGM5MUF2WDlJMFJ5MitOM1ZnZXczWi9ZN2kzN2Fr?=
 =?utf-8?B?TVFnOVlEVFdRN1AxMkk4RHFSZXBmczNUNFNpU0I5TVpKRzB2eW5NZjMwdnZ3?=
 =?utf-8?B?V3RpWUVPS3dFeXpzT0hwU09SeWYzWFIvUHdtTURaNWZrc2VBTnEvTXppRi8r?=
 =?utf-8?B?OUdTUDVIbUNPWDNidnVGaTl0Q0ViQ0E0OUFZZ2QvMW5HWm5nVVZCb1hNb3Zj?=
 =?utf-8?B?VnR4ZHlQVDFYeDdXVG16allYZG42R0dxN0JTMlBGQncvWm1XNWZnWWFTWE00?=
 =?utf-8?B?TDJJcUpLREdtdngrYmk1dnp5ajVpTTZGaXVQZDNGMmJpTGVuVTlpOVRmMXlP?=
 =?utf-8?B?Um50S2lTU2Q0UHpQWG1JM255V29tTVBQU3JtOUlGMmw3ak90UnJ2L3VwMmtF?=
 =?utf-8?B?b2xkNXc5clA4WTdIY2dRNUt0azBOb1ozUmFNcGJiV3FiNklZZmFReTVjSkpa?=
 =?utf-8?B?ck5OK1EyaStJZi9ibUE1NHUwSXFsQ3dCamR2WDRJN1MyYnJEZVE4dzNuMmpy?=
 =?utf-8?Q?zHNC1XIezpe/JlZpcSm+4l7GlbELHATaijjV0f/K3s63Q?=
X-MS-Exchange-AntiSpam-MessageData-1: o3r1u81VAtw27Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 115b64f4-1c55-4c56-4cf1-08de7b383cd7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:24:20.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y/ZOV/bg8U8zaRsMKY7I9CC30udM0Zim2DZ6a3PaxXjk9Py9rAHbCCeAixJP5a6NT+ANFcDcjoGcNuP5ae6F5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
Message-ID-Hash: HLNSG5BSJ4FWA53MRRUCSRCZH3M23IBV
X-Message-ID-Hash: HLNSG5BSJ4FWA53MRRUCSRCZH3M23IBV
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HLNSG5BSJ4FWA53MRRUCSRCZH3M23IBV/>
Archived-At: 
 <https://lore.freedesktop.org/DGVEW3J77TSW.OHE8A3H980GG@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 6, 2026 at 10:41 AM JST, Eliot Courtney wrote:
<snip>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 37bfee1d0949..8d444cf9d55c 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -2,12 +2,13 @@
>> =20
>>  //! Falcon microprocessor base support
>> =20
>> -use core::ops::Deref;
>> -
>>  use hal::FalconHal;
>> =20
>>  use kernel::{
>> -    device,
>> +    device::{
>> +        self,
>> +        Device, //
>> +    },
>>      dma::{
>>          DmaAddress,
>>          DmaMask, //
>> @@ -15,9 +16,7 @@
>>      io::poll::read_poll_timeout,
>>      prelude::*,
>>      sync::aref::ARef,
>> -    time::{
>> -        Delta, //
>> -    },
>> +    time::Delta,
>
> nit: Missing // guard here.

IIUC the guard is only required to prevent rustfmt from reformatting,
which does not happen here.

<snip>
>> -impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
>> -    fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecC=
ommand) -> Result<Self> {
>> +impl FirmwareObject<FwsecFirmware, Unsigned> {
>> +    fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
>>          let desc =3D bios.fwsec_image().header()?;
>> -        let ucode =3D bios.fwsec_image().ucode(&desc)?;
>> -        let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>> +        let mut ucode =3D KVVec::new();
>> +        ucode.extend_from_slice(bios.fwsec_image().ucode(&desc)?, GFP_K=
ERNEL)?;
>> =20
>>          let hdr_offset =3D desc
>>              .imem_load_size()
>> @@ -269,8 +226,9 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbi=
os, cmd: FwsecCommand) -> Re
>>              .map(usize::from_safe_cast)
>>              .ok_or(EINVAL)?;
>> =20
>> -        // SAFETY: we have exclusive access to `dma_object`.
>> -        let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(&dma_object, =
hdr_offset) }?;
>> +        let hdr =3D FalconAppifHdrV1::from_bytes_prefix(&ucode[hdr_offs=
et..])
>> +            .ok_or(EINVAL)?
>> +            .0;
>
> Is it worth adding // PANIC: comments like we have in some other areas
> of the codebase for each of these indexes into ucode?

Even better, we can do

    let hdr =3D ucode
                .get(hdr_offset..)
                .and_then(FalconAppifHdrV1::from_bytes_prefix)
                .ok_or(EINVAL)?
                .0;

and have the bounds checked at runtime, as they should be.

>
> Other than those two optional nits,
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Thanks!
