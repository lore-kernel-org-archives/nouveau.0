Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F202D58B0E
	for <nouveau@archiver.kernel.org>; Sun, 15 Mar 2026 05:11:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75110E4B8;
	Sun, 15 Mar 2026 05:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZER/rclB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F736450E3;
	Sun, 15 Mar 2026 05:00:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773550838;
 b=GH2kYn+y7tdnFPIl8X5sn2z7gt1y9l2URoTZ3UfF+JroeTm/+gcQFaMRksxIFMwYj2DZX
 w/XqpIzhZfipHzXQn62/ujbxFFHIOmNFCFlup73eTJebJrMOas7yz7iiqcDeVf4JoBQ1AP3
 IDRsivAYrr3wayN6yhEVeOMpZTilLUWTmwljzEdVygf5KTwQg3cyu5Od0ZpbQEV2rzavRrR
 PHz3VcCLSYJDRSrXtLrhdPPadROLhSbNnIZUSP+ipnH+DtnYBeGW12/Ocf2QVewadAzc8G2
 2dWdEGrqKIvLm5UvbWHnd4eIK+aV64+YxwQ0xACF3VGDVU4CHrQ/NUpakDSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773550838; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rDpP/BYffUm3oljLEJ77n08kV4dgPuQe718LZhPrT8I=;
 b=DCn5RYP1L4ViQ6eiH2a9Ys4KvLDlnAeY90iAuw5yS5x6cEFT8hhct0/1L4GxvO+ay3Q7L
 SOQpjofoOFNSethIt9kKnfQVcX5JTKJdXHhwvQX9TKNAolL+eC3pByvTsiBboi1CEo8qdw/
 Fb/3M4M2DEsohq/9yo3YuP7vQJaYWnFqIyCf2qO9MAUxtKw/eWG98ko7IkPouWHoNjYyf02
 jTltX4tmVl+xH9ItOYmAyq715k59mZlymB4DlrTEfTVoiPn+QSj6ZVaOD9AMnrq7qWdgXC7
 MHwqljKtOmdsoWHGRfDNghfRtkGhiHc/BZSwvY2ppIdJjvqdwk+/gEa88U2g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 78D3743436
	for <nouveau@lists.freedesktop.org>; Sun, 15 Mar 2026 05:00:35 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F18FD10E1E0
	for <nouveau@lists.freedesktop.org>; Sun, 15 Mar 2026 05:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iC9Ah3xq7+SRbU7QH6BVmV8Yy0lMGVEy9dnKaPNHTLnpP1sT4FweQO0cZULVOs/osKszzcgpVPFKVjbVa0oHdgXmt45fTZkdL7iO1MHgICUGH9ZTapTa4PNFMfBbZ4IBNWGk3qeyQNgosp/qnVuvtnDRG49OL2OQVqrKvbkZSyvdOjObXjfVZVMYlqP+GcV0ofjQ++Wko85y9j+DhZbF7SeG49f9Jk6NdfZn6wpYCBVC2bFoDDdMICt0Nw3ZAv28EDHTIrDHd1/WGIbUwABW+pVxC8K2wsxdsJ5wKjLVzEaUCHbtsOUMerxVJhAemI/fV/FL13wVVonlW8y25WtlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDpP/BYffUm3oljLEJ77n08kV4dgPuQe718LZhPrT8I=;
 b=vxk9AzLGBBkq3ezTkWKS7DXeGJZjymoVu+8OwFqX+7OT1beHP6+eNFSE68xjSD/e0OubZOAK783Owv3OQgGHtvML2fvlGqOzbAxp113cBnhZiYh66gQxJfAuxtDB1iGLt/SafbH8P7oNaf1Y0zl43nzqYmK9nCOE7rWbFmH0V2u4yHwdimCAfc5ynSzM06/myOWPCBCG2dKFdvUNeAetcekOv6+kPSF3nK5YB2raOf++BF9cth+Za+2/9gO6MDAoE0eszmKPddFJE2d8eaM8qZRGquLf79GcypiPyvk0/rDLzzwzq8jEjtaq2TOAdWUVjyCHqtdQrfaRWyItm5xcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDpP/BYffUm3oljLEJ77n08kV4dgPuQe718LZhPrT8I=;
 b=ZER/rclBZmi8b83aBExUGdqtSX04irNdK5N5FqcNJS0i77gW2khrZ4Opkiza0EiAKIQ+dhooDM5MO04R2tk05mKcAEptAUThhJV68lHkbFSkPpjAIxhAEXt5d2wjC1v1gWvQBmG/nE4BB8oUQndoF+h293FaVOlWIrkQEtzVyLsWZBO0u4x58hwahziMvczcrTgucuu4l1x2y+86xgb0KHUCbtuOU1SMOj7ZURxqLx7mxhav2taTSTAbJcpsLUdKpUNtgWDCN+zRt4KVglUH/0gHbegRE6t6j5RgEkmK8nsynogJR/TV+BcsjPPiorskvZU5hGyWdr7Sdj28oQO+sQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sun, 15 Mar
 2026 05:11:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sun, 15 Mar 2026
 05:11:15 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 14:11:10 +0900
Message-Id: <DH33IXMUWQ3T.1QMJSFCCA8NTV@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Subject: Re: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-4-ttabi@nvidia.com>
 <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
 <ac909647923d01f1e00e40bb0af83a546fdb1f10.camel@nvidia.com>
In-Reply-To: <ac909647923d01f1e00e40bb0af83a546fdb1f10.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: e49c57dd-57b3-429d-8ae2-08de825148a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	nzdaCXatVHjOkiB2esKXHT7oCV3ChL8WFEH/gSEaEaFG7GlLb7BOOQypJT4Fs/uhYO+cCfULAinwvYGDW/nhFEAvF+JqQ4pO1jjrafquJPUkrKynqGSRmgT9MB5QwE0jGoKatrg/9B+CtZWia22r59Fw/NsSr4y5na+IgNXSmdaMzqSSI7nQHq2z1hOdu+ZvmcW3kUKbnXA+BYrXUcyr+dhoneeQLaN9SLlhmmr+a5K6u9h2sXJtOF6wwaUARQHinluGKgsrPkLKj8sVmpapnYdMSXlJEfAejBYpN9avwrsO01fDmyxj+RhqPZis6Fr8MtKTtVlpFAwdxWxPAH91/w+7OPtmKqzvPNiTfn7W/0MY91+AvOZKnLVHzEr6+aJ937DvI3PM28IBmvXNCqcnmNrw6C29PuA62JAbr6m6mwG9SvAsegWyqlKveRWHqs4AcZYXcoQsKEgnn0jVPVdgFZVWOvVtn0ePhmvX8i6LS1QPZSOAnsO7Fe+H6u6/4QghpwBRSVe1Hpyvgp+TCyGQ60y231NNelxBBYvt3Aw8ljD0xIDdaQwvzvmei4trjyGQU0Ufe02ZQECDTkZkHBAh0B/OVj9yCcAL0uZC9S+v2bgXThNv6jYdhe41D/NkmOd90svYlqjqdiUOODqNbVgkv5It4FwqSSpzI/fs+nbnu1JXWUu+8jjBbuePgzaaSOYRzqnmrOvjdMYPmnNn3lJPnA+IYrqZddV+7CbbMM8nR5s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SWErL2JHenJUMTRNZCtZbENoWElGT2JrQ2pjdnVYNjVqdFBPZFkrTnQ2cnVv?=
 =?utf-8?B?NTgrcDVpT20rU1ZmWng4d1V0dEUxUU5rb1BiM3Qranh4ZGZqaDR5WVU1bVRP?=
 =?utf-8?B?ZDQ5SVdORkkyRXUzck83S0dDRXU5d0huZzVOYlcwa1ZWS0lEdThIcnZyMFEz?=
 =?utf-8?B?NEVJSWZuckVoOEg5bjZvRy9TK3NvOWlmY3AxRzdOb3ltM3RiWCtkcGdMS1pQ?=
 =?utf-8?B?MzZkMVdMd1c1SWxYaXlSaFJweVRDc2lFcXVCSUU0YThqcGJTQ3Fpb3lSN3dw?=
 =?utf-8?B?QWg0YnJDUUQwK3ZPK2g4bVpUeFpvZmIyN21UcHltVHQyRVUzaFdmdVlVOTla?=
 =?utf-8?B?dDRBUVRKaU9SS1pDb1BGaXgyYUJaNE91enV3eDRpbXBGaFpGdDBtM01kTFhV?=
 =?utf-8?B?Uk1zL1B0YTM4aGRtRjhaSDF1TWk2eGROYnhWZmVXdmIwOG93bFJ1WXZ4MmE3?=
 =?utf-8?B?cUQwTWUwRG05aUN0TUl6em83bCtlRHV4VGZxdnkveUJXVDVDSC9zRFNJM1lF?=
 =?utf-8?B?dFZWTlFkUVJmNU5zR0lVQ240K09acHd0T0RQWkpzRUE4K2sxU2NHR0VEWVI3?=
 =?utf-8?B?d2t1K0llYVRoVkVSSVJlTzgxazB5RjdpSThoaGpzemtkVnMzOW1EdjIyWXB5?=
 =?utf-8?B?Qk5aYSt5eDlTbk9qTjVIeFBJMjFEYzd1UHh3R2xMNC91amtlektzSUVud3VL?=
 =?utf-8?B?OFZmY3dlYnFxbXJicEhZM1BwSFlmSHBnMEM0a1E1RlFjMkg1S04rbXd1eEtL?=
 =?utf-8?B?K3BjTU8va2xreVNXN0RXRTFlVkFoM25OcFcweDY4anNlYzhHZ21PS3MzTHJa?=
 =?utf-8?B?ZlFsVVM5bkx0YUY5QkdNWFAyM2pLWWE5S1o2dktVNTFHcllIVWZmdzNWS1F5?=
 =?utf-8?B?MXBhZU1raVk0clNzMWprck85a1RZSjk4d2N1L1N6cmVuQkhBc3F3T1dQQUV1?=
 =?utf-8?B?dkgvemQ1OUUxdFlBYkt6TnVrSTNyZ1VoMGZGRUZjcEUzdytydlM3VlRzMEd1?=
 =?utf-8?B?V1lmK1dJUXRWbmVKdWFrMWlvaWdlakh2aFZEcGJ4dmFrWXNWMmJ4VWQyenY0?=
 =?utf-8?B?eHNkT0VCNEdselEvVlB3SDhObDZjc0JBSkZXTXJhdWl3ODhtNFhSYmVENkxP?=
 =?utf-8?B?cXkyRGxBY2tKZlZqTytnNytRaVduUEU4aEhqTGt3cm1OMTRLN1dvb2JGdzAv?=
 =?utf-8?B?UmdwNUd5S2JlaVc5eHNEQk5tSHMzNjJSaUtFaUxEbEw2enFSd1VRRDd0di9n?=
 =?utf-8?B?ODd0dXRVN2QvRnc4T05ROFpFMzl0bXFNQlNScFVnb0JpME8vYXBvN0dFT3dD?=
 =?utf-8?B?VTdPeUo5Ti9BWk5IYUx6QTE5THhHSmZ1M1pOS1BFbUlvS1J0L0lZT1VkK2w5?=
 =?utf-8?B?M1ZYREVhTnJuai9iTnVHUTdWczVkaGhiMjZqSkN6S3pSWXBxMTJTZU1EaCsx?=
 =?utf-8?B?RXJONy96ZlhDaSt6akREWlZwSFF2M0R4cXNncjFDQXRONTlpMlJ2WlNyeUpN?=
 =?utf-8?B?QXdUdDRlREk1VmVKemxDZmFXaVdEUVFXUzgzeTh4WUJ1QW9UMXFtdWRHWkZl?=
 =?utf-8?B?aEMzSnRBYmtwbndmZ3I3SE11N2pVMmJSVUhSZDFobGVrVWVPbU8ybWlaZTZT?=
 =?utf-8?B?dkpqMFdyVDR3azF6dmJuS2cxVkNkb2FKQXBiQUVCMnZWOWpCZmV1WjlpMkNq?=
 =?utf-8?B?OTZQUGxZOXo1TnMvb3FjMVZiTENralRnS0pTbk1zSWw4Z21Ec0UrMTQ1VElR?=
 =?utf-8?B?c0IrdEpuZnMrTE5wY3BENk5pQzRWNFNEZUpvZnBIS3I4RXdrbnZpNXB1Sk1V?=
 =?utf-8?B?TC85UXV4YXlZQ2FyK01XR3VOYmpGRUVySVZqVmN5UXo1WHVnRm84WTR6Qmxu?=
 =?utf-8?B?d0xudllZUXE5b2w0N0JISjFVWDVGZWdGa2FvRUx3M0FTZmYvbFBRbXBDZGsr?=
 =?utf-8?B?dzFMUDUvdXJwbnNBL3RoQjl0ZjBVcUhGTUdCdXF1TXFSWmx2V2d5eHY1dG5I?=
 =?utf-8?B?NlhVNDFvL0NvRUROWmhPSzVlTUV4NFFTQWk2cWRaZW5wem5abEx4UityRWlG?=
 =?utf-8?B?Tk9zVU5GQ0RPWUNxU0RYbGlSdWEwemZOMzNtczU4MFh4UEYvdXhWTWlKaUtE?=
 =?utf-8?B?VGprRXlsYUtXMGpJeDNoOTdQNzNiZEtXQ05uRVVieGE2bHdLVWhHYnkrVTNR?=
 =?utf-8?B?VjZUNnZDSHlVU0ZEeDV3ZmJ1Vk5ORzJ6am9hTmlFdnBHTUJ6WlduY3JPZTkw?=
 =?utf-8?B?YzRoNjZqQ2M4RDhDVHdmZWxCUC9KOHhwZ2VzY2QwRHJPYi9IOWJ2aWxtMUpS?=
 =?utf-8?B?YnYrMVdyZFNlUXFvZHdnaGwrTHRwY2NWM1hyMENhbGZhWVNGd1dFWUZUTWd6?=
 =?utf-8?Q?KoecEMtTvRfnOarENWuwmnd64yvY1JW072owiCGZbM4kx?=
