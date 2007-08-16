From: Karel =?iso-8859-1?q?Voln=FD?= <kvolny-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: suggestions for createdump.sh improvements
Date: Thu, 16 Aug 2007 10:58:23 +0200
Message-ID: <200708161058.23585.kvolny@redhat.com>
References: <200708150930.49750.kvolny@redhat.com>
	<7e5f60720708151418h709aaf3ck99b411cfe9558ea6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <7e5f60720708151418h709aaf3ck99b411cfe9558ea6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Peter Bortas <bortas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


> > * it would be nice if the script is able to detect missing prerequisites
> > and to suggest to install appropriate packages (as with cvs), namely -
> > SDL-devel
> > - libXvMC-devel
> > (the names will differ from distro to distro, but it can make a good
> > starting point; other ones come as dependencies, at least in my case)
>
> libxml2-dev was also needed in my case on Debian. I imagine that will
> not be part of the default installation on Redhat either?

good point, I missed this one
- and there will be others, probably

K.V.
