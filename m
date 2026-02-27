Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23202FEFB5E
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 15:37:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EFC4110EBC3;
	Fri, 27 Feb 2026 15:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="vJloCrYX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BFF2044CAF;
	Fri, 27 Feb 2026 15:27:33 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772206053;
 b=UFzTIxk7pYK94Z3O5trUmNn3xDW63lLHWeqpVjt70yxIEKYAsn8V7l0EsE7VWrEgwfkVn
 ieKhcoTNbN67qryfQMA47mVDudLyMieMQHvHv7dHQPYW2oFCD3hwHJpBjY3TLj/luLakkym
 XUlbTr+fJPRF6JIcTqb1EbAdmCcQ6KYFpcQiRtjapFgoK2/PWvE6lx2T4CkCF4/8GM9DT45
 aqC7drI0bHSGmEwlwlQ0VyovfWAtFDgJs0Mv3a7uGk/krhnkR4o4RlbO6NVqRHaNubfQG/F
 h9ygzl1WM8sQ+vPhzaWfOYbWV1r47s6ZKN9BufMm9awY+WsB2qhSUCZsMDAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772206053; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sZFbMEtaTaqAO+91yVAPZ/+DE+MG62C0FNiwMQp7pLw=;
 b=n1illARL5xuJH3D8IBGmGmZnMCebI4rWp2xkuuP52KoVDJ+/AwiXzH2nGYd0kxctQKpym
 IFhYVr/lfmzQG955j+dSIylAYr/An/tEedVxkTRPjpCu/J2hf1Xa01UKK/j1LyxEhExsxb9
 iZM264eeIO2ozFaKZtT9frWg+askmAadgRVfbSztVMZIZ/z+ugb+Ok721vMRqSXuJvtaAC4
 /1HdhCC6QtYp8HAJ8XzcZ3wz09jynbok3CskaOYQP08zf/gv3MTQ9ZGYx/01CJFVQHu9WAw
 b3mk1mhm3/116QHEo9OZEVaD5WzPD61AT/XI7S3H+tXJ+FfS5oZJr7EsQn3g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ACB5741C68
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 15:27:30 +0000 (UTC)
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020133.outbound.protection.outlook.com [52.101.195.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 760D410EBC0
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 15:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXzcsEtUMJVrdPg9RAeljGfZfeVJtF0fZAHmMzH8bfeJfdR250eVSXAaxxHkYKfBolEZxkCHcAutHJCBYc8JLAd5nw89+DVRtlmJ7wuCTrtTWN1s1QulZU/G/BgPCIP3q4RZYI/N2ars/RIUbN9dktMtthsjDCFvcBIchPQfGghLk+vpk58TigV6SQAz9wsenx+7cR9BIUg+yAt1RAPJ+Qwn1/XcWZUlcB5lVlyN/QrWTD/PqQunNUOurX9kLZPk29ELfMSdyunRrxU9yXhN39Slw2VjmWcvTxIRTst0DZx8xYnlrPpD2U4ez0KHPTnnLXxgRAZT4JCldwq04sPiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZFbMEtaTaqAO+91yVAPZ/+DE+MG62C0FNiwMQp7pLw=;
 b=SZWH1RDi5SfSev0wS6cAWam8eiMvNgvWI3FHQRhzVGSo3gOjEdI9T7AptClpX4xrEFLslTUodfF1VNo0l4/Af7jqInkNl8RBFsn/rL03RJ7SQZQjIHkeIoJsZvTyz9VWPjYSb75Gbk0xcFspUbSM3EwM74MZXFMeG85u77VXByhFaMbbhNg8qY/JB34EUCuL01qucCD+UROhmn5dn7aaNYttqB0Bqg9YLK0kDekfeat4VUIlXpcb6a5hhOLgeP50aFXmS1K+T8vv5N6B45GEMLs78zdUQQj8PnlwowCA4+AF2um29fhBmsdhqk1HO0YUPJ+mdUvhhGtK0j1HWZvLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZFbMEtaTaqAO+91yVAPZ/+DE+MG62C0FNiwMQp7pLw=;
 b=vJloCrYX+betU9UcQcTFDrY0A3wuFhnKqaChvXaRVJWQ0gxX/aGAklVrQVNBiRdK9/ssubMUPkvL3aiqhzJieoYB0ukYXpyjbk3y5yOz+sphYLBDKVNV0+JhghZ+SmB7Yx9EBDM7Ehnq//Li9ih3z4Bt5rINJTgfU/UPwlSQNMc=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3526.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 15:37:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:37:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 15:37:31 +0000
Message-Id: <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration
 for multi-GPU systems
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
 <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
In-Reply-To: <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3526:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5c0db3-5e94-4712-3d80-08de76162197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	Pmu1kulBFwZn8lgpdql8StiP/WdWiKhGf1t1V3Qpoi9ha3Cl14Ly/Nn1jgjyHFN6nE5M+w+z/G6NNCU064AiOuXvPNXOHzWkZJLFA2BMEWeIQHcOglUP0PVfaiJuBthv2bt3x0nZMEp7CGkp6BEo99rTarypfqJ8Bs2ZWNsBjmtzZCUrBwYox5XSFKnolH1O3A2L8qgLMagCSlGCXUjmZcCl2FAImNO8HgEdhfsFYAic3BkFEqPAVmdBulNDQ9bOHwbKxSZV3894v/YhxFin6CXoTz2yrYBBth1QPO18fCzRNW8zW76ostQozyfkLSk0U0LjKG1Mzp7nzbz8q0NbE8iW68Pbe4BdYJ3IDmhps7yqTXVb0kjy/RxBH3mEkzc25d+iZQk17zBFUNT2XVgo5TEPEMSIDliy23xJlxyJbyTBB40DWYJKQJKLm2T59SF+vSfNYw6sjbEosC8ei14kuX1v3+TVUjTRQy4dF4WI8hcR+4yMY1tKBoHhwF1nmTgrFF5a3oHRDjKhPjt//s2nvCM0CevowAQ9vXLhU0CGvk16S25IT+xjtNTu6suJZlJoqhvAuACG03UTdZCv7pgZyap7dnLdSAYvbEPuyQXX6WPn+2EHNWfrn5Z0hxTOgTfTeZagpdwNqx+h548WJdi9UXwR0Y0r+5COCCypeAggZY7vRjjdqj2UW7GhN+ag3C9J
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NStyNDhqZHFzc0xCNkpvOGI5eXV2ZDQyQXNyN010TVBmN2VwdXB3a3drdkJI?=
 =?utf-8?B?VEpYQ215Lyt3YVpJS2dTdWJXYnp6cWU4ZlJSNkJHZFFkVW8yYXJkdWRKYlcz?=
 =?utf-8?B?UkRLaGJIeE9oY1VSQmFaOFZocnRyNmtjNVBoYytiMm1FeC85UnpkdkdVNDUv?=
 =?utf-8?B?YkN2WjVCdGRyaklZdUhzTU5INmVHMnE3VE9McWpkb1hHbWJSNE1JMHZyVVk1?=
 =?utf-8?B?VW9rblpObVYxWlRWOU51STZTZDQ0dHoxb2tlU0NRbm82eWpDR1FDUVh6UUJR?=
 =?utf-8?B?VjA4OGpYU1dicmswdjl6NEJSeE1qNWtjQUQwbDlHNE1rZlRvNm9FUlNjZXps?=
 =?utf-8?B?UEJWenNOM29oV2gvQmxXMzVqZFlIbmd2RSsxL2pwSUhZTVQxbkllN0NZQWlp?=
 =?utf-8?B?cERIU21Ta3N4dTMyQ2NIcld3aE1mYy93U3RjZVptbkNEQU9zMkNrODFlblJH?=
 =?utf-8?B?N0grMnhkZmJkeDhFYzRCM1VjemVoNnB2bTh1U0NMWVlDUGRSRFM0WU1Pc3hp?=
 =?utf-8?B?Ti9adlZSTEM2R3BFRktxcVQ0UDkyZnBGWmQyRXc1ZVRYT3hMMnVUMEMzUDJQ?=
 =?utf-8?B?cmhpak5NcUN2Y2NQUDN3OCtNVVZWaG1BK3JaUzd6S2t1V1BlYTBJdGp5Y044?=
 =?utf-8?B?N1N5RjdJeDFxT3dONkdQTnY1MGtZQkhZQVhyTFM1NHhTcml0cGl0cVU5clZB?=
 =?utf-8?B?d2ZYMGE5dWd1ZHh3MWVacnBPdmVJby9kVnhTTjNuQ3paUnZxUmw5MnVHbDYx?=
 =?utf-8?B?TUtOdFQ1RFhkS080a1lPNGc1SnFvRUo4aXZ4eExPT2JUaVRHZGFCa2Irazdx?=
 =?utf-8?B?MHdoL3hCVDNwczRsZVNHeFZpQWtMNnZ1bDNuaCt1bE5SOE5iaHlxWU00Wlcx?=
 =?utf-8?B?Q0NmcTQ5cGdsZFltQWdUcCs1SCtBcDEzNUNUb213V0REZE93ZU4zWWdNMEMw?=
 =?utf-8?B?ODZBMjJ1OWxMR0g0cmIrL0FEYzF2OXNUeCtkZ3pMVjZPb1cvUEtpRGF1QlZT?=
 =?utf-8?B?Kyt1U05XbGYvSndHdXliQStTZnNGQyt3NE4xWFo4OVY4Vjl0SUZYVXZQeGdq?=
 =?utf-8?B?em5RVEVmRzlyRWlvc1F4TXpEWnFYOUFOSlBxb05xL3MxMjEyMmNWUDJycHo4?=
 =?utf-8?B?cEFUamIwYzVWUTVyQ01qc0Rvako2TUpaN2R1ekxzd0JuS1R6U1U1M29WQy9J?=
 =?utf-8?B?WjBta2k1Z2FmenhtVzJwV0pIeEUvTHBlNDNCdVVUWTdJbE1Cb0NjekV2aHdO?=
 =?utf-8?B?OTdqbGg1T0FHdXF2aHZZa2dCWUxmUnEyWFBVdnhLdGY0bnJjUlk2MUxxVVVU?=
 =?utf-8?B?TExEZHdpUG9zWk5keE5Sb01sUGxnUXNJVWdJTUxZdVhkblFadEJoS2plUHVM?=
 =?utf-8?B?ckxjTXV3OXJ6RUEySldEUnNHeFJ1Y013UUhMdkFPRktWbDZYdGI5WGw4N0lM?=
 =?utf-8?B?YW5Ocm5LNlJUQVROakM3cUpzUzdURDhUeWhJSmhicXlod2d0RGVZS1J0alRI?=
 =?utf-8?B?Y3cvd25tVjFUTkZERjdTZFB5aXJmbU9FV1BjOFNKYkc4TkQzRjVBV0YxK3Y0?=
 =?utf-8?B?SGJqUFc5aEF0anNUNVdYWm11WmF3WDNFTzZGMGF3MWdxbUhZN24xemUvZ1RH?=
 =?utf-8?B?RUlIZk1EUy9LRmo0NStOWGNKYzZWWFpPVHM3dnZ2TjFXenBNM0NDVnBlREVn?=
 =?utf-8?B?NWFQYXlGekRZL0RLWkhqN1ZicVl4VXhtc0tFNkd5TWxIVkRlUTlOUzQwRjlJ?=
 =?utf-8?B?MXlqd2xNWTNyUnBVeGh3STZCbWFERWRpUDBic2FiZEFka0dIcWE1QmUxcDNI?=
 =?utf-8?B?NDFIZEd0dVNwcm1MajV3TFA0RzVEdk8wZy9aNjZRQjZEbktoanNaYlExSkt2?=
 =?utf-8?B?SVlHR0hjSWhZOEtKTnVsTU9hdy9hK2dQUHYyTWx0K09DSHJma1U0ZkFoV0xB?=
 =?utf-8?B?WWJ2Z1JqY2VHRkxEOVJGYnRZM25lTGQvcXFMY1VwS0g3eFBjTzduN1Y4TDlE?=
 =?utf-8?B?ei92YVU2cnY2dDI1cTJyejVGazVZM2lnd2RNbG1SRmFyWkY0Vys5amhFTEFG?=
 =?utf-8?B?akgyWWZ5L3JYSmN4dEM3TTAzemljSzVqM3lkUStBV0dkT0J1TDBjb0NlM2RT?=
 =?utf-8?B?ZWZvb1RhbndMMDhUaTRVWitoQU1TS1ZTR0p0bTFlR1AzcVhWcTM2VTVnbFFm?=
 =?utf-8?B?dWd3LzhSRnZuaXZqSm0ybWFWR2VHd1FNRnFDRXNnRmZOZXg3VUJPMGkxaytm?=
 =?utf-8?B?blhTU3crWnQ2d3U2NFgyb1B6dW05R0tDdjJVdlBSRGFibWNBUUdrVG1Fd1Ax?=
 =?utf-8?B?MXR4M1Awa2pmN2UzdjZtMldaTkx2Wkw2UzFEdU1uSkg1bFNyTU5vdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e5c0db3-5e94-4712-3d80-08de76162197
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:37:35.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 68UFiaFdQF0af9f+NSlUKRrMBuRxCp6QYGHTfcgc8wjDwMvvn2yrnearmaQAZlj5GEY15oENRsSwIJGK5DQzeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3526
Message-ID-Hash: JGRUDWQIMVK7XTGZXNDXWDAPZI6PQUIB
X-Message-ID-Hash: JGRUDWQIMVK7XTGZXNDXWDAPZI6PQUIB
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JGRUDWQIMVK7XTGZXNDXWDAPZI6PQUIB/>
Archived-At: 
 <https://lore.freedesktop.org/DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 24, 2026 at 2:47 PM GMT, Danilo Krummrich wrote:
> On 2/21/26 3:09 AM, John Hubbard wrote:
>> The auxiliary device registration was using a hardcoded ID of 0, which
>> caused probe() to fail on multi-GPU systems with:
>>=20
>>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaC=
ore.nova-drm.0'
>>=20
>> Fix this by using an atomic counter to generate unique IDs for each
>> GPU's aux device registration. The TODO item to eventually use XArray
>> for recycling aux device IDs is retained, but for now, this works very
>> nicely.
>>=20
>> This has the side effect of making debugfs[1] work on multi-GPU systems.
>>=20
>> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>>=20
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> Applied to drm-rust-next, thanks!
>
>     [ Use LKMM atomics; inline and slightly reword TODO comment. - Danilo=
 ]

Danilo, can you drop this patch from drm-rust-next?

The patch that is supposed to be queued is
https://lore.kernel.org/rust-for-linux/20260205221758.219192-1-jhubbard@nvi=
dia.com/#t,
which does correctly use LKMM atomics and add comments about possible use o=
f
XArray.

In fact, I am not sure why this patch carries my R-b.

Best,
Gary
