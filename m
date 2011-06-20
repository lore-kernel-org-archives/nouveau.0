From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gpu lockup detection and fallback to noaccel
Date: Mon, 20 Jun 2011 10:17:02 +1000
Message-ID: <1308529026.2464.1.camel@nisroch>
References: <20110614211859.GA3687@joi.lan>
	<1308119242.8806.1.camel@maxim-laptop> <20110619222554.GI4771@joi.lan>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110619222554.GI4771-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2011-06-20 at 00:25 +0200, Marcin Slusarz wrote:
> On Wed, Jun 15, 2011 at 09:27:22AM +0300, Maxim Levitsky wrote:
> > On Tue, 2011-06-14 at 23:18 +0200, Marcin Slusarz wrote: 
> > > Hi
> > > 
> > > I have a very rough patchset which adds support for GPU lockup detection and fallback
> > > to (more or less) noaccel to xf86-video-nouveau.
> > > 
> > > As the patches are only a proof of concept and needs a lot of work, I would like
> > > to know first if this is a desired feature - I don't want to spend a couple of days
> > > on patches which will be ignored or rejected with a reason "we don't need it".
> > > 
> > > So, what do you think?
> > 
> > Will love it! I have unexplained hangs here, so maybe I could debug them
> > further with this.
> > 
> 
> Thanks for encouragement. But...
> 
> I was hoping for reponse from someone with commit access. I really really hate wasting
> time, so I'm not going to finish it. Oh well, I guess it's not that important as I thought.
Hey,

I'd be interested in seeing the approach you've taken at least.  I'm not
convinced this is something we want exactly, my fear is that a lot of
bugs will end up covered over with people not noticing.  But, lets
see :)

Ben.

> 
> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
