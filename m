From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: GeForce MX4 - DMA queue hang
Date: Fri, 24 Oct 2008 19:09:39 +0300
Message-ID: <20081024190939.38dc356a@daedalus.pq.iki.fi>
References: <2c0d1e780810240615w47a87522g3e5c94cc0007482e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <2c0d1e780810240615w47a87522g3e5c94cc0007482e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andrew Betts <andrew.betts-lBdPKyQg4mA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 24 Oct 2008 14:15:56 +0100
"Andrew Betts" <andrew.betts-lBdPKyQg4mA@public.gmane.org> wrote:

> I have an integrated GeFroce MX4 and whenever I start X a garbled
> display pops up (the mouse works) and then a few seconds later X
> crashes.
> 
> Logs here: http://www.jasp.com/nouveau/Xorg.0.log.old.241008.txt
> 
> I noticed this:
> (EE) NOUVEAU(0): Pointer to LVDS manufacturer table invalid
> (EE) NOUVEAU(0): Pointer to LVDS manufacturer table invalid
> 
> I don't know if that is significant.
> 
> But further on:
> (II) NOUVEAU(0): Fifo dump (lockup 0x0000,0x04e9):
> ... big dump follows then...
> (II) NOUVEAU(0): End of fifo dump
> 
> Fatal server error:
> DMA queue hang: dmaPut=4e9, current=0, status=0

Could you post the kernel log from the crash?

Also make sure you are not using nvidiafb and you don't have the
proprietary driver loaded, or such.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
