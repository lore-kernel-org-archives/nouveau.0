Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CD3EFCE4F
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 22:59:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A867D10EADB;
	Wed,  4 Mar 2026 22:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LYYAenXs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A860444E6F;
	Wed,  4 Mar 2026 22:49:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772664551;
 b=DEhSowxKd+cOIEjaFq9XAwCsbePfmypY0LRM/58GJoUKS4CQl9ot/TnK6LM/Ymhhv17mC
 iVqDCwyC332zwxyt+1Uv1t9Bf2tJCAuEIDT2+mZ1a6NZyNTo0CoNq9tE5FTkyXH68G69SWW
 BpaCWnt9bS+6B/5Ku081ZgIMy8lwrI6YbsB7k5/WjxMfYfE3rVNehsmQTchBMiyB4gaDch+
 rLruYIJ/bJkxgr9UWdtHZk7Wis6Lt1KoNSL2oIh/gizZ+BE2g3RKtVdtkBHTc7443i+Mr4Y
 dMi8eIvb1SLpc63nUnai7h4saw++bq8RA8Z9xdbTuVkm+shCZ3Fuk07mawnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772664551; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tQJKrk8XMECCDXVxSiN+Dh5yVEEjUi/YG3j9kEQW3dA=;
 b=uEb1VQvoQb32XyAITsGbBRUBHewyA+jiN6VDO1tRHaZZvn3yD6gL3edwGJyAj7hhEhHpO
 eOVOfrjL90PPevnaws5nYoW5a7jNh+YQwNlbyQNZf/nThT0GwHPBD9uxa9D6nxlJiiIAbpy
 E0c3PlCOh9K41LRO8MeLHXUOWtGNtMdfERv5niSJo+MY9B13zfem1PHr8ArF5t+Cujijn06
 n3CZ6ip2GMLp0o4Z5ya790Dbzl+kyqU5gf3PSbkinJllobvLfBTwq/QNPgtcnXSww5tR3od
 HvHwqQfWMmLLli5TIs7Mc6Xkwt1BfECYSXieGl5XFin1oMhxjfAFUn0wY+Mw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8F19044E47
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 22:49:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3195410E0FC
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772665162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQJKrk8XMECCDXVxSiN+Dh5yVEEjUi/YG3j9kEQW3dA=;
	b=LYYAenXs98MsbqjKwkMW8CC69V/ZIau4kJXlgEucz8w/9rtvdbw54ZB0RfJXJnV5kTJWQV
	SZMF/f07Pin0jLburIURgDdVfccxVi5Lkb0zNboEaxoCk0kh3JefLnTfhXfj2lfyxT2oKm
	hLLew01RPdeLdor2BRyKWqkHMoJpO08=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-nWETiPGSPa-CNOyZfj7pJw-1; Wed, 04 Mar 2026 17:59:20 -0500
X-MC-Unique: nWETiPGSPa-CNOyZfj7pJw-1
X-Mimecast-MFC-AGG-ID: nWETiPGSPa-CNOyZfj7pJw_1772665160
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso4734225085a.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 14:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665160; x=1773269960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut8h8kvGLZt/HvXnTiTmBBsoftW01FQ+qBcjZ1kIy7M=;
        b=WglATMaGWHuGgb47QIS27glY8XzMyA4jplKsT90+ryLUst4a9tPWqYdCyUo/XThJLL
         NwxSYoHEcabAwedRjVUb4KbGsCPvvFn413ZZ3CwuRLUew6eylUPbBtvMLq/iV3OUZpca
         HIajBGFz6ar0vqlnnM+foz8y2IyIstp7imSY26zTdR32LPlFjXGZRmd3ViofpN16sgOA
         SSBcWZZ87hy/IHPcNa8oZZX2AtcR2CJOc3S0FLZ4duDp+Mi3A6uOSBRYlPW2hqvm6n13
         P3oGCVQY0E9R4gqMJqV6LpZVcsBUlqM3wn8AnbXBL8qrdeuSXzJkDg02Ma3w2gJOnbgo
         dhuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTmHJ0FBmptYyNmJynT5e1jzv0pTfjzbd4+wjJ5KNlZT3M+tD8lX7tTMAM7LVsew33jnRQLClD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+vLbZMMZpjji/TnpmALNg+xbs0vzmQ2KEXmM4tBJl8XOjdVvv
	I077RHxQVUoIbVmU4MKPBYnGSpJ31L1at1fKSnqjzIQCPS7KrJoLF7YKaYmO8anAYuAMToh6KlC
	6ddHnl+OmdZaANEVxxk7PnPpQ4ggYx4tOMQL3kabFeLKR0ypURDbUaRMAvAoieitvVug=
