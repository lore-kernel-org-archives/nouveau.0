Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4196C61DFD
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 05:00:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 933C710E9C5;
	Wed,  2 Sep 2026 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T93IWhY/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3E1AA47DE0;
	Wed,  2 Sep 2026 04:43:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788324233;
 b=rW1z67SlOha6h1+vyR7XkvGPN3/DdJgkFZszt+1xw8IargERYsqKCqE34StlVsWxa2vYW
 6Qp1hmquiwqHMSnnTFjpq9/3LpPrVkJDWoMIrGk+BwCxzwQzMVoiO6jVPenslvj3n+LxF2E
 Of7YtbrEm6cCXdbuztoOnUC7vtoln181sadQbON9sBKd+m5hr5wCpx07FnqDbdwXpjRO2iU
 L2Dz9hEl00CMHXjPJdAvCnWk65yi9A2kN3RFY/iI1GGUi7RQhqpr+8j6AfTYEopBtqe7hB2
 DTp6IC33yIC4TZPwmav+9ymA9lnXANhzq3mMMzgKVuyna1Y+BUn3WXsmBkIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788324233; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
 b=petbbCzXCVqP2BAwg6ylBwSETjl6W+fyZc2Sug88eyQs/OvqXrdVSHRnaz+ysjhLrwUIk
 bAQ1g8rN9D9b1xYjIM+6ZFAcj57978tlOqBVOzovc8QlfthSJbiaJulYIsufQ6hduLN2+Sp
 2nT8c7rclDDEWJ92K+QovotSG1oWtCT1cD7fAsWHkOs9HJnHtzDgLan/99Ds2xwLZQNWN6Z
 3rf95VPuATuIn4bbYkRjTdN9JnVeAYfoEl9MS/8BTJCPQd/QMZffiXKMOmwmUingZO/TgHc
 XPZyY20s1YiTjJzJc9vQK0N5uYz/194WKGsNjt82y1r5SE4v3l8LWiulPsVQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 33BF547DDB
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:43:49 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 09DC710EE14
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 18:03:40 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5b4af730f8aso47778e87.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 01 Sep 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788285818; cv=none;
        d=google.com; s=arc-20260327;
        b=JCijxnFzzZOHFNiFdg+8MBKDz1VHKx4XbKmCWSDfUtTNJRi0AScXaycNDXUUk33axx
         gYbgtIPWIcQXQZ7vjdfcmSPfyTrZbPUKtmXhokfq+ycnVFzAgifRt90hf/sexyk4z7W/
         vzkKn+HYSa9s2gFwHATC/MU0TJleIeF2/LZ9gn4eCXt8cYafXpWz34ZffQKYj9Uw+BwC
         1AYhlwmdhPLaihkUc1nsQdfhTAawlWfzSHnfz+aR/jCMBljYWnEsMUp3qxrM+GkkthAl
         D8P0co4nL6RGduxJzUatleZ1Z9iJ+KLY5UKz21CSt4SbeyI8JEcpfXTFsj0hIfyU5QvL
         M7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        fh=TdeUripKbqn5G4jSWbxUvhZLeilADyWGB1CQFJkNWs8=;
        b=n4wB5llp6g7mjJkhblDnZwCrp0TA7gS5ulH9UmkKIiSAgTDmnaBoGdbUkajsulTgrU
         hslf6gMkBK16ZqEQLOb8AyRqUP7Esa5bdVojFVguaqYglwpYiHPrhRN/4RS5SDqqzHy3
         TLy79QLubm6OfMFovDP3htazVnc5Fz4lr973W+KACLW3s47iwQxH+KTBwAGqG7EtO7/b
         3+Q9dw+/iVN261rE2W2VYT/284iA2+5GUkgmyP0SAPzsOcyQLa+IYVv2yHa5jz+4+nSA
         wIR60IfuRX7a0uvnWRZ7XYo0hsHY1fRal4/QCqr3E+KOXBGhB5I+Yj1Q7AxztDma6sfg
         dODw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788285818; x=1788890618;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        b=T93IWhY/uZeQ/ZOFTAkST/RHh8uav7kM+cS/XQAvuE3ocKnCg6fxGp29IIoSyvpRap
         Mb4jPGQMDEg9vGJRsJzGk0Kwf/bFf2pK4Y7s+tDziZ9RSKQ1TsQqYkZEkqQhkeaVaf3j
         I9rM9Q/GfXCaAf8qFx98OMjnY47sqzsqS5g88KOFWXO1SgI8nhyVSpgkEzPmZ9ERByTD
         +DaeogdBRZsw8EakNH0qoiv5vd1VTtmMemTwbt7HrUZ8aWgY9sP7Stbr8Due1W491CYS
         YBTzttkt/O3XhrZN+U/v4avgN3w1hNAaMySBi95fOAfPuStRdpLjzeFOrQaUWEHBSGGX
         Qw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285818; x=1788890618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        b=aKCZBHVWqY8DpvOh87rMGwTZF9v6VJDwFv+TQizN7JiXabUf0EwWlArsSM/HK6m1GW
         v6SqSo0LIBBsdjagMblrzIc1o3ueNQUz6hQTtQJJguU4ZCNb3GLIVmdibK+QRw4L5poU
         gRVvSs+nm7Rc+vqlUsqfZYqqV9HCssOqmgRLP8e1VjuD78zFcZy63N7eAuuCoTTpzYOy
         wh0L5KIYhVyotwdG6+DpCY7Q6amo6mXWjaPTv+SPpwoee2AE41Ek9WM0nK3Q5aaXJOj0
         dwrx/SJGYPK1Aef5sDiB+sp2KXs0URLtIPoZbOjVeDvoNLa9SGVH2+qnTCd0AqYJ4LAd
         pcVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVu/brQBqcy+zbuVPrDW5hJrkpbe5MY1ZQitmVLE807z4f+AOGgkDinZ+P4exXKxUMx6S9r1x1@lists.freedesktop.org
