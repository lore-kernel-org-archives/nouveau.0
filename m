Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EC9F46C47
	for <nouveau@archiver.kernel.org>; Mon,  6 Apr 2026 14:38:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 304AD10E269;
	Mon,  6 Apr 2026 14:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMeehR+q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9E9A745675;
	Mon,  6 Apr 2026 14:26:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775485595;
 b=wSmnvp2wiL2ZEpSKHO+JCcQSm8qHxnCTygxBPAr9nFtRXGunj36y4PWSIwz/YHld3f0Ar
 DcFOuvt5R46rGT9zaq6mnGGVb6t4PU4zSrFv535dVHcs9Rhx0O15PKOHs+b4dbofawfVUV3
 gGBoPBgeYQHVZRZMWnU2vqenOgg/09PGl0DrTIQrY+G3YjYUcePnpMdlDTFGKhDwGl0PBe/
 /Hs+Y2H5DgzAm4hi3VHXk9sFb37vcx5n65X6sxXJ0o85pxjV6zKDABhb6a0FtH9vD1s8FJm
 sv5Ngmsq3HrUAipklu3ozKKyUyzacELNJjXrsq3fvCT+y0Rt4IY5/hVwNQdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775485595; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
 b=k2hy5u17ue2/qO+T99e5GdeenIjo88vOut9qKO7m/oN7m37kqr0AlFcTw/YEz5AcKsV9w
 pzTREg8YVDTrFTq9D69ZcxHNZMKhU/NxsotKKpDr3jfb4vI54zG3hmKlYIGJFI7xYEBiAfS
 THAcMEW+QCGey8slMijEtsSv+oXjyp/t49QAeAB0KfiA8d6obzM/2C75yg9kbhIXypCM3Oo
 2cL4VGtegyI3jR88vCn781iPootiv4mScPEVh9sar50bIChqdH7eoCn+d9MGerX6D8uBrEx
 1t6fKD8UHxGGSQvrWuudqorT09lXNKhLAdoByacqtI6Ds4oD18RX/46oC7ZQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CED7645657
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 14:26:31 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61210E24D
	for <nouveau@lists.freedesktop.org>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2bd801b4078so411738eec.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=RA3PaNV/ohV8fDq8epm+/ry2Y6Mmz+6S2ELN5d/aoVgBTsmAbCc7wtoBG3fvW+typq
         2w7ZyUI0B11MKzNfgc6icm/9NrK1K9ig6rg+QRm6ihL8sJE8+bJ2p+2kMsFNtSdlqpgL
         wA13FNJvvru1jheZL42Vgv1hBhv5hOzGz78t1A8amQXo4HlA6Pu/MkQvldW+1IZ6zFcw
         U0Ls3pAgbA1qA2AU2AE2fSDSOjkHRMlS64w323MhmbwlzloVvxuuVISYUL5wn0zcXMfZ
         ImrIwOA5veeZu7i8SPwivyAaR5PGip6I5tmHGGN9UK1ON/CwutWdoiYiajOTfPqHGw5R
         Czgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=D//lLXVLeFdNbO2LK/4z+B/EkPwJL0L13MlGp227BvU=;
        b=KyfEDvw3ojFTxvuXY1XpnqlYKIAyIudf38vKtcLjvjwx7EuFS7IZuEgRT9UAjm4z9I
         lBeS//kiySGDtw2lhPkEfpPpNKWWEJA/HzMSL/2Jtkq/PgP5LVFzMN+da+OUtc2Cn/8/
         Qbi6ISqxRRKyHSUXMILvF3pNnSsN3qBcTNTeJuf0KvyxE+haN6vqrJMzv59x6MLdfnJn
         VlpcxYAixwCWT4SkxwM/6GF4q/KBnCsTI3gQwTZwrZKYWkFC52AqW/h0xLcD+6vhZ90D
         cMlUGcCA7sZDRYENqEXM7oRUU52ymvXt9wirevRgP1cBpelEo9q6D9n+1H/KHcyClanI
         zd8w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=fMeehR+qalZQpVp3KTvGTubjSnHIdQW6PXCFXtCfyCIggZOWLKZWbZMUDlBRj3YRDv
         R7lg4xrai7ZsFgETc5y7MXkwCCunn8CXRKZatAlnQPFuCyUAjEYrB9IVLzhFZfz9xNNh
         MB9pP4F9JRM571uC9IAa8dloxKxC5qpXfmkv79rAbw6aJ84Q7NCq/fhbnnfW5V0LbqGg
         AiYtBdW5hvRrrhM20GxKkKceLH8khpSj62xwsmImuIFROuCwS9ujVPDBa53xXmmoXxPR
         mGFokFsXwr1p3sBnZkH5tM4/x+5c+kMllhtLZGA8DYEW6wBidOn4LAsoDbZw4WqkZGvr
         8bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=WkaGVd2spzr+f8/Ou3WX8J6jM5dC8CxM1WhmHsCx5Zuf5YwYfz3PXzUpWx1TUufEEz
         XTpSRtmPHSVK+pqzw2bERl/PT0UcHI4P5fUaMFCVf+sHqXN5J7NpUfYeCDgjp3+mNQwS
         OrDHDhdATOFaIC/KCWB9LYxOfnV27ug5kDvg6USaFe0gyHvSaE3Cx+sdd0MFN5JyJ0j0
         9wkc57CJavLkMl8T7norRS81QNa0dFFAu+1IV0JWznQ3MHxKXTiDGFX4cvabqLAdAjia
         kzeeO4A+zVMVfqqjnvOcuzR7BobmFMrWCG1/DOH3mifxv2VTtlFiLQHDxLExjdQasPcO
         urBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKRbZH8yIIKjlFsyVPAJQQR0wbHEWsVfKXwGz/EtJtYlhQqE7+4osig8JRAap6y95vYHxQLqne@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCpx+TBj5MWoXTr8io4ylpZ4jVBqGOM3eUyPxbvyMtWWTB3cw5
	2XDqk2R45qQrbVceJ4PITSeQ7LASbi8pTiQ9wP0fz5+YPj1lgysDsFdz9D4soE21n4Q6/j4jy+r
	MaZpwPab+w6HS8B64/KGVHMfLdUMAA74=
X-Gm-Gg: AeBDiese2mToQR8V300tE+H3AMvfs3dlI34GvsbWkiPdQe8cQg+1Kz5dgCG4aE5GtRr
	m5dRy4aRLJp+K7Ph3jtNw7isoY6ndf8MffNL7ORlpluc+qWQ/nagUVJybU5C6z1vNrSehmhjLuo
	4h10bNsX/PO/HYioMCDAV2qJP3faV+7kOMeU8HiDAQuh3tVkzq6Hi/B8mFBQdAql0w84G23Z2p0
	uBT0+y5XHozroJ7aO3eJrYQhzVGq/9nQvBQrev98aYn6iaIPnKwuOufaFTLaXUdZYmLdtnlIUr7
	Ax2JO+vXx1Xy7enlHmrdTDbM0WlH1bIoubO82I2Bt/j0V+zvBhGG8uLkOcbxyFKGnnUErbDR8iJ
	4F5vdSTlr928XZnQtMHG5WQyfptGQjlyH0Q==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: 
 <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EWD65B6YV6ZMCM6XGC4EBDOV6CTZTYDM
X-Message-ID-Hash: EWD65B6YV6ZMCM6XGC4EBDOV6CTZTYDM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EWD65B6YV6ZMCM6XGC4EBDOV6CTZTYDM/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel
