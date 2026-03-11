Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2ADFD88D4
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 00:40:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 477F110E7A4;
	Wed, 11 Mar 2026 00:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCyU4ETh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B422245056;
	Wed, 11 Mar 2026 00:29:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773188996;
 b=hd2SuXilBHMWx0Sk7obvrH6Rz8ZnVdlGKoThncjC2fiftQVEB7RpCYCwEnnTeSI49kiUN
 6/6uIKdFKKHvEZGbp503alA6Xl3UWbuFb2cYLHEG4B+mIWsUOrP7BbLE41Ut9gkWLECk97j
 S4jN/1p1xufC9TIyJG3YLC5rNkRZ4zKrHquvJxgfIaMA+VYcnaRwUZfs4aXCKp0quUpIdJj
 ObykTn6xVjaLrhel7or8a/I2jGrTRrEJtasXRJm5IWApstFPjZnQcPKxYM0JMdUr+z3R6md
 WBnTfAeGKMyQvtpugIZHrUbV5606cdSKyjh3mjt3oVPIOlRITjx3K9jSLuRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773188996; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v8Gf71f1+HF14bhLysIpw4Ntoz2jJyjAr3DBKm3rwow=;
 b=EEKqaxiV7colz86+kTrmk79/Y6VjntpiFcllKBOe6rlfwuWlzHuoaTsHqN7ZjaNDascRJ
 cPaUFRUjCZ9kaupJeJ9JJL12bqeVatcyKaZfhVNATtkdA+yPj0HAKzZXUN4gcIJTc7tFig2
 RJDF5Y2436aXbYRwPXXxhwjio+Cf7co/omk/gdxV99cSQuM5PJDtQOLrpYP8VCNyyp+zSy6
 jF/SBR9hHLpjPMwyUF7uLBcuE+LToi/aWGasq23oUjlXwM9aHkwk5C0PrhXnVlro10FpYe9
 w03+tuhO/Vt/0BuTWZ6IM/WXE90t4oWtF9HaAJfHilxKsFj8ePtx5D+JkzfA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2369245023
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 00:29:52 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1735210E796;
	Wed, 11 Mar 2026 00:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WguMJqpgTyxQ+fpxGq+WTYWzjRvUIpF6E8J/HA86oHML3iNn4bUY2Dz9nnYd373MPcCIABCTLRc3LLDSjP6iHfD458V9c7ZVStiXLmK50thV9rAveLp6CbfTNeTeS0lPGu/r2NcQxD3oe3pXUH+V+SyvvZKpkODX7H6vGss9RF2VMTA38a6WDez34MHb1ms4R8ZhcoEPsC5ipvjnIa9JCUd88STIhgnQ3XLTMhN92EJ6GCQDT49McYzL3B7I8Uqs4Pbc6mQG6ZxNHzIrWvS5snM2BqSDs3hLpjtqvGSejOv/NT+er9v9nXO26bSwJo1MefLTVwYOKPFpDvAgphZFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Gf71f1+HF14bhLysIpw4Ntoz2jJyjAr3DBKm3rwow=;
 b=P8Qg20luvddCBGe938LVzjTpn5U9tD7z86nIROsJko4W1kv/Oi3yuXf0dMNmKDbknL0i5h8PjOoaI+XaFkr4g0FrLb47CGBk6RxIwx3MEWVZ6A1WYyoReH64LhAZwUD6+5+ZotMhfI1YJC2gQK3BbjHz6kAtaZR5WU0GQ55MhNLqEqrr5SH/awHv1FpNyHmrD11PQvwqx10mRVHHm7b+OE3PjXi5f8RY+QYqZNkKnYSXh5mW/+4/oC6MStRhmTVt28Nx2+uC7TQZxNNq6yC6D4PJDfZzk/XcuRFo3HAHQVPnyRrubkpsGGoHuFU/yH35S1k79mwXrdH2WchoCfNC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Gf71f1+HF14bhLysIpw4Ntoz2jJyjAr3DBKm3rwow=;
 b=bCyU4EThboTO4kypKBG8ElJ4heSJwdatSN2QurUiXlyZRteLOay7cLPNdX4vQ+ALolIb10xNIPrj6aouBTsZHov1omcMbV6WRgJHtXKh9TZQsZ5HOOW4jLu7sY2d9uvZjkJzTe7wEszerQIjUNK6kreMEFjDwikIiu2VKy+JGB6vAKVvmXDW6AF9KB1Gghvm5GBUtc7JLfWW46GOJ1ydqfY3ErnxnRmeUcjXArpfWzPb50NsSz/W5nk8u9AAfvQoIBoUUXbGE8oyaWtnI75Z1w19NfuAOo9zgG7FquiF7md1iohBnns/v/Om0MNnmDnNxhlx9EYby3mWSMglrMSKng==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 00:40:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 00:40:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/23] gpu: nova-core: Select GPU_BUDDY for VRAM allocation
