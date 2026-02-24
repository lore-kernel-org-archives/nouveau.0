Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B652F3C9AD
	for <nouveau@archiver.kernel.org>; Tue, 24 Feb 2026 16:11:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3330A10E5DB;
	Tue, 24 Feb 2026 16:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7jIwXi3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 94BBE4382D;
	Tue, 24 Feb 2026 16:01:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771948907;
 b=o+Az7tnlTN1e+efH1HXNvwhY3Vr7c/Qbvgs10eTohltfN8vX/wCbTS80FTZoa1Vx7UQMv
 OFVOPUbCjHUz0XzihILXLlO83sRCUKDAOvxcZexCEMCz1CBEMKIy6cZqWZI5YYN2Ccp3WFK
 aiMdZNgiv8ecF7tUuTPTSBRjgxJWHXak1F5yUAtcHLGhnC+HcMZ2w9JlkkcYMGI7PeHYN+8
 hMmKpe9S6O/nOOdShCiP/ezfw/9yCpl4Zi7i0w4k6IU0BihoSpV07qXBJkfUF2TG/aA6Z0N
 M5wyyEUbtzfNFGcTMb5+SrFBsmq+TGQCqctwLFDgTusuJLD8YZNpgDkjqPqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771948907; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
 b=vvQi0ws86O8BqrZPSG5y43KGcAljWDc2kKMCZSw6UExHAajXNoLRBrjxGChEFTB/SXkw+
 shtkvkeIUTBIyDrkp6yubRZ5W89VGxmwUUfwqJfr1IvPw5kWMqfe6E9QAMPGXMVKTrMSTDx
 lcy7t0dixbEZ6Rk6lzoQlky4okA7Sx6XyGJYbUBz5ySLzAFLWZxVgaXAQNqSCxp/DdnPAF/
 7LbwmxNj1mjmm3pVCMaJv3FDfdyyDY3KzHd0xroWjVrin1OcSOAC4HjVO7iGkVTaFtOBjnx
 uBw01grWd2Zo+i9qp7LvRrEDq3/Z94BrXUuV5eKpLMGqpYzlC+bfh44jBJjw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 843F843493
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 16:01:44 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5385010E5D3
	for <nouveau@lists.freedesktop.org>; Tue, 24 Feb 2026 16:11:45 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2bd801b4078so201534eec.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Feb 2026 08:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771949504; cv=none;
        d=google.com; s=arc-20240605;
        b=clKp9uP39GfGYcHEMDJ8V/E16K/XQYQwYbQfxPyROdMtaSdzvxGZswUk8cGalrZwn9
         SAcvQPsk/zYtKk5gi2YkDoiBv1Puj4/b0N3BMMTZtSDKjd8RKEEUHSs+O4TMrZSNUzzD
         EOAP64ibaV9dcQLH3R7NLAh2UthcsvZ1rgNTFv9fxRIi03pB/g3coqThP8awwWHCZyAa
         kUlTS88y233WLtsqpUHxIuKLjKpdwM7pG7/vGahQl2lF3G0Gddq5iiCFmEfuOEbvw0z+
         Xs6tnU+5Sp/JmuMT3JV00k7zAwi7uCOimiYBXD+0tIclc7VXF28iXnoxgrGtGk/w2DWV
         mC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        fh=uk2tvtg+xvlcTBv2gWjOOXwe/zXJ/V63N4COHyal4Mk=;
        b=diQH39jNq/edXdqdCuvSaNzZwhNvZl25ASwmdSq6nl6OgFwFYs5Iyx8SDVLnwvOtEP
         ElA6C3t2iskO/BpyRTI9IkC4pH/uW3cIAF/0hKlOfpeYQob365aMOLwX60Pnyz2beY9Y
         YEdbzG1W543+ikcd7zgqnW5JhEN5DoFBSonQHePAf1cDqIq8wyPDqVinaMzNc/YuX42Q
         5Pdne733Gm6n5j3bSCEnO6I2NNKFzP8BHlW58qV4WD1w3ZIqp7az1XFmGhirRsdL7EtE
         QNfN4QCCV9r2UZcJR7OLYuZVo2XosVmjPmgEpMSVnGNs4uJRxdT/r+rIOQ9e5CDVVigs
         d+iA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949504; x=1772554304;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        b=B7jIwXi34Wcy7oAbxTMk+nRuhXiKTl9SQeo04BRy5PqU7pT/Zwn13QL8o3/BO6/V20
         aytPKzxERMP0hcjVrRbbMCl033SBtYzexxNKiPBiVni45o/JoyteX5kKZRz1KY9ZQQPt
         e+weRwoFdxIz1PL/qbyoUoigDJsyg5atb6Pw3CJoWKFoXbaR1/5gt9ogCsZPLMsA3ZoD
         zbuiorIrPku1njxG8c0y9mlMpJVyusXe9EklWswq2XCdpgx2tK8pw8JuggjezlzIN4jx
         OcuNkm2btOTPxrxQ8X4uH3tQ2qovAh/cxWs5q/fuAbOM3yvstwmrp4jobn36eGWFs95e
         xdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949504; x=1772554304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jur4r3URtRbpSYoqkV+RmME32+E9scyKj4lZV3ZmeDA=;
        b=WtRAf0kdIOVmWKt20iI26J6YldgXL2hjLpcI76aJX8MiAO7r4W8pWIxSqWkx86DU+2
         zfiVnBwgMqQGaF8Ljnw/1hEDXFJDvyB+mhI99x/3xSa9vnkZooDnSAwZiJ7bYeOjVP4+
         B2hnhMq+CCbZFwyI4iioe0ZTwM9PzmNpbG9QnoDYG9QkHYOvfEV2PFp761Hv18EOEmZ1
         q4E1U9doRR3cCBbfAGVcUksO5Ot4EctoiuSeKusFFy5Lsyn87NqNb6Axr5R8Ud5Sw35M
         qgP94t0sB5EyeFdtfyR0hlLqg0c7BmHHSZXuBEXx4bGxJyVcQshicFdZVkD882LJMX90
         k3Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqaUItfdX27TYJyyYhcPwcEXRJ/AAyklET08gspnD14EdFyuZNvtYoVtJuXSNOk5W6UwpP+Okn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBzTgV/f2shAEy9WreJe9y/aADqULithMirQnEzKX5rUYPtwqB
	+JlYwSyLBCCLSToamdEJeOXU+3OTcdNsq5ze5OjCGDboHWEsXyqfOJUhw7VfZl78NR4X6SE4GOA
	yS+3OrTN+rHc6VTkD6lnWiVne1yLgeM8=
