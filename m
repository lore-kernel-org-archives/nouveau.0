From: Hannah and Mark Carey <hmcarey-kGM0oXzJM5p02iOg2JU2CQ@public.gmane.org>
Subject: Re: Recent nouveau regression reported in IRC
Date: Fri, 19 Sep 2008 22:21:27 +1200
Message-ID: <1221819687.6534.7.camel@hereford>
References: <48CF8FC8.6020402@tuxthepenguin.plus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48CF8FC8.6020402-k62ZyRAdHp9ZJBcDoO9esUHK5LHFu9C3@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stuart Bennett <stuart-k62ZyRAdHp9ZJBcDoO9esUHK5LHFu9C3@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Stuart,

Thanks for that.  I see that something similar to
0001-randr12-multiple-encoders-per-connector-DVI-I.patch has been
comitted to git.

RAOF has rebuilt his PPA and with that build of nouveau
(1:0.0.10~git20080918-0~ppa1~hardy) X is starting and running.

It is bugging me that I cant work out which git commit RAOFs PPA was
built from.

Cheers,

Mark C

On Tue, 2008-09-16 at 11:51 +0100, Stuart Bennett wrote:
> Hi, I've taken the liberty of borrowing your email address from an 
> mmio-trace, as you'd left IRC by the time I saw your report.
> 
> I'm fairly sure I know the problem, so would you be able to 
> (sequentially) try the two patches attached (they should both fix the 
> issue I'm thinking of, and the 
> 0001-randr12-multiple-encoders-per-connector-DVI-I.patch one has a few 
> extra changes, but is also my preferred solution)? Note that if your 
> xorg.conf depends on the DVI-A-n and DVI-D-n naming, that'll break with 
> the 0001-randr12... patch, as they will now be grouped as one physical 
> connector called DVI-I-n.
> 
> Many thanks,
> 
> Stuart
