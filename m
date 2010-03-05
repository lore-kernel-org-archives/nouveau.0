From: Luca Barbieri <luca.barbieri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: making 0.0.16 into 1.0.0
Date: Fri, 5 Mar 2010 12:53:19 +0100
Message-ID: <ff13bc9a1003050353r1bdeaaa1l9d3ee21f8d7d5e79@mail.gmail.com>
References: <21d7e9971003041723x7d99996bo586181db5a4234dc@mail.gmail.com>
	<6d4bc9fc1003050043m211287aam4cb34bb20ee998dd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1003050043m211287aam4cb34bb20ee998dd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Another possible reason for breaking ABI that hasn't yet been
mentioned is the fact that right now any DRM client can trivially lock
up the GPU and/or corrupt GPU/GART memory belonging to other clients.
This happens often with GL driver bugs and is quite annoying for
developers and testers of them, so it may be desirable to alter the
driver to provide real protection and make this impossible.
Depending on the way it is done, it may require significant changes
and an ABI break.
