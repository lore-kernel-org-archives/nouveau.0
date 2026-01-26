Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D21D19519
	for <nouveau@archiver.kernel.org>; Mon, 26 Jan 2026 20:23:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9219010E49F;
	Mon, 26 Jan 2026 20:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LlEALUGZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A4F640ADC;
	Mon, 26 Jan 2026 20:14:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769458468;
 b=pB58BPOXq83Fbgz0Wq8SKr3Rm59cfNIqL+IzkiTJy2T38Dn2+dTx5m/OX7HC8ONcWv+Uj
 zuOfkjnV4Bqx5TXZKAc+8xdQ4U8ewGq8AB5W5Gac9snyaif+dCYqKwQAjL/dZfL/YB0NltA
 dqCTLbx2FbEnAANPATHNBui03NreEM+9yT7vkxfjX7nNgXNJHv2o4IT55CjV7+XA+NmptOT
 8ykfJKO2LJuHXM2pDmyb8wv09M18Ozn3iyZw6iInKBru1vOeZps6Qo+qNoxxcDzf6l2ZzQZ
 eQ+5QtQTi4tkZYSjFpUEnlpB6NzWnQkKZ9lt3YKM+9rhkaFyc0I5M9F1DcJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769458468; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Bl9J91p+RrmoXb7AzODvS+jKVwwy3HqlSSZAM2xHBNc=;
 b=07J5gaXAeOrbF9qiG8KNXREHnbOsg1mL/C3SLDD+mR2ByI0vY8LSDATxQ6TCxV2l+7uJ7
 uBR0dh5kA1USkcL0U97UXx0BkOX9fFM3xZKlpXVNmqVb/JcEWcXZD9bKBsswp5V/eExJVO3
 tBVO5538DHhSMBW+X8QBF7iTGiXEoWjE9ZEpaDgmaY/l8mQwVJ0ewB3w5hH+mZQQVt2tqVo
 7QQtYsZV8VNyGv99vZcmJMq1o4Jv7DXZ7p8Qnmbnkp3MQR5AahmCt40rtgWtrb5fM6l1PKg
 7OIvnhr0cQwJyrHz1MIXGzOgX03muj85pFOpeewKlPOcKe66dw6GUmQ0pxAQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7099B40B86
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 20:14:25 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97A5C10E48A;
	Mon, 26 Jan 2026 20:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnC8fe0Glt56WXMTfQppxVYG/518wuHJPy0xpMFpYE9SoK1RTm8fKrCrwUtYoCOyAJGLK/fWQ/Xh5gVmaYEgFaZWH5qtf0wav33uQ8XWp+wn/Q5L02qo3jX3jvLkUy+BPA0BqEFUYEPJXgk9gwu2KY7+zuvQzcTWKfZ4GCg99p4LCV8vPH4UGsoLBnhMf90OHLYg6LlLOa0xATLlT9HQUBYJ+tY5NBxn6f/sMPDCz6YviZhldS7o8JWJR57iY1LhRQqodAtFxAGoTwLxhk34Rc84vAMCydelAgge8RNS+WEXVYrgaIiG8G/ilcb00gqt6FJFwonTPuedw/doFU+JQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl9J91p+RrmoXb7AzODvS+jKVwwy3HqlSSZAM2xHBNc=;
 b=MGKYi71T/hYvc5o0orlZA5lA9sN+RwBjZ98sQWnZMV5NEhbl5Kj8Pkz6Hjsqlll85jmBHbH/XF1s2ZuQfgWVfP7VpzIWz2bxRhiWx06vqIZbNomJL8a6sxHj7MNUGQcde0xkLH7fWhTpJKJCsjG9Jf7oWSI/BxNP1Kcp1GGk0VPGtvYQEEnZh7Rh4EXOwGLClSlhUEzFP+Tz+q/0IgtEZrkcB9QfP1qhR911PkcPgtw9k5QY2JqlLjixr8PN2Hj0KTboqoyngwAG+YnNNCowrLXsyd5aAveYHiMkwbk4XqgTsb5jnj6gnVVc1dPUd36/ZPXfSBGZk4VxSgMFhHuEDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl9J91p+RrmoXb7AzODvS+jKVwwy3HqlSSZAM2xHBNc=;
 b=LlEALUGZZHJeUVry2ZZj7u4kCpusW6UlsIAWqH3Rblpk09gI5Jx6pgx7YY8NLRm+AEuM1FdyQP7i9GAXh4Z9eZS8judO0Kc0CCC7bnoHvsRmXhsm6IN9iPhfwwxIjTPLjcSRz3grLw9dYTEpSQOxeikFoAsd+oAUCrlWxvveghsU1KbWpt1ujcTeP7GAF3e0+3TBvLUzwpexg/zoFm4dNtZHwDME8rP/8OorwEK4vUzCYhp8VSlUt4+MxIuqt4cwcxTbvV84jxOC+DYPzk+U7HEka3o/Dg0cGfu/roJWjt8S97f4lgeU7T2E44+zRP65/UOl55VqTdFRrTNIIeaEVA==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:20 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:20 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] gpu: nova-core: use checked arithmetic in RISC-V
 firmware parsing
