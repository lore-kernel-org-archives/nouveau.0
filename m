Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12748106ACDD
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:16:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D516810EA94;
	Thu, 12 Mar 2026 19:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I70LgRYw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6D2F0450DC;
	Thu, 12 Mar 2026 19:05:38 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773342338;
 b=U7EflTRvb2sRG+XoB+Bwu4Q+RTZv8rcg9R6dN6DSKCfV9AsOzRIiz+TQMZFCgf/L7d/ix
 LIRVYUx6qUij5z7wYtygpxPFd1tVttVTCaEQFygQAnKpNSydOb4+wBsRHAXGvGeemiJluRP
 LHPBbTwsgAtejsYezi/xFriGuHqVJeY5VIGjYZ4qi5klpLcO1a8VO7p++qtBwOR+HGOZox1
 gsQw044jk5ldtFS7WygKQ2KPs63yrRfDyO5Ej58ofg31qw8xW9FtNpHXjfB5mFo+G1sVcc2
 G2SOTRmXlZKSDcjQTEKGMz3Y2bF4+ZgZy0cFmLnUFgsOdOU8S9YiouH1rwLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773342338; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
 b=GwC4GLQmifk1ZfZ+lkBQ9G+u+rZH98MpjXBUHFwsW9TMOk8vHTbNKG+Q8uk3a1x6KGQAV
 yqognaGK0z8MKZSFUkR6FlecfWZ5BNN4JFSMzYPsaqHyDGHjn1/l9kmWPeicxuIg3l3K/2T
 4GM16J77JWl2mJlK3xWVWFNTNVlfHxHA9hoJp7TQlNvUgRZ4aFoAxXDSc9En79f83s54XFV
 Mn2GsqYo4w9/PK/uXqkEh4bS6aqSv8hSHzIscvT0OEupq4G8JsUxxPoJ+BXYFJcaT2PDV04
 hisc0ao7JHkaPm+AYfDsN2No/tjMQjYv8x+iOrRVDBbYfJ8dE8i10KMoLNiQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 93ED245021
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:05:35 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC08610EA8F
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:16:13 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-128bae6a35aso94078c88.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 12:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342973; cv=none;
        d=google.com; s=arc-20240605;
        b=j8gNqkOCHx3oPEOKi/1r89zNU5KsngmSE1WYOO+hQ21pFAaBqXglmkL8Iy6c4vJdhB
         5zmY201SwKS1PqQZLvgG5aHTfDbH8D8xIE0fWLhezoiTKdFDRfX+OtV3gkj8Eo+iIFTd
         cst+/FYS9iqurqk6R6JFyqPmBe1ZYS1CmdelfLDdvKDD4+5xdbrOTRtbqqb7qnaHZs2l
         Pb6vKRWt4AVAVYruhDKwUWtEdDN4vFGbj32X7aa3/7+o2ZKdvA4UZlpAotMenzQXbnIU
         H7uVsL9phmoBK9XVbwoW7k1ghvozvp8pBoDzjPPu53q2MuJvz1rcXCYtzoyYon6xO4Vw
         1d0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        fh=mUPe95+pWYuZYKEOyxmN6Cz1CB3io0iXNTaneiLpXb8=;
        b=grJXP0j2fCxzR8jOysVDp7sKwHWquvWqM/XyhtF6cJ8G2Gd6lrAiC60jqSmMRcAic5
         1Mnx1d1+z+Jr6bn5ss8qdWNEHrT33UnSmNhkbesh/FBFFIhORQFiTBb6UNNVcknn4d1A
         D8mBmKOhfPA8pTCf5HxbEZIppOLFGKMSlWd8KV8oV6SDzcNZ3wWEwH1IZbO8nef2Ghqp
         6vF1qd0HDK8Rau/Ci7Dh8q76XxzaEWnnobBkyuHRcg5jAZlV0od4Mg3zOiqFF1nFo7OR
         sgx85UtueDtqF+JdtdwSWzjcxdn4jBBguPsP/IOPB0Uzlbpv1+TVOCsAH8mCCaXTUbV7
         CZrw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342973; x=1773947773;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=I70LgRYwmb1Kf3TSnl+ArSLtzExyTBoa7dl04aKCHbpIOVlt0pkM+kTuMC22F9ryVp
         jUv01TLfI+UOeUVX6Sjz3kZS8LJyXET8ksAMjQMZzMqR2UNwz/RhUR0Dh0iVLA9TJZHL
         QXDsAXdQJiSbkyV3ypZv6uYxCyR1eCY+nrb6KQRwRLstb0XzDVTra1OJoA7lxpmr4sXI
         kaiXA9abzkmSNzENEsVuZBIyKPxgfqceCeSC5GzkFLFj33Ut8QJ5agezs64BnIL5WFv+
         4K0QJleWgs+yILD46TlDsM4JTXcyiLlouPXq9bhfJihv+HoQC5so3WutGFCQ5CAn3ICC
         Xoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342973; x=1773947773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=TFD5T4UB/py0Gd3lwh09ZV4U4Mz7xJp2fjFgLLYoADZVpiOWsyZ/hVLfgKo5ulo5Ek
         L30YZSR+bNHikoJdeYmJo4ERaUdepV7JacTQs8oMpuP59NBqLtRXvdzob9R7RwY9wndl
         w6dtYowWrgqQu4bXcQKFKkgvWFnPT1twfGN2RDp1h2fWaiC2fjQLCtqGWmAMxgHs1j+U
         W1K7COoTr3kJ0xsU1+q4r9sdls7SayyneKCP8JOi2PX/mVJb8QXY8ESTCMHHKvNQW3ll
         rXylA7R6ERxYQQ5YyBtgrsh+Q6NLnOIDa91I1Cr9kaiFoTkYI3/gCmSEFFHCAoh6lnLE
         h4hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+9kBrJwbFapx8JBUHxMT+V0CEB8SD837b/HHUdS6lLSjV/146L02fPss5VaQ1mkyWKY+amEYz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9bQD1oji/zzcbmoEGr1b7/3CXWTQ2LyXIms+CyiW7UB7uv+TX
	8U9UJBnVBewmupZoNRgYdp9AjCC2zCuO6w5DeuWaYCOAYVaS6XZ/GMrutXlljyMf1t62Bwrxjc/
	DNp+wcxDRgLRcNg+/d92pjzrSLSWQyoo=
