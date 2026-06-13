Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FFFCD8CA8
	for <nouveau@archiver.kernel.org>; Sat, 13 Jun 2026 08:34:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40C2E10ED60;
	Sat, 13 Jun 2026 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j89MsDT7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 55BC146AD8;
	Sat, 13 Jun 2026 08:20:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781338819;
 b=P9zfMmQhOstYPpgWf77JDnO3W3UPYrPzemFMATDEyMK0QNeZfYoc4kr7CrrdRy1sdE/dc
 BBkQ/M+Fym6A9QVowituYYw1GwJXhMESUAo3vcBk9vzSCT/nB8fjuhnV/lQotiYuk7tOeU7
 vI2v2NDRgEQzv9th+8LTUyJ9UWuVMK6CGnanw8tTgyRHmf+s74O+0v6KuDzw6Z1D8KOo+q4
 jOiC+2daOpFHZPgPYQVlS1O6qHhzgEZE/j+9nICA+OyFOluGmsje5OBJcpOUl2oEQgNjShQ
 tqVRfq3LHgvp3/4k9/X6yBKCxUL/Qqzv4MNnbenIRlqBwRm/E4S0pfIbC97Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781338819; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
 b=Qnbd0H8hCSctHdvEW5+Rhp+ofoqvZU++X/olvDkPZTRMbXZ0Fya3ozjMYigpeKzpcINMy
 5x2f7/dim3PjmcZembzIp/uuR/vmzB3Qjb+Zvvttm45h6K81NHXMLAoqLk8l/NSNjVCdrAb
 bdcumaubaFgFHWivfc0H1Bpu8tqo+LHn6bxID51O0GRwMJRbE1+YFIgDm3T0LKMVoaMg1w8
 JKgWD32kcqFiGH4R1NwF6gbhr6sFi3tqsMYsUKUT1P+1ZuIPIuQqLGF1BkXU+c8TkIC2dh+
 KK9yumgcRdVT1FJYHsREhqr7Y6+AQOvqnMBuL32OjyHhG9v9SDVp+0yFLaDA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 440034045A
	for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2026 08:20:17 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 021BC10ED4E
	for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2026 08:34:20 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-304d3d3d8f8so222142eec.2
        for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2026 01:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339660; cv=none;
        d=google.com; s=arc-20240605;
        b=O7w4uupt/JG7PUfUOSKJBk0umxbaeqLHZ3yaCQ6pDAZik6/P7GMa9wiCQ01B29Jn3J
         Jfz9WmT/mqrhAX4YIStRGLUXaU/HS2XupULZw4XpL2LxWZSzpDIgcQjSlBMwyD2PglOV
         tzno9GkZjlrccIVYwQCFBZCP3SojKK3RHX1eZgitWecUkHbwjWWc9o/j2JNhb6YkY3iJ
         JAICTW91qwd6VlTRN4jTMXIjmBU5HJvup4se8QDTAceWr6R5fEgEJc1OkNA3SAEuN+0H
         ox7GaKLu83cyIKBTKT6o4hpc7ZuyW6GSY6qqzTYvOesyaz6dvgSKHdz5lQ/qh8fvubft
         KmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        fh=FSogigYPKIobaS20Fy4R+pBvbrtp7D9bP+2lfpRVjF4=;
        b=aJEm+a2Q6odX3D0qTQgzns3k0EnSiaKoPNlAbYmJGuNEJ2S/A1BTCHbXG9Gu9tdLbC
         fSiIe8fMuvkDiFRfULdg+lvBiCXymH5kzxpy8CI6WOUWtOZm9r30SKJatc534MaN2PpS
         wuWTlC2fudugoJFVb/y2F2g8uGTFwOvd1Inmia8pTKDalxcmUFHwTdLfLR0OoChb9ed6
         coiW5udg7ntlSnmWzdUd8fiV34193mAhGP0WiMRsPlJDTZiPrdajZmqSZIdXFGko4r19
         b2pl1Q7pSStkmvIa1wiq4a2YjPYAu5x5OvBFvK4qsl0M9pfMf/5OEAuT/DY5DKWYhk4+
         +oDw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339660; x=1781944460;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=j89MsDT7ogGde8OZoEKF3/0i4+Xw5mItit1sSLBao/zkanb58lMv2yC5hz1Fnjqavb
         Rt08qSrR2md73CjB/cSdm1YGbKfEiv3ZS7vkGEcDdyTnhUAxEl4vCJI8pSc3kOIfqCXw
         eHkdbWYEHoBb4NwP9V/3lnDYat5nTU+rga1Sv8jtNTL7It77VDn1BmYiu9ykhMu260lq
         uuC3sWyQpNV3+KEMByCLFGPPPrvpZ5PfkeXQy9XXYVNZDkKWeWOqPv0xdHfF7zpU0xTh
         0YHamFYOVxFKwlMl3xqjTTSD2iEL4sMBZi83FFxILQp0CnvIeh0UReL7t509mjHU/R+A
         jNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339660; x=1781944460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=DFxzEkSggYGyN4nxWZJYa/veR9nAEtuiZTlpbIVrhB4iG5zw5zkGdRmpskrbvB+S/B
         LKv+dz3Px9aAqUBF1fALd8b0zBNIHsKLVTmxiQRqXSsYmxEiue14n6WiaMYkaxwc/4A2
         Hf9y7GalCWEZdedY7WrJ5KQXwx5fAjrKGjHT76/ZpVGetKCBove4B+s7yK0NCacXTB6o
         rMX8+/88rHPsl1cEeD73QlRalZbss+X2Iqsvj84tKL2EThhGLR5FkkL/xJLxQgyDMVkI
         VVuoaM9lGceurqoik4cscynf/phNwwpr8VB46+TkI73LGqKmBVGwBrHLp4rNYR1q3OGm
         81dA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8/gOkOPHW+wetK1N0q4QhFG7FdEoqh20U0Y0NWJuYdX9pqjMiwweqijWF+NS8yMKq2ZTFcRIFP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZby6gq49TVQI9hrQPiMsLQf5DIezZKq9zxdOJAKNWDW52cGEi
	/OeghzX+3qpQZYl1O6yMvbJny1mIZ+jmmQS+laVuLVth0j0iXYt8Mrl0jf8KuJd6dwQWbZjLzkQ
	4D/E1DxmRsKGMA7l0P5GMcrZ8ictIbpo=
