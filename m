Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E1B106ACDD
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 19:15:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3410EA92;
	Thu, 12 Mar 2026 19:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="homXtovm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2A981450DB;
	Thu, 12 Mar 2026 19:05:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773342312;
 b=I8Azws7xLttdcyyP2EM17iEWSQ4gbAXeLDnrrBf9Miim99RR5ZnN7bDwWAZ+2EDIhFrrZ
 KMz7m6deeiBmTyTZi6zNN9SC/IBBYI4VzSoWH4dr3Yk0P2QwmP/N3PJ9GA8Oy7ndOQjZCbc
 pRHZIlL2PP2vDBFKOgimyBZ/43uUQSywQ85IbF1JQB8TzWPVB+nJIy8qQNYPZ0l6xtKPJiN
 jnt5i1jaxDEyOJRB09BvsMExzx+EnGkbE71LRU2rkuubEjBZhTqwS58MlcloDmcCWDiUReh
 EpzSFQQPzqNtcPMjFwzQp6rQCggrwapsrqvlBE0wwTNLA51ijRj+njYYV/cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773342312; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
 b=bCiqvuoZnIPifMT9LtfYeOkVoYrEHVO9K5UuiGfpXoRoHHcIKhQZkyAIwiYuYAeeqbaT5
 35df7+Etfm6U1L6cPlkRwOAl/0kDKGRH8S21buK8W43vSmcq2Td2tMA+LfxcaC6DNHZ5YOo
 bJfLVlMfPm+g9q0exMLxbREdgnl0bZ9HIHeBCTBeSLHI77xp/tMEDY+sRhZycp/SfiW4Kjc
 Mku4BVRVbmLTKo0gwA6MzLYZygDn+0WSoIbaLK8d0Asfeu7svKEzQxuqvHI1sfXYxxOdp5m
 Ixkrc8a/i4PSFzoCPD8E5j8EpevQ8WPkK58Qp3zOPoSoDQppgTGRPDG38qkA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 938EE45021
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:05:08 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D529C10EA8E
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 19:15:46 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2be851b8ef1so57537eec.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 12:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342946; cv=none;
        d=google.com; s=arc-20240605;
        b=Lr1efoCfY/hrBh3fFtMkIhh/jMwVmsgzaL/mtaK9E5kKFERgk67I5auoNYl0OntOEx
         iR4YBDKjh21dU1bex9nWENTOerpKFC7DrNU542fBna0GT9fSoEaeTc+CmISE1f9+t6ck
         +0m7cJ6Kyyvn+QkSAOHKeAeGVUf2rAqSgnlsZFa6q+1zLyXrXm/JcOqmKqXYCElK/uMz
         VfnPrI25P8eQ9VhwkfoTmPzTgqCVz4MV+aPBhR4K5pRkgRkwReVJ2f6oaAT3W5M5lcuL
         hGzVSTtDaZKBtSYNC+vUIWMrne8A1Y6y1eGPgIRCucVX9MyetfPjpvFzumWpQOqP28Qa
         dwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        fh=hb3ptnNLKXzYAR3SMNxw/U/xSrMvqov8lDRm/NzYik4=;
        b=Y2W0D9bQLQt0s06Upvd+AIS5FM0paQFgtVej6o2APZTB03ZGMKnVGSoPhRFI9dI3jf
         Nj2aivBxzHj+/RR4YyCMtbOvHP1uUYO4Q3qM9n4yohKlEST1aGBrfJZQFUO/tctqFQ39
         8mOrm+ejNR0mBVB+MTRbxCw6YU5gdTo4kdV0HtzEOEFSEJ0VGp5SlqVmzXey+kv71sZ5
         ADNGJxMpWbUnUCHxoBYuCxocV7j5tEZpnrKr5EW5//qfjA+FWXlqR6JWCQ87mz8ZkKZR
         jSL+kKlW4UHR5gE1gJxbRCzxLrRiUfpzFmHDtnd/7mczduS+ORQlsr71L+mtvFavjHKj
         LWcg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342946; x=1773947746;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=homXtovmL7d23e1KalTVecPCknznywPIJhKJxhlfi9r/A8gMAxe1ycrez11l4fcHPC
         UGvAcbrIPdP8O+4oEK+JchQu580zby3Tlf2fh6+ztzz+HhH8wE21U6foC5E2j5gyYoFM
         iVKydSWkzJza/5PFWOm3qlqzqrH0RYniiCSWHJ1PfXLSa0w+zNGzVtbdj14pTcR66X9s
         PMwush3kC20A/nl6ZSDn+yMNBkGgnQh7jo+XNOknpROw63oeMZPgx2RpLGBP9QLTA78P
         EDwErEtf6ttnw7STJmy01IEfICVkOTw7TU9vyyi7EmAcaP7446w5CnqMgfCZ9NDSjUeO
         zzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342946; x=1773947746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=trYSO0GoJYL/OC8DmLA+nZ4oACo5SqNGC9lH0zF6HaHr6HZ5XMSlHlNbT4i4OTNr5Y
         kp3X47mZ6XFeazbuXAUzV7zePwLdce52XrlOMCfzqq9B0TgLta9sEuaZSMKaiSsa/nvl
         ks9lR6SlU62aZaGkW1Ju2vkkx0zR8hioJVucyZY+DEc79eoATH/gPwBhDrsX1q5ofxVn
         52bQtZfTuhiH48mUGPkHc7X2IWr21cwquR31lOTrhU3FC9PrkQH2pgXuRvtydLZuoXto
         uk5994jFdGn534EfM8Z9TiJs2RVA54B0dH583gKVu0utKgS8Y+dT/VBB4WIIQA8fR5DP
         uFJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsVOA+0AVRIkM79rKrAukPNqsrvY3RzKmMdNjy+17OH2MrmKHJ5LhduOczbX/7SrMOkheZFYUN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBZofO3kznTZvlf5qgFhoMzucuxRxKCk0YC+bQd9Ul9k/6b0pF
	7c7K9oYYJHnCPM0JdFevX63+NnnYCaXamu3ir87bmtKVqqkXWPMtdnOjakUUn8o5Gqbwse84KpE
	0zKY7yZHJ2h4iWtXpOxwCN5DiuRzX72g=
