Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC283F513EB
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 01:05:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE6E10EC99;
	Fri,  6 Mar 2026 01:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q+SqVoW0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0101844EEF;
	Fri,  6 Mar 2026 00:55:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772758534;
 b=OezVJUzmIqIA+/NPdJAIma/xzM/+DUCgOjoO8FzxueITUyB2KBtFmy8sJdxS2Hi53/LD5
 hRyVr3X1fdSXAxCKBrwYDnF3WoQ0VafjALkTXrVGlnn57MmbKEWsaQU/A704CMVaFo+u32B
 CNQtAud5Ucnf8+gGwHSZRHzIvdUhFevGd6dyFr2w+v3dDktKCYoxmCYt/9opDG6N2GLg5vk
 oRRYXYWHCbGhL4jJpo7fEoVyXtRjYbD4f05trDrKgriW0R9dAHxcvJbnteerYVTfTAI/9WH
 BW4u+0meV6AC33USX6vSYXwEfIjh8sdCBsAq8XObeVBNJzvgeY2XL4L0Dw3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772758534; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RGZUyKeybfYJmB6PTCiuOIRT7U3Rkl2u7O+nSmSPZC8=;
 b=0OYGkpl2LvKD82fL/Ok8LGEF/wObNxpfkaSLg9rGUhNNlhdqqx2y7e594gUwmd2J01krt
 oUg/diuHFAlIJs54BwtLkGJKwbndtFOxmLI8D4LZ1eCrqjG/x9NfzOO0dSi/JnHg8Cyouo2
 bsQ58XETNFkLcPBVNR3j6EA+0LErQpJ0gZVML6fg9L5RlQptjwHftkbWPeEdYJC5QXKD1kc
 4APVNaVhTkTdNfiDBBJGBiFHI5tJTMLYDzu5OF7wc1J5uZQTeVFS/QKdLW60p9cC6Wo5Ick
 cO16vsQBH44t8xPqflNYwvJeWtFl2VDwH9y4Iow9Y6g3Z3KUNQl4l/n8xH1A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 39A4B404AB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 00:55:32 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012037.outbound.protection.outlook.com
 [40.93.195.37])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6251910EC95;
	Fri,  6 Mar 2026 01:05:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1OgMgrelyvMbpUbb24jrvoEP0Vayi8OCyV8+kYD3TKi/QyfyshOwsoY4o+bBJKD1zCk7pA/3iWd5cRUmsdn2qlXJwB1Nn+hHEY31KwGcTOxgM8MQvW70y56DBmyBDy3VT194ila5cXt8VGesSUCHZLogo1MH3Lvp/XtNXBqj+MV7hzliC46zMgQBc97mVch8EO8csMK1F+P4n6ku/CFeltf8yfqUYCnM3M01A7PgsNaJzow9FWMKzKs8YiuLsksWxQPjhwJXTxlPup42mpBVFgrZpSC2JDZdjCE1Ri93obyBpqTabF2zLP+JXXA06l9jJUw/opYxiHHtmQqoU5iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGZUyKeybfYJmB6PTCiuOIRT7U3Rkl2u7O+nSmSPZC8=;
 b=DUuBui//ydyvdZyZcJC5msu/77F70WgMFLtO7/tRh1p/8gQXrn/cXHsmsDAx7bSKtUjQLs16qVnkG84+kZEjT+kGqxzRm5mmL6AxprCnkf3DDIXLtX3+KYnqIPUKametZ2khJVzWMxwTKEucV4qDHt8WUrr8zuDWaaPw8obeRQg5C5Hw0wEDjo2fNuQ647y6t2NmvlgRbvdu5yUxsqBb8RIUpHNNxV5CFK4tMddk29fvUzm1x2E7cXCCAeZaGAX6p3w+CtE+wgegw+zZOCmTH68877bqyLMlMNczvZeDu7DCYCRwF31lmePIVLdyFfPi838r9rCCxWQWi7FBZGFo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGZUyKeybfYJmB6PTCiuOIRT7U3Rkl2u7O+nSmSPZC8=;
 b=Q+SqVoW0T+PIegPupT4+u2gLHtZKSkcRhtUCHz6XrKbtC5COFcDtvcCDa+XBeW1ol9P1Mrxdq1kCsTyh5Kq9LyBjd6U6RODDvlQ6Ei8+Ox6NRtUs9KVbunREg08f7uyBYzu5Te4788SN2HoLmwHFdrQV+SzNLvceqsXj8ZKYQmxLJuX9Sqlx1pj7xUO6QJo5E/QfodsxoCm77vjkp/JHJvypuEXkBy04IyiMJh+B/7dR53XOPpJckS/ihZ4ElxbPDGcQd6SDeVXHmMrunxbpOMnZqw0kYgCGdtDmAK4IA0lbCjGuQGF2X5GYIlWHQo5BEMXffKe/g6OGMDVDM3WzTw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 01:05:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 01:05:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:05:48 +0900
