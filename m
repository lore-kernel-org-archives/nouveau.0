Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C5F8809D
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 07:14:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7DD10E825;
	Thu, 16 Apr 2026 07:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CsQv7+28";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 09CED45974;
	Thu, 16 Apr 2026 07:03:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776322983;
 b=wMAr70CG7MG0+5TNzCVsybZicavoJw7i0kSwJWzvUWtSiJ/hww0FDDo3jnPkN8y4BgItG
 F+0DOlyyMEu/fwHkDnu/f33kkPjy+RoY9mSvJ5Y80Ewlf46EPTLGPrPzI7ZjsMAcxRGFMRE
 eKrr8LhZp+Wj85APTfhAvm7GJfR3oNn2XPq5OHvPJ0SKnuSitutqHab/lXjoOkycBRqAwN0
 i/jnfSaYA4MgpunRc/AaqWQ5Tn/QBeZAfwqPrXxesD/yOfaL3mAUnZ4TdCbs4KGDR5IwWqf
 1F1VW/Gg+YjtldxV3yX9lmXaSs+a8MdzHYhZgX8202Z6bblxTuVhWWKvXclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776322983; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
 b=kcF+Y9nN4u9EbyTuUsk+hDHEdLvf337pqb1wSkHC79dIcqQKmeLr7CcTYsILWdwJs261q
 8P4ZTLQDEwNQzfTqCayYFmJI+w+3hPU11QTTuIjn5xoJPLZKaQuknmVu/+xIgOt2oCYB5J7
 Px+HJUNFOhl59bPBMIJSU7KSCUgw3xz8oIR9wyGYuOHFJG5OKzlVZ+18AbN/Bz3TJOEhcXP
 JDG9zg1Z15UXc6Ee8mUheR0N5CAHCgsHWe2nuRpuuQSANYF1S7QnSxMum0VjBkGIDzvk9po
 W0iyr42s4F4yPAMbmCvuY4kN/auZFdGy4rTSm9HnhJfyLzwIzCyOzzsE+dNQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3F7C843F8A
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:03:01 +0000 (UTC)
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2146410E820
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:14:56 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b9c4d923668so545342366b.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 00:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323695; x=1776928495;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=CsQv7+28R1zXmDhJzyxS5C52AxXYfU73D2zxQNqC32D78lrFGJ/zPm/3KZcWIaGSIQ
         hUWgN0h555wN71TC6+M/axe/7kSSR4h8Gtt3zn/n2/SFOzNN2GusZSXIBDzBnacrGaRn
         CFotF70UqD+/pEdGBT2Ab7MMSKPgaNzJVTUllSfyDd8m9/HiMqVzqz5uZsVC/TJyoFh4
         2ydgE5W8tuVaIzVCrz8Kl07/j5XMWXfpG4sN8MCkBo5t03DkxEYVCPKF6UDSosF64mYh
         uv2fhKvbwCnBHXge5viiTepqxM8egVkG/WnPTJzVR9YCbeCV/GQLIh7Zf8h0gGSZqySy
         8Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323695; x=1776928495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=eOABsN+fqChgkLZmbw/noR06Y7pdGgw3RDgLjb5A5QuXzU4WK/SgC21rLUI+wIpFkP
         iuZtAifScH3MsHAfI9BYTAUqAFDAdSeaPUUktr/wKiTfqRJbaLL8ywQ3VfBjIrMee6Gy
         sqRGSzuz6BV7uwBmHyAf5KjGan0xycmzF+i+BD+BNSe6VP1xfbnyH2v9pza83iLaYaV/
         yoAUSSjlkqxzskMQ5xZ+eOTlm8UPSZks+kwhiYzsvGWoOt6T/eoAzT7/lLxz8dXOWLF5
         k/fy0Ghn0j26DTRqu8RcDutuivPxH8kvftVEiPL8VCaXnoRFJVttJ6VvZ5y3/HMUqsne
         nWIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KzemROtXRRo2KaeSnOQQPPpQalK0DuJi4TRFH+jFvPOTm8aSfrMi843huLfKA2NglAEfjvZ/o@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqIsoR+0TkKBwvQDBKNWudvhHM1oILin2z/+rc+6kVLs83mlM3
	290bGZeLcjC3bZc3LOeU0uHlskTzCwUlwo4l6NuGhjkKAhQ1wk+bsiXXeK0QA6NHb8UR0krxhQ1
	SS79gWSO4q2bvY7+miA==
X-Received: from ejccs20.prod.google.com
 ([2002:a17:906:dc94:b0:b96:682e:377b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8b98:b0:b9c:a70c:d30b with SMTP id
 a640c23a62f3a-b9d727931camr1261267566b.19.1776323693818;
 Thu, 16 Apr 2026 00:14:53 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:52 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Message-ID: <aeCMbJoYQBS_I9lK@google.com>
Subject: Re: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: TQ5H2XRNTJT4GHQQES7IEHPGC3IPHJYM
X-Message-ID-Hash: TQ5H2XRNTJT4GHQQES7IEHPGC3IPHJYM
X-MailFrom: 
 3bYzgaQkKB146HE8ANUDHCKKCHA.8KIJKQRA6QHEOPO.BNAA9AOGPKL.KNC@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TQ5H2XRNTJT4GHQQES7IEHPGC3IPHJYM/>
Archived-At: <https://lore.freedesktop.org/aeCMbJoYQBS_I9lK@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 08:57:16PM +0100, Gary Guo wrote:
> All users have been converted to use keyworded index projection syntax to
> explicitly state their intention when doing index projection.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