X-MS-Exchange-AntiSpam-MessageData-1: b50aHNwX3LdaVg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e49c57dd-57b3-429d-8ae2-08de825148a8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 05:11:15.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BPJeTSHPvpS6oM2vfxCONK9QgJjytXwMCfcksbtqvpgqynbEelJdD459O71WE6mKTwFlgwB27JQdBixV6sFDlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48
Message-ID-Hash: QADFBPLW34WWSUHHGVKFNK6WXBJMGAKY
X-Message-ID-Hash: QADFBPLW34WWSUHHGVKFNK6WXBJMGAKY
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QADFBPLW34WWSUHHGVKFNK6WXBJMGAKY/>
Archived-At: 
 <https://lore.freedesktop.org/DH33IXMUWQ3T.1QMJSFCCA8NTV@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Mar 14, 2026 at 11:05 AM JST, Timur Tabi wrote:
> On Fri, 2026-03-13 at 11:11 +0900, Alexandre Courbot wrote:
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if offset.is_negative() {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn Err(EINVAL);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> Won't the `try_into` right below also reject negative values?
>>=20
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let offset_val: usize =3D =
(*offset).try_into().map_err(|_| EINVAL)?;
>
> Well, yes, but there's actually a bigger problem, now that you point this=
 out.  If usize is 32
> bits, the try_into() could fail if *offset is too large.  In that case, i=
t should return Ok(0)
> instead of EINVAL.
>
> So actually, we need to keep the is_negative() check, but should modify t=
he try_into() to return
> Ok(0) instead of EINVAL.
>
> let Ok(offset_val) =3D usize::try_from(*offset) else {
>     return Ok(0);  // offset too large for usize =3D past EOF
> };
>
> Are we going to assume CONFIG_64BIT forever, and just ignore any possible=
 errors if usize is 32
> bits?

This is not Nova, so we cannot assume CONFIG_64BIT. I guess we have to
do as you described above.
