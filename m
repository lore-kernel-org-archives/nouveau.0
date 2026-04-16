Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16025F88090
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 07:08:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9D10E823;
	Thu, 16 Apr 2026 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LmT4VTtK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67A624595D;
	Thu, 16 Apr 2026 06:56:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776322588;
 b=OmMEEBclOUoxBWnmfkZ5LyizfkGcvHWylKmwwbS2fRtFaBxFNuA6Jt1JIhKlRaE0XaTnW
 8SbEO4rxub4LHckMiCVEfgUXKQB+ijAqd6x+DuwsRy9OwQmB5oJV0b573UtJ4raksqLFM2/
 BESUo3QmK+V4tQexb6gzALIPgqMrgUBpq40Bzr+f6duouml8PTRaRTF/7yN4r64VSphWLCp
 4jM6+/+0rjQtvdF7ftMFvVaJC+Ao6UGPVfYVaRSh7yMyr235zq4kjBOhqpepn1ZUVSZzwXS
 FMycu6lfQ6c48JkD67WpR34N3W2RiocxW5r8AgSM6ZGBvbB6uAKnj+/7XS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776322588; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
 b=fsZ04Jexn6eAJtkkYmpvqsYen+znZI8CCdkx1lYTzJEr8F85+/9RzQF93UZw8Kn7wqY9N
 2JOxY1TL5OoAG325Joc4VH1wKaXwFaaW/RDUzmjfoRPmdKfAVmbmWvVokw3rY1WQehnnijB
 GWgcVkD5gOFG4S5qdVRbNR/pm9gHa+64cSOTCH5SeZgeLmHyFnFoOWHYipkW1ibpl4KvTeJ
 1Nj26PuNF8GROrLxniruZlO1ZUID5vAHdWIfN7D3s2OffA+HrrcPtuR1HBMI0lRzCdHVsux
 bTZBsi+JIlP9dTqlQhnbVgVf5BcTAmTHy+OYykhnmMtqE75S8KtbVn1Zhw6A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE1FF405FF
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 06:56:25 +0000 (UTC)
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF0B510E81E
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:08:20 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b94062e85f9so699092166b.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323299; x=1776928099;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=LmT4VTtKac3ErlJMdFV8lAPOkG5Nsw9aGZMo+CBVzvZw3mXEHhU84A30LhuHfKyVwl
         +Z+f6rpE7ia6ElepwGXKxWueia6+47V/COkBZSYY2tY/I5kDGsqs39tXwOhAwYjfkD1L
         ECxzlaEznAmS2zj5wSsTIJbuzqE/nQPSnL17KHaro3jVujjBiBUV/H3HHKjKQZiWg+Ik
         JgRHa5S+yvqOjdJARh+SH2gIT9KpYohpQwnnleUI6K0HtXB1bwTw3/YRyx8P1DwTm0R8
         iYqRt0imQAMN8aoW4hP/X1ul50yUve74TvDeOWOLFlT1/QCp9nwoJ1Ww4rw+Hf8jcdvf
         twAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323299; x=1776928099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=cwk3rNbRzLrVFhwMIPv78HGyUGqnX0LmuA7Gm0phvKXOu1Me9NlaGq+vH+ylLMO7hn
         miPT2jUaajHNJ06UlDQCTtbPjsYBT0ZMdMyZUVZV4iFpO0F+dM4mbOLeYCRrt0N7+o/Z
         JyH6hYXDPvUuPwAkFJT9hY1AH35LihuEaDnQru1kLrUzqbSYxr9dI1CNL7TdeW32PMBJ
         whgos3JvEDeCawYDlhQPZd6ycjnPNJwrOmKcC8aNXT9hlRWnsoEkJe+BRnV55T18tPuH
         JU8GEzrQW0G9+GzTFIYAjutXeWTLkFvD5IE6woq5Oelm5AgmVCS3yYHsr6JIfS5ejG19
         ePzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+e0VpZCcB5CB7rlX7+olovZcXQ2bHhDYNUEG06onJE08M5QwFRrx3bwYuONhWN11Ga82YOOeqg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfxGuGCweOkU6VgHXl34WEW9Ng2fvLdrUJjB6lO/2ocYPIAf1J
	oMBHYZCtXdyJQLwwmSG4KJim0sMdHoANhFdQawbolrO3CJ+yLNc3NXD1ytf5Bzn74cxL8DN8jZ+
	CGCw9huNVn8fXDAZU0A==
X-Received: from ejdcm6.prod.google.com ([2002:a17:906:f586:b0:b9c:5eae:2e29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:86a2:b0:b98:7e20:b25 with SMTP id
 a640c23a62f3a-b9d724c8f5cmr1366009766b.20.1776323298770;
 Thu, 16 Apr 2026 00:08:18 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:08:17 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Message-ID: <aeCK4cLHsM7jbWEl@google.com>
Subject: Re: [PATCH 3/5] gpu: nova-core: convert to keyworded projection
 syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: K3HERRYUGE7BAQ6JN3KMVGMFG6E5IPWK
X-Message-ID-Hash: K3HERRYUGE7BAQ6JN3KMVGMFG6E5IPWK
X-MailFrom: 
 34orgaQkKB88v63xzCJ2619916z.x9789FGzvF63DED.0CzzyzD5E9A.9C1@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K3HERRYUGE7BAQ6JN3KMVGMFG6E5IPWK/>
Archived-At: <https://lore.freedesktop.org/aeCK4cLHsM7jbWEl@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 08:57:14PM +0100, Gary Guo wrote:
> Use "build" to denote that the index bounds checking here is performed at
> build time.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

