Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD8FF8867
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 08:11:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3E10EEC6;
	Wed, 29 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KHe3L3D2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EA8745D1C;
	Wed, 29 Apr 2026 07:59:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777449551;
 b=TQkI67uxQuZYvoqqikNsm3RjlJdC7oZIKLGP5q4TmZU30NY1jQ6JJGyqvHSSdTC6xDewt
 X2JbV6Pl6QOHRwgUW7WnfRqJWUcrhuKI9yhgmR3XFZFu8AfstQQLVvrNxTZLiMUxrIYTEV2
 Yd2WLfdEvWelxOCh72YQ0T87UBj17N6ikfzw/qzXWIPVyjXXRggNbcsrTOHdSkOudVy8Kda
 ed75bTTjJ+n8s/ZdgUYoetYETi+MjQwlTSdmgw1fVynQn71dr3iodT2+5unQ1ru1reyciww
 g7nUc8+VkI1sNkZagcNcTOEGOKcPcQhO9cThxylK3ikJGgYO1SmAinpN4iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777449551; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
 b=OOD6qhkFVJjvt9mcuUIu//jzqkru/YJVnQ6iv86n6h+qEy/l+6EP/81gmfYjSYuUwc7gW
 VH+Wcdb4Pk1oY8DuO+VaoVxd/7HOi4Fi2K0SrIdswuSF0cl+IiSG2gAgOLYWANhrUWbH7nV
 2wLGqbGa/KFIzKEV0sWkCfLlkfrC2YbcCtb5BC7muXpUZ8Bq9wICAeNd2fvK7hVPcOCqLhK
 /W846sXUSgFYfm50aaw98KMW2s+5bWZgzYzdP2GipemhqSQ+q8HiHsasLPkz9kh7L7JblrN
 AKiFOiEse5YwSHrXXIQ6SbDTMkXGAs1NwNU7MVHcL3ozdexiyDEEq1JY1dGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B355F45563
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 07:59:08 +0000 (UTC)
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC510EEB5
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 08:11:32 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-44696b11265so2192977f8f.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 29 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450291; x=1778055091;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=KHe3L3D2H+r5Ih4NfuV/tvCSk5l53oaaVylZERi6n3rR3Dsa8KavAuNmlvPMs1QIn2
         4ZgAv2WECGHL/slYSG3tgSlKB3Bp+NbMtrIVdxEkDTnPKZRsiACVuBAP5isWxX2Qlcob
         l/SI2gB4kdMnbdp51q2E1VYEWYqupFRmxWz7bCfpNRtFW2tASAP73agHA2HteXFEIGCd
         f7k9aL/wOVBsBBDxq6N4goYD4wepuSf5955YZTNpfz2bVrigLrR0SrQ8X+pHab3j0aB1
         9iJ6mVxIm/4F0k0NBuhTX8D9aFFpA2CI5m4c90UWjrh9s02Qw8zj65LzKdZeOLAs+Xlx
         teMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450291; x=1778055091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=TFGNzglmvwP2eiFPViJmxR7jBBx9W8UtKQTydV+erzfoCBSPeGOLYy9jmc8uYOLYiW
         /b3+CERZlcR6BsMaKwxqXCgWSEvOyjNxcnXVDfMrXyuGAeULd4Kr61xA7+hm7VcSxvai
         TJYkgKN7PFiyuODwvJ7trkNvTW8s+qdKaJtJFzEeGsLkRIg1u/RjZYeUIwOploco9cF6
         Z1IJULNLqiKDoz/WEGupNap61e/2sf16MGZy5caX3LvJUpMW4MXOHQNjfsKJpH0YEzbe
         I0ADkQrs0dEKlqMGbIlTWeoxjfAuEU1VFRXOwVwBMiduzUL9ajVZLeHfEwDQtW8VTPtK
         TqzA==
X-Gm-Message-State: AOJu0YwASdis0MFC0TzRAuERh5T47U8BwWCeh5QTqQqr9WkGjcwpxgWV
	gX66GnNVbcP2bAixGyTzbIC2Y0LY5Q41/CxRftYkMVvphqd43LXArqkNaJQFbTF5zHkXf88BH3k
	KuC1gsIabfqJPj4Tgvg==
X-Received: from wrhm3.prod.google.com ([2002:a05:6000:1803:b0:43f:e56f:629b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-446494ea007mr11517494f8f.28.1777450290684;
 Wed, 29 Apr 2026 01:11:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:11:29 +0000
In-Reply-To: <20260428190605.3355690-4-lyude@redhat.com>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-4-lyude@redhat.com>
Message-ID: <afG9MTFxCbKE8OOZ@google.com>
Subject: Re: [PATCH v13 3/5] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: K6JYJY2HKEW7P4MWVB4LISE2QH4WG3UT
X-Message-ID-Hash: K6JYJY2HKEW7P4MWVB4LISE2QH4WG3UT
X-MailFrom: 
 3Mr3xaQkKB8kp0xrt6Dw0v33v0t.r31239Atp90x787.u6ttst7z834.36v@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K6JYJY2HKEW7P4MWVB4LISE2QH4WG3UT/>
Archived-At: <https://lore.freedesktop.org/afG9MTFxCbKE8OOZ@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 28, 2026 at 03:03:43PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Needs Alexandre's SoB.

> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

We will also need this in GPUVM, so I don't think it needs to be private
to shmem.

Alice
