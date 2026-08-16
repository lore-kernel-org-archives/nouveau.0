Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EBC5DF6D
	for <nouveau@archiver.kernel.org>; Sun, 16 Aug 2026 16:49:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7E710E349;
	Sun, 16 Aug 2026 16:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MHiSBdTZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D4E9F4787D;
	Sun, 16 Aug 2026 16:32:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786897964;
 b=XuqjM+5MQGC4rK7R1pXD9d8BCpdgr2Sv4T1MbO97Dfhp3j0FxKBpvE2L7EqZIZVI7CkeL
 9EqrAheqU/BQo19getHDdgZb79lF12KJ+eE4qu3BOUfwPiydmHlz+T/xILF5tMNqVyQAZjY
 3oL8bwIhOjf2SgHdKulSB3Ck/ING5Ulfg+rinbkynqLQjXBGTj9c1T+2rI5K+llrT446pAe
 uDZ/LL4neBvkeWrzQydvOe82SBoMZ/wrPxzBNUuzDji2NMh2U5z42JczrHyPWX2/BcuYDMa
 h1rZbkvQXb1i+E1z0Bvx2qksmjBD1BYq4AJqQGhsCuK7D/pm8PBoJsDZjinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786897964; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=h1LuoOEYRW0czN5Bz/p4SIeY+1XK0NUMWZ1zoBbq6Xw=;
 b=Dd2Df8YF/fcxfblq2E/Dauy+JA5uNK1esKRcp8TaSA8gexui5yIYDePwklhVxAku8iXnn
 d+u1y83Utjk0kRFxwPXWqXXeUE5ONY+CNxN28Rl8zY0V76AhmqGv4vIS7Es9b3p+ifB4PwE
 97m+c7iyaEi0PzOH2T0xjhr8GlLTDIlFD1g0Js8YBm2KrSckQM/YcxlnjvKF/mV7CKwLmHa
 hDTDSfbckOYWxIfK/tuTvyh+Gd+v70loUMYte1Y4isVCGkibiw90fh3uV6NoEyM5FYc/k/v
 4/0RGWaLIDiKND8bqvU6oeT4KqLjpPd8ifJTBRKSSRckWZJGdyCkyeNR7y9g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 72EE146D2B
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 16:32:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA7B910E332
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 16:49:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954b3c5cbeso3000875e9.1
        for <nouveau@lists.freedesktop.org>;
 Sun, 16 Aug 2026 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786898947; x=1787503747;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1LuoOEYRW0czN5Bz/p4SIeY+1XK0NUMWZ1zoBbq6Xw=;
        b=MHiSBdTZjCfiaClTlY/K0KwyLscHTsYpNbc6DF1fLSpZizkv0BgDYR94mIfWrXtCdZ
         BOoryy90uk5lw+YLmRhJsjFfd5wHOGGcWjgIPP9gl8oIFbMmJT6cDAOJtPuM/jwyESHf
         yTQb26FEYvRQCBlRBJdufC+DY+HZMo6/qXJute5lXs+0p7yrnZZr65DFG4X267JU5uNt
         4m05V8V+jLJL92zohHyB/s2H7UGOABRf4/HSVBxkzGmc38ql04npWNpX5w6PGQ6s1Jw/
         rgdEAyPAk3QuzxhkBs+ogXIQNATksr8ZOsTMQ8hszGPBqPV1dNZUwOWP5VFdzuGYgg/8
         lZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786898947; x=1787503747;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1LuoOEYRW0czN5Bz/p4SIeY+1XK0NUMWZ1zoBbq6Xw=;
        b=JnWusxQXQjcA2CIInjFi7D+Sovx1eL1+yXL23jRRTt7WS78t/z1hYqSWT4c0F6KPIe
         nk+kgWRplxv+sT7Jt47dtHasOsdVqgSo1nHo0XGaZ0TEnHRXNa5TeVafxwf7SZrhxPhL
         GuNVHh0GMMVKK2VoDhs+hMf3d1bEOPPEolakXHe6AB6BrYiBlzOG2jV8hnkWEwb0tX1j
         xSTlUedeo/65TmsFfHLK77eqKNjZ+6uaaCa++kV6nOl6BMR8ooNtXXtn8H9OxDqBjiEN
         AbgKLaY64znEJa2vXhjWsSE4VDG6lqNuGraf8bhs+7qYUSmFirPIeJGNOOFm9LK7ibGI
         5EoA==
X-Gm-Message-State: AOJu0Yw5izdg/jDqBVI2rozkUKvK6MY4S8MIC9GfLCWufivOgWxJ2amp
	NN3MttvkkR4BB2IT3ey6p2PTneNiGQcYTcLi1MkSSKeMzgY12yt2TC1A4s3JEXOS
