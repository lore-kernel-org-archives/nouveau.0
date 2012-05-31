From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: still seeking way to recover card after cursor
 disappears or card locks up
Date: Thu, 31 May 2012 15:13:16 +1000
Message-ID: <20120531051316.GA6473@nisroch.bne.redhat.com>
References: <20120531035549.BBAEB23450@one.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120531035549.BBAEB23450-QrSMeLIW4KwXpj0+iOhflA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, May 30, 2012 at 08:55:49PM -0700, Robert M. Riches Jr. wrote:
> > Date: Wed, 30 May 2012 13:24:55 +0200
> > From: Arvydas Sidorenko <asido4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
> > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >
> > On Wed, May 30, 2012 at 6:25 AM, Robert M. Riches Jr.
> > <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> wrote:
> > > Is it considered safe to rmmod nouveau and then modprobe it back
> > > again? ?I have a diskless system with a different card I could try
> > > that with to gain confidence if the list says it's safe to do that.
> > >
> > > Thanks,
> > >
> > > Robert Riches
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> > I very doubt that rmmod and modprobe will help you in any way since
> > nouveau is KMS module and it stays in use the whole time. Something
> > will be broken anyway. But you can try and see what's happening, it
> > will not brick your card.
> 
> Arvydas, thank you very much for that info/advice.  You were
> 100% right that rmmod refused to remove the nouveau module.
> 
> Is there any other way to force a reset of a graphics card or
> driver module other than OS shutdown/reboot?

# echo 0 > /sys/class/vtconsole/vtcon1/bind; modprobe -r nouveau

That should allow you to unload.  Depending on the card, you won't have
a display after this (pre-GeForce8 should restore VGA mode) and will
have to reload the module blindly.

Ben.

> 
> Thanks,
> 
> Robert Riches
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
