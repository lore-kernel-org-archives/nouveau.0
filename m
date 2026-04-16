Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3873F8808E
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 07:07:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2AE510E81E;
	Thu, 16 Apr 2026 07:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="l8e4mmMZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E7E9C45850;
	Thu, 16 Apr 2026 06:55:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776322512;
 b=JJmdLZAHB0eHSdQ4KBMP6mJCu62X4o/e/QIWzgaVAMUTZImFetCHK4jyat4gzC0/bHKiY
 WbDGzDKo8XuC9MZ9YJ69TZTVlIykW/TqBGG82QN8lE8Ny0giS1tmv/KFSDSq7H9ARAK5i/4
 eIs0fztI6ZBux80C4XuMylT9nTSRqDcsJhlUWxtxUN1WOg2RqcLih9rByMrcZO7IoImYQBt
 yR+Rp3Uywh+//QKwfFv17UxN8vVwoxaD0RXOMcpmSq5AI6uXDRwTuO7FyOVo1fKjyBseWsQ
 0OBiSMCNuHEYnVuoYj/hWZb81408wSmSbhDMi2oqXxWYj5kx5/NX27Ri8/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776322512; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LaOBwnvL+3ZiQiKDgJF56Y+WbgUuOyAOdvpqNZ0KUjw=;
 b=ChmSmD4HwcvxRyrYmE8ohj2yYipxpfrzeXnNTNS7dHR2nSb1R2kvOxoV7kTOaZY3qjjsU
 MCJRYWKpCAkecB/i/MlxZwx6zlbBnc9ARA91yt6HlN+ea74Decru3DY+YshCbDJ8d2M/pnC
 l1KnQ3ybccG1XtUaIVTkVrz6TDfzlMEX5Er+i7SAKpsRWIH3j4JI8FiHUEVgcQBoKGTTiKI
 fCbnqrpCjf3zVmASuAXv/+KbGqkvZfSFoe9siGcoPAc2kYlknZY/O1kV5VZh+6gh1+Rd8o2
 JhCpI6JmN73u/V4xN/LiuD971VR7EfObACrwmgzNn0Lpm8VY8siYlPwq9Tjw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C7566405FF
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 06:55:10 +0000 (UTC)
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A150F10E816
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:07:05 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-43d02fa5860so6862964f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323224; x=1776928024;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LaOBwnvL+3ZiQiKDgJF56Y+WbgUuOyAOdvpqNZ0KUjw=;
        b=l8e4mmMZ5AlmxlsQx2djcFYksVm3JXd/macMVKZqMdXZk7oR+OXJ18Tt8IGnubNo7Y
         OsLTW5ol4CwtCYsymnbCKmu6bL/1Ng6KzddXsh0TWa9moxifQnEaBpN3EjzyprnO/wut
         3wH+ly4b/vGJu9Nomb6ewCruY7H8q2jail902XGi7V8hdBfQ6v1kUWXqPnbX1tiFGN97
         WP9rSwp7ozliUtzkLbrc4KSQ7m84w+ydDqeWsBc0IeH7ncmoI//gm0ps/sAG1WeHcNb6
         6mi/6u5kN+h0DsgB8eUvYnM/b3BeACqGHKQTbJcXUa5qjSWfaSEqrr/VJFyY0jJdZJvM
         Pmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323224; x=1776928024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LaOBwnvL+3ZiQiKDgJF56Y+WbgUuOyAOdvpqNZ0KUjw=;
        b=cehJOyV2cLaYtMIWB/H4oOxUoD644jB17PdUsjwnYkQcviObEMb/+aA2DMTGLGS6IC
         xE0ivbCDmLeMlpG8cjkWIV5jpyTdaMiDgTtZoA9xnaUoVeANBoiBLoFj33noH8pR4+Pg
         jV4NIMu3YtucV4Hd5LpItwYv7OH6UzyrxlWBdMwXRoVEh23SH4uKQ7dY/O/EaJSCtMvp
         uaLAwhQe2/yox5WO/Fg750I+SvmoEs+5gPYE+Sv3knxBMtvWdMb2SJ2oeKx5XE5KQsIn
         yRdor5s1rra7PgR5dIvlq8XnmG1Z4rljG67rLdUj8vaGyRql83ocnB17QinwEwPhRQS2
         MONg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8H+lTz2UDS4werKiSFezXT2Tpa4a/h2ysGMv2NI1szPqkshm/oJ0k7pnxkp3f/6EbPhkMv7UMd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU6jz69neJGqRa95zqpKTUJizpJNxUiBtY0YT2F/IwvYcptYsM
	hP+7zpOCervOOI8q+TG2uze8BRr9dQrxoe0pnI1lOMxNQb5EdQtsWVy0K99SpyUQ7y5MfOR0Tdg
	y/xAbSHKizJ1QCHLWZw==
