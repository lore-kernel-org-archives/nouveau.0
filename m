Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E139BFCA19A
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:23:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBEC10E5DE;
	Mon,  9 Mar 2026 22:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LA5zj9PL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3085244FDC;
	Mon,  9 Mar 2026 22:13:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773094380;
 b=xYbcD1EAxv3ta5a32vxTAUO25d90dJbx30I05zw355gFZl9kXTiKea8RH7tWqE5dsAdkf
 NzjzfGH72TeKwPsw1D47vEP3mQMQbGyKRSnQE8Gl/cjvfrOql3Un6a9AztkO/2u00kfKorV
 hhbEQg0IjKYWVNcMYxQmodiplGFvsLDGvD0LMkOrnHhL3Xocbbmq8+D3uUk1aEr9gUFP11X
 rD2ZtWNpU1+iYfF5evpxH74L6cgvMhlWilDCOzzTw/J/AGVTHu/VLmQ2QN8jcIzS28mPpe0
 t4GSPjzDCug3BlMeiWWxTWBjU3Uu/cOwfcXc7MNyaBpv4a0BIg3tN8nUnfJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773094380; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5kFFKc9IDYB9XcUyVANBIGrPhVfef6aBxkOGPXC2u9I=;
 b=DOP07HdCA7lPUZI4qTrBOTQ3NpcGqMooGaoLLlKAnmxfMO55DB1rSdXjEIgh0ubpIRWHI
 6uv14MXYNkHadqHEUrZzGnaLkujVqP/l5jdo11xYgB1gCFHYUuwS66tV8DlY9Y6e0u9QzVt
 39uRGdorozvqJQL9yxteQ+KfyLIQuAPKsWk2S6E0jaag2O30O+YgK3anIIPyld7rIIP+St2
 NZexFw+0ACzT7ZqYcyuEP2AMOWV1QztcQiqix7oZTxSMVvMEN5YIkO0KczzBvawNnSGEkf5
 CALxgOr/OGeV/0frBJ1sn3B2XVk5MgJnT4B+fee4xz3QH99EBv/dGNDr+3Tw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 51F6D44FDB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 22:12:56 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2925810E5D5;
	Mon,  9 Mar 2026 22:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbp9LUmRFHJf8WuNINm0sC1jjkoG6hORw4YDk8c2C8Sshhou2E97c/BVItoZSXm2iFsq8XXKacUsyAPouze0PQ/p2gl5wUCBIBcavQqzPpUmL3yZ27o6Lg4Jn40Cx/fIbxglQ4HnWWFi5klAnMuOmqCdCMS0tN9DaVVfgJkpXzbqsLU6MQtcufcI81aGGvXMutO8XwPuf+AxPHcZa8ghEWNzIIZq2f6IJAlQeTw+tGfN+y7KKLf1ipkj37XBmXx+/uY6OT6CFFqcJVlhBahYF5qSF+uhptN339cYzavgfxmFjK0LFgcEyq0ykIixWFlqY1TjsYzgS5MZkQQEFNNC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kFFKc9IDYB9XcUyVANBIGrPhVfef6aBxkOGPXC2u9I=;
 b=ZEAsFd+W9UxqnkzQkDqy3ZvHujCocxdM+jhJHu42bCGKEtXK/K5pvRSuNnTA9X0HalDasMS/76/Fuv+nzQND2DoZSzVSpCJEEZ5qP5qnSq+WsfOcnUd7U+cuaCFBSF4cXtgu5f6NAAs40LTiJpp4CvIMs7SfGU1J/IEicaaFU8Ee9vGHNpUG9ENSQPLtdtc4y2rCXYaWeKQ2hVcdJfpUruwtpDRUTn85ZTACgZL+qRxGBznA5Om5ugSrLNckKqMLCUskdHjkoSMRUsZhs4RbUmBWnnYnWiXTUBj5BnFPx47IiRC2xCN+rR+HKykDuIWZvuNlcCA5qP6YqZhb3I5rjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kFFKc9IDYB9XcUyVANBIGrPhVfef6aBxkOGPXC2u9I=;
 b=LA5zj9PLMuVV8nUynjuWfUDRLoDZMEmaO3c7VOFq86+g2v4D5mf4MgEk5AiSQ6/LoJQxll0N4E8weG+opN55bSWsaIp9mRJZ6XuVTgcICh35h+r7SGxWuw1zl3QpiT3Cshec9vzdGH8NXnzEofgght8oeaonkZMFjXcR9fDPEk+vV338OA1bR9LmAOX10gFcnFYOoTrrBKJHzsMVBiOTYcEtMi5BiaI2HLKwspjr/JI3vOZ5dVRrh/E5SndehJxpfI4CxPIRvBs5RO1DSFSs1wk48RWG9fsyIsKWaREHu8BZviw2AyBn/8doHvcqWFruYg/PjAJ41ErWoFNy518RIw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 22:23:22 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 22:23:21 +0000
