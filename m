Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39BE10BA434
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 14:59:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A989F10EB16;
	Fri, 27 Mar 2026 14:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aliasing.net header.i=@aliasing.net header.b="Y9h6/nxy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4BFA645323;
	Fri, 27 Mar 2026 14:48:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774622902;
 b=mwXtU887wsBcVS9MA4nHyzK+I1kMY0CN5Jsv19+GKZboK3nKj2MKCiGZt7CP9E5R0hIOC
 dWVmzaO5MQ053Kas4Qt1YRtD77l3sUi0WpIzpDveBp4FJM3QZ0Kd3skrhZ2LbOnRKFTk8qQ
 APB9tz9duw8+yxk0weYvsIZ/X4cx653svUSQAX9NwiSYh92pVuekMLFG3Yfl2fUf8p+XciZ
 qWLLizRcWTfCIISiqxjSRZgLOMyuW24CqTBIu8kqWkbYBffDg9c8x6CWyJ08WvV0/w3trrz
 ZTU59w/WCONmoXM4DEl6YnbLI+VfyPfkBc6aN0YStJz9Lz+YUc5MIS5qSyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774622902; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+yGrlzp5BwsGqLDcldOQtXxixKAsL5lSNYWLykh/Mq4=;
 b=TJhm62fBgeLzyTwNnYe0HcU6AXLexmeR1GYa2S+N6DYIzj7eYx23O9FSUs9khTis6Uby0
 K6hqxnA8nFsaKLiGvndycU/XKUed2Kc9GIpAQuVf6AQpggROwqpgE9ASD/qVcu53IrWBu+w
 YT/Jz5DaP75LHYQlYASktxCprbc0opuCEwrwEvDuaXFZ1NXF2k1aFAcZrRHRbEmO80iKh54
 ZkXxvxWzLjsqjmlZLzgdtuAu9CVOBdKIHd5Y6Rjtl5ybKHEc7vUrpGiOTX40zZzC4HppcUU
 Z6LF3lJ7YGyvCckpXvcYUvjWOevS0cYBM2UFw8KxFFE9LSFo2mJDmqAew7SQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=aliasing.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=aliasing.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=aliasing.net;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=aliasing.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D098A44F5D
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 12:14:52 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Thu, 26 Mar 2026 12:26:00 UTC
Received: from outbound.mr.icloud.com
 (p-west2-cluster4-host6-snip4-9.eps.apple.com [57.103.69.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF7EC10E9C9
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 12:26:00 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPS id
 9C25A1800126;
	Thu, 26 Mar 2026 12:09:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1;
 t=1774526959; x=1777118959; bh=+yGrlzp5BwsGqLDcldOQtXxixKAsL5lSNYWLykh/Mq4=;
 h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme;
 b=Y9h6/nxyK0YtF7+cdvXxFFPAcsCuxaPhUfW9mgltCjkCq89otxAR1mQZv+qGt+C3AJVmsiM/Dj7D+NRSYnXMAUj6NlVb5zHr6k6QecB37L+OuSd0dXT2tu1I0S55kXP9T64qPPRv7/NJvNvc94t16DLCuKy29laglOazXD7J2cMDZREspjQNTsoRrdQpgdURsQqLG4Kj/URnbgEyJ9beflG4dmIqjsJP0DmpJ5bpwyQHok8keZxzj/i+bQQ4tCjILe+lXq5YrWR30ErbnyiznL53n/mYUzaTSmQ9J3T83qfYcBDPI67jp0vYzBIAVTACe3hAiYvZWPkGy+7NvJ13BA==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPSA id
 AC5D71800A58;
	Thu, 26 Mar 2026 12:09:10 +0000 (UTC)
Date: Thu, 26 Mar 2026 21:09:09 +0900 (JST)
Message-Id: <20260326.210909.43276613898103820.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: 
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
References: <20260319121653.2975748-1-gary@kernel.org>
	<20260319121653.2975748-5-gary@kernel.org>
	<CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Proofpoint-GUID: eqMS7S_G52C0wF8NsZjyMQ8O9Pmu7Vu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NSBTYWx0ZWRfX9LUqgBCH9GTY
 a5ATnf9PHeMqlEKLJvYFpH5HsDQL93p0TZMRxyJqBQZcD6/VU5UxZPrOJmTYnxL8KUFgrTneMtg
 be9QwNJRNSpauaqD/ojapwE6uoagfyGOSq761WY+ZzXO8BxNot9ZgoDrIFUFQdzL+xl2aw0L5kW
 dvnhoQc1dUlzSnECg/dFiWujV2iKujHA10BoFLiu3Is1kDUlt0m70qbmUXmRP76iL5+Axj1va+p
 gXd+0HrrhIDavaaS2fJtG68cbR9bIBqnmMEFEuQjxYiVVPS2BrUL+SbgQ48qC8oWkyBXoPTlDy4
 PUBRQqi/JjLE5QfjWA0VMoyOy+V/KYL1z5dPjiatWVQBeK66s6SmVOogtGFGb0=
X-Authority-Info-Out: v=2.4 cv=TY6bdBQh c=1 sm=1 tr=0 ts=69c521ee
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=7e8LTidUJLtXHkX_rzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: eqMS7S_G52C0wF8NsZjyMQ8O9Pmu7Vu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=395 clxscore=1030 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603260085
X-MailFrom: tomo@aliasing.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: WFTDBUUNVO3CNHBOEHKFXC3LXTLOAT7J
X-Message-ID-Hash: WFTDBUUNVO3CNHBOEHKFXC3LXTLOAT7J
X-Mailman-Approved-At: Fri, 27 Mar 2026 14:48:20 +0000
CC: gary@garyguo.net, fujita.tomonori@gmail.com, acourbot@nvidia.com,
 boqun.feng@gmail.com, tamird@kernel.org, a.hindborg@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 simona@ffwll.ch, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, yury.norov@gmail.com, will@kernel.org,
 peterz@infradead.org, mark.rutland@arm.com, mingo@redhat.com,
 longman@redhat.com, ynorov@nvidia.com, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WFTDBUUNVO3CNHBOEHKFXC3LXTLOAT7J/>
Archived-At: 
 <https://lore.freedesktop.org/20260326.210909.43276613898103820.fujita@bee/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gTW9uLCAyMyBNYXIgMjAyNiAwMDozNjo1MiArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUaHUsIE1hciAxOSwgMjAy
NiBhdCAxOjE34oCvUE0gR2FyeSBHdW8gPGdhcnlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pg0KPj4g
IHJ1c3Qva2VybmVsL25ldC9waHkvcmVnLnJzICAgICAgICAgICB8ICA4ICsrKysrLS0tDQo+IA0K
PiBUb21vbm9yaTogYXJlIHlvdSBPSyB3aXRoIHRoZXNlIGNoYW5nZXM/DQoNCkFja2VkLWJ5OiBG
VUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQoNCg==
