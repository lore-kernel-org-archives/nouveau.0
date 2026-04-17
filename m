Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6AF8E499
	for <nouveau@archiver.kernel.org>; Fri, 17 Apr 2026 04:05:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0669A10E8B9;
	Fri, 17 Apr 2026 04:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GTfhPnWj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 073B844DDF;
	Fri, 17 Apr 2026 03:53:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776398030;
 b=BXZEmZLcdhrXdIjOBJUBBTEknHdN7kCjVYMHz0XNHzXMWczRYZOTtFmdaduWD/U3ZtRi9
 v9YDmEKtMasejt8PZ+ZLw9viJ3s6x3FKmNie0m+scF7AkKMjQwWyOF8lRXggUcx0lmjWgF4
 jSguvHgxSa2M6p7DhCaEVgNAu3Xad9rzb31ll2AV7hxDWDJHW5nNzQDwiAwepOrR0WGqu13
 6aT1oiWIYIkkWzrDSFN96l8YM00QxkpD0/jzPjvfl17cnWSwyYwYlY1qa01zEf4fVJiftiF
 ZFS/SCSUqq8wb96xss48Xx+yb8JGPTEcsgRSJnyY0dH1qwfYpMMoh4uqdm9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776398030; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Fx7GNC8q9s5ViXRiv4ptawolPMkEj17Bw1wBBud8SY=;
 b=z4F3wKGWoGAc1n9CWJ7eyV0qffBGdGDTn0zkZfqrru3Hh/s1sfJnT3EWnDtonNCmHIDkV
 meXUg/e2UdtiIZIuDz1IqZSCFFe6m5e23HGxJ7qh83rCxYHPxhqGxHo6AxUn1dVk+CQogth
 dsCFld4VOJaLgHhj3x+CcXCBQQOQA0xdG5m0mQWsVygyTfGuDSU1846DGd6lYZChAu3ZyYI
 qiaO+R5vxRE16VJ97ckjkHur1VgLUM5474TCJxW8R8KBTtAVqeWYAnB2UpPrVvxAXx/m41f
 ksSRfuSc2kzKBXtWhCCCgX8ai4gVlNFQWmA1GEmnAD1vbyQe53NxncFzFg5Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B76B144DDF
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 03:53:48 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013066.outbound.protection.outlook.com
 [40.93.196.66])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7AD10E288
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 04:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSltGnLXD6SNRY0NRNDaqmxRVDgmmcMVQ4HSQNqwtz3/XS6k83u91Y5gW34urdugIBHErty8YnPVXUQEhQo2vD1cGh9DqxnsmbYWZNM5bQQIDG+KQ1jvrN971kXkvgyD8vwBe9XjC0lwzbUu1ZuIzX1koq1Z2U7mrh/An9zbjAzlI30D7b+hRaynMXKRLRSGYLWf+Kk0+hm+h/RjxFsHlCF+BZmnVKGX7+M98jvMufc1X0ZJFA5yh31BZgX4gVyJJZyYNgCY59PhX5hKTkuyoJYI36LGMvwVue/+TNTN5BgiS/X0TI43/J1xdYOraElQELzBB2KD3z80Wz1xZpSfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Fx7GNC8q9s5ViXRiv4ptawolPMkEj17Bw1wBBud8SY=;
 b=BmnSWhJKZB0ws+gKK2B2I/Jh+MafoFv+JHQ0Au0T2NYEeyWx3mNKX3n1o0z5u3ezCY7wVZ54oRUboJiNc0DTik62JTFQnLdTR6gN5ZWMsasvKRM1jZ4lCSdfWdScBsWgNJunvJtUTy2gQ1xLqTui4GwH3dX3jayzO0YpAxuabuSEICpbWlCatNm+qc9zqkGdzI/ecZXRyxBq6ms71xbakqQykkole/D3hLi+RELb2osan951RUzbQyukLl8QU96IMC1yfFwP/XaRdnHvb5vkwo8s6LI0+V2kctcfLStvD3UxeHaRXJkj5CekZAz0ykwM4yaXfTOKJFZLxpoO08mGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fx7GNC8q9s5ViXRiv4ptawolPMkEj17Bw1wBBud8SY=;
 b=GTfhPnWj8RF9r48AyUEyNNaPAZPpvFZgvETTWUVaqQFT8RqkMaL90ORd1B+N0NCvSHamcdsr4bO/pXiOvuu0qw44pCNmrPgf6oQg2yZN1Ud3zALKv5hegWSYU/FAUi9RsEs389k/EjE0jP6CVqUhX0WG39LR9GoJiuDAVL+1CDrXJD6fM8oTB2/PP+RqmhlqF2c0LNjrQQnn0RftQNih5yMcfTXcpnM5dw8+XMIsGjRcH2cWocVzCs9gpwIpLti5w5gL4fftZ3NmyOWZ3xVFhykaq7kPM5x4Rxe2YKSknSOmen+q5AdmDTCpg/wd8R947XXIJKxZMaWzGbb1z6UTSg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 04:05:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 04:05:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 13:05:34 +0900
