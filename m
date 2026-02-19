Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2635E9A03B
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 07:32:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6D10E6A7;
	Thu, 19 Feb 2026 07:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eFak/77O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 294BF4340C;
	Thu, 19 Feb 2026 07:22:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771485759;
 b=zWE3lexAKloEem/oRmOXzgM5e/SXK3U8SNK4RAJJ6BVUP0HvnvyL8vkWAktv5T/91cFM9
 GfwQs6R6qKirzATT54UHgoOr4SvnLISQwMDQeMPDOCMWdWKs3LhRSzcv9CPiSy02fbawEwr
 fb5f8KkC0nbDveIpBH0JF2oPnB+3WmRLvg9B2i65J8JlPkpSG9zQtEFvq5Cy/TDovAl030f
 6fZNzPDQBqRPZAp5bYY1XNhQApP952X5b8FgCQhY4OACz447lLs8PHdI4Jbm+3Nm5J1GCZ4
 9zuvNcsjpauxWoAn3PMRRad6h7B1UZNn5w+lsVej/TCUFDhawb9JQPusGOnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771485759; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4vf04y6awk7MAQDaO9h+XVkpI5nnRfyEDFYL5LW0ltc=;
 b=P/YK5w/O7LH15aEuFTsEw+CTCEFbgWY1JXdIPP67UVo16dSvFMDs3u/resbmq78YnvXIN
 WK5fFV7CJBkbqdeP8bA3nl75eS9DWrYVkiNIPvER0cFoOEKjqNGsSkMVmkAc1m2B+6iiQ/s
 6X5HGD2NziRKTIRrJLlR9VIm0Qnl5SAjh24IcL2igbmooamjsPe54tX7CkLgBzXVJHEfgt7
 7GpUg1k/VfDQsoxyPOSt59ObRiVgS6quvvZW3TeUEjDtVLKhtBI66Hm9S3sfnkxvrFXua0U
 O+bu67vw5yl8Cp7Ecwhf23C59x5n7nNd0GkFxJ5pAR1Bi/+Al/TFqZZcITrg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EE978433F2
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 07:22:35 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 690FA10E6AE;
	Thu, 19 Feb 2026 07:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQcY1ouTE9q/WvLVdJa0+AWFKLyY1T+qjUnxoPH/WJNFlftIG72633zv8M4ToRXze5wuIFIseFamqxoFrzA53vkHscUj/+PPbXuCwBnhC4xQWfAc9PTKrN7db0r5NZbUNJcGjgFf4VveBKNW54mcr7QdMf8S3E7D5DGgIbKDOc1UchUyFhtAsGvPpmCnFA9jv8hEhHR6iZ6kM2v2/9xd4BUtr7kjc4H4OxG40PHqTqwH1sLkf3kDkDpM6LE1YxzGQ9+xF5dGOkI9GnHyWX8G37p5dNFhlE16JHt9JqcAEVZ+/RKOllRPR0mEfS73221ks6EwtlzSrEHwB58j+wnHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vf04y6awk7MAQDaO9h+XVkpI5nnRfyEDFYL5LW0ltc=;
 b=cXJ3jF7Jz7epJ4woLQyLv9xmuHMTkb8Q87aZlGzn9aglcx9PN4ftAjoo0/kVAXcKgDtjRWueUfs42xvAd0ybUKtUWvuKoh3Dqb3kxmM6JqF6fBSPOftXK6EAzoIxf+kssCJ4+GMeca8khcd+F3U2QzmYui9S9R2f7kVmPtRPUqh+A2+OV9I7qXbexOxjKzboU7znb3Zs2hfB/cr7ttyX5LuEs0xZq4MllsvSvbgK7iB2bRxe4tYCiWwP7bR8OXziZdk51suO3rxdN/D6Tve23ve6py9okiiyEdR0n0H4bA2IN8NvIgKiwfPxNrAZZyAKqCCtHSIJwHk50xPd+N/NEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vf04y6awk7MAQDaO9h+XVkpI5nnRfyEDFYL5LW0ltc=;
 b=eFak/77OeDMcay8er4XauyOQzAXsptdekgNX1sYLuYl/+x1U9BHAl243ucmLwJhQgSU5P6R43veGND8lTfya+CVVLtcmMWlYSOzf6xUrfJTfEwkE6QoiM/lx3V2qlpsb2GEPHYtnXeOedz0IvsfV7gWcxT/R8EksNidWjxD39lgeOh6AXRo4pW9G0CtJbkz28+0QRWOP23QWJSC216SjKyJwg+hYFhfeYcNxKnWdtfC06RFgD25oA6+5n7bOtktN2SF0QdCz6y6Upr7ASyuhMD3eOJBj900WP4nqcSlIafBLKPIi+/1WBO25Cc86kD9jC9f+plAEMMMlr3fR8OPMhg==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:24 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:24 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:52 +0900
