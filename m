From: Alexander Kapshuk <alexander.kapshuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa-20.3.2] NULL pointer dereference in
 vl_compositor_yuv_deint_full
Date: Sun, 3 Jan 2021 10:18:09 +0200
Message-ID: <CAJ1xhMWd88uPECyNk4EO5g0w9E3RJci-3-FcGOvdrZwN8Vzh5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

NVIDIA chip affected:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
210] (rev a1)

The null pointer dereference occurs here:
Thread 27 "vlc" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7fff8f7c1640 (LWP 79292)]
0x00007fff8d59d1da in vl_compositor_yuv_deint_full (s=0x7fff980e8518,
c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
src_rect=0x7fff8f7c0470,
    dst_rect=0x7fff8f7c0460, deinterlace=VL_COMPOSITOR_WEAVE) at
../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
689     dst_surfaces = dst->get_surfaces(dst); //dst==NULL

=> 0x00007fff8d5981da <+42>:    call   *0x38(%rcx) //rcx is dst
(gdb) i r rcx
rcx            0x0                 0

(gdb) bt
#0  0x00007fff8d59d1da in vl_compositor_yuv_deint_full
    (s=0x7fff980e8518, c=0x7fff980e83d8, src=0x7fff98670030, dst=0x0,
src_rect=0x7fff8f7c0470, dst_rect=0x7fff8f7c0460,
deinterlace=VL_COMPOSITOR_WEAVE) at
../mesa-20.3.2/src/gallium/auxiliary/vl/vl_compositor.c:689
#1  0x00007fff8d58a29b in vlVaDeriveImage (ctx=0x7fff980c1590,
surface=<optimized out>, image=0x7fff8f7c05e0)
    at ../mesa-20.3.2/src/gallium/frontends/va/image.c:321
#2  0x00007fff91485799 in vaDeriveImage () at /usr/lib/libva.so.2
#3  0x00007fff8e2256d2 in  () at
/usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
#4  0x00007fff8e224189 in  () at
/usr/lib/vlc/plugins/video_output/libglconv_vaapi_x11_plugin.so
#5  0x00007fff8f6b1896 in  () at
/usr/lib/vlc/plugins/video_output/libgl_plugin.so
#6  0x00007fff8f6b86db in  () at
/usr/lib/vlc/plugins/video_output/libgl_plugin.so
#7  0x00007ffff7d07cee in  () at /usr/lib/libvlccore.so.9
#8  0x00007ffff7cfa019 in  () at /usr/lib/libvlccore.so.9
#9  0x00007ffff7cfbf9e in  () at /usr/lib/libvlccore.so.9
#10 0x00007ffff7f623e9 in start_thread () at /usr/lib/libpthread.so.0
#11 0x00007ffff7e8a293 in clone () at /usr/lib/libc.so.6

mesa-20.3.2/src/gallium/frontends/va/image.c:312,313
VAStatus
vlVaDeriveImage(VADriverContextP ctx, VASurfaceID surface, VAImage *image)
{
...
         new_template.interlaced = false; //create_video_buffer
returns NULL if new_template.interlaced is set to false See below.
         new_buffer = drv->pipe->create_video_buffer(drv->pipe, &new_template);
...
         vl_compositor_yuv_deint_full(&drv->cstate, &drv->compositor,
                           surf->buffer, new_buffer,
                           &src_rect, &dst_rect,
                           VL_COMPOSITOR_WEAVE);
...
}

[Note]
mesa-20.3.2/src/gallium/drivers/nouveau/nv50/nv84_video.c:618,621
struct pipe_video_buffer *
nv84_video_buffer_create(struct pipe_context *pipe,
                         const struct pipe_video_buffer *template)
{
...
   if (!template->interlaced) { //setting this to true in
vlVaDeriveImage returns valid buffer
      debug_printf("Require interlaced video buffers\n");
      return NULL;
   }
...
}

Please advise on the further course of action.
