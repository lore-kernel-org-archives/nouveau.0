Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250CBD3517D
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 12:39:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC2610F00C;
	Wed,  1 Apr 2026 12:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OV53+E0K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0A62F45414;
	Wed,  1 Apr 2026 12:27:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775046461;
 b=xJAfhTFXU/uR7TIBOdx9+y6uTN7JugS3+PhGV6hl80A+3eQE3d0niyK12KrBuYZ3VezhD
 pqMqgSxMYTsBv+akHQwJy6w7fd4+0ii5z99TfmUXzNVHYqplIiPHnI5NlXx0I/rmXL+NrEL
 u8kK0cPYCFXskVd1o/PGhleidws0E7Ku5K63IMpkh+sxqPOm7mrukX0uuDl3H4jVu7EmfQB
 WjTKk/h/ZJNquYJ9MbfniyDXzdDYO/gmwzTmr9GpPa4QrwRCQLIcwQT8jIG/01whn8FtVIn
 eEVy9Zfj5ElYvf/RDON6/YEkZZwCjkguF/kQ+0e69FB/ITOocMz3dz7JwI1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775046461; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
 b=iSNYNWs+egJ4akbQ0+iy6vETovbqGQ/s7E9e+vK/PmVWN0BfzWQNsHu0UqqXQ6SiJyCTO
 +0+dnBseVs7GPgq5h3RWpjqbp/KGcDaMHQQVCnawPrSKOFN8ufIGhPlUK5K8+cHbzrDrulo
 ywt9/6D0vOWgFPWoD5+pJd1Xo+i/fRPf72tA9MY4PYb2vue9tOzPy59MfK9Liku95y4LcJZ
 r8oVuPKScexixDPshxSJxArXUpcoPRBRXYvpYsYcsJ3dsRDrUkwbgLOlHq1w5ADec6TECve
 N6IMUJoJ1ilfACMUOaK6Yer00h4zxNHlrOEP1OujGsqk6u4sQJXU/mpRrrpw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A0230453A8
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:27:38 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AFB6410EE49
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 12:39:00 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2c44547f6d5so189535eec.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Apr 2026 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=C7+cDl34UeCo0CTYC+sihlkmtxDWQFi4JBn8ZD0sVnkgdYccFuaRZO0Alc4lVf4d65
         C4OG8qnfVfJtIqM66PmuhSZVKE33wYWogslypCLFONhgLFdXiLmd5iG2j2cop+nbzR6u
         uDsavAeJuSBgB/jQad3RfDB/EfYbJRLFOaTWdAjm/jiEkFLEEKHFwa8xss87rLQbtRSp
         dibFAPnPDRpJcsx/qG+Q45Co0JfgHCgU2cR+90hnKqPcJvPa8vyudsz1FZlexNUde+V8
         ym3YEP65lqaE+SZjDgdcJnmVztatMg0mAaaKW6cFmwPg1raqSx0kEeJFzzMRsjBnDEzs
         kmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=LDPdjc/2E2TEweWrrWmSD9/ovJzzQ5PvmuEsQ9JZgw4=;
        b=YW7vUlnDMISloWQgArPmLI20nvMKdbyS90rdZh7Po3FMpF27dQ68yfCa+6t93l5mbb
         GBLPaUrAnwI5WbefQmsB8tqebgn38Sgo5aXMuS3Gj5QxPUIkv0ZvIr8FIQMKFbYgIOWD
         Coh49nTFnb52qG59Cy16JXiLx3laq+PsSlMlDHO/xFnWWI7q5ePQCd77svjISZTT9N8b
         9jGQQWFLpJoXJ8qhEfYFHwT9yBv86CdVy5kYmQoAvPQpZZpVrNnB9Bdw1iXBXjyyJSgZ
         0Qbsa3WnTWrbpcBEBtduqypt/uXqhXDYvpX7LuX+Z4/0+og+QMYreEQAs6R3pa60YfFr
         Hx4Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=OV53+E0Kw2OdonIchm7DikDMRGLzyWJdtgrL8dIBPZQiUu4fFya7ZwUBjfFNtd8tMg
         3RqHn5FuKZOZ0Y/JNYNdDpkImZdRwlI8F6pQiPLcAqltfdM3Cr77gZr3mrHIauNjtKXu
         BuIdlw2OWPu3QV8OcNMm4ds9/BDcvAtHSTOd8BYeFoeKuaw8FJGH5LZohpE4ucbpuIRn
         eK+PiK3k5HWQUbL1X9xQz/oum/o/z58mAnuFcN2BVnSt2ANDhEbzgfaly70ny56idYX5
         EFejoflX3UGbUVrQ+LQyaN1rW3tMKgNObvKUMdxVV7nWX3niM9rH/0KmZllJyy2SXZ9U
         K41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=EaJTFrnqqj10NuKGcsU6A5Vwo6sBl4Jy/vHZ5LiiCgy4ArcYHPj1wReQ3PAGrEwFtc
         cWV/CwUgcjFDcc5MOf6+k4bGcFgw+yUsuRGeMuwvkovq9mDSvOXo8/6kHyk3fLiJ8WRc
         k21kn7EKNkIGSqJL8CFp7Z2jJ+J4A4P3WzFJICJx37i4VGSYS+8dKZdDnXy+r1wYI+gb
         0FjQdTu1/MzSRrkn/WGEdHL/XVd66R1Hi4MvpqckVLb6EPlmzwWJFpPJn5HT576hu5aZ
         +caqgC0jyRL7jh+MhYMotPwhCQ4ux2Ra33HNFaAwCVMslVwzSmgxRdmL75dDyFjJeDPY
         +adQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFFv9gievqVCbaPN8g8Wkl4hXHodF5FhBrcbOxMmS2S56RKCA+ZhwjoKMdy18KYSKRWd4tnvzr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz74pM6Ux6I2PZ5hz//Fip7e4QoGu37fShqblM/icabntuab7AE
	Qynt4SsnHbPucwHotknWjLfNIh/fknS6TpNxhcRD2V8oZ4laPyE+s0QaGOvc+uL6998eR0cLjkM
	tfkw5t6EGAnXyu4xRPZWl0VVoZiQEpX4=