Date: Mon, 9 Mar 2026 18:23:19 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Subject: Re: [PATCH 9/9] gpu: nova-core: gsp: add CeGetFaultMethodBufferSize
 RM control command
Message-ID: <20260309222319.GA3334784@joelbox2>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-9-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-rmcontrol-v1-9-86648e4869f9@nvidia.com>
X-ClientProxiedBy: CYZPR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:930:8c::27) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce2aa87-79c9-4382-afd1-08de7e2a7904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	8OKcfP61p5BOjwEltBdz6E4OJhiy7e66Hnoy6/KgrvBrqUTDp+9uqs1vmMvbsgS17bnyn6IKvG3sbcnVWvOe0mTjWEEj2/wagLs2AtoeuruOHWKwiCRSkj9luw7wVDRHiSJsYVvkjGIWuwsdi3lyBFLQX2wR8jRM1wVVyoA14lf6+WtJqvdnvv3kXjRe0quttGS6XX/JRzAW1gHKBKeu692JC/Dy17Ld7iV59Hjz2PHe9GRLzpvdKZqL1C/dmElp/H2Vrg4e+vKoplZkZKC/DFgr9+UIFdrsD6i7noz7LyvsWdnaZ+acs8vrCjHMLnMxHAA+suiZUORJ4/qeN5ZuKAMVQZ2ItU6Nz2i5IavffFOHdhfjnNzMDXIrVciIleKV2c+YVfKwhuxEa139wk8R7LzcQyXKI/o7mhPt7rZZT2VoY6keeOnSeCbwL3lf2S3iMXgD3BPC/86SlFSLrDBgIoSHTfSDetAsBKqlMDJbWRyE3nqutfzYJiXQvF3atJvqMqqfB3VdWneaJvDVMJ3jvL4sk7ptA7PDBg+N9oQ/xUmhSg1w+YcYGdmWJpnH6hP520QdEBNv4YXysEeBArCDJ/flWONSHLDHQucEI+QlR8OVcumGKzSDSj1HcwYK5XlSGsRvhNd3fZKPoIZRzDNRUtXiZwZ/jllszFNcoL2Ibfj2vHqcubT4uxntAsylFLWEKHC+jgT/6ABzkvvo+5q5UB/DIR2k9tAoF8Vds9t/3fw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Bw5P4Ey59EBHv5HoqOJEeyrHZGNykPOB5+4a5krq+8WhJUfnd2ucN/m1U7S?=
 =?us-ascii?Q?8BhVTqWijVH4kFchHHfd6ISH3i+S8c2m+C9B8rF78cAcJtjbRmEjeWB2J50+?=
 =?us-ascii?Q?sA4fiBxhlb8yWyQBaqHlI2M8J5wzisVNnZBeKnHCTJJfIgbEhnXkCmmHOq8F?=
 =?us-ascii?Q?QDU90YIczLOAJ5Vy3wwWv48YznPtaxNZBgTTUHTlxMJZTgprpy9AYp/FtUrF?=
 =?us-ascii?Q?MVjpvhwlv1Clq010HWbV67L4wh2oV7NL8rmyquPJxQFgHt5vr1O+n5dowJ+5?=
 =?us-ascii?Q?2XQDjVB5Wy4+sKTkCxW59Ffehmbii3j7qzVdOw/ZSECcc3aYHKp56gPICzhl?=
 =?us-ascii?Q?u/2EEdrXMgaDD1gknAjOkmGFD8yHmsl+fzGCgbUj4g3eo7g5dsXd7aRD8kE6?=
 =?us-ascii?Q?Hd3Kgp1gXPY0HY+GHMhGuqYbu/7UTs+2EJPlQidj0E8d82XxlyOY/n62kFXy?=
 =?us-ascii?Q?3kj0Q/yWjHe5miJCeb5RYPcOtyJCoXdxsKFxqDKbbA6jw/mMgq212vbLRgVT?=
 =?us-ascii?Q?S+uoQyw251N/LR/cYKcPMQB8Z/yFIhe6pkvFfouRI0YGWhI5CnylVIenvoRW?=
 =?us-ascii?Q?os23rakj6tEabIXIdCKE1VRH6r17N2FJG+Xb0WJg4oETvnypjBbDOVZP2O9N?=
 =?us-ascii?Q?qkG+qlRSakk2KFtySvWKdVnJkG5az31ZgcahxIpUwifSGbZl58Dx6PTAd3F9?=
 =?us-ascii?Q?ehnsYjJdLTJUkfblr2T63+SuhjJ0lN5lgpFaiEH9mlppcFB4eIBZZMLHa5pK?=
 =?us-ascii?Q?YpI/rjmCg771VAJvRpVpPuccxlEEG/Qm2xMiB9WBvngF08dslyLGOqZeRyKR?=
 =?us-ascii?Q?aA7bK+6DPziP1/Cve71ug0ZenccSbuPxy7lNQgPUfH4ll6DSnLq8XVDvSx5T?=
 =?us-ascii?Q?C0shJ0tAmbb7SjuYEgLx/cWuQkicPDNsgqVJEcor5qx94rqkQVeMcb0PNxaJ?=
 =?us-ascii?Q?jWB06LZQkxzjGfE+ECKm5f0v/luJ6fDITNu/b4e6w08ZF29oPGgoPat6ee7G?=
 =?us-ascii?Q?YjVlGU/vHuPeU0sdYBgcyoKrOMUsWeDW/ELnEO0QrjPJJfXd4xYmXJFqlhE2?=
 =?us-ascii?Q?XEyCkRV638gwqNjRD+1QgdfcOGXdNmcz3W8i3cPRYNOZkQpUNfUTbt1AOurz?=
 =?us-ascii?Q?64bgsHfZ9bm9g0p2cnzIIKsBN2iTDEieX2f+sZXTP20LBN0vqV900HCewKCV?=
 =?us-ascii?Q?ZNiCwa7hAxgSG7mLv35ZTbmwIh41RPrfknv6tXyLDhrK4H/CGE1oTwQA1TkQ?=
 =?us-ascii?Q?XzK1IIYiciM7t3zmjVDYZr1AfNI2ltUl0wWEqVH3y5vvGlKkRJ0qbhwVbRmx?=
 =?us-ascii?Q?wze/rVSIRLBaFOEnnehpDkyTB+TDSt0Y09Fa5Srmn3PjndOf0r/V+FD7uinN?=
 =?us-ascii?Q?cL8p6Di4uhcCrF02eyyNnm1FJogb1R/npNQYsohplcwgs/SFWFCHEOWw/oLG?=
 =?us-ascii?Q?CI6zaHeIZrIW6oXKkGewXA4OlWFGAapDbLjxG9oKxCvlsVUiyho+s1W+o+10?=
 =?us-ascii?Q?Ufb3xxgOYxZV+vRYGGX87vl2bmhMxlUS0uVh8tGgSxf4PpgMea4rClmAirba?=
 =?us-ascii?Q?gqHNCp2wL1x1aWQ1/bgJjBsTrEtiO58EWBw5Ukn3LfjmoxOEZgvKSqdCZ8yf?=
 =?us-ascii?Q?fWSjkJNqVYFAGXdBA5ujDo/DYsCLot6wi29FR5aDzG1waAcMIXpmcmOZfv92?=
 =?us-ascii?Q?Qe/TMBBBwZ7F+4Sr0aYPCcw1NAEsIY0j2xOH9gyImWuc1hQHknA3DPb4UwEi?=
 =?us-ascii?Q?oyf8yGSNvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ce2aa87-79c9-4382-afd1-08de7e2a7904
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:23:21.8761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6mO1AcjCpdO2pEnVdARTwfddJighvX5nYi5HKqf4bjgDKi+v4W7/Evff1V9W/4E9Z3pfDQjp4NGGnu3iRUYghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9474
Message-ID-Hash: 7RRIS5GHII2JPMG2VMYEZNLEVNT65TRP
X-Message-ID-Hash: 7RRIS5GHII2JPMG2VMYEZNLEVNT65TRP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7RRIS5GHII2JPMG2VMYEZNLEVNT65TRP/>
Archived-At: <https://lore.freedesktop.org/20260309222319.GA3334784@joelbox2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 27, 2026 at 09:32:14PM +0900, Eliot Courtney wrote:
> Add `CeGetFaultMethodBufferSizeParams` which wraps the bindings.
> 
> Add `get_ce_fault_method_buffer_size` which sends the RM control RPC
> and returns the buffer size. This is needed for channel allocation.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw/rm.rs       | 17 +++++++++++++++
>  drivers/gpu/nova-core/gsp/rm/commands.rs | 36 +++++++++++++++++++++++++++++---
>  2 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/fw/rm.rs b/drivers/gpu/nova-core/gsp/fw/rm.rs
> index 8bb7b11736b9..9f1e3546d39d 100644
> --- a/drivers/gpu/nova-core/gsp/fw/rm.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/rm.rs
> @@ -80,3 +80,20 @@ unsafe impl FromBytes for GspRmControl {}
>  
>  // SAFETY: This struct contains no padding.
>  unsafe impl AsBytes for GspRmControl {}
> +
> +/// Wrapper for [`bindings::NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS`].
> +#[derive(Zeroable)]

