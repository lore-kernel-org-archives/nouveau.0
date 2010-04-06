From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Tue, 6 Apr 2010 21:21:09 +0200
Message-ID: <20100406192109.GA2943@joi.lan>
References: <4BBA4F3C.9070606@epsm.fr> <20100405214559.GA4230@joi.lan>
	<4BBAF07E.9070005@epsm.fr> <20100406172019.GA2744@joi.lan>
	<4BBB80B8.5000806@epsm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BBB80B8.5000806-GqzDj6/B2j8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Apr 06, 2010 at 08:43:04PM +0200, Didier Spaier wrote:
> Marcin Slusarz wrote:
> > On Tue, Apr 06, 2010 at 10:27:42AM +0200, Didier Spaier wrote:
> >> Thansk for your answer, kernel logs are attached.
> >>
> > 
> > Can you check attached patch? It's a quick hack to kick vesa before
> > we initialize the hardware.
> > 
> > Marcin
> > 
> I tried it on a vanilla Linus' 2.6.33.1 kernel and on a recent 2.6 Nouveau kernel pulled from git.
> 
> In both case switch from VESA to nouveaufb works well during startup, thanks ;)

Great!

> Will this patch be applied to mainstream ?

Not exactly this one. I'll cook a proper patch in a few days and ping you for
final testing, ok?

Marcin
