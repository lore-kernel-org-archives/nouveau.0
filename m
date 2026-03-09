Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289BEA854A
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 02:20:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D671210E338;
	Mon,  9 Mar 2026 02:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bX+X9omp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A81544F67;
	Mon,  9 Mar 2026 02:09:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773022194;
 b=ry2vQTx7umFQyA6QJ88fkxtEi301zScwMruIsHmsvo2L2saFxmKkCm2WTbjNne8BA9QH/
 UUQd07q0geS6RDyuxox1yn3xOWApZQdi7Tn+PAHpzyA1zLASYZfY45ZdeQijb9lBMal4BvG
 AFkmVocw56slQae3eiRXW8a/0D7mTdjB3KOb+lt4SVQK44AqjQhvhuRcy3duWhNF8AH501c
 /IcLPUy3IzFJnzlM8QQ9iw23J9r596c5rBpSAq3oqDf1a+jtfThH45Q7r9fI4a8LyeJY0Ey
 sr3DGVKDtyewR4khbD7zlHGShnbhcqzu/urDD/9Ck23lAlYkzseDXvmjJXLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773022194; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZJOZQtGUrvavot1fXhXoUZ1z83FuSe2bgrQ+hKnwTrc=;
 b=s+7Boa6Z6zsreUyNFBeZyYH9sIEiehq1bL8lN8ANTHwxauLrbO35/R9J/+jjN8Lj6EeJG
 VRm5PoPkW6apSVLrKs7fVb3DI5RNmX15kLH5rBfAQ4qSGn4zxg7fjbPYQkMCNjCxr22kc1/
 yeG4gHL0RlZMD9Bbr6g1GOfbLqWifbjPkJI2xgEcCeq5AKiUnouZVFnQ9SY7Hyua4Snm0H+
 J0Csxdh5O8MFu6LAEBDulvyH+kie9gnqKekv/y0Uwyx8U56rScgU4cwYDI33efl5xB1QkPK
 qAgEbqb7vtXNx0xOqdKSQITy6eHiqyvdrIwzOvWc1tk5V4vdt4W+8w7V4TTA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5CD4D4034D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 02:09:52 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEB410E0C8;
	Mon,  9 Mar 2026 02:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5e6aqhQ5yXB3/ULByP58l2zZwVS0Zc4ydPUbXzHCVw6wf0iz60IYe06Kj91UZHqcY8xAu5bNB9pfd9UJyWRaJ/XPlaHPi9n6//BbpNJWww5fVluecnzROn0/w+f0A02Ml0erU08St8ytQoYI3E7iq1mX0IhGWFMFGOVtIC/62R/N16az7VHKinEfvcQ0ASodPKFJtDzhgWT966SWacOicZeRWO7MqpLwfnHwrgqI8cHfoQP0ggaBZDtNHtOlZTifqqwVdFE53t0YjzatvLPJ5b3PJVfSwkCbkUL377eQdHmuCihBZgMYhqn3gyne1qcg44b8hce3I+bB0CVFXQ3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJOZQtGUrvavot1fXhXoUZ1z83FuSe2bgrQ+hKnwTrc=;
 b=Omaks0tggyhM648nsBEAHoiK8FdX3DUbM6wJ07IQXtu3/KNUxkO56jBg8GaW5LaOyX4gyNUgh3AyK11xBV7xI+Zc3DEMbE/m4XDJKd9pbrRtrkwO3fbEvYq6qGDObN9EPa5KAt/5b+L2XQ8w6x2ZrQR9+HzI083IKAEloChEJQKFOFoktIVxhnGCZkCGdyYH8PpZKi2klLBAcnM0d9KknsDxxQjISimCB5AORoSgsEji/6MBxyhnzb9HZIIWlkxTRZIf/bwUB+IkPMBRhEaGuYxhEDKA4vDbexb6cg4oHGoft8kSIXV63v8VQ38pzbsj608rS7Iedb4xVoUxKgD+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJOZQtGUrvavot1fXhXoUZ1z83FuSe2bgrQ+hKnwTrc=;
 b=bX+X9ompxqEdz5wPcfVm2fwbUFvugIrTM6T/B3JUqgGNs1xM44OgwqR/5+wxHkIuUsSHsU2+TSdgCtbtW8oI2Wv/w328i/yYeWc7J2OXZQi2CQZHzOXR10jlbb21mJx8+jPWPyChqdUY9sQjfuI6wYVAow9tVtK6KGJHQi8QG++o/tPKYF1j5etFaIVUs347OVTBTYcvTHjO41rf6SGJsu8M6kDcTL1wftZRHvRdSgwR6huUuKUm/t55ccPGezmZcXBdVCASYNG9qf8yuEn2KYPa5h04ep35lPSA7ZJc+b3NBLmHiC+g2XyQpNEbqD60PSWRfXQzFdlzGCFXKcT0pA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 02:20:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 02:20:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 11:20:14 +0900
