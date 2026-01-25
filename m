Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2FFE63CBF
	for <nouveau@archiver.kernel.org>; Sun, 25 Jan 2026 19:17:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19DCB10E385;
	Sun, 25 Jan 2026 19:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RbuF955C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 03AF840AA0;
	Sun, 25 Jan 2026 19:08:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769368089;
 b=0ZAl+Lskj7c3z+rqAfl0otxGkaT+l0SPIRTt7j46QubJ20ulaf1NZ6JYfFqf/22hCCDld
 yoqY2V4UIZeu3WSWFpdH7QPcYiij/SBYvYpCkxkyqaZ1pQigZ0KxyS0hgfx4y4AaCxjtkMD
 lcrcWbcBujWvdnKc7X4NLpnIKwgv/z+cOILBfQXaO8AiyWyD2cgCiXvYcwSMQrBO0LG3PdH
 n4PvuvFaO2nEypy9gY8e3qmZ+fF15SOg6wBJtXv4d2LeGux0K209+NUsrVnaPveSPTbudmb
 7VIFv0tE+DkxdBBXNq0ckYK5wXUi+LZywId6Vb/ZdGQvusWxAtlWE5vJxKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769368089; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
 b=wNgdOPqwns1xcUXt7LVbD7oFUVGvNYkx9mQT3R65tzQweWh5hE49QhxSiwFiANLTj25fU
 4bxHfskX08Oev9iguI5ruyJB88nHYRjWYMLpCSlIJrcykXiav/i7zhCMCR1UXdc+dyXcEvT
 DBVG/PpXni7nseKr52g6iF3OBBRDjRu8MdlcJn9/jfjoCXKTKuPZVHCZsbIEhfOzprW1w9G
 /T5t3q3N9oTMejv4FVyKhJMMze8F1myngpvQRwtUpEGUeZ0gx02YTFT7BtrJe1ZMLXYEx1m
 GTqwV03KY8x9FyXlgQJMM0AHYN+NXou+SdhF2261H13WUSF1I1XsrnxbrX3g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 461114031A
	for <nouveau@lists.freedesktop.org>; Sun, 25 Jan 2026 09:00:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B39410E11F
	for <nouveau@lists.freedesktop.org>; Sun, 25 Jan 2026 09:09:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so1948212f8f.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 25 Jan 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769332162; x=1769936962;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
        b=RbuF955CanD0TYKKjC+hXyjJekWDNhMIocquOIzKYpvh1whyF/+RIdfr13H9Nh5vPH
         v8jlgBRn4kgyNHJBP3GSrNpOkauPq3+fu5gizVU6gPqK0lsI6gO2UfBC0nNit2RrzuRS
         Z1B4k7JNf+DP6ReEIxYE5xVM9+zg36wTCuhg7yUcBK+3Jj1f/VWNiEw9jxi53ebIaiZr
         IJNfWeBsmzTunEdWvqjwJtH31V5e6l6DSd1OFaM7Dpx1ntfbtHewDsRuSCdhgJ0TOH4v
         xvOCUyFSC060cQeLs7l+iYyn4AlaLxiCddt7oOg5x+21Ji9f7L+hw8pz1lgodlHTjbTr
         FUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769332162; x=1769936962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31O2eYXcVuLapO5Zw/zgNNvFpdLcpA1gw2dP7RI+fXE=;
        b=PgyXYeRvai3CDUZpjagy/+FajL8hPyxYFPQJ7POu+0Q3JK/7FqYbJ8B42c/vfmzJtR
         5JnrjkOKrHUXm6dBYoPHhA1wfIduUrTxqaI+Ih2jZraMcLl32RyCLHRBdFkcZ7a+zF7j
         bYH9xu38A0u+dajMdUqGskmLIEqSRcaqs4aZOyA2+7BJOp/j3Us9bXNCy2j//SoFwm8P
         tqg/nTTebzGGKzWzlhJmNVZzs1sp7mHi0gNXrNVixoK4ZZS7HUBQgjyiD+sMmGq3GkTC
         gExH1KAoq4SkfDHYvBJYNJZuas1vJ27X0u06pvF6CnTRI8P+eV6+C4ihSvVlWylVbKie
         /H0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV4CC02KJ4VREXwwZmmA7fA3Jh6zOmDnBBEk5OFEmiVv/F2voYeXRW9RWAxX0Zx42w/H8V9C4C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUJ+brLjsQa162MA1/MQNco6HL3m0Vcx4BEFVA8nKm6YRwdhoA
	KlQHmHcZhufoXPZMyPrXr7uDGJZGwxBw7IcOoEr6S+0ztL//rchz0vEi
