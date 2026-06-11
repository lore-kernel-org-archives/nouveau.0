Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045BACD98D5
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 11:10:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE0E910EE9A;
	Thu, 11 Jun 2026 11:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mvYZPebW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1A61546A50;
	Thu, 11 Jun 2026 10:56:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781175400;
 b=AlWfxQzoA1+uR02VMy/XrW8XveXcpS4UMNN+bv94Pqt5VlSdY2uVxwR++dVV4zsOgCoH4
 DaYSX9dW2rew61TGJdtwDHHCZ40F4wUInUATcYU/C6U//+Tbg/F4hopAJaHMBgiFdSEwj8N
 cAgFMlw0/MxojUYGo4g7URUL8GGHt05phU8N0fF/UCF9zyaI9gfPoTXhgcep0U++LInbvi0
 waUhWwFmv29+6FSMULE/WUdFW0CcAm1G6Ht4jC696TqSJB6lPW4iOYlY/p0n9XfywbhV+F0
 jx49EDBk5jl3bzoPcSpexrtcR/z2UNpdW2Nib8eOfgQgJvF8vJ5C75/a9lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781175400; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
 b=ut8cvsn6fut73Kcj/vJ2ENMg4YFbrbUJ1BTyhG7Cx6UnIRsr2/MCyL4R8DedyVFigbkTX
 83leCuVfSwS39qtB8SZaT2ABDBEOdgVZrZQXtHSIp1Wf/q/ByaPRDWVZb9ABXHFOENFxHsk
 NLYZlrjN+HTgZutiBui3nUI4I2493lkVdsR9AYIbYVYpYpSndS4EhKyoFzmI70x1Awl80ti
 MBqNhuP0hgSYJRinYsaslx/DPYT7ZG4flOBu3TKM/8k+ulKd2Ep3A73UfVDa0caOFlozp6m
 HFfi36hbmh+7S/3KTniiDbIF5ax+d2UGNU5tPBclJ6hzpViMGM8vemKccHEQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B57D046980
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 10:56:38 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE310EE8D
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 11:10:38 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-490cc1ae292so6804095e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176237; x=1781781037;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=mvYZPebWz+OLCN9bf5pJQwWLzygtkanmRaGfBcnkuB54505WqZOwhXay6NJXgMkQi9
         qVX0QuT/bTC4U/Jk0UxYQQjzKD5emVAO+btOcVtUrRheNxHulXghu+G1puoiucOlSRFR
         PF23CAZ04ZUeeTloVYe9T4YsOmmb9Sn0k5NXbOg5TYllekPvNoyyUcEw+UJqyCeP+s49
         IR9nc5/XpBQzBz7xLCaFlCsrGoeS2w72TmuiPWnyax3h+aK8OrmGnbvRaoYDFMWGZL8R
         Qk1pR31SLkUbqLYu4MXOXzuGCHg9cIgAfpsZUmQBxIZJmzz229qDZiY3IQmfYxOEv607
         zNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176237; x=1781781037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=W76bJHqzrRvVgbaBc+6fEEn+5vU0GgRw6jxCmwu6RkzHL167lD1wCCVZGjqlxBh/hb
         mH3wcUBX914KIvsR5fbXjC9ATyesLRSIv8pWbqmqVyf0G/gAtKDrQIyRpvPmhTbWgwrm
         DFNPTADud5WRimS+xXjkP8vhMxcuV8tqKKzrrBDeap9pjVW8bb2pOyX3aKzYpiD8U/da
         F7qQniuB4mMFzqfuk5YRoqRlXGZUN+uVni+2Z70nge45FNmeM98S36nZAv8otrXyVQ2P
         xRfxqnRO2ZglJkDFVOCX6Q5QC/9iu3GlwBGF/u8CXasgB+nFHpvpEh0Im1isx67Fc2yM
         n58A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+YyTztGKw4U/s9quxh5ck8YZ5IVINuFkemwooHWifxAXDCCgaFGCbY+yf8mJuuULAIokpwqKxz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi6hyB6WacNWXdfVnEC2W/Q+gGp4i8v100CHAHBXY0eAdNMH8I
	YTQmjnaGCrQpZK0riMD7q7hDg6vMsBNWo1JJzbGQmSMqXv5Q+dafjHtDYddWvFmdgi1i7jscBqw
	jjHtYfnp37mJknXqipw==
X-Received: from wmbgx15.prod.google.com
 ([2002:a05:600c:858f:b0:490:b1cf:4fed])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490e52df887mr25369835e9.7.1781176236585;
 Thu, 11 Jun 2026 04:10:36 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:35 +0000
In-Reply-To: <20260610162433.923550-4-lyude@redhat.com>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-4-lyude@redhat.com>
Message-ID: <aiqXq_ufWWztHPQ6@google.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: R4FNVRPRPO6P3H3A3ZEXJGFZ5FIJG5SF
X-Message-ID-Hash: R4FNVRPRPO6P3H3A3ZEXJGFZ5FIJG5SF
X-MailFrom: 
 3rJcqagkKB909KHBDQXGKFNNFKD.BNLMNTUD9TKHRSR.EQDDCDRJSNO.NQF@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Benno Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R4FNVRPRPO6P3H3A3ZEXJGFZ5FIJG5SF/>
Archived-At: <https://lore.freedesktop.org/aiqXq_ufWWztHPQ6@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jun 10, 2026 at 12:21:30PM -0400, Lyude Paul wrote:
> When writing up some rust code that used faux devices for unit testing, I
> noticed that we never actually added the Bound device context to
> faux::Registration's AsRef<device::Device> implementation. This being said:
> the Registration object itself is proof that a driver is bound to the
> device - so this should be safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
