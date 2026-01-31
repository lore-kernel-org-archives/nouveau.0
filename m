Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A731D73EB3
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 03:01:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E622B10E21B;
	Sat, 31 Jan 2026 03:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WOeYPAN4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 04B3640F63;
	Sat, 31 Jan 2026 02:52:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769827927;
 b=OdSrSQ3jVz8oL/hiqXSVUAM39N4lKIQtO97gWWhCa1tEODXn2Y3rO53mcP3A5fdfPV1rh
 /fu1oFNVzzj2yf0zmO7gB3Fd7NCaKxyDhPgnK8xFkTsS4/V6xkEGqz6AU9zk4Mrq1iyhHci
 pXoSlMU4Ju4UqqUxgiWVIu5NwbQK9yAWOrJTb+y4CmOGg3pHqyxFdD/OEJ6JZIMgFUvTN6h
 rc26iaQzRKZj1TyY77cnBiebDPfSunB/dv8w8Vr+N3m81E2F3lJVyBWeJODHo0A4Orrvhq8
 Bikfv50bMtG3q1eBl86rGac7acEq/Or2cvFlNEOc9plQYQtcGweLnM8t6rMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769827927; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
 b=VA+gXg/1wyTC2rW0Ff9UKUUl+dxKiizSwf5BrSa/+q3CKpW/CB/iI7RypSCemwS75bWXL
 pgvhop3rK7hWFwlXeMb6f8vulgFc9i2eDP64i8Gl5/Z9jAEtee4mJYmlzlNIu5K2Js9ZIXG
 DknkOxHwQLCVfpdVAG6MgkaSB7XjzJd3iZAjU8n0YRHPBUT9CxMMK6e8ly7nG8hY/H4xUhE
 R56sGihVzgTuhPHvTH1NZqZmqsR1M9bSrzK8Ge0Ph57ymPN8/x1bD1vEDU6xQYaSXvPrnGL
 EaLE9J1uAf6YMGXSEUN2rDXyBphMYYtCoBodYOmbNaniej536SBSz/CEEZ+A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 371C740805
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 02:52:04 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD710E1D9
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 03:01:11 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-894674a4c4aso51546166d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 19:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769828470; cv=none;
        d=google.com; s=arc-20240605;
        b=Nyq8nsUW6ET+6YWIrZtXAyCHzVbEsn0Agg22tnm7EZBZVxQP7JpljTv8FHsXUrK7N8
         A+OQwL+BcS1KCQgYZUv6dV2gLnK2ywB2CJAkKzeabZBXGVWNw6zhyPP8LN4rtnW/62Ge
         XbXru8Q34L9NJP8UPsLlG4Dq8avQPQZQqNh10K4kECluOki+3Pst5XllG2ulxCc35f7W
         fPTHDW/TC34ATzhxM+0p+dQX5JtPSSDtTvvmKSE0oro0gpUntr87oF48+eZ1a1zR+Tse
         fta3QFZfHhAfdNosHTodY/3Hdyksp1e66u5ZZZt24NhBERfAB+pQ+3EK3a5vQWyw28kR
         +DNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        fh=6nvNN26V6HUAzRT4oet+s19CaBWdCSJTjrJCfI0+0lk=;
        b=Kt9lo63oBgqTgWugYsreQWjPV91Uy9OO6RFYdOrSGf3ks4F5k0CuEZMN74+UX1saxN
         0NemgsVRj51XNHkEhztuKkMeqb1XN8BsOyB8U6T/+LSenZK6MpaKTYbv/+Hbdj9cB1Ai
         0A5KmHTfX0GrPPB2LOO63sZNgxRZErp/1J44Twbag/SYehuM3eHUsbHv6fAI49jY/adm
         pteD4Ga2EIqoObJTnXftvtRWluqU8UWwvf96XPM/stIBcxKvSWQWGHYL2CCb4BCOfRl5
         G+lmJydQo66bk0oH0KnOShA54IKwnLCLyIPfKwHqwEIZMEjxW28qAlLVRpvbvOTx4igA
         Rv+w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769828470; x=1770433270;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        b=WOeYPAN4YP5WeM3wWxdkGE6XdrMugWpXBW6j+zzOaz0BMj1EqTPyR3Rc2vo57O2xSq
         UxUFGG5ecB+xKaQZ25Xry2WuyhvMIDnC3aC1QEysqvbs4bQbCZ3RzKg71kDNCyvDmC5L
         D0u9YFRVx5XpKZMlvq4AmQH9wNfAWIfD+GWxt4Cq8f2PYy8CGqZWXwyBI6NW9puMh4ex
         njYDHfJ8U7Xz7K2hSrCgIRA+k2LULUyQ2te1Kvy9AasHqFBM90jUn/Fr6TqpqBj1F5ij
         rR0xrN7CXHg+sjxwchU2FaGQinkjc+lrwfAyukP7n8ANBFlEkppXZEND0eVF7yDBhyf8
         zkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769828470; x=1770433270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
        b=NF9Z3ZxLQAwSGGdiEDQjZsSfFbUiCW1CyeAZcnXFOR7iyphWakWxY0BmWfb56im3X6
         4mAxF+rPUXzgZskiZYZaLS3HBmFXOJCxfNcWgLBxpQynO52g1xq1maS0xOuksrPq5O44
         pOV3EWnMj44tm4NIzui+CNa+a8jHoygZNKB/QdKMfLXqtC+MbBWVlS3gVryZibC5EX93
         SEeIT9hUzxCOcJHAGMzkxuLK/oEx6ohAmFYCpK2Hx9F/vsiiAFBaEjWUk9jS8jjh7dsg
         ed0NTUZbVY+tPSHZE9N1KLZHBdyrVvqEOafv+AjxdLg+I1tzM+T1H1t/dFoWWqcYsI8C
         59tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVGU+3otw5m7m+xjDVtxltNh2Fv7O42cy+6w4cHWyDbMZ5zQIYIJB4LkcacPGFReYkFLVuCvMj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqrTnQbPeP+mgF8jYgtgUek+km5I7m3ProIU+J2TnSkdXmpDpX
	PCuF57lH6QD1YapZTEPYcONasmRyTN7BDCdOuop0ueKtHPAj4qjILTs6By1rxf6tMNDeFhkNxzf
	pN8LY5GV3Sax+fvlPQHlf1tjmX4ee2Jo=
