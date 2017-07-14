From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:50:47 +0200
Message-ID: <20170714155047.2zs3ps7cmnyvvwgb@hirez.programming.kicks-ass.net>
References: <1499794333.5315.8.camel@gmx.de>
 <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
 <1499796510.5315.27.camel@gmx.de>
 <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
 <1499853345.23742.8.camel@gmx.de>
 <1499858703.23742.25.camel@gmx.de>
 <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
 <1500039368.5763.12.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500039368.5763.12.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Galbraith <efault@gmx.de>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, jeyu@kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 14, 2017 at 03:36:08PM +0200, Mike Galbraith wrote:
> Ok, a network outage gave me time to go hunting.  Indeed it is a bad
> interaction with the tree DRM merged into.  All DRM did was to slip a
> WARN_ON_ONCE() that nouveau triggers into a kernel module where such
> things no longer warn, they blow the box out of the water.  I made a
> dinky testcase module (attached), and bisected to the real root....
> 
> 19d436268dde95389c616bb3819da73f0a8b28a8 is the first bad commit
> commit 19d436268dde95389c616bb3819da73f0a8b28a8
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Sat Feb 25 08:56:53 2017 +0100
> 
>     debug: Add _ONCE() logic to report_bug()

Urgh, is for some mysterious reason the __bug_table section of modules
ending up in RO memory?

I forever get lost in that link magic :/
