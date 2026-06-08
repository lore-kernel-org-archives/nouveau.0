Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE4ECD8C9D
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 17:10:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B88F10F7A4;
	Mon,  8 Jun 2026 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ACyxwpQQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA42046861;
	Mon,  8 Jun 2026 16:56:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780937803;
 b=HvKbl4AUUmoZJDiUqNqOyOV31JAAecKEYK1yiLAC332E8MQBza+2+DA6ZMoQ8LMyaMXlL
 0FQFpQWPvFUiD31dCVA7+cyMcktbxP8hUNsWjVcmYugoXxP2fokdI8gKEnUV0rwFDpEa8NE
 HIMmTP7/ermwdpWRmBCKOKgoQTMeCIw+qrr/2bAtyZopVLa4pOmkZ0A2PCmlSYDyhsZfKWO
 4O6+qKI7fXQF3OWQUbdCbzxFOsZ1cE1VPnqpvpPRv3cbZdqy78yFfPjVEH2ggOYr9RBYfiD
 AGZUf2iTZKSkgKfbfXVZbfwvyq7kOZuEwbEF4eC22O3Wlmhohlw3vVrUe1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780937803; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
 b=svaq9wmVafFyyyS67yOTtE39WQq3hcbM8p6wBSRqo13zjc31MdAQcK/ZgoZ7x9HtHatBR
 iMBjHZJlJtZZ5W2XjS/0U39q4BmjqMLMfRAsQXBwb3sb3tTg2WAfIYTWC/qKiN8KHyNlZu/
 I7RX+QDgPtAkfwRHGkneQTlrs3O7vUz09QWHWQbYZ5kBXWtNLX8SRiEwmlfkc5KbcN6LNEC
 wY2D9qbzboa3vBGw6Ji2S2/Thkcqq1/2AMqig56dRvZinbf9uKKzSZe+pGvDBIldBNtnzZf
 jejmOksqEzmbxjRmkIlIAbA/cxL7ouXMZSWnsgmgD2M3XKVIXcZ6bernQseQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1979B4680A
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 16:56:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDDB10F7A2
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780938633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	b=ACyxwpQQAUOyQN+IHNV0ZG8m0XPYPvbdqVCWpXoXeW/eSfKtHLu/jsA9a13k9fDLDMwwhT
	o95R3LLefY/44GJbdvdh9pl97tU89YphJSgGEKhOVLfd3HQNewXsiPybe9Qj9OAGoCgP1E
	n5cAVf4BNhuG/ABadNZz87Mw9HIgxXw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-68LWNuIpO4mbq0p-guxKOQ-1; Mon, 08 Jun 2026 13:10:22 -0400
X-MC-Unique: 68LWNuIpO4mbq0p-guxKOQ-1
X-Mimecast-MFC-AGG-ID: 68LWNuIpO4mbq0p-guxKOQ_1780938622
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-915c364ae3bso397407185a.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 08 Jun 2026 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938622; x=1781543422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
        b=SaEkpE3ySMMuEGUnAGg41NZ9H3w9/vf761UEcsMIZ9dhtnJLKGDiM/AXkfqBwgVXQV
         IPd1Hms/rK+wCUWZHxDAF/KRcAK3MVZjMWkE9jQ7Vc/TGQejCmNyh9p/avc2oZNOJqWl
         qv0EMUJk9TQNLRJ/bheJB6ztBaS8augD3ffuOpHbd1V2HDW39m07rd6VJQxyeIz2RBnk
         w1q7pSo5qcyQYf97DDKA4q7z++zFt2QIozu7K+1iQ3G+N9FqN/zUBpjLkJAVdIKtW+RL
         0uJdSJM41A+gEPAfLChBx9bcQX9sn+CHMZ1hSmHk/rtsWs8/C5JoE4AwgirlWTYBhRI1
         CFvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qNeeuFfo/92ok+wa02ak/z3iIlzGL6G89iZwVxhxmhxCxfSSwWBo1jYWscPDbv8HH0QIP2V20@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNhuBXyPQuQv2cmPwvjKVXcqO9DXKcOslKYQsY29K7+mWJhDHS
	etqcZRZVLKNqyKce3PBqtZ3hI41XjFZgHi80CMinOU1k8ms8HsvQRDvsVWY0bkbVv8E8D32wlUw
	IX4ZbONODc6subf9d65b4AjsJrWBdeTA1g76FIqiGEtWfhVfmqYVC7SZa8ELeeNTHozs=
X-Gm-Gg: Acq92OHApt2V9wiGOYu2/QnJEzEk3Ps7Nt4eUY7pIYrk9dYTxJDyjTaVdbag7RjhPKN
	v0HWn03gxks34640DsUSj39y78BTSLa+Vut6Qlrl9w9wxK1jh8EJgsmWsRERRT4bOHNtzzu2SuI
	XIYw2iozAE1LddvN/c9JlmkDTul1LhvL/4JPm1pDsoeXG3+ptuwQQLduJDrc0jOPs8qASAVheF8
	w9bdr9Qdmx1DUN7LJpFoa3V5E8akRc4LLAX6uHMWMudDMJCK3DwgpDBraKKCUo76WZVVA42e0FT
	PiRYE3PjzXnWtiWgtQnDxMKiedUiNmBHrwQkpoUe4CmtiENwSnbmT366DtR2VB8RUal+U0hr5Uf
	laoO4gdYDmi8HODaVo3g2pYsoU4Gh
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id
 af79cd13be357-915a9db892dmr2520125085a.43.1780938621252;
        Mon, 08 Jun 2026 10:10:21 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id
 af79cd13be357-915a9db892dmr2520115285a.43.1780938620617;
        Mon, 08 Jun 2026 10:10:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a3bf5f9sm1822479085a.35.2026.06.08.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:10:19 -0700 (PDT)
Message-ID: <00c7a09eac169e9da541b50396ceaa69ae978c10.camel@redhat.com>
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Date: Mon, 08 Jun 2026 13:10:18 -0400
In-Reply-To: <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
References: <20260604192740.659240-1-lyude@redhat.com>
	 <20260604192740.659240-2-lyude@redhat.com>
	 <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LOiRmJ8xe-kSTsiE1YSDHEz1FnXbbPtIrbkR7uZHF2c_1780938622
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MVVAHSXR3FQWV3TFJ4P4PNMCVJDLQVJW
X-Message-ID-Hash: MVVAHSXR3FQWV3TFJ4P4PNMCVJDLQVJW
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MVVAHSXR3FQWV3TFJ4P4PNMCVJDLQVJW/>
Archived-At: 
 <https://lore.freedesktop.org/00c7a09eac169e9da541b50396ceaa69ae978c10.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I think I have just been defaulting to always for anything that seems
like it should be unquestionably inlined - should I be defaulting to
#[inline] instead?

On Sun, 2026-06-07 at 13:22 +0100, Gary Guo wrote:
> > +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C>
> > {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> Why `always` here?
>=20
> Best,
> Gary