Date: Mon, 26 Jan 2026 15:23:05 -0500
Message-Id: <20260126202305.2526618-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: cfddb43f-7a67-4989-d85a-08de5d18beee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S1dVPnKHOY5YGy8X0U5LnzZ+rZSSihgr35nOToG6gy2CHwXfAZ2nhIXmr/uC?=
 =?us-ascii?Q?SUDlcz3/tADfYd7ZNuq8nGkG43+6zU0+54infDTKodF+dLYUqEfH5dDIwkQ1?=
 =?us-ascii?Q?yzwg2XzqmIeaaZvtO9FUxqxEhU0iPRlQr0zOiXCo+OWyyVIdRb45DtvIzQrK?=
 =?us-ascii?Q?1ia6AhdfZ+1ZEfomxyJfZcor2Z144sUA670CSgSGYvAlcVGzsyPva2sq1QcN?=
 =?us-ascii?Q?0kTOcC3R5NWJ3ly/gBMN9mNVcexMoriPJb6muVMlj0YgN537U5q8BSN1Ci0U?=
 =?us-ascii?Q?Lq+HVC+QR0YQAtHR70UniOHT492EjrjdCkem3Cvgj9TBBy+11rIdPHbXcO6J?=
 =?us-ascii?Q?Z67Pa8DNjxDkTH+rjQHbDCJBWWWtc9k26hc9Sgz1vaAUAhjleLC6ZpSRsj+E?=
 =?us-ascii?Q?JPH/ghmKBzuUj8CckXuRcxCJhC032ySX12faiYNSMah7s7cfriqZZ/VQRXsS?=
 =?us-ascii?Q?H6N5kLp1qRU/ROnMYInapyrTD71q57G+PYJ5VYZeuqrYFWV+BsTEGRXMBkNG?=
 =?us-ascii?Q?FLIIemSqXOv8McMV3Xj6216wm+jAhozTMOt3rFSCgXsO3Ka+B1L/BcVSVLL7?=
 =?us-ascii?Q?Tbrddo6xrLFDTOEcGSLZFhFr3NLYaI8L/88Gqm6FJzujw3oXmivNB/iJR4+5?=
 =?us-ascii?Q?vaMBtrTjbOOKJa7cw6Hym3IW+1eFxpqa0tDsEDxjn4Egz0UgawcUAuc/e9rB?=
 =?us-ascii?Q?aOGZh3WE7VvlSjae/igQpV/x4aWxGVeRwNDnyXZTiXWWU8sEMjz4ZXOdvKA8?=
 =?us-ascii?Q?W11F3VgeDNxYNTZfa+y9Eh268wD2Dc2vC0UrxMPahcA8doXScI9NItTDthQ0?=
 =?us-ascii?Q?i9ZgRDnEfnynF4n5EvkVBBEE1J98Kkkf8/bZgPAdWyX03eoagKIhHhEXCEjN?=
 =?us-ascii?Q?Y4vluAsO2OYG6qOAbdr3Swsj+ilH7/pdslBzB0YLbYGW3Nc4snpCVgtY73H+?=
 =?us-ascii?Q?OMkhhZl08+I6KWTma/ayhXJPwO3v92HBUyLi6qOBlMBW10GpFPP6fT8cGQxS?=
 =?us-ascii?Q?QWhQDNqFY96LvV63Zwrhh9E4EVFKEyO9btaeH00heIW4l+HPzIlZUYj2qgGa?=
 =?us-ascii?Q?54S2fG2OLV2J2Vo/nOsxLlZIU9bMqIBAgp5+xtWZsmnKg9QTwApgKYHfWGIe?=
 =?us-ascii?Q?U7XKU0FKWIpdc21U4UqzEMmXlWfGnzjiimpdty0RhsagbZ4dy0O49ffG8x3p?=
 =?us-ascii?Q?DB0wdOpl8AR9vPsSH7mi+jIzK0ivEYFI2Pw8/YHFG8NuLvaA1//uGVEDJyNP?=
 =?us-ascii?Q?gfTkzQqj0nydlpJFKvKRTTUyQC5rFXn0C7Zt5s7hy7gobSAHlyILfzwtpr0L?=
 =?us-ascii?Q?Cs960NsjhnXlO4HPGIOdvsO/qfKJ+o1cAyZCowQdrhAI/Muf4eroDLZiHa2F?=
 =?us-ascii?Q?WbkDmzPLm4FNssDvHaBAkZ88aDJqJ1E4urxWtWJDDQ3cEBEAiw25t5e8F07G?=
 =?us-ascii?Q?i0hBI5IHWyebEyanKcyLmt+3c5DQRpnMSexyyicVLoxGzMCBA2+KGPIg3PgT?=
 =?us-ascii?Q?CX42Ff/ZQAX9KtDu2AA1f2YAT34X6UnttWNkvp7TSHVxYyJBdG8sBiWMnZ/e?=
 =?us-ascii?Q?avOIR1uN1+TbMhJlccc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qce40QX2dF95LI/9d9c9rK4sS3/VFrFX0uKq6DnWwLb17m0FCB54Pkfddpak?=
 =?us-ascii?Q?DCJ1zqWJNhANWemRW4JgKCDYENEVlqwpEEkBAcqqnQl82koKdpBIGhW54qgt?=
 =?us-ascii?Q?Cu4i5TO5ZfpeDJOnPCDbCIY57mpb5wHUXgRBjGAT1W5RwLfoA6gJJY9Yum+U?=
 =?us-ascii?Q?L9xy86Rp36c8j8dAbuAXR6wB0wA5aSCkvX3vZc9SKm8WubkIb7juKNcypX6i?=
 =?us-ascii?Q?bEeZZSdry754UPOr1xssnvcpYnHD1UR0qWaeMozXoWFwJ6x1/r817GAdfWL4?=
 =?us-ascii?Q?Na0V74z6VCnhRXvPyZxC7h4SW1jyvO2Z8rSBQDSNCnESM07LK33ekWF0WX02?=
 =?us-ascii?Q?v0sXoEvJ36D+YTlg7nUNnzbzJLGwbo1ub0RKk5zEiTsUq4E6WHaYk+Cw670R?=
 =?us-ascii?Q?Xh57YHxws/ywaMCoOtwgjr3xfsWTR0DpjaXj7M8kRNswxVHEPFZ278vaNyES?=
 =?us-ascii?Q?Q/jpnRKhoQZIoL51+furlp2f2lG/M8bpHKvIeG2cjQrlXg5+iOh5SM6fE4Qc?=
 =?us-ascii?Q?/qPlRgu0wtb8OCdS/X3wwkpEFmzlYSy/MhRPQHu257rc5PsTF9/sk+kd8Me0?=
 =?us-ascii?Q?9PcPKt7FmBM8d7T4EKlqaayESC2ChxPYG4PCWFwPusXjYbAs+nMMzx3dfxxZ?=
 =?us-ascii?Q?k76MJuWW8G0qv1XE1wI/+YQ9+cPZmlHWUTh7W+dimuJ8KuPTMEQ/qJNY/rgc?=
 =?us-ascii?Q?JrlBxXYkH+1Zql+VfXZOoxHpJmlirn3tZCf5dkIYJYpy1isUZfIlghaC09V1?=
 =?us-ascii?Q?cH8/PWddff+g8UcvYAlB3nsqw0QPQZ63VmCT1d2dg+idD/Ufe7FaLiuuYS21?=
 =?us-ascii?Q?Ewr6Cz/DI20yQweB1icYl2ZWkQbcDyCxRWi0Ke2fFwsbnVbgeWV5X5Ouz7pm?=
 =?us-ascii?Q?hYb8EryjhcJZufZMimotU8ZErO89pFsd/Un9SggrhNtkXCBzw+LSdFrLVfOQ?=
 =?us-ascii?Q?d4DRkbFcyKuVUlkrU9aqeew1mrR9AhK+JC0jHRF4emyzk3VE1atEDTdnaE4h?=
 =?us-ascii?Q?EXY5slXevDYU2r8nuHfloY7Z3y1iAGnbIGxp0oaHupA+Dc6HsiNY5p/2y/jh?=
 =?us-ascii?Q?cRtOxTE3GHw7JSQSm0ZJ+wFpRrQc0cuydel42yurnnlw36fQ4pFfCWevJ+m7?=
 =?us-ascii?Q?EmVWhDi6otknrLv6VbXRWXo5HfU9miMyT3badEiJ5vNehg6Xbz5gm3el/svB?=
 =?us-ascii?Q?iYAte9QOtAfBYeOM/tRG0+x5aDfn5tLpJx7Da3ngm5BzfvDSbSLagjJR+2AW?=
 =?us-ascii?Q?ctn5qL0JM6tL61fx8qWoGewzKm+2i23+jej1drtOr/fiGXWpKTOvijjOv0zp?=
 =?us-ascii?Q?012p8RHySmbM39Zgbfy2+FwksqpC8MvOpVOWv2vRs+P8+/oSrc4SK9J2nPWm?=
 =?us-ascii?Q?7O3SBQRPVQ3jwpagM/eUtipTuDvcD7Bsg/dRdVkOSLCrI92vNYc003QtXkPp?=
 =?us-ascii?Q?1cFKGd2tGd8ffhFY6/9hhJ95JG4qQl4L17D3uEvdBPIoP4tqw4lwlI0KCHA/?=
 =?us-ascii?Q?djmJFWXfae2x3vB2O59rwvmfKZ9Xqc8EfnO8LYGylo6iDvZX3rcCBeEqwd1g?=
 =?us-ascii?Q?GA2PIr73FAgnomHajy6IQgR0U5izkNqmhV8JTsNQYEF26MNTuLoircs5mE1D?=
 =?us-ascii?Q?GQKN7vxaMZ9KzoDkAUYhsRSFtKPlwtY1eZJx2U6XQ04q4yq5kjDGLOA6GUfm?=
 =?us-ascii?Q?5wcAxMZF/ULa7RSQFfqv8b0NaC95WFYi3WDSc9VeSBFJ+Oc9zef4bClhI1x3?=
 =?us-ascii?Q?HOvSYUWB7g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfddb43f-7a67-4989-d85a-08de5d18beee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:19.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T3ul1msrRGqEGJcVC0rRgCEZ9nlfVCus64pvrx3ZqTOEYfa4OD0Ng0ZquoiqSuG9MwIdTRt/KaM4UeW8/bqtbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
