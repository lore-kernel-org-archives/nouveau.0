Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77826F53D8B
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 18:54:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46B8D10E359;
	Mon, 16 Mar 2026 18:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvIJ6kf6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EBDD745165;
	Mon, 16 Mar 2026 18:43:33 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773686613;
 b=vw8h+nFAcppBkS10o2M8Y44ldw+oah/Mqyenx4BrwGjmBxqkqFDwLINnG5nMjoeF0tb4P
 +DxEoRvhDzaBIyElqbOTJydYPovkBgEbjW42LuGaat46U/Ne5XkHkssqdCWBIMPNbzE1aZp
 a6JQpVyABnjUVh7rIsrdmwhXqRdcbuaNRzRgu60v7PLGlrHYkTDxT3PAJjowyVc3RwmQFNA
 mY5kq6K9en4WQJE6zlGEHEGWJZWlYYUHxN9CDy0tVZxc4vp4DUjpCceF+U/sIk9qeAcmFLv
 sUsDBNFl9b/VzpdJDFrqI3AemVcLA0DvZ+RD0BcD22JBsGIIMkx/lI0Xpp7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773686613; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=f/Vg8FHY15kKdcBS/3vs/jh1SeqJfLlz6wmIh9J22N0=;
 b=WQ/RMB09UZiL5+1GGZqWrnGCqJpY3HFs61FPmxW6NKTinehtju1rFmnum+znV3bHm1p29
 mEAci6fAgHq6bbhPlPyGdVbiCLYhPcRgh7cX7tIGXa329PabJXbyBmNjYqHsI3vQBVoZh8n
 5I1Fnsg7s8G/BD8w3zxvGNdU5Dwwswsno01Dfa66pHAzlMs6PvFHAsu/+q+pdbE1nIw7dkG
 NWaiRKr1XtDbRjd62mF4RrjTS4oxUJE1usFvOLEPQ7FNfECltjfP2Kz+1MZ5npMQjmaldhy
 xAjtDRK4FnZTd2AM+d+Ku6ZipU7AvgW60ijF26NXzbZBaXVlAJNMhrZML22g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 72E3E4514E
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 18:43:30 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAE710E118;
	Mon, 16 Mar 2026 18:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLh25/gscaarzPJowp+1+sTRjROTFB3k1FJPv7/5z0wUIm9bpju6Eq9wMVEgieN/+vf4Qg3Kun42bLIh+pXJOmjWDdhHL1lysvzhQ/x1uHrvtN5l/QRYL+7gJd/NzM+Or85vcb0aUD9P4Uu1lqCayH6GBsasNsHw7ms4Yj86AEapXbfwjrC9Y+PFOHAU06AzhcY6ODJFl6hvXnfVo4IpI+8KJiMDh53TU3ylZHkiFGiBRedEDXik2P2rh9Kqpbyu0IdPu0/AogEUHg3ZoCSCjpV8xcVdJz7Qm17st3/iTEp5rQy2duNBJG2Nw8ktKIhdkx8/ARbqWlcn/QRID5Lw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Vg8FHY15kKdcBS/3vs/jh1SeqJfLlz6wmIh9J22N0=;
 b=TAqE04hdD6DkZtFn6PLsmIv3u6OOo8NfuGW+WsQ+qUIQNcV+0u0NosYFpvmH3EKwFmUb2U6H19lMruRVIvuT8vJ5jvIlxvnjqssdUtZAxRECiSERfaannd5MOp5xbf6ewUBSZqwvK1ZgQfvi52Otkn50+UNQ+4VjU95bZHbvlVcgOrEndcUcHvlzGUmhUwqbxYfurf/CxXETofHBGYPQFEL5Fbq7ZzGDy19dlTaEQdlgJGSH7kNiZqPnzkySyYW4mOMUXcYeGNd5SUZQ5vzT69io3sDP41OAxvyufvTpfntmOjfeRSjuig86QxdByMOPr0gBW263LprCaqq6ctlMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/Vg8FHY15kKdcBS/3vs/jh1SeqJfLlz6wmIh9J22N0=;
 b=pvIJ6kf6AGxiaZ/4HGxiMhChUgWIfYEvLzuBP1HX91+3DYCTWgkVNdyCOM02/n6/hXxYoGWxg/n9jsnGiSE3TLfJkyctvCJ+eFA7U8M+QsRBDZuuevWb/opH9nXO3JanH1pzCtRUOyp5v3CwuqGf65LUfOlA0cWNUNDOlCbhGdLgJXttQNQOPUYh8Iwam9kQp6UyXj+CM+l/EZr/jNqoeBYs4fRjqQIzWb7CVvuOwjMoY9YV0jhehFIQAzPyEaZwnsat0xGiJKKRKi5eDY60HCUroOjRKLvjukZELd9F8l7Z1glAOpID2rtyE1qTNvp5kN2DMTbTzJnNWpz7qsbZ8Q==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 18:54:14 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 18:54:14 +0000
Message-ID: <9a70c268-23d7-4cf3-a88a-d6a7aa1489fc@nvidia.com>
Date: Mon, 16 Mar 2026 14:54:12 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: 
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0271.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc6496b-a33a-4fb1-06a5-08de838d6abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IajmY2xUS6ka6EEzPShb04Qzk/QNdC5bFQkOJHQd/+11BUkR6tPn1nJqfR6BVb2OcrPejozA9+h09t1DIChU7H7WqR8c5lS/VoMoxQnrutqZ6La8DCoS5COR15/ipjUcLwO4rxxQfVfmw7oKxcDbL4ObO9E6HvAXnpHnuwJm2PaWgg2YQTlbF+2SouySt0mbX7zUlkWerM76b7yHY99GJyi1IWawl0ccKv+5FNxnhpwHaV+quL2sVg5cdThc5bciR80bnP+WSbzMpOXz0PiVUOdsRw38ga/nhTXbsglk3zTB9ewEIAlLy61OUs3ea3GSRylx5QOObvrrh8bcpu0j1sF85S4upVIsJI+ciEjz2xPx+TCIXh85Tt+i61ing8tCbJL74YlQz6JtqwpKtojuEVBD46Qng/A4yJG3k3XBOBTt0/9SfatKFtQwtz862VZYgGSTodwPobyz0QBbj08PoQ3BjF2WppuIavWiIXJttYGODOUokgy4gAlqI0KPPmYxVrJ8n+1sZjwXVkkNBJ+VUCMztmBKjwTYMRfnQ/tH7rnrvzRGWBMvXzT+i593F3OQB/mf8UT2iTWwMxkq9dif6Zzw1ZTZJcaYtopFiKyl3tBxB/QUTrpuaGeS6hvnt6t+DMkfgV5X7XP6EPb/L9b1agukNtm72pLTR3yPGzqSDkKEdD23s2DsZVGhU+Ov0qD/cWt5wICKhGlQ+IEpL66q9EpACEtUKCrYNdzxyN1anI0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUE3ZzBvVnlGZi90RElrYTlLbGZ2bkoyRkRXK294VjRJWGRmVmo5N3kyTDYv?=
 =?utf-8?B?UGFlbS9YRUpTZ3Voak4yWHkvaEUzT0RqaUVqQkhnb1VMK3M5OFdXN2FLSHhR?=
 =?utf-8?B?V2oxSm52bXozb3NPVXRFSDVSNUQzR3hKS1V5YSszdjdmM2M3dmJXZlFJa2cy?=
 =?utf-8?B?NWVrblJyUGMybmZlTFRjUTEydkJ3YXM5ZVBYbUFvbUh5VTNSY05aNmFndUp2?=
 =?utf-8?B?STBPZ255Nkp5cHlETGRmZVpyOXYrNkFoMS9OY2ltcUg0UWJUekIvd2ZjZ28y?=
 =?utf-8?B?Y3VtSUFpM2hlSHJzZjlsczhQV1F4bGZXUE5IOHFLc2pGUnBlc1Y0bUVCY3d3?=
 =?utf-8?B?NURXR3lGc1ZYc1kvVDA2RFh6Q3NSMk9hT2xUeFd3di9OZ0ZBeEFPVmd2U1Nr?=
 =?utf-8?B?K2xYL3JzRlRxOHkrNWVvMERnZ1VuTUxrT21EdnZqQktaNWhNRGFGZDNKOTRS?=
 =?utf-8?B?bURpWGdLZXVscTRmdmYwUURZdHBlMHpyZVZBazRlRUFiQnExWlZ5RXhzMFBp?=
 =?utf-8?B?bmdIaFZyTk5ITklISXRyOE9EQUZhSW90a1BiYmw0S0xJU1UxRlZUckk4a0xF?=
 =?utf-8?B?Wi9rMDhWNU5leDJPOEZoZmcxNjBsWXVwSGVOc0kxOEd3Q0NldGdzL3JyTm9M?=
 =?utf-8?B?SC91UGx4a1hJQUx0NmFqZXpzSUtySFlGSG5SRFR0dG1NS1M3enIyR0FEayt4?=
 =?utf-8?B?clRMNU8yNXlZZCt4V1pYekIvMStyczIyMEhzUmN6R1Vuc3c2emJNN3RXQXVt?=
 =?utf-8?B?RGJLRFJST2FORndvL1ljcDVrYXlicklhWE9yUUtVd1BiNVlrOFF5eUtZeFRT?=
 =?utf-8?B?MGFzQmlqYkV3QlFRZ1h2RWloNWxlVWJXNmIrbWdyamI2NCsxL2hGNjh2V28r?=
 =?utf-8?B?NlZwaGdlSWZOKzZ1MHNLOFJzQkNaei82YlBSUTZ3OWZCUHk2NTN3akxnSzZC?=
 =?utf-8?B?SjMzRGV3VzloMVZhTzR1eDdzY1dWbkxPZmVQSzRxKzhoUk1GNXdMbTA1THlT?=
 =?utf-8?B?Z2I2ZDIzZUVEVlJsR1pDdDc1Wk1JbThmYURpSHkwS0MyT3UrQ2hkTjFrWjlG?=
 =?utf-8?B?Sm53S2MwOTltRFdLM2VWRjY2L2p6WU9yRlFKSUdLQkhKelAxRlFUMkhJbHdl?=
 =?utf-8?B?c0M3QWJBeGJwa254ck0rNFRRNkg4cERBeDNSQm1wWUI1WXlRSS9WYzRROW5R?=
 =?utf-8?B?ZmVKNmo5Z0pjRVdNTDdVZkJtcWZoK0Q4WEo3V2F6UXE2QW5SUWFZcXM5UHpO?=
 =?utf-8?B?ODlJNU1ES2I2YXNVR1FHdkhiTVhwWjVIY0xrdk5CanlueGdBQlliYmtZMzA0?=
 =?utf-8?B?enZuSWp4SmU0bkpiTmtPaVhnaTFlcFpGUHNpQitNWTlOUlg0YnFZKytaRmh4?=
 =?utf-8?B?bjNOSVhGRFVJNE1NcnV6bml6L3plSTZ2WjR6RzBkT1J0eWFSaWxtR1dRVG1I?=
 =?utf-8?B?ZkFvZ05oN09yL3FqL2sxVTkxZ0RXWGNvZUd6ZGFDd3FPTWZlRGN2MldGT0Jy?=
 =?utf-8?B?WUYwaDNOblR6UXRSRUsrYVd0TFpiSGxMZVFyTE5FeGFyZzhnZ2VwN24wTlc4?=
 =?utf-8?B?em5FTDZqanJEeTZvSUtSWVhSdWs5L3NtYSsrR3NUWEJEWmRqZGk2RmphN3NV?=
 =?utf-8?B?ZUVZNmxhNkNuYkdKTXN3YU43WXJKbHQvSkYxcVJZZ0o3U0Q5YllacWUxNXFG?=
 =?utf-8?B?Z3I3ZE1RTERzQkJWYUNNZ0pLQlZrZHUzK0FXSHpGQWdTQUxxbUhuRWdScCtO?=
 =?utf-8?B?bDlDaTZSMjhjbis3YWh0alBpMzhwNVJHamhCd0J4VkhTVHRjM2N5aVB1OGw0?=
 =?utf-8?B?QkRodFRwaHpTUWxLUlpHTUVaLzdkdFhXY3A5MHZkTVg2ekwzaHdGVzhGMWVT?=
 =?utf-8?B?b042WE5FN1dCazQxQXUyNlRwRFZhMkxPZi8zTWRTT2N2SmIwN0ZsdHc5OWpY?=
 =?utf-8?B?R2lnLytZckU4QjAzcEZiYjhxb2lDK2VzYmk0d3I1MTIvRXVwRG9qQ0twVzY5?=
 =?utf-8?B?dTNFVGJmNklCSC9ndDRQRzB0Um8wSEwrWkNOQjVPL0RyZ3hJRVQvTjdoKzJ1?=
 =?utf-8?B?a2VJWENrWksyTkg4b2NDY2Fqb0JhUkltQTlnZHZSVDBlSTBOK1RkRFBIcGFL?=
 =?utf-8?B?NHpHMEY0NjRVdzhoeEJPdWhTVVV5RkxqU2ZHTk1seFNKVGEvdTJiUDAxMTRD?=
 =?utf-8?B?c2RmNWJ3dW9rVnpFNEJKZWdkRlBURlY2aFdzNnpEeTRxUXFUR0M5T21FM2dL?=
 =?utf-8?B?aE9RcmFKVHk4MVRheUEzVjJ4UHdhWEoxcWhZMG5KYm8rM0F2aWtNbWhwbGtE?=
 =?utf-8?B?T3VhWVNFc0xJUWJWeEJnMSs1dzNLbG52MjFyN0VrVkdadlUzY3hpZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccc6496b-a33a-4fb1-06a5-08de838d6abf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 18:54:13.8974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gAwVxF/CPFK2kYoQTTk3djnSKXyV7ewkPrvwplMav17G/msVxPpcv0ZE/SzzsD79BgdAadEXjNCjHBVAR2WY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
