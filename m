From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Wed, 02 May 2012 15:33:56 +0200
Message-ID: <4FA137C4.3000900@free.fr>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
	<1335425549.27165.9.camel@nisroch> <20120428144956.GA10116@joi.lan>
	<1335958137.1898.6.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335958137.1898.6.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 02/05/2012 13:28, Ben Skeggs wrote:
> Right, again, I don't disagree :)  I think we can improve a lot on the
> big-hammer-suspend-the-gpu solution though, and instead reset only the
> faulting engine.  It's (in theory) almost possible for us to do now, but
> I have a couple of reworks to areas related to this pending (basically,
> making the various driver subsystems more independent), which should be
> ready soon.  This'll go a long way to making it very easy to reset a
> single engine, and likely result in *far* faster recovery from hangs.
Hey,

What about kicking a channel that put the card in a bad state? Wouldn't 
that be possible?

This way, we don't loose the context of other channels and only the 
application that hang the card will be exited.

I wonder how pfifo handles commands sent to a non-existing channel, but 
I'm sure it shouldn't hang or anything.

Anyway, if this is not possible to only kick one channel, then what 
about kicking all channels, rePOSTING the card and using KMS to output 
the lockup report (and send a notification of the report through udev 
and store the report in a sysfs file)?

Let's not try to be perfect, let us just be able to do better bug reports.

Martin
