From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Sun, 30 Oct 2011 11:15:29 +1000
Message-ID: <1319937329.4794.0.camel@nisroch>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<CAGZ4FETt6QzMkxrMQwJsszjuQq0wdt85ujRZbxkdurkduaHh2A@mail.gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FETt6QzMkxrMQwJsszjuQq0wdt85ujRZbxkdurkduaHh2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 2011-10-29 at 20:00 +0200, Maarten Maathuis wrote:
> On Sat, Oct 29, 2011 at 7:29 PM, Marcin Slusarz
> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Sat, Oct 29, 2011 at 07:08:01PM +0200, Marcin Slusarz wrote:
> >> Hi
> >>
> >> I've bisected pretty big performance regression (nv92):
> >>
> >> $ git bisect good
> >> b2737681d5442f05ab6419e05468c3d2511a5ced is the first bad commit
> >> commit b2737681d5442f05ab6419e05468c3d2511a5ced
> >> Author: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
> >> Date:   Sat Jul 30 23:08:45 2011 +0200
> >>
> >>     drm/nv50/gr: enable ctxprog xfer only when we need it to save power
> >
> > Weird, reverting it on top of current git does not restore it - in
> > glxgears it's even worse (-~50%).
> >
> > Marcin
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> 
> Before this patch, what ensured that context switching was enabled?
It was enabled by default during graph init, this was removed with the
"drm/nv50/gr: refactor initialisation" commit.

Ben.
> 
