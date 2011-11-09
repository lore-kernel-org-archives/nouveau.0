From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Wed, 9 Nov 2011 23:10:09 +0100
Message-ID: <20111109221009.GD3402@joi.lan>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<20111029190938.GA3105@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111029190938.GA3105-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Oct 29, 2011 at 09:09:38PM +0200, Marcin Slusarz wrote:
> On Sat, Oct 29, 2011 at 07:29:23PM +0200, Marcin Slusarz wrote:
> > On Sat, Oct 29, 2011 at 07:08:01PM +0200, Marcin Slusarz wrote:
> > > Hi
> > > 
> > > I've bisected pretty big performance regression (nv92):
> > > 
> > > $ git bisect good
> > > b2737681d5442f05ab6419e05468c3d2511a5ced is the first bad commit
> > > commit b2737681d5442f05ab6419e05468c3d2511a5ced
> > > Author: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
> > > Date:   Sat Jul 30 23:08:45 2011 +0200
> > > 
> > >     drm/nv50/gr: enable ctxprog xfer only when we need it to save power
> > 
> > Weird, reverting it on top of current git does not restore it - in
> > glxgears it's even worse (-~50%).
> 
> It seems "drm/nv50/gr: refactor initialisation" relies on the above.
> 
> So, reverting these commits:
> 
> drm/nv50/gr: typo fix, how about we not reset fifo during graph init?
> drm/nv50/gr: refactor initialisation
> drm/nv50/gr: enable ctxprog xfer only when we need it to save power
> 
> on top of current git restores performance to the previous state.
> 
> (First commit fixes bug in 2nd, so it needs to be reverted first)

For anyone who don't read IRC logs - it turns out it regressed only on my
box, because I have page flipping disabled (due to page flipping being very
buggy here, see https://bugs.freedesktop.org/show_bug.cgi?id=42398), which
forces gpu context switch on every frame - even with (OpenGL) full screen apps.
And this patch slows down context switches.

So, can we disable xfers in ctxprog only when page flipping is enabled?
Or is there any other option?

Marcin
