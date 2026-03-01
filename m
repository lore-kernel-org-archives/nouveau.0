Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F0FD006A
	for <nouveau@archiver.kernel.org>; Sun,  1 Mar 2026 14:04:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9B10E3FB;
	Sun,  1 Mar 2026 14:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DYHGDwMs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2BF9544D19;
	Sun,  1 Mar 2026 13:54:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772373269;
 b=065jF64EEsqQP9VLJGRUZ6TUvnNqWqkpHV56fvAwrHpLaCJG9B34hrQ//y2gkeWMKYC63
 A8Fjz+h16DRapIzPMYkTh9Rusw5knBDk+0oGi90YMAhMnrMH85lf10z4opnADcgXoUK6cD/
 KlutB4WWupdPCs3RF3Xm4d++4S6QYbTJQ84AJ0biwUbYUdW8r+nFpp/ZSlKHdTT/qj5R4yc
 7TkWV8Alev4RoN4/xamrs+rbA/cZWTVWDb9g6LavpKmb8Hp7OcxRQ5aeCFzIdBx/2XLIRi5
 76f+3xrNHNPrcxTqC3fcTuv3yO7YnO5ZoC7ECEEdN5xk7eW3GsrJvUpzSAEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772373269; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n6qRJevJnyZ0nVdHsqUErwx2Tah8MwUipzOcOQHQFmY=;
 b=SDbQgjfCB+r7F529ghT1KEVkOPvTuNfFVMg5L2cLQUd9ajE/+Bli03lp+BXYYzubB5/hs
 Fn8DmJajdUKfdYb6omocaq0pCQ0dxRoRbnAQqTv2Yu2N4q8XPABQusmjReSt5LD8jzR0ZQq
 eWCD9uebp5Xp7VDA/GFOCnHFokvaR4h13GF8pVvpWLBTUWMjFFXz05bcb4CSHge48zakezF
 0AUl7Hk3Fieqin9St+KuDuH5lQoFe+0psT+T/Wt4Hb473XYt9jTiAPY1wmwwoydzfeFlqJ6
 LhiVfhwAA1RDbUJK/9vkifgyvGk2z0P/8EF4KUhrExK58UykAcObj5mcCSRw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 95A1244D01
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 13:54:26 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010008.outbound.protection.outlook.com
 [40.93.198.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBC3310E3FB;
	Sun,  1 Mar 2026 14:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHfe/PUNebyx+ZeCSG7sx47i0g+AguXQ8tnSPS5fLcURpDvXp85jWiZ739uFyr9MUqaALgTsHz72bN5ah9IO3VOnnkO+mq972C0brhkEcSvWgznPPNSTItlGq3ur1Tfn9f+KNypcgijpAi0+nY4IlTFA+NJ1CJAGAxV3XCPDsy4Ij6OBYTErnYF+kDmfS59dedcoBvavlNGPkFORhOoEs296LGcVPofLJvEuqmIqq6VI8+kbnGeCeABFXn0j8yBfX3msUnih+pnoyTCL9TsFQan7P7nvqYhIFZwQOA4uKqQsX8HtAQya7eOD6R8ltcJUQe6405Nr3K7DSIIIe7Hwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6qRJevJnyZ0nVdHsqUErwx2Tah8MwUipzOcOQHQFmY=;
 b=i3VOvXDSqD99rKPYJtCg/YhJVu0QZnxosBF+5usFT0xonAKzR4xlcVam5u/EWVpaBMjxU4VQqNaaRszsxLVYG7bQzIm1AQr/M/F0uK5fV43a6s84OU0YoPSS+OaWbX47dZVRRWvkMuCf0sz8dF3MWZCkWGduvIa5T9GrpYudFvuF6JHlkkS8Yn01L0xZBISILTBImQiK3Sw/ndBnrAGnlAK/tJS4QlzTNawwAOrlQQmxRhQGKaUtuMetgSRtGGuZZzT13bWP1UGpYs8K2WaKZ0a5VNOFGkSjgGgR0ipIXxx1a1l1VQ2MBB9qA4VWDVYaFQR4VNa9iDUmu4BQ631btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6qRJevJnyZ0nVdHsqUErwx2Tah8MwUipzOcOQHQFmY=;
 b=DYHGDwMsWxhMLNdJKJAQ+zZ0/5T0+z9HTzLwpo4l4xxScDf5MeK7FsFp+ulpwZZ4kA+8umfjYZTQa6V/b9KP40XJ1qF3TaqLFDW0iCz/opbIURsTFxzv7FI1YUVlVSHQSBT+CSsaSzRpCiYBeX9JetjTQ+mpMjxigSJonGA+ZaXo4+nZfTL66gj4VFEPozwHX70ibcChSY5Ds/ZhHdbrIF6ztxIgeoZ4A3aAeNe1CEif2Ew/iez5M+cBspQDygXchlkB2iOtzIzdVVgYwTn/m75JC2sBMG6bnx+IKY5CygZqBmr+mxskSTpOK9qnD/mO3fwvuxnQOxQWMVrbNS66AA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:53 +0900
Subject: [PATCH v10 10/10] gpu: nova-core: add gen_bootloader firmware to
 ModInfoBuilder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-10-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: f06ccc66-3bca-4402-063c-08de779b791b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	UuEX8btFhJovvc2ZEJWjGlxXNFGTG5K/SUkLUEcuMyfRx2BBHl8Hi66V6A1Mrsog8j0lq0TmUhrCs1DqlLAIbrL69MnKRh9o+qlHRQ3ZBREglAdApVA0kWQsh6Gm9y6BhMXtO61V0t7jAICAlK/Q5xFj6h/zL2cDs5PIfHnGWJ5wvmrs9vTXWXtn+lOmB+nlKwx0hFYZyDueuGEXLzQHAnqXC40jnc8oa0mOyB5+e8huDdqfvSxzL5Nn+Hj7fG2pKL3UqOd4cxv1g84E8VqHYwQ5cEm6mifPapyXxSD1AGqW76DIkjAXIuwjPa+6ToJdq2o9Fo1KW5YCB9Bb+CTgOeu0V3Eq2iZO3jxGQlDgOpFx+PHjGOVRrUAYKI4srFnT7vGbi/pntOk14EbRm2G1V7jWaxxJfLy79occIpYTVf3I3VS6S/N0kR0Ngvkcm6ayKl4ZwgPkduEVMU7WHeSpDZjFq4sUmTRFCcaid/0nrn3M2a5d5aZzAg6yAlRGGeDoQ3p25x4eoQ+QePL0AHbW6OnjYHBCKqPb8YGOGwl6KTMzfu+xcS6OS6Ui0N78MkX+9cZCDeWPvc2/Ze0v4kfYUNpgy6TTIgBeajUC4+y/iAhucdYBY+relC4JRKiyiH3PYA13+fxWrQgl89FzQn8+5NEwcDO921+dedoMfRjVUdNxZKQuy5jL0uSOLCgNOPgSFnZp1+wgpHaGjuPbeY+RhV4fJ7+HpErFqg2iDDGYEr8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlIwbUM3R2JqTnZEOTZwNmZWNzlSLzI0TEhLSjQ1WnMrQm41bmZMNjIzNzFW?=
 =?utf-8?B?U08yeWM2ZEx5NmdtODRLZzE4dElrVUhOeDFYMk1oWFBSNDg0MDFzQ0xVS3VQ?=
 =?utf-8?B?THMxcGlacDVHTW5DdGR4djRxWDl6NEJna1BQLzZuZURLZ0UwZStEVGR3WXVw?=
 =?utf-8?B?eC83TFpDelZod2FLSUtEb21Mc3BJNWlVaUtmbFdWUUNwSHgvcUsrNXF5NlJq?=
 =?utf-8?B?bVRwbjh2djQvSjlsNCszZWJRV1BQemROTEtHZ0szMzlMMEI2UXhickpqYnNk?=
 =?utf-8?B?YjBBbUtXbGFSU2lqVXdJSWIzb255TE93YmJRQnIzRHdGeXRZRCtCdlRjbFFV?=
 =?utf-8?B?dFlOM09hbTF5U1VQOEx0UUhjQnF4L21wZnRSRFNDT3NmT2JmSWJ5aWQxN1h5?=
 =?utf-8?B?QmJZSUowNTM0blVXam9BQWR3UlduTFFsaUFQbkgvUkMrdW81dkZkZWFnZ2Jp?=
 =?utf-8?B?WWJDUjEyVnBteGI5OGF5K2gvNHBsRFRoeEpXTlI0ZG5XRGxiUkhtUWZmQjhY?=
 =?utf-8?B?Y2lOV01wSzlYNmhaM1lJanBTdTQ3cSs1S0t1NXZVZE1ya21KMnJvMFUyUk9K?=
 =?utf-8?B?b1B2UGJhbUxNbUg4V2FucXRnQUxtdHRnSEUrY09vdGdYSkhDVlNxVHRDZzJT?=
 =?utf-8?B?WmM3N3EzWDJIY1JsUyszWU1PTThvcEdOUkVpeFhlQWZTWTUzOHlIM2Zhd09q?=
 =?utf-8?B?a2E0blhYTWhyY1haWko1NFdFdjljR3NVSHR1N1pDSVE5NC9FaXpIdDdLRHRx?=
 =?utf-8?B?blBqUjFoZExSZmdoUThsT2MyTzZqL3hzMSthUGs5VjdTQ3JvTFJkNEtoTkV4?=
 =?utf-8?B?NEFLS0NHQ3JaNWUwMk5RTXBXM0FMMVNFc3FRR0tJbHJ5dGRscWtDRmpwaVNM?=
 =?utf-8?B?alpGMjFlbVBBeHZ5ZkZOL1JkUHJmeGhDZ0RyWWxTSGx5Wmk1T00rSy9vUXhM?=
 =?utf-8?B?N2tsVGR0aFI4czBLQnZBOERQMkxjb2Z2bjhPdDFQaGFuTTBrOEhsQ2J2Smk4?=
 =?utf-8?B?QXVXczQ3UG5rSlZFSVpNNEdMUTFCa3cxd1h3QS9yN0svQ0RCNFFVUHlTWTFY?=
 =?utf-8?B?d0RON3lxTmFyYkZmMkQ3eE9uWFNzM1QzaUdaMnBQU2RwRkR2K2dORGo4WFZQ?=
 =?utf-8?B?VkQ5WW56Q3dvL3lKSjd6dUhQalRzRCtzOFh0ZnprZElsWFNyYXpwSE5yT2pQ?=
 =?utf-8?B?NFlpRzRXTmdNaFc5VzFMMUdiWUZrbW1SNHBlVUtjWVk3cUMyOUIwTFp0TUlC?=
 =?utf-8?B?aytsclFLVy83VzdSVE5oUzVXZGFBai9HWTV1dDNwazM3THV6OUNZYjR5dU5U?=
 =?utf-8?B?Mm1YSzFzZ0tzY3RDQWlmc2F0WE1PYlltRmRNaVZUM1lxTXVZbU02YjVrQnVj?=
 =?utf-8?B?anBmK1BZbUhlMjJUenNpVmpsTGp6ZHhhZjRLeUxOcDJXcGM0cVphSW1mYkdS?=
 =?utf-8?B?eURoTzFybkcyc2RLaEg4a0E2c1FOWWxNVEp5UHIyOEN6cGtxa0hOQzFhY1RK?=
 =?utf-8?B?cEdqa2RwM0RlZ3JSRXViUXJidVpEQWxIbHROZGNWRjlkWVA5OHk5MGJUdk5i?=
 =?utf-8?B?bllqUW96aFJRN3FVZnFZdUN6NDRITzMxL2Q2QVR5OEYvd3pVUk5ldXJobjR2?=
 =?utf-8?B?Rkh6V0pkS2FzZUNrNHRMN1Q3MFpsb1NQRTBydmYvNjNTL3IzZFM3WHlUQmwv?=
 =?utf-8?B?dlZGTzhGK3UwRDdyUFZwVkxBYi9yQ3c4citFTUpCN2padlBOZEpxT0lwMDUw?=
 =?utf-8?B?czRVYjFWWG5XbjZYVzBadzZYek1ndW1mMmVkWC9jR3k1L1JPblhCS0VHeFVU?=
 =?utf-8?B?amhBV25NWU11S3hUc3MxaC85cVBEYkt0MEVreW5yRE9lZTJ2SWcyOVAraEIw?=
 =?utf-8?B?MVRyR2NKUDdka0xLSFRIMDNyS1crUnRSWHRZTUJySTBPZlJ4RllyanYweFo2?=
 =?utf-8?B?ekVQMDdKTHpkVDd4ajRoYWptdG42RVV1dm1NQXhjeVlxNXBoYXlKZHdCWUNE?=
 =?utf-8?B?UXNRd1ZoV0ZxcXo3ZWQ5ZkJ6dWwvWnFEbVFTUUJIU0pHVWZCMy81czhVWjZh?=
 =?utf-8?B?WDVGKzBITlNHY210ckVkcVY1dGYrck5TMzhMdUdKZDNZOGx3N0N6bUpOTG1o?=
 =?utf-8?B?YmdWQzBOT3hqRUtRc1FwQUtxRUNaYXVicUJxYXUzS0dydWpyMjJwdEI0Qi9K?=
 =?utf-8?B?akc0ZGNBRWovd2lic1NiRXhJVVptaU9XMkhYLzFWRG5EOWZMcS9CUUNLbXpT?=
 =?utf-8?B?bmtWRjdXUUYyR0x4TC9nc1BXK1hSZzNFSFRNeEpXUEJTaW9hdnlyWWFKRTN6?=
 =?utf-8?B?Zkw4VUZrUE94RXc5aWJDbmJsd3k4aWdIZkVLYklVVkFROWtvVzBKaDk3MjZi?=
 =?utf-8?Q?IimBwLo4v75S3A6zn7Qqh5GPAbTkHIzxmuEUHLZr9Q3ZF?=
X-MS-Exchange-AntiSpam-MessageData-1: y9g2xlPO2nMqXg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f06ccc66-3bca-4402-063c-08de779b791b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:37.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jGOoe68OhlnfOG4iSIbSqSbEegnFsB9bpE5NtsUkFJvXK/tzd/Tzo/tXGmf02s97Fuwz8uQBGPpg8kWrvC7ZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
Message-ID-Hash: IGFLWR2DZROODKCIW3CLGGSTWXEKPLDR
X-Message-ID-Hash: IGFLWR2DZROODKCIW3CLGGSTWXEKPLDR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IGFLWR2DZROODKCIW3CLGGSTWXEKPLDR/>
Archived-At: 
 <https://lore.freedesktop.org/20260301-turing_prep-v10-10-dde5ee437c60@nvidia.com/>
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

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 21 +++++++++++++++------
 drivers/gpu/nova-core/gpu.rs      |  7 +++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6d47a6364c79..6d97fecefa74 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -415,11 +415,20 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
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
@@ -429,7 +438,7 @@ pub(crate) const fn create(
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

