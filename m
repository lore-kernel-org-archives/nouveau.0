From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Thu, 29 Dec 2011 02:38:50 +0100
Message-ID: <20111229013850.GA4076@joi.lan>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<20111029190938.GA3105@joi.lan> <20111109221009.GD3402@joi.lan>
	<4EBB78F4.2020902@ensi-bourges.fr> <20111228213902.GA4275@joi.lan>
	<4EFBAD2B.8080207@ensi-bourges.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EFBAD2B.8080207-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Dec 29, 2011 at 12:58:35AM +0100, Martin Peres wrote:
> On 28/12/2011 22:39, Marcin Slusarz wrote:
> > Heh, with page flipping enabled, regression is still there, only smaller
> > (61->54, instead of 49 FPS).
> >
> > I want my Nouveau performance back ;)
> >
> > ---
> > From: Marcin Slusarz<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Subject: [PATCH] drm/nv50/gr: make "xfers only in ctxprog" optional
> >
> > Commit fbba036a56fe0e5c5e8c91daf3fa211f88d94a03
> > "drm/nv50/gr: enable ctxprog xfer only when we need it to save power"
> > introduced performance regression.
> >
> > So revert to previous behaviour and add module option (nv50_xfer_ctxprog=0/1)
> > to restore it back.
> >
> > Signed-off-by: Marcin Slusarz<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Hi,
> 
> I'm really sorry about not following up to your many emails you sent me 
> in the past.
> 
> I now have time to work on this issue and I would like a little more 
> information if you don't mind. Could you do a mmiotrace and look at what 
> nvidia does in their ctxprog for your specific card ?

Nvidia does the same, see http://paste.pocoo.org/show/500376/ (we talked about
it on IRC on 30 Oct). If you want me to get something else out of the mmiotrace,
just tell me.

> If nVidia does the same thing as we do, well, you'll have to wait for 
> something I've been thinking for some times now.
> 
> What we want is to define power consumption profiles. A simple example 
> is, when on battery, you don't want to save as much power as possible 
> but when you are on sector, you may want to get the full performance out 
> of your card (You may also don't mind the performance loss, but one 
> thing at a time).
>
> Ben (darktama) has recently talked about introducing a kind of automatic 
> reclocking kind of like what radeon does. That is to say, having 
> performance profiles that are switched according to the energy source 
> (battery / sector). This automatic behaviour could then be overriden by 
> the user, just like radeon.
> 
> We would then turn some nobs according to the current performance 
> profile. One of these nobs could be xfer on some specific cards (yours).
> 
> Would that solution suit you?

Sounds good. I initially thought about connecting it to reclocking, but your
idea is even better - xfers enablement could depend only on power source.

I tried to implement xfers runtime switching, but couldn't figure out how to
change ctxprog behaviour without rebuilding and reuploading whole thing.
Reading host-writable memory from ctxprog would be enough.

> Clearly, introducing a new kernel 
> parameter isn't an acceptable solution to the problem.

Yeah, I just wanted to start the discussion.

Marcin
