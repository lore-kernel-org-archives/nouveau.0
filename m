From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: Re: Debugging help needed
Date: Sat, 29 Aug 2009 21:48:56 +0200
Message-ID: <20090829194900.5203B33C2AA@tippex.mynet.homeunix.org>
References: <20090829141233.24A6F33C2A5@tippex.mynet.homeunix.org>
	<6d4bc9fc0908290920p7f7ea123odd6325919a998c17@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <6d4bc9fc0908290920p7f7ea123odd6325919a998c17-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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


>What are you using? are you using master from the nouveau kernel? git
>versions for the rest? self made or prepackaged stuff?
>
>More info is a must.

I'm running git versions of (gentoo packaged, x11 overlay):

xf86-video-nouveau-9999
nouveau-drm-99999999
libdrm-9999

vanilla 2.6.31-rc6 kernel

looking into the nouveau-drm ebuild, I see that it's using the 
master-compat tarballs at: 
http://people.freedesktop.org/~pq/nouveau-drm/master-compat.tar.gz

-A
