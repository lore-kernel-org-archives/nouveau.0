Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A44EFD8FC3
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 14:54:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E01B510E996;
	Thu, 26 Feb 2026 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rQGmVYff";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FC2544C82;
	Thu, 26 Feb 2026 14:44:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772117064;
 b=Y2TC+Zx2Gk/7nGsEnY6MgOb6rv2/TK3/nqrVXyR7fjr0IatX+gyxSiHDYBNf7MqZwsnqY
 12Awcp8JwbYuD0aXZlAnrJlTVhEY7a91Jt5mjxB9HWGMqvgURN4kneGLw9LWtFNgea985+K
 v6gchTIPyaGdTvDPQGXb7BL5+SvP020FnmbOk4dHozQBS8ivUIiq6chvNqB1cuDLurFgIyT
 XGD+S08w73/JKNzBd1B6mILYQN6xEmeb/cUOwCswDSY7YJkYbZuc/RUkhM+AntyJ9Rao9Z7
 +KjAuW75W+vZ6ZCMM7ZwM6Bnh5pjvSS3SwlvPHol/bb4bzEp9Z5Jo2FhUUVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772117064; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JgdlOc7JbkMdaAeMKZFOUy2YKFh9Ylh3YPw/aVFqQjY=;
 b=RgFXyJ1+KgH71nCmu0j2Dghi+ONqgxcRpMeg9267c2FoOuvhiSe6Uv2PAolmdTvi1UuTf
 FS5dsO2/mvvTM0w/SJvqgxMzFwIjke0qfBGirluAsiTaY6XgU7mqfNUwg19Untm9RKvCzvr
 QftTDbLecKjO+QccOkhHBmHh+D8IKA7/R06Rzcal+BiwWMhTlKByKL0tR1NNHDDbKpBw2/x
 tKarubG4p3xTqlAXhKHay//s+XJo6kG4Roe0J2TVOvpFcajmiV2+37I6ceDIPotZv+lQECl
 /RXPlQiH/oS1atI9wwADB5t0hIn+mg4nDOc5pChnde8/cypRO1lCZbb6Er2w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C1FC4429E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 14:44:22 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0810E97E;
	Thu, 26 Feb 2026 14:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqXcLsDSZPIn1b+O0xbQwqmm3hVLWxtphMVhD/SxawCDIpSvuusZnO/cP2Yq5+QFAHMgwIz0jplpTRM9C/s7Q9rp6R4uu9/9VF/Im6xlKH9wOF1TyC7GVTD9uLIfrVJXJWxv3dwHGQyev2aqlnAEjtqHPGzkkc3WHF4Tg7fL1/OwAfNPZowEC6eC0Vd4/bJZoQbCHBP5Lojgo2ehlb2zK8Y+nbyg7HJK+M3vQRFNffqi8OAdGzmPTsAA7pY5J9zN1TZ3Q2mGV6txS9oW7UxO3Ro5oH/XQvJbdzIKF5FnLNGv4MU09AfXovPq/Rbw4uR0yboyRvhLHgzUFfKQ/55E9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgdlOc7JbkMdaAeMKZFOUy2YKFh9Ylh3YPw/aVFqQjY=;
 b=Ieo5gBvHCb80bTv61406ETS18whF4RDscmULULkNgemqYBeDpN7F4u9pt+UM3jyjk2mMAYUlCsjEFQCL6qf/fn1bkKbvRpZvlJkxEiyTlaIPNGU53QKQISitbMPb0LWFFu8ACAAC3VjZfrAiQ0UsXtzPkZqwVkK/uV9SClM28a4QZfClDU9AbsoMKi46NAxT2uvkQNgU8QBpQ8U9XZUEXpHtaJlXPNDeUMSvU5J3PEFq9EiZ5XmRkQRp1O2WnTUDa8PbAh8qVbSGx3+lEgFODP035fEV7j6oo/07uiUwONLzz/BbOPAg68tRD9IZCPKHTmX3+iEc+T2llQ1GRUX8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgdlOc7JbkMdaAeMKZFOUy2YKFh9Ylh3YPw/aVFqQjY=;
 b=rQGmVYff3MeV+3hF2MFTmxWz9z/uIOP7tLsZtutyqE8AlgZDQt2+BELlN0Fm1aHmqup2RcQysaNRYN6w/3wDdNl+vYPROUrD1SFoeaj7auSo64b1uJCJGvdxsJGKc1tQY56XiLzwMml2Mz2MOgdYnRv4b1wponTjS7y6aJdMi/yI6OXUmfuIFWMUVWDU2nBakYEaV2hlNIT314sXrco5u9bL+skecnHEII6wy8CaifMMQBL8pakY32PlM6LjP36xaY3mdQqPBdtmKksWwksVGTfXwRSmnAI0GXs0BFP4UYpAxwVBF67dwmTb1VpBSET7ctxoMEq8qlv+t9kzLmtBUQ==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 14:54:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:54:23 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 23:50:25 +0900
