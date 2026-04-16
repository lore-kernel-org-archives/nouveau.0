Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC061F88092
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 07:14:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFAF510E822;
	Thu, 16 Apr 2026 07:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G4TlGwnr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD7054596C;
	Thu, 16 Apr 2026 07:02:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776322960;
 b=mTpYTX+2gM7zE+xZj4eDS+XyZ27n+LDByvuMM/x1PzAknX+B7VHHPxIMqtTw4TLBwuXOM
 DD8zxRF5tfDomt0V4C5HpnQE1NonYil4uATotwxeshKNUQSL/xA2BPOySXy5Q+qdpa2V1OO
 pIDyBDjQfzNCGRLgF3gTomeBqwPE9FYwrDjMfzJNkm9qWWN/rYykAa+ncaOU3pWL0cPE7Mp
 UmYswYwQX4okMOK2jRaxtSByPCpu1UN3mbaS9AjazwU/+r1ZbjKBRE41VCLiEF5yzxMwI0g
 FPRluYtqteZHXf4R2lOz91JixiXpI8AUbEhtoSj0UuIMGoEikSps7VzP3Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776322960; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
 b=eV1GMdzxHsu7Zvk3ptflQZfFA8WTSp8Lbi6Sz58WOfZPHfCb03fTWGXHYZTQLDzYS+MRi
 Vqt8ZYCsBqtF6wQKaevmBUx1XBNcKdKiJfORKOQ1XhWL3CR5oO0KVc0oTdNLUviQQ+7RBA2
 9wWfDeKI+NplqjpzxYK3Op63GU3TuDR6yoD0ATp5tkkuH6wvhDrKQT6NVFrzghQablqaBxO
 ctAbQBa8Vrg2tz1Shxc34ccmg61g4MCs+fI4cSpKJE3bQcHK4iGwhoa71FLylri7FypIul1
 tmQra+ZlWqRfC32iB+dttccwEPAjqIdkjEwi34K00FJwzge9fJtO2Rf3KwHA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C24F243F8A
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:02:38 +0000 (UTC)
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89710E81D
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:14:33 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-ba24fa76ad8so78957066b.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323672; x=1776928472;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=G4TlGwnrAPOp/UZjgsuPG6u7TNaSI0dd9/s+OKoMuoWV4HyNH1XnZ8AzhJZnkkztKn
         AMDEaM75bfGGScX1WZ0bPXLIw1m6L5lfE9elUpj57m26JRIpCY54qIO2Gbw8PlF2hPll
         gN8/INzPJ/px5ZMwrTjSFIzSQGENJ77i8TkbF76GExLPnUG+ZdAB9HUEtu/5wizv62/s
         qwE9QzDOUP+rPpIKGAbJ6Zg5a70VGCsR0vIr/IUOVfvIPCytPKM3nTJcyL2duAtv84f4
         2b7urShoZTr4Ry/Bxp59NILYlMQ4aWpgFOGTMEfMHN9RPEmjHBdDLHv95k1e9DAsFI0Z
         FHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323672; x=1776928472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=TPX+Y4u862m4WzR3jdJrHW9kUwzFl7oMj22zKTjiBTHtJXEI7JzNBROPRjLCq02GYm
         3LzGh+MDaeljRC67LtWScs9xrLx+2eTtmRed71t/z4aoz6UtkuvLYjk/cl497mA9oZMn
         9kuhoz6bYYAq6hmhacfO3T5oHxDW5zELW8f7EYuWNWt++imixhQycc6pAHJkM/oesFFV
         MEi6YKjPyNFs03y/dXgKqP2av+rMX4b+HiJiK+aha2HBDCCoqcTtnpmNSg4IFsR6eUlS
         g5Wo477xJ+169XiBPKnmV+FWj39/2jdCoic5D91glXYc45lv66YMAlv8YJfj9uajnXWh
         iUXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/WzTKypo+y80Z+ogeWzZRRnBJTiAzoNr8hlsQCQUpWsTcNLNmfo0b2p/H8usOxEY58NRQrLMYo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvUpZCix7rYUJ+2XVXorBK26Z/Q/tFVOkbc+eeUAFxm1ZsfSk8
	GjjE7q3xuDhM9iCaRB0VY5C3CrUlkFxiDFINv+LrJQ+sOZY+FRVJ8wVdsADudWURmDtqBT/0CoF
	+tNd/Y/NbaiEpd94gXA==
X-Received: from edwo26.prod.google.com ([2002:aa7:dd5a:0:b0:671:2fcb:edb8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4544:b0:66b:aa56:ee5b with SMTP id
 4fb4d7f45d1cf-6707b1067d0mr8867411a12.28.1776323671860;
 Thu, 16 Apr 2026 00:14:31 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:31 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Message-ID: <aeCMV-5V6__ptj5N@google.com>
Subject: Re: [PATCH 4/5] gpu: nova-core: use pointer projection for command
 queue code
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: NQMLJLBY3XQ6OQIWFDF3UNLG7OCIE7P2
X-Message-ID-Hash: NQMLJLBY3XQ6OQIWFDF3UNLG7OCIE7P2
X-MailFrom: 
 3V4zgaQkKB0gkvsmo18rvqyyqvo.mywxy45ok4vs232.p1oono2u3yz.y1q@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NQMLJLBY3XQ6OQIWFDF3UNLG7OCIE7P2/>
Archived-At: <https://lore.freedesktop.org/aeCMV-5V6__ptj5N@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 08:57:15PM +0100, Gary Guo wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
> 
> This has been previously attempted but missing compiler optimisations for
> older LLVM versions cause build errors. With the panicking index projection
> variant implemented, replace the manual pointer arithmetic with projection.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

