From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau DRM kernel tree
Date: Thu, 04 Jun 2009 06:36:09 +1000
Message-ID: <1244061369.17907.25.camel@localhost.localdomain>
References: <1244031194.17907.20.camel@localhost.localdomain>
	<6d4bc9fc0906030649h7b8f8500k679684d18a6df31b@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0906030649h7b8f8500k679684d18a6df31b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Wed, 2009-06-03 at 15:49 +0200, Maarten Maathuis wrote:
> If you had to estimate, how long did it take you to figure out evo?
It's hard to say.  It works pretty much exactly how I said I thought it
would ages back.  The missing piece (as expected) was using the push
buffer rather than poking stuff into 0x610300 directly.  That, I
stumbled on the idea of how to track down accidentally while looking at
another bug a couple of weeks back.

The missing bits (the meaning of 0x86c in non-linear mode, and that the
CRTCs want buffers with 0x7a00 in the page flags) for non-linear
scanout, I sat down and worked out yesterday.

> 
> Anyway, it looks nice, i will certainly try when i'm home again.
Good luck!

Ben.
> 
> Maarten.
