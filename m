From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] nouveau/vieux: only advertise supported
 texture formats
Date: Mon, 30 Apr 2012 20:27:17 +0200
Message-ID: <1335810437.9221.18.camel@tellur>
References: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
	<4F9ED1D2.9030004@student.tuwien.ac.at>
	<1335809942.9221.13.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335809942.9221.13.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

And I managed to hit "reply privately" two times in a row. -.-

Am Montag, den 30.04.2012, 20:19 +0200 schrieb Lucas Stach:
> Am Montag, den 30.04.2012, 19:54 +0200 schrieb Christoph Bumiller:
> > On 30.04.2012 19:16, Lucas Stach wrote:
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
> > 
> > But it also seems to support ARGB1555, L8, A8 and I8, see
> > nouveau_choose_tex_format ...
> 
> Right, but I have no idea if we are able to render to those formats,
> which seems unlikely. Sadly I see no way to specify a texture format
> only for sampling in TextureFormatSupported, that's why I opted for the
> safe option here. We may have to revisit this at the latest when
> considering the S3TC work.
> 
> In any case this patch fixes an actual problem, which breaks every
> application that doesn't by luck choose one of the safe formats, so I
> would really like to see this patch pushed, even if it's only a stop
> gap.
> 
> -- Lucas
> > 
> > >  	/* Allocate a hardware channel. */
> > >  	ret = nouveau_object_new(&context_dev(ctx)->object, 0xbeef0000,
> > >  				 NOUVEAU_FIFO_CHANNEL_CLASS,
> > 
> 
