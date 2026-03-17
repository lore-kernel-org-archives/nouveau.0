Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DDDFB5EAD
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 14:43:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49C9D10E6B3;
	Tue, 17 Mar 2026 14:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="u2F49/bd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 287BE451EE;
	Tue, 17 Mar 2026 14:33:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773757982;
 b=Yp5E2U+XvObkXJZK+VzlaarU9HSZYepDLqiomQBVRvESHeC+HYUa/pz0qpG90/rn9cRxW
 XywWcgLIrBXEN5GT5pzD1iCS3HWdf9hc7Rl9PN/JNN2/80PF0Zpirbk9YNuc7NNpg3sYjT8
 QfqPxFAUqjEjTuZzwYgCWKyjPqIQQe3P4HjYDuZbGb63IcCqygE21W6i0q0ddmh4IpJjN9z
 56JRfre8Bo7QIk9+y1jzLtMrNMPsP3zuVnwOlruHnmwBoX8xkPJLiGZU6gXRGUgHbIPqEOF
 NGDu25K1I9GxpHWDfNkpK+DYNcki2RPXc+3OzZlpzPR9LgLPXo3Mt8lHrA+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773757982; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
 b=IrzsU44TEAKdwUpokGHAgf5NURq7WlWDta5UjGRphXnRAtlmGR3Dau9nPD/LbM1gJJOll
 m3jf/KQr2pHsIPKokno6+Yxor5oKwQW3u6LDPP+INVLrCtt2ZsxV9RNXgU8x8ouI87fgKRh
 wqbCCWnlJyVHlexykWa1cqrH+c+DpXohsbwDR2rs4zSsnGeRitJHVXmRBxqQhqWzyGEeRoK
 44oMFPl7qzyG585RUDUBe9+lvjAnyKg1FqqX3El7O+Rfl4R74B9ljERbqoQr+yBoCbS/uyP
 wGkEmzE0GRb1eaSLrRFvW14+jYEVMvbnB6P0tg7XOq681fOzj70upd1e2NnQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5B0AA451C9
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 14:32:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4132510E6AF
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 14:43:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo4207197f8f.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Mar 2026 07:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773758627; cv=none;
        d=google.com; s=arc-20240605;
        b=C7oJQdDRHw3WcA7BgDWCAdHm+GdGogHCldyc6VtI0c1CfOIfufgwN/SnliED5NKAU2
         siuzdlBveI+JUXHcu5JA6+8ie7FlT9/FE9W2HYT50m+wCktPXePwVdMBMjRsJpkP3UGz
         7ogXQmIEFPxDq6PTKXq9tYBfKDF+BQA5CeAEIkoQm21Ro6ssO7v4D9Md2Zo7SCCZ7NzH
         I45OzRIB88eeL0qd+G72orBYtcP6sVUjZxosz7lvJGIdQjOf5wbZVHay9a3n/TM1kHZa
         BvOySvTpUSIBWHAsnnIcKhv3ZTkE2Jgt8/lPjdwjQr6TruLGS2DD0/0Qa86Xml5gx5hb
         fvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        fh=/ZlazdhzrDBk4RzlSNS7h6Gi7buzpb40y9Kc9bbpOBs=;
        b=Ymiw4+P1qmuxv6nuUcS8ajJf2Xzlr1VepzRjQuLEmg1np1tA1BmjRdzwgW9hMoxtIK
         va/QQBJus1xy+XSPTcRAAWRGSNoHcJc4vEPVJiOV3pz7lKd8acbEWOTusWcgUCnD3Xwc
         uMRWxNrvr9oWbtaQ516G2kpGYd6Vy0PcUiUkUlRhYvHC+tOuNpyZbt/cYqE6m8Y4sH+D
         /y0ISZ3a0kZMFXMHJ0Pe+n+OLREtw5R6OfEMCaCX3nDaxUXwwmKzSgZuI0HBZ8yKFB62
         XdHNSopC3Qv01v+fa4bocCohVkb1AxVzPzEp7RszW1QpUB4XlQtspd1UqsebAKb+ENef
         05Uw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773758627; x=1774363427;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=u2F49/bd+AjvmjJFFb+C9h0/nwNL8ONFv8iQGHMWyL21bsrPiPs7MDoKL9jDDMzAp/
         8LkE+YgNwUxq4lX2vuLTof/yYlMpqLP80V7tWIo7IdsyMAs/CtGBOIrk52moJben3PGX
         d+Jc3BoUecHR/s2ufmOrxGLmHWgJc9MyWXccrSAbl2flfqP/YDiMq5AuukeTxKunK748
         q6Wdct/HLCs7cosrWx9+ruxIDzh4wBx/qcDmTL0QJo6lXQeWITet5jjzHUsfWiUzP84Q
         juzfLv93ro50ZW20IGs5Rm7qNKB416mzQxbnS0jmunm3HbOrq9Re3yDnUbQxPm+9S1Ua
         wp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758627; x=1774363427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=e4Vm/AyWnSH30nPZBxvwVZzzsN9/IOSrdn6MgIagcVM24VOMRP7MgeKyNAdjLz+bku
         BR9VxjEQfJ+3K4uorcgkHo8BRf+DNYw6+BBdMzqVU81QJxwvPo/bXJjsE7Swv3IfUEEo
         GZWP6OxUhrsfJdvrMI3kgvf9dgxrl+iKdTgo4D/e83vDWpRZNuWKI1M1aKg7PfC62Jqb
         3oBh4L0W6AdIO1ZsVj+8PILLXXqORqmvRsfrkjReofdFis436x6G4FGPugQtSaoK54df
         iahpChRTV7LOpC+r2HR5XEnFBNCV/FDw/7Ic8T7eV7zgM9cSEuwdApemzUTBNuTGLuRd
         Z1bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN8r7h3amO3qJ5+F90wffdOkStB/za8yTL+1/GuOPS20r2roWZxB5CeMHQl1VenLE8rEhsBxPP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvAIQ0VDRZCk7doJs9YzTAR8Q8A0nIsyK9kXPr1FeykXrr7YCT
	AuCwlxK4Gl0mpSZQaWjvFPHQfk6DmkdwpKAzgRdACP8Ah+ifxdkJLSLWZF1LpsdYt/PtMVAHoR0
	W4I0R6bOZ/qnZc6FtJK0axm3lH7hUi/MNPK0+JECG
