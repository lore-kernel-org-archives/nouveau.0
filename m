Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80099E7C6FA
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 22:49:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8510E1B5;
	Sat, 31 Jan 2026 22:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="trQwS2JL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3689040F62;
	Sat, 31 Jan 2026 22:40:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769899242;
 b=oob2k7gfNIHtVYhCIO7gSHTxSfT78q2VamOjFfiZJVIwifpX0FTTSn/ggZ1TwxgXyTJya
 TLo8IOtTnzbubKdFzwe/Ijigl6qAcGKQATwxic06VShEOzd70rq3Ary2Ym7sjA1pNyVRs7u
 2NMfmm6q3ZUln3mLOJehxE7P+fuR9zRlqADg9bZN+nEI2jvTienYLLY0j7QFHn62Lmzqbqq
 kvErDxJJW0C1x8Y88q8NGhQwHRAxZMlIi8kZS1TLAK7pfVLZYxFCSf+NSyoQfi5CygWTS1g
 MB5zRe74AzebwKCiYF3szCZDT+BorXFw/dHakTY7vJIpDaznZ8Y1WK6P3ABg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769899242; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
 b=dF4+uHDu5/Y1nsK+nxXWILSO2ZKj5rTFnXYZhD3IvHy/RtwV9vmc53QpJpfbbNk9RF36q
 kT8PUp3/xpcuXb7fzO19nK9l5U3l3ITXkqBieMf0LRNuvDvTKw/M8C1U3J1Fw7BhOKe0liE
 hdk1ZC9aH2JwDY1+/QvETmjfq8n5lDSIgnpXpken6YbRs8ES83m6H0t1jc3PDa/FWyT94uf
 Uj8swuXyi7JLz9zCRriwBX84Jot7xi7SwHWKpMCvyupVI1u4po/X7DDyZlktFjU9P1CdT6W
 7x9/yWqQaXyRHxzVkXXbXMucmb58RmwvRsSfuDORtv83ud/VCPM1jxXds5Sg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=0x0f.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=0x0f.com;
 arc=pass; dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 961C340ADB
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 09:03:14 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4810E08B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 09:12:22 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3530e7b3dc2so2310961a91.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 31 Jan 2026 01:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769850742; cv=none;
        d=google.com; s=arc-20240605;
        b=cAcNhpp5b7jJ1Z1z4P17iWpHI5eFH9/vaJFkY9bgL1f79R5YsrijxUJ1VyNgykqvGb
         W/BLeKn7YpyjDeSMXkxBvXOhwT/77dXL/B5v9wAEXF3cpSORcVIOJGvdGWhwzGI6jhcV
         ab7bAVlxP/25MheDw4I8CIGCj/gk1ytGEiwORcU9f06snBqe6M+ZRajqWti9Fcn2/UsN
         6I2MoOm3QdWK6wNEkhbbTYfW71fiV6YMJRUj5Syl/tgR0VxsuuL3wpwO3RX00LuWFx0G
         8XWWjnbBeoKpOGnRJG1MZmwIje1OxtL/dOo5N0LLn3XcY8FlyWh2ZDdPqTiNgLIk+wOX
         L4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
        fh=35cxvuiwOPEkVpAlqf6IRQw5CgKjU3uZvt1YkZsSd5Y=;
        b=ZBlGkbAWP2bnZWeURiB1At/U64LpAKUfDD4/pJOyBJqYHDhHrvzi8b0FlbugiTmp8N
         nFRXazeo6ZHEwcqMGnxyL8+QFqFTLYTvw4cMW3RHz2Er4tVYfPZdskf6k45CTN5l5kW6
         7X2JCEX9csQ22CEJ2g9Vbug7nh8Vy2jhgnerVnPDr5jxAc+zvFKljxC1hFm9+Q2kfIek
         VN7NGH+5ETh9BBtWQXY6GYfDGA4oJK8n6imOAfttwxNKxI4V/abgtCMRqcHtoF+3ie2+
         hmNVf7ZPkMzuSUjAkPy8RCsFXoUlGkMO2WYvZqWfIf1ayN3A49EHlgCZLjOYB4O3VbHS
         fBPA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1769850742; x=1770455542;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
        b=trQwS2JLKANr7zewUtWG2V2Cq6axyv5KN9jyO9AcS8KhCIGpH4iwsNs88GPBKU3Dwo
         TFN/brDUZGy3ApjhEDMflQhMNMKB71ruda1jcv3HMPiOEH/YsNAMGwPVeZyu5Of2Z80d
         IJTB+BgNMUkbNarVdDwhLDwtJo/I4wOuOiVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769850742; x=1770455542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jGI+5RyfB3vCtuiCc54Q03oyhwJyVoh3orqwK7JVeU=;
        b=I8GpneVHOr3q2K28dmIviTa5MSyYSyNR/LXQ0prFyV6LLM30ZsscHNrMzZ2EwxrkfP
         j6m1Bx6D9sd5evJ47H1mTJh9FZ3r0WgNjWE+lgG8Ce0ex3mwrwr777UVztPFwVQ1ibXd
         FX6Bv7LKZ4cBh+id4iJj7Y6Ol2JjsESWSy83NHPYI99OB9JVkA0cSJ/ET9CdAKaKvBWe
         bhQ2JNk5XaNWD0PhGr2YUa7leutzXySS5suNOtRC46OimNw4BiOtptE48rxgKt1zrgHP
         AQLfNK4u1ffben/dBgA2xkiVIRVmvm1MHR0cwv2D5M8x228puUFvhAg0IDExXd2sovbh
         vTZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxvYWmgSBE/uVxWNEUZkVy46Rr9YGVUa+hO6pUFUWg6d9bpNhjgVpoE1kI5sYCzYEzVfFNKOkn@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Kk5agZgaBn0VhvvvGOGzWjNWyLsA2LKh1WfW0OCvJZznGmcL
	ZyrrAoUzjCQLQlEHcGL+o4ZN9Nao8PT8sSbkccDp+c1cH1JxF1T0L3nZyHe/gwDoTWHmiUi0SMl
	inWM9AMssIn00bPXBzxdvsPhYgfcJvxRQZhAM9HYZQLdk0FNnFujMpd4=
