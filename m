Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54517FF6E87
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 21:44:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36C10E670;
	Tue, 17 Mar 2026 21:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNhPNDAD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 901F045206;
	Tue, 17 Mar 2026 21:33:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773783207;
 b=LYQqCvzXSxY6TfZBJli74J64f924SlXafzyczVQVYxJNUW/8WzpY2ofb+VBvlm29L1ALZ
 BPhz9UCTpnDZeLkhIStRHgritOeRSlTMDHUzicpjcJAvs+p1ygs4DY9nxITvO5QUg8o3OWx
 /CTcmCK4PRL5UrV5fQ7kZvN81DhYeeLhLJQ2zI2Ax4Swm1UsGQ5gF/w2T4p29fqlooKyQVw
 jeFRI9jcCBcz+IHV9xrJlTGRtgx3xnJ2Q/8OUf8fhwjINcoDtsrZJbbZTF24cJe00NaypWE
 uqnkWIlK+/xXTgnmOW0KFav/233QHNZ4VLATbN9gRUVT9VcxXBgvxBjXlegQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773783207; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
 b=X4KA50d/iEUHwuOoM7bMvGpn9AmC5XGLQJnT1KGYbkCxDARoqK0o+vQGXhKb0pBUlwfME
 tkFrtO97h4pMVdfYHnpQQpVvmN070pXJRCPexKDv0SpcgHSyYgt6w1XQdvkUXgkP109HO2h
 t8fm5QZuzV7cdccC9DTOAuVByq4TFENw5nQlBDaghTowhNWZ9h5z2aMu6vAPGaPgO+0jVjz
 IccEevbNNcfCQlJvxnpaVO5d/PBJO7dKVv7I61RcK4r8KzTpby8DhwZoHYZXumMFocueiMH
 POoDZQfemb6e6zg+oHe8bdOKQFdNey4/AEDKCJCnqsnVaChfJKwJlRo2ZshA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E30AA45168
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:33:23 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com
 [74.125.82.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 663B410E215
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 21:44:13 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12734af2cdcso267538c88.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Mar 2026 14:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773783852; cv=none;
        d=google.com; s=arc-20240605;
        b=IwM6g1BLjlQsa0919CV9jFvFbY2IzqxV/DzIuV/19cf8qTvTpLMIhQ3rds8mPzhshk
         UD3dKlFzwXqP8/XSxCHEB7ArZIHH8JHfSx8VoxspDVon0mdtUO7MhpPoB5gfmMKxrA7b
         z1VdGBa2NHBjGbiFZC9RpF2V1HI5CJmyb0z60i0Zef3mB5NBWxrfwI3uURKpmn/Mz/Id
         MHqvmfAHyMMwVv9zsPwBphWrxm711yh2J+3JolOCCR0RTWINhkaqquxDkbSy6Hmo/Ton
         wq8UriOFNoPabq1OM3sTRdmWgQea9+aKJ9rpm7EXkOodOKDDpshiWDCMy0kiPTe1p3SD
         rYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        fh=a5LcErNeAQ4ETQzF6Y+P4QBp+i6BAUvHJbDqeJW1JB8=;
        b=jrzUEljG5/hpXYCcgBasO+Dj94CaSzz3Brs3b7e9UWGLKSUH5x1wT/NbiIVHyz8DVz
         Q8AxMWwTYrZuRYQxyFspuUK+BoxIj2BVN6CEp4urDScsxL+G6UjXOwQOrhDr8f6xrhc3
         0LXxkf2n+4tfzL0oEuqsh/OP+MhewvfstJsTyA0GPcM55GbtwWHLVZifEcvjdPzFowMj
         aMBAtpJtazolnuUid2DDnZcMnVYK4fRT+DAHIAqqpvnb1R3wThAFmOhJxT5vjBGPYds3
         hJvSm8Aet0jvK0hZhhN5mJIT/+eDXSYqe3/7am/uDTqYTnGTFOfZrPoS/MbubCIIHad8
         7Afw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773783852; x=1774388652;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        b=SNhPNDADoUdFlzz1APXRbLiZ6iREdZKZ5UVRUYtz5XyVh/OYtkSplXAeMtaZhlgFCP
         lpHeEMTagCT7UkVVraaHfKYHRQxAqYj/CAg0h/vA+pbjnG2YhnPg/gZGxQ/AJYavx2rm
         Lz+0ZP2ryQ96LEd3HVyyOj9riVws8QPu+nNSkVai1wehErtpBX175UnhkJCcCdvVPF3F
         QU/P9h1MKYf0dZluWHvsUpD25PyxNdZUDY8duBQENWmT/plUzfpeF+cZA+lsT1tZamGN
         3FUfwYSlG1LuDzAQM+TRf/Z40cXBFVrAeLBmzVoHEzTs1BsZ/fyBPCUfe2zGhrmhL3qI
         LkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783852; x=1774388652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKF2J7Tug6XUXEkpQk4Xq3ayxGXLG8UgZhZlDXyGZdY=;
        b=g++RdMKQuwsNbBJNNvUYcXohjrXUmWgFedSF1tHiIw+4SWKyH50CdlffQQukJeImUQ
         /vIGvMy0Pi2nnQCVTScGbQW79ybRJooU2y6NxoXZLryREPU9wEMscLsm5JU9uHZ9e6Nx
         H8+WHgfd8KOeJr75VQvfCd/rKZVR5/27aIJN5yB843znT0JU5//sIRpBkl5ItKVJp+a7
         m02gtkY0DFzolomwaJs+KsastKocqafpohkTcsRduTpn6D7D8EMFQOmN9c0FjB6AYj73
         nWm5yieeV8CCmnOKe1C/OzCBw7F/dH8ZoDZrN2gvc3ga7ZFQ7FbRUJuSsF9FygtEzmse
         iVMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpELEweC52dGnJqCpJi1xAq/KEbWzrArwtsgGdo49Cupg7DAqXJg9H/pYdCqSjHW4QKgJwIOjm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvI1EX80Is3ionB+wr/zlQsfb1Cy7TuTb3ynSPU7cZad1qajhI
	pxQ0OZZU4J8xbnKyF8fKilBm4JcAmHTz0IoEIL79Ms9/mw6g3G1BSkwFIYfx62CsL1Qzrq7/Hj7
	dn3u3ZfWAbXgZp7+bbiL7IY9Wmzm3Yo4=
X-Gm-Gg: ATEYQzyonUTiHFezwPfRNuIcwhYt7aBu4/tgnoAvb3uvQB3A8i2zR443XmWk5HRQy9j
	S63+jt+voGZZ+JCAMHbuZB/eERz5ocYz/ICP99HSKxMsdqOKMU/doK1AGTQnB0pwe+ODJeQJhUA
	tabpZ6WvhwX+t4ubtIgaBsXPt0t/NGNQXqbDWcVhQhMWU2V9t6PDvSxMtHeWO3UYXJ2Tg3zKtwb
	WV700XyM2myi+afPXTX70wp6KAABI+m9gr950An5tEeprmqypArwQVOBIum62LR3XZ5GtPM9QNl
	8YFLL1rGUhqO9dODPqOwB412EBebtQy+eLAZDD9udYJhJV8lrdcQ7YKIY7C8tEaCQLbeRKoIK1y
	dwWmkNFyr9TIlvJ+wQboIkf9HemXhrpggpg==
X-Received: by 2002:a05:7301:1e92:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c0e5071063mr268092eec.3.1773783852476; Tue, 17 Mar 2026
 14:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-3-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-3-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 22:43:58 +0100
X-Gm-Features: AaiRm507WQGSwKRMpz8g5KEGBHm5tKGpUppvaL_hlp_t4yPCn24PcuZMPKzTszo
Message-ID: 
 <CANiq72=6y4Mn=i9MnqwTdL-a4ujABcYpWe2P54naR=rutpMS6w@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IL2VPVXLVCZQCDG5KQI3RASXQEAEAJYH
X-Message-ID-Hash: IL2VPVXLVCZQCDG5KQI3RASXQEAEAJYH
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
 mmaurer@google.com, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IL2VPVXLVCZQCDG5KQI3RASXQEAEAJYH/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=6y4Mn=i9MnqwTdL-a4ujABcYpWe2P54naR=rutpMS6w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 16, 2026 at 6:58=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Since I think Danilo wants to pick this one up, with the documentation fixe=
d:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

By the way, there is a typo in both the arguments and errors -- there
is no `data` parameter (which I guess came from the other methods).

Since I imagine you will send a new version, please consider adding an
example, even if it doesn't run (like the others). If it did run, then
I would suggest exercising the error paths.

Thanks!

Cheers,
Miguel
