Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F9606A31E
	for <nouveau@archiver.kernel.org>; Wed, 25 Nov 2026 04:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darkrefraction-com.20260707.gappssmtp.com header.i=@darkrefraction-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MiM5ytXV
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C21CD10E777;
	Wed, 25 Nov 2026 04:44:40 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A106D403CE;
	Wed, 25 Nov 2026 04:44:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795581875;
 b=j5QArUSu+lENKCq+BMQWwb91i9VLvVV1SPx1ib01qvAQSwacgRQm5F3gBWMt69KKzAL5V
 9qEkqV0urp1AxEFNRHKMLg+3Zbn0D9A5l8zbCrvh+o5stiENzxe2d5NlqcEZ2HL17Yl0yID
 kD6r3T1kOEtC/KzM6N4qk2EPvZO23TTCyPjKL0//Lz1yovsghkAoT6ajymLhf1Q+zO9WYx3
 I5DbNOAjdBP52f8oWMIybFJGq9zNM5/oKm1nT9Jv6l1MR5TN2eDH3/zMHNQPHPy26V7/wRQ
 NxUlm3l/WMwK6XlZ1jAzPfAe4DSFB75x1sjOCglHfYfVjQvzmkzH1utA7L8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795581875; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
 b=MzduAsuzNRWxmOaego+L8HZIAhtA/sinYtytNazIXHdGawvQjloF8zRzL7gGl+pvgX7mH
 dCk1daYXuhk5tgaZLxbclE5a20Ot3fiajJjOxpS0zV6jWnV4Q1ei/5ybYF3IGjQWi4n7QJn
 b/HzC2qDvQzDihTRNXq3IWJWwLLJ8D86u+owUnux0x1ZXe9alsMkWPE4+lbDZ5/BMsRD7X3
 lW8f0X8NDfULMAfuN2xczY3GYVJ3gybrVrtjh5I6FiaNnJgZLtvBaNkNreF6zSXg0WheFTO
 jNNQQEMVnbUcch6L6xGzWfxRcPDAncstmNR63GkxjG/be8Z7iH86JhIX8o1Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20260707.gappssmtp.com;
 arc=pass;
 dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20260707.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C0B7040384
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 04:44:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B0AB310E139
	for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2026 04:44:27 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6b87408c797so7218103a12.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Nov 2026 20:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795581866; cv=none;
        d=google.com; s=arc-20260327;
        b=lXgaKu+1gmmhkkzdu912Uoxs8q9qm1OBsRYO1wVkYcH/K5kCwIEIM3QvAccYQVpsyo
         KQ1XAI7B9DJvg/krbfRqrkMp5n2KDRh35fhFFIkbIDCAAjvLxhQJOANIoR6wXp0yPqXB
         OL2A5Fag3E7vll7ZDv5ePoXSG3kLC+T1zS/dRrspORAp0PoQxhfcB7YFye9XqJg3cBis
         JU3cyISEAVDK1J7ctlYIs+x/iomWzbQLeh5K7AYtucizeI78lwD8zTVVpNJC47IoV8HF
         8fz8/BD6RR5D4VVKtfl031KrQd3IDmoooPeA7wXrKlA6h0/VLOiE0BM6NqZLFgYYu2Vc
         SMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        fh=d6KG1qaE9fll52RilxN8GeeiHGnzOJdIViw0UR4wJBY=;
        b=HgzcVL3NG7YdHb5KsMpLS/gJrkuL9genyLbmXpOpdd5PKDPPx2e2QTRZhOLEx+X9+B
         PwrcT2O5C7w9+v/CxZv0XAE0G0ayXG8xgJ0wyfbceyG+jVkeqntFs5DFfY1Nk411NnnF
         isKeVuzNIAcWgCeB0gIeTZtAgsGxKbVDAZwmgpzCmRC1DTNbOkW5TeO/PVTgT3qj12ji
         RhNnNNCfEV3gO+a3AyNsTxcfd9cvCCDkKKwF5HOF91LAkTkfls4vU8yqnitj665F2nVO
         H9oPa3m2n5b1oQhVBQQgyTsCXNB2AFhs3LkW/nXOouXjExnE6SMQpMtbo/lsPSEfV1e2
         ogKg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20260707.gappssmtp.com; s=20260707; t=1795581866;
 x=1796186666; darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        b=MiM5ytXVVAj7u7B4hdIkPSRWBJbeTP8o6Mggq6+GnXnF9M4HZg9+9yCFNWxj8Fy+V2
         di9i6IXNd5s6d2VZN6IQ3QmCzNAEwqQpN7blkCV4qtMZlzGpBs1t+8r/IlAsCbhFhCyh
         826+ZnI1UZ2bUQwhEhkMCDstmtx4JLf3UufCogto/6nOnnVHGBGvVJn/eVuuWWKO7HDl
         61Zt+v3yd7YLQec4IL399IdWtsb+5H5AEtQOs42EINrNVc79LocW6s0VWO301OoJJgj5
         tW5PLW2sVOC+pVL4pyzk5wK9SJDhZoyIhP4JJMNy+2BLfC/jhKnlu6gP83ZMmxXjsFxN
         P09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581866; x=1796186666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        b=HXvZntNDVTF5aADGoSkR24ZbYDBhK+EAh7jJx80MOned3jw4aDh9NP/J4i1iMpcSrN
         i3sW/4APJ6dapsagD/ZIXM2ObxpMm80NbHgGcp/hqoFjHO09HGvLS4mzs52tII37IOQZ
         syBWX1RmiUvtTX4I26FC6QWkdfvgKPrhkjCi7I9p10yohsbVcjILmlH48QzkHMN+OPBt
         DSnImzhqfkYJ5dkj7HZb+tsanHMo+l7qe5yvA9jhF33BUPyVkz5+o3NJOhxnQwzQSzt4
         3lW/BfODsM/o6bdDMQF7lyuFNiJJYOyUz8qscPrhxnINZ4FwtqclTR0h4tfZgIDA+INL
         79oA==
X-Forwarded-Encrypted: i=1;
 AL+hErGo4dYWZphGo+xZ9cB8tFhrHaF8nT26h3Tuo2GbV46XX+nmy1inakpD1eqAlmwvwxAN+e7PXzmz@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/bAFWdZR5dawhevCb7iacHkyyMI3WQsp/j6SzqPLrGoOYPwDph
	oFdqYFQjzrbEbFHj7GbqTDqb0paWJ140r6jZl8fbYqeDWZ1LY4e6Y/zrb0dmTv0cPp/oBPQlMre
	VlFxoXcDaOnOzc5aUstLSGMdeVxrHbTBmfArlcjzADA==
X-Gm-Gg: AZFdTZdBLnqVyreJZUx7wwCviQe730Cmzk3iL8GKfJIPYpd8clzxA1kMpdm4Pp0ngtO
	9yRwKV1XN4JYjAkSQ2WktlVyF06vHThf9fMM40hdYNE+IxOFWhIG3voN2MoBNLo7Ep43L8hiXfL
	mP7ZKWtROmLmf/fPXp4S7tho1+JtWId0xJIjUctxopHWl2CAqJbJ2wCe8VgJrVVB29m2kKHvtSI
	avHeJ12EOQnl6IYKdRJycD6h5KqMCyAMiTR12knwRnKcmDy9tRhuUtLQemPei+D9WR7nqVYvxx8
	Rv4J6ZsoEV3c5XXSSy+BnPkkDdHmW3W6RA8pCZAcvE6+HA+gceEJfeR81XYqnxtDN2AlXbTrkyy
	2tM2C3+uQ5qmuwAuW+5/jJn6/OXKit8lX0WSHwTxMKNMbiWZ3C0PqIBw0h9UVdh8Q74I=
X-Received: by 2002:a05:6402:e8a:b0:6ba:dd2:7660 with SMTP id
 4fb4d7f45d1cf-6ba37ea54e2mr12212519a12.32.1795581865793; Tue, 24 Nov 2026
 20:44:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 24 Nov 2026 23:43:59 -0500
X-Gm-Features: Aa3M54oS8z1bbZenOaASI7fGSdwFLpJbJd4Pid-wIEEd4ioU315GAzjwqnmrfoA
Message-ID: 
 <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
To: airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UJOZVSIYRT6MFYNYH7M6AJXWOJFM3QC2
X-Message-ID-Hash: UJOZVSIYRT6MFYNYH7M6AJXWOJFM3QC2
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UJOZVSIYRT6MFYNYH7M6AJXWOJFM3QC2/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 12:50=E2=80=AFAM Dave Airlie via B4 Relay
<devnull+airlied.redhat.com@kernel.org> wrote:
> +config DRM_NOUVEAU_BIND_GSP
> +       bool "Make nouveau the default driver for GSP-capable GPUs"
> +       depends on DRM_NOUVEAU
> +       default y
> +       help
> +         Make nouveau bind to all NVIDIA GPUs by default, as it always
> +         has.
> +
> +         If another NVIDIA driver, such as nova-core, should claim the
> +         GSP-capable (Turing and later) GPUs instead, say N here; nouvea=
u
> +         then leaves those GPUs alone and continues to bind to pre-Turin=
g
> +         GPUs itself. nouveau can also be prevented from binding to
> +         GSP-capable GPUs at boot with nouveau.bind_gsp=3D0 on the kerne=
l
> +         command line.
> +
> +         If unsure, say Y.

Maybe the documentation should make this option sound a little
scarier? Right now all this does is break nouveau (unless you're a
nova developer),. We really don't want users or distros turning it on.
