Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA3BCD6E77
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 18:53:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A665111A260;
	Thu,  4 Jun 2026 18:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="di5snAZX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC1AD467DB;
	Thu,  4 Jun 2026 18:40:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780598408;
 b=xfbcJq/QVEDoWV6IO3/mcjKEbbCR6GMToZiWoY0aMHvP3xppmyYC3jodR+f1WxgX0uflm
 s0BBVGksUVyw7+qOzmzF6y/Dl8fqvXwc6Cq0VW0RcnNaDZCLVzhq1Lv0Pt7WQ2NqCcw1H3s
 kmC0wt1UULHKtFZfaFIgM+D5z/n53WXgn1j12uAWJHhJM3feBYhPc3Ix5S438tenQvcT6MU
 29g3BxY8QqhgBub6uWc8UjkvxFnescmPcnkqm3zUrzQebCK6XkU0+qvM6FLINouOG2W1J6h
 22T9M/kOaKN/i2F7EXkkzVS55KpL3BuJdKpbZB8ZaDqtW93tOi8kxdGbsm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780598408; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
 b=Xif5kld5gN4R0Gy6qSED0zZQ4bBebTzl7SVmJ5G67BMhky1P38egxcFAMJwhu+B3u5/QY
 1MdbLPCQbeFh4BgP8PvMztHRk8XGT1FFlMQt7ThIMbLRXFo0Tp4Q7aAuJgauc6JnwfINbRG
 PEOQw2cVHDIYVkAGxPPbOTfEdU2ER0NTZd4RZy+l1EEm4lDYBYWwDsGpzSHa53/Zf6Y5/2L
 Ugobwhl9IZw6QiQstAKlFMBH9VmiG275FNKY9RvbnB886T6e9NMiESvQVKcU1TbfQEHyCti
 bnRu3IoFZr189btKAXKLy62EEm1ZD2r6pefok/Efn90Z2/Oa2PUnomtpl2kw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2459D4677C
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 18:40:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7E6511A258
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780599228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	b=di5snAZXO+kcuk234ZjHKvIhiVCRlRdCX4HndkXoqWHPRIgeBvz+XqmfQ9QU/eZW4Fsems
	bH77WFvsjnn+p6at1G+ojqkPGrNflA3XlUNQ7zY/kSbcESSOjrnQ/jBnv8j9KI9BfSwMQH
	5qb5WwoSzGmYNGgoXgSs3ZL887p5d10=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618--4mpJc8kN3CpcJNDqAbKWA-1; Thu, 04 Jun 2026 14:53:47 -0400
X-MC-Unique: -4mpJc8kN3CpcJNDqAbKWA-1
X-Mimecast-MFC-AGG-ID: -4mpJc8kN3CpcJNDqAbKWA_1780599227
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9158e75cbc0so263951585a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 04 Jun 2026 11:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599227; x=1781204027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
        b=H6QAxm1aUw85k0E1+deNuNtuRLme53E+eMNuq20KeVqg1TY4N/b+wd1Ix6FrzwE1T0
         lJabue0V5BBjzDxQs/ZdS307quJR4OkDIW+Q7RIe3AXc69X9Iz9gVQ6bAMXetcKHZJed
         sOORhwioU9LmOO7HSBgCbNbrZml+RiQr9c7bhvp2j01RRR0ya0nP3OoWRSt71oLunbxk
         wyO+JzyzS02QpL1B8UfmJzMGCdBhAlcRU/p2mBF6ST91wb8ghYal6KZf/gZ0gpCYNPFK
         jh6WakM0lEDGweCACleAc7PbnhWDumTRoucbiw4zN7DGyyRdWQCexiiedUzSoA/xffo1
         x5qQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ayyFj+YTgDOpAFrgOXr4hNABJoJo00kn8sQ2wofUm5ELXQS7wnf/cSx/UbLWF8EovBAYDz8Bs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ3NWPceg02pO0G7CnoP3dKxW+7f+3CaI01KBhb2FvbObFxUiW
	n8GRG0tZoQpg2he+b4fdSXkcG9IpnIeQEQrRR+Ac0YYm7canPbiPDeS+NlISkpNJxnn0zV42yj0
	HnU4cZDcN48rTn2/uxkg749ycgZU9KkgTIpOj6mxGiOuboo077X1iyNCKJzzm4qV93wE=
X-Gm-Gg: Acq92OHNvRignBqqqbaOo5pdC/aLN0kMvNS5NN6dHZMcxGoUACxgZV45R9/F+fV6Wwc
	/v2j7orICAlH0akT7m8/EG4rsborI1OhQdZUFWxf8b2GvHkhwhS/J9zAAq5DB/OSahS60HRm60G
	IVESYgmRnxQEO8uGgJGDrzUmii9WR4PjtL46RNaYe4L83VWzkqyFuQnGcxcGItJnRl4V05VCH2f
	bVzh79YFrfPi1XKvzNMN8PoUT79S0/i9FyQiHUE5ntSxKeDEgZH7xFbmnBs2K29yl/oxaX2yJLF
	nZlGyz7kw4GLW+CkNh/IOIHQX0e3mwzxNp5dxXAzUH4phwD05kgbO1SDwOUtUTRclxYCoUWDLBR
	iQ1JYaEDb7vHwVcVOwKY68V/zJICb
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id
 af79cd13be357-915a9c496b2mr73288485a.8.1780599226731;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id
 af79cd13be357-915a9c496b2mr73280485a.8.1780599226214;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a237330sm683172485a.16.2026.06.04.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:53:45 -0700 (PDT)
Message-ID: <dacbea5b8b7c289cd467774c40f3d888a1f1214a.camel@redhat.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 04 Jun 2026 14:53:44 -0400
In-Reply-To: <aiFoUauWYLz-Oyrx@google.com>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-6-lyude@redhat.com> <aiFoUauWYLz-Oyrx@google.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UPcb-w6IszATOfMsDzzU7c2T1cR9nGsXxg0wGfk9zwI_1780599227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: R52ZZX3PRSJTVPJCLRPAK7XUHD6BDSZ5
X-Message-ID-Hash: R52ZZX3PRSJTVPJCLRPAK7XUHD6BDSZ5
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R52ZZX3PRSJTVPJCLRPAK7XUHD6BDSZ5/>
Archived-At: 
 <https://lore.freedesktop.org/dacbea5b8b7c289cd467774c40f3d888a1f1214a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-06-04 at 11:58 +0000, Alice Ryhl wrote:
> On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> > This function simply drops the contents of the SetOnce, given a
> > mutable
> > reference - since that proves we have exclusive access to the
> > SetOnce.
> > Additionally, update the invariants for SetOnce to make it clear as
> > to why
> > this is safe.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> This isn't needed, you can just do:
>=20
> unsafe { (*this).sgt_res =3D SetOnce::new() };

I realized after sending this I could also just be using ManuallyDrop
here instead of adding a reset function, which might be a bit clearer
anyhow

