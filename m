Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8986FF8850
	for <nouveau@archiver.kernel.org>; Fri, 24 Apr 2026 23:10:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A8AFC10F6E6;
	Fri, 24 Apr 2026 23:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ox57Ghba";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 626BD45C40;
	Fri, 24 Apr 2026 22:58:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777071490;
 b=EuNGxKWY3lnshlt0HwdyG2UneKVO3/+2PZwqgNi3n2z8PuMsrKVqYFDUWQZtJM04cb2ac
 HPQ6WmOhbzsuhRtzh8lFlXLf5f/hYPK9vUo+J62DpvYuEJIwV9T+jasgiUTbINj9OqrCQr+
 +Xp+0SvLgtp+pNZCyHnkeBYYgrZ5tTCdHfX0N0fXjib5cZlh4NwaU5kOAmpj6weVEeXyiKy
 bIEyBE2LEAL2oJwqpkBwUWO9zChBYuSI0yMaXKzdLvfiUDxDGe2gIz/XujPQHIKg19wm6Qp
 g0YhX7xyU9AgyIZU5vt4bli+0+PR3Q37BAPzeHdTSLoH8lL1CJizYwqe+pww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777071490; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
 b=tBvTH8cA4efA6/tYsWVjkzMgMD9JlSP451WJd+TDhFtmEhCSI5caHwqx8Ns5edrgrLjvv
 5EbllDDh1D848aR9n+1z2bm3lGQ+WHX2kFII3M8O1OLvDJ1ae+dAPuDiIjhfS4mEpZ92nNF
 Vo14Km2dSNOAby0pN0qIrchxQ1ug9SZV+iMdEGXMFFBPsAeTI1k0rPhtyJ/kwiquMKMUmaz
 2ufeBi08uJehk+dBfOdbqjS6pfUwf7o3R3IXY4ONdpIPMga/KBGZaLPFawuIW8R4tESaevV
 bxqGrQBBiu6u31PTc6TVYeribQnTUeaQeZKcmzT4cQm54LFA4dAxv+JoqQTQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C10A45C37
	for <nouveau@lists.freedesktop.org>; Fri, 24 Apr 2026 22:58:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF9010E087
	for <nouveau@lists.freedesktop.org>; Fri, 24 Apr 2026 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777072220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
	b=Ox57Ghbaimk+jQcGIkzcbqK9WJL9ntd5Lp4/lyP9TvlWgzx0/4F+gci2Co4byOQAYVLcwF
	95KiuMrTV9rR0XaCOM1dP7xJiREMV6d/0rhDfO1OWkHzSlDpOrsGGU3b50bFPGvgZeTrlM
	j9qYAH6xmou+rfPEICFo7OratmFYSxc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-hKm2H-3mNiO9UIFwFFGvVw-1; Fri, 24 Apr 2026 19:10:18 -0400
X-MC-Unique: hKm2H-3mNiO9UIFwFFGvVw-1
X-Mimecast-MFC-AGG-ID: hKm2H-3mNiO9UIFwFFGvVw_1777072218
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8eaec5f60edso1018990885a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 24 Apr 2026 16:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777072218; x=1777677018;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N09YNoupJhmv1sapC/t38hsbn3OUvdSVBkUzd+3dwtM=;
        b=q9fVGIspLKwmOedJgOdgQMuYek92VhQH4ZKUsoqr9XrZIOyPqWrNSKwmG5brpQFZ+l
         DXZ8GEDSuTHYbzYSToHMsevkvAlBZbnp/uDreoZ9ZCIzd9DvNPaEXttfyGoStgFiogFW
         Hw6LeS0HILi7lZWQimpbbHjokbmYHR1KwHgLnTEwdOPy6sgr3U0WJUlP68/xe5XcJlzB
         4OxesuSNBhE8Wl/tppJBez/sWFc9rDZKHL6quVdIJwO0hPoZHr+4gqY03VrzgfUMckAB
         DlqE69Y8Vua9qKbT3ckIxTEvlUJ0krW6luV/M/MejYz0aKJOVw0z38T92wWr44onBIOJ
         FB1g==
