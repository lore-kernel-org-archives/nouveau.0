Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0C8E9D80D
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 19:31:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8879B10E1CC;
	Sun,  5 Apr 2026 19:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="p3ybTDzH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C81AF45583;
	Sun,  5 Apr 2026 19:20:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775416806;
 b=jMsxTk6lIYJdqVJfYVpcPjMTD1qvxraVgSC86VSl1jGL5LSWlRKv9fQW91ave/56sXgBm
 uCjJMF2HaOk8S7FVIWTwycA7iQ2jAi4+VY9enYO4+nRkRo6rCY+M28vU/nvrQt1Dhp/9Zpz
 VS43PYZnf6AdGl7gdYGw0kK1tuJAi3g9FpX9Qwa9Mz7k5Fujck0TcrrfWDI3wnBCs1BTVZK
 Va9N6JCAkc9Zy0VoKOsBCWyBujdOCozn7He9toGG+KQRt/LoATr5OFHsOJAE68HE2dpukYr
 62Fjv05n6a8zkTA8K+ufeRZetV4+gSzj7gDEG0w35mjFSju9j0qPOP2bHNjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775416806; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
 b=rebevhJZc4mwdenNDdsUhPpG2+8wPZu2M4EF5R0strvj+akvmNsWZQ/tPY7cL7mmsNLgE
 U5cUi9bXRA1Ash+lSQhkaXDXGvyiN2DQhzLBRt12Ea1WkiUk/MECWaViNajQ5n6bHiqSzod
 rXTciqVAOeyzD4Abb9ko37e9nq9cdfHJtXTfi4ODye8YMlyz9dIq1szmari51NcPG43oy2z
 UHRMj/RB3dlp7c1+Kimhj21MpglJ1x0U4CZAkd0hpPF0gP5ueP58WklxCqGoqre2n62JqBw
 hX80IhlkwEL8jSFP3zYunK6y92rXwBZFD91Zm6RLK1UW/wXQA5CEoo+EMg+g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DFFC0448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:20:03 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBF610E066
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2bd5658b901so219892eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=M+nJ5VfRiGE5UpG5J01vA3psyJjOsgzuaiGx1d7y7o0CzGOyM1BBUBCya1vAIWx5Qw
         kS+hKdXdGJHXKj9tNpPzox991kQ1HPVlpwKcpnN4fVfeybzKzdj0DmyDLnsk4M5S4yQC
         mzRKuBWAueKmgNg6ut3KuGQJnrJv4259rdMJbluN4ZE8ZQ+I0AExW5IKOHA1llLFMw/u
         IZ/+0Ag1giugYb1Khg059mF1tsRSF7lg8DM70qokgSKu9l0IpEHdili5Wft3Bv4NMsSp
         PU1Z+XUA4Wu3vSJmeUyaNTRBxANukWeH4/Yw8/VvwMLe/6H5FyMziiizgW1yaXZxtA2b
         gmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=PV0sgtaP69/isjxnyn8Hl6Jdjz3jmoTvLSm2CNhYnco=;
        b=e+Uv2MPPd+/u9lD2SL1xSZxga2foMG4Kum06HfMydzn1K9dPm1K8hsbU+2kjcXwhO3
         Pc5/59DWP5++KaLL08hP0VQ/t45iBrqlai1desRomxAQD3rJApa0VUAwKr5l4SQiJR0+
         YJdPmARN5lrLFfx4t3trmHOFUZiVB2tnAsx/zF+jUxCZjOaGT6OysgvBVZ689mnUkWJX
         ZWZ3Gl8lvC4WA9K+/EwS5kaAiCayz5CkQcQWAH4sal2OwF12+meN7EzTAYYzCPSU6bA1
         v/8Q80WPpPJa9kd6AXeLM4bXDDj6cO/+Afr3V1tLku63wTxsvj/S0AU89AroSwSWHsST
         bsxw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=p3ybTDzHcjdCjuu2/mCK3TcazmuZry1qNbW5qnZcDXPlrhREEU5htjJIRc2rpNv6Gq
         NU8A93r5e8qDEKp5n3m24EhwQFiD4E2sYpFjfpAZm6eRfxnj98VbltO0mPQY7T3EjQxr
         FdXfBcSBVJNmECpX8kr1fuZw8W7iMq+uONnGcxOu1W1jFvSz5Bo+W52obbrKSOwOkMv0
         JZPqPLkg0Cds05ScD4ShsHqAfGcodh276Uscy3WfbEW6sg/exE9OFmeSTSlKVi4b1oEg
         o7/EM0nj6wcFBy4FebAT9aK++07/0vy2oSYgGWvpXmbClDJ987SRDv8ccNVI/93iqs7S
         FKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=i+fXCqzdkDToWqBaK28XzHVwtjqEf9Zd/z689LshWJsDXgMRC2JNwsiw49CSYxbylX
         r2dfdupW6RQ3cBXJp61+UPXda0II6suetlzgUKwsr5npS4rR8ZcZc8yAB3rfNxM020H5
         D+pzt0Z+sCBayHfxfyWmeBTwTGLmaUGmERQ4NTqUm6q7djmgNvlY6C3PpSwleB/361HE
         x2C85BY4yLkHEn5ziFJHXIbh3lRPv/iIUbqEM/OfyynDYITGrCKb7SeDIb4vhzDzQRW8
         w9OW02uw3n0kCHZzNzXjiU7QBkMM01VKJz8G5Bh77iVDLfED/c9WrFW7WcBwbUbYKqPL
         KtwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYKBXuIH38aj2qSIvVwhNRN5bPcfxfiYmlCyeQTk4yOV7frN9dwuK6CZ1fYKe48408ij11pVhN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK/jyJAPqtX1gScJF/Sd+j7Lz4jZeCqa/eurlEwdP+J4znqmed
	q1NhTGHkKjx+ixZLK2438sVnHiJNDuLH63iyC1xNLFfSNllkeHHuYGKLLFTsk36q5a8KO2QRuDr
	ktSAzmpBVC0WFIxlWJEahftMcwdk3vBE=
X-Gm-Gg: AeBDiet0rVuXVHZSo27ciWBtU03QjIl8e64FNUJJVE2370gMrqgBxOkggWEEd+/SzK7
	fk0cqePBIVky7CjkXNZ4ibOauvbBSTQUaMweFDCGSDN+MxJ1312HpnnNVb9SMrQX/RfVUzsTEgs
	Q2kmHY8RKXuXXslBr1Pn75AmH85+wmWURyZ9NBIeEv9bzhqxQJqM74tMUR6L0rSfFTi8aHUE1Nd
	wjvdoS/2d295a2az7hiIJnvowaIvBgcQEqfJ65/jBlgoChvKf+BGcV7NhLPNd5vrNYJyKbUD8mR
	dgUJTRlI3DLgFxnBH1Y5XKXfNpyiqJpKQKttCoUY/gi8uIypoAnQJLvgMilIJKQ3Ai3qJqQIJ5Q
	Vqv7S92jYp7L/qWistHZEgI4=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: 
 <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: L77BXWIRPKWAWRBJUXKSHSLPEV45LRZB
X-Message-ID-Hash: L77BXWIRPKWAWRBJUXKSHSLPEV45LRZB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L77BXWIRPKWAWRBJUXKSHSLPEV45LRZB/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com/>
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
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel
