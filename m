From: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Segfault in libdrm
Date: Sun, 24 Oct 2010 20:28:23 +0200
Message-ID: <AANLkTikaRs=bZuZjagG7TnOyVLnve2hmFOE6mV8XAQze@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi,

When running a GL application after some random time I get the
following stacktrace on an nVidia Corporation NV44A [GeForce 6200]
(rev a1)
Here I have libdrm git c5286f4; mesa git dd2499b and a stock kernel
2.6.36. Someone else on IRC pointed that it also happens on NV49.
From what I see it seems that chan->cur is off by one. If anyone with
the knowledge could fix this or propose a patch I could test, because
it's pretty reproducable on my system.

Thanks.

Program received signal SIGSEGV, Segmentation fault.
0xb6ae3284 in nouveau_pushbuf_submit (chan=0x9a277e0, bo=0x0,
offset=0, length=0) at nouveau_pushbuf.c:181
181     nouveau_pushbuf.c: Aucun fichier ou dossier de ce type.
        in nouveau_pushbuf.c
(gdb) bt
#0  0xb6ae3284 in nouveau_pushbuf_submit (chan=0x9a277e0, bo=0x0,
offset=0, length=0) at nouveau_pushbuf.c:181
#1  0xb6ae3440 in nouveau_pushbuf_flush (chan=0x9a277e0, min=0) at
nouveau_pushbuf.c:231
#2  0xb6b4a5c4 in nvfx_push_vbo () from /usr/lib/dri/nouveau_dri.so
#3  0xb6b34d07 in nvfx_draw_vbo () from /usr/lib/dri/nouveau_dri.so
#4  0xb6c7e9e6 in st_draw_vbo () from /usr/lib/dri/nouveau_dri.so
#5  0xb6ca2ab0 in vbo_validated_drawrangeelements () from
/usr/lib/dri/nouveau_dri.so
#6  0xb6ca2f0a in vbo_exec_DrawRangeElementsBaseVertex () from
/usr/lib/dri/nouveau_dri.so
#7  0xb6ca302c in vbo_exec_DrawRangeElements () from /usr/lib/dri/nouveau_dri.so
#8  0x080ddd30 in R_Mesh_Draw (firstvertex=1153, numvertices=773,
firsttriangle=1226, numtriangles=726, element3i=0xa73331c,
element3s=0xa75a034,
    bufferobject3i=0, bufferobject3s=0) at gl_backend.c:1503
#9  0x080e91f3 in RSurf_DrawBatch_Simple (texturenumsurfaces=1,
texturesurfacelist=0xc390948) at gl_rmain.c:10787
#10 0x080ff97f in R_DrawTextureSurfaceList_GL20 (texturenumsurfaces=1,
texturesurfacelist=0xc390948, writedepth=true, prepass=false) at
gl_rmain.c:11487
#11 0x081075be in R_DrawModelTextureSurfaceList (texturenumsurfaces=1,
texturesurfacelist=0xc390948, writedepth=true, prepass=false) at
gl_rmain.c:11883
#12 0x081089be in R_ProcessModelTextureSurfaceList (ent=0xcd22b28,
numsurfaces=7, surfacelist=0xc390930, flagsmask=64, writedepth=true,
depthonly=false,
    prepass=false) at gl_rmain.c:12220
#13 R_QueueModelSurfaceList (ent=0xcd22b28, numsurfaces=7,
surfacelist=0xc390930, flagsmask=64, writedepth=true, depthonly=false,
prepass=false)
    at gl_rmain.c:12261
#14 0x08108fc3 in R_DrawModelSurfaces (ent=0xcd22b28,
skysurfaces=false, writedepth=true, depthonly=false, debug=false,
prepass=false) at gl_rmain.c:13354
#15 0x0810c954 in R_Q1BSP_Draw (ent=0xb57dd000) at gl_rsurf.c:600
#16 0x08103f75 in R_DrawModels () at gl_rmain.c:7345
#17 R_RenderScene () at gl_rmain.c:9003
#18 0x081067fc in R_RenderView () at gl_rmain.c:8854
#19 0x080a83d8 in VM_CL_R_RenderScene () at clvm_cmds.c:3018
#20 0x081c28c7 in CLVM_ExecuteProgram (fnum=1220,
errormessage=0x82cbee0 "QC function CSQC_UpdateView is missing") at
prvm_execprogram.h:345
#21 0x080c5af6 in CL_VM_UpdateView () at csprogs.c:364
#22 0x0809d6a0 in SCR_DrawScreen () at cl_screen.c:1636
#23 0x0809e91e in CL_UpdateScreen () at cl_screen.c:2241
#24 0x081165c3 in Host_Main () at host.c:948
#25 0x0804b21e in main (argc=Cannot access memory at address
0xfffffffc) at sys_sdl.c:180
