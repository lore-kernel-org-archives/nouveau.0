Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EBBC5DF6B
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 02:11:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF6DB10E893;
	Sat, 21 Feb 2026 02:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n1h/J5J7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48A7B43466;
	Sat, 21 Feb 2026 02:01:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771639277;
 b=E7Jb4GaYuJBTiAnwQul7R+rP/StCBNDtntki0nMuebTu2KAkfqvNaWa+AAh8eQKXZLE8T
 k6oZnUhMZi/GcsQvNrZjWbVp/VEBT2NwHvDSMWC2aNRWBxlgx1E0KCkMJH+EBUnKVfcB1p5
 QSVum736C5HKlQ8zsU3o6O3sI79S/cTeGDsEbT9A7yU5V/kw2Ig8pLx9/+PLcQrGTJnReu6
 pWHuTO/gV61nP1p5+TRncwLiwI4LrnFBjm4YZzjOBzFZM/2SsQSOjhlfIQ/WywC2i4GGsGt
 HQJspF0g0ALVANVWizYCnTQE5TlhwihyQgi2Ie0glYSYc3ZA4mAiUxeGD5uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771639277; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DlropBU43v8RhzG9lU7aSK4ogvX4xvWImf70be71S+c=;
 b=ZbZ7M6bzaGn3qiJq+pHRffTUiu8dHJul+7HVNkjzFwnNzHueMJEMOZE7h6D21rJ+R7NKg
 OYP8s7gV+U4EgJJIigWq/xxg6mmbMz4rG1lbaoCRaakoZqD+cs6X6rK6eWG0qibpeboC0mQ
 dp5fTnfgXHJEXDEXUYFkjEeKZfi/pwIfv7OSaKLtreppo1uMU/03cGRu9IWy8TOKmX75thz
 OMkYPbxzvJczUAoGunH5fiRKBiwjWoO5Gs9rtqRr/lquVoJ6mmxunohAqq1FpuW9FM5qDX5
 EwDCe3NayElesBUtdjDY26P6kdlQ8K2o0wi1JHaEF2r4ykfLgNYZivUSNjZw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 84D4F43453
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:01:11 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DFEAD10E0CA
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 02:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFbWHhIwEPX1mTu5b0qP7jc9VN8aheHilrVdgZMwY5hSxm5IvTQ1iu0EerbwiDidbBVjLDnu5bQ6NfIA/0X4xVu0EyIUk8E2HJJLuXzG3kGszOrOoHUABONuFx7aVygXAmOlFTnbpyo4d2yI1cbsjEEYE3zENUDIfo2UhLpmLPCzEw1Fm2OPy/HmZB6xOuyzhDkP1EpazVrmo/44CDLJ1rBpaC8TWFn9Eal7npKJfjkghH36eeyVXnN3lY55OCkLsQhOo6G+xF56ALnkLKTGWkzp3E84b8FipNaYdxffRZ4eo369GqIjdjeSH5V/F0JaMamm1T0sf/t1xwr7tdPlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlropBU43v8RhzG9lU7aSK4ogvX4xvWImf70be71S+c=;
 b=miAhrO+YNuKpiKfb+GbVVMuE0SysaHcuwLfcQDfR/5Fv6aIzUiyjYk6BgptlIOnAUivmGMMdiJKoY95rzM+aUmEgbY7JMqmdYyZ7qm+cNw7ImEg4k1mQc2ounC4VD+yaOvFQBTK1CT2xdNqSTIAN6EnfcY1li0HQR2QXr74wtLFyvt1sR7KJ3qG2NiWG2GUmOY1JR0UBehmsOvtNF3aKITSJZa7oZd+Vs8bRYVF+xHdWY66BEO+7b4Q7rcCgRWk8EyZntw0kgUgjZgA7DCO1xzZlQuZkUfE4Iv92JhvBS42uBhzgIubI+TQMxVhU6fLo/GnLd13I3Xr963/YI2j/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlropBU43v8RhzG9lU7aSK4ogvX4xvWImf70be71S+c=;
 b=n1h/J5J7b7JUwuEdLQyOGSGCox69yD5XBl+kgSLU0Fenaqn4BjfI2YdgCwhcZEqexhZKXzTOMzgadn/P/MRaU9QfuxOwV6H0G3p7OMqDY1kYLNqbsEBSd7D06JoGbG7xkMu17Nk2Bs49CJV81AMCB4nl4EwdrOXLa1kIobl1RJXbMPL74ymhGCOh+MR47/DDzzVmTJvHlRUgE+/Donn4i0Dyk7EFzeAbkYnqSIYNHn+Ph60Isc8LoOvZCq4vwjwMMMcy8h5I3XdyWsXuTmjh8Davb4nPeMTwBuiGyuWlEzfo/DgQqrhJSSAuFdkldyJkJu3WZtbuRz1fzoo8PVYEXA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 28/38] gpu: nova-core: Hopper/Blackwell: add FspCotVersion
 type
