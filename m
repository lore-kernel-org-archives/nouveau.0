Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BA7C6369E
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 01:14:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 873A510E1E9;
	Mon, 23 Feb 2026 01:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DUiGuMy9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D14A4348A;
	Mon, 23 Feb 2026 01:04:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771808640;
 b=XkOQLBFxw3wTnqYKwKiEqjCz+EaKWvK8VT9Sid/Lz5MiFEn7wKDgX2rptB3UuxnQ1T36U
 MPC4J1/R/zKH3Ru7fhiI0Suu3UM+BByUkBNXrgRjj9RxFFhNpfXJqYMefYBsSjMIzD/Z3Ka
 NTK2N8f68hy8SI/Yo9ZJpZ++7WkToM63seJcKAJ2bWkWuBE2Z1BztK4ta4ShuMxZKvjxWoQ
 bZ/zqzU85NT15U3PzoCkSK+H04TKQJDzvLNr0KImK1Su4vg5JJ+7oSktL8rosDB/YQeQV0K
 vtLwvKhSmUnCJtlNyeE2qRxigLUlljJkJeVEwV5Y17s4oHoRBi9XNmwfTYtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771808640; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5wIidq+q31N9H6VrgBtD8WcQ6VCdY82Fy7tMK+Xbd3A=;
 b=vGbNyyoQynQu6GRLZnEBbKZ8N1W7IwJSYbswm0mp3pHGE+I2PViNMjBc1wTOUmVLDsZsp
 CMOcVxf6W9kjUqeLXWSsVwqQU7tGvihpSh2kQIjFMGDNg78V5GfHY8tCw19781X2ylAQ0HI
 Ned+u/vlOOSiOL8ukSsqiYL3w+KCNMxzPuSA5JQvKN0GP0XIr/VWCkD5vm8HDat/xjBQJPf
 sfQ0tNFcbOg4lTJv93gAcadnU+eWrDMMw/bOkQZK2GNtQuo2wAlJB+su+ziVFgI82/fl8K8
 vOEwgDLoOFsL1QJ5XEI6U4YUhS5tawiwr4ScYhL06CEYYuT+ka+iO7Arv4cw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 034BB40371
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 01:03:58 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A390110E0BC;
	Mon, 23 Feb 2026 01:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnAY7vEyZ1x5TZhrRZ8efhhcMHKhaNFla5rr0rauvUkvqtPdDXZy7WIvE+ZeB7D7KE0kkWfPS5AM+vY19Euk4FtsJ1llz9n/5GkwnbTYsH0+62FrK82BRMN9bkCG0cgnbWbqNQGJL+51QMirAscjCyFpGJEKimZCxEmXNfrawD5uzqBrQ2uPdzVl0qgliyyS/C/njacZsz/SobenbMpMlKmipiSq1ceh+neVy2BvdIZvflc6pv/03GH+seqKUB+xKfrg6VinfmE3f/OOVvoNBtLEsLOvwHCrn7KrAsknDwa6RaQS053hzGhvJxZi81heg6jDqcntjTjEgNff7oU4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wIidq+q31N9H6VrgBtD8WcQ6VCdY82Fy7tMK+Xbd3A=;
 b=FWK3R7mzBUaHLeXEvRSUFxj6fUw+o+LjAYZHccvC0UQdCNB8/VEHq+AIid4mW2knKSSzK3g+QEIPsDUjCdk24pfoTcrfmq/GrwidXzTA5XITMop/hB7Q5Rvfvk2ldr6kyA4XwOHss4/sqX2JmnhVftrqqdJNwE70wlAL54uI1gXpeceCuyTozyXDPsyRKghJgG0bv0DKzcwmDmWct1KKhT3RoxyqFYQUZ0/LrlCpi/Ce4OMnCXivB/K4OEv5WW99ag8OvCfPPjR74Euk6WEEQAHDzbpAlaZMOU7XbvdClyQHjiDw4WcXHGnQ62o29VZkhVD948kIt7A9sFzWKWZuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wIidq+q31N9H6VrgBtD8WcQ6VCdY82Fy7tMK+Xbd3A=;
 b=DUiGuMy9585e6siPvHk0CEjAo84kYi1PHUM4LcM9t0LSTxf8G68s+YRVoPw9gFgZ1TWwXPbh3ZVGRqCZ4a1EKOUkCtdLSp9gRtPgkJmNhE+s7lBfb460yDhdujHT0Gyd/oO7AdKW2HTnqfi51rOj0cPmJ5zYW8nJKvaG7LnN5TDEtgzsIo1nHcVKARcy5LcR5dGKlacLOceXasDIueM8v24Mi92HTecHHwfSUD/XRxlNyTKaJv5SwtrsYNVb0QzXlWl87O88+g0fDR3WiYbjIm4z4QR0wmKwPU9cVJmE2Qi2ql2pbqwlfmiUjdBrZ7KsgWBETl7zDX+QenUstetGtw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 01:13:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 01:13:52 +0000
