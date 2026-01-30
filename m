Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1736D49C9B
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 10:27:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3E310E992;
	Fri, 30 Jan 2026 10:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JBFBwCwo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F367D40F37;
	Fri, 30 Jan 2026 10:17:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769768273;
 b=hgfpamEH7od2W8ltEQ6uka0yKQdUfoPpUVXjVbJ1BPcpDjoK/Ff46z/9hRbh/ybYdv582
 0FYEyuy0vmzSRlUIy0j8R8IffeCLwjVMzTX59ndD+kTgKEE3Uh9v/XOpKkKLkitxnsFuxE7
 j2IsN/Aju0GHoAJDJ8OU5RyVPKGXg8TRo8xosLWkEzDUWakgmUR4ku63/5WPiCcM/TuX9cC
 DY50crAyVp41E7QdrczdYYYX53eNq5j6DynkOTZosBl9y/zmRfi/RzZoSA4njmtbl9K1ozm
 IvVo2SrQ41EBlpfcOuIdzSqk7JLDogsIRJxwTMPiu3ozWIkUZEgH+SrLWt8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769768273; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
 b=Km0cJXAqw5sJBs/xF/i6sLYJ76Ys/1WSDre96d9z6GyrAY/71OiAohBgvQ0vUp2Uwo+ND
 iMVFuRY0/EQrdTCmAL5U0wQ8P2g9r7qV9CBKDGRzroy+IrPNv/vFndZg/fgMaUivZwyaU20
 ScEGOa6AB2x6cUHVF/EOJUDxHaZRZ9R20Sz306lgnth0mwWKjzK75SNRcPzEeRu1qfFnGXw
 NzK+1pMQMf0IZC0qEd7RyZcu/z+6FL4DK91Ow2CKr4/l1hneJlyBlCMeupWygPkf77sHo4M
 W43SP3tmT3lMiYC5NO91FNxiuavi1AgWKStB8C7hdz4G+aQtdW9IA+jRLhGw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C22440805
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:17:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 679C510E11F
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:26:57 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4359a302794so1365636f8f.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 02:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769768816; cv=none;
        d=google.com; s=arc-20240605;
        b=etl3r8IzRLkDovbylPURxGJCty/wV/9eEMkYVPl6lupOqI2t1PSTW5BTHhHNct5Uqa
         OZo2j7rMLk2QWL99LtQAefcoVr5eejLzQQrasyPh0Lq2FvCNeMA+FPapKKQv6grLk/K/
         h4aBjBH8XKfEwbsQvwqgU9vIcJdMWth+uJDOEew5gQbZNecr91vpGI1fyWpF2sfQrJaP
         j66NxW/DeQ7ZTh3NLu9ZeFXQ0rcK489ZAQMCVaDeC0stS5Rw2BDmZu/lSqmsCFlVlWeX
         SS19/4TLoTwcT2V7tk2wLN7crUWXjeZAKt445hnuWQeMBIC9J1JV8pKmQGDBUIV4MV8b
         yCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        fh=vdIJ1TkUyKHjBesT2q4b3Cp9634H7hEVYyU5YYxpuCY=;
        b=LPZj0PeCivke3hTs1J3vwY7TzBDjsxTJI35ohi6WN2M3F/HjVfaddYYtCXFizVkUJl
         kdDP8yeGuoDMjeUCjGil4XuB8KH9hSHZFDtShP0VKf04Gd+2LpPy8AfNKX0JDFnCEPpC
         IFOK1AWq7d3AC2DWCEgbxRYY5Sd0XqBfbOdEPOq6NOl48zEVmyNMivuB5vYbpnM5jIaa
         31TLvwaBHAOYREVJjUtRbghf4O5afvmtYEDt5CD+jx/emnLZi/opTPSsW4M5RYqxpq9Q
         LFXvvzVaF0VT3YORuu9eGkfbgOy8Ig45UqDuLRqgwl3PBIuUU1hJxie+wkZXqO+g4Gho
         h9VQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769768816; x=1770373616;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=JBFBwCwoSkbW44P4vncIjZO9PvWgonRi3cQ6qZ5wjikqD8m0wb3zkur2FvPr8Ray24
         SifpHrfS0b3+dZ1LLTTKhCAJwYOBQG7wIYP1gVE7Y2rjZvVantuEHNbCPThFwlLgU/7b
         st83OMHDVrM8RJZDsYzLZxsM9aU42mY9hQPkxaQp/jM0ORp1rVgcuCnBZArdqhnPfsai
         4q9iArC/5pUeoRviYbJyjp2ZZxTh/lc03ZjXr4LJkwFcqk9oM8AbPGWS92nRo+pPi1ci
         VhdasCWynfIhv0u6nO1UrPFwqVkJRwVEh/PRAQxP8CrLvannxYupDBsiL1E4HIyoDntZ
         bZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768816; x=1770373616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=vB0Cs1E77Q1T0j3IQVSOzg7BDzmNZz9hVtJJyVMebUONHypz/SY8DqmqT9cnJEFYoy
         OgbrSI1MsPuyFjXWBIieNPKqz3w+eKA8I8ReTBcSpuRHMKfE59/6JEfAJDdFyHTZtNEM
         z1oA05PC4k+TXsGPLVEUOUFX3omxTkmax3AGIh99EF5dTXD8gD9uP9R5K2pOel45emm0
         N9PqPF+rpPmMPWZpOMj+AyIh4OJK+6tztsJQHzmI6NkfXePgaZT8F+2OgOfojlJn++DC
         /aPF7Wr713zb/Ju2PBvXjIEAkd/z7pU1Td53naHm7dHglCEj+6MBsHDL4mnEuHOGB3gb
         rliw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi2YYTEPcdkhPGsrxkd/Nu+h94BE4iT4KqXoSlw5pZgovhhB/goXQO2sCXrI68enNCOWFuA+L0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZVryUNWqD4K0bu37sdrteoVijaY1MsNgsbBhOTYpM6o6OPVAX
	T+O/VJ9cbqmu3WgAIDjpMYVemTUfek9SdnPk2iBIwuvfKXeERaXAI/enwohy16oSW00safVhNDh
	jes7l8dS54WhjThvlUENP75rj9iSFQkQuo3pQ9oZC