X-Gm-Gg: ATEYQzzWOspQOvGfWw1GcWM7tDQtEZCkf3umfwMzaEz/iLqGxLe3Fr3ZF8PN/GpbQ4R
	E2zYQezva6XGyJxTLlkLyhLjhU3K4enNgoJuT+9HtL4mzEMTLQeNT5JCYkVlmo1aCfzrxklX29o
	TDgHZFqOAyQm+Stt6KdvUyTKQTr1RZgHWwRPES6Vnagv9N0Vx92RiNOTjbGAFgyWBrsZrKofKgL
	KG6W3F1Y1I0ac5P68HWltNKQrB2n8xbm73uhagFbK/WfLcC3WfXEOsMW/cV8v3OPCjQFWNkmTnx
	So7y4RljTWT62n9aZqfPnI59HcKICROyLXqRYicH3y4/KGoc67RH7GrnyHYzTaxkZq39z3A3b7r
	B72nMnng1n0kGYTha2w==
X-Received: by 2002:a05:620a:3727:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cd5afaa369mr465924485a.65.1772665159795;
        Wed, 04 Mar 2026 14:59:19 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cd5afaa369mr465921185a.65.1772665159209;
        Wed, 04 Mar 2026 14:59:19 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a1fecc2bcsm13349476d6.42.2026.03.04.14.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:59:18 -0800 (PST)
Message-ID: <e1c53700bdf4db6c2246a9b9e7098cb6db905797.camel@redhat.com>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 04 Mar 2026 17:59:18 -0500
In-Reply-To: <aY6FbSjQpGFk8oWK@um790>
References: <20260206223431.693765-1-lyude@redhat.com>
	 <20260206223431.693765-7-lyude@redhat.com> <aY6FbSjQpGFk8oWK@um790>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Uv2yA1vuGIXH627IZr_VEGZfkyfRg3rGNydItF9Ei0_1772665160
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FJCOKFVJPHOT4Y6ISU6TWXN3ULVFTAP3
X-Message-ID-Hash: FJCOKFVJPHOT4Y6ISU6TWXN3ULVFTAP3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FJCOKFVJPHOT4Y6ISU6TWXN3ULVFTAP3/>
Archived-At: 
 <https://lore.freedesktop.org/e1c53700bdf4db6c2246a9b9e7098cb6db905797.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hey! Sorry for the long delay in response

Would you mind sending me the size/offset numbers you used here? My
unit tests should have caught issues like this, so if they're happening
I definitely should add it to the testcases I've got to make sure
there's no problems

On Thu, 2026-02-12 at 17:59 -0800, Deborah Brouwer wrote:
> Hi Lyude,
>=20
> On Fri, Feb 06, 2026 at 05:34:30PM -0500, Lyude Paul wrote:
> > This introduces a set of bindings for working with iosys_map in
> > rust code
> > using the new Io traits.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> >=20
> > ---
> > V5:
> > - Fix incorrect field size being passed to iosys_map_memcpy_to()
> > - Add an additional unit test, basic_macro(), which can
> > successfully catch
> > =C2=A0 the above issue so it doesn't happen again in the future.
> > V6:
> > - Drop as_slice/as_mut_slice (Alice Rhyl)
> > V7:
> > - Start using Alexandre Courbot's wonderful Io, IoCapable and
> > IoKnownSize
> > =C2=A0 traits instead of trying to roll our own IO accessors. This also
> > changes
> > =C2=A0 the following:
> > =C2=A0 - We don't have a custom AsBytes/FromBytes type that we carry
> > around any
> > =C2=A0=C2=A0=C2=A0 longer with maps
> > =C2=A0 - We now have optional compile-time size checking
> > =C2=A0 - We don't need our own unit tests anymore
> > =C2=A0 - RawIoSysMap can be used for unsafe IO operations, because why
> > not.
> > =C2=A0 - IoSysMapRef::new() can fail now since it needs to ensure SIZE
> > is valid.
> > =C2=A0 - We don't implement Deref<RawIoSysMap> for IoSysMapRef any
> > longer. The
> > =C2=A0=C2=A0=C2=A0 main reason for this is that we want to avoid users =
having to
> > manually
> > =C2=A0=C2=A0=C2=A0 specify if they want the RawIoSysMap or IoSysMapRef =
variant
> > functions
> > =C2=A0=C2=A0=C2=A0 like io_read()/io_write().
> > =C2=A0=C2=A0=C2=A0 This is fine IMHO, but to make sure things remain ea=
sy for APIs
> > that
> > =C2=A0=C2=A0=C2=A0 wrap around iosys map we make IoSysMapRef.raw_map pu=
b(crate).
> >=20
> > =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/iosys_map.c |=C2=A0 34 +++++++
> > =C2=A0rust/kernel/iosys_map.rs | 211
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A0rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > =C2=A04 files changed, 247 insertions(+)
> > =C2=A0create mode 100644 rust/helpers/iosys_map.c
> > =C2=A0create mode 100644 rust/kernel/iosys_map.rs
> >=20
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 1d3333cc0d2a8..bd8ad237aa02e 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -31,6 +31,7 @@
> > =C2=A0#include "irq.c"
> > =C2=A0#include "fs.c"
> > =C2=A0#include "io.c"
> > +#include "iosys_map.c"
> > =C2=A0#include "jump_label.c"
> > =C2=A0#include "kunit.c"
> > =C2=A0#include "maple_tree.c"
> > diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
> > new file mode 100644
> > index 0000000000000..6861d4ec48a4b
> > --- /dev/null
> > +++ b/rust/helpers/iosys_map.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/iosys-map.h>
> > +#include <linux/types.h>
> > +
> > +#define
> > rust_iosys_map_rd(type__)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=09__rust_helper
> > type__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09rust_helper_iosys_map_rd_ ## type__(const struct iosys_map
> > *map, size_t offset) \
> > +=09{=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09=09return iosys_map_rd(map, offset,
> > type__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09}
> > +#define
> > rust_iosys_map_wr(type__)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=09__rust_helper
> > void=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=09rust_helper_iosys_map_wr_ ## type__(const struct iosys_map
> > *map, size_t offset, \
> > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 type__
> > value)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09{=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09=09iosys_map_wr(map, offset, type__,
> > value);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09}
> > +
> > +rust_iosys_map_rd(u8);
> > +rust_iosys_map_rd(u16);
> > +rust_iosys_map_rd(u32);
> > +
> > +rust_iosys_map_wr(u8);
> > +rust_iosys_map_wr(u16);
> > +rust_iosys_map_wr(u32);
> > +
> > +#ifdef CONFIG_64BIT
> > +rust_iosys_map_rd(u64);
> > +rust_iosys_map_wr(u64);
> > +#endif
> > +
> > +#undef rust_iosys_map_rd
> > +#undef rust_iosys_map_wr
> > diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
> > new file mode 100644
> > index 0000000000000..2070f0fb42cb8
> > --- /dev/null
> > +++ b/rust/kernel/iosys_map.rs
> > @@ -0,0 +1,211 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! IO-agnostic memory mapping interfaces.
> > +//!
> > +//! This crate provides bindings for the `struct iosys_map` type,
> > which provides a common interface
> > +//! for memory mappings which can reside within coherent memory,
> > or within IO memory.
> > +//!
> > +//! C header: [`include/linux/iosys-
> > map.h`](srctree/include/linux/pci.h)
> > +
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 error::code::*,
> > +=C2=A0=C2=A0=C2=A0 io::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Io,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IoCapable,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IoKnownSize, //
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 prelude::*, //
> > +};
> > +use bindings;
> > +use core::marker::PhantomData;
> > +
> > +/// Raw unsized representation of a `struct iosys_map`.
> > +///
> > +/// This struct is a transparent wrapper around `struct
> > iosys_map`. The C API does not provide the
> > +/// size of the mapping by default, and thus this type also does
> > not include the size of the
> > +/// mapping. As such, it cannot be used for actually accessing the
> > underlying data pointed to by the
> > +/// mapping.
> > +///
> > +/// With the exception of kernel crates which may provide their
> > own wrappers around `RawIoSysMap`,
> > +/// users will typically not interact with this type directly.
> > +#[repr(transparent)]
> > +pub struct RawIoSysMap<const SIZE: usize =3D
> > 0>(bindings::iosys_map);
> > +
> > +impl<const SIZE: usize> RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a raw `bindings::iosys_map`.
> > +=C2=A0=C2=A0=C2=A0 #[expect(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn from_raw(val: bindings::iosys_map) ->=
 Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(val)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Returns whether the mapping is within IO memory=
 space or
> > not.
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub fn is_iomem(&self) -> bool {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.is_iomem
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a `RawIoSysMap<SIZE>` to a raw
> > `bindings::iosys_map` ref.
> > +=C2=A0=C2=A0=C2=A0 #[expect(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn as_raw(&self) -> &bindings::iosys_map=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self.0
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a `RawIoSysMap<SIZE>` to a raw mut=
able
> > `bindings::iosys_map` ref.
> > +=C2=A0=C2=A0=C2=A0 #[allow(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn as_raw_mut(&mut self) -> &mut
> > bindings::iosys_map {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self.0
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Returns the address pointed to by this iosys ma=
p.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Note that this address is not guaranteed to be =
valid, and
> > may or may not reside in I/O
> > +=C2=A0=C2=A0=C2=A0 /// memory.
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub fn addr(&self) -> usize {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (if self.is_iomem() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: We confirmed above that this iosys map is
> > contained within iomem, so it's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
safe to read vaddr_iomem
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe { self.0.__bindgen_anon_1.vaddr_iomem }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: We confirmed above that this iosys map is
> > not contaned within iomem, so it's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
safe to read vaddr.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe { self.0.__bindgen_anon_1.vaddr }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }) as usize
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: As we make no guarantees about the validity of the
> > mapping, there's no issue with sending
> > +// this type between threads.
> > +unsafe impl<const SIZE: usize> Send for RawIoSysMap<SIZE> {}
> > +
> > +impl<const SIZE: usize> Clone for RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0 fn clone(&self) -> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(self.0)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +macro_rules! impl_raw_iosys_map_io_capable {
> > +=C2=A0=C2=A0=C2=A0 ($ty:ty, $read_fn:ident, $write_fn:ident) =3D> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 impl<const SIZE: usize> IoC=
apable<$ty> for
> > RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[i=
nline(always)]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe fn io_read(&self, address: usize) -> $ty {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: By the trait invariant `address` is a
> > valid address for iosys map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // operations.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::$read_fn(&self.0, address) }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[i=
nline(always)]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe fn io_write(&self, value: $ty, address: usize)
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: By the trait invariant `address` is a
> > valid address for iosys map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // operations.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::$write_fn(&self.0, address,
> > value) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 };
> > +}
> > +
>=20
> I think there might be a mismatch between the absolute address being
> passed to these read and write functions and the bindings helpers
> that expect an offset argument.
>=20
> This crashed Tyr when I tried to write the firmware in u8 chunks at
> incremental offsets. But if i just calculated the offset and passed
> that
> instead of the absolute address, this worked fine:
>=20
> =C2=A0 let offset =3D address - self.addr();
> =C2=A0 unsafe { bindings::$write_fn(&self.0, offset, value) };
>=20
> Here's some of the call trace:
>=20
> [=C2=A0=C2=A0 31.553727] tyr fb000000.gpu: supply sram not found, using d=
ummy
> regulator
> [=C2=A0=C2=A0 31.555096] tyr fb000000.gpu: mali-unknown id 0xa867 major 0=
x67
> minor 0x0 status 0x5
> [=C2=A0=C2=A0 31.555778] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0=
x809
> Mem:0x301 MMU:0x2830 AS:0xff
> [=C2=A0=C2=A0 31.556521] tyr fb000000.gpu: shader_present=3D0x00000000000=
50005
> l2_present=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [=C2=A0=C2=A0 31.557868] stackdepot: allocating hash table of 524288 entr=
ies
> via kvcalloc
> [=C2=A0 OK=C2=A0 ] Started systemd-tmpfiles-clean.tim=E2=80=A6y Cleanup o=
f Temporary
> Directories.
> [=C2=A0=C2=A0 31.562424] stackdepot: allocating space for 8192 stack pool=
s via
> kvcalloc
> [=C2=A0 OK=C2=A0 ] Reached target timers.target - Timer Units.
> [=C2=A0=C2=A0 31.563676] tyr: Firmware protected mode entry not supported=
,
> ignoring
> [=C2=A0=C2=A0 31.571391] Unable to handle kernel paging request at virtua=
l
> address 0000000000800069
> [=C2=A0=C2=A0 31.572762] Mem abort info:
> [=C2=A0=C2=A0 31.573027]=C2=A0=C2=A0 ESR =3D 0x0000000096000021
> [=C2=A0=C2=A0 31.573402]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> [=C2=A0=C2=A0 31.573878]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0=C2=A0 31.574157]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0=C2=A0 31.574442]=C2=A0=C2=A0 FSC =3D 0x21: alignment fault
> [=C2=A0 OK=C2=A0 ] Listening on dbus.socket - D-Bus System Message Bus So=
cket.
> [=C2=A0=C2=A0 31.593348] Data abort info:
> [=C2=A0=C2=A0 31.593628]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000021, ISS2 =
=3D 0x00000000
> [=C2=A0=C2=A0 31.594117]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagA=
ccess =3D 0
> [=C2=A0=C2=A0 31.594567]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> [=C2=A0=C2=A0 31.595042] user pgtable: 4k pages, 48-bit VAs,
> pgdp=3D0000000105e50000
> [=C2=A0=C2=A0 31.595613] [0000000000800069] pgd=3D0000000000000000,
> p4d=3D0000000000000000
> [=C2=A0=C2=A0 31.596434] Internal error: Oops: 0000000096000021 [#1]=C2=
=A0 SMP
> [=C2=A0=C2=A0 31.596936] Modules linked in: snd tyr(+) soundcore sha256
> cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
> [=C2=A0=C2=A0 31.597830] CPU: 3 UID: 0 PID: 241 Comm: (udev-worker) Not t=
ainted
> 6.19.0-rc5 #282 PREEMPT
> [=C2=A0=C2=A0 31.598561] Hardware name: Radxa ROCK 5B (DT)
> [=C2=A0=C2=A0 31.598944] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT =
-SSBS
> BTYPE=3D--)
> [=C2=A0=C2=A0 31.599554] pc : __d_lookup_rcu+0xbc/0x168
> [=C2=A0=C2=A0 31.599921] lr : __d_lookup_rcu+0x60/0x168
> [=C2=A0=C2=A0 31.600283] sp : ffff800081ebba00
> [=C2=A0=C2=A0 31.600574] x29: ffff800081ebba00 x28: 0000000000000049 x27:
> ffff00010d07002b
> [=C2=A0=C2=A0 31.601205] x26: 0000000000000081 x25: 000000000006915e x24:
> ffff0002f6600000
> [=C2=A0=C2=A0 31.601848] x23: ffff00010396a040 x22: ffff000102098460 x21:
> 000000036915e207
> [=C2=A0=C2=A0 31.601859] x20: ffff000101e10af8 x19: ffff800081ebbcac x18:
> 2f64662f666c6573
> [=C2=A0=C2=A0 31.601867] x17: ffffff00666c6573 x16: 00000000fffffffc x15:
> 0000000000003431
> [=C2=A0=C2=A0 31.601875] x14: 000000000000000f x13: 0080205100800107 x12:
> 0000000000800069
> [=C2=A0=C2=A0 31.601882] x11: ffffffffffffffff x10: 0000000000000018 x9 :
> 0000000000000003
> [=C2=A0=C2=A0 31.601890] x8 : 00000000008000a1 x7 : ffffb9d13df173c8 x6 :
> 0000000000000000
> [=C2=A0=C2=A0 31.601897] x5 : 0000000000000000 x4 : 0000000000000010 x3 :
> ffffffffffff0a00
> [=C2=A0=C2=A0 31.601905] x2 : ffff800081ebbcac x1 : ffffb9d1406be718 x0 :
> 0000000000000001
> [=C2=A0=C2=A0 31.601913] Call trace:
> [=C2=A0=C2=A0 31.601915]=C2=A0 __d_lookup_rcu+0xbc/0x168 (P)
> [=C2=A0=C2=A0 31.601922]=C2=A0 lookup_fast+0x98/0x174
> [=C2=A0=C2=A0 31.601929]=C2=A0 link_path_walk+0x280/0x528
> [=C2=A0=C2=A0 31.601935]=C2=A0 path_lookupat+0x60/0x1f0
> [=C2=A0=C2=A0 31.601941]=C2=A0 do_o_path+0x34/0xb4
> [=C2=A0=C2=A0 31.601947]=C2=A0 path_openat+0xccc/0xe34
> [=C2=A0=C2=A0 31.601953]=C2=A0 do_filp_open+0xc0/0x170
> [=C2=A0=C2=A0 31.601958]=C2=A0 do_sys_openat2+0x88/0x10c
> [=C2=A0=C2=A0 31.601963]=C2=A0 __arm64_sys_openat+0x70/0x9c
> [=C2=A0=C2=A0 31.601968]=C2=A0 invoke_syscall+0x40/0xcc
> [=C2=A0=C2=A0 31.601974]=C2=A0 el0_svc_common+0x80/0xd8
> [=C2=A0=C2=A0 31.601979]=C2=A0 do_el0_svc+0x1c/0x28
> [=C2=A0=C2=A0 31.601984]=C2=A0 el0_svc+0x54/0x1d4
> [=C2=A0=C2=A0 31.601991]=C2=A0 el0t_64_sync_handler+0x84/0x12c
> [=C2=A0=C2=A0 31.601997]=C2=A0 el0t_64_sync+0x198/0x19c
> [=C2=A0=C2=A0 31.602005] Code: 14000003 f9400108 b4000428 d100e10c (88dff=
d8c)
> [=C2=A0=C2=A0 31.602009] ---[ end trace 0000000000000000 ]---
> [=C2=A0 OK=C2=A0 ] Listening on sshd-unix-local.socke=E2=80=A6temd-ssh-ge=
nerator,
> AF_UNIX Local).
> [=C2=A0=C2=A0 31.620067] mc: Linux media interface: v0.10
> [=C2=A0=C2=A0 31.623483] [drm] Initialized panthor 1.5.0 for fb000000.gpu=
 on
> minor 0
> [=C2=A0=C2=A0 31.623765] Unable to handle kernel paging request at virtua=
l
> address 00802a4d0080284d
> [=C2=A0=C2=A0 31.624285] tyr fb000000.gpu: Tyr initialized correctly.
> [=C2=A0=C2=A0 31.624752] Mem abort info:
> [=C2=A0=C2=A0 31.624754]=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> [=C2=A0=C2=A0 31.625847]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> [=C2=A0=C2=A0 31.626310]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0=C2=A0 31.626578]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0=C2=A0 31.626853]=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fa=
ult
> [=C2=A0=C2=A0 31.627277] Data abort info:
> [=C2=A0=C2=A0 31.627529]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =
=3D 0x00000000
> [=C2=A0=C2=A0 31.628006]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagA=
ccess =3D 0
> [=C2=A0=C2=A0 31.628447]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> [=C2=A0=C2=A0 31.628910] [00802a4d0080284d] address between user and kern=
el
> address ranges
> [=C2=A0=C2=A0 31.629535] Internal error: Oops: 0000000096000004 [#2]=C2=
=A0 SMP
> [=C2=A0=C2=A0 31.630030] Modules linked in: mc drm_client_lib snd tyr sou=
ndcore
> sha256 cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
> [=C2=A0=C2=A0 31.631017] CPU: 4 UID: 0 PID: 225 Comm: systemd-udevd Taint=
ed:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.19.0-rc5 #282 PREEMPT
> [=C2=A0=C2=A0 31.631877] Tainted: [D]=3DDIE
> [=C2=A0=C2=A0 31.632129] Hardware name: Radxa ROCK 5B (DT)
> [=C2=A0=C2=A0 31.632506] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT =
-SSBS
> BTYPE=3D--)
> [=C2=A0=C2=A0 31.633111] pc : ___d_drop+0xd8/0x144
> [=C2=A0=C2=A0 31.633433] lr : d_invalidate+0x3c/0x110
> [=C2=A0=C2=A0 31.633776] sp : ffff800081d3ba70
> [=C2=A0=C2=A0 31.634064] x29: ffff800081d3ba90 x28: 0000000000000001 x27:
> ffffb9d140bfa000
> [=C2=A0=C2=A0 31.634685] x26: ffff0001039b5108 x25: ffff00010396a000 x24:
> ffffb9d140166275
> [=C2=A0=C2=A0 31.635305] x23: ffffb9d140bfa000 x22: ffffb9d140152f3a x21:
> ffff000104076000
> [=C2=A0=C2=A0 31.635925] x20: ffff00010e520098 x19: ffff00010396a000 x18:
> 0000000000000000
> [=C2=A0=C2=A0 31.636545] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> [=C2=A0=C2=A0 31.637165] x14: 0000000000000000 x13: ffff00010792b8f0 x12:
> 000000000000017a
> [=C2=A0=C2=A0 31.637785] x11: 00000000008000a1 x10: 00802a4d0080284d x9 :
> ffff0002f6604010
> [=C2=A0=C2=A0 31.638405] x8 : ffff000105bfcd40 x7 : 0000000000000000 x6 :
> ffffb9d13e272c60
> [=C2=A0=C2=A0 31.639026] x5 : 0000000000000000 x4 : 0000000000000001 x3 :
> 0000000000000000
> [=C2=A0=C2=A0 31.639646] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff00010396a000
> [=C2=A0=C2=A0 31.640266] Call trace:
> [=C2=A0=C2=A0 31.640479]=C2=A0 ___d_drop+0xd8/0x144 (P)
> [=C2=A0=C2=A0 31.640800]=C2=A0 d_invalidate+0x3c/0x110
> [=C2=A0=C2=A0 31.641113]=C2=A0 proc_invalidate_siblings_dcache+0x244/0x2b=
8
> [=C2=A0=C2=A0 31.641577]=C2=A0 proc_flush_pid+0x1c/0x28
> [=C2=A0=C2=A0 31.641897]=C2=A0 release_task+0x560/0x668
> [=C2=A0=C2=A0 31.642218]=C2=A0 wait_consider_task+0x5a0/0xb44
> [=C2=A0=C2=A0 31.642582]=C2=A0 __do_wait+0x154/0x1f0
> [=C2=A0=C2=A0 31.642879]=C2=A0 do_wait+0x84/0x16c
> [=C2=A0=C2=A0 31.643154]=C2=A0 __arm64_sys_waitid+0xac/0x218
> [=C2=A0=C2=A0 31.643512]=C2=A0 invoke_syscall+0x40/0xcc
> [=C2=A0=C2=A0 31.643833]=C2=A0 el0_svc_common+0x80/0xd8
> [=C2=A0=C2=A0 31.644152]=C2=A0 do_el0_svc+0x1c/0x28
> [=C2=A0=C2=A0 31.644441]=C2=A0 el0_svc+0x54/0x1d4
> [=C2=A0=C2=A0 31.644718]=C2=A0 el0t_64_sync_handler+0x84/0x12c
> [=C2=A0=C2=A0 31.645090]=C2=A0 el0t_64_sync+0x198/0x19c
> [=C2=A0=C2=A0 31.645412] Code: 5280002a f85f83a0 17fffff1 a944280b (f9400=
14c)
> [=C2=A0=C2=A0 31.645941] ---[ end trace 0000000000000000 ]---
>=20
> thanks,
> Deborah

