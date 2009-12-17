From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: Question about nv40_draw_array
Date: Thu, 17 Dec 2009 17:51:13 +0100
Message-ID: <4B2A6181.2010601@student.tuwien.ac.at>
References: <4B2A4CAE.2020302@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2A4CAE.2020302-5tc4TXWwyLM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Krzysztof Smiechowicz schrieb:
> Hi,
> 
> My name is Krzysztof and currently I'm working on porting nouveau 
> (gallium3d driver + libdrm + drm) to AROS Research OS 
> (http://www.aros.org). I completed a quite successful port of "old" drm 
> (one from libdrm git - now removed) and currently I'm working on drm 
> port from the nouveau kernel tree git.
> 
> Right now I'm faced with rather peculiar memory allocation/access 
> problem with call lists and I would like to ask for help in 
> understanding how a certain thing is implemented.
> 
> Let's assume I have a following call trace:
> 
> #0  0x985a764d in nv40_draw_arrays (pipe=0x988ba0fc, mode=5, start=0, 
> count=3)
>      at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/../gallium/drivers/nv40/nv40_vbo.c:192
> #1  0x9865e773 in st_draw_vbo (ctx=0x9a163788, arrays=0x9a19384c, 
> prims=0x9a1d595c, nr_prims=23, ib=0x0,
>      index_bounds_valid=1 '\001', min_index=0, max_index=574)
>      at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/state_tracker/st_draw.c:698
> #2  0x9876c5fa in vbo_save_playback_vertex_list (ctx=0x9a163788, 
> data=0x9a1d5558)
>      at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/vbo/vbo_save_draw.c:277
> #3  0x985ed13a in execute_list (ctx=0x9a163788, list=1)
>      at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/main/dlist.c:6438
> #4  0x985f1871 in _mesa_CallList (list=1) at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/main/dlist.c:7622
> #5  0x98657b4b in neutral_CallList (i=1) at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/main/vtxfmt_tmp.h:298
> #6  0x9853e65a in glCallList (list=1) at 
> /data/deadwood/AROS/AROS/contrib/gfx/libs/mesa/src/mesa/glapi/glapitemp.h:95
> 
> 
> at this point nv40->vtxbuf[0] contains a vertex buffer that was 
> previously used to store a compiled call list.
> 
> My question is: how data from this buffer is being transfered to gfx 
> card/used by gfx card.
> 
Hi.
Most probably the state tracker calls pipe_buffer_map on the vertex
buffer which (if it was not created as a user buffer) causes an mmap
of it to the user's address space (so either GART system memory pages or
VRAM pages through the FB aperture get mapped, whatever was selected in
drivers/nouveau/nouveau_screen.c), then just writes the data and
subsequently unmaps again.

This seems to work, at least for buffers that are somewhat persistent.
On nv50 I experienced, well, problems with user buffers (those that are
just used for a few draw calls before being destroyed again, and have
not previously been in GPU accessible RAM).
That's why nv50 uses immediate mode for those.
> I went through the software path "nv40_draw_elements_swtnl" and found a 
> place in draw module where the buffer storage address is obtained and 
> data from buffer is used direclty by software rendering. I cannot
> however find a similar place for hardware path. I would like to learn 
> where is the code that copies this data to gfx card or, if this is done 
> by card reading into computer's memory, what code triggers the read, how 
> does the gfx card know from which address in RAM to copy the data and 
> what code indicates that the read finished.
The vertex buffers are set up in nv40_vbo_validate, which records a
state object to be emitted on validation.
The address is set with method NV40TCL_VTXBUF_ADDRESS(i). We output a
relocation, so the kernel side fills in the appropriate address for us,
which might have changed if the buffer was moved (which can happen at
any time, and *will* happen if you reloc to a different type of memory).

The read is triggered by NV40TCL_BEGIN_END + NV40TCL_VB_VERTEX_BATCH,
and it will probably be done reading when the GET pointer of the FIFO
has moved past the command.
We do some kind of fencing in the kernel and probably make sure the
buffer isn't deleted or moved until the card is done with it, I'm not
really familiar with the details, would have to read up on some code.
> The card in question is GF6200 AGP *but* it runs in PCI mode.
> 
> Any help is GREATLY appreciated as I'm stuck on my bug for a long time now.
> 
> Best regards,
> Krzysztof
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

If that wasn't detailed enough, confusing or whatever, I hope someone
else will answer. Or come to IRC.

Christoph
