Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC77E9A05A
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 18:38:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D95C710E742;
	Thu, 19 Feb 2026 18:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtaAo+jL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 330FB43423;
	Thu, 19 Feb 2026 18:28:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771525715;
 b=MPmN0MPJvPxhM1WQ9vRs3by3IGhfrUxgGh2hPC9FJ6o31/1vlhPzGgCxyVsAs7U4Bn90R
 CfhTXWXHpsIVyz6Lp27O02ipabrah4dsZWKSyEJs2ryad3WF9lG1Az48aJr7lnsN8yfw6mc
 RDDE1lsDIMVC1G2Zi4ki2ETd2oC6ITiU9qdWcWDxf3GyOlmkSFL7lll5A56lvtpl1OFnTLa
 dKNR8jfrYpr4AN1s+qrXXFsml41tdOQtMio+4OebQD+z/1qewr6XJCG8oEC7Tmys39ydhX7
 61Iv98+kZlc8dOPLRjIZS/2BJJZ+DmfSiLI8u2QCHKunrbSzWWyosVLUPi6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771525715; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
 b=08f7kN6yUXxVQSiLuQOrS961wfPjkhPj7g3ReZlwRmtxbt4HPxeDeSp2UZvrq70V81564
 GOoT2Rb/0MIHn8w3rKMPPfgAlxyTFS8dKcuFBlhLd2Kpc31QEGHr/I5XxN1w6HajIFNisUb
 xorye2sEyl1ner+qAKUq1c0FT3irnPZ0EgeW8LQzkG49w3IDg8WfddDb7i+MD9g9PWW3S6P
 Twn7xArlmkMU8uUoh9sNeP2TfSGxNyjocblGuKgeL/bZFc6j3Z8T4PFI5RH8mabmyzeMGpW
 O7Zv/oklwMzTSIsYS9Qhk2Y6d8X+uQsaPhqTjpOeWPwitppZ65JtILXxOLzw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C8A5343401
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 18:28:32 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59310E738
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 18:38:24 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-12739fe9a0eso129483c88.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 10:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771526303; cv=none;
        d=google.com; s=arc-20240605;
        b=gN5m2cS+0H9lZ4QKY07HATQDrudFhTohfAnrq/yhCCDE5CjhqEGQn4l+6litPMbXAM
         ocCCWzVpij5nPBJYcUnz9AwzDTgFjx6KCi93VspVw2ZoNdq2b5jEmaThZJ/aUwA8t84y
         TwuOlzuiXoq1mEoF6spB4gGPcyIB4RCDc91Jt6syijwuOGAyFPlOU8R4IVFjDfoKtbQh
         W9VwTOK3peRnnwbQ05+LYovxbHl4sI0z8N6CDnT4Nh3/EV2vAXHnYW/HkQKI9p3r1e3L
         Zi1EJNJcxbPo/dKrPNYH6yDHfclY1qe3JRqWJA7MuojU+5Nc78R0alhsEad5raastSNu
         nY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        fh=4lWvka6ZE5AnMbKO04bm81iiNEMwvymd8z6uvU8FMFA=;
        b=NB/Z/ELUVHteknLkLuV2B9InN5z72YJ/+JaiajeTSb7jdKtF6UjsfcbVAlz7X5kHsB
         ehDPZDf8bBPB4IKcB6j9ePXfHG00pLcpzYUN3h/6+dmWr5Egap5ij5B6owVZvshWhZxn
         vZUWVqbZnEJVVWsdUdhHNMwIVZQOsRuIu6TWC6GZGxH0/RdpAL0UQ1NuMOqyz5TGZelY
         cuvSScQx6HUvsH0hLsQsgRH3o1FAS3RiFqfj8cR8dJiZfUGKFaC4kKUuQ8pMCelrRWF7
         SjpWAfJyQP73tXl2KpAahlSdukHtMTqXHxyokxiEU1hKTz0BKaQj+UUl+qmU/Qiayf/8
         kZ3A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771526303; x=1772131103;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        b=jtaAo+jLA6PodvlGAb6g0/54DyPTtKG+pcU5x8v45aNnd87Iv1ahJGLyK+RXxZMfUC
         aMmva2CsJYDNE1MdQ2bv1ddAEDSKP6IklmS3iNy3rFhMcPs8JTtkHzzu35v9LVjRD5Fk
         qPR/AjCaAKdigXVsmdufVYo8wp+/NmqPNX7DyoEISX6wiOGqO9dXthsNUMy+WIEp2Ero
         bo/SKtGVDj34v1vZNaoLLWmPxHlWOD2GxX69MPadNx8/T9Itjt3fEvZpU2Tb0QJtr3gC
         GyldHdsXGk0w39Faf6Wqp6tx2NbK+d0AO0znwdB5r8xfCLfqYdjBZcI3v/I+pd2T9Tjh
         EWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526303; x=1772131103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/99nRZ95IjeVc75LvwCdBJOe5YtV3DPyqkMVVh+UtY=;
        b=jZWfPz+b1d7z0XeAqtEzjI1l7hEZo7Mcd/Kg29fZK91NxAY2KX3MuIpaqrvgNvVEJq
         hGL1bq5lSDWCHkKkOzrAZuc59D1xA7zfn1w1Nduyozho/QeSYLkbNIu9L+Uyz5JI8ddW
         ByXuADZMlZ/MpAKDWAIzzB3u4bCD8gzA5isGx9RDEGGiYdu37uc/u6igNLIJUPuLKIBE
         hFq0GyOxvJHJt4Zge9dJG8/ppksytWuwuxg3yHupKG8bDivrZSyeekwK2hVgxYT2oKl0
         CL3bPG4l3vp32wPEB1nGvEiKI3u0Mvo+/7RlPX0CPmye8C09ef/NII6f4HWtAd15/Ued
         EIjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX98Z6fN9X+ajNFh4P8ZJEbddQETzUo5MpDD4Jyfr2EjC6j8fey+nl9vxWHoBgW8k/aUcnxbJst@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNeT/A8pfkmp9MaQ9dsw5QB/o1xQvD2j5EAihEEfeZTqrTbs3h
	tTk4W8xFdiB7uH0IzAU9MFgcpUx4jErU6Zdp0Rn6JOColFu1SLp/S7EgM/Lb3ZMqJhyfsufD/ph
	2njbiZPZtBm0bkAZWBdgwspyMIB2/iJU=
