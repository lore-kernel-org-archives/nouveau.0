Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B986AFF8875
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 23:40:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADBB10E379;
	Tue, 28 Apr 2026 23:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d4hW+geX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 03A0F45D12;
	Tue, 28 Apr 2026 23:28:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777418885;
 b=WGzFuGTq9vpnS6DkL62pDkKAWwFqld2NEFy/jIG/bL4qve9GTiqBQ5EfisV/zQ1GFfO+r
 Tou/orzNJXMMj7ixYefCBsE7ZyvJUFpSyy1Zr8Jg8Qvhh0nhfBFeLw9sQQKmqM5BURdW3mK
 r5uGc8BttWGiLuPpdB7wocGHiaBtz1phWCi6EwZLURyjNdaYWy0qIEoTaIwVlWGkqePioWP
 klVMs2kdJKTvk5OALIVBZRoTm3QfZJxLqBjU6rOviQ+lCMciPVk9zbctJvbKyILodjrAMrM
 FAZGe3JWAaq6s/sbfmIlzR8bpJ4UlYyWzU2UovgNtOKVR9OeHTFEHOt2DKUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777418885; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HO9KOkO7OpdXGg+c1TV6vuzAbBeMdN9fl25B/V9Z72Q=;
 b=FO1tcPtyt4izr82cqo5Q9Z5wHiVR/zWG3U/AjP2ZZ3CsWgooy8gXB4ZBAPBCIskgIwymd
 WQyXLO6clZSGLT2sT+MI8X3Hjt4KfjYOYOEI6Iz/D1VEMqfdEQJ5sW2/TUGLc7pM4RJ3Pez
 2BOueMBZep0s3CIRVSjbO5+/z96iM+6O4KMelOSzaEwiYsEasumvxwEsBCaF1n2YJKPLGOT
 ySJnW4x30keoDG6KjH3ZayTwDhGd8BEB/9MnMB84j9b/mAAvSxVATLDYkLfjIdPU2jM6PAT
 ddofKduMMbo70IRnnWbJNnPzuqLoMEJuE8IJi+CUUpFXFjsZjY5EgLEBzYAw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C2C0644C05
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 23:28:01 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011005.outbound.protection.outlook.com
 [40.93.194.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9678910E107
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 23:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiKCUiSULx0ZLpxPybmQlmZoydyWtPWT6SOUgvQ9HzcAGyteE9SVNZUktwcB+D1y08opeVayfKkZTNx5xRiFJapf/9yrFJcyh9T7VvBUDNqEq4REExmkwEKNhfHZjh0Ggrc3sL6/lYLWBkxPP2b+H79FSWu7k1fP14AHQofZXYSvMIElxToR8fn0KUManDwc0XUDMPgIVQERNxhmWgQvzsuKcRt19q5w7nfj0rSw5/AiFDyEG65+21VexOipL33OV9wRCrnhhPCYGiZbAhQR1vhDl+O3Kw4GXGqMkpCGZx1fXyS8/Uq0X6O9XfyjMrTrVCAHYcjd7OhiKYIutpbOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO9KOkO7OpdXGg+c1TV6vuzAbBeMdN9fl25B/V9Z72Q=;
 b=rv8vZjAGidjexmAJQgQ5VgiRTnq5iOwmObU3r6hzw8Gc74yrQl3t3rZLStBss8wXkzu37o6ttRsZRqRr4ybejbfhH+u6txepEcQDmyggdTu7AxhrEjZzPWmTLV7JBeY9N/MDMeNYSdDGfBpZ6xZ8pK/fU9enRtmcc0jtkjJdm/khhdsLySNe9ez/ImjenWvUBFmmU8BWbATmWoV/qC4Ge/HkOP52/s0dT2NtzwUpc9wRIf+t6lt4EKZuBidzZzfgsE8vbP8vaRfOnnTmRwSKm1KfOjW5uveNEKGBkRgwlEuk6ldIXFDSkPzTQntp1Y6m+L19hBCYeGYSXQO6n9a6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO9KOkO7OpdXGg+c1TV6vuzAbBeMdN9fl25B/V9Z72Q=;
 b=d4hW+geXbSErD1uw5cg6Xtc+F1SKiXXIubNhaqTgiugS9xCC20CzM1POadT133SjY6BE3ZBFNpgiI/rOHpFewJ/YXt0pi7U9ssTAAodDO8N+Y/Zv3VXPJWv9NesXoMS5AAV2QIShJJOtvK7Y6pufvsEYOqPJu5haUjr5P/tEtspMp03ZK7zdlWl7GRwue9n4waIRqojvyJGCO+RUPy2EsVDVkNldn1MA6yUa+IEiqBJqX/BnDZSS8Z03BHtg8MJjAdP1Ywd9MPrvoTZqkXtVdwfFK0Nn3JOliCT/Ng9zgtI1QgupXhEqji4F8UVHDVHYPPSDRM9jtHrbggrSWimk8Q==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 23:40:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 23:40:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 08:40:15 +0900
Message-Id: <DI56O35NJPAX.2U44IJH992MXH@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: program_brom cannot fail
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260205225922.2158430-1-ttabi@nvidia.com>
 <DHKF9H2IXXTN.BFAAJBF0NQLH@nvidia.com>
In-Reply-To: <DHKF9H2IXXTN.BFAAJBF0NQLH@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d96def3-4617-442b-af1b-08dea57f8243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Xz7JWMeYYBLBY6kXbs/AYaSMbdMcNvr8g7iuBPtuF2OooAfTyb8E5n5MmCLy1AeWvnnBo1htcNqYh5feEZbjhcukT2KRLNyBp2Tqk4ucHL9sEOLPAWoMzTp/UgkVZ7IvFAvv26Y5y7ZhiwpDERKR9iqVc1u+rolCDiMSkskyDeZeLyjAWHrAMODVut/JbJ5rT5XbctZu/OcM03nqBlm+wTsyxNLSsYVjyLLUhjbyic98O/s1uszq7wG/fKfYYVOdBQQDB+Xyc3oTWYvNm16GyR13vKjeeVloa8bOF5dfPRJdmrx2K0xTj6R5X8UaUHjfBSfSyWOoT29mDGYAaUY+gUZWi5JVZjjUWg7TR0P+pm0yGBUa23fuqxBh1taRkQlH+RMe85qnsyXmb/tS9c2v3K5eVBrNpiQkeFcHKS9cUBnTaqB/dDv/VZJXzk28alMO9RIZdU9Z0FKsH38Jl7q9DpKxUOZSumS7Gdl4rAqNP+lnuW50O72+Giuy3Smq5M/Cp/bOIKJgERA36tG6cu57lzbda1ai4OEZ0mWrMhvtfR0/40VYoxHvLhb0NLirLMzyidaDPUSQtvYfjnA6NLdEWNph0HYUIRP/7l7cEsWKjG/ce9clM9xnSOefL+Icn2Mkq/2qYH/KVD09hNJU4eRNAQaW5tRcD3B+ZINor3BBwuJY7dnhKQPDCSXfIR07+7OzcawaEnleOCLKLjnYtkv3sKbBrgb3a6PMvzZf6EVm1ro=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clU2N3l0R1l2aTROL1UyazdoMUtBTm04OGd1V2FJdDVBMytUSEdwVFhwWlNi?=
 =?utf-8?B?QzJPSlRkUnpWNEJQQVg0L1pHUmgrVWRJWXFnbDgwamw5bG8rQU1LbE1JTXJr?=
 =?utf-8?B?dGNHL2VnWXB2bDdwNVZTVE85Qm9EU0pTR1lLb2w2cEVFMkpQWlNvc0tBZUtk?=
 =?utf-8?B?Qzh3SlJ1VHJyM0hwbWE1elRXT1dWNEdkTnJLckVKNzFmcWtuTks5MmxTeUdq?=
 =?utf-8?B?ZVNPaGRGMFdCZFR3ZnpKd3l4bE5aZlJWellzNHNZT1hPc0dGSVFDaWRWd0Zr?=
 =?utf-8?B?V01CZHdsclQyYi85UWR0akhjYWF2TE9WSmVPN1ZWdllrZHZTeXJQMENEbG8z?=
 =?utf-8?B?azZPMHF0N3dBa1lRMUVIb1RDV0hHeUtlZFFsVjl3QjFoRFkzNjk1WkhnOXR6?=
 =?utf-8?B?cXBaY1A5S0xGUHkzRFNpMkZJU25lWlFuak45OVNKMDNIbCtNcVJ1M1dNT2lW?=
 =?utf-8?B?b2o2OE5hQ3Y3OEVtWDRVT25Ib1hENUZEa2JDd0VkdnhycnhuVm1hdWlNUUlC?=
 =?utf-8?B?ZGpoS3R2SmhaN1ZFVkNvMEFZalVTcTFkN0E4akM0dmRtcVZlT0FwWDRjdXRp?=
 =?utf-8?B?MnRuWEVCZjNYS21jNHlYQmFtNmJnRk9hMzhoaGk3a3Fud3JFZ3E4TUZXZkJi?=
 =?utf-8?B?VDdJWG96UzB6dFV6M0F2MUlobTB3ZFI4WHl4ZjQ4UVMyYitaTGpveXBIZitp?=
 =?utf-8?B?LzQ3ckgzbExuZ01FRVZlNldaWDBIL3pqdTFlVXg3Y3ppd0V5elpjSnI3Z0kx?=
 =?utf-8?B?WHdoTnkwZnJZQUlHK0ZCQzhnRFl1MzNPTTA0YzQ0MXVwaFczVDFxdmVIbkJM?=
 =?utf-8?B?OHM3Vmp6ZWhVcEh3Z3FpbVJ3MUFoNVEvNkx0RDhrcG5jQitETkFvb05FRFhE?=
 =?utf-8?B?RWxvazh3YVlqNTRyUWkyWEtoQy9GdzU5ZjNZb2p1Qyt5Nk14QXN2TEZ0M2Jm?=
 =?utf-8?B?RTdJSDdYZkduNXlJNUkvbWVwT2crY1FlWGtGcnpIZ2FmMThYcFpnR2JXMHhm?=
 =?utf-8?B?T3RTLzNvcHNFbkRLK2RJd0NJYW1maDl3ZXVUc0NjRmkrdkszSTdRVGNJamF6?=
 =?utf-8?B?SjEzRVEyN0IxZ2J6cktTRWVuY3paMnNMNXhCUTRhd3R0UEdGNUNRZXJaWWk0?=
 =?utf-8?B?RlFkdENtZTIzREdRMHZOZ0VEcXhlVE9uZUIzUnRab0ExMmNUUmg2NHlYbllN?=
 =?utf-8?B?UG5TQlBGd3ZFeWxMYkd3UFZya0lzb2w4aUJuODlvUTUrU2F3SWNpQVBCUXF6?=
 =?utf-8?B?NkRNcDZjTEdWYkV3MGdITHN4SW9BSFYzR3NyVXpWVit3QVh0UjRjcW5RTnM1?=
 =?utf-8?B?MVVySWZ0OC95cmhITjRBQ2pCU3dTTGoyOTR4V2lubWVsQXFqVElSam1ZUjgv?=
 =?utf-8?B?MEJhNFR4ZHRNYXJneHJOWXA0YnpOcjdDTXNYc08waFA2TERheWZEMCtRa2pT?=
 =?utf-8?B?NzRSbCs2emEzLzZwS0taTmppNG1lc2JhY0lLRkRkREVrMXdFNzVaN1RhOHpS?=
 =?utf-8?B?WnlFbnBMeU5lWVgybjVDcnJLYzdrbXFLemxGVzdtOHB1Z1FrelNES1piSllF?=
 =?utf-8?B?ZnJ3NmJGaElYT21paURFbnoraXN6akV0UFZHYjBtbmhPMWJVSFgvRmNUb2NR?=
 =?utf-8?B?REVyRGt0Vk50UWFGTU1ESFM5U3oyMW5GOGhIZWs5ZlpWaXlzSnBGbkdnbWZj?=
 =?utf-8?B?RGJ0WEcrbUR0eXdQOGRhL1hUSklZellUQTF0YVpnVHNPQ0VaNS83a2ExTTA2?=
 =?utf-8?B?eFZTOWxOTzZsb1d2TGYyQTlZMGppT29mWkM1Ri93c0tPYlV2WkUyS3huL24x?=
 =?utf-8?B?dnMzb1RCMkZGTVl4MVlpb3pCU3kyTEdIOThGenhGQnRoNzZVTWQwOFhycTUz?=
 =?utf-8?B?aDl4Ky9pRWFHcUU3a3F6UjFURlBLRmU1d2N3bWZHcEFvQU9FdFVqcE92YkMx?=
 =?utf-8?B?VE1Tc1g3NmNseGl3Znk0R2VBTC93T3ZPZ0YzU3Q2eWhaQnVFRnVqTXVsUWxv?=
 =?utf-8?B?dmJFdDZSUVIwU2o5dVZKeGpqbHc1cjZJNVd6ZnM2VzYySE5YUHM3VUM2bm1Q?=
 =?utf-8?B?b0RSMG9WUmpSTVFsbjhUbVNMc0owbUxPOVM2Nmp0Nm5qYm1kaUd4Um8zYnhp?=
 =?utf-8?B?R2lNcUlNTURTREZZRXFoUWc5QW1oRXN0bVlpdUtKNS9WaG5vNndhNlJwczZK?=
 =?utf-8?B?bXhsdGEzRk5wTzc1cjF5M21jTlBWTlRPTkdIUWxlNHo1MDZCbnlXRnk5TFRK?=
 =?utf-8?B?dTI5bkJMbmhkSjRnQTNOM3pmNU02SXljUkhraTg2TGZvK0gzdkZDd1VTZVNV?=
 =?utf-8?B?cldwb3VDVWdELzJ4NUJjZ2lXd3dwTlVKWTRUc0lqZXZ1QWc2ZWM3NFd0NDIx?=
 =?utf-8?Q?6Auk13TSFUXwmuQp7CHbGceNAEf53HLLD6JsRY7JSfCaZ?=
X-MS-Exchange-AntiSpam-MessageData-1: MOYSp4oH6pdoTQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d96def3-4617-442b-af1b-08dea57f8243
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:40:20.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZeoVOcd2hPwydKHLVafWjL44HbttpcSJtoGVidtU7A3RNzTKmDV7yovV+u1jdNBX6Vqai885opiVoL2eah6cmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588
Message-ID-Hash: IS76EEONTQCONXHUBNJ7MHEPLGUJID5X
X-Message-ID-Hash: IS76EEONTQCONXHUBNJ7MHEPLGUJID5X
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IS76EEONTQCONXHUBNJ7MHEPLGUJID5X/>
Archived-At: 
 <https://lore.freedesktop.org/DI56O35NJPAX.2U44IJH992MXH@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Apr 4, 2026 at 10:58 PM JST, Alexandre Courbot wrote:
> On Fri Feb 6, 2026 at 7:59 AM JST, Timur Tabi wrote:
>> Change the signature of the program_brom HAL method to not return
>> anything.  None of the implementations can actually fail, so they
>> always return Ok(()).
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>
> Somehow this patch went under the radar, but it is still applicable (and
> obviously correct). I've scheduled it for merging after `drm-rust-next`
> reopens.

Pushed to `drm-rust-next`, thanks!
