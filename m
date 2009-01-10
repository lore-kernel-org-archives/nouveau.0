From: "Younes Manton" <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Winsys changes in mesa/gallium-0.2
Date: Sat, 10 Jan 2009 14:43:36 -0500
Message-ID: <586c2acd0901101143i2d0dd78ch49c9f5413e176d8d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

I made some changes to the Nouveau drm winsys so it could be shared
between Mesa and VL. Mostly this involved moving all the common stuff
into common/ and adding dri/.

Compiles and runs the stuff in progs/ like before as far as I know,
but if anyone actually uses the Mesa driver for anything non-trivial
I'd appreciate knowing if this broke anything for you. :)

* The code in common/ compiles to libnouveaudrm.a and the code in dri/
compiles to nouveau_dri.so and links with common.

* Structs nouveau_screen and nouveau_context are now in common and
only contain generic DRM stuff.

* Structs nouveau_screen_dri and nouveau_screen_dri in dri/ contain
the DRI/Mesa specific bits and use nouveau_screen and nouveau_context
as base.

* The dri/ dir also contains nouveau_swapbuffers.c which has all the
swapping functions plus nouveau_contended_lock and
nouveau_flush_frontbuffer. These are DRI/Mesa specific so I couldn't
keep them generic.

* The vl winsys contains the same 3 files, nouveau_screen_vl,
nouveau_context_vl, and nouveau_swapbuffers which basically do the
same as the dri/ dir if anyone is interested.
