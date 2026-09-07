Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3307C88E50
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:00:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5010E408;
	Sat, 12 Sep 2026 03:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nEnHHzIq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 364ED46DEC;
	Sat, 12 Sep 2026 02:43:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789180992;
 b=H9RyuUr0+s/9/fGIqZfXPr0L/pNFIAVJIx968nLa0icMEvCsclVZxjxzObNCxqoL1JqMV
 Bf3KUt3IkxHBWG9Y/rjY9Bln+V9i3Yv4T9RV0/uK0EfOYkEfd/VNFglC7jR2791Un6fzXPS
 sUNJz//LX23ASPKsg+XPJ66jHA7EV6rF1cTYy64S/B1ahnejHhUM5fBCWJKSUzL+beZ0vkL
 T+FFOzhYUmjLh8uKQspW1eDyNK2PdNrI5InKVnyixbmJ5GQT0ZXESDf8D0mFNCJn9N21Pk+
 Ui/LIejSCzWL9gZ8mAcUlzfPTncS/vfb2QsQvhapNYQbwV1nFeZqCneXd8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789180992; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fBu2LuPpjoahvMmaWEwQMcGkzlxXBLBPYT/w4A9fsYA=;
 b=vL6WKLDm5mOLTLwwVZ8XwbRdN6/MgIxzvG45xFQM/YqtJPcwjWIhudYMJEzDbyamQUpA5
 JF6D/hZzsA55velhJP+ILWQhfUVDvTLKpfgFPrCIu9Ll9LwK8VoZVcsLJ3TZNe2opBiwmnz
 P91cYN67Nndvt7Bh06IVRrjUvQUEzIwGnV2MLnCYOnMrlOn5SfpksOkuRXq0uWxcLSteEKs
 y+/k7VCGcAqJFy4HIUk0kU8EiKLi515Jv/09fnhadzz7eRQNDkyLYvUdToteFxLpVmGMKU2
 Bd398aa1oWunrQVDcq+WfxvPADB7fzQEEf1cr35G1FLWTjt7ILd7JwnPPNpg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C29EA40102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:04 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F31710E431
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 04:24:15 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-39b52169dacso838869a91.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 06 Sep 2026 21:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755055; x=1789359855;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBu2LuPpjoahvMmaWEwQMcGkzlxXBLBPYT/w4A9fsYA=;
        b=nEnHHzIqXzsjwJDJZCtKHpKLlKSlcJ+cramyYWo9iHghNcOq3swF/DWMNQgZvsbXKr
         AGEeMAIKCqxvIqw5w9RtA3/n9pOmge2EF/tBWf/45P96ttMttzeDvZIOJh7aEHeJ9uGU
         eUzaSu6CwMeFEcS1SpO/mk2KzCkDKkon00g5+QqauzljnbR2QJubiOMC0rgwihv4dW6m
         8A6iw5lG29cV8dP94yaOfr3ADTYqoyfORe90+N7gkaCMFm4KJZZUEyDV/E4LZ1OUijOi
         UmssLNu9GIktY8x3Hxko4BbV2BZBUSy5dStbvuCT4r6/b2JvOTWYttOaqCXh455+Nkpy
         LwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755055; x=1789359855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBu2LuPpjoahvMmaWEwQMcGkzlxXBLBPYT/w4A9fsYA=;
        b=g3qZa6Zx/dsvk/YEfOeCT1wEI4GRo0LrFnibp2tuj5YP+Yehea/dQw7EXcSmI1OFN9
         iUFyjCDQhbFwsTwTWA/13BtnhluJe4rBUvCuqq/YZz9nNfa3J+kOY5zPOQUN3xy91HMP
         yYYi4IIoXFDDPseCdNm+WeAwSt7UP7JHzgE+hLHBEDKlQyCqdtgAkc8JgTBg+Qny8ncW
         RFYLVYQLQTa0Eh32DqBUzqBtV7nJCgwQ4oAbC05/FqgrcjXnu1AwH/6diCMapbFMOAO+
         iRkQAEiaTzVWzAfXD0UZ4Cn8ymjqqjkUepIZQOmvEvlUFW1w70vOdHSQ8ZJzdrKvwXA3
         UVsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvVHUugI73nYOrIEjyMV633L0VYtRmSnLVllrV62C+RqE49QaA9Eo0Qdrl7tWa7RO9K5CJF5Wd@lists.freedesktop.org
X-Gm-Message-State: AFuF++mGVHNaTr4H/BPRmlidl05eKxPeSv9u797uH5lFvdstJWyY8/rp
	Cmd+zIg7Ospj+H6NlAvZOZrYqfBJLksPH5PPCZgvwFCPsxsaS4yqwOaf
X-Gm-Gg: AYBFou3uQtCOE/LYMq4mETj9l/4yGVDNiw20kNf3n3ABCZ/iMMbHZT5wn2oF+3CiB/0
	PxoJ7uHMqlPpyLRYAr+TEn3xWnj6S1911BwFEZlgT7XucttWQsJ/u9Ns8gritzwEFce3Lp4LgtF
	L+c8ur98tmu9cYWWY1VStveYiGXtscWy9I0YHXivlUfEqHXEcV+mpeaagj5QkfON8lcopUXwejw
	otCwHmFPb5di/EZNWLLsje1NzBKIMceDXnjytYV4X4cqwVljnriV8Q+b9xZR9CUbS77/VmHIhOo
	CIKjeNKFiYjTCzBzbzKlVR0So8yNWlBISJvU6nTRJhWH1+BHnc5be/mOq7nsCrrgSkV7+XGikiQ
	hLHHcwaWfF6G7w2GKMdMf5XICDTFSBvzgBwoWqDuX6/iYZ/Ncfwsc5P4fisCxSSRHbM0ZT/bLHq
	cZIxD1rO7PpksfkWkENoR1Z/D+A2JIfqRq9oOWE6C+bgxiw2rJ3N7GuTXrW7Zev2H0HyVBl+BhT
	E9/C9UMEDGD2sE=
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-39b26125efemr29120236a91.10.1788755054931;
        Sun, 06 Sep 2026 21:24:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 2/3] drm: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:54:00 +0530
Message-ID: <20260907042402.12893-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120430.17224-3-hemanth.selam@gmail.com>
References: <20260904120430.17224-3-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: hemanth.selam@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: WUBVRHZKEPDTBCQLH4TLHVAWSBQEY3JP
X-Message-ID-Hash: WUBVRHZKEPDTBCQLH4TLHVAWSBQEY3JP
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:09 +0000
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WUBVRHZKEPDTBCQLH4TLHVAWSBQEY3JP/>
Archived-At: 
 <https://lore.freedesktop.org/20260907042402.12893-4-hemanth.selam@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thanks all for looking, and point taken on the churn - I am dropping this
series and will not resend it.

One correction worth recording before I do, because it is a mistake rather
than a matter of taste:

  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
    "Add a view and the surface it's pointing to to the validation list"

That is correct English.  "the surface it's pointing to" ends the clause
and "to the validation list" begins the next; my patch deleted a word that
the sentence needs.

Natalie is also right that the dmem hunk is already fixed by 23df2e995df85
in drm-misc-next.
