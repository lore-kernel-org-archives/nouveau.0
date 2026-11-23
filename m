Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62AC606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 02:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=eHJokMoE
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACB6010F314;
	Tue, 24 Nov 2026 02:13:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C8B7B40400;
	Tue, 24 Nov 2026 02:13:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795486393;
 b=pWa9KGGmBlpSNjDOZDvy7wefEzjA+tRpOQut+lRrDICeRkAuTy8MjeeuQ5I6p2dgdiG+j
 tA3BfEzqx/i2JKNwPEmM3milUaDd+w8Q0c7yt8Goakg9PGuo2/kSJInEDRxaS52aI0i66ZI
 mnD6xNgTLPXz/Lo2USXbBBtY56d6FzVhZsyY8BgYAhxaz0iHec8KLTINa7CVj6oRbItEeLt
 294wHokAgng89j4no5yJSddAjFXrHCYcV5EeqkTKRQTuGbJdVdZOJFfUSpkO29USO6Sp3cp
 PEoLZhLvm/FXTizzpSMWNg41saETYGn4jV/6HeJnDGpnRH+iW5tAMmroZwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795486393; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=scyNyDk/jOtyvkCVY3fYW+SYyXZzMiVW3G2UUGiHmA0=;
 b=euuuq+8H20UjY1eXr5c5lpzkhEbcb5ZePoHSPuNA2lSMwqZCLSYHQoHaARNX9gCaBXYzX
 tlkK7gbd4JDZ0rPb/EuFVO+BAHV3J44wWfsf9yURKdwY2ExQ9nz8PWE2oDRuZ6HpycKitH+
 IXeXEG2n+9S2Kcz6mIs2QYWz+UX7AkbFiahJINgF8MnlqSKZCzbeXnvIFdJ3z2F4PqE9HXv
 v0wi0TVN9NmTumyquqrsF4XmRxMXzjrTwA0nRlsBslvWa2JEcKig0WJsBMYe85b5drVsrIY
 8vDDb/E6ga6SseZHT4O9twkgTuYD/oXHSVSTnvDiOjvmhynRExbV5jHaqM+Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=cirad.fr;
 arc=none;
 dmarc=pass header.from=cirad.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=cirad.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=cirad.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 19220402F0
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:25:00 +0000 (UTC)
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E404010EBDE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 10:24:54 +0000 (UTC)
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id CA4A620DD902;
	Mon, 23 Nov 2026 11:17:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id A4FDF20DDA67;
	Mon, 23 Nov 2026 11:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr A4FDF20DDA67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795429045;
	bh=scyNyDk/jOtyvkCVY3fYW+SYyXZzMiVW3G2UUGiHmA0=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=eHJokMoEfa4ZQtyd8qNVxg9971B7DmDvXaspMLJrLukrrcbl1GQLbfLdyY/4bcL5e
	 iESoxAOm0LtFgwTT3uSrKiPK/ubR7C1DLOfcJUq/Hv41sYsdns7P09bY3RIQgT7Nu8
	 tuRaEfebEivw6Pi6IA1qppblpaB+Uj0cON5fOc5zITi83eTTK/M0UTZZhCbNGaZanx
	 Tx258lwQ4+5a2sa5ruCc83j17PImCmbRrcM9yA74MjcbdO8mMqkurYkJN1R9Roojfc
	 C1Ki9fRFuVfDlxhIjbBDk5cYSflrTnM2/bxPAPtMojmyPhFBKa1FvHyvS62+Xl7qmv
	 r2jpn/0NrlyVw==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id HmLyNAWB0j4K; Mon, 23 Nov 2026 11:17:25 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net
 [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 38EB820DD902;
	Mon, 23 Nov 2026 11:17:25 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 0/2] drm/nouveau: fix crash when DP link training fails
Date: Mon, 23 Nov 2026 11:16:57 +0100
Message-ID: <20261123101659.600247-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: frederic.mahe@cirad.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: 3SBMI3SILQ42TGVZ4XPK4SP3GA4WPPC2
X-Message-ID-Hash: 3SBMI3SILQ42TGVZ4XPK4SP3GA4WPPC2
X-Mailman-Approved-At: Tue, 24 Nov 2026 02:13:11 +0000
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3SBMI3SILQ42TGVZ4XPK4SP3GA4WPPC2/>
Archived-At: 
 <https://lore.freedesktop.org/20261123101659.600247-1-frederic.mahe@cirad.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a Quadro 600 (GF108), any failed DisplayPort link training during a
modeset crashes the kernel with a divide error in
nv50_disp_super_2_2_dp(), because the supervisor divides by the lane
count that training left at 0. Two ways to get there:

- Xorg (modesetting) builds 3840x2160@60 (533 MHz) from the EDID of a
  4K monitor and sets it on the card's DP 1.1 output, which can carry at
  most 4 x 2.7 Gbit/s even at 6 bpc;
- a connector forced on while the monitor sleeps or is unplugged, then
  any mode set on it.

Patch 1 stops the crash. Patch 2 makes atomic check reject DP modes that
cannot fit the link, so userspace gets -EINVAL instead of a dark screen.

Tested on Ubuntu's 7.0 kernel with a libdrm reproducer (SETCRTC with a
user-defined mode) and with Xorg; the patches apply unchanged on
drm-misc-fixes.

Written with help from Claude (Anthropic); reviewed and tested on
hardware.

Fr=C3=A9d=C3=A9ric Mah=C3=A9 (2):
  drm/nouveau/disp/nv50-: don't divide by zero when the DP link is not
    trained
  drm/nouveau/dispnv50: reject DP modes that don't fit the link

 drivers/gpu/drm/nouveau/dispnv50/disp.c         | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c | 10 ++++++++++
 2 files changed, 25 insertions(+)

--=20
2.53.0

