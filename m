Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6292ED7B95
	for <nouveau@archiver.kernel.org>; Tue, 14 Apr 2026 09:45:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21BBE10E58E;
	Tue, 14 Apr 2026 09:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8DFAAmc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A90545801;
	Tue, 14 Apr 2026 09:33:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776159224;
 b=nDb8+HhIJYcw+owuJmM/CnpjM4MsG7x3rGFX+0E0cgWwL5a/3hR/ZyLB61KGNZGfC93L/
 uujOYduNSDhMv929XhM8RxGXGV0IUWhYdvxeZBbb34L0iSWc2aaqmIWL7FN1Hbbf+EgUtUH
 P9uXT81V4ARuQ7i1tvGmOdlpn8NAUGwtj0Zz6A6+qkU+9psjepB2NuZA55xFI56z3cos1pF
 1NtrNo4uuFslQhLhX3/NjmiQIJ5VNFK2U0A23iW73XrdBkJfkkoZsy5KRONV3wXSxAKTCHa
 bJJsytY0Bk/ZEmX0Z5j9lPmGJKEUBkSVwWwS+/kHRrwQ1eeoesTnHJD96vPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776159224; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
 b=mixRgLcOpRkO69BiQlwBOTCTrL/kS14nNrg48k/lluCMF7rEuOouCKAZp1QFr7g7mb1ya
 Lnp9xTBIo+h7W2zqQWPw0XVenz9UC519f65GSR6hp/Myi1T6OW0SxDxmGIk2noEtVIhZUe+
 NZsG757dYW3XDtMSeUNRCeIqktoz9rZp8eeDOUCP7OgK90h1nHlom6OQgmySau6jUnmYMS4
 OsHNVsGNexq86F3d/pKd59tnWi4KJUCUC7ukBeA6cdAeBm/IXkivJI/yVCJyiwXKDllqXnl
 +7b9A/otRjd34p1jDZ+FyUXut6HR91jmUq60uYjkK/oPGNL/YNEYXTz6LBmQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C1FF843481
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 09:33:40 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com
 [74.125.82.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D48D10E2AE
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 09:45:31 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-12c22b9bdabso358903c88.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Apr 2026 02:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776159931; cv=none;
        d=google.com; s=arc-20240605;
        b=VZGG4wcuPDTSVZoAVTGxx9g4hdIE9jM3q38q1dLw5PpLKBJ2suHpgM1PP0QcoI3MoY
         t1cO5hY029khVsajZw+eIZ0qUCWoCoORzyA9SIKW2IGz7h94rUtExqtxTgTTGLAmxG5H
         SfY62keBNGIysxLhgklsEWazK16f1XUlH7GUgyjGnab/QX5paFNBugslNB1SA21apuFJ
         XKlxtDFaH2BgnSaWbYloMC53YiVI99/JslHe58N9NSB9x11L7n7xi830aOHhFTkCoQJp
         4FXTXGTBjlvDvtfYlv5cKTXReXjItFLIN8/rXPivRce0lSSj+VHTWHr7G+t1+8U3isPD
         9vFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        fh=RuocgSNxRylAkTZiT2Ws250Ce5ijpKoJrVqYOAFIWB4=;
        b=E2kKw2KLQ+RkarRI32ytvKOjxU5vvegZClA8hdDsvt5VZjLU2roxHSw4z1a2Pxpr3f
         LMVaCCy084wF3aW8IVaZXLLPMQRfmdSWFnFZsBOkfcNq/0y0gbImdamttS0trSvi1b7P
         udZFw8W9OKaOzAJZhvepdpaBXMxf8Eqytz1prkPw8tJGbW2LTwFt+XvYSQLYZvnb0cj6
         eMEtq5kA/Bd36WvSzCy2z8ZaRmLsVGZpSu1unMHxHX7DNr6qKhQlNnKT29uWe2zkKGOu
         ovukKl0UICyKDX7qmkZBKjEt0Hyex5dqgVtHALanOdd7KLNSQ9iqk4ZcSk04rEJ4/rJw
         VDAw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159931; x=1776764731;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        b=h8DFAAmcC0jihH3p0NDa6fOhpyrbMIBuM1JLF0TxiTBUR77o9ufDdMIrJ1pg3nUPuk
         TF3eGAGG+DVS58pL1hnLStQ/vNUFmydGbTSXWW36U5IFVKlACzMLJwNyjHuqAWR6K22S
         X+TbsSesudj20vwn06yBEoxuOXUS5R92ubZIMAAdrN9hsZQ1D8A7AI5Lu1AG8sF2czDH
         LWHyZKFAWCvl67B2dBcx+Xz1isfBgnc4CrQ5MS/8lFt+WutxfA5A4Of0EdoBgovFFlCU
         BMJZcuVJtWjJLZP1JztVCO4loYeQ9GxY7Cts4w7PjNhDHZ0VV+WcLc9X24qafOYU3ttr
         +Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159931; x=1776764731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BifoUN0lCjPSglsBGrfukkPwA7nKDKiyXMBu3pBIyQQ=;
        b=oFsJQKRDMVRMpcqlwcJTHyYU8kgUIQh5/9R0OS/Qqa/JPnx8QyV92rTzOi21ZvsUl9
         HxzTYft9a3LVowFSus9cF3+cPI4ucV1AiKDjD5sNflBeURnuPM03ZIHrY2cRvs1HJmvD
         Q/z/yFhrW4fTL6x+onlLie2ASlPjrVypCc5u0v4H5QK0e0lUf8E2z5n/4LG7j3Gc3B/f
         /lc4WoF/kPGx0yKeJUSUxOQmBE+EFL9ra8aS50vqVv5F3xRpH88P4P3IU9dIo2oYaA2k
         cl5ao07oChenlLHX8yBNU0NDaNvZ/rISfjl0fyjVBx6oUF0aO/gy+8K++njB5Onc3kiC
         hoFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/40dLykRokjsZuwjqYmV4EUdEKpdfrjpkzHBjN5HptvW9gWsxhfAXIT2vlQ8g+2RcIM5d8clqJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq5kjCPyCzYnXBzlWPvGYQnu1pFz63LRXGdqao5ovPcnc8ohq8
	c7YJt4RZ0w6a7TH5P10AkDolJlbH+Mv+VC8WBsaQhnabtWYZAts1CWX+WYOIuVBFDl5YOSBbX+X
	bfvMIALD4lTuie4gKTl8Koo8dvK3qKlM=
X-Gm-Gg: AeBDievPOPAoAowA39fnawTO5oh1bfYTfrSdDwATeVWJr4RxgohvmiZ+N6SAG5XaDtT
	dU6QzIkmP6CtAu7S7STTOuLwQNgceqZedTc8pzpjhqXapK9OlGAlffMhlo1i5JNik4240HeJXMh
	PdVia3esdSEal0u31RPj90UYB7NE8qP7Zavsl/2XIeA5hDfX6VyjBf94xpB4aFEF/YXNvbxCtKJ
	FTf/ZEQLqAr1AjNPf2dMxxmP2NlCg8Zf3W0pPeCQml5sM2Ak3X6dkvxqM1drjmCTxpRT+D32I9Z
	jz0zvqOD6bV/YmzIZ2A+rvvVh7cLkSejVf9JRnMUsIT8CZ+QWaD/5E0nVDKgBvV6S8eYsR3XQSE
	DJY7gaHmbS56FMRYtuT2ICQY=
X-Received: by 2002:a05:7300:6da6:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2d589ca7743mr3954484eec.5.1776159930459; Tue, 14 Apr 2026
 02:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
 <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
 <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
 <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
 <DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com>
 <DBV2Y6TJGVZZ.1XZG9FEIWYDBU@nvidia.com>
In-Reply-To: <DBV2Y6TJGVZZ.1XZG9FEIWYDBU@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 11:45:17 +0200
X-Gm-Features: AQROBzAvRRNKhjkRJeRP7VaiGqCfBZwB_RcAn6Yu8lYwFycjLDw6KlutGeRCRGA
Message-ID: 
 <CANiq72kV9nN65mf88eq83_1tqOMj2CNz7BsQq4SAafUe_srL9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GINCHMRDJDFUSX22AHHZHMJCRT7PXQTS
X-Message-ID-Hash: GINCHMRDJDFUSX22AHHZHMJCRT7PXQTS
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GINCHMRDJDFUSX22AHHZHMJCRT7PXQTS/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kV9nN65mf88eq83_1tqOMj2CNz7BsQq4SAafUe_srL9A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Aug 6, 2025 at 7:02=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> I didn't expect that, but it looks like the Rust folks want these
> methods after all:
>
> https://github.com/rust-lang/libs-team/issues/631#issuecomment-3156000663

Indeed -- and now they just got stabilized for Rust 1.97 as
`{highest,lowest}_one`. :)

(They got implemented in Rust 1.91, so we cannot just delete our
versions, but next time we bump the version, we will).

They have also stabilized `isolate_{highest,lowest}_one` for the same relea=
se.

Cheers,
Miguel
