From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Thu, 9 Jul 2009 20:51:54 +0300
Message-ID: <20090709205154.4f613cc5@daedalus.pq.iki.fi>
References: <4A55DBDD.6030703@Free.fr>
	<20090709193053.5a5d6430@daedalus.pq.iki.fi>
	<4A5626F6.4090607@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A5626F6.4090607-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: eric.valette-GANU6spQydw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

Sorry for causing that much trouble.

On Thu, 09 Jul 2009 19:20:54 +0200
Eric Valette <eric.valette-GANU6spQydw@public.gmane.org> wrote:

> Well I would suggest you to look at GALLIUM3D because using gi to clone
> mesa master is not even working and even if you get a git snapshot it
> does not build.

http://nouveau.freedesktop.org/wiki/GalliumHowto
Is there something unclear here?

The same applies to the following, since Gallium3D is the one providing OpenGL.

> kde4 kwin not running using openGL as composing type is maybe my
> favorite bug!
> 
> Then comes messa git nouveau being out of sync with the rest of nouveau code

This is an open project with too few developers. If you want faster progress,
you should join. You already know the issues you want to tackle.

Also, I'd recommend studying git, you only ever have to 'clone' once.
Receiving updates is a lot faster. InstallDRM has the instructions, since
the kernel tree is so big, but there are more than one way to pull updates.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
