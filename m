From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: NV_PFIFO_INTR_DMA_PUSHER
Date: Tue, 5 Jan 2010 00:35:37 +0200
Message-ID: <20100105003537.0857509a@daedalus.pq.iki.fi>
References: <4B4253BB.2000704@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B4253BB.2000704-5tc4TXWwyLM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 04 Jan 2010 21:46:51 +0100
Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org> wrote:

> Hello,
> 
> Could someone briefly describe (or point me to the documentation)
> what can be a reason for getting NV_PFIFO_INTR_DMA_PUSHER status 
> (nouveau_fifo_irq_handler).

The command stream put into a FIFO has a certain packet format.
The pusher interrupt says the given stream is corrupt, the format
is broken.

This is either a code bug (e.g. BEGIN_RING with incorrect number of
following commands), or (as in this case apparently) data
corruption.

That's all I think I know.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
