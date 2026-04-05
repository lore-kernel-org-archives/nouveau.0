Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BFCE9D812
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 19:32:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D64610E1FB;
	Sun,  5 Apr 2026 19:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5tkb/uE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 70BFA45595;
	Sun,  5 Apr 2026 19:20:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775416841;
 b=tXdcioWziQqKlYdNxrpJs5aj5LX19+5F7k/pM3sbCq0f8Yihp7feFmSa5cYhkSqL6rrLN
 5qipLtJOkGNe9PEGYaqHMAH/91tNzJ0r/LvO4EgGq3ibikWj+zzduVHDt2d4XbslTRxvK7G
 zgZMC0Nc6FhJAykN9FNXJZ1Ttu4wycqmXM82KUe+XcGJLgarEs5ec1Sbf/bb/bmn2IV6xDQ
 B+pTbGSPRyLlmyeIIu/9O/a2f2dBUq3gycHN0iDnYrHwPLqdlU7eJAxxtES+FSqdxvgATD7
 azPFfjTz6jvhi8rVBlAsjov3kpPTbpwaZBjEBsv6s7ceazCXF6ntJsPPqS5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775416841; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
 b=nPqUrDSGzqZlHEDY9x3exQ2HYv2Gmenk6rwN2noaSQTWICkQ9/10zZJafSes6xZELn2UO
 Rz1S0cbFqX8Zmr2FZOKyJBSLRNV4KLzsIZGijOS2+w9Yrq8x43i/5xNq52PiZWpTHzYPAKM
 YyXL8u+wXCxmX1Qpz5whVNuXbbmPJyR+Vy1RkD062zt4styGTVTqUb4nqWxyqVaTvouorrw
 UmFnJ62tz07MXIh1rzxQ8lDEkrHU+zuYNPWSB6aAOHp5RxCco/ccZGnpO6jwG1fM9VhFtMt
 M/+XqgNAkq1Sw/RPiIPPcazh8HY+klQhXxSbVU5X8w21/WKn1nDCVfHeiI9g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BE63E42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:20:38 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF6710E1B9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b8095668ebso238000eec.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=QMM5d3hzIZWrzyu9rLmnsZ3D6kHD8X8T3blPzs4QbYjYS7+RamnauG4x2PbWmOVbqo
         C4TP5DjFney3s08Y+jQLjByh05n2JptZax1zXsG2q4l7BgKgj4KI2z+V3WNYSS2pphMZ
         2fsaXiJv3zJ6qdqATHdGGhrNi+Wf3IDRFmKOUOMhX+at4drnIBY7or82/LybGS4X2ED8
         zaDT5kHUkJ2qRS818aqZpqQWvl8LnWDaymWBvF97iN/xV7tiPoqw+jlDUnV0znKZ7jBL
         kEUkC9O49LpCxzV6mqidaCsMK0WRfvDeOdtn6VRl7+OwCUaHeeNC9K1WgckSqKcrNcMJ
         NQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=39U0ZYPo+bHVleHBktGfrWopmFakJLpV1rwdz56WpkQ=;
        b=kcedj3SBYfQvzUUy1OiClt8tpx/+YhOTb7822pth7SyYg/n54S+ladQUZvS2X34dWX
         tVZCYKjr7PHlJ56RbBSnEbrswA9cGAcsz4jf5zLCiIQ90O9h9Mh2tVSfewe+MzbS9xro
         pZG5zOxQrtLir9GUW43/75j3BeOzDz2NFFunZqj/53Q6HmcP54wE7xMThgLfPe3wpSWi
         qm6+zlJnEMt6ZlAzgSt3yqKBRZgxA8RKv4Ku5dZpar+j/TV4usKo1Ov+mX6ne+GVusJG
         XssbJIR2zpTe84dawoaATQ2nSp5SwO5ZKAGTj+ZTxD8Jv1eCmHaprPH7A1wcGWBPwhLW
         c4ow==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=G5tkb/uEWh6iw73jdTqX0G50RMULWWUbFusnue9eDEtWwbXa7/rUUXLvg/PAKIw00I
         vPW00VdyQRgrHIQyiuQ6cZz2v18xkv1i+7jUJnvH4rzqbeSRDSE9W/99jCS62acQfCVB
         Ta4wF5aIlrsoUsrSncf6HPtfTydnCOSZqMhWm+Nt2g/cbsIlwpLJ52jafdgUdJuQ8zBj
         619JJqpTQ2wlUAoaDLZZtFCTtXgcLBAWvFjeerDUFdyl+QsvIKGv5FKqlucUnEs87Bty
         denf3ChB7lic7EQI87mATLN61ceI8IKqy4ihUeMBIX2fL9dGLdLspXKN4NprXsjL2U7i
         A86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=MnvZJ3zOUAjkwcNdoNrdE6bHk1TJan86ffpS6wpSRiAjI/Hftuc+sdxz182h24Ado/
         K5TTB6fmHeOeAABx1NWwMU45KAUL2eriWko9ISF32uJj/9iIie70bvHXvB1YFs+WgKIJ
         hC6SsXaTUoEc+7/XwVcYGnDGa/k8Qz7rEYCUexTS0flnc+KXHJnEiFcaEhQUBNdWiEkM
         FxDSSx7eSh6Wz2IJ7UsDjNT3JAIDqePA86jXYyqoGYx9PAapA86p8MCNtw8XOsKg2mPw
         6bXqy99hcxfs9G+wN4jmm2w8wLk5X+w5HMSfGI1ztqQtGMiySNnzMrcCAHJSyzKDa7Jx
         bBlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoQv+Ek7BVSXxsXH2wgLxmkaM8KoSMs0aBxSvszbp8+llIro8jI6MnJaqCeV5xwniKyy0sT3Rm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeXwL7GVCaEILYm6g/QuTu6VK0GwR/xCwbbS0fhvpkxlWbJ73d
	yoGDBOPYSRjagc5cv3P+oWi04LP3t8zvSoTEGDu4Y1pbMt0Oe2xH+HTMucl/DUWG9HCt4i7beWk
	vBVZsICDMG8+H1M7dcbX4oq/m66KfGLw=
X-Gm-Gg: AeBDies2aImmw0l5wFkfUzsBkVlTw4yMxUxq7cjcGucxRHV0+YW7/enibicAY2r524t
	ugQU4Ozf3d87xqtSTvT3VgPbFCjkPPT0xyrZ1rTl3DqQ0DCFyFg3+PQJoCYFiBmWiD68Q69X2kG
	/0t/o07uf6fZx5TBC82vnP6hvw6j3OwfbrMZ5hj/7S7YRRUU0HyTn9cX0djgydzZQpIKdgI6b53
	6o0rsJkU7h/TW9ZMAMdYvf39HEffL1Y8V/X87kPzt/Lr//CRszD4jhR6SQWnaXrT12rehRsAoPy
	HDiNi4mFGa0Mt0K5ZB8F7eNnm5x21CSg7sA2146SZeOw+SRNeZkDEbn3J51YfkRtczwa685SYE4
	URu8cvIvU5NZyjPWqSNYEXLM=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: 
 <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: V6YLWB7CWWXMEZK2CUXZNMWUMNZG5SSZ
X-Message-ID-Hash: V6YLWB7CWWXMEZK2CUXZNMWUMNZG5SSZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V6YLWB7CWWXMEZK2CUXZNMWUMNZG5SSZ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel
