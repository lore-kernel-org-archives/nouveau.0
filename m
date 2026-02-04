Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADA2E8B391
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 03:55:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A57EF10E761;
	Wed,  4 Feb 2026 03:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIH1AelR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9EDEA41B4A;
	Wed,  4 Feb 2026 03:46:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770176764;
 b=KAI9tNhqA0wWjuIGGYyms1IqbAR34zI9LIkN7t8TNW3n4HYQrilcn+kv+q5UqwX27lb83
 Mh1lv8vWPcQDx+Ct2+CxvEsX8mJ7Vi2pFFUb7CITc1TW/RKJ+wUYQNaJUSRCeFD+cgnTbw6
 RBjow6SlrBt9e2VoHDPg/ESQY88o4wuTWAg2YVKoCNkMkejEvLBBbBCbJhyOYglI/x9oXSW
 gl7XKxGLUX/c4t6MHBJVqqD+hCFYD5WXzpCtK7zDxqiAwY2Gapj9AtBCBbCyzOEhzGasdCz
 6kvixPGLpJd2x6SmeciPx0qBAKqQvuAjyzlBaKQk8Nm5vPrfH8ZUUxnGLxdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770176764; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
 b=uRnAdpn1kZ+uFWHbAuPDXUCDFoVtUxmDmrsgCu9nsuUB6V1gM3JFGve4BD8IeJfhLr1xx
 2nifeRuz0r003fW7x1KSgPfv5wjmbFddB8kHGhWLYx8qQdzHztug0r20E7uQBqLQ1i52dKg
 z16HkPcwKPerExa9iJg4zf2rGPm5V/0YU4alGMHFgwDP8kmc8gv6vaJ7JTKtzWC3OaHshmW
 BwTKP47c8tQS0DvQQMXC4ZoOSeIMyfZWXs5hG7ESV5tbO/6NMK7TkHibfVJ7Qg+ekDdiZ3L
 SUxmnBPW1qlIq66wu2L5Bis99vrPxRH/cbREbSnkEIU+HGB7BCG0TJNjFaUA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D1A48415C6
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:46:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0CF10E700
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:55:18 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-894676e6863so74658166d6.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Feb 2026 19:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770177317; cv=none;
        d=google.com; s=arc-20240605;
        b=Pk0MXT8vWgCH9kP5797/16eNc4UZ+PBW+1FnqRYn+sGVYD4a7dO1bALp+Fqj6fAvj7
         kPt0VnmtktTzfLgNH6JImkihYDhw0UyAT1IjqtfZIiVzfuGeSP7COZ7ydPtiDQjNfj0p
         eUiu2GtCVXONAzSwk7AbB3R68Sz2Jgv6yOLHIwqLEeIcbzZUqbEieSYb54g6ws1bdavw
         4vhHzCC6I1u+akHkHBE4gPFVgh7s7sseK6VV7GKe+CjOJA4pTRBXlqKAl5fML9raG3r0
         4q7zCBiupY3oDaqT/j41hMP/JVvuATgAEbhUewAIezLvkimD92vIJAwM0nmox/mxqmL7
         c2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        fh=G4yqSiMmTKesWWXgI0JEAtpS+X6+RyUETrz/ttcgM1g=;
        b=XSz/QeKQgM0lTOdvP9ju9oZJ3HbHP0WMk+yMQN5MaVcKoRdOQJHroXzASzwOFMGusw
         ShSTzRMNU4U83WnXsO3Vi91SSGampoCZ5l1UarMEHcRHXrV3AvzoQbfMDSsCUIU1GNfU
         Q3eOip8Yu/cHh+qxpTq+5DQiCRf6g/eUcNdpSgtOXdkv6gdjxIvOx9OjeX4GbuLNG9Ak
         x/UxqSmeNBxtH8FzwbyvGGw/dkZEWhbDpZmYFeCskgXG4huvBy1M/94xfdPrwzNNMVTR
         5xbBtqZceGYmv1wnRFlIKpPORanw3nLIIitEXx+iry13o+6qvsaPMpM+dDn9SQieJZiA
         mpNw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177317; x=1770782117;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        b=OIH1AelRQuRLHF7yx4qnUmdl80k60rIk8cRXkjhEB9UqkppRYIyIpUAQDyIEugTGAA
         cmFOEXpK0EbcSNZ/yR3SMn2yqpKyIFywjwS/HLlf1TkwDRqImJ7wpXH85PZ16hyxv5yT
         2rdHw09P6I2MlWXjUALYkazq0EsflJEgZ2HFBq4ocNHfhFeMx8bY8LVfOgwG49fEYvue
         2Zxwsu9aUV4qgXxjloEqK8JOfhTP9ly7vzqu8HTOEtbRlzFEQ5VyMbL5jG9HcSsfE7Jk
         Syey57zYMCgxDz4FnPnwc0B6QjMqVe9icUrkRTMx4LimnyaqL56cRxqFXL06ug/uP+jt
         iXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177317; x=1770782117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        b=PFitTGRW9e+fONdRVmynprv66zEpGR9XO6LIhsHsOcoZjEChHxZCP6elhRZhTfqMbe
         4hwNz5WOPB5SM3GTs8lypqw80iQVuy+8gLMJSZLHnvsryt18gvQQttHzjImCwBG4WV7M
         qjJJEoMkBM2IxMbUw0sYLdjJaRQpDGYZMz4NogAJqaF3vT9iIHvXPvu5Pp565G7DmH8l
         ArZHoz7fvvR5DqBrKyeBcuz+o1CB3fh7mB1QQHiRZ0k8cPwMS3AtWMwTOulUzoxe8pYb
         Cay4IdFzR6Ys3kHP1a8p1JBMN5zjQdk3eAE7/z9RYbszGaE+eum1bM7+uxTTfHB9ngc2
         1GWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjxqRIdnwtoeoHf7RbMJnIgAjfsm+pCTeGnZchFDNM4+87gVI3afrck2eQYL13OrvZ+9l0E/1E@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5OajGQW9Fg/2KSMU6x6llLEJGbVNJczLXzMvv5GoaGF1ymfBs
	67TnJg+gTJ9oXPnVEY7jprmD2DfTgHXqVp9b+sIlR2AYPQTPv8Iu7U/Jq6dbZ52XwDG8UhwBd+L
	q93CyzDYjo1oWgCrum+DtvArOLlk9TMQ=
