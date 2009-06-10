From: Pierre Pronchery <khorben-tmMSDyayuCodnm+yROfE0A@public.gmane.org>
Subject: Compilation error in nouveau_exa.c
Date: Wed, 10 Jun 2009 14:11:55 +0200
Message-ID: <4A2FA30B.5080902@defora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

			Dear nouveau team,

compilation of the Nouveau driver is currently failing for me with the 
following error:

>  gcc -DHAVE_CONFIG_H -I. -I.. -I/usr/local/include/xorg -I/usr/local/include -I/usr/local/include/drm -I/usr/pkg/include/pixman-1 -I/usr/pkg/include -I/usr/pkg/include/X11/dri -I/usr/local/include -I/usr/local/include/drm -I/usr/local/include/nouveau -g -O2 -Wall -minline-all-stringops -I/usr/local/include/xorg -I/usr/local/include -I/usr/local/include/drm -I/usr/pkg/include/pixman-1 -I/usr/pkg/include -I/usr/pkg/include/X11/dri -MT nouveau_exa.lo -MD -MP -MF .deps/nouveau_exa.Tpo -c nouveau_exa.c  -fPIC -DPIC -o .libs/nouveau_exa.o
> In file included from nv_include.h:72,
>                  from nouveau_exa.c:23:
> nouveau_hw.h: In function 'NVRead':
> nouveau_hw.h:43: warning: value computed is not used
> nouveau_exa.c: In function 'NVAccelDownloadM2MF':
> nouveau_exa.c:92: error: 'struct nouveau_bo' has no member named 'tile_mode'
> nouveau_exa.c: In function 'NVAccelUploadM2MF':
> nouveau_exa.c:213: error: 'struct nouveau_bo' has no member named 'tile_mode'
> nouveau_exa.c: In function 'nouveau_exa_mph_broken_should_die':
> nouveau_exa.c:441: warning: implicit declaration of function 'nouveau_bo_new_tile'
> nouveau_exa.c: In function 'nouveau_exa_pixmap_is_tiled':
> nouveau_exa.c:475: error: 'struct nouveau_bo' has no member named 'tile_flags'
> nouveau_exa.c: In function 'nouveau_exa_pixmap_map':
> nouveau_exa.c:493: error: 'struct nouveau_bo' has no member named 'tile_flags'
> nouveau_exa.c: In function 'nouveau_exa_pixmap_unmap':
> nouveau_exa.c:521: error: 'struct nouveau_bo' has no member named 'tile_flags'
> *** Error code 1

It used to compile without any problems. I am using:
- NetBSD 5.0 stable
- xorg-server 1.5.3
- libX11 1.1.5
- libxcb 1.1
- Mesa 7.4
- libdrm 2.4.7

Hints?
-- 
khorben
