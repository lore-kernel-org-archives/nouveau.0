Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A514FD45F9
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 00:33:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8EE210E84E;
	Thu, 26 Feb 2026 00:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0Zq4Dni";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5AD7244906;
	Thu, 26 Feb 2026 00:22:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772065375;
 b=Dc+C70gskf4H2UPZPPjlnMagzD1TiQYAV/pzhIZHNnG3d4A5cSL88Y+4hwhQj4GZn/qhC
 ymesEDkQgC7zsWa/8IVRKRte4Ys0OQF/PZvQBoadMTi5hV94TTRpijTeh09t1Pjhcnz85Jn
 jJd5B8ePaZqg4bWoZ4wguEBkqhuxm1+SjRYsVQ7mPWXuWvZUi6+foW945FRRTRonj078YMA
 cy8/LxRIDb0NPc1SEPuQFJRI7P7tLmOUoiGsmw0wwmQpJOVW3eXwPN4UdOmiu0woBLkdphf
 Zx/VE/490U9Qe47ztGbT1yp1ezLaUHQwa+Wj37RMisZwVMBNO4DFn1W7LJeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772065375; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=paQ3sTimbOKaPNQljOHqn0Kw2Auyss4p2fU4dP6wP4c=;
 b=aRp/BVBQ+/k+TCCDM6Ka1uLJ/6sUKyHFDK2IGqtVwmqLX2Naj50HQzEKzwZ3d/O4HG+Zt
 mcX8R0EpCXQ0+O8ClBI8PrFE+YpNR7vIhXlJ7h656JvwUcFHMdIdv9gdVJjhCkoT+m7cYdl
 heFl2VcsGzm1lFUtMVRywCfD8s7uShEZApzitYpTpEJZYPTTFZ97XcNyiV5+j4PbuPdScOU
 4RFk7Y3Yf9dZT9F2H1ziiXsJUz7sUkIkmNIFP4n9wbARguoOeXYbDW8wiNdGD7xEBX4TGUe
 W08xrtfbjQU8RvPEFSCB3kKZRb7AvoIXSsoH8X14Nvd57RxIcUDKW4MA0Mdg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1E2DC4029E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 00:22:53 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 670B910E849;
	Thu, 26 Feb 2026 00:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+UeVXR4n5JcCMIpbhGniu2fUGKN7QllJORA6aCC7fJMTkdJtiYJTDqWYCFeICRZl1gg3pKu9lrEHfXlNjurDPPNRqUjJ4QmVXyC0QGeStLWEBn1WG3J21TicReXEGnRcDytiGCX3LWjxUBnhH356JSuIsEmLeGrh4KQDMH+hHyvoX/HTYrIgF6aFDVnElLSVwjm5NBBRkgLkPHLlbl4HMby4nJeTI4U34v5CqkoGMbRXrEHUoi9mBE2mAIaXhucMhCdZn+q/vefeaBuvcz5ATXH/QN3jpUTQxLe8q/JPFtx7rJP168BfoucrxSB5TOie7iK4sKN5EHMdrfJi/1nXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paQ3sTimbOKaPNQljOHqn0Kw2Auyss4p2fU4dP6wP4c=;
 b=x9nbZvaOPzrreFkaeumX81+BpuhSmljYR12lG7TgqwHm+NOkvawor3UqgztS7YwWGk4EsR2+ffeDMVq4R4+AuUir+dU98oLhy3q5sX6D4/jAKTEmPPT3yl2xWa1Sc9yT1dLa03NV1s2iiOkoft9nR7Bxmyxv+drlgFOr680t45GytpXA+/kF61xPcXrYyWR2ga5SNXPt+ADgrjZ8M4eW446YeGiAn9qrAPEycPuiZ0SEi1yx1Fstcz2x9wi3UDhsQC2fypylk/ViIHgTRYgJdln2g1NetDJVJSEN8jkxbqJ+PI8NqPvjXQoDKUw9I3pZTG9Uh89Soz4D6bFmjVi5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paQ3sTimbOKaPNQljOHqn0Kw2Auyss4p2fU4dP6wP4c=;
 b=W0Zq4DniwX9gecIr+sz8AYR0ZQs9UqjOFLCdAHpQzF/ONhjDMq5sReOugyrrNizDvv+iYJmg4SD5bpKkvTg0Ztu5UiNUb4Cl4O50H2MeIS5zjtgJOynCjFrgIZ4K2kz1nchuutQIKxRyF8W+8z5bkh7/6vxA19Vre/6BwvHVLBNE1tP1PIak4QxAKUu6bsnbTIPFLADwvujjMgnNyLi+oGrJ82NRJSykLR0gk2ZxEKVl6QYcdp1l1PtVrNfsl15Tqs0zFPiWenOcUxYIeyvztd/Dz8D/x9ck1mMhnC1ePKOGmqx7ikzhwgnvvFJkqo/YzaDvighj0gsqF2uiQsszuQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB999108.namprd12.prod.outlook.com (2603:10b6:806:4a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 00:32:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 00:32:54 +0000
Date: Wed, 25 Feb 2026 19:32:52 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Message-ID: <450E37C2-1B47-40AD-9D5E-74C288177ACE@nvidia.com>
References: <fe65b37f-6944-4056-8b7a-3cc09a044bf8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe65b37f-6944-4056-8b7a-3cc09a044bf8@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB999108:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e5db9c-7f74-4e95-d8fc-08de74ce94c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	C56ncqk6K02fxNMFD6XpPUgZ/FvoAtAW6AsYDVdm88ONzUTEV3YI7RNEFMhgnwwH9JXhUqRUrl1Cumal6BUHpBPypiLS4QmrfdX0u75wrTcEbLedADYMTTLrasrFd/Wx1v1OCGCWHiwOshGkSDRgxXUpZvIyJmhypf/wbY0O3EbVR1pMQhw7pUSLiOFYVMb0GyvI7qgFBiunLG4duJ5LJfU7biORZpOmkX/3J3FK5Y+bwxUaJ6BelcgZU++Gl9KNUlowsiHiKVBYWdElcDCglLj4yWcEXasrnb+AIU41PEe9VM9MElQMLS7sIRm1Qn+L+xkBkvenbz3Zk0clGPj0LK43yfUvJ8zQMq22/N0HLlmgMomtRggv33g9jG/we/aq4dFmM2iSVmWUYaO1XqDJtD/pjCrHFuq/80Xo7E17e2bLNFo+GfABFRvmByvXeK5x6OOfJm2iBywwqQlCUgCEq1zPipYuRFlRLAqvRlc4VRPwrGlJnznwOr0vhLtF5ntf2HpI8IatBjQX9Ipf0w6kIXeyguwxz/qkGlQM3kUzk/SBStk1Utyh+x0fgLwgac8/VBNSQ2CjV9AI1/OVsdIbaKUztR0e5rBFJfby2eI/9Zc2AnPJVQKYySSrv33YQ8fYMPVG4a+c0rF1ITYZr501yHtjFlmfjH/1G4TrQRxizOsWrcZeiGrgdm8/RuOIKlx9PIPdd+J2XHMIuMqLC5vSOdAi59TQReVX8vUZ1AdPlys=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUZhSlpuTUwyVFYvRGNra21wZVkrYjIxVDBCN2tsSzRFL0NHU0s0a3pJY3ZR?=
 =?utf-8?B?OUNwZHRIN2pyNmFIVFZBREZuVDVHaEN2QURPSlc1NDFIYUhEdlpMdVYwZWd4?=
 =?utf-8?B?NVhXMFdCS2M1alBodFZGUUV6TUo4WEwxdEpvVkhwaUpWUmUrWW0vZGZGaU5m?=
 =?utf-8?B?c05OSTQyVS9YenRCbThoUTZ1RHVLTk1XeWVxSzhoOXhyMFFhUzQrMkZMTjh5?=
 =?utf-8?B?M0F5aTM3Mm1yK2NlMFFZNnNPRHV5cFNXNzVBT2JoREZtMTQzZmtJYWkrSVQ3?=
 =?utf-8?B?RkYvT2xINy9kdGhuWjFPdElRUEpIdHdjSUJxeWROTThzTXBXL2NzT01LWFhU?=
 =?utf-8?B?QU9jTWxVNExHWWdBSzQ0RUZCZzZGWitoZ1VmZnEwNnk0QXVKTVIrZHYzWjVv?=
 =?utf-8?B?R0RnRmFzWG14RmwwWU9icXl4U1phMFZvTVc2NytoVWVRaE1PTmlscFBrZWw0?=
 =?utf-8?B?SVd3M1h3QUs5Tklrcm1OMEp2U0VHR1JsVjlPcHdGNTlLYkYzeHRDZWtneTkz?=
 =?utf-8?B?aU5BM29xcmRINEhwc3pjaW5hR1RTdnBoMGxkQWdUYSt6RlllUlZCeTJTQWRj?=
 =?utf-8?B?UzlUcWtzSnNrZ3BGYTFhREdUYXhpWXdCR3Y2V0x0K2QxajkrdnhXcFRwcTB6?=
 =?utf-8?B?RWNseGJQWmJicFlxNjlYZVllTldKeEdpWXVGM1Q4QTR0SGJwSlJjNW5oSldi?=
 =?utf-8?B?Q1lhVTF4aXRUcDV0YWNCeDdOdmcrWEZCK1FWRVB1THJOVCtLdjFjWmVVWXdG?=
 =?utf-8?B?V3U4UFFqNGt3bHVrR2JPc3kvb24rcS9teUFzUk5iZnpKeGdRRXlvd2hvR25G?=
 =?utf-8?B?eGordFRGUytkTUg5TG9mcEhDMnhNdHVJbTkvQWJSVXAwclpEc2xMZHVOWU1F?=
 =?utf-8?B?eUQ3S2YxSlRMVFZkNjBjbkxHRXFVbDhRTjR4bHcydUxMdUkzdGJ4TmIyY2Vn?=
 =?utf-8?B?bDhGdXdDTmljSThWZU95TDBhak9rVmd3enRzQjRLSU5SeDIxVlBxaGgyREpM?=
 =?utf-8?B?c01WQ01RMVhLaTlCK09KMFV5WWsyNThrWkdsKzg0dTRnQ1lGSWc4WllnUGdN?=
 =?utf-8?B?Tzh4RDR6VEJZb2x6SEY4a1JsSWdyMSsyL3h2WEJSeWRoM3pTcTZHbTB1ZEt6?=
 =?utf-8?B?eERhREp2MXNkYUtOMUIvdzlobzdNUjVIMjBLSmYwaUJnSTRuQ0ZKMW5MNjky?=
 =?utf-8?B?c0gyZ2VQNmxzQmp3U1pOSEYyU0xaMEJGRmdzSE9SZXVMMFo0TlZzQTJYa0l1?=
 =?utf-8?B?dW81N3BheGVtV2F1dVhRRks3Nk9UZEhYWldaY28wcGVJNVpxM0hUSWdJejRv?=
 =?utf-8?B?bHdUSXVDQ2dvb0NtR3dObUZxeTZKb2cvMGFUSzZwcHRzQWNtdE12TkdjSXI0?=
 =?utf-8?B?c3E4SzZQbTllcExJS1VDbjNKMGV4QlUybk1PT2duYlI3QytIQ09rQTF5Slhv?=
 =?utf-8?B?cFFDbXBVMXMxUUY5V3RqSlltYkc5eGpFVVRmZkV0Z01oUUpMT1ZydWhJTlhM?=
 =?utf-8?B?Q0FSRUg2Z3c2bCs3UDJVZVNDT0d4UTJobHVlWnJLTldzYjBvSm5pbm4xTmRQ?=
 =?utf-8?B?WVgycHdEVkFJVjd2emlsK2dEV1lmOUloSEtFbXQyYlMzTmxLYWZOWHlQdm1L?=
 =?utf-8?B?eW1tR2FzSHNheUtvVGpCeGpVV0ZKM1BibzQ3Sm9tVnd2Y0RuQWlOano1Zk1S?=
 =?utf-8?B?dnozdTBlNEE1cjJmQTlDN3BRMXF6NGl1SDZyUy9zNDQ0VE1TTCttSG1wdTU0?=
 =?utf-8?B?MS9vODlsanRUV01oZFcwQkp5dmFDK0syTkpkNW50dkI3TzE2djlzdFNpcGkx?=
 =?utf-8?B?aXFhenhYYW9ocHN0ZjFMWnFoTG1CUW01N0diVUZNMC82MndydGNqdkNXaXEw?=
 =?utf-8?B?ZWs1cmxmYW1lVnZMSlgwS3IxUGFranBnRVBza1FwWjYyTm9DWGt4Tk5PKzFl?=
 =?utf-8?B?dFk3ZHl5djFNY3lYSzhDMjRPdUl5OHladDlvd0NCOGdVS0hmMXArWWYxZWxt?=
 =?utf-8?B?NTErQ0t5bDB2NWFBU1lvMXRDWTBGdzVISHNmd2ljM09Ya2tpeWJxSCttai9J?=
 =?utf-8?B?NStXNmZiK08rOGJxN2wrNTJvSHhLRE1OTFp1dXR6NXg4eXB4RWNFMER2a045?=
 =?utf-8?B?SXZtYlZzT1JNMzRNL1dGY3Fnb0J4aEd2SlJPVzhDQkl6YTVUeWl5RFVuWndT?=
 =?utf-8?B?bWJZbWQvK1Q0bzgycEdSaFVYSUMrZ0Vld0ZNYzUvNzBCUVdUYmFmYVdISzVN?=
 =?utf-8?B?OE9tR1RYcGFjM3dQcWxERnBQNDJKbFlLMU1nMXlVRjRYZUZndWxUbTMwaHNX?=
 =?utf-8?B?RFl1dVlLLy9tR1NFT3lsVGF1K2dBQWw0SFA0MUFIeHZBMklNYmFsQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81e5db9c-7f74-4e95-d8fc-08de74ce94c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:32:54.5541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 URZOQX2BaFuNYtjsu+cb2pqKZRmzu3C1ix+9AUZ6NgDb1rHvEbhTaX1NhYJq6G6kULm+4n93WPck/nl54sVrBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999108
Message-ID-Hash: XG4W5MY72MZJ47TIU5XCSDLLURSO4DU7
X-Message-ID-Hash: XG4W5MY72MZJ47TIU5XCSDLLURSO4DU7
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XG4W5MY72MZJ47TIU5XCSDLLURSO4DU7/>
Archived-At: 
 <https://lore.freedesktop.org/450E37C2-1B47-40AD-9D5E-74C288177ACE@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> On Feb 25, 2026, at 3:20 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
> ﻿
>
>> On 2/25/2026 2:48 PM, Boqun Feng wrote:
>>> On Fri, Feb 20, 2026 at 05:48:37PM +0100, Danilo Krummrich wrote:
>>> On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
>>>> On 2026-02-19 16:24, Danilo Krummrich wrote:
>>>>> I feel like it makes a bit more sense to have an entry for the entire class of
>>>>> "RUST [FFI]" infrastructure.
>>>>
>>>> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
>>>> defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
>>>> etc.
>>>
>>> The idea is not that everything that somehow has an FFI interface falls under
>>> this category, as this would indeed be the majority.
>>>
>>> The idea is rather everything that is specifically designed as a helper to
>>> implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)
>>>
>>
>> I feel like you may want to call it "interop" then, because it's "Rust
>> doing something with interoperation on C data structure". If I
>> understand you correctly, the category you referred here is the area
>> that we could not simply call an FFI function to get the functionality
>> from C side, but rather we need to make sure that we are interpret C
>> data structure correctly to work with C side.
>
> Boqun has a point here: https://en.wikipedia.org/wiki/Language_interoperability
>

If we move forward with this wording we probably have to then rename the
directory to rust/interop. That's probably not worth it I think since
ffi and interop seem to be pretty closely related. I suggest let us keep
it as helper wording for now as Danilo suggested. We can always change
it later if need arises.

-- 
Joel Fernandes