X-Gm-Gg: ATEYQzy0fj0qH3O1H0FXh+jzPh+pDPgevvT+o3707TvUFaQOxUQn8n6ylddJT5j+Gyi
	kd+d7wcKabeHmeyaxHSuI2xUPB2ii9aqQ5wDcrUKhrLaEbmYUAIgV3nY3fZ9f0AJxF9L4CL0x7c
	dPjRUG4i+vTdP1QDOWbmaXiFymAPSBKLOnSGj4eNVlq1a+9VRjp4qX35N+pj0rZGdHwgIQCxN+j
	mqpvwS25BUDjvdUcUc2A0L2XB6QOrLC4FCZ3nyYeWlLTfgYORbc0MMksHv7dbIKXGPJozzTg8NY
	fUjGcfEHtcNopoh16oK6+jb63u1HcDx3i+ILI6l/DrrWIWVDNPYQlGMxYfMsLRGqTpY/97pD/12
	UrBJfyfDD7A+sh3Lu8Oo+wso=
X-Received: by 2002:a05:7301:1924:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bea555c8d0mr231898eec.3.1773342945899; Thu, 12 Mar 2026
 12:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
 <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
In-Reply-To: <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:15:33 +0100
X-Gm-Features: AaiRm53560zXAmoL0EVQHDBxYh33LaVByeeBz-QChPDevjdBJ65drv5v7FGkL1c
Message-ID: 
 <CANiq72n6ccEz71V3nkJxtY_BNbTw3F_eekt+Dyhvfb1FNP-srw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HSCXZ2OYRWEQ4OJ3QFDLN42ZAV4O3QY2
X-Message-ID-Hash: HSCXZ2OYRWEQ4OJ3QFDLN42ZAV4O3QY2
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HSCXZ2OYRWEQ4OJ3QFDLN42ZAV4O3QY2/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72n6ccEz71V3nkJxtY_BNbTw3F_eekt+Dyhvfb1FNP-srw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 12, 2026 at 6:42=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Was this given off-list? I can't find a corresponding reply from Miguel.

Thanks for double-checking that -- it is fine.

I am sending some nits and Clippy issues independently though.

Cheers,
Miguel