Subject: [PATCH v2 3/4] gpu: nova-core: gsp: make `Cmdq` a pinned type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-locking-v2-3-c7e16a6d5885@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d41d634-d094-4f29-ab18-08de7546ee2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	Y6htxSd+HEySKcgBnM+dRrdvFZ5QWDAonx7wdDdTRZDelsTVyKZu3jIckhtFhksDjU/3ArC9o5n2rGrNrOOzgs6EZFwyfTytrwUMeabCwo5fT/4GhACluqgFJTJuHDgcxkWOj0y7CReScX6Y4F3RqUlckjKFSGz9quG0ilI1xVrF4XV15xkpDDfVb/5qmE5ZvYZYksuBHEBLjaa+C8Zn0VyVvZC80qNr79I4Ss79uPg+qz3nmTehJ4kzPESeC9h6qALvba6ZNCJZHlBU2o7f7Dy+IahtHUNSTGgbdbVSXE2MzYJ7lcuA8yJDo19DbKq98NwsTE+fAOV8E3jCj0GylI3LFtR/pwd6gi19/OKaZ3H3sNXK8UFaVl5Afxy3l3j+8RK/GMixzDMArqEbU/pjH9kQqkbJaIXlvS4Qs97Jv+QEDBpCamFM3kbxROCXg+5GjrZzjt6jMIj4YnkQ8Gbt9nr9+4Y7qu8GONcrFH6wvKfAWyOVAnIyrGtJiYTXCwR4e69dVCfKTAYiMEPwIrvN+sI7v/h83bfHPwGWNphUKXk2mLu3fHfhjmyIj4MrkXzP64olS996KtxDkkapNXlxxrRs0Wx2m83oES6M8Rs35LyTrliq+Fcze7qgfYj7e7XZh249SCwiIGEZzJMncVT1FPDwK3IgnYlN8g6pIv7/7XPJbK1OZUNJ4UneLmom6keFwbX2ho/K+Wk5hPcGOAUIaV2wM3DRl+/5poZoD0CrPyw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TCs2K1FQYTlmazN0WG5vNlM0ZFp5UkJtdEdBSGE2dTF5WFR0SU9PemVPWVoy?=
 =?utf-8?B?U25NU2VNY1JHMk9LeE04clhuT0dBMkVzY0xYcmNTQUxTb3dXYmFYcWdCK1Ax?=
 =?utf-8?B?dGNGRnNCNm05cGVQbWVmeTJ4bjZDZUN5b2M1MndhdlNWQXU2THpWQUQ4L1Bq?=
 =?utf-8?B?SWtBcVNPMGYyUnMwSVczcWhvNm5IZHV4VzdVaDBSWU9DQ1dZTVFDK3AzM1gx?=
 =?utf-8?B?UjJzYm9oTXU2ZjlqL3dyWVl0U0FhWFBLTjhyYk1rY2hBR3RWU2NJVXpZV2hP?=
 =?utf-8?B?bTlaUFNrZ1JNOExBNlg3ekRHclJHNXhLT05hSGh4eHQ5ZDl4WjRVYjd3Ymxz?=
 =?utf-8?B?WnUvZi80WFljUmt2TG9ZVExZQWtTRTFwK3FNMVhyWTUvSzEzV0VEWEZsaVBt?=
 =?utf-8?B?aXdneC9MQnVKZHlpamtSMFdmcVRWSU8wb2k3ZnRiQm8zZHpxZkdhSEloUFZi?=
 =?utf-8?B?dUQwMFJWbS82YjZVTW1EWTROK1lwaU5GUWN3bno1Wk4ydWhOZEhRUnp2aGFX?=
 =?utf-8?B?a0hxTm83L0JjWVJLclp5bWNtenJVeStoS1NZeXpQWEY2QmVuclJrZjk3K0p0?=
 =?utf-8?B?bzJaT1VBUUZwdjVQYlpKYmVKS2ZOWXpUd2lNeWlMNmVNRW81dDVRZWFrQnB3?=
 =?utf-8?B?aVNRMDh6T1ZpVUN1ckh0R0tYS0pqcmZ1cHpKMC9jdjVHdk40ZyszNWc4bkFy?=
 =?utf-8?B?d0hzS05sRkhzMGlHOEFYME1QRlpWZERUSzRseUk1MjlSbE1SamdGMUJxMWha?=
 =?utf-8?B?Zkw2dWdIUlVqbDNySVhLVTFEbFVzMmc4cFVSM0xLY2c4b3hLVXh4RWFuVzdE?=
 =?utf-8?B?bVpWS0luNDJyYkhlSGhXb2xhRU1MNGpidy9oa1JjbjJ6d0d1ZUtNWTN6TEMr?=
 =?utf-8?B?bmp0aGRDVWZzelNNeVZ2clluVTBGQ0N0S1JlVWdsb0ZWc2RCdjFaQ3M0aXNK?=
 =?utf-8?B?c0xUYllrQ1hBL3FzTWhGSWRtem1JVWl1S2t3Q2hxTVlZanpDd3kwMkdLNTVC?=
 =?utf-8?B?azgyTXdubjBVdlhrc2VtU1l0RlBDcHgxMW5Ea2NDZEQ3V1AyR0xGSlJ1Snd1?=
 =?utf-8?B?ejdleEtWWHpUL2V1bFlUaHBqeTZzUlVsek5nLzlUZzZsZjFkWmZJNlJWY0o5?=
 =?utf-8?B?dVM5dkNSQnk5NGJjN0EvZVBtRXYxQlQ1cDVKZHRHTWF3KzVFVDgyV3lSRXhN?=
 =?utf-8?B?dXQwUFl4bzE3b2FkNjYxcHVFNjd1anl6bzBjcW80cHRFVEFkQkhiMzhZalc4?=
 =?utf-8?B?S3YzUzQ1OGdvTFF0UDc4ZWwrWUw1M3ZONTl0NEQwZVJBQ21lSmtXRmtwcy96?=
 =?utf-8?B?aS9ZMkdSSHNqWE1PQzFqWUY1dmkzT1hsMEpQVzEyOGhjczNKcFZwYnZpbko1?=
 =?utf-8?B?bkZkZFhFRHdBMzYxYXJLczdFbCsvZnVtYTZMUUZSVFNXQVBxc256dXhXV3U5?=
 =?utf-8?B?a3phc2w5NmozdVFwSjhSdE5NUzlTdnhoL3k2Y0N1Q0kxb3J1MWFxbTQxYnpS?=
 =?utf-8?B?bzZadXhTS2tJTWJOMTkyWnR5ZTZVS0tWc3hMb24zQk5QcFBUeVltZjdWT1E2?=
 =?utf-8?B?Zis4UlpjdlBxQ1UxMUFVbGRlUFB4TWMvS24zd1R2WDNjOU51QTdJMmc4ODZ1?=
 =?utf-8?B?U0FHNlMyclptSGdwY1Z6dVJGZUpvVTBHdm51d2JxSHE0aHdBNWxadldaZ3Bn?=
 =?utf-8?B?UmtXcFNpSnUwT0FUZ3B4M1ZmTEtsWjU2OEN6d3A0eDNLckNTTnVXc0hNK1dZ?=
 =?utf-8?B?RFlJZnhueG9XQmNraGZTc09WeEprTndKM2htUnZ3MjVlUXNhVGltdG02U2No?=
 =?utf-8?B?SlBqeXlvMHlZNWtCYnZwOEx2YWQ0SGdZcmxkN25QbEtLay9iSHQ0cDUzdjdm?=
 =?utf-8?B?ZUlUK3F0RWFueXY4bk9zQkdndVgyUWVFdk00anBZVHJLa0pzdCt5YTBEemJY?=
 =?utf-8?B?RHZLTmFxYWRoK3lnd1V6cDJkQUQ0N3RqSFJHZThVMjR3WFpIK2VmeFh2NmhG?=
 =?utf-8?B?QXlnZWRPaFAzc1ZSY3ZZT2F3SmFacERXV0tXSFpwQXE0SnQ1MzlmK25UT015?=
 =?utf-8?B?SlZ5TU5pUW9iSHdPMkpKeWozbzRxRUVYSm1TOC82SVNWRDlnOU91S2thNXVE?=
 =?utf-8?B?THdvR0Y0RW9lM2NRRGhrUjVXOUs4RWNZdWVmYWN4bGdOUXJqMSthMFpKeFlX?=
 =?utf-8?B?aFNPVHlDeVUzZi9pQU1DR0tZUmxGbWQyM2l5djh3TjBOdTkwWE5rMFdxUGFN?=
 =?utf-8?B?dzRFTWxzUUpjNHVzUjZvNWJRbUViK0dJYzk2VW5TTWRrSU93bXJxSE5HdktJ?=
 =?utf-8?B?VkN4ejhGOHBrWjhwd0xKdDlFbmc5UkgxK2czVWxDVEFGWkh0NWFUSFg4YlhP?=
 =?utf-8?Q?6M6InyVhgEXhX8wQQ5M2LFebqdn93JAWADnV6H5LFkFCM?=
