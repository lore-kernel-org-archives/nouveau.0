From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Mon, 16 Feb 2009 10:59:52 -0500
Message-ID: <586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
References: <49959366.2000805@gmail.com>
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>
	<49968B05.4090701@gmail.com>
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>
	<49996AD8.2010602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49996AD8.2010602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Feb 16, 2009 at 8:32 AM, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Then, I made a try to move the card to domain #0. Having the BIOS source
> code, it was easy.
> But it keeps failing with the same error -
> (EE) NOUVEAU(0): wrong DRM version
> (EE) NOUVEAU(0): 1365:
>
> What does it mean?
> I'm also a little confused by a try loading something called "int10h"
> which does not exist in any form on my server.
>
>
> Linux Fedora 10, DRI/DRM has been taken from GIT less than week ago.

It means your DRM kernel module and X driver don't match. That is
strange, since it should fail to compile first I think. Somehow you
had the right DRM module at compile time but not at runtime? Try
getting the latest for both and recompiling.

        /* temporary lock step versioning */
#if NOUVEAU_DRM_HEADER_PATCHLEVEL != 12
#error nouveau_drm.h does not match expected patchlevel, update libdrm.
#endif
        if (pNv->pKernelDRMVersion->version_patchlevel !=
                        NOUVEAU_DRM_HEADER_PATCHLEVEL) {
                xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
                        "wrong DRM version\n");
                return FALSE;
        }
