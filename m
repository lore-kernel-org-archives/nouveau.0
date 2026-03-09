Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6AAEA852F
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 01:52:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E214510E192;
	Mon,  9 Mar 2026 01:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jsppbBM9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8E1CF44F63;
	Mon,  9 Mar 2026 01:42:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773020531;
 b=XOXlwxF+pHykDTBVmTu39Uo3cSXMEBfRhawHZu8rPH849EPdohwKhnJ7eh1ZWWFKjq4XZ
 r/37VbrroRStHL1YbpgBuhtve6GqHyXD2QO0MFHQrphSGblXdFZNcfEzKVgbTFmy8Y32OAq
 T7eGRFx9zt24UrkVGIM7uvgEvj0CWUbJ0yWRhPufeyQj9o4/6hCJvnYPH6UoOzklyokMJq3
 xMz0C3h1QMkqndh4bczZ/HjQ1jvzvdLGKEeuhL9A4rcidVszJRdiPuSTL27hkL2tr6J64vy
 iTdxtL2Is8IToiW12YTDQl4q2HZ1r1FqgoZ4TgTt7LJe/gTs5lSDB7teuAtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773020531; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oua2HHWRxbEZHaidLjPXwAIh8g+wNQD/LB4MDeb+tns=;
 b=RzoAbr2h/5Z/uuBfK8Da3oKblepQnWtcGc+ko9IAaiGqrkVk26AhrujIr5fKXuRZqZYLd
 UoQ76fCIBXkgNt7Qd/WdoHW68zsVmfEX2d3ArDnPgW/CXb4pNPacNM38kf/TCrYzylsec28
 w0LhmkzUuG1Q1Qe1RQfGQgtVgvzv+O73DebbzzYi8uE2fg3NLMuFer3W2Z8rnDoU3ArhOfa
 30z6RSqHZGytVG/VrLeqaxo6s+Ihdf0RaYacUTWGdWGXBuCYdQlFi4vopg8/u0rULBXO0tQ
 Rr5rxfKSikboVnuFCa3SaUb+W0Z3w1+J7adrCfUCWfa1o82gk+bshjwmANSg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9754E4034D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 01:42:07 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8AC10E09A;
	Mon,  9 Mar 2026 01:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PubcqGXjkCPpmSRNBnD/1+VZdaendh2oaQ+8NfrUjCcshSu7dSnX4GxTNhvjMWAP2GOw91/ene+gZ9PyER59MQHYvlw46xRc1RbjjP5pxvSkfmPxdlcOzp2JV8VTlIOrAvX6vS3AoSXnCiWIpi5ZGX7OHWT+XiMapZtLXLaKm1oSFjmoJnguLsmP1BuSkvR+novxFnzDmQGUOJShhToADBWjL++2BrWPZFjN2A67hKLxC67CAAJf1RChm67yAbr2MH6TmTGezYjYlCa0HgFip3mlB9Nw3R5G4l3d43Vo0Rx7M9jBaGTbH+zPRRZKraWEESrdUCTpNcSQ+ewrpW2K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oua2HHWRxbEZHaidLjPXwAIh8g+wNQD/LB4MDeb+tns=;
 b=nczSJtqiQw2vq7WuXlXz4zCQxCHSeyx1+vpmQgrpDiG/3CrbEI12j0OZ9Vk4qehcvLPS8TpgZrW1Kk5yJLTXvzSprTkfIOuNbq/SdIizf98t4Gjs1K+DZALMkyGuBGpDiQZsb2HT8l4oGIUGBoUER/gCaj02nqTAtamTtsH8s+NmfXxyx15IauGEfJEa97/nqRdxaDEVCRFYoaFeIjAIEqLNjsEuHGpyiCo+XBK8axGxPg2LGv0CIb3AEid2Ci+3ANNfM96Psl5B5FdF37tLSNJehxbdS4Ex6GLtmtAU7zTKWZg5brKsWXCZEcPbMWbjSnijqVFpxQt5++thNNU4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oua2HHWRxbEZHaidLjPXwAIh8g+wNQD/LB4MDeb+tns=;
 b=jsppbBM9nLuF5PegiX8UHbj20CezaOfyA7o9/OLovnTNlEF6c6Mm+UGemgrD/sOq6/NxLlXadulRw13J7//GJNmY8pqUFjC+0cRhvLenQu3pjBqMsl/fDDfyvoaU8Le9W0D8N3fyRmbTCc4UhVB4L/nSMZCEJjnm8suOjTq05nFDyvg9jP1vZdIExOojb2xp50IXmgRKM0rHCQeNlKyDnxHrgzhfhw8PLsqfR+oAO0uoqehT12PPewqiNR0kmbLztsGMwHy6bbvD6MB1AkdWssv2DCQnFRF81mO8NxkekptjcEmUU2b/4C7nVjIMeCCurZHPjSJC38LtH8vLlpqdNg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 01:52:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 01:52:29 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 10:52:25 +0900