X-Gm-Gg: ATEYQzwR93BxRqeCoaVDdt2MtMELZa3oglODf1jVQxtCJjfjvH2sCUsE5gD9I5VQWfM
	lGJBCRoOj8BjL4mV8xEjcTfB82UU0UsA8aQ4yWS9XQlPotWfClF1G0O/WPpgfpAErnqQjUYTvOO
	iIsR07vyr3HmwQi3VMqRRI+qbI4BDOBjrO+liLCYNYs8PLdZBLsqN3SDsiTv6ePizjuAGP536VR
	4DfCK1oJldbdbmTkIq2Ux89Iz8U9zW1pfC2ko+//j/BoX33fhz+XK7Skbx+Gwm7HGQKJYjveQ9d
	HTTIHYeZn9rlNL9BO0Y8As+ytn5BjBcoWJ92hx3CVi2p55U7G2X/DSM9ogdR4pIj5V4aOkGfFHO
	5ZSZNuUdBUzA0utVt4IforrHOfd74
X-Received: by 2002:a05:7301:d8b:b0:2bd:ab6e:5d44 with SMTP id
 5a478bee46e88-2bdab6e645fmr740559eec.3.1771949504264; Tue, 24 Feb 2026
 08:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
 <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
 <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
In-Reply-To: <7cfaea1a-52aa-43ee-910c-7fa09c7f0f4a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:11:31 +0100
X-Gm-Features: AaiRm504WJbcYujrI1qvWR7vQ77IFqUSflxWGLgVRz2-WrhyZR9I3tHBCXfzaRc
Message-ID: 
 <CANiq72=B_Pyg+yFkEv+wq5JZ_qmvKjEaPXObrLDHo4KYO2H9pg@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CJWKENQCH5RG4BM3P76YDOSGL2CSOZOK
X-Message-ID-Hash: CJWKENQCH5RG4BM3P76YDOSGL2CSOZOK
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CJWKENQCH5RG4BM3P76YDOSGL2CSOZOK/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72=B_Pyg+yFkEv+wq5JZ_qmvKjEaPXObrLDHo4KYO2H9pg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Feb 24, 2026 at 5:00=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Ah fun! Ok, I will add it in in. :)

To clarify further, the reason is that the crates in `rust/` may (and
do) use more features (which still need justification), but the rest
of the kernel is restricted to those in that "allowed" list only.

  https://rust-for-linux.com/unstable-features#usage-in-the-kernel

Cheers,
Miguel
