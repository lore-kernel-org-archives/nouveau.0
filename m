Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304DFC5CFDB
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 23:13:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 057BC10F151;
	Wed, 12 Aug 2026 23:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="q8jyJrYg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 943B547710;
	Wed, 12 Aug 2026 22:57:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786575439;
 b=t0gLuS1068egfpsC3wsCx7fNyvbju1Kl1A1QU1X9iYhCFXmOTe5uzty6PvPdJqyCmW7Y3
 ztxEaNtK+BLpNkDyIMds2QY+Qcw3B6m0M4SHbcjh95BAb909lCUmqITM8IegJwjWyShBK9i
 pv2nHZD9hv9PcTcORHwq6FqcFqo+BJOFelhPQdqEJHR/xDBWPna+Xv6siFhLWtfZjJE+5la
 9SXFCTFYxflcTIHyEPm+Mj+AQPr9vWpfve5FODTXLQIsj4tspgDwSkrOfJ15cXhE7G/5001
 jADf6yoS58EQZxAezK31cP5cw6ap/lmNr8XThUe19M14QtXOZ4qpJDfK1cUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786575439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=knmiZOkayyU4iEwEuKGRREO2aACklWxmCXd6sObM8f4=;
 b=wHH8+dkcc8JREJvz9zM9JAKRiTp5FSpriEJJ5AhIAzlx/3zsqGyNPsfzRR7zv1k6OynSg
 6ghruQIy99DBXyXzj76bK47SZHevU7eZShxtK5+Gk8RNQYpk8Gp5ZMIysSVXHZTOKKVmynq
 fU+DjD3oEtLzDOfdDMGu5xentJ+e9jvRtvnMDnz3tlRS6iBftRD4vKL72cPJHM5WI++GypI
 9F21qd2z0tNAcfD5wgRWWeYRUGgbueRqcj8vCq95ZuRrv4iCeo1MhkwsZvA19TaimMnTsPh
 zNqEBxr93X/jc588r3JF9/SAYtofPwoMFbjAMst5UsRL7FGI16tlZc6YWU8Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 554ED47704
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 22:57:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7631E10E0FA
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 23:13:34 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954c08a7c8so1337575e9.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 16:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576413; x=1787181213;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=knmiZOkayyU4iEwEuKGRREO2aACklWxmCXd6sObM8f4=;
        b=q8jyJrYgqWKfNEydwETbj/j3n56OjmaJaDG3tsnHk0Jt9SLEKDv1FSAcnQW/lgko6O
         OdT1LkW+5KqEnNDSYpAY4ROwcKx9mdYBPff4gIyfcq3XVpii8lfZ6yERcJzll/Za66vw
         ZVGYT0WUVZNZf3Na/h36RzjXjAho1cpifVTCx/5Fpw5k+IBLEyDbE58aGgzVZeAWxFGy
         bOq8vBlXbpCGUjf7raDM2QBiLG1BQ7V7VB+Ax08C0o89XOM2+/+ITjcVQxp17cE5aUwQ
         S4PzwD6eVh0+nB/WOUtZRMvRVN0jnfQJmT321SFZn/Mj5QMJ+G5Rz+jPhjwSY19P0fXn
         t63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576413; x=1787181213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knmiZOkayyU4iEwEuKGRREO2aACklWxmCXd6sObM8f4=;
        b=CzUuBquFHDDmig1xAc7G/zlSxtEuwwWPezvTDVuTlv3Tc7/tUF6O/deoX0trzZhmuI
         KYiu15y5VaSpxdBWfgrzVthoN8uY6rZgNdhGuQrXiTxvqu8PASiNYiRLUsnHLW/ni0ME
         A8dUZvh8ysXe2hg3KOWwiTU6lNj+8Ww58lmN9lmmIkUAV8hOj7yh9B8yZTDEkZIFjqGH
         i0XBKy+4f1sQwF5j8fKFq2eV4pcDHhzKgbnkZVl2+p/Q7MF/dSthARWo0E2g9/ACLSeD
         gGJp/5ha7p1U0+Ww1xlO707aGU/Nuja0GqE4opy05kKTkjD8tJ53zDS9kxKpjSUBM9bp
         aMCw==
X-Gm-Message-State: AOJu0Yx1UwZ4mb18B/D2OXh638GzP3rTXhRKF8UubYbC7AVBuw71lxo/
	tI+o9n9qg8nLnUfUlxagDCZuUVkkJPU3Rs76yiFwDIWJ1+nLCrARfxiti/BU574J