Message-ID-Hash: NPNPESI6RMFM4FR6Q7J6UTZ6OFPMOJNO
X-Message-ID-Hash: NPNPESI6RMFM4FR6Q7J6UTZ6OFPMOJNO
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NPNPESI6RMFM4FR6Q7J6UTZ6OFPMOJNO/>
Archived-At: 
 <https://lore.freedesktop.org/20260126202305.2526618-6-joelagnelf@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use checked_add() when computing offsets from firmware-provided values
in the RISC-V firmware parsing code. These values come from the BinHdr
structure parsed from the firmware file header.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/riscv.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 28dfef63657a..97030bdd9991 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -47,10 +47,11 @@ impl RmRiscvUCodeDesc {
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
         let offset = usize::from_safe_cast(bin_fw.hdr.header_offset);
+        let end = offset.checked_add(size_of::<Self>()).ok_or(EINVAL)?;
 
         bin_fw
             .fw
-            .get(offset..offset + size_of::<Self>())
+            .get(offset..end)
             .and_then(Self::from_bytes_copy)
             .ok_or(EINVAL)
     }
@@ -80,8 +81,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
         let ucode = {
             let start = usize::from_safe_cast(bin_fw.hdr.data_offset);
             let len = usize::from_safe_cast(bin_fw.hdr.data_size);
+            let end = start.checked_add(len).ok_or(EINVAL)?;
 
-            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(EINVAL)?)?
         };
 
         Ok(Self {
-- 
2.34.1

