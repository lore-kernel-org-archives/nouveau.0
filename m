Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA469EDB7CC
	for <nouveau@archiver.kernel.org>; Tue,  7 Apr 2026 08:37:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 036DA10E37F;
	Tue,  7 Apr 2026 08:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fGVIKqSe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C246B456B2;
	Tue,  7 Apr 2026 08:26:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775550369;
 b=Eh/j/GOBZwJ63A31fO3nIN8032p3kkm0gh6uf1v6D8fJw0otyS/99zhF4Wuo+cdHdcnZg
 r0tO871pzhqhGsqHkNzJDYsLkiwgNPFHJKPJNNa/rr96S+hFfph8yTt0gmNqh0+LbKK0nU/
 qXB6LtqOGy6t+W7qtXIvbGqJA/WNi19pxt99pcEXyB+IPVtPK1bJ6JK5QUSyy1/5RHxCgYx
 RhumJ+fnUCK0oJuPdn0viYrcdmwxmvxueysB8R9gUThF4R6+MoMp8iXhq2qzbH4ygv6P+eX
 v8oWeSd2eDhBZ5yXP0d9Dz0VZeGUcGvn8nxWwVRs6P6xfgifQTSEs8syPIQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775550369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
 b=xz6Tp5xMeJK5yUUACeRR7b3DO7GFXUdS8IAkgYSn3wnLaQxt239zU3fB5o8Kn4Ju0P35A
 Jvx7UOq1pIeMMKd93QsX+3VT2qEqbiS8qhNgGqz2p7G8lKuHg58xa2dtPNkRaZQbowO3m5R
 jQQwjD27RYk/sb2iimtmuoC0myyGr4oJrfg3jDM5TjVNwmt9mIvWFKFMQD8qsfTzqzbaGmU
 wT9asE+UDR7X/omBtU88Aw9PVxfqnoErMEfITBI+U/xyFBvbe+NOIVv2Mky8jHenBXjR8CP
 AM/NkpVkrY9hCAiAchj3Kub+dcH1eRIQaGoC33/LkekBl+tmmHP9rJaBEOQA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 99E7F42D9E
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 08:26:07 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8478C10E362
	for <nouveau@lists.freedesktop.org>; Tue,  7 Apr 2026 08:37:42 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2b8095668ebso410392eec.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=YlnUbS4uWceuxEVrdTluLoiVjTg/Va0Fx04t60ygknkokA4OY10khOm+BpaayayggV
         ejhtnt/FkKueFEdDio3GwPWvWgZ/XBc+QNvxx7sZ1VikibjGYdNxi0m9Ql8Fd+4NysD9
         msy+V33chYGVC8iGFpU90a8Jn7sMwLczt/1nl5hPpMLhjf+2d8DECfku2duc9sb7zOIV
         b1/ZWA3P/YtY7+ea5WK7RHHYDiBMmyuBRd34nv5Xv1OiF6xxfXcehASy0bB4HdSL0mGL
         vpzxDQOzHPSXcdvAoM4CyvF7K8Cknyqso/c0Wg4dC2aUbjWuyoS7yTU3aIdZ358gtTyo
         t8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=oQTvNWMnX5JiZGLG/Osb8BdM65u8EdXX85outNAM92A=;
        b=POP0tlzdkbgvvNC+bzW1qLSvE9Y2cNYvbMNZcZcWsFCI9eFHfvr9zqsELyDTOK5+pT
         ZaOSFhfvh0AiiT8VzE9RaRIbqRizTnUuRzFPEEGfR/R0tposXYaSSikx6DldLwU+qXVg
         W+glZ/pBAasjQuOwIqw9FE016JBHKIthepJGteyjQcaf1jTmXzxQxffjDh/BkTwkNlLP
         s0RjNGzDEZ8QE13BvxktjvoS3Jq9y9sERueVHzBdyRSE2uCVvciCT8m4rI/Le0gyRp9l
         bLqmfCEDhhu8xCDoYsXU2oZE5aKle5aMKZq5JFGETGts3coxJG/rm+p+8+PkrrReH80y
         aJ1w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=fGVIKqSeTyYME5T6cTR7/jndEDAj4fFN72oZMGXir+fAD43yqnKwn4G2MD+yPni/lg
         Wz8kbbey9JuUVGX4hy452xFxFmYAtP78X03CA2sfESpwzd11zcbJE4nfJviPzO9nUIkv
         9d93KyBgJvf/XZ5AbcoTn9dvCyMIli+9dyAzKwvz4Gvgctkhj2V0Xs9H9JYJEEADO8le
         HyY7Pg+3aiqC+VEUfILwY9z3YWPfs1/KLmgEQehmyn7LhYOOIjSO2cyQe6WffwyS8JT4
         RTSFsd/rQIwSVP82dMpXbvxZANovFGjUcXEbVtS/5cWKPNl/2VMoJRzNuqD+tQ+JBPh5
         ht4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=K9pH1X9JuEge5fYD/dHY5XJPLw6NbaVRv8AdoxfZVUxO/pusVy7b4X12o+C8mLzCg1
         0jXBOgvTxdTxdsyXZhdPSrcSM2Or97ZyEjPeneacWaeU0ilwFYg63IG4i23rxojY5x98
         txCqX1ptyzFk/TAnTfN3ZCzMf2fBzHj9nXCTClXiX/VqCKtwThpwG5yrS/Frw1mo723a
         hF4+hE1uAwJAeH+YGzwYaD4dhDrco5xumSUWhMQsYqwgSsWe7XeaES/g7ktmLe1bB31D
         Nwsj6nEWlQ2iVJlRVmXNnPciUmkxYbw+KqVAitdL4CCbw6Xa+858h3CrIDE2R/ENo4pt
         vlLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4W6hegNapEEdDyzKXfsjlv5RgqxZBrLwplfwKuRD3bf+JjWztlKCqlyrh5x8ZbTGBaeBKy+rF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLIXxNHYwcixmf5jZKoc9XHBvcgumENclwJtitLwBxLYbSM0Zv
	vtoYwiKz4bTdWc78T+dvuxaoHr6wiFYHLOkNg2mQ75VMBznGBSCr0c6fHJi8dRysgCEKMDYkOWe
	e5IWFUhRhtjAJLgIBX/vKBfnc7j9zviQ=
