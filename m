Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B910FEDEBF7
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 23:54:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A79DC10E8F9;
	Tue,  3 Mar 2026 23:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJIeMGrI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C0ED144DE0;
	Tue,  3 Mar 2026 23:44:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772581468;
 b=zXjBtHlT1KlqKooWGgU5SA4uKe5QYgC44Dvuz1nL4I62ajSwvwnHZB2d9BU2dOd9xPvBS
 c8xBYaun6NULb3bnqI36TQrMOuH1wSNqhmTuStwwG8u5AYtF9wH3fDyHQ8ioI7O71mGbwaZ
 Ekxq/UXSpXfWntYDU4OT/CQjuRkgoTzcjJg77poqgojouhtH1YFI/37BgcHhURfSsD9SXwn
 u8/oKUGStDW6kuIPhfigw9EoXUUIJWHVWuORa2QfPkbhpnXId3aU5LLmY15mgWMK+L2ETUC
 OMC26rg+KxvWi4ZkFwtKlLn4A+eTg4bQ2ALdFs7olJPfTYeHIBZukwsJfumQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772581468; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9qld5EB9i87A1m6ld3RgIbU4qDfexSmfO5tAZYCXvNE=;
 b=lQ99w3xmplAoePpItFs4jB1sM41pFMsZ4UR9fJQlz6PeAzs92+tu3/8z8zYkICc1BGgwr
 lHYU1C/690e3ZS7ptI3r4Y+QRBqWALgBdKLps1qhqtn9JMZDe1tWw+3jTQdkd/8LTHFy3FQ
 RsD2IO/CgAVrdj5bWNXsepvDNOBsAp/pUKnCRVHFMdLCKKM/76XM2I6hvzPyBsSLJdeq8T7
 /kojwCzbI0u296lYump1DfR3Xu/iiVRqroHOmER4ZxGbm/vEZ15fFW1ljwo0JphivQW3QOY
 5oc5WTsSkAEYTfPkms6scrRuSf22OYuJt5FxtIcpvbAcNo6g9IVeTCUPHsEw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A2CBF44CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 23:44:25 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3810E008;
	Tue,  3 Mar 2026 23:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSldBE0Y9FvvMG3VNAFgeM73NgUluDl049dNo7oxSDotSGf+aYPyZss4AVkqiVU+s7gfk0RIaERcTImA/yn5f6KWDHFcCzRHtjy2+Ksg2pStQiquO2d6hGns19VF5TvzmGSf3yCpPhOpXYLLFyA3saYT9Gjgz2a+3EEhTdZozABcNLCbu77nhpgcxwXOJNPm6LMAz/q8PS4A1EIlj3UNLtmE4rDHNcTcbW8ElwSL0MSe3CbvoDfBZqFwpCQm6YmHhj8KHQy95ETy+XZxx6zwZ1zNrIACVEZ8DzjnqKgEltrsrjbwHn+ApZ2rUoothC0IWctR8cA69YX2EcJz3doilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qld5EB9i87A1m6ld3RgIbU4qDfexSmfO5tAZYCXvNE=;
 b=IKbn8dsDXtKJiiULf/h0tw8HSIMQBAJi7RvfeJcatfiLei+JGeQmdsWi7V+bEG20mHw4G+HADV/eT7lAEmLVlOKEylwhS1fEOs/xN285zttLLph45AVSSyGGdXdHdlQqpzlFeiGa7ipnjvuhNsUi0o6vCg/6zHv2K94DZ860I+zmIiSHa2pDqQwTGxF7vRy1EB9M7oB+XFWaWlBiRjhs4Ha7XZLS1NXp8ukWUMChF6zvkT3syHoINlKrwjGl9hpM8gY3UYy8tlkA5n9+kIeG5faLep7CCOXfqDoQU1kLEPO0MizzwOaYpV83afJPZSpBkQj1Wq6yn7zAl6Iz3FJHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qld5EB9i87A1m6ld3RgIbU4qDfexSmfO5tAZYCXvNE=;
 b=CJIeMGrIHJVEWcBl3/GB/sUg06pdbNl1O/GHDY7/PZ538ytNNnBwqRsvnmkpuih0mEWg2wCEoMkYr3UTWxZ6qfxy5E5Sxt4rRvF8cKLqIV5Jq5bvXpdP3TrHsN2J4L1PNg+Tb7pkDDmnDdzy9Wl4PJhBK5oBGNXqrlsajZuNEA/MZO1+9ltmH0Xlfvm2X8pZQrKLFmTwDvy5mtKfsAFXxmOWIKcm9jib0use4Div8R9+AGYs+BhpyR1ZgB8ztYoGmc+G89lWCUWE1oTWthG6gR3WzUvxvowvT/46E0U77LAx8vLtUQOhE2hzjMIHbb4JNXCWop+ROpa2vl5Boe7l7A==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 23:54:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:54:40 +0000
