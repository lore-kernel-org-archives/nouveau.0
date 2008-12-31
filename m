From: Leandro Lucarella <llucax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: (EE) AIGLX error: dlopen of
	/usr/lib/dri/nouveau_dri.so failed
Date: Tue, 30 Dec 2008 22:39:40 -0200
Message-ID: <20081231003940.GB7353@homero.springfield.home>
References: <20081230025146.GA28418@homero.springfield.home>
	<586c2acd0812292026pf4c033eua3e1020bae57ffc3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <586c2acd0812292026pf4c033eua3e1020bae57ffc3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Younes Manton, el 29 de diciembre a las 23:26 me escribiste:
> Yes that's normal, it just means that the Mesa hardware driver is not
> found and AIGLX will use software rendering instead.

Ok.

> > [1] http://bugs.freedesktop.org/show_bug.cgi?id=16327
> 
> You should try a newer xserver (1.5 or later) if possible, that might
> help this problem.

I've just tried and it's worse =/

There is more corruption but I think it draws a little faster.

-- 
Leandro Lucarella (luca) | Blog colectivo: http://www.mazziblog.com.ar/blog/
----------------------------------------------------------------------------
GPG Key: 5F5A8D05 (F8CD F9A7 BF00 5431 4145  104C 949E BFB6 5F5A 8D05)
----------------------------------------------------------------------------
This is what you get,
when you mess with us.
