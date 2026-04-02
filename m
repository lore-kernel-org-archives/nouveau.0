Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84506D3941D
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 13:07:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC0F810EDEC;
	Thu,  2 Apr 2026 13:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0SSiCxC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3D80E45511;
	Thu,  2 Apr 2026 12:55:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775134554;
 b=sqeFvf3dXffaVF1l3817yWsXFqXiXAjbx0dL9jBGuJHfTUAHDzi0HEWJ47zQxxn63IB3O
 l3ByQHA5P1O1iu5IXdgF26QeUFPE7yva8X+Xr0dBKls1DmQD4wEAHYFOpTKydP9AaePcQ8d
 MZ0pV5JyguAGnWEMQvKGv42MIfHv7J/+ybvdu8cqmzr4+MkZStm+ECzowz+DPcOJwfjRppQ
 TRq08PLnaZwy9uCKquyNIgmH8KX54kFspcQzDNy9H/z5cX1vxTF68V7e/CEsArF1x/prkig
 tm0fDtVmr86ZTUeebDVYU1mj4gygZ+66t7YEzLOq92xd8mkuBFZZQ0+NcPpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775134554; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
 b=TnNO4ngyjB8VchUVP/Ia79TnYzcPJwzG5dt0Dsm68NiX16edY0ZEy7oGudVRg40ih42JP
 7wEKJCD6piGb2s2GiPnTIIGUXzgo91hzOL7NPkeY5KIpK47ZaJdbYrLQkuRMsPUtY97U5sB
 5uBSmOXCV5Dgq9z2bEIlRmCtr7hTNMFEQAMDLbCucnJCLlzBbgFDz+Lhc/P2DjoA7TdnfMJ
 /+oupKhMvMGYuW0etexK63fvLidr9WcKRD+4+ibVvsXKzrNuJZ1CExbYvE/FuOzC+6SvGB3
 LKNWBQyU/8HtAuAS211qbavotBOTDESDQCfD4nUaCmpTFib5hAEfdac4oyRA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 22EFF44FE2
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 12:55:51 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC9710E0E1
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 13:07:15 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-466ec4c6852so470729b6e.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 02 Apr 2026 06:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775135234; cv=none;
        d=google.com; s=arc-20240605;
        b=dT1WhZhrVkVC2ijfIvJxJ35K+gj044Hp1WH+tQ2FT8Mu1T4fqm7CuEvAEgUkFucL87
         3ozx9S1GQx7Vn6gO3wSEij/8iCrEKmhL0PwG/iPbeR17LsRGpl+UT/V9GN1w7TP+2yMW
         hctmz9MwxnQf4DmbWwqmTIUqo7HKHqVjhTt9AzLwUVR7w2O2QoQqd2RL3SB8ur7a7EYj
         ZoyT2QOhLAdme5huDZ6XJm5HNfb0N2gLIlheSLD/m+lm1ADKtdMSVoUXheapFWSxZfe3
         JB96OPxMdMPv09E+1xpi5/JLQ5Ypmip7NVHaBXK1/AEB22Fx5WqlQVGN3ewwtZBY2Ck5
         ziDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        fh=TiNI2R/ENuWZhrHOb9BJgcJP1+1e60P85mDMpvcQSII=;
        b=H91iKuYedPg3kAf6e9DwvC0weFaYu+W/8F9YW5PYL/wFEV/KOcaNAgwkxsfu4aK14X
         VnICcw6jSl/Svh5P1xjHMol8o45PeaQIpOObpL1HljBQVnyWO02wkwhyTHOtTFDb09iv
         iIfRDDO5wan4ZXtyDf6fjw7/uy1GRQs962ytI20Wd5kfyRgRjQrI5EMyBAbberl9DBd7
         Z+7Ia2PcG1uJS2qqQsUJUICwVAqTBvItX464Fo8QMSgf6n2aAwxDFlkgIwbuHDcKhdzf
         UERh1N/abMkFOaY3ZstLkaQ7ecg+252i0d/Pdy8QvCTSBsFxiwTFipfhCTjXqGrn/Nkz
         6BvQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135234; x=1775740034;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        b=S0SSiCxC+hiJUiyFlnqYBHaJaVZGMeR7yPg9xwYvAyycMGVGIlKHG3Nfw4elAquHcb
         IIDzr5QB3WS1HB1RnUZKK93Rhoas70Z7cmV8r/+73zYNAq4tw0ff2j9+ORRUALR/qp9I
         3ts/c5CeZiExqaigaDgAno6FWJp/AaPDJ9I+X9yFzjKLGBXyeydeuTSrfOpD3z5fahbe
         vy+7BDESttTCuD8zbctso8jr94FPz5VLykHh3gD0ewaaJCdNxxnr3tB36qdh4tNGfO8N
         T+dYwaTGW83LJpRxuKgiSLilPc1dTOUdGRDL2GqHH7tX38j+i8UUvvIIo5aPTBQjT6ga
         t+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135234; x=1775740034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJm+/KwpubpFegqM8noY94L9QqWDenfEO5ppnUMAS9o=;
        b=kJxwTRtQRM+hx7neTX1Pmx3orA+aVqwydkgg/NfxsFWFMAOFUdLS6AawKX+ImSaQ/R
         oMZuqLhujmh1GWwcYEhaCdyZEpQjhYILzu8NiJIVQdNCVUzoAtrBLwt+1cIyE2vDPqoD
         ESLdbfNYznNp5NHnJVzEr9iwXz6E9zVqZHG8Hms8NXyNnfdAxRzZdTLEZbPZKIvzxsny
         WhjEpJJatfybSWM2HBnWoR6VAAcEP/+gJWrIoKqa9SSYoxn3EC+S4bJLiHTKVuYIVf47
         Ua+x8D6YQHVNTLOKEVBQyblQBxlSLJYhQnixWbO9Qft2XNFlNSx2MKcONNcc51PEZxLE
         /t3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3QstPG8fb/gaZAwjT3Js93qaOY5Gy236fP1J2kbvFfZH2pc+DRvABQ6j04Zf+zup90yxhvlgh@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv2GBolsrIQSgvrN/F6z728nLsacfla/tPotoFbAkCtCRw6Jyg
	ACFFQI/ZdcZDDQpYDO3vLF3VUSJHcpOKBA3HJROzHCCBAhWv+Wj9FE7ALXUIIYWcXLFOztsjY3u
	oWT0hzfXQRoPkasgHUxL94wX2r49Vwnc=