Message-ID: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
Date: Sun, 22 Feb 2026 20:13:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: f5640752-1434-4e94-2b2d-08de7278ce98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjVHZGE2SDQ0Ykh6NmgxTnlaNGxJTDBQYksxaUk3SzBmQnpuMWZQSG55RjY0?=
 =?utf-8?B?b3NwcWp2WkFqRkkycy90TkJDNlIrbUNVWmpQWGQraUdkcFV1cWJzYWdQU1E4?=
 =?utf-8?B?WnlFR0JjZG1PT2VoSUdjdndaMVU5UHJiYlBWeW94a3RHNytsT05LaFcvZVAr?=
 =?utf-8?B?eGNxUENJMTBBbk5pd0ZYQ0c4aHlnOTQ5bWx6NWhVT0xRT2h3R00zTUlVOVFw?=
 =?utf-8?B?Q0c5c1JwYllpdUF2U2pLbERGZCsxaTlIbDZyY2U2TXN5NFVPYXZWQmpLaWhh?=
 =?utf-8?B?K0FUU0pNd2dFRGNVUHBWVmtOMlpNTFpOcUhBS3lSVGcyeExWRytJc2tWM2or?=
 =?utf-8?B?ckFReHozMGt0NmdwdFBoTTFZWnNIaFdnaXpqRlRUS0hRYjQyL3M2MktQQTZj?=
 =?utf-8?B?bVEvL0RZc2lKeXBsZjZXWkJSY3A4KzEwMnZsUm9xK3h0LzE1WEFwMWFwNThp?=
 =?utf-8?B?QU5rYTN2S01tcXVYbURxVmxWY0dhV0RLbndnVWpoeXFEekU5U0lGTlptWlhu?=
 =?utf-8?B?bzNVYWo1UlNvOHpTUngweExaSi9CbG10QlJkeVRaeU92MCtQa3NVVnZ5Q2lx?=
 =?utf-8?B?MTZCVk51MEJKa0NOVnVNbldKSFZ3b1g5TEE2T0cydzlqN3FJUnpYYU9RR2p6?=
 =?utf-8?B?WHU0V2dvd0U3ZEpyTTFzUWNnblgwcGlGc3I4UUp1UEhFWFIwTnBXYmZrbmpL?=
 =?utf-8?B?bjlKaThYWmlxSFNzR2lUbThwd2Njc0hZQmxZRHhPZTB3V0xSY1hJaWJVR2V5?=
 =?utf-8?B?WkhkMjhFdldhSUJFMjBKdWhudjVPd295M3pHNnRMbE16QVQ2RCtmZldRcTdG?=
 =?utf-8?B?cnZLZkZTSHBUSXF5TGdXem9NYVNjV1NRMERnSHp4cXNPTTFpR3BMUFVPTzhj?=
 =?utf-8?B?bUl1Yzh6WGpoVkV6OXRFenVVT1BnVGh2S3dBc2tzN3JWYWkwMm0zVEQvTUJj?=
 =?utf-8?B?R3k3dCt3bmRMcnh3N3JHTmVhSzNsUTFyczFNMkFxVVQzczZSMnFYNEdITzFa?=
 =?utf-8?B?UjJHSC9WNVJMdU5UNC95dXRvTm9YTGY5UmI4ajhVV1NmNjdoRXk0cERBTC9F?=
 =?utf-8?B?ajZ4YytYTjZiZTdnM3hrM3FtWE1JenhqKzNQRytYbUNNeHl3WUxLaHVURlVx?=
 =?utf-8?B?S1UxYVpOV1pud3Z1Z1VzMzFZRmNhaDNjTWdyYmZrSzdMK2VaaWt4b04zRjJD?=
 =?utf-8?B?NVJVaTk5bGlVbHpQeCtXUGpBYkZXUlV2Q3JXMU1iZGxMOTVDV0UvR0F0enFr?=
 =?utf-8?B?MU1nVzArV2hJTm1SdTRtNzFLUDBKT2NQRXRnTEErQm83QWsxYmVISHVsWCtk?=
 =?utf-8?B?YTZxTVFVL2E1OUU4V3B1UjhPaHZDRkhaSDZvOE9scFVCZVVBd3kyRVJLMXJh?=
 =?utf-8?B?a1Vhamh4RDNkc1dkUTdUQURweFhTa1grbW5uQk1NYWprbXA2WWRsU3psRjEz?=
 =?utf-8?B?VWVFSUFnWXExQk1nYmJlOXAxRzZaSlRXM3Z3cU1UN1VwUGxuQllJdXR6d2l4?=
 =?utf-8?B?TGVPY25pYjlhTE1SQ29SY0dWQmROU0tXVnBCMENEY09GT3NBQ2pkbHFZOW95?=
 =?utf-8?B?Mm5oZ0RGWk1OUXF6OWJNeGRpRGxvTkt4ZUoxaUlTQjlIeDZ0bG5OUUhEamFo?=
 =?utf-8?B?aEVwdW5GYnQyK0ZRemZVcC9ER1dQOUlNdjFRbytJeExzeWhIUEZlVVo3SDlH?=
 =?utf-8?B?bXBwc2QvdXlLaFpZY2NkQkpTOWcrSm4ySEJGanhYSjdjS25KdlN0dDNKUmhI?=
 =?utf-8?B?RjJlOE5oT0Fzb0xUaEVsWnBBbWdvbjh4bkxBZzk3cjRDQTlabHR3Wk1jYXFl?=
 =?utf-8?B?MHNWVDNRWEcvTUk4VjhJNU8yS1VrK3pjUDNxVlphN29YOVZZNmVacXprbzBx?=
 =?utf-8?B?MjcrYTMzRUZObkZQL2orR0VaU1JYMlZpRmk2NWZ3eXZmMmpiNkR6ZEhzQ29i?=
 =?utf-8?B?cldVY0pHeUU3K0k0MmoxSzI3aEtWb2lVbTBEeWxMc0tZcUJOTVllcXlVL3ps?=
 =?utf-8?B?U2RGU1k5L0lnUXVHTklISkEwdHJiSVZJN29YaFk0VkdhZEQxc3I4aWRVdFp5?=
 =?utf-8?B?RmdlOEE4QXJQMVY2bmRaUFNldG9DMitveTFMS1lkN2NtUU9vZFBDdzZqZEVI?=
 =?utf-8?B?NVZpOHBia3RWWTFEQW9XcldmQXVFajBSbzJscHJMempabHBKVFJMeHRubGQ0?=
 =?utf-8?B?SkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGcxNFphWFBUZ0tLU3BTNHpodFJIc3pvREc4YXZNWVlTUmxsSXc4UExVSUVI?=
 =?utf-8?B?WUdVVkFmLzNTbkdKWFN0TTJKb2FySkFGTWFMUmh2d2xGUnNVaTUyTUNBOUta?=
 =?utf-8?B?MjZCOCtuRlNad2wxR1V3a1RxUnpYVTRUMjBUeUJRTEZJdFpkNlNCTlcvalRX?=
 =?utf-8?B?djQ4SjJJNFQ2UTk0eUFkeGJ5WUd4Q2hyMEYyYWxkWmZiNVdtTng3a0t4Mkxv?=
 =?utf-8?B?UVNqczdQaDdQeno2RDBNK1YvVUVnNXdrTWo0UFN2aDhvRm1QK1R1UEROTGJS?=
 =?utf-8?B?T3NRcFlPSk1qQW92Q1pxNFJ0THdCeThVN0R6N0xxSDk3QnZhYnZZYlgyaXBl?=
 =?utf-8?B?eERrLzFPeFlYaUFQTXVRMlZHQ1NDdFhWRTd5MGdhS0pKemFyM3U3YkJvQU9N?=
 =?utf-8?B?MmlzSTIrNUw4TEpERFdLNUVoWkdTWFI3anNEUEp1Mmt4U1BYRnUyYkN5d0x1?=
 =?utf-8?B?ZXZiU1haQ2hHcjZlNkQvTUlVOFRZaUc1R2FaTXdkdVdXOTZvRklDQ1B4OWVU?=
 =?utf-8?B?Z3BQWHZabm5IbndBYU8zUHBicnN5ajNucjJ2aHU5UjdmVW1qbitFQ1JJWWd4?=
 =?utf-8?B?TmN2MGxBaUxUTkV0TkFsczRNVlJWWE1aWWdmbnd2dVpOWUdscElxb1lGd1pa?=
 =?utf-8?B?N0lDakFuLzl6clRQVjdNdXRUSlpydVFiY0lrdTlPZGVFYnAyaW15aWFUMURG?=
 =?utf-8?B?M3BJL2FaNWd6dDhNOXdBd2tOdkhFaWJxOWswc2t0REd2VklUZ1B3V05uc3g3?=
 =?utf-8?B?L3lMdU1UU3VlRXFPbXFoVG9HemdyWU43RXg4S2pzN2xIRitrWHBKczh1VVdP?=
 =?utf-8?B?UC9KWDJuQnVMZmVYRGt1ZjlCSGxLdHJSWnZjOXd0MVlxc0RuREFRdHZiMkJ4?=
 =?utf-8?B?WGJpa2FJUUQzejVZUnE0SXhBa1dGdWkreUY0eks0bGFvUFRoblpjbS8vZGF6?=
 =?utf-8?B?VVBSRWQ2aHEvZjVXeDI5Q1pvdzNyNDJZc0tLbDFvZGlMQ2FRbmt3RE9ZWUEr?=
 =?utf-8?B?ZW1YRHozQ3Q0Q0oxelo3RWdzNmUwNUJISXNkSGQxYkV2a04xUVZ4WkYrbkhK?=
 =?utf-8?B?Nk9qYnRGbHhHM0I2NCsyQzhPcjJEbWRzazdlOTBoVkhqcnF3S1UzVW1ET3ZN?=
 =?utf-8?B?bk9sZnNEaVBZc3Q5U0lxZ0k2M2d0SU5ObzlvUExuL2pBNllkN3F0L2YvaFNi?=
 =?utf-8?B?NDN4Z1k4emNxT2FEVnduejYrT3hvbzJwR2dZQXE5dXJDQ1JqbUR3WFNKaitE?=
 =?utf-8?B?NjB4N0JSUmxRNmtZR1U2Rm12WjFMcWVudFEzc1AvZ0N0bXdsTjZmNXowMENW?=
 =?utf-8?B?UlJWM0x4Z3g0czluYndxdUhoMnQzMlZRbUo2VWtTUHF4eGJtdHlzMmtDZmI4?=
 =?utf-8?B?Y1JaMFF6Vjk2YkpHVGNwcXNOaXVTVVp0REoyYXRiME4vbmNiUzk4aEFHdVJK?=
 =?utf-8?B?TnA3YU9tbVFvZjdUR1BDY0NReTJESXVCQ0I1dytSVzVrRzRZMEdMUHRGMlkz?=
 =?utf-8?B?TDE1U0FNeDc3N3gvbUdQeWtuS2c4cys2Wkp5YUVkdXUydEc5Z3cwUWpURzZL?=
 =?utf-8?B?cGdRdEFPR29NVWdLV3Aza1Axb2d0aE1MTjRpeEt0cDJaYVE5T2NDelBheWU0?=
 =?utf-8?B?VTVUMlJQdUp1cll0TVNZQi8yU0NkZ1JoQWRLenc4ZlZXVDdPNTJUYnM4SFRa?=
 =?utf-8?B?ZXlFQ0ZLRDUwY2NqRVFKaUxVTCtSN0NpUUkwenFjWkNrcmN2TmcrU09jbkRn?=
 =?utf-8?B?NVdvT0R1YWt4SVUycGJXKy9iLzhhM25mdXVJVTkwZzJPVTdwVDliRG9uTjJj?=
 =?utf-8?B?R2RxRFVTd0ZzaDhXa0F6d3JVb3Vqb2NPRHlMVmFrQ2V1YzNBRytUS0ovb0pQ?=
 =?utf-8?B?Qk9NK1diaHFjWGg5V1BGQXVBOUppWTRVcGRiQnBEUFEydXViaTFLN2hweWNy?=
 =?utf-8?B?TmkxS0g5amMzZEpJWkpzNmt3WUtGVVVMdFVUU0ZOOUw0UU81YlR2TUdFcXRt?=
 =?utf-8?B?bmJVYk1QS3RRVFhiWWgxcHdWa080OTg5M0ZWTS9QZExneUhNQ2FwQlZZQUE5?=
 =?utf-8?B?T0o3REJFNHhQa1NxS2g1UzdON1o5cWp4VEVIQTZ0WHFpMjBnYmt5bjUzWTJD?=
 =?utf-8?B?bkowdEc0NEdaOEdQQmFRajFWVlpIY1djQmZjelJsRDcwQm5LTk1oYTAvek9O?=
 =?utf-8?B?ZnVYVnF1YXBpdDEwcnFaVUVsNWtLRXIydEljQlFtVjhZV0cyemdta3RPM0dh?=
 =?utf-8?B?OFppSjBES2hLTElvRzJtVGVYNTRMcUM1WDFTQ1k5eVhFTDA2Z05VaXByUTA3?=
 =?utf-8?B?MUZncEJIQzlpblNVMXphU1Y1dnFYV0VPYXFhMGcvQm9FdEpjZ3hudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5640752-1434-4e94-2b2d-08de7278ce98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 01:13:52.4005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j2imtI1c9woMzjWbzNN2vmWb+RkFbjMSuu+Fb+hZnTmCcreQoaA1DwN64jZTDLD/iz2fgSt6IioZBwxHx5F+uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983
