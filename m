Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13BAE9A049
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 03:23:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8096A10E554;
	Wed, 18 Feb 2026 03:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nwcMRp6O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 71A21433A9;
	Wed, 18 Feb 2026 03:13:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771384418;
 b=JPYf6rUvrdgwTYHcdM5rr3p3zLe/R6FAXYoZcS2no+77Y+YRwnFah71TkR5+Z9PIbwNeb
 /bK6RVYE+3tJyOppuC9ft1261EsEaTQfuLIWiH2iIk3q4PMmT60CjChmjwDwZe+P6Rkmw5P
 ja1Q5XwPLCXRqmyVGg52p5eUbKEh7VzFOK3v8Em+K5Hw9zJwsQ+yTPIiBkTwiyqRRDHoLZU
 Xs2Kjbn+n5wp1Z25yTnqzHnrlf8egRwuee8FasJcaHtBT82hjoRnDt+B/QB82sF5Ob49yUu
 zZ4fayMTEvRxlqbDjAmEjjlGbpCsnUgYNcpzr6xS6NS9E7udLQLelUi9RTow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771384418; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lpUKtEOE8G/AKpEt14VTvgTbfYEyFFANfSrkwG9FRUc=;
 b=jc8aWxy/1wg5xAR9szRyN1Awck/Ko4AQrghe4+69CwXVfAnsLjUAgRxD+DlnUTk7rpuHK
 O/P0UGeiEQ3K7Wdzm8+HyGQr50iSh25T9dqCj61iUYy8j2dSqxesWXZccvr/zB7ZtRKF3eR
 tvX7JE+ylI0IoPUxOsrrFgGkB+CbuTJugteC5Kp+qRbKLrrx2+pwDbBkQ7MEeApzfG59zEo
 sINuneCUxdrkao+J/l1aZoI3QaAUeiodZHAybPw3pjvEZA6gtyqMvL3iIQTDnEmXfKfZjwK
 LlUuh2YexV1uyXfGD5eZyXhq1Zio4osNMhfJ8cOSNdWei4DpsSROF95JgOEA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 791E540042
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 03:13:35 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41D9010E223;
	Wed, 18 Feb 2026 03:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4CKbW0+dCvKYxdZghXwOga9RVVkdYyx/gJ7Sme81KDPiGcHXUQpbgTGZc/JRmcOPaMI9jBApHXrccdsZp7iDukrezAHBFiorSblXgDOS1duZHYKYwXj0xQKLhDAwEkAgCnlHt2TqqMLTe2gzPoc+yUgaalraU3qg3CDhJU1gA+/1s0gOq667rIMuJUYHOCUbWrkqDiwiYkexxW5peasGj3MyN3wjrOM6BV75P0OD0XfPE+vYtbyXUxlWHOtMl91vLA7NASG7r0+lFDARNZkmLFUu5+DHqYWVoiPmxHOsS8oic3DPPrkhgzWLrMFODffVBled83NgtPMEl2Ct7V5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpUKtEOE8G/AKpEt14VTvgTbfYEyFFANfSrkwG9FRUc=;
 b=mkz5LrVsUjsb48rLLj7mInj7c6o4W+MpvZ/uP0WfOpMaU4fA0ystleIecmXvggRDNf03AJfOrxcAqW38LD7064s/yVQodZjxHuRoy2X4JIioxP+Q74fSGNgCuZtmMzWX5jzLK6D36VBfTqUFKhgtiR+abdPpQaPgNWZljRy5NMdSy/FVBLveTUYwBBXMZnxmPakc4SfqE5Tr6gGI+mBhoDFOZtX1HKTfmkWuIs4Rb87X8EAs7Uw240T9Bgf2tR6EwLdIjXYDkSTeI/GaahdFUJ5/lRlRf/Rc8cQhdLjTIHUK6Z3sEhFh++830agCfrKnFVwLPBXzfvRmUP3CwEaCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpUKtEOE8G/AKpEt14VTvgTbfYEyFFANfSrkwG9FRUc=;
 b=nwcMRp6OYgHLQlsI/I1M8+U4XpXVb1ksB9GGx99se4WKL1cn6WpDtuh9A62SuoQkxlERr0re/39t48W3gRPtIYmSES98AvKOAvGbG2U6XZ40ae8/Kpdjk6QhWpuZUY6ynH/luYX9eKQxgfAtguPlAs3D8gGU5cixuqcuiqPJs5I+Nww/n0BgS+Bopp46mjJvuoqZqNclZ1yJnQU6ejfsYS1VZkz8AaD55bkX07Hxsidvw8DMW8ssjUSOk11w+8kAh1aCIPv3ZExGHbeO7B1mh62TqJzI3IQ6/3Y22MvCwUaEMW7ItI0YabchsBOTDr0mbtFNZkmMfraUuhJ5lelRlg==
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 03:23:17 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 03:23:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 12:23:13 +0900
Message-Id: <DGHRKO26RWX3.12AQHBX801G0T@nvidia.com>
Subject: Re: [PATCH 3/7] gpu: nova-core: gsp: add checking oversized
 commands
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-3-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-3-73079ded55e6@nvidia.com>
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 086c4d06-6ee8-4713-0650-08de6e9d0eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmJ5RFNoZHBhdVNvM1ZpbnFIbGRuNWNhY0ZEYXJnaEpPQ1YzOTNEcElTTU1u?=
 =?utf-8?B?SlhiN2kwMlFqNnBQand4MCtwbTZ5aktCeERESXZxOHUzNUwvYjFFajNGQ1Fr?=
 =?utf-8?B?aDg0UzY1MnZOOHR4YUNQNDg5N3VMRTgza0traFlPNHdyUDF2cmtQMFFlMFIz?=
 =?utf-8?B?dUpiQmJlMVprRlBjOVlFNml1cE55RGdQYXdnOWJJWGNVdm5ZcW12MVRLVkdv?=
 =?utf-8?B?dWgvQ2kyVitpN1R5ZWh1ckhiWFg1cWtnUmZxN0tMak41UVVzaENpbG1MWEhS?=
 =?utf-8?B?NmpieGgreVFJc1FpSVRNUUs2a3gyNnFDWTd2MHFZV0d3VDFGOHpOOHRBZ0c5?=
 =?utf-8?B?NGtUNjVBOVJZWHhaSGVpUEpvVGxvMXJYcmJISnlzNjN5bTk2ZTJXSTJmWXI5?=
 =?utf-8?B?YTdwQUlHSmIxTzZzMzQwTzNCVkNCZ202dkFZSXNEaDUrcmcxZnltdWtBUzVB?=
 =?utf-8?B?K3ZDREkzb3FqVGEzSTE2K0ZwNEFzZjF3K1EzTzZsZWlmM09iTHI2VFNyN243?=
 =?utf-8?B?TmFzTGVabmRHeGdWelN1eXZpQmNGd1FOY05qT0VnUi83UVIwSUxKVEQyV2dV?=
 =?utf-8?B?WnFuQ0l2R0pLYlRFL0k0VzNLcFV2ZU1mRkJObk9aaFJSazZoYm1GSmVWY2Z5?=
 =?utf-8?B?ZTdCUEtqSkRET2pJQll4Z0FYQ1RxcXFUWU5yNVJtRlJwVUgzdXkrRG8vRlJw?=
 =?utf-8?B?ZGVtUWcyMXc5SlBDWGxKMjdBQ2lyRTFDQmlFVTdoYStXMmQzU2RRODJtSDFZ?=
 =?utf-8?B?YXpFQmRORTFSSXV3MGFpL0Z0UW4rZGQ1dG5tZzVjU3FPU0tNUmRwQzlxRVBN?=
 =?utf-8?B?M1pPS1FCN1J2U1hvcURvZG9hdWg3RnhqZ2tTSWVaRnpLYXl0VHJWdlBsYU1r?=
 =?utf-8?B?QkMwNCsvQ0ppS3pUMVVKYmYvY1IrQmt6S3BUMTZGVlZ4MWJNelNpMkQxdFJT?=
 =?utf-8?B?RDZqeWVmN3MyaWVCOTdHMlJyakRhQ2t4M1FYSi9UN2FYcGliZHArNm0zZGlZ?=
 =?utf-8?B?eXljdlRhVFgvL2hNUzZpMGVXTVRGQThvTGVvdHg3ZHorVVlSTE5ZYUhOTzR0?=
 =?utf-8?B?R2FQWUdQT1BFeEdkR1FneHJHOUQ5Q2JBY2YxNmF0cWg4RjFoZ2lYbWNyOFRq?=
 =?utf-8?B?WlFNNGZHVU42eGtKK29iMGdIZXJVM2VPTHVKY3hvT2ZHZk9ma2t4ZDE4U1Jv?=
 =?utf-8?B?Ynh0cFA1S2p4Sjh1ZCtNZ1VCcmd4dldUQURHaG84R1cxU01zL3E2aWl4L0Zp?=
 =?utf-8?B?Zmg5ZEo5N3p1ZndQV2c5VjFSRzNzSk5PUHZ4OTF4dFVDQ3lBKzZaQXVTdlov?=
 =?utf-8?B?MXpDTEZLRFBTNWlyMEhWa3NMTFNNM21sS1QyMWhNZDRKTk1hd1l0bkZCR25T?=
 =?utf-8?B?dXZydmFlek1qT2dVamZFejFiVk9idFNXeHVNVE5BN09xNFBQMXhnZFE3NlVR?=
 =?utf-8?B?cm4zNkx5MjQ2ci9QQkJ6c3lSTFJJc0VtU0h6ckNmT3pDY2ZoRTF6bHpWT01z?=
 =?utf-8?B?b1VVUnlTNmJrZ200WG9PbkJ1QlRCZHZkRXJqUVNZUXpreG9HanIzZ0lPWXFQ?=
 =?utf-8?B?NkFKZjBxY0lQYjFPZVl3TllaWXQ4dEpxVXhuTTRuS0g5OENqalVRY3ZCaktJ?=
 =?utf-8?B?dHpoVjd2Z1pTUHVUTHlLNmVzT0o4cHdCY0RORjBpb2VjaFl5ZnFjcE03RXIv?=
 =?utf-8?B?dVFXMitXUGd5THZhWWJ6d012TCtZWENmMUpMYVp4TFRFeTZFTHJhT2JvRXMw?=
 =?utf-8?B?anJIMjhLdWZwVEFTQ1RQL3RQTENmYVdkNUlWYXdoNjVESkJoa0ZoQUNtaDB5?=
 =?utf-8?B?V1ZpeW0wZ0dYaGtud3djZ1pLS1Z4UWRDL1AyZDhmeUkvRllwOFllbzBvWm9h?=
 =?utf-8?B?ekZpQ0tUMjJOYm0xLzVLcVM4NzMybEpJd3B6N3FQRWh0dEQvbWtibDFodXJG?=
 =?utf-8?B?MCt3YVluNjFjZm9wM0p3SngzTlVuL3d2UGJoQk0rUmRoWFVpNWRGeXE5b2xk?=
 =?utf-8?B?anFvcVFzYzY4bmtseFdOT0lvbmJuQjN5TFQ2aWF0Q1NxREoyVXVtYWs2amdS?=
 =?utf-8?B?blRHMk1GMHJ6Z0htWDFERElXc2daakIzWXlJN05ycldKd2toSkZZQW1hUkJw?=
 =?utf-8?Q?IgRE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YW1GTWhKaDFpaFl5QlUxRUQxbFhNU1g1L01TeHNDaVovMmRmVHNZUFJYdmpY?=
 =?utf-8?B?bDRTZS9lR2VKdU41QjdydXVaS3lLMWNTL1pYZG5TQUhDTVFlakcvU1kzQWll?=
 =?utf-8?B?Si95eENDdDBjQVVwdzNiZTl1SWZlRm9HTk9BTmQ4SWM1Rkk4cHl4UDVlRm9s?=
 =?utf-8?B?VTRRNHg5aVI5czJGM3c3NFlXK2FkLzF2VDBPL1ZyNEVLckVkeUs1RTFtZTNY?=
 =?utf-8?B?eEJjZStuWWJFZ2p6em9mc1lXaHhEZ0M0c01PZ25nRWpheGVBRnpoVDlBMXk3?=
 =?utf-8?B?SjRJeDhpcitqK2ZrcU1vbVhmdFEvWWFrT3BtelBjM3JCM29yWmhvbjlpcExx?=
 =?utf-8?B?bTZVUlRwWVp3SnhFZVB3c2NXN3d4Zm9yTU1TTGsvdjhRdWhHZ2FBMnZtTm5v?=
 =?utf-8?B?K29UN2lLYzhVcDlsRXdRU2ppZ3g3SHlFdS9tbnpYTVN3TVowWmVPQVM0QVBi?=
 =?utf-8?B?dHlXajFMazNTV0tRUVo5VnE5L1ZzeEtrOTVvUHFWMnpqOVlBU2xSOFBIMlJi?=
 =?utf-8?B?akRoNUpqa01aeW93L3hiK3ljaVh5U2VqZnZqbHQrZjhVcVRXZW9RM2poZVRG?=
 =?utf-8?B?amFYS2JJUWhLRkpNMWd5amlvTnB3ZXhJQ3FyOFY4djVWaUV0L2E3QStPL1Y2?=
 =?utf-8?B?c2FERlZBVFBUN3lBTXdQYWVra0xtTTRuWVNWdmpxb1ExTC9qa2NjN3lPUnlw?=
 =?utf-8?B?U24vQVA3Mjdnc0hKQ2o1RVRSbG1YVzd6cVBrYnRTbnRaRG04bmNjNlZQRktv?=
 =?utf-8?B?UjJEYzZkbzJKSmxKSHJRV2RCNEIyajVtS2ZMMytYdGNDeGhWTll1TW9MbktC?=
 =?utf-8?B?Y1RUSFFTOU9lUnpPckx6UG80TEZINjltR1VKN2FzZGMyeGxDWXU2T041Q1o2?=
 =?utf-8?B?ai9IaFA2Wld6TUt2RWM1T2JwbVN2S0lSUEEwSUlLQndqQm1zbDNWUFBOc25a?=
 =?utf-8?B?VVFUMjVmODVCd2RoZG5GWHJxaVFVZFI2R2lJNXBYNDA2VWg5YlYreFkza1di?=
 =?utf-8?B?Q2ZmS2I5MVVFclQ1UHAwbFc3eE1SUTJXMzhpTklnZnJCNnU3b0svSVp2M3h3?=
 =?utf-8?B?WDNveDhNVy9ObTFKYjlRSzhCWGdoVGV2Tk5uQk90SmFtbkJiY0swd1VJNDJl?=
 =?utf-8?B?Rm9ZVTZCZThjYTVuUU5RQUNXTWZsMU1GWm5oUFhsbXZtOHFVTmRBQkg4bmtS?=
 =?utf-8?B?YVVYS1NNTWg3M09DMWVPa2NwNzBrenArWHJnQ1ZIRy9TK0JncXBOaDJDS2Ja?=
 =?utf-8?B?ekhwS0FtaVlOSTNkc2lIbU1DQmhLZ3FFRUJkTzY5VFFkTkg1OFNDVEw3UXlU?=
 =?utf-8?B?RVJxMUorazNaUExpaUxpcStldGdmc0w0cmJlL09iVDNxdkFTdUtZU0pvVUpl?=
 =?utf-8?B?V3h0L3FoTXJDc1VsQ3NLd1VnQk5aWkdSMzdJTjFzSVFIbDJhTzlYSkh3M1FR?=
 =?utf-8?B?aFA2d2JDSWU2OWNPK2k5b29wNnEzY3VOUTNqS0hXN1h2L1Y3SUNkcFREUEQx?=
 =?utf-8?B?djcvUnhlT1RaVXRVaktvdDNHeE10NWl6SFdGSi9qQ0lqbC94WUR2aG9oUHo4?=
 =?utf-8?B?VmwwQ3l1aHZIWEVYNUpISTR3OVBrNTVNc2FDV3dwZW9iSnhzRmdsZUdwM1pq?=
 =?utf-8?B?eUZ1QUswSXh5TGIrYXMzbUp2VlZTUWprOXR5U3RVUGh5UUNXMjZ0RHRzblJk?=
 =?utf-8?B?dEZKS3IzaUY3a3hLU2I2M2h1eDZCRHd3Z2RpR3p3SEp5WStyc0FIck03akdq?=
 =?utf-8?B?OGhJOHFMSWYvZTlDNDEzd2NuVEM3UEtmckhScXJia3NxdHczdkJ0N1pHR2JM?=
 =?utf-8?B?VWtCaWJITFJML1JZS3RqM0MyaDRVdDh1TU05Y3JuRUFPZHRqaEUvQUkyaXBz?=
 =?utf-8?B?RjR3Q2JiQUJ1bDNlekNHb0JOYUMzN0NnVFNhK0w2c2s1d1pDMGJKQkYxNjlF?=
 =?utf-8?B?ek1ZdUkzeFZZOHROejlaNkEwTzNDUWc2VnB0U0V6VjVUYW1lSDRaZ0srSHRk?=
 =?utf-8?B?YTVxaUNtTk50ZGgvaE1oSTZJaloxd1d2RzVmRzdNZFc2b0ZKQ1NnbGhmeXFY?=
 =?utf-8?B?aWxSKzhNbDJIZ0VFTFlQdXYraE5QM1pwNDJnRk1PRlFOVm9tYnBUZWsxY1lV?=
 =?utf-8?B?MUgrQkdaRUdRMzlpT1JjcytsM2daeFQ3UUNjcjVZTjVYR01yWGl2RWliMXJk?=
 =?utf-8?B?cUhxWVV6M1pLd0tUVktjaXRydmdzTm45bGlxek0xTFVvcmE4dE05cmtkcjBl?=
 =?utf-8?B?TkhNYlF4WXFSRXJKWlMzS0Y0V1d1VkRIM2o3OG9HWC9jTkg5VStjWndTMzZx?=
 =?utf-8?B?cXo5RFVkb3luRU1nL1lseFFXWUFiRlNMMm1nSFF6czRxZlRLbG9kYWZDUE1Y?=
 =?utf-8?Q?mVe67OF3/ULw3Eu8vO8kFkPKTiKB7Dj6LqSPpQzCGpf3s?=
