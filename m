From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Memory corruption on Gallium window resize, diagnosed?
Date: Wed, 12 Nov 2008 00:26:49 +0200
Message-ID: <20081112002649.4eedec4f@daedalus.pq.iki.fi>
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
To: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I've been playing with nouveau/mesa branch gallium-0.1, trying to get
trivial/tri working on nv20 (with nv10 code). When ever I resize the window,
it ends up in an assert failure:

#0  0xf790744f in _debug_assert_fail (expr=0xf791908f "0", file=0xf7919050 "nv20_state_emit.c", line=139, 
    function=0xf7919034 "nv20_state_emit_framebuffer") at p_debug.c:335
#1  0xf76fe723 in nv20_state_emit_framebuffer (nv20=0x805ef68) at nv20_state_emit.c:139
#2  0xf76fef2e in nv20_emit_hw_state (nv20=0x805ef68) at nv20_state_emit.c:255
#3  0xf76ff70b in nv20_draw_elements (pipe=0x805ef68, indexBuffer=0x0, indexSize=0, prim=4, start=0, count=3) at nv20_vbo.c:20
#4  0xf76ff922 in nv20_draw_arrays (pipe=0x805ef68, prim=4, start=0, count=3) at nv20_vbo.c:73
#5  0xf7743ac8 in st_draw_vbo (ctx=0x8074d18, arrays=0x80ade38, prims=0x80ac994, nr_prims=1, ib=0x0, min_index=0, max_index=2)
    at state_tracker/st_draw.c:634
#6  0xf782c140 in vbo_exec_vtx_flush (exec=0x80ac870) at vbo/vbo_exec_draw.c:248
#7  0xf782a858 in vbo_exec_FlushVertices (ctx=0x8074d18, flags=1) at vbo/vbo_exec_api.c:752
#8  0xf7761f39 in _mesa_Flush () at main/context.c:1815
#9  0xf7e00ae6 in glFlush () at ../../../src/mesa/glapi/glapitemp.h:1170
#10 0x08048dba in Draw () at tri.c:83
#11 0xf7ecdc54 in processWindowWorkList (window=0x8051200) at glut_event.c:1302
#12 0xf7ecdd3a in __glutProcessWindowWorkLists () at glut_event.c:1354
#13 0xf7ecddb1 in glutMainLoop () at glut_event.c:1375
#14 0x08048fd8 in main (argc=1, argv=0xfff760e4) at tri.c:132

The struct pipe_surface used there contains garbage:

(gdb) print *fb->cbufs[0]
$4 = {buffer = 0xf7d901a0, format = -136773216, status = 1, clear_value = 0, width = 189, height = 181, block = {size = 4, width = 1, 
    height = 1}, nblocksx = 189, nblocksy = 181, stride = 768, layout = 0, offset = 0, refcount = 0, usage = 12, winsys = 0x0, 
  texture = 0x0, face = 0, level = 0, zslice = 88}

I tried to track what writes the insane value to the format field,
and always came up with malloc and free, which didn't make any sense.

Then I ran it with valgrind:

==5322== Invalid read of size 4
==5322==    at 0x7B6887C: pipe_surface_reference (p_inlines.h:93)
==5322==    by 0x7B6881F: copy_framebuffer_state (cso_context.c:781)
==5322==    by 0x7B68962: cso_set_framebuffer (cso_context.c:791)
==5322==    by 0x7AB5441: update_framebuffer_state (st_atom_framebuffer.c:147)
==5322==    by 0x7AB3E41: st_validate_state (st_atom.c:188)
==5322==    by 0x7ABDA2E: st_clear (st_cb_clear.c:517)
==5322==    by 0x7B0BED5: _mesa_Clear (clear.c:177)
==5322==    by 0x47F25FA: glClear (glapitemp.h:1100)
==5322==    by 0x8048CE9: Draw (tri.c:72)
==5322==    by 0x46F2C53: processWindowWorkList (glut_event.c:1302)
==5322==    by 0x46F2D39: __glutProcessWindowWorkLists (glut_event.c:1354)
==5322==    by 0x46F2DB0: glutMainLoop (glut_event.c:1375)
==5322==  Address 0x7638a0c is 68 bytes inside a block of size 84 free'd
==5322==    at 0x46D99EC: free (vg_replace_malloc.c:323)
==5322==    by 0x797E17D: nv20_miptree_surface_release (nv20_miptree.c:144)
==5322==    by 0x7AC0C69: pipe_surface_reference (p_inlines.h:95)
==5322==    by 0x7AC07D3: st_renderbuffer_alloc_storage (st_cb_fbo.c:97)
==5322==    by 0x7A07844: _mesa_resize_framebuffer (framebuffer.c:292)
==5322==    by 0x79C2F65: st_resize_framebuffer (st_framebuffer.c:147)
==5322==    by 0x7950CB3: nouveau_context_bind (nouveau_context.c:324)
==5322==    by 0x794A6E4: DoBindContext (dri_util.c:380)
==5322==    by 0x794A78E: driBindContext (dri_util.c:413)
==5322==    by 0x47C14B2: BindContextWrapper (glxext.c:1621)
==5322==    by 0x47C15F2: MakeContextCurrent (glxext.c:1675)
==5322==    by 0x47C1927: glXMakeCurrent (glxext.c:1797)
==5322== 

and a couple more invalid reads, and a segfault.
My theory is: when the window resize occurs, somewhere along the path

st_renderbuffer_alloc_storage(GLcontext * ctx, struct gl_renderbuffer *rb,
                              GLenum internalFormat,
                              GLuint width, GLuint height)
{
   struct pipe_context *pipe = ctx->st->pipe;
   struct st_renderbuffer *strb = st_renderbuffer(rb);
   struct pipe_texture template;
   unsigned surface_usage;

   /* Free the old surface and texture
    */
   pipe_surface_reference( &strb->surface, NULL );
   pipe_texture_reference( &strb->texture, NULL );

is executed, which AFAICT frees the pipe_surface. My backtraces
show it really is freed, since the pipe_surface::refcount = 1
and decreases to zero. Then the new pipe_surface is allocated
and things are looking good so far. This is seen in the
"freed" part of the valgrind stack trace.

Then we get to the first glClear after resize, and hit the CSO
cache. The cache still has a pointer to the already freed pipe_surface
(well, the memory address is the same), and frees it again. See the
valgring stack trace, the invalid read happens in three places

pipe_surface_reference(struct pipe_surface **ptr, struct pipe_surface *surf)
{
   /* bump the refcount first */
   if (surf) 
      surf->refcount++;

   if (*ptr) {

      /* There are currently two sorts of surfaces... This needs to be
       * fixed so that all surfaces are views into a texture.
       */
#->   if ((*ptr)->texture) {
         struct pipe_screen *screen = (*ptr)->texture->screen;
         screen->tex_surface_release( screen, ptr );
      }
      else {
#->      struct pipe_winsys *winsys = (*ptr)->winsys;
#->      winsys->surface_release(winsys, ptr);
      }

and then segfaults. So there's a free too much, or something
forgets to increment the reference count. Or something else.

What do you say, how do we fix it, is this the bug?

Note, that nouveau/mesa gallium-0.1 has been last synced to mesa/mesa
Sept 18th, so maybe you have already fixed it? Or not?

I looked at the diffs and logs, but didn't see a fix.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
