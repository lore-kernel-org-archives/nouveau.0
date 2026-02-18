Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C0DE9A03E
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 06:50:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23010E56D;
	Wed, 18 Feb 2026 06:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hyfwBJRG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB058433A6;
	Wed, 18 Feb 2026 06:40:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771396853;
 b=ZKCVtwjJ0QHCgB4PCTCXTC/ZkEjkX/9iCNCGGn26OpDaLyitSXqt6HGOVdrPDMQvUqJ7k
 rYIJQUa3EAsmmUhxPob30I5/kCV+p74GPYQmB4uU+lY3Jun91APpMZTQDcqGmuYW5XWmO7W
 mOECKz7A86AMYkizs/3hlYJ/7VPdaeORywRoF8QSbPeYR5QuSS31o2ccfJOa/Es8MP0t/c+
 +juGd4fqblxTc/x1eVxDwd0X25fclHPUjVwVdEs/msRf0ycq7r2u3ZwGNTpQ2PByXl4sqbA
 4DnRjggoV0egc+wYyvDmvTaCcGIhBcAVw9DsEfOmPcyMvMERFXT1ueHNnElg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771396853; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+ylcX0HhkZZqG2FbzWLaA+LAzoW1ZrHIoKb2wu6NayE=;
 b=xlddXJ0ClzMuJ8h6YDalkeiCelHUB4AUwxMqM6N8iD7d4tUs2/B/buQqPrb/1Qg/sZgvV
 95jar4ghsPmQrxzr6a43QjhzYHaZcs4Z+QCAKHCftfLM9Y+vdIZjGBX9zX6KQFfCd/VNwFT
 FrD6tlT8LKEh9ljWWpScB5a9lMXFUhHtZbEf+m38+SH5vUMRvdafNdDxnTtktb0o7PPtDLu
 yVrv6FIng7WXmXrT9ka6/3Npo61xaUL2u2A/Df4mWH5IfjI/Xe9VRkFIlCA5DLpIT9+0h3C
 OV7dzmcIHF8Jk3YhJwCsv6uAIeHzhJxD0lSdYSLnwhgvKDRqQxeiDWMtcaCQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 57D2F4006D
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 06:40:50 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013069.outbound.protection.outlook.com
 [40.93.201.69])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 60D5A10E14C;
	Wed, 18 Feb 2026 06:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6CY9rL7krkRAEToLZ+aYzvxqdKOt7GR5yIlQCUkCIgAQF75cNiP12JKrekQk2IVD+W3u80RCMFbJ1OXlEe5GF6kWgrRyIMEwGBXwAY2Zubl2Jsw4Zl5eFfmAjS0slm3QhAdxGeW+eDro8oDUHuug9aSnee3ipbm7j0v5WuRL1D8HQqWMjzQFyl+4vbTDdUjoF0H05+9C5Pzr2K3LGKTJUax2djkvRMvhMDxgH1WuBPM13nU0JcaVRE2BfAzxcVLwo3c9H6xXzbDg/MeGkJ+Fb+gnBJUQ+zOG1u/MJ5FJLc9PSS4MbhmNOIrZUzmynWKX90S9GN7fmWvRQfNMr9XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ylcX0HhkZZqG2FbzWLaA+LAzoW1ZrHIoKb2wu6NayE=;
 b=UaxbdnVQJ5SxZi+FUO1QaoIAlbyWYWRm17Ua4lCubFQtoiZNbAd6hA/8iknHaozUICtEzSU/WQ7BpSlnGj/ylxS0MgQA6oVv/PqGjKANhCcr37LiKQNCtbGWhNKEoSwPg1dYpDeEh068PdOajhbnHDLXmL1M8TlZVg21DKRBk3ywvhOqFJNdgx7+88XWrPD2PFxFY1fKYr49X853zjgHGSzI/Qzqjmf/iVll/4PFUW7uyz5/33Kd9L2gpypdgtnd/tqLyDibFexHnkJ+fac71y+mqIZ935tQlMGDKegm0yBjcieRrP4nkPKembt8S72qbb/YrfXh5y3JroVIR+jgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ylcX0HhkZZqG2FbzWLaA+LAzoW1ZrHIoKb2wu6NayE=;
 b=hyfwBJRGuVXW+FFlHZUxpkiFhx8nhIiYX8B+QdgOPHghAOZG/sg05U7HmV83K/eUSOKMbWcW4qry0Fw+VHRx6nioohqBdDeGxuy44nbsV7KtzTzi4XvxFjw6duwsVYf3uXTp68F+tl99yc5G/+ob4QUD4ZfKEVhA1Y7RENYkPlQ2/YGUKb+0MY1JBlGHxTdT/Gd7casJ+jT7CNPniGvUPPH4M9AXbIdnk34ulf30DJVhTFl3423S7vcSkiFsEiisWAlpfgg1OOLLt91RC1cxCafgFMTqzkX/OZFgUP/B0BJxSEeKp4BPc/1sVBI4sheZUEfkz97UHYruJUCg6W0uDw==
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 06:50:33 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 06:50:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 15:50:29 +0900
Message-Id: <DGHVZCZ3D5DY.35YV1XN6UK2QQ@nvidia.com>
Subject: Re: [PATCH 3/7] gpu: nova-core: gsp: add checking oversized
 commands
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-3-73079ded55e6@nvidia.com>
 <DGHRKO26RWX3.12AQHBX801G0T@nvidia.com>
