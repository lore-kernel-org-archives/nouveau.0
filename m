Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E560FD006E
	for <nouveau@archiver.kernel.org>; Sun,  1 Mar 2026 17:54:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 334AF10E3F0;
	Sun,  1 Mar 2026 17:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv3u4jUS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 556D444D23;
	Sun,  1 Mar 2026 17:43:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772387037;
 b=wUcq4ijamu0UUZOvq/fq9RNwxmxzC3R0AuSTm/8zwbl9vPVVUYYYWG7Amq8Got8kMbpBe
 dWpk2VHJBazhqCssnQT7QR6RQZJ4frGy/jnzoNHKm8pKyIWiB9BGqzqvdLfFCJSty4zi/Cr
 1DHJTo7BHpOhISbrGJquPDgdOP+0x3ooxkLkKIilMJw6nPLtYlhpJ+Y5bbgyUDCaofHaY3H
 3zryMN+UikFfdTKTv1ScGS2IE+HLDCA00YRlsyYcTS00hx4KTWToO6KzJBvS+lbflqUYTZ5
 jNwadHmFvp4bm7fyqIknvmU2v03OFtYLJ5oPViXvH1hdushRIJ5dov44jqcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772387037; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
 b=GCU6J9cjwE/iBWW71vy3y5m4Ba2DqsyU0IaiarQvB8IupwRVroabWeciV5Bfv/sNkwoLN
 91vXs1rWEukwsm3272ez55B/GMb1Reb725dVCWLoIhgpHPo3OoQBeyNC6MCzQ2mtHOja2dy
 lniyVN6T/aYMM4xG4AZjQ1eYy4qxzBQscRoD3nyt6sVlpuImM1cCgg7999KQMMK/eWzOjZe
 p3j5v2x7w2aPYTJ7zEcjY2TczEIJRKlGKENSXbbyJ0CYzHyWQsd+p5TFvYKNKiJOq3DKeKa
 5QrKAA1UcH4s7MUdrLgVlRaS1ITpgeXookDSGSUEcICJ6Quh8XRFtlLC2Jng==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 757E543789
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 17:43:54 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2339010E3E9
	for <nouveau@lists.freedesktop.org>; Sun,  1 Mar 2026 17:54:08 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2be0629f76eso19127eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 01 Mar 2026 09:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772387647; cv=none;
        d=google.com; s=arc-20240605;
        b=J2VX5HsPiX5p9UV1uIKA1X/0E27b3BCd3JEx4fpqs9UhmTh4jT7HLS0h4x7fXYOtNH
         Xt7GwlC81m8IhSjggcVgNoKdC8OpXsby914nJtNJBEcx3LghTYclWydf6nKdg5o6/CYh
         U0H2qOOeUyisz0y9TdoeFZ6h9hq2lcL5Tv/GEtyf3QkM/9Gi7ac2t7QFnR2DUVQ2i0JT
         nWBNlxFwuZUDkeyK1Sbt6g7bRfv6TVjYNK4cIdDLBD/J/7NWHYyvePoNW5inP8+BDw1Q
         kRgvPs2kObBd1GwOCGGLmCERJmENaxMJfHnvq/MJFlTb/TSK7mPetI1XVTo0tkesNuPB
         AlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        fh=RM9y3kzrG8qv9JEF2nfjA8L7gdvENZmOqYChRNXaZRA=;
        b=VDeZqp1amduIV7DsNqqgTzxM3lJsste6POp53UluA7dmGtSpq4jZ8qv/+7qIpI34yZ
         GVlo+2VYnjhBp63o7yrv6Y30oaS/4Xowp23Vneb8TYf9l7IpeF0INYXgljD5NNBhTevp
         ANgN5KOcdjHjVUeIK/5OOqhFX1xh2LuiRXZQ6iQ9ApenYkKzViAuBbaJLUxDTQhwRKhu
         PgitWXwYIrear9qANnxd4QbOmEBnVBiMMxShrU8P2LLOQ5mbv9Am9pDhS+FkXU42C80q
         9Ifmbz0kzREFmQyynZ1JcqwXYYcgnKHsYoNWtqhwLBX3DSD+bTbrA3WUHIMdZrfCapX9
         7JDg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772387647; x=1772992447;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        b=dv3u4jUSvXRfdOkXiOLwzbghX6EFm+WoiuimG7wwcS9W2S+t3HKrtId9v2cqCVnKMZ
         pBb45Gm7sOPXvhTT3iWWdjBjyyvZWBSAnoVbLhHlAUdooI+3diOzVZ42M1ZZqS8uETsY
         jrjyi0GcncMOJnEv0sRQEPVAbLlRF1jsy40P7y3j80DEn4l1DUMmNV/ck6jb8a++qDnN
         xwE4f6TXAe3UhIgWXSwEN6uakSVvx6QyDcqgc1ZWwQhqRDWqUFD3hiu//Qb1XGkWtB1P
         vnTM+lRD9OA4cMtgauN1CgspTTesLvh3OIz4PLQMFZfEwfP21NKPx5o7c8+LRy5I4I6d
         pkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772387647; x=1772992447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        b=uEd1R5VZOVz0fg1AYFFSTBcqYew3Bdp72R7nrVucC0TESqC8L6/RPBzGzk9gPfSZED
         D4c8HXdKTKHmu5tlOsUq1BbxGE18myb5tcsCoCGIlzGJhhyy7+jqxefhxhDD8uFEcCL3
         ZSUUkqnp07URIpwpAf70EsCg4AfqJ3SCDVc3lFkouEMsUYNdoDzUfRBkCS3b0CzUHYXE
         SrGp8H9QhlZ7Q29YTbo5CsDZDL5E+TGX3JsYTL8+u/fQd4qGscsvYo9V1/cdRPlmHAOu
         XkTktH3HY4yfG4TxKmPO9tysnCIqGWMBenQI+2vzhAZIuFGtYKytducrdBj4MqsIr9Om
         7mMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhSf5hMsk+J/SMINdN+S8nCbXvtgxvuTpmINbRpw+xCwnQ9Rbk82DFTmadAHCBctEnWVYKmO9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRiHgeS9uMQ390ft8do9btbNMAmXq4jee2TTjX3ZzLVfhpqYqh
	IS97hbFVhlXxJaIZz3snS0QzOAZfMC9rYgKjlnPhCEFz/rJx1ip1Xli/DrrYrqjRB2WS3r9FIGl
	m170OYrs7zWDgFgczj4bhdgM2451VyRo=
