From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: drm bo accessors etc. v2
Date: Mon, 17 Aug 2009 16:42:36 +0300
Message-ID: <1250516564-14193-1-git-send-email-pq@iki.fi>
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

Revised patch set v2.

[PATCH 1/8] drm/nouveau: bo read/write wrappers for nv04_crtc.c
[PATCH 2/8] drm/nouveau: use bo accessors for push buffers
[PATCH 3/8] drm/nouveau: OUT_RINGp - optimize OUT_RING loops
[PATCH 4/8] drm/nv50: proper notifier_bo access in nv50_display_vblank_crtc_handler()
[PATCH 5/8] drm/nouveau: access fbcon notifier via bo accessors
[PATCH 6/8] drm/nouveau: screen_base and lut must be iomem
[PATCH 7/8] drm/nouveau: remove redundant check in nouveau_bo_del_ttm()
[PATCH 8/8] drm/nouveau: remove mask in nv04_fbcon_imageblit()
