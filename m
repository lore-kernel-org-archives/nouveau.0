Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B1C5DF67
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 20:25:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA02210E610;
	Sat, 15 Aug 2026 20:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jiTwSg9L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E80EE4785D;
	Sat, 15 Aug 2026 20:09:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786824549;
 b=GW1ELUkUa9ZscHNyS3yOlthWOfWeh3u4Fp99YStMsXOjZuGHiEKNQC2MDjYjmnPIs6z1W
 sSAUJ7x5+KItrhLLMJg7f8qhUHuI4PizqmA+391vH404/GCwXVcc5hw0LIywkz7TW2Ppg+3
 4zp9t01VdaCVAiqFnHY8KEgWiTJFBmov6lyN8nFTL52Sra5O3jM84NFx2nLBwYi4Tuomid9
 Lo9KGtrx0JTDEY0nu+TJDQulbyrqb6cahDAQCkmQ2jhYh3PO16h/oxCPn7rjhVt4zJY/Khs
 Ltw836+QZwJUibMvKPlRVVmWZteFHN6X4nh7j1roVgAC6MGHKybyfdewk9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786824549; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+ZlAyzPLsV68fOC9YLcWPEXPgYOdEPUukx8GNRQ7w8g=;
 b=WBfBXKgBSm0yqsRuKpfeN8C/3FYcrmds+COKOi9m5X7tM/AnszA49JsMKcx2Xmq85Avtr
 6vhen1X8EG7GoxeqNIY2PB5lqxhFiw50hGbS0gFyNPgHwSIO7NpJtwxlEYMSco+IC0gp/d/
 MsakPdVJ3z9gu27EjOsTsG7F1/Uxhfvecl+crMeorHZunALtt+SnGDdBMQ2rkp3Dqbu1Mea
 5hHN2k+aZQWu4Vi2eTDiCplegcP93eNkTbBxyWvGtrSaSva8OxHatvL6mgtiqOQLO0Hu/VU
 DmSdReBnfvXtXUNi8pm7XJuo3tgkiOxu42QoHt+COIUkVSZQoZLfj2A5eCCA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3280C47841
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B710E5EE
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 20:25:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4955c545a94so2611515e9.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786825530; x=1787430330;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZlAyzPLsV68fOC9YLcWPEXPgYOdEPUukx8GNRQ7w8g=;
        b=jiTwSg9LNdtzNtmaFKSyaAZkxPUqs24apWBa8SgUi2/PzQWXJiJJnNnr3Y0zEPNoe9
         4ubqU2c6bJPFIk3zv79N0FW+cV2RY5gtt8EKGe2hEDoP/E6GtPH25Xg7Hbugk8OjoZsH
         F87gcbXfnmGDbldb40A7buhHwhQvosz12m32AisQKjtIj3SNXPxTUowaAGxddIGH9SE1
         kkzmWYct3maGiYP009qLikSOH57WSk/5JLBm1tFBoi46bbUKHZguOs9bMZ3xJqkAAgSr
         RyytnmEtm3QL4J2OssErgtAZZWVj900lkfPKMUgYw8tAOYKPt+P82tOcX6szzq7FupGb
         DtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786825530; x=1787430330;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZlAyzPLsV68fOC9YLcWPEXPgYOdEPUukx8GNRQ7w8g=;
        b=QOuAmnOI42killAWHDvLKrAD9i9iuPSexomX9XrfhQv2PfDt+ldyAbJ493f2leZdS0
         KOJLqnt0XcN4w96S4AO/S15wyPvQHDQxKUdIwqKPbsIhC1/rcz77nr1VIKAtzQpmEQyC
         4Dev75N+U+yLvtFngHxCqS9jybE6+jwiwukWt22+2OZ2oJpLrFf2DRLrZpPhRnl/hAjV
         vrZ+fhLU48ujRwWZt/QhjJHDKkKC7WWT3G88bUTOJ4laSUFvWlP5q7DOnh9FLsCZ4Qf9
         Qjl088qOj3SE4w/aj8y8WS18p1dLHTMeIJVnG7PssXz+l3Loew7bD4vFvqwutolFIrXJ
         XBMQ==
X-Gm-Message-State: AOJu0YxgCAPe0spjITKFUvj/gZsrEtpGpAvHVhEFTWGFo/LE3cvRMk0V
	1I2iI2J1t3cKoGFL4J3EMVeJhOqizuCaJpVMNHCIs4P4lODF1SqWa5yvMuxg+nd0
