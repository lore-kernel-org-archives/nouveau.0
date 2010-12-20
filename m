From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: nouveau_bo_busy not supported in kernel anymore
Date: Mon, 20 Dec 2010 23:26:03 +0100
Message-ID: <1292883963.3094.274.camel@workstation>
References: <1292880035.3094.266.camel@workstation> <87sjxs2kg2.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87sjxs2kg2.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ok, so some people including me just misunderstood the commit. Thanks
for the enlightenment.

-- lynxeye

Am Montag, den 20.12.2010, 22:39 +0100 schrieb Francisco Jerez: 
> Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:
> 
> > Hi all,
> >
> > I want to bring up this issue again on the mailing list, since it got
> > lost in some irc chat a few days ago.
> >
> > Deadwood came to the channel and noted that
> > 25ee1f0e25195729f28b15f33d74db9ec6afd696 removes support for
> > NOUVEAU_GEM_CPU_PREP_NOBLOCK in the kernel.
> 
> It doesn't, it just removes the NOBLOCK flag, because it's the default
> (and only) behavior now.
> 
> >[...]
