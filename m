Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7891DEDF057
	for <nouveau@archiver.kernel.org>; Thu, 12 Feb 2026 08:26:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAFB710E6F9;
	Thu, 12 Feb 2026 08:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uCV0FCNz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8E97740469;
	Thu, 12 Feb 2026 08:16:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770884216;
 b=mUvesnLUvSG4j1+qyVvY8gecqpuFH0XMwqKyj5ChPCFjcb8PA7y6N+sfShOi/6RZROTKP
 GE8WUPpnqlbc67YdQY5Omp+GFgoe20DA48Gii0tqIGIvIm4cBgwbwWLxbB9ItJARZK9huam
 K3nrv4veoC1X4uPK/OW8T00jSM6ywIwXZQ5FH2WTgjOtPsNCUp6bvj2z77QmRg+LLoLuMHT
 LRkB9iV687+qR+k8ItqKVGMtaVtRg0xbcUn6BM9gbVYqlKCYhvYAdxdEInt5cWtqStgfTwX
 5rco5W6K1dpC29nPa7NDdr9tqLXTPD6BxMaC21cQOIle1fmvjIIO5yVe7RFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770884216; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GIL2vdEQPxcZpkw6kWd0GEdI0tuST4mPrqmveHucZF0=;
 b=FBVNl66frGjjUvHThQW6Bqy6HYLnrKp+s9wYtBszmVE8jVSN5ObV5jY0Fiy+74ZCdIC89
 6v+wTK7af/jps+Kg6csP08tlKweCTpZY+PEKfpz54yTIH+aYSoMJxkjKmJbY5vc3nGEPLou
 /ut8mN5uYnhUeXwd0Ls9OEEXoFlupHffxz8mibWIbSj0Am4qR/nQtA+xwpFglw9l2tSAirK
 /F0eK4wDX8ONJZOQ/7w1YOVU3e8xa/nmLIkeQCV7xK/+Ypc0RfQt/lVp3suRTfF6JIpL73Q
 V6UTbcfuS/sO7muw0QrMW/QohqfESk3WPsptu5ndxVMVKWIGiGYBZtKZCytg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C32C40469
	for <nouveau@lists.freedesktop.org>; Thu, 12 Feb 2026 08:16:53 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62310E10A;
	Thu, 12 Feb 2026 08:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzXGTs/LW9CQuN2H6N0h2Hl+KO/fubHTb2CHEo8B1mVnS0M8xx7/3SJl6ikeNClAWfuFxKIDvktKK7cXhYd+T7vECoHkTpR/4O/MCQAJ0rPvKLvX219fgdHDWzCCeqr27M3dvU0LBrElo0okU5+Xhl4v3zswjDMHh8JVNkEFoorEO16G0tjiiXpGT41K2mbhRD2o3FYWLF/mbTb2yY89tlYlg3VvvgTe4OvGMU547A9VZKJk9dXuHD+22UcQrSUs99XGR1ekRz5dpRPPFb3AF/uYcxu98QYqHxzssGgpcYZBKogm6b1qkNJlNlNdeT4UWoTbQqpT3VplXMqKUCHZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIL2vdEQPxcZpkw6kWd0GEdI0tuST4mPrqmveHucZF0=;
 b=xJKhGuP+UHO0bb9Z7WqFXRYO1haFf6Y6qR9tA1dBdoS6YeGdpmoAwI8MYatvslTCYyB0Lbh85Wf+sCf6O71XRK0pgKkdgcEIJvsM0Wdek4v3yTEjkmTrUrfGEzTpJ/db4rqqy9tAW109k/dNtr+/E4oDx7DhUOZhlDjs+y70NgMnA7z6XEN22iVfkmzrzQTkRBI0NHdwH6Ot1K2B/+JZYBP9Z/VIkvreuBYBFoP6ZvYkY4SDATZAEpOtyNkEJdim1bN88SrqVSAToQPTigmK04h8kMB17biEpK2jUJJvNbaXHgOyrlR/963Tu0c3Y/E6Sz1nlWqGqQBrU1WwKEN8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIL2vdEQPxcZpkw6kWd0GEdI0tuST4mPrqmveHucZF0=;
 b=uCV0FCNznAATAnlQFnAZ+ebpdprIO8w7JSReGdFFqoLbhq5HifH7g2S8fdcOtRV6TLvtrxZGXinYSevB/wqhOOAbOrE1VmmQOUCVVC+hDEhS6HIqjnjp5oyp3ZF5UTFRUQ+T6hThr6aswc2zECjQWy41aMGs54v1FJiwQ7+7LRRnOMaffS5xYV5RAmDQLkKzOogkcNzeo6TTzCApoVnlT2DS7W29d47PWcNinSqp28AYNjOd0yz0DDY6z/5kyrJplj7eftQf5XhrxuaVZvJ/Nw6QIVpyD4MED/TjMk4alqmMxCXCYu4IjPrhW3cxIlWhu0wZ02UqnrrqTOggmAve1Q==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v9 0/9] gpu: nova-core: add Turing support
Date: Thu, 12 Feb 2026 17:26:17 +0900
Message-Id: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TjBRqb4SEVGr7cVEK4Lw7y0dZ
 2DmhYKZsMAgXsh4U6EjMvSNgHVfYkBJGzNopZ3SysjzyhTDnDIm6bzz1nhsO6uAC5aenv82TrV
 +JP0O3F0AAAA=
X-Change-ID: 20260204-turing_prep-6f6f54fe1850
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb57c11-34f7-40d9-9d7f-08de6a106853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0RmK3ZvK1NkeURYUXd1WFhONzY0TVh6cU1CQ2JPUU5XWUJvMDg3QlVvRzZD?=
 =?utf-8?B?SUFuR0hZNEI1NmsxSDVyVmJsbUcwd21rSHhtaDJ2N2VtVUVxSFhyNTRNTVNG?=
 =?utf-8?B?ZEFUSG84TFVQb1lSUEo1RGhsK1FHOE5jNVVSSzdBcm02MEhOSzJSelI4bWlC?=
 =?utf-8?B?N1JpYm5lV1k0R1BFQVY1eGJkcFBRdElRZ244a3d6VG11TVFZRVA0L2Y0Z2Vi?=
 =?utf-8?B?US9KSVJ5am5IT1FvU1p1N2ZDVkdXVGR1YVZwU3l2ajdUcXZGUk42TW0wUWJO?=
 =?utf-8?B?QkUvc0N4U1RGcVJWTUt4UXNDemZxUVJxeFpweDgxekIrNGdybjNXdzF5djF0?=
 =?utf-8?B?L0ozYU5xQzFMTkNNQmNaekIzWEY0NE1lcE9HQk1NeW9UMzk3Mm9ZNjhENnNr?=
 =?utf-8?B?cGJFemZuNXR3Z2dCVzdrMmx1V0VMVjM0T1NHYW5RMEl6Y3h1cHFGYWlGOHd1?=
 =?utf-8?B?dkZwMFFnUGVXVkp2NVo3bWJvUTRjaDlEeGU1RDdJMVhtLytDV0NIa2dkWE5u?=
 =?utf-8?B?c054dHc3amdpb3grcXI4VTBNbDhxUGVlS1pXODBEZ3FXT0pvcENBRXRJR0l0?=
 =?utf-8?B?Z29IQ2VqZllRMnlzTStDcXZRUHNIZk9CTzh2UTlnUllVL1plQzhtUEdlY1VN?=
 =?utf-8?B?OWhZc2J2bUpnampUTjdPRVZFNXFHUHNneDZyN1VWTXdTUG10dGppeWpWRHA1?=
 =?utf-8?B?VFVwRmp4RXlkb3BXQjUrZDQycWZURzdOd2t0MFloZzMxZnlXQU95Qy9HRFhM?=
 =?utf-8?B?YjFpbFlaNVZ4T3NtVDNic2JjQVlXR2dZdCtIeENxVEJ0Z05CT2xuM2IwdEFn?=
 =?utf-8?B?R0FmejNaanA0NEtqTFBnaFlmNTVvQU93MnQ0SUx6ZmhBRTVGVU9kaEM0WFBR?=
 =?utf-8?B?UkVHVHUxdXU2dWJUN2NoWWE3UnVUdWtlWTgzLzl3Zk81YWlUNk9mMUhmbG5t?=
 =?utf-8?B?VjI1MDhGTnM1Q1U5QXp6SG1KMVorb3JvZmhiNy9DdDhnMU9wUm1RRHlZdmxD?=
 =?utf-8?B?RnlQZTU1T0JqRkdhV3d5V1hSSlg1a01ORVBkR0xIMHB1SnRzb1BnUS9jM2RB?=
 =?utf-8?B?ZUZKQ1BRbittRXdKdEY2ZzJJYVlibGR4T2EzY1A4YUcwMHZnTVhiT1JldTd3?=
 =?utf-8?B?RUJkc3RpSXBBb0FJbmNmTDlmU3BGZDV2RU9RWFk2MStQcVV2ZXZBbFB2K2E4?=
 =?utf-8?B?YWl6WWRSUG5tbjBCUk1hK2lnRXdNb0NObnRHRmNuenBscXAyOUcrQzhQVUdy?=
 =?utf-8?B?RlZJQVlHQlZoQ2lQZEVRR0o1QjlTMjdLNDRuOUI5TlZ0ZTlFMDFDcEdIK29P?=
 =?utf-8?B?eC9uNGVWSWNQUlF5ZFFlN2pkYmF3d1FNNVplUC8vbjh3YWlYR284YzRSbyt5?=
 =?utf-8?B?U3ZRczJ1Sk05V0RmQ29BQ2NVS01odTg0NnN4Uk9ITDRObzR4SDFyQVVmcUR1?=
 =?utf-8?B?TVIyMGthd2hCVEJDZk9SYkFXNmNPTmRDMEY5SzZWak1RRm9FalZWdGpnMmtD?=
 =?utf-8?B?U2FSdmRoQ1h2Z3lqcGhGMEJhSjlpMXRiWkZxNFh1RGo4S0xnZzRsTEg2T3FW?=
 =?utf-8?B?eVVDOVJHUGhLNG5iVjBXYUJSL2NUVlprdGVWbEhRM2dDeWtWclROSTRQclp1?=
 =?utf-8?B?V2swS09qdm5QUzkwKzEwQTVaN0pWMGs3WjNCczM2bjhyMERZdnJEUWgxN3RH?=
 =?utf-8?B?ckV6Um90aDJxSWV6SGpOd05nNWw5TWQrSTZMbTVOL1ZidDFjang0MFY1dUhz?=
 =?utf-8?B?L3o1bkd5T29EZGFqNGJZR29uTmRsNENXWkZZM1pnaysvbTExaU15U2d2UVJJ?=
 =?utf-8?B?UndKS1lxd21JZmg1WTJoTDJQY04yZEdJczJ4VnFDVUMzRGZJUUNrZDdtbDhX?=
 =?utf-8?B?a0dHNUp6ZXBJZEo0OHcreWh0Vmsyd2tCb2dINWl0ZGN4ckg4Um02TVNBMEFs?=
 =?utf-8?B?VkF4eWJhOEw2NHlCK1Zkc1lSNG1DZVNwTHUvZ2cxbmVTWVgxK1JvWnN4VzlQ?=
 =?utf-8?B?Y3BPOG4ycGZxd0Jrd3o2VlBGNE10bHk0Wkl4Y2xYSzhnd0Y3S1dBQXJTYXBT?=
 =?utf-8?B?TWgrVjZqWVl2dnVodVF3THMzd2VKNzBXSVlROXgzTzNzRzlEYlRCWnMrV1Jl?=
 =?utf-8?Q?Q9M8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzlpczhLT05rUncxbXQvWEJEUHdCcnM2eFYzaGZaWUFPMmwvNHphK2xFbUw1?=
 =?utf-8?B?MUNiL0RKdTd2SHcwdXp1UWcwRGczeHRXM1VoWVQ4NU9sdm96cG9XaDkvYmM3?=
 =?utf-8?B?cUlnbVhMNk1lN1VVNWhzYnFrMlRkeTZNU1dTSnZDbG5VbmZhN0RmT3ErVlpj?=
 =?utf-8?B?dXByN2FEbWtta3c0bmFPbXZlM2Y5UTJIV2lVU3F6dGVDajFnVm02UEF3MlVT?=
 =?utf-8?B?N1dZU08xQVRrQmhUNkRWVG5PbW1hODB0WlkxU2JTc2YwY3JIL3EvT053em92?=
 =?utf-8?B?VHpPblVRNU5sWnJ4dVVMZkJoK1I0dHdzWUJNUWcxNk5XWnh6OFdqRTlHaTl5?=
 =?utf-8?B?dnVLQnozSzhGbGtzaHViSXN5cVJjR2V3RDVZYlNVU3hFZ0pJUEJJLzRRcUZW?=
 =?utf-8?B?ZGhlL1Vlb2N2UWdHaUlwR1U0Z1d0TS9MdGdJQmtXU3RjSVY2d0REeThZVDdR?=
 =?utf-8?B?KzZ0MEd3ZEhvMkk2ZDAyNk1qU2pVaUFIWU9ieGdzVzZxak9kTFlhTm5TWElm?=
 =?utf-8?B?T25lZkdhN08wem1mdEs3YmQ5VEMyZmlhUzdoYU1hMFZiRnpoSitGZHRFWDha?=
 =?utf-8?B?Q1NQWVdHTnFaS29iSlZFNHA2M3hZUituNmRkNks0MjNNaEJVczNkSWltOTM5?=
 =?utf-8?B?VkJxNmlnOWxVWHAwa2RyRXI1bVJoWkk4VWhoNDlBNTk4OTFZZVYwUCs4YzF6?=
 =?utf-8?B?aUFXckFhSGptSHN2OFN6SmdFbWlQdFhFMUlPOFBOVC9NTlNPSzMvV1FMUm9Y?=
 =?utf-8?B?NDExU0ZWTEVSUW1JUTR3ekdnRzJoV3h2UTZ0eGlpTmNLYXcwWG5BZU9HWkJn?=
 =?utf-8?B?cjRVVi9OcS94bTJlTGk2TXpvZ0lxcWhRMHdJYitDK2xXV1Yyb2IrN3BWSnVw?=
 =?utf-8?B?b3NVVU9McU1ZTnNoL2lWK3IzaU4vUWUxZ2JySGlIVFlxNkY1aFRLdjhiTWxQ?=
 =?utf-8?B?d3MvWGVEWFJ4NWpYNDlsaDBia2lzYnMwUG5kNStORWJkU0s3YWgwTUw4c25n?=
 =?utf-8?B?MGw3WXhIbnVKNGV1VDNLY3RPQnhBOHg1QUx2N3ZVVGQzTVdNOE5jR1MvYjZr?=
 =?utf-8?B?cG9JeHVuK1N0ZGVYdGUxbVV0N05mbWExN0xtWkVrckxoemFSa1dmc0oxZ2dY?=
 =?utf-8?B?SmtVR0tYYWVXUkE1VTlSRDZ5dTVWVHZCWGJLekdqU0VHSXMvRUFUbEtZeTE1?=
 =?utf-8?B?ZmxMWEkyakl1UjNQQk82TVpIaFZSMGg5MzhsWmZLMXl4MGxMaXBzb2sxbHRs?=
 =?utf-8?B?Y3p6UWl5Zit2a0tFUGR1ZjIrOG53VnQwSllUU20zRU9adlBLR1htR2NweDda?=
 =?utf-8?B?UmplL29QR05kOTlkcWZCc1FuaFFZWXVMM0JIZm9yRUdzZFJwNmlaMFFUVVpO?=
 =?utf-8?B?RmNWOTZvOCt6SkszWnZhdXFxMmZ3eXRFczZqVmZ0N1RvekovQ05ES3pWc2o1?=
 =?utf-8?B?anBaSG5FQW4vVzlMUUhNczNaUG81NnJnUnU0dWhDTDIzOEJ4bXdYa2xiMER4?=
 =?utf-8?B?WUNEdS9FS3dpTTZrRWNtSHMzQURBQVRtdDhDVXBUOWdVRHpSMmR1c0owaVoy?=
 =?utf-8?B?R0RIUExFWDFCc3MydVVUU3lld3hqdGg4akdYRHYyTHBJVFRQKzdnQzN1aDQy?=
 =?utf-8?B?UmpwZC8zZzVsSjZnMzgvdmVqTFpUenVwbmtGTStqd0pxK0t2WGV4WEJJMUFI?=
 =?utf-8?B?dFZzaEkvVWkxZkEwVHBXeVVHTThYbnZJRFJ2ci9WOHArL2NBdG1zOEVBeDd2?=
 =?utf-8?B?WjJnQlA3b3hHZThoRVZlSG5DeCtyYjQ5d2pjc25pOVFJaG1FcUJ0bll0bDll?=
 =?utf-8?B?TjlWMjFnaGZScG8xa0k0eDhlU2hVTGhuSmlpZU83UVRKMEJicFRNQ0tkRURE?=
 =?utf-8?B?VTBlSkpiY0lzUmRPVDdPVlZZZ0Z3OXBZNHg0VmpPR001TldWVWRuVnVDaG8x?=
 =?utf-8?B?WjMxY1c5K0xFa0RWaEVWOG1qNW1JMjZiekdSZWFQUXlrZWk2ODk2MFZsQUk4?=
 =?utf-8?B?MDFOcWZqUnRxaHdSNGNpT0Q5ak5wZURzSGhiQzV4clhUNkIrQmRSaTV2SFh0?=
 =?utf-8?B?Y3pMeVRHMEw4c0tFc3A2Z3ZrWHZ0eTNBdnNtMjlJZGVVM25mSHNYb2dNM0FI?=
 =?utf-8?B?WUVvWXozZzVFNGxEUGgxZVMzQ05EZTliZzlEWmo4Zlp6cGYwMGlaNkFOTWtE?=
 =?utf-8?B?ZXFPVkVrbFdVUG5oRzNjSDVxcWxLdHlQQlZiYkpJYksyVzR0eGtXalV2UjZO?=
 =?utf-8?B?Zjdmd3NFMzJGOWJmN1plZ3pOUGs3L0VHNFpRcDhZdVM1S2JjTTBXVU9Na3po?=
 =?utf-8?B?SUozeTFYVjlRWVlNd09KSE01RE9Zc1ZmY0toTXMwQVF2Myt4OHB6cjlWaTM4?=
 =?utf-8?Q?53PXcZEjkpovIbsRRENGxibZvZqyHXUrFT4fsmkxtPpdl?=