X-Gm-Gg: ATEYQzxyYUJLXFkSGMbFEs0rTPtN24dm75CgYsQdt7ihDVxRi/inh8OP7fd26GLbbzC
	njl/nt1kShHk35eAgzeMizW4PsonAZIKlZU6iXuVfJrfM4VDZiiTrQ9cSv04rSdBsnWy7pdegvP
	yG+8r4UjtV/hfpBXn9GoxtxOM/cGv0GnSCAnE2pzGCKaOumiA9LBsOMBGLrHNVmcTPYb61v0uqB
	iyyOxZpJTnQ6Cqb28faFyxDsWWjS57Az5l61cMR9aMc4NsHVTp/sZTorltAY7hEObsGihQUZbQ2
	+rUrEiJaLVzpJHoFbfFxGlMrR9jyOoShWf9TcBnzwnYGonWNhjPt2+dELknbUztnEhjcJTpScWf
	rHy1tK8q9rPAgxNmUUw8Cot8=
X-Received: by 2002:a05:7300:fd03:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2bea5744a60mr186533eec.7.1773342973060; Thu, 12 Mar 2026
 12:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:16:00 +0100
X-Gm-Features: AaiRm537cVQtFBzSwOEaMgXdjzYeE0uMIzdX3f2cfwXX8kFS15LK67mGvYzfQo0
Message-ID: 
 <CANiq72m2Eo1UAuwMC0LhiD4+yqKixRm=+oHtEnpwY-VbNdR+fw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 43I5F65FRZFWDBCNYZXELLILEFG4EALN
X-Message-ID-Hash: 43I5F65FRZFWDBCNYZXELLILEFG4EALN
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/43I5F65FRZFWDBCNYZXELLILEFG4EALN/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72m2Eo1UAuwMC0LhiD4+yqKixRm=+oHtEnpwY-VbNdR+fw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.

`head`

> +//! // Rust wrapper for the C struct.

Empty newline comment between these:

  //! //

Actually, should this be `//! ///`?

> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //

Let's try to use the usual style, i.e. no empty newline at the end of
docs for an item.

And the example should be in a proper code block with a C tag, so all
together something like:

    //! /// Rust wrapper for the C struct.
    //! ///
    //! /// The list item struct in this example is defined in C code as:
    //! ///
    //! /// ```c
    //! /// struct SampleItemC {
    //! ///     int value;
    //! ///     struct list_head link;
    //! /// };
    //! /// ```

> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].

No need for intra-doc links in comments (for now at least).

> +//! // Create typed [`CList`] from sentinel head.

Empty newline comment.

> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` wi=
th

`head`

However, this is giving me a Clippy issue (please see the other email).

> +///   `next`/`prev` pointers are valid and non-NULL.

We started using `NULL` recently as a convention for the null pointer.

> +        // - [`CListHead`] has same layout as `list_head`.

Intra-doc link not needed.

> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.

`'a`

> +        // SAFETY: self.as_raw() is valid per type invariants.

`self.as_raw()`

> +/// perform conversion of returned [`CListHead`] to an item (using `cont=
ainer_of` macro or similar).

Intra-doc link to `container_of`?

> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tran=
sparent).

Intra-doc link not needed.

> +        // Convert to item using OFFSET.

`OFFSET`

Newline comment after this one.

> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.

[`CList`]

> +///   pointing to a list that is not concurrently modified for the lifet=
ime of the `CList`.

[`CList`]

> +/// Refer to the examples in this module's documentation.

Perhaps we could have an intra-doc link here to the module.

> +        // Compile-time check that field path is a list_head.

`list_head`

Cheers,
Miguel
