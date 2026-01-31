Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A648D73EB1
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:56:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E999410EA5C;
	Sat, 31 Jan 2026 00:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B0tpk22B";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 45511418EB;
	Sat, 31 Jan 2026 00:47:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769820441;
 b=oT4hSUc0EzNIlFZXKtRtV8Ssa9CZuXb3Rcg0Gqg1Su7acIDupsY83JfTRUrxYu6jJGLzu
 aDC/Od9JYQinXC2p4PCD7IjcgvO7Ha5RoorNpLONC+ZSmklz/YmWdVV6ZrPEyPtUxKMCwdA
 falc87TT9VPyEL+IATz25XpcaMfEbtWQSZ2GxMHbNRFVnNertoq5P6rKoWLmOFbw0roSOf2
 RfUfhWub8SW8FXzQBAQCqspa1h5INCYIP8KlkS4Qii3QdeF3xhuzR0AM4bWOF3dacc8E075
 96c+SaqTWwwuswOhv9Uda7ssSGSd3csmp1yDjWG237ImHJunkn+yX6+zxTTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769820441; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=V8LURKWn5xkD94hz1Hy7wZy6PJZOiqjAVyiRh7Dq2iM=;
 b=rPGpuZmlAUVqE6RValK0JWpG3nS3C9BG6KYPYCcjDCj6QnHdIVL4cXvOw2CETz8m7eGDP
 EFFKlcqF6SrQ4Yc5cJsL6fwDvHz/4d4LptIg3H4iXwQM8Qk7IYQglLNlzm9SiRFgEgaDG+o
 Y4vZHFCZqCjSGBtToQ0hlGy4L3AHq4DaVNdd2Klsv5OOvtyJBY3UbyvK7U181KJ0Mf2K2ez
 Q0T05rpnoGAfySjxAvxpMFiz9w8Bgl1e6aZwGy+Wol72jzCTTANFTK7pT2Lnm+Z30lFaH06
 +qbi52uVEAovMGebdTWURJ0tJLp7QQ3CUUi3MSiOC3j7Ze0XcPT8tWWSHhAA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C0F104140A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:47:17 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41AC610E204
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ/y2kiOy0WIHufZSjKXroPjLf/nw4DgO5XY6MNfm4X1upnUZ0zIxqRTHEFUodoH318cB/6it7sfAcpqA4++p8TqRTvu1bZ2ZqeFI29DAHR7liitow5a0C5uUSqZoT1INt6wdsPSNM0YaIbg3NGGMCueGJTDlWAlmt8aNH8RoopUPM0R0am28lqH5zD6F76pCqM9t9jEZxcjpsKFSh3ShDgqOk4ZAXwjQMr4UaIHRMN4n4EH7ELPq+MzFO1MQlwzTKkg1JX7zJ0gVd6PZt5OdEnvRFeG4i8Voq3M46qHwIXdOaodPMuAuGzk9IwHhJQ+bjMb105MJI2VxfBaWOEGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8LURKWn5xkD94hz1Hy7wZy6PJZOiqjAVyiRh7Dq2iM=;
 b=alcJr/gOIoGs4y7+oAovG2IvLa1gj/+GJpmXnPgAi8pOn9mIfkG3p3CC+rEHn53amsTIlpXqzuUdAfXebpipgl8q+hwT/MrUDBw02OSsGq3CwCr1ggXu8RUuhV19W071X8fsgVeB88n10v43dvhjvznj5T66ps9GwXcrNwlnqZ8dznc55H8uMn5b7O1oUSq77oyGNBz5OlZk713uOIUTIaM3pyVSYWntHVSbQME6RwHoVn4rDLF6B/V2UvC3K57Q2fOGrtsP+4FEiubm2NXaf3I2WrVpZ5WBIGTjxeECErJqqLFyJx0yFN9b/y+REukaJmELPDATz7Htxm0DIhoJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8LURKWn5xkD94hz1Hy7wZy6PJZOiqjAVyiRh7Dq2iM=;
 b=B0tpk22BeZcF4w6xRxsS3g9pRTJKL6naQa6UR89RvmIuB7gsUtrPwD6suJPJrEZh/U/iOkgExFhfHgtmuBSFK5RAB1Nhb0HAeST4cTT98iJL/XyJXhcseYsdON9wJ1XA246AS/3ie7C2tSbXczwJB6FiizvX2KwDXyAgtsSq7TE+NCgU9TJJ1A4miKESjbsTGkvcCK+lae1NYtX2Kti4KZtCoe7DrL39N5SUzotbYzPMmCKPM53sj50VcDTkmHD+5D8HWgqg9DE00kV2RyD5iSwFAd7YgtV2mM2MdRVIPN+hzILXM7fMzhMG+jJxwpNpKlaKLx6zfm3SI7vwHRgPVA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:21 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 10/30] gpu: nova-core: factor out a section_name_eq()
 function