In-Reply-To: <DGHRKO26RWX3.12AQHBX801G0T@nvidia.com>
X-ClientProxiedBy: TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc3cabe-d82a-43eb-8b0c-08de6eba0353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTRVcWRvdC82SzY2VUw5L05SVy9NRHM0VVhoN1ZRRFNZUXcxOFZaMHBqOVlx?=
 =?utf-8?B?NmI2bVBQVGdZQkIybnJJK3l4SkltVnhiSVl0a3NPMDNZS0ZGcW9qdzVJVi9w?=
 =?utf-8?B?aFdQSkF4LzliNm8xWVowR2ZESnJ6Z3pMTWxYR1VidmZ0Q2lTUlVWUDJCbkIz?=
 =?utf-8?B?eTdkc08vV0p4Zm5HTDFiTjdFYTliQzFuNzNpajlvTHI4cnA1RzJGZkhyWDZw?=
 =?utf-8?B?Z25EWnJOL0UxK3dKdUtoQ1d0SEJpSzhLUHMwSE9FN0dML28zOWlFcWlnT0py?=
 =?utf-8?B?c2lkS3hYMDNqSXlyMEdWNTVoTG1BSFl1NTRvNW02UGEwdUJBMnJHcWxxa3JD?=
 =?utf-8?B?YXlzVG8xK2JJd01DQkZWQnRoL0tPb1dlYjJrVlBwVUlpbnpHcE9tUnFEZGFl?=
 =?utf-8?B?cDBzQU1CUDdyUit5dHhGMW0xdUErYlBORlE1TTJ0OUd5ak9LT0o3a2gvYlF1?=
 =?utf-8?B?N0l0Ris1a01RSGNBZTBYOE9lSjNjQzhHSDd1Snk4SDJJMXVlVnZOMklPOFNo?=
 =?utf-8?B?MWlBUnkwdG0relF1NHhCN1V6aWN1dTZ6V0trTlVHUmVvY2NlVTgrVGtSN3lz?=
 =?utf-8?B?ZUJMNUhEc1B1N1d1SFUrRDhDcnVVdDFUNkNGTE9hUVdkengrNHJwWERUMUpE?=
 =?utf-8?B?OFhiSjlQRkNMR0VORmFlUXFNcHpiWWpFcjJKQk1KR0FYc2NoeDZ5aW9oU2x2?=
 =?utf-8?B?SXVXaU9idU13anlveUlGRUtDTm9BalhFdEFWTUw5N1NxMFdTbkVpTy9zR3Zp?=
 =?utf-8?B?QjROMmJUTndoZWZJNzVPUzVjeWFZbE45czkyM1lmc1pVYlN4V2pWVy9tWlpZ?=
 =?utf-8?B?cDdHNlB1VlVtTGgvWWRZOG9UbW5GN0szRDZ0TzJsNTR0QXVVcVBGRzZ1cnBR?=
 =?utf-8?B?ZFE3Q08xYmErOXJMT3luUlVVajU5cEdKM3NwQm9Qc0dGUkdSNTZBRFpzQlZk?=
 =?utf-8?B?RHB6YmhPMlY2ZWZTN1Z5Y3k1NHZyN1gxOVA1cHJCa3dPWmFyb3M3c1ZSVUkx?=
 =?utf-8?B?VXhHVlNRSGNDdVhFYVlPRDFKcTFpSC9lTnB3Qk1kOGEyQzBrTTk4dHY4ZXFi?=
 =?utf-8?B?Wkk4cm0ySWI2aXF0V0s4aU8wWDg2WUtEWC9KOUo1d1d2NU9RT01PUHBsRW5s?=
 =?utf-8?B?Vmg0eUppa2NpWWo4NEF6T1B5MHU2eW9RYVg5M2x6cWc1L3FMYmxPbFpORWRu?=
 =?utf-8?B?VWplbnBQRDBtR292c3FCU3ZkSjNEck1WdEVtREhBQndwc1I0VkttdHZCU2Jw?=
 =?utf-8?B?YUhMaTVhUGpQaFg0cU9DR1ZWMHZRa3AraWZTVk5EZTdycGtoc285dnhTbUVD?=
 =?utf-8?B?QUJsTENzRGM3bld5OGtQYjIyeTlKZEUyVlk5UHBvblN6TXUrRVFybk5pY3ZW?=
 =?utf-8?B?K3ZMZy9TcGphU0dGNWJUd2pndTVJSzMvZWUwVkVyZTN2U0g2eW81RHdMbGZy?=
 =?utf-8?B?M25tSm0xUlZKSW9wSjcwamZ3RVczM1AvemZFaTQ1ZXVNcWJMMUpSWTdmY2E0?=
 =?utf-8?B?TEFUdVlheEpHZ1BPbTNxelZGS1kvUisrb0xPN1owQks5VWlQeGd5N0pic0VX?=
 =?utf-8?B?VkNPOVFiVkJvYndwV29OUHBYSXJ5cEIyVzBLUm04L3JjU3VFV0NROENKNS9O?=
 =?utf-8?B?d2ZVK1RrbzFMUG5xS3d1WW5XdnZUSVRnMkxtL2wwZTl1TjdvMlpqUm1Zalk4?=
 =?utf-8?B?VU1OQ2x5d0JQejNTcENYTUYvNFB1U0ZVWUhENlNjUDZBbHlYbmhFZVBzVE1R?=
 =?utf-8?B?a0FuYm8yMHdnZkFobDJUMVZvUWF6R0VEMW9nTmVrWFlyTjk4a2FPUmlHVWtO?=
 =?utf-8?B?RVR0RDNLVUdwTTJSeEFZZUx3NUx4bm9xQlBlTTB3T1JlT0dIY0FmNXNxOTVZ?=
 =?utf-8?B?QjJKWGhXU09DRVNEOE91N0NvT04wQlN0ZFJ5WEJNdFI5UnhRNDZXeVhuOVZo?=
 =?utf-8?B?ZEZNNHgyREdRaS95VXNsN1pRWnVrNjJqK2JkN3pkVEd0a0xpenc0cFNOTnBh?=
 =?utf-8?B?MDZvYnEyMFk2QlJlTkMvVE54QmlzK1k5dlZKOUJNNFhlLzhPRmI1b05WS1Zv?=
 =?utf-8?B?VlY3QTZTMmxqQW55bHJGR1N6YTVoczBvVE5YZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUE2cUp2WDM4WG5rbkFnTzloQ2U0ODlmVE1ydVkxVmR6UXpJa1BTMnZCS2ZG?=
 =?utf-8?B?cnZVZHltM1Judy9nQ1NGYkVhL1l4SHRJc2k0N1VBck5TejFmR0RGUWpSR1Nr?=
 =?utf-8?B?R0pnTFEwL1doYks1d1ZIblJLMG45VndORjlhQmp4REdpOTdCc0JDTWkwYUZQ?=
 =?utf-8?B?RWJjb09NdlJXUDgrSGNWNURsNmx3dDFqbzMzVUhybFZsSjBrQUFEQ0x1c0VN?=
 =?utf-8?B?a05PR295OGt3QVMycnJKKzZkUDg0TFptK2lGWlR6ZnZXbzZickk1azl1TUU2?=
 =?utf-8?B?RElPT1JmK09PWDdQcmxEY1hqRUFHNWpERmNzVnlhV0FSSm5lbG91NFBSUjlY?=
 =?utf-8?B?N01tbUkxL1U1Zi9sUzZSYjJnVnJ1WkJVc0JpeVBrQTl5b2RSYmVEc1hyT0Vj?=
 =?utf-8?B?bXU4V2YrOUt3SGpnOVFydHVFZkFOZ29wUWVjTVZDMHd2T0wxM21kdWhDd0tw?=
 =?utf-8?B?V3JDS09LY3ExWldQbTVHaHBMZExQVDE2TjdSTUNuU3ZpQVdpTmF1U2RzTmM1?=
 =?utf-8?B?NmYvdHRKWFFwWkZjb2pMY1dvdjgvWEJSOWdPZnRGRERjcURHMnQ2Z1pCeWlG?=
 =?utf-8?B?WUE4NHJiVStmR2VxVTc4dnNwVTBzRGJ0QlV4ZFY0Y0tqS1liTHArRDNINkRo?=
 =?utf-8?B?SytFVGZJUDlWTHdlRWJJZ2UrbytsMjRPZUlIYWh5Mm1nWU9PZ251d08zRWNN?=
 =?utf-8?B?VFJKZGRrWitBcEc1d0Z1UlpIdXZabktMYjI0dVJxUjIzMVJWMGx5dGNBanJN?=
 =?utf-8?B?OUZSdnJmeDVoUWk0U29xMHZ2eklLT1NFaXU5MjRtSlJPS3JKNm1BVnFUaXY5?=
 =?utf-8?B?b25QMkFGTGlMdW1VL25aNzlBcUluZVZ2enRTcmtqNnhJOWN2UG9FWTYyWUhr?=
 =?utf-8?B?K2RRU05iMTRvVE9DbnN5cHVGVC83R0tvaXozbkd0U3M5Y3VZaFBIUTd4cTBE?=
 =?utf-8?B?d1dUVFdaWENCVWljcEFSRkxYRFNWcjRVTnplbVRtR2RyMGc0WE8rRGhmeVVp?=
 =?utf-8?B?MmhaamxjUHVySUxkN3JCRXpmanZpd0QvMmJ0TEFHY1E5UFdvNUNLV1IzZGdj?=
 =?utf-8?B?UnlVS2hqUzFjQzdpUTBSY3hvd0xNeDhscTdmTVZSRlFBWXQyRG1iZmU3aDMv?=
 =?utf-8?B?ekp3MU1mZ0VUK3o1ZFV0ODE5WXVuM3pTdll3RnJRSE04R2laVm8yalYwQlNw?=
 =?utf-8?B?UWl0ak52UW0yM3V1eDhaQUlwZDZ3OUtwdlp4cmJFWHNNTWF4eFN1bCtBQmh6?=
 =?utf-8?B?akZNbDY1T0tUVWMwZEdBWiszMVRRaEkvdDZmY1VKMDhvM0R5M2ZOWEY2cGZD?=
 =?utf-8?B?eGF5K051d2VEaXVVVTBTZmdZRGZUeXpsci9WdGJ3M1FldmRUdElFWnZCTHg1?=
 =?utf-8?B?R0VsbUd4R05UbTdrand4V2hMWXo4S2VQZEg4WmpHR2Q4SDBNTk00TTFhQjkz?=
 =?utf-8?B?TVF1UEo1ai95NjJKMFBSUk0xVDBtYzh0UDlPL0ptajczZUphT09yV0VGaC9R?=
 =?utf-8?B?M0NHWnFQenZNeDM3S2I1WHdreTA2M1hlTFlMSDhSUHRLRDNuTVpROTAwbjQv?=
 =?utf-8?B?SzhCOWh0Z2V1WFdJU3pydDlrMlB2dDdMT3o1cGZOY0NXZ1h5YnhyTit1TTVj?=
 =?utf-8?B?QlVwVUtLNEdDUjNvckRqVVRnSDhrbk4va093dGttUHp2NUQrOTZId3NZMVhr?=
 =?utf-8?B?b0k1blFkNXZ4SCt5aUtTNmR6WlRiSHpXbmdwWjBGWFl6RUYzbktWVDJBUzZM?=
 =?utf-8?B?UmwrNDRaV1RQSERvVlE1SWl1REtOazlvdWdKZk1DWW9pdWUvSFRiNlZkcHVF?=
 =?utf-8?B?L2N4d3E4V2pDdzdnVUtDVWZ1Ris2alRRcUxSbWpKQVNidGNoYTlNK2hzTm1M?=
 =?utf-8?B?UUUzTGpMZHkxbVhTOW4vVUp3eGZuTFMwZnZNOFQzVUpSSTdKT05ZYzBMQUxa?=
 =?utf-8?B?QnA1cFRueGlxOStZMUR0ZCt6eVVIa3VkZDZPRlR4UlZrTXBaeXRlalhhekZI?=
 =?utf-8?B?QzBSKzJIczRTNVRBOEFvdTNkeXZYOVRYUWNjVlc0aXlzVnFGQ2lRVUY0ak9O?=
 =?utf-8?B?c1lRUXlUSnBIV0JtU3hpWlBYcGY2Y2lyYUdwUncrNWJZcUVNOVNhT2l1eWdL?=
 =?utf-8?B?VTRvZThJUlFuK0JGU1l1YVE3WTQ4YmdCN20wRjUxblhtZHk4eGhkSG9PY0hr?=
 =?utf-8?B?Vy9mVjNGZTg3YjJFdzNGemhTaHE5c1h3MkptZWhZcHR4NnpQbitGbTdaMW15?=
 =?utf-8?B?K0pYYXN3OFlOQVNwL3l2anF1SnN4VG9vWHJMQnErQkpEMnZxZzYrbENkZllS?=
 =?utf-8?B?TUZzODlRT0J2SE9qTXFwakZveG9NSURLbEdHalZnemVhQnF6cFZmSk1pY0xP?=
 =?utf-8?Q?QZp3tgtdEWZZey/s2RoSvuOkhKsEU89l9htuNjquxjf9q?=
