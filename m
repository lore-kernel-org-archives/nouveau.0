Return-Path: <SRS0=sKHz=NY=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFA6C432BE
	for <nouveau@archiver.kernel.org>; Thu,  2 Sep 2021 00:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC3861074
	for <nouveau@archiver.kernel.org>; Thu,  2 Sep 2021 00:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EC3861074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2446E3EE;
	Thu,  2 Sep 2021 00:07:55 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2726E3EE
 for <Nouveau@lists.freedesktop.org>; Thu,  2 Sep 2021 00:07:52 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id e131so323557ybb.7
 for <Nouveau@lists.freedesktop.org>; Wed, 01 Sep 2021 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MFwhFq8MGcpGbKuhOC+evA/qmZV/qLcm7maq9c+lOA=;
 b=eZF1ziM+9h+Lvf2MeGvFoCmNTRdjOWtj2v8KnUhWsGR9bZanmkpNVZmJdMevn1ZK2C
 MVDhWnLtpwv5bGWM4mF7ZkOtniHnRXoMYJ03SNujdAsACR2P7UjTQjbKP0Pe4kDTRyXf
 LOtky0Eg2u0hdnBJwlW8UK9NiZSLslRwwkt4HX4l9McTKyY5cdV9VQufq8jupd3IzfKe
 TRSx+yuT4IScr1sAXFXIsanpGZekd5JKKdE2I18bhiW3iSv4Kp0HTaLG/LIGlk4q91Sv
 YcRxhp2Ev02iGMgUMBO8YorXzdZNuHKA2D30/5yPZ6Q06vdhvNW20WTDK3nQlbZ8to1S
 FtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MFwhFq8MGcpGbKuhOC+evA/qmZV/qLcm7maq9c+lOA=;
 b=gPRaGsNX7Dc2OFRunqx0Gx8StSHUCgdgYP2FUF4XTlhplbuOgPpb5xCud2FzS2UVfM
 habVyzyw7WjoTgwndLX3ZP1xeUXITRtPtDienf+eRDcM30s7GcKu0lHdubQ/bAsD8y2y
 TgL6CpEekXbfdzsQ62Kzi2NfluYb7tscnKH50rBO9NgATGEI6wm/H8739wV729LFLdCp
 8slf/vHT72oGB27jyFixzZ+pC+m9k3RuG6Ji5jHa/a8S4phnEyBJZRBiUaO37X2PxT5O
 788vIY3p4DzWCFyHzlwDaDGrz0Puw5OhG5X9d2qmUMESEjYXViGuzVfc2cHhxEIkSmQH
 7bWw==
X-Gm-Message-State: AOAM530JhfLgfJF6Op70XnBwD9pRdeqPDKF8G+tx3S57I7mrQzS35Zvc
 787fwaj0Anvzf7LxHzrfwakHsBFGVgN8ivLhvpw=
X-Google-Smtp-Source: ABdhPJwSh9v1Q4FHHlITQlMmofNv3nGLyHmkw1b8FuIpuSRjuzXFEj3rBDLz2Gds6bOi2D/TulpzAolexlYDcw/7MbE=
X-Received: by 2002:a25:53c8:: with SMTP id h191mr740898ybb.71.1630541271546; 
 Wed, 01 Sep 2021 17:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <d9e232668dee230a02206baf2c528c67b9c1ec6d.camel@firszt.eu>
 <CACO55tviKOiQk3DmxNFhMTHVAZC4gT4VUvPqRWLRa8eDb9bGRA@mail.gmail.com>
In-Reply-To: <CACO55tviKOiQk3DmxNFhMTHVAZC4gT4VUvPqRWLRa8eDb9bGRA@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 2 Sep 2021 10:07:40 +1000
Message-ID: <CACAvsv6YMuR=z5OHcqNQJSF5Rcjbw4wGEpKR2XwPcjGhLMEmbw@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Cc: Przemo Firszt <przemo@firszt.eu>, nouveau <Nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] RTX 3070 / NV174 / GA104 - is there any development
 happening?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 2 Sept 2021 at 08:25, Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Sep 1, 2021 at 11:19 PM Przemo Firszt <przemo@firszt.eu> wrote:
> >
> > Hi,
> >
> > Can you advise if there is any work happening on NV174 / GA104 (market
> > name RTX 3070)? I checked the features matrix and searched the code of
> > kernel, mesa, libdrm and xf86-video-nouveau. The only thig that seems
> > to be ready is kernel mode setting and the only piece of code showing
> > any results when searching for the code names is the linux kernel:
> >
> > $ grep -ERi 'ga104|fv170|fv174'
> > grep: linux/.git/objects/pack/pack-
> > ab4e07c9b3c4ddb7ed2970684121a5c4b7ddfb1d.pack: binary file matches
> > linux/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:        .name
> > = "GA104",
> >
> > Is there any developmen happening in the public space? I'd like to
> > support it (coding, testing, donating money) as I have a laptop with
> > that card.
> >
>
> Sadly there isn't much you can do right now as the next step is to
> wait until Nvidia releases and publishes firmware files in order to
> enable acceleration in Nouveau. Once that happens we will enable
> OpenGL on those GPUs and then everybody is welcomed to report bugs and
> so on. But atm it just stalls on the initial enablement of those
> pieces. The firmware would land in the linux-firmware repository under
> nvidia/ga104 for your GPU.
I have had a whole slew of code sitting around locally for quite a
while now, towards enabling acceleration on these GPUs.  Ampere has
some significant changes in a few areas.  It hadn't been a huge
priority to push out due to the lack of available firmware, and I'd
taken the opportunity to work it in with numerous other improvements
which will benefit earlier chipsets / work towards enabling Vulkan at
the same time.

However, it turns out Optimus/Prime without copy engine support
(engine/ce, which depends on engine/host) is probably not possible.
And, likely unusable even if it were.  So, I'm working furiously to
get those chunks of it ready ASAP to at least enable those use-cases.
Hopefully full acceleration will appear not too long afterwards, I'm
working with NVIDIA on it.

Ben.
>
> > --
> > Kind regards,
> > Przemo Firszt
> >
>