X-Gm-Message-State: AOJu0YwL0xPOPz2zj4aiW8fhcFu8Zh3UWTf/KKxz51rkr8ZyLn8e0yts
	NMuezkR4CZLxGOkmpFglqWQG1DYQvD8xI3FJNnXCJPKrdrqV4T/ntbugwoU+AwjOSfXt1Y2IXR1
	IqGVvKkaDULCW3maxsiciJb2n2GZrhMw8ktuCJ9gbavs0F03fXuWHiWtSo9n66sLu8vw=
X-Gm-Gg: AeBDievzAQtEThScmcrrynx8WZP8Dl1x7U82SZGh5AkYhg6027igiLOn8zzK0K+o36i
	64/4y65FZPf95mGFt9hmdhEZwiHD/rl9LHszDjeQDLSZph5IZ/W42KOztGTOx0lUoIC6h91jJkw
	bxxU4KJZVFaqezr/dtNED5YJi+vMK8kr7yzAwlHTMDv4dlhQ+wU1AJ2BY3FqUF+Mm3nx+HgGJGl
	0HiXyrQapUqPw2t6hnc7oB/yJGcxy8UUfDe2Gqe5vBAxHZI0osceZCVmIhChUbZmFgxFBmGxPrt
	bA1UhnYCL78710b7R4ssmM0nmgGA3Juz/3Rx+znwBroGG0ZRSDmpPzomprw5tDTn0/KtxzDWjmc
	YyMJg4AlFnKBsCcRATXDHej8F04Xz
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id
 af79cd13be357-8ebcbf89261mr3123559785a.34.1777072217910;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:8eb:cbf8:85e7 with SMTP id
 af79cd13be357-8ebcbf89261mr3123553685a.34.1777072217335;
        Fri, 24 Apr 2026 16:10:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8e7d69ad48asm1913863785a.19.2026.04.24.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 16:10:16 -0700 (PDT)
Message-ID: <ed26658c461020547e058b237575324adcbaca59.camel@redhat.com>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 24 Apr 2026 19:10:14 -0400
In-Reply-To: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-5-lyude@redhat.com>
	 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PHjseF7qt6TeRn3mItIr8UD59wsRXDsT7eJ1nAVpDBE_1777072218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KBJU6RN5MLBGSIXVNUT5EEQGFSVSKVZN
X-Message-ID-Hash: KBJU6RN5MLBGSIXVNUT5EEQGFSVSKVZN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KBJU6RN5MLBGSIXVNUT5EEQGFSVSKVZN/>
Archived-At: 
 <https://lore.freedesktop.org/ed26658c461020547e058b237575324adcbaca59.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> There are 4 sites where we acquire and release the DMA resv lock,
> each
> of which require unsafe blocks and carrying the risk that we forget
> releasing the lock in the end. For this method in particular we need
> to
> jump through hoops a bit and store the return value into a temporary
> variable so we can unlock the DMA reservation.
>=20
> Let's do ourselves a favor and implement a small, private guard type:
>=20
> =C2=A0=C2=A0=C2=A0 struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>=
);
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn new(object: &'a Object<T>) =
-> Self {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: This lock is initialized throughout the
> lifetime of `object`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_lock(object.raw_dma_resv(),
> ptr::null_mut()) };
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(o=
bject)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a, T> Drop for DmaResvGuard<'a, T>
> =C2=A0=C2=A0=C2=A0 where
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T: DriverObject,
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAF=
ETY: We are releasing the lock grabbed during the
> creation of this object.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe=
 { bindings::dma_resv_unlock(self.0.raw_dma_resv())
> };
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>=20
> There here you would just do
>=20
> =C2=A0=C2=A0=C2=A0 let _dma_resv =3D DmaResvGuard::new(self);

I thought of doing this but lost track of how many times I was actually
grabbing this lock=E2=80=A6
BTW - want me to just give you authorship on the patch for adding
DmaResvGuard? Since on my branch I've pretty much only just added two
inline annotations, it's otherwise identical to what you wrote here.