Message-ID-Hash: FZ44REBJR5R5WRBE7HH3LZPNACL2A7TI
X-Message-ID-Hash: FZ44REBJR5R5WRBE7HH3LZPNACL2A7TI
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FZ44REBJR5R5WRBE7HH3LZPNACL2A7TI/>
Archived-At: 
 <https://lore.freedesktop.org/a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Eliot,

On 2/20/2026 3:16 AM, Eliot Courtney wrote:
> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>> +/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
>> +///
>> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
>> +/// linked via the `$field` field in the underlying C struct `$c_type`.
>> +///
>> +/// # Arguments
>> +///
>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>> +/// - `$rust_type`: Each item's rust wrapper type.
>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>> +/// - `$field`: The name of the `list_head` field within the C struct.
>> +///
>> +/// # Safety
>> +///
>> +/// This is an unsafe macro. The caller must ensure:
>> +///
>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>> +///   unmodified for the lifetime of the rust `CList`.
>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>> +///
>> +/// # Examples
>> +///
>> +/// Refer to the examples in this module's documentation.
>> +#[macro_export]
>> +macro_rules! clist_create {
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
>> +        // Compile-time check that field path is a list_head.
>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
>> +            |p| &raw const (*p).$($field).+;
>> +
>> +        // Calculate offset and create `CList`.
>> +        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
>> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
>> +    }};
>> +}
> 
> This uses offset_of! in a way that requires the offset_of_nested
> feature, so it doesn't build in rust 1.78.0. The feature is already
> added to rust_allowed_features, so I think it's ok to add
> #![feature(offset_of_nested)].

Maybe I am missing something, but why should the feature be gated behind
that if all compiler versions (>= 1.78) support it either in a stable way
or via an unstable feature flag?

thanks,

--
Joel Fernandes


