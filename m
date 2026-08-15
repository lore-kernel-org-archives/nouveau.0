Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE353C5DF67
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 20:42:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 623F710E615;
	Sat, 15 Aug 2026 20:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rdUI/dIA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F5F847862;
	Sat, 15 Aug 2026 20:26:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786825593;
 b=unyQB3zRCVN7iLbViDmMI9v4OmMZ748P5b0RR6Auq+skKrWj2boiiRwg8U5xHqJJJZJLc
 8L/DNiIOeepHCVpyapCZpTKhJO3U2AJgt8vIyMhDnMhaGLDFbLrTDsj0L8fof6YZwLOKwXa
 396uk0FGCQL4yi0UrJFzQCHTAsn53zWhLbHlJ/P2kG73kTBGNAK78KpnLYfzdrgaK1z2hPd
 qx+FqzcCnB0urZgNfTAnFNnGem1K+Hdc9nhx8uZjBHopaUaNycU4yQlgkgcMcaTGXcg0Bdq
 7H2erzKx2Nx4Py6GyvY4FRRcJ9LX1r/dSa7d6KHkoxtNILr+LBSmH67mY3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786825593; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=g3g0AYahBP3aN4rc9/ufJfxyt9G+mfOpDwe9Ft7yd84=;
 b=GYOQwBo0H73oE/tRNDxlhsWbFc+VpAxFAWLdrpdJwsR21LSRRzlFWl6Qf3ezUFfmJeSke
 73IVucCpLXkOCDmupjUkTUxcVp8DKwNrH9UcHkQbZ0Eop3iONoECc87PlyN0h4SiDPJN5NF
 GWlOVg/ougAS0MhpDrTiqmg2C+lGaBjamYTZVda+g4kQejcEgP/H1AlH5OopnnHABhRqAYo
 5hHULVW5PFW/sv6Oeo7KN58nBYiyNGrzCaYlz9r1FCkcaQ1OJUYq1yQwsaL7YLuBL2Kgawy
 E+kKekPUponm1qhd+OP7QJoL2Q7fZQggUrHH0kCT7bcr8UuyvGbSMV3WxMbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 14864477BA
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 20:26:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A591A10E60A
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 20:42:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f611b3af9so235069f8f.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786826573; x=1787431373;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g3g0AYahBP3aN4rc9/ufJfxyt9G+mfOpDwe9Ft7yd84=;
        b=rdUI/dIAnv2Xvq6rGHzm6m3NBm0wd2xwWB1whqXTJh7P9n95WYwkFNz0h4C97HbGAu
         OdixsszI65tYlTgsKELPesdg+fYEYmRFR6zTtK0eG8ZmWwGBAjegwxmV6OymLIA/b3BS
         awEGaK9eC7c6HmZGQKxcdZpS+CUXTx3c3oDE+MA9Z9KSHCNfd72tGStc8hkFu6vImg1J
         /PcPuwXrOiOMjjTEEFdbNHYtSynpiISYV53L0awVTMdeYfFXz9NxXvX1elynS83MJ163
         SrmuQ4rl9dkwOGHVmDIu+NQueDYWyA6W5rkm3wSJXqr6qeHt1o5pvWFQZQVih2bD6LU/
         g/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786826573; x=1787431373;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3g0AYahBP3aN4rc9/ufJfxyt9G+mfOpDwe9Ft7yd84=;
        b=hk1pUenCD5pLCJ3K3Ep3tEAYLvs6kBD5kzMzSmYObe3X4Hs09+shS0YiHMZukaLFil
         E26UIxJUyVrlTEVUh6ksB/DPtR5E1da97SazVChr26qoAMZdTSeCRDR6zH8vVECg2jHd
         8TaLDi4kWOXinexU8Zrl2bBj8wKwPn4hBr5U+71fhh11TGVsln+ragLBPeJIdIRMXFHx
         Ns7UP7i2e+yvbof9ZTwR3J4iWPjitgeaiOTIyqKklZKQwSkormltLeu5GVOS09pRCXyx
         V9AOKT7fvr0nAT2mFE7aHDNucjmQKBv8OnDtwRWhPt5W3L6YIB67mlNpTCJcTDtXFZ6f
         lBqA==
X-Gm-Message-State: AOJu0YzaMLrnbWJMB2dvnqP+Eao/8VtlEQn7qE5J8e6/ugH5u0sP9JPB
	FeM1zOMr77U+E1gC6YwX5GllRjdHSjBzKzAv5M9bqSHwtu7apudm4XEChJZQuVSj
