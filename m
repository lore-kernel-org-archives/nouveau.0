Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC83E6BF3C
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:56:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2369810EA19;
	Sat, 31 Jan 2026 00:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J/1t9wcu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6BAD440F63;
	Sat, 31 Jan 2026 00:47:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769820435;
 b=WWND/17WTQGF/6Pmf0rYsJh404ikanjwmChKjAGApLfiIeRiYb3GhkBDD0WNckI3EwpWS
 rfsrUQSgShaG9oZbHvQlqO2Kexrk7fSV6cOsY/xm9z4FsbsN2I9LhZ3eLzX0UGfWBOpkBLG
 xHaoItqbCgZaD9eCcrhe7/dRGKXogXh9m9lLQB4W0oo0X6F87HUQvWynWT/GSpytp5atJUN
 bWAntR5K4yDPGOq35GnfPGZdPpjSpRZbC5viiqu3A7i6jcUkC0BSVwrja6qBZKHMvl5/nwi
 m+l1w96Ku7WASFqdqHn2G7LbBWdARdkJngJ+RzkR8mKXyw6Eys5OhyinmAjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769820435; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hQXpVtZqlR63evBzLGuZjaxdghJIe0EySY8taCiUxkc=;
 b=xdHdTd1h0mT6RoWYoYQbtSar74GPb9bmGb4lOGlSOHpfSeYqSUtvwsYKDf2gJAa/HER9j
 pAs6K+uoE8RKqzGN+qI2EkgUtWAcQaufwJsuI1bUHcsOem7vj9uuiKICo69vo/kOC4+BCCO
 0cvZEFDITNhmIzDxdQPoKuC13xSOainM4TYnQpuwYYWJ4IT4fVXhrauOS/kZXKhREFJ0V2t
 Qg1gmWDaOR5wUNPe7b9CA3kW6SbM4nXOpElzWqtkS7kh7gx1jSrw6igbr1ESWx2UaKhigwC
 G0+sgEcI3kQdWpRlZmoEIojFD9QCUVLVNv2WXK8cq/OW/OzfF552K62gtaPA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2AB4A40F37
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:47:12 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E53D10E259
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+BTnAvNqOrRlv/5h0kCR9s1ztQ9vNW8W08jHMRsBxO0D5lF9WMeTTGjOMhZdgCly7GrVq4/yiCmc+v8nd3UJb65YB5TfTkWX7bZ2/PTkXVuK5xSHKPNkBGKEMZvIa7gATu16syBaY8D0EaD8HTWqJb9/KBBRwYoYwYay3HIZaQZZfKxo0hT3TmOjNTgkowMEoHtbxvuTpw58EWhcEVGg9ML40uJKrN8CXY4XtvzFd/+nyfUDScg7pOyf/umilVW+A5AJa9aNZYcsJ1s5kXnElSrPkYHb9XKCUtskhp60cuZ5kWPBoZXMoaLKg9S7dGpYXsAJb/pOJLySTLYYYr9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQXpVtZqlR63evBzLGuZjaxdghJIe0EySY8taCiUxkc=;
 b=SOZIiJJ1fH5xH5dehpC4POr5h/6da8YEXeaI/GCUu/ZnJfWV3nMDdgS22dZFQjS76Lb23U1AVgXado389LTBvX1OINXCf8mJBtcA2S4MGEv9kMo1zOA6y0O+xh2tmXBj2E/m+1tanin5h7NaZI1dMrwRn5lwvrit1BHBV7RqCFwmlhXGuKeVYGx6KMUDxnjKk9/uLM/ZR/xc07Q/aD9dnwHVKm0hVFfs5P5lBn/TXHscDbfseWUmr+hkNHOJMUJdQatoUw4GLcAODGOiBPcjOzKXbFLmWHmTRwXfl1y9YUMXjUSQ4szh6eKoI81pjXPzhoNHT01Bo4lJblN7Hq47VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQXpVtZqlR63evBzLGuZjaxdghJIe0EySY8taCiUxkc=;
 b=J/1t9wcuw/EzbUkNKvSpN/UG7kPQ+04IXX8AkPY2KzYNrN6qKPMQiZsXuwqReR8G6Me3OLgIelAs/fzbGtZa2RuXBiXvwpeureyu3SXEi4wALpw47Ov33g130a+T0eFS8wy5H/UAehiDEqlTjwMCkzBlG25sgg5kAUNhTBxflXpjWOiRlb8JG/4eD3i972zc1lv2mTcjkcuiowsbnJsCnvsxFcgg4m/dQHYGezTJ8vZ1vsflC8MVxZ4fOuMYG0f2JtH1GR754tzRvPcwLS4QbLriou/C0AGdzPEDXY8vjafDQw0GwpOGA1iOHNQ3Q36ZOAuSlzGSUr1YpPz2bA0xYw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:15 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 05/30] gpu: nova-core: use GPU Architecture to simplify HAL
 selections
