Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EBAD58CB0
	for <nouveau@archiver.kernel.org>; Mon, 23 Mar 2026 01:39:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB9210E294;
	Mon, 23 Mar 2026 01:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4bResP5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D080B45289;
	Mon, 23 Mar 2026 01:28:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774229285;
 b=rn5NJXPefq+E/l2BUeT1cDm/KQl3IM2mJ+nDNpeGCj8SkL7tUpOf+/Fb1NwTHVr2hC6bC
 8WvgRFatIpLeI0QOkU+2e3ImC4CT/naM7DsG0jyP7ExWxZ1pc/nR7mNNvPvTN/jICtvrmce
 6xfpXMrFUt9du6wtAzIXy9Dje84Tz52+g1dtnVRmPsqEMDzZxQn1UVWCn2QY9+rKGY62G/H
 Jq3KftqnFUcNodtaLT/T6C0r7+g+WtPaNGY+nVJ4CVqUXjiChngoG4sG98lcKfrVnia1WPr
 K6ai/Uw2qQNxATe0DfURpx22xw0AwCKlZS8b1bLHqc0+xrNtnz4HOAEHbNZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774229285; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
 b=HFxklIZYE/Ifj8CWtrmFtNb1l/MmPZhpNO5Zbb8rSwI+E0oQyBWuWvTCkcQcNyIFrwftf
 9DCw65L5tDnUgSUqOzLb1yo6BDGHjQ467HQlg6kPaoOZWIUzTI8zDbNaVL9vUdt2AholneZ
 NFKu0yv5KOrW2myKj/IpxXFTGdPJ6UOhWJkulFu9qOYWuQLdEPuw3FNoP6qawRt/j5sxkjn
 XG3iol0Frapb5R8l/5AG42kvz5rQYh1Qb343b4/Pmx462wJDmOM5MnnikzbYjg5gnosuYwT
 e/YBSGOT9TWhp8k32a1FxPZ2E3batUa51j5P5i6pfSZ3F/ZMbE77pYIPTSgQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F1B2E40214
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 01:28:02 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61210E255
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 01:39:03 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2bd5658b901so137543eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 22 Mar 2026 18:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774229943; cv=none;
        d=google.com; s=arc-20240605;
        b=Cg4gWMjKG4lSzgNeoi7CRGgEgVA2AQd9YXW+sVSzR5fnlpRtFCVDd9WtGWbNilaw6N
         TB4ut3gzAnDSEmlZQ0P6BFEgaWEjwtqxvl0hh+nvszPBRpstxOxl+fgE2c+IKl9EobFG
         LdgqwB9rYOTPqPrrfDgTO2OsC2WDr6bPY7IAe08hqgZFz/X+NlyyPjRUF9+LTdl3PJ9F
         jjiz0oMhAZXBwCYLyMp/u6PyeX5BHAn+5N0s9SDej4FSTCLiKadY3Ljfpm3qHxQmxINX
         y4sCHk9b/+NRESG8FqhCJw8eZbCmMUs6IicDgit+OaoIipJxEgh+Aai0Z8sgDm1AYx4V
         naOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        fh=tFi4zdrFBFIHB3XQrPNa0k99t7viFmKT38JQSaW6rAA=;
        b=bYL/mG4kilWx3NjFIVijjILT5SdDxH8hqEUEpkVkhHcBJx/GO5L1K3hEaScuRZ9NVR
         rm1+bf6j1MzNtZnDShzwzUOJgn/BhMkwmxI46Dxwx3vUFUJouYH7J26QBbqhuZ4XBP05
         8pVDvZEccQ7t1sODtjPt0PK7opJo2P12zt1K4Mh91FJWvClRNtZrIW9NvRQAPkoHgMCc
         IP38+WIWnzyTVt6RHL6qdQOk12JZiIBsEC0x19ps75pQtcBouXh97dd6RXLIsVUYQ2pc
         ErQUPZlg8J0oCkYUPRpLc7/pDVGeu7XkS1KVzPcCzhw6ov1ZCBJX5iAU/dNs9AgurJ+f
         Wciw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774229943; x=1774834743;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=T4bResP5bSsY9jkIfy0jNBAVViIz9+RUxKyKIYYanRUaZl3ouL8S/MjzN5luT0woTG
         W7FOXEWi8NCFquNake6/UWdnzzRuidTV2HCn2j7UgKosD+QAqs7t1tDxZrRzPhsWr+9P
         kpOZ063M2GnHr+t7mtZd5Z08T/3GDBH/KM4q2g2ZCJJ49FkN4eJewyJNlaMhZodXRYQI
         J0D/c2oZybJRXljHYx6YlmUg5+kJM5tynGxBdCg137k3cgHMUzI6owMfFrNBjsh3og6+
         BN6bNT3f1HzBJ3U7sDuXnB+mD+vt16AxXO2bI1yiZMdNOKp/WHNZ5K3cgga9RFvxllvC
         gvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774229943; x=1774834743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=s91zinuhkiY+gkZEG4S0MfN6JMGMzLtthJEWOj1FepWSwn7QzAt/40FoTzMvWeFM6Z
         2tOkmmuiK2qcI5b94MIdrXCYOthCtFmuEnCWbeTLCHWQpMfIlznpUIJIR1FwAfrdiP+6
         Tgf9SsCzRHiHr962x7dYbFmzDndjZx1ldIGKsTP4SWDqnqH72DIum57iZTawZRu7oIAC
         0+rOBkkwoNq10+PucREF7DFDKY0YHZ5O/JdIbWtHfaq8OZ1t3EoF38wLIEgY2Obtuprh
         euAL/6HNmQUCpmCF+8VK3tsaezyMMWdm+063K8uvZxR+G3wvwAPnRQsM50n75F5QSivS
         6rvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEF/dvaSJBGU2G9o0CB9oKyv7baYZUxcvmHjqascY6SnnnouXwRpwDIBy+FF2/HpxLPGHJ72/C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB41PQKD3h6uTgOJ7fzPD0pN1DprRqEbz/LddR92ivYuwveni2
	P9spXwbX6MN2PkWdE4c0e5NwA2d36XK1W0qDAxc1LSEDawP6KD4kgXAirTMZxjd1I1b9ZdzQ5Fx
	gKVt0tl0pEB3aUZR3IBE5meDFjon20pE=
X-Gm-Gg: ATEYQzwuc77BpUZEXv5Fk+Gh2V0VbEjIrw5TyKT7J4t07Cq3xmFPLeGSSjfc1qDVRl9
	PrRRSSGmV2Ey8nRdVFsamVSdXRdGbrhW4SdL5dlkayVYfTBRqtFwJCc7LvkmytYk4P8kji44uCc
	kd5rVuGpCpf8lx95gSZ0xdQEQTw2o56XmcgOAI50qztPpnsnGxQIxYhbDJrm1fg0U2AcBKxVsSJ
	3CjTdcStL4vqAhvSLZZbtuXvDpe+O8s3M51Xn1dO9CuFqOo0XWnCRNcK8geKHTq5Cf/xW8IaLJs
	FMXr3nb8t9GX1iDHzvV4i5neS74PsApU4SGnD4oA26jOCtEakGPIes60WO2lBCcqhZ5w8wHb7sY
	fZUwYe/a5rFUCojbh9eIKRYs=
X-Received: by 2002:a05:693c:3118:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c10973f6e7mr1912078eec.5.1774229943149; Sun, 22 Mar 2026
 18:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
 <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
In-Reply-To: <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 02:38:49 +0100
X-Gm-Features: AQROBzAdgpVg6NMG5khS7OAHwybEFX4tptApRBIZ_6EE7KPQ0oZWmoN7Dzb4nwM
Message-ID: 
 <CANiq72knM0_w_eHbu1qV2Ps8KbST6KcAZRtTH9FEd_5sRMqWdQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4IEMIYCCTAR4T2Q3CTVI3DO7L6RBF2UC
X-Message-ID-Hash: 4IEMIYCCTAR4T2Q3CTVI3DO7L6RBF2UC
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Tamir Duberstein <tamird@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Yury Norov <yury.norov@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4IEMIYCCTAR4T2Q3CTVI3DO7L6RBF2UC/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72knM0_w_eHbu1qV2Ps8KbST6KcAZRtTH9FEd_5sRMqWdQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 23, 2026 at 2:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> (sorry, assumed my Reviewed-by carried an implicit ack as well)

Ah, I saw your tag for #2 and #3, but not #4 (nor #1).

Did I miss it/them?

Thanks!

Cheers,
Miguel
