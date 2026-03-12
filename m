Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E2DFED2C4
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 03:50:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83910E954;
	Thu, 12 Mar 2026 03:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l32imQm8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2362945086;
	Thu, 12 Mar 2026 03:39:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773286790;
 b=psHEef76JRtQ/VSuL9M0tv9ZIEHQWU0NpDNYlCxuTc2pEUajySQSCfAmbrse8EXtnYAex
 k9tAY8ipolQuVniP1Pp4oJyfWR4GPDxmPs6Cf7N6rL52x2Ko7Z80FcM5jgZKMg+XdgMqCf9
 v+HrFVJiR7hyJJe2p8TiytP2xdzLaC5jKf2OUzMhye7AcOCCUJgcq+N82+uYhoFC7tQeNEk
 RwjOhptHohUfnicq7khB4kIyqvHyDqP5MTFzcTK9R+H1jdZcCNB658+fxRlQNVjj7891/15
 8QD8PWOsMbZMX2eBfLnt9UFqBOP5+LKZCtdA25YhWSplLr2opOUCG7XBOKcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773286790; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VU9FWfs0EERbEM2pfDZXKzuE2DRZXYFo208W/nKHBZ4=;
 b=t9HCvY385qEimpcYAFhJbDUliAt4EiRlFQd3j2R7UIYtTmRE0MFwKZ914Lb+zqGl/cMXu
 qLPMl06Q8BSeW3MgP8CBCEcDomeF6q824qLox3S2h9zCTWVepg48atrinq9JqhRJscqWkhK
 Vr13Mh1ngFUz6ta0+UNQv+Pn5VkGJhahPcufZC+YwRXbGT9NIxAxD25tahRz9EwXWAayzeL
 2QCP3tWiLJZfyK3Bqu/2S5ZKRYlQk3RiNnhoWoWBHMs9zl7BEHQZSO6WWCyx/na8LGgIsPv
 ZEaS1Go3y9YXICGkC6mR3z4e8QDdax6jZnbbcJ3fPdpQGCX9tcCTPUkaG+Ng==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BA3CB40696
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 03:39:47 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1EE10E94D
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 03:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/R/aVGfKXNCLo0WFzgGhT8Ub0VsFOhtKOov74VOivKvycUOj+IdfL4TO5xSQonG6QhTYbLoR2QOnXdVT1d4D6U/ueNpjdDnHaEeGHHNGVafFYnLMij5/g8IlJn+7V3qmnWp96GKH7kjL5oP7cUNAveEONvnkuL+20CUGhXMxELwUp684tY3Iw3zoVOA2ls6VMDGfvAcc8y/m1qkUYEsH/X3IFOfHlLWuIcIwYtw/ZSfqWZesXdhZGCmAqfvqxA5bVxVDgmS1kKa/Mwkh22o+wa58hYCA5vwS+zOb/RedfWkVBsgsvqjrGtlImlLGRfj9zx1/uZh44IDTvIix0DU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VU9FWfs0EERbEM2pfDZXKzuE2DRZXYFo208W/nKHBZ4=;
 b=AK5vz5xsp9eHEHZKTE7f4bNqeHNdmob2ZMXgA7z1+nnyf9g6msmsJEJxOus35Bc6DfiFTd4X+aLDIO92vXUEJT4QZW30v9yb02mXis9Inp7xys5egg8BgHdq/eSjqMgz89Qy9WLe1iUXhCvNbBes+LzSpLkayEiHXXaaKM+X+j5Nt9BDvdLfphvbKY9Uw4K/HFiA55yI183zv4IVrY8Oq50FIhlqPnE6EyiJgFWA+rRObUp3BKpmMiaNlwsx7YeKJburLbyrQWfmy5bDJs0vBPU9brlNzYS5ZCMg4y25hCttneMni+WYVynCzCVEuIeWruUQ1cKBLyw5eA84gBQwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU9FWfs0EERbEM2pfDZXKzuE2DRZXYFo208W/nKHBZ4=;
 b=l32imQm8mqTfLv0xgOJopaBTfnwkOlgad36/pZAMgdE2VmqzayFQ95O4RC0mTR8sfhiM3aNNKEV/Hrj81rSsJ+PpdYOPxmzuEOa/bzZjzbIgMTJBc7Y9ZUn1oqGNjINRfSi6FEDw66JMa3fFeLkt6Mq6sxo8i3KSKTdjM9JTNM4A9MS2vwrowanjOijgLWmcuqOJYQKlnAWg2ruZ7DSe0zvkbVMn/WMpGuwIs6coYPgD5o/x6PrPNujl9YypwD9/V557Za1DXfHQrAWfk/wMuwwqcvxIP7l16v6LX7Zm8/r7mGcXvKM+qgxpU6I8y3WXpq5i3bKEvi/6dRp7uuUf4g==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7146.namprd12.prod.outlook.com (2603:10b6:930:5e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 03:50:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 03:50:19 +0000
Message-ID: <cd35d465-728b-48cd-bb84-2f67f4d5fe02@nvidia.com>
Date: Wed, 11 Mar 2026 20:50:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f964d7-4718-45a6-ee7a-08de7fea7aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LkzvH0Fun0WZsNMuKnQ0AiwqJVCzdTvINp7O0XOvBhUMoF3iKSfR9WMSPdjyRu5OD/ibjIuqigZ4lb20xfYLAHjtE+pH8TIce5m7GvF8SVorNpgvirTvhWakqKACnE3QddXxZokoylcGDi1hTOm5ysRslW16SLwcBP5rabUQTBWp0vj9e6eJa8svQdfIN651YYNMUSit6B4E6+6Kkv4Eoz+4IpVgzFRdMXjR3KOZL+rUHjQRfP5slKEv9bNKl24kx5+VBKiXOsSCmNqXRD+wATIM3qFwPMtOtaRzOQjnKHB0V1sVszH469srt3l2+FDKPXGYEkPSG6LVNgf+XimLBf5DIu0+Svbhf9+jKYL8073EBBTaSWBKxf/noyoFIwXF9kIjWe0YFka1LO9zH5DM8j81fLpaBwCQih/VSlaRbCzepFP15oDQaHm3D8i0a9b7wNk6uxhDajGfiy7/iVwkXWEuwq+bjA+GQo9LLKfsOs2ya+M9c/1NbC+6FzKiHPaYHX+tsPjS+ueLdT3yEXHOSFUgbwAG91k1agK8jT7JE/RvMu/BXnW5/ZxreYUa9SIwS3rX8krSwBlu2Yz9pObH8u4gFvAMCD+mUxBmJftYzzBB0DH2+Mh7h6NuQsd9Fqcuj49TjoeUMY3e6QPfasbA3LzLyy5zXVEmbiQLraQh3qU8hS5BuKk9TbxFYYTBgyH7FlaPrHhbbSsh88zkWXo00NOJ1PNE8tykN5z0e4MX+zY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eTU3UGZDdEZTdWpDV1g5NDJwQ0pQcWF0SmtJWG8rWUhuZDNBZnNoalVsTXZh?=
 =?utf-8?B?OTNNWU1ndXBHTytyQk0rR0tVL051RHdxblRDWCtpSFB4UnRCV0dXMU9Gd2o5?=
 =?utf-8?B?Q3h0TjdweVdQRkR2S0FLUEVqTHJGY241LzdQcVVFcGJlc0ZEeWhsTHhUd3Jj?=
 =?utf-8?B?VCtETDNqNDdmSjdjbVBFRnZSdmFEbVpRdTBIU3JDV0ZkcVRjSVQzZEluSDVJ?=
 =?utf-8?B?ZkcrWVJoQVRHREduckZjcmVMLzRuaE8ydS9oN2tScWNFbDFublFOQUUrcFhZ?=
 =?utf-8?B?NTAzZVJSMkRqbnk0am4vMUsrbkdrRFh6Z2ZmUXlVNysrUTV6YTZwVklldWZU?=
 =?utf-8?B?bncwNGRIdytCVUtMQ3lCSE53dWN0SmtNMStVZDFpUWFEdzkwdnFKbTBQWURk?=
 =?utf-8?B?MzBSQUYwbWNLeHBLazgwVlpJUWlQV2JiTXc1Mlc4TmF2bm84L0ZTdWc3QXdr?=
 =?utf-8?B?WTB2VUdmbEYzd0JPNzFDTU1hd2FSeVFwb0MxRVg3b1FnQmwwVkJGaGNQM2VQ?=
 =?utf-8?B?YjJ4bVB0U0JVRklrMVBZNGorNElTb1cvNGRZM1BhaGxMeEZscitySnhnNVNa?=
 =?utf-8?B?amdCRGJRLzFLMDNIclcwczMzeHhGYTZCUzdDdmh3d2xSVkFSSXc0aWhVMDB0?=
 =?utf-8?B?SGg3ZWZqakZ4bGNrRm9pSVVkbHo1MW9naFhOKzhQZFZjZHhxWFBDL2tlQlp1?=
 =?utf-8?B?cElqb3JyRnI4UDM0QmttbFdObUliWk1lKzRDYzRvM1grcnVKKzZRYnR1NkUv?=
 =?utf-8?B?VkNQVXNkUG1IT0pNOHJFcEwrWUtwb2lpODRQbXlCd0NERC9Pb2hqT3ZaMzJN?=
 =?utf-8?B?YjNacUNtRmo5ZVdITCswQ0IzdFFDMkFWRHhsdXNUK2hJVlNybUYrUFpPR1lU?=
 =?utf-8?B?a0JmUUlLb0J0Y25YWXhPN2dJd05lVXJqeStEbkQzNWJhcWFxeVlSa2JwSDRQ?=
 =?utf-8?B?OXVPUCtnRG41M2dNK09xWjdKT3NkOVhha1ZaaHR5djVjK01JUDRoN3lJQjlX?=
 =?utf-8?B?ZFZQRzBWL1l1ZENkVUZkYm1GcHpmVGJHQlVzWHdDOWtlM1hxNWxnWmE1NC8y?=
 =?utf-8?B?T3M2VUVKZmtSR1NtTVJhZjFTUDg4cyttSllRaWIwWnV3YTR2NktUQ3drSEJp?=
 =?utf-8?B?Zi80d3JleEFrZ0RGa3BRSnl3aGFuMmNoVkh2YnN5MjJDb0FaNS8vaitUNVFo?=
 =?utf-8?B?eFR4YmtUU3dtZmM5dmh0OVNodzIzN0wwZDExT1RwQldpMHZmVkMxY2plSk1Y?=
 =?utf-8?B?djIxV1BJR0tpaExyd0FWSHU3eTRtSjJOMHFuTk9CNm9Nbm5YMThYQVUva1lS?=
 =?utf-8?B?MmdCR2pTT2N4L08zZDRRL2dnUzhvVFNVazJ2K3BYVDZSbE41ZzJuMUI0TUZx?=
 =?utf-8?B?ODlMTGRLNmF6bW9hSWJ6RGFwc09XVEpzRUlkc09ScjRCTU9GM0lNazVYQTNQ?=
 =?utf-8?B?bEt6REhCeUdCWGc5ZThnQjgxZjRacTBTWmsvOG5CU0Z1b0JkMGlhV2duOGpm?=
 =?utf-8?B?TWJldDVFeksyNXErYnZBUGkzcUZYZmZjWFVYZ0R1dXMveFpITXM5M0NmSGVw?=
 =?utf-8?B?bEN4S1haalRiTzNhYkwzZEl5QUFqcHliTklQdC9DdWRzWDl0TTViOHhmUUEz?=
 =?utf-8?B?WjBDdXcwTWxkTE1EcXFpRE5UbDRqOEdYcVc4bkxObVljUTl6TWVMdDhLT25C?=
 =?utf-8?B?ZTJtY3FZaTAzZmlpYTg1TEV2Q3NzVnFsRnArV2pDSjlJN1ltVXhIUVVlU2d1?=
 =?utf-8?B?VE9jeDlpSHJSenVuQ05pZnE0TnpXSVNMeWwvUExPMFM4SGNaaG5RcmR2ZzZ6?=
 =?utf-8?B?N2pWWHNkcTVIektFWWJFb09wWUNnaEhSVFhFZ0I2azVsalFrd204cFdEMC9t?=
 =?utf-8?B?R2hSaENKekV2ZXZvLzVjRDczRWpoZWV1dld5ZSt2OFdMeDJzOGFuSU1ZN1I1?=
 =?utf-8?B?ZmlmdnhEcjBDNjhFMFpIR3Z2YmR5b25mVVVwMUc0dm1Hd0JlNm82dFFFRW05?=
 =?utf-8?B?VktUVjJJWTc2R2RudWVvSWNPNnZCN2xFSFJVaUZ0aDk4eDIvempaNjdoN1I2?=
 =?utf-8?B?d24rNkdOVTY5eTN3VzF2am1ocnJCVjFXTUhxdm5OVnJDWS8zelAveUJkT0xU?=
 =?utf-8?B?emc3UU1kOURqVS9TeWlOZFVXU2Ezb1F3MFpiZ0VPWGRQUElTdHNDWFZHMXpW?=
 =?utf-8?B?eUtCYUZqWGtxOE9ySm03Qk01REVUanNYYXhFY0lrdmFYNnVYbE1sRFdPeVpN?=
 =?utf-8?B?Q0c2QmwzdStOTGtzOWtuMFBlT0tvY0J0QUpEZkY3QWV3dzBkejlSOVV3d2xa?=
 =?utf-8?B?b0thdnQ3bzhlOS9TUnRKUGhrRTVMYjh2NXBnK3hYSlBQUDVubVR3dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46f964d7-4718-45a6-ee7a-08de7fea7aa7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:50:19.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 73xN7GJY8J50YDiNGaHtWTO62W4dvD6QucJJUBGYy9o+walouBTsUeHaYFc28T7VI69W3jiqsNhtvYbvZDWpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7146
Message-ID-Hash: F6UKQX6O72OCNOLOXNEEWRQ5F7DE4ME5
X-Message-ID-Hash: F6UKQX6O72OCNOLOXNEEWRQ5F7DE4ME5
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F6UKQX6O72OCNOLOXNEEWRQ5F7DE4ME5/>
Archived-At: 
 <https://lore.freedesktop.org/cd35d465-728b-48cd-bb84-2f67f4d5fe02@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/10/26 2:59 PM, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
Hi Timur,

I've booted this up on Ampere, and my scripts are still able to
extract the logs and decode them, so everything is still working
nicely.

For the series, please feel free to add:

Tested-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

