Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCD8D58E62
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA0D10E43C;
	Mon,  2 Mar 2026 05:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XqsjS/dn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31D8B44D46;
	Mon,  2 Mar 2026 05:21:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772428877;
 b=dSoaBX4Qzddn8gpsDLVvFZMRmy3ujDWSqDEzcPAy/Lj+0wfx2d0jaYKAPg9uUDNmWYNFQ
 J8Zdh9eExLCA5mC83BUKhBif1uYu4oBMOPoUQNbHAylLMny+Pv5d/ratu7lSz2FtolYg7Vo
 92oe6hDnC05k9NweD4gr0/EgXmbUI04UFo1z3TtDbDnJRFLWrNAD9l6uTJ/RdtBRr9FgmAb
 cXHAXPnig/cOM5VSGvaYhauEfORywQp+CWMgKkPJ1D5O/ZMdcMdG8HGIFvMMUzn8pGZ1Ff5
 T89J2T8nOexP0IBSAMns49wrpGMB+L3onmwQFWq49LJwVzboQjAHvBs1ZytQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772428877; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TrYeMeZshmanm8telUVZ6vhTTppWEcIJA1jiY0BQrMY=;
 b=W8FA5srAgAUDiANLI6ewfFtEUPtvh6Ht3aVDYcKM35FTIftcW6gnkVa0V4AF8P+MzCYNH
 Xr0tjwJ75TFf5i2QfJMENpwKGE/F/sPpk6gx5Z1IsV73WIuOtmDJ/QYaGXf9ZgmfhAOTbTV
 V9u2kPvv5Vs/ZPXBxXaC9srhJHOPt5lpgm6lDUQCLermXkLRVpIF8Q4m266w9MqqX1d6a24
 IrRcJ8weJqObVzW9M1vhmBjuRhoFAN4lMllLiiEDIVjRdiT7Hjl25Jhfv/A6gj/Hxk82Iaq
 hLczQ1zkgl5Gqv/wuoSsc3e/AxImLKgIxwXDe2s82T2wY3ZDM139qFcHsOrw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E4194032A
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 05:21:14 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBFC610E436;
	Mon,  2 Mar 2026 05:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wqs11U29SXWPdIHZAjwfR7MGBHOwe5b1bDiNO/c++9f0EckuhUEUHqbL8hwrL1XZMWPes8FR0uvuDeA3H6n1doYC5x6AdnVoYOAI4VuncDMsBSCBkmronTY1DgXjp2XUIvM/7SgKc+DfVIrysxc4U+A0SwBk6IoWn9SH3Vhowu/o/GzDvYJDb/TQf7teUVAOZcFb3hQCeTIIY8aGVrEVh6Kxea6KcaW9cIyQx8pJr1cf0P51nLDQD72lsl+Gx4cs+89cn+XFe5Dqp7Y/fwinPjJkzjd2HEjeBLGUA9gXXA293P1E5UyurnPA4mumVx1mefucgS7ZNhgpUenDgLH4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrYeMeZshmanm8telUVZ6vhTTppWEcIJA1jiY0BQrMY=;
 b=PFNziLTDMDbe+KWdBuhHcTMww2E7KvW9gopp5RxwIAmaKka4nqIFB7iZIdefcff61nmYvAWA9z6nQ4eoJQjb4uQs5MxHHiiiHGSMytLcVkH1AbAS1bMD+JFNcJCHLyCqtA27m8cYoVtBbZvVn7ildD58ECiyLte21Rce18ZRG3X7nuUt5CLb+jrnkH2lR6rrwah/uL+6mSoPbyxxKdWl7/Kdy3TfBExQF+sOQQhp2mVn+xenLQ/JM3FNyE991EYn2QvOxZMOZrf9Xwn/l1b3fTRc9y6A7uHVfSvbWc9MRuTC3Ox2Su+vaTVFlBaLeY+6uDXqbD5QxNREHkU2njJkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrYeMeZshmanm8telUVZ6vhTTppWEcIJA1jiY0BQrMY=;
 b=XqsjS/dnSJWbrcCyLXhZcX1v9u5oocJ5PvP+ZnHL++TKH7nfNCSTXprevkMHu5CiYCKcbeV/4OHfetTL2FUd5JcueWuAG/62O/SVf6rOqAX/XUXNNIvtnz49ox0dWu+c4gIJ2kx76RSKUnIGA94hGMam+Tcgx6S1La/8hN5yyJt0VF/a21uVmDdpfBIEK12pGDnMDKVvNlnneIfcJRhzN4rNE4bra0kr38bzs1Z9gvJsjbtSiybMGcKIf25bzCVNeqg8G2ucjWdVHBRXR7NTVfKxONThgOUwC9PyiEiY4gN+rodDctF002w+VOBMxfKpVgje48LhF14PBsnMADeCVg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 05:31:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 05:31:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:31:19 +0900
