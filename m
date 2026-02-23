Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA916E8384D
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 03:36:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72DB610E20A;
	Mon, 23 Feb 2026 03:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A05Nwala";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 467864348D;
	Mon, 23 Feb 2026 03:26:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771817179;
 b=ruWCUctIRLzLmQsXBnNmeK15nuHHBG0XpXPPe7aM8FJ4X4Exog+ynZ6IU8CTHczrICtcC
 bsd/xZX838IodaUIBLpeMjCOvObxQqVBKrycCHLanYKf5HkemaGec7DUltsPLrNcWQzJK0n
 rG51VDuw8LU6QFPj0kFl/hFI5snMGlXKfdbbJlHzX3T0fb5t52c/avSYeXsdbKqeveUfQ06
 WBrd2Osu1M2YQac2jQ5Xb1jwd+/aAMhfk+4te20pF0kOms7B78nSq+ggeKRTBdbfKJFU7hi
 +Ap9Hec73ZwjH+MQ6C/jtAa5ckgjMvdiTnK7cFdsA42uuobO53rkBK1Rdi9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771817179; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V1fxmfR1tKDMoO4m5N/drKklp8m+vhRA3Qunf/olnQc=;
 b=HtsBpO2LWlmOSW638Ko/X5GmyGUOgd0YW1AiQdK06lr001OuRXvcnp9UaM34av6grRInm
 ppjLE43Y1kfV/mFFwNVNzZyE+tjk8bdDqGgWLbKC1Z8HL2ygS9SCvSMS7zvV14vKOZ+vL27
 VI96TroE7DkouhoHVe+omGCDuSI4utRu5fKcaf2y/tODg7G4YtxYGLgv8sCY+UOgB0KPZ2l
 lk4NwJkRDIrf7p/Pe+IMsPo9fwjAc0hkti4b6Ro4gFlSsSiu8jDY1JlzSXr8p10zcjbF9qQ
 TQvymIl7nxckyNQlLFhTM1kVQ0Mje2q3IZn7Xs3KctWnwWuW3jaYAWpcUpMw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9531A40371
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 03:26:16 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 911BB10E129
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 03:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jubhbsGkxY6vhoixMypJ8aHZyQrHJ0qlHZPoX+AOYE5XQkVuaKWB7EwumEW952IthbrjAbYr5Nu2rtLjneWNP7u7Nc5hacmSwY/tpioeTt72R8B1UQ7WCV9nEeeWKVTJQvLPO4poJ6VEWzytKfJrWAkO0xjqVBbR0qgj5lP04NTfWl1LEqo+uf8eA0SkJyD5DzZ3HtH/ctRG9nxh2kSqnAMaAcRnxpH36bwOTADByRn/32whRJ39fiKi6raiVQsWyjhRPkZGAsOm+n65WtKkjsc/Qjx9Ddasqx4aIsCLcDn/x/+UHrI8ALnBiSmqrPwB9JlutWsVnlVx3qQ8QiavFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1fxmfR1tKDMoO4m5N/drKklp8m+vhRA3Qunf/olnQc=;
 b=I1UCHYzd+fm5RiiSrBGr1BfO+CQF7rS0HfSKr1/S5getSZNNsr/iVHYGr4M2eJX4ES/G1mde8hxZOthBAgfSuWUmHqO2+ONl9i6n8wjD7ZD9/K0uWzssM17ioT+bcMCVJlMKU1ZdhoQoNOpKUYszM0lJGUfyFS71TjE2QMMU+dUcykfbmc//ttyfTxaGZ6Lch4mG+Dwc/WynOS23DuNqFnIBnJE+YVslqJK8aYuo73FXzZqdNL0uw1UqN2zGveqW81SAXVJTxIbNyG7bIO5CwEf+/ey8TH33wJ3+Qq8qyw6njG2lg3EOsJLaeTfU9SwLcpQSvce67ohopDmkwfgwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1fxmfR1tKDMoO4m5N/drKklp8m+vhRA3Qunf/olnQc=;
 b=A05NwalaZdER4Kpi6mK9V0xic0H+ojM0xZB9h56B+wXqI+AAZlVAvkPt9EweHgrdR50BTKlAxsIKN2PDpydJhbqVjSqz9P98RcMPsyGiNV6MG1gMKO3byRvsPqOgP0mgkFYZDuSU7VBzF/xAGZqQZWCBFbVDezjzhkx1d6s24MwpVYRMPLwTWwD+nX8JO84SsAV9pEihSR9+vuApuyHc7ZLAIrlaOaqbO3WshwKJEvMir8ZNj2LzVrisASrzjUMQ7otoi/RexEju9rHpifPzuBzvN0pQJEQJsjaOGERXs7stus2RMUTBif4qKhdqsHrPj/bDEn2ApuagSKqPvnpuFg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:36:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:36:12 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:36:04 +0900
