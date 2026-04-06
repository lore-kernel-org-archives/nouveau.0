Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A10F46C72
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 19:01:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8357610E2D2;
	Mon,  6 Apr 2026 19:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRwM/PIy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 901F045682;
	Mon,  6 Apr 2026 18:50:18 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775501418;
 b=e5cUzma8U+4uTyXAFv9PcTkbaODMRQ+zjiPOIQWryeHGeJzH/2XeWFuxGmgeecc06xMR0
 BmVGxMVDAgepCqam+KLDVlqpHeM3xA/MxTaUfYm7RRk4YRsEb0euMNNS5W4eD/Lsj/NlX1e
 bYhyCzKHbeNgxOJ8AN/a/MTZmD6vRXihvlGautlUY4WaRAgKws8TAbTrlUL2fEGICWqp6XW
 oVNReZGaTpO04JI1CFI1Ukz/oGU0zS42KLGl1XOdU5QOWyAkkUmrQvBUMzJTpXEGrhf1pJ8
 ltYZFAfM2L8ykO8okFOxTmOHfQ2aNWnlvy2YKhkTxCtyMOb2zy5HrZ/63Pkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775501418; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
 b=zsKhZG/zFDYlRaNTeIpC3DVnAfejkaRJmmeGA3BQkCVncaR6lavjLd+VIeOwhbD6qqG7F
 hwu2N1YjUSr5ryqd1lLc1Vbd3S2UwjTIw2EaK2ZZcG2/6pW89Nkfhf+Th6a9Y2gSvfZ9FVv
 YJeIDKXkIWxR++DH7Iu1bBsLNE/eiFZJmYILZ371FJA8reIchheWCj6sUKcJqsDKEqKeGsu
 nr4oQ5lCLJmLzF+EamAJZjSXspfEkRVfcZwu3hyocFt2ksULMELUALVKWGzNbSRrYWv8iSh
 lxCLTuR9eNCoIE/21g+OaYPElT+J1RVUHqipPAu/Q23AO++5oKDM7DQp62VA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 164B04554F
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 18:50:15 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B03AD10E292
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2cc43ca447aso146053eec.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=bhaVcjYkzbJVNPHOGNH5/ZCASmKLMMXAJf4Lfcd5c1OB1StP+sgrNNjXADvPG19Dv+
         uOPkiyEYIvx/pKXlezuyCAFM0wF0SkKfiBEbEv2XbN8vV7d5iJ0nWmp/DUU5FKCKhYa5
         WYkLXBQFiyzLmrRZAlbXBHHk9J0OQ1m6ytwa5WslmyGAkzN0AUo7VkgMB5OntsCm4q4N
         0Cs8LkeX3yPIbkYrVhUxlj9lgKFCblLaSGXaC7S7RoNDiWEF53LgXmHELMgMOQKw/bme
         10+uv6k3cpnRAJuKt1hDYoghXNZ/3ITmAbxBflDOaiTXcpMRFCoBljNYjpLhuuhin2Pm
         2Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=3YxdepTLVzSj3288JAvRV15zgWQKSLQ9mpjihWaoWKI=;
        b=XRH++baIzq/8FQXz+pt6oSP/AOthB7Z3QLAM4BCU5bx3azo5GOSmN5Wk8kkUzwJw5A
         8XnF5+UBqNC4QX6peJkULkyboE/wBfV8Vi5tD9cWSddk5kJXg9+yfI5tVXlKLO7Np6BM
         soysJbmlXvSWciFvUTUcr2X4aCoYWEZfAzKAUDZ6UfaA+7q4ZJE2eZAeMQqOAsj6/qvS
         BgL/V72zBAvExJSARCwV54M8PmiaQrFf1h4MSHxrxdfwOFoVHuXWBoh7i6boyEV37aKR
         4Cak5C3kRmGHNo2BlDcNjiszuSgZgpuuvF2xLmOqs7ArDQllQRi/1Vmm48UeodIlkSZr
         Itlg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=GRwM/PIyjkvi/5NyR0xFxBqWCbGa8dhgUQZ1D9OYZb2A1dH0NzAM0xhwuNfed8SjvU
         OppPHK5y26o6o8VQLPuDX2kWSkbrbGDXNLLXezkvQCiqG+5g7ITTPiV3DZc8pm0y1rb7
         DLJjgccQjcc6GECG0UZmMY/ITh779/SmePXaKJHRJ4xourNefpBqTSHEDwta4yJaAKjh
         UOLhwUFg+eJjUwT76ybaZ9nSc6aUsCwRUrH8dBXGQY6CMLYUOuDMv6R3QuH0ml4I7xZg
         X9DF3q2Ai9O9Kox/l75cvCSRy345dY6SkXHhaRThRcMCQWxO92h6DwuLV83DuErlpWFF
         ikSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=p4lML5cNS2BC4xEZxGDoR3IrgsuH4cc9SWLHPctmZM+QK1ERO3xRh7zrEJtXQqrkn3
         6yOnPv6XqNTpiQi5soJKgTg4QcCRIjL06ttg8tzy/YskUL8itSFgJWPp13PP3OOVNPUj
         4kJCRtV4it9NPKXm/inf6FROgEz6YHQJK6UaVm/mn0O23gccKZfFSti6y7NuQCDYEOpI
         dfF6I+bAYa5hUwziQqyb9uOZTQRscWr3IfQ+zbu23dPFfzjqF6ztEzkTqCixw1dx/eJW
         GVHTVwDFaXD2JHuL9PA6AK8l8387dqOjM+Rz6WpxkwD8eA35BK2EJ0QJ0TIhy80wP+u8
         CfNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB6FOE3WQr9+6wYirZll7IOiQ27/bnON1GZjb9dzqvyYGgKFoN0K24ZQQIlGrOC7eo1lx+M2Pt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKFCHauJqfKJRx7X1WcaL5rVf+IQ5vcmZJNY31zSD99g6VGTRI
	n0XfU2C4pSSMruWI7babqpfdSQF19UeShS2kcjwXYAEp20LKhLq1CM0uXkJmXlQX2BaUy1C348v
	6XmCcxb2/fKw++/NOkbeV3ePqRR4HXCE=
X-Gm-Gg: AeBDievqwkn0WF2kP0KTpLKse4GckzgjcDIbwoa7WeavPi0LKvWTMSq3tDMcE+v2jvR
	sva+2xEHLu7Wtch/9O3Mx0uxSiQRLMNNg1G61/jnf/vv+StPSBHWRlXSWZLIHO9a+q3UguEOVbS
	/ZNUCpqbgaCMshcoZ4lB9XqD/qytptDihYmM41dWr9HiTuNwmqkFiGaFkuMaTs13dI5ywkqLgkC
	Di8VPY+/zu8ea/weP3m4nGZgyqBXDmAU1VKxF0TJEG/WPTpZTe6jTwaGwj3yUGIw7+L5L7vIcPE
	p+OOBoU64Xf0iaHOH5vSSnwhgnUq/NMBDBLs7m6vi2qik2jj123+OS0oP9vuJ4q8ifanm6W37AK
	jhUV+UlDNnK9Fhqp8fXGDa50=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: 
 <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YJ2QOIDDMIXAUADO3NJZ4NZ4AON3KTQS
X-Message-ID-Hash: YJ2QOIDDMIXAUADO3NJZ4NZ4AON3KTQS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YJ2QOIDDMIXAUADO3NJZ4NZ4AON3KTQS/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel
