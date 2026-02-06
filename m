Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455CECD9BA
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 01:07:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C19A910E235;
	Fri,  6 Feb 2026 01:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axMNipv9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B1CCC41B4D;
	Fri,  6 Feb 2026 00:58:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770339486;
 b=hDaPZkldSy5lOE8SrbgPEVF/4sasZ4Fsd1n+rpNoCKaSd2iW6yEMkJjWfdrLUcRSX4dco
 e7PUP8dxAIsxosxvxdKfxM9GH3Txn1mkUqHeeQCScfhQy51g/sw+Z8WBxg+ZNz3IujDUFxV
 tFOZi78u98sbTWwTrJ9tjHRzA0NwDy+NZT39+hciYy6mlX2B4JpWYDC9qlJ6eY/jrnfIgN2
 j8L0g5jSBjm7pklMd8BOCJZpbm0VvKOX8VuUKocKzxISu35/pJ+rjnj8HAq0ba2qELLxzau
 EQ8Iad6jXPSjeZe4Vyd9ua95Ky9WqCOW3cDaAytVB2kxoQvSGSDwoQEl3LmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770339486; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
 b=D4wYUZwtU+pV5K9IX5EdBRIRA6HeIjS2Q/1ghoCebqRz85O1hv+/yjLbI8jOcIRMuJR3Y
 WITFOElpz0h13hMfAEeCan1dybvArE1/0Fru3/m33z/qp8HwuFLuSVpcokcsMtq4+htMX3o
 K4SDL0GcS6M6NT60+0l3+P+wT6HkVP08+UGA8BKb7BqVJKYrhMupHr5IHa0guAaAUoeGYyh
 B3RtmaxcT40TST3VLx7DJ0KNU2PlyQJPnTvkMGd69dVUzBcuF5Ikhxg373hgQqRm/8f7rCJ
 9O5Z+bqEhuGSDCH5ZrxNtuu+rLLGYJfEC9T/jwl+Fci+tk7FHFLr2bkEvEkw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 669B64049C
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 00:58:04 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40610E21E
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 01:07:25 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-88a2e3bd3cdso21544676d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 17:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340044; cv=none;
        d=google.com; s=arc-20240605;
        b=EONTWYZ4JNebuUB1NGBdM6wupsN5pH6UchB68EPR4Lc1RCPIuUg82myQzsZpim1fc2
         4LO6lt/oV6hJ3aWd6puXdv8393RyHAZXoQ9QcXFj4NXjs5M3ou4qbx2dppwzleROyi9J
         rBScFIvMabm/tViYL8vOLyNY+wove0J83IS+d7BWDjcAZTVVLNwtk+KozajUgYmCTn1/
         vNRYs896cjbShwf4HL2nuDOY65ESmolWm2XkuWJatn01Il93MBJC0XvMBtW8gsT6pInr
         +D5KNYq+4IONPjeqbAtkLhfwymToEqR8d44+dPGMaeiEE0AfxvzZpZi9UTIsmPU8lWBa
         aeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        fh=p+fSyaj+yV+RXAuGrRGa01bzbjKGZ3cwhpGt2Pr7NAE=;
        b=O9cYqUuMzCtMwkOqLm7sKZuMUlYNIqqBCIaHW7giRzGGhJXrMIxED9BD5EovN76BhI
         10WW9VCXEUs5tLIL3Ucoy0V7Jj5gw8AEx0I7QrAPFmsz9QO5aAeTDAeZUO7NtgxUXRa8
         7yBkNaYVAT2Imc4d4vK/ay5+/3osf6s5GvxE5oZQYqlGTAybbUPB+5eyBjPWTwSuBp3H
         pxYvcp3ZFVcWwVgkTnaQCFarHrSaIyxOQAYku1USDpkpTkz8dFPX4/galN7Vzea2GwIb
         MBZUnsUCOgTw5ATMEv9TITQpf2avgVDWl7WdBWL+B8mVIjrXrOPMIR63cROcu4OavK47
         VXKA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340044; x=1770944844;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=axMNipv9rCDoUnNKM22DGe0DqtfDa83qsjEcdokLVq5/zC/acXS2L1e8iL6zs2QsUr
         OwtvKrLTjw1nPqsIVRh+01IwLqcB0crmhg2X8hj3erorBR4JTraNWSP9kPG9rb38HNsS
         bmhqt0dOmQ7aIpLzXey0UuPwxy6PRlGBwTEZMZp8wsrLgFPE97LxOnbXrHRMhQfkIT01
         pmJ48CFbKrxH3bWw1KihhKMlKJkctJgJ1BqJGTmBcA48E7O9cbmCtRsaQRKzVwPEdI03
         mQRMqe4HDSDgGXtINaXq+fL44ITjOEuT5BoL7jJm9jWRCTGXvqS5HjUYBLlay7quYIRT
         hNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340044; x=1770944844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=M4XjFZzr/u1CR+d/sIs2pAwrVA3KXhUyu5H3sboUvQErtCGl32TZUhTO7XIY+hb2d4
         U1jltO6WBmZ8K986rZ28xIX9VXo6auTC24qHUmg8kV2YYfarRMl0mXFAqe/qYi5hjAYG
         kP5JaLUVXibBDbqYbGnSQ4LsJWN3wbPDRScC4IxCwQdzYDHIeOqCN6uUE8SAAeOZlV+S
         UrJqRqeqUHWsKV69yhTqOrdhY/0Bjo7oaxwhBRJYVT882eocby6KF27fEirXgrPlOUfr
         AGwKbi5XV2ZoBrq3oV2QMgabgN+Jw/KKDSo6wvAK8LkxedI1PpQ8nBgtdgC/DZVez+Qo
         OkSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeHyFl6tZjWzKQUgKWpB9l+n3Juze9BqlEb76eT37RyaiH0/D/mSjYhlYwbuEHPI+LPM6bHeK4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVFsDoEUgLEwfhgYgPZRNUaANmzTMnrbfkvyLTrzzjBUiVjnFv
	hl45bSXNxtgyHQ5IRwZzmkgw/pQXp2XtrYSC/2WuMJso4VT3pVVLoAr8s6KlHHsV589mZfmwKIx
	R4x+e7ehaHmj1weJCFjf3whlCggyOsuQ=
