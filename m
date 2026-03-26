Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAA010A88DF
	for <nouveau@archiver.kernel.org>; Thu, 26 Mar 2026 15:37:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15B10EB00;
	Thu, 26 Mar 2026 15:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HpGWOe95";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9BAE45309;
	Thu, 26 Mar 2026 15:26:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774538775;
 b=dYls0cSB6hr/rH0BEOSrCOyUaCygFZB8BJLD2krTBUaMqpXunX7rU0Rh/VOt7wrHzEWxE
 suYpadz+JqJBjd61rEhhZfEpEQlTP+wPm18JItvKtRHx0wzWeyKDrkJuF8luia9dFbEP4Vk
 TlNWpQgOjIMDQ4Pi4ydSRPyNpo5EN6MTwOxr23Kb30uub5Ltsr0sZWbwrFGMxuLdcHJaAB5
 /5G0tF2cYMJ3LmjdTal9d4STzS0fp3yydQyvQulXbm2AUgQ/uLuGt89nfPhXWmT5H7tGV3J
 rhhEdH6s3KxifIrvsICMK3NIUvaIRrFNAiCh+yS3qaSmCUmSMMf6wla7vheg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774538775; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
 b=WXqMN+NGZoAn4aqtR5TMpBy186YO0JCnY5IFwkh+0EhsscH6fBaO7PlK0/3kW7mROIdRj
 E11nWPzZlIJroBAxXUKP/ztue5EY+HFRC9nbph1d6NJgFynH7b7JvTka8zE5qQCMWlxiBAA
 iiTGSR7RMmdE3EUb50KbxO4Nw7LFg5qBEDueQ5i9m8TejMmNo3yTW9yV+N2zAYAFtppaBPM
 EM3QpuaYZJsc/Imxo//gNEXn/OPW8P8Gfpzt640X6QlfblDDWxFtMmVvfNF1+X8bNJaUWrj
 b/I1U3laI/YH437zz3CMr3Uoaj3omqRUhjkW3heaXDYDIFZgCEhoe5NsYqkg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 601EE41DBC
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 15:26:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0CB10EAEB
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 15:37:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43b983bb07eso349430f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 26 Mar 2026 08:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774539441; cv=none;
        d=google.com; s=arc-20240605;
        b=M75GiQ11I/3oyJ0X+zxflBCrY+t2g4IQ0lZzsXjtJn5d+itYVQt9LzgoYeHjYSN9Dl
         PwuRZGM2hjPsuRuqffQHWRrlGYQs4aJB8/4MUaQRJGFnYFtzKwN/aFswrR7BKnvRzI6r
         l9ElN4OC1TECUytlscScET1h428zzI+VkCkuNmeOIngZ3tOLFjywOTxssjWKsux3MlpA
         NXQCeT0EclXr6Y0XB6J+SglzxkucztY2+lAV/hQ4dkwR8GrqS+tj7xZBowNZYj7Re9fu
         onAeCCUPX/DqXaiyjMOxw6z+fhLc/0KAJ5U0IaIM/FrXKaqtZQyHBXesKPZktzZQtvz4
         ulTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        fh=bRL5+breO/VCdnS6jO4rPpCcr6gVl96fXohYfT1+W3g=;
        b=PLh0Y6fdnGyk/sOM7JqfSGmpsE36bU4XtkOTiwdB2Qrk20LUgvsYTWuIMtThrtabin
         b7dmGe3Y5qLFHgA10M6SGIf+NlcVR8G2hCaoY2uTRJfvtl43BqDSydQg56pktKHoJCwI
         Z80urNohkjqap60e+s+hemXvACXnclKyxxY0IhgQ4+WgOELt0hf4gbc1SvG4oROF14WC
         EWBHQquUhTlAlqfvFE+r6B72aGfSjbZfiMprLRsHwI07Exaum9g4Hb63WZK6FpKUjHu+
         UjIDSrGazBHPtb7GB2/7/X2IhnhGQYUDK6hcURfyzN93ZBwjdcrEHCy7iH/dcZvaUhpQ
         t/Ag==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774539441; x=1775144241;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=HpGWOe95kvp9fzJQIpJGcIVVZclgXEYto1fT2z/N7YYKPuA803zzGtc14Qy93J4Nz+
         b66/2Tdy45FxVn2cO4SiuE6+TwvAIYfLs1hdDIcRAy9ib7FHsyXdpyfp0Nv90lZFxeza
         65bBL2oYS0kfwZpJHfSccS9498oJY3vfju57tIpuG5MjNR9UDx3j7IUGAM0NjckMI6z+
         hr/VV8H3OKFkT2cqY72YJH6Z4Hj1fr89f5xxYahV4Il6xtXAd9nmBm6QMoDHHrCYrGQU
         wSpmLdKyPF1mRHKQ/4pSEFfGKoUEjiyi1JL6aicFWQO5bqtAcD4mE5BZYGBOvXrnGxE/
         RQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539441; x=1775144241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWeLPeCEOISYEMuHk4klgF1pcPKiVi4mEhvhikoMf4E=;
        b=EyCADxuBkMt/bk5Kko9bjmdlQN7DGURicKrR/YyLPtLBqjr8OynUoyAPKkQDkZL6ZU
         OQ+N0Rl29xL2SspFSnplGghklQhjfhNGxmd13cONV+v+i9lQ/sUUOQGK6rP0d1UZ7brZ
         6T4IsOw+/7y4RE8op3GlG1nRIfwCkSLZSQ+V1+SPPWdknCoxZiiBjdDAd0Amlp6yw8Zs
         vQMGgWTnoXyhQdGf0a5czxuY52waj9oYHWxXq9+Z9ABq2OTaPMqFA7bgvIdREOUN0r79
         f//UjbBt9yoWMPh1R16hV99uNNnsAaTfrUuF2t9/xlGIN3xMqq6FHak6gCMiIq4yXbsc
         wRaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFqQh/Y1DOlEd13Eb7OdWflz6fkQKxzG2N6ym9Xt1+ZmaXW/9SHKjp65+PYbq8wsv/AKb2+6cI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbEMHizr/jKqTkMZLwTlsogyegdgbaav7Sb55NCBVrvhgo8a7Z
	b+zmrQdBWvwsoG7q+FbMqS19yi+467J7U4cJLA1d1jM1ngbbZqdnO4xxxq7JoaURavtii8FubKs
	LxAI5TDBvKo6ZCm37h+YseTLG0lH3GBoDr8GIgAGd
