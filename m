From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Unknown LVDS configuration bits,
	please report" - Error
Date: Mon, 28 Apr 2008 20:17:44 +0200
Message-ID: <6d4bc9fc0804281117k23f3162fw1a0832e8938d86ea@mail.gmail.com>
References: <1209302986.2660.5.camel@wolverine>
	<20080428193358.451274bb@daedalus.pq.iki.fi>
	<1209401972.27356.3.camel@wolverine>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1209401972.27356.3.camel@wolverine>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andreas Happe <andy-L2Gnq7z6Vd1eoWH0uzbU5w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 4/28/08, Andreas Happe <andy-L2Gnq7z6Vd1eoWH0uzbU5w@public.gmane.org> wrote:
> On Mon, 2008-04-28 at 19:33 +0300, Pekka Paalanen wrote:
>  > "Framebuffer loaded" is usually a bad sign. The Nouveau driver does not
>  > work reliably with a framebuffer driver loaded. Granted, there are rumours
>  > that vesafb should work, and that on PPC you have to use the... hm, I fail
>  > to recall the driver name, offb?
>
>
> OT:
>  Yeah, that open firmware thingy was a problem with my old powerbook. I
>  just disabled framebuffer-use at X.org driver level (on the powerbook),
>  could that be a stability problem:
>
>
>  > To my unexperienced eyes, this looks just a not-fully-supported hardware.
>  > Have you searched the bugzilla? I guess there might already be a report
>  > for this specific case. If not, please add a bug, so the developers can
>  > track it.
>
>
> Silly me, there were already two bug reports for that problem, I will
>  just watch the mailing list and report it again if there's no progress
>  in some weeks.

I've brought it to the attention of the person who is the most capable
to handle this, but he indicated he wanted to fix some problems on
older hardware, before moving on. The driver is not user ready for
this hardware anyway, so i have no intentions atm to add workarounds.

>
>  cheers,
>  andy
>
>
>  _______________________________________________
>  Nouveau mailing list
>  Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  http://lists.freedesktop.org/mailman/listinfo/nouveau
>
