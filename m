Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444ABE8B389
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 02:07:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D032F10E347;
	Wed,  4 Feb 2026 02:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AY+3hqDh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 14AA041B48;
	Wed,  4 Feb 2026 01:57:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770170267;
 b=zX7B7UP4gq+gi9h7hyjvV5/RZEgKg82S6aUe3Y5GMs7E+a/KlM0TlJ+qUxp9KhEO+97GG
 bBsjXAN7lhOyPCFkehNrZWGsxvV0oQUNM3CSj+HWuKJXTc7Zhdnmz3ORk6zwWGoKyxb6sMH
 DRzRY/SGB6mo6cwEXGutkxic1Z58zaKWN+gBjxJG5Il2vevEf/dh85HYByfhGWIkxE13JXs
 xzU56+OhbwC6v3/rTOlRMYHli86NbRZi6Ri2R7chhgVbG2NLs9wBURX+FLFz81M8vXioMqj
 xcczbQbjfXPeUA84hMiCX7wKLVdSJB2RpxyY5W+Aipo1zP6enyYLLRUdZ35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770170267; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mgHSzhpE+WaFDH7jU6qPeChCnb14sSsIs14MM0/16qs=;
 b=UYrKlPeTBMG1+8T8PPzysN4mEQPzlbbwJGumglODbB1eJA9kWoQtwcES0/PcRtQFY5dC9
 noJTSJsSBZ27zt/6jgGf6kVSsNMFI/4TUTDHai9tu/mdVC9jIh6JGQxnAgJPJKsK0j7HDIB
 tn4MPustDJGJMQ4+Kr/37M3pqm7lflaIGoFGORtGImuUsZeYxPr7KM6dYF4C6tnt3kilvDC
 3qYzXeUE1A9sXiqEl8Cf/jAzuSScb37YibpxlV7O8CEXvpvTzdBajMZ002GqXIY/GxOfuTN
 4iexJXxSKRZb662So9QFRyfoS+GTKdYr87ia3xwotSNowCURunzwTMMzML7A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C4165402CB
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 01:57:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0910E0BA
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770170821; x=1801706821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OmadtR8LX8+TtK7CAHoBlD5U8CMSVir0JGVYr3z2zKU=;
  b=AY+3hqDhtZZMZ4Oxr1NlKt3ktdQUQGbFxsqucO8T7FY46vbU6HHPaaaO
   8++jnaQhaXABvoyrh6por6eCvo0gEUso8pinNtIpUQUNkaviaz9Tfaplz
   TH71O4Xv2Qp6874Yh8ogkn6vv8PFzOm8Ksc3HxA82pt3JCUpgwhQq9e9a
   Tg7KNTOGyEjsEIQJ7OgWXwdHHYtSUD++qD8z5RVvcNj5cDOtSuBdMjEKF
   eyN/I1qywPpxG4ZzK7hFJ36CugcmYYCwa9fn9dVw+XVkxVzmHk9O7N5cw
   v9pkuMs+EPGqZjdEXNcWJc/DnOLamCg8b5LtBihAq2DM7qM/PIZMLo6JU
   g==;
X-CSE-ConnectionGUID: rc/l2e3xSFGGEu00rCpDhQ==
X-CSE-MsgGUID: mD4ZbRFiRwy3Koaxz97PCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82465253"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800";
   d="scan'208";a="82465253"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 18:07:00 -0800
X-CSE-ConnectionGUID: k2IXUSdOQUGl1mM2blfv+g==
X-CSE-MsgGUID: 94/gl3siSvqat+fDqmgjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800";
   d="scan'208";a="214181742"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602)
 ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 18:06:57 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnSIA-000000003Xh-09Br;
	Wed, 04 Feb 2026 02:06:54 +0000
Date: Wed, 4 Feb 2026 03:06:23 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Message-ID: <202602040350.sw6i2Sp2-lkp@intel.com>
References: <20260203224757.871729-3-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203224757.871729-3-ttabi@nvidia.com>
Message-ID-Hash: XT7BMIWMCOGUS3TEP7AYQBOYVBFWDNGI
X-Message-ID-Hash: XT7BMIWMCOGUS3TEP7AYQBOYVBFWDNGI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XT7BMIWMCOGUS3TEP7AYQBOYVBFWDNGI/>
Archived-At: 
 <https://lore.freedesktop.org/202602040350.sw6i2Sp2-lkp@intel.com/>
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

[auto build test ERROR on cea7b66a80412e2a5b74627b89ae25f1d0110a4b]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-device-add-device-name-method/20260204-065057
base:   cea7b66a80412e2a5b74627b89ae25f1d0110a4b
patch link:    https://lore.kernel.org/r/20260203224757.871729-3-ttabi%40nvidia.com
patch subject: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040350.sw6i2Sp2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040350.sw6i2Sp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040350.sw6i2Sp2-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/uaccess.rs:471:
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
>> Diff in rust/kernel/uaccess.rs:471:
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
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
