Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9F0FCA199
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:08:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A243110E5DC;
	Mon,  9 Mar 2026 22:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sXrgIRe/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 95DFA44FDD;
	Mon,  9 Mar 2026 21:58:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773093499;
 b=nwWNTbquU1hcQEM3vtwZ7ljvXQBb3quseRtUvA0sxhpXidWlDzbBWnZKys4JO0aqyfwMH
 BLbb2eIu97t/k9FXw1zgVm5hlQ91PClfcW/Fr8L7wtyrGTZTbjKSyRE+cMDMXYORHrvwjn0
 sMMaX2yY/NlDtvKYZBbRQ36UWZoCbssPAs9DPQ3/FBFA5lpGNYIJ8VNaCveOwaefyGuJaMV
 dN+Hb5e24QydwBjZqe1JbWr91vZDtm38R9T4Cpatdq0WuwowiUxbDkRYucDJiyZ91rN6xpI
 EonyYXKy5w0lPguj+M7/G63n7FXnNeWaMQK5HJUTfrpsjdAic3JAsKkYmFXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773093499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VjXupaeqlovPFC/Dx/a1qekgeIhQgc6JXGyHCiOWYrI=;
 b=etldRYbuXpu1qBA+fQx8NQHXck8Rnpi/3pev7nUJ+oSo67yUHyLQ3XNwu527xjJsuxH5o
 G97rsAe2/3DQmn860Ks/MPNIR+/sxI7VXbec2zJg8y+LCLLRBsCMpSFnWzUKeSElzqxuZJb
 X0uAagPb/oNEIB/05uapPP9aORaCrNGdpUdhDUJOk6gua3MfSjXJCH3AenB7aHGjhlg90OV
 o1mAAXZRF6rNfFzRTuH81RgSlOXcBLSnOF1aoQD62DBa1al8V/k4XKl0B0i7rMERJRWuHCY
 Jlthuj0BQEflIMKMC+2To/SDwo16haJpyf/Azn4tAEQWKSS247mCTINYtnMA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DFDB6404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:58:16 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B053F10E5D2;
	Mon,  9 Mar 2026 22:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENHCBBQiy/OWFDn4sur8Ub46CIaSNEEeL/OVgt/SqLpLZh53ViVCrn84Ub68uWAe22Kzz2xPwsHzOsXIXlscaKEP9zEr45d2lD/vEvXlkGyS3V7IOX/+oGAoZVdMY/9IieSOoXurxeY9aEa3Pu/WN1QzvtN7IvxFtOh6NzHzpO0/K/hyuw5jGkRQGe0Nh2Rc3TpbzpXoxdAkX7R6m/2kl8yReTZ29q5nyM7Hpa/Tfhx1laoEfsPugT/7r/j2C9K5oIg03aFZhm1TzQiwCRROQFuYc/My8+GxxZ48GDqrEaEy5Yfk/UhzRAPKE/aYzVk1pVr0psNNLeY90gPygdWQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjXupaeqlovPFC/Dx/a1qekgeIhQgc6JXGyHCiOWYrI=;
 b=XuauPswNp2pHkWjim0ek52hG5xog2LPuplHU18uNrKGiPJLvucagxbxhXFiwMXKOySq+LmqZHRnGFkui/XYsvd/R6kNS2zzZGr6kNLdOewecpKYgsLewAT2aGShWY/GGqOJjeJcB3IMeiEMSStZPnOQ82ust15hDvId9vJjY1blKZ+9kqRtgHQGcT5MaQciz32KLwpmFBxD/317MEFbtkdHF7ElXfkHPJPjNb/KKWw8c58/K+TStCQlLa0EJ0+AJy5Us+D+JLd4TEd8QZ/QGugwsMx6MOhT6NrdZ296HPdSKOLTBV5T9RuP0/dUdWhY5JRtYpSIBoyHFTcBA+iI3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjXupaeqlovPFC/Dx/a1qekgeIhQgc6JXGyHCiOWYrI=;
 b=sXrgIRe/VuyC42HCBcqXO8edNneUuBardFS29gG7uPW75MujOJp9sl34Q/rdnIkr8GLdWLZ8/pyAFLS4BAPqAeHFTDgqVdmLILwv9iUDIxd/tYt4d4sNFk6/NZvcjBM04PAZWz6Y2fl9iLrTCVWd3OHi1HnARhQWyJRAC+nHCzdo04CQXioRwoSG7ws8d75Muu1R6xrw4kwftaPyG5cknSH7mU6zmAD/yac5yex+3xHMLbXTFgwqjvlD5V2XeFkxDXsML7IAQduc8G7vVuArfUgOstFfCLkV4eQcEbMxecnpl9TDIWdGn7zM20AG0xQ4wY78/v1RkQj08Q0UEUVPoQ==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 22:08:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 22:08:44 +0000
Message-ID: <eec9ca52-95cf-405b-ac21-781e887caf0a@nvidia.com>
Date: Mon, 9 Mar 2026 18:08:42 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 8/9] gpu: nova-core: gsp: add CE fault method buffer size
 bindings
