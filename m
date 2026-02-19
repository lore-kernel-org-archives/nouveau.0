Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C09EC531E7
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 22:55:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8410E766;
	Thu, 19 Feb 2026 22:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kh8Yk73K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7AC0543437;
	Thu, 19 Feb 2026 22:46:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771541162;
 b=0VQLAYqcczt3pPZ5MUXaqGOHQ20AU+STPe+7qRZHdfpDNwHGorix6gw1RLBBi9IZtsPaq
 FcmEhBHRUC+SMlPp7QM/Ddnz2WbdzrJexO4GIoy/qz+3u57ADYJUdQtEXW7pORWHcTTQkRl
 ZjR3zTAqMmZyAWeKPDPp7gGaEBTs9AjT8YkzRHHPsrXQMb1pvqbL4GUxED5cNryHUFZim9v
 jG0hpgyu3ns5I3ZxhWFXAjddmu+lRtyKqm0hKmz8D2a4VpnZeGrlZup+LdOnqTXE+XVNXeq
 o8zfdUNpIaUCHlNpazlv8Th25LggYB8dqMtGEcRGH4OKzauiAiictwsi1s6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771541162; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
 b=0HWzk0L0M5qyVcodb2NP4jhU/F8y0J4kAnsAFAFiONqAphdSYZDCjNWKC7TUh7qbvY05A
 yqRzArUkxTcLzHEVGbbzAcbuJcyYjaEPhQNg/v5aJJgmammK/Dkxxqjxpua6edc3uY32yy0
 bciRRUZAD0m6OuY2XRrHIL5Yp9r6rUFOqAgMxE+ixfWqMRvtysc96pyhq0yLwNLmgpGQ80E
 Besj0smIHZIICPlN928/qSZm2fyCFsiDUUfvUxXBsLxfIm+ZTL3O7xCwLuTJVI6+2QVT+Zu
 MmUByddJWGPsZQ+sU2jbwKTMmQLHm/DtlQWppGZ5RM15hsA1S11xH55six1Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DEC4243401
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 22:45:59 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com
 [74.125.82.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C452A10E356
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 22:55:51 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-12711867ca1so97756c88.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 14:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771541751; cv=none;
        d=google.com; s=arc-20240605;
        b=dZNNc1vhgSFLwSgXAI+bJj8RPL6PSAS7m43YWLBTmTX92XSlvqbkopNKOQPB3VLfUV
         jqV9MXk8dnTQ6BwJX1docG5WzEHsGZzRR0lNzH55hQAfALsi+b4vxL7NuBMSVncHa8Jv
         XvbNzp9x7h3XzsFSKP/IWo0gEK20YHPsF1vbF6GckgC1KXrtDa62JExkkkjqKo9vuuud
         c5Z2AbuazlVad2wcYX/zHrRTmUrhgyL3qrV+Kvx2kgA6tz4QnDpmAHbEgeAtKdzzd9AH
         LRdF6SFKYxYqrI/5kOR1DWcztaUXC9EdrXx3ANewCpJr9vRMcdrXamVOonW72/Dtgv84
         zBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        fh=ldBqL9FJ/3ubIv/4kWudQXO28WnHt8O7eos24uoqPe0=;
        b=jEtmTiAfYGwZGBUnlqztHV+H14YhMPbtQidnzy8mnA2m0SVG7X27ebXqCCKHORVmXY
         E6QxqE7PQo1gdltq4rXdeh5sCN9yw+njuiyWcAL+ERVk4/yb9olXQBCzeQ1N0qaK3KJ2
         YD+Wyj4ApGaaivhfhCEvI7nvIDCipZT64OuXY19WfGlHMogXg57gSPRMgGRaEHZ7KHoN
         NVdBNZoeUcXsxAAbiNinMCKxktCDsRvhh2cLzc3pxiYNocvkCEpJN6cgpMsD2Diw+AV3
         pRUoqGojbWSdH0X2M9TOErjE4dFIwnGtah+SqaClGtQ7rMshkFnDxthogEm1U8gUE0wu
         0LJQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771541751; x=1772146551;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        b=Kh8Yk73Kb0cdU+cXOT5YCH7dpTCOtVIkLLdkg/cpAs7RJ6ZGuJY7Sv0uOXsnWsvGdm
         Jawx+IQ/WMXKREfjNcsASBQVDRbnV9DCE0Bo9Vxzn52dJg8okdS9QiVErhvwdkZEZz/B
         ZR2qLTHzIFV6lPCj0GTD7LAE8FIyKdp2uPTdsrWoFS7mT+BcWo2S2FZhPFMZ28BUFXvV
         1H4Sl9AAgZpp33wAir38+O9h7QJ30v6tgmHfL0RjOazckU0ZpQZKFX+ES2PMfN7XLO3Z
         tDipnH3uQk0aO/A6vyNu3pF5f7T5N18HCiM9AlcAio5KFVNecf9sDLdQ+lHb7VYg6m3f
         dEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541751; x=1772146551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        b=nhISVqhCN5uMGeVja1EFp8e9NuVBX7E3jeb+ZpVrRM3hAwr/CFSMLhRoWX/9l2Sx6x
         WgaER6l/nwz0JTqjsIwzkOvCY/tOWbmKYgKp8qIqMwtaG79Xi9e+a4J5tm88lfhnRfdH
         s2bLQgqry3T+IwhblyTKkgzNck70mb7LnNNKo7mVuimAbnYC/laOJ5YoGxLOhK75JNnj
         /U7UlEZSc3vo4BzWmkltH8PAastrtoiTi1gCPAJl7KvtwvmQfTYfVnznHcVin1Klbm5A
         WCqUz2+hU/tdv1gDh7IWd5L5pWVQFYPSY0G+QMqy8wGV5mxckP/59qexAcWWpvkXANUE
         vqWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrbjQgTTOtLFuQblPL8Ov/DoN+iqMRN8+XamNo1+9gLwoFoQH9U2s6/1AMqh68UhjnNj2jC175@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlQiEPMvZAL8i4xe/5HiSYg+dEUafHUN+Ga55FIufUG08rMps2
	iAb+aF0fOj7t/xInHrCDcCXBkafLouuFU3dTpx7ws7aRSUWdf/3z68ACAe5+6ejbY6+LPF0ow/J
	4W/b3YGm2NN00YiEmmanxm2fOZk/PVKk=
X-Gm-Gg: AZuq6aKEUWP2RfCFM/QjqQMqnycveWKMi7B7UQxwSpE7dfu/qqoRndd0u43qIeQDTFf
	11VnyG8bdsj9F8592v2Oq3U53A+ADh1BG50DhFkyPONer8Irc4kSkR7MFj5eDncZ8l9tEDRZaAR
	LyGRzIG7tVglJm+ADY9mPJ/PRwo1DPdSki+9HP2HTfEbi6fkSJgFWIT9Or/kPforlSP14EES9qb
	9bYme5XAO43GniJurR2S6UPqo8wvtJ+dfVj2phJFVJ1iCJD0yr+OZ3nQ5oSRRdisVm/now+iu36
	uunZgInULpJz0kvbSYWytPcBF2KkRC2j4Tm9Vl5OEf5H8J4epnnQEtNLimkH65WKvLCBVCN5Zxr
	HtXh20wcqmyvTE2O4PIQvLhiy
X-Received: by 2002:a05:7301:4591:b0:2ba:75f5:72cd with SMTP id
 5a478bee46e88-2baba129259mr5952861eec.9.1771541750839; Thu, 19 Feb 2026
 14:55:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
 <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
In-Reply-To: <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 23:55:38 +0100
X-Gm-Features: AaiRm50FqOS1dTWgKs-rY8pjqDvqyuBoJm6Fgf3-4VuQIwJo2BUnXmDIAOZ9-c8
Message-ID: 
 <CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WNLFIADAYMFJVNZUPG5LHAM77Y63MYR6
X-Message-ID-Hash: WNLFIADAYMFJVNZUPG5LHAM77Y63MYR6
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WNLFIADAYMFJVNZUPG5LHAM77Y63MYR6/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 19, 2026 at 8:29=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I think let us see how it goes and how much is the volume? If it is
> light then I/we could send you a pull request from personal kernel.org
> repository, if not then we can set up a branch at that time. What do
> you think?

If it is very light, then we could just do Acked-bys, but setting up a
branch is easy:

  https://github.com/Rust-for-Linux/linux/tree/ffi-next

Please feel free to use it (if so, please let me know your GitHub
handle -- I already have Alexandre's); otherwise, we can delete it.

Having all branches in the same place is good for others to have a
single place to look into, and has the advantage of being able to add
it there as a `T:` field already.

Thanks!

Cheers,
Miguel