Message-Id: <DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: cf867943-ec36-4e2f-ffb1-08de7d7e855b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	k4afw3rEJixryLnyn8L3/VeEcbHkyMeMxsDEyVIEn4dg4iQzYsdIF06lpCa4AdCJZv19PDEAyzyltap0madgEDk4wczL8mL+qAqCjAPd4kU6hpdVPYTiW+eVmZSfNqbi1ufX8jzozRFoDaZve7SD2iE5qlwl1Qxm1fuHFJo+OwRuQczMIknd5w0SVjqAuzyHUMzk4VRHQfFXhfMRmLGfOQnU9QQjpzt+OJSDMjnxE3j4a8Exy9GlZOhvNCl3kRe7B7HWLHAjlhkKRtAeP/q7cSN+WHg1JLElDMDuYRdaw4HisUcEbA/AW64OY38GuoJRXYV8sFjUO30eLtCzn7Xup1XrezTymE6hioP7N+W6y7pfsBA/fsRDyB43HBHTTqB5Z6jg4cSoxJiGs3cHIohPtqJBNlgDiK64BX19VQDzINUCUs4VeVbhykNSr3IhbJmr/DmM8tSlqeFTKRGdMmC1rbWATwmtyhGBN7pXx/MWYXPzpuMfksuVkT3aum6Q+ExXLdp1YRICUS6JqCvzO1Sa7mcbnOC9/H/tHLjFpZbx+dH027Z0yP+VbznPeDZdjwirYPEBXpkyzSjPv+cSciSysWwtBUOlMdtqcI14rLNS1nKMU1BQopUy9duZrTpC6MNbXkh7J5AidTmwBj7+m1f0BkBJTJxACyE282L6OTYYe9MPDd7NTvnQr7PTBPCf404wcKPsOKeZrZWORUvFwVt0wG/NbIBLXi4uQ/LJ05X2OHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVdLeWVFTHlsK2E3T3NrbjBvSUo3SDRQcUs5YWRKL0FiUCtXRDNnV1FXNDIz?=
 =?utf-8?B?RS9Dc3JtM0NtbEhVdE01bWpZWEE2c2JLRmdMUkQ2VTAyelpLWkhmcURiTW1m?=
 =?utf-8?B?cnFlVXJYWnZDKzExRTRLUDl2T3VwYkxZWFpVSzBlVzhMcXU2d1JrK0YyUUF3?=
 =?utf-8?B?UU5icEtyeXRPZUppdzMrU25ZVXBrSDRKbnRGcVRpeFRqdDYxNGdtY3hYa0Uv?=
 =?utf-8?B?RjluNjFndkJxdG5vQTdicGFBS1VwOGlpUDNCamtxUXFPbjlNemlCSGFsazVO?=
 =?utf-8?B?am5GUWdwZXF2Vjh6Q1F4SUZWUDd1Zkp3VEx2cjhBaUduQzZlb0x2dHVEUDU3?=
 =?utf-8?B?aUlqUG83WlpQNVhVVGhOMmZONE50T0MzZmNIK3hwYjZxUHhWelZ5Tnh5K2Q3?=
 =?utf-8?B?YWRSMEZHQ01wb3RIWTQ5K3dQcVdYZTVHTWFUbW9xN0I1R3NvZmlZM0x6cWYy?=
 =?utf-8?B?QjhhWkR2S1gwM2tQeVViRW9rT2xqc3AvR25ES3FrRkVEUWtVZkdObXgxUkFM?=
 =?utf-8?B?MDJ2WUxGVWNPSGw1SzR6cVM2dVg3SVlEbDkybVl0OElLUUpRaDBVTTR0UU5U?=
 =?utf-8?B?dldwTUhldG44ZWlIRG9SMEs4SWtWMHc5Z3VlVTUyQU5PbEdtdEE3bCtmMi9l?=
 =?utf-8?B?eFY4L2c0ZzJHWHp5N21oamVJQ3dockhINWxYa09ZenhqRStZKzlFbjZHSjEr?=
 =?utf-8?B?R0FRdXN1RFdRQVVlZWozR00wVDFNZkYxbllkUlVhUkcvV043aVBVRUpUY2Jw?=
 =?utf-8?B?QTdtWm1yYy9SdTl2UXZWcURVd25GN0FBRmIyZzd5N1V0N3FjT2JOS2UwZ084?=
 =?utf-8?B?WkdYMnEwNXJaYU4rNFhMRGNWYlExekkrdlRjTnVWZFEvYmNiZisweE0yM1dk?=
 =?utf-8?B?NlJzSHZvdi9wQmR6dnl6ZjlOcWZuUjVNOUNDQ01XVTMwZmNISDU0ekJlQzdk?=
 =?utf-8?B?QzFUQW5QVGcvN0E3SndpVEdzVmRNSi9CNkhmOTYxMGkxVVpCY3N3TW02emJJ?=
 =?utf-8?B?NzJaVDBOSGo3VlU5YmNOeTZTSjR3RkUrKzVPVFR6allyOGhLK213NDEyRnZy?=
 =?utf-8?B?WlNSREtQVjhHcHdqMmszZEpYcGxBdmVoZE5aK3dZTnlVa3pGNThrOVpEMlBY?=
 =?utf-8?B?aVBLYVlySytoaUdNRjNER1c1WmhJeWRUdUhvSEZhY3VtVDA0RG9UK2VaSk5k?=
 =?utf-8?B?UDl0VHo4OGk1bXV3anJDRGNrR0JQOUFIL2lVQzBlNGdiMmhQNUJuSjFXMjd4?=
 =?utf-8?B?Q3ZBQVBHck5mT3dxMm92and4VitaK2VGblFCQ2J3aHl3SytTNVBOYzlFQW5W?=
 =?utf-8?B?b3UxTitrazNtWGFOSHhyOEJrNUJqNitUSTRMVG1pcXNOUjN4MmFsVHdDbG9r?=
 =?utf-8?B?emNuS1BhSWhpdGRJaUVYNEZDamQ4YkZLckh2aGxYazVnM1RCa3RRZHMyOHZi?=
 =?utf-8?B?TXJ1aTVNbHRReWwrd2tIOVo3a0lMdi84TUdUNlVDV1dRVC9ZRjgzYko0QnhT?=
 =?utf-8?B?dHg3UElwRlgycWtScDJ1TURQcENRTDFUdkhxYXprd0t1ZTF5cW1oWCtLRGdE?=
 =?utf-8?B?ZEF1MytoZ0o1MjFRdVpHa0dVaDlRc2tRS1NIQXpFRzNRSnVKR0creG14TmpX?=
 =?utf-8?B?MFpDaUppUjNEZlNEN1gvRzJDbkpySGV2clArLzc5OXYzQkd3UmYrbUZtUnhG?=
 =?utf-8?B?clgxMGhZc3R3dnQ0Y1p2U2UzaEpybWxMMHJ1TDZaL0NnNDhFeFVKYW5hYy9i?=
 =?utf-8?B?RHFkOGh2UGlSZ3UrYjFwYXBNUmQ4Vmwwc0M5eEsyMFltQkJjSERhVFU5MnpG?=
 =?utf-8?B?b1crL3IxSlJlc29XVit1UkZndTFRRlorQ2V4L21yQ2RIZEt4VG8vZDdLZUtC?=
 =?utf-8?B?Rkd3bjBxOEc3dFNsbWRLVzQvZU5hVDF5QXMyWU9RZDd2N0Ezb2NTVGttbFdX?=
 =?utf-8?B?Y1dZeGtMWFRMM3FLczZUQ0lYS2I5clNXWFFtS3c4L3BHTFZvU2M1Y1hxWmdR?=
 =?utf-8?B?VERKWEpJeExMTUNWSThCWWg4RW5QbldJZkhEZGpSWnJZNTJwL21LSTRKV1Jh?=
 =?utf-8?B?TDlBS1M5R2hSdHMrMnRuQklHZnRhV2ZjdXNNaFZoaWZ0Zk9UT1d0NGxYWjND?=
 =?utf-8?B?ZmZ6UUdzRUpGYmJ4T3hYSm1xYStIajliUVN0U2luaHFYeEJvQ2JrV2lXYlFU?=
 =?utf-8?B?RHVZNzRMTkFoT1pMV05SY1YrTUFzbEEveXIvK2dLb2RJd0hjVzl3RXZIWkk0?=
 =?utf-8?B?ZjA2VkJPQ29SaExKQ09Hc0VZaWZjRldod1Q0bmJQcm5RNldDdm40bEhtRDlU?=
 =?utf-8?B?MjhrTnNHeTEyYzdIVUlQR2JYbnZtZzBwSUcvdkIxN0YreFl0YmdaRVpHejk4?=
 =?utf-8?Q?MvE/KG+kqj0E7Tj+imn3xt7qYBLKuqhRYXxmtclhjsVDx?=
X-MS-Exchange-AntiSpam-MessageData-1: 14v/5MYzHpegYQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf867943-ec36-4e2f-ffb1-08de7d7e855b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 01:52:29.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PMgoMkxbw3EF0i8YJYSKLhLKbuZAWtrfm+Z5GvCXaiqJJ1ycprZZPUHn4zQSj8tvPk8o2N8x0IHbEpSh4ODotA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838
Message-ID-Hash: X4PRTLI7F5LPLSDKDMPMCWMKMYACXIOT
X-Message-ID-Hash: X4PRTLI7F5LPLSDKDMPMCWMKMYACXIOT
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X4PRTLI7F5LPLSDKDMPMCWMKMYACXIOT/>
Archived-At: 
 <https://lore.freedesktop.org/DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
>       gpu: nova-core: create falcon firmware DMA objects lazily
[acourbot@nvidia.com: add TODO item to switch back to a coherent
allocation when it becomes convenient to do so.]
>       gpu: nova-core: falcon: add constant for memory block alignment
>       gpu: nova-core: falcon: rename load parameters to reflect DMA depen=
dency
[acourbot@nvidia.com: fixup order of import items.]
>       gpu: nova-core: falcon: remove FalconFirmware's dependency on Falco=
nDmaLoadable
>       gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>       gpu: nova-core: falcon: remove unwarranted safety check in dma_load
>       gpu: nova-core: make Chipset::arch() const
>       gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>       gpu: nova-core: add PIO support for loading firmware images
>       gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

All the above pushed to drm-rust-next, thanks!

>       gpu: nova-core: firmware: add comments to justify v3 header values
>       gpu: nova-core: firmware: fix and explain v2 header offsets computa=
tions

These two not pushed yet as they were introduced late and are still
pending proper review.
