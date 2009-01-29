From: "Yan Seiner" <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Subject: git compile failure
Date: Thu, 29 Jan 2009 09:10:24 -0800 (PST)
Message-ID: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


I'm trying to build nouveau form git. The compile fails with:

gcc -DHAVE_CONFIG_H -I. -I.. -D_XOPEN_SOURCE=3D500 -I
-I/usr/include/pixman-1 -I/usr/include/drm -I/usr/include/X11/dri -g -O2
-Wall -minline-all-stringops -D_XOPEN_SOURCE=3D500 -I
-I/usr/include/pixman-1 -I/usr/include/drm -I/usr/include/X11/dri -MT
nouveau_device.lo -MD -MP -MF .deps/nouveau_device.Tpo -c
nouveau_device.c -fPIC -DPIC -o .libs/nouveau_device.o
In file included from nouveau_device.c:27:
nouveau_drmif.h:47: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:51: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:54: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:57: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:60: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:96: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 =
or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:100: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:108: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:110: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:112: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:123: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:127: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:130: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:133: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91uint32_t=92
nouveau_drmif.h:136: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91uint32_t=92
nouveau_drmif.h:139: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:161: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:165: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:168: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91int=92
nouveau_drmif.h:171: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:174: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_drmif.h:179: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92=
 or
=91__attribute__=92 before =91void=92
nouveau_device.c: In function =91nouveau_device_open_existing=92:
nouveau_device.c:53: warning: implicit declaration of function
=91nouveau_device_get_param=92
make[2]: *** [nouveau_device.lo] Error 1
make[2]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau/src'


The first offending line is here:

NOUVEAU_PRIVATE int
nouveau_device_open_existing(struct nouveau_device **, int close,
int fd, drm_context_t ctx);

The rest of the errors are for similar syntax.  Basically, the compiler
doesn't like the "NOUVEAU_PRIVATE int" part.

What am I looking for?  Is there a header file I'm missing somewhere?  Or
am I picking up a wrong header file?

--Yan


-- =

  o__
  ,>/'_          o__
  (_)\(_)        ,>/'_        o__
Yan Seiner      (_)\(_)       ,>/'_     o__
       Personal Trainer      (_)\(_)    ,>/'_        o__
             Professional Engineer     (_)\(_)       ,>/'_
Who says engineers have to be pencil necked geeks?  (_)\(_)

You are an adult when you realize that everyone's an idiot sometimes. You
are wise when you include yourself.
