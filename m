Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E2E9D82F
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 01:17:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0D3110E194;
	Mon,  6 Apr 2026 01:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZRNUTnm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A48E24563F;
	Mon,  6 Apr 2026 01:06:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775437563;
 b=LBul/sax56MBbN+aWL9q4fEiaxnJu0Uw2Os6m+iAGd51QMyD1qL2AUOCGJZhtFJCywFfV
 J39n9bfzlGKVT0bKyZpnR5fRH828AYrquLpqGdkocA9jh7M9IiXu2r/3/sP+bLqJZjkI30A
 TDVk36xu+i/OzpG7TTQeK7RaFtnJfmGYY6EImXutEh6C7yolQgC0dZ84U+DzU43CmMk7y0P
 CGScr3MaJtOEwmc2MMLxNgfQJnwqT+qg26vkYUbieRR1gTO6IEpWbUSOupIZ7gtbQ7MqbOW
 bq3F0PN8SeA5ESgQ56DTeBwOTRzuKSjxGP208dJBZUq4MC+ETzkJt6VATzcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775437563; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5MUpOkMl4hx0gxmxXlL8WrBBRYaoEl0aWOoAXu7IHnc=;
 b=njJi2kGae9cgHLfg/JcN7C0YwcsPK2pEl7mFV9X4qwy7dKRUyBegKNyJHB9ZYXBJlOz1t
 eIqCpfSe4hIJuQv5vCEs52M6vlTmghX67c9AZ/FjSMN5M8Gpduvtb/ULKw1AtSIZ8T1othl
 6+Rmmmb3xSwovBRwZZAsFS+0iQUP8lFzxZsVvKTIRdg/fUVnsO9v7Tsxq+40VVPbVereWP6
 eVBdVJ7AjVyoD1aOs6d/636/6WLEQHya9QdCOYGQWImtvdLx9sJkzXebEpmfBMV+tIxtLiZ
 /fkE9duSq2DJa6SU1HijxAFmmXcVrKScjkogAvwIwAXpy6LOLE83L4GItSlg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 445DF43DA8
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 01:06:00 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3784E10E186
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 01:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkam9g68beD1TFKP4vJp+Gn9DlSYKywXCrj359JXFf6FlHhz226GxmErgqMSqWOOdy1SrRTPNojU6IjQdiMiVelVFUgEw2KdUyjh+nEmksv7M8KMas39m6MU8pxVNe6cgFDbphkQddEDdYRqqazGivJ5x7BytgyCnlyt8LAv6sr3x8APUcWZQh+v39FE+OBjRatPmYq6LYHk3cJXVPK/g8794XDTnvUwaXtMND7SzhF7JbiR4ZBsX5ysltWNWdEzZopFEthli3rGEi7YY7dhzlla59NaYTev76l1LoAQ/gKQhRmlePIWFACUGf0rCm05LaA/DNp5FP8fBch+2tJArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MUpOkMl4hx0gxmxXlL8WrBBRYaoEl0aWOoAXu7IHnc=;
 b=sP2s2JTpl7fXB9U88YMKdp8GN5DYfXdNUSyNAaqtQ77GsPbsawHgW0BKyccgGlVLwtSGiQM7H9vTGvXB8nQFDaTIRrHhwJH0nPjQVOaq/2nDfTIHnFoWT76amwmY4G0X3wuKbVmzu5TyRMODYFuvEiUrpZIobrb7tJuBEbOp0xROkojEe9p8n9jiubf9RrJ6y+04kyEaHlpJQl6MOFg3WVS7fVhlT8nqrFUFsTDoh6I9wm+UUsiQlLW8m4aGOqaK1hxkVsGl3vs27qkrbIroENUAI1MH8f35bnaB0tNLIXsqtlg3lKNWzTJSxG23Dq1EPinu2Zzp6x+aipWJdMk1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MUpOkMl4hx0gxmxXlL8WrBBRYaoEl0aWOoAXu7IHnc=;
 b=cZRNUTnmTzoQXet2Bq64W+O5K6cbutSiGU3IysxSGMcmrZVbRj4NkPRwQPydzXK35czCPjrxVOCCk6dHssn6Kvi0XTQmk1rxP4f25RDXdZOvgw+nrnszfOv9ILDZzS6v+1FSUxjMQurF4kyE/FvMaulq+GjAqQDO1Z/y4am43Fmo6Gi7P2Z7e/sCSrL+bpEZRKSjD0uSRYbU9t2H779HFAsOuBQMAeRbQGuaTeuGKtVWTG7b/fG5uZbs6jPxD+vgOK3OM1/9S09L9n33lwpp9qSq7d3wCc6jPeQUV2dcV+xPgQufGZ7x65MM5bglWNc72MwGzLRt1yxws3iMmbtWjA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 01:17:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 01:17:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 10:17:24 +0900
