Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538EFE9D800
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 19:32:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E0FF410E1EB;
	Sun,  5 Apr 2026 19:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8TCDEVx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2A30145588;
	Sun,  5 Apr 2026 19:20:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775416834;
 b=z/LoOlEvP7p5jbUTE6cWM0HpdcYgL1DNzxDEC3nRJvOumcWHHBIV4Rz8LeKZ472ShFU6h
 IjI/Kyog/0Y9P1zIKuJvhEEw7uel12ewyerqj9jVMFXhBR7twGclrW9jdZWaZ2n/LxIvO+9
 qTZLMilEjEQBlciHCDSb8QhugutrMKZq4bmVyOjjjx4gHgG75wF+vUjzTWix9Mhq/betUfa
 HJmb442O5e4qLQUnnNClQMF0BBZppM06ouh9lRhsDvT5rgfWsbvl2nOL1Yg5LlwH60UDUyW
 J3M96nRrocVDyor3tQYdoI5F8272Tc7yX5fIhA9wsTnQrnkQqrTNgrYBjcew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775416834; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
 b=x/Ihy24MVeckafp6P+sHqEF9o6vItpAp56nHMkgpxV1NnoggbAL2U/UO6yAw6wAs8FObo
 qA5CuRMt8Bc2+lSMoDXZeQfQGNjX3TeOhetkOf4AjLUeAlHJ1NvN5qraGB35mUeC+knCIKY
 WiMfZJjAakZy0wKA84r0+R9uWZhTwEjHwrwdPq0qJFNVm6UMDYcq/yJl/ZwflDhtKxPls1N
 4Eo8iJEasw+fBIAKLWGB/5rl1DD4uptWnOocHuOgja8f7jix9R7X3UhepEfb4rWnvfA3GQm
 UZd5nRAetYtFfghmZeJQon+2LZ60GA0TyPJwV0e09iixdu6nIZ4+Q06SgOzA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 488D342DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:20:31 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com
 [74.125.82.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB70210E1B9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:32:02 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-127148c2112so185055c88.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=AmiKQGLKapo/BTRScxsL7y/3khrIwj+ajG+ip0T/GeNzdR8L8scYVQS4bUCmbfK5fr
         fdstV23ga4DqCA4gFD+0be4fCD/Ljcl4uATVVGoyfWxwRgmzRpgO3O2g+5dNkpHd6148
         cteTkaBgjhjqxLbkgRbj6l/PVeB4m+oV0k1rWvoMb0hyzEkv7gDCb6kQHGJBQo3ZmYPd
         zVf9aCiFtlqYEymzyxthOl853P4bCwC3x3hv9Rt8GrW4gFAzfIFHqH2UCk5/rrUosZPU
         8/VvaplN1x2S39+GjnxERjbDAt/6HEAxpV+xYDRssvAisZjrwZlRLTdFeD4QjOZeSQj8
         Jckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=Pjy41DPkL9pyKqe9flQtvu6cr9gFts7qprdwkhJYCzA=;
        b=CQAZYxGsH00hwqQGFhmoFUuBCEIpMyigyywiiAyN+U1btxTUG2epM0KdAtPfaWmKnY
         idkhTI+wk6OwHzZ8X0e5Z/7wfyG/T6+yb4YQ5DZr05sdzA+PdZAPzCNqYKctbipucMhp
         mkSVdLPyCfjDaaWDjEuzUp9dfLlAO9RagTNCviGPZFIxJA0vdciXJJgOC8X4xywwYdaB
         NAUFAbnukWSdw1P3X+SiuiBAB9hGfNHq+QdZ9Dq3K3v9nqbqkrsuhlibjmc+dlaQIdFf
         iPFQrZShv0O2dWh5D+RoRdkC+9MKM7JbuLlhNGcMFm9Zxz5RtOYaHKVwxnhDxH4nRGVb
         SAuQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=e8TCDEVxDRpRMF1I0c+Emlln009wBNuAJhj/wsJRpyifzoFp9UvqQAl7pO8rqyBA6O
         d9XIbs/7jCRQzsH8sm7wVMQaedB6jS9tNbbCpWYZhL8i+L2QqKXbNcmPrUKxHq+uL0NQ
         qc66DUZeshhPlN/PTvEV2yQaNCh/0+KOdGAotMPnkxK5NxaBa2frDRCjPkdVHMbTtm87
         yuGFvCGd3fzLERJMLoqU/A/DyjX3R/77wdKhvJoCyUU1UGqgZEqhrVtCxnuMUZIsKGuj
         pvl/OaWOqcYUbxAsq1hO9cCGKFhFkudidIZDRlbGgP/3zeJR4z8UhAew9rBAG+tEtPwk
         GHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=r2xvFfLRZc6xPLkDtNxNaH9n1UV1v4mJ9GxQOaEUdx2TbcBW3xSPDw6kIl84908W66
         aTgRltffWx5+C2b8z4IkveLs3GZWST1jYdZGn4iRa6JqCDjJ/btT24PcSgHsRoXDjogy
         csRhz6teQDGL4CB6iBAZubEATMV6ru/rQOFzYOKgTA4kpdLh9qoxTzgD7QMjBAEA65LE
         94KgTP1c9zUuTi9ryhDtw7QjY4m0eqKiZTHzpNto1gzziwjEGNovQcEPng2Wk6PQA9mJ
         IxpKTw6LtiQLVN1yraepPSjfXnCPV4Xru7VipbXE6a+eoJ3Di0OhUK2SaMlgRBn573Gs
         +btg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX87SUXJRdT4zBmcUGreNf3nfQaAMHLOIiHld+dv8waXQvZVd0FHwxiqjlRmRrE2cO26E/e8O2/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLh8obz7Zd1iZYJXkUpcEMxDx9lnC6RS7cu5G4kyxi/VK/LDMq
	Igm13/kQQrJ1ZfmnQ9Tus5p8jIwmtnlaTBr+QR8aE6Y/8KPiiQX7F+bAiEmoTCduprdMKNfrxcZ
	VF0p6bv8vBd/SOzETzMniZBy1Gn4cznk=
X-Gm-Gg: AeBDiev3z/TFjGGFfIm1MTkYjcFkoKZDQWZknwdX/CUseJFk6XKpop8qFn0RjoivEMo
	0nNZ+LpNClTZ1iabb93asEDLE4YBL/CE1GQDW95fbjP2bJ08BPVhSVqY6i7UcEPLrbimBbNuZZv
	g3a31p7F5t/DQcb611vkj1SbZJp1cnW8gHtseLBo38a7+PdDMPEWKEI6yJ+KSW7QGxtcXG0/FFz
	V9VlQ6oZnItz0fl7vhv6R7L7bxIVxtjPIeiTBWY3ItBBt4+aaTWJaN5lQ+yfUXrRrIH3PcHC0N4
	5XtwmvVbi6Tv4v+6cVzEjNZyqOmu5fKYkMRjXVDrPeE2GQ4DqDJYbS3KJNcsSmBEngFKH8E2E9L
	FzahLIED+rgKU2mkfpXgenE20kU1O6U4R8w==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: 
 <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VMWPGUCW3CN5TYGHJXRL2VGLQR6VLU4U
X-Message-ID-Hash: VMWPGUCW3CN5TYGHJXRL2VGLQR6VLU4U
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
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VMWPGUCW3CN5TYGHJXRL2VGLQR6VLU4U/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Some citations pointing to the upstream changes would be good.

I added a couple links as usual, plus a reference to commit
7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target version")
that has most of the details.

[ The comment already mentioned the version, and the commit that added
that message has the details, but I agree it is a good idea to add
some references. ]

Cheers,
Miguel