X-MS-Exchange-AntiSpam-MessageData-1: BkIuAp73Kgg+kA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d41d634-d094-4f29-ab18-08de7546ee2b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:54:23.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lm0U85bTeqrRcCPEZWUnII1W5YoqTqSZbsQasD2zNK5dxsgZ7CQf8iL96ZdufrSxNSvAjXqchFyArVsVjUxmTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
Message-ID-Hash: 3J2B65D3ILJFHGZNSDR4HATHZYET6Z66
X-Message-ID-Hash: 3J2B65D3ILJFHGZNSDR4HATHZYET6Z66
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3J2B65D3ILJFHGZNSDR4HATHZYET6Z66/>
Archived-At: 
 <https://lore.freedesktop.org/20260226-cmdq-locking-v2-3-c7e16a6d5885@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
to add locking to `Cmdq`.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 5 +++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..a6f3918c20b1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -112,6 +112,7 @@ pub(crate) struct Gsp {
     /// RM log buffer.
     logrm: LogBuffer,
     /// Command queue.
+    #[pin]
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
     rmargs: CoherentAllocation<GspArgumentsPadded>,
@@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 loginit: LogBuffer::new(dev)?,
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
-                cmdq: Cmdq::new(dev)?,
+                cmdq <- Cmdq::new(dev),
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
                     1,
@@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(&cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index daf3e1d153d4..6bb1decd2af5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -474,6 +474,7 @@ pub(crate) fn command_size<M>(command: &M) -> usize
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
 /// area.
+#[pin_data]
 pub(crate) struct Cmdq {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
@@ -501,13 +502,11 @@ impl Cmdq {
     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
 
     /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
-        let gsp_mem = DmaGspMem::new(dev)?;
-
-        Ok(Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            gsp_mem: DmaGspMem::new(dev)?,
             dev: dev.into(),
             seq: 0,
-            gsp_mem,
         })
     }
 

-- 
2.53.0

