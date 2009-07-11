From: =?iso-8859-2?Q?Jarom=EDr=20C=E1p=EDk?= <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: Re: Can't build xf86-video-nouveau
Date: Sat, 11 Jul 2009 10:07:36 +0200 (CEST)
Message-ID: <1676.4193-3052-1930720128-1247299656@seznam.cz>
References: <6d4bc9fc0907101149v3c552b04vd74d6d3f8a7bde47@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0907101149v3c552b04vd74d6d3f8a7bde47-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?us-ascii?Q?Maarten=20Maathuis?= <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Maarten, Pekka ... =


I tried to download the latest one 2.4.11 .... =

the same result with lib64drm from the distro repository ...

lib64drm2-2.4.11-1mdv2010.0.x86_64
lib64drm_intel1-2.4.11-1mdv2010.0.x86_64
lib64drm_nouveau1-2.4.11-1mdv2010.0.x86_64
lib64drm_radeon1-2.4.11-1mdv2010.0.x86_64

I am still getting the same error:

   (EE) NOUVEAU(0): [drm] wrong version, expecting 0.0.12


I downloaded the stuff from these locations:
http://people.freedesktop.org/~pq/nouveau-drm/master-compat.tar.gz
git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau =

git://anongit.freedesktop.org/git/mesa/drm =


Any idea?
I am slowly getting angry :D =

Since it is my first try to build the nouveau driver
I am out of ideas ... =


I already solved some problems with directories
(like copying the modules and libs from /usr/local/lib to /usr/lib64)
but as I unfortunately have no overview about this project =

it's hard for me to do any troubleshooting in this area ... =


I would really appreciate Your help ....

Thanks in advance ...

Regards,
Jaromir.


> ------------ P=F9vodn=ED zpr=E1va ------------
> Od: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> P=F8edm=ECt: Re: [Nouveau] Can't build xf86-video-nouveau
> Datum: 10.7.2009 20:49:01
> ----------------------------------------
> Probably an older version of libdrm floating around?
> =

> Maarten.
> =

> =

> =