X-MS-Exchange-AntiSpam-MessageData-1: bQOIxsPl3QVJXQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fb57c11-34f7-40d9-9d7f-08de6a106853
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:23.7546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IQSJrTQ9J3kkxEw/prnrBnI6SpigODj6aUaRWIMDCd5s1BdWNFw1B5mQ6XndVOOqpxhKV9MchlBYEnl/8xhF0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
Message-ID-Hash: LWHBRO3SQERV76ZQ7NCSCR4SHEQ2JDTO
X-Message-ID-Hash: LWHBRO3SQERV76ZQ7NCSCR4SHEQ2JDTO
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LWHBRO3SQERV76ZQ7NCSCR4SHEQ2JDTO/>
Archived-At: 
 <https://lore.freedesktop.org/20260212-turing_prep-v9-0-238520ad8799@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patchset adds the remaining support required for booting the GSP on
Turing.

Since the conditions for using PIO vs DMA for loading the firmware
weren't totally clear, we dug deeper into the issue with Timur and ran
tests to find out why things are as they are.

The capabilities and constraints are as follow:

- All chips supported by Nova, including Turing, can load firmware using
  DMA (although PIO is preferred for chips < GA102).
- PIO registers are masked to the CPU from GA102 onwards. Thus PIO as a
  loading method is only usable on Turing and GA100.