Message-Id: <DGXW4SG5QR2B.3F9D9DY4ZUUN6@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com>
 <3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com>
In-Reply-To: <3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com>
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6a899b-be5e-4f55-dfa5-08de7d8267fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	SskZ4Kd1swNF+aNoFY38jZjX6DJt7ZmHHXuYHzlFAKdre62lSmsQw0lb3cfR7BQdHb4uXF76y0gIiSRAQ9mrkmfLFERAjoni1K6++OFdpTz6NvdS6k2LdqUnlgMzyiWaiQ9rgJjQW1porTJ/Hi3yxwUzWaq5NxHDmhwy+LQJKqASoUQnfWySeVsLh9JZoOAVBC1HL1XFwnvH2PCPujEM16utnqBIR+TswmxeaYli6ArH8/lTKx5Qv0QXDbjqrR/7RzWsfyHzM6KJFIpprmG9kW3CrLwZxLNVfiC6R4eEch2PvAUozVdYyFvBixETvkHz2Nk2Yf/nEUMd7UXP0tuFo1L/jcGFOZpUNRVvHo9WnizChtX8niaV+8QW5LCutP6K749efkNFxWofWp0L0mieGJn8ors9M0bk2UtqbdhoCr8DKIYz+w6giOc+O8AaPKpF2CHGa2QkrCOJp5/naod/z0xzhcxzVsZtmXnmRwZ87HdLMXU90Wpz/LAE/sKFoIrwzl0XE1oDgY9wXqum5gsY4I3DLshRd9skZG8Sqmn2kdHfQ6uMb/6j+n+AYQpRW6QG2L8Tk4o0WvWkzLXXkH2A2W2GNuRVNvM+Dik/MzInoPaH8RClZSfDfgNAzok4cyp9UlIz+VN/BNK86H23E+55njcD25lH4yA3tp9M7/O2HWpVVWpSCVIwsQBUZ3Q4vnG5tky+C12bQSh2tc0YAQaa4BNwDdZZ32d1HDK12Kd0NWwmBu3/VS+FVFrgIZxC1iA6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVRYUW9udFp1TDdWdWxWblI3ZEQzTGwyVkZMaHN5TWp2U0RFWC83aHNacTlQ?=
 =?utf-8?B?eDZsZ3hyU2kzb3RPNDFNSFFFRFcxdG02NDJvZjc0SUdMNUtsZ2hJdE5xaHV0?=
 =?utf-8?B?OGtxKzlkVWR1V3JBbUs2VGRVd0ZpMjFoMXpxempVd3k1ZXZldGJSa0s3d1Nk?=
 =?utf-8?B?YjZ4c1psWjQrVHh0RTU2eUJ2enRlaVpkbzk4a3lJQkpTTVdTMmFSVHUxMHVB?=
 =?utf-8?B?eE1yZGVxVXVUVjBTZlZCS3RPMnNpSW9FNzBKaUJoK0ZpRERHbFVZRU92dmlu?=
 =?utf-8?B?cjhsMlNrWm9HSncxUDVLVFBwb1JWeTd4dWRtb255QU90VXFvMG04TnJtdEdw?=
 =?utf-8?B?Z1RaNTJxM1ZhUXNXQkM4YThmVFhmWWtJWVNlZmt3bU1HL2lzTWx4MU5mVVNC?=
 =?utf-8?B?akR0Wm4zY1Q1YUNMTGtGc0hZdGZjbjdEYndJT1F3Y0tEd2EyNkpsRkU0SGtk?=
 =?utf-8?B?ZnhNYVo0U3VjbGdpVEMyRWJSblhxOUNiMjZGMmR5MklRNXRmWHhpOGRxSlRB?=
 =?utf-8?B?N1NPbVdNQzRpLzhkSnNUVnNZUUtzb0M2b3VRalhZRUtvck1FRHNYcHI5NWVn?=
 =?utf-8?B?Vmt5bWh5N2ttcGh0L08xWG9saEZFd1l6NnkzQnhtQ3pmV3ZwY2I4S3pKVkN5?=
 =?utf-8?B?TlRtUStxQ1ZvaWNINktUTXNzWUpnNnY5d0FINXJXRjRVSXZmWjJ0QUtZTU9k?=
 =?utf-8?B?cUE1TTFlUHBYK1lHald0c041OWdZNGVubXBOVkJtbXgxVEdNRWttaHFva0Jv?=
 =?utf-8?B?QjlWTnZTRFA3dENoZXRnSm5ORy9BQVgrWTVPbC9sVFM0SXFQUHR0czlYWjNG?=
 =?utf-8?B?RG5sMlIzejBVMisycnh0andrQ0hYcDdyTUcwYWlEYmJzVVdUMEpic0h2ZDlz?=
 =?utf-8?B?SlhJZ2k4WGN0N010MW9XQ3ZIT0FqRTRjcVh4MlNtUzZTWlVIcEtScjA4UnhP?=
 =?utf-8?B?WEl0dkVJQVluTEtGejVEaGZOWVZMQnpnOTVYZW1ocVVzWmpkVk1Gd2FiWEcz?=
 =?utf-8?B?OHN5OHhBZ203QkdVdFlwSlozTXcycmlxTlFDc1A2ZWM0cEdVMDR1eSs3ZDhE?=
 =?utf-8?B?eWhpbUxJNHQyazN0OURWZkU5R2FhVEZCN2JpdHRkYjFkT0RyTVhiZVI4eVQx?=
 =?utf-8?B?aExidXphT0c5U1BqbmpCbXpJN3U5UVhValhMb2J2ekhHSzZ2ZTdla2s4MG9u?=
 =?utf-8?B?LzRHSllqSnIxdm9sa2xiQ01yemdocm5GbXdrWFAvRnRINUFTZm1VYXJBbkxD?=
 =?utf-8?B?L0NheGYwblg2K0xJcGhGSlgrdEJwVnFKWUo5UlpKTjR6dVQ4b2Rqc0NUL2E2?=
 =?utf-8?B?TEUyWllkRWtmREJSNDUrcUdRY2thQzc2djQrbGZ1Y1JyU0p1bkdzWmdncVUr?=
 =?utf-8?B?VzJBY0NtdmFxb1VIMVNGeGRIdVJJN0ltOHk0VzNGMExlRDdUTUJDVUxCajUz?=
 =?utf-8?B?WFU4dHBmQ1Y5dWkwdWVWTHRGZElwelJzZnVYeGRTVTgzYjJEKzg2SG1iS25R?=
 =?utf-8?B?RmQzOTBmd2wvWmRNY2I0aVhWK0J3ZStHSEJUbTBsUlRHUEhpYVpEUkJ3OExK?=
 =?utf-8?B?T2xJZStVUFZaUHV5SFI4NU5MT0NJSVozN1U1eEF0UHpTdG9Mam8xbzFmRTVH?=
 =?utf-8?B?MDA3UzBJUUdrSEdkSExUcWc0VDN2UThIT3RlUlQ1SFRoVi9hMStRazhjMVc0?=
 =?utf-8?B?cmx2ZmxWd2F3T0RGMjB2MW9aZTJydFZZUnNVSEl2QkcxRzJrR1JBOUtyY28v?=
 =?utf-8?B?L21FZFpIbC9zaCs2TGpiWk5Ebyt6Q3dTbFp4cjZQOUd5c1MraXFJMUxLSkpt?=
 =?utf-8?B?M1hzOFpTWXc2cTJ0bTczZmFpLzNyMklIS2FBRlI3WmJibjBqMDNPYzZRVUh5?=
 =?utf-8?B?TSt3Z2ZTa0VDZndBT2E1MUJwelg4RlVUb1ZzUHBWWEFIV2NrZFo1T1BRS1JB?=
 =?utf-8?B?d0s0SUtDUW5ZNkUydk5IVDJLZkVsUzEzWU1NZWNTN1RsR3Z1aDNxRVZPbEdE?=
 =?utf-8?B?cjhvUWpTQmZ3QTNtZFdRR2VPT21WaUZqUmN2MXBURzVqMWlTSC9OTHNoRFhW?=
 =?utf-8?B?bHAzVFNFU2h4c0xIOU95cXB0STFSbUMyRWIxR0NpbWRXbVI5NmppbUViQ1lx?=
 =?utf-8?B?SzArdnIvczFudU05T2NLV29aaGttNlorY1BEQ1pZSlE4OENzdkhlMmIrcGF4?=
 =?utf-8?B?Nm1qTWNsTjZIQm5PeUtnUkRxMmVZWFd6aTZCZlQvUWtFdzA1NXovWlpnTXl2?=
 =?utf-8?B?cDRhR2RvQ29HS0ZBa2hMKzBiRFhWOU1NL0N5NDR2NVRIelB6WnZ2bTFzaVlG?=
 =?utf-8?B?K1psL2hQSDk5a3pxTDBZYXJwaFVPWmNxaTNIcC9nY1ZoTDcrQ0hRcWY2U28y?=
 =?utf-8?Q?4XZxb3ULRwnUcOXc4iK24THXbaXeDzBvE9BgMVPkxAyU6?=