Date: Fri, 30 Jan 2026 16:55:44 -0800
Message-ID: <20260131005604.454172-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b0f183-01d7-4973-787f-08de60638d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/rkIXt7aS02KIDOgwpMdj8ieHgmRFcpbrP1EHvD4NV877/oPu2L2BTZZAv91?=
 =?us-ascii?Q?iSsi9Sc+hqQDEKbYkYENyXEe5yh02IT/ZmlpHLZqzeWOvtXT4WvXqbIswe1K?=
 =?us-ascii?Q?YIeuZKU751rqjpO2r+R+RPtAhZnugirEgA0MKVFH8Q7IRxek2WcY4s9L1D+V?=
 =?us-ascii?Q?ceaaJTtpXFOl3bU4x1MY+6rIKQQytQkx1U+sPTusvM0H2N3WIJfbs7MdOh2r?=
 =?us-ascii?Q?3l1Gxqipj9MpdJqh+2mw6/a0rWEMi4Ez7bc0bZ0Y2wa136VP7xzenS7aKBxr?=
 =?us-ascii?Q?8VSLSjrP4f55Eo2foCT1OJlGNrfXnUNKGQcHU6EtpWrqXE2WInjZv78PqXUr?=
 =?us-ascii?Q?vCv1wGilbEj8KZJDjHrg3Ph5K7bmvltkQW4MGYY9HvDKk3zG8wCaUswiL3km?=
 =?us-ascii?Q?H/RytQGK2eSWH5IWbAzfvwsNt33BvZS1SDgiITVyDGn6yPJFJbhR3WauLw8v?=
 =?us-ascii?Q?0aa3wsg2q5UyO8DlN1hOWJ/8bmsPUNW6t90O4l/1k7H0MgRlPdZdoVYVbVdr?=
 =?us-ascii?Q?Hgera1BmTuJ4Gu7Ah4IhRIJondM8b2tydFluLuTzRj/H96yWrRiMvvLVaJSz?=
 =?us-ascii?Q?XWYhfzoOYqdh9D8V6y2JegjkKzTmXQ9eNrA4F2UFLOy4F/JMnBSjWKLusidd?=
 =?us-ascii?Q?Myq/hLrqovoxSDaruCn8VR5tsEtrJTg3G9BzPIuDjV8BSf3BVqs4IgoSSfyK?=
 =?us-ascii?Q?h2df3zzsn7tK034e/jsWRS4glxi/MuuBg0G8oSD4aathokMk7JwyJE/7bsMn?=
 =?us-ascii?Q?mOE5UtQRkE7p/CNvhljWK4Gzh+75O9J6DOwwgSmWM28UlIKyBYL1D7VwBbNs?=
 =?us-ascii?Q?/Fx08aDDe3w1dKxIfgRi/fgzGqFEgx18fhOKy3smYojbJgb6Ospq3dKse2zN?=
 =?us-ascii?Q?/uv8PWzjKb7Pr3oLLHwuRa3rZmY7xSDzbL6luKizeu/AtX8MXcFUjgOEVlyz?=
 =?us-ascii?Q?ArSSbe6NnpHE1A2e0hDlYXUo+CUcagyWbi0zipBVoIZdJ0G5Fuje/qIWWTM7?=
 =?us-ascii?Q?D0SJnnTyzQXAcRzN69x3V8hC/dvyntWYgD+4vL2kkY7qFa62CaRt5De733/v?=
 =?us-ascii?Q?81udBfjO1BiVz5C05cbpnMFjQL7J7by2Y38UqRB7nQHs4YdJ0i2Ldo1q+loT?=
 =?us-ascii?Q?h+mV6m24s/VRHUHMNocR+x6mYNYMcrJt+ea+FsXZot7o4otBVvlzRg6rqE48?=
 =?us-ascii?Q?90zvDXr2HvQYOqJvnk0vw4x/S1EuCseUAh1kYVSnl7Nvkyd0xAMqVDHPy8fi?=
 =?us-ascii?Q?INl6YNPdKHUD5rTy1AkzyN8y3fFHUMUGTPAF6WECHamwHv6holjxBfN/4TwO?=
 =?us-ascii?Q?WmwsBtmmhuZG/pZUbph0dnXMJPKxmnixoHlBPPGRS/Z9Pcg/Oiku+Irhl9CT?=
 =?us-ascii?Q?f/vi7TpkdVegvUdYezbE5sqgsEsbgq6XA3UrkLX96CVDkT5L/kaUhPvPWy7f?=
 =?us-ascii?Q?L221uMbyDd4XKQlyRjes7jMAdX+hh8SKot117sZVThB5JyfXu0flDXySTNVG?=
 =?us-ascii?Q?gQIyXhWcQ5MXjy4dSCiM5GMRSZv+yhjatGhzak6aLa9KhPMQSeQrkI1DFsLV?=
 =?us-ascii?Q?dkvtqGVxDXFWW/dszbg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QvjdzK0r1i4gE3sYsmxqFOfTAK9XxpyuEzr30ofqftqOGwa2S9bJ6Qy2jdMe?=
 =?us-ascii?Q?eO7yWiHkXiRJw1ibVl17zto/9AU6gXxmjPrSIeHxpuarebrMHSBYGnzyFfD8?=
 =?us-ascii?Q?P8F5bjfIJPt8WvyopZxqRC3k/JbbrhH5pFDzLz/uVkTw0lDNaPEQhnFWWVKJ?=
 =?us-ascii?Q?OBHeBqDC0KjsIUUkzzypMATEo/V3jJ+XSuGifCAK8cx2Hlrhr612t8MPsw3d?=
 =?us-ascii?Q?A1UugJObG1smD0+NaQ+DLyPyK1UDt9hFKjVVTji1CwERQSlHyNDF6xmoFoER?=
 =?us-ascii?Q?0pl+luRcdybuNbQs5KwI+9fIVHUbfZcG5N/PIT+/QpyATiDXgAsiqqV/A4A+?=
 =?us-ascii?Q?wRwTjCnGVd7a/tOfgJgAdS73UmcrwGJ5uFBuvVSOaTh27p4d4a9jmjQk2e3s?=
 =?us-ascii?Q?WVNgIb39ZDPQjdWkDSeZQ2PCxR1S09AZb3y88JoUlsR7lAM76Vun8BZZaz+r?=
 =?us-ascii?Q?jZFuNQKcvk0PZLn2XXSNGFgiifdltmt1SorOe/H3NfYpa6MKI/gAR8Xyr6Ez?=
 =?us-ascii?Q?3hPUUWYodXpJlqDF6b2dXpGhvBasc6WyJNcNxwOT0lKDcczZR/XFR2RszCin?=
 =?us-ascii?Q?C5tyO0nnKdApmXURwrGDTnukdviRCVr/6XlkZvnyd/7w6bs24n6JtEUZbG8C?=
 =?us-ascii?Q?nQ9dSsYdcwkOLQsls1JInZAzEB7WAJMxiWBxj4h3uxu0sAzDd+AKLReDnXrm?=
 =?us-ascii?Q?RK7x49v2pgMSgkB3vb1dhTu3CtwITpBRaba9PvfgCzR/Io7OJOSKKvMzReE6?=
 =?us-ascii?Q?QhnilaBQtA1xwLIVfygSRScOjHf8N9M5zdeA6F+MsUZsHNlBzMaD8IGHiaBC?=
 =?us-ascii?Q?urO7Z92GNkYPXcufoj2HNgXIV7pHnXiTG7xuvhVr8woAHfjREDPbwErEhCjc?=
 =?us-ascii?Q?QyTVm0ex0hrYt3A/zQm3otK3lyQ92IxoC1hm5egv4mpwGbf+umpebcGXnhRk?=
 =?us-ascii?Q?9EvsqXc2xFAaAOJVnEgkpBHjpeSTVm/cPSIKpsfcXP0hPoQFTwQQS3KT3zMT?=
 =?us-ascii?Q?G5gmhPtnC68VJXYSjchXtmutZh+gF0DpDplyI0ppj3DhH+pXEYJsgyI+A4D1?=
 =?us-ascii?Q?pJ+vuOYnr5Cj2gC9p7d+J20GxhUMTlgLNGfkP//07OP/IFVNjoIPi7i7Gxgz?=
 =?us-ascii?Q?B0KOLNS3lnAmo1oxIEnAsPYfXi/LWJ8uf4/stnwTS6F5XiLrUi5yavU2qXcN?=
 =?us-ascii?Q?pYflA2C9kTN5BDPw6UHuadQ+8Nh9q2IrTqXUJVKE7YcmWZ9IGYApMjvjYV4E?=
 =?us-ascii?Q?Kn/TFetmXkRCiTAHT0BglT/3Z/vmorBhk5Y2EiFYqsmOxW3esV3brwNc2eqF?=
 =?us-ascii?Q?i4iTPfvBVcr20hIM1gpFmTTEePBN0bLyVSSL4X64zqhgDMkKwgH7dc6FteT/?=
 =?us-ascii?Q?V6l8chBSU/NyG7i0qOWWJmfD3dW20xXX0/GUwLPv3ndxgxRac5KsfZ+DhbhN?=
 =?us-ascii?Q?vpmUM1HAkGCsL0jLR6HthDCNj2gdAY7YNZdlXFldw0boa2gfC+FF6xDE2BbO?=
 =?us-ascii?Q?mG+palmmPU97t0y6WLmDA2RY1MwfHkEOdpIe6dgC6gr63hBWOPvbx/r2KMhD?=
 =?us-ascii?Q?bmKEBeUfimterX7IHnGNXAyDYRv6OvhPKqUpcxt6fLcDULQ+1qwwFNb1DVXE?=
 =?us-ascii?Q?GNrUwcZlD6AsvOs9lcRRL8fV64kU0XustOxrSE+2m1aIr1KUh9tQzIMYB9Mj?=
 =?us-ascii?Q?i77jzi0syKLeURw0RIbcZ9uWPxMNsO5teoJqllSbui6v3xvagBbvFzjuqmKt?=
 =?us-ascii?Q?TrH65F27mQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8b0f183-01d7-4973-787f-08de60638d04
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:21.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u0beW32h4ZmkNENibdNvosC2piWBRYOoOYSA4EaNAYdcXqpAJEUX0BN/S5oDU3JgDC1BpzF+hDftklW4znHQgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945
Message-ID-Hash: 56FFRDPUG3THMQZZRIA6SCWFQGMZVZGP
X-Message-ID-Hash: 56FFRDPUG3THMQZZRIA6SCWFQGMZVZGP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/56FFRDPUG3THMQZZRIA6SCWFQGMZVZGP/>
Archived-At: 
 <https://lore.freedesktop.org/20260131005604.454172-11-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0201ac8ccb4..72cefc3142ea 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -464,6 +464,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -490,32 +497,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.52.0

