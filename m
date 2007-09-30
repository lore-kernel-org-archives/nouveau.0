From: matthieu castet <castet.matthieu-GANU6spQydw@public.gmane.org>
Subject: Re: [Patch] reenable fifos if we get an error while fifos
 disabled
Date: Sun, 30 Sep 2007 23:33:24 +0200
Message-ID: <47001624.7080806@free.fr>
References: <46FFEF22.8080205@web.de> <47001565.2010607@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <47001565.2010607-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephan Schmid <stephan_2303-S0/GAf8tV78@public.gmane.org>
Cc: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

matthieu castet wrote:
> Stephan Schmid wrote:
>> Hello,
>> while playing around with multiple fifo contexts I got fifo hangs when 
>> opening glxgears nr.3.
>> The reason is that in drm/linux_core/nouveau_fifo.c l.342 
>> engine->graph.create_context() returns -ENOMEM (I dont know why but I 
>> think this problems also appears with other errors).
> May be because of hash collision. I got similar failure, but I didn't 
> take time to investigate.
> 
> 
>> But the real problem is that then nouveau_fifo alloc() returns without 
>> reenabling fifo execution, so all fifos hang. With this patch glxgears 
>> nr.3 only prints scary messages and falls back to software rendering.
> Great.
> May be using a goto to jump at the end, could avoid code duplication.
> 
Also note that in current git, nouveau_fifo_free disable and reenable 
fifo execution.
So it should make the problem disappears.
