Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72B4C4452A
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 12:58:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 62EA510E780;
	Wed, 21 Jan 2026 12:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.b="JnCBp5t3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D515840221;
	Wed, 21 Jan 2026 12:49:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768999766;
 b=lu1mziBRRDLqYaOTWaQUjAJ7yKwB0afAhnO+DHb7Nix/21viuabRfgBr8llEe8+AP6UcE
 d13HzB3KfpBmT3iejAq9EwCEO68n/EMkhiQ+Qe2I+Px2blOb+doZafC7/BKCh72Rcc29Yl+
 MRqB+qGVZ5araT/0+mlWzqsd22BmVwhnJ63TwA0F3bmcvqLHitoa4Tv07rt76Li/mwuuy1K
 CtH8eLTfE8A/nzwE4CSbdF4aeJfU90+BPpy0N4W6JwkwNx8YD9JVo13UrMtF2Hh7fKHjaMj
 1Ljz+Chk5ZNBWCwXplVcwaPVv8oBEElotANYwquBl6/ktpfD/EKPtmguo6kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768999766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=M1IjJsuCkyCNJR7d9d5lc/Xs7l1v8A10Q9+aE6hDk5o=;
 b=XxbU2ci5H9GA+nhnk1nFmgTKflDK3veK8M2k6hiNOzXE/Ow8a/yVjGBemVo90a+9m5Y7C
 0WsaatW2+9tdYipv4oQJxr9iikpqcKWEtpdY7a+UuEkpvu2PNWvSebyDLdZqyvPrQMFFgdF
 IWuUGp4zMdqgL+JKAzwEr0+hMRyKKANpO9VDAg75HlTVmQKm7ZdRl2nJY2FnAl/pxjA+/J8
 9ryl5SiTtl2aRotwDMx6Qg1rP+Sz/rJuxG8PdEAijfxtQBN5o8G459qK3SBJPFgzQqAuuad
 REZAEp5FgL7xC+wybq7XDp3QNg55OzM6LTs6UtK4ILQ/st0ld1sJEXzwAFcw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linux.beauty header.i=me@linux.beauty; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E25EF4004C
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 05:35:48 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65CC010E010;
	Wed, 21 Jan 2026 05:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768974266; cv=none;
	d=zohomail.com; s=zohoarc;
	b=cZhpIDNUErIOAsEPvqPjjZg9iLKjz/FVysEPCCQtO21OclWkEPHDDez7RGUqru/DM82VnGZx5hSDQW8N250m+Y/N7jjYQGVii2wnwkRpiRGHCAsrGwR28nnxiOLrKVt4/pgffpnxH9qY7QJoX5AdxJMxckwT4EjiEyfI2UsPtu8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1768974266;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=M1IjJsuCkyCNJR7d9d5lc/Xs7l1v8A10Q9+aE6hDk5o=;
	b=hYTSU4u1ikruzES3hVVB5K0UDxwHSBv2D4D6qEClXOR14XiJIRHffx57Avp3Rni9qXKnvUp8ItDBssK0a7TTDVdgIn7I2yIiqN/l2ZcbKmnFzTtX6xxdpVGI+88Hc6ZSiW0ziqMFUQzsvKvqIQu5dXC3K/LctttYYWFMTMyEYiA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768974266;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M1IjJsuCkyCNJR7d9d5lc/Xs7l1v8A10Q9+aE6hDk5o=;
	b=JnCBp5t3yTDjmowYYitEkKBOfBPh8Eg+jPPv2657RexlCYNGWHIsBk61dU9nJRDi
	xNm+EF/7Qkukq7i3zr6H+nEsAMReXOlWQFYtLszEojHIVu7EHaDZXuY/HJH2G2MoQMG
	w/UoysBoSj661XqFkLbU6DL/CBFwD3PvEULP8jzU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1768974265002130.89096268231458;
 Tue, 20 Jan 2026 21:44:25 -0800 (PST)
Date: Wed, 21 Jan 2026 13:44:24 +0800
From: Li Chen <me@linux.beauty>
To: "David Airlie" <airlied@gmail.com>
Message-ID: <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
In-Reply-To: <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
 <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-MailFrom: me@linux.beauty
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ABO6UZX4LBAW4XVS342A5LS4I7TB2P7Q
X-Message-ID-Hash: ABO6UZX4LBAW4XVS342A5LS4I7TB2P7Q
X-Mailman-Approved-At: Wed, 21 Jan 2026 12:49:23 +0000
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Palmer <daniel@0x0f.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ABO6UZX4LBAW4XVS342A5LS4I7TB2P7Q/>
Archived-At: 
 <https://lore.freedesktop.org/19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Dave,

 > Hi Danilo
 >=20
 >  > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
 >  > >  > > +       usleep_range(200, 400);\
 >  > >  >=20
 >  > >  > Why is this needed? it at least needs a comment.
 >  > >
 >  > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is sk=
ipped, so the GPU may remain in an active/DMA=20
 >  > > state and the next kernel can fail to re-init nouveau. We can=E2=80=
=99t call the full DRM/TTM teardown from ->shutdown() because
 >  > > userspace may still hold DRM fds during shutdown, which triggers WA=
RNs.
 >  > >
 >  > > So the shutdown hook reuses the suspend/quiesce path (safe with ope=
n fds) and then powers down the PCI function (D3hot)
 >  > > to leave the device in a consistent state for the next kernel.
 >  >=20
 >  > I think the question was about the usleep_range() specifically. :)
 >  >
 >=20
 > Thanks for the hint.=20
 >=20
 > That usleep_range(200, 400) is just to give the PCI power transition tim=
e to settle before an immediate kexec jump.
 >=20
 >  It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior, w=
hich already does udelay(200) right after pci_set_power_state(..., PCI_D3ho=
t). In ->shutdown() we=E2=80=99re allowed to
 >  sleep, so I used usleep_range() instead of a busy-wait udelay().

Dave, if this is ok, I would add it as comment in the next version.

Regards,
Li=E2=80=8B