X-Gm-Gg: ATEYQzzY4t3zD8jxotKotMmk0YHY+piwiRtXy4LPQR2uUhGuw/CPETiffq7OArO4T9w
	F+MZrpOzJaZeabdHBZuI4rCH2mEfN/aYJY/DKRDXt5nvWpoIK+xFj+7WZJm+DcdUGWc0zQnl5Wb
	zHRjDGNVwpcxuxosqmyylNJ6qtcl4WlTqdOqEDFNWxz3ldXmd0eHiG2RKV/Kvkrm+ojGaNfASKA
	yVe0VtXpRtWEgPr1tVBMDxq/1XI7vxVKb6MKjju8O0pBCa2Sb/UTQEfte2Rd2JUfxEBwU6oqDuf
	Wyl7SnYrZC18UTsUgH086ne1Zu71iz838I8EkTFcEZ5oBLgzXUfGJDn53dkwACM6OHxZXA==
X-Received: by 2002:a05:6000:2089:b0:43b:498f:dcfb with SMTP id
 ffacd0b85a97d-43b498fdd7dmr7040022f8f.8.1773758625958; Tue, 17 Mar 2026
 07:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org>
 <abj6I9c_2IR0cKJ6@google.com> <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
In-Reply-To: <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Mar 2026 15:43:34 +0100
X-Gm-Features: AaiRm52v56DZ-OgaA6yqn_n9aUY-kVhP1nzCEQDyDgheJLFTSiIY2bIqeepmrHw
Message-ID: 
 <CAH5fLghYV+k5=dYwxB7uRjfSMsE9_=JaOWeBZd_EdoeSQh4C1Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LXW5B4BUBI77G2D4ZAF77EVGAVLK7URJ
X-Message-ID-Hash: LXW5B4BUBI77G2D4ZAF77EVGAVLK7URJ
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, driver-core@lists.linux.dev,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LXW5B4BUBI77G2D4ZAF77EVGAVLK7URJ/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLghYV+k5=dYwxB7uRjfSMsE9_=JaOWeBZd_EdoeSQh4C1Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 17, 2026 at 3:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Mar 17, 2026 at 7:52 AM CET, Alice Ryhl wrote:
> > On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> >> Currently, dma::Coherent cannot safely provide (mutable) access to its
> >> underlying memory because the memory might be concurrently accessed by=
 a
> >> DMA device. This makes it difficult to safely initialize the memory
> >> before handing it over to the hardware.
> >>
> >> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> >> before its DMA address is exposed to the device. dma::CoherentInit can
> >> guarantee exclusive access to the inner dma::Coherent and implement
> >> Deref and DerefMut.
> >>
> >> Once the memory is properly initialized, dma::CoherentInit can be
> >> converted into a regular dma::Coherent.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > overall LGTM
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Gary and me concluded that dma::CoherentBox would probably be a better na=
me for
> what this structure represents. I.e. you can carry it around and use it s=
imilar
> to a "real" Box until it is converted to dma::Coherent in order to make i=
t
> available to the device.
>
> Is your RB still valid with this rename?

Yes.
