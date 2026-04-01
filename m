Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EA1076389
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 17:36:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88E10ECFA;
	Wed,  1 Apr 2026 17:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ffeo3cdA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6501B45471;
	Wed,  1 Apr 2026 17:25:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775064320;
 b=OYqQsfF+JUERkqZaJNDwV1FB1b5OFYzU+6ZD510fX4bNKzoWemHfBXzW9ugj9F8ncyw7q
 vrF3b0E2Eo72VLIndRC2k2MF5aBZ/4vyX9SYJAdZNUkEbGKRV22HU/VRVYdu3IEdJcyqg3g
 3bv34d4dYfHqC8hATrETA89q2oDD1LdGOzRjZE4uAhMXN+msOjITMxam+TAwx5H1XFC+mi0
 y+5DwzGcYdXS72aMS27sgFRJVA0R6gei/LhUmOrgvM3ZasTbmHHdTSWdEHhEerEkzmEBJAc
 7H/qPMZFDyN0kbBPOrLNozZYxcm6kFr/Pld+5tufuQHlHNvO3wSqfO/76QYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775064320; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
 b=C400OmBdIqSSYdsliqy02BxVmIXLonZJz3W9sQO0wYjWnXXpojkJ7fY8lnmHmjywIFvFr
 A8yYkHdZZ0utB3Tdq3MwIiqOJzya3VP2O5wTIKLZho4PBkE6byPF4g20hnWle1znWl//Itj
 ipYa19Zpx+8APZykBSRGU3znuv3PNte3tqF2OkAVnv7EZZyHpPEDGaG/mHhcAnlmpCLTCzz
 kzyYGemQYRO0cLXt07pwc3sD9axdkXSd03MxPMyZCpNGFSbsgk/nHJ7V7YT5pzFeKNprf6P
 Efc+fk62LIEbbU9rWFO0qtc8MxrP7yoUDnUyGFNbdFQVDmYfsvq59LVt2mwQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 24BE64534A
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:25:17 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com
 [74.125.82.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F05410E7FD
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 17:36:39 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-127337e3870so2889c88.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=j8P+asf4HxjOR60Qw43ahPwLsEPE1TIm9v9IvqREIjl5kLHukCu3DH7Z8ucmss8kNU
         Ics+IBH6052cHTWQIlOnYrOu1hhXDkDp5V7qjSpeOfVcbK3EleOx2Qp6wiM+T0/EuOmh
         NR7tmdHAWrzRdlB+a3gQXuVYE5tvGg0KSEE1PyEcow7pDxmVOV5C1medrtKopnh4IIbx
         tTZIFl+NAA6BQ5jOX/sk2w/p3ur5eRXd1CuuTCVg4HXCT/CVYrkToKgUcIOqG0ywcUJl
         rUrNILIJztGTGTXES1YBXEXqkF1q0R8OzqtkeHZaS29gzf1dD5kHm5FOrdukGVEAp57N
         C3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=/hbenESgzwVLRdpL5v+li6+9lBwS/qYFWSa7ZRj2jf0=;
        b=UuVEnXf4Lwjhdi6ND/8SRnIyLuZ8AcP7EL4GE2d/hM81X1CDJ1FG391I3r6s8wL5zc
         k/0lgOT2bITplVW3YetwYVMiIMylPFDhAyABcYOzFQ2bk71xnNQhi4DDbZgEpzDvCnWQ
         L3LtQeA/GIm3qv+aoEFP9sgj8TjPlqln+JRoh9iRsQaTinjgzMgUKfoA0f8i488aG/p8
         tLDMNzYSywicnmzKDmbe5Ptek+ueJpbyEWqlGR7Jc29nbs5BWn9pimQfsue70DWZ1+Ua
         Qz0Xvdojk0EZNpGSVdlOIS2+EhjPh+xtLwQ+YcoN00Ibf+bA4/457qx8pg5MjRwmMnxn
         COvw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=ffeo3cdAsPx0AQnVdPUMGxjSjMFpsW8Qe9nlok5MNma0xS7koP4AZDSsDAaTiYMqQm
         HBP7PqOglC9COIXpnKBnk+JeNSY0duWiCaZwddNHaqeHVO27a3VTlZ4I9HGqMYbyjD6o
         igras4rVWBz1L8bZDQ9xnEgXH+DWKqpJsCl5D2VohsDqQGUcB8PP98cIzUaME+jfefYH
         t1h/exWS2ZNljqVI4mnlSlFntMEOxg6XkI3B93lLKUNJV5qs3P79BsniIx6cHfg5PzlQ
         SJ8Yn8KpMoiWVsAXXIDG/9U7WVH7SwyQxxQX6oPo2hAZKPGtK9lcPgwDRBLfXcN6KL1y
         /0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=PP8uTcp8vkdsRRuX7ZtO0IslJTQoo3AohtkogD6CuM3V21Ib4GJx143bNZyxwTvKmn
         uPsf1bASPDQRHySFhiWfdDIPEeb+oYf2M/HC6Sw54tvZJYi29DkM3eiI6FbcLYcNaxbc
         wHefKb9OVddyonRhpYsdujfNh9r3wpWDEhv+Tqs23fB5C7r7yuWF7ImsYRPRx2N1KbM/
         7iDdnZQky5kM9KeV0TurohlJtcF3jsH+4ygIfJ7Xy6JzWZWPGRGrQqFbtnDB4WbEtl5i
         2e3XZg++hIrZRbATC4oUWX8G2AvAbGfH6y8EsTaz5muKfKpj7cFhzeoErxY3OxeoWO44
         DhYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+bKS/X+dLE4tVGRJ3FieFmQuISHtzXEjcdpXRN4aCWBqxJbx5kSloThr6KrGtFLO+QU6HeV1r@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHIAqoz5fBXGokRwt5JzFjkkzH6BRe3tI8eKYub1uFZDe1QMqo
	157maq0vypGG4LUN62AJos2DeVX+Ly23vs4YEfhybLtXJJiob/P/Sae49SjoFYnwj/Kysqx1+dq
	62zZjpn7BtBxiXFxIlOZ8ybFekzCxhaU=
X-Gm-Gg: ATEYQzz9lAMWmJmkXLx4ArO+q7W1INrKAX2PPK6r+NkwN5n284AMYITw20eknrnnE4a
	vTXUUalItLj2D07P7x3iTkZIt/JVBMhbrHibp/T0w4IyM9cdCwNMrRJly/gI7b8DleKvPLGbNqQ
	XCX3XNW/AGFwx7I/7aXmBI9zGLY3D9m5TpJ+Z52VVSmSMmn2pheULleWXQ+b2TuLynSNWJ12PBX
	N/xvgGISTCTT9tgeqWDaLI4KdXRVAIPWL6lR7R995MdmijLewU77bgejo1T/TFn/QErJqk3zTsn
	plrZ+5k9U7DWcwmUqfn+HgwY01B14WgQ7iNJlbyrS3O1JVrXUKWjgVWSUXJWGmHPEC5GLTRBCst
	YSN8rAuQAqyPJXbJmEZRLq8g=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: 
 <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix`
 workaround
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AE3VZFMJEEBFK4Z4U6QKFL2K4LKCFOMI
X-Message-ID-Hash: AE3VZFMJEEBFK4Z4U6QKFL2K4LKCFOMI
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AE3VZFMJEEBFK4Z4U6QKFL2K4LKCFOMI/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel
