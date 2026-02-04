Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F12EE95397
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 12:43:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C02BA10E640;
	Wed,  4 Feb 2026 12:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="pfY+Vqjs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05AF041B47;
	Wed,  4 Feb 2026 12:34:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770208463;
 b=NAeogsm27ycWLhzwqiLFXHhLHRFIkyBjSUBE9zhI6I5ttLaksD6q6dkG6010N8dRM4eo8
 QWkC/pw07Zbtx9rjr/WW8uOYeRvJ9pwDxBtCRdnOG64J/hJBXSpzhVpm0uKKUnEvD4n70mA
 PLVvu+CvkLp78n/dxaZYqg9nSC5tbSFTPdR0v02+0m3u1SoDKghBzPsmxQt0bHGHT8UXYUT
 qPVMGFy+1S61/Nnc9QE+bomHLCNmc8FlwxN6vapPqA3UxDABZEGfAZWZBGba2qLoXOmuSlq
 Q+ucdJHjGXk7B9diiJvUeb4U2tSo10hukk2vmkA86uF980uUZVdXcDaU7szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770208463; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Hw/EHkOMjiTCq0DNxVt/NvivymNYuYn7LwzqRJ3S5k=;
 b=FmEsTdaka3kBRw2ISz/Ug6Y3AVCukoHjgbKq/fe/nqDI6tKdByMpA7vkFHtSVHGz+HnmY
 FsVpBTidBQ9CYCcB/9kqNMVurD/NeiOI+D8/mZqjA6VRCV9MaC98vPZL3md+LDQdH35A/1K
 P/21osEFsDWHrNde0VWThRrVHhBUZfz5nwSjwFPwy9+36fJkAnOHxxXVt+/2h3ZPRz8w+YD
 aURVlz2MKdAmAxvmXV3U10Vh5o/jXWw+GsCHxrr4CLmyAW6t0y+4YuTwCgH4Q1R60OjwZNh
 qFNwl2AJNuCYIgETEDoKmHB8LwFlHx4qxNW0QcCKCE9x7r17WL4yY27bk9tg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mary.zone;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 81FDF40382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 12:34:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43BF710E637
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 12:43:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so880016466b.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mary.zone; s=google; t=1770209015; x=1770813815;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hw/EHkOMjiTCq0DNxVt/NvivymNYuYn7LwzqRJ3S5k=;
        b=pfY+VqjsydIZPl9xeGESCQsh4hrdNcd99re72rsiJevMoZhvL3pNgkfBPnv4mH9XJ0
         qH64kznamxHAQbAQMs7qqgVJC3b190LvgCDC36TuYM9JGURHSEMlpfiIe2dJbf0OUtOM
         iSTfG6R2wgRxz1BCN5ePm0hE4ia4K0SoYBdzfq0NNz1qUMzpSzJBWi0o/WqxSeJG9JML
         WQIVXkVfAR2gGEwGnACeVwvuq5wxpd62Sm8JLt4vv2ivRoxqWPXlu+CGHr22t5EmnMAS
         JFns2daHkQ7btrA4wFJF8J2Iuzw1xAVxqTpbJ7GVTYByY9q8xZWuY4e8p0rS1JKjpJbs
         9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209015; x=1770813815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hw/EHkOMjiTCq0DNxVt/NvivymNYuYn7LwzqRJ3S5k=;
        b=chONaQQGEssyNcmzpGtYqdQ25PYdkNKcek2Wi6vV0tpNLy0OwT5Mf8M0nvBQ20Dg4Q
         EQNJwsF8ZjV+p63/r8BBS6bWcvc4WJPat1ur4wZnZK5yzBMDJLX3ok2eknRX/qi+Q0qB
         ZJH0eyrV2zFJFyBoTrLzzVZACiKYlzcZTDRXG/vlSJrekMP6jTSdoz3UK9Y6YqldlaPZ
         D1Z2xMklO+OY1qCoWxnqxj/oFQpl7eSH3E2gSSutiUBHGtxz0BMIkActJeuyxupvU1Nr
         lEWf1l5UtHt7YM1PROZ/5ZckkjvxQhipod84uO1JXItVbaE2HB19v5Jb+kM9nFF0yDtx
         Ji5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVOTPWQUnHcJIAHrnG6H0vSr/U+uEsZwbzEo15dHFgVpC5MH/jq9XtV0JrcnV6xagm7SudSAyF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/jR/LCGjPRs+NXywGqUmCC5ntBwYQ0kqTwvs51Forzz33dP6h
	sAgl5NQJnMWmNMrA9GqhJ/lsVezVwChiu6Jm+bAwI+ShSHP0bCtsRoNEtkxTAU8BNEc=
X-Gm-Gg: AZuq6aIwPrJn2RR6E1uwH34XDfyn6ND4MJUKTw7t4wbl3N8QBB7r0eJeYjOFQGgKr3i
	+p93mMPc+tzQIoa+KrzO9o8IFLwmJZTeft4RJOcLCS9SwBRg8goy6HyGf+l6tsljzVGrus3pFsf
	Y/GzLVh3jWBWzhcRLGBrpB6FQQU7B9KzRCAm8ujRtQjZ99mPwUta0X5p1/kBFeDv+SUr7dCDfR3
	GhfomTIt45zlTKHrJnApRDM0CZUlB8BAN+iyg/Mtlgvjgl2DrkR9Hko/XZyOP+TudpLoYuoH7dT
	EP8odnDIoFk7OkXOCgfnofiJ5pxv7QJA7TnbeHEoerHxFifZu2AJwN3EIuhJ4jFrVTdB+ojDCGQ
	9eZ0uKaFZUqljpiXzaZA2RRJ4QZ9kQLHQ9vIf2kZoHaQkNsTNp/RmdVOULqYyluXIgccxnCfwi0
	Kh5CAG5tT9cAzblc6WODcU4yYGI+4HlziJeoLMvz4gtHUwihnBF+TWduKKEoWCs3s=
X-Received: by 2002:a17:907:7b82:b0:b87:1c20:7c63 with SMTP id
 a640c23a62f3a-b8e9f070f41mr221257466b.20.1770209015209;
        Wed, 04 Feb 2026 04:43:35 -0800 (PST)
Received: from caroline (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fd0a2b6sm122244066b.18.2026.02.04.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:43:34 -0800 (PST)
Date: Wed, 4 Feb 2026 13:43:32 +0100
From: Mary Guillemard <mary@mary.zone>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 0/3] nouveau/vmm: fix switching between small and large
 PTEs (series v2)
Message-ID: <aYM-9GzXxbExyiVi@caroline>
References: <20260204030208.2313241-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204030208.2313241-1-airlied@gmail.com>
Message-ID-Hash: 46CZ5KH6MRU3F6F726NRPNWTVTCTCEYP
X-Message-ID-Hash: 46CZ5KH6MRU3F6F726NRPNWTVTCTCEYP
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/46CZ5KH6MRU3F6F726NRPNWTVTCTCEYP/>
Archived-At: <https://lore.freedesktop.org/aYM-9GzXxbExyiVi@caroline/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Feb 04, 2026 at 01:00:04PM +1000, Dave Airlie wrote:
> [This is a repost with a fix for a bug noticed in patch 2 from yesterday.]
> 
> The nouveau page table has dual page tables with special states for
> tracking small vs large pages at the bottom level. However the current
> code isn't designed with the higher level large page support in mind.
> 
> The nouveau_uvmm/gpuvm code can cause unrefs to get delayed, so things
> like ref SPT, map SPT, unmap SPT, ref LPT, map LPT, unref SPT can happen.
> 
> unrefs can end up quite delayed and it shouldn't matter as unref should
> just affect reference counts.
> 
> However at least the SPT unref path was overwriting the LPT value when
> all SPT were unreffed even if an LPT was referenced in between.
> 
> This series refactors the code to use a union, then increases the size
> as I think even with the current code there was enough ref counts for SPTE.
> The last patch adds LPTE tracking.
> 
> Dave.
>

I extensively tested this today (on GA107 and AD107) with compression
reenabled on mesa side, everything is working as expected and the MMU
faults are gone.

Reviewed-by: Mary Guillemard <mary@mary.zone>
Tested-by: Mary Guillemard <mary@mary.zone>

Regards,
Mary
