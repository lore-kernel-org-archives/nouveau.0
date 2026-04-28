Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D30CFF8868
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 11:19:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08D10EB13;
	Tue, 28 Apr 2026 11:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="BInQF80x";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31BA445C8B;
	Tue, 28 Apr 2026 11:07:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777374456;
 b=jILIhKheLFjuZW15PgT5DPPxREvhNTwU796yGbgXLqwWGKku78+FtPfqYziC99uv1TmX5
 g3RT+hl2clE77pU5twOvUcsoBuuhbuxbzb8fECGZ84K+bjg1N9s7J5EHWbv9+5qJ7a8Kfly
 LHv9Yy2i9Dvn5dNhRUDuiH8sL9COjy4ULAqgiKgw1f4wpCJmW9MHMp9ROtNwjhFYHWTzLXx
 YpReHQ6FL98WK2IxXyAGOAPn2fgJw4ZUyagC1bfEJeQLjugDIcoBEZ8E3SbS7Cgd0W0uPVk
 h8bmvXwvzchEH4oHcPBDgof/gHkLlxGBh09GMoQkOUAwiD/JHbB1NhoQby8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777374456; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+IRUtpTE2jLvhfuGmxg8F5bJAJ6d1P40MueucPpzBxk=;
 b=IMJcBaEIXpK1Kp2sNC0VXWU4qvRb9W7oSXqWY4GUPhxcl/+9OXR0XWUdhfUxkV7NgFyTC
 XSOgFkO3xfQgl7FuY9JuemyBL6SMEJMvKWemp2v2Alc/gGm6NT764S0VosPESbi6Wb49O0E
 d6tHbCeUeoenDeox+7Ty7dWXK/M74WwMro82y9RdBu5gMvysys0x6m18s+N7XZNb7KHih9b
 epeVZW4dvCe9y2QvuhB/e71wgiRMKiLoovJjgIzBReSiAGAnNFpryCLRMG+TAS/j2tlOIoI
 MO9IIyAr/dTcall6qdBbTbiIsvrd0svqwOJSBoCV7hfx5EKKL+KwS8QF0hKw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=suse.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D512545560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 11:07:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6910E309
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 11:19:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5a2c500750dso12595698e87.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 28 Apr 2026 04:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375193; cv=none;
        d=google.com; s=arc-20240605;
        b=Pqt4YLC5EuMgv2XbRNlXTcjCCmN7O7rgRF5jBSse77WgdQrVGYFGs4eo/a4hZw7G6y
         c/yHgaMxQ1kvyWbKGBpAhkW0p3RA7oLBraVr4wg8wMUqzVWYxArA+H35PxJuIBWTkc0R
         EeLqwwgjvU1BFgcpI/dIz8rkFdOeR1L3R7KzB3Nv2j2ChdYV+nZGm8PaGy+oY4bWPMO4
         0OE3YhLz2DOa+eCQsvllIjSZSHh85+zyT0jCvY33OJDEIMjxMa0H7Ic2HtPmw0TQuFi0
         Qj9NcfBLGajOUiY4vgk2//R+DxqxkX5Crg6+rgIf4d+XocExm13jjP5nNGyqSU1XlMLs
         FVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IRUtpTE2jLvhfuGmxg8F5bJAJ6d1P40MueucPpzBxk=;
        fh=xEKh4l9J1UPIVoKVsBuIbra91X2cbH1QoMs3xbfDemw=;
        b=iL3ZacX99UHFLjrVaWZu3CHsi3tSKK9Yc8VM4vJk4Mkv0TcD2vi8gfblHmBFocDYYF
         A6/YquYsjYMjnoSTZkTh/HsTlOAySkHxpPl0EKsClLCfnr5SYpJG28320euuIZJhFeA/
         pdkvyeTDiKjy8rInoTAwXSJUh/Xy52GYv5dCJOuaNcnSVbF2plKESDEPQFOdpUr6P39n
         0jEQ5V9GOONzFk7l8wpCqo/TgfKWgaJLi4Sp2LFIv88UFl9PdISin4FX/Hhy7TMOXzA6
         GOjgzVtNL13Eg07alnfvjuTLExeAgyS5m9vIsKTbIM71qc9yIBhyCjWWH88fTrVwHsSO
         f4Tw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777375193; x=1777979993;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IRUtpTE2jLvhfuGmxg8F5bJAJ6d1P40MueucPpzBxk=;
        b=BInQF80xHc+ro2wnFhkh6tHWVwOiNwSmYlOiOdbUmrxVvYPQG3QylfZlzh1bl0MfIF
         P/CHpjdc3MAyMTrBjTkM8Sqc+tTTHEmv12Uq9M7hBZFsD/jCbbjr9rQ4lGLw6TTh4huB
         yqFgI/IQMO8nClJl/5E+qtd4JjBezY/Jhlznl4e3MHG+Kc2TUo3s9EvzHFnhXaP0Bcjs
         nirOaLvutxq+vrR1FUMeatlIMGT7O876RMYdL465HIXwZMouyG452yYfJl2jlg5ARuVm
         uWCWgIdQlnze5UuJcpoupZr1Bb+dW73R/ro+OQIzVJ2J4yXWHIhM475TPd5WGZqAb5sC
         Ynig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375193; x=1777979993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IRUtpTE2jLvhfuGmxg8F5bJAJ6d1P40MueucPpzBxk=;
        b=iqH+lYUwl00FjhwilFsBSNaDM5y7/OMuMx7Ny2PaJJhGBe5C8eoVY7dGB6GmggcZ7G
         N9ow5DmscyQi+wLUIsygCXkdlro6efIU1lDJ5xd3WSj6tsZs7LUhm3ndd4MshaVzpIQz
         utn4scqNjQB614FaduyOTUriNCanwCzF6QatgFywxjH4gC55tK8sncmhCoFdkOzbE+hP
         G3NjieMtgB2/UZv8IDNVSXXMKi43oJKnWmpkmeq/L9C7TZIdFgFmxS+YIkEiu8QHJsOf
         7wxYsmR4d4SeIInrNrUwm6hoRG+VHlPrZYflcUKt0L0oxd9KgipK7GlR5CyY15rcs5Jo
         8vFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Y/MolcdkiYJbEya+w7vt2TTasmiXv6JU9BHbP9OlpSMhRbXa4r5uV70Dq4NMe+YjacH+2ImDx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDDCCPYfdmmH+HGl79pkQ0PKCUoD3nYJ0TO2DhOIy8ZnHBx3r4
	CcTDx5FZ1/U6cx87dbIIn45IN8p0TB3C7ifN3wiGYW7uAyvZLUrii+L2cT0an7NT9pmx8N69QIF
	iSnFDqod1x2hD+M/7EpNEXEC/sXY9xUHo0Tx/nqi9kg==
