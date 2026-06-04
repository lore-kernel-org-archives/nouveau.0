Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64441CD6E4A
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 11:49:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDFC8113F9C;
	Thu,  4 Jun 2026 11:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SN5rpTCy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B4664467BF;
	Thu,  4 Jun 2026 11:35:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780572950;
 b=SFMViMfBPElQvNYr3h+VgiBu48WO+Z0O/i1+SflWLY8XBgjQ/cGvRtfixwlnnIHz4p04p
 wtySaLxog07ZE1YPwMBHog8byfJxPD4bRypkTxzK63I0t936B17A8C9Cc3r4cDfvVslfsd2
 Upnn2rgfw268kSYETdbcC9KI0lnemOgMYKOW63C+5MngQPoxVxSKFohXAF5AHvQFIKg/R/N
 JxjPXkZKJdtac4LDJRIRZ+WuNANfQ0NG6k0O2XQYDjXnknk9YIduwDbuvuv9banATijk0e4
 WOJ8ygRcbFp4p3jAOOrcEJbbfsv0kNZtsm3zw2UjGEhgt9P0F0+UPPd7LIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780572950; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
 b=j2YvVv73gLv+vrvq64XzMOpWOoxFfpZp4sTCCnzV3TYL1GZiUWc63ohz5l3HSnL5Ov6E7
 UatGAkF72BBP3baO3EvxmbA3Qrd/keYSwuoydxqiB1Deto26opEH/jh8krPNjMvDeSfkxze
 LoHcS4VdGSLkLi2jOzAHhDdSiuhHqYmAM8zZxSXQlbLjGph7nutIGyBXrtsetdXJcXZyKQT
 2LnPCmJnjoGgEX4AWcoSV49fiEv56kLwI8CBw3FMRcf3gtLEd/MM8ZX6qsC6qGQ9JdJ5bp4
 SLBKYNrJU4M25SX8I3HVnG9Y/U0bqlPfxNBkVXOKwgy+KPVSIDccOcpe+UrA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B57A94677C
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 11:35:47 +0000 (UTC)
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C507E113FAE
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 11:49:31 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-45ef93c359fso556583f8f.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 04 Jun 2026 04:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780573770; x=1781178570;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=SN5rpTCyFr9AE/eIjmM6WzlL1iOCeDE4MnmWsXc+aDnszcxkvHCUFCS4dCytfd9Soa
         ruYJYnSYb9tMxiBxlhigtJXW0QeUn2a9K8wnroJMEgUmSG4VCvnloiIz6YWZLw4R9sy4
         wUlh1nOHkOFDmRucYWgl64DICe/Mep2uLy7xzlrQRXnTlIOXltoJW7CGaNEtUvoPS4q3
         x2b9kzcsTwnDdLmtbEc/y4Cok8+Gbgq0RPFpXyExJkM4PZ1x7kA8TZaoGSpKIOnK0pS6
         759S21f85l5x6696grRJu1HCkImIWMvAM/qQE/q6l5vRzocV/FXYknxSGgfl707itOal
         N9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573770; x=1781178570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDsisrKoiSBYw8b45wvLvNabX1p1YR55LCjFQrLjodw=;
        b=bXLJ35uLqUDvwv8WD1iADgCPABW/b3PMMp1zqfYoaIZgHIJCleEUhUUDj8tCXo5AzE
         1get+bTQUUvlOXfN+UK4VFL4WEUhOuS0fiQK8O0/I9AG7gHC3Cybtql5Fi5jEOWbsHNd
         YTYrHt7PwWrqFItd9OV3+BeXFHqRwKyIv0sc9wZEdWnAV2jfNL9VuBvrzrMSZ94BWROa
         rLZL2V7+naGRXQJLB+PqzChKf6YBxNzJ/SE/rgoj9lUIU+esP+hp7AMXvsV/WqDYWrX+
         Ko1TIT13NsFNKG5EaAzc9Q2fJaO6Gobh8FXu1IolvJDK0IjS9cuwoIpoHW141WHVm4mD
         bIkw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZvgdS6eU7mQ8RSTwL/HUHC/slPWosh6BjdhMpDQmmibEgnlTJgUG+Mzscy5J/7qBjwDrdC47+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjd67LQkQkAM0Off3r7f2RfX1vvYbjkBrPpBz0rYSmStUlyXRg
	XAR0HNCFSlsAD+fZl0lPZ/ZFQyoKgRc20B0d3+ROObtPN/luZAr6cxUkTTyp06DhfrPzwT219Lt
	0jC07tjicUcv8W4f2Mw==
X-Received: from wmbc9.prod.google.com ([2002:a7b:c009:0:b0:48a:7f8c:a95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d86:b0:490:6869:46c3 with SMTP id
 5b1f17b1804b1-490b5fe79f8mr132548195e9.30.1780573770264;
 Thu, 04 Jun 2026 04:49:30 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:49:29 +0000
In-Reply-To: <20260603195210.693856-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com>
 <20260603195210.693856-2-lyude@redhat.com>
Message-ID: <aiFmSUi0ZHVIj5Q1@google.com>
Subject: Re: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default implementation
 for ObjectConfig
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: ANPDP626VQOBKDAI2X7M7RZQ7MLI437N
X-Message-ID-Hash: ANPDP626VQOBKDAI2X7M7RZQ7MLI437N
X-MailFrom: 
 3SmYhagkKB_MVgdXZmtcgbjjbgZ.XjhijpqZVpgdnon.amZZYZnfojk.jmb@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Benno Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ANPDP626VQOBKDAI2X7M7RZQ7MLI437N/>
Archived-At: <https://lore.freedesktop.org/aiFmSUi0ZHVIj5Q1@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jun 03, 2026 at 03:42:30PM -0400, Lyude Paul wrote:
> I completely forgot when coming up with this type that #[derive(Default)]
> only works if all generics mentioned in the type implement Default (and T
> usually doesn't). This being said: We don't use `T` for anything besides
> using it for a reference type, so whether or not it implements `Default`
> shouldn't actually need to matter.
> 
> So, fix this by just manually implementing Default instead of deriving it.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This one is so simple I went ahead and applied it to drm-rust-next right
away.

Alice