Message-Id: <DGVAO5UGH3IX.1OYEQD9ITWYFR@nvidia.com>
Subject: Re: [PATCH v10 07/10] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-7-dde5ee437c60@nvidia.com>
 <35d1882f47c6001feed10c305d1c70a374f930dd.camel@nvidia.com>
In-Reply-To: <35d1882f47c6001feed10c305d1c70a374f930dd.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d88277c-e29c-4f1f-b8d6-08de7b1c8255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	xzxJaPMMo7i9VZWLaneuVOqfyVFj8rDhK0iIlFnRHJZuAPJvysbuuk4P87hgn6tkrF9XZVTE0jcAjcwSVtdXkuV4eXCbW2q25sMJS7eE5jqk7ebeKVHbEr5HRB7WIZCI7Rs3+g6DjR2C8ze8sWxTxO5PZnDr9aluHBcD2vznbG4eTrlNijpVvWK3X0Ei3itMcOFQ3TDteLBhc65aUDjwFBeFMdkXu+e98bZRMgBD0d0qPbJ0MPJpPws8Moc9rCqurOFmq8POeoUzZfcNE4UkNtiA1rljXZQUxqJcwAtLU4n1S4J8EpKZ2NxX8fT2J2EEZVOjc55YwAbJGFlN+mPMiDmIM5s708lBYj9/izPb2ghe1GixI3jAFO0B8DxSHZvotVUHiOzlPGM1dWkJpUaTO7PfyV/KDl5IqUQZAyj5vtqC5KDRaRdTD7qnQDoxWM/dSpTEB5gf/ljOWqIbXGnZrsG7uluGQUSP8Ae1++u+mQR/Z+0ml1ugBf5w9y8ICdc6Nez4K4v4eoVE53oc3lG9WoaqK5mTaTO3V8pUylqZw5Xn56PjlhH/fpksQdKYhz5CJ156iNjpPVWr84TM3BEy2MPQqD05hyn8upC1SaPG5CH7G6Ez/NrwtIez/3mwqJOXmcLHU3vZBYUw0+gshonn5RPnRD4ZLBq0rQQtwaeo9vakdg3Uw2M+NEZw7c2aRrLFO98DzE3JMxbe2BvAbDNhb1c1CTY/OM9gRpyZL4feFC8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFdUUDdzRW1NTXoxRVM2d2xOVTllZ1huS0UwQ1pqTzV0cjJZaktOUDZXU25Q?=
 =?utf-8?B?VTNiKzNGNHdnQlhnVVdUZEhKVWxYTE9SbVVoYzFFU20wVmxCOXpmY1JQTFVW?=
 =?utf-8?B?Yjc2V1k0SnNRK0tQaFc5SUZENDIvVlRTSEkxY21lSENNZ1lSeTJSVWRDZzZi?=
 =?utf-8?B?U3ZOS01tdmxwM25EekgxQ0tUTmt5c2llOElzRjJ1Mm5ZMnkyT1hrU3Zvejhp?=
 =?utf-8?B?Mlg4K0tNMGFadEdiY0IxVkVqT0loYnNJeGh4dnJOZWEwQmZDZDltWWY5SENL?=
 =?utf-8?B?OE1Fdy9RR21oc2MyajlQUm03R2FSalF2aWdQekt6YmtwNjdabVVDVmdDS0dP?=
 =?utf-8?B?eU04ZGh2K0FGK1g2UnZpZGdkWEsrcHFZRWY1TDE1YTFqeXdJN2N1YjNWZXZX?=
 =?utf-8?B?MTJ4MkhSUDhMWVQ1eDJkeGxBbGZaem1BRnQyN25pdmtmY1dLWEljamkxb3dE?=
 =?utf-8?B?R1k0QmVQc3RkM3VoNCsvOFNXTHhrQkNxcjNUT2lyTkJXSzVoc09GWnBYY2Jk?=
 =?utf-8?B?Sll3ODZyQndXaXFLdFNGYWUyMHVSbnVEZHlHS0R1QzFHVkNCUFpSSkFhdXZv?=
 =?utf-8?B?OG5YUmF4VCtlQnBpOWdzTEhGWm5PZW1MZHVRc1FscDFKVnNrWnZCWXp0MGtG?=
 =?utf-8?B?NXpqWnRJdXhCUUt0Q2I3SWdSMElhbEZ3VTdsVVpwNEJoQTkwV3Zmb1dybWFp?=
 =?utf-8?B?SmhadVBLUEVyVS8wZ1pBRzRoU2g4ZFJwcW1ucXhGUnJ6cFF3eXBFMXh6QlJC?=
 =?utf-8?B?bmxOS3BxSkhLYXp1QlMwWkZ0a29JS2pHTlAxVlBOV3RZdzhtTEx3Y0YzbGdK?=
 =?utf-8?B?MEVMcXlRZ0N1NGVFd05Jb1ROdlJmQjR4dWdNUDdDcEtXNlpFdGZTeXdRKy9I?=
 =?utf-8?B?ZnpBUytTR05MUEh2SGhVdHVhb21FTlhERkwrZXhDSzlaa1EvRTJ1b0hUdVhv?=
 =?utf-8?B?MjY2TlNXU2ZJTDZKRFhHMWFBN25PejExak84MGhzTXJGemF4RzlLWVV4ZUhp?=
 =?utf-8?B?Z0l3NnhDYXkvd3BHZkQ0d3MrbXJzSGROMG1wL1BxeXNxcXVZL1p1cDJSVkhY?=
 =?utf-8?B?K3dFR0JML0xkZVYvNXN6Um5rdmZzODl2R09TVjhVSkRyUG9KQ2xKUit0MXJo?=
 =?utf-8?B?VWpDWExIWnc2Z1NFY21iRnBUcDEvOHkvam9YVlUrL1BkOGVvclhLenFHdkds?=
 =?utf-8?B?Vk5ZdnpjbmhrRlplUzNCNnRnWnJSUVJSbm1SQ0MyWWRscGI2RUh4OGl2aC91?=
 =?utf-8?B?L0Zud2draGxjVnhFUml3cGdYYVZBUElWazhlT0VYUXFBSWtyK3RTNkhvb0Jh?=
 =?utf-8?B?N3QzcURLaERyZXBicENpS2xUWWcyc1FBeGVnSWhSTFdlWW1FaGd4U2hXM08z?=
 =?utf-8?B?Umpadm1UUks4K2hQczFiV1IxNTlEeXNkamFxMGlraFg4THlLQ3JOdmlvMmdm?=
 =?utf-8?B?eDJ0RDBMYzlTWXUwY2k1M1BrWkNsT0t1Ny91TEZUVXR6UHBzMmJUZkNsdDQ1?=
 =?utf-8?B?ODM4UjA4d21ObFl5RjA0bVFvUVpzWlFQVUFrR1Z6L291UGltaGx1QzNkSVBm?=
 =?utf-8?B?YWlXV0dWV1VxbFY4OXh1QUZSWnZnSXNveE1BTk1wdkJydVlkZ1pLUGJVdUxR?=
 =?utf-8?B?TTBSNVQzeHhkVTQ5WWlPeXQvRFV5SENQOVVLa1JKZDRQQlBPcGFYOUpGU0U0?=
 =?utf-8?B?a0liK2lFdmt1TWl3UktvNkR5eDJFRzljc2txNDl4bTNNSDZ2WUYyaWEzYkJG?=
 =?utf-8?B?OWxWQisySmJVdVdwZWhyd1pERDdFWWVjR2sxQXZMTkVyNnV6ank2bmc0elZ4?=
 =?utf-8?B?aitNZGhUTUc4a294UVBKTlZhZy9TOTYvL3kxVkVLQ2JpUUtkNjltSnVDVENB?=
 =?utf-8?B?SHNJd3RrZFhucnZyejJNdWRVdTVDR0RROWhJRHljT1h2UWhjNHF2YWxMWG1M?=
 =?utf-8?B?ZnJhek1Semt4NHAydlBldG4rUkpweGFaVVBoVG9HYnlrdStFSWxYOW9lKytR?=
 =?utf-8?B?QTgzWXNZQ0MvVWdiTFNYcDZlODZUbXRUczJQY3lqOFhGSkNoT1ZHbkRLcnVD?=
 =?utf-8?B?aFBWSVRUNXdTK2pvL1lHdzBnNkgxdWd3N1RORGhaSDVvQWVBdUxLbFVFekZP?=
 =?utf-8?B?YmorVUc3eDZsQmxITmRmYk1lUS9FSXVWMlo0VC8rckJSZXQwY1BUWDdNRzZG?=
 =?utf-8?B?S1NReDdKSkpzUGtYdk00THk1emJ0ak5MajVIVXhybXgwRXd0N01tVy9PNDJp?=
 =?utf-8?B?WU5LL2JsazFZNTVsdEpreDdNQU4yVmJid3VVa2habTFlb0ZTWHg4YmRyaksy?=
 =?utf-8?B?d01QZnpBV0krUzZKVmtEV2Z4d01XZTJvbmhEUnFtSk5adUpsSXludjhEVy9P?=
 =?utf-8?Q?JNTfHO+ke7SMaqWsJDt6kTr5InmUKhyz2dieiRC3aIh/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: IaFALmo53Kws0Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d88277c-e29c-4f1f-b8d6-08de7b1c8255
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:05:51.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Lm3AA59LPl6YtKD5VQtD72Ay/qHui7+SZX0L9zU436fkZcEzhDmy+fGLs0lWjDJmuFYv1D8tCSC0BSFAl6vJuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940
Message-ID-Hash: 3K47JLCBBARIYMBAS4TD63X2HXSBTIZR
X-Message-ID-Hash: 3K47JLCBBARIYMBAS4TD63X2HXSBTIZR
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3K47JLCBBARIYMBAS4TD63X2HXSBTIZR/>
Archived-At: 
 <https://lore.freedesktop.org/DGVAO5UGH3IX.1OYEQD9ITWYFR@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 6, 2026 at 5:49 AM JST, Timur Tabi wrote:
> On Sun, 2026-03-01 at 23:03 +0900, Alexandre Courbot wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> Result {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match self.hal.load_met=
hod() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 LoadMethod::Dma =3D> self.dma_load(dev, bar, fw),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=
Method::Pio =3D> Err(ENOTSUPP),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=
Method::Pio =3D> self.pio_load(bar, &fw.try_as_pio_loadable()?),
>
> Wouldn't it be simpler to have pio_load() just extract the IMEM/DMEM valu=
es it needs from &fw,
> instead of creating an adapter?  The adapter just seems like overkill for=
 something that's used only
> once.

pio_load's job is to load a firmware, period. If we start doing
something else we distract it from its purpose and end up with a messy
soup doing many different things.

The differences between PIO and DMA are minimal but subtle enough (tag
for IMEM sections, smaller `dst_start`, ...) that we need to have
different parameter types for both and a fallible conversion step. Of
course I'd prefer to do without an adapter but it's not as simple as
that (or please show me with code how to do it).

Actually I'm thinking that we should maybe move all the PIO-related
stuff into its own `pio` submodule so we don't clutter `falcon.rs` with
this.
