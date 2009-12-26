From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [MESA PATCH] Fix nv40_miptree_layout pitch
Date: Sat, 26 Dec 2009 04:37:49 +0100
Message-ID: <ff13bc9a0912251937i3c32e044kc84f0c70ff1e9547@mail.gmail.com>
References: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7@mail.gmail.com>
	<586c2acd0912251833x1665b258ica2a55ccfff629f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0912251833x1665b258ica2a55ccfff629f6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

You are right. The patch is wrong. Both changes fix my program, but do
break OpenGL (e.g. redbook/mipmap).

I managed to reproduce the problem with perf/genmipmap.

When run, it causes several instances of one of these 3 errors (using
swizzled textures):
[12949.125732] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
DATA_ERROR, nStatus: BAD_ARGUMENT
[12949.125738] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class
0x4097 Mthd 0x020c Data 0x00000000:0x00000008
[12949.214750] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
DATA_ERROR, nStatus: BAD_ARGUMENT
[12949.214757] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class
0x4097 Mthd 0x020c Data 0x00000000:0x00000010
[12951.752081] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - nSource:
DATA_ERROR, nStatus: BAD_ARGUMENT
[12951.752088] [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 3/7 Class
0x4097 Mthd 0x020c Data 0x00000000:0x00000020

It seems they are due to PGRAPH not liking an 8/16/32 pitch.
In my program I got these as well and narrowed it down to doing mipmap
generation on the small levels that have pitch set that way.

This patch does make them go away but breaks progs/mipmap (both
changes are wrong).

Apparently the miptree layout is correct, but the lowest mipmap levels
cannot be rendered to with the current code (that however tries to,
resulting in the errors), possibly due to an hardware limitation.

I guess a possible solution could be to modify
nv40_miptree_surface_new to allocate temporary surfaces for pitch <64
levels (i.e. 8x, 4x and 1x mipmap levels for RGBA) and then do a copy
with the 2D engine in nv40_miptree_surface_del.

Alternatively, for square Pot textures, it may be possible to map the
8x8, 4x4, 2x2 and 1x1 mipmaps as a single 16x16 pitch 64 swizzled
texture in which they should appear as rectangles, and then restrict
drawing to the rectangle by adjusting the viewport (and finding a way
to make bypass work too). Not sure if this works and whether it can be
generalized to non-square-pot textures.

How does the nVidia driver implement glGenerateMipmap?
