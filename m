Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2362F513F3
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 04:53:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55010E387;
	Fri,  6 Mar 2026 04:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZCLi57mt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D08B644F08;
	Fri,  6 Mar 2026 04:43:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772772180;
 b=KeC+9rbl83xwiKZH0JdCfMU0L8PyzuXADa3Bt9y58nzV7I82mt+CU89NuAyLBNL9FulT7
 GwLelAvaoUjklEAFmPwAH7jbOGOMTBKRd1PYKx+3eE454cE4ctwAUs6p7YraFKZlgkJuNeE
 KHjq7rnCosdkay7K1JIUGqRFnvq9rwcCf4QuAaj98TjEu+tPaYqwpV7fCGMurcg9B5ItgDK
 WtfyAlcazJICqiceYlnm1ZGDmlP3EORPJQbu1ts0EOikzh6254Yq9VGXAc9rgzIqO1MMJba
 LTAoeZh4mHJoLxOpnTVakkHpcGpHHiG9/EnVfo93ShSb3bprbvulCmlYec8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772772180; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rCk6KrRuBf8BAW6Z970XGx4N7F8iQRq9uoTO/PZ3RTE=;
 b=mcjlAe5PrsmR/X2ThAkPXFmdqpdcWXuZHOZyoNyCwNTCmE4HE5hhDNyHTN/hET6qBPnCU
 WxgLhmsYFriy96340ncLPXbn+MugMuS6qDuUaB0PbKS9138XBEymbpj2dD4Zd334ImNfStW
 QfH1Awtf1jl8fYwU9g+ZazaFXiowntFP8tHR6CgkGgmHz+nZip3tnQccRfYi9SP66sSwMnQ
 bcxRR3K4HA/rNrCT+zUWbi/waQOKiksBF0Be+OPqN3PIrsFx3Wod9qTYWkt46JlmuA3PPu9
 hKModMP621ZOXB5tLx8Yun7JRnRU4woCNc1sox05332NaQCn5ILLjjEm05og==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F75440760
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 04:42:58 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2910E36A;
	Fri,  6 Mar 2026 04:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8i25r40H3ABSH1Ax21CKmsAkgG5Oz5k7D86OHfQQhIjA0DGunb9fRJ2LqBtEJyb4OlA45oBD6sWR3HNuhCXKTFvWArt3WM+9Ks71qinXZHKr+8581nadvOMsHKiZWCEyWWvXPKU+GW4RWdnASXK+sDFLIqPjl9JYzxd8F7qOENKr39mKXyEG2YT0szFsOcLwMiOSy4JlunirD//4fOnBD9VdOvx4cfpzJLR3Xxf0XiSbyqrtp+EfRKDOtuhtpsqbF47xFmgaBeHFhmr1xGzdbiQmRMTGJPuGYzg0NdF6bKkfjj1avQfFMw1ewg+5gEWtH9jPN68/nGzWd0qABelNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCk6KrRuBf8BAW6Z970XGx4N7F8iQRq9uoTO/PZ3RTE=;
 b=b/bP36F3JDirkYPfiI0/fHdwF1dRrDWA4oJ/E+iWn8wTFbn+HA8JRnmCDFbpeb/vCGhEC73xEtA9HQObv2TreLk5hDySsx0TXiCS5AMEL/CX2Qk3zb1r5TR/7fpxYD+tq+DwBwFkFAFmCh+gTUt7xoKCsN/6hhpb/kJFWmc2vemgJw1MBn6MuyTismNeHuVA7gdio0m5/4vjuRCB6phome/pSvrxdoplypK0zaDh+3E3ifjiY+UIOTMTLsv6NlEbP8XSBRmvbifJYrFsHRmiiKdP8x02OetpMuyGaPlkfuESfMORu59Jhn7UbymTw6bjpNrISQgb42MGRn2IGNY8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCk6KrRuBf8BAW6Z970XGx4N7F8iQRq9uoTO/PZ3RTE=;
 b=ZCLi57mtG9nV43bxW4W1q5+mHzaa/MRPHHshrD/V1dIsiz1kYiJyeoj/rgjqN23LjwbD2mBM5/rbt7saR1mzxCZrEesr1qZr+CcXTlhKkXxdsKx39VcP2hMu1rQJC1oLlWdZpJxL/Et1pZ0naSzFDTo/nxRNvHyEUtvFHKrzD+8x8qhkM56Eb18X5uIBnVggQ2PnV5nax2TTtDFKZIhHXas580m63weSDeYJLOBG7v8tpwSUzC4UND41nuW5vU4b9uBbANvJpmkAOvrO4M2j9d8XKxU0YyOT3cEFCWlMtIGPylY86ooYi8HYod8WFEMqVpiRWDbLjr/UYX8eHTSRAg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:45 +0900
