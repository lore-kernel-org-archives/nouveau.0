Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619A6C44536
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 16:17:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1910E83C;
	Wed, 21 Jan 2026 16:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PrA9Keiv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 63E7940221;
	Wed, 21 Jan 2026 16:08:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769011727;
 b=zVOqmE2Bsc3KJdtKsmWQORM1JYnwpcA5D6Yr2kkqO/C0KMXVPkbFQPxafqkn1+2Hitypb
 XRkarzyKLLTA7Xjw2PoIPx/dOVhGaVt0Q8gYUP6dG/F/AotPzpjEvgSTB+b5GmvudFfhEr+
 Aj7+5CD69OR0fQNZYhamLaCXlDepCK30UlVNNRogN34vRXHMN2uB+9rgWWYuYwTLcYONcdd
 OfhnUptgesQz1L1S+XziJb7EXI9XfeJBDPApHk/wzEiP12MFJf/maaD6sWQEIH5Zi3JnIrG
 5dvY2Oplta68sPPtIdGSHi7EWYARH/C6Vo/nM7oDqwOGOsTY19zMFzggtmGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769011727; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
 b=oZmDCgpNWoVMYR3+JqTXL5BdiAEzZdSfLbog1m0NHHas1PzfHnFGcXbnltbRU+G3auFPr
 ywACjV+BoCSy5+UdCjBAmFiztK/ktak/98fHPtz0oG7tf9x3vKvXcI+7D6qD8fwIjGkRpff
 l1cE2Wa7j5XC1k8qbQ4veyPQ0mnDudbK5L6m/w++oP9L1Qij6TEra0T1fDOgldo7zlR6C40
 4k2htgSzo+eWkVDsOP7ppV2lICyKTVzss1txVr6u26g1KLCZ+tRQB+ut6r03oEafL7rKAPv
 b9YbF5JSnPcoaZ0XiOgGwt1c89i8xK0NcejdXa1i3TmUz/c48x4BpsdG8Tlg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9350E400AA
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 16:08:44 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38FBB10E82E
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 16:17:31 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2b703e04984so125067eec.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 21 Jan 2026 08:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769012250; cv=none;
        d=google.com; s=arc-20240605;
        b=cf/UUYD2zimAgRt9MZ63MSqiJwpMhMz+vH3OIfm9HueOuYsekWQ9cQJUmOti0u7G9j
         RtOzxp9FANyL9UTcUDx4fk0CWJR6cyt8KspAIyhFtIbxP9yMH3MEUdG64Wst6+zq3iWK
         MevpuSlonsO/cz1sHDfU4Hv8bBqmsLuwnfIGAk7nTk15e5+An7v04/0NiuTnPxeX5rXS
         jaffrASSsbUOYxEUvCrOfkFOCivxYe6iexSwy0IQpSHK89T0hKlYVdkYWpI9R2i2TRat
         gMAFf909LGQHaKWZOU7BhY6dkIvh6WTRo08SPWHtPXyDzOhN7/ObPshb4RRMxeoviKU8
         vZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        fh=TwaTmrNatpX3axqw8srP0jdQa4iHNxnmRDx+4MLt5TI=;
        b=g+aaOrmH6n83CMMM0jQKglNvN8Ys0t5z+F5fjbcW3UM5/OjmCjAMYhDicftchyoylu
         xXjfP3fJkrGkBOVzfFyop1ecpbqLtABTCvhdiU73nPsaDydKadqc3kKT2g2IDybZ9FCq
         qhlEkhXSz+kvTa0XNdcoLpIHWMx2V6ylFKSi9fP3G81oCKt+Q1KgzxXTRpIb5BtsjDtH
         Nzbzm1aL5rseQDBps38tTBj4nX7DeQpGMFm97+BuIECXVhd8l8mvWSERexGJZDx+FbYM
         zilQCACl5Y5zQCAY3Il9sS+f2CFK57ovYo0HdKqBqfpAHtvJgAj1Atu1kj/ozKSkouKa
         Xa2Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012250; x=1769617050;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        b=PrA9KeivBJK9HsViEAHc5nENKumDn2tcNpC39lFyUso05n2QcRTGZiZd8yu4KgxDkR
         O08zboItzAmVznw5ZhSJVzimHN3B7IUxbjTBbMw1e5O65auBnpaLwwjeKKfVIxbspTFh
         PSMiEYQBsBPq261XDLho/CDXlL7qPJD37Iuqf2uYGQhK8sfQ0/cp5eIUjHz0wJ01TdnZ
         +xNYNAOPPtcH6w5DZSKMVmO4SQ13MwIiGYoDZnYKMz/oXe5Sk3BFntv5XHfknMp/jBgI
         H/LmS1h5xP2GI2hcRlzVVkWp+HIfFhX5hur/N4tcez/QfNhMGYdhxtmjuuEDPlRYxTVL
         t7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012250; x=1769617050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        b=tzrlvBW2YLEt1I/M1o7OpOiFjkCaDi7O1caUGgMQJX21uWgdKquWL3TemMuzDrNpbF
         7il7f9B3hcN/s2SPGqtvlOycdqRyRj+mY26ADtwvjzoS2RoHx0QoaIkZsXIaqWlzIK7K
         ogF/G9+AX/cLeSQgCqaRdqVbE7ju9TC+g/gz5uFTypmRMI9KZ9C4s6dNAU/OLMvTiYc1
         eMTEEe+Wt4zpKPO0SaWwyH1j0Pkezj309tWTqO6Kyw9qeMiS5lPkTDqHvbGk7wyPxmiw
         6xA4jk779cXOcs9fBDM2VQTtDdMTgmQOsC2j7lDx8t7BheANi19G7FRCNT1UtM58PG7E
         kv3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNXoKKZAXeqDzdJFHcS/+t3PTwknkoZXLei7fKdn2cC8F6qrZkgRYl0UMg9EVuhRlFQQAJAzbT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC8g7TsBZUpzB/Of0f0offu8L2FUagafl62ucT07OhTBFZy9ul
	NROloX2N1Ti1q0X46j1o2UT8Bml6Tzmw583MGq8BHgASgDikgzaqXXffPnzSzcn1MZm4v8JGl60
	yyy4P+qnCwzrF8kyLwMGrNhnODbtGF60=
