Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE4710ED643
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 09:53:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76AA910ED4E;
	Fri, 27 Mar 2026 09:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N38/N38P";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F7174532A;
	Fri, 27 Mar 2026 09:42:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774604528;
 b=WGSFlr0caq8S5qBRsDJMXXD5FSisGrCIEF3kV9gOVVmkwbrW8fZBnH0dCRC7sku8HO5M9
 +Bzk22GzruTNf1DHj0CFqGn8RDjzD9fDO+4faWCkp6VCiC3nvxTsWFpA2Xy80wdMVCBZWP4
 AthUU551O2wbsjVWm7yAjgJ491H0ew1S6xcDnJWLkJdq3Q8tUZKUdxVmKONHYVhYuY06jE+
 o7IywqfuirO189EMIdAzBnu5XJKGukn4FmLYiupxzMY8HOIh+fsEfdu8MjiDeOxMRaQTnOC
 zMfuU3p9yOs1pCxG2DVLEnf0yZNUtkYVOrWIPO95We5I905tTqF1n/vGW6CA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774604528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
 b=UOEh10UHQkU4mkauQt3gcf617L9NOcn4cztKdfFJEMMUnhq40EMmunCwO0Rbm7RatyTzA
 Cm+srwU36jiWZqkxzrjxb9f7tK8ICz+/iVi/LBSzGPd91M5kG6WgD514k2h7U5E9CEsz5sS
 l5wW7WiPrggFK2j49IrIyciDis5nht+Cy+SgMXEB+XNQYtW7UbT/HF2q+m+sV9VorPUNxXi
 Wv82Do/m0+qFgeHzIKvvAET9Xy6AjToNNuecpJxx2ucs2ZPIZGHWVa94OPZGr59rF/+/FdG
 +YLhOLuAS4VV+RUWaMqOSfX2aoFo0o5ZXxshFGeips/TvpOU64qqO9vYsyWw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D8D9344E6E
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 09:42:05 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9290510E2C4
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 09:53:16 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-12a6b260693so247811c88.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 27 Mar 2026 02:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774605196; cv=none;
        d=google.com; s=arc-20240605;
        b=WymEAyVG2RJLuyZhBP1g1e1vMrWTXSCphjxv5VK1Ui2TcKCygnq1UfrTdgUioz8rmM
         aYtIz0eesT2FdP2ujxW14NUzCOJd5ogOQJvDNO8/xhRB2jvBt7dFhZ/THDTBAJnse9YG
         YChAnorw5pYpJYL6rdTaLb0tSD9ehNkG3jQRIEGdB3Wp2NZGSVr883MEgvv3LQlxMf9r
         /lLjtNU7bS05/YdHyZECXnKBG+jn7B7EI4a9+jjrtyDwRHHZonWuvNHbRRylovSqsx99
         WD75YlolFYziUBsfRZ4ghfTkrdmRvdd7OK/JI2VxZHliFnoJD6hf/B6XQJlP+GnmOZeU
         6ncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        fh=NeXXB2NHnlTuomexJHNBgZyM8eqR1U3ggVXFZx0rxvY=;
        b=GjvZmqRJMrfrqUED1KjIIQEkNbrwh8FVNWGjYx7oo4IB/x69aKxv4QFZ0AUOSBg9yZ
         921hrWjBL8QjhewbTR2q6774CmpxjMMbffqFK/+q7P6QoxzMohuul2w3ezfGv5vQvuve
         f50/BLkopEBb39Of8oPrigwq1raDBk86Lwp9CcO17me2P+RRKHVjtTo+0sYQxDcZb/bJ
         JP7qmRjIA0l4A8oyeNEQZp7OS/g1b+muJJJeiaLF4Bg+KvuY4g4+7mQ2owyCmWHidLr8
         /QM+zQXwHKkV62N94VAE9CAy0uJZumJpB2pNBtJfdyPR6bZDUVNBW4lOq1gZiqUAmwJf
         90Kg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774605196; x=1775209996;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=N38/N38PlpCXALpyKHlmoRGnEpT08QaFgWOK7Jzk+aZvmiZNSD/KUkctjizLfwNiUl
         qIonNr5J8RwzMNxTJOTG8OgwxZob/oJ4fwCgstkOKMkvcIqdFTF1Z9Jn7TMfNprsH8mE
         rE5CCMqIJDrtsFn1IlE9raZXURDIP27JqTvWj/MXjAN30ZjGBgMobSyeA/DLPHa1LnMr
         Xqfqe4v9wZhcGt2qw5X/mkN/EfXs5SToBhrTcvEQCxXVPpSZ2tKOEI38o26Bqx8wzznk
         bqWwdCaz3bGC7nbbjehErzlUncCSW/Tx0F3S4mS8Wv/tCYMeBm1SY8gMv17+aup69rhf
         5z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605196; x=1775209996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5btyYX9lHdsVC1fopO/cY1LA4YDt+YdOziS7/7GqeI=;
        b=iAgA50UolYRyK1eZJTV1U1xhXzk6Opp1iRrvu0mascCvBzDBXEVtfwPMDMljK+1SfE
         6Ur3FeOA1W3i7Yv1s8fIQKSxZCjnkToXuRjKY81KPaOtOc1qZq/8s5e+RjbUIyx7xBcg
         QpojhHmp02/l9Pi8J2nmmfMDQQvXRgPTX9ysZaSzIeVTVR3mw6kWs7aXPPWpdUEoieuf
         LslcSlWzY+GXPtTGTcSmkFjAKc0JE/R+FjZDfuDLQkoRslJstnMV4aMsNXBoIplRxKB/
         dtw//FGCX4EAlKOAqQEuGVPSl0nililpMtAjZ2uCA1cbDX4U44o8HK1c90zel0jZgfBV
         Ej7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ/BgpjyqmfMZ04VCYifETyv6OnMBqPVNBPI3CnerskZRuTpUfPdt9jHPy1citpqDBSXg2s6H7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHsfewdJnwMV/mcxe3eH62ilwkzbyY7IXaUxOYLRpkMFO3qEV5
	XmrCFXF3WtpiHL7KueSd5+UXdqjBe1Jv0rInfD7L1ensc8RE+IREWKigRDhdY1a5XG18sEPHemb
	p/y+GcCdPAS0QwW/fDD14HR1yeDaBX+w=
