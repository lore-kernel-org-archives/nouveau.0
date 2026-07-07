Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23735C43458
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:26:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7810E852;
	Wed,  8 Jul 2026 23:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="ENSufElN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47A1446F9A;
	Wed,  8 Jul 2026 23:11:31 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552291;
 b=kil8Fg9ZhfqVOlENBe1lWh1PUi1AEnoLivq5vlKeueuoQEdPka1CytxyO5As3tfbtCFly
 nxR3I1dVaHk8E0BnApkrZx8e/KnWwCbUGb7ih+GxXXkvecHFHWykFaB7ZqQYsRZYoqD8huQ
 Kwg8AOluIgC5XgozdFkmUY4MamXspKSvKO3/M6Eky2bw2dyHYx5YjcdUeHiLCjGDOlvF1Wj
 6G4cX9zSQ+f4JHKNYeBbVRxkQ/juBjU2Nv+ElJtIjMgWRz3UBvSS+aH4Kc+2vlGDSQmQFLT
 lg9EhEX563FlJ0+EflMu9yQFkTj39nC6nr7fc8k2HBEWmWos0Wf648Um6Zkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552291; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OuwODL/Y0Ylpe2Edfe8HjsUVpS8t3ywZf1afa7GP1VQ=;
 b=Z+5/+S+O/hmNC9llJ85t0PzBADInSGSMs5+4FtOgRolKFAmifMc2PL4Y48tb4/2R6zVbr
 8VqpjavUeAyml4cLjLAE9etMKUIwS8Ue8OeMOFCXED6nCkiOIc1eGoTmJJu3QYGtWuRwfqV
 VxPCjg8fLV3y41LaRnCeJpkgp1qFiCcZJVdazGB1/R7SScSO2wJu6TPkmBP7qtZI/t8w0Pl
 Lpx8BPvWmlJpc5jkcyYEJnly8DcoDsFya2C1YBEDDpDDEBD7FAg3OZQdJGQTqPnYaopDCvt
 KcGUFyDtB8wrUoyIICz7Xg/DAfxrhIhuDF0aJ+JCtDcI0OlXPitdTteshY2Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=mark.filion@collabora.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F46F46F4C
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 13:53:52 +0000 (UTC)
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E00BC10ED61
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 14:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783433327; cv=none;
	d=zohomail.com; s=zohoarc;
	b=k1un9JjIbJvuou/YeopJBLOz0n+p7Fvnw8sANYuLOpYMgECUqV/mi4e64kp6PTmSUBeZyxVh8BGL1QBDnuO6DmHVBT5IaMIZFF7GpZm6/f6l6WyHFLRiDKQP4iWY5NXa4vj1VmsL1S2D0jeh7viq72fY/7/2U7+RWqVdUUAl4W4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1783433327;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
	bh=OuwODL/Y0Ylpe2Edfe8HjsUVpS8t3ywZf1afa7GP1VQ=;
	b=fptROxdleEPX3UTF6fIOpa63NUJsIj1pj2EPU8X+IkH+nyZlINEY8U4vlZTxg/6JGz/xyk3tkB5l7ubGkXEccWZJE6CJPkGCOeB+TmHSUwuaSV0c8nR6+lTiKy3JNMqc8ve71U1qr33WhCcGNBe1/Ro4JJt9RtvXcXC+XvMnBS0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=mark.filion@collabora.com;
	dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783433327;
	s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=OuwODL/Y0Ylpe2Edfe8HjsUVpS8t3ywZf1afa7GP1VQ=;
	b=ENSufElNa0RLtofFx5qXR+1c6CSynlwkXnx1RwO5sTr4yvXYbrV/jyeZIUqLZiVG
	bU+qTlvyPDfKZdPpEKLUNgGKJgNzs/ATL/DomwSRtB3RJ9L5jGM91K+68QbgtkrP8vb
	+lmoPI0ix+hosztc7kz7WuTCVInemBh8P6DMJwZ4=
Received: by mx.zohomail.com with SMTPS id 1783433325664306.375506982749;
	Tue, 7 Jul 2026 07:08:45 -0700 (PDT)
Message-ID: <6a194258cb43f5603d5939cce0278a0cb1ed3e5f.camel@collabora.com>
Subject: XDC 2026: CfP deadline extended to July 15. Submit your talk,
 workshop or demo!
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 07 Jul 2026 10:08:44 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-MailFrom: mark.filion@collabora.com
X-Mailman-Rule-Hits: administrivia
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; implicit-dest;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: UJOMKOYGASELOLMT7EFSDJXR324MKPZI
X-Message-ID-Hash: UJOMKOYGASELOLMT7EFSDJXR324MKPZI
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:11:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UJOMKOYGASELOLMT7EFSDJXR324MKPZI/>
Archived-At: 
 <https://lore.freedesktop.org/6a194258cb43f5603d5939cce0278a0cb1ed3e5f.camel@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello!

The CfP deadline for talks, workshops and demos at XDC 2026 has been
extended to next Wednesday, 15 July 2026. You have one more week to
submit, don't wait!

https://indico.freedesktop.org/event/12/abstracts/

We're especially interested in talks across all layers of the graphics
stack, from the kernel to desktop environments and graphical
applications, and about how to make things better for the developers
who build them.=20

Worked on a cool project? Don't let the bar seem too high, you don't
need a polished, groundbreaking result to have something worth sharing.
If you're excited about it, chances are others will be too, so don't be
shy: submit your talk! Head to the CfP page to learn more.

As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

https://floss.social/@XOrgDevConf

Best,

Mark
