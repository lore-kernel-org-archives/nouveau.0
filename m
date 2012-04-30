From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] nouveau/vieux: only advertise supported
 texture formats
Date: Mon, 30 Apr 2012 20:26:34 +0200
Message-ID: <1335810394.9221.17.camel@tellur>
References: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
	<87lildxfbh.fsf@riseup.net> <1335810158.9221.16.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335810158.9221.16.camel@tellur>
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

And I managed to hit "reply privately" two times in a row. -.-

Am Montag, den 30.04.2012, 20:22 +0200 schrieb Lucas Stach:
> Am Montag, den 30.04.2012, 20:08 +0200 schrieb Francisco Jerez:
> > Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
> > 
> > > Fixes an assertion seen by users.
> > >
> > > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > > Tested-by: JohnDoe_71Rus on irc
> > > ---
> > >  src/mesa/drivers/dri/nouveau/nouveau_context.c |    9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/src/mesa/drivers/dri/nouveau/nouveau_context.c b/src/mesa/drivers/dri/nouveau/nouveau_context.c
> > > index 4845767..46c0d70 100644
> > > --- a/src/mesa/drivers/dri/nouveau/nouveau_context.c
> > > +++ b/src/mesa/drivers/dri/nouveau/nouveau_context.c
> > > @@ -117,6 +117,15 @@ nouveau_context_init(struct gl_context *ctx, struct nouveau_screen *screen,
> > >  	nouveau_span_functions_init(ctx);
> > >  	_mesa_allow_light_in_model(ctx, GL_FALSE);
> > >  
> > > +	/* only advertise supported texture formats */
> > > +	memset(&ctx->TextureFormatSupported, 0,
> > > +	       sizeof(ctx->TextureFormatSupported));
> > > +	ctx->TextureFormatSupported[MESA_FORMAT_XRGB8888] = true;
> > > +	ctx->TextureFormatSupported[MESA_FORMAT_ARGB8888] = true;
> > > +	ctx->TextureFormatSupported[MESA_FORMAT_RGB565] = true;
> > > +	ctx->TextureFormatSupported[MESA_FORMAT_Z16] = true;
> > > +	ctx->TextureFormatSupported[MESA_FORMAT_Z24_S8] = true;
> > > +
> > Hi Lucas,
> > 
> > It's not obvious to me how this works.  AFAIK nouveau doesn't make use
> > of this array.  And even if it did, the texture formats you're listing
> > aren't the supported ones.
> 
> Hello Francisco,
> 
> The core mesa code decides what texture formats to advertise based on
> this array. And obviously someone thought it would be a good idea to
> init this array to "everything supported" if the driver doesn't
> overrides this.
> 
> I opted to only advertise renderable texture formats, for reasons
> explained in my mail a minute ago.
> 
> -- Lucas
> > 
> > >  	/* Allocate a hardware channel. */
> > >  	ret = nouveau_object_new(&context_dev(ctx)->object, 0xbeef0000,
> > >  				 NOUVEAU_FIFO_CHANNEL_CLASS,
> 
