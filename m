Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D29EB7ED9
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 11:55:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA4610E9D1;
	Wed,  4 Mar 2026 11:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVyk/X2w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7EDE544E1B;
	Wed,  4 Mar 2026 11:45:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772624738;
 b=OdSh665kH01Res18DUVU5IRtYO/rY5O8NSsUOlD0UJZZPeOdTbzbAp8kScmU3F75Jqjm4
 +VOgYE6cpYxCvG1F+VSi9NN/2NoTIgBJHo6yM4/Vk6WuAXLtgpZQP8YaDtpmLszakKtXY1e
 /gWgZAuKsUXGzvUc/A32M61vQhT1vDdy24aAbsWKjbLYPYSWipMdd+3spje+ZNPQLNl4FJ3
 w7EWRLIvVqnUKdDYpDx2tTjkkQQPel/ovhyzEO3b4vdTBGKKkNQ6jXHQTX1Ltwqg4ZR6uJt
 DuBN07EeYwNOwuk5nwVFhjkz/LKDdOighbkY3lB6yZ12CDP+0UwxEHnDRsmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772624738; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3i1rTMkICu2e7UkkQqqJ6OBFUtGYCTSRkYNIXBAFUKQ=;
 b=VFmBz5qt8lSQniAvjwS1XzlFmMqWcd0myY0/5K+RMTdUjCtQ50q4pU5z5jkQUM24RE9Vc
 Znxn4bgyr1aCBonb7oAsegUxJ3SsFKyRqEVjUMSOPKk/Vwh+0zdGvyAC81atKPV1v5955Mu
 oXU2Yv59yjz1MzkZcZQ7RYGmyQRpLtECNghbZL7fFDGlLbj+vf59btvzRVkUiVab/iKqoSs
 /rmv9d3lCabAw8mjafcODQRGdN3D+BMf/VullPtzfxdDClTr/rceFwdTC8ZdRy+XXZW7Mol
 9mJIq0gijas3GjaCQ9pF2FiZMzIbrzSj/IW+Yyy5pQ+pxMRKwQWBRCcMu4pg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5AE2541E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 11:45:35 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 223FE10E9BF;
	Wed,  4 Mar 2026 11:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+jGMAa03cCISu5YN7a+IfyBV2HBSJQ2pQSVxo7R0wMEkPiP2BFwLQrPi+PWeHoi4BCghQTSgK7NNr29Bpi6CCNTdgX3jAG7EfjroMOXqnith0SWYyzfbQgdHekE2EjnKiw1q9UDi+MP9TRH6I0oeq9UzQmApS7t6nJJ7cg9M6YJgH8NOb5W1GHEdkCJZ//NUvx2jJ5NyIu7t3bAVYzZw4KUNC8SDB1NLgzTX3NeX1PbXMnzlbuwdXhnEr7LJxXWirf3TI8nLjFffcCmGIqgfynvkBzUL9EzolFvw+ZvNeI5lakG1r3vWosscqYt5DnsbZa8qssjX5/cFWAIMqD42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i1rTMkICu2e7UkkQqqJ6OBFUtGYCTSRkYNIXBAFUKQ=;
 b=HJBur2IUS5dZBjNO5T5UAbXfMOak9DRgoVc9JBrLfSOMmVA11alWMn0JCNevGJX5Oeyy5OMVCQxw4oAMsq/4fiLMZNx9qWtJ/Tys7sXMeUxzS5RgWtjCB8EydRmvOrnBTkkiVzRLU4ByFsOWyY4x/GB+6Ptz0F9FXgjuwgr5aJgO0ER0BaLMD45EMz9ZdOYileBvGB/hu9TSxyUhMLBqmVPjFujQQYU5I9W33RdJ5G1FYNoR9n3oAIc15Sg8hGCKtqSjtmwGAELipV9jriAQtXK8hz03HQbUNcZ+Y6IyCDFSv8RkC5jiM16wFi+u2EQLMdpJzQY0xke68C0fz0nhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i1rTMkICu2e7UkkQqqJ6OBFUtGYCTSRkYNIXBAFUKQ=;
 b=PVyk/X2wQX0roy8lUVxQ6Ui0jJAVBxbTnmf2pMR4HATxbGfg5DjLr1QffKBQZ5UbODt+RDjSGwC9TUrKmTDoezcGeUAlaB+UU8BZbY98aHJKj9HRCUmP7UkfnsA1LjOQqwBTUYkA0GBWA3Yd/UgEK5yDhse8NVUQqKNe/B6PSHN24NcPrbuN7bkEMf3YBMD4Qwh52LPAqZo+o7u/sdMnA8i79vfAPDEY06HR67owNhY3X48HBYACK1DQdI8HY3j92E7E8hPSP49p51ZVWPqAAFK0qo0Ql0vWqSX4D5Yn2fDlAk6tyn0YXIaXhu4KF8FVqi2xTAEUrTv/tpOBhwqnmQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 11:55:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:55:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:55:46 +0900
