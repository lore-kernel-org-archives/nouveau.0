Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9B606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjtWr9eW
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C923110F2E8;
	Tue, 24 Nov 2026 01:54:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9BD28403B8;
	Tue, 24 Nov 2026 01:54:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795485243;
 b=Jg0yoPaSeA/OsQFlA6I2oi77AP9O3NWupwDK4czkACpiM+kFQBRWWKdcq4aWOXXkHPMHR
 jjZHd+FLvTSO1pUkz7Hz+d8FspaB2Fdq8uQ5pc/VK1fRfISI0M7mMeTjR+jFfv8UOAKbfxp
 FrDSo1FANN9m6GdpOaxTsuJzwhM8IPaqtfNeu+PLEX9z5CQA3w4oNIffESfNk0cNq3DwBRe
 yzk9P9B7yNxtCbGfTzlymZchh//Zcm66KFgS0nTKIwy0jcH9dmT8zBJi3iKW83me7eNlXj8
 yfMK9mmX8wPmaSnZbAP4j8AcgUPjmxoEoFqYNhf5C+3UW57UTvIRFqMHrayw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795485243; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
 b=bO4GOxt/DRKujHScJRFZT1qekW5BAc7XaWZ5XDY1Gr6y1rDgnYeDD9yln5JhSplfFu8OK
 dG2mpc1pHilIFO1NLhU/bX98G0juTo1Xx4D488NB6dTL4sgcFI6XjzYKynFzkIjM+sy0GKZ
 dJUNysjxCfnJkf8d3yBy1kjwxcrqciNscfPdOjABijYF2baF023w2djTncTxqd3Afn7AUW7
 0WCqVgR1W8jQXhZtbHsYiGOlSxVX/z0BeDkAJzxSJMZnntOWW12TULqxxfMxI1pqE4wCtjf
 cKxJ2GNkdh0lzcD4GcGegnkfTPkzLQfNMf6m2RFJa8EtQTkJHrqIw3bbmO9w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CDC7340264
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 01:54:00 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA63510ED1C
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 01:53:55 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-92123f02faeso41482926d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Nov 2026 17:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795485235; cv=none;
        d=google.com; s=arc-20260327;
        b=X0/IZosqxzrkYuuZxpYSxTJqRpqko7NNY0nKm9nVks2Cj21WjrBLJElIO33wOeMES/
         mqbYK+JsvlD30saDjFDapVnYqOatNaNd8pNe5u8W3jO6KwWUo76E9gvWwML+FoqjHF/U
         oDSRdflKWiZCZAp2iI5V8yX6zVsPKmkqoWj1evVtc8sEXjPjDOadMICgvGZdL8ezoHSX
         Sk7i7P4wtLULGmCO6zLdz80+aiReQg+a0AE9Hl6cerZ7DWAd9uGhNUnloENFFttvhwKQ
         jXTr/u8Wx7hWU7CcFNA52ReAb/jIH2+CjriAZxZvNqhrJfUq+wEuSzFjf5UP03V5pDUk
         HbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        fh=AUhxdm2b17CfxAaYQsUQXm3y5OBUBHwAUk4x50SriOY=;
        b=bNcZfZU29LKfopGEhWkIbRao6Faopb2uGoENJ09PW/OFsWbofA7A9GDMeZ8rVleRAo
         qqFsfdWjZv2doIeZ5OaXUcc2uXIUAp9w/X1uigIsFVilbF3zUyzK3ooHxuiHnIH3HrBr
         cCOla3lDbEeEMb0rcbPWI2AvuD2hE4JcADvhsMpA5mdhXlq3FCIlD9Wyx7HIO9rX1A9n
         EpRWdIHXZjvx2GZK7W3fivqz0atMjk/clStS9jlUlDfnaXQTtDZl/omRQkBoHPoUdmev
         XZ6atPTsrALVU3Of1nnO2UyVpM6J4R+aWZqmBOC7CqVZjUhVXi1bQbMLpcgCwjISLHAg
         y1kQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485235; x=1796090035;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        b=PjtWr9eWB0ttFaPALTbT55U0MMM2ewHbPJ8PjKWwQ0Mh1JMuhhphen8TKqfSeCWere
         dvdwgQLPBvWxE2GcX3YIsNR5L8P/Pr7cdCkCKCRSxoeAKKs0W7d4ZNbEuPPlNIZYDhvw
         mBOHFnl2mb6c16zT5ajMzBIi+XFUSEOhXVEkYrHEmX9WNNCASmve/R1IMHDyuyskzQvs
         OUEO9OqK1U+t0gOT2YFXJ7JahfcFmu9AyqtCq2kP7GefY3Bg2QFATuI7L7rc2DQs5o5x
         +iIztq1Qog4K3ZRe5KY90YfXjvhX6WzV29SPN1S9RyGsp52TnU/PheGFpQDmz5lsKZbj
         TsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485235; x=1796090035;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        b=i/p+s7P8Zzkpc0TdlUivBOPs0oGl+3NL+/YVx3MCEZdqVHBS9NoYDxWz1Az7vNKb5T
         i8Nk4EU2lhsbrhPy423IBA9EYDiSVqJ6n9UqqZRxDVKtIOw1RZldhy0+o5cFIXBprbhO
         xfjGIv7oT5rx2+nyJrEan+VLl9H4cYcn+Pev4WA0HHOud7MjCgde5EBi2LzaP5V9gw7E
         DU9BFqhhIKoyQHB2HifqrT4Y8qyT46/EFQZiDOsfhN8ilLOkFkNwcYHD+Z3TjtV6dLV8
         Brp1sdN02UhDcZ8xCSipi5zU2bMaCPQAlFZYHOEz1ugcFRgp2/WxQvkVgkjGeXrEZYko
         E/LA==