X-Gm-Gg: AZuq6aItkGjaX5gMtUHSyvGHDFmW4j8suFLVGR8Hz4WP42Dpg0Ysd1rfRQxsZE6sWgV
	q34zyXzN0A/TuL/50NrGS+aDTo1bFwe59M9igQGRvO7Q3Sn/PEz1KGWVurMfTnV9vPPeHbwsj7E
	oPFRmM00h5lJNEAGKXmr6YaLYLAmYmSlT+RLKmp6GO+1HYgjBUyVNDgraZp7iqQ8d4NgwlHZnCs
	6YVbikDY2FTWpiGKiaq0z4ev7YnyEzUC3FmbvXZvK5EW3tjbu1PJCWF669AgRNCuDrq1RLuRLwx
	KNiDKy7DQm5jwmxdxwRmlo58pijW4ToGaMgeCY3rPXUpXW4JKEfy1DCO7LRA3B/+qGI20tGF3If
	qGOVQEMmi62OAL3k1vEMw3cESbOftHXGDq6XCj3pqoICoAWrjgp8ljr3/5Tqb53hhDxBuNH83U/
	Sy0vMxs/wadeU/g05n/eqZLbddGQL29hkGKPKF/HoI2m76WpZou36B2w3//m+6AwwYiQguEATwV
	07PNXdBcSSCF7fCQsIDvmDo9UMRzbGpzGkOEI+9rmA=
X-Received: by 2002:a05:600c:c04b:10b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-4805dd3722bmr10472735e9.15.1769332162004;
        Sun, 25 Jan 2026 01:09:22 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01?
 (p200300dfbf2de300e4b8a0eff9fc0d01.dip0.t-ipconnect.de.
 [2003:df:bf2d:e300:e4b8:a0ef:f9fc:d01])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48046fba46dsm263939945e9.0.2026.01.25.01.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 01:09:21 -0800 (PST)
Message-ID: <8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com>
Date: Sun, 25 Jan 2026 10:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
 <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260124231830.3088323-2-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: dirk.behme@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 63U5WGBNTIP2HZ5EWUHHML2GKEWLZXND
X-Message-ID-Hash: 63U5WGBNTIP2HZ5EWUHHML2GKEWLZXND
X-Mailman-Approved-At: Sun, 25 Jan 2026 19:08:08 +0000
CC: Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/63U5WGBNTIP2HZ5EWUHHML2GKEWLZXND/>
Archived-At: 
 <https://lore.freedesktop.org/8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Joel,

On 25.01.26 00:18, Joel Fernandes wrote:
> Use checked_add() and checked_mul() when computing offsets from
> firmware-provided values in new_fwsec().
> 
> Without checked arithmetic, corrupt firmware could cause integer overflow. The
> danger is not just wrapping to a huge value, but potentially wrapping to a
> small plausible offset that passes validation yet accesses entirely wrong data,
> causing silent corruption or security issues.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index a8ec08a500ac..1a91bbbce3d5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -46,10 +46,7 @@
...
> @@ -356,8 +362,12 @@ pub(crate) fn new(
>          // Patch signature if needed.
>          let desc = bios.fwsec_image().header()?;
>          let ucode_signed = if desc.signature_count() != 0 {
> -            let sig_base_img =
> -                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
> +            // Compute sig_base_img = desc.imem_load_size + desc.pkc_data_offset.

Nit: Drop `desc.` to make it consistent with the other comments.

Best regards

Dirk
