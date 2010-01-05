From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Assertion failure in gallium on nv50
Date: Tue, 5 Jan 2010 19:32:47 +0100
Message-ID: <6d4bc9fc1001051032i3aa5aeb2l451509974179b572@mail.gmail.com>
References: <add883141001051028j5815c282k720209fd7631494c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <add883141001051028j5815c282k720209fd7631494c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tavian Barnes <tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Update to the latest mesa, it's a know bug and the fix was finally
pushed about 20 minutes ago.

Maarten.

On Tue, Jan 5, 2010 at 7:28 PM, Tavian Barnes <tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I upgraded mesa, libdrm, xf86-video-nouveau and the DRM module to
> latest git recently (previously I had git versions from Dec 22). =A0Now,
> when I try to run a simple GL program with the DRI driver, it fails:
>
> glxgears: /usr/include/nouveau/nouveau_pushbuf.h:135: BIND_RING:
> Assertion `0' failed.
>
> The old, previously working build of mesa and the DRI driver also
> failed, which makes me think the problem has to do with the recent
> libdrm or DDX changes (or possibly the DRM?). =A0A backtrace indicates
> that the assertion happens in nv50_screen_create(), but I doubt that's
> where the bug is as that routine hasn't changed recently.
>
> Program received signal SIGABRT, Aborted.
> 0x00007ffff727b035 in raise () from /lib/libc.so.6
> (gdb) bt
> #0 =A00x00007ffff727b035 in raise () from /lib/libc.so.6
> #1 =A00x00007ffff727c460 in abort () from /lib/libc.so.6
> #2 =A00x00007ffff7274151 in __assert_fail () from /lib/libc.so.6
> #3 =A00x00007ffff5348f7a in nv50_screen_create ()
> =A0 from /home/tavianator/abs/mesa-git/pkg/nouveau-dri-git/usr/lib/xorg/m=
odules/dri/nouveau_dri.so
> #4 =A00x00007ffff52fb585 in nouveau_drm_create_screen ()
> =A0 from /home/tavianator/abs/mesa-git/pkg/nouveau-dri-git/usr/lib/xorg/m=
odules/dri/nouveau_dri.so
> #5 =A00x00007ffff52f947d in dri_init_screen2 ()
> =A0 from /home/tavianator/abs/mesa-git/pkg/nouveau-dri-git/usr/lib/xorg/m=
odules/dri/nouveau_dri.so
> #6 =A00x00007ffff52f675c in dri2CreateNewScreen ()
> =A0 from /home/tavianator/abs/mesa-git/pkg/nouveau-dri-git/usr/lib/xorg/m=
odules/dri/nouveau_dri.so
> #7 =A00x00007ffff7ba89e7 in dri2CreateScreen () from /usr/lib/libGL.so.1
> #8 =A00x00007ffff7b84bee in __glXInitialize () from /usr/lib/libGL.so.1
> #9 =A00x00007ffff7b8026d in GetGLXPrivScreenConfig () from /usr/lib/libGL=
.so.1
> #10 0x00007ffff7b811cf in glXChooseVisual () from /usr/lib/libGL.so.1
> #11 0x0000000000401cf0 in ?? ()
> ...
>
> I'm still trying to isolate the commit that caused this, but it's
> annoying bisecting three different components.
>
> --
> Tavian Barnes
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
