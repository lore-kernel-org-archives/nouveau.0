Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FCF513F7
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 04:53:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72EFB10E383;
	Fri,  6 Mar 2026 04:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K7gPldZ8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B5C4244F0E;
	Fri,  6 Mar 2026 04:43:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772772192;
 b=YhFEe44HfDBG3cTGeAeQn5GBLPCOuixucIzBakUt18CZ76htErmRentCQYFb+fTLmYNdW
 f3f8xZgRWrXVxBgTVXXCLZv6OHdX8teMtCE9E8SXMvZPNV8HTLksDBEne6Afk0KDomR4onz
 aV0YNw+ZJRaKG57MVOnf1n1S4+ekxRFqL1swStSYDpdeqN6IUlAb1P8N3IgePLZCICJwEIt
 kx/nbmhJdGJfEzH4nGhPB19+cZnrBbWylsmyohR1pLtenmkHylmKEPEHcPuxAvycRN4mXK+
 Q/YzqoTLZQLypNuJoCjwuFwgWntpCsoWJsB759v9P6SFqqYETn7ojfUjKDsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772772192; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s5/RzH61K8aJHY8PQpzJBSlYnkTyygo5K2AeiHMNtvw=;
 b=0IeJfpLqYLUyA5vr4XewdfhNJ9adaDtRF2MHs2reOT172tN2ImhlrRk4PYqdzC1GKLWSm
 MMXJEu/fg3kuSPt+uxiQdb0HMM1LWw5+rCvEUVemyKNfOXfnHmZLamxbqCxvM+ou90I11V4
 Ps8Cn4xgW/uwVoPTFuHzptEtDLH0FOKLX18eAKZkQ8HL8ApMpBKKr6Km8Xlmyd0hU27hqJH
 SDEvb5BVbJG32fF9w/3b1vBOWTaGBb/RfN4LMOC0+vPd7PiPVx2JJzZICTtLMVDSOWMjepx
 2IbXjJyRbJOSSI085OjzS+HGtt6njK5uU2xJ7uDkESEk9FDrILl3abCkW9VQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1470A40760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 04:43:10 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9605010E38D;
	Fri,  6 Mar 2026 04:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSxbVe84LUgkI4Wff7l4KW49alW6THeGXdsd3lHT+RajEccenYOgyoqcSK8lyA8sMRX79hO2EadQR4GNR7djugmC0/BAKDcXRnacAYWLAAw0yDX2n/rWhXCHnMZTgTZJu9e/+wQV+W5e0SW2JOBHCl4r+ERtfOZmSOOTvmGd/wgB6035inbTmFZux0cWZ4xjunFQ3DYL+fNwcY+Q4UCPDFzisc38Cubq+OxtiK9k6B5xl0p73RoeOE/ETgsHK8r4ffTrjDOQsNHTSNNrROTFonuxJluaduEqxOVTvUACfxOwvlPQbkkQgCA0MUChwvGV+ocRAaq/SARktKhBeVxJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5/RzH61K8aJHY8PQpzJBSlYnkTyygo5K2AeiHMNtvw=;
 b=JBNT9t2gCTkhWole1Sgyao3biSkb2OD2uvnHvbYkGUgrFZVfdGw0E8O6sEBbLeuHB+8HQOYufGv8J78j4EvrOU0ne8aro2ha384rZU7/0R8L0bt6s/F3ONe/4WayAzDcKR0alwcXlr9eCy9SD5M+F8F126SY4N1GS1yFdTYySqCYJZ4zq7vIzIznmVScL5JDF8h3tcW/Gwyj2o27REQW9pqTyMCt4o0VyvJdp6asyIHA4T+ITSIf6SdhPkBiQj4j05nkprVJr6TuMfAkytbfR1pclgc1C9/EuGJb+mw0nGWJyrIzo2TDpyPT29KbiTjFZMzaCHu5CP5MxI2G718V8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5/RzH61K8aJHY8PQpzJBSlYnkTyygo5K2AeiHMNtvw=;
 b=K7gPldZ80FneOXDuLKEj5uT70/1MvAetyBNTQbRD/Oe6pVVBOOu4LpJ3jzGEy1yTOpmaARUqkblY77Q9NLJfjn4WFSjIPj1P4EaUumUd0q/JKeSKIQ27U3DgZM6fU85LDGNpA2MNVH3Os//e3Sepwt4Waje/Qc20VqHsHYojxsB42ytxdvkVjU/wUjLCqOqhvEOXFMqjx2J47FVVdcQ7aFdigHePc85OfcQ6LdTwsnMD09ReDNzGStwqE6Za+aThujLldgHSERqW2H60XRnAEfNiT+f1HdtScGV0cAKif0UFROTQ+x2B9bRQ5FPgl8X/GfRxw6kFcAwmhZiuteC2nQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:53:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:48 +0900
