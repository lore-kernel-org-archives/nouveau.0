Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD34EA7943
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 20:57:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0084D10E779;
	Wed,  4 Feb 2026 20:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JHqu4ou5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78EC341B48;
	Wed,  4 Feb 2026 20:47:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770238064;
 b=Drr9y06ssNtp0xm50VKx9KKQ8C0zt9GJU3yeaL7rzVFgyNW6kp1JtqA0967uEUcOsVlrQ
 sPcpU7IQyZspehNZKrOkqMaeCJYWzwQ29Lk3P1cQ0tM2Hhs9Qjh/9VaT23UQ/SpJRh5wHib
 zgWotbWmzNkX0jyCRa8l6nRrlMDxR/BM/IWRlw7M5SM2786oeZ19Sm2jnqiJz0+cQt1Lff8
 QkRaYpls72jFb54yNk+aVSP6UaXyTa0Lb1gqnPh5zo+NKltHn0TRGAhxrHoqHHKIfLWy5uE
 cU3110VIpedXkvErnYUFoSKbA6k/jGiEZ9B26DaDy+EZSktS9/i/V3ssRgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770238064; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HNUd9rPG1BceWdGBHYZ2EDlIZvEOeylw+slLK97uJB4=;
 b=hT2RLPo3n2TdCVTwA7z29+kIJ0fXCvWVVPQNB9wyvVK4wJfGFirjYbYiCFrYkc6de1CAm
 w+21BvRvsU8AVBC0ueb1vBYaZgmWLUxhR6XBgt7WqI5nuLHu1NaV+OVnDobGgAtavSdXfCr
 ovXPEeFQzuxwgX2sjiBnIx6yFe8tvgIeMnDMZeJRpCCIVt+Q+pd158fMPN34lSvkIZgg5FK
 yluok6Y00q3Q+ErajV1DRhqmUFLHThkamUpmIRCeUDCotLdHKEMV6y7kla7gtyaDmwU1zBi
 tuqdrX71BV6s2OjXifKpQCyUpvWBt6u6rmgJk9HSOC2nddeMtxlUq7iQTltg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BD2040382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 20:47:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7850110E378
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770238618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNUd9rPG1BceWdGBHYZ2EDlIZvEOeylw+slLK97uJB4=;
	b=JHqu4ou5MiXgEs0bPpXv9MIuCV3kUQOEidbmZtN1n/IQAW4LBudWM4Ym+lq0TWFh89EWF0
	Ihr6c9b4TbgOJ1hxTIS87IwWzUv7Kx5M8y5l0iRshj2uCw8L4FiAyfsC3gNvmZ5Wufo+9G
	b5EfcsMPAGNsd15ObBbCv3Chfmlt69g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-2oyV1MWMPEuCmmyLD05KLA-1; Wed, 04 Feb 2026 15:56:56 -0500
X-MC-Unique: 2oyV1MWMPEuCmmyLD05KLA-1
X-Mimecast-MFC-AGG-ID: 2oyV1MWMPEuCmmyLD05KLA_1770238616
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8947d47793fso16690556d6.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 12:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238616; x=1770843416;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxG8OYua1gClXTSBhwuZi6jzgFrYOt/LM5ChTM0bqUk=;
        b=svl3d48Spz/MED8bS7epInkoDYMjWRmvzkoHJLuQ0xVcdLkhq9s0kVnidnffEnjcSZ
         rTS3Mr91XylNzhhlKp1FR19Eh5SrESMxoMxDEFAeaUkHT9d79uWm2usIg1ft0fPIplSz
         cDZsn+sjOlZ22JimzegWEcfkCSYDM8jLCShbRJZG40IC6ezW0tVyROiCuT3RkcrjLEPN
         Edakp4yZn8z/rQbvgWNYY93+qO4bPoXTbMsT7q39/iTK4MiwpwFTQvH5h2R2/mmHjOst
         kxrgpxy3pLjWovn4oWMCWXoRPqw0sm6Gwxiv5FfpFRnZ+MiGcr7JoLVoVAGGGFW0yzxe
         M2fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSfs+gRgkzsbwPyRT4KRT4idFbW1heNJk9k2391GO1ORvUGiqiI3vORI20mmJIM5peCoPhRK31@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPhkmbSOlWd8Y67I/SSFDEHHO6D4b9UFfHG/+TPQAry3CG2Vzb
	CMgwXHGRF0IdT9TPCVx4X+idTQkTNMugKliIDzQR1zy/9Idtk0kOTqDNsj4LwekjcWpu3+MxmWn
	7gHSPopBQex1laFEO0mF909VokjFRxJeWrMw6XqY85hkvgmMI+j5oBFbVO2KDAHTFbC4=
X-Gm-Gg: AZuq6aJE8dQsLXRjPGysbIQ0YlutrQTs58zjskyQwXdjpng+07PDT3OqMFHNy9+upmD
	RBT77mK6NcbRSX9guOhBzUctN2s3p+L2AShQBc1yYddeG4AU000T9KxN5Ds34nTgIleCQm3YoaP
	eiY/kBFPU7V+0vKtyRwPJV42rEDz3rso7a70xihDZL7YAyo1MNS2K1JJuyIVpK+PLeVk4VwWowG
	iQTlHOZD04wUNU5Ys5wYq8R2/LFM3McS9D5saI3iJHgxTTgTV42BDWTAhdTJYfqOTBSTIhoWYLR
	oO4vCZq5o9RdY/YEet2nsKJo2WrY5KY4jtIAHtls08QrVuDzBrUC5bxZxq+KqUc0wadYAP4vtyE
	gVWMAXg==
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id
 af79cd13be357-8ca2f80c345mr484846585a.9.1770238616251;
        Wed, 04 Feb 2026 12:56:56 -0800 (PST)
X-Received: by 2002:a05:620a:4483:b0:8ca:1107:1215 with SMTP id
 af79cd13be357-8ca2f80c345mr484843885a.9.1770238615795;
        Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89521c00173sm27081576d6.12.2026.02.04.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:56:55 -0800 (PST)
Message-ID: <f4504b830225a8fdb7407572d92b65daf390ac8a.camel@redhat.com>
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 04 Feb 2026 15:56:54 -0500
In-Reply-To: <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
	 <20260131001602.2095470-3-lyude@redhat.com>
	 <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rDtTEfnuLk5nQU-Ey5VfdAU0YdtLPjocyfP295cyDx0_1770238616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6ZIN4WBZBLR4SWDUYBKOEZHDUQTGL53V
X-Message-ID-Hash: 6ZIN4WBZBLR4SWDUYBKOEZHDUQTGL53V
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6ZIN4WBZBLR4SWDUYBKOEZHDUQTGL53V/>
Archived-At: 
 <https://lore.freedesktop.org/f4504b830225a8fdb7407572d92b65daf390ac8a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 2026-02-04 at 15:28 -0300, Daniel Almeida wrote:
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> What about this?
>=20
> =09/**
> =09 * @registered:
> =09 *
> =09 * Internally used by drm_dev_register() and
> drm_connector_register().
> =09 */
> =09bool registered;
>=20
> Can=E2=80=99t we use this in lieu of this flag you=E2=80=99ve added?

No we couldn't unfortunately. As I said before: a lot of KMS setup has
to happen prior to registration, and most of those callbacks
(atomic_check, atomic_commit, etc.) can both happen before registration
and after. And that's a lot more difficult to deal with if we don't
have access to the private driver data for any of those callbacks.

So - it really does truly need to be tracked separately.
>=20
> > +

