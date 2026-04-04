Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE2EE88D9F
	for <nouveau@archiver.kernel.org>; Sat,  4 Apr 2026 13:58:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5E5410E13A;
	Sat,  4 Apr 2026 13:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TP+JWo7f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B39C24557F;
	Sat,  4 Apr 2026 13:47:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775310422;
 b=A6li/x+QP9cxZb4ajVGJzWZ3Hier8wlEOBGMQCT8jYgLZxyiDHqw2jGC8shA683rV7jYb
 cC7Q5wJqQNugkvfw5E79S4FY1rTycym0l2O59gQ7sfpJ1fBkXaDvenBO+Z7xc0H4cuRyxFc
 paHnsjd5QZPVrbby2BYRd4QLmX9kHqBg3xajyAkjmvTKNfHsRQlVe56gutf55CbjfBWjl46
 Q/hk/uACV3jBbhxnEPtF7wFx/2QVKH+SBHDBWYYBM+I0iNrXI1jhJ9hOuh5dBHOqLb6K35l
 y+OSfZr4Kv6vUlgBtx78l486YGr4t77U+v70NSICf5PS7Ss3YgvhC7MJyZcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775310422; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=98AGFmeVE5ESDr1BwpiWVL4vgPsniiXmvJAf5/t8S9o=;
 b=0tNUYhfHLMeHqsvmhj0KiRoZtdnn249POyaCQOerxxgdF58h0X73d8qMe1SEVvDRKFChp
 AELqAFYgt1ExL/1pc25oj0OKRPbo9l708WZfIrme51b7nPLLOCKbCPF0KifSDbE496ufT5M
 KBa/L9JNTCNP0fOUCMrPwHJ4Kd1Y4aHolJaALt9k0kv+lEmSCxC9JrLpbghGtDSlkW+aXPt
 eIbo5MPbpjBCUjH78/gokFJabbluUox65sWVbqKdqNqctHLxJ+FBjy0sRzvhdbM41pOF+aD
 fnoclH/pcwLxgtvLyxWrcLgipr511y9+b/mBwlUd6TBRa98kX4LrBgHuxyFw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E9CA145021
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 13:46:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7410E0EA
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 13:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc2kbZvvjbg5UtKjUi8AjJfmdTK4fJEYhd06ZODwlXyd7uS9fak5FeiymYwyUPURWNRXdcIqWWhW2yniQqMtIGfldiMmjvOCWfpLVBRe/9CF5zMxCw6X2DODtQWlIaw+TxDiVMO4TW9MO8XquorPPae7ZbS2ch6SNqQjGTST+ZZRMeKiq2begU23/vnJDuOrok6Z2h0m0KAKWeN19LTQEjEoK8UP0NCJYWMeIcdZV+IyurZwX5MF0TBzIK+Pm4nnSsa4mzKGoCyJ3mrXcypWJPX6AU7EwPuB/l+QRpHWm5hRAcRf9D1kbTabD/jc1aCbtvvP5ooSoW6eb1RbPlrysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98AGFmeVE5ESDr1BwpiWVL4vgPsniiXmvJAf5/t8S9o=;
 b=AiYNEh4/2UL0iJHQIFrIa+23SSJEo9dR+kkHKD5av0uvVP4x7G6XgipCv1UinlCdKm21lFicVpytBabUeBUgvs8eRiHgfRnl4YkyPwGV5qadnyHQ4cZV6dAX7jruBU3ke933tCZv9E1AGxRm1UJBtG+7LF+v3CBvEk0sJ+1U4V3Gm/vKuIxHinMxdDgz8OSUAyAa0L3lmK6UPVT7ZJskT5r6zkoQy6TuIXsiUAqPKlOHnzgoEJ1iMPa/iOYh8br+LLXt/p7Drbvg4zKQ0zBWnoX2JyjHKQMEP3Ctps3nMYap42G1dbDtBIgrQb5dcK6J6Ukodzw0eIkMZHHlcauQCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98AGFmeVE5ESDr1BwpiWVL4vgPsniiXmvJAf5/t8S9o=;
 b=TP+JWo7f0+qoTmqW+dLKQjbIZFCJr9+QXzA4AM5GZPmWW1mses3AktlrMroFo2QboAnkCnFafn/USJ5sgw5YS75Mfe8znI0kW+YArsJHH8rtV8qnXUcI+vrFMkFZG/1Jx5ULEzQvKNR+lXd9kFWAPbktNDcPR+/NJOmjxW3trvgCacS9pX0sFo/XdxyolWGmTNFaS2hZCi58gvbFuvtHBJ/dJusazFNN7YYhCb0Bk5jIajOROEpJgtnivqbHX985Da9mdM7ZQdFQK3hmCnhwWPgk88C/NXHIlu6q6t52K0Y7NVXpFMSX+0XYjSLDcoNcc+sSuPf2ndUgYweb1qdvBw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Sat, 4 Apr
 2026 13:58:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 13:58:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 22:58:21 +0900
