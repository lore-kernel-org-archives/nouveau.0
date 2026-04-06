Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03081E9D827
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 00:14:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A691E10E1F4;
	Mon,  6 Apr 2026 00:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AdmX5x4b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 76E5645637;
	Mon,  6 Apr 2026 00:02:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775433764;
 b=ZnBjhGbDe9bpuUy8i3gXbInaaRf5SlTOzNwpVmEdQZkmnI5OMLBdvhKI4TjRu6PfA0AzT
 yBS9GIc94As1klpTLYXxc/CpDK3a7RZoXL/2PeQOzB19O2ezTL0CKsrlyeKD76C4O03uEy1
 Tbn+nU3F1FNn5MTIfcNcxDDIr0ECILJnKMSE4EFgsO68flCfboeiwW5MSEnd5LZYn+VQR/e
 kQHekhPQTnTjx80Xtx4GdPOe4hjHnXtj6UOI1GGJtqsabWMp+MusEYbwm8Valpal9pRL4Vp
 tRPAk+LCdOlLCavlK9PuxZWQXL0hU8doLdjsxBQ8SqjfFD9rv8sd3+hS8xEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775433764; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
 b=f0JBHtMrzhMm4NKy9Sofoc0oBGx90+MS9O5C9gH+vWukwPPGDoYKXfEdQRWttT4qOsbJU
 hfVNsFlXr88uD12jDPbR6yeB8Zb7PR2iM+PXFA7axfgR42jQQxQbKLQ+VHPxhKOi18WyNHg
 wViZklDztA51FuTBQUh/gfWHPoeVaQ0JRfBvEwN2rQzmNEnZJ5kDWWstNXUSbzdx1Bdst5Y
 ZQxXV76zGeaD2wAY/eoRLpeK/dN7kxHlhxKfkdvj09pW6WBdoCio7S5LmfHrS2LjkfKvidQ
 f1qJPoxAebdxWAEiUXLy16hukI8wc653/YvbHlhTd+spPFkJ4RyT4gTDLGqw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 242FF43DA8
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 00:02:42 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com
 [74.125.82.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1710F10E1F0
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12711867ca1so91115c88.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 17:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=gprXTL8XfoSJ18a94syUl/BBZUi0LnStBDWtxffmyyTEiF+8eQ0bjxIstZBOM3k19A
         4GjEMiZDiE0EkYqqW7kjdpINCUunxGlYDr+A5vm7Pg/DCU1zIr8DaWna2j7Dn9tfU3Rj
         8UUQcyLMsDOIvsT2z57YBFrHbBij5h33rg/1x9awOo7Gbgpm6yujA11hZW1H26bQJAT6
         Fb+KHepmU2DDAK+7TJlCJBL5kTCDTi153q7xNOmSaGHWXJl6+uhNMt4KaV3QUlLRgkKe
         8zAd+UdC24wgCODQ7FulZu8U5PJJC9HolVow3dm83zbZnrSOd8yRBNaZQ4ar05KwdPre
         YWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=FxE9qm/iFwZrmm7dbg+mzwkYkJY/2Sa2Q4OGH9c58mM=;
        b=LIlpFIukI9UF0qm3f4qNd2rW0cfzM+zmLVkPTyC57rU29p942wiO/rz/tRWVa3+SV3
         DO+W4JkWDkORWO8iSsrj93ud7Zx/kObIOxZhJcBMdfWrDdRmYMGx14VLpaoDqS9LsPHx
         hfrjC0sS2l2uPQ3ymQJIx36PjBt3vHxG14SV/zAJ7byYAzHjjgURms8ps+lLzOHu5KHc
         JwntH6uv48tdEDTWQ94Y5u8HWC33TVWaL6jZlffi8UdAqHvyaPqnyaFM5DQsy2VYeGDH
         Ao3ubcaxxid5DP2mbWFSjUL9O5RK10bHHdtfmdA88Tuuqbn5hPDOhQDvTT3g/6LkATG0
         GlHQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=AdmX5x4btWyZVxK8W19FlyF/tBB0D0z/zadJ8Wr9yNUcrfF8WukMkxV5BeI0vjmZao
         iDEu46u5ngK+59Vuru5C1QGZoVEXnGjU7JrcVBSbiFej1iAoIufU+lbYx8o9Qm+16ic3
         8MYmC9H2oFkK/VMLocIAQzzx5VEbAtKPbvFlwOOfchgNxCpIqcHKdAQZQLyv533pZ9or
         5RYkq6HI2q3v78d6vMmBqTOZxuurPNmna+K7VmTWR6iL8rfBqg9Qks6we2tfDjCNk8AS
         k2CX9Nb6X7QXLuEZYJj223YANS6Ur3r9ujOjq65Q/MuEAEqm0ezSH2NQzHkIi03kE+E4
         CCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=hqDW3qaMxmNIhCLsQdebe1px/hyORwagdPISlYxo3S0hoR6+mG6l9Yz3fxYGA4OUap
         gr4qc569wvXb9K72+LBIM3jXUX74RMwZ0pcGhUtfm3WUP9uXvHIxB6hTpy3zGJzxOZaR
         Rj2M+0dA4el5z2msYjlBnf3TwOpTIgLK3OC/ZXszp69923TfbQA4x0sccPMHqKBf57vz
         smLN3Vb3smkgfayuriF8qJ3UtsfYjq75z0C3qQoQK4UwRu/HXCA/gZ+r40xbiqKoyMgc
         0y+5A/KN1V4EH+m3CLgSnmF6Nc0Ld5oS2/TYOpvcVgTvnjVLACD6N2Lq6Lnq8WY6ftp+
         PqVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjB5WQPe22Baac7j1ORjcNV4WGb6nRLbkSUGxXzd1hL5xxvKvbEw+SZp8qHpdvCDJrhsEqKw11@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD14VpdR6IPqX4Nhjk60+Zec/0z+/eVvfzftxRMi8mAAQUoC4Q
	b3IzXS9AAyD/s+fS165Pqedau7yHaQROJ/hC17cTqte3sD4Et1E6DAP8ZUsZNScGQufhAKLUet/
	u1uj1Rv5DH8pO0r51nYPgxniE2qfX9VY=
X-Gm-Gg: AeBDievGmwEKyAKBZrIYmq3uJv9Jx481G7A8vpYxGs01tirM3qfMXBYBV2kxamECwoq
	IsXkeUYSTDosSZYhTqryLZ49Z6Q+lQuthfWwna3mPIesWjgU9jfgswfIo8K+GxXZIAzBhEi3ZPZ
	nR8nNSBLA3h3xBW6f0n8Ea7MEdIfYCCOat75bNT87PlTSmfcBt50ID4k6H+M0/6iF6dAd8AXLVe
	tIPyQkVwuO8IAoLPF13cSbEdSZhMtlywBt7xKvUBEIS4KxWxEJDGDp6aybNWreuarYWHKMT86+E
	hkgfiV60bN+hPgp6xacy6ftW9Prpnij6+j441+kGuQ+mwlNSjFYMLw6LD/nyoS9ZqCTGpaen6BB
	FvJoby2x/Nq6+OgpGezQGKXw=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
 <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: 
 <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PXWOKREH76KWZGSZPJDOQYJ3VZF6QXF6
X-Message-ID-Hash: PXWOKREH76KWZGSZPJDOQYJ3VZF6QXF6
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXWOKREH76KWZGSZPJDOQYJ3VZF6QXF6/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel
