Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2962DFED3F2
	for <nouveau@archiver.kernel.org>; Fri, 24 Apr 2026 18:13:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2A210F681;
	Fri, 24 Apr 2026 18:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="flTNSQDk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AFE2645C3B;
	Fri, 24 Apr 2026 18:01:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777053703;
 b=CM8hFJi0sTGjXvctmQowmzd1LnGzjqvFksSsZkPr7vPk7TCB7iJmgOxdh/pySWVx0mc5K
 tQH9/P2wrc/OuSH5wjoTzzPKqSkl55f7el2QolUmg1cEXHc1dTySjcxOe4VlJLNPaF0MalC
 o5Rljmd0fdRjpnyr3wXR0AVYQHZgrVa6VcO3UeplFPbAN3x/635tmJt/2u4I3uzPz6/k66A
 NHjaY/pPgvrdQh2Grv+wt4v932Lldnd3ezeoSr1KDMKSmA5M8dPFoTPA/vpdtzC9qPQx+n0
 kazGJE8gtv05/sofYKcSu9yXzHh28rCdYMV2Wq1J7QMHDVe5kuoeaqH1c17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777053703; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
 b=AoUPAuf3PJre4p9axaeGYWQzZnapIp0U0B1yTKeqI9cFLkxOIctLOR8ZnI20Ge9MiKlPn
 3IdCv7/OFMjAwBqCAQZapIFz2zaOyesfRd+zSfKjz/Z5bMnmaIxhTYyZPeJ6e2UfA2yaJEA
 VHMDzW0TMIwm3PavSt5ySGPcrWzOp5judQXw/fm3PSeKgDEdgUfGXwew+I7TFdo7JFf7Ntb
 TOBNs8XEPFB3ljmYdoa/Zm3qJMaUSs+0SUo77/7PQMai8aa6tJvExZAx1i/bwqyZ9WgJ+bq
 AdJy6ZG0ko6MisFonQReyDoelkLsHsicQrR9qa1hxJtitX+EI6bKU6/rdaEw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B68D5454ED
	for <nouveau@lists.freedesktop.org>; Fri, 24 Apr 2026 18:01:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27F3010F677
	for <nouveau@lists.freedesktop.org>; Fri, 24 Apr 2026 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777054433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
	b=flTNSQDk4iGEkK+XzM5UOP44uM8sB70PtTTtL0NOai7cYIce116BgAbxlWnAZaz4SfXOST
	JgQlSNpXslPqR2G0CB20PJ71GQkumZyfdS7+nI/nSj7Zec8rb9j1kj7eHzy7rDyEBujvOK
	EfJJ1LvxCauF/5jS8j2btPg4YJ6mZOg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-fY8By1tCP2ydpdFT4gsjvA-1; Fri, 24 Apr 2026 14:13:51 -0400
X-MC-Unique: fY8By1tCP2ydpdFT4gsjvA-1
X-Mimecast-MFC-AGG-ID: fY8By1tCP2ydpdFT4gsjvA_1777054431
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8a5f6110cadso191227686d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777054431; x=1777659231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeQosteTdD6VM7jZXWeJNravgroMD7pnnDdWYomsqZs=;
        b=nozFEvzGqz0XjtPt8Q5Dm6aJ7RQDUl5EUU6bCsjmSacmmKEY6WO1kySg6d9xceU7Ya
         XlRFWMihxEneFUHacW9XePtKoMTrW0oMLhr1NxbPSyg7JXBHXhoIWsqTis8JQWhmFHM2
         I4UWBhcpdt/0teqzwsCbI6Pq0DMjR6xOEwpB9nz2jO3TpzLALioWeOk9VnpvhBLvBWJv
         TwHn3pe4wmTY93jbpR5iuHROQKYw4QiQn0NCP9NnMYH6hUnvdDBLKvp6hIL1ll9z6E/d
         9Mc8PYmPtWiKV5tk+DwVdTbIz6oQ/JZFxEfHig7YAlwPDRszyNRqSWI8/6lG3TTVWWs8
         RYow==
X-Gm-Message-State: AOJu0YxKj/Q7m7Bicv7vBM4bLd3FtS/3VmxwZJTH9PIEVGujk9/oq58a
	T/JTSuLfMMLQDf2XHnpAaN3dg6OSgiGtY3QJ7WdNrqBBCCD+U/agEgsidzHWjGRSRyivRGrHha8
	cTMslfnUTWDYrrf7gITswPEoBsxeq+WlA5uc1dOijjemTFVrlyScbffmCxKz6TwlCWxg=
X-Gm-Gg: AeBDievfo0FD2UekJ1MXQ7s58wETrGU410hQx8zm9pEMLRmUP8GZQrQ4BNuPVGm+79Z
	4CzOUAokJj0+coSrBLZgfmrtr1BOavg3w6e9GOD0pKoRWycLLnvNA680LN7HQzcabMXNjGzxKq6
	4tl9lrvbNkLkVOhRAz+dAVbBqD7lVYOz6/t9ft0E6pa9cMZXt8oW26wLxMF2f249S9FbL8k9G8x
	TaIoKrA18XtoFVx6iGpFKITuiDlObjeamVGUUqk+8BQHPmo+Xt+WtV+Jv3UWF1APVrSTYnDNXJC
	K5P2Lc40LEtNpP/lEskNo1fmZDvgiZ1UrEFHDx6rELanlN3HqTxVsy4Bpd05PGm8p0lEiEiimCY
	hKhrKDWINkoE/WPqyeRnQcinftijq
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id
 6a1803df08f44-8b03addd7bdmr442488166d6.32.1777054431181;
        Fri, 24 Apr 2026 11:13:51 -0700 (PDT)
X-Received: by 2002:a05:6214:27c2:b0:8ac:ab30:fffa with SMTP id
 6a1803df08f44-8b03addd7bdmr442487526d6.32.1777054430667;
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae86947sm253378776d6.37.2026.04.24.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 11:13:50 -0700 (PDT)
Message-ID: <4bccf3d1ab49dfdff29a69b2040c4d0aef0e87e3.camel@redhat.com>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 24 Apr 2026 14:13:49 -0400
In-Reply-To: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-5-lyude@redhat.com>
	 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WtfNR3PDe47H_dWyQsAL0ATFj0fab0A0CMYtUrRaiKY_1777054431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3ZNXQSVME4TKCAB55E453XKQOYWMVZW3
X-Message-ID-Hash: 3ZNXQSVME4TKCAB55E453XKQOYWMVZW3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ZNXQSVME4TKCAB55E453XKQOYWMVZW3/>
Archived-At: 
 <https://lore.freedesktop.org/4bccf3d1ab49dfdff29a69b2040c4d0aef0e87e3.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
>=20
> This fails on master:
>=20
> =C2=A0=C2=A0=C2=A0 error[E0432]: unresolved import `crate::sync::ARef`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --> ../rust/kernel/drm/gem/shmem.rs:36:5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0 36 |=C2=A0=C2=A0=C2=A0=C2=A0 sync::ARef,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^ no `A=
Ref` in `sync`
>=20
> Importing `sync::aref::ARef` seems to be the correct way now.

FWIW: as I mentioned in the cover letter, this series applies against
drm-rust-next - not master.