Subject: [PATCH v11 08/12] gpu: nova-core: firmware: add comments to
 justify v3 header values
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-8-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:1::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 1570d9da-ac9a-488b-f14c-08de7b3c48e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	J/+AoWbgPwZtFTQDDPyFN5YV4/6q56cXR8uYEwYqYIvG9FeKm8qmsENeCNbqRrjLNUxDDCfG7msNrDItnrJmbzWWYiyJqyOsHAxPpklDPgYYsw+kjOY4qQ3eD/ZRD+4uwek0Kqd9aUJprakjAzHIOJlVlIILkLwyvWnbuCMhNNuhYdPIxXuf1ODHLfIKRuWGoxkvxU72ZFT0F0Snko74bwQ20mXfU+L93ccF2WTSiu/u6f/4u+zyyGseJg7w2ocKEvvebiYddjYc43qO52qztYSIhpyNk6IF3Jen+bfRqz/L/prjSAj/XYwJmMIm3oKBDhtxSQ9PbJFQPZRwnV7VsJYpTHyrW1n0p6OifMNOJlJBywTZxlAceTV8Ao5oQSPNBa9ays/gj312YB6aml4m9WzaOuifCHFU/IshG5yADqQixf9mS5Wg0iBpyj2Uhez8REfs7kbWw4RUTc0MBWuC0D9pp7VUERPTaCA1VeEnUmXJyFmPtIKDflrbEvObngDVto3lrEUkTVQ/wN1eVsmm0jzb6AH3JInROTLs7II8oT8paTvuvOYidGXfMo3t5K1Mo9JQYjN4uc+qFChgo12CE7cUqUyQMoIO30Pl7tEzN1YEQ0q4UuJyRv4EOB/8SjI8yW6lrhIapQXhQOBlvy8Qsrmt1EJNVK0UA3TN1RmYHUE5fthA9Z4AOv4MZenVoRJpp4eN2+HoP4kp9chjZeEDz/Ee4JtFOVN9+JwI8sLJgZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjU5WGhtSHhyQWY2YjZsc2xPTUllY0J6bjkvTkh6cjBkSXBJV0VKanlWcFFQ?=
 =?utf-8?B?d1oxeFFZeE1wRkl1d1FuSGJ0L21oeUxCU3prL1Jic2hscDVFcXY4ZDNqa1dz?=
 =?utf-8?B?LzdXNkw3VnpId29ydnVXalppUjBESzRYYmxTRDBGWWxzL0R6eStObGhOM3FH?=
 =?utf-8?B?cEdNZ1k2b0tyWWVreU5CWDF0bURHTEZUVDR5ZzhvNk1RZVR4YzlyaGFRWnAy?=
 =?utf-8?B?Rzlsemljdk5QdFYxcUpwdnI1TE0ySzBvUHRuNDV5b1loRWozRkpWOFZOZTU5?=
 =?utf-8?B?MGxPMkVMR1VBYW0rcU1rQ0UxclJLOU8yOFlJWU9DYUtTQ0pRekNUdnZTTURV?=
 =?utf-8?B?R1FIaEdoem9SKzBLR2h5M3kvYjh3clBhcFdYemhjVFk4cDNxVFdsMnR2MXBI?=
 =?utf-8?B?eFc5T2xNeVRKVFVma2pZOWdjYmVvOW1DMFM2UGVBK2ptOEV0UlV3NTdQYTQ2?=
 =?utf-8?B?V09ua3lXeUQzamczVWZhRUZWRU8zdEhvdzRzWDRJYU1MRDZERlROSzhDU3ha?=
 =?utf-8?B?U0YvZnlLY245T0xvb0dNR215SGZQUlpubzV0ZkFaQXhzMysrUmlJTFdvRDdu?=
 =?utf-8?B?ZTZZWmt2N1dHWDhLcmIyYWVBa1M5THBlUjJnRU0vbDVHTjdHb29mOGhwODBh?=
 =?utf-8?B?cVUwRlFHVkZGdTlVZmh5MU1abXN1SzNESG02dVZ4Zi9XZzlaby9GNERnZmVR?=
 =?utf-8?B?Q3BvYlhpY0xMTG0ybEFYWUE0N2t3YkovakNnNGdYMTlnR1U3UEpETFQ4aFhK?=
 =?utf-8?B?ZGhMRS9aUmxmU0J6Z2haWlBSNWw0dy9FQnprNEplR2lKQ0lsb0RaZW5ZbGpT?=
 =?utf-8?B?RHZNOUR2Y3Q5MGFHSnoydERTcUNXbFZoZW5ralFCdkxZVGVjTS9qdU1MdkFV?=
 =?utf-8?B?dlY3UjltZUVwWHJQS2hGSlRyOTBlQ0ZFTzVhVFlRaEF4SzJRbERGcytTSU5C?=
 =?utf-8?B?K2l0TldPUllZUjZGM2xqVUhXTjNwY0hjZWpOSWpFczNXQktJWTM5M0xUVGNH?=
 =?utf-8?B?TytGN0wwSThXRWdselZzbG81bTdGUEVMaE0yZTRvSUt2Tm9WNlFQZG9TbG9B?=
 =?utf-8?B?ZnduNjRvSjh0SCtaTFZjVVpGOHA1WEZkcG9JTUZ3K0d4aXZWV3cwaVgrbWhG?=
 =?utf-8?B?b2dZUEcxbGZPZ2JMVXQxVlhnTEx6Y2oyQUhJM21QRjk5R2cvTEJuWUZLcThB?=
 =?utf-8?B?TldycjJ0VHR3UFVBUmtmNHZibmVmYXBCZU5qdDR2ZWpGL0xiMmJOMTI3aHdL?=
 =?utf-8?B?TnNoQy9kMTdITUhzZVBzdGJQWms2SndHOFB3R1owWFZvV2VUM2E5SFVjN1VI?=
 =?utf-8?B?NWF4Y3F4ZUphV1Y2cmRZZmlhK0RuczNHY2kxWEVqK1owOGorLzhiM3B0d1JP?=
 =?utf-8?B?ekQ3M21WYUhDaE51SUhGaTdtREVKYlRUai9pK092VndDN3JiWGFqeVlTN3pj?=
 =?utf-8?B?Yjd2RnhoTUNWdERGbEtTMmJaYWx2dGJRYXVBaUllSXRZU0tucis4MGtSQkkr?=
 =?utf-8?B?U3JSdUs0UGxqUWNHK0xzdTkreGhhL2haby94Ym41cjlVNGFIRFNYNndNZmYy?=
 =?utf-8?B?Rm45M21TZm95bWRRcnpSSkhvNE5GcXlTaGZsSkFkOGFuME1DZWJ6RHYxYzBV?=
 =?utf-8?B?VmpiUkNQK05YWk9PZlg4elhpTGZkQ2VkdmErZE1zTThmZ3VDYnJYNktFZTRy?=
 =?utf-8?B?em5mVW1FaDhMaXpzeVpaUXlhRHR5dkJBd0svbzFJS1NZZ1I1NFUvNmlNcVZ0?=
 =?utf-8?B?M1paaDRjVHhOcUJyQTdoNUVLNlNzV1ZoVHMzUWpVMkpNZ0xVV0NZRFluOVBU?=
 =?utf-8?B?cGZReWxIWUpoZ3hqS091ZlVrT3JyeWdESTdrczNBc0N2MmZyVDcwWjJzWnUx?=
 =?utf-8?B?RkVZeGg2WllnWG9IZkoycENuaHJ2cVFNVHVaRjhvZXVhT2dZbnVnOGtlN0NY?=
 =?utf-8?B?d2RYcFFkYnlqWDRQbGxBaXd1K2JzNXZoSWZzSG5RRXZCZTBRWUpQUTZuUW9C?=
 =?utf-8?B?NnVXZnhQOEpBSnFJV2I5dEpxUlR3NC9SSktQc1Ayc25BYi9FRTBmV3pFanMy?=
 =?utf-8?B?c0J0MkYycDhzQVhoU2RWclMwTW5oekJOYUVqWUtZMEZVVit0WFNkeXVWc1BF?=
 =?utf-8?B?NkE0YVRicy9nZFkrUVIzRmpyV1ExRmJXWnlPbk9RQkVEOFc2UzNhT21JNDgr?=
 =?utf-8?B?UTVJNkdMeERvRVdYcDh1MU1KOWF2VGhLa3hCYXZ0Wm1YTnFsR2dKaGV4V0Mw?=
 =?utf-8?B?VXp1L3NvVjUzbTMwY0ZUbThOZEI4V0xWdUd5RENSVHdvVGNJSFlkcGY2VlFC?=
 =?utf-8?B?V3JxY2FsM2pYam1WL2RCZm9hVXRodnNadkRndnNPTllHek9IWkRuT0dLZVFP?=
 =?utf-8?Q?rlBm4Qh4s2P+YI0lf0b/RY7BLcIJcr3yPccqKdgVLKBRc?=
X-MS-Exchange-AntiSpam-MessageData-1: J3FbtQ9mywZgjA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1570d9da-ac9a-488b-f14c-08de7b3c48e9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:18.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B6VNl/LmJPmWelHhk+lxZZtJ2VJUla302e2PTEarpx/Mhd4z6DsX8IunaZJqq7Q1Ck/AcE3NgtJieyCXMyOpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
Message-ID-Hash: ZEAYB4YZPLTAEZAFONUBFKBQ52LWXXIO
X-Message-ID-Hash: ZEAYB4YZPLTAEZAFONUBFKBQ52LWXXIO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZEAYB4YZPLTAEZAFONUBFKBQ52LWXXIO/>
Archived-At: 
 <https://lore.freedesktop.org/20260306-turing_prep-v11-8-8f0042c5d026@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

There is no member in `FalconUCodeDescV3` to describe the start offsets
of the IMEM and DMEM section in the firmware object. Add comments to
justify how they are computed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 677e1dac6d9f..c2b24906fb7e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -260,6 +260,7 @@ fn signature_versions(&self) -> u16 {
 
     fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
         FalconDmaLoadTarget {
+            // IMEM segment always starts at offset 0.
             src_start: 0,
             dst_start: self.imem_phys_base,
             len: self.imem_load_size,
@@ -273,6 +274,7 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
 
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         FalconDmaLoadTarget {
+            // DMEM segment starts right after the IMEM one.
             src_start: self.imem_load_size,
             dst_start: self.dmem_phys_base,
             len: self.dmem_load_size,

-- 
2.53.0

