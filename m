From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau soft lockup after switcheroo'd...
Date: Thu, 1 Nov 2012 13:16:12 +0100
Message-ID: <20121101121612.GA5770@joi.lan>
References: <CAMVG2sum1Ch5JKyCM5=baSFxvSb-THFM4QWHTHH=3upi3fXnUA@mail.gmail.com>
	<20121024180746.GA26891@joi.lan>
	<CAMVG2sujgx=UP5VkwDP-udZzzFPY9CcxoLDk5-T-gq4jTKrttQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMVG2sujgx=UP5VkwDP-udZzzFPY9CcxoLDk5-T-gq4jTKrttQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Oct 29, 2012 at 10:09:07PM +0800, Daniel J Blueman wrote:
> On 25 October 2012 02:07, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Oct 24, 2012 at 01:54:43PM +0800, Daniel J Blueman wrote:
> >> On 13 October 2012 15:12, Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org> wrote:
> [...]
> >> echo IGD >/sys/kernel/debug/vgaswitcheroo/switch
> >> echo OFF >/sys/kernel/debug/vgaswitcheroo/switch
> >>
> >> after boot+40s:
> >>
> >> BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1703]
> [...]\
> >>  [<ffffffffa037c538>] nv04_timer_read+0x28/0x70 [nouveau]
> >>  [<ffffffffa037bfec>] nouveau_timer_wait_eq+0x7c/0xe0 [nouveau]
> >>  [<ffffffffa03f4f4e>] nvd0_sor_dpms+0xde/0x1a0 [nouveau]
> >>  [<ffffffff813871d9>] ? fb_set_var+0xe9/0x3a0
> >>  [<ffffffff811554a9>] ? __pte_alloc+0xa9/0x160
> >>  [<ffffffffa03f4e70>] ? nvd0_sor_dp_link_set+0x2c0/0x2c0 [nouveau]
> >>  [<ffffffffa00b2a5c>] drm_helper_connector_dpms+0xbc/0x100 [drm_kms_helper]
> >>  [<ffffffffa00b1665>] drm_fb_helper_dpms.isra.13+0xa5/0xf0 [drm_kms_helper]
> >>  [<ffffffffa00b16f9>] drm_fb_helper_blank+0x49/0x80 [drm_kms_helper]
> >>  [<ffffffff81386e16>] fb_blank+0x56/0xc0
> >>  [<ffffffff813887bb>] do_fb_ioctl+0x59b/0x5f0
> >>  [<ffffffff81152883>] ? vma_interval_tree_insert+0x83/0x90
> >>  [<ffffffff81388af5>] fb_ioctl+0x45/0x50
> >>  [<ffffffff8119adda>] do_vfs_ioctl+0x8a/0x340
> >>  [<ffffffff8119b121>] sys_ioctl+0x91/0xb0
> >>  [<ffffffff81189862>] ? sys_read+0x52/0xa0
> 
> > In case it's not obvious: Xorg tries to blank monitor connected to nvidia
> > card, but hangs because card is already powered down.
> >
> > Did it ever work? If yes, can you bisect it?
> > Does it work if you power down nvidia card while X is not running?
> 
> Thanks for your reply Marcin! I wasn't able to boot kernels earlier
> than 3.6 on this Macbook Pro retina due to various issues, and it
> occurs on kernels between and including 3.6 and 3.7-rc3.
> 
> As we see read being called, I've taken the lsof output [1].
> 
> Should the DPMS functions be deregistered prior the hardware being
> placed in D3, or is it more that the functions should check if the
> card was put into D3 and just return?

I'm not sure, but I would bet on adding a check(s). The question is: at which
layer (nouveau? drm? fb?)? Another is: are there any other code paths which
need to be protected from calling when suspended?
(Currently, I don't have answers to these questions and not much time to look
into them, sorry.)

If no one will figure it out in a few days, please open new bug report - see
http://nouveau.freedesktop.org/wiki/Bugs for description how to do this.

Marcin
