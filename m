Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31830FCA193
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 21:23:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0410E5D2;
	Mon,  9 Mar 2026 21:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sq3ydPWp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C4D8144FD8;
	Mon,  9 Mar 2026 21:12:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773090747;
 b=ZX4Dp2ZZqgcw/Z+qNEgs859bCgDZ91npxFEiHKcVdjr7XxwiwElLETAbnLhBPfSXP99oX
 qiBUsy5CiVLDWDmdv//7c+OZcrj8p5ONUWGzwax7kMxJMpH+BGT/F4pJLHGgymuyie7NOY7
 Y+UZCkVWzLzd8kA2Ij24WUZq83oWShDtkuMO8cRwkhfRdxO63QR8XLiyxSYKv6dWk5SM7NF
 O6pTZJfd7yDEnH8c2vO8pdNOrieKWzQXwF0BpsW+zqxCfxzndEnlh4EAuoJKl/uw0lYPeAY
 l4ZdBzDBa4+G8/BfYsqHx81BR013BCwgtOXmuk/uCH6U0VYIkJ3Ajl2sWdEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773090747; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dFROfkbyTIiMcIXkPbX7uk/GbEcbxyFqlCqUiLoQQKc=;
 b=tkqfgSZGUQwSL9PiUCYcIgSQelKdb+26RBhAUz9PDAPt+G0lStcF4Qshkq4LDz7AXRMzH
 7RYlKc6VU4zfvHrrUAkagcZA9BKJcmB8Ov4xeuj70S9aNlJX+fEEYiyCQ9JolN345ny3Dnr
 +PSiJycugknRcoGR+NRgmsat+E7J5N4SVFsYMHfj9xuH9cmAVWN1u6q573pLviiTA713uD3
 fkf53/sXsOy10JVtMBGO7JQcBeVEeUyFVcDe7aDabxhG7vMu0rndyBjNxUwFNYCDFaQT1JQ
 uAH8fgD+D0geSbVUJr5UGHFEEqURWC+ETf32WvPkbH7F/NQZi4ILNmAkU0NA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C24AB43437
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:12:23 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8763510E5C4;
	Mon,  9 Mar 2026 21:22:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqtHqQHdbpKPxKOui+64gK6xv1E50tKUMUgqrbG5XC4sDnPDd2yR/cKBBAOvAaCdKuU9ZavUs9VkCXzbfqfJm9Lnew7ZgLdASuzSU5hR6Q31l0Qc5bQhEyFGLsZlkNMBqAKA2JFQPEPzz2DHb0Q4asQNBIELF3tTPmk08nd4+6+VDwqMQTsLkniSQ4UyBM52c1CrRhRg5dCxnHOjWQzEsOuYZs2EgkeWTNLIJnul7nq0YEFZHdIaLIOguB/0UKRVEDh7CID0DQmB80g+yEH3wGKY6kYk0a06vwX2VEr2RwTQih5dQOtPpE17Ks7H5o/KOab/A7DrCAj4GtAr/VjzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFROfkbyTIiMcIXkPbX7uk/GbEcbxyFqlCqUiLoQQKc=;
 b=FvBFXWc2LEbqbxJbYiB15i74QIKxh21qWp3yhESyam1VmV+CIdkvnR0x7XZVSxrauLvPkk9USbRRa+tx1G0Cn75dDzw7frjNtg7z/whAa7mRbS4rA+Do8Di6nAbayVdZlomoQ/4G4mUMlQYI/QrVXh4P0wx4zBHWy3qnmSA068LHUdy8/FIsHQUR56Kmv4JCtzPIcR4H1bt2npcW9/0a4WRtVsIOwCPecXPXhjjIkZQPBuaYxuKGJKTpejQ+NEkly4ArEIDlJHKv5CuZPTlEO9eReGjaiK7xtAdiud5lXd8IzLAO+9Usz5mRa8/Hg47tOYnUQe9gnDQEwHDD+mYRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFROfkbyTIiMcIXkPbX7uk/GbEcbxyFqlCqUiLoQQKc=;
 b=Sq3ydPWpF11gvOv7VC2zT4dh03xpBFGLjswH8zh0FbOFuqcov3wDB5iGlzJehS1++SChCqK1RpBQxUMzpnnH6xmujUppdLeZIt5JJ3Ee2eO0uU5NMS94vy/ryEVF+jdZFyLAqDEXzUNqYzGsd+Mh0lLcW9KMftItch712sq8nqC36Oe1PAMdt3IpRYK1oOQM2TvRkqFXHJUxnl5ZdOhG6G1nqcykQp0eMjF6SY9o89xLBbrkbLmLuGDW0uoM5zYzGafMaJfymGWZh5ZEMwHjwL/UUlENgjm8SxWK8exgpiyw/MOg1HDWFEl66bot8GBjSdqWa6HPCWkoR+wCavKMnQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SA1PR12MB6752.namprd12.prod.outlook.com (2603:10b6:806:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:22:47 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 21:22:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
	<airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Index: 
 AQHcrSUU5EX/S9sMckG758uYAhOBAbWmoSaAgAAEZACAAAPgAIAAAzkAgAAIfgCAAAGMAIAAAxeAgAABsAA=
Date: Mon, 9 Mar 2026 21:22:47 +0000
Message-ID: <4378f7149f35eda01faea0e60ec1ff6aece20357.camel@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
	 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
	 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
	 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
	 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
	 <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
	 <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
	 <DGYKAXUZE263.3VQZGY7KJ5FEY@ik.me>
In-Reply-To: <DGYKAXUZE263.3VQZGY7KJ5FEY@ik.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SA1PR12MB6752:EE_
x-ms-office365-filtering-correlation-id: bd7a7239-44c7-41aa-178b-08de7e2202ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 if0Zj80yracnjxp4ty3oNvWkhfddL1aR6M00FnVVW+WHZWLPCf8kDyvPoVYzcPn8ZLDwtAEbMprE23OkNXF7gPM75Yh12V6uAPWFqt6DSegjuZ+7cdy6k9giVnyB7+1iChkUuKypTxp28qUU+V/+QKhXcR6Kr+cYmTHZT5C0HhcCb+Rx3ISJ+pFyr/4Vua6itBkMcrw1gaF82UbVA4BXTYq7Sgc9hnyUo6cyDPymADZccMpISXeO+jCiqvhDDoF8eJqLeYI20BDS3pI3lKG0gN+hixfV4be0USO8O59k6pujSeyCxop3d6k2vFpE0IxRHB036gntH6Q3kQCtVixg+9TaZJM7JbLpgVxSi5sqSxfq1Zfh5AcLdf/8oalCmOGXAbVkBnXi7rDEcTzpevJgVH0qPtHFfrLvDfkj7XNXJY5q1MCURUsYdfa5j5qEN3igOp4ujI/IwklJ2XuMvtO74l5olhFf8bdgCxHvCbh+aM0plVWgBMcFY2vmk6LSknUC2SmnOKkreMU8JObvphpclUPqI97NsvJLv4jX1Yw4Hv6a1cfGAj/q4SlkrQwJqtCrU2KBGSMLzb2TkNOsYNRQ64D4h2BQ0dW8JDYnqvRdwgn79Rs6316g+8xwrB4+z/XjSSMJlGqHl28I9ftJOanNfDMNBGDfVuOdhOrtfodCAcM8jhfcZBmLg8eqOQTMG6laY2abjG+/4dxe5R9uQFcc7zBJszuKXl9TGzY3ikdMRDeJVdnRt+Sb123cfmlFKn1Tqx7u7Yh+6rAqgnRvyMd7epN8NUDPHNQzHHFsxOC0Fnk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bURHZ2VHNDlCUjhzMnN0WGRvMURWa3dIelZidXVOZHREMVVKUUErUkhlbG1s?=
 =?utf-8?B?cE5ZTnFLRGxqWkxUTlh3YTlMQ3FkMmpKRVpoQTJORU93S0pLTE8zYlZzMGI3?=
 =?utf-8?B?TWdFZFJLOGVpTGZUSUVmdTVxRlVBUHZhaDFKenNZR1o4WXZDUm80MEIvd2h2?=
 =?utf-8?B?Q2JxUTQ4WVpUUkJxWUdDSk9mSWZSNW5QdFpCUkp6Ukd4WWtpWmVoZngyRSs3?=
 =?utf-8?B?NmJOYjN3SUdWWkNuSXoxN1NTajN4SmgvNkEwVlBOTGI2ajFnY0RvakRsaTJ2?=
 =?utf-8?B?cGE4STZ6UCtHeVI4dWNwS2hxWjhCaG9CYlNnckJCVGcwMU0yeTBtOTVTTisr?=
 =?utf-8?B?ZUpuQnpFeTArNlk5TmFDM3dEMlhQcjQxT3pENlNtQWlwUTRESG5tNE9WdUth?=
 =?utf-8?B?TDN0QlJvazNzTXplZkg0VC9UYTlLTjRHYzFaZnI3UzdKZ2wyNERiZWNvaXNE?=
 =?utf-8?B?STg1NmVrb1JyY2pNMTVpWUlaMHZPcUNTRkpNY3BReXovRnhlWEpXc244YmN5?=
 =?utf-8?B?MlRoZDRNbDM3VHRBUWtpajBlWEF3STJmUzk0N3d6dGo2dHBRMkRZR3VjQVl3?=
 =?utf-8?B?aFJoT3IwM2lQU0JodG8valIvRE9XdEtwQUxMY0t1N0hMV21heHRXMURjbnI2?=
 =?utf-8?B?aTNKazVMbERJNk96S2pWZlg3TVNKQVRuTTkxWjdDdVp6S0xQNFZSKzNqdGh0?=
 =?utf-8?B?bFlPNlZtOW54OXptUWh2TGREQytsanhXeEJybUY1LzF3T3JIaXB1Nk9PcjlV?=
 =?utf-8?B?MGo5NzBTejB2QUxDUjVURHBrN1VMSG9kVm9OS0JpS2NQNXhsWnl2YnV5SUJ4?=
 =?utf-8?B?OEd6Q0x2SkEzbjZBeHdKaGlNVHh2UDBuNVRyMjh2OGkzUXRtcWlxWXVON1ZP?=
 =?utf-8?B?MFZrQnpqSVBSWldzcXhnWEV3RGdFanRhdHZ0WXY5RlhPWGdCZUZFYTU3NlAr?=
 =?utf-8?B?c2tCR1NzV2lnbEo2dHh2TjJBam9PYlFHdWpGUlk0L0FtdkN1TnF0WmY5MzVY?=
 =?utf-8?B?YVprbUdld05HRDJlbVZ3MllnUUgxZWFuSXhqcnc5UEJNL244aFdBMTlEbGla?=
 =?utf-8?B?bGhNQVppak0yQTlnN2d2Q083clkzamRDOGtnblZoMmhmV0FMV1dGNmNMcUFE?=
 =?utf-8?B?czFoN1JlOEN5bmVNaTBtYW1CUURsOUVNMUZkWC9zZDMybllpQzNpWnhqVkFi?=
 =?utf-8?B?a3dZM25uZGtZQllVbXpYMW02TW9tMThVWkdIeXpBN3M4NWswT3RqU244UmZa?=
 =?utf-8?B?bElyQW5DN3BpVU1DekhVa3loUGs0clcrVHluU3pNQy9iQldnUS8xTyswWGM3?=
 =?utf-8?B?YXVsTTkyZmFqSExtcEtsWXAzL2NzVWVzQzRkdElXZjJPdWErNVpHQnM4d0ZI?=
 =?utf-8?B?R2VUakgvZWs0R2FnczBWcGprN3d6bUd5bzZiS2drOFN3Q3JrdDB3VHAwNEFn?=
 =?utf-8?B?Ym5PZzljVURSS3JYTzBmNDdYQ1IraWs5V2VodmdRaFNwUnVieTlTY1ZjcUMy?=
 =?utf-8?B?dkpOWTBBYXRud28renduMXJBM1ppbmNrQ0tFbWMvNGkxNURZempLQWhGWDBZ?=
 =?utf-8?B?TVlpSkFzUHNodnA4dktnbVk0Qy84V21OTllGdjFocmU4ai9pVnBPU1hQN1VG?=
 =?utf-8?B?bU1TYzNhTExrclo0QjFnMTFGNmU5dlc3NzNRQjZFYmhFc1NzOVRvNHlNT2NL?=
 =?utf-8?B?bmZZMktEaE1tUk02alU0UGlncWpVWnRCQ05tanZ6eklDL2hSUXQ1N3E5VmFR?=
 =?utf-8?B?Q0hBNDlRd2ZpWXlEYWhJb3UvN0p3aDB1eTFNWDk1RHBObFBlc3ZKeUN1Mnpp?=
 =?utf-8?B?TlYrNElUUC92RGd3c3lsTVVYQ1VtZjMycStFd2ZaL3lZbndpaWx1V0d2djQr?=
 =?utf-8?B?U25wcHhrcG1tWFBsamFwR0lMd2ltTktlUHJlYk00SjdiWTNkMDlmRE5TNzFW?=
 =?utf-8?B?V21KMmo2cnBIUmk1VzN3c04xalJqaFYxTC9YRUJhekRsc203NlhCMWtNdDRC?=
 =?utf-8?B?ZWx3VW1KeFhNMTdWcGhaenc1TlgwbEJ3U2gvY2pjODlhY3ZwQ2tUZnBhdGl1?=
 =?utf-8?B?NzcxUTVNcW1HQm1TZk5KSGJzWUlxZ0JjanlYb25DWmdPZnpZZ0dnd3lEcWRz?=
 =?utf-8?B?L2gxZE9lQVNKUHh5QjJXV2hKekdiaVJkTEIrSU5ZQ0V6ZUp1SzdyWHNYN3d5?=
 =?utf-8?B?UENHODg5Tm1Nd0FtQ3BMY0NaVXM5R2tWWGJ0WlhwT2t2eXZucnJ0R0ZpMC9X?=
 =?utf-8?B?TDN5NnROTmpoeEZPWVNPWGF4QkZCMFBYYVdzMFEzdnFGcFB2VGxXR2YycmM3?=
 =?utf-8?B?RjlQekZlZGFaNlJxVjRhT2I3UWNVQW0vMTdOZ0hKR1FsMDVHb2JWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <743DEDA9F06F7643A790FE9C8F6D1DDD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd7a7239-44c7-41aa-178b-08de7e2202ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 21:22:47.6171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 7UNitK+6mjA1ALwO8S9FlG17xo/89sm+JW7QhLA99yP5TYvMXrXsiCb6VqxRWqoYGEWUBu2X77esPai2S3WtDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6752
Message-ID-Hash: AQ46J7PCFILP63QQJMFYM5PU56X2IF7E
X-Message-ID-Hash: AQ46J7PCFILP63QQJMFYM5PU56X2IF7E
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alistair Popple <apopple@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AQ46J7PCFILP63QQJMFYM5PU56X2IF7E/>
Archived-At: 
 <https://lore.freedesktop.org/4378f7149f35eda01faea0e60ec1ff6aece20357.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gTW9uLCAyMDI2LTAzLTA5IGF0IDIyOjE2ICswMTAwLCBFd2FuIENob3J5bnNraSB3cm90ZToN
Cj4gSSBoYWQgdGhpcyBmaWxlIGluc3RhbGxlZCBidXQgSSB0aGluayBJIGJyb2tlIHNvbWV0aGlu
ZyB3aGVuIEkgdXBkYXRlZC4NCj4gSSB0cmllZCB0byByZWRvIG15IGluc3RhbGxhdGlvbiBmcm9t
IHRoZSB0YXJiYWxsIEkgaGFkIGFuZCBub3cgaXQgaXMNCj4gcHJvYmluZywgc28gdGhlIGlzc3Vl
IHdhcyBpbmRlZWQgb24gbXkgc2lkZSB3aXRoIG15IGZpcm13YXJlLg0KPiANCj4gVGhhbmtzIGZv
ciB0cnlpbmcgdGhlIHJlcHJvIGFuZCBzb3JyeSBmb3IgdGhlIGZhbHNlIGFsYXJtLg0KDQpJdCB3
b3VsZCBiZSBnb29kIHRvIGtub3cgZXhhY3RseSBob3cgeW91ciBicm9rZW4gL2xpYi9maXJtd2Fy
ZSBjYXVzZWQgYm9vdGVyLWxvYWQgdG8gZmFpbC4NCg==