X-Gm-Gg: AR+sD108O/JGXw+NfmQCmi3m4z+rJ4ni253KTfDhxaVuYtMgaM3lH3h+4koy9h/poB8
	PRqldLMFExtTM0FWwSdor0VD2VCTIhKdp4LfQIVK2pIHCS8wD8VJVch2VsyDk2T6QE/dGkfaGef
	ThU8HcSBlK2CBSGohzqd6ubfjAtLYFIOI5exjhFaOHGVcQdeEx0l3YJPIOnOfeEoSXrMUTV4eHp
	5JWLGuMEzZ74CsZJJmTo8xVMQ8qCFgEhRhHHJdMv+MPfLWmucptjmCoYi4socve6YaI93hWhCNM
	zIJGl3pjCnxPu8S/Vke/VytFbvFMQV11vnGkzOruMd0gA+eHJJMxJiVkM9XDiDAFFUqXjzeZXsM
	CVtT3I+nZfODbz16Is3BYvSQPrhxWkU83TDUTcNX4ZwsldVeKPIyUuZDptKLFE/1NzFiam7ndDO
	z2njOw7780WJYUNlNJjXQiXWOogih3M8MEBGEw8uXlWq/sxKruD8d6/laOHtlfq4g6ISxLZS2Mn
	48QU2X0f/pQRr+i9YcTCK7Ys5TAiBTom5G732+DWga4tBLyyaSR3Zy6
X-Received: by 2002:a05:600c:19d4:b0:490:ec79:3046 with SMTP id
 5b1f17b1804b1-499821647efmr6305275e9.0.1786576412642;
        Wed, 12 Aug 2026 16:13:32 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b631c1sm44532245e9.14.2026.08.12.16.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:13:32 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/nouveau: channel-kill event ordering fixes,
 and lower the gate to NV50
Date: Thu, 13 Aug 2026 01:13:26 +0200
Message-ID: <20260812231330.705425-1-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GFFDFPSOGMTGY6K2D2O6CJ3XQMEL4HYC
X-Message-ID-Hash: GFFDFPSOGMTGY6K2D2O6CJ3XQMEL4HYC
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GFFDFPSOGMTGY6K2D2O6CJ3XQMEL4HYC/>
Archived-At: 
 <https://lore.freedesktop.org/20260812231330.705425-1-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

This is v3 of the nv04 FIFO series, cut down to the four patches that are
ready. v2 is here:

  https://lore.kernel.org/nouveau/20260806085228.1848994-1-mczernohous@gmail.com/

The Sashiko review bot flagged three issues on that posting. It was right on
all three. Two are fixed by the new patches at the head of this series; the
third was in the Tesla recovery patch, which I have dropped from this posting.
More on that below, because the reason is not the bot's finding.

1/4 The channel-kill subscription outlives the fence context in
    nouveau_channel_del(): the context is freed first and the event is only
    dropped later, among the nvif object teardown. A kill delivered in that
    window walks a freed fence context.

2/4 The subscription is armed before the fence context exists.
    nouveau_channel_init() subscribes right after mapping userd and creates
    the context at the end of the same function, and the backends publish
    chan->fence from kzalloc() before nouveau_fence_context_new() initialises
    its lock and pending list. The NULL check in nouveau_channel_kill() does
    not cover that: the pointer is non-NULL and unusable.

Both are pre-existing. Both are unreachable below Fermi today, and on Fermi
and newer the windows are narrow, but they are real, so 1/4 and 2/4 carry
Fixes: and Cc: stable and stand on their own. I should have carried them from
the start. The v2 cover letter even described the teardown ordering and
dismissed it as "most of that window is harmless". That judgement was wrong,
and I appreciate the catch.

3/4 and 4/4 are unchanged in code apart from the rebase and one joined format
string. Both commit messages have been corrected: 3/4 no longer implies a chip
gate it does not have and no longer claims a before and after I cannot show,
and 4/4 no longer says the fences time out, because they cannot.

3/4 downgrades one specific CACHE_ERROR to debug level. Mesa's NV50 bind
probe writes a known method and data pattern that the hardware rejects,
repeatedly over the life of a session, and nouveau has been reporting it at
error level ever since. It changes no behaviour beyond the log level and is
unrelated to the two fixes above; it has simply travelled with them since
v2.

4/4 lowers the channel-kill subscription from FERMI_CHANNEL_GPFIFO to
NV50_CHANNEL_GPFIFO. On its own it changes no observable behaviour, because
nothing kills a channel on Tesla today: the only nvkm_chan_error() callers are
the Fermi and newer recovery paths. It is worth having anyway. Leaving the
ERRORED event delivered into an empty notifier list is a latent dma-fence
contract violation, and it is exactly the trap the recovery work would fall
into. Removing it before anything can fall in is the right order.

