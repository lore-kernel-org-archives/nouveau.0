Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D40BCD8C88
	for <nouveau@archiver.kernel.org>; Sun,  7 Jun 2026 11:30:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8154A10EA08;
	Sun,  7 Jun 2026 11:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFlpjZBw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A5E2B4681F;
	Sun,  7 Jun 2026 11:16:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780831009;
 b=o2VE10g7noXd0F5vhi2KcKQF1VWj4edh+DbciTcUs8g2XHpcDiRoZvlQlsLGD4n5naoKK
 KIHfVZf+DtmKTgYKrLaMxZ1H5TVFlV2aIu9YRv85Qaps9tlrTYg/Grgxhm0lJrIrf75SaYD
 zWN1gA51i3WOPNfD8BQerFcd8wet6XslHH1Z+LrAkV23JU7MHy+TB73TTw+Q3fxmDM4byKH
 mLh89KTXjO2Hwiu+liZ7ReDLm3o1DxZ7nXtxSu7lQv1jN6wGE1OnrClKM1IYeDaoMoV/wkx
 +Tbtw/ilks3AvDfBo6ehHkckHBujYVloByUbmc61V+SKhZN2sqhACnix4paQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780831009; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
 b=SMJ2UMf1iiFq8o4i6WuFzZbeCZVE6EicHjzjWk1DuWhxjgh5L/z70jkmQRPlz574wUiQ5
 ejkAN8JXzJJ7+0ttgCFlK4YejkI7YgGHiHWPLyWZtqFIk8Jli1gKL8ZuYanmEAhNWmIQYd6
 hzJVS6C22In3wK+awRJzp2/MuV870psv93NrD5I3O2xDPf05+NyruOWIINHsx2J+voo7wxk
 wSRcGL3a8G0npNhvYpf4Aw18VnJi5tvCr3PcBCAAq9T1w8T+vBQONfgaTAanJi+1WCzCNRo
 webhqZSj5FzkcZkvgG6fdK6up2KDiFhofleK1ObuXBd/985oBdZ51HYBzAxQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3A3C842912
	for <nouveau@lists.freedesktop.org>; Sun,  7 Jun 2026 11:16:46 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF0F810EA04
	for <nouveau@lists.freedesktop.org>; Sun,  7 Jun 2026 11:30:36 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-304eb0fc233so273745eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 07 Jun 2026 04:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780831836; cv=none;
        d=google.com; s=arc-20240605;
        b=Qu3qCvZ+cL6xpZ5Hxdk5sNlUTpfzAtlbYNPmRp/iPNJUbSyeBmluXirVek3GMco7PA
         jMAJd1OGhnhL0zOcKpi9s1pWRTSIevuDO4KRzYgVCusg4Rzyq0sPjgVlAyqRsYAHhohA
         ifw5aVOYdKLrkL5ZOf/oEvUkVNp085QmThfoHdVPVLWGkrO3hcYCIyKipd6Kyju9viTd
         PYjXer/BvkZU3lNZrz+0DT2RgVR5chYJ2Z+/BuHRuSgn37mwzxzonawCSkxC7inUwFXL
         k8wttpxTtW5EPhwY7YQdGbZELPwXPKimORLSnLFiPXhSRWhMQVghIHRQUUEn+ngy++v4
         +Fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        fh=muCPLw15D834j6keo+dwoR2RcizuvLbs+lATgXdLciw=;
        b=XnxmTMbO+PSRrgowYdfihOWG+azZKEUQw8rBF1VIceNbReY1sD1yqYJFdKCw0ZMIDs
         Kr7HVeoRqzVWaBaKwzH6spNA7oTOfll7lvB9abGLX9PBhC/IKM8goZn/k4y8ngcLRFdv
         nRd9hZCR8j3VjDeeFbhGSsE1ehkWzSE75/4WQsNqZ3mTxIG6kILBAF711ZJH9VnMhdaJ
         +1sD2unqSubq0Hb2gdgECIl4dfMERneaf67sgD0G1VVpyNL1yurLJXcF4j6uLxglP4p1
         Mk+rSwb6DehIzf0tcJ7eGQ6fMzLFdUnBiAsF++dtKzYVFBBofdjVdMucuq6eJJOqgCHc
         QHoA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831836; x=1781436636;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=HFlpjZBw+LOuUjkBNakhpu3NxLGY4quUpInLKDB3Gyv1r5PWCebx9VrFjubtn9HaCU
         qpBFZJJ3ZBAqbMM+lQMrzbMGbQRMg32FtAolL0IBuFnRSSPl69CD91vn/43p+pLw89p9
         s7iqrv15ZdD8QWcvQl1myrs7M44Ck/Lw8pRwKfu9E0pS4oZ2wy+i1IAyqF8znX+q+kPi
         z7koqDtNI0wBXgl/ePvOkmfC29U0q3KaDciV7OqPFU6ra7LawfIkdSJb9qRUrym3bJxl
         GnTKZDLtSNXkgmjPehDMibStoGemigH5rX6UVppaW9fnPpdEo7AbUymR7gkDRlX7H8FH
         j91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831836; x=1781436636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=bnT5notr7im1Or60Om/InEpd4ww5ewKfZgITeltcQZc1T/1BGKgPoIMUxRviQMphHe
         vAfxgRvDQ/BQ1jJElGgYPzDEtXEytUa6e46g6F79RKR8NEp9GvsELK9PTfxVAPOf3PY3
         1C74qdXBBehPkouAOdRrpComm8VHhCG7/aH8NtxDSOx00XETjLbifb85ZHQjTdZTW+qX
         s8VhX+Y5Wo8PZBZ+fX38lToFh8XJDQ3lH6moCNtkTU2nCpCW4TQdOo7+a5m5QlbJwwQD
         GuREWeJ3gpx7AL05g8hZP25trw+TYVCo0ZZl4TqUs1gSUbRc2W89E6akQK2dDIJOWBYI
         px9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ88XH7hDWMgY/rJobpcboD+h8Y4YwZ38Al6IctRPTUFyc9s+z2bJKGMpP8T3tzMqDjUcapYjfSa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBccEI7EZgcn/CSfKImLxd8O0vIXkbRFjQh9LgUywxsdMrSXVC
	hQBUVg9XZkiVzDu9KDz3QmwV2Iwcx+48SBujaiR7g+5o5ZDwUTiVnijD1YbyUn7x0hSOMLqHvUR
	rashVPWVNX+edb7iNcDDTHyVDYgRuyqg=
