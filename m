From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: 2dd4d163cd9c ("drm/nouveau: remove open-coded version
 of remove_conflicting_pci_framebuffers()")
Date: Thu, 18 Jun 2020 22:39:07 +0200
Message-ID: <20200618203907.GG27951@zn.tnic>
References: <20200618200106.GF27951@zn.tnic>
 <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UviibvRfqJgtLkePEuXFa6mQfi4h=7eeW+YQxB-StVjjrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 04:19:02PM -0400, Ilia Mirkin wrote:
> Hi Boris,
> 
> There was a fixup to that patch that you'll also have to revert first
> -- 7dbbdd37f2ae7dd4175ba3f86f4335c463b18403. I guess there's some
> subtle difference between the old open-coded logic and the helper,
> they were supposed to be identical.

Thanks, that's a good point. I reverted both but it still hangs. So
either my bisection is wrong or reverting those two is not enough due to
other changes.

I'll redo the bisection tomorrow, on a fresh head, to check.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
