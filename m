Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5B5D73EBB
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 04:43:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5349E10E8F5;
	Fri, 30 Jan 2026 04:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R3ta6lwb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7D09440F1F;
	Fri, 30 Jan 2026 04:33:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769747639;
 b=cOS3Yo+iSUjsXCPPYBNotA7wkHua+0K0fXyGEv+qxMdG457AvRNnI4C9yiDFjrLrRSONF
 ppBUlqjZJ4kgaE1IjIQu62YdH40C186VxdjVRCOOcThNpNcX73tl1LLoLMvsL4OTgDbdjZ6
 6lHZ3WOafNBfrInjS8QWFGkaX3lUwIIHw+J1pGkw1kMV/P+vOPpeJFkKc5IcH8KBwneps9f
 BRpkFJ076042jlHunuWf345bbC3Q80D1r90gFMdlGbMxBOU9vcde1pjqsFsaf8f/DmpPYu8
 cafctD4bUwE9OLGNhOfupUUkI0K6emgwhUFZJN8VUZVVUYgb6lDdWzIL5SgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769747639; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
 b=C+LhHoDQASVJB98fgwmX1pqBn2EfStEl5/ej2ijNH4mAv4uuHf2GD0dm96+CKLcjb3CkC
 oqEOCvXJhrOdgwv+B/WuwpB1x4Ip1rlI3OrMq3w5l2b8MxAOoo+RbuQ9t9a7BzhL8gHT87u
 wMbLoFXEUfvkPVlCIk2fKumifuA6RtXM0RORMzc4h92PmPn5L86kIPlsFmJcAPpFg7x+vPs
 KnfqBkzUo+ee6ph2mxmkJ7C5qNNP8HZPvF8azmZe7SP+y3EyGMJ8Pv7uycui2YcnzH7H7/z
 CXS+ea+K2o5OQn2KYAcgASS7C+S2OJOZPagPPaxaKvhLcv6qHwJNs1maB/JA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E0D6540805
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 04:33:56 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 78DD810E8F1
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 04:43:02 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2b71310e8ddso110133eec.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Jan 2026 20:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748182; cv=none;
        d=google.com; s=arc-20240605;
        b=O5MEwZV5QcWJ6XRG6fh8WQaC3lr22dsiMUE0Kp1DiTqWM8LkzbfncDk4W7B3CiJXwb
         CTgBloeVba+mHF71mv6uD/hym9vB6B6VKT809ZmlyN/ZcY8kcmIje0BZx9aIsxGhJntS
         FirFdvrqfs8LbE/5JAI6rEKh9evr/0XYDHcmic+t3mzs5pURsL7XBHFTw3dvEY1aHxiF
         9d6keVHuUxuHhB5DsFGanrsq/b6JOk4uRnb8h1eMVWH4OFldduwt0w7+EDE3r8LOjqx7
         n90h6ius910wSxbC3jvv8ow0n+1OJarhN5ggfkIFJj5ZikdzIAeFtUjn4sIAvklQeFTl
         KtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        fh=XNWN3sgocpTdwagtRtpuGcTdqBti9nrPvWs6b4AcmHc=;
        b=Ne1uP7RvTmGDHjUemCQSFv0ouiqIrZcYCEJsQAd9Gdglozi1DFS/jSYj9DIHFR+/Rq
         BCdgYBsaEQFDoNdBtWNpVdXKLJposrBwRkp0XFMsREI9znTYZJq2LTv1UGb0VdsM4/0z
         uKNXu1kShhF9uBBO76dCGpYtmeBysy54+9H7f/rrX4FyONAx6uXitxcoV5FtIhQuBbGP
         rcBPi5lSyr0ciW9lH409u3yXIwn7nF2VL+aVV5+pDLqohk5JSV933+lPEJmcSTgGffdM
         ybv5ggUiwsxUydM7vjng2PAl6LXibezG3eGY+XRmhNVe9noug04oO71+Ezp/YITNy9Vl
         gtzQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748182; x=1770352982;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        b=R3ta6lwbPXJL9Zku6mq/T1BQia50Cj/O+t7559SO1Aq7D+WY0RKuoKKZEOxgJmXaD8
         1Xozht7GboXxpxfJm3Q8maLwAsGNF8ou/a+1OgOSaXW4Ytob9iD+srV3R4LecVA/mlEr
         tVuV5hpca/ILZrzcFo0+vQj/2mPdl3huT14p2bkodPS1vX64rJHKLgrrVozsl+OZj4FY
         WgoinJajra0/ic1eXHORg6/RvLlqWJBxEdWmx0nj4oolAV48UDC7xQkPi5lolVqe3pXF
         bUWQQjoDCLBZeUIIPLtSAJnVJSJOMM1RsKOZUQcGLOAnKrL4oiwMABi4/R8oHJheqJcY
         8JBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748182; x=1770352982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        b=aaq5yb2GFq6K3hHDIQ+7Iw4cwV7kDeg9kHEPYhHs+1YRNgj5UeQge1YDtDaVlCtZSa
         7iEd18L43XhtkhpGqT7k6WJ6BhscQvHxYJsfU4gBf5ODczNLS2eRaTEB229GRYltLpO0
         cZnWTL81VtvXdN5jPWe5OHIoyls4HcM2sY3EB84wzOsEVAd2/JYR4g+HPpTht4JITx91
         a1BNpgP2DcSSmZylZx7I9RonT9YfPVvabro7xvwP2wKcnNg0uMLgkekCMdXh9rref54K
         L5ItevknhpN9/axq5qL8p9DpqbhB+1HOBUk0CGtkXu08rPyDEUJah8P9WGnOGuNXLYp5
         9o8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeC+8sZwDKaun3YOJpqV3VR1M9Rpg2cX7alW7h76D4M5pwojXNVZo0HN9TdLEwa3Sb0QLwqpVE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKL96ttwZpQYIWhxEuIIpcbSuBL0HM2yNUzCd5h39xc7/BnrqZ
	qRWizDG7viuwzSY3Kk0XXSQw6madcT5oWf7fEX2EYlFC/NgO8Hw/SlQ7Ci/2ztyZt5vIuQU7R2i
	8ts6MF/glo+WBUiYr+s1w7DSs2MZNE4A=
