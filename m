Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A168FD45F1
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 00:24:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E44210E84E;
	Thu, 26 Feb 2026 00:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPmOJzeU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E5981448F3;
	Thu, 26 Feb 2026 00:14:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772064861;
 b=QQfmSdmm6OTmqAF1mhmuSdjkbEljjyE3tDHrBtMl4aOZ8MwaqWwnkC79lD526Iea0+lA5
 RApL08MG61UIo4MYXgJVw2UBVt0o9HAvsBAAJ4Tr20d9Ii5aLMQ+f1y4j3Q0QCZ+UrmScxv
 w/gWs0jkwOfu+Z6NCv6/7GaJqMisVQYx4I7p0rGWjmvtQwCqN6z6O/c89tlmCL901ME6v97
 U40YsU4exbuKChxT21u26Y/uDfR3s3O4rwluxb0AGdltwIMlQjez1E0iKNqpBOdsL2x+7kt
 GnzerHSBUPCVB+LOYDUp4KaEyxVBaLpWsmILHgddm8EtxQh6RAptLtT+WATw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772064861; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=h3TFJnQrX8AusUbzT5qgsy7sqCquIJfpW4wUDsmbnWY=;
 b=iuiwcdaHT9jpHr23C6A7aHF89TjMzbgucE4VE2EelOsQDuTaTt7H+hIpWTko09OaedPpp
 xXoqarRLEiHUK4IgsX7GnpU0kEhIFPZ2Xi6bHhLfm7ypuZXqREfj64n8jDrCgs3B3m152vf
 /ausPxB4Ym6zHLms1ZZOVqAP3vrmvdcps7Xys3ca+LhfR2IQf/O9CyNJpd7oQjdRKbIH1tJ
 M79uzZ7N3KEUcH10o/LCC/CNBikWOthi6fglYZ4+sVuj4mjyCAwESA5M8kEFu6Onml5kTKx
 c7gitNcZh3gaNdR9wHnbrT+q5nrWrLIf16wD8GX5Lx069ILyU+NmWXK2g+Hg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D157A41AF5
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 00:14:18 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0587D10E0AE;
	Thu, 26 Feb 2026 00:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtDZI+QoxrXKru87hQh1Bu4sTj5/d3MYob2w5rc9SS56DpZEXP1Owlto/W3K2f27pfmhPZwJ8nLVszPnOVYUGXNcsaX3KHnk5sLz9PU1MmSOXqAr/jAfROxw3zbjh49ZHP1kk7cDdceyCdrS9D9BB2NY9rb66Tn7FvWzbqZVw3dZ/XHJVNYenDCnBk8KIivc1HuEHSncQL2N4RE8bopRrkoHCqs3csv471nnRlK6quLZk8WNaBxkj2wwSj6OfEOyA8DaNKe6f4mbek2mE9+nx22GQZ0PDNihbzrFVO7wYRCnNapO9iZXSlYkL8OqQ3Rjt1wGGyU76qAlwIEYRlD4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3TFJnQrX8AusUbzT5qgsy7sqCquIJfpW4wUDsmbnWY=;
 b=eWDmJjjtD96q4ZMbGVeU1o/P1bIYIb2WvGgsVuWaV+QZ+EMfSGK66x13P/ZU15fuSrqu9QK3RbFnmQbefTAGIb/KvTM4TcsES1lxbeBTDPgez2mMN6SXS0kSNtj6UxnR2iK8QoRRzBiV40t4ej2bMZGeAB8ZopLDEPUtOoa+x0T+ysNor8m5L3YzwKXDEXJMePCejEbDRWDuQ6dQAAOG5MRg9YqMGWcvyb/0XJp0gfi5/eugWhvuAibekaZvsCRxk7BhdWn/5besGl6FoUtQR/CHd9BT1ICTmrlVYYW8HDKQRir9WKzyEtuPIf3RCuT6ScO4urk9xGEA9Y6VNR/VHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3TFJnQrX8AusUbzT5qgsy7sqCquIJfpW4wUDsmbnWY=;
 b=tPmOJzeULwOs18tiXnQ7SSHmfSXf/3PNgLo7gsATKr9A2lfEl/Hycq4zhmb8zKEMbmXrw+7abBCIi5ey5NWW1Vx6sVNpk9LS6Jzojk+LmqpGyzVURZllcx9NSxxFf1FZo+xQpqJHu3Et4B82J7veMXDYHHBIsKQehLHPOi0igi1XF1foADmwtXtWQKQKhXe2T7N7pfgk5a5aHma4bM8CmixgAVZQ8t6l2Ebqy7lPKXo+M0pjyIs4BXBIrmygwppQ37Kcu+r6lu2/jGbyXrENdbtWaJfj8cVjRulRph4tnrZb00TS2CAGmueBQkj6R6lmIdB4GNS1azbCRG5RDsMjZg==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 00:24:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 00:24:19 +0000
Date: Wed, 25 Feb 2026 19:24:17 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
Message-ID: <1772065381.31e71601a63def39@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGNW1KH6TCE1.3DIVLKYG6OURI@nvidia.com>
X-ClientProxiedBy: MN0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: c41bce80-935a-490f-7bd9-08de74cd61c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	7JZcPqiqftaTV7p8tZepSpK5KFNguf6ci4AeGsS98FRNwbUcI3yqyUy1KeQHuCvGQFSXGwtTBucM+2q4Sir8AG4ofSppl7DdZO3Pu82TB3PD247rfxlmyCCO8ibd4y2d3dI2KjkRTRuWXByki/TnwveX40c43uXIxtmH/IOAuK5FTyxQE7E2p7xct3kZiQNnTIv/2dBxyQ7KBDhIbd6VWUhmeN8lRhuek4ribt2IO9XbSnGWOa8tnDvVoJyx9EXz5x1PbZJ1/TD7DxxofGF5EWseTSsfa66W99sd8pdipXNrDXldvzZ02l/A+oqp3LvTFsWz11+GmeqrtVUXVLthqEX98Ut8uCOrkmqr0f0jPWjwqc6D+Zl6iI65pyq+qn3h0GYcE3YJzsEem9sttZlkfkpk/TchUA2JtVPwJFpV40aISRCTPo7IobzQb/Nz6Y0LoRu7RPoMozyU86z+NAikZiCMKhsrvSzyMOfflOLemcbZfNXSHECrnRtIfKY5J6ZWT8XqRLGeEhBekqLoDobjs4Hf57aKiLV9mAUedWkVe+Y/J+fV/+cp8t8DLfpNonrP0yl8Tcj8IZI4Ge87WWiXpDahPePC7+ti2ElVs9GvfaC1zlZHOGNrZHcpFgYEZPlzkI5g9G6xQCqdPwQfrhMMob5bRyUgdzHPANNi2zwN0FEpK1r0WbrjjYh+bOoiidp5NhcBabknayTTF81r7K5dDlepf5jkUaVTjPodVNMzk1Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W8PfFYyQkDETfYXsibtszWZXmJ5P77lbsyQlSXYHWNLGsAMvx7f9qPLFBXj+?=
 =?us-ascii?Q?X/nUTqID9PT/ze17PsOP4/RWEAHkCKvgMpbiUJED4dpWbwSx8wssGyAZmirO?=
 =?us-ascii?Q?056ivssN6YVjSsdpZQFzDe1ZEFIKxpZNTFJScmNr/QUjbUEqjF5i2C07saeC?=
 =?us-ascii?Q?jY7oPD6W2o5H8ZC2vphRXhNry0JEGd3aqObJ2KC1DUapItB8arupjWTGc3rq?=
 =?us-ascii?Q?XhbWdQGW7S3QLbvK2qaebT3L0XbamcMrAQdxmYiXcEyieBHhLM+xS5Janhvz?=
 =?us-ascii?Q?F8SM43wkTxeDqY/7sxjmV5dfCbMIX2bp2tkgiCgAA+Jh7Ky/teGN94NDkBm1?=
 =?us-ascii?Q?VOtam/5D2/uPNMnneQZcyprWJyAmknV6lzEJR38s8cHyPKFi737YJuh8qjEM?=
 =?us-ascii?Q?x8kQnrcb5/MFrUTbWOU/qUvIEF//wZbz59jStK17YZJoOGvZuUHw2AuyN1Nd?=
 =?us-ascii?Q?ilxdb1mqIXsTkN9XxmMcgSZrxN0PIwE2WIokCBg49J/z+AuJHZmrgzJc/sqe?=
 =?us-ascii?Q?gC8Ps3DnIeIX2LwuvDxY2BdWBYAgCEa0SSzFMW6zm3iPkhNa5V45tV/xv8S8?=
 =?us-ascii?Q?33t1sfGmTEtwKaObl0wWp/+8FiPPdyDtfPiiNIQYctI3/BmDoOSjizOp4Hz3?=
 =?us-ascii?Q?3yrwFMd+Rp1ccxU57EMVUyyjNWMg/Hg7VymAoM/aH5d50A2tWIgf8Q7rfSNJ?=
 =?us-ascii?Q?krsgogH2dvKfwB4Noz3k+A+981QQ5QjFa2snCpWTOSdFf3pnAkpWHXzzydcx?=
 =?us-ascii?Q?xs6+l6Tld2tfjEIWTKeSHfK39N8QB+3HsOOv44ClHDOFpnmajBv7wXWwYX35?=
 =?us-ascii?Q?Z1sWrFViZCU0Ek4bjAlDp8EjXZ3+6IDeADNNZ3vQ758X2aa8MCe+T7mW1IUe?=
 =?us-ascii?Q?HTWTuOEKkxEtgAg7GEKzrOfoD7F/JEard843okWMqWGT1316D6Tr4LpXBkws?=
 =?us-ascii?Q?cdaq12L5hTowcrbsQEYPZIftGZA9adIP6OBednvymaRZyw2BnttzhaSf3nUk?=
 =?us-ascii?Q?rZfcU8JTlBSF7DyLiy66FEk2m+kZ1PUFrh7AA0RKJnccH0o2sLxrEh1Gw1uu?=
 =?us-ascii?Q?Q3mJ2RqZKf3xd37JUT50Ci206CqUH4Ci0zX9VpOnGs389e22mvwWBHtd0FEL?=
 =?us-ascii?Q?GzklDQdIYH6zKN7obZqfz25IHfncE9N8Q5Q1FNvfcO7/9Q67hSLdxV1+rauZ?=
 =?us-ascii?Q?aoj85S0SH29BszvF3mTaD+zHWgEUSbjX9/0IcectSlKsCoMwi19ItjPIYp8/?=
 =?us-ascii?Q?lA4W6zhmbx3Gpj2zptyHo8a5MqQ4AduVtYkrYjTkSOyIBZtv/sn37EdirRvW?=
 =?us-ascii?Q?6y/M3sVxCc/4t4IVAlY7HilAJaJUlI8ELq9b2nWbvfC+pspv7HwV/iaAHpur?=
 =?us-ascii?Q?UQftt4wcUJxd1A/7e7Lt4VxRGC1uskgTUs1qCpDF76yHBgXIF9TCzW3iaSg/?=
 =?us-ascii?Q?7Yusu4kaBlMHdunmqsx0bh+UzGZEX4LubE7O2OuZ7aYe+rwCaivFEjRg7QLR?=
 =?us-ascii?Q?RvvTev0OxhvJUsmIHbHfnfUk7/awh90bJQBTiZg0ylcK1MvCX7PkOf2TOzP0?=
 =?us-ascii?Q?cMYYo3GAaVAr7enNMlQMWgHqmqRWGNpl1fgdNNyEZpGONqVOxrCPTgxzwc+I?=
 =?us-ascii?Q?0RU09Rk4Z7g8dMG9zGph3JQzSRGnXiCtF3RaxQDObVCVsdnv0uVI5g8KJnuC?=
 =?us-ascii?Q?Zpc/zZsih7IifjxN1xzwM/YDRJcgPK9fn79Eesj5BbWnU73dwF6H6pncKHWQ?=
 =?us-ascii?Q?oCswHImdzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c41bce80-935a-490f-7bd9-08de74cd61c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:24:19.2546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2x6ksK3eON3BIPPAaGSGEUVLANI2msCLTbUu2q+HozF+QmMPlz3vfYJZgd0SihMGG99kz1Z6lUui4/g/mv7lLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
Message-ID-Hash: 3PTXCN2NI3J2A3S57IZYA7K3U2O2XA5G
X-Message-ID-Hash: 3PTXCN2NI3J2A3S57IZYA7K3U2O2XA5G
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3PTXCN2NI3J2A3S57IZYA7K3U2O2XA5G/>
Archived-At: 
 <https://lore.freedesktop.org/1772065381.31e71601a63def39@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 25 Feb 2026 17:09:22 +0900, Alexandre Courbot wrote:
> On Wed Feb 25, 2026 at 7:27 AM JST, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.

<snip>

> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
>
> `item_ptr` does not exist.

Good catch, thanks! Fixed.

-- 
Joel Fernandes

