From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: nv1x 3d fix/workaround for Q3 demo
Date: Mon, 11 Jul 2011 22:14:52 +0200
Message-ID: <4E1B59BC.6050007@student.tuwien.ac.at>
References: <201107091522.36407.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201107091522.36407.randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 07/09/2011 05:22 PM, Andrew Randrianasulu wrote:
> Hello. I have nv18 card in my machine currently.
> 
> It works with kernel 3.0.0.-rc6 (i need to pass nouveau.tv_disable=1 parameter 
> to module, because uothervise it thinks i have TV connected, while in fact I 
> have only VGA CRT monitor connected)
> 
> Mesa 3d driver (7.12-devel (git-067c9d7)), on other hand, has few problems, 
> most obvious was wrong colors in Q3 demo menus (blue instead of red). swrast 
> worked fine. After some digging (for example, deactivating 
> EXT_compiled_vertex_array workarounds this bug, like disabling  "OpenGL 
> Extensions" from game menu completely) i found that this patch makes colors 
> fine:
> 
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_render.c 
> b/src/mesa/drivers/dri/nouveau/nv10_render.c
> index 20fb447..7e28229 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_render.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_render.c
> @@ -99,7 +99,8 @@ get_hw_format(int type)
>         case GL_UNSIGNED_SHORT:
>                 return NV10_3D_VTXBUF_FMT_TYPE_V16_SNORM;
>         case GL_UNSIGNED_BYTE:
> -               return NV10_3D_VTXBUF_FMT_TYPE_B8G8R8A8_UNORM;
> +               // return NV10_3D_VTXBUF_FMT_TYPE_B8G8R8A8_UNORM;
> +               return NV10_3D_VTXBUF_FMT_TYPE_U8_UNORM;
>         default:
>                 assert(0);
>         }
> 

Thanks, pushed.
(http://cgit.freedesktop.org/mesa/mesa/commit/?id=a09b7f7f150d1687a614fd59cf09ec5e3c3a13fd)


> Any idea if NV10_3D_VTXBUF_FMT_TYPE_B8G8R8A8_UNORM has any good on BE 
> machines? Or any other use in OpenGL subset, implemented in nv1x class 
> silicon?
> 
> I have more failed stuff, like non-working demos/reflect and demos/dinoshade 
> (probably stencil/z mixup or wrong format?), missing teapot in 
> demos/fbotexture (but fbo_firecube works fine), lockup in demos/engine after  
> I activated wireframe mode, and probably many others. But I'm very happy to 
> have this small victory over 3D in just few hours.
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
