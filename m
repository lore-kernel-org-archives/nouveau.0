From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: git - compile error ratelimit - missing include
 <linux/ratelimit.h>
Date: Sat, 5 Dec 2009 22:44:00 +0200
Message-ID: <20091205224400.1b9786fb@daedalus.pq.iki.fi>
References: <4B1ABF89.3050908@majjas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B1ABF89.3050908-P//MSfjsEjDQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michael Breuer <mbreuer-P//MSfjsEjDQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 05 Dec 2009 15:16:09 -0500
Michael Breuer <mbreuer-P//MSfjsEjDQT0dZR+AlfA@public.gmane.org> wrote:

> Building today in git - kernel 2.6.32 (git) + nouveau (git).
> 
> Failed as nouveau_irq.c doesn't include <linux/ratelimit.h>
> 
> Added the include to nouveau_irq.c and was able to compile... not
> sure that's where it ought to go.

Aha, that problem wasn't there with 2.6.31-rc9 which is what Nouveau
is still based on.

I'll push a fix shortly, thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