Date: Fri, 20 Feb 2026 18:09:42 -0800
Message-ID: <20260221020952.412352-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bef685-a50a-42ce-30d7-08de70ee6267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JDLvUMl3OUudr1Yo33EpJTRowYEQdmksyLN50rNuxM90npxI+CXW7+EpZ8Hl?=
 =?us-ascii?Q?dQ0DqdIMlaj2DYtHQFqWpdG332E06UW0xamwmbkMyJ0Rqldh4aX9jpHMwERv?=
 =?us-ascii?Q?njOaxPxJSul6yGmiVCW2BSY/HUuENhTakyUA81Iqisr/gM+FuxHKiydl7CIS?=
 =?us-ascii?Q?kbgNie7NjEf6YHVBotxJiPzsjOgFBKL9TWvWIuKwD3r4/KPzeIDZsI4rGmRP?=
 =?us-ascii?Q?mrDYz3iv7yn8KKx4AlA32JH28bgnDfWfXsO7xRy3zD81JsAaE1VAWRiJCk9W?=
 =?us-ascii?Q?CMDU4bB0dE5zvcTL2UJgAMCxytwo84AzNU3QWUR5uvC6ohnwkdOC4HZMEiue?=
 =?us-ascii?Q?78wRavq83ibnjtsuyDGbv6qFr4/UpQ5xuAYfochLWqO+OUAeyWOqTDBAXJpF?=
 =?us-ascii?Q?MMLBbYMaKRQuSoNhwIjnfBP+GrIZ+ucNf7Ys+f9OpoABdnltn8IMlrJHxrH4?=
 =?us-ascii?Q?LnWDvJabEPBPHPkLmuBGXR4uaLdzUD2pBB6M3b4p82V8boscW8S1+z6TrC/q?=
 =?us-ascii?Q?kK8uezpBFj+0UD/iFVFx7AcPcVvtwGgF1cTJlW/voVIkOJm5CPiOvnNbnvXI?=
 =?us-ascii?Q?OdGwwjnUaXaeN6SokW7Dm7YayFPI8jtaDp407sP97P2+cwVIPQgGdtfImCjz?=
 =?us-ascii?Q?QZKeEEEag9bbc/AZK+TFl2H7WTiGmZYt2nVTpYEDup3KIn6asqu+pQSpoDT/?=
 =?us-ascii?Q?0vvMo+jMsWHTnCxBH2/V/hHmxMR/aaX/AfPzAgvPpi33UDHJpodLWm4cw3fg?=
 =?us-ascii?Q?+ciak6nLJ+/m3YJ4r2H5fgfPIYdnYjRcjdUA7vF5PwGY8hJHcNdQQzI5DFj+?=
 =?us-ascii?Q?Z62KHad16mlZDGgNT2esgY5KYiZt0z+wtfLn8ldb4eO/cymL5mYGPh+VhcK8?=
 =?us-ascii?Q?mola0DdRdGGCVChYnI9RVJYsZKi+PH5WWfNc7MY5CtjnezIQ4Jr0wvrQhYZc?=
 =?us-ascii?Q?Qxi9gjCF2m51ss2Z9IvRxyIhnJymH1jdQm0+m6Vb8WAnthBHW5PFdqqcZkSk?=
 =?us-ascii?Q?8ebsJ4+8wbwsLUTkRofPD4V5cqxR5ysPSpGPwJlrPyG8n8wEuLQ3SMtlg5KI?=
 =?us-ascii?Q?BpcodS1ISSIPPpesXXTqUBkLtLUWwSvmKCEOWrzrWIWddMuNTOyvw74YKlBs?=
 =?us-ascii?Q?xbTy92NJyZjwGfYpERJF8H/J2zCuuSmiMBV86GfEn6k38iF8vFmQqUHr2uAW?=
 =?us-ascii?Q?RkttVMgEe59fwVzwFAnJ6Cj0I6OxCmeBC2SmVMcV/Bx0tH9CgVPfjfSe2z00?=
 =?us-ascii?Q?IbvRIplc8fdoaOcTfuw+AWUsFvcSEtRju3aOBx91/pj7TU+1QP4m6uvaFNBv?=
 =?us-ascii?Q?NfMCd+XKiZueROYtLpdvzvY1QBYGMZrWFpnUWJVxrFqiufzLgD7T0XRRRq9a?=
 =?us-ascii?Q?mctT4VSCWlarHcOG0smtDxQuAlfvaoAaVypFrFUKlMy7vGh8iG/H7xhlc1K2?=
 =?us-ascii?Q?Wxa11ZD0iLrllg9pSjPpRn8fPkIhN/ba6MJrfOxYgcaHCGuITvdD3wLSRM7/?=
 =?us-ascii?Q?U4yQYlNsFXVhgIR863+GBRDWlU2+NyI2qKIf4e8mK5MY2JdpAtwL/MrmCBQ9?=
 =?us-ascii?Q?w43QXfCxjpctYHXTVxM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?95d7c3V6oQZRHnMrcw3txsCmLZkKDZNtnnpYtOO9+aDdavOFiUoHVRgGYjdW?=
 =?us-ascii?Q?HwtFY0h9wweU1dfyZ/KjVGUemjk3Eav2iamkuGctzXKK4ILrRnL4M40XxENq?=
 =?us-ascii?Q?2aTbwi7G9KJ1mEMJFzvwWHAQSQslP9OH8fIB7LfytIzGzORGlsoiDkq6P4Gp?=
 =?us-ascii?Q?h5AHVdizdMPvOeioNaGjGW96ugD5dpEZpgLPrGdmdfrNw1YvXF1Osn3t1/9F?=
 =?us-ascii?Q?Y/2ptAv56UgVw34tz42z+1Vo033jQIvWrDtoe2ZmCx5QqplXu2xhbSNf8GgA?=
 =?us-ascii?Q?uhp+GdtqqeGTrpvG6fp8mZeDm6skGam2O4/KA3NYUbzdYLoDzTcPYrlZ4YXV?=
 =?us-ascii?Q?f/lOJ7buEVBw1CxJedbEv9VplXNkXTh6jaAcrpA7LvO4FDLLyuXKCftCYIEJ?=
 =?us-ascii?Q?9wGQHqTOBSJkHSGTMRJ5lh8fwrBgvyj4xeZqpq56IQu6ODKsLCJAZuQhrAps?=
 =?us-ascii?Q?5BoFvq/O9d1MYZX+/1TvilA92gOsrdTlzoPnkBt+i8HGfcSJgYKy0Vfh4Bwk?=
 =?us-ascii?Q?82pbv0b834bcWGKsIEjK6R97k5sndlFL1IPqK9VKB2gDGvW+97JEuGH2zsjm?=
 =?us-ascii?Q?miJUpk5KF/Ki79ZfMpa/7ds/UvLatu9Vx4VU6FIJdP/+/agh7mXmkQGePz0G?=
 =?us-ascii?Q?eF0YbqouzvKddYhGF4e/WXzbqiDwaatu1FoNp0GKtBChlWwF1uMX2EtAQ3M/?=
 =?us-ascii?Q?HKJFsw0TWIQfd+Kla8EgKPJIG+KrpUi/fGyGrc3F+Lb0wzsqOk2tEJQljjga?=
 =?us-ascii?Q?9Ho/bPLUBlF+MAxBTGRQXkAaxAZCBR+HXLtlM2QU14Cwgcm9isFB1wZ39T5U?=
 =?us-ascii?Q?Q5AHYn/uf+/icdTf9wVrvaqr5/jqC81aqZnqX7QGgflA4jSdHtaHs6R/JKN6?=
 =?us-ascii?Q?VxrSGvrcpbmZZfzhBzv0UjBq785Kb5MZa507ZXDg8oF1cag39iZgayLU+9I3?=
 =?us-ascii?Q?htkuMUI+3x9DtQjEoGHFjrNZLops0lsDmWSKGE0TLhM9a81uK6zsz22wlU2+?=
 =?us-ascii?Q?VswdBBdNUZv35YTEQ7x9zXhaZi0ER47plDXujAG/Xi1AbPhW4mMtzuxDxT/o?=
 =?us-ascii?Q?pcnaiwqJk4qNDqrdXnrudtfhPA0y0PfjoNjWiSbXq4EPFzAx/yPZ2yNXyKA7?=
 =?us-ascii?Q?b1YxaLU0DnBrnqbwEYaV+PifaWNZm1ddVsWeE2IBUFtRhWOAi7nOZp5w/Yh2?=
 =?us-ascii?Q?bfi00Lr7g53052yrJxs6FMLzk/9ZwNybPokODK15UfrDKbJQgSFxVJIh742O?=
 =?us-ascii?Q?grOJHQVi7sma0/u//dOr3AGRvEgtIxnq9G+ZjhGF+xCdtgxWFXrerPQtPRab?=
 =?us-ascii?Q?6s3fatfKGMa5kj11ad8mS5pUrRuNQKyszU6DSoexwXtL/x6lQl501oR5YzS+?=
 =?us-ascii?Q?jOxV5pOfuQVZWO4EciAjDjL3MPByZtbSbiqsjnbb375T3sXcQDcVHmKIh8cU?=
 =?us-ascii?Q?MasixIJRXRb536NPvzpeJ35is+9uF0Zlz2Im2k4XkUDK/qlnQKRCiiYGG0oT?=
 =?us-ascii?Q?2Ffbz+bnvPBwM+4IclS8T4KLjNxC2FV1PUpkcNgHfEkNV2M4NgNr3xKDe1FI?=
 =?us-ascii?Q?uOppjniNKPfgOPKiKYW9lpp6QMyCYrTJG2MrsPRWgv7mwU9aKJ05sTPqQwuh?=
 =?us-ascii?Q?04mETGHwM97XrXVCwBvHfZFE9ut4GVQr33a+t9yWRCPDveVMhoV1ir8RB39R?=
 =?us-ascii?Q?gvEaOFOSgd1TTbcz9XOqh2ctiIIAlAkMujvnmIVGL0zZaY0CrAfXMfyuEirZ?=
 =?us-ascii?Q?SmEEnrcb2A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45bef685-a50a-42ce-30d7-08de70ee6267
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:29.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B8brQLEn8FbI1ivOO1BBw9W6ob0SOdfjFenzeOF4a2f1TrfVJ9auKupw4OiN4brArWvS51eLN6ucNu0Ka7k90w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
Message-ID-Hash: SYUBNLPIDFHKHN2H7IUWD3LM4DI7SDVK
X-Message-ID-Hash: SYUBNLPIDFHKHN2H7IUWD3LM4DI7SDVK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SYUBNLPIDFHKHN2H7IUWD3LM4DI7SDVK/>
Archived-At: 
 <https://lore.freedesktop.org/20260221020952.412352-29-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 20c439fc7f7b..8926dd814a83 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 50bf351b64cc..fc34c97a61fc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,6 +21,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gfw,
     gsp::Gsp,
     regs,
@@ -127,6 +128,19 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::Blackwell => Some(FspCotVersion::new(2)),
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

