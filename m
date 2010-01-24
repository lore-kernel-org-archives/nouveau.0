From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26193] nouveau falls back to NoAccel on 9400M
Date: Sun, 24 Jan 2010 06:33:03 -0800 (PST)
Message-ID: <20100124143303.729951300B8@annarchy.freedesktop.org>
References: <bug-26193-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26193-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26193


Ted Phelps <phelps-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |phelps-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org




--- Comment #4 from Ted Phelps <phelps-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>  2010-01-24 06:33:02 PST ---
I'm seeing what might be the same problem with an NV4E (a GeForce 6150 which is
built into my ASUS M2NPV-VM motherboard) running in a 64-bit environment.  I
have a work-around, but it doesn't make any sense to me.

I've managed to track my issue down to the TTM interface changes:

    77bce8e  drm/nouveau: fix for ttm interface changes, and
    ad49f50  drm/ttm/radeon: add dma32 support.

If I force the last argument to ttm_bo_device_init to false then the GPU
channel is successfully created and 2D acceleration works.  I'm currently using
the following patch:

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c
b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 8f3a12f..10d1663 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -590,7 +590,7 @@ nouveau_mem_init(struct drm_device *dev)
        ret = ttm_bo_device_init(&dev_priv->ttm.bdev,
                                 dev_priv->ttm.bo_global_ref.ref.object,
                                 &nouveau_bo_driver, DRM_FILE_PAGE_OFFSET,
-                                dma_bits <= 32 ? true : false);
+                                /* dma_bits <= 32 ? true : */ false);
        if (ret) {
                NV_ERROR(dev, "Error initialising bo driver: %d\n", ret);
                return ret;

The bit that I find most confusing is that I can't just force dma_bits to be 40
(or 64, for that matter) -- it apparently must be 32.

To summarize, this only works for me if: dma_bits=32 and TTM_PAGE_FLAG_DMA32 is
not in bdev's flags.

I hope this means something to someone...

Thanks,
-Ted


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
