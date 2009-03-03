From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Tue,  3 Mar 2009 13:53:59 -0800 (PST)
Message-ID: <20090303215359.1323B130057@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #8 from Sebastian Brandt <sbrandt-Mmb7MZpHnFY@public.gmane.org>  2009-03-03 13:53:58 PST ---
You are too fast ... still working on gdb ;-)

Program received signal SIGSEGV, Segmentation fault.
0x00007f5277cdd2a7 in NV50CrtcGammaSet (crtc=0x8020f0, red=0x80efd0,
    green=0x80f1d0, blue=0x80f3d0, size=<value optimized out>)
    at nv50_crtc.c:504
504             memcpy(crtc->lut->map, crtc->lut_values,
4*256*sizeof(uint16_t))
;
(gdb) p crtc
$1 = (nouveauCrtcPtr) 0x8020f0
(gdb) p *crtc
$2 = {scrn = 0x7ffa20, name = 0x0, index = 0 '\0', active = 1,
  front_buffer = 0x809600, fb_pitch = 5632, x = 0, y = 0, lut = 0x809810,
  lut_values = {{red = 0, green = 0, blue = 0, unused = 0}, {red = 64,
      green = 64, blue = 64, unused = 0}, {red = 128, green = 128,
      blue = 128, unused = 0}, {red = 192, green = 192, blue = 192,
      unused = 0}, {red = 256, green = 256, blue = 256, unused = 0}, {
[...]
  SetCursorPosition = 0x7f5277cdd420 <NV50CrtcSetCursorPosition>,
  LoadCursor = 0x7f5277cdd3a0 <NV50CrtcLoadCursor>,
  GammaSet = 0x7f5277cdd1e0 <NV50CrtcGammaSet>, Save = 0, Load = 0}
(gdb)
(gdb)
(gdb) where
#0  0x00007f5277cdd2a7 in NV50CrtcGammaSet (crtc=0x8020f0, red=0x80efd0,
    green=0x80f1d0, blue=0x80f3d0, size=<value optimized out>)
    at nv50_crtc.c:504
#1  0x00000000004acdf2 in ?? ()
#2  0x00007f5277cbd613 in NVLoadPalette (pScrn=0x7ffa20, numColors=256,
    indices=0x81a920, colors=0x81ad30, pVisual=0x0) at nv_driver.c:1924
#3  0x0000000000485ef2 in ?? ()
#4  0x0000000000486028 in ?? ()
#5  0x0000000000487021 in xf86HandleColormaps ()
#6  0x00007f5277cbd0cb in NVScreenInit (scrnIndex=0, pScreen=0x809200,
    argc=<value optimized out>, argv=<value optimized out>)
    at nv_driver.c:2253
#7  0x00000000004319a9 in AddScreen ()
#8  0x0000000000466f71 in InitOutput ()
#9  0x0000000000432146 in main ()
(gdb) l
499             /* This is pre-init, we don't have access to the lut bo now. */
500             if (!crtc->lut)
501                     return;
502
503             nouveau_bo_map(crtc->lut, NOUVEAU_BO_WR);
504             memcpy(crtc->lut->map, crtc->lut_values,
4*256*sizeof(uint16_t))
;
505             nouveau_bo_unmap(crtc->lut);
506     }
507
508     void
(gdb) p crtc->lut
$3 = (struct nouveau_bo *) 0x809810
(gdb) p *crtc->lut
$4 = {device = 0x7f5277ef7db0, handle = 0, size = 4096, map = 0x7f527dc12000,
  tiled = 0, flags = 33, offset = 267517952}
(gdb) p *(crtc->lut)
$5 = {device = 0x7f5277ef7db0, handle = 0, size = 4096, map = 0x7f527dc12000,
  tiled = 0, flags = 33, offset = 267517952}
(gdb) p *(crtc->lut->map)
Attempt to dereference a generic pointer.
(gdb) p crtc->lut->map
$6 = (void *) 0x7f527dc12000
(gdb) p crtc->lut_values
$7 = {{red = 0, green = 0, blue = 0, unused = 0}, {red = 64, green = 64,
    blue = 64, unused = 0}, {red = 128, green = 128, blue = 128, unused = 0},
  {red = 192, green = 192, blue = 192, unused = 0}, {red = 256, green = 256,
    blue = 256, unused = 0}, {red = 320, green = 320, blue = 320,
[...]
(gdb) p crtc->lut->map
$8 = (void *) 0x7f527dc12000
(gdb) p crtc->lut
$9 = (struct nouveau_bo *) 0x809810
(gdb) quit
The program is running.  Quit anyway (and kill it)? (y or n) y


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
