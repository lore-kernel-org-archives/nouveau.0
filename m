From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Re: Question about nv40_draw_array
Date: Thu, 17 Dec 2009 19:11:55 +0100
Message-ID: <4B2A746B.60603@wp.pl>
References: <4B2A4CAE.2020302@wp.pl> <4B2A6181.2010601@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2A6181.2010601-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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

Christoph Bumiller pisze:
> Hi.

Hi, thanks for the quick feedback. :)

> Most probably the state tracker calls pipe_buffer_map on the vertex
> buffer which (if it was not created as a user buffer) causes an mmap
> of it to the user's address space (so either GART system memory pages or
> VRAM pages through the FB aperture get mapped, whatever was selected in
> drivers/nouveau/nouveau_screen.c), then just writes the data and
> subsequently unmaps again.

This is what I found "inside" the nv40_draw_elements_swtnl, but I can't 
find this in case of hardware path.


>> I went through the software path "nv40_draw_elements_swtnl" and found a 
>> place in draw module where the buffer storage address is obtained and 
>> data from buffer is used direclty by software rendering. I cannot
>> however find a similar place for hardware path. I would like to learn 
>> where is the code that copies this data to gfx card or, if this is done 
>> by card reading into computer's memory, what code triggers the read, how 
>> does the gfx card know from which address in RAM to copy the data and 
>> what code indicates that the read finished.
> The vertex buffers are set up in nv40_vbo_validate, which records a
> state object to be emitted on validation.
> The address is set with method NV40TCL_VTXBUF_ADDRESS(i). We output a
> relocation, 

I assume by relocation you mean this code:

nv40_vbo.c, 536

		so_reloc(vtxbuf, nouveau_bo(vb->buffer),
				 vb->buffer_offset + ve->src_offset,
				 vb_flags | NOUVEAU_BO_LOW | NOUVEAU_BO_OR,
				 0, NV40TCL_VTXBUF_ADDRESS_DMA1);


so the kernel side fills in the appropriate address for us,

Can you tell me where this filling happens? Where does the kernel put 
this address (some buffer, card registers?) - maybe I can read it and 
validate? I assume it should put the actually memory address at which 
read should start? Or maybe address of beginning of buffer and offset in 
another "argument"?

> 
> The read is triggered by NV40TCL_BEGIN_END + NV40TCL_VB_VERTEX_BATCH,
> and it will probably be done reading when the GET pointer of the FIFO
> has moved past the command.

I assume the read will happen after pipe->flush() and not immediatelly 
after:

			BEGIN_RING(curie, NV40TCL_VB_VERTEX_BATCH, 1);
			OUT_RING  (((nr - 1) << 24) | start);




Let me describe the bug I'm facing - my suspicion is that this is caused 
by bug in my porting of TTM and not a bug in nouveau itself. I have some 
parts of code still commented out as they are linux specific and no 
immediate mapping to AROS structures could be made. Also I didn't had 
these problems on "old" drm port.

I see this problem on morph3d demo. What it does is: for each frame 
create a call list and then call it 4 times.

ADDR	VRAM OFFSET
A	X
B	Y
C	X

A,B,C is the memory offset of 32kb buffer created for vertex buffer when 
call lists are compiled. X,Y is the VRAM OFFSET (bo.mem.mm_node.start)

First buffer is created (X,A). When it gets full (after around 3 frames) 
second buffer is created (Y,B). Then first one is freed. When second 
buffer is full, third is created (X,C) - here the problem start:
according to my observations, the card seems to read vertexes not from 
address C but from address A as if it somehow remembered the initial 
address binding.

Other observations:
- the data during execution of gl commands actually seems to be put into 
location C - when I switch to software path, I could track down that it 
reads data from location C - rendering is done correctly in software path
- when I comment out freeing of memory manager node (bo.mem.mm_node), so 
that the third buffer is Z,C (paired with not yet used offset of VRAM) 
then hardware rendering behaves correctly - but this will make card "run 
out" of memory as no memory manager nodes will be deallocated
- when I switch the calls of glCallList into actual rendering code and 
disable invocation of glNewList/glEndList the hardware rendering also 
behaves correctly

Any help is appreciated.

Best regards,
Krzysztof
