Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D620CA5FF6
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF36210EA79;
	Sun,  4 Oct 2026 13:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=saltyming.net header.i=@saltyming.net header.b="JFZa6H9z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E0F8A48968;
	Sun,  4 Oct 2026 13:27:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120453;
 b=omhnxgGG6/kURGPiIlrytmApxk84gysSl7aeFugU+/muxHwSvWtocD1MuIuBV0HdzGqmY
 PZSBfOvSTw23rVCzSy/yCPIwW9SrbF23dyG/wy8RhtyYm7rLGokUFdERAPdDHglnl5Jre9f
 2KgjUIAOMZP6zJHDnqQFuQacF+qnBniGFSTibJZ1vaZ755v0hYN7UiDRVCj4nyJ5NOAE4WN
 kpJ6C+zYEzX+bI95RYYpQirRarxGqhAQAyI+YJQY8WIPeFgAO/pgZs/AOrL8wNRRpJXwuG9
 dA0jHClFuRTuRqc41rgUcgia1vXTjhOEssuvOP/Pti092n3vK1khqC/99NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120453; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9y565mXmPk14OT+EJKpfLw7jDnD7lIoT4YWiqhVhvcA=;
 b=UsJ32EZwRtsOuJ+Zt1kuRxoT3EFsTYS5kK66lFgSdD8r23N1F/BYOQgzU4vR7GYTfGA5j
 YYnI/5twsCzZVIcxruELtOq0I3dRaxF8FGtmLszlsb5VK9rmPeyeq9a4yHkP0X8y1gZWg5E
 2RhTiDJfypeZ6Vr4wbWsg45Qj365ixARZs64qIe4+1WTTPBMPE9W4AzXU+IPJDLh9VjtT2M
 S8fffThwCrnPR8csGSQXeqg/0C4yeyrT9egbGYztiBEZ8dY3jgriTQQdztaiaPxfCZ0z6V/
 MC61FpEO80MhqxsGBc9OU5BUvO5LhKe0/5PMHhcdKS5Nu14JeL6cFn+u5azQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=saltyming.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=saltyming.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C9358474B4
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 00:09:00 +0000 (UTC)
Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2089B10E18C
	for <nouveau@lists.freedesktop.org>; Sun,  4 Oct 2026 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net;
 c=relaxed/relaxed;
	h=To:Message-Id:Date:From:Subject:Mime-Version:Content-Type; t=1791073631;
	x=1791678431; bh=9y565mXmPk14OT+EJKpfLw7jDnD7lIoT4YWiqhVhvcA=; b=JFZa6H9zjb
	WEot6ICHTO44N3lcQYqjiURlBxvzZGsMtTCl8yYUTe3JI1larDQjhUlT5oi2TfT543Q4+KgDeYH
	Wlx5BCLssiRZP8PhVDdjJacphOsFy4LMW9NyKfuuME9E0a9uqBFxFTow1rU1czuXE84Q58d/79d
	zUubx0fLIjELMuvbeG8ortIsVmoCk6Ptczh5HmOLK9K6Jd0fvKjnCJMsLPfjoXF2HrEwwVLnBBb
	Tu3hXiXsvC1QQkbefwtjg4jfXBjtqBNU/M4gkGqH2fEBWAAEWzN4xsS+Mpj728sMrI6KWP4JcEX
	HwblbHbQw9spZlIIc7joTwaArXAAZIkg==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.2 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 bits=256/256)
	(No client certificate requested)
	id c742be01-9ea0-4b1e-b561-fba11438c28d
	for <nouveau@lists.freedesktop.org>; Sun, 4 Oct 2026 00:27:04 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none,
 av_clean, ham
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.41\))
Subject: Re: [PATCH] drm/nouveau: request a privileged CE channel only on
 Kepler and later
From: Hamin Sung <hamin@saltyming.net>
In-Reply-To: <cdc6f42770d824240a6d4474d090a9be8da7bc2a.camel@redhat.com>
Date: Sun, 4 Oct 2026 09:26:47 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <F16C3327-4F6A-479E-B4D1-F8F2B1F55EF0@saltyming.net>
References: <20261003223244.63133-1-hamin@saltyming.net>
 <cdc6f42770d824240a6d4474d090a9be8da7bc2a.camel@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3901.200.41)
X-MailFrom: hamin@saltyming.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: U62JNOMM5EJHBGAL24XRPF7MEALVNWZP
X-Message-ID-Hash: U62JNOMM5EJHBGAL24XRPF7MEALVNWZP
X-Mailman-Approved-At: Sun, 04 Oct 2026 13:27:28 +0000
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Yonatan Maman <Ymaman@Nvidia.com>,
 Gal Shalom <GalShalom@Nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U62JNOMM5EJHBGAL24XRPF7MEALVNWZP/>
Archived-At: 
 <https://lore.freedesktop.org/F16C3327-4F6A-479E-B4D1-F8F2B1F55EF0@saltyming.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

2026. 10. 4. 08:53, Lyude Paul <lyude@redhat.com> wrote:
> The LLM didn't mention this (of course), but you need to increment the =
version
> of the patches that you send out when sending new versions along with =
a list
> of changes that were actually made to the patch since the previous =
version
>
> Also, while LLM generated patches are fine for fixes (to an extent) - =
but
> please at least make sure you write the changelog by hand to avoid =
inevitable
> mistakes

Sorry for noise from the sudden series of patches I sent using LLM. =
These are my first kernel patches,
and I just wanted to fix some issues with my old NVIDIA graphics card.

Also, those weren=E2=80=99t new versions. My mail server had a bug =
delivering most messages twice
(I mentioned this in the devfreq RFC series). Sorry for the confusion, =
it=E2=80=99s fixed now

I=E2=80=99ll keep about versioning and hand-written changlogs in mind.=

