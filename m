Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AC5F3C9A8
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 16:15:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A381A10E5DC;
	Tue, 24 Feb 2026 16:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pu5R/sDK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FFF14382D;
	Tue, 24 Feb 2026 16:05:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771949144;
 b=Dd+RzXjioJxblWE/0khoxL1Zl35jXfLxrc5nHVsIq6DuIQs8hg075lPmO0d3yIgXDR5cL
 8WEP7JoKaLs7jLX9edVD7NWxEG9sPukepWycMqQgM9KOYEEVb45N41r66XW8tE0+xf3oFTO
 INVCYPaTTMNPv3gxLjKfTSCzRl1R7D5wXivXLsEqSD3FV0SqT7ssh0EuJbNyJkiF+FDz/6y
 KsdhvHPePGH39VFXKR5mMc3aZNUqrQ1L2E9kYMnbn5HkMILR0DwxC+3xGyHZgB8pA5NkQyT
 5pl2UOuRIoI01B4l+hDU07P4wz5b2qqg0+lJKyL7QDcwmThTLmmQyB7/2AXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771949144; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
 b=CnfdggF7PbBgr6+j+KG8QbfR4nGJo+/w5VpKkkyGZmaVdgAvNqIyRu1R3mkp5y+dGTpRl
 zIe/M1C06z+067f4wnonqoHqjDwX79YWc+uDq7TOOsvqttg7aItI1o5Z01SAZN+D2VDYc1X
 9ra90Da79Lhck5aLuTZx8sucV3FZsBnw1fb3YvVKh+RWgUoZ8IMSjbYvCPDF+oi8OwF2v8z
 GOeeCCFvXB50AdrX2faHxdB+2is8HyHygSKebJxO9n3whcpT/2t9T5cIH/8Nenr6CHt/Nx5
 Cc9d4Szn+QF7lD2nFDc0Js1mUpWtTwLFMU+TL+f6TkJJwry52uzS4tmzZ0Bw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 73D6143493
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 16:05:42 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D39A910E5D8
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 16:15:44 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2bd6228af6aso343513eec.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Feb 2026 08:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949744; cv=none;
        d=google.com; s=arc-20240605;
        b=a+giFI8SCTUCrWHO53TbFGWqM6+3quqLuDeeQlp7gq9e2YB2SMDKSQFJf8vbcHdJqo
         1zrlu+S8JTHRhGrJlNY4CttgNdN6Qz/ODs9FAnSVBuMzLyap4Y0LEZLi03Ab3o7SO5Pc
         LdgTtZsPeqRo7N/3VZ7hqXTV4PGIsLcm16qjt7vBT1YDh5C/M8cYt8IvW5IijgYzb7Cy
         mWko7cpvV4PwickQADmWLkWKJq4AOo7CIif3P8hSodE3/xDssBBjj78cMyw0CHZXJIlS
         iBRLESZXFcTlkag5Kh52oFI988ftCOfzH/yWlhRo3EKnccLfqnZM3M9RhOAHKcz/eyh0
         o1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        fh=W1LkiqqbqEr77PcDE+cKNVKNFb9iXUSCMZ6gNanjme8=;
        b=PTDS7znfB1G94h/DzaPQ6yeP/N54pAgxH8HD3zuhXyhjY9JWcxsYL4CdbRG2xyfox8
         +gP/caGMpz2TfeUYK0pb7xJScnz1ZkApBAiPANXgE/rzolLhdkKKtQ9MmVdaCfs945Aq
         /CM555t5nredKt5z3LJpq4IUywvhJhnDiIo4bB3t+CkdiitCQKveqGJWnuJZBnyCwmbU
         QwVSEYzr0+kLUO4qcOdTr5Nv9jQI5++wQPOJZX4tvH67kByM4kcSky2mt1Wu6AmV3lfB
         cChKIYV8ptKQGn0dFFeJEad/5UzBOeomDUoQaN2huWSeZI99GsccJZGNmQluXtlUwNkf
         WHQw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949744; x=1772554544;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        b=Pu5R/sDKq9GtVpRxfV3ybewpIxYJO3EFnU9apmNEEm6lL0PiXHwcOw5oIwKk7Kdwtm
         r2U5F4E1FMJQU6ZiBVYcPP1CIuvAHamct7+8Utyqux97NLmfaQd216HxByPW+2aUyvh0
         D2JD3WBuXBuqnBKjvipxB1ZgR0Mjj3+MbJ+fY7WLxFPjuAwkjlR8M6tIp/XOLYlzMTqv
         ooQNO9qisr5lGQ4zbXA9TDoni83cSdHjYToo298kj7mslcXRRJiXHJMjkO0FdoxaLsJB
         FU/HazNPzQzUqqOwzp3ap9BigM+bdlAODLmf9NHeRSMDiKWEAk1yLzDR/nWoPoioQJy1
         jgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949744; x=1772554544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBMEUj7raBbmsyrS7Us99Qy913X47xoD5tUQ83r3xKA=;
        b=sXWCj2QPR8clv1HIrlYcd7XudzayfAuJ3NaaCgkeFdBB+JrhjhS5BolgHaXfBOCIOq
         riokBPxhq/rTFPx9iwBazeWMMhwMuHHd49nRX41KUbB66CCzH93WNsdj36RoQKntlz9O
         o5BMTLl1Tqps1h9s4HrCBm0RKcV2CONU7E/oqfZHmKPX3qzp6yGdtIicYRcYdIppW1rE
         yOxw6Z96bNgyD48AxroVVnlhnQ8v4jP5atMwEVTg7w+qv1rKNWQu3hECDsB099hSV1LC
         UsHut+drT4xWDBABGIUOXEk33WKWR64kJZsc/sHRz1u1nAXQR5kI+9etyQipCnJ0Nr1X
         mzMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvcKGrPaRZ0RYrvXt+mWWYEWkUehKq8NhkNX27dH88vwpA7PJvN/3P3sbSDOzU5iun0rSrP1rD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuYf1C4Z+R2TrNaIo0vMElY2+w4cwKookiUBoQY2IxUPFkpO2d
	DoqW35BV5eN1qK0sIFZTjo7D+wWdEqE76MIHlbevor0QKWGwoFqPqP6TY5UxYYAJPhOXhx4PqJq
	iE7fKb5cFjENsGSDf0MB7ejMcKJlWFos=
