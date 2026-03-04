Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC3EFCE39
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 19:04:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE24210EA99;
	Wed,  4 Mar 2026 19:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="AXnrY9bH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 156F944E37;
	Wed,  4 Mar 2026 18:53:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772650430;
 b=qZM3gRQ6q4cm/WT9a5udv47rKcq9Ld8OuBZnpDgQ8DbbrPs1ZtkSq1//zAGiuDvzE2yd/
 Wa06SRhldAqJszjsXvUQcFnxL8KHXN8d+28wTimXKpX+on6SY18b68PotaiIv0H0ovo+LT2
 YI3jhJD96wVlJipTYru+5yDvSeANQChFQuQXfnTSOIrt217KQJ6wIawJxSQ1j9VkLUq0SO9
 YZ2Ymt3Fabs9pTrKZSBtxfniA1X3lU7Ob7MBmNLjPCPHxVa66rEd3KFMdy8izo38DEYaXnL
 CNNK89uT+CLHe2aqfgrmjXZlSTFNNAALd85GHyqqoxk3sPW+ZKbAJUBhsIFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772650430; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U8Ya/AAeCvqsURrRvVeXLXd3wvOiRouOcfx0WUNJlFM=;
 b=prwWII+0F2IIEKD1G1DZttymifOp+6z41csA/RUQT674XQ9Ke8Vv27PhS2Z8f4oNfORO1
 3kQk57gSG+BCs9J84X3NX2GmnWsmuqAwBf2UDmXIhMtJowKQPlkCAhI3gWHpvaisyz5VnyB
 Dfg5+HddDv5aBh5JvokwtA1IhmGlctyBzM5eQXq8hVeEOIbxnj4/sSzHQFMzEHBL9u/82hh
 dEKTI8s9cYQumPqcRNUZBOtS/l5YV6mpTvasUoQnbPlfYt6pOHvSPfhWmCtYWgll7NC9ZcE
 SPsr2vC+5xQ+/S+Ov4d2QpFeMiUUafyDO2d9JpqX55/ozNeHYXyHedABVCWA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E41E44E41
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 18:53:48 +0000 (UTC)
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022083.outbound.protection.outlook.com [52.101.96.83])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B35210EA6D
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 19:04:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaHNqLh0vlLMc8ruwZOUVj1+MmnqOuwPJYUiEFD7cXukESl5/325DuK6XntHdU7jFZDZLbqpxBbVqOIBd9fkaLD2bSNIBZrzg6FncQtsG6kXCtWI/MI3i+ClFcFp23Y4cBlBQwF++xIqINB1zWk0Bej/+sT2CkDMfJ3R6U5MP58GsZDauqgv+soBE3/+OL3+8G8ZMFWDOCho60T0QIy/3o1Dv1cyX6hgVRWRHEQZXKR2woJLyCGdSQnE/2lcaK5RTGQz7S1UT5wrnoBlDChPyNrXeLYu3p+61bfQ+SqzETX0guk9tMYQ+Z9dmp4BxVCULpM9tH+qv8tUdlVfrLW7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8Ya/AAeCvqsURrRvVeXLXd3wvOiRouOcfx0WUNJlFM=;
 b=eAYQzu7ACeAPHfh04qSFxQb0omRL66+Pf2EHErnfHI7jeqx/dIAiMEdjStbcjC5ekhmlRxRpvJ0lhHSYLNFBZCTTnFEKYEU3rAJO9fHqBQpU5slnkhuug9EyOwh3fxusLAWQIGnlRFag8sbxQzSJKVaaaOM1cUI4AWB/yOacxrS78pOzPCq+evZfJX7h3dA71hB5jBmcnBArBbyyGEZAGMYTFHTNy3c8d8DgtvbVJJNdNRuxeSTR7UrFhlAitr1kNDsH0TmEnBy+DtCo1ma7pxa+kK9kR8pRQO6thE+00YI0QZHvEMJ7z7nMIZd4qiLskE/p+wewD0mX9FLZ+TnfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8Ya/AAeCvqsURrRvVeXLXd3wvOiRouOcfx0WUNJlFM=;
 b=AXnrY9bH6Slbks4QKJRttjMBQkp97PZg/4FyHQKMeLoBFSwmirQkoW9h59N6NTppMzURuf19BBZaystVGTLctQYGQwgeJnntccYpJEGNgg9qiRdBVfIW0kCCzXkhd9YWWVRq4jZ9nU6rRwfb5AUdPeyl0AFtzeKnHdzs4eA8jWQ=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6864.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 19:04:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:04:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 19:04:03 +0000