Message-ID-Hash: V5MYG33ABTXN6EYPWQGELVC432C4AGV5
X-Message-ID-Hash: V5MYG33ABTXN6EYPWQGELVC432C4AGV5
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V5MYG33ABTXN6EYPWQGELVC432C4AGV5/>
Archived-At: 
 <https://lore.freedesktop.org/9a70c268-23d7-4cf3-a88a-d6a7aa1489fc@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 12 Mar 2026 20:20:10 +0100, Miguel Ojeda wrote:
> Was the patch tested with Clippy? It has several issues.
>
> The worst news is that it seems the "supposed to be `unsafe` block"
> does not count as one for Clippy, i.e.:
>
>     let list = clist_create!(unsafe { head, Item, SampleItemC, link });
>
> So we get:
>
>     error: statement has unnecessary safety comment
>
> For this, we could write them as a `// SAFETY*: ` comment or similar,
> to make progress for now, but it would best to request upstream Clippy
> to detect this or to rework the macro to force the `unsafe` block
> outside.

Used `// SAFETY*:` for now as you suggested.

>     error: unsafe block missing a safety comment
>        --> rust/kernel/interop/list.rs:357:17
>         |
>     357 |             |p| unsafe { &raw const (*p).$($field).+ };
>
> So this needs a `// SAFETY:` comment on top of the closure.

Fixed. Added:

    // SAFETY: `p` is a valid pointer to `$c_type`.

>     error: this macro expands metavariables in an unsafe block
>        --> rust/kernel/interop/list.rs:362:9
>         |
>     362 |         unsafe { $crate::interop::list::CList::<$rust_type,
>     OFFSET>::from_raw($head) }
>
> For this one, to begin with, do we expect to have actual expressions
> for $head, or could we constrain it for now to an identifier for
> instance?
>
> With an identifier there is no issue then -- the example currently has
> just an identifier anyway.

Yes, identifier should be Ok. Changed to it.

thanks,

--
Joel Fernandes