Message-Id: <DHLOBXHYJDLY.7TN3A9EM5LS5@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: fix missing colon in SEC2 boot debug
 message
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "David Carlier" <devnexen@gmail.com>
References: <20260331103744.605683-1-devnexen@gmail.com>
In-Reply-To: <20260331103744.605683-1-devnexen@gmail.com>
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: e50325f5-fdf4-46e9-d2a0-08de937a443e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	TDzmVdjbI2DxSWToK/8eQjxndXotajoUUAXnk4GzJvUAP0793fH60yEvRzPpKp+nvCKbQk25lJd/gBjRzBsO0dxMEt9ZVBnazXuI8BmbDV6fLsrm2hcCSRnfe/6s3kmB8asqBPe+EDnW83MVFlBNOyvpLLNrMzzre7+BwyY0oMN227QcZbHXogVQHi+p8bq3CoSJcJfoll1Re1fPNFjFn1fdJYb4dL+EkR9GJZge+QMFlxRPBfoEvzbFQFYfXTUobuy5ugpO9P50VbcTHW/CHU3oZ1roWxzyxS/ai9P8smdtT4O9Xhor/Yf5qplS+YlWiDIr+Gr7ObMo2yw/PPe3AC6YulVlYaq8P3TvvgcAYrLsR+V0xgGWaHVnDeRcnPTJwIqS5abi4f3a0PWaz3NDuQuyKYpdaiacVSwju+xKY9JlRqSNmeJaNY60KBff/wb0jhNKKiCGg+y2Hsi9W+IJgx77kI/iMB7e960SMrVYhZu6w53ufpWnup+gdEfTqAOZONZ/CAJ3oFbWKohdpNXvFxtUiZrXlXp/r2NbU9qT/GBu0xkbKVcAsuPUIOGW1g1BvQ0B+iDhQd1xMZqM0x7y1gSVY/CE4UdfggK6mLNeQ58AbuapByYZ+xRoETfD+8uP72N2OxbjJeSghdun2+FMYtXScNEV+3fcGdGzIdpPi7YSgDgR5ynVNIbhfwW0UgFgfNmEIsAhp2Lx1fuMcqB8QQxlz+RMj3ffLzbfKYpa5TQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWpnSDEvVGRxQU5aeU15YldnSlhNZHkweDRUdGJpMk5XaVNXNmZzbEk4ZDhW?=
 =?utf-8?B?RkVUV3ljZ3pUOTlJMGU1MW1naTg0bVdNQkJxZndTTnppSWxWbVZ4ajZjYk53?=
 =?utf-8?B?TW9mK1FwUFNwNWw0b1hOTEY3Y3JYc1F4Y2MvNE1seHRzQ2U5WFI3UzNxVzhU?=
 =?utf-8?B?TFpqODk3VTFEaGZKUzB1NWZGemVjVVQyNjF2MVBoSE93NnRvU0wwOFBHWFBj?=
 =?utf-8?B?aHRnQnlqZEZqU1dHVVZCd2RHRSt2dXJRWDJIMzFlZ0l2a1RldTEwaThTRmw2?=
 =?utf-8?B?Mm4zU0VGZmlyTkNSYmxEeXptdnZTbUlUUCtNWFZEZXdmQkcrOTFON0N3cC9o?=
 =?utf-8?B?dU5PMjE5M2I1d013RndBWEpQLzdYZ2RSeDQ2VWJWR2FOUkJpcTFMTXNNQ0Ny?=
 =?utf-8?B?UXpwWkZkTnM3L1VUWE5Kd3JLY01kdmY4MzFzK296VThYRHNlQStSeFhrUjZI?=
 =?utf-8?B?b3pzcmxwL1FQYjNneVhMNFdJSFBub1UvcXIyeVlYeUFLVlFDczVnNlVqUm5a?=
 =?utf-8?B?QUQrbTRnb1BOaGh2REwvellQNFVEc0w4NDlEMDRoY0ZHOC9KK1NVRXZzSDJC?=
 =?utf-8?B?QkkrZ01HRG5iYzBCRFg2TmRSbzgrY01adDBlTjBlZVdMT0x0bDRXdkFVMzdK?=
 =?utf-8?B?MjR3QUNYcVBhaXVsajJQTUczaXdMRm1uTVhRejJxV2xYTmFrOFh5RlZoTEdI?=
 =?utf-8?B?T2ZFL3J1WFg2M2VtU2tHa3RGeHNzMnJVSmNSWU5iZkxsT01JUGdLZ1JaL29G?=
 =?utf-8?B?c05BTWViOTRXRjhuNTBOZHQ4V1FGQjVVVGpad3F5UzYvUHdiRG1FMlExc0VZ?=
 =?utf-8?B?Zy9COThGV1VxY3JLTWRrZ2p0cFdVWUlYUXgzV1lWNGNhWEJ4ejUyL3FuSmNU?=
 =?utf-8?B?M3RUYW1zN1hsV2RaNkZtQ1BRbklKK3d6OVViaXY0eVlFYmIyV2JMS1lNTExI?=
 =?utf-8?B?a0xzNURYL3ZYMjVudDMrdWROcENtSjFBQTZDa0pmcU02MzAwYnJaMjRpSFpI?=
 =?utf-8?B?ejZuRGw5YzdKNzdvZDErSjh4ZHF2OGNxSkFVeTRTRGZvR0kvRHlEMFVTaytW?=
 =?utf-8?B?UTRkbTlOQjdwR2sycVkyQjVqWmVJYkhXOTloT0hPWGY1T2xtZC80eDFmcUdr?=
 =?utf-8?B?UnRjSGlja0dJYWlMUFpQWmQvZ2tuUHpkaHB3SFY1SUdZb2N6SXBBeTh2Y3Mx?=
 =?utf-8?B?RzRIcWNRUjE1YlZ6UTN6b3FYamhLRkRpY2JMeUlTVkxsVG9uMXNBZGhOalhH?=
 =?utf-8?B?dW4zMXJKSmlhNGY4T0tTL0ZIbVAycFlickdJSGZRdnhCcGZLVUhwSHhUUi9s?=
 =?utf-8?B?czdqdi9sR1U0d1ZJZzBsdVpGUm1SSmdYNTZpUktxWEl0cnRNdWtFZjJuUFJI?=
 =?utf-8?B?N0xjcHM1NEw1aHBKM3lqVmxqU01yS0N4Mk9BR3RWRWs3VDAyMFVsVVp6U3Z3?=
 =?utf-8?B?VzRlNldZR1l1WGV1MFVVV2pWdjhpNWxDdCt6aVBaSnRYejB6SG5pSlM5Qm9K?=
 =?utf-8?B?N2NYbS90RXB4ZGtRZTUvYTd1aVpLSUNqZDdYOFRwQTh2Z2ZBcVpCZzQzc0Fz?=
 =?utf-8?B?ZDRZSUN4QW0yTkpQYTdEZUd5K2lxOTloYVF2dGpjb25KcHN6aEZVbEFZa2F1?=
 =?utf-8?B?ZmljSkFVUDYrbWRwYldpVnRqYXlJS2JYYmt5T2FIS0k5RElyZFYxWlVQU0JO?=
 =?utf-8?B?T0UydktMZXZEUDN2ajVkWjFpZE10bk1XQXdFdkxjc2VYbVg2R2wyL0lZSkJB?=
 =?utf-8?B?bFRDZXp1TU8rVHBWZkM0R2F1T0k5TVZBdnJKc2xXTDM3MmlkMmdpdW5RWGZu?=
 =?utf-8?B?aHZ4aFZKSlpuZFA2UzMyWHgxMk1zRnlPL2c0TkE3QlowajkvUUJrenVrVEtB?=
 =?utf-8?B?NE9vNG1UNkZ1UG4weXN1YitLT2plQmJ0TEd5TENUSEZGR2RDSlFQUWwzNWpP?=
 =?utf-8?B?YnMzZmVxVlpuZFdGYXFIV0ZDU0VUUncrRUcrdThBQjU2bTBVbEpWVHUrWGh2?=
 =?utf-8?B?eTBDOURlWDhISEdSakRIV1hKSG5mUGl6SFhZdW5JNnp4N2QrYlFoVk9GVmxs?=
 =?utf-8?B?b3JFRVc2d2hjWHkzRTFORjJOMk5HQkxzTUdiRDFTY3RXYVVHaG5PaW9jeUxD?=
 =?utf-8?B?NGdmdUNsVmRvUDZQeFBVakZ3UytYR1VRMjlDWllBd0dZR29VbWdxclBJbWVy?=
 =?utf-8?B?YUIwVVlaMm5Rei9DSTgzYnQwdHlsVk5DcE43UkhNNTJLWEZiWVhHZk1kcWVW?=
 =?utf-8?B?Qkd6QkNMUXBMS2lLL3ZUZlRQbmVYQ24wdjVtTGNSLzcwKzhFc0Q4VkVJR2NQ?=
 =?utf-8?B?NWRkOTdXTG9udDU2U09CWmYxTkJhSGdQSCtINnd0cDZWTGJjak5BdW0yMmxO?=
 =?utf-8?Q?Src8O1c43Zv2+jE0sTWZzjJeDWAvAHJbTsATjPLFkxw79?=
