From: =?iso-8859-2?Q?Jarom=EDr=20C=E1p=EDk?= <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: Re: Can't build xf86-video-nouveau
Date: Fri, 10 Jul 2009 20:43:01 +0200 (CEST)
Message-ID: <1676.4193-25169-1481464160-1247251381@seznam.cz>
References: <20090710212521.321ea27c@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090710212521.321ea27c-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?us-ascii?Q?Pekka=20Paalanen?= <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Pekka.

Strange .... yesterday I made a new kernel with the latest master-compat.
Today I downloaded the latest ddx and drm git.

maybe something changed during the night ....
shall I recompile the kernel?

Thx,
Jaromir,



> ------------ P=F9vodn=ED zpr=E1va ------------
> Od: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
> P=F8edm=ECt: Re: [Nouveau] Can't build xf86-video-nouveau
> Datum: 10.7.2009 20:31:29
> ----------------------------------------
> On Fri, 10 Jul 2009 19:29:42 +0200 (CEST)
> Jarom=EDr C=E1p=EDk <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> wrote:
> =

> > Problem with building has been solved by downloading the latest header =
files
> ....
> > =

> > but.... a new problem occured .... =

> > =

> >    (EE) NOUVEAU(0): [drm] wrong version, expecting 0.0.12
> =

> This means your xf86-video-nouveau is ancient.
> =

> You need the latest from git:
>  - DRM kernel modules (the installation has changed, see the wiki)
>  - libdrm and libdrm_nouveau (both come from the same place)
>  - xf86-video-nouveau
> =

> =

> Thanks.
> =

> -- =

> Pekka Paalanen
> http://www.iki.fi/pq/
> =

> =

> =
