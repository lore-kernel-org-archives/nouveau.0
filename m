Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E0FD88FF
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 05:48:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3917110E31E;
	Wed, 11 Mar 2026 05:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG5ZrNsX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2DB704507F;
	Wed, 11 Mar 2026 05:38:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773207504;
 b=ocA7lGgoZeKZ66iz4RADcU2kMSNW2ZDVWasLfo8LY5dt09y+TODeWqrBHN4QgGyY+4Np/
 KkWV5b3C9mOQ1CyozRFiazx9uQhWSL4EjTm4JmadXmAHK+wQ7cr76BcpSOp/SmvvQ5/kvXM
 vS0XjAllKuBGXxhcE0gSOc6MzVgpUV+QdKMrR0wewVDJeAsTQS8SsgvoqwvrQGpINvrX9Rl
 bJP0dqDqlyhLlTAfGAV6jyWJQlOlH2yaLaZ6jdmrJve5VNluz1bVpHf1ymfzl60wmCnRJiP
 bqsnf7fMVmtEfJuNrsWyGKLYEeLYMhfWwpClI0tjy+BkHLnVHBKDLk49IeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773207504; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Xg8dJBCTiyUsmSk9k0KSbI7yoBU3J18PUc4lbb2XPi8=;
 b=dvKwfdGK8uLr3NAxiBI44//MskR9BGL4ulkJlQTc7ilEyzE4u8YoUE/V8HlNbyQoTgcKw
 wOY2ufy/pUgdWRbYiHGeua6KMeH4tRsnYRXNEiA1nM5IBq+W2wsx1o8OfeCniUv89W1ObgR
 UFBnny/78JC+0yu11JREm1aIBHccO/nosXln7odfEWNBtX075z1fsD1LoBTedOnHSsRboxM
 kRQac0nnz/wdqGhR7n07kNCmMZRXh/MmCrI3mNMf+XLeCn9TFvAviWM4CZz7qVtQyO/VpDT
 QPSNgAv047sh3Bh/Fsr66cKaE9kdnKhYud95PIjTVrovnOaI+6icJQe+vdUQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7F19D40696
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 05:38:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41F5010E31C
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 05:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773208135; x=1804744135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n9kI5ag5IOmp1ujdK0LROBmTbPkDFRZ0u8T9y7QYHsQ=;
  b=WG5ZrNsXZOJZLYlKkhBJ+7dkpd1Ho2h1houxueK0i/rIF4ifPGOvRmVr
   ipYJeV8W9NLrflGZWsO0xQa2MAu1jOj3rOyU+7jlBHn6Ofq56ZWGwGYzU
   ZhqmH1kk/VhlADQLImKiHk4nhtbGbhW9ww/R4NjqrLPpsa+szbTpqI88m
   rLIQRLibv53iVEcuM6gcKGqCutZetPZmcwwflLemLd266OmadzuPmNPVu
   leJz4mI7XnK229pKau/SlWQq1TuJA+EdTn4uBjv4nP7UNGjZLTJ4NS2jB
   +9shoEFQhgankiO8c1rveHAU5Vmp0Qa/RgDDC831NsTfv/F9lEYZ07ktM
   Q==;
X-CSE-ConnectionGUID: SRK0i9rsSGmmUGAPypGIOA==
X-CSE-MsgGUID: mTwye2iZTQmPvN8iWot/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84974222"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000";
   d="scan'208";a="84974222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:48:54 -0700
X-CSE-ConnectionGUID: SEuEcAvnQhK4pn9hS8vh0Q==
X-CSE-MsgGUID: cVxmsNidT0q7qt8tOhRmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000";
   d="scan'208";a="250857250"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2)
 ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 22:48:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0CR6-000000003Gr-3iOm;
	Wed, 11 Mar 2026 05:48:48 +0000
Date: Wed, 11 Mar 2026 06:48:34 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Message-ID: <202603110649.PeH4YNQx-lkp@intel.com>
References: <20260310220000.1897166-3-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310220000.1897166-3-ttabi@nvidia.com>
Message-ID-Hash: AC42YRXSFCTFEASCJ7WJ5MFSPJZ6G73W
X-Message-ID-Hash: AC42YRXSFCTFEASCJ7WJ5MFSPJZ6G73W
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AC42YRXSFCTFEASCJ7WJ5MFSPJZ6G73W/>
Archived-At: 
 <https://lore.freedesktop.org/202603110649.PeH4YNQx-lkp@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on a544873ce0575b2fd8285a1364d3e09929d9a3ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-device-add-device-name-method/20260311-060450
base:   a544873ce0575b2fd8285a1364d3e09929d9a3ba
patch link:    https://lore.kernel.org/r/20260310220000.1897166-3-ttabi%40nvidia.com
patch subject: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260311/202603110649.PeH4YNQx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110649.PeH4YNQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110649.PeH4YNQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/uaccess.rs:476:
            // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
            // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
            //   failure (e.g., bad address or unmapped memory).
   -        let res = unsafe {
   -            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
   -        };
   +        let res =
   +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };
            if res != 0 {
                return Err(EFAULT);
            }
>> Diff in rust/kernel/uaccess.rs:476:
            // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
            // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
            //   failure (e.g., bad address or unmapped memory).
   -        let res = unsafe {
   -            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
   -        };
   +        let res =
   +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };
            if res != 0 {
                return Err(EFAULT);
            }
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