X-Gm-Gg: Acq92OHiyXGVKodDg2ixLdn1Bu7B68waEFm0FW9gxuac200gWM2/bSKaU5wwERrKX2N
	S0otzs0WQta63XaFjezGfLqKkowLmGER062Xl2aAxb41njYsHHQqyIjmNOeXTer71inguSEUfn7
	+sbhec2p6JePdwd7Lf/cyj7x8mCZeMNTbbbi1SiOupcRL6Id9IylEF/IDpLCSZTo4qtYT1QHmyo
	9K0t6DcpCMN2cwg8Z9kQTa1abMNC3I6sqXaKP70+Z5lScVtsTEbapqArybvrq1a9o3E8fM7bsGs
	65xVgvnOTwQ5mqOMHdmfSTfxU621PYB5CWnQUKU0KL2+F0PpdyCSf8gjVj0oGv58IpZL/4Itu3C
	cLmWxfJb+96a82Tqe5P3Tvq4=
X-Received: by 2002:a05:7300:641a:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3081ff5f11fmr1542136eec.2.1781339660064; Sat, 13 Jun 2026
 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net>
 <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
In-Reply-To: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:34:06 +0200
X-Gm-Features: AVVi8Cc-0p_Glp23G0kVyr_DFh7-Z-_yXR6xtOVae_M3Gc4DHlyl43G8aBfq8YI
Message-ID: 
 <CANiq72mffbi2BV9epfZtN1qmjM28B6qUp-5tNGj=VBTimL-nYA@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: D7HBARLOMMTCRSO65ADMAPEOMFQYBIPA
X-Message-ID-Hash: D7HBARLOMMTCRSO65ADMAPEOMFQYBIPA
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D7HBARLOMMTCRSO65ADMAPEOMFQYBIPA/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mffbi2BV9epfZtN1qmjM28B6qUp-5tNGj=VBTimL-nYA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jun 12, 2026 at 10:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> As far as I'm concerned there's no need to do that for things that are no=
t
> rendered anyway. But also feel free to do it anyway of course.

It is not a huge deal if there are gaps here or there, but we use
Markdown in comments too for consistency.

What we don't do is intra-doc links there -- it would have been nice
if `rustdoc` could use those in comments for the source view, but it
doesn't, and while I talked with upstream about it, it isn't likely it
will happen soon if at all...

Cheers,
Miguel
