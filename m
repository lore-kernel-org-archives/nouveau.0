Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40CD25B4D
	for <nouveau@archiver.kernel.org>; Wed, 28 Jan 2026 12:04:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6F10E6C1;
	Wed, 28 Jan 2026 12:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hx8cf+jz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D7CE040B8C;
	Wed, 28 Jan 2026 11:55:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769601315;
 b=SlGi1KSzS+rtu/0fKA5VYkycLFQhzb1OIM9W6ycQ4t1qkwl53i6fqOlnoj7lfogZAYXrT
 cQoeOAqzrM2sUGfgCXcW0ehHhvtAaKqvh89ogl+kiGukbZRZ6OF7JuR+8sXjDaD5hL1czbM
 wfmlb41qrRw8yKy2WiVxGwmSLeyiTniWqhm5g/fPxi+vwpVOmsEua2GgD6YcRNXwgLDDRPm
 mM7AYt2XWmGct7L6RZk8JduKrSmJ+Fzzmy/NAipM6xmDYn+e0CwbxTmyLw98MD0S3sd5ME2
 o7D1WhGzquC8Uks0EJExVvrYM0fMtdJ6eod5781ocam68VvoSJLPwPk9M8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769601315; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XbTDBy78p0zdK64a9O0hEHyfbx8QvxdEFg/DCF6Lph0=;
 b=y3+bDe1gJrHolZ0tcYXhxUBAU+/X5pkN+UmwaAWlrBFWYb04H8sG5iOGVBXWSUlvG2+PU
 40eAxQR7/yYl18X/Ms8gRdEmc6OxMQPc1twXAgyAShqLhD9CI3a71pZ3hWAzgEa6MTfu/XN
 KUEMcf2p7auQfBdzLQK/1TGX8SKDOezJMwFSzMjjcYfzCTnKCfHtukC2HsgWGbHRt3ZNACK
 CAaBlJQnbA9xY7y0mT8AKY0oaUGt2zGYs+Jw1hAcqUZfXxalc3Da2S5lYrFZHlGiA14WcLI
 WI8S8snp3DiukB+RpaCycuJeu6KNtbt01MeKBQ1YtTELHaGDTu6lKIExB8kg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C894D40803
	for <nouveau@lists.freedesktop.org>; Wed, 28 Jan 2026 11:55:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6710E6AF;
	Wed, 28 Jan 2026 12:04:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 588EB4038E;
	Wed, 28 Jan 2026 12:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA89C4CEF1;
	Wed, 28 Jan 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769601854;
	bh=ZmWp47hdVxyqv1Ds+2Hq8SoLybTurOLu+L6KbG5zDis=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Hx8cf+jzc7ub0hEm2EJD7hjBM5GYjypHZfOvHh9LRFTILWZObQdgV/HK/IWv+uLPy
	 QzwMaPaZwA+V+WErhedeik+QeYs1j80V+8P+jOhgKApsZ1s79rGFAC6RUq4+D5Ardn
	 n62+ipYg5+OX6sXbx9BsgWCbDyUkOOSoZW9EPkqcJk4sUK+fsaoJcXefEI/9RvlHNC
	 eqkqF2D98GiwsjvyxkKugFrsM93/vx/v/+zhBRaGrlGsp/aOZuQGevj0bw7jmsrvBG
	 cv+blyDHbdlOGVFLw2q2+VMmk/cjQy252+jpZJPmDd65c5tggySUXW4QONEzl5E3Ao
	 RqgAJXywJWoUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 13:04:02 +0100
Message-Id: <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
In-Reply-To: 
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
Message-ID-Hash: DEC5PZQM3EPFS3EGSTBFGINDT5KTTOJU
X-Message-ID-Hash: DEC5PZQM3EPFS3EGSTBFGINDT5KTTOJU
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DEC5PZQM3EPFS3EGSTBFGINDT5KTTOJU/>
Archived-At: 
 <https://lore.freedesktop.org/DG07HZN0PL87.X5MKDCVVYIRE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 23, 2026 at 12:16 AM CET, Joel Fernandes wrote:
> My plan is to make TLB and PRAMIN use immutable references in their funct=
ion
> calls and then implement internal locking. I've already done this for the=
 GPU
> buddy functions, so it should be doable, and we'll keep it consistent. As=
 a
> result, we will have finer-grain locking on the memory management objects
> instead of requiring to globally lock a common GpuMm object. I'll plan on
> doing this for v7.
>
> Also, the PTE allocation race you mentioned is already handled by PRAMIN
> serialization. Since threads must hold the PRAMIN lock to write page tabl=
e
> entries, concurrent writers are not possible:
>
>   Thread A: acquire PRAMIN lock
>   Thread A: read PDE (via PRAMIN) -> NULL
>   Thread A: alloc PT page, write PDE
>   Thread A: release PRAMIN lock
>
>   Thread B: acquire PRAMIN lock
>   Thread B: read PDE (via PRAMIN) -> sees A's pointer
>   Thread B: uses existing PT page, no allocation needed

This won't work unfortunately.

We have to separate allocations and modifications of the page tabe. Or in o=
ther
words, we must not allocate new PDEs or PTEs while holding the lock protect=
ing
the page table from modifications.

Once we have VM_BIND in nova-drm, we will have the situation that userspace
passes jobs to modify the GPUs virtual address space and hence the page tab=
les.

Such a jobs has mainly three stages.

  (1) The submit stage.

      This is where the job is initialized, dependencies are set up and the
      driver has to pre-allocate all kinds of structures that are required
      throughout the subsequent stages of the job.

  (2) The run stage.

      This is the stage where the job is staged for execution and its DMA f=
ence
      has been made public (i.e. it is accessible by userspace).

      This is the stage where we are in the DMA fence signalling critical
      section, hence we can't do any non-atomic allocations, since otherwis=
e we
      could deadlock in MMU notifier callbacks for instance.

      This is the stage where the page table is actually modified. Hence, w=
e
      can't acquire any locks that might be held elsewhere while doing
      non-atomic allocations. Also note that this is transitive, e.g. if yo=
u
      take lock A and somewhere else a lock B is taked while A is already h=
eld
      and we do non-atomic allocations while holding B, then A can't be hel=
d in
      the DMA fence signalling critical path either.

      It is also worth noting that this is the stage where we know the exac=
t
      operations we have to execute based on the VM_BIND request from users=
pace.

      For instance, in the submit stage we may only know that userspace wan=
ts
      that we map a BO with a certain offset in the GPUs virtual address sp=
ace
      at [0x0, 0x1000000]. What we don't know is what exact operations this=
 does
      require, i.e. "What do we have to unmap first?", "Are there any
      overlapping mappings that we have to truncate?", etc.

      So, we have to consider this when we pre-allocate in the submit stage=
.

  (3) The cleanup stage.

      This is where the job has been signaled and hence left the DMA fence
      signalling critical section.

      In this stage the job is cleaned up, which includes freeing data that=
 is
      not required anymore, such as PTEs and PDEs.