X-Gm-Gg: ATEYQzy0nL79qX2NThLM5eou3VHmj58tGNzmDNgN1nh79WNUwE/TJASJ0qY3Q9IJBKX
	v9jwFq+RMDOByOCx9jU9MiCGVfNex/w+jhdeLyFMhEaVlGkOP4aVIaWdugb9IafmDZnUFoj++yw
	bKn7k4/ym180QiKRl0OopIpRhMLVJqTStV4Ip6IaSybDqcnOnbj/52HKEEvlXlp8TOgML0KI2wv
	sS5Rf7JRRB6HomAT5B504zopPXwcgNA1AJh3xDBVyQ2oglD9h8IXnjS23ceWbrZWhZyPqYFEAFw
	/VPAczN4w2ptVv/q9YEaOl8HYWjcdibPZditVi4ssXJMP53QK1SdGZHGnJPZLixrl6YU/w3h4oO
	P1MmyY8L0CPdOQNDRTZj8QLe0fshxD9OVq2O211M=
X-Received: by 2002:a05:7301:678f:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2be06e6e93bmr364703eec.0.1772387647261; Sun, 01 Mar 2026
 09:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
 <edb5bd481d43fecdc626256579caee41@nvidia.com>
 <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
In-Reply-To: <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 18:53:55 +0100
X-Gm-Features: AaiRm51jQvROWAW3ojMm8D87Nrc7b0R1mimDYc3M6UKj3t0H_flEAYjqI64qoF4
Message-ID: 
 <CANiq72mVUHV7j7WNHpqPcbQR_LvXmea2iOoY6A0wsuUr8FabiQ@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UYS4T6P2XUU7VEMGNV7AJ3XXXNZ7S3MO
X-Message-ID-Hash: UYS4T6P2XUU7VEMGNV7AJ3XXXNZ7S3MO
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UYS4T6P2XUU7VEMGNV7AJ3XXXNZ7S3MO/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mVUHV7j7WNHpqPcbQR_LvXmea2iOoY6A0wsuUr8FabiQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Mar 1, 2026 at 2:23=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I started to think that the way we document invariants is problematic. Fo=
r most
> of the types, the invariants mentioned does not make sense to end up in p=
ublic
> facing docs.

Yeah, it isn't ideal.

To give some context in case it helps, so far we said that the `#
Invariants` section is a special case where mentioning private fields
is OK-ish if needed/helpful for a reader, even if technically it may
not be "proper", i.e. leak details.

One reason was that sometimes private invariants may make the type
easier to understand, even if technically it is a private one. We also
discussed at some point splitting invariants into public and private
ones, and perhaps have `rustdoc` know about that and only render the
private ones when one toggles the private items rendering (runtime
toggle, which is another feature I requested -- if it is compile-time
as it is the normal flag, then reading the private docs becomes too
hard).

Another reason was to be able to have them use doc comments and get a
nice rendering output, and your suggestion of using a dummy field
would work for that. I like the fact that it makes one remember to
write the invariant "natively". On the other hand, it seems like
something we could somehow do with changes in tooling, i.e. in
`rustdoc` or Clippy (and perhaps it could be enforced rather than just
be a reminder).

Another bit was that sometimes the invariant, even if it applies to a
private field, the type may be exposing e.g. a copy of the field
through a method, and thus it is useful to know about the invariant
anyway. Those cases could/should "properly" be a guarantee on the
return value of that method, keeping the invariant private, though.

In short, the current approach makes it easy to write for everyone,
but it does have downsides and ideally we would have something better
now that everyone is accustomed to writing them.

Cheers,
Miguel
