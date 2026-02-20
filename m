Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA300C5CFE7
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 22:09:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19EB910E851;
	Fri, 20 Feb 2026 22:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Je/7hf3P";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CD3E343449;
	Fri, 20 Feb 2026 22:00:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771624802;
 b=iIow51qZA66Ph4n0wd7Yr9E4UklQT5vYJcrjrP9L4t5+YkzPiKCiMJMX4FebLk9nA9HF6
 k59+Ki8/S6Xg9q9yPiUi4pAamF6HsGYvursS8/PV/N9ANlYrVSYALflzsRKWmZYChyPPJzT
 DiwJ8DSEso5qAlL+nIo6qqd4E8F+3p4aoyD6DYHtEAaFIeiqNHewdKMmA8oKik8JRqhxHxH
 UIdAN8baf1SRbOYklVDvf6iYUhRC3VDvSXEV/hekMIzkXm3Xj3FjGWinHkRknqy6nS3RDZl
 svW11Qs5waq7ERWVYy8Zv6nGTiAF0+0YuE0KZFVfQjjuT0gx12KCkrsE2Ksw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771624802; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1kYQpFpOnhB+KQbuBINQvqT17xY2igzIA06e61oButc=;
 b=J4y+6EAtYWBr4Ly3Jc5LZmUCtiUnjsU69rfqe/SD+dYSTP5hdARwzjqWm3fXZWysV/AOO
 qW4+jIQBQf2aTTg9Bc6VoW1Blgnak/nbVKlOYyq1dEM+Hk5FylQ1HVtdmlQZQIN4uQbhGrS
 UKCHuW3iTllzbolPjssHa36Y21HmZ0L6hM90wtz4dHCiREhBybmb8oniG7FX7aKdytwsWPf
 J1INq2gBj0ybII+ID1mYfY9HyqPwrCuijwBQ/+yqJuSUcNKkyAqcogoEf2zDGFbCOObE9pP
 eHzHuipeFLvYtln7rQqNtvv4RTJ0Ih5WTs6FpLXXFFpx395XnPj9IjBjK7SQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F67843400
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 22:00:00 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1697810E09D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 22:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzyJWvxYLyRuljZP9Ext4+oZW19SSJRiQ8LWDkg6N53cTa8IC3T0fd+u0IxVxgFRblyOZzynMP9Jxrsz7cWJYD6q9ZwhAoFoe5hk8nlR0xti5AgCP8PkbV6Pea/U49xXefGzhlMe1cc1215ehduV3jT1x857GVEy1D1y0slQlpctpgadPl5M2FRA1PG/0QLp1J2FpWCsQxiWnMdonHzraetOuqordWky+UofSy5avMc9za8toldweBsghjk1u6WHOVVEUe151SOAT2wvmcuSfRbfjSE2UVvUuu0PG70bzTEx3Jn+TaYWs5VAQ7xdzZHVHE4q7wYjOKeR/n+0TT++6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kYQpFpOnhB+KQbuBINQvqT17xY2igzIA06e61oButc=;
 b=yXnZ8Sxot19EK7HKoNf9iinNyunPDThVv9kA0JQknpWnSwlVNZ2USmd/0mVH5FNjIBdDdFFjWv1QHxLKh49rNDPyKDrMWTT0FRmjoERtMBYfZzqmj8DkY4UGxmeXKHQMolDF18hkPgLYtoNQs04Jq0QjEGaSgmHOTzsDyGnZPBBLwOulDIPmRZqILrWaiK6IZSLhpZpsRA88/Ep8E4z3hBUIzr7Kcw3JWNfyNC2NIm5ioOesAV6mxtKYujsWWevte/IGIqFFvkDX62Kk5tuxdQVhIbFVGtXvSY0H/s+F9784dTbwIjVTDGtnJ6YViTaA5EFX7D+JK6oUdgk/EZm2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kYQpFpOnhB+KQbuBINQvqT17xY2igzIA06e61oButc=;
 b=Je/7hf3PpuZwVfhTYFS9zO+mQemjqWx0Wfd2vPkEu8/jkZoueKRa4tkWFgYhEN4yJIvHq5DQzLur2oMxNKm09erGixI0TAmgPi9B8UAaQA5iSlfQW35IY8ZC82gdsyG0i6p5R8cH3FksQwe0HaNq2dRf6aqgcxbwOTNxkOXbGRrk10onpq2iE8WZSM6Td0AITl9wLybi/bdT+98WFDC6aGm1HKF3NxJeQzvKQVxu5beeG9gtMenDoDLk3MfTZl7p0nS2Cf4jxi9Bk95PGhPKX/W8zzly19O2+c0MAK4ByNy48cQ23Wh403A3eGYV1sBvt/rMnm6kzi6Ilj7s7pmyfQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 22:09:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 22:09:48 +0000