Subject: [PATCH v11 11/12] gpu: nova-core: add gen_bootloader firmware to
 ModInfoBuilder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-11-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 855050bc-a9e3-4640-4498-08de7b3c4fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	Zo3BK+jc/BNWWR2NnELtzJz19FZ6wb12YDiSLOZCG+AUJ+UE24DOTXcVYarnT/ZbgHg149tkMDmFtqopnLKyHjVXGN02+ioqLbapcCSG9ymlQ+Q3cJpIextvfoMntkl3Wz9FgP72tI5I/sSosxt3ufhytWRnNF7gxxszdqynrQnH9iEnjB9eSI+cz6+8HJ6rP89lCkCHJimZqfBxjsEJoj390zHydD2V8qAo01v6KP+X6DooSog6zI/egygd8D9IrLtWq9uDs6OgJ9yjRmnHKrfHO0gc2IBhLqcoOSt2790e8THUuwglvugypHDPj0aBcpsEELqXo/584AW3x7zv6zTTZvoPiqsVQTzoQM4JPaIpmYXFyf2tiiZTjSd4T9eqRWM3wfj2iK+Y94wyzxUdc3D3ifzLMEvhMFVHJt1tO3uuEE9uiCYKB2y4CLHCv5ysosX1hvNKk9bQcG4WVqbpfG9i8Cshq8MM4bOnguXYdtakcKZq+QIjDX9k+Up9ZrXERfgC0QTtdWxiMiTzXBpsefzzCm6BJGIFg8egH9IuoQJfdaOo9izTD5IgTHDhqjvmB8TxVrfmEWb5qVquQqqvb0f8pcOH+zGrMSXtplMC7fjAWBMA54p2A6a0dkhllG2CFV69ETwQgZdrehD3atkp7x2jGSClEMB4Ua7obxCp4G3P+t/uIXYCE+w0Hxt3MNlwoATqcLzOMggTV98tV1lpko6sYV7a5Wc5VvBvr7f+xxk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djBTY0R6d2hDeENuZVBpYnVHN21jTnRqQmZVRCtkQU94KzNHLzhFUFRGUjY0?=
 =?utf-8?B?N0VhTXpjQ1NZVFlGWGk4VS9WRWJCUUk5ZGMrYXRFbUp3cHY0UjFiUlZzQjV5?=
 =?utf-8?B?eWRWcjZlMTR5dFA5Q1BJSTQ0R29EREZNR1dVRzdZeFpjVC9SUGE3b1dwYXNq?=
 =?utf-8?B?dHpmbU1SNHJtV2VFTjN5M0M2SW5OQWNIUllyNWlzUFI5MHIxVGJTYkQzOThs?=
 =?utf-8?B?b054MEdTUllEZlNzU3BwSnNoaVlicTkxMEQ5UzNLTUpGZnZyL1M4ZERVdDdm?=
 =?utf-8?B?dDg0OUdBdU1qcFVTOGtUeGdZRTZnS1d2RS9OZEFPalM1UUpkdCtBQ2orRjg1?=
 =?utf-8?B?elFNaVVmQmQwZVFVNkFWRXhLREYrRS8vV21kUnRvTnlEUlljNW91aUE2WC85?=
 =?utf-8?B?U1kwU2JwZ0k4d240aXBjd05wRXZCc1U1eUI3dlcvYTU0YzZvMjBLU1dqazds?=
 =?utf-8?B?cHlDUWlqUnI4SGp5RFBmbFN1cFVpU1ptUGNoUWx3ZXh6b01leUNMcDA1TnQy?=
 =?utf-8?B?ODA5eDR5WEc5Z09DRTFWSk1waG1ROGpPU3lncW84YkxRSXZIYjJFTmxJYmtk?=
 =?utf-8?B?b3VKYXV1R01PRERBYUI3cDZMb05HOUFpU1VYRERnVjNtOXN5akcwcE1NQnlE?=
 =?utf-8?B?aU91cVBBOU14QitGOUw2TVZ2YVZxbmVwT0RlaG8xSXMvWE5CVzB4b3krZjB2?=
 =?utf-8?B?WkpuWWJXcXJ0bi9DQTBYV1d2cFFqYThaVkZDLzY3c1hNbFY1b1FUVXpmWjY1?=
 =?utf-8?B?dldRbGRMK1gydFpKVm5ZQ2haYUVFZjZvZjJ5R2lxR095VUZRZzNEMTl1Tis1?=
 =?utf-8?B?cng1M3BIenUrZFlNOGZxSHlocnFuNWV0WGkxNGxvZVVrcU1sMWJ3ZXI4WE9x?=
 =?utf-8?B?NkVXc1pUazcyVWphaVQvamVjU2tGVUpCQzNvazM1MUJUU0JOa2ZOZmtIa3F5?=
 =?utf-8?B?Y0NEdStnUnUvVUMxZlVwb0JwMlo3eE9pWXJNVnpBSkcvKzZqMWFSem92NDF0?=
 =?utf-8?B?NWwza2VpWDdBaGoyS2hmeHVrTVIrT1JwdnVDWTJFQmR0UmRJTjZ2U3ZrSEJ2?=
 =?utf-8?B?SnZyaS9sZGZiUWhRRElwZ0lNMWJGSTByVHpsM2Z0MWVZV2tMVXBRTEszWmpC?=
 =?utf-8?B?VGQ2RE52U2NwNUJtb3FQMU5lQWxvWVBVa1gyK2dlMUhvamdxeWh1SVFXbG5X?=
 =?utf-8?B?Wk5mYlBhdXhBSDBvMGo3Zysrd1cvQ0xKQnRMaVRsdXJndW9rTFhFK3BueGJK?=
 =?utf-8?B?QkhPa0NCTXNiejlGZHJNclc5M2pUOTh3TGMwQWdSNW1BamNKdnY5VE4zdnp4?=
 =?utf-8?B?QmkxUmVXdng4bE5IbmtZME1ybDIzM3liVkFQUWNLbUJUQ0R2dTY2V2FseHNa?=
 =?utf-8?B?aGJvRGVMVXZ1TFJWaWxFNDBuWE1lSkVqOUpsVEhmbGd6cERBblJ0OWtSeUda?=
 =?utf-8?B?anhnRkZtUWxpemFjWG1KTDQxS1VINEkyVWMxL28vNXNNNnVzLzF3bHlMbXZU?=
 =?utf-8?B?bEkvN1dBUDUvRjNxZ3NUUzBObWFTR3FodnRNVk5yZWg1cmRFSk52YW02TVBL?=
 =?utf-8?B?QzkrU1RjNllzZDVDd3RSeHdSZkJiNUU3RFZvZGNuL29ja05mTng4RUxHWjMw?=
 =?utf-8?B?MW1sSGMxYndIQVoralFBQ0ZGTERqcUppSXltemZqU09ObzBOSXFYb3hXQlU2?=
 =?utf-8?B?bHFwcVNNM3cyLzAreTBvV2g5WlUzZ2N5WXI0UHFuNzFqd2E3TytEeDNsR0lO?=
 =?utf-8?B?Tk0rUW9kekNJNDUxTHd5WGd2WG5ycFFodUZ4WkZyUTExQ1FZVHJpQUdUejN2?=
 =?utf-8?B?TDhmY1BKeGRLMnpnSTdxUEtHNHJxeXZSVEVXWmJ0M1dkQ1NMcVpQRVR1UnU2?=
 =?utf-8?B?aEVXYk1RRHJxNmRHVG95emlQaGVpY0tSU1J5aHE1akdlUlJReU9nQ1RQUWtJ?=
 =?utf-8?B?ZHlrcnV1dm5samNZOU1iTVkvVFY0R3lXZkJpSWVsaStVajlVbWRkcW5RZTlU?=
 =?utf-8?B?L2QzWDlkQ3lSUzU4VkdGUEdyYTlnUVo2OUkzNXdhc05raS9rOXM0RGpXc24r?=
 =?utf-8?B?ckFreUFZaXd1SVpGcGpFZitTWDgzYXFPOGY0QWlHc2RGZWdTclFRS0NMV2RR?=
 =?utf-8?B?bGlVK3hwakNvM3BKaDhmbEQ0UnJiZDlSOSswemdJcllCV0J6SmJieUc5S1JH?=
 =?utf-8?B?Nk4xR0U4NU54S2xtSFRWaXJCbmlRRnljWnVocDRGd28zcHBWNmhld1c1TWkw?=
 =?utf-8?B?S1lyUTdwWGVRWWw3RFV1SWhMTkdWYSthMXFmN2J6VGJnUFRsUWNiV2tnanBa?=
 =?utf-8?B?cFpKK2ZmMmZmaWJPMW1ZTm41MENldnR2eEplZHl3MzNJdUtyL01SRnArOE82?=
 =?utf-8?Q?5U+9VQ8tQahvV53YNPKj5d8eAU5qdKJ77/ic50iaEbHl/?=