X-MS-Exchange-AntiSpam-MessageData-1: D5jTV8WC+gwDLg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 086c4d06-6ee8-4713-0650-08de6e9d0eda
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 03:23:17.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ib29tjswhzl2XCxafJajlH/CpuwuhsQnyT3cwcq23iNRTPcYztWro7ifvSPiXSlWRogiGVgH6+halbcWBWZDOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
Message-ID-Hash: X3EAD6B3FA4FUWFJA7DCU53WKJU6FVWC
X-Message-ID-Hash: X3EAD6B3FA4FUWFJA7DCU53WKJU6FVWC
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X3EAD6B3FA4FUWFJA7DCU53WKJU6FVWC/>
Archived-At: 
 <https://lore.freedesktop.org/DGHRKO26RWX3.12AQHBX801G0T@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 12, 2026 at 3:28 PM JST, Eliot Courtney wrote:
> The limit is 16 pages for a single command sent to the GSP. Return an
> error if `allocate_command` is called with a too large size.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index baae06de0e09..dbc9e95f1b17 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -122,6 +122,11 @@ fn read(
>  /// Number of GSP pages making the [`Msgq`].
>  pub(crate) const MSGQ_NUM_PAGES: u32 =3D 0x3f;
> =20
> +/// Maximum size of a single GSP command in bytes.
> +///
> +/// A single command can span up to 16 GSP pages.
> +pub(crate) const MSGQ_MSG_SIZE_MAX: usize =3D GSP_PAGE_SIZE * 16;

Where does this limitation come from? Is there a value in OpenRM that we
can add to the bindings as the source of truth?

> +
>  /// Circular buffer of a [`Msgq`].
>  ///
>  /// This area of memory is to be shared between the driver and the GSP t=
o exchange commands or
> @@ -329,8 +334,11 @@ fn allocate_command(&mut self, size: usize) -> Resul=
t<GspCommand<'_>> {
>      /// # Errors
>      ///
>      /// - `ETIMEDOUT` if space does not become available within the time=
out.
> -    /// - `EIO` if the command header is not properly aligned.
> +    /// - `EIO` if the command header is not properly aligned or sizing =
is impossible.

`sizing is impossible` should be its own error - probably `EMSGSIZE`
(which would need to be added to `kernel/error.rs` in its own patch).
Also the wording sounds a bit confusing to me, why not say "if the
command is larger than `MSGQ_MSG_SIZE_MAX`"?