X-Gm-Gg: ATEYQzzOCHYMNJDWPL8976Jxh7/40soURF2s0TbJjgppvbeE0BEzJ0amBssNyF1rNej
	MXrHV3fzSls7ePnALGq+Tkn/i2fixJWWpB4DorIYFeXHdcwJZ2wCrddmuGF9IUWTeR6JPb5+2iS
	j8OQHNlSkuIKpg+So9AgkUffUx5wdXCyBpe1joN8XOYWuKrOppglD1IKI1bzimC+1lWNB9beAgG
	m2UFZ+/kaiPQbd71CPvAD1+M/GCMBOQSKSTJ33hY2FRyw5Of9yAZwrJ9ojCjMVRi9oO1b1yrhSo
	XHSQR1raj8hOmQtwdGafmEFyN4US30FRZbQyDbcwtunxvriIXang2lCxmJLbsj5iB1m1DIKrhLV
	Rb61kCGLxAvrQWZ/NoSBEdv0=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: 
 <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>,
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>,
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>,
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
	NoisyCoil <noisycoil@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GECKEMM4PYZEHNHQWY6LED3TXN5DNAP6
X-Message-ID-Hash: GECKEMM4PYZEHNHQWY6LED3TXN5DNAP6
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
 Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GECKEMM4PYZEHNHQWY6LED3TXN5DNAP6/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 2:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Debian really *should* pick up 1.85.1. It contains bugfixes serious
> enough that the Rust team decided it was reasonble to release a point
> release.

I asked them about their policy yesterday here:

  https://lore.kernel.org/rust-for-linux/20260331190053.482607-1-ojeda@kern=
el.org/

Perhaps they just prefer to apply patches on top.

The issue linked above is the only one I noticed so far, and it is
quite specific.

Anyway, it is up to them.

Cheers,
Miguel
