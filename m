Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B477AC5CFC1
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 19:54:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD41210E5EE;
	Sat, 15 Aug 2026 19:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rNDCyg8L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 25A654783E;
	Sat, 15 Aug 2026 19:38:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786822682;
 b=smrSe2bqhaXlqySqUiXaRwstPtDhbGH9QyAZfs0WPyF3yjZkpDYb+MYs6UycZ8uLlLln7
 pXsQto8HQXJOuBSZj7fKsc1lQRZBKgF0qgW3tR5OkwKGqmXkeUD1C1eCUYgKrVDRh6w4nYj
 egMuKh3PUpLXvNs8BjLKzV0GFvA2np3wRyzbgWvVuF+GhBPqeMM9xfJ5lWi740s8o+jVEbf
 MnPyxcyFOENL9wcR3A9xVSIYfRD7zU64eULlnDXEOAyRoSOVv9GqtksgFJrXhtz69SR8V4F
 wOjU41AwJ5kkmwYqsHSgVi6pdgl4kGY4kMuuNfudorWXgpHOkDFjde1eSE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786822682; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XKMY3jaHWrX5uq0Uxf4PZXTjVd1WvSfsCCpcygAO8bM=;
 b=JsbeNNdSpUEt0imQSjkkkYLAK70WcRG/BAo8TFHGMG9h3HN8K+tOnz6XGNq8wupbjIY+P
 v09356nlC2e/avdKYCZRLqPFE51597QaIvi7xtu7XX2OOruzhE4DYaw014ogyWsciddnM50
 B+l1Icu8SGbS5iCg4xvapZ49iZFXOn/oCgyYldGusPDw5BWOLYixP9qRcuC8jv0YNusvoDb
 +F7YR+Kp47oAHKRz94HX6z0EYaEMKJwzYfEdeKaCO/cBMEp2kdLqBxOkIwph8CUlFK/exoe
 uAaGTBHBdJIBbsL01g0DCXzAguW/47yPxoA+TIm/SIHl07D+nzIsINXfaVeQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C36AA476A3
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:37:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A55B10E220
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:54:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-495502852d1so1598085e9.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786823662; x=1787428462;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKMY3jaHWrX5uq0Uxf4PZXTjVd1WvSfsCCpcygAO8bM=;
        b=rNDCyg8LL9pBW9pZpSFfAVYZ59klv0fy+NsWzrbEPgt4JBcJHUvWLu9wBfPMm0bVKD
         DG6gqVltzgdAoyLsf5DZDPZMOjhMVIde1y/GmcTTLv61AzUrjeAqm6adFT5WWZk9fFw/
         25ugKCwPYasmNQ85bDV/MXQ01vzJHr4qewSSbQmoxRKfTFKxMTbRI2q97G/EwHFCdVez
         TLrm/FUKCkeSwERH++esHtdRNse/dJVYUS8jNROOMi3kh7gRQYEmidrXz1vxo8LA8RAq
         l6S42k84pimAFcEASZPnNBbniQs4G5vIrArPoRtkhXu24AV3QUbPwqqK9hyHMEYB28eo
         /DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786823662; x=1787428462;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XKMY3jaHWrX5uq0Uxf4PZXTjVd1WvSfsCCpcygAO8bM=;
        b=jFaI/UV+fCMGAAebYprQa4z6Jr4EX1KCZW5hoq+veg/+IHRkzEi0cxpaV+Z811hca4
         8l015yy8Wv7SnVDv7bCZ+cqIip6ECFf/3EkuS5utsgWFfAOHyM73Ph76zdXKY/Bk9Pof
         ubUF1ygwqEe3olcsNro+PqLzCqhnRjhht7VW58W0dF4OlUmaOjnBmQgMP6L72aU0w1C+
         N07BjVLi/OislKqGHOeYIDSCr/TD+AmS6J74iIwGs11ge+kHzw8kbdbyFgkY3elhOd1g
         RBcbJfKMKYdf3Xpr3323igFynYd2WhJEX+gQqTvVsFN9b9jG0gY9F0aLouTZBl94+SGF
         Kk3g==
X-Gm-Message-State: AOJu0YwUMyluvtSxjOz9Edfu9A8Sp3bOT1/DSeGVbnkgD5dlLH6zZaZq
	gi8Gje23LQapTQih02urBRCXV62plIZJNuSzNLyaLt1tzi1PNmYdFKbrQ5lnwLjg
X-Gm-Gg: AR+sD11uhYbyWD+HYNnhkm70P96X1L9X6+hw/+KW4QFNv3cB8mFcov4f2vNSirp+G8U
	hMFdhzN/96vM01swmJHipM7pOj1z74MB4yHW10muc/QSOoujUupMvcNEGFrTJugda/2y77VVs4a
	evRBJ3iFpEvjLc8lw6IY+WOFh/y2sODikctvBrcYgBUdPskc33soQGn2AGqosh6Dl3o/akqsLYC
	xdLAFGQbBQvTyG1xa4c65r+Fzal9IESH2evF9T1KzvDO/xnA+jypUM6h7Q/6Pv6GMqC4aUW08Vq
	QxvlZZ/7Uhxg0v0eTl9hZYb6E+bnFtRxgjDMqISq/fuPN2srcLbRbgWuXNuQwUHqP4Cq6CVbdHu
	rnWqQ5Azmm7Hw/EQVWexPt1yk241hD1V6fYjLjC2mH70p718BTG03wwGRTVjF7tkyPqee+CLSN+
	d4XNITezNv2uhS6IQVvusAJj+le/k78+LdvubZnMpo5R2YUG0rnl99jZdv5qs1NtsU6eqQ7dTs0
	ZALSmtOQ5J++jI9dciSAdebQ2ld/5kObbrHcBH0ug==