X-Gm-Gg: AR+sD1062crwL/viw9cxUrfvflYQJ37OXRRtIkx80hZPVMOZjOYJZdz7Cu9nTfqXpV+
	4gwv097koD4fWp1n2ZGU3v2l2U1LhtdCEBBPw1o4v3/hjMC11XhPojV2+07RYoIcPaLOdc0tFUQ
	9+Sfrk+1m6klIKhGf02/QQvi+8WFmWD+uDJ4v4xxW4ai+JWQ1//PWXLxCkHqQPgRCXMYRA43zbh
	YGvMCnvIqZk58+DaNV/95km+TChyJIupXV8/E+xEDsGVuGslE1O8lH0FXQ0tlKSrzjAlHrMDu5q
	ZWBVtmhzn3k117o8eVfFm25aWEzWqHjdeFJTrJRWm8rFqXS0jJYAz7qOKnSIJAhaNI8Q65uIdlh
	+ilsWETGUqaC+dSN220d+SNIvy3cCmZajF/aUD987+DEdCTlgXZGtCLLC0zxsqdznVT7GUPLtYH
	zPafM5COdWa0Hi6hvc0i7edrwwQzCW7HQ1NIiMeZAPKVIeAenNLBaTFcqkEG4PsBF4A9d/XdpfQ
	0Njc+IN3uy3Q2J2RrA5OjHrnohcJE/mUkCexpjhCg==
X-Received: by 2002:a05:600c:354f:b0:495:650b:4c61 with SMTP id
 5b1f17b1804b1-499879690acmr105425405e9.3.1786826572997;
        Sat, 15 Aug 2026 13:42:52 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899afa39sm164118155e9.2.2026.08.15.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 13:42:52 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing
 the connector
Date: Sat, 15 Aug 2026 22:42:51 +0200
Message-ID: <178682657122.3795552.6920623796751043528@gmail.com>
In-Reply-To: <20260815201130.7BDDF1F000E9@smtp.kernel.org>
References: <178682366001.3748010.7798811159846779765@gmail.com>
 <178682366002.3748010.4096452389040554615@gmail.com>
 <20260815201130.7BDDF1F000E9@smtp.kernel.org>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: POQPK45ZZFSTAVOKFTQ2RYELMD4WNVX3
X-Message-ID-Hash: POQPK45ZZFSTAVOKFTQ2RYELMD4WNVX3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/POQPK45ZZFSTAVOKFTQ2RYELMD4WNVX3/>
Archived-At: 
 <https://lore.freedesktop.org/178682657122.3795552.6920623796751043528@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Three findings, three different answers, so let me take them in turn.

The NULL dereference in nouveau_dp_irq() is 3/3 of this series.  Same
thread, sent alongside this patch.  Nothing further needed there, and
the two are related on purpose: 2/3 drains the work, 3/3 fixes the
handler that work runs.

The LVDS error path in nouveau_connector_create() is real as far as I
can see, and independent of anything here.  drm_connector_init() has
already put the connector on dev->mode_config.connector_list when the
nouveau_bios_parse_lvds_table() failure path kfree()s it without
drm_connector_cleanup().  I am not touching it in this series; it wants
its own patch and I have no way to reach that path on my hardware.

The hpd_work point is the interesting one, and I owe a correction on it.

2/3 does not create that path.  Without this patch the same already
queued irq_work still runs to completion and still ends in
nouveau_connector_hpd(), which schedules drm->hpd_work under
drm->hpd_lock; the only thing this patch adds is that the destroy now
waits for it.  If anything that narrows the exposure, because without
the wait the work can run later still, potentially after the connector
is gone.  That is the bug 2/3 is about.

But the wider question the bot is asking is fair, and my cover letter
answered it too confidently.  It says "there is no fourth patch here"
on the strength of drm->hpd_work being drained in
nouveau_display_fini().  Having looked again after the bot's mail: that
drain runs at nouveau_display.c:600 under "if (!runtime &&
!drm->headless)", and disp->fini() drains it a second time under the
same condition (dispnv50/disp.c:2686, dispnv04/disp.c:72, which I had
not spotted when I wrote the cover).  Both of those are before
drm_mode_config_cleanup() reaches nouveau_connector_destroy().  So a
late irq_work really can re-arm hpd_work after every drain, and nothing
drains it again.  Whether that is reachable in practice I do not know:
nvif_event_block() on conn->irq has already run by then, so it needs
work that was queued before the block and has not run yet.

I cannot rule it out, so I should not have written that sentence as a
finding.  It should have said that I looked and did not find a fourth
patch, not that there is none.  If the maintainers want, the shape of a
fix is probably a drain of hpd_work after the connectors are gone, or
making nouveau_connector_hpd() a no-op once teardown has started, but
that is a separate change from this series and I would rather someone
who knows the hotplug path weighs in before I write it.

For the avoidance of doubt: 2/3 and 3/3 still stand as posted.  1/3 is
withdrawn, for an unrelated reason, in the sibling thread.
