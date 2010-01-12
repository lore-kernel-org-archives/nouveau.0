From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm PATCH RFC] nouveau: zero structs passed to
	ioctl
Date: Tue, 12 Jan 2010 17:21:51 +0200
Message-ID: <b6fcc0a1001120721w2842ea6fq393a1abd880cfd85@mail.gmail.com>
References: <20100112143702.GC2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100112143702.GC2984-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jan 12, 2010 at 4:37 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Subject: [libdrm PATCH] nouveau: zero structs passed to ioctl

Why?
Any specific bug?

> --- a/nouveau/nouveau_bo.c
> +++ b/nouveau/nouveau_bo.c

> + =A0 =A0 =A0 memset(&req, 0, sizeof(req));
> =A0 =A0 =A0 =A0req.handle =3D nvbo->handle;
> =A0 =A0 =A0 =A0nvbo->handle =3D 0;
> =A0 =A0 =A0 =A0drmIoctl(nvdev->fd, DRM_IOCTL_GEM_CLOSE, &req);