X-Gm-Gg: ATEYQzznxLk7mCvhF27jkshMkYmzvW/hGhQw60p2NRWoHiJeeKOXE+aSj+Q7mV6rYbX
	KAndyOuaUchVn/QwgwklzvSuy862Yh79wMM/vMcQ/kr1URgQXglebNSCBN3L07skLECOxHh6TVk
	PCZxCnvQd5M7Sx7TahbV9TV4gpEMnoDFT5f6F0cG5dj1rPyMt52hjgEUHKZiyUF9QK5pZaOOPIH
	aDEQFn+FJYjEHaNZXBFA5FMOnfsGsYPvRzJx+K/IuxCmq+yJayiQ+0AGlJqtV9LVGD4Ao8x77w1
	gTrvl8M=
X-Received: by 2002:a05:6808:1453:b0:467:2e8a:8c6f with SMTP id
 5614622812f47-46ae02246e6mr3682069b6e.54.1775135234354; Thu, 02 Apr 2026
 06:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com> <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
 <DH939HK0611M.22A8T9BJ3NG8@gmail.com> <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
In-Reply-To: <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 13:07:03 +0000
X-Gm-Features: AQROBzCNDuLTNS5vepK0tiGK0rHJ2YWUZ-f9bPw71oBdVgewCSJNEGDn2F_SNZ8
Message-ID: 
 <CA+tqQ4Ko2n0dnEx50LGbTBT9rQzXq1yToMw05xd+S324ZQBbiQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KJD6Z4AHNFXMJIMDBHENMUQHLU2BDEG7
X-Message-ID-Hash: KJD6Z4AHNFXMJIMDBHENMUQHLU2BDEG7
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KJD6Z4AHNFXMJIMDBHENMUQHLU2BDEG7/>
Archived-At: 
 <https://lore.freedesktop.org/CA+tqQ4Ko2n0dnEx50LGbTBT9rQzXq1yToMw05xd+S324ZQBbiQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 1, 2026 at 5:19=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
[...]
> Thanks, I could rebase my nova-core branch on top of it successfully.

Thanks for confirming!

> Can you send a new version (maybe incorporating the `from` helper
> attribute I suggested) to the list for review, and hopefully merging for
> the next cycle?

I've been caught up with some personal commitments, so I can't guarantee,
but I'll take a look at your suggestion and try to send it within this week=
.

Best regards,
Jesung