X-MS-Exchange-AntiSpam-MessageData-1: dSGZziAm4OXvaA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d6a899b-be5e-4f55-dfa5-08de7d8267fe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 02:20:17.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 juHzg64g245DZJ9KIsyC9zpxirJ9jSiAPjXohoevK3BufcdVMSHZb2nUCGlx0NZtxRHQX/dsiglHxrEeAHx6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
Message-ID-Hash: Q5XGD4P63EY5KEI6X5ZO2QHH43ILTWFX
X-Message-ID-Hash: Q5XGD4P63EY5KEI6X5ZO2QHH43ILTWFX
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q5XGD4P63EY5KEI6X5ZO2QHH43ILTWFX/>
Archived-At: 
 <https://lore.freedesktop.org/DGXW4SG5QR2B.3F9D9DY4ZUUN6@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 11:06 AM JST, John Hubbard wrote:
> On 3/8/26 6:52 PM, Alexandre Courbot wrote:
>> On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
>>>        gpu: nova-core: create falcon firmware DMA objects lazily
>> [acourbot@nvidia.com: add TODO item to switch back to a coherent
>> allocation when it becomes convenient to do so.]
>>>        gpu: nova-core: falcon: add constant for memory block alignment
>>>        gpu: nova-core: falcon: rename load parameters to reflect DMA de=
pendency
>> [acourbot@nvidia.com: fixup order of import items.]
>>>        gpu: nova-core: falcon: remove FalconFirmware's dependency on Fa=
lconDmaLoadable
>>>        gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>>>        gpu: nova-core: falcon: remove unwarranted safety check in dma_l=
oad
>>>        gpu: nova-core: make Chipset::arch() const
>>>        gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>>>        gpu: nova-core: add PIO support for loading firmware images
>>>        gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turi=
ng
>>=20
>> All the above pushed to drm-rust-next, thanks!
>>=20
>
> Amazing! I'll start testing on Turing locally, in addition to Blackwell
> and Ampere, now. Exciting!
>
> Congratulations to Timur Tabi, and all of the expert reviewers and
> refactor-ers to!

Note that you still need to cherry-pick one of the two non-merged
patches for probe to complete properly:

https://lore.kernel.org/rust-for-linux/20260306-turing_prep-v11-9-8f0042c5d=
026@nvidia.com/

I should maybe have pushed the whole series, but would like to get at
least one Reviewed-by before I do so, for good conscience.
