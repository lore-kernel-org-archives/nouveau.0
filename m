Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4CBCD4F54
	for <nouveau@archiver.kernel.org>; Wed, 27 May 2026 12:16:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8810E7AE;
	Wed, 27 May 2026 12:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="B7/oJzEa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0F1C846492;
	Wed, 27 May 2026 12:03:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779883383;
 b=E74XHD4sTpRYAzVaIVmgeYYkJsyPpq+Wvo0Q1opclVwW3mK3H1oy17dZ0QbPu6kh2XrMu
 uN74YafDN0RikKbzdLcJSJdlNA8G1kPIVxhb2l3B6QtPqgeJI+rv8Vs06qOfKMMBekZkl7j
 B39roeBzDAwvGIyWT/sK2OWcZzXXm4M5U/OuoIg6xepWHKfaACicAZBYx5mixJAycS1heoW
 2Nq+xSzZBett0q8Fqinc7c0FQkco5vBfRK+wOXsrUqREqhE6ElC0FYGqZxSggjZMvbzfn9i
 q293mtXxk2hfpGY2rJ/G7cMBM7fgzjiBOs8Wp4a7R8y/GMqfSsz4q6Sz9Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779883383; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
 b=IJRf5hmtZ+bNNbXqD2tnF6jQU6SUE6sHwnycUPknIEXLEO5cUZZts76B7zR2fhV+U7vYC
 KBynSGUf2ZQQ6SROeZd1BGFgZYbIcDuhCdS/v3ipNEAmRqDa6xl3eJqV8Id0HM1lf/YLlyy
 R+3mNYRnkNljcZwd6+/tm9d7c9qtyO1uiE5L/SNP80xHokfOhc3s4gmA2uQTFNkNTJvzTnq
 4F0pOH/D9qBtg7OBv5u8wtwoZkVTH7Zu72OMj71gd+enDeWWqQlAUH2hN1UhSSsmoFmv/ML
 Es+0Fzswh3VwHOiaJ+BV2+DGYHi128J2cqgPURZLZjA7Uy15fA219ExvFCHw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 76185462C2
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 12:03:00 +0000 (UTC)
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com
 [209.85.208.202])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A863410E7AC
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 12:16:26 +0000 (UTC)
Received: by mail-lj1-f202.google.com with SMTP id
 38308e7fff4ca-3945aa4b39bso59216991fa.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 27 May 2026 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779884185; x=1780488985;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=B7/oJzEar2T6mEt6lwclf9dK1ECEPsOWfVQDOhGjS5coyL7wAXkC+Bas2zK+x7DYZX
         kGLFYzfM2HVwXor/zTt/Td0WkRlhQFQONlZu5NUobLWkuDmgEoziDzgZIjDMlC9WK9P+
         CzsXeHzwMCg7IFGQ1gHFPDMTEOfh2af9hhWhZ70LcuR4lh+rveR5NW9XeDsCB5ro6iD5
         wqR2BKmfSTRhFK4BxL20uyOLAmdqlZkbuoJd/xnvyLSJl0j6Tbw5yIO8XCnEI+PHOZuK
         iJF+OhJS2amFyx0dRLrquRs3QORdOb1w6kiXzUrQnFj5EjV5LRSZxFq51JSsNjljIH2f
         zAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884185; x=1780488985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GySeGqKvH9w0k+SKK+eNFV995XnhG9D+usTEWb/rPg=;
        b=tFB/C2GrA6C2Uw2B1kqugukMYVpXE26dsTkSQ0ePK7BpZJXDM2gju59bQ7r3HeFuVU
         DNKMxIQPJik/Q99QrdeXSImL7+HY+0scNjCk7i4fC4xxSPBrCqJXygGjjgRDKRKi+60K
         Cu9GtmlJLUm/uARozFLAFQgvbIHyyF42XQokavixBwtJ4jBbjcs1mae80ztwkYZsmFQ5
         eJgQC2S7uNpLx7HQVf7d9c5a43EgINH02OpGA4hao76+OglWwJlEu+/P5GE3w2Rovn28
         EiCZRgP9k8R2oE0whp/KOdgp4RqvcJTvSLDIBp95onwXBuQs7uHzlbSnBJOkvF+7Y8OS
         y0wg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ihmONsgMfuArZFl+EdgQu7ClfDtldfB+I4pC4ObZjkOCiswyTQESGsYqJvCjQQlmLLr/+d2fm@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9RNOE3HCZnpcBmuYHcIUFd1hZF2tmXGhmR+zdWN9axCS25Xf4
	UKK3r9i/jgsqbyoVtrLgeXfnCCVG9yq/2uz2D/U/+VobhQ1TE1W+Z6dFEAQbkHqSfbJcjMDctgx
	SEB8dLFOYAtrRaVYz8w==
X-Received: from ljey13.prod.google.com ([2002:a2e:bb8d:0:b0:393:7fb2:6b5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:651c:907:b0:396:c3c:d27e with SMTP id
 38308e7fff4ca-3960c3cd3femr45362351fa.12.1779884184566;
 Wed, 27 May 2026 05:16:24 -0700 (PDT)
Date: Wed, 27 May 2026 12:16:23 +0000
In-Reply-To: <20260526212857.1158294-6-lyude@redhat.com>
Mime-Version: 1.0
References: <20260526212857.1158294-1-lyude@redhat.com>
 <20260526212857.1158294-6-lyude@redhat.com>
Message-ID: <ahbglxo5yePyjE81@google.com>
Subject: Re: [PATCH v14 5/6] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: DYIMVFKB32I76BZQOB3WYLAH6YGUH3VP
X-Message-ID-Hash: DYIMVFKB32I76BZQOB3WYLAH6YGUH3VP
X-MailFrom: 
 3mOAWagkKBw0nyvpr4Buyt11tyr.p1z0178rn7yv565.s4rrqr5x612.14t@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DYIMVFKB32I76BZQOB3WYLAH6YGUH3VP/>
Archived-At: <https://lore.freedesktop.org/ahbglxo5yePyjE81@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, May 26, 2026 at 05:28:56PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Missing SoB for Alexandre.

> ---
>  rust/kernel/drm/gem/shmem.rs | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 116ed0a13eac2..1b24cb1129a8b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -27,7 +27,10 @@
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -233,3 +236,29 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

Is this missing a NotThreadSafe, or is it safe to unlock on a different
thread than where it was locked?

> +impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    #[expect(unused)]
> +    fn new(obj: &'a Object<T>) -> Self {
> +        // SAFETY: This lock is initialized throughout the lifetime of `object`.
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> +
> +        Self(obj)
> +    }
> +}
> +
> +impl<'a, T: DriverObject> Drop for DmaResvGuard<'a, T> {
> +    #[inline(always)]
> +    fn drop(&mut self) {
> +        // SAFETY: We are releasing the lock grabbed during the creation of this object.
> +        unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
> +    }
> +}
> -- 
> 2.54.0
> 