X-Gm-Gg: ATEYQzyZFXUeWP+kq5fJPcld3VGOAyVPo7+3LrBwEzXTOOY97+iUDDzF1LVdBrQB0po
	tjY4vxBQKtmzSfgBzN0ugW3hYFtXKzQgB0cJt+gpboikxaAy/R/y8ZiDkKC026DJsi1eOzXwN2w
	Ul/jolMkgdbxYJ87Mv3sPi/02W16iT+oF0tB3jdg2w9OD6b7dI5y2ZBEJwsWtFQ1FSPCEUJTaLu
	unFZ649BtrMDa+LzUp9l+vhboC0lqXgzq7PBXyJs+QYSeAbcuZXRDxO/aJSGCNYwnEKMY6bkpbb
	SX7/CgV6LMsAkx0hhA9nbr3Sh9vdNdPF2D4r7A==
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id
 ffacd0b85a97d-43b88a25a22mr12525617f8f.45.1774539440336; Thu, 26 Mar 2026
 08:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com>
 <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Mar 2026 16:37:08 +0100
X-Gm-Features: AQROBzAWo8AoJkaNLNO9mq7x8n-1T_o4Q7aKPSl79urjgisqLmie7CjKUZkc8tM
Message-ID: 
 <CAH5fLgifLd5sYQMjXs-154KTJbDcEuy3VE1LY+9YvfNMBWzHbA@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GAIY6KJ3TLGTIOXPHWGZ2JFBO4CJHE2J
X-Message-ID-Hash: GAIY6KJ3TLGTIOXPHWGZ2JFBO4CJHE2J
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GAIY6KJ3TLGTIOXPHWGZ2JFBO4CJHE2J/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLgifLd5sYQMjXs-154KTJbDcEuy3VE1LY+9YvfNMBWzHbA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
>
> Applied to drm-rust-next, thanks!
>
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
>
> I was about to pick this one up as well, but did run into quite some buil=
d
> errors and warnings. I fixed them all up, but I consider this too excessi=
ve to
> actually apply the patch. This is the changelog I came up with:
>
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects =
it,
>         it becomes =3Dm. The Rust kernel crate and its C helpers are alwa=
ys
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
>
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need =
it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
>
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused=
))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
>
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
>
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason =3D "Safe since Rust 1.82.0")].
>
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
>
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
>
>         - Danilo ]
>
> Please always consider [1] and [2].
>
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committe=
r-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
>
> (@Deborah: I assume you were testing this with Tyr built-in?)
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

It looks okay to me.

Alice