X-Gm-Gg: AZuq6aKYoftb838APfG6hpwZk0h3Zv+dFHzLhmr5+BL5VyvdcYvUE0vU8xeWs7NHrZ1
	gNDwRh3EsAPpuCA5AsBCbgrQ546sOj9+arwMAdy3sqNzCOGgth6Cb5aZdAv5M+7dRSx7LJqM28Y
	ioYaPgeKX6hjmwdDKEtLQdZJWZpqQ0SJBZGZoRIVESaebwCU5/xTmvlon47csN9giJrjWrmZzhT
	Y63/BBUBK6VKSDPvDmITtoZTdFqKQcdhAuP9XzFug88YQXuMS5eITeAmaWBCaHzJCTir+tIq8XQ
	HGYkgqsjsVS5PSlP8/OgFM1KPhnqxUoVqKzDIHD7eGQi/7oeYpGk5Kw=
X-Received: by 2002:a05:6214:1d29:b0:894:7eb9:ead2 with SMTP id
 6a1803df08f44-895221a66d7mr25922916d6.32.1770177317310; Tue, 03 Feb 2026
 19:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-4-joelagnelf@nvidia.com>
In-Reply-To: <20260120204303.3229303-4-joelagnelf@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Feb 2026 13:55:06 +1000
X-Gm-Features: AZwV_QgqNJTzw-ZqXx5fJP-IeYh6sbx0Oiz2PE2A1U4oPqZRrSE9m3Umv0I5kN4
Message-ID: 
 <CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 03/26] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: FRT4GJH7ZBYRUE7YGSNDQDTUTQP3G6YU
X-Message-ID-Hash: FRT4GJH7ZBYRUE7YGSNDQDTUTQP3G6YU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FRT4GJH7ZBYRUE7YGSNDQDTUTQP3G6YU/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> +///
> +/// These flags control the allocation behavior of the buddy allocator.
> +#[derive(Clone, Copy, Default, PartialEq, Eq)]
> +pub struct BuddyFlags(usize);
> +
> +impl BuddyFlags {
> +    /// Range-based allocation from start to end addresses.
> +    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
> +
> +    /// Allocate from top of address space downward.
> +    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
> +
> +    /// Allocate physically contiguous blocks.
> +    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
> +
> +    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
> +    /// done by the allocator, but by the caller before freeing old blocks.
> +    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
> +
> +    /// Disable trimming of partially used blocks.
> +    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
> +
> +    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
> +    /// indicates that the caller has already zeroed the memory.
> +    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
> +
> +    /// Create [`BuddyFlags`] from a raw value with validation.
> +    ///
> +    /// Use `|` operator to combine flags if needed, before calling this method.
> +    pub fn try_new(flags: usize) -> Result<Self> {
> +        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
> +        if flags > u32::MAX as usize {
> +            return Err(EINVAL);
> +        }
> +
> +        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
> +        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
> +        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self(flags))
> +    }
> +
> +    /// Get raw value of the flags.
> +    pub(crate) fn as_raw(self) -> usize {
> +        self.0
> +    }
> +}
> +
> +/// Parameters for creating a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyParams {
> +    /// Base offset in bytes where the managed memory region starts.
> +    /// Allocations will be offset by this value.
> +    pub base_offset_bytes: u64,
> +    /// Total physical memory size managed by the allocator in bytes.
> +    pub physical_memory_size_bytes: u64,
> +    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
> +    pub chunk_size_bytes: u64,
> +}
> +
> +/// Parameters for allocating blocks from a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyAllocParams {
> +    /// Start of allocation range in bytes. Use 0 for beginning.
> +    pub start_range_address: u64,
> +    /// End of allocation range in bytes. Use 0 for entire range.
> +    pub end_range_address: u64,
> +    /// Total size to allocate in bytes.
> +    pub size_bytes: u64,
> +    /// Minimum block size for fragmented allocations in bytes.
> +    pub min_block_size_bytes: u64,
> +    /// Buddy allocator behavior flags.
> +    pub buddy_flags: BuddyFlags,
> +}
> +

(not a full review)

Any reason these two need Clone, Copy? I'm not seeing a use case for
that, maybe we should pass them as non-mutable references, but I don't
think there is any point in passing them by value ever.

Dave.