X-Gm-Gg: AZuq6aIO6E3A1rUiE4Z4CXm5S8rAnXHfc2YjoBgd5oz9z6INfcyCQ6M7eQwV4YW57DL
	BEetzAUximbZ45OehhD2L29YdXfTbS2L+48rYsgQ1h0F+vInikGklKWI6vw+sc2g+hSJeWz5AFe
	Pb1vXJlZi9iEiE76tO4LLEYErBPTqHY65MCZPoJXiIq6Z4vz2INuQPfiO4tWVsPYxRTR/+RhgFs
	VTTHQYBzcukRxPGR5riZVS1KG5uWZvE0cvcjmMU1Ga4La8g7E+oxCEwP47ieqB3/6fMOs1Sc4Lp
	jhkz/8xTVa98kjMBCkmTpZZeZzGkZ6GPxfmSan7c9fDcqUYjBAZ50PU=
X-Received: by 2002:a05:6214:260b:b0:880:51f0:5b93 with SMTP id
 6a1803df08f44-894e9fe6cbemr81159006d6.18.1769828470148; Fri, 30 Jan 2026
 19:01:10 -0800 (PST)
MIME-Version: 1.0
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
In-Reply-To: <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 31 Jan 2026 13:00:58 +1000
X-Gm-Features: AZwV_QikuSqbC3QYogib7-81aPfnOToX57Ol8yNxSKEx4_hXbDFs8a3hQtETIYo
Message-ID: 
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: AR4APE6KNHOUZZRC66ULZA3ZBALFV75O
X-Message-ID-Hash: AR4APE6KNHOUZZRC66ULZA3ZBALFV75O
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AR4APE6KNHOUZZRC66ULZA3ZBALFV75O/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 1/29/2026 10:38 PM, John Hubbard wrote:
> > On 1/29/26 5:59 PM, Joel Fernandes wrote:
> >> On 1/29/26 8:12 PM, John Hubbard wrote:
> >>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
> >>>> Based on the below discussion and research, I came up with some deadlock
> >>>> scenarios that we need to handle in the v6 series of these patches.
> >>>> [...]
> >>>> memory allocations under locks that we need in the dma-fence signaling
> >>>> critical path (when doing the virtual memory map/unmap)
> >>>
> >>> unmap? Are you seeing any allocations happening during unmap? I don't
> >>> immediately see any, but that sounds surprising.
> >>
> >> Not allocations but we are acquiring locks during unmap. My understanding
> >> is (at least some) unmaps have to also be done in the dma fence signaling
> >> critical path (the run stage), but Danilo/you can correct me if I am wrong
> >> on that. We cannot avoid all locking but those same locks cannot be held in
> >> any other paths which do a memory allocation (as mentioned in one of the
> >> deadlock scenarios), that is probably the main thing to check for unmap.
> >>
> >
> > Right, OK we are on the same page now: no allocations happening on unmap,
> > but it can still deadlock, because the driver is typically going to
> > use a single lock to protect calls both map and unmap-related calls
> > to the buddy allocator.
>
> Yes exactly!
>
> >
> > For the deadlock above, I think a good way to break that deadlock is
> > to not allow taking that lock in a fence signaling calling path.
> >
> > So during an unmap, instead of "lock, unmap/free, unlock" it should
> > move the item to a deferred-free list, which is processed separately.
> > Of course, this is a little complex, because the allocation and reclaim
> > has to be aware of such lists if they get large.
> Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
> (whichever we take during map). The GPU buddy actually does GFP_KERNEL
> allocations internally which is problematic.
>
> Some solutions / next steps:
>
> 1. allocating (VRAM and system memory) outside mm locks just before acquiring them.
>
> 2. pre-allocating both VRAM and system memory needed, before the DMA fence
> critical paths (The issue is also to figure out how much memory to pre-allocate
> for the page table pages based on the VM_BIND request. I think we can analyze
> the page tables in the submit stage to make an estimate).
>
> 3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
> (called virt_buddy), which itself does GFP_KERNEL memory allocations in the
> allocate path. I am not sure what do yet about this. ISTR the maple tree also
> has similar issues.
>
> 4. Using non-reclaimable memory allocations where pre-allocation or
> pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
> don't fail allocations when memory is scarce).
>
> Will work on these issues for the v7. Thanks,

The way this works on nouveau at least (and I haven't yet read the
nova code in depth).

Is we have 4 stages of vmm page table mgmt.

ref - locked with a ref lock - can allocate/free memory - just makes
sure the page tables exist and are reference counted
map - locked with a map lock - cannot allocate memory - fill in the
PTEs in the page table
unmap - locked with a map lock - cannot allocate memory - removes
entries in PTEs
unref - locked with a ref lock - can allocate/free memory - just drops
references and frees (not sure if it ever merges).

So maps and unmaps can be in fence signalling paths, but unrefs are
done in free job from a workqueue.

Dave.
>
> --
> Joel Fernandes
>