X-Gm-Gg: AZuq6aJ3nUWcr7mK95Jp9Xjn/2B8wps8jy4yuZCPmBjzLY/9fPLW5EOllzzYYVpBNrL
	u6o0R0gYfs3zR0+qP0kMkT3ySHbUT7AZ3Tmsdpty2mIUfXWAgJ5/SOrEFJVw4xD32D6azbH0MgV
	SDf+T3BDNHiEaLqFvd/Yr5VL2yHGzQGoyXr0FKklf/nJOn82wclsDFYn7ojSr6v+hQ55oLlHALM
	asLvdMtTVWhxIb2xnxMQYWj092lNKXwkMcJNPPQc15/LQIpimCj4W9HGt1ny9R+yiyat3GTDxFO
	l0uWLWEyETsgvKH9hyxRMcZ2Vfvfzo5WA6PlQmPSzyUSbFfQMypWgjsR9Eq9TQYoh8NcVkGwjjd
	bvUM7n1oClAuEILC4yhwUYzis
X-Received: by 2002:a05:7301:9f12:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2bab9fdaf9emr5325750eec.1.1771526303423; Thu, 19 Feb 2026
 10:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
In-Reply-To: <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 19:38:09 +0100
X-Gm-Features: AaiRm53j9rn-ZQL0hiiQAUk0BjVlxqB7i8xeJadkWVN54mZayvqJi7_JF18SlVU
Message-ID: 
 <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: N73R2UULVYE6XY6Q5F7WRN7HBILL64QF
X-Message-ID-Hash: N73R2UULVYE6XY6Q5F7WRN7HBILL64QF
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N73R2UULVYE6XY6Q5F7WRN7HBILL64QF/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 19, 2026 at 7:07=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok with=
 this too?
>
> If all in agreement, I can make this change for next revision.

It would be very good to get you guys (and NVIDIA) more involved in
general, so thank you! :) -- (and Danilo for proposing it)

Do you want that I set up a branch for that like `rust-ffi`? It is
usually what we are doing lately for things like this, and slowly
splitting things into more pieces. I see you both have already sent in
the past a few GIT PULLs etc., so possibly this is not that
interesting for you, but we can still do it.

Cheers,
Miguel
