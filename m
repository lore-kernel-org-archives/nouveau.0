Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95723CD8C88
	for <nouveau@archiver.kernel.org>; Sun,  7 Jun 2026 14:50:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4953D10EA7F;
	Sun,  7 Jun 2026 14:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U0xqEVeU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0DA0946841;
	Sun,  7 Jun 2026 14:36:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780843012;
 b=LEiNMPUmwHc4CM9NKwDb5tdyMjw/hWrJjvjPOoHAhhM7+lXOULER2t0Wa3VpgcSnOnrbx
 feoqrCQ0Oz26kTzJxl/c4tcme1r4+t+BB7QVWPNUAQt+ssBHmyAikHG3kR4vnDMbvQwnNRJ
 qbWz3IBWXMLeQEiBKi/OTy/05qtA7eqQpXJRhSJr0FnPXkLp8bi3sYB0eHMKlvbJ913AREe
 BTjLv4zaF7GT6Kf1lJjA7wHaGzZNUiOZux+sLsNFynq5Z1VC5kKZjLv5UDEyMPDlodlMoaw
 DQDIkeNLWpe5gt7QXNx70wcF0NbHZVXCMtUd5iVaM50at7s3DM4UzAm2Uilw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780843012; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
 b=m6/EZ327RnowbJ9D+qmmn852C9xLHQlW3XDSP3h1+sL/L+swbAwDDTnLtWOebZ9xsW1yw
 NJVHQ1orYziDqUk2YichM5Nq2+98U6ZKX7KZ3fnxAy1Pruz8PXWVOojzCZiWo+4MKSbsRl/
 Jkx5yFP+cfuJka/QHyUtgLfhK9m1/sF8qNPgtMGMZCnizvAFReJXIkpghqMgZuBCuoZM1D4
 6XWaG1NExOhhgu2y9o8Vv0AS86IUJ0Dxzg+pAY44HOdNz8ihF9u3Ls2m1mE1mEadKsp14cK
 1nWrdEE/xb6+3QSRa9P3LU1nvVVeGxTuKJSgkS2YSUXbLxg7vGktHG32C2kw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F413246750
	for <nouveau@lists.freedesktop.org>; Sun,  7 Jun 2026 14:36:48 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1F10EA7B
	for <nouveau@lists.freedesktop.org>; Sun,  7 Jun 2026 14:50:39 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-304da3b4508so341735eec.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 07 Jun 2026 07:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780843839; cv=none;
        d=google.com; s=arc-20240605;
        b=gAVcPQQseTYxgD1NH3cHpx2mVEV5dhQO7l3PVlBcyNFh+9xEG1WSbPNg0l+6rJd/WM
         Klm8fquAwPJVo5D7R2R32qlq3KGkqHCKx5sZM76iDx+AX/sBO2ILAcwxCbR2AVabmKVn
         QHveUtDIKvJqWC1PTD9VPhtHyiwYdvTXhSKzocPW77+gWkRiPhLG/Fcx6WIBP54ug9VA
         TACZckF8oD/QxXWvBOojo+Ocvxb4z3P1iQ+gKK7pDAOD/7fFh0r/vXn6GhIhPERxqbBt
         WmCINgy8sjbQs7ZnrZKzJA0np/+Z64ajszvgQlNKHxWZ4xWBiSubLmaHYsUO1BdIeRCE
         cEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        fh=owErNPeROElWhqpGOnMZRPXGqcZ3HknbZ8uA193iSlc=;
        b=FNDhJwOrxr9mdCHyxOgMBLLDUJ7ZKtk7vGj47wiRsMUIoL1PTdiVs7a7z0xKPTTYWl
         cFPOQGbQQmkfUURehQwLdPG1S30fSrI2A9nVV30ajNVpvOoNBu2aLDN6/1W/R+P78mo3
         sjjAXnHMlzeJKvHf5mmvtV4tPEKY8vT3MYpGex5Mi/GbxObGu77vEZm0nfSQyhJpbdxt
         QffLnHDR0olBAf8faXOBYCX6IS5FkZu0RgHRVU2XY2gZzisOBhI0b8Yy1krLKMscjG4Q
         hK/mqB72VwtBNyBXyCzVxW20DbkQyATjMxi4BcL4FF7Mkei+HY+dRODXD/kRsuV4Bh0M
         jRLA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843839; x=1781448639;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=U0xqEVeUnlH1OXz/AKAGbQ8DLAPySFBexhdxsJZ03A5vO4i09XSzamIrttWTcYu9+3
         NPQ/BUpwQPdqNKXqgQpZOf89Oxo8sW/YN3SQUsvIj93+SyxkmM9Xr85/RSVHKQgG6sKp
         SUmEuG7QD3fDaZDzEPVRjVpDJS9/2VK5gycdTazhGAH2hJTcijT6aG17n6jyhQaewVuG
         2Vj8xNjxzJNmoeC4xeD8HjO7jvr89FklwdlEheuoU0R6e/jDnhzf8GG6goR5t3JIpBsa
         k2rIn34e1cr5SQLrxj1iwhwXqMubLiK/CEnu3kk9McJ0CM881YsM1jZ5dbE7REaswx05
         mcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843839; x=1781448639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=ENTFZrB6OsBkmP4kWCSV0KeZbVNWKFpUVstxE/OLs5Quhk++Mo146FQJ3t/fekhDVz
         9sHp7u89vFXoyPxullaSm9H3VLl0YWO1GXsg9jthN4G0D+hkCPCO8/tq55SyODlIFfNf
         HxRudj6F3v25/+t00z9wrcZwxO8Qx3B+V8A3UAwSzsoCfeWS/QEUmaL4+oC/CqRWL9bH
         8pXfg0Bn7W/P9/9YVKDrfDN4tOXMCoJ0u/v6hPipVDuYkv1acTSAZ9afxC0dpohcZxgF
         39KElJpJdlAmez/Sl/x7u7OVTnwndC2gjm5zcnuPhyPFpXo/OMZfu989DtvFuzbSVGln
         aRyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ80Nz12OWnmIPAbB97M7MzMLUuSP93RdyhZHd00fGbpxBDXsJMMMSbr2u+l43ali2W0h2vemZh3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygS+PZy2eP1KwyDc3D73OA+PH8zPeKHqHiCfgH/kIDIyY3L4yC
	D/4PS2FeAD+mBo+mp1LdQ8vg3oJ4mFnLH6tSgOEOwYCT7+ZWOPlHK/FaklB3a9MxmX0JfQ9D0Eb
	vA3lTcLNBWwatVKUMHp6ll6OJ3VXMpLM=
X-Gm-Gg: Acq92OHTTH7IDFyiAz+zIC3UkTtw5VkQrIKXx0btdOxlspVGWspWUVuq6PhVpYgm0yL
	PXgJLE7JOMBlljTfcxyGxut5vyGUij+EICmr/ut6LAcIDwBoCH5gyFRIjUioH+YagtgYAwtq2Dl
	LuEzFCsGBgfO5JlDj1zJFLc/tq9ILDJO3oUMGc4pl+H2K9y+zY0Vn3Wa4yOj6fJtAxgVmKJZqvm
	SDLHULEqSPjFRuL4lslOJGQu/D/Tu26yysJj+CjgCt598zS6wWb68SdlQA4qBDgxA7Xg5Yk1L1a
	aF6TjVg3HX5zd5nsiLA3JQf5bcJaSVzu7phDIhi4dVrZdfXvYewXrnZWld7jXi+V6IKdSgjYBHI
	VJMtpx4MNsppGfqAQ6IZpJS5fapGigaCD/g==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr3072058eec.2.1780843838713; Sun, 07 Jun 2026
 07:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com>
 <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
 <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
In-Reply-To: <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 16:50:26 +0200
X-Gm-Features: AVVi8CeFi5djIGvrvuLFIe0ggcr2ckGO7PwhkagBDt7mLNkIJPuv5Gv_nWehfL0
Message-ID: 
 <CANiq72=qKckJXFJU6TDKf1yh3a2wBS4SQE9fiGKpVOYWYtL8QA@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NCRSRORPP6FSUWHQ2YYCHATBBBP2RUIS
X-Message-ID-Hash: NCRSRORPP6FSUWHQ2YYCHATBBBP2RUIS
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NCRSRORPP6FSUWHQ2YYCHATBBBP2RUIS/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=qKckJXFJU6TDKf1yh3a2wBS4SQE9fiGKpVOYWYtL8QA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Jun 7, 2026 at 2:17=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> IMO we really shouldn't use Clippy to generate code. We spent too much ef=
fort in
> fixing codegen issues that are only present when driven by clippy.
>
> We should just run a check phase with clippy to get the lints only, and t=
hen use
> rustc to generate actual code.

Yeah, given the trouble it is giving, I think that will probably be a
better approach medium term. I don't love it, because the original
idea was to avoid such an extra phase, but it is definitely better vs.
random source code changes...

We could also increase the symbol size-related variables
(`KSYM_NAME_LEN`, `SZ` in `modpost`...) only for Clippy builds to a
ludicrous value. The extra phase approach would avoid surprises more
generally though, so I like it in that sense, and has the implicit
advantage of avoiding someone using a Clippy kernel in production by
mistake.

Ok, I can take a look at that. For now, I will pick the other patch.

Cheers,
Miguel