X-Gm-Gg: ATEYQzy7oamylc1pIG8HUGmdctDaAmZj9/MBiaxR0yk2JEZAvc/shADonAQkrlQPMT7
	FLRW05ocn7STzyTl5Y5byu5iuYexcWYIfQx31LzFMVN7rzglpbAwnuc/r+cLC+NXqWh6AHjGn25
	8wthiprUjutQ7PPzpw1jB0ENaZd4H3xxBwHo3fSmT7YBnRDcP/ueVqOYmsmLH7+Edyhh3lt6qOH
	QgD8Z1E650wWqI9pQdvBircJvG0csiUo8YWun7WFwRJlB2/5655x01KY9QwIaqdGdC2wHiwtWnr
	hx+1xxlQmk32C39iLEgfzgIYB3PhFyvvbm+hIi694FtF9l2NF2xBrS4fFU6CJQ5A+YMD3ZLifrR
	csYUzuklqlCpoiEefd8WteRAnoqXC
X-Received: by 2002:a05:7300:f108:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bd7bd5a67fmr2747179eec.4.1771949743876; Tue, 24 Feb 2026
 08:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
 <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
In-Reply-To: <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:15:31 +0100
X-Gm-Features: AaiRm53le2roUqYa4Jd9OPo9BPShlpMhNiyuPKhqHHVFn6yvlPnm_kCgXr8IATU
Message-ID: 
 <CANiq72=2rE-R0g=aKWjZwQVz-GqLUQ00M+bi+ANrNu3+zGL0Yg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: U2BUR77XES7A44TZDY2GRWVATQBQTX3E
X-Message-ID-Hash: U2BUR77XES7A44TZDY2GRWVATQBQTX3E
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U2BUR77XES7A44TZDY2GRWVATQBQTX3E/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=2rE-R0g=aKWjZwQVz-GqLUQ00M+bi+ANrNu3+zGL0Yg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Feb 23, 2026 at 1:54=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I do tend to agree with Danilo on this. Unless someone yells, I will chan=
ge
> the maintainer entry to "RUST [FFI HELPER]" for the next spin.

Not sure I am following the "what FFI means" discussion, but in case
it clarifies:

The Rust subsystem is meant to be about anything related in some way
to Rust; typically meaning all the things that are not covered
elsewhere (including what both Gary and Danilo mention), sometimes
with overlap with other "global" infrastructure/subsystems (e.g.
Kbuild), sometimes acting as a fallback for Rust code out there if
really needed (i.e. similar to Andrew, but for Rust bits), and so on.

>From what I understand, Joel and Alexandre want to focus on
maintaining the `clist` bits (at least for now), and if they are both
going to have the "(CLIST)" suffix, then it may be simpler to make the
entry just that for now since `MAINTAINERS` it is easy to change
anyway.

Now, what kind of things would we want to have inside such a `ffi`
module? (apart from `clist`). Does it mean the proposal is to
eventually move existing things like `CStr`?

Cheers,
Miguel