Message-Id: <DGS1TA9DD6NA.J65LE8NUKC65@nvidia.com>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
 <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
 <0f53c0e3-e745-48d9-9576-ce8402b7593d@nvidia.com>
 <DGS0S6OL804P.3FS5NGQE1CWH5@nvidia.com>
In-Reply-To: <DGS0S6OL804P.3FS5NGQE1CWH5@nvidia.com>
X-ClientProxiedBy: TYCP286CA0319.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ab10d7-d3c5-40d2-a73c-08de781cf0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	LyCyBRNhEKZgPFgYcUWRLl5dQj5kZvpYJMurGYEUSL4aw5PCK/t+ddkcfZL7f8O58WfXk4OU4w5Mo8ATtXXkSboQJB74+pNs+3T4UdQuoOUnDH+4Fsd+0Dxv1e0LHAF3qoLjuGQSHSIUw+6sydm7fSOpp26LEkA8JhT0DvnnrAuhRAuOjqFg/Z2EvGcrlwks/C4TZfMffIYytfz915a/mnGcEpqH41Z33NnVAFtMICIRf7mw3Wzc/LMKxkcNpEIP6QGX9AjzTZU/E6OytdOEsQtRaHXdZsoIdJI5oZjAY0kY5BmYCa0LZQQCBVF80Qa5diXhDXch8eDxj+OWfSbssFXzuUwmCnF7m/Vky9yY4yxMA/vFsDf1yBAsg7bwMIwSEHcsLLzdVZY7MSRhwMviKzW35K8x2w5Q7kpoDVgxea9MS8BgPZ1Wsw0VPbfgsOI90wQoGQNC5RgikpbBaWkgsdsRYD12O4isZNsTq11olXDzt00fdKX0ZlTPe/6cUq8JYXStEbF/0ztn9iNGO3oAkHPV6ZL/pJYs9vuH7yiiRIc3RM1Mua3U4z66RaoRSlloTYekN988XhD5b2if4p6QsH1dcNjZUBeGr26cJXTQ+dd7/lbb+GXCyZqY33aBObvZLHoj7LFQaEPktdEHfk5Gt3aMnVEeWWg2mZopB8SgG2qgbXF3H3/gbLfXAGowoEhglufxFiu87IMuOTfEXkvslO3vqxTkh3Wm/tCzGbmHUok=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmZHeGtSTC9Bd3pkRUs4SjlPMVBlSlltUHNsNE43WnJYNkRTMTBNS1hqc0Nz?=
 =?utf-8?B?STVpR3lPdVRTSXZiMStFRFBweCt1SU5EdDV0VmhDdXpSdjVQK0VuVHltZ2tE?=
 =?utf-8?B?THRUTTZFRUt2MjNnbFBOTmJwYjk0VnRSSUhiYk5WT3NCK3NZWTY5b3R5eEx4?=
 =?utf-8?B?OGNCZ3d5VTc4dWEzdmlPZldEcjdHbDUzcXAwVjZoSWk3OE9ac3VsVVRPZnJM?=
 =?utf-8?B?d0YyMHFtL2VvV0xJQlpCQjFiYVNXYzVrUlFHUEZtZ3EzUjR4ZUhDZVQ4Lzhk?=
 =?utf-8?B?NlhYVmQ5cTdXWUxTV1pVZ1hCL0ZiNTdWVktIZnR6ZkVhZ05aNDJwc1BYeUdq?=
 =?utf-8?B?RXJkWjMxcDV1ZnNuTjdlMnpSbnIzNVhTcml2em9nSmt2a0NwQ0JKTDY0MUo5?=
 =?utf-8?B?b2VneHA4RFFnRjZub3RGQnpYYW5rdkJCbmhoWWo4Z3g2MUtDRFFRZ3p1YjNh?=
 =?utf-8?B?R3ZJS1pwZ2dEaXFxbzJ2OE53eGFMRnNybWM1N3lEbVFzRG94NjkvalMvcEdv?=
 =?utf-8?B?RTl5UXhKQ1pRWTN1UGdaU3BSVFNMeU5nU1NxNCtPSUlYQnM1eElZUEhaUXdD?=
 =?utf-8?B?bmJKU2hUWkkxRk1CMmJwQ0lFOXZwcVRjcFVXczc3aUhXQm1XMG81TGlOUjhl?=
 =?utf-8?B?bHVNaWVrVjZmblUzQ1ovQW5FRTVoQ2Vnc2lKSkpUQWpPZ2libnRCc3EvblM3?=
 =?utf-8?B?UkN3MlFOaGZBZlFjRGFLeHZ3RXY2R3BWeU8ySnV4eFRpbXJyeDNja1V1S0x5?=
 =?utf-8?B?OWpqRk5CeEdkM0RpSGpKOHBrekVYS0hxaENBcDJoaUQ3SktqSU5qM09NM3R0?=
 =?utf-8?B?MTRzZkVmZGlSdnFxWlN5eEovemJWaEZNc2ZrNUhiRDhIWGFmQVFmakJrVnE5?=
 =?utf-8?B?ejRPSE81Z2hEdnMzV3hZU3FkMXNJc2Q5T0RSMFlaWlJ5SmpRNzN6MngrM2tt?=
 =?utf-8?B?N0pMUWZXdjR0Qmt2TGtMc2xTMDUxWVI2KzEzd0YxcEFod0F3TmRiNXBvMldp?=
 =?utf-8?B?ZHdBUnpFQm56Wm9sY1V2SjlNSWlJOTF0ZWNSanZlT3pOc3cydGQwVVhqVk1s?=
 =?utf-8?B?MTg5ekoyeHVuRXNDdERkWXUxbXJhUjJIeThHOWJ0eWowZno0eEt5UmZhQXE3?=
 =?utf-8?B?Q3pyS1gvS1oxU0czWEs1YzlIU0t4MHhXR1VIVGJ2NmFnaVhuSGE1eEdWcHRC?=
 =?utf-8?B?dnpSSlhwamo5UE9MMWdjZktsUEREbysyNExYNkVxeSs3QUJjOVZYMlVFeXRP?=
 =?utf-8?B?UDlpTmdnMUh3aXdBdWhtaFRTUW9EU2psKzZNTm9majgzd0lEY0pxTTJiY0dC?=
 =?utf-8?B?elJtVDh5SWVXYzVxZ1NjQytxM0xjSzNBa1dTYlFlYWVkb2FxcXpTak12VFpO?=
 =?utf-8?B?VEpXdkE4eXVwUWVqQVNacTcvd0VEQnRLaUxHcXowZmx2SzNockV3KzVuQ1NG?=
 =?utf-8?B?Ylh0YmdzMklybVl1TEpjYWRxcWZKUko4MTlPTVVRaW8vZ3QyUHR1bXVZY3JD?=
 =?utf-8?B?TkFtaE5XSHI3UmxWMkh4ZWoxVmJpNitxakZhWEZYQTVISGx3Z1JiT08va0ZD?=
 =?utf-8?B?WEEzU0FxS3BQZCtmN2IzOWg3UERONEpzUHBwNFlINE5pWUQxa3ZTbEc0VGJH?=
 =?utf-8?B?Tm9RbUVmWUxVTy9pS0lta2wzRHBvN3g0eXlsNElHMFBlYTE2Wit4N1BpZXM1?=
 =?utf-8?B?SHNJYndFUzI2bCsvazk3QzRsdkUxQnQ3b2RsTnhCRlN0cGQzRzF2aXdDVWty?=
 =?utf-8?B?c3RTczl6MmZhZkN1d0k5VjJPV0ZZTDUwb0cyY3JUTXhxcy9oUkdMbkIvMi9u?=
 =?utf-8?B?M2dmQmNSYmVQWW9WRExIUW5OSzhkOUxLRGpZdU1CSHh1aVdVMlJMVGsza2VQ?=
 =?utf-8?B?eWJFR3pLeERPTzhLd0ZiMlR2L01zSGlycGVDb2Jtd0N6SkhrVkZZMjRIdUxN?=
 =?utf-8?B?Y3daSzY5cHIwTGQrN0JsbFlEZmxRUTRSc3I4am4wNlo5VzVDVC96R2JrVDBC?=
 =?utf-8?B?N0diOTkwbStON1djaFh4Mm5EeGUxbVp5UFAwWmtnNS90M0JJcFlXbjJWdFZn?=
 =?utf-8?B?dHFmbnE4NTE4TDcwdUFHMTVKZDBuTTBUb3NROGE5QXRZb0hDaW50cmlyV256?=
 =?utf-8?B?OGpCelFVS202aVY3M1QwVVpQZ3RBNTJXWWxHNHNHOXBaRVEwSFlxaUVkRXd0?=
 =?utf-8?B?eVpjZGlIQmk0YVo3YUJUejltSXlGNU1QQTdtODF3SmtINlFoRFFGMWtFakcr?=
 =?utf-8?B?SUZKdGp1UFRYSU1pQlBmQVE0bWJONFRCL3Jzbm1GdERNb3BmajE5YUJOTGtQ?=
 =?utf-8?B?dFB1WFliMkp0YjdXRm9BREdvM3NUUDBXQWxYbkRzbU42TEVHRzhHTjNvT2Qr?=
 =?utf-8?Q?cIBQrRGiXHeOn95Uls01Z5iJb6kZSs8JbYRcajppU7pIb?=