X-Received: from wrbdl17.prod.google.com ([2002:a05:6000:b91:b0:43d:505:35b0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2888:b0:43d:73d4:b27 with SMTP id
 ffacd0b85a97d-43d73d40fb6mr24546466f8f.32.1776323223526;
 Thu, 16 Apr 2026 00:07:03 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:07:02 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
Message-ID: <aeCKlut-88SbNsyW@google.com>
Subject: Re: [PATCH 1/5] rust: ptr: add panicking index projection variant
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 6KVTYROZEWIJXSKSQYDHLWRXYJRKK3RP
X-Message-ID-Hash: 6KVTYROZEWIJXSKSQYDHLWRXYJRKK3RP
X-MailFrom: 
 3l4rgaQkKB4Qitqkmz6ptowwotm.kwuvw23mi2tq010.nzmmlm0s1wx.wzo@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6KVTYROZEWIJXSKSQYDHLWRXYJRKK3RP/>
Archived-At: <https://lore.freedesktop.org/aeCKlut-88SbNsyW@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 08:57:12PM +0100, Gary Guo wrote:
> There have been a few cases where the programmer knows that the indices are
> in bounds but compiler cannot deduce that. This is also
> compiler-version-dependent, so using build indexing here can be
> problematic. On the other hand, it is also not ideal to use the fallible
> variant, as it adds error handling path that is never hit.
> 
> Add a new panicking index projection for this scenario. Like all panicking
> operations, this should be used carefully only in cases where the user
> knows the index is going to be in bounds, and panicking would indicate
> something is catastrophically wrong.
> 
> To signify this, require users to explicitly denote the type of index being
> used. The existing two types of index projections also gain the keyworded
> version, which will be the recommended way going forward.
> 
> The keyworded syntax also paves the way of perhaps adding more flavors in
> the future, e.g. `unsafe` index projection. However, unless the code is
> extremely performance sensitive and bounds checking cannot be tolerated,
> panicking variant is safer and should be preferred, so it will be left to
> future when demand arises.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

>      /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
>      #[inline(always)]
> -    fn index(self, slice: *mut T) -> *mut Self::Output {
> +    fn build_index(self, slice: *mut T) -> *mut Self::Output {
>          Self::get(self, slice).unwrap_or_else(|| build_error!())
>      }

This is pre-existing issue but IMO this should use match instead of
unwrap_or_else() to avoid potential inlining issues.

> @@ -208,9 +251,12 @@ unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
>  /// `kernel::ptr::project!(mut ptr, projection)`. By default, a const pointer is created.
>  ///
>  /// `ptr::project!` macro can perform both fallible indexing and build-time checked indexing.
> -/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
> -/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
> -/// `OutOfBound` error is raised via `?` if the index is out of bounds.
> +/// The syntax is of form `[<flavor> index]` where `flavor` indicates the way of handling index
> +/// out-of-bound errors.

Missing colon.

Alice