Message-Id: <DHV4SOWXL1YB.103OO4XT2QR2J@nvidia.com>
Subject: Re: [PATCH] Documentation: gpu: nova-core: document the IFR header
 layout
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260408142132.3911466-1-ttabi@nvidia.com>
 <f86f2dec2c3b6198ec0d175bc69ad3cf8962cf3b.camel@nvidia.com>
In-Reply-To: <f86f2dec2c3b6198ec0d175bc69ad3cf8962cf3b.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0119.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: d632106e-8356-466f-1fd2-08de9c369565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	zDFBw7GJmWOn1SGbuOQzS0kaRldgdi1E9A97iulfxxek70uhW9/dp+6QcIyBoHBlusYOdnVhsgtp74YB4jpWISIfyGYazGTiWt40ZBXpW1kLzsdo/iDQsLiM3v38UGn+HUon/muYmsC6bT9SB/6cWBhEIkPxBoyblbm92YVD7cHBIweIHR0BgGMPVaRG8R3MetabTlM5tGJNUiKitRCRHQ4TIhe3uTFeS0/49dutEPWQKEcmxFSuuHTyLuq3q/rhJSmvOF+q1AvGEykSlIHOx8+6oiT1KbBByzuYdjZ2IznQOIVienU4o/S1P5hvFsS+dMxiVh/C0spuaREdxxZjN6GOowl5XPuya4yofO3Y3TFDUa9wHxBldFZ3v/jlRQ3HmngQY4KPXKWAIwWxYRFRPhr9xsDKjg3bpj+k09Zb29aM6D4zewuCctd6r8r7vh+2kFxzDSgABMF5jzJTq3hks0+d8MEyWFIJ7DQZi+J0kwTxWQpwdOW9v1tK6SpXoAuE462MWc/JRxuFUbHP9FI7UWJPoIiKsZA143F1daCdKC0ZHt2ZvdLeQkgiE0ofTiS3b5D+9qyIkpbZ+buIspZe+s68VqFJt5rFt9LDUYzQoR6Tutfvyib7mbp4rSxV6jEpYuFHnga13hjNGb/3Yk/razTp5NkBdAXANpNQMdjrtx/O+SmBu23XLiCgvBch/Xh1mLzd1hIjjMI4Lpsm331IC3M0JGc1Rx4OFuHoq5qeRWs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXlJWGEyTEpaODl3Z0R2NGN4eUZzZFBtam84Zlg5aDZES0xVYUwyQlFENmh4?=
 =?utf-8?B?VE16bVBjZHlrRVQzZGY1R09pVURMMFFDQkFvRnZMdnFXOUdzbW1zb1NhSzcr?=
 =?utf-8?B?WS9hNjZNeEgvTzlodGE3NFpxcnprYW9rWFRsbGUzTGpKd255M2U4QW91NWg1?=
 =?utf-8?B?d0ZFVFViN0EyMWpJSzA2b0hCU3k0RDVEczljRjRxZmlhV1pjY3NWMEJFVHh4?=
 =?utf-8?B?cGF0VEFRU2Q2Zmp0cDZPTnVUR3pzV2RiMVppMXRQNlIrL0VXT3Q3N0xidjdn?=
 =?utf-8?B?L1lTRlRnTUk0alhFeStPRjJFVXJQOEVtN0xaVTM1OXJySFdwQUE5RUVOUDFX?=
 =?utf-8?B?cGZjUk1PT0Q2Q1J4dlVzUmlRc2lYcGl6ZmFDeGZKNURmQjhnR3lhYlhsdkxk?=
 =?utf-8?B?cGpHeXIvaEtiYzMwTzhCWlNRREdQZEVjQThtUm51Nk5UWFJyNWwvbllWT3Rv?=
 =?utf-8?B?a0VJQmhpQ3lPaEtBWEVyQzd6RG1yNzZzTDgyVi9yQXFCWGdFY0xSNDh6WjJ3?=
 =?utf-8?B?MXRUbGV4cEhLQ2p1WU1yU0ZGVmg2eVJ2dzIzejB5N01PRXI2OTRKQTZiUnla?=
 =?utf-8?B?WmVmQ2dmZmJjR3d4RWtVeTJIOTRPZDB5QTNpZytSanBMdnN1d3hLSUMrcVg5?=
 =?utf-8?B?MTA3NWpRUWxjcmpnaXd3dlptajJmNXFaMUpudFB3eVgwakdPTW5wRm8vS1lm?=
 =?utf-8?B?UllsbnoxQ1JLd3BLY2I1eUs5aE1aOFM1eFhaMDZ5bFRjVitsWWVCTVlncEgr?=
 =?utf-8?B?WnR0NUxFU0p4YnpoaGNtYVZnZWxoUnRjaC9tRkQ0QzUwRm1wMjVlcWRsbGo1?=
 =?utf-8?B?TjY4SUJ1cjNCaXBTN2Npc1Nnd0NhRFRWMjVRV2tLM0dYRGt2UHBQRzVmbGg4?=
 =?utf-8?B?aE5xS2pGd21pUjZZUVdaVzNSci9yZVM1Rng0VmVLRGRIMjdXVmxaNWJPcjdD?=
 =?utf-8?B?aEZjQzh0Q3cxVGVxTGhlWmdPNnBNNkFhRnIwSXoxNm1ublpNT2Z4bkRuZmxU?=
 =?utf-8?B?WVpGQlRDZFdhRlJuSmRNVGI2K0VPMHFsSlIxVXltUWtDMlFnckZOTVBYTlBP?=
 =?utf-8?B?Q1oyNlZ1bC9WU0RzY3lDR2tHNGVmTjk0ZDBDclFOdHZQNnZIbnlNYURSZi9y?=
 =?utf-8?B?ZStsOVMzVUw2RmxZUGF0YWpRZk9iZmNZSnozd0Y1K1M0OWhzWjJRRlN1cC9p?=
 =?utf-8?B?QjNNbFU0SEFHT2VaOTZ5LzFCazlEY0hRbW1iWFA4QytxSE10aGMyMlZkMUNN?=
 =?utf-8?B?aHVteTZwalNNNGxSR2dmSjdndFZZajAvSi82NGVSTUIzZXVaN08wQkVNNE1s?=
 =?utf-8?B?NEcwcE5QQ2pSRGswa0NMSERudUE5alFHaTlOTis3QVg1cEJBT0pEcW9aaXl1?=
 =?utf-8?B?QVBQVGJzZ2U4eDltQTVDeHVQRXFjQkdVN0hEMFArWmtNUUJuZEttd2lZUHB4?=
 =?utf-8?B?SU80eVJQTzB4YUVuNVdxSk4xcTkrVXBnWk54SzlyRDMrRTd3ZEs2VTFIaVh4?=
 =?utf-8?B?cHIzNUxRQys4SkRlWGVkQXYzSnoxdHdsOFhWSDJwN0xIeFhXSUVoMEZuRitr?=
 =?utf-8?B?UGdLQzJZampLR2hGSE1FeEFyWTU3UDJlU0ZEVm5jWG1kRzI4NlZCVVdQUXN1?=
 =?utf-8?B?d1l4Znd2MkJXemNXbEcxRXVad2I3azNhUWk2aFFVU3JVdzRWSTNJNzVoalVM?=
 =?utf-8?B?Z3VKdE1RdWlVdmZiT0VqQlhGMTBWcDhJNU05MW83UWNNNHAxZU5iSWdjUzZX?=
 =?utf-8?B?SE9mS0F5VEIwbjlRalBjVitzdkNoMWIzaHYrbXBFWXdDbm9aZkJMUG13Ulla?=
 =?utf-8?B?ME82SWRaNEY4ci96NExuUmttTU5TdFd5bDZKNnE1V3BjQktnbWljeEcvMjNl?=
 =?utf-8?B?ckNHTWhkWldjVUhOaG1hV1NOdFQvenlsOWN6bjdSZXh4KzhKLytMRmNTeFYr?=
 =?utf-8?B?ck91TjBmUlg2clBGOEdGZDYzM1QvUWk2M1lKSlFITXIzeTQySU9kVmtQQllK?=
 =?utf-8?B?MTBIUE1jdVhiMzEza2JuOE9BQW90OUtDa0VYUU4zMEpWTmtycldhMmJTYSti?=
 =?utf-8?B?TXB4MkJQNzR3aVJRUEZreDVLN2s2NkJ1cFQwTkp3TlNRNU5XcjBhZlc5RFor?=
 =?utf-8?B?bUVramloYjFpbFZsUWQydE9LQTM4Rlc1L2E4bkx0MDZLbGNSS29NMytoUWtm?=
 =?utf-8?B?Y3kxSFBqMGhwUXJCV1FSaXVybHk0eDhEd3VaeTNMYTIvOGRBR2c5Z2tYU1RY?=
 =?utf-8?B?d2tGU1JTWWNCZ2ViZFNpMXRnNk1vbWJWZWRFL24zSHVOWXAxSTl4clArZHV6?=
 =?utf-8?B?Snh0TCtia2tnbGgxbldsL2s1L0pMNmNiYzNodnp1R3RUR3lmem5ITWcrVmlR?=
 =?utf-8?Q?7jI2YsldRt4AwGnujj9vmtHru5gv1wiKgcHt7lO+2wEBp?=
