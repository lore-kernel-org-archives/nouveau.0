From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: don't hold spin lock while
 calling kzalloc with GFP_KERNEL
Date: Mon, 8 Feb 2010 13:45:38 +0200
Message-ID: <20100208134538.2443b176@daedalus.pq.iki.fi>
References: <1265505080-7099-1-git-send-email-madman2003@gmail.com>
	<20100208123059.7e8154bf@daedalus.pq.iki.fi>
	<6d4bc9fc1002080302v2f6d6010i2880fc4a8d1523a8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1002080302v2f6d6010i2880fc4a8d1523a8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Mon, 8 Feb 2010 12:02:01 +0100
Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Thanks for pointing that out, is it preferred to use goto style
> failure or just stick the spin unlock everywhere where you return?

In this particular case, just add the unlock where it is needed.
But, keep in mind what might happen, if something else accesses
the things protected by the lock just between you releasing it and
the cleanup function acquiring it.

I believe the goto-style is the preferred way of doing it, but
that would mean rewriting a lot of code, since IMO the calls to
nouveau_channel_free() in the case of nouveau_channel_alloc()
are already non-goto-style. And the functions are very long to
begin with, this would only make them even longer.

Not worth to rewrite it all, unless you find yourself contemplating on
adding parameters like 'bool is_already_locked' to cleanup functions.


Cheers.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
