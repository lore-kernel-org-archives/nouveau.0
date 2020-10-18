From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [Ocfs2-devel] [RFC] treewide: cleanup unreachable breaks
Date: Sun, 18 Oct 2020 19:59:43 +0100
Message-ID: <20201018185943.GM20115@casper.infradead.org>
References: <20201017160928.12698-1-trix@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
To: trix@redhat.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, clang-built-linux@googlegroups.com, linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org, storagedev@microchip.com, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org, ath10k@lists.infradead.org, MPT-FusionLinux.pdl@broadcom.com, linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org, amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org, industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org, spice-devel@lists.
List-Id: nouveau.vger.kernel.org

On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
> clang has a number of useful, new warnings see
> https://urldefense.com/v3/__https://clang.llvm.org/docs/DiagnosticsReference.html__;!!GqivPVa7Brio!Krxz78O3RKcB9JBMVo_F98FupVhj_jxX60ddN6tKGEbv_cnooXc1nnBmchm-e_O9ieGnyQ$ 

Please get your IT department to remove that stupidity.  If you can't,
please send email from a non-Red Hat email address.

I don't understand why this is a useful warning to fix.  What actual
problem is caused by the code below?

> return and break
> 
>  	switch (c->x86_vendor) {
>  	case X86_VENDOR_INTEL:
>  		intel_p5_mcheck_init(c);
>  		return 1;
> -		break;

Sure, it's unnecessary, but it's not masking a bug.  It's not unclear.
Why do we want to enable this warning?