X-Gm-Message-State: AFuF++miWgHfggBqnIqaQ+/4AfaiRtQ1anqmyyo2uCbMK324ZwFQoMzf
	ta3ADm63d0BD3iV/CQLZwU1SHTkP9f3FRpitBicLJ8iEzu2Mlj1fn/xM2EkNrrl0nIGBeZjNgLS
	gkb2YxbDvqGudztfJocDn19ANLMMMeHM=
X-Gm-Gg: AYBFou0sKBPw9H7/I0VxGfnjabTiss65XRmhrLsPjnPxwWRbfTViMtdVbfB5FDLoGmw
	cTXRQM/6MFNqQeHuyZRfV8hS2x3K43xiICNPC8/dWLGwNdBW2BHx3uJU50sAnilTdX5YTPP+FE1
	yMkmQrfoQqte5WBXE3pk8l1sIrl51CecXXoHzoXN78DRcydSj5W9Ii657sZsmBVIt4xpYl8JDiT
	NcDGSRK3PAw5mCacZgoCJvo6nMDkSUCuWiGYA4cPc8Np0KXVBkVuKyVbg557YHPzTI2Y0OchuCH
	LahIWyB1vm3Wz+XOnf58Lu5GcZZ33XMb0A4isiJ7MPyRm/hi8GAJ8NhR1nhuCSkvyW/F3J0fT6f
	5hyapHFkWDFcXbptlKbq7vp9yZG45pQ==
X-Received: by 2002:a05:6512:244f:b0:5b4:9d34:eb7a with SMTP id
 2adb3069b0e04-5b5e68ec8ddmr10066116e87.12.1788285817744; Tue, 01 Sep 2026
 11:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
 <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
In-Reply-To: <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 1 Sep 2026 13:03:24 -0500
X-Gm-Features: AcwNN1UfFd2C7LhFi9P5RtZmsw7QIyATqmXfPGvR_SqmFvKwrPXswsVPF47uIXE
Message-ID: 
 <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5USGUUNIOMDDTJ4UFJ2HU5YTUGQKXFOX
X-Message-ID-Hash: 5USGUUNIOMDDTJ4UFJ2HU5YTUGQKXFOX
X-MailFrom: webgeek1234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5USGUUNIOMDDTJ4UFJ2HU5YTUGQKXFOX/>
Archived-At: 
 <https://lore.freedesktop.org/CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Sep 1, 2026 at 9:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 8/22/26 6:42 AM, Aaron Kling via B4 Relay wrote:
> > From: Faith Ekstrand <faith.ekstrand@collabora.com>
> >
> > On Tegra devices, uncached maps traslate to device memory, causing
> > unaligned accesses by userspace resulting in a SIGBUS. Instead, use
> > write-combined maps to ensure proper access.
> >
> > This would also affect discrete cards on any Arm device. It was
> > determined that discrete cards regardless of cpu arch should use
> > write-combined maps for coherent anyways. Thus this change is made for
> > all gpu types.
> >
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> Can you please provide a Fixes: tag? Also, please remember to Cc: stable =
if necessary.

Looks like the tag is:

Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation time")

Should I send another revision just to add this, or can the subsystem
maintainer add it when picking the change up? For stable, I would like
to see this picked to 6.18 at least, since I primarily work with LTS
forks.

Aaron
