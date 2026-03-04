Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780E1EFCE33
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 17:45:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D85E810EA84;
	Wed,  4 Mar 2026 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="m/iILpZI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5196944E45;
	Wed,  4 Mar 2026 17:35:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772645715;
 b=m9ygX4pdm3mvDBBVWrjGXPRQDmr2Vxw0+iZN8uTpfzBrMZz6L9CnFGCeYy1XYFA+EEnUi
 kf5W9rIHNdqWp9G+qDMxzzSJdkM6PoAgZ+vOhQNQKXgourS9o59O7goFFc8B1idXYoo4Kv1
 JqypeLD2CbPqD+FmRgl4QMEGRkKt6Te1YHJOnfC4FeeuLL4SvPql7aAJW7enbIx6MuUebAG
 UXBzAV8doFIqrb956ugNL13fvBXqADqyvZq1ji0KCE2fkJyplgWObDeUv5EP4q2mGeJIkMM
 tNdaK89VxWp1jkgL5lY9A1h2UDJl3ooJhzXk34C6M2rIB46sx9LufuS5rg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772645715; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
 b=xtPcgMg6IhZqK5EuB8LAxu11yjo4aO9pMZy9rjCVoBUrZd1D3AZNgsSzkVZPQ+wtlVkM8
 hquAwBz62SdqZGnleimqZn4JDj7m2LWQm499AlV0j3QSycJyJMYnaACW8XkkVy/N1oQSiH5
 8oLLeM6wBKkkBWI6VEVNQ3NUfa9PgGzJFkrKDg0LV2N2a0uOCj1VR7r+KrOZHC6XVaFEjDg
 BLOiS4kpfh2I7X46yEeeUzoCZhVAmozIWfG5OLQp3n3DVGasfmC9Kka3wOUJXj1zAL4s2Ti
 56IVBNX9y+Awn4OEjyAJ6Y7jJWHeEDoNata7UdGmKbp0mqYHrKlAHsjLGH0g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B2DFE43112
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 17:35:12 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1048610EA7E
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 17:45:33 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8cb3b3e643dso428606785a.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 09:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772646332; x=1773251132;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
        b=m/iILpZIjH6AXV+SGl2Ybp+HlcZWyYm9IinBHm3fHwbkXEZtzTux0Jl1sx6XhEox3S
         IG8aic8SNU6nTdwNs80yTVY2NmRjjytyK5MZRq9RHbCVUZQlwcwpAOnK0OL6zY++az3m
         71P9y+VSk970kESHGarEhFd5y47yXLBwRhwHu66rPoe/Ykg05Q1pHEw2X3CRa7fNAuO1
         7xSHASDCNHJcaMrpOFijZh22or7Z4dPe862ZAc2osTnYaRXIITIh3UMh0iNl4acS1TTw
         X12lEqw56cgFqS+Vp65mvUkBc9qaWq7+C71IN+Vke4ank2yGPiUjaS2vfpxfpAD9W38a
         /HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646332; x=1773251132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
        b=v2/PN7TjTYO4qZxWtdCKGlDhvaBFFN5YVLtNtco0kdSZwlkUf6LOiYHguJi6X1ww9W
         F9Y7f9xAtUoJBx8wu8G3HnsOlmsGekU2SLxP/w9WqNnvmd8lUvzuRvMrfG2gSCbXybAs
         UdS5KpVy8nZ4l6dCb8SWePDJGYFleFq0ihfLqRYzP2VjOPw18hQSMoznRnQWTVZ5l7cl
         D3Zhnx+akRWCLQkClfINfQdPt728fMTjjw4JLIlCp8fuNGzZoGgH2PwbJW9iZYhJWvFR
         ucf7lMvpHINwxhhbOYu5YuB2tcVF1HNBUrAbk6ucZQuE9qY6yga8ER0dKiD+h93wCQWN
         KO5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf0dN8CPWuV00WtdXqo0+2n90XDWAa9vaWFdraw77CXt7AWxRv+T+GzfQz/zj2jaU38Jzm/yuV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEn30QUZvtDBB2a/oIDfL6vCbR7e72Lu5ydrSuE/s2/EmVk46p
	y3LVAloaSFx+cnRfNAQWmc1GuGFNhF53Z3yNTaGBl8iMFIEYbf76nloiE2xWRmk7GIg=
X-Gm-Gg: ATEYQzxstb44eMPZkUuQcl6gzFAyHP5LtLgtP2rnkY9FXKpICIU1uk1XYF9m21yEjsj
	weuu0f1UvdD/6/b0no+T7jB7vT61YZN0SblpH61CCir/u/MqekfOC7GxLll5ScAUeFqv9NJ0yyJ
	hLBaLtnzi/ZS4I4YU0dflrG2F150NW2iCApq88qtyv+bO18tdXVdfo8GHWPaBFzGdpZDM2beoiD
	FR53hn9fCqgkPeIbOm6gsP5cHToMHWLv5650Fg9W5xlEbfX7aKp22orDwQlUg+xtMvTlpi6njuW
	IXuXsoW7zkPYLQsn9p7uXPxL/NMoYdq+X5nf4NPRp/FeA6SPnhoSYCU23+R2Qg8Csac+3j/Xp6u
	FSU0GLR/lJmxcmmJcQXs7uLOYFbU6gSl81e0WRUMW2XOQyBZGtCp+/bZdBW5kFhHBzDgSAAsvf5
	Qr630eXlc9B/m+fVR8iNX4srwmw6zuxdjpv5ud489cbchx1X9Zk1AsX+7dhjeZs8IrXVFInWlew
	FnKbpZY
X-Received: by 2002:a05:620a:4481:b0:8c6:ee09:5eae with SMTP id
 af79cd13be357-8cd5adb8d1cmr343907185a.0.1772646331749;
        Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a1fcb781fsm8074876d6.23.2026.03.04.09.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxqHq-00000005ET5-2S2S;
	Wed, 04 Mar 2026 13:45:30 -0400
Date: Wed, 4 Mar 2026 13:45:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304174530.GH964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
 <20260304164551.GG964116@ziepe.ca>
 <20260304170249.GJ12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304170249.GJ12611@unreal>
Message-ID-Hash: SFDJOSOG5PBCG4V7ZXPBMRA2EKYC43TB
X-Message-ID-Hash: SFDJOSOG5PBCG4V7ZXPBMRA2EKYC43TB
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFDJOSOG5PBCG4V7ZXPBMRA2EKYC43TB/>
Archived-At: <https://lore.freedesktop.org/20260304174530.GH964116@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 07:02:49PM +0200, Leon Romanovsky wrote:
> > No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
> > will blow up the half baked SRIOV and break everything.
> 
> The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
> will do it.

Well that would break all the security properties of VFIO.

> > VFIO already has its own sriov_config support, the right flow is to
> > bind the PF to VFIO and then enable sriov and do your assignments.
> 
> VFIO started to support SR-IOV in 137e5531351d ("vfio/pci: Add
> sriov_configure support"), which was added 8 years after VFIO core was
> added cba3345cc494 ("vfio: VFIO core").

Well, time to upgrade, I see no reason to allow Rust drivers to
further propogate these mistakes.

Jason