X-Gm-Gg: AeBDiev5SPn3WAj4DpLdinNKp8IjYzffwC2IkzIZ1pZxkhUYV/IokEbT00MCiNK1oQ/
	txnpo+b6C8hFl+S5e5itSikhXm0OzX5b0hDDqvxRTHL3essa5KarKjDJyLsBSt9lFD099jhDRsP
	wVR4OFzMWmiPUG/jbiNjRXCzBi9fXUksAePD5/UCOR41DbLBc8njLQDyL0u0CBiUJ8GEQ/JLo8F
	DXLLCrSvStQkZGHvjYsInn9zvvppbQL1Y6ydBeM84jr8V3wmdeeZXqmtLDU5a70xbl+EFcNXUXl
	7gVAGpvqBXygW1xJ/OogF9fRy08WnJ8ZDav4qjCaR3ooZxss+NM=
X-Received: by 2002:a05:6512:a96:b0:5a4:61a:689d with SMTP id
 2adb3069b0e04-5a74661a267mr923326e87.41.1777375192783; Tue, 28 Apr 2026
 04:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
 <20260428105916.6108-1-dakr@kernel.org>
In-Reply-To: <20260428105916.6108-1-dakr@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 28 Apr 2026 13:19:41 +0200
X-Gm-Features: AVHnY4KwH8Y43d3g_jTF2J2S58XepR3U72Zf5vI5bw3Cr0gZhKgvpqnDIKMtYxo
Message-ID: 
 <CAAofZF7QuYZOQEiOdU7FEP4+-WngGMCt3svQhMXaiF77J7dkJg@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SFF2GVREVDAPL32V2MQB3WDROV5KQW3D
X-Message-ID-Hash: SFF2GVREVDAPL32V2MQB3WDROV5KQW3D
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFF2GVREVDAPL32V2MQB3WDROV5KQW3D/>
Archived-At: 
 <https://lore.freedesktop.org/CAAofZF7QuYZOQEiOdU7FEP4+-WngGMCt3svQhMXaiF77J7dkJg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 28, 2026 at 12:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri, 31 Oct 2025 11:20:18 +0100, Marco Crivellari wrote:
> > [PATCH 0/2] replaced old wq name, added WQ_PERCPU to alloc_workqueue
>
> Applied, thanks!
>
>   Branch: drm-misc-next
>   Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git
>
> [1/2] drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>       commit: ef1b53284175
> [2/2] drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>       commit: c82a16b0caac

Many thanks!

--=20

Marco Crivellari

SUSE Labs