X-MS-Exchange-AntiSpam-MessageData-1: 0RDSyksoDSaEqg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdc3cabe-d82a-43eb-8b0c-08de6eba0353
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 06:50:33.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iG6lERmQBYNwOb+mNvrW524qz+Q0IeXigNdiOJjuTXWmfQuzyjo6hHIXOD984FdyVcfriBlr0m4TOXTqno+zlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791
Message-ID-Hash: ERKCGYJUPWP3CRYPJJBW4UA46KDNPV2R
X-Message-ID-Hash: ERKCGYJUPWP3CRYPJJBW4UA46KDNPV2R
X-MailFrom: ecourtney@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ERKCGYJUPWP3CRYPJJBW4UA46KDNPV2R/>
Archived-At: 
 <https://lore.freedesktop.org/DGHVZCZ3D5DY.35YV1XN6UK2QQ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 12:23 PM JST, Alexandre Courbot wrote:
>> +/// Maximum size of a single GSP command in bytes.
>> +///
>> +/// A single command can span up to 16 GSP pages.
>> +pub(crate) const MSGQ_MSG_SIZE_MAX: usize =3D GSP_PAGE_SIZE * 16;
>
> Where does this limitation come from? Is there a value in OpenRM that we
> can add to the bindings as the source of truth?

This is a GSP protocol level limitation. And yes, there's a constant
so I'll add that to the bindings. Thanks!

>
>> +
>>  /// Circular buffer of a [`Msgq`].
>>  ///
>>  /// This area of memory is to be shared between the driver and the GSP =
to exchange commands or
>> @@ -329,8 +334,11 @@ fn allocate_command(&mut self, size: usize) -> Resu=
lt<GspCommand<'_>> {
>>      /// # Errors
>>      ///
>>      /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>> -    /// - `EIO` if the command header is not properly aligned.
>> +    /// - `EIO` if the command header is not properly aligned or sizing=
 is impossible.
>
> `sizing is impossible` should be its own error - probably `EMSGSIZE`
> (which would need to be added to `kernel/error.rs` in its own patch).
> Also the wording sounds a bit confusing to me, why not say "if the
> command is larger than `MSGQ_MSG_SIZE_MAX`"?

Do you mean in its own patch in this series, or sent as a separate patch
to a different tree (e.g. rfl)?

Tangential but I feel like some of the errors in this file are a bit
odd, like the existing EIO if the command doesn't fit (which it always
should). WDYT?