X-Gm-Gg: AZuq6aImfj3Ay+Up/SuuRKVFjJQtkLHH+muIvWrwX0nAX1Trdfymebe565o3AFzUhVX
	VMZIhA6Pt+06+16NmVjLFi7zrA5gml+fimXAKToDdfavW0F+bkN44BbI6xcFogaAQF3GXUQ6sVw
	wN2mxhogGUZbM2zGu8BtgETrB5lyEdJv164ghVGMeoUspxaMyHmzRhuNi/MH7/OlXMblP1FV9is
	48FWQaE6U3ukkb15om2J7c8xFQKy6i39jC6HT6L5Pq+W/XoX4b+Hd3NLsAxVZA2JM34Bx9C1Nua
	k3OzirB5AXmMY7yDu4O1xUCELODNflHfLiEJOZuRFw/JWZm2a0IxGdk=
X-Received: by 2002:a05:6214:c29:b0:88a:44c8:fe30 with SMTP id
 6a1803df08f44-8953000350fmr75404466d6.10.1770340043910; Thu, 05 Feb 2026
 17:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-3-joelagnelf@nvidia.com>
 <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
 <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
In-Reply-To: <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:07:12 +1000
X-Gm-Features: AZwV_QjEIAozPEFJ7NdCW81HEOLtXZUhxCZzFmSJOZbp-SMcdPX-QLYah3tkGzE
Message-ID: 
 <CAPM=9tzafj_-L+ia8q=tL5DBWZU9PdSq9vaCAD7ituoMR+CaQg@mail.gmail.com>
Subject: Re: [PATCH RFC v6 02/26] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: S2RF4PAAHEJUN5E3BD3LCXDNPK4IGPHD
X-Message-ID-Hash: S2RF4PAAHEJUN5E3BD3LCXDNPK4IGPHD
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S2RF4PAAHEJUN5E3BD3LCXDNPK4IGPHD/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzafj_-L+ia8q=tL5DBWZU9PdSq9vaCAD7ituoMR+CaQg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 6 Feb 2026 at 11:04, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 3:55 PM, Dave Airlie wrote:
> > On Wed, 21 Jan 2026 at 06:44, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >>
> >> Move the DRM buddy allocator one level up so that it can be used by GPU
> >> drivers (example, nova-core) that have usecases other than DRM (such as
> >> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> >> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >>
> >> The commit cannot be split due to bisectability, however no functional
> >> change is intended. Verified by running K-UNIT tests and build tested
> >> various configurations.
> >>
> >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >
> > I suggested this and think it's a good idea.
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> Thanks, Dave!

I'm going to apply this to drm-misc-next today but I'll move some of it around.

Dave.
