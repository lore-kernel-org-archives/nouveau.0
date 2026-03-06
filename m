Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04FF513F6
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 04:52:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5110E34A;
	Fri,  6 Mar 2026 04:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VvrAU+FZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E3EE44F00;
	Fri,  6 Mar 2026 04:42:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772772149;
 b=PxbtS0NUVpGnpq5qZaFZRNvcqvSKCIiXnQasrrKeXPd0g8Q54Xd2tmve4ifMwxaXTbwrq
 ZeG+U5lmusZzCTTCXGpm46XvthLtrj65hKS01cmh90R8pwm7cp5dSEvEZrBjNAlyZe109wB
 wmv//1gB9EaHsVRXy0C3HjVKyaoVA6D7p5RX+V3SP0Eq9HyvtqNWvy1+aasD1uTZNygSp0k
 fXfFgDBKE7eHDkcIb/OXelryzFrtB9A2aWoQsyIGRk7cg3uMJ3Sl8EmsJp/yPKc90i7EVPq
 Y+dvdDusi3suPjw+gVo0XKGu+iMDRiXFnskXBtwFbVbtFfuP/yp7AO0LSNgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772772149; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nNrZZyC9HYyzpPCGxCMceCDw1/J/NmPVreopXzC4KdY=;
 b=X755rEOwfhmNDISebXvBszQRU4G6+x49g4p+ejdsloj0CNfjWTor/erKGghW24Es+r+wI
 wUIWPvwmj3kyhs5w+fcqUKFtI2aD2TU7xZ56axqGXS/vFSpHNSfVJcnZg/XCyM/BWTh2i6e
 XTqXJ3a5SOhvwc4v8+JftVQn/FM2c4Ns6H7S9OLU0PznbLLPi4hESLvGvz0sArctN68AvEr
 vPnJThY1tzXJQstJ35bxH6CSxN0VYlcAA8uJjvUwWVcZ4v761MMQL4Z3BQLNwstXKNoZiSz
 aFtu+8hkBKlRa7fhmIvMBq8oqUgaJysy7lvu1/2fH+bEqXjD33f9AqhO7mzA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 936E840760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 04:42:26 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7010E0B1;
	Fri,  6 Mar 2026 04:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUpphxwAnjja9qYDdHONGsVoTH12w5/2SRiRj9nScve2AVijce4zDcl1srZxbFJun5ta4hHGSK6TtJeWEEtCQeH4bdVwmX90XvYIMeg8mdvhl/bX8qRpbUzIYGt01R0PkefagbO+MbnVJJsIqsH9Qqi7PmIOnV0/8xviIIEFpX7mV/XTXDkf95iGsX9rpO+NF4gpwvfuO76HmWDN36NLwUEpgNi/2RtqHj1KACh3z/lwaMNhWFYSj71T9jRb2QnUnuEc4+Y5tPaBfaqp4I93dE/MlU3tljIE+WI0gzj5G9cNkOBzHpajjQEWxy2Rt8nGJkp907wGkK1VZrwShkHLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNrZZyC9HYyzpPCGxCMceCDw1/J/NmPVreopXzC4KdY=;
 b=jXibBi8n5agnKu5OTNx/vRLz5Xrl1kFcLODdY9zGsLRxqXVydqO3RAJlT8B95EZCFRye8oXJTb68GWEc6RGmDgb5drYjXEyfv0345UlgqqxOuFJsqgVUwI4DIB1o5r4tTK4E12qZCmfxTdRpSybTCtEKz3jIEWhdXU5NTbAu/tsgAX9oBrINROKNtjfMPbpFOVbkSkABm+2lvwlP9oNtp6Nnup5H9JrPs98j0cNBQM/etJzYtS+co1L0AW771YWGPL58HFVJXdG6wB1YEwcUBukcoVObgyGIxC0As+qMfVr7Lrfh6AQlZvUr5xlSkqIiMh++Lu96GL33igjPIsUwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNrZZyC9HYyzpPCGxCMceCDw1/J/NmPVreopXzC4KdY=;
 b=VvrAU+FZfFbby5XhDh6RA+ECXDDp0iPlCtc1AVhQRfRipVC/LnEwvjM8jdrQyIC64Ol31rQ2LkGjjFNGlITlssRVNuTNoVWDMwnqPQw2qvEZqglq7gNpsoV5niSzUsHO9RBDQ2XNrFRl1WmXxdlDF5fc34dI2MfzNCVSF212oKMDA8MBKvFF0/3CG2ieTtxOTwgVOYjiZrT+Bv+7FzE1tM7VFhb0hHCZ84K0GY3VQfk5smW3rtLhtqFCwlye1aqGbd86FzEU0DU9+xBQhPrpvdhHLK8iHFADb9sdcY43Dzlq8vWTdSYq3SnwPfu9iz8zxzU2oqPLdAjvxF2692frcg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:52:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:52:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v11 00/12] gpu: nova-core: add Turing support
Date: Fri, 06 Mar 2026 13:52:37 +0900
Message-Id: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMQQqDMBAAvyI5N2UTTTQ99R+lFDEb3UOjJDa0i
 H9vlELxOAMzC4sYCCO7FAsLmCjS6DMIcSpYN7S+R042CyZBapBQ8fkVyPePKeDEtdNOVQ5Fo4D
 lIktH7313u2ceKM5j+Oz3ZDb7+wh5+CTDgcuyURJa29TGXH0iS+25G59sGyUB/7oEcawF5NxaV
 IhVWXcaDvm6rl9ucTlL5wAAAA==
X-Change-ID: 20260204-turing_prep-6f6f54fe1850
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cba6276-cbc9-4c17-a7d3-08de7b3c350b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	V+Xl41ULDlFN0buaPqcOdhABJ2vYCcsJUUaDUz0Tr4p2LPOKm8YNwFIxMQMjbAJwRoUvE+BbZ9bMVBj15kgK8AXy39MA+2zMiTrvOJTfOetUIhHfyDOdG1Oo1B5TnRT8EGsJDDv2HrrYkaIqWO/jkY2lDXG2yG2awq8Jw9OLi41Q9og6CufjaV+6t2cXCTrhs5wtYIChk0EmbTcb86AB6vHNHxsH7GeqNyOPrtJbeHQmdHGyvGUrqoHjvqahhxr1y8bnoKKvVLlKa5xBGnnNGgNyKUTZhZsrDgPEicOJEKEfQLMENlp48PJFTT8YQgEHleaSoigpCL9yiXuOuXUOHCGMBU2dWi5rGeQdjIpjRyakEyaDNrLUd0al3e/WboC/xBEIoTRISQvtyxfgR1wRu3Td87xSCGiEF6b01+fimWon5mFlQ7qKV+hlGlXDtxuC0TdSsHZD2MJMiiYCHreFnCcLIum4Mpb/nQjlaDQd5jHTt+djU7T6bYj3PHQphrMIywYZPitv3fd7L2FG17EbjvxgSUDHkOLKHZ6xu3ULThgzEM5ofIKbknXJlWMlHKX3PgoXduABZaTTNlq05Gl9p3YVY+0LBZjZS8BMfeROKqW/o7RLmijzOQNDdCdYXwqs22xgig0SoAUoKXEq3fV9f4yCgnqOQPRMamaHpDFHS6YpdOuKS6FTQFH069uU/DI4UKDpw8KlbtA9Prac+qgjWm/CNht/rWTXNh5QrOV2xcsaXgfV8c/B2qWatjaSAMa/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U01CSWw3cnJLTXBRa3RCMUxpMlFodmU1RHErZHFnT1pWckRNTjQ2RjRpdk9K?=
 =?utf-8?B?UXc0OG0xY3VYelJRbWJvTGR2d1ZiMmpGa2p3cVV6SWxBZGlLZUphZVFtVFhr?=
 =?utf-8?B?b2lRNFNSRDhVR2NUWFE5eHFMMW1oSnpDcHJyWTFPWXFTU3A2VDViQmltTzlV?=
 =?utf-8?B?ZHliczh0UTd3bE9ZS2dVM1FVQW1rZ0JzL2FSbDJMeHQxSms0TDBpT0FPRmh3?=
 =?utf-8?B?ZVNtWmZGdGJVelFob0N4emlvKzVjM0dWMGQ4T2MweDAzd0tIcHJtYnpJWUNr?=
 =?utf-8?B?YkNEeEwwZHZuSWtCWTF0cTdqdHVFdno3Rk8vMk5tVVZVV1dEVEhUUzA2ZmlT?=
 =?utf-8?B?VzVEczRCcXZHdWlrd2tKL2ZIMnM5QzlsNTd5bDBHNFhCU05zRmJWMm1lZkQ4?=
 =?utf-8?B?WGlpaUkvWk96WFFmSkhpQm5PcFR2YzhFQUkza05NZCszOGxRSi9vVmQ2M3RJ?=
 =?utf-8?B?cDIwVWtiejFSVkVTVVhJS3BaWFBiVlpOaCtDb3paWEhrenJpVmYrWHYrenFD?=
 =?utf-8?B?MDd3Qm5xN1QzTXF6anF0ZTVaZmNKMXlMaDFkWHZjb0RvRnhCTnZnRlRpRVB5?=
 =?utf-8?B?MERDdVh0bzRXTlY3QTQva3dWSExnWGxuN2NKbFdFSlhveHZXM1VhZEtzVjUw?=
 =?utf-8?B?NHZBQ2VNQVEycG5ybnRnNU84Tmd3RWZLdnhaMXY1NEFyLzMwajVOUkRTUUtl?=
 =?utf-8?B?OVFlU2FQRjFHcnhkUnAwVFlHTmFGMk0reDlPVmN5ZEV5TGxaNnpUd3FPTVhV?=
 =?utf-8?B?N3ZRTDFzRzBnaGlMSE5uWFp0emxWYlI4L1V1enlMVzlCWkpZZjlMc2FmMVlr?=
 =?utf-8?B?cWl6R3J2Q3lMcnpuSllhMGdGZkovcWY1V0pwUXZqbGhmbUR2T2p0NTU0YlpD?=
 =?utf-8?B?ZlF0VTkvUjBWWjhwYVhVZjI1ckZ5ekRTTnhqMHZTaUVTOVJQUmMwaWFLMklH?=
 =?utf-8?B?Tlgrd1dLMzNWdG9wa2d2VXVFbzUwelRnTGZZbWR1ZnJHTnBsaExqSWZiUDJG?=
 =?utf-8?B?RFEwMGdnb2UvM2FVeituUVBjYkEvTThWRkFjcE95MkVrWE1VVVNFT2NEZkIx?=
 =?utf-8?B?N2ZqYVpWOE1Wb256bkkxYUFCeHY4RThHZUNwdW1na0t6NFhGdHpuWFRodUJF?=
 =?utf-8?B?QjZoR1grQ2JocVV5UkVLRHBQRWdTYjdqUk03dCs4ZGlRTTFJdTV1alNFRjd0?=
 =?utf-8?B?WDJtTHhCVjZEY0gydUw5QlVZWGxDM3d4SE56N2ZHOVdvUGRpV2FxMjN6MlpC?=
 =?utf-8?B?VEdJcWlRWDlTWFp1eXdpeUkyMWw5RG12K3E3N0V3WFVIQ0xDNElSZWJINS9Y?=
 =?utf-8?B?S3M2ODRaTVhUV1RSVVhiNVlSc2JRT1ZNYjFGdTMyMzJaV3Z4bDBNakVWajYy?=
 =?utf-8?B?QVR6WkVDKzJkU29uaEpWVXh2V0s1VjdxNE1SRkpSMGhiYU5yamhTOE9sU0o1?=
 =?utf-8?B?VXZCMy9ZY2wxUnBlQnRTQnZrWFBmdlcrUVN5N3Z1T2FxYk94bzhLLzQrR05m?=
 =?utf-8?B?KzNxdnB5VTNKVjc2WXAvUzA2NFQ3VjlCL0FaZ0ExeHRmOTlEVFVGUGF3eFdl?=
 =?utf-8?B?VE9saDJrME5ta3B2dEd1azFPdU5BLy9IQStXSFA5NnV1MCtMRUFnYnh2RDRC?=
 =?utf-8?B?VGtUUjY3K3M1dktHYTBvTENoek1pbmtpWGV2QU5VUHRPYmhaQkJZWFhhaFc3?=
 =?utf-8?B?dVlLQXZKd01LWVJLNXhPaGxHK1FJL0hZcUdWWlZZSFJPMVBRSGpHU1hNdks0?=
 =?utf-8?B?MUM4bmVZYS9oenJFSlIxKy95QXN3WHVvS2c3WUVxcEhNSjU5ZDhBTVc5U21M?=
 =?utf-8?B?dk9JZkVVWDhvcHBteTF4dWJPM1UyNjNCVEtDZWU5RHVlMjg1ZUVkbGs5YjFS?=
 =?utf-8?B?b1lqdDBTQkhJZkJYZEh0VTIrdmdCc1VJSC9GempETm1PU3lBbmRxbXcxM0Zm?=
 =?utf-8?B?Ky9RcG9PU2YwTTd0ZHk5Wk1YRldEd002MHIyZFEyU3FvOFVvakhWRzNkV292?=
 =?utf-8?B?amRRS1Nrcm1wdUhRM1J3MUI1TE9iTzVTa0F3UkNlMFFjU2N1WUhYWkJVeitn?=
 =?utf-8?B?dk5yR0tLRGgzVUFwQVJoNU5OS0o0QXRZaFV2ZHh1S0pRVXYzOVBVUGFtVEhL?=
 =?utf-8?B?TjRVVWxZSC9LNHhSVEZJTjJEcEJqMjB6eTM1V1JjL012endUZUx0ZGxlWHF4?=
 =?utf-8?B?WGVtYkFKQ1Y5ODRCajNhSXRHa015TTZTMHpEUzAvNUkxSjJBeVhLUzBleXk0?=
 =?utf-8?B?bGNWRHpJUVhSZk5MN2huU09HZisvUWNVQ0Z4YzhrVWZmWkZoVkdIT1k2dXJM?=
 =?utf-8?B?ZkNna1ladWJuRDNVTXhDVk5qWHl0RWZ6K0Z2eE1URzhmNkpLK1d1TEJqcGk4?=
 =?utf-8?Q?TfUIH8fht7hJknwHC9lPkwFD+VQ52mHANVn9aLEeh9sHY?=
X-MS-Exchange-AntiSpam-MessageData-1: IHpoYCTiQXfR4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cba6276-cbc9-4c17-a7d3-08de7b3c350b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:52:45.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cw8is+srLDAYquOuH9OCyWw6ISa40Cb9CMe5kUlGla2ZKxzMWLf1tKhmytknakuJ4J1X4Nb+SWjZUjpzAxLaLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
Message-ID-Hash: P6NXILVKLXC3PCOWNGVGZFJFOODJ3NOF
X-Message-ID-Hash: P6NXILVKLXC3PCOWNGVGZFJFOODJ3NOF
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P6NXILVKLXC3PCOWNGVGZFJFOODJ3NOF/>
Archived-At: 
 <https://lore.freedesktop.org/20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patchset adds the remaining support required for booting the GSP on
Turing.

We did a deep dive with Eliot looking for the reasons why some fields
involved in the bootloader are ignored or used apparently
inconsistently, and this results in a more documented flow and a few
fixes. Apart from that, this series seems to be stabilizing and
successfully probes my TU106:

    NovaCore 0000:08:00.0: NVIDIA (Chipset: TU106, Architecture: Turing, Revision: a.1)
    NovaCore 0000:08:00.0: GPU name: NVIDIA GeForce RTX 2070

This series is based on `drm-rust-next`. A tree with all the patches is
available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/turing

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Changes in v11:
- Fix build error/warnings and rustfmt formatting.
- Address incorrect IMEM section start offsets in FalconUCodeDescV2
  and better document fields usage and unused fields.
