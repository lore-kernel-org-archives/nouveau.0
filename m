Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9CEFD88C1
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 22:05:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5B71F10E78F;
	Tue, 10 Mar 2026 22:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jg6zR1DT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15BE44502D;
	Tue, 10 Mar 2026 21:55:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773179723;
 b=OCf4eRn4YrqBfnzD/MyNMYH4qQG+TQS1In49cL60OLUNKLCV8jRnmegIiLvmyUJyn3ML3
 p2z/NBQ7p/+CdUvl/rGeMt75xh9AVq6/rD36lYhc6UEQO8/TccUVdcE2uBBItEIOFMIDT7y
 YR0zy5w16/DW9NjD9E72JMR+NHcAcikgMrZq2eV8Lkmag64kaBfvEUgRz1QNPKT5quwQMjT
 CddXHXysXSj7QfQv5CjV3qb4tGka1Jlo0uSqgWrtG9NhJpHvdSLUznmntReqKGHOpDBBhqw
 PIq6QaTyKRjss85FgpVTWMld08plrDpGQvRCfqqApA9NfeWxdqQ5JXDRp3Bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773179723; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
 b=BXBVtFRtaeDQS0VpAfuZluuUSKHqupAM7Qm6U72JV5zVyAguDjYD2Db0FZlvkIe8dmRK5
 sTjv9KJyt0fGYkuKctBPzPvpDBUcM63Ue8I8RN/G2CWOUHk82b7LKBvIJnpJqh2YTQivGhn
 iF+h8tTQYhWZ/+j48N+QKNG6Q+J3Rr+1Ek1MdZoK7efT9atIhQVnzxMVDf9+pXe2q1DQGQA
 4CUO5Qrn0zI4d07kCCGsPGbE/eqEUh4J6uHX98q8Atbk+U/wLsxTlLxRawc9hvdIBdgQl/2
 TADhO3/yKmqhM6MtIp9M4ZVybqk3kenAg4pL8mN76h65MwSj91F0qu1rKDcA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=google.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C596944F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 21:55:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B698810E2C6
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 22:05:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso9296310f8f.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 10 Mar 2026 15:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773180353; cv=none;
        d=google.com; s=arc-20240605;
        b=UR5rtrRHM6n/8qEvuAQBbqYO+cOOSQYufYvRO8VOwRveglf4pfdbee5ukhPRiPbXHx
         ipavTGFIpjj3f1ijt1oZKoOyDA8STq+kbT0rVJtc/9UeehdXm6iuXqZTHo6bUbt83pSJ
         3vcQJOzEuSNHXZXKLu7VktqReW1NNDs4UA1fzN29lxw+Gh9D/G2GXHjDkRWTBbyt7NoS
         dhvgOB/xkDJSbGv1amiPtELUJjZ/TK6XrFUTf0BNPujP9AxZoLyNt3Ak/5q52eSlD4Ju
         bjApXHGTyKx4j5Js55AyNvJvVEoRHTNOY9PBguBZLHb/kdpDNgwo0ayuLFh9AnvOamTO
         MtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        fh=8l9SIPHR91uM+XVhMZV4QTQenSXzUr28E3NlaqQZC+Q=;
        b=alVGBWiACzSC7lJdiEAFEI5j62wsnHaPEICkHPoE3EB0ABkn6Wo2MFysYTx1M8ASfV
         EuoW6FDsF7PL0JfEiWUtpJd2g7WBvJn/eFJJliNoJyKdMBge5zdTIy4j/9ar8WIgXxiM
         iEBNAtvoiTGQu6RR0pZDfH8MtcxPblJYmBQREWg4g1+VvWEh9IcBZfAYPksKi/4axvbq
         OVru3aOUce8hxfuIriH44KriXhnBVrMV5TSjUE8FaGj/ovfGdf6gLGjfHTrgdEBg1dL0
         YZy06TYok3EudVpkz8XlwS4EC9WvAkwEqQHYLHWo3P7hIESmkMvup2cDS8dGzxY7tYws
         8JEA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773180353; x=1773785153;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        b=jg6zR1DT657ocK82u78kOG0zDvWCjMlC/goaNi+c14gRvCmg+ahM9N61LDCcvlr+Ra
         GNQ+52ZLKCUEp51XCX9LyUoWMcCniwxNiUkSJhnBJgCaOEBN5EY1WEZf4TH1sbzh2cxh
         OOffSNXf9cJZeiEKIjRSmA+OS9OL7D12e5M65Sm9oZA7ssExcDmtuV5u0UZ1bvXv6vpn
         5QCZqYPBeo8zSJwEacio/w2cKXlNOQzX6o0k8fW4RhUw1JFcDDx2rhhu/Xh6w69O+4jA
         qjxScNkbGWubAAHYZ0DZ/xA62s8Wwrjb3se1Y8iNzL2ulBkSNuWB0juVqGVOvwx0Vrak
         Z40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180353; x=1773785153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hblvCdCPp1muqLiuiLssybvP2wS4P0sZptlfqiYT1kQ=;
        b=T+Na4P/wcErtJbIp+DOha+d2jKvZFyJ/IWL5MY2f6krFMKFrTomIfCBzflhO/ry3U1
         NkPsvD8kTmOVNW1OYuVbGsmfOTbPX3cDrh+wE2EF/oxPDXrTCzNkHmVAeWg73Kh8OSle
         ACLyk+dtE56ih0ij7/ryi0QrSHy+3EWJ8iMr2GuFqG2dH8+JPxChkhMT0Pf5zeBaqnnj
         wW2bRTbN8CkR1eE0BNdhTTdMYgJ/SLwEMFupe4tG2FOxTXvrjMpYyfUvlf4/ezalxXtW
         DouWjmpO7jWJiDNyeUmnDIWrI2K3xvvdSulmBIJIMASNmcu5ijIC+Kd7jxUhYDmMyIYm
         5O8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT3jlcS45Au1qG+m3wYWvsnlEvP1/rqNcUs6YVT4WGVDvcpu8K2wy+be7s3F9uqBxLCbyk/MVq@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh9WdJ2fboWYoEXuTROboOOqMhPUzq/IgNzKgSkMC7un+/Ai3R
	KrHFoS0QnBEYUNVzA7k6hNHRWQRJGWGl3U4ES5DvHQ3QWFhw9soelFqC5yCp3yDq6BfmcDDYElW
	Zn+UMuhewuJR1yZaeBOF2M9MNoH1qBgAH9iVUPHwd