X-Forwarded-Encrypted: i=1;
 AL+hErGruEXQeQlgZzgcg7wlIjwML9RMAEGzcsqqtgMfrahLll9F1bfCiGJ+cBvVBYYoC3wA/WnGD14E@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Lcvl4JA9eO+k+vGqZ+uyyKLI2ASlUps8yTyBCFuQOECkDqu9I
	rV1sgOL8rgcmJapT3JiSrxQeN44DnL1msfhmTh0175OwJ47oR8S+p7/iuMoV6u1ezxi9gHp5D0d
	rVCh0mpD6mo9wwwnpj34C41wwT56cdEM=
X-Gm-Gg: AZFdTZdXMmzkzafrJ+UwjZOiFBHBnbZrTyqYn1DNgGirRAutKaGyJTu4GQJGyzlCIg4
	FO6Nq32uANKjl0QWHp+qBab0bGKz35dS22c+mDclFYHt09meAckCJPH753CnML0765Jh2vZ/dQt
	ZfIkEol/mRriRsHIT1y/ao5C2tuf+MC5eIJC9H27WYlxgJGw1I6Job0A3e+opz36lXZ1/mDxyxj
	K2a23yxkCKgpt+x5sBn+Owz9ZJEJPLoJCbHhiYUm2aHYtfvTiMtAEQs5EeItKLCt2Ct+3UfbZJv
	uMYkatxpfS/w7snpDtVNgJjv7Ym/D/fxofmpNqhMDKxmUOHlMLH8lKkQ+7ff4bOLBbTSd889sDT
	/6I6bpyXpcWZqUeI50RvCzneK8dFBOQV8CilTSHRfnYPYvjeAH8d+M7eVeDnqMC/QI+xHUFy+BC
	4sxe7qPWkzM5qoJ2EexcDo9w==
X-Received: by 2002:a05:6214:496:b0:921:425e:ce17 with SMTP id
 6a1803df08f44-921425ece58mr177583616d6.53.1795485234693; Mon, 23 Nov 2026
 17:53:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
 <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
 <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
In-Reply-To: <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Nov 2026 11:53:43 +1000
X-Gm-Features: Aa3M54oEI4QoCcO0MeXwp_iIffckWQaTxkpH1_V4RY3XhRFR0hSACFK4S3mzVE0
Message-ID: 
 <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: CUBX6S3XKKICS66L4RXCVRN2YWT3S7B4
X-Message-ID-Hash: CUBX6S3XKKICS66L4RXCVRN2YWT3S7B4
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>,
 airlied@redhat.com, Alexandre Courbot <acourbot@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CUBX6S3XKKICS66L4RXCVRN2YWT3S7B4/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 02:54, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Mon Nov 23, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
> > On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
> >> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
> >>        logs its failure and lets the probe continue.
> >>
> >>        If unsure, say N.
> >> +
> >> +config NOVA_CORE_BIND_GSP
> >> +    bool "Make nova-core the default driver for GSP-capable GPUs"
> >> +    depends on NOVA_CORE
> >> +    default n
> >> +    help
> >> +      Make nova-core bind to all NVIDIA GPUs it supports by default.
> >> +
> >> +      By default nova-core does not bind to any GPU and leaves NVIDIA
> >> +      GPUs to other drivers, such as nouveau. Say Y here, or boot with
> >> +      nova-core.bind_gsp=1, to make nova-core claim NVIDIA GPUs
> >> +      instead.
> >> +
> >> +      nova-core is work in progress and may not be functional, so this
> >> +      is intended for nova developers and testers only. When enabled,
> >> +      nouveau must not bind to the same (GSP-capable) GPUs, i.e.
> >> +      CONFIG_DRM_NOUVEAU_BIND_GSP=N or nouveau.bind_gsp=0 is required.
> >> +      Otherwise both drivers compete for the same devices and
> >> +      whichever is loaded first wins.
> >
> > I think this is a bit unsatisfying, for the Kconfig at least it would be nice to
> > avoid the possibility of being able to configure
> >
> >       - NOVA_CORE_BIND_GSP=y && DRM_NOUVEAU_BIND_GSP=y
> >
> >       - NOVA_CORE_BIND_GSP=n && DRM_NOUVEAU_BIND_GSP=n
> >
> > since I wouldn't consider them valid combinations of Kconfig options.

While I like the idea, expressing this sort of thing in Kconfig seems
to never end well, I'd prefer to just keep them separate until we can
figure out scenarios where it's screwed up.

I'll think about it a bit more, but I'd rather not encode too much
complexity here for fear of one or two people screwing it up and not
reading dmesg.

Dave.