Message-Id: <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
In-Reply-To: <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
X-ClientProxiedBy: PA7P264CA0328.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: f156f854-7cbf-41be-f7d9-08de7a20cdee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	G+JsZ8XibKVmEKv8YiLsbwF0hq4XqUy2qt9ZsSK0T3Xpgo0F4N76jTqrLKJVcYafQvy/itXtces7FVmA06zPhOmEkXLDNHr+frKo+P8ZyAy7nRjW2dggx7HDg8izK56X4hTLvX9ZXQeLmXo14+kQLCjRZ/uWA7Bg7aE/lr3HNMLQXcb2VtxF57SxCYTu+e3MsCGMNfXW8mcQL68jBiuUJVmQTfIQpb/mJcUY+zBohIlAQ1GYx3gTF2hgH9ztznaesQHGmPB/M7vxq2n0TiBCIzBlD7NHexiQ0nNhHSxqzn2c9WUuaVvR+nYs3YIPbck9BcfOZ4M5oZWfHTb46i8Vv5mUaP3f+RZtcLxng25VnickNPdmg9qPSzebXoZnkMveVPHB7iwV92VApKSbg5YX7UwXBiWFPqBnI82COieQQ0bPaz9njCB/tXBEa3DgUxQUYBD+rAXYoLRuualhXiA5jOtf7lE7n8b7DPfqkddbBiH8eYqs15/TXiET38NWkWULAgXdE0mrIGsurbWQ/s/Ojp4M/Ihk2exd5FgalPL3Wso/gYS0uht9eIl9brR+2B7S8ktFEoOKp3O9KjzkN9uDeHi+Hj5405E8S6U3KDR1yN6VPhcz86FkpneQ0TRLP9LGn44vVQF2PP1QsZmOw8IH2zBrrnYwBYj8h1nx2228uU4SWGWjmqWHcAaaWU0Jwv6t2LGzVaRApj8TOZigbOeysruSg4mJdQyFy8xATvWQycQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlB6YWhZVkVsN1lOTGVBOGl1VS95TWxaTWVzbGNNQko3Mlh0QzVlUjZSTFdP?=
 =?utf-8?B?RjA3OEpzTGYyYmw4Rjl6U2w1Y3Nobk53ZHlsK1k5SEhXUHhXb3Z0SXFlWFVt?=
 =?utf-8?B?QVNoVURFZk9DUDRLRm5hTncwV3EyZmtIM0NIamhFVkRRTktlckY3SVR1dkN0?=
 =?utf-8?B?RS9zTHpqclNzUVk1c21CaUVQRDhxazRyV2xuWm1uUTNZWVNXZlBlWEp4SERV?=
 =?utf-8?B?ZzZ4VnhtdDdabWhCMTd3UmV5N3RFSXB1QlhwMTRJZjA0Y01TdlJUcU5uU1hE?=
 =?utf-8?B?VHUzUklzdUduUWhsMzczMWNqc1hzSktscmE0NTJmTUs0ajJCd2pnbTZmQWJ1?=
 =?utf-8?B?VzlnUEtGUzFMUkk4ajR0UkFjdmZSVkpMTkd3bVhEaEVxRGdxSlVRZEROcEl1?=
 =?utf-8?B?VmZtVkNtV0sva1IzcWYxajdmbmp1QU1aWkFvQ1JOOXBKT0oyTEdWWXNldWlx?=
 =?utf-8?B?NGtYNS9qY3FlYzdjVVMrenNBQ2VPTWtPaWd4T0dEWGpPbXhwVUFCRjJrSTYr?=
 =?utf-8?B?TkxIQjRER2ZLc2ZoRGhSMWtjeHpZeFBocnhwNnVXUEZwMG10TnVINnlZWTdU?=
 =?utf-8?B?UnNaczE1bG9DZjZQaHhMNEdsRllrbENENFpwaitOWGxXUnVKblp5Uzc0TWZz?=
 =?utf-8?B?YzlGRmdxZXh2V3lZT3lWN3h1VzIraGtsY1RjSGFRVHpUeGYxa0kvRHNxNU9l?=
 =?utf-8?B?cWY2Mlc3MU5JMFBXTGpCZkJOVWNCbHRlRnJvbUhiYUNxaVpkMDRRQ3hiQmhi?=
 =?utf-8?B?dTBCZ3hTQ0FjSjdBaGY0a0tNdG1iZU1WSnE4OGJFZEdrbzVJL0k1ZG4rSkhN?=
 =?utf-8?B?c0l0Y1ZTYmhqS1YveUNlT0ptcUd3aGdlWGxTNVQzUGk5a0RqMndwMW5FT3ZO?=
 =?utf-8?B?REovRTRJaWpYNUNBc3d6eHl1YVAxSjZaVTR3TGgzTk1aTWMzejNWaEYxc3gz?=
 =?utf-8?B?K3lwL3VFbkhpbENRb2hpaWpHYndqRFhDV3NMeENQWU1nblBjczNuWEJoQTNk?=
 =?utf-8?B?eXRMNGJJVWtBTlE2TXlGRk5HYnovUVhmaTVYd0hEbmpwWHRJMW9zbVovQzA4?=
 =?utf-8?B?SGo0NVZQNFJjT1dyV1VDVTZPUHNVQkY0QWREdzZaWTFYRTV3WjJQWGVmNU52?=
 =?utf-8?B?SWhDNGRGMFNDa0ZZd2ZMOTJVeHlnU3Y0bHBXSUR0ZFE1Z2grVXgvZjdVS1d4?=
 =?utf-8?B?TEp6cENLNnVSZmRrcXM2WDI2ZUdERTQvN2hzeTA1TzdSU0NvZDVMMEZ4d0Va?=
 =?utf-8?B?dkY3VktTVWk0c1k1UUNnQ29qSnd3bWRFc0EwUXljcEpERUdVYzl5SWl3a1R5?=
 =?utf-8?B?SHlHaUI0K09iYjZuaUdjd3VhanhOQURGeEtiYStLamFhZ0x6R1ltazc2a0Mx?=
 =?utf-8?B?ODJqZ3k5YlRNakova1NWRUJ0ZmhiUHpHb0tLSzdaeDd2NGt6TlZDZ0VtclhU?=
 =?utf-8?B?RzVpalRaZTJzY1h1Q1pHVjY1STNTYWdQOFFTaXhNaGhRNVVlWlNqaGI5WGNY?=
 =?utf-8?B?N2N1Mlo3dXZmNjZIR1k1NE1IblhJdWxzU2dKY0wvMFR2Z25ubXlxZHZ3eDBt?=
 =?utf-8?B?Wnp2eWxrSlZEb0ZkaU1jTmNGazEwbmVacWhnOHViMXRyUVJuZkNSR3VLK25X?=
 =?utf-8?B?VFQzWWZwRFc1R1VHd2hXMEx6eTNqcWtUSVdJb3IwMUFwOUNpNHBjanZaQ3Vt?=
 =?utf-8?B?ZEp4OGFUOXlDQTlZMmJobzJJSnlMQi9QSFhSd05ySlY3NU1vRDFERTBEb1dk?=
 =?utf-8?B?SmpmUDFnVGNZZUlwdTlHSlE4b1FvcjI2RHoyMS9ibHBPYVhLTG9WNDFwSGVv?=
 =?utf-8?B?ZVljd0FUcGh5UWRTVlR6bzNBRFVvckJRZStSZXJnUmFWZVJySUZXdzVRZXQw?=
 =?utf-8?B?bmE3K01rakVMdjU4RENzcVZSZ3c5N28wdHBHYTVrMmtCU2MvZmIybGFBNmgv?=
 =?utf-8?B?VWlSbHBGVS9Oa0lTY2FJU3h1K1o5SmwwaFFEUWpXUVlPS0R1a2x2aWxlYnNh?=
 =?utf-8?B?a0lrbnF4dXY3YXZBWVRLM24yS1RrY3MwVzNBYkRXSFVmMWZQdTI5Mko5NG44?=
 =?utf-8?B?Wm02MzJ2bGZuWUdrajZFZlZsWW5vMWdNTWZvYm5sTTRjK1pjZldsV3JTWml4?=
 =?utf-8?B?eUprR1NXdExZZXpRQlBGSnhCRlkzZmtpb1E1blZWM1BtQmQvTUM3Zkl4Z3NL?=
 =?utf-8?B?Tk90ZmVqYkxyUlFiVjRRMC9KY0Iza3I4ZTlheGRWbkdycjVWWW42aU0xdlU1?=
 =?utf-8?B?L2YreVJJc0xzVnlNZGFSV3NaUDdkdjVPbWNRYjlnUVBLWmJkUXBOZzlhSCto?=
 =?utf-8?B?dERkYkNTRnlkWDgreTRzeDlza0E5ZVhvKzFubzNiRzJOK2JkTWM3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f156f854-7cbf-41be-f7d9-08de7a20cdee
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:04:04.6535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TwT7BYVpobpdVxIjDUN1BR360ztYwpgdYozdXVcyOQCv8PjFJuZF8VI2NqWx4Jxi6Na2rLoWh0nCnLYDxml4Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6864
Message-ID-Hash: SHKCGAFU7XSNKOILFSH5VIQ365UCSMUE
X-Message-ID-Hash: SHKCGAFU7XSNKOILFSH5VIQ365UCSMUE
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SHKCGAFU7XSNKOILFSH5VIQ365UCSMUE/>
Archived-At: 
 <https://lore.freedesktop.org/DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
> On 3/4/26 3:18 AM, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
> ...
>> The implementation doesn't address any of my original comment and all my=
 points
>> still apply.
>>=20
>
> OK, so that implies that you want to return an Option, I believe,
> like this?
>
> commit b41512390999f85bcb2a3809c68f392e936b09ab
> Author: John Hubbard <jhubbard@nvidia.com>
> Date:   Thu Feb 19 14:44:02 2026 -0800
>
>     rust: ptr: add const_align_up()
>    =20
>     Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>     equivalent of Alignable::align_up(). This uses inline_const to valida=
te
>     the alignment at compile time with a clear error message.
>    =20
>     Suggested-by: Danilo Krummrich <dakr@kernel.org>
>     Suggested-by: Gary Guo <gary@garyguo.net>
>     Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>     Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..7e86429a9cb5 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -225,3 +225,29 @@ fn align_up(self, alignment: Alignment) -> Option<Se=
lf> {
>  }
> =20
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Aligns `value` up to `ALIGN` at compile time.
> +///
> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
> +/// `ALIGN` must be a power of two (enforced at compile time).
> +///
> +/// Returns [`None`] on overflow.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::ptr::const_align_up;
> +/// use kernel::sizes::SZ_4K;
> +///
> +/// assert_eq!(const_align_up::<16>(0x4f), Some(0x50));
> +/// assert_eq!(const_align_up::<16>(0x40), Some(0x40));
> +/// assert_eq!(const_align_up::<SZ_4K>(1), Some(SZ_4K));
> +/// ```
> +#[inline(always)]
> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Option<=
usize> {
> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of t=
wo") };
> +    match value.checked_add(ALIGN - 1) {
> +        Some(v) =3D> Some(v & !(ALIGN - 1)),
> +        None =3D> None,
> +    }
> +}

I think your signature should probably just be

pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize=
> {
    ...
}

Best,
Gary

>
>
> thanks,

