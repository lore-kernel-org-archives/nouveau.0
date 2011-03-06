From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: CCACHE and VFETCH FAULTs causing lockups
Date: Sun, 06 Mar 2011 21:10:10 +0100
Message-ID: <1299442210.2253.9.camel@workstation>
References: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
	<1299016269.1822.3.camel@nisroch>
	<AANLkTimwGyz1d=W_ZdcaBARO0sw=wZ470Cwy+8407s-m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimwGyz1d=W_ZdcaBARO0sw=wZ470Cwy+8407s-m-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Just adding a me too.

I updated from 3fdb729eb7de5597961eb3fbaf0bdfe6f4262307 and now I get
lockups from time to time (max. 60 mins) with normal 2D desktop usage.
No 3D involved here.

Logs only contain:
Mar  6 17:27:51 workstation kernel: [  341.970412] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE FAULT
Mar  6 17:27:51 workstation kernel: [  341.970435] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE 000e0080 00000000 00000000 00000000
00000000 00000004 00000000
Mar  6 17:27:51 workstation kernel: [  341.970444] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP
Mar  6 17:27:51 workstation kernel: [  341.970456] [drm] nouveau
0000:01:00.0: PGRAPH - ch 2 (0x0000a38000) subc 5 class 0x8397 mthd
0x0f04 data 0x00000000

Tested chipset is my nvA8.

-- Lucas


Am Mittwoch, den 02.03.2011, 22:43 +0000 schrieb Maarten Maathuis:
> On Tue, Mar 1, 2011 at 9:51 PM, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On Tue, 2011-03-01 at 21:08 +0000, Maarten Maathuis wrote:
> >
> >> Those come after 15-30 minutes of running warzone2100, i haven't
> >> played any games for a while, so no idea how long this has been going
> >> on.
> >> I also got a TRAP_CCACHE on channel 2 a little while ago, it takes
> >> much longer to trigger (a few hours). I'm using todays "nouveau
> >> kernel" git.
> > You're not the first person to have reported this fwiw, personally, I
> > haven't seen it yet..
> >
> >>
> >> I'm guessing something is being unmapped too early or without reason,
> >> or some cache is stale. But it isn't obvious what exactly it is.
> >>
> >> Because i don't remember having these lockups before I'm inclined to
> >> guess that this commit is involved
> >> http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=6330d8f5ecc4a19fd2ad3c7fa128b2f4c2ce3360
> >>
> >> Any ideas?
> > Not really.  If this commit *is* the cause, the problem is still
> > somewhere else.  That commit just makes sure PTEs are marked invalid, so
> > if it's causing your faults, then previously the GPU would still have
> > been reading/writing invalid data.
> 
> I reverted the commit today and things seem to be going be better,
> I'll give it a few more days before coming to a conclusion. I
> understand that the real issue is somewhere else.
> 
> >
> > Plus, I expect you should probably have seen a VM fault..
> >
> > Ben.
> >>
> >> Maarten.
> >>
> >
> >
> >
> 
> 
> 
