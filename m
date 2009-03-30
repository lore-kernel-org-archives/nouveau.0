From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50: wfb patches
Date: Mon, 30 Mar 2009 12:20:28 +0200
Message-ID: <6d4bc9fc0903300320t7ab80b83k499c7aaf397303ea@mail.gmail.com>
References: <6d4bc9fc0903291654r70e3e6f0pd6f56874a6c361f7@mail.gmail.com>
	<586c2acd0903292054r11841a3v7750ac27ea9a6963@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0903292054r11841a3v7750ac27ea9a6963-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

XSHM could probably be fixed, but that would have to be done on a
larger scope (as in for everything, not just exa). This could
negatively impact those with no acceleration at all.

About the untiling + copy approach, this is what classic exa does, and
you are practically forced to keep a software copy around always.
Otherwise you get excessive copies. I know right now that reading
memory on uncached memory isn't so great, but maybe in the future we
could use the gart also.

wfb is just a "simple" way of handling things, exa's migration
scheme's aren't easy.

From a memory waste point of view, wfb is the way to go, and the fact
that nvidia use it says something.

And imo, the things that hit really hard on software fallbacks just
need to be fixed.

Anyway you're welcome to try something else and compare.

Maarten.