To: Eliot Courtney <ecourtney@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-8-86648e4869f9@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260227-rmcontrol-v1-8-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:208:32a::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 66163394-d351-424e-909f-08de7e286e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	eiVetlfGIfOkMPJUQbSvk+yU8LBFsU9zNwmWYS90UnQl55ftMmAQ/NqrUgn1H5NCKVpWaAILrs7V4pLKR/r3hWDr4ZBrXoBUKUUQuhA6e7sRXf3flypcIO32ZZlKOxBMU5X3TCZERBh219nTNwosS5fjfFeW4dA4u2G8J69eqRT/CxyHv98YBLQIucGdCNTnKl44sIAQTQ680t079gAaSxxs56tBKBC8A10EdEXR6GQh3yJZMJkUfbWxMlOMk481slK349iKY6esIUgwDcYk6jUrFdsF6npKbQ9SdJE9sSfmpAsJws4AYgEddb1dmi4Lq2h9H8CS3iQfAOkxKhwMoNG+h4sk/ZaWVuuTvP946EKFvaGZU+JcVnZXckNuKpK7Papvd7IRz35wyW0pZQrNPqzzVaDITHUnJclETH1LP6vTxjIKxIHfOxNq2sIeSwZ/TJff8EQ0K/sstLzH54AjOUvOMAhbLESEdaqYSRnZq3vkJGLF8tFYmYhjGkoPhtqIbJaebNcLYhFuIDHDGdlt7KmcJxvw3rtb7sGELyRhnCqp4IZSaKVa6IG5+lyKcR4G/MHJvcjrA2OadAFyOPWwcxVv5rzgOzsdw0cfEXzK1l2bbMQ4pGaLYIztXiXBUYW0p6bNLujIpVQimK1dV6cNEfKTuoLLu5FhIQee2G3aFIiiHcY8IUyUmhGlImW06DSZlQStm8u0qKY+K0AvAz/UIiPfzZ8LKc0diJf91zpWQ5A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnZNNk4vbjFkVFFDaGh2Q0QxdzI0Y1JhcC8ybVM5dkJESjBFNHBTRDkzN25I?=
 =?utf-8?B?aGVCbitmb1FpYytBWWVCSGs0bzVQdTJZc0s2T3lRakh4Vm9sUXZHcTdaRi84?=
 =?utf-8?B?VnNWWWNZRTFteVhsOGFIQzVvVjR2YWtZZG5PZEpDdUxTZmovZ1BtUVVxWGk3?=
 =?utf-8?B?VjhVS1kyRERuTkUvZ0pWY0plWnFzdlhKRUEzNDVDaElrOGxqdmI3U1IyUnBY?=
 =?utf-8?B?OThsSHNsMzBuM1RQN3Q0ZlZsSnRPcDYzODM0Mk5GVUlnMThMNlNUWmZkamlr?=
 =?utf-8?B?YXFYaWZ0dmNlczdSYkRFVjFEYmJsNVNBdXR2UGxkeXVJd2Z4ZnAvTXU4dFMr?=
 =?utf-8?B?dWQ4cUlvZmY0ai9aaFIzRjd0Nm9zNlZFc3Q4VEZkNTI2aHhxcXJIMDl3bVl6?=
 =?utf-8?B?Zmk5Y3RWYjJVYUhjdlU0N3hQY3BHV25zUjUrNzBESGNDRzFvNmVXSXRnZ0hH?=
 =?utf-8?B?ZytGd1puYlorM2lMQ1YvR3hJa240aGU4cEQ1aFQrV25rQ0hSVUN0U0pNNWtS?=
 =?utf-8?B?S0Z5SlFzR0pHTUp0T21DQmlrbndXT1QyV2YvVDhHdUJTaTFVQ1o2bTZtMWhj?=
 =?utf-8?B?WEQ4akRSTzBiTFZCU1hGQXo4MEQ5Q1lpS0J4aGtTVDZad25SYmQ2aWhaWW15?=
 =?utf-8?B?NGllaHptREhybUd3NHNvaWRON3c2N3htc0EvRTNqbWxGQkZuUTF5UHJ6eVFl?=
 =?utf-8?B?cE16WmRGc240dmhFTnlSL05ZSVJxcXdqUGMveEUzd0RsYzJwU3FCdFB0WUJL?=
 =?utf-8?B?elo4cVdoLzdITmhtaGFGc3Rnd0g0L2FjNDN4UlRYODNkRXBxV0RaSUhEVE80?=
 =?utf-8?B?Zk5qUzllZTh0c21qbHdQTW1RN3daRnZUOHdVOXEwMnZEM3F5NU5lVVpnb3VT?=
 =?utf-8?B?dDdpZWo2cUROemZlYTBMTU9ET1U3Vjd4cS9FMjVFSEM3RkQycVMxOThnZ29y?=
 =?utf-8?B?TytyejFGVC8zcUNDdHVtemhCdFFrUSt3UWRLRU9ta3pkOVo5VndYVDZWQms5?=
 =?utf-8?B?VXBlcTBKb1poejFIYkdWbVhYdG9OUE12b2wwT3I5SkE2MTVjL3BKMHUwODZP?=
 =?utf-8?B?bFloNzZzejFEb3pZakxRSUJBQkZJL1NqWUpNR1Bvc0t0aWwraTVOS2YycGNa?=
 =?utf-8?B?ekJ2K3puQ1ZVV3dmTnBZTmtDUFZKSGpEbXVMTmtBc21TRnNpK0FHUkIxanlr?=
 =?utf-8?B?Y0lkQVJlRUdBb0lxeUZ2Y2FlUzFLeU1OZGVmYXVCcXRXR2dvSDNFb2o1am5B?=
 =?utf-8?B?OGZrY1F5NnQ2elM4aXZObjk2L25tTW56cHFxbTh0TFhxLy9VVUNxNGhNVkd5?=
 =?utf-8?B?ZklrbEMwRVVQT3BoOGhIcnJhNUtzWWp5MVlPb2hVb1dCT0JWZG5xblJHSmJi?=
 =?utf-8?B?VVBvNVRkV0laV3NPNDYrTW9Ca3hlUmxZNUVYcUJjelZnQ2MzTzlMS0J0RVJ1?=
 =?utf-8?B?Z1d5Qm1oQWpkbTNCVjNyejZDamlmQjd2QXhacFJNSnVZa3lNd0R6R1RLdTZk?=
 =?utf-8?B?SlNzTXdPaUtxQ1hjQnJCTlZYZGxLMTFSNk8rMmFyNXQ4R3RGSzE0WVBtdms4?=
 =?utf-8?B?OVErMU42TElVNXlmMnhUdFo4Ync3ODhIYmZVUmJXUFh1ZnlWWGxETGtyRmFm?=
 =?utf-8?B?NWRtZzVEb0t1dElxWXBYVWoyVVRxeFlkTjJ2dkNGVCtIOGt6cEd3bWtMeVBF?=
 =?utf-8?B?RGNDZkRyUWR5RFRMdkJ1bEY0bUVKWnR4U1Foc2o3ckpIYnlldmxpN2F6cXlK?=
 =?utf-8?B?MFZwVW1sRHloSFRwWFk2Nlh3cUNHckN0S3VqcHFxTXJxL3o3UEFoL211RExI?=
 =?utf-8?B?MkhxUERTQTRsenIwU1VUQmVNQmh3L0FYZ3pzUkJZRDROTTNsQ0pTVkhGMXFI?=
 =?utf-8?B?ak5BSWQ2WjRYa1Z5SGpxdUJESDI1VGpwbzh3Q01QeTdBRnZEbG9QYytSQXB6?=
 =?utf-8?B?ZnlVazJiMzFxbms3YjVtY2F1S1JITzl5Ujd4cFJ4NC9IbE9NU25VdFk2RzJO?=
 =?utf-8?B?WHVXS2dqZXM1Ky9QNFV3SExiSHJHVEg5MTliNzdSaGY4cE9pMUJZQ1FoSHZh?=
 =?utf-8?B?dE9PVCt3SWRpVGNNd2NpSGgrSFB1TU1Ub3c1ZjFLRk9QaVArQTFVd3cvblUw?=
 =?utf-8?B?elQvcyt1TDB2S21DdTVVZC9oaDZ4MXZaT3MranNDZ2pxck16am9iVzV4b2c2?=
 =?utf-8?B?YTMrd3VIVHRIQjF2ZHRydnlBMkdlRFh3Wlp5dk4yNDNjZUh3VzkwN1ZmQzJi?=
 =?utf-8?B?emdsRUltemk0MFI0UDZsQ1JHa2xjUHRWcjV4Y1BFQW9YR2NPaW5MT3NxK2dU?=
 =?utf-8?B?WDZERE0xbE45VG0rOFliaHBPaVdqallpM21NZlJZdStWc1lkM3U2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 66163394-d351-424e-909f-08de7e286e00
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:08:44.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SeNtAgDZ0tP+GvVnnoZgq4e1oGbEpyfLxgBXJcS6bUv9xeGL3pOWVmWGR0nbOIXnLxAFe/q1SMq+yMymp7yPQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
Message-ID-Hash: BSNB6Z6ILCK22HQQBUKOGWZY3SI3EN23
X-Message-ID-Hash: BSNB6Z6ILCK22HQQBUKOGWZY3SI3EN23
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BSNB6Z6ILCK22HQQBUKOGWZY3SI3EN23/>
Archived-At: 
 <https://lore.freedesktop.org/eec9ca52-95cf-405b-ac21-781e887caf0a@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 27 Feb 2026, Eliot Courtney wrote:

> Add the bindings for CE fault method buffer size RM control RPC. This
> will be needed for channel allocation and is also a simple way to
> demonstrate the usage of the `send_rm_control` infrastructure for now.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

--
Joel Fernandes