What is not in this posting, and why

  v2 carried a third patch, the recovery path for Tesla cache_error and
  dma_pusher faults, and the five-patch v3 I had prepared carried it as 5/5.
  It is not in this posting, and the bot's third finding is not the reason:
  that one was a real bug of mine and is fixed.

  I ran an adversarial review over the whole series before sending, and it
  found two defects in that patch that the bot had not flagged:

  - nv04_fifo_recover() has no chip-family guard, but nv04_fifo_intr is .intr
    for nv04, nv10, nv17, nv40, nv50, g84 and g98. On NV04 to NV40 the
    escalation would therefore fire while 4/4 deliberately installs no
    subscriber, producing exactly the dead-letter hang that 4/4 exists to
    prevent. The series would have contradicted its own reasoning, in the same
    diff.

  - The recovery path pulls the drm_device out of drvdata on every fault,
    while nouveau never clears drvdata and the only cancel_work_sync() for the
    wedge work runs in nvkm_fifo_dtor(), that is after nouveau_drm_device_del()
    has already kfree()d the nouveau_drm. A queued work reads freed memory.

  The first is a one-line guard. The second wants the wedge policy moved into
  the DRM layer rather than patched where it is, which also removes an nvkm to
  DRM layering violation I should not have introduced. That is a rework, not a
  fixup, so it goes into its own posting once it has been rebuilt and soaked.
  Sending it now would only waste reviewer time.

Testing

  Reference hardware: Apple Mac mini Late 2009, MCP79 / GeForce 9400M (NVAC),
  Core 2 Duo, Wayland (labwc).

  Build. Unlike v2, this series is built against the stated base commit: the
  nouveau module compiles and links with zero warnings and zero errors, with
  the new format strings and the lowered class gate in place. checkpatch.pl
  --strict is clean on all four patches.

  Soak. Code equivalent to 1/4, 3/4 and 4/4 has been running on that machine
  since 2026-07-25, and equivalent to 2/4 since 2026-08-06. The first spans
  the kernel bumps 7.1.5, 7.1.6, 7.1.7 and 7.1.8, the second only 7.1.7 and
  7.1.8. Since every channel now subscribes to the kill event, the interesting
  long-run question is channel churn, so the soak is ordinary daily driving
  with a browser and GL applications rather than a synthetic loop. No
  regression has shown up in that time.

  What the soak does not show, stated plainly: that tree carries local patches
  this series does not, including a cap on the plane-fence wait in the
  nonblocking commit tail. So the soak says these changes do not misbehave in
  daily use. It is not an independent demonstration of the failure modes
  described above.

  1/4 and 2/4 are ordering fixes for windows I have not managed to hit
  deliberately on this hardware; the reasoning is from the source, and the
  bot's reading of it agrees. I would rather say that plainly than claim a
  reproduction I do not have.

  3/4 filters a benign CACHE_ERROR that Mesa's NV50 bind probe triggers. The
  logs behind it are from a second, independent MCP79/MCP7A machine, not
  mine: 99 occurrences across three logs and two kernel versions, under Xorg
  and Wayland, with kwin and plasmashell named as the faulting clients. They
  were shared with me by the tester who reported the original NVAC issue. I
  have not named them and have added no Reported-by or Tested-by: we have
  not been in touch since then, so I have nobody's consent to point at. On
  my own machine the filter went in before the persistent logging did, so I
  cannot show a clean before and after from here.

AI assistance

  Lyude asked on the v1 thread whether these patches were written by a human
  and pointed at Documentation/process/coding-assistants.rst. The answer,
  repeated here for the archive: this work is AI assisted. I use Claude
  (claude-opus-4-7 for v1, claude-opus-5 since) as a coding and analysis
  assistant. Every patch carries an Assisted-by trailer accordingly, and no
  Signed-off-by is added by the tool.

  Nature of the assistance, so you can calibrate your review: the assistant did
  most of the code archaeology and drafting. I described symptoms, asked for
  the mechanism to be traced in the source rather than guessed, and asked for
  each claim to be backed by a file and line. The measurements quoted in
  earlier postings are from the machine, not model output. The assistant also
  reviewed its own earlier work adversarially, which is how the two defects in
  the dropped patch were found, and how several unsupported claims in the v2
  cover letter were caught before this posting. I reviewed the result, I
  understand the code, and I take responsibility for it.

Changes since v2

  - new 1/4: unsubscribe the channel-kill event before the fence context
  - new 2/4: subscribe to the channel-kill event after the fence context
  - both found by the Sashiko review bot on the v2 posting, confirmed against
    the source before acting on them, and now carrying Fixes: and Cc: stable
  - dropped the Tesla recovery patch, see above
  - 3/4 and 4/4 unchanged in code apart from the rebase and one joined format
    string, both commit messages corrected for accuracy
  - the series is now built against the base commit

Marek Czernohous (4):
  drm/nouveau: unsubscribe the channel-kill event before the fence
    context
  drm/nouveau: subscribe to the channel-kill event after the fence
    context
  drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from Mesa NV50 bind
    probe
  drm/nouveau: subscribe to channel-kill events on NV50 and newer

 drivers/gpu/drm/nouveau/nouveau_chan.c        | 64 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   | 26 ++++++--
 2 files changed, 61 insertions(+), 29 deletions(-)


base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.54.0

