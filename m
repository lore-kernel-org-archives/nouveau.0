Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEEECC6B03
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 07:12:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9EC410F12B;
	Thu,  2 Apr 2026 07:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oe3tgDCx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CAEBB4551E;
	Thu,  2 Apr 2026 07:01:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775113276;
 b=l//LKzb4RLRSIhMsR6cR9KbiAkN+VAG8FrZDWUc3/KBBUBCuBDTYj4dQ7A2iYwBVzIMQl
 pstLMrv6Hv6ybnGn5WHxRmjQsbbC0KlwoZadQpHiq5vG6cXRvn7T7a9Zlr37POgubD4XrJF
 P5gFWr71aNbmEm6XmFKx/yY1x4kPtKBKCEj+bcKBJxj0fHSd+bGlxiFQ8AiVIWkjXPQowdi
 6rciun6QDAnAN1QRi6i0Y6K+43bjy2N0dmgm/eMfSSDovH1+f4hyuC8BX1GOkWcFHdfkfjW
 H+KaS3SHqrtu8qemX4z/0Una8Ksvf4+l44wodxJ51w6QuVwasswZRwJ0D4ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775113276; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
 b=F5wM47YQdFyrEsmmQJCXUh4FO19lZ1ILrq9uUpM2fjFrIuYvwDdwKmfGWJ9tke46TscUo
 4pC58xBi/HPiHyX8yKtznw2HOBo9lvCgARG0QNxuzOY+eZC9TqkVvfmKiFmfZ2BYAzc47xr
 DXzhjqn1goLgsASiblGnt9i+rCPN+ArNo6BpYkR+2v3fb/eXBE+ZptTsfOGrwAr6+fJkJfV
 Ip+58qdErdSDFk/oC23U8whDIRvuLsbOTyBITPDD11hXd8HSEKBKmvDEEIxh8GhR/CY0iu4
 O0kwnh48oP/jyhKYp5wIjxBR89xaCBiit/7KCblAwDiJnEwI88Ocum0ohr0w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A1A1F4503B
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 07:01:13 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 627CC10F121
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 07:12:37 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2c44547f6d5so19107eec.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=RaI5Q4Pj2cYNymB4GT+9BUWlwsd0ZSvhkMSBtCJhK0ax+C8bz62pTbf8ltjOGaYHTq
         loF/6l8gGjFvC3EIb/2vPCGL+8h78C9ExNrvUi3yvFUD9ghV4abd3b8BJJkwhNH5u1jB
         rkmrB59mRdQHlt/yzIYfGtXXpih3avvbADJRuj0mL0oSvA44mla3ra+LwhWbpkwP2Ojr
         DPGBWaQx9yMOJOOic2f+WBOjOx595Fnh4WSM8+lTZ1055NDchL/ErJm8pKQO5MORLaVP
         10JhWECa9Itq4oPumAwB8pK47nL9k8othqQmGVpkhKNWtCWwLRWZYHBmsMGTpJU+aB2H
         OdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=EMBCPs/FsFn9pFdsuXVcvbJEn9jPrQFTj3RKd69DJUI=;
        b=b3ND/vUqfJxbl471f/BbkpQu57ymE/HiY5nRuYxbaqoYngT24cqkHQLKgoKoCNobWi
         VLlE5q9UOUE9fk8Cu/wd6He+E2sf+UoPvYXT07wavRdXNzUFXpujLItj2ja58ukEYaUz
         C2lHbaDmOWlENBPorAKabuRCRzKhcaUbIO96ua2JjHEGoDmRJozywjudLnmi3rjlA1fh
         0qSN573pp6aGKafCH4GAE/elBARlepDNwpAgnHnBHQCdaHaBWjb5MWkvZ3chzeQl7V/m
         MVWwvOE/elE2T4TtIkB6FgtSKpCXNDQTHzvAeqrf5KvMkYJBEC4pKGtYx1FhE68mNIMH
         iKiA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=Oe3tgDCxIZiC4DHC/Cvby580mx72qpb7OUEo06GejxVeUWTty7UHge39Ht7uWHkA0D
         dSexGccwUCE4RFdL07aImWBx03B6BXz3UOylyqwWhCv7+mpvxWXksGqVmbhOLsGEf6uY
         k1UwpkSS9squsvNsuMS6rxNM9W5yW+5U4OX4bw+S+lCtGUnsU9PTWeGY/v9tloLyIWye
         zkaVDPOD5iZcUeIy0gQDKmSWE9mHe/ZGiktrtKw270u+vWaO2TMDmKIBA+RS6S4cr3k4
         NIWGre/Ym4UR6iywQx/E4T08sOjeC5/0jl48ns3Pf7mBFlcmO90fTsFrYZ6jnD75C8DD
         E/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=qNuF/WtfofW7v7pENc2OXr7GMUQ515lmVsFs8VPZSInzFDpJHKisAoB6oJv8S6dpT+
         IBvbEcPRK4lpr8R4aALDfpbYPAKBIxYO+sm4YLhqRO030tHvlsyL18S5jjjLEtHGBS2C
         42rnzNW5FRpF/741rpEliVMr8nBR/FKcsakK9le9p0kUPQfPbp2e4qmS7AEzotj+njwW
         jhYHTiQLzzxkGHgEZRqVX8hoZbDJ6ifzAN4d6EIc5LXg+kd8vjSEZDSyF/BAfXdD6Ys9
         mc36Zzl3rOv3lE1/UW2IbEVdr/4sA3ZdnBv2t6NnYoKid2b2Z66HB/tQ8aBG1LJ0c0Up
         doVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6stUTffw3u3fOH4OUrm53OoSgqYMZ0dbw8vlMBNGIJ1sp8dFCerzlE6TUKppnPQgFHxrKXbLD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB9IFaTHmKBYQr3b8tGcK26mzOx6HE4LzY4wdl474TiZlii6WP
	lpNdPt4t7k+Kl+5AX5Kbycd+x/RXKYCSj4vQlz5oznIBetuk/ed9tIIm/4XSMkAdJQZRE5muflw
	t+KiNK9v+/dlZmgSqrZaaOCBcisSNacA=
X-Gm-Gg: ATEYQzymo3GHfIswUJ2RbccDjNEGflV8e5Cmp4mEtIt/gUHeoMBIEzFqOtVuF7q5u1M
	lQJvQgflbsFfN44kNU5TGkp+6YT9l/MZUgR18dAAfQb7YWgi04S1oom4L16q2/ieMxP7eKhBHVs
	BcrWUsc0ZAFrU7WEg5bZJJvmguIe58DOYwtnY1dzjpZfNjiAHyflS5cTF2HmZ3WUDK7MRJBqtVn
	BR/EbyV83Wz82KIZrHpyw4tk7ht2CmXr8HGgt1+H+leQVRJ1Na4JtNvwQVIlcoM6f0IrIxtDDSD
	33q6SChkxw9pYpJMyWPgBtAzPtJbSRQ3vEdd9UlYCdq9hqcsU/1TFWwgKb1qxUfg9VWFwMYUc0c
	ANgVtvakQJRoZSrcfDtNxaf8=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: 
 <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XZSIRMDLLKF34DC5O7DUXJPBENAP7AVK
X-Message-ID-Hash: XZSIRMDLLKF34DC5O7DUXJPBENAP7AVK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XZSIRMDLLKF34DC5O7DUXJPBENAP7AVK/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel
