From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Compilation error in nouveau_exa.c
Date: Sat, 13 Jun 2009 11:48:54 +1000
Message-ID: <1244857734.3791.0.camel@localhost.localdomain>
References: <4A2FA30B.5080902@defora.org>
	<20090610164512.2259da49@daedalus.pq.iki.fi>
	<20090613000157.524d8440@laptop64.home>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090613000157.524d8440-7YwZxiNxsDIJmsy6czSMtA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andreas Radke <a.radke-KvP5wT2u2U0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2009-06-13 at 00:01 +0200, Andreas Radke wrote:
> Am Wed, 10 Jun 2009 16:45:12 +0300
> schrieb Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>:
> 
> > On Wed, 10 Jun 2009 14:11:55 +0200
> > Pierre Pronchery <khorben-tmMSDyayuCodnm+yROfE0A@public.gmane.org> wrote:
> > 
> > > 			Dear nouveau team,
> > > 
> > > compilation of the Nouveau driver is currently failing for me with
> > > the following error:
> > > 
> > <snip>
> > > 
> > > It used to compile without any problems. I am using:
> > > - NetBSD 5.0 stable
> > > - xorg-server 1.5.3
> > > - libX11 1.1.5
> > > - libxcb 1.1
> > > - Mesa 7.4
> > > - libdrm 2.4.7
> > > 
> > > Hints?
> > 
> > Yes. Use libdrm and DRM kernel modules from drm.git master, the
> > latest revision.
> > 
> 
> Same error here. ArchLinux kernel 2.6.30, libdrm 2.4.11 release, git drm
> module and current git nouveau shot.
> 
> I've seen commits nv50 related to "tile" stuff. May this be the breaker?
You missed the "Use libdrm from drm.git master" in the previous message.

Ben.
> 
> -Andy
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
