From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: Re: still seeking way to recover card after cursor
Date: Sun, 03 Jun 2012 10:40:42 -0700
Message-ID: <20120603174042.4BFB22341A@one.localnet>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Date: Wed, 30 May 2012 13:24:55 +0200
> From: Arvydas Sidorenko
> To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>
> On Wed, May 30, 2012 at 6:25 AM, Robert M. Riches Jr.
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
>
> I very doubt that rmmod and modprobe will help you in any way since
> nouveau is KMS module and it stays in use the whole time. Something
> will be broken anyway. But you can try and see what's happening, it
> will not brick your card.



> Date: Thu, 31 May 2012 15:13:16 +1000
> From: Ben Skeggs
> To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
> Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>
> # echo 0 > /sys/class/vtconsole/vtcon1/bind; modprobe -r nouveau
>
> That should allow you to unload.  Depending on the card, you won't have
> a display after this (pre-GeForce8 should restore VGA mode) and will
> have to reload the module blindly.
>
> Ben.



> Date: Thu, 31 May 2012 20:06:28 +0300
> From: Pekka Paalanen
> To: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arvydas Sidorenko <asido4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Hi,
>
> The unloading instructions are also in the wiki:
> http://nouveau.freedesktop.org/wiki/KernelModeSetting
>
> Also a suspend-resume cycle has been said to help in recovering a
> locked-up GPU.
>
>
> Thanks,
> pq

Yes, thank you all very much for the suggestions.  These
commands, confirmed in the page modesetting page, did the trick:

    echo 0 > /sys/class/vtconsole/vtcon1/bind
    modprobe -r nouveau
    modprobe nouveau

I was already blind on the console, so I logged in via ssh to do
the above commands.  After reloading the module, the console
returned to full, normal function.

Thank you,

Robert Riches
