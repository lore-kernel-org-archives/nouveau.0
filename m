From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: still seeking way to recover card after cursor
 disappears or card locks up
Date: Thu, 31 May 2012 20:06:28 +0300
Message-ID: <20120531200628.149be72b@farn.lan>
References: <20120531035549.BBAEB23450@one.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 30 May 2012 20:55:49 -0700
rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.) wrote:

> > I very doubt that rmmod and modprobe will help you in any way since
> > nouveau is KMS module and it stays in use the whole time. Something
> > will be broken anyway. But you can try and see what's happening, it
> > will not brick your card.
> 
> Arvydas, thank you very much for that info/advice.  You were
> 100% right that rmmod refused to remove the nouveau module.

Hi,

The unloading instructions are also in the wiki:
http://nouveau.freedesktop.org/wiki/KernelModeSetting

Also a suspend-resume cycle has been said to help in recovering a
locked-up GPU.


Thanks,
pq