X-Gm-Gg: Acq92OFIy6JH7PB4ycou8eTHwmOlBhk3OHlckQK5Ln85MDDJKAWm/yCCCHp2nByxDw3
	YJo6w+ve8VzRXB8wrELTjV6qOpQz0zegBed/z0Wq9y2dpvAcGj/FCbDFOR7HSjtp/YvvVjWTfLi
	P2ZKUWW0mi9ZcquMC/6F30eiCHccw7lbyyJOogkjriZfss3nWL39mkFy8uGgcdsMcg4CzfuBvtj
	dXHq0mVGKwMxIiEeZaxSVr4hCqOBJchZp5LwiVWHGCrZiijXDkEUD4ndSavJrzxVmbUs8q6kdNc
	vONauMZ691H3HL5h0YaLqOsamgZCerq19Rs8u3OM9Wx6mK/Yjao5FT8yyI3YX53vU3Umyt0cQ+m
	jCQDsC/LKc2kxbBCDrwJPxkJuzC3zktZPEw==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr2921241eec.2.1780831835929; Sun, 07 Jun 2026
 04:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com>
 <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
In-Reply-To: <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 13:30:23 +0200
X-Gm-Features: AVVi8CdeC5gDKTC7duruJvRpgjli4FYxW2S1H8-VJsB3l-jVir5nc-87EthTwdQ
Message-ID: 
 <CANiq72==HqQnNdemJOrDwP6dCzz1KBs977MmgjLbssDstAG-Sg@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4H5O2LW5OKUV3ACTM2FQFN6KHA5OJQPN
X-Message-ID-Hash: 4H5O2LW5OKUV3ACTM2FQFN6KHA5OJQPN
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4H5O2LW5OKUV3ACTM2FQFN6KHA5OJQPN/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72==HqQnNdemJOrDwP6dCzz1KBs977MmgjLbssDstAG-Sg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Jun 7, 2026 at 4:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is fixed by [1]. Maybe we should merge that one patch separately
> and before the rest? I seem to be seeing these long symbol problems more
> often recently.
>
> [1] https://lore.kernel.org/all/20260605-nova-exports-v4-1-e948c287407c@n=
vidia.com/

I can take that one via `rust-next` unless someone shouts -- Ack's apprecia=
ted.

Cheers,
Miguel