Date: Tue, 10 Mar 2026 20:39:46 -0400
Message-Id: <20260311004008.2208806-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311004008.2208806-1-joelagnelf@nvidia.com>
References: <20260311004008.2208806-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4051:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc91a76-46f2-41c1-9737-08de7f06c675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XZH4fRBF3oPXozAO4J5fNw5cs0GhQz4M5Vd0dyKbI2Niv+z1/zdou1ILdgdPH32xnj+PwXzUlAOJFjqMNO1lSulqtbJtLlMJHWDa9cuDLEreNt3u1eDNf+/LzOjGjr35MHW3kdmsLplSGH7pEhACzr4CQPr4r8qeor6lf6jBferJo739Yrr0tIhZkcNtdqmrkIR5qdo7fTg7LJ4GbQtrLwy9eiIqpXsc+H5FRaPh8gdqTdzacInpcMXzf9ppy6zs2pNw2hXwEKUGoXEWNjv5GxVxnDCX5kcbzijx4hXt5mRY+nsK4rAHJN7D3ZWeoxsxc7MiMZvKO9EE2+mAi+ImyocXkEgDITB2iwc7PO/200QAFZBksSBWuwoRhycyGQxLITH40CjZEHcxpWR6BngQzX0itQ90Fwsq0Wrcj+33R5e7FKEzVEZTDYg1Z0k0hw95vr5W3oPJQsZhKLBV7zR/GpaxAEj9ESF2a7uRPusECq30i4JmYRkiDpOd3tbXooUkftw1Sk1wtewgGX3pyXl98e/ScueuAhmtwJuogV4lfnpYQp7DPgdecksVRf8QTyKhguzi6NEunCCo4+X2OHSKdMqVIPD9jgYmWcaiTaWIVnublE1vygeLy66XQNSLbffoydq6QMuEHQGdhuT/RfjCKYyJoxrDEXS6Xh8uzKf/tYXca4HVYRrQDoxkfS3maNKpRZZvlCZxyRXgXmbMuOM8mVqyjtqvP0NUZTTta/pLpmI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D+tUh+016huiCrc93OUnoXs7ahwsdrNhkww3wAxbmsIUyrY+MFY+NqT3yFjM?=
 =?us-ascii?Q?ptiICuKtZ/PwCH2KjdmB7KIegl3g9y9ungLvlTmGXdth00sDhnJyxAmUSKlg?=
 =?us-ascii?Q?xtkiDaCslToLZqqkvcN/ZLWOoU4Wv5uFwqvlRG2kgOqLarHIu8/RkUJkgYHw?=
 =?us-ascii?Q?2Ct8lXpUEr1QLCRNsr/tc5Q9fBeoV+z98q4cKib+VlPb9RowezNNEcwxdOVh?=
 =?us-ascii?Q?9ZoE2GESJ+nsHdJ1GQKED5vmN53rwV1ywg+wli9LjO0iXlVnlGQ+4Z+cT1KJ?=
 =?us-ascii?Q?uEe0JPdSWq4s2gdu2zm+bH49fkXEM1QHjx4Kaxj2EUMh43oDR+BnIuVx8M9T?=
 =?us-ascii?Q?d92GHk1Sb1H/7c4OJclLB/nz1eHLVxQM0SW0XLqYSUA7tJ0dghDe8JTGtG6v?=
 =?us-ascii?Q?vQcvqNzTUJtwZtOXm7H+KBFGZTmdZk+pP8iyrwfIyz+bw6dntNcuECZ1N1aq?=
 =?us-ascii?Q?ofJR+lT7IIXuYEScOr29ovo0OQ3PIeQZMqnuhS/CvVtpb9x9IH+V1z2fYTFR?=
 =?us-ascii?Q?02aFVEOcD4Zi3xLdAuYmKf3iPRIMJLQbz8fwz25uNDsF+UudW7M8QERmWZfJ?=
 =?us-ascii?Q?Pi5OUWiE4DcjtMNdGwz1gz0wjKGy3fdo3+fX4GjEW+PT8gghDlkEWmzEm9T+?=
 =?us-ascii?Q?UyYU2jIPfPyNa2jWygiyGYbet6ZtKK7XjQWIEE9mqNoFKcwtDw+tk5ZB8pA5?=
 =?us-ascii?Q?NkftpWtMMCdCbK7KVEZClPioiMRomQi+40nvXCrj4UQM5ECqTHoL+bXqsWUz?=
 =?us-ascii?Q?dY1VNKtwM6BBfL/muk1mV1TJYUpQJhmA2N9CtLvtVfsB6K/EQayulGI7T2Eu?=
 =?us-ascii?Q?D08T/rP+eYPOsAzRT0WF8fI/k/HlVo5LHCeTepuJ9pFIMBNhCUSyBHY9h0+0?=
 =?us-ascii?Q?l7IFyxM5YXvNQCeiohSPpb8FDSZ2H6MZnSY6q9zSVXX8VCK4A56d3z/ThHu1?=
 =?us-ascii?Q?zjHmQoWLIKZhQtxuRBOssT1n1l8wJOgxMp7SYS2q9GpJSrf9Ty0mC8mscT2m?=
 =?us-ascii?Q?TzbCyDAX/6d6k/CphTbEJcLcppPCMErvU1QGEYH5xkrUAYF0DUszq1QRypJV?=
 =?us-ascii?Q?K46ys8VFOtIz18qL3+vabgMecE6FxL3ocAOpZ3r8wgKFmsYNHLqdUlmnF9Jq?=
 =?us-ascii?Q?5ferryDeBQ2ViWwEMG0OhGjXEwlrpD9xMWaKLAPpqBcRrvnIiTiWStMXJJnc?=
 =?us-ascii?Q?2FcgkmjkQfUShlGiyX38OeGtLAh+wMoyfBe/uVPgSG+ErvViHrOvnnI9v5zo?=
 =?us-ascii?Q?AoqI/Xn1/FFgLOb5ykEIortsBL2NgiJlYzTobS4xZX7Ok7eJlBgmbh5NOVQZ?=
 =?us-ascii?Q?Z7K5dOInLpmhebwIQWd/bAJvXxVwHpU0V/K3pL7PO2Coos7msuHuCt2Q0/fg?=
 =?us-ascii?Q?spUYShm69/Z44p1mLxm3rA+YVSm5GJZS1pgXlKmlAoyLEYaIqoePAKUsfA9s?=
 =?us-ascii?Q?DtvvSRnxZCNJ/vI8eWkJT9lfEJ3FxoxjVjll47I5yUiHL01dBkW/Rvc5je4J?=
 =?us-ascii?Q?aLuAOf9vZNB1g6i7H7aPj0X6r+EiZSPKMOKeUw9055OUaMSU1u5JfLv0t+v1?=
 =?us-ascii?Q?4pjClz6Wsx1Pxb60KLTAKUfdnhoxezbs1Yj7iQCb14lq6iyoGLhEPFM+M688?=
 =?us-ascii?Q?l9MWs1xPFDUUJ4fYeWlo6LFs6fSO6MEKQFPRXHcrDV5+Uc6CF80h5YX5Mwhp?=
 =?us-ascii?Q?9Decr9XjlMno/tMv+bk6MrqbJzP5xWyvv23zlrvCOn7XKH0sfYBVUeUv97/h?=
 =?us-ascii?Q?vULJlF2ubg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5bc91a76-46f2-41c1-9737-08de7f06c675
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 00:40:21.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W1tNdHFXpyLqvC2xBQO5QZ/UZZmMxp3qHp6UXBW4mRvemRN3U16/leXdOBgYZwg6IJed6YlyZJqW/HAydXtGzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
Message-ID-Hash: LAAOTJKVXW46CV6S3DIRJHLT5ZH5YNA5
X-Message-ID-Hash: LAAOTJKVXW46CV6S3DIRJHLT5ZH5YNA5
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LAAOTJKVXW46CV6S3DIRJHLT5ZH5YNA5/>
Archived-At: 
 <https://lore.freedesktop.org/20260311004008.2208806-2-joelagnelf@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nova-core will use the GPU buddy allocator for physical VRAM management.
Enable it in Kconfig.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..809485167aff 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -5,6 +5,7 @@ config NOVA_CORE
 	depends on RUST
 	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
+	select GPU_BUDDY
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