Message-Id: <DHKF9H2IXXTN.BFAAJBF0NQLH@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: program_brom cannot fail
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260205225922.2158430-1-ttabi@nvidia.com>
In-Reply-To: <20260205225922.2158430-1-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: f2867d1b-a0b1-4bb7-7108-08de92523da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	dCvpI+rIHZvbtLP9X8AE1ZNYUBWiiV0n4idVYVG1GhRuuRl+i+DxmQ3McVB8bkVCheGAkS6ofAB6MdOzMI0GmatxeWirlsJtxsS0ObjdV44snKVwdYt1U3iBoxnhvYNU2JCE8K9QLC3w3RlLemBG2DKwxlowWAnWCX2F3gV1GfS/1jv/v8+/oGUClWbLy4mQjhBKoZ479p7DfFDOguZuqINhCfCQpLlzz0S7NFh9cvgf9RGNBUt73ekeEHavHS3LKKAQqoCyq+OMd4Aqz3o43VHJX/UZ74b1kO8WZ0AEyHY2+cQSgY+J6Dr+wA9CemmAmF7AOvt2KUSwR18Avo9nMHyAiRfAeQnjB0YndoKVYVauST6+KcqjE39yDidC6t13/Ajz0hDIhQTBje8Xk2acX8AGunYbM4LEWwyxtSvJ68Yliied4QQvGYC5yGMwqULTL/RRX3MIqe/0Ee75DV0ucwVOkdBfxM8M0rsoq+RATVX6xELC9zpHnf6RxELfnUl/YBcu5qPIXa+fFjjo2IjsAEzLwHHX3QinVxnK92MIaXSOkW0tcYA5u4ymhlI7FuAC0QAbDS8g+JjNHM9q6JSaDKMNHu3uH90bqNvQuVPY+ZnxAr0wNoRfHMqBItFNizipi6dS3WIUM+81gZH2bvUfUx/de1HkvNiC38DjD1iDGm9WWTToBr5v06CJTbsYKi4IhNa1vkw8+fsX4WtLaQPBsVq39keIVWtyOQiX9UAtyMo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0hKV2tTOWV5T21LY1NNSTJHVjVaUTVwZ202SnpzRjBFdGlQandxMkd5UWEv?=
 =?utf-8?B?U2daYzlRcjlVbHJZemZmUktsL09xck91aUhiWEZHWEliMkdxcWVaUmFsSm40?=
 =?utf-8?B?dHJxSE9sNlR6SWF0U0JPLzg5R2g2QytZcXNnV3NuV0VWTjhreitMZXBBcGRl?=
 =?utf-8?B?WTJEdXlva0JmSzJURVZxL0VnK3VFVVM1TFNBZFRwSFA3OHNjQXdZTzV0NE8z?=
 =?utf-8?B?K2YwN1ZXY1RnU09TblVJUUduNzZIM2tDcXQ1dkhIcHpVWnE5NlU2Zy9OREVU?=
 =?utf-8?B?RXBRZjFaL0VNTlhvZDF5UDdMOEM3d0RpbGdVcGRVVjVDcXlDSENFRkZURzBZ?=
 =?utf-8?B?RFh5dnRIU29PZHNPYW5QVm11UXcwWUUwUmRpcExLR1hieFl6bWFia0tPV0pW?=
 =?utf-8?B?bEhnVkk0dkkyM0tiMUEyVnovV0R4eUI2VGgvZk03SmVsS2hmODZsbHYwbFkz?=
 =?utf-8?B?L2hnZXo2RXc2K3Q0Wi90bDFlcldzVGFVTkdpWElPZXhqcmpWYVlhc0xvK2pj?=
 =?utf-8?B?SlJZdlRNUFUvZzArY0xGSERmRjh3aHNHcGFGM29rbVByTnc2TVdBcUlKSkhW?=
 =?utf-8?B?bzd4OU1SUElVaW9lWWVpM1dhTlJsWE81aTNIN3JqdVpqVU5sakhCN2VCdVAv?=
 =?utf-8?B?b3JsZUlyRjBJMmt5ZzJwWXVuVnVVaXVnYmp6YW15eFg0M05EdmZvM0xHbUMx?=
 =?utf-8?B?STFGd1dkMkdUMkZLRSt5aTNqS1J3VU9hdG5EbVNFaVBnUVBlT0VtOFNXeXcy?=
 =?utf-8?B?cGI1SmdpLzN0WkQ4R1lCaDFEcHZPNnFnN21sYmF5akJXQnRnTk5UY09uNEtY?=
 =?utf-8?B?Sm9mLzljZ2FWWHl5cm05b1Vnb2J1SHVnRFBaa2FObTJ3VGkvWWgySzJsRGNk?=
 =?utf-8?B?L1ZrMzJacytsZlc4QkMwWWRxN1Bzd21IakxEQllvYnptb0tMdG94b29BOW5Y?=
 =?utf-8?B?QjV3bVRmS3c5aHdpUEdyZ1lJVkVIOVkydGlWVERLVU4zc0dEVks1V1pDQ2Vi?=
 =?utf-8?B?bVRIV3FDNnN2MVBmNUE5SmgwbEd2S1FaVmw4amdCTHBSdDVGa2phODR3NWVm?=
 =?utf-8?B?NWNvOStCczl6b2Zxd1VmeDY1L0pLU3VNM2laYWtoSkt1ZjVOZisyekJtbk4z?=
 =?utf-8?B?SGdFSmtPYjRhL2ZmTWdxVHYrd1ozWUxuVUk4M2poYXNCUEN3TUE2Y2VXeWtn?=
 =?utf-8?B?SldTclVUS0sxUk5QSnNPTmR4UjB1NEFENGNjaGxkRDQzeCtlOG0rbGdjZmZu?=
 =?utf-8?B?TnRGMlUzeVM2b0VIYVg1Ry9PWktoU2Jtd0VkRGZMNWV2cnhHcFc2c2RtZVd3?=
 =?utf-8?B?Zk1pcU1DemJBekUyNHVob1RZSjVRTi9sT3NUb1BXZlFKeTJKZ3hndm0wUTk3?=
 =?utf-8?B?QnU3WjNjd2RLalFNTTBNUDMrckwvRFJVcGNQdGxTdE0wL1FUL3JCSDhlNXJE?=
 =?utf-8?B?Q0pzcnB2d2NDZmI4R0E4SkNqZ3hCUnBTd09obkhhblFjTzRTMUtETTVQNWVY?=
 =?utf-8?B?eWkyRkhIdVNtYmxFNm0wQ3puUkVlZ1N3NWlSQWdsNzA3SU41WlpjSEhXdWdk?=
 =?utf-8?B?cm5pQ1VqZ2FyM3VDTUl1a0tsZlp4TEVxT1BLM1pVK3pYeDF1c0x3a1RueDZx?=
 =?utf-8?B?NEc3NXVRUTVHU2dQN3VDcVVVZ3NHZ3l0czFWa0EzNWJpUlNyMG13R0JmbXJX?=
 =?utf-8?B?Y3lCY0d4dHN5TWVrb01pZnlSRnMrQS96OUdEV3hSeGFvWGdQWThsU0pQRCtU?=
 =?utf-8?B?ZytyN2xOU092MjhtRWxzdW5KaWhtQWZlM2FtQ2d5M041MWdFV0luNnpNMnRw?=
 =?utf-8?B?YUVIRDBmaEFtVlFBNnJSdGxKcGlLWGlHZG5BNU1NcnF2MDBScGJOV3UyNHBC?=
 =?utf-8?B?Q3hNYmtHT2pVYjA2Y2VIZXBVZ2NYYWRtZDN2N28vT3dLbG9kUVhKM0RDTitk?=
 =?utf-8?B?aW16M21Tb3NMQWU0YkNWcndRTmttKzFHNEpBU24ySGQyVWpOZG1PR3lCb2M4?=
 =?utf-8?B?eHErNCs1UUpiMVNpbkhqaWpreExCam9HOHZHcDA3c00vbFhveWowekJJZndz?=
 =?utf-8?B?ck1hZWlLUG5wenljcm9uaEd0QmM0d0N6SzkxdVVsRWR0SDA5bkxUZjRqNHVh?=
 =?utf-8?B?WndoWTJIWDB2SnBDRk85aXQwNlpQNDV2OWhMTzFXZDVPNVJKbzU1TzBDUjc5?=
 =?utf-8?B?QmRieTNPY0cwVjM4SDVleXVReHg5RGpkd0dnaW9VU2hYL2xpT3dRQS9qUUpU?=
 =?utf-8?B?VGN4Vkh2T2swelhyRHVrbWhPYWxwUFY2djh1UFNiMk5UMmdJQURjRnF0VnNZ?=
 =?utf-8?B?c1cySmhybmNCVzFvTW1ua0xORXl4cGIxK09adUJGTzlCa2VyWGxhLzBMTEs2?=
 =?utf-8?Q?ObIeMEyNxuFqds7iI0+YWUlFYghxzsqWeGaafo4rHh25J?=
X-MS-Exchange-AntiSpam-MessageData-1: +yzkrDDdXFQGnQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2867d1b-a0b1-4bb7-7108-08de92523da8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 13:58:25.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nl+7EseJXwvYSOGEts/THgqMXWgNnWAGypI6guuzxvW+iAc47svAYm72rxfil+TOuSMfeLfNQ+fbAvDmfYMLmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626
Message-ID-Hash: WAVCV3YR7FNLMYIJS3M2UKFUIVGFUSZS
X-Message-ID-Hash: WAVCV3YR7FNLMYIJS3M2UKFUIVGFUSZS
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WAVCV3YR7FNLMYIJS3M2UKFUIVGFUSZS/>
Archived-At: 
 <https://lore.freedesktop.org/DHKF9H2IXXTN.BFAAJBF0NQLH@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 6, 2026 at 7:59 AM JST, Timur Tabi wrote:
> Change the signature of the program_brom HAL method to not return
> anything.  None of the implementations can actually fail, so they
> always return Ok(()).
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Somehow this patch went under the radar, but it is still applicable (and
obviously correct). I've scheduled it for merging after `drm-rust-next`
reopens.