Message-ID: <8a7510fe-758d-4223-b1d1-8b7f8afdbe18@nvidia.com>
Date: Tue, 3 Mar 2026 18:54:38 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 11/25] gpu: nova-core: mm: Use usable VRAM region for
 buddy allocator
To: Alexandre Courbot <acourbot@nvidia.com>
References: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0257.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6f5aa0-8a8d-426e-3bd3-08de79803bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	W00Hu6OoDKm10c+7dvc6+wRTn/zOt5m9Ce8QRwDgQN1m5WGYQD9F70CDV6yTI6cI8BmG3nSPmzJmk53YCJUsEz0UsFlrjK5Boz5U9hHePJ/N1sltH2xps8+VzYOdGLQh13LWMpR6HQbjvAee6yRoYknNskJrrltOUK+U3aXw3P1FwpW/hxctXX3ZuNhl17AvxKKldCevHk4qRdtrsCW6otWmMXyQAyH+Em7ButPfDsCWZuvLsTTo+OKy867WiVecfj0sik87DYsuOs+UK37QPCH7fV86PVHrCf16vHmuswcLnRDrZ8WxUoJm+fNVYYqR4fBAIoXUGqQz8TyWQ7dd3xZk3nxoGjEVDPqJiXagX0cYzYfcSYbpQnF2Gof5MW51OtsnuqhX7Wqjj0PoGw9JiYmmu+wx0vi0e+8fYeCC0vfELWWEFXBd+C09vYc4Cfoe57IdWStcuQkrIeZt1RNL6XydKoLhK65TuvVf/X0b4bdN6J42BHTWaspOWltZtTWXwbRjM2CWRHWRLE1q2GUCBS3aImmsA/rpwmi9/XY+NRpL7arx1mIYd9r33VTTr+Ty6l2C6w0tqm8WAR37rqNkLrXZvXTvyPc2alNmf15DCNMNN5/8A4FaJMAP2fCXBDL1yVZ+iBQFwptV7DMiRPwGIfpOoE7T8zaOmVy7bFH/tSXPNPWMinupkKd0/tZx4qBDK2pchQ/9hRlWtk05Ubl15DqkH8s40mHv2qPEsNNfLkg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUFUei9jOFlnVG1xMStKS2JVQnA0UXIvQ1BGMHhWdE5oczRmaHJ3VVFuY1I3?=
 =?utf-8?B?U015UXRMYmdwcldQeGwwdW16aXQveUN4bFk3N1VCY3B2UkRNMk5yalBlbExN?=
 =?utf-8?B?NnN4VS9udGxjOHhKZklOY2pSSEpjdXdNMThDSlNyZ2w2aERTMVJBb2VKVUJ1?=
 =?utf-8?B?VXAxOFYzeUFzdVQ5S0gxYVF0TERBWlBncG16UTZsOUFOZkZlZWp4cU5TWTB3?=
 =?utf-8?B?cGpqNzdxMDc0bURjWUdZZXFsOFBzMzBDSHBkcnFtR0RRMWVLSXRYSmwvTnNj?=
 =?utf-8?B?dFlVS2Vyb2dzWDZrOGxvMEhYQmVGMzVVakprRHV6cWF4VDlvYlNXWVc0d0tG?=
 =?utf-8?B?SUNLTVBVdkQwS3RYbkM5RVM4U1U3eTJRM0UxZGNweUFqMkpYZWJzY3E4dG9t?=
 =?utf-8?B?UjV5ci9JbDhvYklOU2RmMmEyOGZnenRrYUswY3JBVjUwUGp6eDU1aElnZmpj?=
 =?utf-8?B?OWFWVmhzdkpZMTVzS2JRUGw5MG4zRGRnbjFES2Q2UzNrSEN3OWVZM0QxYlF2?=
 =?utf-8?B?STBCZ0pRRWFDQWEraU9FR1owVDRlZ2wvMFhveCtRZVZPSXVhM205OERBMXpn?=
 =?utf-8?B?bGdVeUFhVm5WSk5DaTlOeFE1WlBybDhza1ZiVVNWc0o3c2xzdlg1UE5BSHFM?=
 =?utf-8?B?b2dBOEVOYURodEQvTmFKRDVncmExWWg2cGhtdVJxSkJoWVhPcW1Za0RtWUV1?=
 =?utf-8?B?aDFYVWFuZjRsWjhZVnZCelE3S0ZFWFhlVVcrandlUU5ZVjhjMTM2aExwRkVQ?=
 =?utf-8?B?Zm5VSHQvdURBMkhlbmdXekxWallrby9STXAxbW9wRzdpTENwTWE3RWh6SFdm?=
 =?utf-8?B?RHZRRTNmNzkycmRzSEd0eUJ0RGlpTFFrQ0NuQk1wOEZKdm95Z3JRZGVBSEIr?=
 =?utf-8?B?TlU2ZmpBdjh4NnQ2K2lQRjUwN1VhMDhrSktnV0hXZ01CVEJpRmM1T2NWYlh3?=
 =?utf-8?B?WVVXb0lhTXk5bG5XSWxFZHpDcVhaYjUyZVlNRVB2emdlQjhHeEllZC93dUlU?=
 =?utf-8?B?SjdUYzdZbFRLUytxc1JTV2RiSzdJZEJaODh5MmlLRnZQNWJkQldxeGI3QnBF?=
 =?utf-8?B?NWxQdnFrSmpzaitVMWtnREdXditIcUtXYithOFl3Qk9qVDRZakU2TG8rY0dO?=
 =?utf-8?B?MVRpeEd2OUNsN0JRWjRZcU52VFVFMUljRFBaeVNkTjBOZkI0SlV5Vk9CUDFr?=
 =?utf-8?B?dGhhVkhpb2xyM3lSNWlWd3J0YVo5L2lpcktJTiswZVM1dUdpdW1NZldkZkJj?=
 =?utf-8?B?UklWOENnbEF6QjdkaXBER1hrV3Nqa09XWXdjckgxKzNRMXQzSFliSDFFb2R4?=
 =?utf-8?B?TC9UZEJyWEdQZ21DVTdsengyK05xUm8vZEtsY1c5UWhUbEYyOHoyblZQOHlJ?=
 =?utf-8?B?aWtZTHlsZkI5SlVzUHhjRitPZElOelJKUFlOcEczMSs0YmRuY3V0SVE4UGRR?=
 =?utf-8?B?MWhaNjBzVDNFc3VtSEZHRTVmUWcxN0d1QmgzcmkxcHJVY1lYT2U2azhkbk1i?=
 =?utf-8?B?YzE1TTd5b2diMTBiNVRQd2pDNUpjRk45S1BjLzIyZWRETmRkU0NyYTNHcEhM?=
 =?utf-8?B?L2g2dkpveXdXSmVtRU9VTEJkZWJGdEZWS2JXcXhTY2taQzVQYjg2cVg2NXBN?=
 =?utf-8?B?Yk40Z3Q1TC9DbXNyR1hIVUtMcXdyZ1kyYXlFYkZFa1p1SVhxTm0reE1xR3dO?=
 =?utf-8?B?N3lOL2Evdll1RUd5UFhGdHRXUFF2MWZIZkdiLzk3MEZHK0VFcTNqMzhHZDRr?=
 =?utf-8?B?N3ZSOU1Qdmx5a05RblhvWk84cExSL0FnUHEzaTdhZXFuZ3R4bTQrSjJvNzVz?=
 =?utf-8?B?TnBhdG9BcTVjQ0tzMXJFT0R4QVpNRUdKcVdYNEdvR0dURWIvVUhaUE5GS3lK?=
 =?utf-8?B?b3Z6c2NtS1NZOExxaUQwODRvNWJ5RCsraHJQMDlRL3VDK090L3pEZmNTaW1o?=
 =?utf-8?B?dExXRzk5YTloSGpEN08rWlNMNVVNSjBKTmVrYk5ISjh0a1Q4T2k0cjFxWVlq?=
 =?utf-8?B?WWJtdysyNXpaVkZ2em1LSWZDcFdLZ3NJenJnMWFkaVd4ZjlwaWd2cDlTcW92?=
 =?utf-8?B?NE1NMjFZR3czd2dxaThtZitWdFdoYkV0ejRVUnVCcmFYcnhuRjdNNUtwWkJW?=
 =?utf-8?B?TlV1Z3JKUWd6OThPSFFDalZjQndRaDF0WXBRTjg0RGxsaStBcHNWZWZmU2dn?=
 =?utf-8?B?SmFYekplVGthRXhyYUdMNW9FN0kwZk1PRDF0SUdsZ3E3MUE2UElvR3VrQXMy?=
 =?utf-8?B?OUl5YWN4U2JqM3ZOSjRmZVl2Q3lxM2hZWnppOWFFbUYvUFkzK3hoSE1rQytW?=
 =?utf-8?B?Zk5DOW1vNm9VWVh0Ny81emtiY0JtTGJnU3h1YlZpMlpKU2tvTDZVQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f6f5aa0-8a8d-426e-3bd3-08de79803bda
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:54:40.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gQM2VWYUJASmIU/N+iTmZ8wtU6ju4KWafu9DBWGJhCAv7EgkIabqoN5zhVZDMCav7ngOmXmrgJzDjCklrKPT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099
Message-ID-Hash: J7IEPDQEGLUVE26ECVBWE6BS5RYPWVGT
X-Message-ID-Hash: J7IEPDQEGLUVE26ECVBWE6BS5RYPWVGT
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>, joel@joelfernandes.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J7IEPDQEGLUVE26ECVBWE6BS5RYPWVGT/>
Archived-At: 
 <https://lore.freedesktop.org/8a7510fe-758d-4223-b1d1-8b7f8afdbe18@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Alex,

On Sun, Mar 01, 2026 at 09:56:30PM +0900, Alexandre Courbot wrote:
> The chain through which we obtain `usable_vram` is very inefficient and
> much more complex than it needs to be.
> [...]
> Which means `boot_params` and `BootParams` can be removed (and the
> `Cell` import), and we have something simpler and more direct that takes
> ~60 less LoCs.

I like the simplification and I've made those changes! Currently testing further.

One concern though (both with the original code and after my changes):
`FbLayout` is ephemeral, it is computed during boot and then thrown away.  I
think the rest of nova-core should be aware of it. Other subsystems may need to
know the FB layout in the future. Of course we can do that later, but maybe it
will be less churn if we store `FbLayout` for longer term reference after boot,
for usage say by future mm code etc. May also help debugging, say debugfs needs
to dump the frame buffer layout etc.

> Correction: patches 3 and 5 won't be needed anymore and can be dropped,> it seems.

Ack, with the simplificiation the extra patches can be dropped.

thanks,

--
Joel Fernandes