Message-Id: <DGM0Z80HOGAW.3354TIMRJ22N@nvidia.com>
Subject: Re: Tegra notes for Nova: [PATCH v4 18/33] gpu: nova-core:
 Hopper/Blackwell: add FSP message infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-19-jhubbard@nvidia.com>
 <DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org>
 <2ecea7db-814b-40d6-847e-7fc12421f36a@nvidia.com>
In-Reply-To: <2ecea7db-814b-40d6-847e-7fc12421f36a@nvidia.com>
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: d7461ffe-0670-41c7-f31d-08de728cb002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjFERnVVTDZxNzhTQmN2S0NBVHgvWXNNakI2Q1d5QmlxNzZQU2VsQ3NqYXRG?=
 =?utf-8?B?dklBOEVPOUJaNisvRzdTMTJnVnRTNE44ajF1eDgzTkN4N21JMm1nN3p6SHdM?=
 =?utf-8?B?dDRZWmlQbWNDTWcvYjQ5YktSY3NJWXY1ajlpbTlkc2NwdXpjOGdtMngwYVZX?=
 =?utf-8?B?RG1tZVRBL0Q4bi9WemdlRWxReDRPekpraDF2R2VPL0RIYitZaG41UG1PaFFN?=
 =?utf-8?B?L0xXM2lrK2MzdzJEVXFUSEt0RDlndUNsK2gwZ3I0V2ZieHVWSGs1b0pXOXJ6?=
 =?utf-8?B?djhScDNibHdBQzFLNzl0akpsN0xlTEJLYXY3Z2s1SklwSnBPd1NxWTFFYXpE?=
 =?utf-8?B?WjFCdWFkV1JHWTd2clZlT1Z2NnFud3I5c0tGc1VhTE04WVVyMDBmVDhrSmQy?=
 =?utf-8?B?UHZIQy81clJ3WmFuanQ2UStTRmlqV3RrZ0ZpQnBuYVU3RjdVcEdvWVgwQUNx?=
 =?utf-8?B?OWdmZ2wrUjZWRE5UMy82empXMVdJY2RhUWJwcncrRVJ4bDBXK0VaVEt6YmVu?=
 =?utf-8?B?K1puWm04WXZReFU0TWF3NE9zd3J6aXNvNVo0SEhubWFKdkcxM0tTakw4bnhp?=
 =?utf-8?B?S2Q4MDZZVHJlZG1CT2VtYmZtbis1c2NvdnZVSXhkSnR0NWMzZ1VOZzV5TitX?=
 =?utf-8?B?VmxFRjRTTVVXZ2RRQ2J3U0Nuckd2QW9waHpuUUNyYXEwWWZ5dUtINU9OQnZw?=
 =?utf-8?B?cEJjbGt3dERvblNpdGZDWDhhMk5aZmxSZGRyZVd1MTJuUkxCdUYrRHU5MVdX?=
 =?utf-8?B?Qi9taU5KTCtxVTNiVXREajh1SkJNYkRMUzhuYXhmYTc0ViszeHN1TW0vZmtm?=
 =?utf-8?B?aTg4Y3kyZUxHU2tGRVZFLzhpODV5QnkvdWtnSEdrZ1ltNXlieU01VlRPYXdX?=
 =?utf-8?B?ak5mUlgrSnlHVHNWNmY0TkJ3aDdIYjdBSVJUeFJDU3A2UTFDWkU1d0krYUgy?=
 =?utf-8?B?dC9BZUNWNHNEQ2YzaUtBMkVKZFZyWUt4MG16QlI4SUM3UjFqUDJCeVMrR24z?=
 =?utf-8?B?ZGdVTk9oc2dmdzVhSFp3VEVtOUJPM0txUHlLMndqbGdnazdaZ2kyZU9pUmtQ?=
 =?utf-8?B?Y3RRQi9GQTdSTG1xdExFK3Y5MkFEWFh3ekJHdkNKalkrSWdwUXhwekptRTln?=
 =?utf-8?B?Z1JUaWJVZ1RxcUVRYlZ3dzAwSEZoTFBYRks3UmwwWWQ2VjNCdFBTcG1YV0Vn?=
 =?utf-8?B?aGt1N3QxSHo5YnBHOXNhQmg0d0g0Tk50NTRlNWFVeXoySWMyMTdRamRhUVc1?=
 =?utf-8?B?VUwxdHErdTBSRUlOc2crd0szSXRuUVB1eTVWTXIrc1JBc2xUUkRVelcyd3p2?=
 =?utf-8?B?MEVQVjlkL24vSE54OHdNK3BVMm9GYXNCQTBLcEFpVklVbG9OME9Wcjl2T25Z?=
 =?utf-8?B?dDdPOTZZQXRFQVF3WVhlRm93SXlMSEdzSkpJbkg4cGEzZGtXc2pCVXVTeDdT?=
 =?utf-8?B?STd1S05qdkFtK3pGc0ZMdnpiWmg0aDNtbHpDUHNxK2RRM0w4YStXdE1nUWlt?=
 =?utf-8?B?L0E3OTlsR0JqRU5yS21ER2dwNWY3ejRFaFkzVkc4Wk80bFB3SFpGYVBKUTZE?=
 =?utf-8?B?WnVTZWpDTzlJYnJiK0JNbUcyYU5JVXViRmx2M3U0NzZ0SzJmajBEcEp5ZjdP?=
 =?utf-8?B?Nyt6NnppWmdYUkw5OU8zU1dvSWwvOFphMU9lR3ZmSnV6MG1CVGFhWkNWQmVk?=
 =?utf-8?B?QUR2eWZHcUl4dmVPam9uUG9MMnI2YjNkQVdoYWdGR2pkMEI1UnczekQxYUpG?=
 =?utf-8?B?WmxoOERVNmNxZjlBTGxlTmxKVEF1blQwT3UzSXlTU1Irbm5kc1gyeUJZT0Vo?=
 =?utf-8?B?UERjOXA2b3VWTGhHV2g2U3BSUGZ6VWlMcStzbVpNVUszMC9oelRaRGNhbEc4?=
 =?utf-8?B?b0l6a1NzNGZjdDBsUFJWMnhqczFyYzB5R3MxUU1wdVRCQkFZbFVJZGMybHRI?=
 =?utf-8?B?R2pCbGxkQWY4SC9FR3FFVmRnOTlNU2RxY3N6Mi9JajlHeFRFY1hpWEt2Mkhw?=
 =?utf-8?B?ak9UaU5ycDI5VzlWejVRL1VTZXlFQkVhUndiWHRzT2l4YmpwaFd1d1VQclZt?=
 =?utf-8?B?QkpRZVd2TkdCVGVUVVZYWnM1UVFTNTJvZUtmdXk5WXJMSmJMN3lCelIzUklU?=
 =?utf-8?Q?KJms=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Qi8zNC9EYUZOeDQraUR5MFZqVE9ZRHdzWE5SOU5TTXBsU1U0clg1SURveTJT?=
 =?utf-8?B?TnJqYzZINytpMklINTJhSUY4VXFrOXRUTmptSUJrZFVVb1RudXViUE5BZ2JJ?=
 =?utf-8?B?ZzlIWmlXcGlsV1NuTlQxMkdRZm14dFpBeHEyRlNqbUc3b2NObUtuUzhLN3pn?=
 =?utf-8?B?ZmVmYi9sMEp4bVlNVHRtQjIyQ0hhQWFVNHlqTEF0THIwVzdsK0lqTEpETGxT?=
 =?utf-8?B?NlorWVNwQW1DMGEyWWdxRmNNUHRlc2pjU3dTWDUwZGNjQVhJOW80U1pneldo?=
 =?utf-8?B?b3NBcDEzZzFTTU9BbWpZZXhRSGtWbTVGWXNzZWtpWW95MUpLWVoxZElDQ0Zz?=
 =?utf-8?B?TERqdTZ5RjREVEtDUW9KTllIRGdDSk1IZG1MNjBVeUlwUVFUMVU0bGpOanZt?=
 =?utf-8?B?eFMxdzdCYUVzZklvVmVramFMVDcxZTUzekRLZGxvckU4Sk5PajB4ODVxaDlN?=
 =?utf-8?B?NkIrSkdERDZHby9TaUFKamJUakdwL2hpeGhGTHlpOHdSUFM5NGZzdlI4Zk5u?=
 =?utf-8?B?L0tYbUQzSExkc3kvekhwbU5WY3kwVHlMSTVTZEhwdW56WEtlRENFek9PRVRO?=
 =?utf-8?B?WWFicXFnN3ROUS9UUmk4c2N0WDZ1Q2dVb3RvajhRNWZMZW1MSHhhaWE3TGJu?=
 =?utf-8?B?VzZweGpCMm9qSEFhTnMwemNpWWNkRi9vUC8ydDZIQldRQXlXZERNb0Z2dVJY?=
 =?utf-8?B?Q2xLYXUvcXBqQXFpV1lyS0ZpMkU4QXJRTjNsUCtiM3p4Y1EwdUFwVjlkUkgr?=
 =?utf-8?B?Z29ROHl6VzMvRmgyc0IyOEg0WVA1THFNVzhjK1dVYzRXWTY3UGQzZUk3YkI3?=
 =?utf-8?B?ZlVUeEdhN0xvUU1YZ25oS3Q4cGJObkhlOGIyWGJ2M3UybENyb0cvQ0tqcFM1?=
 =?utf-8?B?Sm1NS28wUmlPRmZma09pZTI3dGhqcFoxY2xsL2hFbWlNbENOYXQ1bTFsYU5R?=
 =?utf-8?B?MHJoc0Jyd2JTUGJJSXBSak8yTk9oR21pV29jcmNTQ3pWelIvTDVGM1A2cm5H?=
 =?utf-8?B?T0FFbmZBRTZRMVV2SXBaZXpjN1hkVldRZDQrZ0wvVHlwM1dDNkJVbWhja3JC?=
 =?utf-8?B?czY5K01aa1lndDZkeGlRbTlVaCtXeW9hOHZxaHFkQzMvWTRyRDlUNDVCYkhk?=
 =?utf-8?B?SStlM3pSa01tZzZ6RE9ld0xDWFNkcy85b3ZTb1BNS0F6MWtHcElBdkdOM0Js?=
 =?utf-8?B?UDlmWGR4QkJKWDUrRDArQlpsUVllSjFjSEppZ3NIYWNISkd1eVJieFRoZVdZ?=
 =?utf-8?B?blBzckhURVArUVpZQjV3Tmw3NXcyS0ZUQWwyVDBSL0UxajF1UHZrN3c2OVhk?=
 =?utf-8?B?WlN5V0p3Lzl6TTkvN3ZrTlhWRmhxNTg3SkRQSjZWOGNtYW5INHdRajk2RVla?=
 =?utf-8?B?ME02Q1MxaEF1L08wY0dJbHN6QUdydW16SHh2dEYwVE5PR0VPLzB5M2hhbUQ5?=
 =?utf-8?B?YlgrNElRWEo3SmNWdFFZSVlUeHduNFZnVG1vejZCbzFiSnhnNEZPdStlOWk0?=
 =?utf-8?B?dFd5djlEaWZqNlAzT3pqQk1JRllDVStKUEI0QzJHUmdwR2tUaVRsWW5YaDZ2?=
 =?utf-8?B?eVZpdlhaV0d2aDdZTG0vM21VTVNXTlZYclJrNzJ3bnBNcm1MNDN2cTBsNE10?=
 =?utf-8?B?TkttTnJiZW9CVFJqWXIzMmFmWUdzR29VT21oZUtHV0F5bldvVVFWa1VlbjZz?=
 =?utf-8?B?UWVrbU1lb24rLzR5QlBJVDQwcm9VMnFxNjFMeXBHVVFvSzNOYXpEVnZzVkNp?=
 =?utf-8?B?bHp5ZU5weWdNVFB0UmhqZnlhUWVmV25nYWMzVTJ0SE43a3FTbWgwcElpUk5U?=
 =?utf-8?B?RjlPanViT3ZUKzMxalZKVDJnNnRKOGZTUHNsMWNaeHJITStkQkp5Q1RWQzFq?=
 =?utf-8?B?ZHQrQnpydjFQa3N2eVZmRTBHWmtHK2tYKytNUXY1Mm8yWnVPcDNsajBoUTVy?=
 =?utf-8?B?NXdPWVQzUndUTzc4NEY5clNBeFhjQmVWNE1BUXN5V3lPQkQ1OWZ3ekJ4VXd3?=
 =?utf-8?B?dFJRTWw1RGNneVJXUWNDRWYrS0VXNmdoYXJOcHdmK05SWUFSSWt3bERoSlJD?=
 =?utf-8?B?MmMzbjZoUCtOR3pUc0hOM0h4NkpoUThWd0NqTnIva0NiRFB4QUpZWlRmWElP?=
 =?utf-8?B?b2RVSU9GQ2k0L3ZpV2w0UEhENFRDREtuVzB6UnFQUVhvSWN1b2UxM2U4dGVD?=
 =?utf-8?B?S0tCK2ErTWdidUEzdENaM3RISzJ3aXhVVTBuRHpJVW9LZTVPZXlodUNpcWww?=
 =?utf-8?B?T0trZDN1YU42aWlpeUN5L0NlT0tpQTNpanJYOGQyTEJUOXdmQTVlckVsZjZ5?=
 =?utf-8?B?b05QcVhiQU5XejJuZExvK0ZvV0R3Mm04b0JwWXdXY1lNSzRNTlo2WUNtTnIw?=
 =?utf-8?Q?kVLWea3Uy5nFxGvC+BgG98yJPre7kbW1KMqjCt/B9kEah?=
