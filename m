Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05A4FEFB44
	for <nouveau@archiver.kernel.org>; Fri, 27 Feb 2026 15:58:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C33110EBC6;
	Fri, 27 Feb 2026 15:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="O4VApGig";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C1DA844CB2;
	Fri, 27 Feb 2026 15:48:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772207309;
 b=q5qQFM+7jZvHjFVOVKFVnbKHG4XA/pzL1hkGA0y0FFSkVzPFiFhLjOHTjUmuT9mdvrIar
 P35tfGnHOXgkd6I058h77wS69fIJYHjFPYgzsUcDoIwqN7pk7uwY9TTl7GMf14JwCyCDqwa
 oWcGwoV3W/h0hTDjq9ZfeAGq8glOTYy+vl464G/j10bt/H8LmhC3mBaW5s7wpXSKPrQN+kp
 69lEPSioG06+XkqmhFxGd4RdOFrTx2Q6RKWczhYJGjKHcC10jiBZuxhUR/SFuBpuJkVBLpl
 QjBkTiDA7WKNnWbhoBa81carjjgDTgwzzE7QYNs5dHXzr7t8q7rp8OS9AT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772207309; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MaJxtRy1gxu5Hm6tq13uMb/9SHoCAIyHdACW5TaPNP8=;
 b=NCM1oe47wkV9MahiP9123O7KXwD5IcuRMZkdgO8bQ+Slqbu8k6HO2zDQH3VRa9d3IEdmT
 bQARO1x4aAwGxjIIyrOf16foChhMpjpxPXetigTgXmBHJaPoUzCXTe+zpeD4BqHqDQxWvS7
 zVoaUyK8mAvuRp15qD+aQjXoXCD72LBoFdSiwDFuQLkgVMZSJcobuW5EJevR+H3CiZJSTiF
 a/E9sL5tr/4vykWvxvEWaxGVDFU0bgxpNAMy02lthEBssLp9FugQC6OqM7hG6NZ8sSpXzpM
 q9MwLuvqjk3FukfGZE/7zXwWDk6BJ96OcbBP05ph4ckRTgiGT8uSsfuOhf/A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3255F44C77
	for <nouveau@lists.freedesktop.org>; Fri, 27 Feb 2026 15:48:25 +0000 (UTC)
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Fri, 27 Feb 2026 15:58:32 UTC
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66D8110EBC0;
	Fri, 27 Feb 2026 15:58:32 +0000 (UTC)
Message-ID: <1d3c1c86-7382-4c2a-ab3e-3e6938d055ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772207497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaJxtRy1gxu5Hm6tq13uMb/9SHoCAIyHdACW5TaPNP8=;
	b=O4VApGigh6dfWOJ9Vb5+0CQiVHhKjSZySfd6btG/EKcPBAUptNJb4/YDic3YfSQ0J8VAGe
	hZ/07Q7h657LWWPzTUyyfY/nw/ws6+i/16B29wlwXRCsnqs1muOE91VHh5HeFCpqC42LSN
	SqIKXtc4WN41DQjWrPhh33QzvyF2Et8=
Date: Fri, 27 Feb 2026 23:50:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
 <20260226193442.GA4077409@joelbox2>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260226193442.GA4077409@joelbox2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: ZH2YGTHHUGFROVWXBNMP23VWBJLNMGB7
X-Message-ID-Hash: ZH2YGTHHUGFROVWXBNMP23VWBJLNMGB7
X-MailFrom: alvin.sun@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 alexeyi@nvidia.com, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZH2YGTHHUGFROVWXBNMP23VWBJLNMGB7/>
Archived-At: 
 <https://lore.freedesktop.org/1d3c1c86-7382-4c2a-ab3e-3e6938d055ec@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 2/27/26 03:34, Joel Fernandes wrote:
> On Fri, 27 Feb 2026, Alvin Sun wrote:
>> Thanks for the clist abstraction. The Tyr debugfs [1] I'm implementing
>> needs to iterate over a GpuVm's VA list, and I'd like to switch that to
>> a CList-based implementation.
> Thanks for looking into using CList for this!
>
>> Could you make CListHeadIter public and expose a public constructor?
>> Or do you have a better suggestion?
> I think this can be handled without exposing CListHeadIter. See below.
>
>> The VA list mixes two node types in one list — GpuVa (with driver-specific
>> data) and KernelGpuVa — so we have to filter/skip nodes and can't use
>> CList as-is. With a public CListHeadIter and new(), we can implement a
>> custom iterator (like our current GpuVaIter) on top of CListHeadIter and
>> then migrate that code to clist instead of hand-rolled list traversal.
> Looking at the Tyr code, both GpuVa and KernelGpuVa are
> #[repr(transparent)] wrappers over the same C struct (drm_gpuva), linked
> through the same list_head field at the same offset. The "two types" are
> a Rust-level modeling choice for safety, not a structural difference in
> the list — every node in that list is a drm_gpuva.
>
> So CList's typed iteration already works here. You can iterate over all
> nodes using a common Rust wrapper type (like a #[repr(transparent)]
> wrapper over drm_gpuva), and then skip the kernel-reserved node by
> pointer identity — since drm_gpuvm has its kernel_alloc_node as a named
> field, its address is known. Something like:
>
>      // Iterate all nodes as a common base type.
>      let list = clist_create!(unsafe { head, RawGpuVa, drm_gpuva, rb.entry });
>      let kernel_ptr = unsafe { &raw mut (*gpuvm_raw).kernel_alloc_node };
>
>      for va in list.iter() {
>          if va.as_raw() == kernel_ptr {
>              continue;  // skip
>          }
>
>          // Cast to &GpuVa
>          let gpu_va = unsafe { GpuVa::from_raw(va.as_raw()) };
>          ...
>      }
>
> If you need a named iterator type (e.g. for returning from a method),
> you can wrap CListIter in your own GpuVaIter struct that stores the
> kernel node pointer and filters in its Iterator::next() impl. That would
> probably also be cleaner.
That's a good idea! I will try to implement GpuVaIter based on CListIter.

Thanks,
Alvin Sun
>
> OTOH, with CListHeadIter you'd need to do container_of manually on each node,
> which might be more erroneous code, whereas CListIter handles that for you.
> And anyway, the pointer comparison needed to skip the kernel node is the same
> in both approaches.
>
> Would this work for the Tyr debugfs use case?
>
> --
> Joel Fernandes
>