X-Gm-Gg: ATEYQzxQQT8FeHb0ngfgqu/Nm5azRA51SU98TG2gDp9GNJ1q5WTOb6ZGwFbAtkY9jei
	G7fBDDvAUUk5jHWg1p3OJL28RKGkDm/6MeSl76GzFsjlJGHYq09cHWp7tkFzSvJV7F7Ro37uluk
	b0PH2SuYzKNGDXNVMoewu4g35i51TgtG3e1HqmS1wCAjtb7ZqL+NP4Wp8UOvysKnNCCNrxud/7s
	1L/DEg06s294dY7Nf4zIN+EWiiOc92IO+jTUFo0Aj/cZUQWG4PL0O0Utq9b9FCNOOQMuXOzrRwr
	w4Sqc2+RED6aj0kFcIomPQVOsyR54cugeVpvzg==
X-Received: by 2002:a05:600c:3114:b0:485:4526:ee06 with SMTP id
 5b1f17b1804b1-4854b0bb7dbmr6727395e9.11.1773180352890; Tue, 10 Mar 2026
 15:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-2-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-2-ttabi@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Mar 2026 23:05:40 +0100
X-Gm-Features: AaiRm52vMWD1hUQdoTLBXH731zprYyazaHr2Z67UGYmg14XKa-DqpFKMibMQL2o
Message-ID: 
 <CAH5fLghramRQukqaMyMu_YOnmkDfy1xEOVBwwpEFDxawm5akhQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] rust: device: add device name method
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PCWFELGU3YDS6E5PN2LBTD6SGPZ63SFF
X-Message-ID-Hash: PCWFELGU3YDS6E5PN2LBTD6SGPZ63SFF
X-MailFrom: aliceryhl@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PCWFELGU3YDS6E5PN2LBTD6SGPZ63SFF/>
Archived-At: 
 <https://lore.freedesktop.org/CAH5fLghramRQukqaMyMu_YOnmkDfy1xEOVBwwpEFDxawm5akhQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 10, 2026 at 11:00=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

with below nits fixed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/helpers/device.c |  5 +++++
>  rust/kernel/device.rs | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
> index a8ab931a9bd1..3be4ee590784 100644
> --- a/rust/helpers/device.c
> +++ b/rust/helpers/device.c
> @@ -25,3 +25,8 @@ __rust_helper void rust_helper_dev_set_drvdata(struct d=
evice *dev, void *data)
>  {
>         dev_set_drvdata(dev, data);
>  }
> +
> +__rust_helper const char *rust_helper_dev_name(const struct device *dev)
> +{
> +       return dev_name(dev);
> +}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 94e0548e7687..6be93425fa0b 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -489,6 +489,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_ha=
ndle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> +
> +    /// Returns the name of the device.
> +    ///
> +    /// This is the kobject name of the device, or its initial name if t=
he kobject is not yet
> +    /// available.
> +    pub fn name(&self) -> &CStr {

Missing #[inline]

We want 'strlen' to be inlined into the caller so that it can be optimized.

Alice
