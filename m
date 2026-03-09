Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AAFFCA197
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:08:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6873510E5D5;
	Mon,  9 Mar 2026 22:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b49n6I99";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 50A3B44FDD;
	Mon,  9 Mar 2026 21:58:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773093483;
 b=HvSNx6pMYvvA5nSIdXX8IVrXyrlpStlud8rNhbJZpcJX5iLZYKxM/LJH16H2otZL1VlLw
 6NsV9nrSyZ1X8OUALBFlIDiLFpoJHB+JYm22FWY1P35oiTi0EMnmIXAhHh3YunmQcFOhl6x
 RiDfXrF6gi6IKUF0QdWzzP406f9si2OFJaYvxdLFhmaH9TYSdDiem9C7MOCs4Aw21iI+jCE
 R4EtrXIXx+glWliB30Lkddf+xAbSNTayCrLEeCaeVKuY5BUcSzaFiN31DHZqYcyJzYA72mh
 HQ/pLV3juL8Neatdf3a7YfG/JV/x0qbJh7tDE0ZOYIlf6gdMm09raj9d9xDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773093483; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KvIeqoAuT7F7uaBPvR+a0UipNRBB4mMS/aYHLPDsfGs=;
 b=QLQTU21rliSRJfnBscw7SPfd8014jX1QcvTeyFv9OXwfZ0+O1kACDIWafd4IUI5d+CGG5
 JmLZDRpoS6o8gVInXrH6uGaTHYhC54ECpqPGjc3v4IneeVjnrRs6KNd+4L5Ums8RmAauG1G
 8S5pqO8nBBDTfAMckAllX8797PLjdJI+reuxOlXoF8/d88aD+Q5XCl2hBh2SEBhx1xuVqO7
 6ofEpbOz2ZaXdJ42Jci/QaWnilFAPKmH9e7FDSmDZZVGyeG6OYHApyHvlSnhIzemSvJ+9ri
 IJv2IodcNhfA8eV4DmJ2m7N4WOzqdKPoM9KGswHlOLTuBCijsrure7NMwrCw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 116A1404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:58:01 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 93CBE10E5CE;
	Mon,  9 Mar 2026 22:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on8+KinE+KOi4Mpkwzbkk2TJlzOD2eEvI+nvNaeyRJKhbVikrU2SXMmBD5LFfvZlG05ydcrjMaifWmJwxj1swnsM6mGas9BCEF1F6tFww+nxhbeKW9aTqCv+eeczPZur0ul8agLUs7p6UOUIYaK8U35E3Auo1e20crVXXExzhV7kEu4KMV/TK3Jk6TCUAHttmnz8/BqfVxFNqSUfmzdGcsSlnhCtl5u+0J613lzjc/ndkqqUsh5KLsOqkL8iEPr2Jh9E6acRyaEcUuppSKqSQ7JnTOu4V/PDkGcLw5w5vhiIqHpFI20GE56TAZ1gR7bcA75IbWhE0p9oIS5HcaNlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvIeqoAuT7F7uaBPvR+a0UipNRBB4mMS/aYHLPDsfGs=;
 b=rzuZno5KLpP3WcRSuzRFnyxKPK6KswjOwf2P+3bnxxGEAp74JC5ffWOBgSlTyNDlYdQxMZMZTk9erwh7VZVKJz3G+HwoOaIjvb5157pI6rCpoSvsX9MN79VaIXEC2cH1xc5gxDXuE97XHZvaRjFTGt1rajEbtad6cNK+56V/u+ne/FnBep6Jzk8B6Zp5lmzWguY0wPbzwpYOiuBTfgk1x08io2Oj0C5wq5gfp+AsgdWcjurTKFQP+XliA3daocP5hoh83MMiCAWXuXSoetjZTUEe900MpWQ+jD6KnjwL1syEtRxi5Of8NvIhDI+5GZyAWaha0i7HOeu13Br6XoIh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvIeqoAuT7F7uaBPvR+a0UipNRBB4mMS/aYHLPDsfGs=;
 b=b49n6I99szGYE/l4i8K/qplnN50xiLvNGbh/usJe7BTSCu7frJfhZPa3Qt8eF8Osra7DYYJLuKk1jzS25iBS0LQxqVi88yC+VH1QIXoSqItt3011//QNmfsvQ5Yy+/3cqvcLc2bnRao0fWVPVLCelv+70P+V7FkhKmZHzY545xYqG9LhwmiRFSBZ74AlaiTfNasifXNRRTGmLPkku7yp73Jobzf1thhIJfxCQCh+GSo0/hbGWNqpO6k5R/Hns/F9zE6vY9sQY1iId0knkhZmJdcdJMaLK8A2F2W/YvHwPxVjIfewatvpEY2jpmc8Dou4rG1Syg+p7/Gm0VRCXoMshg==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 22:08:28 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 22:08:28 +0000
Message-ID: <4857a297-7db9-4555-bf76-71b288c6b172@nvidia.com>
Date: Mon, 9 Mar 2026 18:08:24 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 7/9] gpu: nova-core: gsp: add RM control command
 infrastructure
