Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF2E9D822
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 316BA10E281;
	Mon,  6 Apr 2026 13:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WaEiBeOI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C056E4565D;
	Mon,  6 Apr 2026 13:09:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775480998;
 b=sbJZcnNs0F9QxZdd2PSg80CupgL3hRTvZP9b8tz1HoEmUOvZdVbucEoMQ6jOgLcIqSxgd
 b1AVmnXoXpC8GsFOix3NXBzUaGZdKaTSSHQX22PRBN6qK61ErxsxBxWgABgpkeHIVp74Cto
 R7brqSuWVkkaZ+NOV7SFhmcCFudqgez/FoB+tBJmG6LLMOPou5x4i2aCnJe+I/X0HatFgit
 DBjL+6Uc+SYRWlKjBF8vA3w2NVUvpCNg+4hlzo4rn6bJEvwFvfEgopiswZjRV0NmFlqhtAe
 5ia9SCFnwhC7SkegYRJmUPWi6Dnbvp7e+IvEH+Demzp20n29nyhT5RNAGrgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775480998; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
 b=qNszWFGFqewKnx8tbOd2xy6xJTD1sagc5Fcz/JUqhTMze1Ri/9s+sxPZiqPVdDnbx7Xqy
 uSXfytA9kpCmLT7w6lns35u01V12hgzNtGxYMKKIg/EzFLVpyr3EyRv++fgTE2pw4aon4T4
 rr9hz3Y7rRkoqgX7ePr2j05wrFuq7HElu5gis+Xgj1l6c5jwvFGo7oImowQwPlcKxcLBHnF
 NRwjg7WPv3liIxC1ME5y7AFMCmcPYp3SkVLk6VwVC2LBQAVCvf7E3y7G78n6D6X0UNe2xW/
 e6UWERmZgm+TDUK2FTYqTBYKxVqv/VGltQSYVyKqO45spaDj4V6oZhtW7KtA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6902445657
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 13:09:56 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com
 [74.125.82.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24610E26D
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-127337e3870so199854c88.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=QHdf+L16vhhKzSKjcnk2QyE/GFe+EQa20DzhzAlujb1cQK5uwsn3YhUbNThc3SCXtx
         Zn5dsSHZ7dpXeMGuI2weCci11U5FqqUr1d1EwErk002vtVXpwI9IUxoRUTBbAz9dXWkF
         bwxR52yqwYveOP85ak6RqzcOGL9HCzlFnRqp0jdcoqKX7TeHd+ftamRkl+kUDlePX7pi
         kBFjWrl6nSPBi6Jx0eNY0TgZapiukaWKYgYcy8ufx9saKQzmzIUM7CEz+gFWKU1hPGvs
         1PZ0BSkhPrcWk59V9kz2GP8dHeBFMSeceeclc8Uhz7p2YzXzV3nVizoTVn+HFNMvVvps
         RYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=EbeWPjLeoTKfiI+nHlIopN20t0M1g7mc0vg6YfMJfEI=;
        b=Q6XjpQ1Puz8b7ix81+EnGGO3wV/7JzfAnYGUxGIApLmyvU4smYSq88YBGWWpw0YOZx
         ScB5rtL0+yQ3nwV3FJSolPvbtLaLT0nx9IRJNpatg08hh7kddc8BOEvSRKUI1vE9EScY
         sJFXmzglYj58m8T9kCl2rVy2RBa/RxpCnLSyHu1f8+7xyI1+Ac1iNK+csWefE2cGR3Hd
         unAm3pAtAHpcZvdN0+ycYr/t0PR+WfIX79x2LPGj1foq4uFRydIQgluHKgOknjOJHVnt
         IMf51v162KgZVwG9LX+Z9AV6zu9PEWyRO2jaICktM4A1y/XnEGFysBxx1qlDt5U+/Auq
         Qb1g==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=WaEiBeOI/w1vF1Mz89j1RbdhmCLAVB2toshdPp/Wz/PeDoqFje4y1Dn8ksjDPMvyOE
         gnjhRQz6XJ5Rkm3VlqvvZJld8879FgvOjb7s34HV1lFqrZK7zACoe25I4veEagVURU5a
         xchxnLlPJ8Hlk87v9HpGq2MenV5Fo/K1eQPIC9UOOvg60TB4xVkcdNF6CAADU1j3f9Pp
         vAMAs4nxGUVvkOCvmWJJsqsQE3R/h2HwAkubdhGTSqo8VxOzNxcBNQ5552z7MvEkiWxb
         I623uvkiW1psKDDBrkYeA60Enk6Z4BQgxToU/Sy05E47qJ9K/BJTBEJ7+T6owJUbSKVy
         3vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=T3qNo27kWp7Tpvbm4nol5swhABTONO6lBnexAsX3sAx4iA1NU6/0+RSQquPKGN2wWj
         1s256uyAF2oIQLcG/tY3NMTPz0Ah/E17qzLapDLpk/kSKNjxJZBrxdBrkjzbF6GCy6tz
         yA8ipnW43vtPXick36qfqUrqNkbdpoZLKWnsqYtUqdKmgP/2zO9gAFC4uYX5IoT8eMNN
         oplfKOyHELN/K99QJKBCsGxqqVc8YXwR/i5/eltgC67yCfOcf8d2CdJrC/WLLFzNqwiQ
         +YdmB34XrUOjmxnmQ18ROykqwaoKuhFNtPtIWC1J2cztsNyz2cj2oUVd2dPLgKCx5N3G
         cDUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmWUSaLI1ShqKQ/O0aLDStCZSDDfnO50Zjnp3CjEQ/yESrkkEb9Obr+kkjazNe5b8OSK9KvgWg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygQ5A3WTAdjzzS1pEjwTaIMwvTdhWbxFFgyYu7YrE/0SZcxpse
	zY0lmORYyOuRhaQVIXF4uMo6/iqPmTCQeqgrC5gzZO2cXuUXQWz9D5UfGIymB7saa2p4RaGJs5m
	MMzFqGka5hohdkV5j5pnOpW/kQL3koUI=
X-Gm-Gg: AeBDietaN93MA4M9oEt2gNA/Vk3gCKFygGeVLABwg/P3PKy/rwsjEpkzx14jspFIdbO
	wRurp6gGUjgfxBEB1zIBL1HRIUlMgSwvFXd3FMAoUnmadp6txfP5eCJyIDDb3gSY1vwliRSUi3Z
	gIgflt5AxK/Vo6tWu+EkJGHpHE/cD71GfYGflRyh/8LTAiyl1Ax1l9k4HqXw0NHg+06yw+yT76p
	+GulYBtnvUi7h8Jgj+M1dK3rmQwOfuzk38ZtcYEM376DGnT1fswmxyoInbq+uhmchT2k09ssQJb
	VX7p0v6jByIyGJK+AJSlQW6GERMQ/90P9GPKlCoBpAUfu0AeRPdqJe13V+RjpESb48nWkkyGWbV
	Y+9OUhc9aeb/sPNiGyIaa00U=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: 
 <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust <
 1.86.0
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: F7PLMG7RXKKJUWPUYGUTEXONGHKTNFSV
X-Message-ID-Hash: F7PLMG7RXKKJUWPUYGUTEXONGHKTNFSV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F7PLMG7RXKKJUWPUYGUTEXONGHKTNFSV/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel
