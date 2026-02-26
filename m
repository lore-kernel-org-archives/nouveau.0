Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C194FFD4612
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 04:18:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27A0710E86B;
	Thu, 26 Feb 2026 04:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X3NzgKE4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 328DF44C5F;
	Thu, 26 Feb 2026 04:08:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772078880;
 b=AezivW4yDKcjRtyLhVMpbyVIJ5A3MNR2K9rtEonOVNhjTlQ3XdlUrUJC2uJ/pC+nSqcMn
 tsF8kMbK/G64+U/2HuHpHOq5V9sOn7LlmK5uFDHPLFPMGjZ9VFLKGQFKR10ujSNkNBywy9F
 U4NbOI2US0F1zPWqSH/njRZN4t9uFbFFoKEA8l91hRFU9SFpOx7iEmaVGp0tdg0c2iWQ6gi
 zZD2tNnsZ+wa0uK67klX/zzy0M/Ah5fjDD1EFOOjSyalb72KJ0dboZnwgg2DSe4TUkbo5+/
 EoxekG+mib1Hdswyp2oYq9JASTkLDE0rJAIY/XWRArltpbPXxqdeb35ndAZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772078880; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xie1ChSL5T8bhptm8L+tJh79Q/Y9mFBjP1tPEkiyNDY=;
 b=uWcN5rbMyGzLVy0AZzl9QbYHrtU11Zrn4Zjt/gBRl9HffPSyrl1L+aDlUwa2nL4EjBuL2
 6SJgEhXTuNbwlhl0UBAe2NBY9JjMcG9EdDdUZ10HBAlGuDHME1JzmN6DKfa4wSIMt7raZ3B
 8VN/fL3FtPf/XYgzxSnnfRqensNPyG0PCTBfNyhr0z4uOa1kQ5d22UDjqS5lHu4njjezJyf
 vNkAdK9f2QE4QiULX9a6TtLJtBDx3Xlw56mKTacDd4Z0UhCpKLkBfCDCPquW+C5XIJDJuHP
 SYsovL1j4+CdVbVVSmEfwNB/fmMWOvTJlsLfQAza5lcU/lLmQfA/c8ZFdtxA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BC0C241AF5
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 04:07:57 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5268B10E0C7;
	Thu, 26 Feb 2026 04:18:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRlSTe2IXMIc29a/QkeUT6LdylMOlNV6znWl7Q3YrGgD5CPetUrir450r5nf9ALnDr/gEo1stH5g3OrlfGyO+hla8aqHEbCWGpu7XPKFqSDZ+GSQ5QWKVeA2+wGFgE72ie5xXrmaNVV3zRU59mITmG5WNgBUhY+YckU5pFHiZEpnLxbqOKuEewNruodoBe8qRakfuQs1PLEr8uQ+1GVvEH8TDntHxlx+PosWSnFeJaEWeDbLOBu78uYhFtsUS8P9QSrKJ4rGhycbeULKpSP3nFVYztXcjcJcueJPKTePlMFhSenlUfDHdkntCs/oQq/OMT4HAJF86O/KocTVy6V8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xie1ChSL5T8bhptm8L+tJh79Q/Y9mFBjP1tPEkiyNDY=;
 b=TkBUkFsLOjdOcpxxtlPquA7Jd/G0NJvojrdVyMcLvF2spgqmxTdaFclz++tnsJ728Kn64Nc0fATQn/XhbB+/0jEgjYaoTLj3As3eEpUXQdAe+uvxq/QPxpqWH1FrjaYfKEo50BXwksJ/hKCY/kqWSVEDwcG859dyI1aalm2FkKed/JPZqB16OvtlnwgvJ/LPpg+bCmB10P/mAM/wTumv0Tmm/iZEkbUqprQOgPBugAKaOJrPMQKTfbnxNlPHBAlNLnMaqLAmpYlioGPiOLoqnYIeVQXNbQge3LQfxlPBie38wqM2ziFLqLcc/jNsbOrk/nzveCUFVQUL33skxiyVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xie1ChSL5T8bhptm8L+tJh79Q/Y9mFBjP1tPEkiyNDY=;
 b=X3NzgKE4Uv5eJnCjGxq//coJlzl9N2LJn46SAJCyZFRUV7B845cmL555U1Vs5+ORTMbSpJKWYECtpZ98JfvTi40uUswAJv8XKF+wt8e/Basqeq+sPLpb7+PSSkvqK97vsary9v6YRBmP7A9xLrO4CAH8IP85Dr4J5m+CqJPqScfATXa6Hh1vytRMmCWbQDBhrZ+9Utp+6O5IBt5Rf5IZEaljZdda2RRJbnczFvSBoz8v2xkmq/5plVoLLlYcXWo6lwUOlwSt/+FmWYAB5N8QcZ7fPDti/nFtcdQUWSgm01sohbiLjRh9v3aaokj0mVoitVfiR2zKsB1my0luiXE6Sw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 26 Feb
 2026 04:17:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:17:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 13:17:55 +0900
Message-Id: <DGOLQWILHHNV.22GENODC504I8@nvidia.com>
Subject: Re: [PATCH v2 0/9] gpu: nova-core: gsp: add continuation record
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8c94fb-0deb-44ec-7b0e-08de74ee0636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	K3X+f22EKOSSTpLgXCPAU/piOdaFubGiErCkoxcoc6s/zo6YkYl6hHV/M8czWi7dnYit5OQumqgwJNsVtxUxwUcGTHW4VO0SaOE8FrrrzxnLc+1CAXT6uiBgUbqGM8ZW/K5C/xbatQ60cL4iSMjTVJ3rHacKt18oa/6F3UXWQyQ4/OB7fyaVsycdYPt/WyfqGmU8CfeAmTEHNMvQk/MO11wgE7mIvEid2AMg3RvKa1KFy/n1XeRA2L2TZvJjzUXGW9FNl2TECIjqaSxpp0S95Zqu1cQk2tqz6D95IztGrlNse8mrdLRfjvSpqxe14zODj5nw46nx8Nq89TjZO2rYNxk6IkhlRNxgaakwqPOid3tVUJDVIRROqDeTGFTHytFB21IgE5gUF5kP/KTgq2YM7SGLvOGGNkcDrDjf8P5sHHagqW2LVJVDhYr4uILoEpNbviFHeXKmBKscYx0zHqp4gmZVIq7W0sqwlTMX/kxNkCZ9AWHw90PYdeWF4KmBZRCSrpC3sch4HQh0UhOFa04vTwEtOqkriplBVcdvAY0xHMSTIIysCBIYaZWxRBorjvx33Ie9lirFNGL6pOLr7dyjPI1saJ8KRYADRilhZDZZsau2/Sxy++qVFZLGU6eQ9zxwx5XoIFTw+NLrPVSEbLoNBL2XE0Zql9kdRhV5EivKMz0nxoebVXfFR+6svBkhpfznkOCLW+nScaTbSKb02xPopdH0nKMUYtoa9GRFTO7NxMw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkNURngzWXVDL1NUOHhRUmZFUjJuUGNJME42dVU5OWYwUVk2NlAzMXJjMUh6?=
 =?utf-8?B?Y3hRWXdlTHNMcVJzWW5KTk5uQmE1Mi9iajdCZ2svcUk4Vkg1eDEwaXRScHFB?=
 =?utf-8?B?Z1NMcERiTUF3MTBkcUcrVTdtckh5VU5XNE9FU3Zna0RUMGZmaXowYldtSDNX?=
 =?utf-8?B?R3JVVU5aeVFOQmdMNFljT0tXei93eFdDVmorR3VEZ0lrcFFTTm9MT245eW5X?=
 =?utf-8?B?TmNZMUdxSUd5Tmw5eTNoZ3RyNTJNZnl2LzFvWmxRUXlXYTZhMEtwaDl0UFJa?=
 =?utf-8?B?K3FLMFNhbzVueUJLRVgza0lsSjE2eWM4bDZhRitxR2s0ZHd1RHdVcWN2K1lZ?=
 =?utf-8?B?Y1o5aG5teU1OczZyQWxLU2NEVkdxY01sbHBQRmluZ05FRktJMkthbU03NzRr?=
 =?utf-8?B?NkRXMFZubm5GN24rSkJyUmFKanQrY24yZU1Cb1plc0pIMkZ5TTdEUDgrdGhZ?=
 =?utf-8?B?QWtaNytwWEV5UzE4VEtad3U2QjYyQVZvdkRYSWpLRVAzVFYrcTF6TjhjbkIx?=
 =?utf-8?B?MHVvakpvbHNSYXZBb0xsSC9TN2dZYlc5Z093NnpEblZPY0JiSWp5aUlYSEs3?=
 =?utf-8?B?Nmk4Rm1lSHREbG1WS3FhTklTQTZHUm5FTWdhSVE5eldGMElZeFBLMkVsNnNt?=
 =?utf-8?B?aGJGVGhqYlcxeEEyNmJUVW9oR1Z2eCtFSStTVFJHSUZJNDZVRE9iV3Q5UGJO?=
 =?utf-8?B?WWtmTGV5VnJCRS85VFRJalZtRVcrTmdidjRUemhkWTNlZEtqaGRmNXEvT21s?=
 =?utf-8?B?STZTU2Zzc2twaGxBcmhiR3dmSDlNdVZxOWpOOW40L0lmRUU5RUJaYVc5SkE0?=
 =?utf-8?B?ZS9ndlVFTHJleng3emlsNGl2M0xyUVJDTjU5eHdhRFY0RE4xWGFhMzFVZ2ov?=
 =?utf-8?B?UnNkeWtldVkyZXVsdGVzb3lVWlpGdmRFQ2tRcm5HRUVQak5hMEFIVDlkVnVM?=
 =?utf-8?B?NGlLajdGRXp0TUg0UXBoVTBOT0hNaHZsWTdlRldEcFRRVTRjY3B5bEQyZFBw?=
 =?utf-8?B?VU5xQzVYaTF3emYrTHZXS25LV1RFZFUvRXFQQ2JzWVRMVkU2ZlRXK2RXUVdV?=
 =?utf-8?B?SGc5c0h1ZWcxck4xOE9lTStDSjlYczdsM1o5RmtGeVAwYjh6QjJDMW9ya2xV?=
 =?utf-8?B?Vlh4Z0hTaldWcXA1bW9QdWNGWlp4L2d2bXZaRU53bmJudnVId3ppWnpIWFFo?=
 =?utf-8?B?ZERuU00yanlUY2VaMWRScHl2ODZMQ1NhTDNpZFVGM24yOW1ZeWtSS2NwRStp?=
 =?utf-8?B?dzcvdTZTNkZxY2NpTER1MkNDWGJJY2lRMDNzLzFFUFJrOEgzS2wyWkpTSEln?=
 =?utf-8?B?by9WK2ZWcFVFdGQ0MXROVi8yK2ZYeWhkMmY3RmRmWGtCM0VGelFiQ2Z4UTJM?=
 =?utf-8?B?Z3NuMzFlM0VHYkxxSnd5SloxVWthNk1yUzgvYTlMalRHVkR4cUc5TFJnemQ5?=
 =?utf-8?B?cGZsZ243dnFmcDhqTmtTYS9ZVnErTzY4bGtRR1laYXdnemZSTkVwRm4rM0pn?=
 =?utf-8?B?MFFRVnlkT0pwRm9PV1luUG9HL2tSR3l0QSt0N0syaytFRHJUa1JkdGlzWEs0?=
 =?utf-8?B?UnE3aWFteGU4QStXNm9FNmQxME9aUEU1N0hzb05ndStTbW4xNmk2OHd5a1Q0?=
 =?utf-8?B?ZWFlZTNodzc2Y2Y5c0NuZjRKN0NjeS95NnYvMHB1WWMxOGZYbUtrT2RKWnJz?=
 =?utf-8?B?SWpxRzJpL2MvVFNKMDM0YjM4U2VNZW9jUEM4ZGRGVjU0SGRHM3RHd0lBSmZW?=
 =?utf-8?B?NjRSQ1Z0RUdDVDZMNkhMZ3YyZFB3OWpXUlN1S2g3Q2w3a3V5bFoxTlJDa3d4?=
 =?utf-8?B?TVlxNjZrUDhZODhiUUNwcmVvNnFQSHlSakk3MmdUU2hncVlFRkdWdU1ZOHdx?=
 =?utf-8?B?R0ErRHI0QXJyNXgrdGtLdUw0OU54YkhnMFdmNTJFc2o4UGc4QmE4MWozUzZJ?=
 =?utf-8?B?L2Y0NXFKNHBaMGdkYkNUcGwrS0thbTRyU0cyVWpvbzZBRFZxWitZTFU1cyt5?=
 =?utf-8?B?TkdKdEtIWERhSER3WTl4UUhjd3NySlRIeWwyaHM5OUtFcmQ3SlhQa3RHdXcv?=
 =?utf-8?B?M2txeTA2YUgrNHlvUisxMXNiazhzTkp5WFdXdmtEK2NyaTZERkxQYlVNZFdj?=
 =?utf-8?B?Q3A2SFJCUEZ0L0wxYWl2dk9oQmErbC90Uy8xV1g0eDRSQWRqWE5HeWl4TFJ5?=
 =?utf-8?B?anBMYlJld3A1T0xXQ1d2VFBKT1gyVmlMcHNCY1VoY1hrWWJaWUNtM1hEcVh5?=
 =?utf-8?B?SGk1aS9rOE5zaU5UdEJxUUxVUUxFbHY5dFVQdDJBaVhPcVNYK1ZwM091MHNv?=
 =?utf-8?B?VWhLM2FzZjFsT0JJMU5YUDk5VlA1eTVkS2V1RUdqUWY5R0ZCTkltRTR2akZU?=
 =?utf-8?Q?8CL7cbmrK/vCphCWh7iTiHoeZOTAjyofciwfsGAjeR4hY?=
X-MS-Exchange-AntiSpam-MessageData-1: p5FiOKNiYewosw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac8c94fb-0deb-44ec-7b0e-08de74ee0636
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 04:17:59.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RzCdjgzWFJPrYQJJh51kFTZGOZVb3KkJ23W3jG+1MS810bjXLHXku++HQHnDINdiq4Bu0YUhFY0Pf9cf5ZqwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
Message-ID-Hash: WQ2NNA5DI5X2WETITMI64WXDU3H7XZYD
X-Message-ID-Hash: WQ2NNA5DI5X2WETITMI64WXDU3H7XZYD
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WQ2NNA5DI5X2WETITMI64WXDU3H7XZYD/>
Archived-At: 
 <https://lore.freedesktop.org/DGOLQWILHHNV.22GENODC504I8@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Eliot,

On Thu Feb 19, 2026 at 4:30 PM JST, Eliot Courtney wrote:
> GSP commands over 16 pages need to be sent using "continuation records"
> which essentially means splitting the payload over multiple commands.
>
> This series adds a command type `ContinuationRecord` which just writes
> its header and whatever payload it is given. It also adds types
> `SplitState` and `SplitCommand` which support splitting a large RPC
> into smaller ones while transparently letting regular sized RPCs be sent
> without extra copies.
>
> The send pathway uses `SplitState` to send all commands, but if
> the command fits into 16 pages, it still writes directly into the
> command queue. If it is larger than 16 pages and needs continuation
> records, it writes into a staging buffer, so there is one copy.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Thanks, this looks solid - unfortunately it fails to apply on top of
`drm-rust-next` (not your fault, the patchset was sent before -rc1 got
tagged). Patch 1 has a trivial conflict due to the removal of the
`Display` implementation, but patch 8 does not even give me the option
to resolve anything. Could you rebase on top of `drm-rust-next` and send
a v3? I would like to experiment a bit with patch 8 but cannot do it
unfortunately.