To: Eliot Courtney <ecourtney@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:208:32a::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b507ac5-ec71-4ffc-55ed-08de7e286433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	L2gQVj9xv2LJZxcrhjvBJHVXGR5p8g4liITb58UT4xIv0ZISc+0PY9GJfoZvy/TxzeG6nazseWnFDK599heqB/sv4OD5ZhCb4uR18YMyt2PO8Xp7wnL13yd5sz2aI604u2pJeoHZ3s0Weyq+oFwNEzrKCkMg2fr1Ygxf/iP6rSofFEMZxFniJ134u6VB9w86EVusEN3gE6aXCJaqoYIKbMQlAPndiPaRY1x6cmQa18jap/Al0/JRAXtXR4krekUXaO9+3ISKGYztFP8ArRIxJa/veAMCf5Jmo2puO+a9nHK0fnOzVEqvCBgSL0+ghc+QtxbEjI5J0veUBgL+lT+y9enKTpApBB49ApOmPtZIlB07gmHwhZzn7GP2cI2qIZAluVEAhmlaOInn/2+bRPFFi5+QwwLyjMBy6nfcghdEjuz7pt1qB2LABb28FgWZDmAYbtN8C85MbMifNpnAdZ8Ppnzf0JZA1Ckbcwiod7IcjPBAzJJzFlqOv9YyeXLQtMDYQiFi3Or47x7K/GhGaF2eK+/iy+w38n4s/P6lwNIOizexLzimwJjc2fR8hNB0PndnMixwvveFK4Hk2mOwT2i5Kj/kO9FPcEN6kt0WqDpxsMuL8uj9ckmjF5VIam0MregkBLE2J6uLBozMrwrm3U5DVARi7yMFPG6iyWQ58ay1w5CkXzEY/M4fJ3r0P2BSzVdfRMlcatOFWiK4W/hVhNESdW+rg1md9d6d1kkmpZqycXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U21aUDNXWDFKYlY3dllZR1RzcmpUMU92M0FzVkIrQ1BqVWkzMER6Sk5WR2JT?=
 =?utf-8?B?NjhZWktBWTRkTERua05NWVhXTjF2MjhheTFXL1htRzh3RmVEbnVhYlNGNnVW?=
 =?utf-8?B?SlEzNXVMdEZwSHB6Q0NwTlFmc0hYRHdvajBwNExrSGFZN0pyOUQweFNteXo0?=
 =?utf-8?B?LzNPUjZub0JHK3A4UFEyRmc2LzU0MHBOcm9VUjk0S2hKL0svYmVEYlVHM2x4?=
 =?utf-8?B?YlZ6bzA2OGR1aU1yQnBXcTloVlZpVUlLRzFneXFnY1NsYTBvRjZmZzVYT3NE?=
 =?utf-8?B?cEJDMkVTNUsvdXNERi9nU2RVYlpHYUZtTkFvK1FlckFuTnFBOXNMbGRzRDJr?=
 =?utf-8?B?WXFtMHhRblJKdFFwS29kaUVJUmpoL292YjcyazZxMzMvcXhaTkpQSEQxZ1NI?=
 =?utf-8?B?T3JkbEt1RHR1SmZ1WTl2WUgwaHhGdlpkTi9UelhQc3ZBcmprbTJzcVZLOWlw?=
 =?utf-8?B?Z1pMc0ExTWhRQmpvQUZSbFJwNVZ4KzkyT20yc3hoVTJUTGk1S2hidkNndGVM?=
 =?utf-8?B?WFRWMnF5MU9tOTVGNDNnWWJOMzBHblY1VlVDU0cybG1UTXo3aGlkRmhIaVd4?=
 =?utf-8?B?OGk2TnA4SDEyN2h0b3djTnBQUU5jdjVobHRQSDZUcEd3aDl5OUdabXAzYlBR?=
 =?utf-8?B?a21VOW5hcFZrd29mRVR5UzM1TEZnZ05lM0JOd1VTYTB2Y3Z3cVlnYzJqTDBF?=
 =?utf-8?B?OVN3WnVTUXVIOHlIanEzVjFGMzJTbHVrbHpQdTJaZjhIM3lGa0xCM3RnaGFF?=
 =?utf-8?B?MEx1NVdpdWUzVnpLenlUcVdDZFh3eFFnbFhPVlZYUXF0a0QxNFZRbmMxKzda?=
 =?utf-8?B?dXdldkdXM085UGpIUEpncE15RTlocTVkOUMvaVlrdkt5dDg1YmlLSDFWZWRu?=
 =?utf-8?B?QTFydUV4V3JiSE8wcTZJSjVKOTZyRFVoZitUYjdDMUFudTN1T2dKa04ra0w0?=
 =?utf-8?B?U1Fpb1Rwdk5EOUNySmZ1Mm9ETGpPU3pFTEEvK3FCVVBHR2pZYVB4bHFFT2hE?=
 =?utf-8?B?cGlyUjVtRkllNlJlTTJmdGo2ZVhzeCtQdjdScG5YSS9YWE42Zm8xQXBlZVk4?=
 =?utf-8?B?NGFrRldWVXo3VHNxRGJWVlcrUTg5K1d6dWJjdnM3ZG5ScUw2Njh2UGM0NWRY?=
 =?utf-8?B?NkdVdWFCR0JxRHE2VnNMNXcwUldjZHZrcVFiQWE5YXlnZFdYVHNiSG5JbVBM?=
 =?utf-8?B?ejdiaVQwRkxyb0dHU2FBSG0zcmNCWkJuVmpROU5UNHY3amt3SWI3STY5NWJw?=
 =?utf-8?B?ejdHMXhRSm52OUpTaGR3YlM3K3ZldGJiMXRkY2FZL1pDTXVNSzhGMEsyNVlw?=
 =?utf-8?B?QmtaOFhyVFRveVNieXRKWHFJdFU4dk5IVDM3L0N4U1VDcFNGbXBMTFlMZU5C?=
 =?utf-8?B?WERlQlZpaW9zTEhnVWlhdG1BOWczeW45QkxBWmtEUHE5MkdGWGdhWHlvMUxO?=
 =?utf-8?B?TnJ2S1h0dml0S0toeXlUWURpd3lFczArblFxRVNkOS8zeTk0RmpvVlBTR1Iz?=
 =?utf-8?B?S3RvNW0rblA2Vmk2TVFuM244NHIrWmFnUzlOL0hSaU93RmU3anM4NDA1bEdi?=
 =?utf-8?B?RXdRcUlWZXV6RmpYY2dvdytTR0JRTDZGNnJ1MVBIT01ZbEU3QnczMTdiVE1V?=
 =?utf-8?B?aTZqRytjcDFScE1tdjVub1l0WDJSalM0Uit4SGtnQWVCY0FFMlJYRTBrVHZ1?=
 =?utf-8?B?WXZGVjNVMGMwem1jV3lwbjVWRitUYk9QSFhlb09BUTd5YnRJczBFWDc2THJU?=
 =?utf-8?B?dnBXU2xud1NndXE2Q2ZqR3hVeTlxbi9tRTk5VVBBcVZ1T2hEVmMrVUZXdVRY?=
 =?utf-8?B?bkpvM2lHNFJyZGJ4SHFqdTVkUmxLZEcvT1BST3pvM3FFOXVSMVpHN0kwYzNZ?=
 =?utf-8?B?QVlaVmFVdkRqVStwbTdJMkhhaVJPcm5nK3N3RlI1aGhPMFFzazd1TTBsaVp1?=
 =?utf-8?B?NXlzTTJTM0xpWXNCYmJJWFRad0VGWDNaVnRhT1Y1VzNOcXp1YmY1SFQzSlRn?=
 =?utf-8?B?R01aeFNQN3RNQjZrcHkrQXlQRitYZVNwNm96and5REg2LzJRVG91TDFrVnBP?=
 =?utf-8?B?cGhaZUNESlhUOUo2SnJFUmY3RUNIQi8wWkpHVlpFNGJyT2Z1WUdYTVR2UjUy?=
 =?utf-8?B?VC9EbjYyTWwvYXRTclRLbUs5UFQyM1VlMXhrckwwQUxuRXRpekduNmc0djQx?=
 =?utf-8?B?cVkzRGdxSG9KSmNkQ2RHM0s3bEVKTS95c1drZm80N1J6cURsaWpQUVdTSVg5?=
 =?utf-8?B?MFo3RHpMUFRabmdvejNaY3ZKYk1sK1pqRHdVN3I2cjlWMWlBSjV2VU5Kbytp?=
 =?utf-8?B?eDNJR2dRcmRZMTV0RFh6eEVGek5JSDBSVlhFWkVVOFRLS3NXV1JuQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b507ac5-ec71-4ffc-55ed-08de7e286433
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:08:27.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XUZaR7n2IJwrTRNJJTLi624sjbQR57BOdvAdZkVukmSXDs62OMODuSnTMpwq++dRQ+LSi5WEzmUvM6ufbhco+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
Message-ID-Hash: 2DMLZJB7LXIDLLSUFQSZRGIXQLEQHYSX
X-Message-ID-Hash: 2DMLZJB7LXIDLLSUFQSZRGIXQLEQHYSX
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2DMLZJB7LXIDLLSUFQSZRGIXQLEQHYSX/>
Archived-At: 
 <https://lore.freedesktop.org/4857a297-7db9-4555-bf76-71b288c6b172@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 27 Feb 2026, Eliot Courtney wrote:

> +fn send_rm_control(
> +    cmdq: &Cmdq,
> +    bar: &Bar0,
> +    h_client: u32,
> +    h_object: u32,
> +    cmd: RmControlMsgFunction,
> +    params: &[u8],
> +) -> Result<KVVec<u8>> {
> +    let reply = cmdq.send_sync_command(bar, RmControl::new(h_client, h_object, cmd, params))?;

This series uses `send_sync_command`, but the cmdq locking series v3 [1]
renamed it to `send_command`? This series will need to be rebased and reposted.

[1]: https://lore.kernel.org/all/20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com/

thanks,

--
Joel Fernandes