X-MS-Exchange-AntiSpam-MessageData-1: 97tapzDBnG1ptA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e50325f5-fdf4-46e9-d2a0-08de937a443e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 01:17:27.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mLKjjJ0wIa6nybbD5Ya8m2LrWZmJO/gO0cy8KVR5orl8hMC0TI05virgJP+wH+hAKjkAFEXWs5TSuJ/D731okw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
Message-ID-Hash: 3CDSYC6Y4HCUN7M57WV2QDDFN55OHISG
X-Message-ID-Hash: 3CDSYC6Y4HCUN7M57WV2QDDFN55OHISG
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3CDSYC6Y4HCUN7M57WV2QDDFN55OHISG/>
Archived-At: 
 <https://lore.freedesktop.org/DHLOBXHYJDLY.7TN3A9EM5LS5@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 31, 2026 at 7:37 PM JST, David Carlier wrote:
> The SEC2 mailbox debug output formats MBOX1 without a colon separator,
> producing "MBOX10xdead" instead of "MBOX1: 0xdead". The GSP debug
> message a few lines above uses the correct format.
>
> Fixes: 5949d419c193 ("gpu: nova-core: gsp: Boot GSP")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 6f707b3d1a54..18f356c9178e 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -195,7 +195,7 @@ pub(crate) fn boot(
>              Some(wpr_handle as u32),
>              Some((wpr_handle >> 32) as u32),
>          )?;
> -        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1=
);
> =20
>          if mbox0 !=3D 0 {
>              dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox=
0);
> --=20
> 2.53.0

As agreed upon with Danilo, pushed into drm-rust-next! Thanks for the fix.