X-Gm-Gg: AZuq6aJAOXcNj6B125O6+D7J4Y9LLDds87+8jbiikDKvPbCt5N4367ewPMQk5HsJZ+d
	LMzN81SqcYZNM+xBJY83DdG7zU3ZHU9IJ5ehQJn6aypfyZaQePDAfB9W0mknu/WJAPjrvuxhq98
	LcA2vOZgAmVAlGnjn3WYX0Sb5sHcU+JriApuYZy30l2B3cSck8bfhuwtMEW9w93yGKTKHBox9v4
	I4Bbsc6YBUP++phVeHGjJVzRMGXFmuBCoecr/jXDaQYXJbkcTJHQdabnJwS+5RF6Il+d1p4Bg==
X-Received: by 2002:a17:90a:c10f:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-3543b39c9e1mr6128743a91.18.1769850741806; Sat, 31 Jan 2026
 01:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20260130113230.2311221-1-john.ogness@linutronix.de>
In-Reply-To: <20260130113230.2311221-1-john.ogness@linutronix.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 31 Jan 2026 18:12:11 +0900
X-Gm-Features: AZwV_QiCcHKEwTXVFMBGY0Y2JoDZenczPK4LMjBrq120HRde884UUkrfy0S9Vjw
Message-ID: 
 <CAFr9PXkCGTvOatJKwTTEyBc8r8kEyJGdDtPwKuKTfJK586LzKg@mail.gmail.com>
Subject: Re: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
To: John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: daniel@0x0f.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 32UABBDCIC3RH4V5XMRH572WWJY2I7SZ
X-Message-ID-Hash: 32UABBDCIC3RH4V5XMRH572WWJY2I7SZ
X-Mailman-Approved-At: Sat, 31 Jan 2026 22:40:39 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/32UABBDCIC3RH4V5XMRH572WWJY2I7SZ/>
Archived-At: 
 <https://lore.freedesktop.org/CAFr9PXkCGTvOatJKwTTEyBc8r8kEyJGdDtPwKuKTfJK586LzKg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi John,

On Fri, 30 Jan 2026 at 20:32, John Ogness <john.ogness@linutronix.de> wrote:
>
> This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.

This seems to fix the boot crash on my sun ultra 5[0] with a geforce 6200.

Tested-by: Daniel Palmer <daniel@thingy.jp>

0 - https://gist.github.com/fifteenhex/0255982bcd76e8b2f53e15f809c2b6ed