X-MS-Exchange-AntiSpam-MessageData-1: F1ZDl5/OVFSIlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d632106e-8356-466f-1fd2-08de9c369565
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 04:05:40.0690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nLiueiTyYsI+hLqkVSnWydYXpMxlfjlnoxM822JD5XOSIaFfSxXBkTT2J9zpId6oKMRmmAM77CpHHmWIitG4LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282
Message-ID-Hash: GQUG6FEGVOVVWF7EWDVCPHCT373CQSL6
X-Message-ID-Hash: GQUG6FEGVOVVWF7EWDVCPHCT373CQSL6
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GQUG6FEGVOVVWF7EWDVCPHCT373CQSL6/>
Archived-At: 
 <https://lore.freedesktop.org/DHV4SOWXL1YB.103OO4XT2QR2J@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Apr 9, 2026 at 6:36 AM JST, Timur Tabi wrote:
> On Wed, 2026-04-08 at 09:21 -0500, Timur Tabi wrote:
>> +=C2=A0=C2=A0=C2=A0 Offset=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0 Fields
>> +=C2=A0=C2=A0=C2=A0 ------=C2=A0 -------=C2=A0 ------
>> +=C2=A0=C2=A0=C2=A0 0x00=C2=A0=C2=A0=C2=A0 FIXED0=C2=A0=C2=A0 bits 31:0=
=C2=A0 - Signature (must be 0x4947564E, ASCII "NVGI")
>> +=C2=A0=C2=A0=C2=A0 0x04=C2=A0=C2=A0=C2=A0 FIXED1=C2=A0=C2=A0 bit=C2=A0 =
31=C2=A0=C2=A0=C2=A0 - Reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 30:16 - FIXED_DATA=
_SIZE Fixed data size (offset to extended section)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 15:8=C2=A0 - VERSI=
ONSW Software version
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 7:0=C2=A0=C2=A0 - =
Reserved
>> +=C2=A0=C2=A0=C2=A0 0x08=C2=A0=C2=A0=C2=A0 FIXED2=C2=A0=C2=A0 bit=C2=A0 =
31=C2=A0=C2=A0=C2=A0 - Reserved
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 30:20 - Reserved (=
zero)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 19:0=C2=A0 - Total=
 data size
>> +
>
> I just noticed that this should say=20
>
>                     bits 19:0  - TOTAL_DATA_SIZE Total data size
>
> to match the documentation below it.

I'll fix it when applying - staging this for merging, thanks!
