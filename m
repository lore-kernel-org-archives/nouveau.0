From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: Re: still seeking way to recover card after cursor
 disappears or card locks up
Date: Wed, 30 May 2012 20:55:49 -0700
Message-ID: <20120531035549.BBAEB23450@one.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Date: Wed, 30 May 2012 13:24:55 +0200
> From: Arvydas Sidorenko <asido4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>
> On Wed, May 30, 2012 at 6:25 AM, Robert M. Riches Jr.
> <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> wrote:
> > Is it considered safe to rmmod nouveau and then modprobe it back
> > again? ?I have a diskless system with a different card I could try
> > that with to gain confidence if the list says it's safe to do that.
> >
> > Thanks,
> >
> > Robert Riches
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
>
> I very doubt that rmmod and modprobe will help you in any way since
> nouveau is KMS module and it stays in use the whole time. Something
> will be broken anyway. But you can try and see what's happening, it
> will not brick your card.

Arvydas, thank you very much for that info/advice.  You were
100% right that rmmod refused to remove the nouveau module.

Is there any other way to force a reset of a graphics card or
driver module other than OS shutdown/reboot?

Thanks,

Robert Riches