X-Received: by 2002:a05:600c:1c1a:b0:493:f42e:1b3f with SMTP id
 5b1f17b1804b1-499879a41ebmr109626065e9.3.1786823662270;
        Sat, 15 Aug 2026 12:54:22 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899bff2csm133743775e9.7.2026.08.15.12.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:54:21 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/nouveau: teardown ordering fixes for events and work
Date: Sat, 15 Aug 2026 21:54:20 +0200
Message-ID: <178682366001.3748010.7798811159846779765@gmail.com>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: I4SSHDHMUSHFEOQYDRIT7NOQF5TY3GAE
X-Message-ID-Hash: I4SSHDHMUSHFEOQYDRIT7NOQF5TY3GAE
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I4SSHDHMUSHFEOQYDRIT7NOQF5TY3GAE/>
Archived-At: 
 <https://lore.freedesktop.org/178682366001.3748010.7798811159846779765@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

Three teardown fixes in nouveau, all the same shape: something that can
still run after the thing it points at has been torn down or freed.

Two of them are not my finding. The Sashiko review bot flagged them as
pre-existing issues in its review of my nv04 FIFO series,

  https://lore.kernel.org/nouveau/20260812231330.705425-1-mczernohous@gmail.com/

naming nouveau_fence_context_del() and nouveau_connector_destroy()
directly. It was right about both. 1/3 and 2/3 carry a Reported-by
accordingly. 3/3 is mine, found while following the irq_work of 2/3
into its handler, which is nouveau_dp_irq().

1/3 nouveau_fence_context_del() cancels the uevent work first and drops
    the event afterwards. In between, the event is still armed and
    nouveau_fence_wait_uevent_handler() queues the work unconditionally,
    so a non-stall interrupt in that window re-arms the work that was
    just cancelled. The callers free the context immediately after,
    which leaves nouveau_fence_uevent_work() walking freed memory.
    Destroy the event first, then drain.

2/3 nouveau_connector_destroy() drops the connector's two events but
    never drains nv_connector->irq_work, which is what the DP IRQ event
    schedules. The work can then run against a connector that is about
    to be, or has already been, freed.

3/3 nouveau_dp_irq() looks the encoder up and dereferences it in the
    declaration block, five lines above the NULL test that the same
    function already carries.

2/3 and 3/3 both point at the same commit. Commit 773eb04d14a1
("drm/nouveau/disp: expose conn event class") turned nouveau_dp_irq()
into a work callback, and that single change introduced both the
undrained work and the early dereference: the drm pointer used to be an
argument, and recovering it from the encoder put a dereference above the
existing test.

All three carry Fixes: and Cc: stable. 1/3 and 2/3 are use-after-free
windows, and each commit message names the trigger, the window, and the
freed object the work then touches. 3/3 is a NULL dereference sitting
above the function's own NULL test.

I also looked one level up, since it would have been the obvious next
instance. drm->hpd_work is drained in nouveau_display_fini(), right
after the hotplug events are blocked, under
"if (!runtime && !drm->headless)". That guard does not exempt the
teardown path: nouveau_drm.c:597 calls nouveau_display_fini(dev, false,
false) immediately before nouveau_display_destroy(), so runtime is
false there. The runtime exemption belongs to the suspend path
(nouveau_display.c:781), which frees nothing. So there is no fourth
patch here.

Testing

  Reference hardware: Apple Macmini3,1, MCP79 / GeForce 9400M (NVAC),
  Core 2 Duo, Wayland (labwc). Note for 1/3 that this chip takes the
  nv84_fence path, which is the one where the event exists at all.

  Build. The series is built against the stated base commit, as a full
  kernel build rather than a module-only one, so modpost actually
  resolved the module's symbols instead of being skipped for want of
  Module.symvers: zero compiler warnings, zero compiler errors,
  nouveau.ko produced. checkpatch.pl --strict is clean on all three
  patches and on this cover.

  What the testing does not show, stated plainly: I have not managed to
  hit any of these three windows deliberately on this hardware. They are
  ordering bugs reasoned out from the source rather than from a
  reproduction, and I would rather say that than dress up a crash I do
  not have. Each patch names the file and the function it argues from so
  the reasoning can be checked directly.

AI assistance

  Lyude asked on an earlier thread whether these patches were written by
  a human and pointed at Documentation/process/coding-assistants.rst.
  The answer, repeated here for the archive: this work is AI assisted. I
  use Claude (claude-opus-5) as a coding and analysis assistant. Every
  patch carries an Assisted-by trailer accordingly, and no Signed-off-by
  is added by the tool.

  Nature of the assistance, so you can calibrate your review: the
  assistant did most of the code archaeology and drafting. I described
  symptoms, asked for the mechanism to be traced in the source rather
  than guessed, and asked for each claim to be backed by a file and a
  line. The assistant also reviewed its own drafts adversarially, which
  is how two errors in 1/3 were caught before this posting: an earlier
  draft claimed nouveau_fence_context_kill() does not touch the event,
  which the source contradicts, and it illustrated the freeing caller
  with nv04_fence_context_del(), which is precisely the case that cannot
  reach the bug, since nouveau_fence_context_new() returns before
  nvif_event_ctor() unless nv84_fence_create() set priv->uevent. Both
  are corrected. I reviewed the result, I understand the code, and I
  take responsibility for it.

Marek Czernohous (3):
  drm/nouveau: destroy the fence event before cancelling its work
  drm/nouveau: cancel the DP IRQ work before freeing the connector
  drm/nouveau: don't dereference outp before checking it in
    nouveau_dp_irq

 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_fence.c     | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)


base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.54.0

