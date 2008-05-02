From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15792] nv04 (TNT2) video blitter problem.
Date: Fri,  2 May 2008 13:19:09 -0700 (PDT)
Message-ID: <20080502201909.3DDB1130009@annarchy.freedesktop.org>
References: <bug-15792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15792





--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2008-05-02 13:19:08 PST ---
some testing:

randr-1.2                                                                       
EXA_get_pixmap_pitch: 5544                                                      
EXA_get_pixmap_pitch: 5544                                                      
EXA_get_pixmap_pitch: 5544                                                      

without randr-1.2                                                               
EXA_get_pixmap_pitch: 5568                                                      
EXA_get_pixmap_pitch: 5568                                                      
EXA_get_pixmap_pitch: 5568                                                      

Virtual - 1024x768, randr12 enabled                                             
EXA_get_pixmap_pitch: 5568                                                      
EXA_get_pixmap_pitch: 5568                                                      
EXA_get_pixmap_pitch: 5568

diff --git a/src/nv04_video_blitter.c b/src/nv04_video_blitter.c
index 8ee848f..30f4e82 100644
--- a/src/nv04_video_blitter.c
+++ b/src/nv04_video_blitter.c
@@ -94,6 +94,8 @@ NVPutBlitImage(ScrnInfoPtr pScrn, int src_offset, int id,
         BEGIN_RING(NvContextSurfaces, NV04_CONTEXT_SURFACES_2D_FORMAT, 4);
         OUT_RING  (dst_format);
         OUT_RING  ((exaGetPixmapPitch(pPix) << 16) | exaGetPixmapPitch(pPix));
+       ErrorF("EXA_get_pixmap_pitch: %d\n", exaGetPixmapPitch(pPix));
+       
         OUT_PIXMAPl(pPix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
         OUT_PIXMAPl(pPix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