- Use `get`/`get_mut` instead of direct array indexing when accessing
  firmware content.
- Link to v10: https://patch.msgid.link/20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com

Changes in v10:
- Store the firmwares into a regular KVec and move them into a DMA
  object only when actually loading using DMA.
- Use `try_update` when updating the `NV_PFALCON_FBIF_TRANSCFG` register
  array as its index is not build-time proven to be valid.
- Fix alignment issue when processing imem section of the FWSEC
  bootloader (thanks Eliot!).
- Link to v9: https://patch.msgid.link/20260212-turing_prep-v9-0-238520ad8799@nvidia.com

Changes in v9:
- Add a few preparatory patches to simplify the actual feature patches.
- Use a wrapping type for the bootloader.
- Simplify the falcon loading code and move the complexity to the
  firmware types.
- Add the generic bootloader files to `ModInfoBuilder`.
- Link to v8: https://lore.kernel.org/all/20260122222848.2555890-1-ttabi@nvidia.com/

---
Alexandre Courbot (10):
      gpu: nova-core: create falcon firmware DMA objects lazily
      gpu: nova-core: falcon: add constant for memory block alignment
      gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
      gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
      gpu: nova-core: move brom_params and boot_addr to FalconFirmware
      gpu: nova-core: falcon: remove unwarranted safety check in dma_load
      gpu: nova-core: firmware: add comments to justify v3 header values
      gpu: nova-core: firmware: fix and explain v2 header offsets computations
      gpu: nova-core: make Chipset::arch() const
      gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder

Timur Tabi (2):
      gpu: nova-core: add PIO support for loading firmware images
      gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

 drivers/gpu/nova-core/falcon.rs                    | 315 ++++++++++++++++---
 drivers/gpu/nova-core/falcon/hal.rs                |   6 +-
 drivers/gpu/nova-core/firmware.rs                  | 107 ++++---
 drivers/gpu/nova-core/firmware/booter.rs           |  65 ++--
 drivers/gpu/nova-core/firmware/fwsec.rs            | 129 +++-----
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 348 +++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                       |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  17 +-
 drivers/gpu/nova-core/regs.rs                      |  30 ++
 9 files changed, 820 insertions(+), 206 deletions(-)
---
base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72
change-id: 20260204-turing_prep-6f6f54fe1850

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

