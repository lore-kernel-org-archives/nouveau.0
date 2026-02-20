Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851AAC531EA
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 01:09:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44CE610E762;
	Fri, 20 Feb 2026 01:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="klgVFUyK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F3BE04022C;
	Fri, 20 Feb 2026 00:59:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771549176;
 b=sNXU7goJMkNEPBHdyZt9sasx1ea1mvDGbQLhNi+zN8A2WEVmNR0SDd0Qyb4Q58OL3d26i
 kuXGF9u8DDEtipnuAsOFGwsCXmf/rcOMkRCnPwJ1uL0ggcHC+btsfLqxUYC4Y5DbkLbLw3k
 i8Z8iKVtkjWhc+nP12sUhM9m73LJIC2EOGypc4VO5KMxybvMH48qlTKLTzcjUar4Veil7oE
 kcvYFa+esHxNgCoD+kBRZW4Tkq9MPHFY4qbFvbEhHCoC3+h+xnRoZYaJ0U6Bn/KMCAUrfPY
 sswoplxIgde+iqOGrzXpXdRlzo5ctoW9PF6OTU2ejbPEARuyrUaUZyZlT9IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771549176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=04mFZPYhzWttCU9mQt0SqLEzT1VqhB8KYEyuxRflweo=;
 b=zVNgtG7tuufyUjrF4lTUYV2Zv5wfkJR4w4Ph7IZSQNcqvzFAOBDIgJzYPO66COQk9SToj
 CiBzvKgY60qZewtglDcvSJIZLO33eAUdJ3Ej/AmWSSMrLcJcvX5BhkUPKPnaP3QFEdzu3np
 TqmUjGgR6JFWjgcdaLuTgCgtP1FMsrO4hGsnNsfuifuQLc1o0hwIgv2RK5NIkKfCUZt0SH8
 HzSmhGC8JgXDZ/Rufr6OXaY6K4hzTBTMaAaayQbPfUl1sF/LDiX03nmRr8PUCOcipYUFqtu
 k4t7w2XKYgjIxbqRwY73PYgo7PZvPPKCdRQ2C09GF5NuobDIOBwLoWuCwspQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 02E7C4022C
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 00:59:34 +0000 (UTC)
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022120.outbound.protection.outlook.com [52.101.96.120])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFB0010E343;
	Fri, 20 Feb 2026 01:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYGGVO8LvP/oRuHNOAbRnCR56fOw141oTA0bnvAbkSZ8UYPbJfsm5MDEwngMh2dsDE/grep8bzM7QlHgtHLRxmWuDHPVRw0n9V6RRokoB3ojdwcCilvn6OMiyXM3F10EQjU6pBbHTNrbtworj4RgGfEcxA5vrOYzScGdESSChbbOgDBynpnYMeCAzROo9fyBEqD/7X8CSKuvZJRsvtcmRBTDQqeCkBCXvacCYSUsS/sa3ls67MXlaYJdbcvSWbwJjP6CWEdq4L5OZv3WxxlZRVpY41Rrj9kupgU44ghGS95e9L8InOtZHD1gCr1l53W4KCi0Fk3n+Vhopcs74ZraOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04mFZPYhzWttCU9mQt0SqLEzT1VqhB8KYEyuxRflweo=;
 b=R1a5D5yYoPW/yULwvYuK22Gw3vnlH/gtoqeitZITXl9lvYhlNJkhf6JkxI+6H9HmJ+TJk5KRwtfwqc8pMH3CxO2SXNxycRnGMzdc+E+5xu6WGYrf+BGXYVMPe8ttawMurgRSR1lwLq/eJJmSSC0XjV+7EQDgcMQeN+rKA5VxZ92WwQQ2+n7jxlffL5yBiyTE5IzJjwfKrpFMV401ilAD6aHDrXNapbMKDBeXm5wuLIm6Iiq+zpHEFIqA6DmgA2b3v46mNNHYIO4+BShUYs5oeMx4v6U9j9Meqj6VJQidxborwAHioTVdXMdsVuZZ91/c4768Wz8ugrigOSuoXPwp/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04mFZPYhzWttCU9mQt0SqLEzT1VqhB8KYEyuxRflweo=;
 b=klgVFUyKeu87fveiuFtQr4j+2BpgMAzLw/ilmNabWuFPvBu5fKKato/IP8Y7J21Ntpo+FMXOplVZ1iLJz4kCVMVwujPIpC5bqeFTPTnnSoDeMt96ycU0zoBgHT0e1OoxupWq+b0XdQHiUuNQTnYYPUZQIXQRDAJaxDt94hjquC0=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7780.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:413::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 01:09:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 01:09:22 +0000