Date: Fri, 30 Jan 2026 16:55:39 -0800
Message-ID: <20260131005604.454172-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b465f12b-cacf-42c9-43c6-08de60638960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1GbEVkjnaYMQeeoLHUZ89H89kTK6RqTp/M23QiEpW0rAtPSFpoFBozMms9N4?=
 =?us-ascii?Q?dzRwd1uBYviR+fsJBbAm0csyCehx1hVvW14hedmOHexI+rgSXJSqbsqEdMKU?=
 =?us-ascii?Q?e7uHBf0+13FIN6MsaCoVEo8EnIN1zwkyVEJD6UZC1X/bpiefQ4EuIS2Ptjwt?=
 =?us-ascii?Q?LOA3FagL3Kf9iL4e8GuV0iUtn4YPFlZqFuo5CwpE45JxUlvFlIJS1llkay9b?=
 =?us-ascii?Q?PewnJIntjsR/FZbrC3+FYRYg+WoN2hlmMrSfInI1Bfy/w8Zu5kfpMnyDmznd?=
 =?us-ascii?Q?xr63r1jT6hYdkVOMNRQFZf8A2pmT8nCRv8LNxBMc88fpoq3695hnW7RBaKt7?=
 =?us-ascii?Q?vLxxJLdQcrDtx0E9bRaS8k4SQCM1R+0R8LXfRZd3Wl21w47a38ObBdy1HFTt?=
 =?us-ascii?Q?q7YSR6o0XSP3CPVfNtePtQj4uxZvjVlGUN51Q6+vyLxI9LpXJWlfsRjxk2vC?=
 =?us-ascii?Q?XM5Mj9V5U89TU8HWSTLL/Az2YegdWVk1HMSo/bj2xWMVGOTHIri+YYLTy3j9?=
 =?us-ascii?Q?EcgHRTRt9NRi/lKSY1+jM5JwLCVnuPzuMkNqwqH1FV9+y8eXXn9P8FGvxU9m?=
 =?us-ascii?Q?N2DYuqzbWovEbEZnX8pgM0X7/ttChZP1JzIa3p3EsR72SJpKcsgv6N7CTVdH?=
 =?us-ascii?Q?Kr8EX8sjGZgP41+42b7+SuSkhR0WqWE+/6Q9zvd+tq/HZUBJZ0L3Ees5KoPz?=
 =?us-ascii?Q?0JkEe6RgvwBRR9V22x/xYad1vlKLaTKCaPzg4qKoTlvILpEnuiTXebyyrjOR?=
 =?us-ascii?Q?3V9bPymesZ/k4JliWeH5upSv0UhJNLtuEbUgkA6t+ofoJCL4MSjhxEfF8XPz?=
 =?us-ascii?Q?uQ2NzfxkVOYZh7T3h2u8AA3biNSoenfYIxMm+4J1IxNGv/20u4mov6KP6lkg?=
 =?us-ascii?Q?+b1fzFb0EQhp+97ZWD8Wax3aHNEEmK9xX7owm5uNcdNNdR3DgBpMybsEjhwb?=
 =?us-ascii?Q?vU2RIvOgtRDMmKckUg26+N3zZPqNPIAxzSw9jueAxoWa+CHiue95ZggpWqCw?=
 =?us-ascii?Q?r2ar4T5fw3KS7JWww3eLueRNKYzrOmv70aE6lmVqVGI1GtAFgBVD1TnAHWCh?=
 =?us-ascii?Q?O72lFbYABv1RcrYgX9hvPWCPC8rJK6aukFNtKT7X8kskHV0W2DCYks3JLfKg?=
 =?us-ascii?Q?0ZfalIKHvMFjVEX6WJimIrkH0gZKcb1VUOPXkxfTYRYbi/s8rSuVAf1Cvl36?=
 =?us-ascii?Q?wCWZS/wg5Xy38F661mdw19SKACH2sZRD7Uv1Ph6fVIAVM9yJ62HKQ42BC5b2?=
 =?us-ascii?Q?+MyOLF4kUH4xJ1zunlNYfOkfkx9WwKEnEXjwTWCoXwKMRjF3UMjZ6fOtVpJD?=
 =?us-ascii?Q?Mm3HKiKLXvTDFC7W/cphy6w/pjTWRxVMVxZgWGi5LInqDK9aqCk8BGDyNJXZ?=
 =?us-ascii?Q?4rvbO31Vn1aZllrplWAeDAPFp1QPw6PZcWwIaLpxfrnXJeFajmC0zu3gklL8?=
 =?us-ascii?Q?RzQOJ6jCA9/bYq/q5Fyuyp5FoR/LYtS6Jxz4KtHIMF+z9gDYQvjKASaQArfV?=
 =?us-ascii?Q?X9yfxDQvNYt/Fsv4zKeFY0dalW9Xj/yI21YJDB+igOIqn+pDHdjpXfQkLjoQ?=
 =?us-ascii?Q?mIzBu03Vmu1l5nVhFVM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OLkBzfTO2CU3CMRCcARSNxfuRBUsSPjRaj6Mr3wRrvZ6gTAYOLtv/OEoUlTF?=
 =?us-ascii?Q?SMJXVkvAU7JJ9rK5so+WHJrWg+CWtwfad1DxxPhEa8RnCBIs2sFQVn1xayy4?=
 =?us-ascii?Q?b4p1ZOl7NRgAmlLYxygoOUzhv+r6tb+LTiRXXkQM4MFVBlG9f0tJXASU/l8Q?=
 =?us-ascii?Q?odxzRazQXtfBqd6ahcqmk8I/JxNEQch1sEbpQeRQKjhFNUPg5ij0B57p+L3o?=
 =?us-ascii?Q?WtJm3XLyS6B1vL01XXqTPyqNXreFxRDpyri+Eubtsd4Yx6WTWIjoov4qCarI?=
 =?us-ascii?Q?T1a6EthROtx2EoneXp3thgLs8hVX4+V1R74HxW+H5POnrOnQdOPLdtm0fosj?=
 =?us-ascii?Q?Wwr1m+aoVmKKHzcyeVKppT1ZHyPOrOZyMiM1t1UMZ6+AcDmM/DJsDEyS+QUY?=
 =?us-ascii?Q?iNLfPgmC9NWMsI+RSRx/oZ8qX2eUk7NuoOtlwcJTlQbx58X3n5NxQ27en7jd?=
 =?us-ascii?Q?v6ANxx35coZE9BCKE0F47X7uUrFwFHutz/Z5Yu99Nu4l17C3Etsc4ZlZxhHN?=
 =?us-ascii?Q?bvNHrbws+tahnqa0lyeQO3ni5u5N8UQuKhxDIJ3Ai3+2g1vP3UxBAJ9JXA1D?=
 =?us-ascii?Q?+dqC7jBJM7sQM8LXhnhWSzWKVZhUn6oa4IrWLwcvmrWNsMG43jQcDpGTIYp8?=
 =?us-ascii?Q?if6yBq+q81heXnAXd6QMWflwDT52Xo0P5Hfcdx9gZ239gNBJfMFyVRRxAneM?=
 =?us-ascii?Q?SupU7UTYBz0Bks04uleo1MuRejOa7KFLbaG8XnZyCy4YZdvegXK77SLpUPXf?=
 =?us-ascii?Q?soT0sdKZwdnQ9zUhvNVftnKs3MHodxccTif8mCvZoPEtg/GshN8wfP8rYYym?=
 =?us-ascii?Q?v3sWYaOQmYz+2oRiFwxlR3rKRyUGS7Gmno84whDDxe2o45s4cRugUdGrNJo7?=
 =?us-ascii?Q?VdlXU/HCf/zYjY0S42sNBjgA+nhe3g4ew8YXRhSX6p16TfeiihIHnmjzVkha?=
 =?us-ascii?Q?nguo4+GXVn6ih59M6MREXeINlmivwXP7AoFCI8+g5xlkApGDyqpTfmOr2jX6?=
 =?us-ascii?Q?pK2tbNQeuDVPR65tYCu/xIcRk2RF1YSRAwy9AxtMIGldS+n5K1RXfZGxKUGN?=
 =?us-ascii?Q?80QNeTx41u8h5JFkpD7Fr/uZCwMA/fUZEE+xfNxBe7CgGFHoBPOFntnnxWEC?=
 =?us-ascii?Q?7ILevDpexjMcJ7C7ODlAl3daNmyn06xjlCCAGpXEHi/YyU9ixODS7hd0w6hI?=
 =?us-ascii?Q?H1s0q6xC1wOnpSVGcqX7D6wf7+XLLkuGkdfZL9kzLzD2hn5ijB0sQTxOvg8M?=
 =?us-ascii?Q?mtYGOQuhlXqTyh7agpkTUDg4+e1ddh9596WMIy437dpdJJoWMA22+NHq0kRt?=
 =?us-ascii?Q?waOkyEroTxbAFInzpTX3W9xgXFdrNx0xTb1DYvGua5b5WAhzExqZ3+1ghqML?=
 =?us-ascii?Q?dPmf0GUVBWua6Qkk+ioLhNEWXXV7t0WCcfJl3MKC+sOXcsP5Xbs36jA6LKjF?=
 =?us-ascii?Q?qJnHg9A6uhj4ueOesIJ1K/uNnInrAguxmTB5/YvtssTqJ2g/n9qbX0t/csIT?=
 =?us-ascii?Q?mLuJ3QLGf4bdh5kbRj50LLfnm9UVtHVwYHeBvUcB52grOGOxtiNmePXBMLdi?=
 =?us-ascii?Q?Ybr+IXn+sSSxgIjRTcqF/jkWtc5JTogMyffMhtpOdlhLiaO1Idr3f9TQTIdf?=
 =?us-ascii?Q?At9vRXFh1NTIGbv3o8d9HWaKf7t9Mexf0Uyk0sXuhKdvlQnIdPqDAU5gQv0h?=
 =?us-ascii?Q?t3TMaZu5ZS1ZjwjinHo/E5Lrd3CcHQV0TBBCxvsvVZ5s8occYw+wWMdfLVax?=
 =?us-ascii?Q?oV3XbmKvUw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b465f12b-cacf-42c9-43c6-08de60638960
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:15.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KgmX9wv2J0O+GwN+B6Uiqel5MbUbYCK14HLQJUasws+YMZZZ9yWyYUgxpiSXob2ZmvGhry6DJLD6LQFmHsenXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
Message-ID-Hash: ITABGMRSYNXLAIIQEUUDOQDV3BSZOHPH
X-Message-ID-Hash: ITABGMRSYNXLAIIQEUUDOQDV3BSZOHPH
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ITABGMRSYNXLAIIQEUUDOQDV3BSZOHPH/>
Archived-At: 
 <https://lore.freedesktop.org/20260131005604.454172-6-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Instead of long, exhaustive lists of GPUs ("Chipsets"), use entire
GPU Architectures, such as "Blackwell" or "Turing", to make HAL choices.

Note: Left a // TODO for GA100, hinting at the remaining work in order
to bring up that chipset.

A tiny side effect: moved a "use" statement out of function scope, in
each file, up to the top of the file, as per Rust for Linux conventions.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 444c95fd4ece..edf4d27d54f7 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -70,17 +73,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 71fa92d1b709..d795ef7ee65d 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.52.0