Subject: [PATCH v2 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-3-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 137277df-5dc2-4369-b193-08de6f89064d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWtZdFVhSVFjM2QvZ3NTNkVQcmdEL0hyMThTeXFXK0pSdDJwR2JMSDk3VlBu?=
 =?utf-8?B?R1d0M0tGc2xwdDB4eStSbU9XQU8xeGt1RHBLOXlLVkJELzRPOWdVVW4xZ3pW?=
 =?utf-8?B?VmR6ZHJwSElNTUJaeHVUViszanJWZnZwaHZaazBCZEdXeUg3YmhOUWNzOWVj?=
 =?utf-8?B?dWlhTDVVVmdYWVZkRU9oK05zNDRoVG55QThnVHd2VE41TC96WFgwMCtTYXZo?=
 =?utf-8?B?RUdpNGpIUi9RdFdvbG9RRkJJakZubDhpMStMMEFYN2ZyWi9iNVBjZjk1NTVY?=
 =?utf-8?B?QW9nUGZQZE9JNnEyd3V5WHlyNkJJaXVUQjJCYXZ3aVh0UlJYbExORUtBbFF1?=
 =?utf-8?B?U1NMYnJTNlRWM3piMUdCUm1oQzl4Z3hDS1BqQUZLNmhXTE5SbU5Jd3loczR2?=
 =?utf-8?B?aG5helBvVTZLcENqT1ovZnc3c3U4eU1TQjNSYmRYZDZUME1uUzZMQ2NSdmhV?=
 =?utf-8?B?MnFHR3hSdTNySEVUNXBCUW1RR1MyVEFJR2R0QjFUQ0wyQys5NkFKYU5nT2Qr?=
 =?utf-8?B?NytqRGVHYktXM0Z2QzlRYnZTcmVPc0JURVdjT2JSOXNzUEExZ0xMbWlPT1B0?=
 =?utf-8?B?WVpWMDh5ZUxIVm40TmhRaUVQMThJWjhSZE0yTTFMQVZmY05IVWFaTzZMUFpY?=
 =?utf-8?B?bWFvbkx4V0wrNzdPS0pjMGNtS0VOaFBRdkNJSk5pNnlCSUtxeGNyTlJJbjRX?=
 =?utf-8?B?T0lxYWFOR1B4WW5ORi9Jc1VraGd2K0grbi9SVGdTb3VGdHEwdDVXaDNKcjI0?=
 =?utf-8?B?c3hnTUNTeStuK2lrSTF2bStCNlVlUEJmbUNIMzFvNGJaOFlERFRBODRXSkYr?=
 =?utf-8?B?MTJCdi82SDhtTEtkMHVEeDVQTEpuMHpKY25YZGlnamtVYnkrQmFLUVovMmd1?=
 =?utf-8?B?T1VyUHZBWmM5NlJCck13WHpDZHFXRUJLUG9YR3RpUG1RekNpcXZQc2RJemQ4?=
 =?utf-8?B?bFJCbXowTHhqVWwrelVya0hYN24waFZ4Ny9mRVpwOXBpc21IWDg2MW1vaUt0?=
 =?utf-8?B?dGV2R2tTbnQxaWNWKzhzTFU0NEJhaEVZVCt6eXdjQ2FYYkIyNlcxMDdVNXlu?=
 =?utf-8?B?SC9Ra3p3b1EwMEFPWW1HanpKWTd4UUJKcjhzdXAwUFc2RVpNM3c2My9wa0Np?=
 =?utf-8?B?S3lhNVZaVzlJVXpaWmxNSzhIc1VjZ3VSTHhsNDRseXVwSmdiaS9McTdJQmNW?=
 =?utf-8?B?ZkdjMzZhb2xWSDlDVkJmS25JRWUxNWxQblBQN3ZmamMxSkozYmY1cVRpWXhZ?=
 =?utf-8?B?ZnVING1TRGwwaGtEZzJWY0U3ZExCTzlPRUxTc0JSRWpkaHlQd1NFMlh1QjRW?=
 =?utf-8?B?dUhmMnB4VDd3WWtiT094bjJpR2VWWjd1TnVQNGVIa0NEdGVJRFRmbXgrNUd3?=
 =?utf-8?B?T3Bzc1ZKdDFFdDBUV2JiMkdBM1ZZWXNjRXZJU09MS0NtcWhBaHMwemlUNkN3?=
 =?utf-8?B?THY0NWVJU1pmWmNUVEtKZ01GbDF2WDhCYXVueFBqZUd2V3BrRUYwOUxIY21r?=
 =?utf-8?B?SnlKSU5zM3lraXhQejlSTWlLTERHS1UyZDJUOU1VTHlNQ2ZuSWhvR00vMWtV?=
 =?utf-8?B?NkM1YS81YXlQQTBaQ2NTcVFubTRleSs2VTRxYUJTQTlHL1h2UkJPQ0pRV2ZS?=
 =?utf-8?B?RG5rd0lkdHgvOUo0ZjRNNU5CUjlXVkJuZkxMd05ZRnRDY2U1OWExUXlqUkxF?=
 =?utf-8?B?SmVFSWJXeHNwQzVvZlVKOVZ5QU9UbDVJcUU5VTdOQkRnRkNCaFdvWm1ITGpt?=
 =?utf-8?B?aWRFTS9lbE1MMGI5bEQydkZ3NUIzd2s5c1FudXFLR09Tc2MvSk15eGN0LzQ4?=
 =?utf-8?B?MXZ0SGJ3UytQMkZGTmU1c1pSWVNWbmlzaEx3bDVjNFQrSjVGZDJjSDl2Zjha?=
 =?utf-8?B?eUd3dThDZ3pURXI4T1ZPRUFPRDdxeGw2TUVYcHpWTEI1aUE1eUlCb2NNWU5K?=
 =?utf-8?B?WW1Za3NzUHNUTFV4OUtYUFBKZVpYNUVRaE1nQjVFZ1RzcTh1U0g4bVpveThw?=
 =?utf-8?B?bUVxN0NVTXY0ZkxlWVZ6OU1ZOXdRbEZjYkU4RlBYZmxqak9KS3hneG5URlRV?=
 =?utf-8?B?NGpucWxQbGtDaW82K1A2cWxBTjdIS3oxcFBsa0N3MlI0bEdEbk5vOGN1Yy9Z?=
 =?utf-8?B?dGVoZmx0TzZyNERZbjE0QXpSNmUxVGpZam53U3RwM0R2N05tMStOcWdNbTda?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlZmWHZjQmtpVXFwY0p4NnV4N1NJQk5Td0ZNSzE3bVBWME8zOXVPTnpxMlFz?=
 =?utf-8?B?aHBpODN0WkxBTzUyOGswSDlXM3hLZXNtOHhtQmNEYXJWSEZUQUROSm52VDI4?=
 =?utf-8?B?dFpBdzhaOXlGUG1sS2tGRVVoWTFNVENoRG9zdEtFekQrSWNXV1FCV0Y2OTlT?=
 =?utf-8?B?K0tiQmdBYm1PdnhxdXcra0luRHRBWmFwMU1QOTBDWTEzcWZ5OTZ3aDR1bGsw?=
 =?utf-8?B?OXVLQnh4QTRYeUhiMjNQM09lZG9uMW9yVE8ySzZ3amVVeHRYcHh2dUNLKzRo?=
 =?utf-8?B?U0QzUjRTbll6MERXWVZZcGV1dnF1NWMrUG1BVkpzNHN3czJMOXE3OG55VHFO?=
 =?utf-8?B?a2Z0eStaUm52ZW83Yng5bzErKys5eStYZENCVDRoNHdCVTRFVTdrV3hnc1VG?=
 =?utf-8?B?eWdJQ1ppYWFmTHBPZFlHZGkrT0drSVMyTVJiRHlzR2F1WGt6dk9iTlNNNkFL?=
 =?utf-8?B?ay9lY3lVN0NSZUpsMDRSYy81elRaMFh4RmVvZms5Y2IrUENDbnlKbkpIZ2ln?=
 =?utf-8?B?QU4xOENCS28wVTRMT05zZVM5N0tJMUFKbGp4UVpYY1NzWStrWUxMcHhNSEpJ?=
 =?utf-8?B?TXE2OWg0V3JzVmtFVCtDZzBFWHFqdUVubnFxQnhqR2dMKzRBNGJTdFdyRld5?=
 =?utf-8?B?V3FwSlRNWXRrMHBYMEdNNlQ5cFhYSFM4VkY4WHp1QTRPTGdaZUE5OU16VnVr?=
 =?utf-8?B?MzJHajRMby9DVU1GUnR6V21NVEhob0NYS204N2RjOWtldDBBOWZlcEVQYWRk?=
 =?utf-8?B?TmFIQmRhRkhqUWcrQkRpdTN3T0Q0ejFQSnRSbmxLeGpJVVFWU3RKa2lzaHRV?=
 =?utf-8?B?Lyt0SFo4bmVVK1ZCRlorUXVOc3BiMnpLVHFtSzZsSHJDZ1hBdnRsbjlONVFm?=
 =?utf-8?B?QzgxOUt4ZlE2U1dvc1lxTEgxdHZnaUJyQU5iVlZXd1FZV0RqL2hPMjlKZzlq?=
 =?utf-8?B?d1UyNlNxKzdPVFJoZ1JGRlBHZlYvbTY3R2FYOUUvd2srSHYyVEtmYmkwN2pq?=
 =?utf-8?B?cVk2Z3FPRmM2UlFxbjl3aC81bkVUeHJPdDJGek5QK3dOY0ZrT1J6SUdxcm90?=
 =?utf-8?B?ZUVRajNvaGl4WWZnWGJtQVZqVzRnZlZuNjFzZ2JRSUVYY3JCSFhwYnNHTmVB?=
 =?utf-8?B?Y0FGcHdmQ2Z5UmlBSHhBeTdmckdVZFFYR1ZVS1FwOW1WSXNEQ3BKZXZUaVFi?=
 =?utf-8?B?OTNiOUJZcXhEZjh3MHpHeWRIeGQ4WXFZT1hCZnBJWFZYaUJ3cVhtQVVVaDZs?=
 =?utf-8?B?ZTBneVZDZ1ZFRysvM3NJcElwQ0FnVlFlYllsb0twU0lSaWxmSzBaV0d6U0ZS?=
 =?utf-8?B?STVxelVEUG05L21ET0wraDIwaW5wUEFJWTBzK1VYa2FHNEg3U0ROYll2UFJ1?=
 =?utf-8?B?OFV6ZTRkR2VzTm5wT251TGtVUzdvMXpQSTdzdk52NkpkNUdVTSt5bkpQS1M5?=
 =?utf-8?B?UDBVcVAxK1pzQ1N6ejQ2Y2huTzdpamhJbFRMUERzQ282Mk1uSExkcnA1TnNV?=
 =?utf-8?B?YS95M1ZISUs1dzdmaTNQdi9FNXBaVEgvNktOa2piQzdSa3hKcGF5MGUwbnFn?=
 =?utf-8?B?SjRmQS8yN0pTR1Q1MExRZ3N0ZGk2aTh0ZGZiNDJpTldIKzVUc3ZGaXcvdkVX?=
 =?utf-8?B?WndZRFB1OG1CRU1CMUFIQXdoQkNseENxR0Rsc3N5SDFscjlUT3lVZ2FOVTcz?=
 =?utf-8?B?cTIxVjEzV09OS2NwZ0Z5R1cxVnh0OVRwbkVqVFlFTmdnUVdEamdKQmJkTE13?=
 =?utf-8?B?dVcxQ1dlcWVVMUErZFdoYUliSkZqTUg5ZmEwOGsxeGNuYzFjZHRLRUtvcWRQ?=
 =?utf-8?B?MWxKS2FxZVBHTGtPeVdBRGZsU0pKY1VndnVCcDZNei9OSktRNHF6NkIvMm1D?=
 =?utf-8?B?M00ycDIvdTFDK2hKQVU1NnpIQ1NwNXNvS1YxbytmYkg5WUE5VDNVZ2hkN0R0?=
 =?utf-8?B?UTRrUUdvdE92U0ZFZTF4MndmVXZDM2U1ZlJRL1R0Z0dNWlpzcEl3dnBCUnVZ?=
 =?utf-8?B?TGRJblNOV2N4MUVmS2h4SFY1ZXN6TXVya0tQZ0VpcHFXSVQzTjdpdEV3Zmlo?=
 =?utf-8?B?UllxRDMxRlp1U0N1YksrdlFJSjFabEFkQmkvcnI4dmJrMk5RRUpHSmlrT09H?=
 =?utf-8?B?cjVrTFB1VDQrOHBhcXo4bUhmSm5jN3pPQy9uTjFhOTVwV3pCQVJ2R092ajhI?=
 =?utf-8?B?dG1qT1BCSHcyK3VPUDNRVlIwUlU3WVp4T1ZBMld0VU5pT01ic29JMit4Qk85?=
 =?utf-8?B?NThXTXFBSENiaWh2R0hrdmY0ZFVZVXZ1T0JwanVEdnEya29QbmJ5TkxpVk4x?=
 =?utf-8?B?Ump3cUsyd01WU1NHdmdtZFVORE1MOTZyTVZKSE8vc1dNaHpmMnBBRlFCQ3ZU?=
 =?utf-8?Q?Q/MJJ3b0PWLDJ6iUdq3lIL2buMAwfD+HCS03R0kXReRdP?=
X-MS-Exchange-AntiSpam-MessageData-1: Eb6n2vDLc7nDgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 137277df-5dc2-4369-b193-08de6f89064d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:24.0940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fXGgZnwZbV/1tGBP2B5qR9VHB8jpXKs0ZcoA+1EkjdHuknTx7L2PyYR/Da1qOCc6vWM8o7zWK42dxppYxPe/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
Message-ID-Hash: NUCOK2NMMFTKU5C3NCWNC2DGQBE3ATML
X-Message-ID-Hash: NUCOK2NMMFTKU5C3NCWNC2DGQBE3ATML
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NUCOK2NMMFTKU5C3NCWNC2DGQBE3ATML/>
Archived-At: 
 <https://lore.freedesktop.org/20260219-cmdq-continuation-v2-3-2e8b7615536f@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the EMSGSIZE error code, which indicates that a message is too
long.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..10fcf1f0404d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");

-- 
2.53.0