X-MS-Exchange-AntiSpam-MessageData-1: +0Y6h0P1VFaXuQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6ab10d7-d3c5-40d2-a73c-08de781cf0d4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 05:31:22.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vJbx8K8FkIIVOoJ+hzDh8wNmuSSWcd29waBtDKnxliu9REG/Fbs6H5do372zWjRjsrpM8s/vb8ig3U8MNnmPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482
Message-ID-Hash: 6HOQZ6VSWOWZTBDEMINO4AYRQDS4HM3B
X-Message-ID-Hash: 6HOQZ6VSWOWZTBDEMINO4AYRQDS4HM3B
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6HOQZ6VSWOWZTBDEMINO4AYRQDS4HM3B/>
Archived-At: 
 <https://lore.freedesktop.org/DGS1TA9DD6NA.J65LE8NUKC65@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 2, 2026 at 1:42 PM JST, Eliot Courtney wrote:
> On Mon Mar 2, 2026 at 12:08 PM JST, John Hubbard wrote:
>> On 3/1/26 7:03 PM, Alexandre Courbot wrote:
>>> On Mon Mar 2, 2026 at 11:22 AM JST, Eliot Courtney wrote:
>>>> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>>>>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>>>>> Add sync and async command queue API and the type infrastructure to =
know
>>>>>> what reply is expected from each `CommandToGsp`.
>> ...
>>>> For lack of a better idea  i suggest send_and_wait_for_reply +
>>>> send_no_reply for now.
>>>=20
>>> One important detail IMHO is that the API cannot be misused, i.e. you
>>> cannot call the fire-and-forget send method on a command that expects a
>>> reply. So the risk is mostly when adding support for a new command - bu=
t
>>> if that step is done properly, users will be directed to the right
>>> method by the compiler.
>>
>> Naming is not *just* about risk of someone misusing it. It's about
>> being able to read things on the screen and having a good chance of
>> understanding it.
>>
>>>=20
>>> This, I think, allows us to tolerate more ambiguity in the method names=
,
>>> as long as their documentation makes up for it. We all agree that
>>
>> Really, no. Let's do our best on naming, *in addition* to the documentat=
ion
>> and having Rust help lock things down.
>
> I personally agree with this take, and if it takes a verbose name to
> make it clear then I feel it's unfortunate but there's no way around it.
> Especially since we have a few different concepts to distinguish between.
>
> Agreed that we are safe writing it since the type system will help us
> though. So mainly just optimising on how easy it is to read.
>
> At least the current usages don't seem to end up on long lines, so I
> don't think it will introduce too much noise to have the function names
> be a bit longer.

Alright, we're still far from things like
rmDeviceGpuLocksReleaseAndThreadStateFreeDeferredIntHandlerOptimized()
(not making this up) so I guess we can afford some extra clarity in our
method names. :)