Message-Id: <DGTZ8Q6H1B0U.QCPG59PYYCYA@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Subject: Re: [PATCH v3 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT`
 constant for command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 192b032a-ad18-47fe-efd3-08de79e4fac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	UNX3cJDGvWmFhvUXDFPpgh7jiT+1fg+hl7KkLI7Sh5J1fbKD/KeHn28+zUKgeBiexoPbx/4V1gJmtiLsXjpkdb8984KhheSJXKwqEswGH+HsNuzQ5H8YTsG74e8M7cAlWzD9ScszlstWv0l2fc99A64pHjKakMZRAoRpD38TBTCngz0n0NbiyLjkRFxp3i1EEek1X/7ngb/cuqgTAW2cZWw7t+0a7drd60xeAW1vVHwtOoJHHXMnBRwrDvGl1MngCAReQvQbShnOpDatSa4Zso8DLFDOb1AKovLOyvdczM7z7gCrKxlwy/H54f/1MXvxAv2LMOs+F6u8cVoiCfclp8TQpuymfNDNuDP256VdTvsRf6VaDsXgRxX/1CDs7sFRFV8L0O98VsQovMHXpTkpOG5+ztT65/Xsitn7WA3ChcG/falZsH596qSKIjq9IiLvDcbbcqk+zr/ba37fj0PvgtWwF6HjXVeydEQHgbjjfds6fufEom08PqTv9huktYh429LJZsAW0tec4/J4c+/97M6EasykB2C0wyDzxhMVK+oAiWzIpBR9eDZsyh/FcyArXwGGMf4Nc07bwsos44Bpoqmx0WhTtd5D2aAXTS0T5IqLJ0DcbUqkgdwcv0lwlzEPLFTtGHOawxSmhlSNji255NTAUDFVKOIKCSZskNjaQr2u6uX6aGVxMHP7RJ0KaOYO7Zo4mJed2KAiHCTZQhF2pipHoi8Gt9M3SwYEVzUreys=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVRwSVJiV2dpQzNNbzdRaGdBWGhROEpIQ1VIdGp2QkJhYm02MXpnSHJ1dnBx?=
 =?utf-8?B?dVNNR1RoNEZpSk12TW5NYzZUSG9MekdWSmZSaVBuMmhobjExMyt1L2RQSmly?=
 =?utf-8?B?ckx1WGVVSklkV0hmN1JPVVYzajFiR2VtblhLTG1zcHVQNTJIbTR4NWt1dVpF?=
 =?utf-8?B?NHpUR0w1VGJtQWwycXNjTENTRWt3aGFmM0RQZ01yZFB5TFhITzdGSHJsTnRj?=
 =?utf-8?B?LzRVL1dXVlc1VUhQZ3pVWHR4YWdZSURobUxGQXh5QUE2eWU1ZkxvWTNyQkEw?=
 =?utf-8?B?ZjFXbHpDTml2NUltWjNaaGpGVDhXWFR1SFIzRWdEeTg2WExhSGpQV2NjcHJS?=
 =?utf-8?B?NnVudGdJRTZYY05VZFdyc0VtNENodmNBbWR2Tk1kb1ZzTDB3dkhUMy9DWXdq?=
 =?utf-8?B?cTN2NkR1ZWxDb1h2ZUJWUVpzK3FhV25TTXU3dHhVa3RWaEhuUmR0QVJpRFpp?=
 =?utf-8?B?UFBFV3hLVmhTUXNrQi80ak50YTIyenNPVlpURzR2TWdVUmg1OWNZa3h4ZDVN?=
 =?utf-8?B?VUJlOHRhT0RVSTlJMm5NSU9ZeTFzdFZqUTNISVBWU2EzcFhVdkJSeDh3UWtj?=
 =?utf-8?B?VnNaUTZEbWVzbGlFb3QzSUQzSktUT3g2S2JtQjVTVUcwSnlCU0h2N0FlNmVM?=
 =?utf-8?B?UUthWENDMEE0c0hDSFRyaytnZDk4a3hweGxxV2I0ZmRYWFJLdGNlTmlsdjVQ?=
 =?utf-8?B?L2xDOFMwN2xxcmtDeUUxcDVDSkgzNlkrbi9FOWMybTRpZVQ3OS9CM3JSbElx?=
 =?utf-8?B?dWFFODN4RktNYmt2Q29zUW9WQ3hLK2ZwNEllcGlGTkM5UE1sNmorUjJoVjhU?=
 =?utf-8?B?YTRDakYxWjNiVkZsemdZVU0ybml3VmRJNHUrQWV2NTdqL3VraXU2TGN4S0lB?=
 =?utf-8?B?K1J4em1NUVRwb0draVljSW45WEFtLzB1MTM4WFlBYWEzTlIvODZqWW14RjU5?=
 =?utf-8?B?SngrOWg1VXNBcjhIOEVCWWh1U1JuWnFsVGpLSzhHU2JHQnEvbVhzcS82RDJV?=
 =?utf-8?B?emRHZkdiYW02NmFYNzArVjFnNWVSQWZUSHI4d3QyNzdCK3AwZzJYYjFoVnoz?=
 =?utf-8?B?MWdUYVpSYlFORDcvOW1NdWNTdlkrYXRQNVFjTFZWV2JmaGhhRmxXREJZQkxs?=
 =?utf-8?B?QWk4K0V6YWN5WWhHTi9SY2k4L3N0TUxubFQ1eE0wdW5OcHIyeTNrWUZoYWdY?=
 =?utf-8?B?Z2twa1IvYUhKMkZvYmxvM2ZpQ1plRmJjVlp4a3BnVlVDQ2VKdEVzNkYzK0Nn?=
 =?utf-8?B?ckRJVjJxNGlVT0dQdlA1WGhabXJpRzlKYkhuSFBvS2FVU1ZKOHVteE1vb0Iv?=
 =?utf-8?B?Z01LeFhna0NZbXpGdW9sOU9CTElqcTUrL09LUlRvOUhrNTFCZExzSXdicnZD?=
 =?utf-8?B?NFBVcllWTUFKaDBQMkUyOW93Ulg1aXNZUnpLem5vdFh1UCt3eVN5N0gyRHpF?=
 =?utf-8?B?M1gvbkgxWE9aRmNPQTZ0YjU1NTZmaklhanluQm5VV29kdG5LeXpSM3VSNklQ?=
 =?utf-8?B?aXpCb2J4c3V0RHM4cWlCeHlJQktvQnNpVkt0QmZLMFFZMkJxNUZHcXJpdGp6?=
 =?utf-8?B?N1hCT0dGcWRISWZVNmNKVndhWFpkWi9qc3V1WVRTbTRKNWRmQ0JvRkJLYWZB?=
 =?utf-8?B?VXlaMDZFSUtwa0UxKy9HYk5LdVZGNXk2UnZVQmlIUDN5M3ZzOFc5RjhaNTFI?=
 =?utf-8?B?RDRUSldZWU1td1F5dlgvQkVJUnVFVUhpMUV4UW4yZ1FkN0cvTlRReU04cXNW?=
 =?utf-8?B?WjRSOWdIcXlBc0JrL1dwUk5FTis5Q283aUFKNDFMYmpjelp5UUdBSmhpcCtk?=
 =?utf-8?B?QjFGT21uaUNvSSt6d3BZK0hXNmxsRVBCRHRNdERtSGNmYXlCaDk2SlpFMitp?=
 =?utf-8?B?K0pGZFoyOStmR0ZORXg4c1RKSlYxUHRJbUlqeGNJZ1dtK3dBSlVBUCtnVXV6?=
 =?utf-8?B?N003NzF1Wnlxd2NGUnlFYWt2OWhkc2tYcFh2b0t0YnYvdHhlTkhIaWQ4L3FU?=
 =?utf-8?B?SWtod000OTFsYzNodldqR1dnemFDL2ovNWVwakhHY3JjOElJYW5hQTRFd0s3?=
 =?utf-8?B?ZVphZFlsWWsrMmxCZC9BeGwxNkdPL2pTeERuNk1zVjVkNFV5QzlEM0ZHTWRl?=
 =?utf-8?B?VVRmcXhhUWVHZ3o4L21DOXN5RWRmTG01QmJXUDJ4Yk8zeGFyd3U3d1IrSFJ0?=
 =?utf-8?B?QzdTbFp1R3pmdGlWMEYrVDdzaWpOT0NKUjRzajR4Y3FEc1dhRFFJT2lsZmM0?=
 =?utf-8?B?WWkxaWh6bldlRlBHbzhRcUFGRFJnczg2YlJRUTZPOU0wK1dKMnNRMDh5a0Jk?=
 =?utf-8?B?UElUbk1LUlRFUmFQWEdhQmNJYVdDeE1Ncys0eWthQndleHF0NU9iODRTUnZJ?=
 =?utf-8?Q?MzvXmMELU1TaEVmXR1zBwm/uBSkznB7I1WvMYo3T8ybDz?=
X-MS-Exchange-AntiSpam-MessageData-1: GVtvFpxq1XLyDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 192b032a-ad18-47fe-efd3-08de79e4fac3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:55:50.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cw5HzL0X/GS5s8y4a8lNCUKCZO58CT6Nh+KrxLyFmj2f6c/XjP/e2M20oVVzVzQWd3chlVLTHPBEMM+okLfXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
Message-ID-Hash: 7ANYQZMP32UQQRDCIMXK3TP3M7CSHIWM
X-Message-ID-Hash: 7ANYQZMP32UQQRDCIMXK3TP3M7CSHIWM
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7ANYQZMP32UQQRDCIMXK3TP3M7CSHIWM/>
Archived-At: 
 <https://lore.freedesktop.org/DGTZ8Q6H1B0U.QCPG59PYYCYA@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> Remove magic numbers and add a default timeout for callers to use.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 3 +++
>  drivers/gpu/nova-core/gsp/commands.rs  | 5 ++---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 4829830b6921..0192c85ddd75 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -496,6 +496,9 @@ impl Cmdq {
>      /// Timeout for waiting for space on the command queue.
>      const ALLOCATE_TIMEOUT: Delta =3D Delta::from_secs(1);
> =20
> +    /// Default timeout for receiving a message from the GSP.
> +    pub(super) const RECEIVE_TIMEOUT: Delta =3D Delta::from_secs(10);

Agree with the idea, but let's settle on 5 seconds - GSP replies are
supposed to be fast and there should be no good reason for any command
to take longer than that (and potentially hang the whole system for the
same time).