X-Gm-Gg: AeBDieuhH/NSkz218aC5ujkgdtRhN9V5eqMeRhmCgFPf1Rxp23nulLYCYrq27UXoKkB
	x65YwINX/PeZt6hgIM4rVCy7x4quhM33F7lCb9aIpBSnrzJGS1a50usnBQbJohaJYQUuz/wfDTR
	j4YCOegwgVGAsDJM7yACypF3fIvrtqn6JoV0tIPK26mnpIujO7qBQmp4NG8Kch/TbifNciNIK4N
	7KMkPmScBsFIQaJAnxnmRWUnDgtk7LMk71jALrjxQ0mDCWhb8bVpmXbgj1AqDe1zpmiFNjppZfW
	Yv2Tesk4GldpLh6J/SFe26wMweaXoKSk8e3xxvm5xRx4jsnEz64h6K4vFoRZKRXP1JcCQX1biCh
	tQx5XBO6j1kaZ2hFdLIGLRlA=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
 <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: 
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: 
 <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6BMGWJLCMRDMRHE4DEEV3P6GSSSOOKDD
X-Message-ID-Hash: 6BMGWJLCMRDMRHE4DEEV3P6GSSSOOKDD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6BMGWJLCMRDMRHE4DEEV3P6GSSSOOKDD/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 5:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> You're welcome! Actually it seems the lint was already improved
> upstream, starting with 1.90.0.
>
> Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

Indeed, I had the PR linked in
https://github.com/Rust-for-Linux/linux/issues/349, and it is nicer,
but it would still fire in a case like this patch :(

So we could conditionally enable it for Rust >=3D 1.90.0 now that we
have support for that (and allow locally some cases like this one when
they pop up), but it is still simpler to just ignore it (especially
since it can be quite confusing for other developers to see it
triggering).

I think we may want to eventually re-enable it when we use no unstable
language features.

Added:

    [ In addition, the lint fired without taking into account the features
      that have been enabled in a crate [2]. While this was improved in Rus=
t
      1.90.0 [3], it would still fire in a case like this patch. ]

Thanks!

Cheers,
Miguel