Date: Fri, 20 Feb 2026 01:09:22 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
In-Reply-To: <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Message-ID: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0227.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: e182c470-3223-48be-1dc9-08de701caeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h39gMk87xajuqVnDrr2FqDlUHc+tcH9cvU6IYxpsjrxx3eOUnKp2LlUE9rax?=
 =?us-ascii?Q?1OIFdjnYMITrhl4hkQKKigiXt8Eb6pnoACxx4i8LZ+xpAcf2lD85pyd0Xqae?=
 =?us-ascii?Q?rtTdC8nZB7friaIHBl80VDN9AC+UWONKsPzoUdTTgcETOm5sL0tMFZ8ooDEN?=
 =?us-ascii?Q?04rvkBh+jdyeEO2JSFqVi9Z2/9VzR/GB6mk5mxH6ZAq3yGBY24k/kfJxtm5Q?=
 =?us-ascii?Q?ALYiZpNLgZMOMKEVU1v086QiQ9LZLmSJ2An+LyjdMdkuUzcM1XCxTByz23Ps?=
 =?us-ascii?Q?44gTuWZay9W0sqHnDQXeMOeAtuifYgnRq1o6HxaJnoLy7PI25IrCvy1iZXKJ?=
 =?us-ascii?Q?H9PYYy6iAFNpG8xkB//facyAbgqWLGMp7MWplucpc3ubtMtw6hPP18O1Pl0t?=
 =?us-ascii?Q?JPV68X/HRH8ldwnW/ZS1ya0Zh4d9i8+rAepXirpARUtKxDyvYwKTozoNOiTw?=
 =?us-ascii?Q?6kM0WP5QHD2013RGxP7OjYYpFjLeP1qEpZHyzRgmrICJevdWSkVKmnUmjWn1?=
 =?us-ascii?Q?6IxQEkp1IUwoDpRVHIK9sOsRRFEOZ/+ryEz2iOMrh66IpVt5OXb93dapyTq9?=
 =?us-ascii?Q?/iqa28hCNVga8JOKZjI8OFXPVpJzowN2lEikxcYEzzr2Bq7A3yhJi1F5NmQL?=
 =?us-ascii?Q?8q5QT2fXLRe2uijipHjsUeUCTJTj8+YwBzR8ekrIul8NjQ8+axivSZbz3+YA?=
 =?us-ascii?Q?ZKCdl11huOZ6QKSPN0FscJGFz9muuJ/brX2AKtFFSJEZ6CG+eHDvzco/zqDL?=
 =?us-ascii?Q?eCUrS1LvR0Ki2NYOWWXrJIou0QiTVR1TRDbMFKvkX7/ATPTtZP/GgIoOvG9g?=
 =?us-ascii?Q?A/KgT0IKHLmrLGDRY7fJ4e4ezsH7zAcDAbrKECOhrxON+fgJEEaayH3t6+Xn?=
 =?us-ascii?Q?dA1T7+ght5Sq1+sQRbxv3yJ9vFi9HMiYypH82TkgOgg6GMxeJXrnqS30UR6G?=
 =?us-ascii?Q?e9CIZiaefmxIzSC/+EDixzsYuUh4mTVgOH9K5qVOeo5vokJIt/ql8bhD4d2M?=
 =?us-ascii?Q?ySF0oMqN47mHInGk23o3waWO97rfcuw/OZatT4Z9u5Bb8v5Ah5OKNC+tt3El?=
 =?us-ascii?Q?eCWFssG5uHqZrzqmWAnXy2wxAneztNbJjpqwfFkoThH7bPlHT4AHQkjbyDks?=
 =?us-ascii?Q?WaYfEYB1tk5Ri2SZHVl7SWscOzvqBX5J8ObBu6N/m7zDGhA0uR0bhGk4Epym?=
 =?us-ascii?Q?i6+M0pTldxGe52UiEklOqcVqm2AXADuraepWesJ5a8JMi0XfRIK6gOl2yFsE?=
 =?us-ascii?Q?IJIM7qBkk5WmZZTeukpjuJiNA1RuNbPt2WZncR8MxCEIUl6t0+TxAsYEQ04i?=
 =?us-ascii?Q?MO3jr0waUVWRICWsXPeFlDRxQJW7lAdvIPdKgrSX4/64ytkgoQ5gZ/YlNbKM?=
 =?us-ascii?Q?xqrx6J7LKIdQzyWyFoorn+F8he7iCN3iDToS12C+PZ2hDR1afOTmuesG4IcB?=
 =?us-ascii?Q?RYUqSp2yqcOy8Gsjl7+2BancPRJ8Bd6HXt5SgDvfSalfxEllNLfKxfDxroec?=
 =?us-ascii?Q?Vfbqsi7tqaWKQ8Vz5xSpFRATwHGmv6xQynQ/MdCQHDNtTbDJicGid4sKKjHy?=
 =?us-ascii?Q?YbRnsP3jEg9gicIlrpQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0vyDjoe6jmJnY/4pgvOS4Ueje2u0aBBdOB28bUaScPV7ralxOJIXl6ji9/oZ?=
 =?us-ascii?Q?OUtWxPXlAscG0ykmZ8Lc4DXXEzZpNFtYNTHcWvO5xjqLGX5IIvjOcVKZaYla?=
 =?us-ascii?Q?gfMGkAeobRX/OCP1EaZhyTATZVqILwFDWsQYe7TtdDfHtMl4+cltYM3JK8Mh?=
 =?us-ascii?Q?szY2t1WALEM3ZoR4MRjOvirFYwL//NeTEdN0Usoq7DHM/7dxRU7IQhcyRV4P?=
 =?us-ascii?Q?c5PbQ6Jel+Ev0Bzx8cuwmbmONWXufP9GwLgJIEjSXRoCMz1Eb0YWOsNp338W?=
 =?us-ascii?Q?8hmHNyam3gD3M7p6OAP648LWyAh7uWQremOLGLhmf70rSrwl3fCoZe5EZSTg?=
 =?us-ascii?Q?0Auo8TGxQW9Dqa1e8qxCGIF9i50fF0/Z+y03ZO+T7k3TeouY695tbpOUMWqV?=
 =?us-ascii?Q?ZpMcdbzeb2zaPMe9bzfzzf3YdzUtnZyS8kPanaEdw7hnwiywMxImlv35i9BF?=
 =?us-ascii?Q?5Vppl1T/1ZZO+8QSwMsEecDA8UQJpFUHJEc/DK1gObRTHUe6+2DzQHJE6tQf?=
 =?us-ascii?Q?GQ+6qysUnM0nFAZc79WQ0zSq9fCAfbB9LWEpOaT6jy7mH5DBcRAVe4flCV1T?=
 =?us-ascii?Q?9EtRGXYI5xh33FjQrcRBjoDOEUeuVWls0g25FhIoxuTnpRQ0zkimVBwgP0oI?=
 =?us-ascii?Q?Am5lME2hxnC6JmpDjnZ4imq7FVoCtEcgAsCXEqLMH3d1pDEfKVet6A2VHAgm?=
 =?us-ascii?Q?dd4OLBrzhDvFMh+TSEXKqIPEJy4Vx93hfifCAnMNV14JcYoyR9arYaA/Fjhe?=
 =?us-ascii?Q?cs0BhFd7xDKxcuV4nO/mJMy+EOxaO/cWKHT91apGjSgBv3/9/cMi1r9zOY8c?=
 =?us-ascii?Q?TFPEF7cmBokxtDQrLBrAJIr2rQiJFeFlT+r8ktLj4ilqLvTWZKGfUwlKw1T5?=
 =?us-ascii?Q?f2NuO/sdVNMgKKaAxdZ0SjS9IcO8l7xzgWEa8OVAN+wDm07crIP3gTyzG9r7?=
 =?us-ascii?Q?1dnJFKXUv2jcvb3OdxGxBNIxe5IrgPg0fUXH9kYiF9cjIvWbatndOMkbthNl?=
 =?us-ascii?Q?B0C4s5nb2ZAApyXD3kKni92Sc+n8cPYyKJkUTGdTnMcWVxUXxtLlrBrOgSV8?=
 =?us-ascii?Q?ou0lukvg9mmwnY+iwo5sKb24sKDboxQJjiCahF5GdS6s7EiiFMhsa0YCp8F+?=
 =?us-ascii?Q?k3ECVDn5PP6Fc5/OlMlqqjQy664lJXzfr/yQkKM2YA7lkZ+vpNXEBMwjawK4?=
 =?us-ascii?Q?JCRyrKlmfjacDNw2t+ulosSLEhYAmOtnvFtW1uCCiXFdIcrSlm7/NtkC4aXY?=
 =?us-ascii?Q?Xl5iJuaeq6nrw9wa1BdzwTgjv8qMtglT/Ttp9f4tLXoSJit76prM4GntAglH?=
 =?us-ascii?Q?ue1e0Yfhhg2BSkssIurX0NASs+1BptEQxwbAK9RzX+AW3Q4dcIQSuHcRaA77?=
 =?us-ascii?Q?Yz76vq4UgVuEDt6MX+I1DnCgE9h0f0CDYNgyYgC9kcSEeuemH3UJQPk+W4c5?=
 =?us-ascii?Q?00pxIn9ttbpFJubusSYrPNfDlBUHM0l/8bUFWPnlcd62983/FvmgUMRdZiVG?=
 =?us-ascii?Q?0v3fz5d9SBrBTXmfiD5irvqQ4L0Ccpg6XDal93pMaQAb3D9fFHTSgu+TKSGX?=
 =?us-ascii?Q?kRnvjD5TvMJJT/3dvFGW8ZoB9bxRxx0e1So+x4QYln+F0AoEmwERK7VLpbnn?=
 =?us-ascii?Q?SwP9TXkxdYvp2GU0je7rpEGif7x5Wab0qJMQZWmZfJ/waEP/mR41T8KthFIs?=
 =?us-ascii?Q?vtZwmiXj1poMLzLTaPX4th7y5PDLax6VV4+wPAy57LhGjIhxFW8SRQKq8QXm?=
 =?us-ascii?Q?LFZFSKwwnQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e182c470-3223-48be-1dc9-08de701caeb5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:09:22.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AsO98+O/7GHPEpLyQ9nlgOcH5b58lwyVp9/XJkhlMI7Vmm7qytY2mZww/z6v9QrLBMz1K7+AiH8tjqLns4r+SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7780
Message-ID-Hash: QUBD2CZ5NMODA3FIJF2XR32LFOTHUDQW
X-Message-ID-Hash: QUBD2CZ5NMODA3FIJF2XR32LFOTHUDQW
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QUBD2CZ5NMODA3FIJF2XR32LFOTHUDQW/>
Archived-At: 
 <https://lore.freedesktop.org/4ad9fd6598e2688c88f6ef22c088c683@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026-02-19 16:24, Danilo Krummrich wrote:
> On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>>
>>
>> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>>> +RUST TO C LIST INTERFACES
>>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you want to
>>>> sign up for looking after FFI helper infrastructure in general)?
>>>
>>> Good idea, done.
>>
>> Actually, I am not sure we want to commit to entire RUST FFI infra though its
>> pretty tiny right now. Most of this infra right now is clist, let us start with
>> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIST
>> INTERFACES [RUST]" sections.
> 
> I feel like it makes a bit more sense to have an entry for the entire class of
> "RUST [FFI]" infrastructure.

I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
etc.

I feel that the FFI infra is the core responsibility of the top-level Rust entry,
while specific stuff can be splitted out.

Best,
Gary

> 
> I could imagine that we will find quite some more cases where an FFI abstraction
> layer makes sense; at some point it might even go the other way around.
> 
> Once that happens, I think it would be good to have people looking after
> intermediate FFI layers in general. But it does not have to be you of course.
> 
> Maybe we can create the "RUST [FFI]" entry already with the following
> constraint:
> 
> 	RUST [FFI]
> 	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
> 	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
> 	L:	rust-for-linux@vger.kernel.org
> 	S:	Maintained
> 	F:	rust/kernel/ffi/
