Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA53606A323
	for <nouveau@archiver.kernel.org>; Wed, 28 Oct 2026 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=FcxEwz5G
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F35C10FE33;
	Wed, 28 Oct 2026 18:52:12 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CDEF648BC6;
	Wed, 28 Oct 2026 18:33:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793212383;
 b=iF98QBdiSvh27+GT4Spl0spXKaeHjWV+qnyZVWuUTrC6LeTCuBbNG/JqddJh46awhN3wF
 ny9nHrusSmkuna9BCM7xGOVQWtyfBJYfUFFHFSxzna2OlyE9ixjxHTKfk57PDm2cN4LIB+S
 XptNst36LVIQUHMKuTrcjGVYtbJSvB5nwWLTHnNRR33/ubMiJjRnu9TZycu3XAKIMhGLXZ/
 ydLpoK7z9tCg4rMniIW/xDIh8gZYzgGZ1UgIArfKj7OwBq+ZKAqWaxGzMR8kI7HH1hhlblO
 95t5ACdoUc1vM2mzJxQRw87CP1xEcLD0hknH3U1WN+ymfgkh7l3EU+YM/Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793212383; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+ZD05EjKEZzHv8qmJcrnBTCFE1Knkthe8+yZiKrxqVI=;
 b=gtlDD3z+7UqqB9lOone+4CdxzZfVmj7g2TfzZUtgubOy9LB4sDlQiPe5ktfowNVG7umIV
 E8gZNNiQ7cHutq9yUPNbxtYVfo/OnQ5EscKsABY6eJiUU3nWxeir7EpRxV7a3NHNIl/obA6
 jSkYahop4AwMtXFOVKskCNvaEjl37rQDTYVvuIw28u5OT8M/1ctZHeh9T+d2BwJC/+wcnN4
 2ocrFlMOrxaFuY/zw/VzFCRUuIMjoOf9zepH6vBb0VdFe3/rvi9pruxeW7BoOeRy2c9gbNm
 czeVMd1XNs0HqfO7MeeD/MDv/qQFilp+BANrsY5t3AB/p4yVYRt4ssG4dH8Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yandex.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yandex.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yandex.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yandex.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 32E7E4723B
	for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2026 18:33:00 +0000 (UTC)
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [51.250.60.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3817910FE24
	for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2026 18:52:03 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-34
 (mail-nwsmtp-smtp-production-main-34.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c43:45ff:0:640:8ef9:0])
	by forward101d.mail.yandex.net (postfix) with ESMTPS id D506CC004D
	for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2026 21:52:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-34 with ESMTPSA id
 dpnwjsKh9mI0-tpKf0OvA;
	Wed, 28 Oct 2026 21:52:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1793213520; bh=+ZD05EjKEZzHv8qmJcrnBTCFE1Knkthe8+yZiKrxqVI=;
	h=Message-ID:Date:Subject:To:From;
	b=FcxEwz5GlS3a8InFj50HYaI+oLacDSBPhgtACs5RG6utzCKFEjS7WcDb5Me/tzH1f
	 Ob7uyihZOPHo5QbcUUuaLw0zUKRFMdcEdpAO805SKu4vot6ogzx6ET1ci675vCskdQ
	 r9985oa5YEWiiaoeTclMDAHOnyUC5NiSNTFK2bXQ=
From: Alex <xnderv@yandex.com>
To: nouveau@lists.freedesktop.org
Subject: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's clock
 management, a lab nouveau module,
 and a call for NVIDIA 390 traces from GDDR5 cards
Date: Wed, 28 Oct 2026 21:50:52 +0300
Message-ID: <20261028185052.54427-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 66HPQLAUFKLX325BAUZOI4L7P43IYECU
X-Message-ID-Hash: 66HPQLAUFKLX325BAUZOI4L7P43IYECU
X-MailFrom: xnderv@yandex.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/66HPQLAUFKLX325BAUZOI4L7P43IYECU/>
Archived-At: 
 <https://lore.freedesktop.org/20261028185052.54427-1-xnderv@yandex.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

this is a hobby project, not a patch series yet, but it may interest people who still have Fermi cards.

Since early October we have been recording the NVIDIA 390.157 driver with mmiotrace on a GTX 560 Ti (GF114)
and on a second card (GTS 450, GF106, recorded by its owner), plus the last pre-390 drivers (270.x) on a 2011-era
stand, and turning what the driver does into a written model: which registers it touches in which order, which
waits it makes, and which of those steps are actually necessary (checked one change at a time, 60+ experiments).
Everything is from our own traces, VBIOS tables and open code (nouveau, NVIDIA's open Tegra/nvgpu code, open-gpu-doc);
no decompilation of the proprietary driver is used, so the results can go upstream if they are good enough.

What we have so far:
- Core reclocking on GF114 with nouveau's gf100 clock code plus the PTHERM/FSRM "bracket" the NVIDIA driver puts
  around every domain mux switch (slowdown engaged before the switch, released after). Without the bracket the GPC
  mux sticks occasionally on our card; with it and a dwell of ~4 us after the "engaged" flag, 0 stuck in thousands of
  transitions. NVIDIA 390 waits 8 us by its own timer; 270.41.06 wraps only the mux write. Details, numbers and the
  register-level map are in the repository.
- Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU memory scripts and host writes the NVIDIA driver ran
  on the same card, through nouveau's memx. A generator that derives those scripts from any board's VBIOS reproduces
  88 % of the registers on the second card; the rest is chip-level layout and driver-init bits.
- A VBIOS corpus of 306 Fermi images (with TechPowerUp's permission) that shows what is per-family, per-chip and
  per-board.

What we are looking for: owners of Fermi cards with GDDR5 (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,
GTS 450, Quadro 2000-6000) willing to spend one evening recording the NVIDIA 390 driver with our script (needs a spare
disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and to send the trace plus their VBIOS image. In return they get a
build of the lab module with their card's own sequences, and everything learned is published. It is a lab module:
hangs are possible, no warranty, no support promises.

Repository and the call with details: https://github.com/xnderv/nouveau-fix (issue #2).
Comments on the approach are welcome too, especially on what would be needed for an upstreamable version.

Thanks,
Alex (xnderv on GitHub)
