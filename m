Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16DBC531F7
	for <nouveau@archiver.kernel.org>; Fri, 20 Feb 2026 01:19:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1B10E766;
	Fri, 20 Feb 2026 01:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QaJHd0qT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7BF164343A;
	Fri, 20 Feb 2026 01:09:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771549771;
 b=ebbfKuMrVeP0ECh7zF9Q1HmXDv2rWUDvv22VJrSTCYnX/TVJJogQSBKHVxmUOqkZJU8hW
 gifiXDB7O609T4o6qwCgPxNyYdkUynfDDR6/NxkZbvcS3Tr+OiyO0vDMRsaZw8WgGYWpVTm
 KMVjabGgFtYkpSVtxedeFpZTf3MFX3epwbLg80b5dVunfq5g9IOyxaxoXyMVxLjiQAfwtLC
 MbaOh5UmbNkmwISOyRbw4eiMfX81IWqauuMTUTKhqBVI2MhWmu/12q+/PqKvgOWl+LcwXKL
 RWNu6a0M4l4c2FHD9ZGBgR5uLJvFwrz3x/rupaeGIBcVQGtTXHz8VzY2Rblg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771549771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
 b=v5PKSyLJh0Xs3mWWAMc0wApA3IfKMjay5tqdSVWP8+qEa/qeeXGm8BQ0GVTQh2+9uXRMS
 jhHbDRrxnNtkVIcgpSYCp1SODgG3atIH7wKiU9duUNxBLcOgWFOBUMMbQfjUf7D8zQ1mi4r
 Z+xsJ8GKL5ZDkC+AfnzmTtSORopA2+4vzG5V4nt9jC5Zy9gULKggPwkf7V1pHBwHph3JJEu
 yOzenU0MQOiArcS1D/2lQH4HCAX0luWcxc43t6RsKoVV9TpofbGU99fINhNlwY2h/40kniL
 VVg2zC+6JlsToJgtzk3xh518LE73Bf+9pKk5gnMBXXm5JarWI7AJ1u8KlTsw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0AD8640B8C
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 01:09:29 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1130D10E347
	for <nouveau@lists.freedesktop.org>; Fri, 20 Feb 2026 01:19:21 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2ba85f77203so33067eec.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 17:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771550360; cv=none;
        d=google.com; s=arc-20240605;
        b=Kqwzy2INVKLFD50kvEIulgwfkVU60EZr0QeLInx6Q2lQS3a15UOq4KKU1+O8Bm5M/b
         DLDPohdSWRE8rTwZsADwBHIr91D8NM2LJJhNdQ+tPlMvxFq4pcRlSDVPqKud1P+dOGtx
         TPn3DFrbc8N93NMlSr5j9STASXcWuLi07GzyLs2pHMrw+E/Ff78EXvPcs/KCiOhZ7SnP
         lpaQhpN2zzCdP0CoyP4p+iKRTDn64MNnUtwG29QVyP2MqyeuZ/BUcw6e9VBXdBDSMui7
         BPaiA93xBGmisck+XyJkQfBLo+Y/7qsmUlIrT/gTsjo4GVBsvwodWvr4bZ0AOgwh6qg1
         ih7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        fh=73xYACv4D/JuGqUrxiHOPlp/4VPtMw8VnkWV5T8mIPU=;
        b=KMb3gvP51DavEZFcyU1kwhCJ7bz0mHyK71ioeyhxZYhABffYRbMWNkQLrmYKOlM32k
         F67bQLcyIxIILqKnB7hxZ+wefU8vUvefD+AzJkcVffS8EOMKzrH0/J3QlDWJ2JdbvH3m
         QvQALW+xdBbKZ0QFR2kES8aZf+Vl5DGmOt+KFyTCe2n7dtupyp+m6uk2o5/H+iksA3NP
         P5dio2caFCEEfeKOVk79xrihT+o3HqcdnMbwcSYJUOCx2FRs/5Cnp6r7KYiy4dFsYJ4h
         3ED1Otgi7VjGsCalmN/Pjdw0PMgp1D2eJ35XBXH+JFE+UdDmP1ofphFNo6LxAB1AbIli
         tasg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771550360; x=1772155160;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        b=QaJHd0qTBJGXizqtgV4sD/gdl4J1nMomyWVp9m+MSwtb7zRK9dJWCpW2AWrZu+Fnf7
         W9UFHx1ReRjxHyM+OghZ6KfcmkggTDfXMhFr6jkQ3gBQl5Qa/R8gXe7eCfXapUPGJTf2
         k+YY6Qu2h6i6KMB0rFs9530rRIWLI3t5ijiiOXhQt1rVaVo68GUdXwAg7dtRSjGWQsCr
         GMFjjkJ5KWBibaWjBgRnI0YMV6gl+IuZ1MtGo4RBEGBJaqimiSCz3QiUaTGH2b+QP/rW
         wLcU4D83zjQTK/IuxEkX4DagwN5ed0p3fmO/sqdTL7wO3lYSA+UhbPysFFi8C9hb978G
         p+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771550360; x=1772155160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        b=UkvHh+WWRFY/tSqvuj8oMZFNTEZl/jZz5PNcTYnhePJ8IkM/TvRF0g2NJCW6GEuyBw
         7cK3ThJkNbb2Gm5wVfg807C8E7sWLws0qdvLPrn5+inXW6hWlBBd6ZqoRNruVePJP6iz
         lUyhkLMx3qdhNn0EOtc5PZGDs9I1+zkn+TDLGCL2zoqWet7YPepjcFVQ5kVPR7y1BhS0
         4j8R2i/V889PWZNe9xuV/qLXMq3MsJPp9cwMZyd9JGflpih6uk0xVq6b+5dnn91MjZbT
         eHSkLG0Jn0opcQDj5eXaIe8eqsMMMfyPBRAw5gNOIgdZSUxmYNslcZnM2buHp/fJWFar
         O1lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvhPmKbSP4Cdl5Gnfah+mDt0f3MadXhPPp4WjSEkWyRE+KQ6r8zbvF5hbdq4MJIYiofWdpRw7o@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ald0kiVOTfOUOOnxd3cERt+F4jYC7iI2knn8yYcoRf5IAKZ2
	qDG6uS3KkS33HF5e8HPxDpWRU2jHd2W1qnZ0iuMHLEC/iFBpOJVjfY7L22iHAuw4RLMmAeH9qyJ
	4WFRX+fXdmIh0GbiK4A0L5CL0A8AMowk=
