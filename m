From: Delan Azabani <delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org>
Subject: Build failure for gallium nouveau driver from git
Date: Sun, 31 Oct 2010 16:44:35 +0800
Message-ID: <4CCD2C73.1070806@azabani.com>
Reply-To: delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The latest git version of freedesktop/mesa/mesa (building for gallium
driver according to nouveau wiki/GalliumHowto) does not compile. The
messages shown are:

nouveau_screen.c: In function =91nouveau_screen_init=92:
nouveau_screen.c:239: warning: passing argument 4 of
=91nouveau_channel_alloc=92 makes pointer from integer without a cast
/usr/include/nouveau/nouveau_channel.h:51: note: expected =91struct
nouveau_channel **=92 but argument is of type =91int=92
nouveau_screen.c:239: error: too many arguments to function
=91nouveau_channel_alloc=92

I'm running Ubuntu 10.10 with the latest git libdrm installed. Nvidia
proprietary drivers are not installed; running distribution-packaged
2D-only nouveau driver. By the way, my understanding of the code is
limited, so the things I try to fix the problem with are probably silly.

This line seems to be the culprit:

ret =3D nouveau_channel_alloc(dev, 0xbeef0201, 0xbeef0202, 512*1024,
&screen->channel);

Even though nouveau_context.c has a similar call with the same number of
arguments, it isn't an error. I also couldn't find the function
definition for nouveau_channel_alloc anywhere. Naively, I remove the
last argument so it looks like this:

ret =3D nouveau_channel_alloc(dev, 0xbeef0201, 0xbeef0202, 512*1024);

The error disappears, and the compile continues. Another error now:

nv50_surface.c: In function =91nv50_surface_set=92:
nv50_surface.c:95: error: =91NOUVEAU_BO_TILE_LAYOUT_MASK=92 undeclared
(first use in this function)
nv50_surface.c:95: error: (Each undeclared identifier is reported only once
nv50_surface.c:95: error: for each function it appears in.)
make[4]: *** [nv50_surface.o] Error 1
make[4]: *** Waiting for unfinished jobs....
nv50_transfer.c: In function =91nv50_transfer_rect_m2mf=92:
nv50_transfer.c:48: error: =91NOUVEAU_BO_TILE_LAYOUT_MASK=92 undeclared
(first use in this function)
nv50_transfer.c:48: error: (Each undeclared identifier is reported only once
nv50_transfer.c:48: error: for each function it appears in.)
nv50_transfer.c: In function =91nv50_upload_sifc=92:
nv50_transfer.c:283: error: =91NOUVEAU_BO_TILE_LAYOUT_MASK=92 undeclared
(first use in this function)
make[4]: *** [nv50_transfer.o] Error 1

Don't know how to fix that one. Even the nouveau_channel_alloc error,
which I 'fixed', seems odd because it was called elsewhere just the same
without fail.

-- =

Thanks and best regards,
Delan Azabani
http://azabani.com/