X-Gm-Gg: AR+sD10lPpIZHBgLeEWv/4u/9JoNmeeEPKeeb0o4MiNpYtwXtyHQqKItW4WuhGmx8ib
	nZYD0nZII+G6uYzwYvRzQAP3gE/UNR2nDlISM6OSKChrvjSiN3w4QwyWs4QaRKiIFpGemjrTMZ8
	B/o0QOz4iKy3WDjd9azVRdW6J86qWyyTDXUJ4fRJzVy8dpCy2DLX2u47pX2Kx8XudaAdJPGVXf+
	wWXPzRMgDndDalimXQuBnNNDlq1G5N19a9RMWo+4IDUjUg87jrTlho9cnL17SRF56RQE4gyo4bt
	gifvIUbqzL1bVZ8Z4mMBLh/lqK3MxgZbEOS8y43QjDZsgxtP5w+1ppmJbCcM2LgZ3TU6nMTC6fP
	gT5vhgwjjk6g9XzGwnlyaweJBGxoV7+qgtkTLQAYJl0NgwaHknkjY48Xlxu3uN/lW5wABUKFeMw
	E26WqHiTsgQegJu2xeWW1Q1aTeAn2J3lPLHZWfwsRslGuyHGDKMCa45JkIuOWRKQJx/RN0u5a/I
	ltUeYSYkuVETvS1vKn0uYc/7ZWQw+7+aWcxUfWDQ1aZfuo9piQO
X-Received: by 2002:a05:6000:26cf:b0:46d:ff8a:c8e6 with SMTP id
 ffacd0b85a97d-481606f6d94mr14601663f8f.1.1786898946689;
        Sun, 16 Aug 2026 09:49:06 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21df13sm20760381f8f.15.2026.08.16.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:49:06 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] drm/nouveau/kms: guard NULL crtc in
 nv50_sor_atomic_disable()
Date: Sun, 16 Aug 2026 18:49:04 +0200
Message-ID: <178689894484.725775.7881685692020502024@gmail.com>
In-Reply-To: <20260816131755.1B99B1F000E9@smtp.kernel.org>
References: <178688574400.522643.6695278742335367229@gmail.com>
 <178688574402.522643.5471719764843371376@gmail.com>
 <20260816131755.1B99B1F000E9@smtp.kernel.org>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: 7MPDIC6YFFT34PK6ICLWW7EFOIRCX7Q3
X-Message-ID-Hash: 7MPDIC6YFFT34PK6ICLWW7EFOIRCX7Q3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7MPDIC6YFFT34PK6ICLWW7EFOIRCX7Q3/>
Archived-At: 
 <https://lore.freedesktop.org/178689894484.725775.7881685692020502024@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> This isn't a bug introduced by this patch, but while fixing the
> disable-without-enable issue here, does a similar vulnerability
> exist in nv50_msto_atomic_disable() in the same file?
[...]
> If this is called during session teardown without a matching
> .atomic_enable, couldn't msto->mstc be NULL, leading to a NULL
> pointer dereference when accessing mstc->mstm?

The shape is the same.  nv50_msto_atomic_disable() takes msto->mstc
without checking it (dispnv50/disp.c:1079-1080):

	struct nv50_mstc *mstc = msto->mstc;
	struct nv50_mstm *mstm = mstc->mstm;

and the pointer can hold NULL: it is assigned only in
nv50_msto_atomic_enable() (:1070) and set back to NULL in
nv50_msto_cleanup() (:918).

What I could not establish is that the callback is reached in that
state.  nv50 does not drive the encoder disable from the atomic
helpers, it drives it from its own outp list in
nv50_disp_atomic_commit_tail() (:2229 to :2240), and outp->clr.ctrl
is only set in nv50_disp_outp_atomic_check_clr() (:2530), behind two
conditions: the connector sat on a CRTC in the old state (:2517), and
that CRTC was active in the old state (:2522).  A CRTC that was
active came up through a commit that ran .atomic_enable (:2272 to
:2274), which is where msto->mstc is assigned.  I did not find a way
around that, so I cannot claim that a disable with no matching enable
gets there.

The one path I could not rule out is the early return in
nv50_msto_atomic_enable():

	if (WARN_ON(!mstc))
		return;

at :1049.  It returns before the assignment at :1070, while
commit_tail still sets outp->enabled = true at :2274.  That sits
behind a WARN_ON, so it is a second-order path rather than a fresh
bug.

For completeness, the other two places that read msto->mstc without
a check, nv50_msto_cleanup() (:902 and :906 to :908) and
nv50_msto_prepare() (:934), are covered by their callers, which test
"mstc && mstc->mstm == mstm" at :1318, :1347 and :1359.
nv50_real_outp() checks for itself at :889.  The disable callback is
the only reader left without a check.

I am not adding a patch for it to this series, for the same reason
2/2 is scoped the way it is: 2/2 fixes something I hit on real
hardware and can reproduce.  This is MST, I have no MST setup here,
and a guard written against a path I cannot exercise is a guess.  If
the maintainers want it anyway I will send it as a separate patch,
but I would rather hear from someone who can run MST whether that
callback is reachable with msto->mstc NULL at all.

v4 stands as posted, no respin planned for this.  The question is
orthogonal to both patches.
