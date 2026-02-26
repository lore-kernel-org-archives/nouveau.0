Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F205EFCE08D
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 14:04:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A863710E95A;
	Thu, 26 Feb 2026 14:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHUsfWUb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE5CC44C79;
	Thu, 26 Feb 2026 13:54:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772114084;
 b=v4OLohoT3G1HfnG9wFstJlGW+XrxXyqC5/logGRZrSYWRb9tJQtgIpwA29dLZtuqLZG9r
 /URj5rGGoJUzb6ZpyjYllsDWolVHnpz+/N/exCd/e2KsbOGfx1ulQ5EJL5RTMoSx62pbkYy
 fsdKLpGDRP3YOj0r+TIvLLs8Sdec2ohVT1r0TpMYRxiYW1TvZ4imr8tPKnpCH6QrDru0Ccb
 VMbnrxYjJJfDVaUcqRUp84vlpPerrtDZPlTC8YK7RvRlYGhIB//aTrXNa0MxZA0L4/3ODfm
 +5TkiBUii+LpbuC3lQ2tZgdD1jbxaDs/Kf8uDQI1OKSnoOyuM8BJKhz7KQLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772114084; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
 b=eSkLFq1lZOWfgG9/KX4ijjychSsOgr6NYwIuZtX1fkgGBZgZnUFSiqdnVHtnk4lyvSVfO
 KkUMe8e0KQgTDYgH5Q+pCKI6Nsw01Ve/EjTgtMAbX0Ya+GWeT6nPmfI6UQPXx/QKewBJpAD
 qaqSTwvIE8ZeIcaDTn/ZdHthMeaaW8hgdVaqGq2QzAZ9UeKi6DJOc/yTXaFdiIoILQRsmSD
 iWDp25BygoAPVzzQ7WbFX1ZFZTokRBvK6EbgvQLZpOdjiyOsfGLSZ74jHVRcEWpSbbMQufK
 afjl9pVrx0Oik11L6i7n/CwTIEyHJFOspeJ8Cde3hjcp8wIKyoR+cvW66F0g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D1DD74429E
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 13:54:41 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com
 [74.125.82.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 785E310E958
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 14:04:48 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-1277863a912so70526c88.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 26 Feb 2026 06:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772114688; cv=none;
        d=google.com; s=arc-20240605;
        b=QwKYlpOfgZ7HeuCFO2fVrZYuw9TSAoM1DWZ7z7kSY5gX1BWlKdAKjE6zX58P2IwYHP
         AlFP2Juz6CytZhZCNc9dWm/NbDZQ9xzKQqxY2rPX72OBNQZskdIie6DqYBEST9uDxBw5
         EFpGIn2Z2JF4WjeDA/x25BujdjIfNqpeubt3fXof6XxWWmcVUx5WuQZ+T+RaRz/5yxxb
         zjoeroPLmOL7n0jhCYeIvQyXVbWtRggSOM7UoEn5BMu3up/bTE1P15vNCccJmpI3lrDt
         MrNm4hesp4uFgqTsjL/JbE57qqBy6QD/gLxWm0A7l4KMa5sA6/EP5R020FpjMpVY29X9
         F+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        fh=ULdc3om82OUMXv2z+bU0g1bFWc5XaLn1urWYO/1yp/c=;
        b=AiWSVRGYGZfqBrcVQ4t8CW+vVKYcvHFd/JKdVBT38Na94WQTKXMmybKM4NMhXNDhyM
         vzOXrdKqe5DMjFzDC8DhqXp2Kn/tXSjnf5UwO75XYW1EHYdcQqEvAOkThmwTlXAHNQyD
         5mi0qMpigfAHFR/Xxrq9xZm6QhyR8tP38RuV1iLAzBM7/n7e5s6I0TbcH0hkK+c+nBEx
         CTnA+tlVPqno/2zKScFDVcnOJ1lIsVVIWW0mZjMVdKQrk4xuzYkpU1tdXEB13XGQAHgC
         zrTzV9awMmzNYgNBdAG4jE1ASEB3UXZkb55F4S0t3J82UZe0zN/Ye4N0PXT89KUCJSys
         8Xzw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772114688; x=1772719488;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        b=ZHUsfWUb1Hy0C4SsaA3crcVIgebm1yz667MSB3o4aBNctu1joFTwZ9HCTVRZoKHtjI
         DAdotyCpKBE46/xbv6kGLNgWrbHJokhA1LDvRq8FQymAF38/4LqOi+jB1TWqFIH9OByx
         Rg0TKd82znFfNoDDDEW39HQ8DpZUtfPdLj6AdQVDZQdqqeLqRLaLSwyxzDlysgKaXpGw
         5kRkO9Gg5abxhOEZHPtkuCCyJpJ1c6fkwt9aUw44NkVEOUDTk+u6GqjOXfx0xR7MJzEM
         /KASvhHXQFUcbHL7qNKfl0id0Ggp7m9Z5c2qWVeHX6du3/CZmmORM3sWX4gCWoWEQILk
         +ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114688; x=1772719488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        b=kCZM1Ngu4wmx9kLZexbXig+SDyaJ1QRT11R/tXGQgCRAnHfq2XZST0kC52DhL9wuYr
         J4sIYd9rGxrCUVshKDvyDb2RfDWHZBJ4BHxq5R2nzX/gO4W2zMTFYpZvaZ2GBHUB1xan
         dEwJUvff/QvKjYiFgqyFsxoWYWTPRR5G6lXlf1kctd2qiFDfwb+P7VXz4S5rEStKoRTM
         R3OvGy6vey/N21FTm/tjfb1zuYu0mA4N0RJHy04a3s6oI17ACb3zYrL++dxmfVK9GIQH
         W7qwA8UxtQ2rEAML3jqdgC7wdt/84/UwyoNlvs4rvak6YF35kNWs3ns4UGOLt15j/Mfu
         dzow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5B3c6p1Cayt2eL7BKgIekNBayS7wQUOu1UyK5tVdx4oS0m7fkz6j8GWdcJuHMEKZ5bONFUcWq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynD9L3SHoph6qA90U82DxYa2pNnYIf7pYoOZzlraAALgWBJEog
	KF0VxqNUaVRC3Av6NmVau+39tBGpvBryBg4l01sUR99rrrtuXhU0mjxV8GwyX5OaFmXt3njH5Hd
	W/XE4OnbOUFJzgTVxIFB0Abjcjsg4o7k=
X-Gm-Gg: ATEYQzzjPhc7WCE6JT54BLjY+0/tzyxCXWBuCtVYb/GimMsuc+E7ozHGB2JsV52N+LN
	2VHud3S95uKisx/UACS+ZWRq8FoiCinbAcHfBnb/+R+0J85ziNDblM+yJ12dDlHyf35C/vRtEc+
	bxeMCHT7414qgq8pwWnV5kBQZKL6udceC+dPn/QrbisciUScPN2u9ulllV+fs3v3ANYq3qgKz+z
	KOkK0SnHZaiJXMQQahxpB64X8JBf5+5wm6gOSMEETnPZY22UCD0oM5NB9vq6JgUEstE/fWdISMQ
	pDeCAegbrVJZ1+x/tdMaSMeKQGFnr9tGcwSxSPR9rPYs7aB0cnzjN+H9ZWzKUSDrVqV4ZbTrIVM
	1S802nsgZPGwwM/3BviHrh25d3zyHq5LcV9d06co=
X-Received: by 2002:a05:7300:bf18:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2bdbc33cb83mr1132309eec.4.1772114687621; Thu, 26 Feb 2026
 06:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Feb 2026 15:04:34 +0100
X-Gm-Features: AaiRm50bYcwJMHTCfOonMLoQxEz1NrF-ZMytkNesE2f6ML6hsIR6ETTN8geqQBY
Message-ID: 
 <CANiq72mb=t4C-hTn0BdzLmvCu315tZLHPN_g_wvs0P-qgO_RBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] rust: add EMSGSIZE error code
To: Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: S3W6MQWC3CJRRB7JY3MKCJJXS46MUH7B
X-Message-ID-Hash: S3W6MQWC3CJRRB7JY3MKCJJXS46MUH7B
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S3W6MQWC3CJRRB7JY3MKCJJXS46MUH7B/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mb=t4C-hTn0BdzLmvCu315tZLHPN_g_wvs0P-qgO_RBw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 26, 2026 at 12:46=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> Add the EMSGSIZE error code, which indicates that a message is too
> long.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I checked that it is placed in the right spot in the list :)

Thanks!

Cheers,
Miguel
