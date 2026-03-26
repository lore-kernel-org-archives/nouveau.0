Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8760810A88FD
	for <nouveau@archiver.kernel.org>; Thu, 26 Mar 2026 18:18:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65EF110E287;
	Thu, 26 Mar 2026 18:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Og5bnVNN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 74FD945327;
	Thu, 26 Mar 2026 18:06:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774548417;
 b=k5bIxzAma8PgJW4re3WlB816A+58S/EloI32kaNECpuBPqKIMAizDRgK0Rp8yyyd/g49L
 JcSHyYHkSb4q2YmcFWush7wxyCNT6D/EVGQCuo1igLKkMmzu0mhpqIxOdbuzNMQnGjJ1hch
 ZxgD66X4rFsmd5P84PgtLabJLMp95ZqEKFfJAGErLLaXtz/XPHyld9BttdBupPoyVL1O+o7
 6uWHTuE208n+4Q5MKgB1sSxfiLERBIYdvD8Q3yy+ZxcqwG6+zsWwAy4Oh5YUXUD/OXPSzGn
 3zURCNn3gaIOpj7qdLl/hCiJ6RCBJea223gGHzhej/b44VJoUHiJmJHJhSAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774548417; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
 b=oXVuxeaPMBf0hAakil9SQCIaLCAUDT3QQHNqqZyeGnxxf7cMwstoY6nsql6GGOePpSZ/D
 RxEZPP5odr0ixg3LMFo0CNGwPRaRWcMayYqzeoJw4FI4G7ym8fGupRicHmni3liyRHAZF36
 PT/DUBYBS9EtaOrOU9Lh835ysHvNzXNHpUReG7re+SgSzhCiaPZ/hrffbNlWI+DWZSa+sfa
 YcbzooWI7HmHspI5or42LVEOks+lbNpqZDTxuyoLFFENogxE3HSzxV7W4fHykbW5Gp77JNH
 cPbnvJbbx8wZd6Zb4T7MTGhUYQnoFiBh79enS6RS2piIPB55f3xPRlq5RJfA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BF977452EF
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 18:06:54 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com
 [74.125.82.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4C210E277
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 18:18:04 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-12711867ca1so87983c88.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 26 Mar 2026 11:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774549083; cv=none;
        d=google.com; s=arc-20240605;
        b=dvt9b4OblI9uitiLvUnESny//eyt+MsQXxFmjMsRlN4Y52X2lg6iJXm3V++ReHRb5J
         0AqSTuBzoD/WD3asQfqrOTmmViKEvsBJhilUb0NOlIS6p0L7mkCNmWsZVJhMPlSnpbFd
         krWZlIKgvS7e9MspVr+X3Xmlt/9XylOAZ2EwKS6PJ3WrVuZSHY02WtdOFex1bg7Y2AgR
         zG1//h7GMtoIt6dr06vivTXiouZSmjWyM2FPLJ/TYVw57P8AlsGA2VeXmZJyVXS69fUn
         EagBfCedjpxA4mIDBhTew2rbfkaXY9o2T5NXCaL+dn5JLDcYjFf+nasQpp3x/8vKVH/E
         b1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        fh=ygLwcJYQ5Bio7PbCQT8FutwgXr9htG+U1F8T49jMuF0=;
        b=F/gXOk/fIersZCrfTqkg/qK+Bc6GUP4ac09wjae+QS1f5Tnfr5BVXjvbC3kfncS3wf
         sIqLUxd1bPLnGR9bbMJDpDofzG9GIUVSwY9sFx5TVM+UFKP42DqnQaGW33/XEfO9iVCp
         hvS5393ZraoJAnHeKhL+qHBr2S6vUN2cy5yzQgRdh40aXdWN/wKoGrMmXp2XPq7xCfgJ
         iigfKHGMxPoj3TAzqz80C2ImbwiuZ2aXlvSJZ+lN9l/XDQXT6pfj9DvYbrU/ce1i5927
         u9W55kbgVaUWivfaSPABf/5e1fV0k+nzYghiPVNYnqUDX3aPJTJ2J0s+WD8Tb5JOovm4
         GnTg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549083; x=1775153883;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=Og5bnVNNTDjTcHKQhWp2dTcfLlo4FrFCjBfUQeb/tCwmnQlu/d5bfNZuzeHMqirluT
         4k776ip9+VBVmNowkaeXUxdh46X9GLeSHscsb85ngWMz2HzHlVhoLto1pJ426yHfxQXa
         HP8KTXNdx6KLNmcyjAMEWVKS7q1kQ84QYzUSVdmYwm4uFEUY7XqHfb0iMr+Q+OUA/0Rg
         a+bA4bZkXS7dSfcfsIdcUcFdXDA//pYZSW1a+EfEBpf5WdCU+QnM5UnMke1bOYTLSFhb
         Mr2nW6Dq6/jBJvk8imLtyZlJ36ctp/PfHXaq+RzVX9+z0X1ajnKwe/FWcOt2fxEp5VWI
         ASuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549083; x=1775153883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=DyHpd1TW+ALG/pTUHjUlqO+ipAoxIl+KowltQEabJqA3nYYckZqFSbDPOivtfIpLvs
         p10fAOkTzgBoAAVPmbNgcj0+75umyypXXF1sT5UQZ7OTGzyurBuJg742YuGEsHmRGTgD
         SGXLPVC4Q+YqjIEt3FNONKdnWQ1Ur5a+5HK1E6ujyhNo5WUqfZzfCCiF2oV3BnHgiS7n
         pJEse1JrTdj3qXlqFrb521IBMIR4yWf9igKtRfZhJupErRmfGbDs4QdsujopKFK0KxLR
         AoQ9LGa9QsrGZvmN9ZTYhEWG4NJ5iZ10i74/ehVsq0SWRtrLbRX3zfCzvNhXPyJhO0ey
         KUDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+vl1AWaSol0CNLWD7TTB+g23R3yHEPqtTTrquEuw6gfNViaZz7tkx5rZ7luzAzZR1OVn5Bdrr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC6Ti/ykFMZ29DMu2GDGq9gIYAsY9sZLC1id7dgmuEe9jAWZRz
	o77TKwa+2luYawFSvFarAEnCQG2LomcG7ob7uZI0QLbEC7tj7jedGmMz9qGN1DY9vfS2rjoJaxW
	01bO57T8jHy+mIZA3UnsXxQ7jEnmFGcY=
X-Gm-Gg: ATEYQzw574I3e3HU+sZPibJWlC6554tv6TlkBTvVP5WHo6gG21oo4JrVRmYjhH1PncD
	yIw3zo6fXingM3GdCdDuTMDfrWTxUXj3U90ALxrv66P3AsPjlTG5bXJVfHWkzMiKeepFfZHlfDE
	4heSSyPl8HhNl/LTi0GhU5lyfOuPRrGy08cfCoJT6UxumQkZ3kyC50aNUrqRxUFds7pLERcJrb5
	in5vDtNwdPrUGCRlQMiMcOyuzhEWHbAlZ2Ixr4IXLrC4eJiPMyg82mvqao6z0mqizDKCSKKrzjG
	X4fKXo3aIcX/8lZwTF7I1kgriNsi6uhhpTRBAaBmIgz48eTxko/98O/h2HbBZtfYymaJNOnQU9j
	WBZJQYHUA2/JhFKm+w+y5d6c=
X-Received: by 2002:a05:7301:7214:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c15d3e42cbmr2323302eec.6.1774549083220; Thu, 26 Mar 2026
 11:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 19:17:51 +0100
X-Gm-Features: AQROBzDHC8l4cxhgXpM9E7qHhcmsh6Eh0VloN_3mY91VrE0Eq-6JGd81wVQv04g
Message-ID: 
 <CANiq72kqKGA7sqB6WnJxMiTLcRx5t=0xDJhzyq0LmSQVT+9WLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: J4DJTHOCH5KRZS43OIKEJKMUJYZZGF7U
X-Message-ID-Hash: J4DJTHOCH5KRZS43OIKEJKMUJYZZGF7U
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: acourbot@nvidia.com, aliceryhl@google.com, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/J4DJTHOCH5KRZS43OIKEJKMUJYZZGF7U/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kqKGA7sqB6WnJxMiTLcRx5t=0xDJhzyq0LmSQVT+9WLw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 25, 2026 at 1:39=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
