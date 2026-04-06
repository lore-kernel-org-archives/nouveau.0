Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1877F46C49
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 85FE410E267;
	Mon,  6 Apr 2026 14:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e+As036J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1464C45665;
	Mon,  6 Apr 2026 14:17:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775485070;
 b=B+0QRkE0ZmNo2xN/RrsCsownSoXGxi7ko2MVMoxkg7lQrLL/vKAzw0ryIbltYdqr6xqGI
 rC091hvUYaXzotdxx2NrOxRjpeYZy77ti4odX7UHKHjTH8/pisNqBD/ifz1SRhIvlWZ/9pG
 XeVF5YNCkQ89znP+2NA8YsJaZN/6P1RgR17AVaV2tVkdyLDPcAXfRONnpxfhIzDjwBB/+ek
 jPbc1v4QbDVQop9ajt2womb7GY4wVvjH/umuMaQRMtq3TUL6cFNW/zcdydsEJZz7TlcpvQT
 VyaIhsfMl1ezdSdKTMXYzIl0ftXB4+xqXlBo2PSn7iM/n75OGS2k9lAuY12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775485070; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YL71vnLj9QpiyZ0wn2k6qRLWCKTBHQ5qGJXoAsI/k7Y=;
 b=rt43A/IHNPAMw51Jb4QtitvX9TNJmdgWp07BxS/0GXmpcKBLScoyLp0wTbjG+EouMSI4v
 ldM0+whE1b2L8J5VeDZbnQM+GlSNU2Z7gOqnaIvAgk4VL7mb90euZrmm43SNu6pkAQWAP4m
 DttXBYH7lY6ZTq3Pdb0ffx30WobU+4AiEa+eP2eQv3CEkIWuS594AmlRF9LGb5JjLQiQBcm
 stnm/815UI+04n4a9thFDSFUsg5q5BO8QLlxjOyUntaHNuNgqBPk901lMy0OyQ68V5w2g5n
 JtGAngoyiYdP1mfHtFta1+5Uh3yPAxNia9GjqxX8KhjR7yAwYmnSQXimwUqA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF2CD45582
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 14:17:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3629310E261;
	Mon,  6 Apr 2026 14:29:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF2D860128;
	Mon,  6 Apr 2026 14:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18640C4CEF7;
	Mon,  6 Apr 2026 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485761;
	bh=mq7jaFSupKdEJsnxgCQqUuadHGtAR9I1r4rs0c7hHHQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=e+As036J1OE0LRbTE+udyTNDvuoDowrAh30WCvKKTZxym8JYzXrGS3G26uVdSwDP6
	 mK3MA9FuaKrw2yn6f4O66Z1zhBrF83QZGaW2/46S36F1e6+tbLI+XC7JYbZzu9Ff2r
	 Vc9MuNOWNw+/xBZ4JS1jso2x8nUy5yuCaECtI4kKEB+tx7ukCV87lbA0JAlLkDmp68
	 5qUbmQ7T+w79KOxCzYtbCnYkoItoAf9EdIcuSMqk4t18yFBWMycOAV32nSBypHspnL
	 g2OeTE7e+5JZx9HvznWqHMpzI2q+cViUAFIk3S0nmqEP7lP8RFEUbEhMLbJzveYwbK
	 H+dQk2i2obNKw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 32/33] rust: kbuild: support global per-version
 flags
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-33-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-33-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:57 -0400
Message-Id: <177548573700.95472.352775942128786057.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mq7jaFSupKdEJsnxgCQqUuadHGtAR9I1r4rs0c7hHHQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+tzWYj+6dTpkBWbUfp7wsO/m/iYktnfTG+7aHHYb
 GZpoV1Bx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKl+5czwP+PqFPMTQeFWGn039hd23v20JE567dHFIme6jpjbVEjwr2RkuOrsmlm
 kEVS0PyKl+13SNTPpN+1S8XIH9s/y+Sn8aJMrFwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: ACRAKG46SHA4ZPITWTZ6G75LK7QQCXRH
X-Message-ID-Hash: ACRAKG46SHA4ZPITWTZ6G75LK7QQCXRH
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ACRAKG46SHA4ZPITWTZ6G75LK7QQCXRH/>
Archived-At: 
 <https://lore.freedesktop.org/177548573700.95472.352775942128786057.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 06 Apr 2026 01:53:08 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Sometimes it is useful to gate global Rust flags per compiler version.
> For instance, we may want to disable a lint that has false positives in
> a single version [1].
> 
> We already had helpers like `rustc-min-version` for that, which we use
> elsewhere, but we cannot currently use them for `rust_common_flags`,
> which contains the global flags for all Rust code (kernel and host),
> because `rustc-min-version` depends on `CONFIG_RUSTC_VERSION`, which
> does not exist when `rust_common_flags` is defined.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
