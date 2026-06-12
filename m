Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1F2CD98D2
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 18:39:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B21C310F653;
	Fri, 12 Jun 2026 18:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gJqWBQgO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F13046AB6;
	Fri, 12 Jun 2026 18:25:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781288735;
 b=jMvKZkbTonaGPZ8aZVBWRtj51OXqXi0Do60e7xMQGfvNbSK+D6+CjRMRMoZfVJCsq9FFx
 OsYjhblGbBk2Zpip5X5dPNQ0glrNdUUhQEOct9dMTeXaVvwhPmuc73vKjCh/fpkUfqBIuBO
 vrbWBGPrHCjj5oyx/Ic0OY4fXQNQ0LXkFKrl+N1E3aKnGz+RL/zGDhWDqleLLeEU2l8YkO3
 MlY/D01Z9jX05RiCPeiYyB2vreCoaDZamomfvbBpDWQNqJ0cOp0wKJkd8+aCbbaSmi4wriK
 bPY26mqmD7/iE8P2sNnaVD5NAuFbHo4pmGcpCzHzKDbctwQUJYxWkonhrvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781288735; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
 b=JKo6sG1GjEr2iD/ORqFH6kykGfGCT1d+KnZ9luF/jiyL+rPQNy4w7fo8FkR3hG3Fw1zse
 IY6SetsoDbBM4wsU9zumOSTHYoYDuADC2/QVSN+v6GceJPogT80zUxBoEdtSOjn4UdUv8iL
 F7ha8DKU0e/rAEVtzYOUA+MVvj1gp9TPwwGEUhitvK3/I430C8WP8UydRGmw8mlLhI5QiI5
 4HH34uIE+GFFIv4IO3RbbUvud4KD5669Z57EMqgSz+Ul0hDgFl76sqkCN5Tm7JlQI6SmKjX
 kcBEAQu8MI9idEpXYBnxssHmJJ8ztZPZ3WaHiIyO9eIDVV3dkgBv7762kERw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CCF0C460F9
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 18:25:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8FA10F64C
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781289574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	b=gJqWBQgO1fNUmJ5E/GXTE7jw1xKsYo76pvJRmcu8r0dBrVhWfyN94F2gZLnzjHI8ItueSm
	iMLSwKXoGt8Ef9nWBOlDbuCtNVhSw852gM6koRIL0dH2xdE4w0Pq9gcxpWnZIHfq+UqEua
	2Ot7szzdZEGCr0eTMOmUSYQjpUMwqic=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-9yy0jWRJMnuiIGiLTzx1sQ-1; Fri, 12 Jun 2026 14:39:32 -0400
X-MC-Unique: 9yy0jWRJMnuiIGiLTzx1sQ-1
X-Mimecast-MFC-AGG-ID: 9yy0jWRJMnuiIGiLTzx1sQ_1781289572
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915767b341eso119468685a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 12 Jun 2026 11:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289572; x=1781894372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
        b=Slimoef0sZrLFIIS7XGWOSOTS2j4p8hUWU8rWX7ZidnCUs1sT63vQyn8BsN4jXtPS7
         7WDWyHv9NRNByhcbJN5I2CwbJ34q27eQarusSG9tKDFBSsbeAxLe37tgPhUsCgb/6JE4
         cDqLT1V3H+Fh/UMcMW5OkCoMdYiWWXDWKpMvM9a4FTmnlrkKeKNQ8i/InqUJYv6ZX1Ig
         GhBEMZnX5pnCskoFcc+3GfhtPCcDqmWHglOXRvB4mXQxDOTohqEvH5k4wvy/CfyYQtw9
         D602y3PT1xtfNfEjModmE8ORrTpd4Zj69+nebW6cAZ7NFnUX5t9aN1BTNdXVbHiyGQ7K
         C46A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7wGTtB7h2Z5z7QRKukTsH2sbcc6diPu+sPjOgXMYrYxDZzrhFsnxQZqxSyd56Hn8pyRUlPyDc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpYtnpeQMBM6vM5AlEIovgWiG6dsV7zZIMEY3SgqFpvT2XHWVQ
	C1o/2NyZYLKYrR/EzVtTNl08UdnNAvklgQkPjo/duZqg70PsBLMV5S419T2aivtuQEmjCy2F9pS
	+ZfyOZXA1KQThZvrzshpfWk0DckHhnTC6asxPDQuiTnuggSK02Jp2N4tp3pqUKZLKkXQ=
X-Gm-Gg: Acq92OFK9R5rOXpA9cbnQtHKkLxViU2QHuzv/w6KiwkBHVs4ps/3Rs+kNDsSF9GcL32
	/vivSCvT1wCbtnAVAPYri9YoGNVcLFTdFCE6yQHnB80JJCu1TeKnGPHqMhZlem48XHWfsCYGXmv
	XpD5K4017Xfnv+NAfYQeRdIieQDiWPsfZP7gmV2P0j+7UqjZjLsr62X5fs4eDiYPwNk/XeCtWq8
	BDRRuS7Xj9cQyBib+fPe4Jx31ir184NGAD9KDvx+g7hBxNErwAh6/acdM4aWD12eY7a25PM3wrP
	qKsQqc1C62ucsjZjK44Izcu1lQ8n9qM/N29en0Y/tmyF3oo7Zuano+ux6U5iCHfHtjSMhhjUEmm
	trveLP0ijE3jd9I+5Kg==
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id
 af79cd13be357-9161bd604f9mr617289085a.38.1781289571989;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id
 af79cd13be357-9161bd604f9mr617282985a.38.1781289571521;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9161a03d6fcsm272275585a.35.2026.06.12.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:39:30 -0700 (PDT)
Message-ID: <da0dd5cf287f8739d6b099646b3fb98153670f3b.camel@redhat.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add
 vmap functions
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 12 Jun 2026 14:39:29 -0400
In-Reply-To: <airp4AHxiJKWn5tr@um790>
References: <20260610162433.923550-1-lyude@redhat.com>
	 <20260610162433.923550-3-lyude@redhat.com> <airp4AHxiJKWn5tr@um790>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sGwqWhqZw2edXVh8g5eTtPcFQt7-NFeISQbL5HtQWEk_1781289572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AUCXI22H4K6BCLWHC7VW4FLY455MCEBW
X-Message-ID-Hash: AUCXI22H4K6BCLWHC7VW4FLY455MCEBW
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AUCXI22H4K6BCLWHC7VW4FLY455MCEBW/>
Archived-At: 
 <https://lore.freedesktop.org/da0dd5cf287f8739d6b099646b3fb98153670f3b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-06-11 at 10:01 -0700, Deborah Brouwer wrote:
>=20
> Hi Lyude, i've got a clippy error here that "into_iter()" is
> redundant
> because it converts a Range<usize> into a Range<usize>.

Yep, that's completely correct! It looks like I was running my kunit
tests without WERROR and CLIPPY by mistake, which would explain how I
missed this :).

Will fix in the next respin in just a moment