X-MS-Exchange-AntiSpam-MessageData-1: FfmCs559OohKCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 855050bc-a9e3-4640-4498-08de7b3c4fc2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:30.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 b70g3nR9Un1nHM8izE2T57BaV3QuqPWQra9n88x4jUN0v81UD+wC9lK/9LlI071aCzuAbCRVvHF3X/4+/vlsPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
Message-ID-Hash: PT4DU54C6YDP6Z5ZPCSIPY2RL53O4ABX
X-Message-ID-Hash: PT4DU54C6YDP6Z5ZPCSIPY2RL53O4ABX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PT4DU54C6YDP6Z5ZPCSIPY2RL53O4ABX/>
Archived-At: 
 <https://lore.freedesktop.org/20260306-turing_prep-v11-11-8f0042c5d026@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turing GPUs need an additional firmware file (the FWSEC generic
bootloader) in order to initialize. Add it to `ModInfoBuilder`.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 21 +++++++++++++++------
 drivers/gpu/nova-core/gpu.rs      |  7 +++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 5e56c09cc2df..6bd203c94b27 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -425,11 +425,20 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         )
     }
 
-    const fn make_entry_chipset(self, chipset: &str) -> Self {
-        self.make_entry_file(chipset, "booter_load")
-            .make_entry_file(chipset, "booter_unload")
-            .make_entry_file(chipset, "bootloader")
-            .make_entry_file(chipset, "gsp")
+    const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
+        let name = chipset.name();
+
+        let this = self
+            .make_entry_file(name, "booter_load")
+            .make_entry_file(name, "booter_unload")
+            .make_entry_file(name, "bootloader")
+            .make_entry_file(name, "gsp");
+
+        if chipset.needs_fwsec_bootloader() {
+            this.make_entry_file(name, "gen_bootloader")
+        } else {
+            this
+        }
     }
 
     pub(crate) const fn create(
@@ -439,7 +448,7 @@ pub(crate) const fn create(
         let mut i = 0;
 
         while i < gpu::Chipset::ALL.len() {
-            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i]);
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c14d411c6759..8579d632e717 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -105,6 +105,13 @@ pub(crate) const fn arch(self) -> Architecture {
             }
         }
     }
+
+    /// Returns `true` if this chipset requires the PIO-loaded bootloader in order to boot FWSEC.
+    ///
+    /// This includes all chipsets < GA102.
+    pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
+        matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
+    }
 }
 
 // TODO

-- 
2.53.0

