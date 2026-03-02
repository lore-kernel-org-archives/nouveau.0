Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C101EA4E04
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 14:19:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7B1710E516;
	Mon,  2 Mar 2026 14:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ZCFYmeXI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EBE4444D6F;
	Mon,  2 Mar 2026 14:08:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772460536;
 b=YB7CkZFiPblVrjxqXqBoCqWNY2acrlTUOaQpQzS2wfSr1ymuOZ3QxihnHxYwxjnX2C4nc
 IySrrZo3GIsjXLBwV1g9CWBOeu/wL39XgXvtkeNsIidMQqFZVyWiY8PmLz5bK+C6xPUHpxY
 wESxCCnE/nhwO1xalqvV5DWfTWCX3Lj1lILqIw8RwBoZduvaySaSew63sq3WvobjGPEFcqO
 0clmuoTXA/K0GQexid6b//GOW5wKoZLnD8ESJ7PzHo0skaPaggjgAQmf1LUp4Kxqf2Fa1qQ
 G8M+35K3U/0i4Tz7g38eaVw67Wx++4NEHQxSSYN9BAH2UMWfSC+obaRSGnAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772460536; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0Hh0lek0Gf831V2WZh24JUsvLb0uVsxI+/d55a6eHu0=;
 b=YPfQ44X/hUly4sTW+DZcT2p+VnxJsjVVFuhychmuAgXe55dIAPs5KND4//hh6dsZWs+mS
 VVA9wEXYzm1z2EVUZ8yFaw81dpWx49Eiw62Z7jl9B9e7bAcwBta632CwFsOecDiPIgq1HE+
 8VHayJafAb0HXg+xz9YuKYl/pdT+oJ/1Axv/hYgs2pPl3dMUVhFIgkJ+YJMzBXSzjz2vIAM
 TwPnk2rnJ8AZi/OMiWV4V5WVH+xj+KwXYRZ2KKaDr+5ikEahrciYrZM7MtjE41eeNh/Vegx
 eA0ucA3yGaNM1j0RSMSY3yxMwGkrKb0r8erV1vqq/A8dBwnu9Omnuv3q0A0A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3889D40368
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 14:08:54 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022073.outbound.protection.outlook.com [52.101.101.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A073710E511;
	Mon,  2 Mar 2026 14:19:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOAFmQT/3O+Bk35CXGKLd6J8ONEPAw5311oIjf5unkgYf7FKs+CgkUKy1TzXWoHmLWGxBYZM4mGsd6MG6kaMX/VnZESSxUOJkUA8zen14oDQZOLHNh+u48oDsv9h7t7RMSM0/Oe6tLVFrHCFNtPcn9ebEoEV7EHxcEJtRLAhppSmtWt9GDjaeezDRPwNjlQF6BdTXjGw0WbuSfj/oOv/Riog5xeF/LF8J/6aulNC+PswYZwpF64iVzGiH6FFCaE+/bpdK/n8M9yv1p0Hu1l1tCeBgZwOp935PHYijCKBMSF5Rqy421hfCuEUi3/7tOy/8tVQsJQ8+pPMUMyCgWWOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hh0lek0Gf831V2WZh24JUsvLb0uVsxI+/d55a6eHu0=;
 b=nA7QOwtsOwhIwW63ZbZYnvZhFynN/7qPvw7mhC3xiWYiID3UX0ia8Qx9c2i48RRdgTHyZEjDd7xwHEDus7y/8IS3ylvVZmroVHc5L/HTin7fsznmxZwm1rExLwVZWqcyq/hS0QOSXIroE266KK0Ch2bbygpxpAFqItuf8tOeHGg5H5zZRBQO52x4X+BuD1UETIQOLgP1tijWvGR5Q6UZwgMU45JOHZUh1qtAnI7y8BZLjjGN3BhIoN367lQf6ZDasaqPju6oPRz/c9rYj3AE2QI6pXMPSrApeH9+V9d+m0iKINA+6Sop3lue40yN0C8TZ+jjfCQsft31z6ee0yJbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hh0lek0Gf831V2WZh24JUsvLb0uVsxI+/d55a6eHu0=;
 b=ZCFYmeXIr3/c+PI1ACiI4cRP2nIBx7lIu/BERPKh3eqGHuXLdC8/+QD2XBe1wV4I/ZVjirHCEkF4C9UvswXxtVUrOc/FK7bDohxNgyZA1IWvQdqYA4b3LQa3lQlbvBohJlPJaLhTB4uhsKjo8hsNtagg8dSHtg+vOdYLkiaJb2s=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6998.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:19:06 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:19:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:19:05 +0000
Message-Id: <DGSD1D71H2I3.1YC1DP43NP9VX@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v4 3/9] rust: add EMSGSIZE error code
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-3-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-3-c011f15aad58@nvidia.com>
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 63693839-accd-4918-105e-08de7866a97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info: 
	BZ7Ui1KuUJMA7yovegNLYCxDqVV2/ow95bj1Sqxu7rpPAu96BPvsdVySb6V849+3BNwNjsNpFz4ghsmrZJi8UoT9DJVfal2NyCkrP1tB0XVqbQf5XAgYGdiIKcEIM+1pUCSanyqZPwv+U/vcOoe79iZOE7sPAJbWbJ38hRJg7NAalTY1/he4Zlr0OCXjDhFn40lCfNO2hZWvas5P14RxTFAlUNb0VpKaCBVI+SIH/0ozBreCpjDzT8xIAGgkrRdaDes6PrSHfnB5wU4mYSon5FXk7CAm2qgh8xcXtri4E6npwL+8eu6tsfqZXRFH8pIQwSmulncpLN/pt3UkXnT0Zoy3b/nMGkqZWTcojsmfA2RidqzKqeT60Hsw26pTBNyfYyDZutfUyORGAEJnJ51FoVeAL454kSyfcfjErCUQ1ug/Y+kHZTtotiJBH73iCFUdFtQm34Spj6xLRMih+k+vsCKxk502VC/+MIBJjwT9apTN6pJhIm/pfyOsj0/9is+ExikpBrxL4TSama9q2/i2eone2+gCQ45td717W51H/jtowxLjB08AYO9vasDfn2h36zejVk1kwje5uBZhBPyiaUrkGFDv6bnZcRrSMdnCxAW1DiWmkXRhiv8+WvkIUZvFkfbcr974W7m65TLr72Zp6yh4mMadupt4Ap76IvRcBF+seL4S+G3BE5AJomsuwYeAqm9Ul5ThuDNWT0h2ArrXIxzJXt6dvi9oekSTsccF8dBVvXrC9T7bkSZclE8a8Csmxlm65ZHNj8knv4ZmtdNhIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUNRVlRnbE1CRkJaWDgwNW1BYTJkSlpuTmVGcDIzMGljVTY4YlhqOXhoZGpq?=
 =?utf-8?B?NHJIV3BPcU04UEVRTlN4TU91eWxJTm94Wlo0bGtxaXdDSGVPdlhONi9LbFpL?=
 =?utf-8?B?R1pxU1hxdUkxc01lN0NFOGVIamRNanRWNFF6TGZpYURjcUtBektRaWRJSFI3?=
 =?utf-8?B?ZW9RUjRkYitwQ2tlcDdobk9XY3JRZC9zYVpFeUlGYlpIazVGaFQ4SHJqdENZ?=
 =?utf-8?B?bEJnd2RFWDdDeXNPbnZUbkRCTUdJR05GelMzVlprK0RmZVBsZldJT3hWVFBn?=
 =?utf-8?B?S2lGU0FnaTlYSWhDQ3VKWGxnUGhvWkNjaitLYm95UWI5a00wb1A0a2lYTXpC?=
 =?utf-8?B?MUI2aEF1L1MwMXR1NVIwL3lHcFRqV1lrbjlKOHdPektBcVNDTGpUYTAwRWJz?=
 =?utf-8?B?NHZmZUVOWkRqUjlRSXRJa0VoRDVJQUgyRFc4NThDb2x1RkJwNER1MWpsK0Zq?=
 =?utf-8?B?Tk5uTUdUUW95NzJGdDBxaHF3Wms1eE5CVHVXRDkzYnJaeUdZZnBQWXdaRlJl?=
 =?utf-8?B?bVY5TWZKVlFsWlYrK1hXeDNoWWNlVVJ5NGpUdmRjNDhyd3lvZ2psb2tncEtQ?=
 =?utf-8?B?SExSbGJaMmQ2cnduV1lKbU9vWGIrMnVEU1djaXl2dXh4dXh3ZVRUQ3NrSnZJ?=
 =?utf-8?B?SE9OR2dYSTMrQVZ1VjJJMzBucWhUL0VMUzg5ZjNHWEVHT013TlBZQjdQTW9n?=
 =?utf-8?B?UXF1ckVjdEFGcURLek5uTGhjTkY5cGNEeXh1TnhpMzl1K0FOcFFwckVGMXdh?=
 =?utf-8?B?UDV3aXUvQUNBWkNaOEFaeUF5ektjZTc3SVlTR1FhczFQV0JLMkQzVWFJaUFF?=
 =?utf-8?B?Zk5nbVBYcmpJOVVVM2tCekVjWVhNTjRVY2JySXE1WnNrME4xN1RhMFI5dWJD?=
 =?utf-8?B?VTZqQ09pdUVoS242aU9hWTBZcVJ3Qyt0Z3R1TjVNb0xSQ1V6d1hYeGZ4WU11?=
 =?utf-8?B?eEJPWkNQL2lmZy82SEZlYTFMcU51eVB0dWhMSE1nUmdiM1VCUGFTNFo3T2xt?=
 =?utf-8?B?ZG95WU50amtQakxWOUMveVJqUCs5SjcvaGtHT05HWHZ4TXlobDEzY2Vsa2R4?=
 =?utf-8?B?VHprV0w0dTdZMmVYRDVMN2JSYldnMzl1UE5mSEp1RkwzU0NaOGtONHBjM0ls?=
 =?utf-8?B?N21xYjFaeWk1dmRpSytYMElJeWs5U2laVGM2UlBFcEdyeTRJZW1MeXlHLzhu?=
 =?utf-8?B?UTI1M212aWNjOWRjSXhYL2lJMW5ad3JySUJYODVlN1paZlpqaVpmb2VoMkQy?=
 =?utf-8?B?NCtYRFl2amc5ZStFQnExL0xpcFAwUllOQUkxbDNkWWNrU1ZwOXROSUljYzJk?=
 =?utf-8?B?cVVUY2J6QUxvYm43aktpOExvbStUTmZuS0Q2NDUrTFkrNloyZUhYN1R1UHBT?=
 =?utf-8?B?bzQ1SU5DQ1hyc1pLcVNUSFE0aGhITzdSTy9iSVUxQlJGcVF1SHlVcE1YS0Ji?=
 =?utf-8?B?ZEdtUUFWeUxYZHg3ZHFLV2JJUGxtNWl6WkU4OGFOTWpzQnBjN2E0ZHNQWG1m?=
 =?utf-8?B?bTk5YTZqS1dmTGkrWVFHVENxSkpVZXg0YmtKMmE0cTh5SkNQOXhQYzltYThr?=
 =?utf-8?B?dWN2SklleGVkVVMwOGptVEEyZWd3YTFXQ2trV0dFbzI2bFg4ZGNMUmg3cHBZ?=
 =?utf-8?B?ZTdZb21rbE8vQ0V5Lzd0dmdhSjdvZk9MNEl4Ty9OS3hhL3hub00xU05sSW5S?=
 =?utf-8?B?SlZaSlFyQndUNU1kN0F2QTdXeDhYRUkzb2RxQXF6SkNSOVkvWGZGeGNSZG5u?=
 =?utf-8?B?aG5MSXBBYzVWbFNzNWZjTlA5cWFhMWkzaTFmV0ZQVm02aDlaeThTa1ZkdTFm?=
 =?utf-8?B?ZVpFOU9RcDhQcTNkNUVHZFNrWUJKUGRGYUE2b1NSOVFYRUN4M2ZzcGNZUDQr?=
 =?utf-8?B?RFRuT0lHY0k2dS9yMTkwLzc3bWNreE5IblJJeTIrM2x1QWJTR3lPZ2xoc05s?=
 =?utf-8?B?K1BQSDVqbG1pNUY2cEZ3bGxSRGV0bkNOd0RyaUU3Q3FmQ1VrMGZXZHlzTlFP?=
 =?utf-8?B?Y2lTR1RwaVY4amdZQmgwM0FhN1RjeHJLY09Wd3orbnRxUVB3Z3JuUmRsbVJQ?=
 =?utf-8?B?Y2JkTzByUEdzdUVXZ0tMSzJIcHRoazhab2pUSkNBZUFLU2tlWklKRHdZU21v?=
 =?utf-8?B?YTI5Z0svMGs2eDdtcXR1ODliUVRKM0NUN3Fla0NoNUpZOFZ1d1l1MVJsVVQ1?=
 =?utf-8?B?QUlXT1g0RVVKUS9ydUg5SFBrWmx2a3lsUklqdE9wc3RVcmdkNlJBZVVsT0V6?=
 =?utf-8?B?NEpsdzJabERxaXlXS3pwUU5yK0FrVnZ3cTFhTWJtS2tnN1VTRUtzeXJyUzlQ?=
 =?utf-8?B?Ti9Fb2RoTDFYdk9SZ2NWVXhqOFU3UUZxaExWU0hMTXl4enloYTViQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63693839-accd-4918-105e-08de7866a97b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:19:05.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KBohh6T9PcKUJc6kHw6BQlqAaiLW/oIKoero5GKZJR7Atzs1gUFhhMPg1QSG1yKVIW/ug3wLxhV9p7k2RlTGUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6998
Message-ID-Hash: JTAHW2F2KR3ORDGY5ILXAQ447P7FB7IV
X-Message-ID-Hash: JTAHW2F2KR3ORDGY5ILXAQ447P7FB7IV
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Zhi Wang <zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JTAHW2F2KR3ORDGY5ILXAQ447P7FB7IV/>
Archived-At: 
 <https://lore.freedesktop.org/DGSD1D71H2I3.1YC1DP43NP9VX@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
> Add the EMSGSIZE error code, which indicates that a message is too
> long.
>=20
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/error.rs | 1 +
>  1 file changed, 1 insertion(+)

