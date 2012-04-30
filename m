From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] nouveau/vieux: only advertise supported
 texture formats
Date: Mon, 30 Apr 2012 21:54:18 +0200
Message-ID: <1335815658.9221.22.camel@tellur>
References: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
	<87lildxfbh.fsf@riseup.net> <1335810158.9221.16.camel@tellur>
	<87vckhvwee.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87vckhvwee.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Montag, den 30.04.2012, 21:42 +0200 schrieb Francisco Jerez:
> Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
> 
> > Am Montag, den 30.04.2012, 20:08 +0200 schrieb Francisco Jerez:
> >> Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
> >>[...]
> >> > +	/* only advertise supported texture formats */
> >> > +	memset(&ctx->TextureFormatSupported, 0,
> >> > +	       sizeof(ctx->TextureFormatSupported));
> >> > +	ctx->TextureFormatSupported[MESA_FORMAT_XRGB8888] = true;
> >> > +	ctx->TextureFormatSupported[MESA_FORMAT_ARGB8888] = true;
> >> > +	ctx->TextureFormatSupported[MESA_FORMAT_RGB565] = true;
> >> > +	ctx->TextureFormatSupported[MESA_FORMAT_Z16] = true;
> >> > +	ctx->TextureFormatSupported[MESA_FORMAT_Z24_S8] = true;
> >> > +
> >> Hi Lucas,
> >> 
> >> It's not obvious to me how this works.  AFAIK nouveau doesn't make use
> >> of this array.  And even if it did, the texture formats you're listing
> >> aren't the supported ones.
> >
> > Hello Francisco,
> >
> > The core mesa code decides what texture formats to advertise based on
> > this array.
> 
> Are you sure?  TextureFormatSupported doesn't seem to have any effect
> except in drivers that use mesa's default for the ChooseTextureFormat
> hook.

I'm not able to test it myself, as I don't have any vieux hardware, but
I made sure that the patch got tested by the reporter of the bug [1],
before posting it to the list.

[1] https://bugs.freedesktop.org/show_bug.cgi?id=49148
> 
> > And obviously someone thought it would be a good idea to
> > init this array to "everything supported" if the driver doesn't
> > overrides this.
> >
> > I opted to only advertise renderable texture formats, for reasons
> > explained in my mail a minute ago.
