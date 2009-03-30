From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50: wfb patches
Date: Sun, 29 Mar 2009 23:54:33 -0400
Message-ID: <586c2acd0903292054r11841a3v7750ac27ea9a6963@mail.gmail.com>
References: <6d4bc9fc0903291654r70e3e6f0pd6f56874a6c361f7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0903291654r70e3e6f0pd6f56874a6c361f7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

2009/3/29 Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> The whole thing works fine, but XSHM is an issue
> (http://stillunknown.livejournal.com/928.html). With it disabled most
> apps are fine, although a few issues remain.

Just out of curiousity, why can't you alloc a pixmap you can
accelerate and just keep it sync'd with the xshm pixmap, track dirty
rects, etc? Also why can't you allocate a linear pixmap on software
fallbacks, copy+untile the original to the linear, let the fallback
complete, and copy+tile back to the original? Might be cheaper than
having to trap and transform every pixel access.
