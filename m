From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Unknown DCB 1.5 entry
Date: Sun, 14 Jun 2009 12:10:54 +0300
Message-ID: <20090614121054.0507d747@daedalus.pq.iki.fi>
References: <SNT111-W300F73614B10594023D1EAA7410@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <SNT111-W300F73614B10594023D1EAA7410-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Assurancetourix Le Barde <assurancetourix-dFDTH2TKyj8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 14 Jun 2009 10:07:25 +0200
Assurancetourix Le Barde <assurancetourix-dFDTH2TKyj8@public.gmane.org> wrote:

> Hello all,
> 
> Firstly, thank you for working on this driver, as nvidia support for older cards, like my geforce3, is becoming non-existent (and quite broken) today...
> 
> So, I tried to install nouveau, but I'm now stuck with this error:
> 
> (II) NOUVEAU(0): Found Display Configuration Block version 1.5
> (!!) NOUVEAU(0): Raw DCB entry 0: f0003f00 000088b8
> (!!) NOUVEAU(0): Raw DCB entry 1: f2005014 ffffffff
> (EE) NOUVEAU(0): Unknown DCB 1.5 entry, please report

There is an open bug about this:
http://bugs.freedesktop.org/show_bug.cgi?id=22265

No solution yet, but I do wonder if it is a regression.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
