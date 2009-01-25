From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Gallium NV40 Textures
Date: Sun, 25 Jan 2009 11:14:52 -0500
Message-ID: <586c2acd0901250814l4aa4962dx5f0ba2961b9f4a58@mail.gmail.com>
References: <20090125105847.7f815e76@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090125105847.7f815e76-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jan 25, 2009 at 10:58 AM, Jimmy Rentz <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
> Hello,
>        I was playing around with the OpenGlSuperBible samples and
>        noticed some odd issues around textures.  Yes, I know it won't
>        be perfect right now (and not supported)...I am just curious
>        if you see the same issues.
>        Well, I am seeing some issues around swizzled textures with the
>        sphereworld sample (chapter 08).  The problems don't occur once
>        I force the textures to be linear.
>        NOTE: I modified the sample a bit so it only draws the ground.
>        pics:
>        swizzle.png - Current result with swizzled textures.
>        linear.png - Mod that turns off swizzled textures.
>
>        I read something in the backlog about how mipmaps aren't
>        handled entirely correctly, but I don't know if this is related.
>
>        Another thing, I do see some drm irq errors when the 1x1 mipmap
>        is generated.  It might be related:
>        [drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
>        [drm] PGRAPH_ERROR - Ch 2/4 Class 0x309e Mthd 0x0300 Data
>        0x00000000:0x0000000a [drm] PGRAPH_ERROR - nSource: DATA_ERROR,
>        nStatus: BAD_ARGUMENT [drm] PGRAPH_ERROR - Ch 2/5 Class 0x3089
>        Mthd 0x0400 Data 0x00000000:0x00010001
>
>        0x300 is for the texture format(A8R8G8B8) and 0x400 is for the
>        size (1x1).  For some reason the hw doesn't like 1x1 swizzled
>        textures?

Yeah I know what this is about. Swizzling is broken for mip maps. The
first few levels swizzle fine, but after that something screws up. I
think the swizzler has some limitations for the dest surface. dest
must be aligned to some boundary (64 bytes? 128?) i think, so that
means each mip level must be aligned, and we probably aren't obeying
that at the moment. probably the hw won't handle 1xN or Nx1 either.
Try the progs/tests/mipmap_view, IIRC 8x8 and below is broken.