Message-ID: <815915fb-f4cd-437a-b5dc-b8b7ae8618f7@nvidia.com>
Date: Fri, 20 Feb 2026 14:08:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Gary Guo <gary@garyguo.net>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-20-jhubbard@nvidia.com>
 <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
 <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
 <CANiq72kzFhzP_41ADCpjz8doVvPd+OBpajC2FH3gvNb-hHZ2wg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: 
 <CANiq72kzFhzP_41ADCpjz8doVvPd+OBpajC2FH3gvNb-hHZ2wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a06bed-69e9-419f-df3e-08de70ccc314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SldYWGVteGkzMWpVVmxJL3F3NTlEZFR4TzlQczgzaG9QaWlBcmk0NzIzdEFN?=
 =?utf-8?B?dUpUc01ZSGJkSWNYN1lqK3JYTG10V2ZpUU9ZWWlSTkN5OW54OFA2bThXaWQx?=
 =?utf-8?B?NWg0OENudmZUMHZYTU5tWXBYaXlMU3hwcERnNDR3QnBGb3VrZzlzbWtwS2Vl?=
 =?utf-8?B?MGx3VVZYeWhqRGFTZDJ6ODJSbUNEQVJOdzZOK1dqK2poU3pWQVhTQm50NERG?=
 =?utf-8?B?Z0Rza2JhUUg1N2xISmdnVFMrUHB2d1FjalJGbHk3dHp1Z240dlNFcDYwb294?=
 =?utf-8?B?K1dxcmF6aUNENlA5U3RzemJNYkh2YStlcVNkVjFNeU1XUzBOVE93UU5XcG5O?=
 =?utf-8?B?YTNPL2Nld2U3dk5pQUg0U3dTZ041SlUzZXdNbFN0bFVlQ3I4Q0dFTU9HWjcw?=
 =?utf-8?B?VTRLV3I0VzRaY0J5emhwdlUwYjNNTmEwd0pCeGhkU3pOVmpKTlM1anVvUkdi?=
 =?utf-8?B?UzNySy9YVThBekhRd3FxdEVmZnpLc09mMUNNc0JtVmJDMC9yV01oNXdXSzRP?=
 =?utf-8?B?Y0hIVzlrYk9yUzlkNkNOUFFVeS9WcExIYlh1M3ozcldOaWxpMkpiYkJhNjBx?=
 =?utf-8?B?UEZpeUttNnFzaGExdmhpUkFiZUdGMGxXdURoUGo5NGdHWHpxd3VGNFZ1dHpq?=
 =?utf-8?B?V1o1SlVUOUk0dW4xZ0xUa0gwbE5KLytpY2RRTjI2eUtyYUhpNy93SFloUEU5?=
 =?utf-8?B?NWFOdUNsRFRicHUvMjNjT21SemhBdlBFTDh1QmpSZzBpdVV3dDhkc0pVWU8x?=
 =?utf-8?B?TFVFZGFObmxUalNtZ2RLM24vd1pmMk41N0Vrb1JKNko1YVpDWmlFVTgxNjk0?=
 =?utf-8?B?enM3VUVKajF0WXE4UmN0M0F5UUZnaHBzZERFSkNjT0wwZnZNSTNQSTRwTmZY?=
 =?utf-8?B?SUIvd3ZPOUlaNWhqaHpha3hBbDRDOFo2VnRxd1JHaXJyM3NHRUxKYlRMWVI5?=
 =?utf-8?B?dTdIamI1Y3dxckltL09xVFNtOWE5YjVKekxKc2ROeVQyd0hOaG9IZ282OTVL?=
 =?utf-8?B?R0p1dEtwWnhRdVhZUndyVHVkajJVRnJsMWFQdGR4N2VkeXVCOHpCcVJHMjBx?=
 =?utf-8?B?UHVFaVlGWGhrVkZ2WFdtSkpvaTA0QlFEM1Y5RVdNNk0yZng5bkE3anZBampp?=
 =?utf-8?B?Q2VCeVlKby9mM0FHZEJGZnNpbFc0NW9IQS9oejk5djlMc21LanRtQlZYZENs?=
 =?utf-8?B?NEdPL2FKckprSDFrVkREeVlHRmlzUjJMUHRCRXFPN0pkUjVScEdWUWtXSFZZ?=
 =?utf-8?B?UDY1TjVOQmZBSFU5ZnY2eEdpSTF2d2xpUC9YU1J6aXhNTUFubElGUHgwSzBw?=
 =?utf-8?B?c1gzcUlkcXBQR3k2NCtFQ0ljOU13RlhCN1JpS0RKQUgreWZvVEU4bFNPRUJx?=
 =?utf-8?B?NitIeWhTenU3VzB3VnpOc2VNL2pMWlhjeFdWM3g2OURXQUNwbUlZQlJOQ0NP?=
 =?utf-8?B?S1NnNU1HQ3F2OEo0cE81cDEwWGpuckRQU1poSVBjdUJpZVA5RDVaQjdKa1NK?=
 =?utf-8?B?aUYvczkrOG9Hb0U3MHhTdVF1a2VPWmxpS3dieGJCN000cWhEM1cwUTdmajlD?=
 =?utf-8?B?NWtXUGh2S0dWeHVLaGZwUkRPVEEvQVNURFZObE02YUdzS1o2Z0VPa1BqM0ps?=
 =?utf-8?B?TEx6dVRTMEMzdXBQTnlYYmRja01XMkU0VTBLV2pMdUR4NThDMlJRbHg0bUt3?=
 =?utf-8?B?Vk40eHAvbDdXaGlyY2IwNm5yamxqdjZSdk50VURrTTRTZXA3Y0Z1QXRDTUkz?=
 =?utf-8?B?NUUrdVQvVzlXeTd3TEE0WmdVUGpnRmkxUkcyclY5Q2E3UyttWVp6aVRWTHZZ?=
 =?utf-8?B?MTN5bkZzczUyN2haZVNQZjVWYm5RdkYrL1pUU3krVkVMandCejJaY1RzQm55?=
 =?utf-8?B?RnFrRWVtTGNjQnQ4S3NrdE5kbmJnSE14MTZKV20xdHVZeExLSkV2OW9EU2lj?=
 =?utf-8?B?SHErYnViRFZHWk4wT3hYOTAvTWJpN1MzMGpsNEljMXNDZU8rL3dNdS9IYzZs?=
 =?utf-8?B?R01JbFg5aXMvaWw4bzlJOUVkbEhWZU8xVVphZklycEc4NzF2d2ZwcVRaY2NM?=
 =?utf-8?B?OVQrVHpWYlRydHZXZlhPemxQQkxhQnEwV0hoSWF3WkFkUmhJUHlacVpVTjZq?=
 =?utf-8?Q?wcDg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Smx3N2JqUjlGVHhkSUVTKys3c0c5eFM5N01pS1hFd1dQaGdoRk96V2FzVUFr?=
 =?utf-8?B?dVExQXpxdE9sZFJIeGEwbEVNSG5JNEY5K3Yvd1dFekZNYVhaOTVsQ0VoTytk?=
 =?utf-8?B?R2RQdmlkL1ZJNE1RdFhyV1cwTmpsRVBOT2pHZ0JOWENBVW50VjlEc2wwdVAv?=
 =?utf-8?B?cnUvREEvUmhPRTZPNStEbmV4b0lpMWFYLzB5bWUyTjQyWkNzSEtyTjROc3V4?=
 =?utf-8?B?R3pvVjBjbUpMS0NIbkphNjB0bm1GK08vTktBd25FaXFOTnRiNjJTS29KR2RL?=
 =?utf-8?B?alVETGNGL2NDN3krVTBvQitpUE1PMy9qbFo0N0xycmxKanZLMy8yMFhWVjJM?=
 =?utf-8?B?R0I3cG5ZZDA3WkdZd3E4RjROU3hZQS9lNEkweGp0MG82b2lvTnZYYStRUENH?=
 =?utf-8?B?UmIxeTYxbGk0MVVtOTgzTXZLZThVN3ZFdndlNXhwWkRPcERQRzZ2TlFXL3FZ?=
 =?utf-8?B?aXF6elpaNEU2eHcyYktrK0ZDSy92eXdtcWVNRTl5RXVBRW9CLzBxR0hLZ2Rm?=
 =?utf-8?B?VmlQS0piMXRscGdpS3hqemczV1BKMWVsaUx3MzZlQ0wwVjJsQ0lCWFlWd1g1?=
 =?utf-8?B?ZFhSeUZtWTdPbWdtTlhMZDVrYmdxbGVsell2Y1R3MFFhSC83Z2ZZZDJiTXlI?=
 =?utf-8?B?L0xmTndVYStHbW5QU29QM0pZZ2pNRUpLZnNmSTRWd0NOeCtOczc4R0V1bENq?=
 =?utf-8?B?Y2prdTZ6TkgvaHpUT1MxWUFzVEZUNndsUjl6ZlBWOXE2K0Q3YWpoLzgvRUdO?=
 =?utf-8?B?Q3NsK3Q4UHI5RDY5bU1kSGlxL2FRSXhUekRKamJXMDhJbDJGMzdzejYxWlhE?=
 =?utf-8?B?OE1aQk1xeUVNVGErOUpIL0dDZ2hvM1JXNjg5bG91TTYySXo3c2NqSXFHOTlI?=
 =?utf-8?B?QWJKQjVCblBJVlp3VmRyUVFvYjlGSWNjckZpUVhXWjdBbTFuMXN3OHZSUDA0?=
 =?utf-8?B?aHlobU8ydWJuN01lMk1IQXI2ZWNqaVhRSWRnQVhHSjlqS2NhMS9WQkZ0UFBD?=
 =?utf-8?B?ZktxSWhWQ0EzNjFlc1AxWElpUHRHZXVtMmxVbEFWeDI5QXpDRmNmVXBMOVBF?=
 =?utf-8?B?Rk9OTHdHbGR2WlRyQ0ZMY01uUTIxZ1lQZDRXY3I5T3B5dFpMSzZTMjN0MkxS?=
 =?utf-8?B?QUw1MzRlc2QrT2cvd1BqS2diRlhoNFMySy9zQjUzKzhJYXlXdUhkbVF1dkUr?=
 =?utf-8?B?RmFZWWkxME5nSTBpUGhEVkYrZ1NJUno2a3JuMkJuY3VRSGNHZlY0RFFQdzBY?=
 =?utf-8?B?MnlvMkE1MVNlU1ZyWHZKQzdWTzVob1JaVXdSMlNkalA1VEFLajc2US9LS29h?=
 =?utf-8?B?dnZTNURGU1poSDFmOXNSblZQL0h0Rkd4UjNIbis0Q3QzRGRyNFdiK1hLQ0FH?=
 =?utf-8?B?bmJCM3V5NzlFODVmRHI5d3lBeGppdTJ2ZXJHUWd1aXY2aGtrbDQ0RjRpaUx3?=
 =?utf-8?B?d0VlcjVzUXBtV21DK0NSZi9jZFVmVjNVWUUyMVFMcmpLcGF2UE1ISW9wKzBB?=
 =?utf-8?B?WUlJOVNCU1BYY1dNV0lRVlFoaVNsalhYWnhkWFZCekNRanVVNi9zQ0JnQXRj?=
 =?utf-8?B?aUpXRTRqckc1L01ZbUxXVzhTc0FjVmg5Z1Q1ZjFTeVVJaWM2b01BdCtXTVBD?=
 =?utf-8?B?VkhkSkJqNWxlQmxYWUFxWGhESWlZcEpSenFNY0RKKzQrSzFjK1BQNnVKRVRh?=
 =?utf-8?B?b1h2MFNJbHZkNWxGQVcvenFJZ3RIVm9EdjNRV3pZeUE5NDRhdCtQUldlZDBG?=
 =?utf-8?B?S3RxQnl0Vm1qMlZ6NUR4TmYyclZlZXN1UDJnUzJOTzlDTzcxbjlFSEFQOGJS?=
 =?utf-8?B?eEI3MEJmdFExRDI0OXVOVGdXSHYyNzFjN1lacWFrcVlHQ3pRcTZkMHkzNGdn?=
 =?utf-8?B?cHYrY1ZuM0lVQkp1bG96QXRidGxTRXV4UGIxT2FUNUx3NHdHaGRmdHlsbFJw?=
 =?utf-8?B?UUtmUmtwcVZYdHYycS9mamtaaGVuQVRQd1lJalVVTllGWXdHZXhXK2VMNWsz?=
 =?utf-8?B?bnE1U1M4WkJId1hmM0p0Y2JwYm8ybi9Bdi95ZDRhRldYQVd0a21XaVI1TCtL?=
 =?utf-8?B?cldMZjFBUjZ4TVE3Ny9TSjdGekd0Rmp3ZkZVNFgzbzZ1UVJlOTFYY2FicWFk?=
 =?utf-8?B?cmgxTElCRTFNTGhreGpVS3l1VnB5ejY3UGxPa2hjcm9iTXVRbVFjQjY3QUtT?=
 =?utf-8?B?UUh1c0hHZWhha1JIWFR1SWRjYkVKYzhYQVQxNnBzVldmZGFoalhpeG5oNjJr?=
 =?utf-8?B?T2l5aGNtaHkrLytVMVBEZ3ZYcVRyeDR3WTEwRm1HcklBQnR1U21KQVB2ZUdN?=
 =?utf-8?B?TEtoaWRqdHg1RWNwMXk2Z0hzUFZrVVdoVkZZWDZxcFg5dWJUbXVsQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17a06bed-69e9-419f-df3e-08de70ccc314
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 22:09:48.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4fLsGh/J5KL2J2x5mXL19Q90amkG8becfniqK5nQMWb9B6UxFsbztb0s2kGltNjiwelKFuCNW7AkvfEPfuRCZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410
Message-ID-Hash: ZWCBZHARXBVRLHE6H5D3L2OYMMYN7ZOZ
X-Message-ID-Hash: ZWCBZHARXBVRLHE6H5D3L2OYMMYN7ZOZ
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZWCBZHARXBVRLHE6H5D3L2OYMMYN7ZOZ/>
Archived-At: 
 <https://lore.freedesktop.org/815915fb-f4cd-437a-b5dc-b8b7ae8618f7@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/19/26 1:01 AM, Miguel Ojeda wrote:
> On Thu, Feb 19, 2026 at 4:02 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> That doesn't compile on rustc 1.78.0:
>>
>> error[E0658]: inline-const is experimental
>>    --> drivers/gpu/nova-core/num.rs:225:5
>>     |
>> 225 |     const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>>     |     ^^^^^
>>     |
>>     = note: see issue #76001 <https://github.com/rust-lang/rust/issues/76001> for more information
>>     = help: add `#![feature(inline_const)]` to the crate attributes to enable
>>     = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
>>
>> error: aborting due to 1 previous error
>>
>> For more information about this error, try `rustc --explain E0658`.
> 
> Please feel free to add `inline_const` to `rust_allowed_features` in
> `scripts/Makefile.build`.
> 

OK, then! Done in v5.

thanks,
-- 
John Hubbard

> We are going to do it here:
> 
>   https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> 
> Cheers,
> Miguel


