Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5894EC88E65
	for <nouveau@archiver.kernel.org>; Sun, 13 Sep 2026 13:21:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3178710E8FE;
	Sun, 13 Sep 2026 13:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aDgmG2KJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B0A6647D99;
	Sun, 13 Sep 2026 13:03:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789304618;
 b=z6TGsdOnaPPJfNGns5UHrCz+w94x9gQW3isYRAvOm4G2h769VLcRos/quDBw8Cz5ePfe7
 Av4xJwg2DyAjos2mqOxIqCf2gGecSHHby7xvcS6v/Ip0ngqx8YtNgfWJJbtaBzWqi71to7e
 RJWomozKrbxokvHkeTP0+HcU9O8xnaPVmCNd/NVpy7Y6Ge2phsKwbH4UvUl64cgyc4f5aCG
 GqiIjl5v7fzIV6oGxCmwJ8Y8Ed9JcHmDQzRHMVZar/bAuh9o/QJE3PpN9EeHuZI7w3XNp9n
 cZYQ8FjDic9JwkvEL+DMgBtNtOuyf0J5ZWtGvVf9cmLXLFQQXUifYWhbgQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789304618; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HhWhTVqsOkpUdCAWPzbi+pVqLfh+oq55gUD464xfMJg=;
 b=mHoa7S91K1y8ttHGr69tK6X61n07mu2yRfsUdsY3yMsZ8nq9+H4PmLFGhZTj3JZOmBPfV
 Rnco3MqpZzYO/g7VpLZT5XLQoOhofLJYuqrLyKwsK6jh64RNQoxJcziJRK8sGpqisp9cLT1
 Ee0k+pDNBRym+ca1z/hkquc3/f/zuJBTcuZ4o4CuWaZZkgx6w1RzSlHQ/bI2xWdG6y1sKnG
 amvyuaNovFuiOCS/f3+S24m1u3xnNTnAXhDQcoWWPUUKu8/6zCy8xuioxfFxzgvxFbC1iTp
 Sf/35qr/yfeZTTQpYxFQaqIFvBUh++jutdHCXpZH4ltWLeu94toG1NhLukFA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F22840794
	for <nouveau@lists.freedesktop.org>; Sat, 12 Sep 2026 21:27:25 +0000 (UTC)
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2AD10E4E7
	for <nouveau@lists.freedesktop.org>; Sat, 12 Sep 2026 21:44:52 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-46ac530b9ebso1602508fac.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 12 Sep 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789249491; x=1789854291;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhWhTVqsOkpUdCAWPzbi+pVqLfh+oq55gUD464xfMJg=;
        b=aDgmG2KJgQJPny+eUB7SAixSHYBcVZYRNf9EAB6fiCpFSQSogGkFKG6pMt2F+ABlZc
         281oCas7SmDStyb6jOPzfArMgUK7DEGoAYJFtVCKLTPsPZPlwnkYGcK7/8z6Be43mz/R
         MCaSFVLQkT31E4p70fztAhtz4Jbvl6bZnBQ25lKhoWiZSAcV4C1bMhByrRtTd/Cc3Dg/
         xaebXUPIx6ErKqg0p+4uzG3JHAAF+/S8XVloSuF2Gu66NbiwZeY6Bu7hiPvDmLxuCWX+
         rz3bp97F5VM1TW+c8ED+/YTNcsScaExZK+Cqmlr2XJqUsUFLNajrH/skBrLYBK6TE/kb
         MqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789249491; x=1789854291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhWhTVqsOkpUdCAWPzbi+pVqLfh+oq55gUD464xfMJg=;
        b=sKyfoytC0AZ61V5Dr/pYyhhWXEmvqPu5aGPJT/gItDP/GEWiQG8vPYedGpLEZgp4N7
         6J2MPmbmQl588MM1XRrrLSdshAhXoeWYVTkWv4+O7iSv4O5oliRxhi6jCqBm+4aAqIMd
         zaiLmmQBwFGrTvXXSaJbirUP4L/pIMEBOaQc86q7R1EhANR9lICwksDRVfFno/3BNu3r
         wqANKGiWzjMAbzz0xUJFIXWXS8J1sBAZPm10b5mpaXo9Y+l8UYQaV4xic4rLeysOegov
         xgwz5rQRl/1XVa7lk/QkQ4TP9RKUYdqJvQ4kkmJsDeFDadbuddH19d1e/hnVg9PzBop2
         wDnw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzhNx533rb5MARAf0KN6WV5hzC2Jy074p+TnIwvjQSQDUOvR6jaDMAzcDwAzcIRroSlmmf5w3uj@lists.freedesktop.org