X-Gm-Gg: AZuq6aJUznJS7g98lk2PTECYFEhy20Abxpf0PfUbxCxYGyvYVm0kPDGVN2uCYKs0Y2m
	z9pmiW/KhtzXgMGbSOPjO9yKzNoGA4Syv9p+yHFOaSL2qADILhoxgnJd3LEyZ2qlQiUwJE7Sv6J
	xCgtltZ9z4L6SsVNBX7dpnsqUYSq0LFba+jKIxROU8oy/XXWDVQQyVXGPhkkdH64vWaYf6ce+Zh
	jVFDJsLB554vskumWSuFGGnFn8XY9yyfvoD7L/4oTuUWQaqlovGE7+8BtnXHpcbiXeaWpsvPRkB
	6YS/j43keKx4sGODOYi6bE8uUav4ZWMAe9nk0JsJZL4JCWAVh7tFI51iBBLHp0NZ1F8JNwXnV3W
	Gua8ji9j1vKl9
X-Received: by 2002:a05:7300:324b:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b6b3f21d84mr6927390eec.3.1769012250032; Wed, 21 Jan 2026
 08:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-16-jhubbard@nvidia.com>
 <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
In-Reply-To: <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 17:17:16 +0100
X-Gm-Features: AZwV_Qj17YDk0-i_ES8djSnLqOksAXttnD5kGQ26NHxsRmBdoPzhZqpAvLIhS54
Message-ID: 
 <CANiq72=BmC8uykrnOZ4k6e51HH1_S+e9eTGi-LjOt9+XpmwGkQ@mail.gmail.com>
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OXN7T5JOIB2DIUVZY265SVBE63GTRLVQ
X-Message-ID-Hash: OXN7T5JOIB2DIUVZY265SVBE63GTRLVQ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OXN7T5JOIB2DIUVZY265SVBE63GTRLVQ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=BmC8uykrnOZ4k6e51HH1_S+e9eTGi-LjOt9+XpmwGkQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 21, 2026 at 5:06=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I was about to suggest `is_multiple_of`, but then realize that it's only
> available in Rust 1.82+...

For things like that, a `TODO` there could be good for the upcoming
1.85 bump to the minimum.

Cheers,
Miguel