- The FWSEC firmware on Turing needs to be loaded by a bootloader with
  an explicit start tag. Start tags can only be explicitly mentioned
  when using PIO, which is thus the only method by which the bootloader
  can be loaded.
- Any firmware loadable by DMA is also loadable by PIO.

These observations orient the direction of the code in this revision.
Notably, the usable loading methods of each firmware are expressed by
implementing the traits `FalconDmaLoadable` and `FalconPioLoadable`.

The bootloader-enabled FWSEC firmware is now a wrapper type that
includes the regular, DMA-loaded FWSEC firmware (which is still loaded
using DMA, only by the bootloader), and the bootloader that needs to be
loaded using PIO. This new structure only implements
`FalconPioLoadable`.

All other firmwares implement `FalconDmaLoadable`, which provides a
method to try and provide a `FalconPioLoadable` proxy. This method is
fallible because some of the PIO types are smaller than the DMA ones,
and such conversions must be fallible.

Since this adds code that is limited to Turing and will likely never be
useful for any other chip, we tried to isolate it into its own modules.

This series is based on -next and should apply cleanly on
`drm-rust-next` after -rc1 is tagged. A tree with all the patches is
available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/turing_prep

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Changes in v9:
- Add a few preparatory patches to simplify the actual feature patches.
- Use a wrapping type for the bootloader.
- Simplify the falcon loading code and move the complexity to the
  firmware types.
- Add the generic bootloader files to `ModInfoBuilder`.
- Link to v8: https://lore.kernel.org/all/20260122222848.2555890-1-ttabi@nvidia.com/

---
Alexandre Courbot (7):
      gpu: nova-core: falcon: rename load parameters to reflect DMA dependency
      gpu: nova-core: require DmaObject on FalconDmaLoadable, not FalconFirmware
      gpu: nova-core: falcon: remove generic argument from dma_wr
      gpu: nova-core: falcon: remove FalconFirmware's dependency on FalconDmaLoadable
      gpu: nova-core: move brom_params and boot_addr to FalconFirmware
      gpu: nova-core: make Chipset::arch() const
      gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder

Timur Tabi (2):
      gpu: nova-core: add PIO support for loading firmware images
      gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turing

 drivers/gpu/nova-core/falcon.rs                    | 291 +++++++++++++++++++--
 drivers/gpu/nova-core/falcon/hal.rs                |   6 +-
 drivers/gpu/nova-core/firmware.rs                  |  51 ++--
 drivers/gpu/nova-core/firmware/booter.rs           |  48 ++--
 drivers/gpu/nova-core/firmware/fwsec.rs            |  42 +--
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 276 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                       |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  15 +-
 drivers/gpu/nova-core/regs.rs                      |  30 +++
 9 files changed, 672 insertions(+), 96 deletions(-)
---
base-commit: 5c009020744fe129e4728e71c44a6c7816c9105e
change-id: 20260204-turing_prep-6f6f54fe1850

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

