Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E253C5DF6D
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 02:10:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDB10E886;
	Sat, 21 Feb 2026 02:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cv0y3Dyg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C0D2543450;
	Sat, 21 Feb 2026 02:00:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771639219;
 b=jUpYQ1fRDNQW9I6BiehuMYkhL2LoLvqCdLSDpJcBJ2Z/tw2fxqXXP651ZlKwtI77v6mVZ
 J8YJ36JzkGDHIUxzaSS0X8UyxnbkXi0vf0OYYVroF6N6MiCyLMInJ6FODzZtFi5t1c397zV
 IEVbUPhOCSg2mH70T8tNCHcYeOcZjP5lwTaqjisO01LK1ZaW+1tMHIkpHdezXCuIPJPenXy
 36lyyc6azLB7uY3OouqHHaFdCH6PXrGrY+i9KVvA9bZWFnPwwFVwZQCTlFQyf4hxrsLqWul
 7bpkkKcwlUPyLIR4nn7Y5mybQn+0aoDI/sfwTXEDRB7UYpxmX9KsWWfEyyVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771639219; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=NX6V3k0xGsbje+xqCCu1LZqb4uxe77qVTbG0Ow2TUPNxx7XqXiGuY/dJ9jys41XrrN0rv
 tJhOfflgDMPdh87qNsIWCqehg5NUdBjFzp1nUeYGeVPGD+b//K75eUq3eBLMiDNgJEEq3KM
 B8CjnUNRN5zWGgyPKcA5lzOl04eBbnULfg1MVThjF29DJ1D0BP+SBEiomoLXC1m4vsFHQmq
 QS0vEGKbSyEXyvEiJHm7tW+AZlqiGqDCjs6DpmMq7Qu6682x2y5D3+MWipkIO2hxMvcSInO
 HY97ttEXqgtKaOdhlyH79/6lC3cHw8Bgb/qHvMZ4Uvao5iwc4KLOYi2dXNWQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1881643445
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:00:16 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 68C9410E871
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyRq6iEwxNyjFo8FLstt43k+DcAr4rbtFl/dzzGe6IquM/zfOJpLiCdHfZxHwXgqvRtF3hxNtBwhpg2rV7HA9zaD9qjPpZF0nu+S2ePov81SpwAJVC152rtCrCWl1BZbcHWvmnUle5BNKWsZXMHGRWsOTVtCaL7FdeKsqS7kwa1OgvZjmLv39BeZCE3ABZoaFADbiLsywds6zn4ZzxsCyGgJlI6jqeXhJ+AGL4oQS7uRhEzIU0f3EMCWDFJ9FcSywfDOsBUc4nnYpW6HcFbfT3tmuNi4sW3H+MlY5W005uCJ7GbagzVW2OlVZKrEqnVGGF0V20oLY+96sBQVWM+r4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=mQGcDbt3uuk3hXFUsAhMChcW52u4M4Y3NtvRg6h9oyURFKiXiJoLZUdKo31atSBOeNDZGbi01l9zP5VO+TIXn9EBW1dBaf2DF/1UI2OsTxqaHlXap3me041kA/YQhOhIvpszAN/VO6pXMXgyZovXmKdMQnHlhexz4u5B2vmCXMMSjG1vYawLvjeQPbV4RKXx63q5YD80kIVkSXFmQ3lmorcCajjLqMZ1hIxswOZRk1FhyHGPEkQW41mrctA9If7V7YDhROD78ghuyErL8BYdobbbQw9EFiVPGMZhNQ/5jDaeFgPb7tINR4NV40UXQs+e9NNnKl5HNwyiOPf0KyPKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=cv0y3Dyg8CKESDOA3RyyIrzPt5PQCnSn0/I1ZZFn2abm6TM1t5YBwEkIO17y7SscudUqK0RxxmngrfNp5vxZ3c732KS5AaXTpFvkPYMtdR2D2TY/WKWmPBCSTaOmqC3Vvi/spR5+YDlQ88l0feUr6mGfYNMEbUz2x+RRx/A5pcM9OZQd2zoSuoTwgVO+qou9x/1Oc60GoKGIwyZ9GvaA/lcaN6wJb3fXla+LJBYOgVskxAm60YmXHJaH4x7IKHrIxaM2b1IwuUuToGRGruhzvYytfZHYlZf7Y0Psj8MOunWc9QSo0JXmgbn38GFapjdkExetOk+eZThyngHrY6U+UA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:04 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 08/38] gpu: nova-core: apply the one "use" item per line
 policy to commands.rs