X-Gm-Gg: ATEYQzyKNxJV1Kf5Hc76dCuiXGLcafBqQJ7TeH9WW0f/4kvMRxjKVSRutBrFlLBvcDf
	3INEgvIizOinXAtYTd4Y8vwTvPqKVzsKx5g5Ojem6o3c5FdYLaTR2sgptLeJHHJMOr/uFihF3WI
	c5PIse3gWTH1OhWeY1Q7M1hOGxrn/TmyDYCPYlU/nn8lSE3WuF4xC1aNKjYWuNCA+HM1vKWL7qk
	Qgr2lcVcBez7ojegIVdxRifviCYreVp/HS8dCgiizoJq+GIaNGAYBzs6zNoE1sNoHOiOf1es3ZN
	RY93D0fCISeJvcI9tre6s//x1wDn4GRSgZjDuQVJQVhgwidFdds3pwE+T6p/m6/PfO9dEEpt7aZ
	eIDswbCc7a3to71TKJjris11QJYy6GgxkHA==
X-Received: by 2002:a05:7301:578e:b0:2c1:82a:8711 with SMTP id
 5a478bee46e88-2c185cbaba4mr489012eec.2.1774605195712; Fri, 27 Mar 2026
 02:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260316211646.650074-1-lyude@redhat.com>
 <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 10:53:03 +0100
X-Gm-Features: AQROBzCDQRLEXYtIjvWCBTRZrsm2z1WTrrxZiqYf_IZKuXYInSunVO95k1Dfv0Y
Message-ID: 
 <CANiq72muiQzRkvcEZNUceqxvDmUf0zPLaBvQRH+EfDSS0edo+A@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 55T6NLJBST2ST3PKQWBWXMV3M6K66FRC
X-Message-ID-Hash: 55T6NLJBST2ST3PKQWBWXMV3M6K66FRC
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/55T6NLJBST2ST3PKQWBWXMV3M6K66FRC/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72muiQzRkvcEZNUceqxvDmUf0zPLaBvQRH+EfDSS0edo+A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 26, 2026 at 2:15=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

Sounds fine to me, thanks!

  - Regarding the enabled unstable feature: looks good -- it will go
away this cycle anyway, so we may get a conflict, but that is fine.

  - Regarding the `&raw`, that sounds also good. I see you did it
similarly to how I did it for `bitmap.rs` -- thanks!

    (And for future reference, the `bitmap.rs` one was 1.92 instead of
1.82 because that one was for unions, while this one is
https://blog.rust-lang.org/2024/10/17/Rust-1.82.0/#safely-addressing-unsafe=
-statics).

  - Regarding the `expect(unused)` -- using `cfg_attr` is fine since
it is a simple case, but if it becomes a big issue, then of course
please feel free to use `allow` (you already know this, but in case it
helps others: I wrote some considerations about this at
https://docs.kernel.org/rust/coding-guidelines.html#lints).

Cheers,
Miguel