nit: This patch is not using zeroed(), so do you really need Zeroable here?
Also check other patches where you might have added this trait but not used it.

Other than this nit,
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

--
Joel Fernandes






> +#[repr(transparent)]
> +pub(crate) struct CeGetFaultMethodBufferSizeParams(
> +    bindings::NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS,
> +);
> +
> +impl CeGetFaultMethodBufferSizeParams {
> +    /// Returns the CE fault method buffer size in bytes.
> +    pub(crate) fn size(&self) -> u32 {
> +        self.0.size
> +    }
> +}
> +
> +// SAFETY: This struct only contains integer types for which all bit patterns are valid.
> +unsafe impl FromBytes for CeGetFaultMethodBufferSizeParams {}
> diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs b/drivers/gpu/nova-core/gsp/rm/commands.rs
> index 16bcf88644db..1d045e6f1afb 100644
> --- a/drivers/gpu/nova-core/gsp/rm/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
> @@ -2,10 +2,14 @@
>  
>  use core::{
>      array,
> -    convert::Infallible, //
> +    convert::Infallible,
> +    mem::size_of, //
>  };
>  
> -use kernel::prelude::*;
> +use kernel::{
> +    prelude::*,
> +    transmute::FromBytes, //
> +};
>  
>  use crate::{
>      driver::Bar0,
> @@ -94,7 +98,6 @@ fn read(
>  }
>  
>  /// Sends an RM control command, checks the reply status, and returns the raw parameter bytes.
> -#[expect(dead_code)]
>  fn send_rm_control(
>      cmdq: &Cmdq,
>      bar: &Bar0,
> @@ -109,3 +112,30 @@ fn send_rm_control(
>  
>      Ok(reply.params)
>  }
> +
> +/// Sends the `CeGetFaultMethodBufferSize` RM control command and waits for its reply.
> +///
> +/// Returns the CE fault method buffer size in bytes.
> +#[expect(dead_code)]
> +pub(crate) fn get_ce_fault_method_buffer_size(
> +    cmdq: &Cmdq,
> +    bar: &Bar0,
> +    h_client: u32,
> +    h_subdevice: u32,
> +) -> Result<u32> {
> +    // Stack-allocate the request; CeGetFaultMethodBufferSizeParams is small (4 bytes).
> +    let req = [0u8; size_of::<CeGetFaultMethodBufferSizeParams>()];
> +
> +    let reply = send_rm_control(
> +        cmdq,
> +        bar,
> +        h_client,
> +        h_subdevice,
> +        RmControlMsgFunction::CeGetFaultMethodBufferSize,
> +        &req,
> +    )?;
> +
> +    let params = CeGetFaultMethodBufferSizeParams::from_bytes(&reply).ok_or(EINVAL)?;
> +
> +    Ok(params.size())
> +}
> 
> -- 
> 2.53.0
> 