Date: Fri, 20 Feb 2026 18:09:22 -0800
Message-ID: <20260221020952.412352-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 06feb054-13f8-4ffb-d201-08de70ee53c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?19bSTGhreN7VCkhswqfL1owd+j5YLA2+SGsf82SA26diSWg3Zonc648QPrdJ?=
 =?us-ascii?Q?XRhS8l6FcalkbyYZcGe1QGnfOan9T+4XWev0Fk7IuVzfWsa3FANnxnblmFS0?=
 =?us-ascii?Q?jZ5dbK+djf2Ehr2Ty0NUVVvQ7csJwrM8vANcuL0jo308okhgLTk+iQSlh/qx?=
 =?us-ascii?Q?nsmoKGXxfM5Ls1OtQ1PXxBhLNfNqYjgYxrm473HErshQY0J4GY+J7io4sfo9?=
 =?us-ascii?Q?R0j3y5wf8VLzj/fKIvKorQ0AmMbbQ2/M6xCWLwT3JVu6BSt/5z+kndP9bG9m?=
 =?us-ascii?Q?AygWtaMjrz4Jdb3VuDoDH/aiDGD4C99MwH8iYbH9fcw9kSbUS7LQUjCTJUQM?=
 =?us-ascii?Q?TdDAU0gtfIkMi491WhM7gR6jR818hKX/MY0cgsNRX4aUdWaD8gSyl+o4ocpU?=
 =?us-ascii?Q?5QGJXm+HeN1+GD/8Cz08mNq6inEkoHtuYiWuRWIadfuxMXRK6rMYRxkAemw6?=
 =?us-ascii?Q?VvKpORWfmMZ8Rt98IFfIpuU6da5GwlMXAKI+wWU+P3VyvTtHmJ/bmsloT8ij?=
 =?us-ascii?Q?yFp++gJK/MTmjg91Z3XosxUDtdECWyYWk2GJ66BzyhaoDLmuDaXrv9/Ukv3l?=
 =?us-ascii?Q?e5EP4/WO8yKLwb3+mtY1eXhGuMbtEmon4A98n24GuqJa8l/MT0lTuv3UflSN?=
 =?us-ascii?Q?G2D+vi2wJL8yYGrIhB1cScNJqEEBs7YldDIF9n/7danlRXBaJ4MAsv1bp/a3?=
 =?us-ascii?Q?k6sFQCxfodkLDreKt+aTi5oBM8oENJDwDEleDsckN1iM+GyV1keeaEpHd+cW?=
 =?us-ascii?Q?H4xfJtQ2TalLP6qpCQ6jcRTdFC+/hhYVX3EZk2aX057XbYmW5jHjvXR5tKsq?=
 =?us-ascii?Q?SDuAjz58QLWXHXnpMSbYo1o8ex8bvSYfnwNLatGkViXNeXtBuvv3Ittji7Gm?=
 =?us-ascii?Q?/OLp6iKRBhzm1m80gqMxacPkif4/NKA9K62C2ENYIs0K9dByc4C9iB3eYRpU?=
 =?us-ascii?Q?uDqU8/4DZHKF2q+N/IUVVnYkDG6xAnv3LrjYocXTIwL98Ci7gpNWzbUFuguG?=
 =?us-ascii?Q?IjtlvfjSOYuBO55GdNWiLIzWJRDxqcztuzKe4lZ2H+vmL2xOwDbAUTvj+8HJ?=
 =?us-ascii?Q?ptGiPi6je/uJx0+eRLoOWyK3rRCndD4HGXZdCijJViEEGb/Z7N/EajYRLxlh?=
 =?us-ascii?Q?8oIbPwwk/sT+/qXy46UlW6P6dYPEXPkJJoa2ACBpsqj5objdYA4UewflT/xp?=
 =?us-ascii?Q?9sgugOX34nbBmFZsXlrfpdGrtW6PJFTfuunhJI/6hXTYQVsSzDNJlNBfHE8y?=
 =?us-ascii?Q?6dDo6ujqz0Ha449VkqCmiZ2Xa6YbAr2ptgE42rApCtkzkbYztK6EnuFWfyl6?=
 =?us-ascii?Q?pWHORN+5PQXWfEHLRZSv5oPqy5ySZM99fvcPQLeG+Tv3BO/NWsmzJe5Oy8hc?=
 =?us-ascii?Q?EPKwdsJfaZnYclGOqlSXmRfkNRDMu/PjJnpQyv1fDaxefXLVti2KwwBNkZlh?=
 =?us-ascii?Q?VVo9DfBLIhrengeO/b6UhnF13DkSEE3Inl159Jv9vwVC3x2TJ6SEiI54F7I2?=
 =?us-ascii?Q?Xtd3AhPnjsO4hkJdStYRm4nZnnGLPO7dD9zAevvJD9s740ZeuKkn2EbhK7QY?=
 =?us-ascii?Q?A5//HP478RVau0/ameY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QqlbmwuZZBfxUXUmfsaZZH230DZR+8KhOkOWW0Gcvp1D3w7BFD0icXwWC1Jf?=
 =?us-ascii?Q?cKiHRQnf15UYs9rKZj5+mlEJpDW1afYH1+XRbwp5xn/ksN6RH88ucgVr827x?=
 =?us-ascii?Q?MdfnG9YQYm/Kkjm9AWiiUdXPil0UCZRPk86x0GBFLSqvhONAMLd+5zPQG7IO?=
 =?us-ascii?Q?Wmhwemz6A/q99+b1RdR4bqPsIzwqP3na2of3iKm5eOd8vWIeADuvXU4PPQGg?=
 =?us-ascii?Q?CZ55kytieXJUOUiBoDjIioGjLkxTih00iePKAlTV8EXoOYJsQHfYBV+ABdMx?=
 =?us-ascii?Q?4xpfCVMALNDkP1jNiVzX0ZlciVV4oPXVoUhdXbH3vKYUHOQAok4jHH2OEJ1g?=
 =?us-ascii?Q?kQLcbCgPtl5aKVzZphaD91TidvONZ3/pjGOwx0xjDBmA9hJ5Jd9Sq1NhladC?=
 =?us-ascii?Q?1N4pTjV1gqPy+GqV7u3XfgQIIOFXrzjXQoV3YjZYqZUhvY72EgIX2Un9mxF+?=
 =?us-ascii?Q?6a1liX5WT+UJJ6dQf0GVGGismgBfSoQdDjrOrCWwKK6MK6uYh2aNZ8PIPdj0?=
 =?us-ascii?Q?mYk+DrIqe/zGcgfp4IWoTz/pi0BTea5dL2/7cDkwPZUlcM5nxMzh39VEpa3p?=
 =?us-ascii?Q?Z+7EzYGromH0wbgVzzJS0Da27f+ZqROu2U0IrKenABf2nj8Bx+i2FTJzse58?=
 =?us-ascii?Q?8O31hWTjUnwkwTCAzUtI+XYADZ4/wgABYrE+LY00Tv/cKW6TgEnBPcu3XsoN?=
 =?us-ascii?Q?/pGha+KpDoU5qk5ZJ/bbwvob1wT5VSIawH3MinNsdnz5XQTtHhb1Oxag15Zt?=
 =?us-ascii?Q?BQ13ygdCXQ/oic927zClek10GLQVh/tJ6CTtHW4mhL0dpQ44rWLD1/EixQfD?=
 =?us-ascii?Q?/r+1wxDqxAPe5F8o8KuAkztlfp2MDHvcAsWi3XYs2fyJEtmO+2sBqF6mqsXq?=
 =?us-ascii?Q?C8eCu9cjTidOIrelV0ArqkFx9CA/O1SxdkyU9Bd1mY8X9VwDpT5rqeQIf7bJ?=
 =?us-ascii?Q?0XLyenybL1JcQFFXuUfJj4ZQzNllc7U5KeNAutHAJ//vsQFspvf/vomEV+EP?=
 =?us-ascii?Q?4MjkPRbEnkddyxXluCZDlV6oXJp1/o3sC2khiE7riKjZ5w7yaIUEZcLbivt2?=
 =?us-ascii?Q?PW/70zRiPjSwoOfXOnYGg3ouo5N9XXZyrwMa3/PU6VK8fOxt4WP4Hly1iduO?=
 =?us-ascii?Q?1eQ16hpOGfy6RmlzFpvavIJbGp21KY+ERwMdqZRnu3i+Srh9+YplHvroE/dW?=
 =?us-ascii?Q?mxcY1pCviB84Y0S+mQ8VKS/W+6Y/IOv6TVGtluPZP1GGznGls3/42qZy1La1?=
 =?us-ascii?Q?mnVQH3VD3JRO3UZkuSmc0GEwenSBZZATi3xkHJk4l2uHMq+6qhwh0B7zZJtG?=
 =?us-ascii?Q?cKGpyA54+usEPy0Fp9a6H8oCiDGHOkXZ0FraOLVqpx1t7lEDeDN3uGqOq870?=
 =?us-ascii?Q?UoKzdUgANP2Mie5q4ajU/QrPPecpXcefj9FB6jIfDKk9TDX6+6ol1fVBvJvC?=
 =?us-ascii?Q?GKigHos3UJxAKhDh4llTh6dtwJFsCe0zwjO/e5/j7EDwBx0nrMwDMNib8a52?=
 =?us-ascii?Q?XOhSSUPAs66FLIXQyZUk0kKoOsK0yJaTHGu+ubWJxbXur/UCb7xXBm1q7Y6U?=
 =?us-ascii?Q?J6muLTr2OAhKzgYgj+VnjcP4+nZaOpSx4MpnPf/NpUa8/oh9BtXXbKJ8KMsx?=
 =?us-ascii?Q?nL3eDmk4TYwI8D50FeiqQXrazkKHE0B8SunUb+LVXFFJ2JhmDkzOP8Sa/bVL?=
 =?us-ascii?Q?ckh6jG0qFmke/BYm7xnv/vH5W6gjoEgUsDJ5TbzshcjlkkJajvdEmi66bsyu?=
 =?us-ascii?Q?srCRGCoRQA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06feb054-13f8-4ffb-d201-08de70ee53c8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:04.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ADxJ+ZZNP5nNZQejVDiFs1Dim7ZnaetNFSxFxWo1jpwkMyaATfL90J0yF7SR/rGMW8G4O/84YqWE1DG4ae0XtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
Message-ID-Hash: UKZ2BB2O2G62N523JSMEGGQFBEJ6Q3OH
X-Message-ID-Hash: UKZ2BB2O2G62N523JSMEGGQFBEJ6Q3OH
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UKZ2BB2O2G62N523JSMEGGQFBEJ6Q3OH/>
Archived-At: 
 <https://lore.freedesktop.org/20260221020952.412352-9-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for commands.rs, which is the only file in nova-core that
has any remaining instances of the old style.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..470d8edb62ff 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
-use kernel::transmute::{AsBytes, FromBytes};
-use kernel::{device, pci};
+use kernel::{
+    device,
+    pci,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
 
 use crate::gsp::GSP_PAGE_SIZE;
 
-- 
2.53.0