X-Gm-Gg: AZuq6aIfjqaGq5JyQxBD/MC7z3j/N0yleMJa1QQwsY8tFeeFCwzIt/XfeBTYKSd6PaU
	VVfyapen/0rmlobOShLxTlHitHKKZB+W7Gplf9peEPdubmZ4k7TLl6G5v9ZOqxHIpSnhVWifmkz
	WxYqdYfidDikTI/I0aw4lJ6v4X4a3ZUBge1CD6OEuOlRIlAwSePS7mu9ssvs0bGJZLEDuHBpnb7
	z93Essx0LGSwZZjp60aFVN6MLKPnobW7UNVrt712O9SFYkWfaHhqRr0LcCxXF+qH9tvoy9EcMTC
	FUALMLSVxMQ9ACeJ7EgPGRHvDZ8QP70JMfJkTHL8U6atBbq3NRrUVyQVokWG34AmSNTjoUKA8qa
	tRGz7lYR1CesvwTYI2a4Ct1fr
X-Received: by 2002:a05:693c:3747:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2baba09fd2dmr4832186eec.5.1771550360125; Thu, 19 Feb 2026
 17:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
In-Reply-To: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 02:19:07 +0100
X-Gm-Features: AaiRm53I7xSBVJREH3FirrvsTnrCWsVkXbfgOvRoa4QFaRsf9_1Rj3wL1p43FyI
Message-ID: 
 <CANiq72m5=1iB3g4w4-r_eGtbJT6+Xzd7vpp=YvGU7t=y3YevEQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZQMX44LHORAFQO5GLLOWP53JONVIND7X
X-Message-ID-Hash: ZQMX44LHORAFQO5GLLOWP53JONVIND7X
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQMX44LHORAFQO5GLLOWP53JONVIND7X/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72m5=1iB3g4w4-r_eGtbJT6+Xzd7vpp=YvGU7t=y3YevEQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 20, 2026 at 2:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` =
crate
> defining FFI types, we have `CStr`/`CString` which in Rust std is inside =
`std::ffi`,
> etc.

Yeah, I don't love that name either, for similar reasons.

(The entry would still be a sub-entry, either way).

Thanks!

Cheers,
Miguel