X-Gm-Gg: AR+sD13D5GtUoyhPgNCkXG+s6J+nzO3oMZ6P/++rFM4eZD5HhOOgrO4SCLJM/Ld7XFz
	PUYgcZhvxfjZCVhnpINr4dLKowyVWMfjQSPosTq4EHeinx+vmqSmIsU29rt+iPuLpW2djbWoYkh
	21RKplBLreEJl2JViSbRfGamUU0mO1N0VOsLS5zStzWowyxSbW5oJIkhrnduIRe3UdUxFsAs5WZ
	KBoXAT70y5oD8jPikA8eAIaGd7bCw9Czj+BiaKgCX2Hz4TizmWBQosLUtqlD855ZLRyiAkSYLeS
	ZP62kSGG0ZcL25KHPZvl926J9JZTuuzkqno+0LokRhKHwgfUFdrPfSpVg9RMu6+5ky3qmhE9oGl
	tgbAZFEjJ+iaWbbpd3cyQ88KMhRkjWJIp8gfKdH7kBQlksyxtvZ2tGh9w4s9wAOmuf1u7mkE9RR
	oIZ9BrKv/x+wtHtMDpHu4nS0N4r1j2hHsUUl63LRgmvaai/2ZVlr+hQjCDpNsJwdsHlC2jtD84b
	eGcSzOxPrYrFw9y45PoHpDGM2VMfYWnUKQ05T08TJyVDvYXqqqM
X-Received: by 2002:a05:6000:60b:b0:47f:946b:d3fc with SMTP id
 ffacd0b85a97d-481607a9661mr9883130f8f.2.1786825529846;
        Sat, 15 Aug 2026 13:25:29 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1fc2sm19576914f8f.20.2026.08.15.13.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 13:25:29 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/nouveau: destroy the fence event before
 cancelling its work
Date: Sat, 15 Aug 2026 22:25:28 +0200
Message-ID: <178682552848.3774290.16460050233438707000@gmail.com>
In-Reply-To: <20260815200914.8A1131F000E9@smtp.kernel.org>
References: <178682366001.3748010.7798811159846779765@gmail.com>
 <178682366002.3748010.12779628082366287968@gmail.com>
 <20260815200914.8A1131F000E9@smtp.kernel.org>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: 5UFU72A6Q6VLBM25KFXXNUIM6DAAIU3V
X-Message-ID-Hash: 5UFU72A6Q6VLBM25KFXXNUIM6DAAIU3V
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: sashiko-bot@kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5UFU72A6Q6VLBM25KFXXNUIM6DAAIU3V/>
Archived-At: 
 <https://lore.freedesktop.org/178682552848.3774290.16460050233438707000@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The bot is right, and this is worse than a wording problem: 1/3 does
introduce the race, it does not merely fail to rule it out.  Please
do not apply 1/3.  2/3 and 3/3 are independent of it and unaffected.

What I missed is why the old order was safe in the first place.  It was
not an accident of ordering, it was load-bearing:

  nouveau_fence_context_kill() signals every fence on fctx->pending,
  and dma_fence_add_callback() returns -ENOENT for an already signalled
  fence before it ever reaches __dma_fence_enable_signaling()
  (drivers/dma-buf/dma-fence.c:707-710).  So once the kill has run,
  nouveau_fence_enable_signaling() is no longer reachable for those
  fences, and nvif_event_dtor() afterwards has nobody left to race
  with.

Moving the dtor to the front puts it exactly where those fences are
still live, so nvif_event_allow() can be in flight on another CPU with
nvif_event_constructed() already evaluated to true.  There is nothing to
serialise the two: nouveau_fence_context_del() takes no lock at all,
enable_signaling() runs under fence->lock, which for nouveau is
fctx->lock (nouveau_fence.c:218-219), and the dtor cannot take that,
since the nvif ioctl may sleep and fctx->lock is taken with interrupts
off.  The window is then held open for the whole of cancel_work_sync(),
which can block arbitrarily long.

So my patch traded a narrow re-arm window for a wider NULL-deref window.
That is a bad trade and my commit message argued for it with a "guard"
that is a plain unsynchronised read of object->client.

The re-arm problem the patch was aimed at is real, but the fix has to
keep the kill in front of the dtor.  The obvious shape is to move the
drain to the back instead of the dtor to the front:

	nouveau_fence_context_kill(fctx, 0);
	nvif_event_dtor(&fctx->event);
	cancel_work_sync(&fctx->uevent_work);

The kill closes enable_signaling(), the dtor then stops the handler, and
the drain last picks up anything the handler queued on its way out.  I
want to convince myself properly that kill-before-drain is safe, rather
than send a second version tonight on the strength of it looking right,
so I will post a v2 once I have.

Thanks to the bot for catching this before anyone applied it.  For what
it is worth, my own review pass had found the same mechanism a few hours
earlier and I mis-filed it as a wording problem in the commit message
instead of asking whether the patch itself was wrong.  That one is on
me.