X-Gm-Message-State: AFuF++klsLw8tqGwq0ToRBC4f99AIXc5WNK5ZLnp8cfUY3DYx36IzGIl
	7HZNa5jepUQRauwEjeVG8Y12YWnT7jPAHt5Yr3lxrmuZKrjOrsf2rYqVwxbssqMWvEw=
X-Gm-Gg: AYBFou2eo0KA6/lznGiATnqxHbvv1KmUZzqyvwAZdSqSVlxIAotWJF7E4sVzPNWXI4O
	Rs/fOd6pn/KF12BYnr+cVr0Z/I0cwAHupDlkNONcvyKtsw1amAqQ438CPRvtDXyA67feLXwv6+T
	9x8v18JE77yRkNdJZZ3ihuA6tcivOL2o+yCPscoetliK/yob/RD4QIQpZHYx3bECuOvYDyd9WTX
	nVhSgSrhg92l8soXXFNsA/KEYdgDuiYdldSCPQWHrvjaWCPRXyRb1MVfrV8JAPgqJInnpjJE2Eo
	jVdx2pLOZLbLPUUDzNx+PWWfJdfDWoR3Ax2bzlbhRaLP3mQB3L85sk/Q+sTZl2jTAujAQBhqUXG
	H9f3ZKrpFAJrzmvUbXQ14y+GCQutm9Jh4Z938B4LUL2bDpH1KqxzPIhebfy5osZzm+1TG6f+rky
	JtqskxOe28OmowkQqzRxA+YU8msb4nROJGbSSRZMfCGMT3a2ANuJb7+G/VC9Lf7VfNI+relndXR
	tFAS7AdiqaTUfyp6DO9jRo8Cg0=
X-Received: by 2002:a05:6870:e89:b0:469:fb8a:b5b0 with SMTP id
 586e51a60fabf-47c978e0ae3mr8164063fac.9.1789249491570;
        Sat, 12 Sep 2026 14:44:51 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::c389? ([2600:8804:5716:d800::c389])
        by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-47df42b4699sm6246514fac.0.2026.09.12.14.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 14:44:50 -0700 (PDT)
Message-ID: <688b15d1-a85b-492e-ba1e-b4da548ebd06@gmail.com>
Date: Sat, 12 Sep 2026 16:44:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pci: Add broken-GPE quirk for Lenovo Legion 16APH8 and
 16AHP9 Nvidia GPUs
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
References: <20260821200607.621341-1-lyude@redhat.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260821200607.621341-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ryanbrue.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: VVDRS5OY7YAGBRP2XKQHKULV3R3CF7GK
X-Message-ID-Hash: VVDRS5OY7YAGBRP2XKQHKULV3R3CF7GK
X-Mailman-Approved-At: Sun, 13 Sep 2026 13:03:36 +0000
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VVDRS5OY7YAGBRP2XKQHKULV3R3CF7GK/>
Archived-At: 
 <https://lore.freedesktop.org/688b15d1-a85b-492e-ba1e-b4da548ebd06@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 8/21/26 3:04 PM, Lyude Paul wrote:
> On the Lenovo Legion Slim 5 16APH8 and 16AHP9, the firmware appears to enjoy
> firing a GPE on the parent PCIe port of the nvidia GPU very shortly after the
> GPU enters D3Cold. This means that every time the GPU is runtime suspended,
> ACPI firmware immediately wakes up its parent PCIe port, which then wakes up
> the GPU. Once it falls asleep again, the cycle repeats.
>
> See: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
>
> Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
> nova as well, and it even seems possible for this to happen without any
> driver loaded.
>
> This seems to simply be a bug. Luckily, there is nothing that we actually
> need ACPI wakeup events for on the GPU. Events such as display connector
> hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
> affected by this quirk.
>
> Reported-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Co-authored-by: Ryan Brue <ryanbrue.dev@gmail.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
>
> ---
> V2:
> * Don't forget to actually use parent_adev with acpi_remove_pm_notifier()
> * Check if parent_adev is NULL (could happen if booted with acpi=off), just
>    consider it a no-op if it is.
> * Base the patch off Linux master instead, I based it off drm-misc-next by
>    mistake because I'm too used to working on DRM drivers :).
>
>   drivers/pci/quirks.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
FWIW, this has been tested by me, with positive results, on my Lenovo 
Legion Slim 5 16APH8. Not sure if this warrants a Tested-by trailer 
since I'm a co-author, but just in case.

In the thread [1], we have had another user report positive results on 
their 16AHP9 (note that Lenovo seems to have switched the P and the H 
around for the laptop one generation up for some reason). Said user 
tested on both OpenRM and nouveau on top of kernel 7.1.10.

This means we have tested 16APH8 on nouveau, and 16AHP9 on both OpenRM 
and nouveau.

[1] 
https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905#issuecomment-5444071160 

