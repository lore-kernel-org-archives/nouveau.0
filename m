From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: concern about bo "pinned'ness" after gem pushbuf is
 done
Date: Mon, 24 Aug 2009 09:00:33 +1000
Message-ID: <1251068433.2746.4.camel@nisroch>
References: <6d4bc9fc0908221621m4afafae3gf5fd6eb8353d85c7@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0908221621m4afafae3gf5fd6eb8353d85c7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2009-08-23 at 01:21 +0200, Maarten Maathuis wrote:
> As far as i see, we reserve the bo in the gem pushbuf ioctl, and
> unreserve after the pushbuf and the fence have been emitted. This
> assumption holds if bo moves happen on the same channel or if a cpu
> copy happens and we're waiting on fences. But for nv50 it is very
> common for the bo move to happen on the kernel fifo, which does not
> guarantee anything. Is there any safety i missed?
Hm, access by another channel after the move will definitely be
protected as we emit a fence for the move operation.

However, I think we may need to wait ourselves if the buffer move is
going to happen on a channel other than whatever used it last.  TTM
doesn't do this anymore I believe (the old ttm used to).

Ben.
> 
> Maarten.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
