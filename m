Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A5D778AF
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 18:28:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63B10EBA7;
	Fri, 23 Jan 2026 18:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="YkFVsQ4M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 037A140564;
	Fri, 23 Jan 2026 18:19:18 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769192357;
 b=zSjFx8oJy9iPxDwbcgeuB0of877sg0lZ9kunE65CaCHOezQ42043ylHeRo3AEF/30J7Jk
 px08aS2afQQxV2Mjw3Ng7KIZQPdv70ag6YXwsgzisWu5luraGMQSgwrtv7/VkO4lEXOcQl7
 Z+lUkKV5nFgogFLrEdr/kD9vJj4oRNxV2BDwliKiyCoVCdtOKHCC3vTEPYZH8fGFDdHCbeF
 LUVSBZ/4MlKMznKlvIv2yBcb+BZsiJoosMlLcbgQ2SQI3h/iINah6wV8CPzqtUe6d5+m0zC
 0NCKWmoQoiyf+H0rux3brz0CdnclLVz7XKQsq+DN2THl/jpi8BkxGwpIQnCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769192357; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tgkSphczwaYo3L4VxWcF80l2pJG/oBj/xjxZ48C/5ZA=;
 b=DPlAISIa4anu1sgVOcZeVsFCjY3R5TKf12Kc2qAyTdvDR2ps1nfFC3Iuoc0IodOag2c9h
 rfjfZ6k3jc3eT0Ug2AyRsDnPEmdjtWbYexrmEsAqDJ3DE06FBlXIgkWpXtToa3lsI4Kid5l
 Gfhu9tIKdp3fIF5iX1rTf4dXcFZspb8txv6Kxmi0+yTBunM/1QEmmf/JAzcH+x+BdYXgpo3
 AyWe+oLM+Q1C7+WGs9JkqgmlXC6+J5/mnQl4wjYOzjRH2jpZ8jFkDdkdtW+EIzxpc/0G8XV
 bd0dhR7xjIxnidyh/ZE/UydEkCysWA9B/6JQm5QFJhywtL9lCWHF6Irre84Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 165FD400C5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 18:19:15 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022098.outbound.protection.outlook.com [52.101.101.98])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4D10E1C9;
	Fri, 23 Jan 2026 18:28:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By5FOsFPNc6zRpZjCccpJEviNkkXFRKp2rDKLUcw6bQ1es1G+e1HBmT9qdxg+8mwKwWci8JBnOgepyJgth2E+BO3b63TB76weBSXTJPhbsprmtX5qlBciT7lPtJmTN+op2ZS9rKSR8xJUWmQH+woptv1BJJAmDK7F1JCcoQul5kcAFJHNmZn4nR6QMNdHVSzq/quyqis8Wgpk0rkfW3l7lYV8jGOcT2LxPa62x8YvPaVsHJLpdr5j3HSQ7zEWiVDLjfiP8EC8xioLYsQpiB6/epDtvpWCp4BXw1IdXKdB3wjEYFR5TlatwFKSj02oLfkUyrfPjUHnYYxm8EgHsQbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgkSphczwaYo3L4VxWcF80l2pJG/oBj/xjxZ48C/5ZA=;
 b=lpMMV59sDty7MxGNfoBMMbIZzT8Bx5+olN5J0AoGr+rKeaX6kYtBCax0XV26IF19VU0EBWB+axiYutJmTWdNtBbDzRieNyZc/JW/WlsSqhOKm6nMXSzlzBiaeQ4V7n1PBMq0XZ9uhRUYVSecgMHMmbFI/kEXn8LDc4R/WThGBptye5hYXJiqwtvHYVTGd6yWgu/7hoVWFZa59XsgvU/ujiJyoQAAl9u5J+FyhaL8N5wpyu8BVjyi8Hg8eoPf2amiwsyg0bu94kFRLB6KW7Yy2YqjtTDZWSB9+0Y5Ts2/4RsQQkRIKvB9nnGTT+uBZwsYYLPcQYs72dRaHNk7yfWBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgkSphczwaYo3L4VxWcF80l2pJG/oBj/xjxZ48C/5ZA=;
 b=YkFVsQ4MbsUC3KIdAmTfzwZ7H0Z+owW1FBjuwfGqSTK0aCR17gk0j8hCBWbf0OgPYnXxPy4tl0LmTY+1fD5syW3qCOIG0RcgjAhToofT5p0PpReLcZhQybVoJ3bTbCXE8DfZpdi+XIfm7U6PkwLbY9TaHM4S6L2g6EGGkj+7YXU=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:28:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:28:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:28:02 +0000
Message-Id: <DFW6JA3YWVBT.165YBPOMPL0KI@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
Subject: Re: [PATCH 1/4] gpu: nova-core: gsp: fix incorrect advancing of
 write pointer
X-Mailer: aerc 0.21.0
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-1-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-1-7f8fe4683f11@nvidia.com>
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a604ca0-a728-489b-20fc-08de5aad2528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2V3aTVRNDd2Q2hnYllvcGJhOXZhcjdrcjNyM0I3cG9XLy9rSTFNMEdEdFlX?=
 =?utf-8?B?UFRwdHBMS2V3a1E1NmdWam9kb2FwZnkwS3FzdTdobzFUSjk1NXBDQ3AwMFRt?=
 =?utf-8?B?QThIRGlXVWxZSGpuSHNSd0VYNnVjVWR6V2NqbFVybHdwUStyREVZSkIxRmZa?=
 =?utf-8?B?SVdFd0gvN0lERmZ2N2FOUHUwWjFFVCtCZzVrcE4rdWk1d0xjNU9jeVZadjlr?=
 =?utf-8?B?VXdjamFwRzBPUkw3UnlzanRDY0hEbDlaZlljVTNKQnRJeEs2bkpWcDIxaGoy?=
 =?utf-8?B?cEtYZmVwYWlSZEx1MXF1d2c0dkg4NXpJOGtFSjFxZjZ0dVJlQ2xQeHp3azhH?=
 =?utf-8?B?Z2pGc3VyZGQzc1FOUEx3ZzVwMjhCWXN1M1Q4RElibCtXcWt6RTVsOXhmNXZB?=
 =?utf-8?B?VGs3TDg3MC9QdlVDaVphYzB4ZWc0VmpIN05nTTh5clE1NFpvajVUUHRvZkVF?=
 =?utf-8?B?d2plN2JyK1F6UkprMzZEdzBEUnVwY1pnT3FDa09zcnVUNHFiZUNtdlcrRHpE?=
 =?utf-8?B?WmFDbHlienRPSVE5TFFFUUI0TXgvVDk5VE1OdmpoRkQrOVRnd3FJMzN4UStn?=
 =?utf-8?B?WmZMZ1YyQVltTTBLOENGZzROdnJvcHhXR1pXeVcxY0MrdUNCV3A1NXlpVVg1?=
 =?utf-8?B?VURGYlZCa2dPeFIvTjRlMXkzZzlFL3pINkQ1dnRodnBwRWlNUmhDQUtYQ3lj?=
 =?utf-8?B?eWNJRmRoQ1o5YU1WWElxWlUxY0xVR3ZqRGsyV2VYMGhCNkhFYnh3SXJlZVUv?=
 =?utf-8?B?Ti9tVTRXZWFnNS9NdFl5WjlRL25xdHBldDdxcHk5N0xEMnN4ZHd2Rlk3OGtj?=
 =?utf-8?B?NitWY0xIeXM2QmlFYVRYV3Z2UFp5bExha29CM1pWSFFwV0p4Z3RrZ01iSEs5?=
 =?utf-8?B?VEE0bmpCdk5mSG00N2R1T3R6S1RDOVBsd21PWVIyV0hiWHIrMHd6QWdCU3JR?=
 =?utf-8?B?U2Z4WDcrK1VuK01XaTVKbWd1RGpIdTVBTmMwWS9TaWgwTVEwVDYyRGZrQUFi?=
 =?utf-8?B?MjZEeWxBWG1GM0tUMUF4TGF6akp5NitZUXhIRXJVRS9GbXIwaFNDVjRkdjNa?=
 =?utf-8?B?WXQxeUl5V21URVlDejJRdEZjaStTQjlzN0xCMHhFMlAxcUtiMzlhaDlOQTFp?=
 =?utf-8?B?V2Ura3pseCtaak56cTJndlowZ08xb1NBdmQ3UW1DY1dxelRFMytsUFV4VFZq?=
 =?utf-8?B?UjhTSVR6NFgvSHpGRGlHVWRwN1FqMHJKTDZKN0VjY2dPb0tTaGROVXNaV0xy?=
 =?utf-8?B?MWtFMms3RnM2S1ZmMlBpdE5qVnQ4NE5qSFZLRmNVVXl5M1kwZHlETmNRUDJD?=
 =?utf-8?B?OGZoQm80Y1BNTEZBMFVySkY1eEVRamQ4MW10emVNaXpVQUtVVTVpVkt5U1gy?=
 =?utf-8?B?ckxFdFh5aENQQlBZVGUzVTJHM3BEOGM4MEk3azRQWDJXVHFzbm0wNGI0dTFv?=
 =?utf-8?B?Vkhwd0g3UFZkOGlRTFhZMkpkQ2JTSW1lRTlIZ3V4ZmI3Y2x4UHlpWWF4OUg0?=
 =?utf-8?B?SmYvUUhzVWIzai9QWlhyT0U2aDFxc1ZSS1VQamFuNWZXWnRHMExEdmlFU2pL?=
 =?utf-8?B?VksrWmo5WXdEVWxQZ2tIcmJZQW1GdWFrNGNVTnIwNG5tOGRBMXFPWHBONlhD?=
 =?utf-8?B?dTU3OHIyUThiTVR2VTJ1dEkxSDBNZmZ6N2NJOFVLd0pkVTdOdUxEQmlvQVJy?=
 =?utf-8?B?NmdFV2k2OUZ5cm9xR2poQzNxZG9aWmdOVkZKeWFYcWprcFM3YXRqa3FwWDNO?=
 =?utf-8?B?OTZod21pY1FNWEx2d05tZittWEFLRjN5ZW5ZbTViNGhHZzNTY1kxTytJeWl5?=
 =?utf-8?B?WU9lRW5iMGtBSi9XdndrVXg2NGgySHpYM1pMQUxMMzFhVDN2TWRoWGx5ZC9l?=
 =?utf-8?B?cThKbkJKWWxPZ3FqV1R2aGxWMmRoa1FEMmhKQSt4YXpkWElJQ3Nlaml5UmRI?=
 =?utf-8?B?VDVzSG50ME9rVVhhYlR3ZExiVS9qU1RRVXgySXNpVE9oQ2tLeDNtL21YeXZo?=
 =?utf-8?B?bjNKVFVWdHg4UVhYb1QrNERkeGZDcnNZbEVBaSs0K0hKYkhHd0xRaGs2U21i?=
 =?utf-8?B?VE1PV216Lzk1K3ErSXh6QjVPVmVlUHpUR3F4Sm5uSkFNeG82ekw3Q0V6ZzBN?=
 =?utf-8?Q?0jNE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVlFK3FWK2VWTHFDb2JvVnlLU3AzVzVValI3STNXc1FNNkUzQzBsZ3N1eUh2?=
 =?utf-8?B?SjFIckpvZHpGUlcrVlVaV0lzUTJRSzJyc3JUbFZnM1NPd2VWRG94V2dkWlht?=
 =?utf-8?B?ZVMrY0NsMVgwVmMvN1BUelM2dkdvM2I0MWQxV2U3V29WUTVVajV2WFBCZ1Ft?=
 =?utf-8?B?VS9hUnltdHd4YnJVUnpER2pCdk5acWIrWUQ0OEdMUlZ6N0xqeUlYanlaNmlv?=
 =?utf-8?B?bnZqUXZ3ejFtc3JyUEJUeFk2VEhzSkFYbCtUWE9JaDh6dXNFUVlLTkJ4ZE9Q?=
 =?utf-8?B?NEMwSXVzb3p3NXNCbm9ZNEZOSTR6UnpuaitTdS9MRUw2OW9LVTVtMW1pcGJs?=
 =?utf-8?B?MTIwb0c3cWRTV3RlREhnU2FjVDNqdFRqSVlWSFFadmZCcmV3Q1k2eHlCU3Zn?=
 =?utf-8?B?bXdKaTlhRFBjNHp3Z0FrZlNWUTZQVG9EV0pDSEZheUpmR3M2VVowVGdVM0hw?=
 =?utf-8?B?SXBpY2srSWhNUUYxZlVPYmg4dGtkbGYzU2hZendRcWFIUHh5ZERRblBIWFR5?=
 =?utf-8?B?ZksrZko5Smd3aWpXTHlTWHVmeXd4ZHVYZ2orNXZMYmJmRXV5VGFzUzZzT2lE?=
 =?utf-8?B?eEhOV2hLRDRGUXlCd3hnZDVoU2J4S0VrdVorcnk2eEszOGhySlljZXZCNzFo?=
 =?utf-8?B?WXZ4bFc2bS92c3UyWUxVdGJHQUdkbU84cFhsZU0wUis2K3dtRUY4Tm4ycDhJ?=
 =?utf-8?B?ekxYNVRtY3VScURmbFNweW8rNnV6NU9HRjNCdExQaFhPSTNrYkVrb2xLRGw3?=
 =?utf-8?B?SCsyZ3FnUThHRnpNN3F1WkRJSkM3MHBmZERLaWVlK2F5a0JMYi9hTlZCNlQ4?=
 =?utf-8?B?UXY5UnU1N0lKV0F6ZVhSbXNmNUs4SzVPYmVXTlRjaTdURHNnNkJubmd6RFZV?=
 =?utf-8?B?Y1ppU1c0L0JWUmt6TDRoNWhOaStBNDJUSXp4OXVPWHRpSGczWXUrMjBMU2hI?=
 =?utf-8?B?Y3NvcE9YZm45OWd3SWhmenUwM1pIeDZzUDNrM3kvUEQ0WXduSWJnUEdYZ04y?=
 =?utf-8?B?NUVvdFhqVGFZbkRKMmRSM1VkTTJENlFhWGtadWpjU21RUzA3L05UOFpPODdG?=
 =?utf-8?B?azJuTlpBYnptL2dNRVVGWXoyczJGcWlWbjJlZUs0UTlHOUQrMmxsM1JkWXYx?=
 =?utf-8?B?ZW44RFBscEtpL2h3YWxmOHdIbTE3OTYyb3Y5eVhwWnNublEwRjFsQ2pHUFJq?=
 =?utf-8?B?M0IzRmdWalVmb2pQMHBMUkVmdFR5cm1JQkcxYmlVMVFPT3lVZm1LZlBEZFJt?=
 =?utf-8?B?bldhY093SVF0S2J3VDJvdHZJUDZhMHdzT0tGUWxlWktPamRyRkQweFNzNmg5?=
 =?utf-8?B?Vm41RzlKbm9QUDJlbURENUtKS0VPZ2pZL2hsSlhnZ0g0Vzl5WDMrTStVRDJr?=
 =?utf-8?B?eng1OWxWamZNZHVHQ01FMnUwU0JqSG9JRURVTjRHd3prajdWU2VtSWlJOHpk?=
 =?utf-8?B?K2l3KzNGd3BwQVBVSmxCL2R0aUEvUkN4dklPQ0twZWlMSmE1NGRUQ3dFYjBP?=
 =?utf-8?B?ZFFBYWs2UExYNXBTMng1Q1lORlhrZXRIb3RSZTc4OGxwdWtxby9PZEpVeTNB?=
 =?utf-8?B?d2pzNVdnNFYxSEc2d2NWU0p4SUxRNmxYdUJZL1RSTTZSWUs5Slk1REVVeExV?=
 =?utf-8?B?VEt0TWhKcXRBemFzcTlka0JFaWIySjZpQmUrd3JQcjJWT3dTZ2E1UDIzQXE3?=
 =?utf-8?B?TDN2eGsxa2I1M0MwbTNKeHp3YVlMRGl4SWF6Z3A4dHZOOVA1OForUVZwMXQ5?=
 =?utf-8?B?clFTNiszN0FHcy96NWp5YUo5Ty9ZVm8vREIxZjlya0xmTEY5c0xVVlg1aTVG?=
 =?utf-8?B?d01CbnoxRUtWQ2VyVnJDZ1BoTGIzQklhL1RLb3A4aWZPWnZ5QTA5em9pbytT?=
 =?utf-8?B?NDRRTk9SdElpRHVRQlN0dGxYSFIxUm5jN0EwemQ4ZitONG5HT2NnbHo0bmpm?=
 =?utf-8?B?UGpBZ3o3SVBBQzJWU2RzTWgrdG9ZWG1UWVAyZXFMLzZ4M3Zic1l4Q285NEVH?=
 =?utf-8?B?RnBKeStyWEsvNkVVazZ5NmFwVHIwUk9kdkRmMkhXTi9sVFNuejJCZ1BoZnNi?=
 =?utf-8?B?eTVsS3hScUtlR3pzbWJIZ2tZZlZacGNrL2d4aUpTVjV1a3Q0Q1piSE4yUDVC?=
 =?utf-8?B?eFN0a2pjUUhvR0RNQjFQYzdrbUNiZlhSckIzdnJVdDF2emh4Q3EwT0E0cWJ4?=
 =?utf-8?B?TzFIbkFyYktrT1NYWFkwS0xMVmU1YUNybWYzYmhpc3JIb3NCV3d4UGhHN0tn?=
 =?utf-8?B?NDlkdENkUTU5RlNrZEZ2SS8yRUF5NkM3UUY5eUVwOHU1Z2pOZm1Ob0VBWVZH?=
 =?utf-8?B?WEdFRjJRVnJKRjlZVzJZYjB2WkYxMnpFY3NDMGt5UU1GQmFucTJ2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a604ca0-a728-489b-20fc-08de5aad2528
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:28:03.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H/UBfws/9cV37GOA2fn811E5BAn9pX+KpV3Eciq8SsdvL/LkxHE2G5Fi7GVmTgdCeLskaoMQVy1cPhJTBDDl8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7326
Message-ID-Hash: Q2JDRACM3ZWKKK7KU33MMA5NDBFPLQQL
X-Message-ID-Hash: Q2JDRACM3ZWKKK7KU33MMA5NDBFPLQQL
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q2JDRACM3ZWKKK7KU33MMA5NDBFPLQQL/>
Archived-At: 
 <https://lore.freedesktop.org/DFW6JA3YWVBT.165YBPOMPL0KI@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 22, 2026 at 2:59 AM GMT, Eliot Courtney wrote:
> We should modulo not bitwise-and here. The current code could, for
> example, set wptr to MSGQ_NUM_PAGES which is not valid.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 46819a82a51a..f139aad7af3f 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -384,7 +384,7 @@ fn cpu_write_ptr(&self) -> u32 {
> =20
>      // Informs the GSP that it can process `elem_count` new pages from t=
he command queue.
>      fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
> -        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) & MSG=
Q_NUM_PAGES;
> +        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) % MSG=
Q_NUM_PAGES;

So the actual number of pages is indeed 0x3F, not 0x40? That's interesting.=
..

Best,
Gary

>          let gsp_mem =3D self.0.start_ptr_mut();
> =20
>          // SAFETY:

