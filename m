From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Can't build xf86-video-nouveau
Date: Fri, 10 Jul 2009 21:25:21 +0300
Message-ID: <20090710212521.321ea27c@daedalus.pq.iki.fi>
References: <1676.4193-23451-824338294-1247244514@seznam.cz>
	<1676.4193-23976-736705581-1247246982@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1676.4193-23976-736705581-1247246982-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Jarom=EDr_C=E1p=EDk?= <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 10 Jul 2009 19:29:42 +0200 (CEST)
Jarom=EDr C=E1p=EDk <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> wrote:

> Problem with building has been solved by downloading the latest header fi=
les ....
> =

> but.... a new problem occured .... =

> =

>    (EE) NOUVEAU(0): [drm] wrong version, expecting 0.0.12

This means your xf86-video-nouveau is ancient.

You need the latest from git:
 - DRM kernel modules (the installation has changed, see the wiki)
 - libdrm and libdrm_nouveau (both come from the same place)
 - xf86-video-nouveau


Thanks.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
