Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0DAEF48D9
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 06:56:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A580910E793;
	Fri, 13 Feb 2026 06:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktD0cFay";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6C61B42FB2;
	Fri, 13 Feb 2026 06:47:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770965232;
 b=g7rBVEANpgDhymri2zS0248duBTMIi3pxAabLcngHu6F9j+cYiCUd6e49TPkDzErARmYw
 WfBcLV0MR32kw7pCLmN88kRHaMX2oeaJgicjSfdfi9h4cO+f6EZZwHY/ixzCQAbjtJ7TUwW
 6gEVoa1YzWhEwn8Ba9XVXdbrAMDmA3AEf1MZ49+ugEwtbQiiYH0RK2fSN9YdmIjSTOQFKol
 MxcxWbzkohy/dkAKzP14Ga42KJ5frfbiKWfW2BuL9QrEDogNB7Hb3FT5H0DcM0d/BtiXCzJ
 jg0LJ6a4Gnts29W/Lj3+ewOSUOEDXpOr5JsqYrvnNURqRc2uy9wLmrzZVegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770965232; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zJtBgW2Z3bgS3bEUNse/KXf+/r4XiYjdgr2peBDbwN8=;
 b=V0GT76L+I+PqHr14DnXY/xR3tgwvWJzcPlttcISKgL/vWpo4ImcEy2+cG560Xb7LY1k0b
 z6VRT9Tc9LHdpWXTnrE41PZ/oP0uCnDpN5yOeQujXfZ4x59QoAn+HMv1pOrAd42L2PV9aF6
 TUiFV8AL2clMVowtMY1shkgwAS66JD5AGW8vdGHTl81ClulofBy+GukAsKZSKjkS7F9MwLq
 XhNJBOaI73hNwC4KJdg+XrFv+vGXP0zYEAcVkRfuGkkAdD7i19Y3+yJ6zCK895LG7NZRsOy
 1Q0WW+FDdjVZfkVfrkeWqNCk18qS7g1x7FKiZZhFonD6/MqLHReRc8jlfEXw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7CBC440686
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 06:47:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6193410E113;
	Fri, 13 Feb 2026 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770965806; x=1802501806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vegqm/oeFsIY53GNgrWQP8lsZxc41ZJwRfMmlMzHjY4=;
  b=ktD0cFayvlsZesnekdN1IUnga+U1wFYOeUw9A6eQJeCae6OYXx2b+RRI
   u3DYlscsmnmO74zF9bm24gNTTksO8YUqYVLJdrHqeMLI9VBXI0LcTDhVj
   d16rweMKvc+NDZlvy8MVIRUIXXkB9wMb7MPVA1PVqj8TT0K1ofgjWj5h0
   L3jrvYdb+xG1nMnvyoQQwA2hRs/YkeuqgfSqW2UDetCHSadVhIZO2cBtm
   +SOtdJ4EX4+QuJvFSCqhxsSENfrw5Nzi72dG/yvmLnnyzNUG3vKg6JHlm
   J+5dpj74pDAncSw9i3ToLqClJhxsaUaP15lbu12qh/2gjINvt/t/guPJD
   w==;
X-CSE-ConnectionGUID: VCU2dWgJRXu4WS9ev2zoSw==
X-CSE-MsgGUID: J3yio4wNS/m6ZiLTa4HnLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75994809"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800";
   d="scan'208";a="75994809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 22:56:45 -0800
X-CSE-ConnectionGUID: xlzU7Pj4RWSMblhjM9D6JA==
X-CSE-MsgGUID: fMZ0mudwSIiMspMfL4HUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800";
   d="scan'208";a="217312572"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123)
 ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Feb 2026 22:56:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqn6V-000000001Rl-398c;
	Fri, 13 Feb 2026 06:56:39 +0000
Date: Fri, 13 Feb 2026 07:56:03 +0100
From: kernel test robot <lkp@intel.com>
To: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Message-ID: <202602130722.99jbGBM1-lkp@intel.com>
References: <20260212-drm-rust-next-v1-1-409398b12e61@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-drm-rust-next-v1-1-409398b12e61@proton.me>
Message-ID-Hash: B2QWMHZ5KPAUZUIFIL33WKG5SUK7N3W6
X-Message-ID-Hash: B2QWMHZ5KPAUZUIFIL33WKG5SUK7N3W6
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B2QWMHZ5KPAUZUIFIL33WKG5SUK7N3W6/>
Archived-At: 
 <https://lore.freedesktop.org/202602130722.99jbGBM1-lkp@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Tim,

kernel test robot noticed the following build errors:

[auto build test ERROR on cea7b66a80412e2a5b74627b89ae25f1d0110a4b]

url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Kovalenko-via-B4-Relay/gpu-nova-core-fix-stack-overflow-in-GSP-memory-allocation/20260213-115022
base:   cea7b66a80412e2a5b74627b89ae25f1d0110a4b
patch link:    https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61%40proton.me
patch subject: [PATCH] gpu: nova-core: fix stack overflow in GSP memory allocation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260213/202602130722.99jbGBM1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130722.99jbGBM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130722.99jbGBM1-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gsp/cmdq.rs:207:
            let item = gsp_mem.item_from_index(0)?;
            for i in 0..NUM_PAGES {
                let pte_value = gsp_mem
   -                    .dma_handle()
   -                    .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   -                    .ok_or(EOVERFLOW)?;
   +                .dma_handle()
   +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   +                .ok_or(EOVERFLOW)?;
    
                // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
                // dereferenced. The compiler also further validates the expression on whether `field`
>> Diff in drivers/gpu/nova-core/gsp/cmdq.rs:207:
            let item = gsp_mem.item_from_index(0)?;
            for i in 0..NUM_PAGES {
                let pte_value = gsp_mem
   -                    .dma_handle()
   -                    .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   -                    .ok_or(EOVERFLOW)?;
   +                .dma_handle()
   +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   +                .ok_or(EOVERFLOW)?;
    
                // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
                // dereferenced. The compiler also further validates the expression on whether `field`
>> Diff in drivers/gpu/nova-core/gsp/cmdq.rs:207:
            let item = gsp_mem.item_from_index(0)?;
            for i in 0..NUM_PAGES {
                let pte_value = gsp_mem
   -                    .dma_handle()
   -                    .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   -                    .ok_or(EOVERFLOW)?;
   +                .dma_handle()
   +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
   +                .ok_or(EOVERFLOW)?;
    
                // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
                // dereferenced. The compiler also further validates the expression on whether `field`
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