X-MS-Exchange-AntiSpam-MessageData-1: 4YjIkNx5qtroPA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7461ffe-0670-41c7-f31d-08de728cb002
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:36:12.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DxIhCJTdgmFbWunpwDrZC9cwNC22CbiHhsKCBTnb4BPTUsjbTq3hyr+B/4RungG+3S8ZdRzqO90STAoTd0DJkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428
Message-ID-Hash: GWQ6HCYRR73NGRBPVOX2FVZEAUAKCY6C
X-Message-ID-Hash: GWQ6HCYRR73NGRBPVOX2FVZEAUAKCY6C
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GWQ6HCYRR73NGRBPVOX2FVZEAUAKCY6C/>
Archived-At: 
 <https://lore.freedesktop.org/DGM0Z80HOGAW.3354TIMRJ22N@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Feb 21, 2026 at 7:05 AM JST, John Hubbard wrote:
> On 2/17/26 8:28 AM, Danilo Krummrich wrote:
>> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>>> +    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result=
 {
>>> +    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size:=
 usize) -> Result<usize> {
>>=20
>> Just a quick note, since I just reminded myself on this: We should keep =
in mind
>> that at some point we have to replace most (if not all) &Bar0 usages wit=
h
>> &Mmio<SIZE> as nova-core will also support platform devices.
>>=20
>> I think Tegra chips with GSP-based GPU IPs have a compatible register la=
yout,
>> right?
>
> Well...I'd characterize it a little differently. Here are some notes
> from a recent discussion with Tegra, to help shed some light on that:
>
> (+Cc: Vikram Sethi, to keep things accurate.)
>
> Some Tegra chips have a Blackwell iGPU that looks like a PCIe device and
> acts like a PCIe device, and has GSP, just like a dGPU (discrete GPU).
>
> iGPUs don=E2=80=99t have FSP, nor a separate VBIOS, nor even vidmem. So t=
he boot
> sequence for them is different, but only from the first couple of steps
> where SoC root of trust does the work of FSP, and boot skips any vidmem
> related code.
>
> Tegra display is sufficiently different (with several quirky variations
> too) from dGPU that it's an open question whether Nova is even the right
> driver to use for that aspect.

Back in the day (T124/T210), Nouveau was only providing a render node,
with a completely different driver (tegra_drm) driving the display.
Unless the display IP has aligned with that of dGPUs there seems to be
little reason to change that.

Regarding the initial discussion: for layers where the `Bar0`
characterization is not needed, I agree it makes sense to use the lowest
`Io` denominator. We could even consider making that code generic
against `Io`, as it would open the door to things like e.g. emulating
the behavior of some registers for tests that don't require hardware.
Not sure whether we want to go down that path though... :)
