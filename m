From: "Peter Bortas" <bortas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: suggestions for createdump.sh improvements
Date: Wed, 15 Aug 2007 23:18:54 +0200
Message-ID: <7e5f60720708151418h709aaf3ck99b411cfe9558ea6@mail.gmail.com>
References: <200708150930.49750.kvolny@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200708150930.49750.kvolny-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
To: =?ISO-8859-1?Q?Karel_Voln=FD?= <kvolny-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 8/15/07, Karel Voln=FD <kvolny-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> * it would be nice if the script is able to detect missing prerequisites =
and
> to suggest to install appropriate packages (as with cvs), namely
> - SDL-devel
> - libXvMC-devel
> (the names will differ from distro to distro, but it can make a good star=
ting
> point; other ones come as dependencies, at least in my case)

libxml2-dev was also needed in my case on Debian. I imagine that will
not be part of the default installation on Redhat either?

Greetings,
-- =

Peter Bortas