X-Gm-Gg: AZuq6aJsLKlHXYm4yxDIaaZ4Mpqhn6OmxiTmH0NVQzN5ys6vLqRBKqQHVCP3AAj8VP6
	i7T2uXf9X2a1KbAzQvApUquSWNX8K91MYQ8sXFiXX1YvM+UM1TiZ3R7LQHGtHxnwoRYBnsF9yfk
	WhN6K0J4IjGvXm2mhrcJXaHNv9AxEJcXQkW+sayjMhgQcJNjCPU/4SKgbfoiE6Gf1PcCCbwATSz
	Ob4xdi00mx5vrSHJnrJ3UCiQ76llay26ewJZpXrzvAvHDt69iz9zbTj5OYGefWfN3OHZTjDmWM9
	nb06F91HoJrekqR8RmQEMSZZyA==
X-Received: by 2002:a05:6000:144a:b0:432:8504:a383 with SMTP id
 ffacd0b85a97d-435f3ab53cfmr3434365f8f.45.1769768815664; Fri, 30 Jan 2026
 02:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 30 Jan 2026 11:26:44 +0100
X-Gm-Features: AZwV_QjIZnbbm9xp8XOB5ABAESxw5YmRd900W4CPJMrijbzi9HEw_BSq-MEG1sk
Message-ID: 
 <CAH5fLggBd6s5MooGPfUaoarNF651BjTyBt+KcuJc0zdx5xg7cg@mail.gmail.com>
Subject: Re: [PATCH 6/9] rust: dma: add dma_read! and dma_write! macros
To: Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3XZSQK3U6K7D5L5DGXSPTCDJW5M5PE3D
X-Message-ID-Hash: 3XZSQK3U6K7D5L5DGXSPTCDJW5M5PE3D
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3XZSQK3U6K7D5L5DGXSPTCDJW5M5PE3D/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLggBd6s5MooGPfUaoarNF651BjTyBt+KcuJc0zdx5xg7cg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jan 30, 2026 at 9:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add dma_read! and dma_write! macros using the new infallible methods
> on CoherentArray.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/dma.rs | 103 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index e4bca7a18ac1..f3920f74583a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -811,6 +811,24 @@ pub unsafe fn as_slice_mut<const OFFSET: usize, cons=
t COUNT: usize>(&mut self) -
>              )
>          };
>      }
> +
> +    /// Returns a pointer to an element from the region with bounds chec=
king. `OFFSET` is in
> +    /// units of `T`, not the number of bytes.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_read`]=
 and [`dma_write`] macros.
> +    #[doc(hidden)]
> +    pub fn ptr_at<const OFFSET: usize>(&self) -> *mut T {
> +        build_assert!(
> +            OFFSET < N,
> +            "Index out of bounds when accessing CoherentArray"
> +        );

This build assert does not depend on runtime values, so it can be
written as a const block:
const { assert!(OFFSET < N, "Index out of bounds when accessing
CoherentArray"); }

Alice
