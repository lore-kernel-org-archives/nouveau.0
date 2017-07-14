From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 18:33:01 +0200
Message-ID: <1500049981.5248.2.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
         <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
         <1500039368.5763.12.camel@gmx.de>
         <20170714155047.2zs3ps7cmnyvvwgb@hirez.programming.kicks-ass.net>
         <1500047898.5763.25.camel@gmx.de>
         <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714161027.5htn5jlswvfgphzw@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, jeyu@kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, 2017-07-14 at 18:10 +0200, Peter Zijlstra wrote:
> On Fri, Jul 14, 2017 at 05:58:18PM +0200, Mike Galbraith wrote:
> > On Fri, 2017-07-14 at 17:50 +0200, Peter Zijlstra wrote:
> 
> > > Urgh, is for some mysterious reason the __bug_table section of modules
> > > ending up in RO memory?
> > > 
> > > I forever get lost in that link magic :/
> > 
> > +1
> > 
> > drm.ko
> >  20 __bug_table   00000630  0000000000000000  0000000000000000  0004bff3  2**0
> >                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
> > vmlinux
> >  15 __bug_table   0000ba84  ffffffff81af26c0  0000000001af26c0  00cf26c0  2**0
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > 
> > Danged if I know... um um RELOC business mucks things up?
> 
> Argh, it shouldn't be READONLY for vmlinux either, but apparently that
> is working for mysterious reasons.
> 
> Some architectures were in fact complaining that I broke that, and hence
> patch:
> 
> b5effd3815cc ("debug: Fix __bug_table[] in arch linker scripts")
> 
> I think we need professional help with this linking stuff, but who to
> ask?

Andy Lutomirski?