X-Gm-Gg: AZuq6aLp6Rq858HAwO5M52XCFUFLKEa3dit8uRAaN/HVnXP/bD5GSIT5WJLpB3AiyLo
	tL7Nv0czYNP1DW+W7eDyt9nwkPwSAX08dY0jchzeuP/OkD3hxmPsB+PG1Ta7OPjTI2S/YrUw/Fn
	PXQT7s0Oc4MI9WjBd9S8LPxh/wcywkQzT9xx580RuseCHLDz7WWV1nSz2ztcSPXeyAGkIo8ddgs
	Y7JF9rhTCY2XRZ8IBSv8BVrYsxELJctX5Woibe/g2J8AsiiieYQN/KQqycxLBkwcCWYGUz+8SbU
	4Q1TXiCZBEXIuSDAy8Hm3e7W83QXAIkNIfPlv57kjVosfdc1qRGOOgeN+ApyEp61/3l2EdIs6pK
	ShRQaGGCj6soH
X-Received: by 2002:a05:7301:9f16:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b7c86de267mr441066eec.5.1769748181591; Thu, 29 Jan 2026
 20:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:42:48 +0100
X-Gm-Features: AZwV_Qj_-wgMBEbWmC10rmMhLTHVkB67ZjYZ6I0qc28vA0AXyDmBACdkWBHHb34
Message-ID: 
 <CANiq72mRsFcq5iRk4no2wA0GLmziiPx=WnGQkouCfZ3yWzcD4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 47OJ24M5BLFSDMN2AO5ZOINWPGN4VB65
X-Message-ID-Hash: 47OJ24M5BLFSDMN2AO5ZOINWPGN4VB65
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/47OJ24M5BLFSDMN2AO5ZOINWPGN4VB65/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mRsFcq5iRk4no2wA0GLmziiPx=WnGQkouCfZ3yWzcD4w@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Jan 24, 2026 at 6:11=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

With this last one done, this series has all been applied.

Cheers,
Miguel
