Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA06E9D800
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 19:30:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC610E1C3;
	Sun,  5 Apr 2026 19:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="r70ohNCF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 745BF4554E;
	Sun,  5 Apr 2026 19:18:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775416714;
 b=YRBRf/lPiJkXFAjA2QJiXQNVl4ZY/53/YxbrzlsEeEfB6kkhrN36WhqazBm2Yghbbig7D
 B2KMHVvVKBeg0vi+s5zD584eMYKCKa/n/AWCUJ5IDPz3QMs7vUqjENcRKclgFeHqz8EQQCW
 jKdOBOf3svvS9YTwnMICLZbw2/qNND8RP4nQzETOZoi0k/V+hdOqIMeMeRCI0iwa4oWfIXF
 44XEWh/qZfOQ9XA1lo4etvjV/N+v+V30SanPbTfzrK+GwUzuEsubn1t3vzB+/jSkD5fUkV+
 0iyxLnbuNOJdYCV+qJzkuGUOEV27kMUwxKjR02fXPje5g/RHugAVy6/VqUYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775416714; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
 b=0Q2OKSNnHXIdSLP9AIPA+Eyw8RIr6WKeGyEwsO7vFc6DQey3/RyPhmG0VwS8n3/YolcZJ
 Cr8Fyj8rYi59qbDTQ3PrIctl2ooON+R8dbem5PsJtli7F5L9yZYoqep8W9iuFO354SCmlh/
 AvkK7EO+PMv1YO92ibh5o07xctW5+LqBS123n+liLqqKjQ2pcRTgktJsa8/A3CHTcmeU+zi
 gh+v92QEm6D1+sW7KnpkHGrqF8M71XnROM1oNfvh0+q+LgJTT4nDXFpsEf2l4M5VBz5rwfR
 7TuoUB6aGXDe68XRxg7pFHIBYo2r9Dag3h/djIWkJZDrsFCrMTGxzpbwGigQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 53712448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:18:31 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE089954
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:30:02 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2bd801b4078so360191eec.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=j/ApfDkY3weyHBI9tFhjwuOT4/B21McTSplDNDtxc9WfdB17xES9EnjRNMHlGo7UFM
         kYKTQ7xhEYCxkc/wTUQyErS5NSTOtcyYDXWlbB4H8/nfK/BNrf2UqdqQM6g/tIo+rzTq
         9gA7xEb7rT/DotYnGflO1gbZGQAFkOYnZ5vsgBYB49Cr9k8jV28QWGBbhM1eDjfFJcd/
         /wz4Dtaf0kmfpmdUQhANYp5UHuJBjuYF6lzifQBmE/01cueIOZQLF3z77Ix87doVfMPf
         HvAW+znMdQF1WssfkDq2/JyykvHYUiEwcq4dnzeY5sANEV6u0w9BkPLKU7ZvIB0MZj32
         fY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=Y0bHSf7I81xQZHmCpXK9LX1y7fe+LZIJ2UydDMsjCiM=;
        b=VE0YsJh+jFeVmFFFU7JqKa4Q4XkkL+FG4dPuLSCVW3EG8ZfogXj3yZpB+hsduA+sNF
         hNJWy+TafymHiZZf9GPWhtik7yasYq8VIIzp5oTecxDlbPxKN6GPjNDfFPXr76sCldvW
         IKeD9Z6sBy8YVIE+i7+ACfrQcW+8bw52PaAyILBZDynX+/sMVQwsm8tgAtYl0j0DZvM0
         LK5blFoJMhIDdP+Da/BSfQ0f+5gNAJyrHB+xsdRdOpuSlqT/ZYfBXGhEZk1xdNdx07c3
         YryM6jyHGa0viLT4VUgGqRJmWvaBDEETzihZ8YK+7OfvofOUHMMPf8VXPA0K1ZB63Rys
         nWnw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=r70ohNCFLBX3cZn2Xd31cf99ifzrYVb/TWf7CS+NCAnzG7CXDLXFiARiWEpYy9Gcn1
         l0pGWynvgRpLehn+g220D6ZpBqLOWqx64rbloZSzpsV0W44a48+Kl5KB1FmbJ4jWgrc/
         6RQyM7mywnJmdusRPrXvt7kMXwC0xYjQFw+HxxzMFwSfpxeX0uFLxRd09lcOofM0P2dg
         LQoJV33xz3bfPrRoLo8HH9+/pVFT1pVtCe2OBpfObe/4fBhkG7PMgyrZERVJJ4DcJdSm
         rPQIkPf6+HMVhM1FinhOqSUOqjjgyux9j48vhCTOUOMbKy7LL4cLlCZTpF6qlloOMyHC
         HkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=U/hhd7GRjoqASvr0yfPbJHkqDX6NE6X4Ff48bZbVNRm/VHypBl70k6c/lT1Z5+3Xmd
         AHVHoMb/EmHRdxfldqiYtfHxuOQAM80RQt53pIn27ufS9ZHhnjpX1hGa8Iim7ckeY6dh
         y2cKo2MeNyI5eXIyWkMaGn9Cj9CcPqsy+8sTVo+ILTTkU3z2TkWCPVtZ5u9iuzwt25JS
         j5yVQ+erPIpVyEE+3OWpWXtCcvlhNRsPq6nxsnrpODmhzgkOV1UbuXjLMMlMjfAEqvpT
         D5B0cuhQMQduo+JdtEBIrei/hHnaOVBgc5F4htcC8ZLlzCNU6yZBGIBsxwPiGVLEEPUw
         dg2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdf55OoGz0saoBsG9h4R/y9FRFURpNuVQWPuVLT6Ry4whLAkSnU1biqyGNSqYYbax7Lq838czI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxCBWXlYmHcbPOhO/qAGMGNtjqk3oXGzFx68R7BGLMA8xppIYZ
	HZzmbtMl2dfZNsEeSTfEk0tfx5kqKv5bEH5GUzm28tI0HyLKX9yl60Ag4Ii793LRdvmhrklHv0j
	D5hiIv2yeIqaIH94iJ79IePDvXIn/2ok=
X-Gm-Gg: AeBDietU7Y81nvxSz/yFEPKATJIlACJgM/y3VRodbRLli18+qNvOw0tLSu5O2crDAic
	xmgC5jEt6bYl4Qmaz57xyHPwtvAAhH+8/dQ6sd1n1zxPPgwSTJvlJrIAAPK165xinlDZEs+zoPU
	oeaCcKe9ksdbZoNPG3G+Ts8HC96veg5OrlWqOWXyXY/facCfnU9WdTRZisltBizf/Bi5L+Px1sq
	yrFWymUywJvXLNpm9lVTCStSPNmkHNKNm3eRQV7tLv5dXeKVzJK4SXwooID54ddlA8y30rP1GgB
	j1LtEwfuO3mmfR/truDlg8O20wA78IgDdVJ4F4s1fmTCKkYUUf+9VkDE1bHor1X0HfaJqhpIV74
	0wAfKZKEPjA7jtz/pvcuGsmI=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: 
 <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RTG5DJ7DRKHW2FFYRHEORKOQFPYSA743
X-Message-ID-Hash: RTG5DJ7DRKHW2FFYRHEORKOQFPYSA743
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RTG5DJ7DRKHW2FFYRHEORKOQFPYSA743/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com/>
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
> "beyond" is probably not the right word here?

I think you are right -- reworded.

Thanks!

Cheers,
Miguel
