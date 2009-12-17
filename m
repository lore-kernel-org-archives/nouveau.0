From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: Question about nv40_draw_array
Date: Thu, 17 Dec 2009 22:26:43 +0100
Message-ID: <4B2AA213.30706@student.tuwien.ac.at>
References: <4B2A4CAE.2020302@wp.pl> <4B2A6181.2010601@student.tuwien.ac.at>
	<4B2A746B.60603@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2A746B.60603-5tc4TXWwyLM@public.gmane.org>
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

On 17.12.2009 19:11, Krzysztof Smiechowicz wrote:
> Christoph Bumiller pisze:
>   
>> Hi.
>>     
> Hi, thanks for the quick feedback. :)
>
>   
>> Most probably the state tracker calls pipe_buffer_map on the vertex
>> buffer which (if it was not created as a user buffer) causes an mmap
>> of it to the user's address space (so either GART system memory pages or
>> VRAM pages through the FB aperture get mapped, whatever was selected in
>> drivers/nouveau/nouveau_screen.c), then just writes the data and
>> subsequently unmaps again.
>>     
> This is what I found "inside" the nv40_draw_elements_swtnl, but I can't 
> find this in case of hardware path.
>
>   
If the state tracker uses a buffer with PIPE_BUFFER_USAGE_VERTEX,
the data will be in GPU accessible memory already, i.e. there will be
a nouveau_bo_kalloc'd / TTM buffer object.
If it uses a user buffer, a kernel side bo is allocate in bo_emit_buffer
and the data is memcpy'd there.
>>> I went through the software path "nv40_draw_elements_swtnl" and found a 
>>> place in draw module where the buffer storage address is obtained and 
>>> data from buffer is used direclty by software rendering. I cannot
>>> however find a similar place for hardware path. I would like to learn 
>>> where is the code that copies this data to gfx card or, if this is done 
>>> by card reading into computer's memory, what code triggers the read, how 
>>> does the gfx card know from which address in RAM to copy the data and 
>>> what code indicates that the read finished.
>>>       
>> The vertex buffers are set up in nv40_vbo_validate, which records a
>> state object to be emitted on validation.
>> The address is set with method NV40TCL_VTXBUF_ADDRESS(i). We output a
>> relocation, 
>>     
> I assume by relocation you mean this code:
>
> nv40_vbo.c, 536
>
> 		so_reloc(vtxbuf, nouveau_bo(vb->buffer),
> 				 vb->buffer_offset + ve->src_offset,
> 				 vb_flags | NOUVEAU_BO_LOW | NOUVEAU_BO_OR,
> 				 0, NV40TCL_VTXBUF_ADDRESS_DMA1);
>
>
>   
> so the kernel side fills in the appropriate address for us,
>
> Can you tell me where this filling happens? Where does the kernel put 
> this address (some buffer, card registers?) - maybe I can read it and 
> validate? I assume it should put the actually memory address at which 
> read should start? Or maybe address of beginning of buffer and offset in 
> another "argument"?
>
>   
The address is put into the FIFO == command buffer, which is
submitted to the kernel for emission on FIRE_RING.
The address is the start address of the buffer + the data
argument (in the above case vb->buffer_offset + ve->src_offset)
for nouveau_pushbuf_emit_reloc.
The drm_nouveau_gem_pushbuf_bo struct contains that
data and an index in the command buffer the address is to
be placed, this will also be handed to the kernel.
Look at nouveau_gem_ioctl_pushbuf_* in the kernel's
nouveau_gem.c, there's nouveau_gem_pushbuf_reloc_apply
and friends which will handle relocation.
I don't know how their exact proceedings.

The reloc above contains the actual start address of the
vertex element, so there's no other method/reg used to
set an additional offset as far as I can see.
>> The read is triggered by NV40TCL_BEGIN_END + NV40TCL_VB_VERTEX_BATCH,
>> and it will probably be done reading when the GET pointer of the FIFO
>> has moved past the command.
>>     
> I assume the read will happen after pipe->flush() and not immediatelly 
> after:
>
> 			BEGIN_RING(curie, NV40TCL_VB_VERTEX_BATCH, 1);
> 			OUT_RING  (((nr - 1) << 24) | start);
>
>
>
>   
Right.
> Let me describe the bug I'm facing - my suspicion is that this is caused 
> by bug in my porting of TTM and not a bug in nouveau itself. I have some 
> parts of code still commented out as they are linux specific and no 
> immediate mapping to AROS structures could be made. Also I didn't had 
> these problems on "old" drm port.
>
> I see this problem on morph3d demo. What it does is: for each frame 
> create a call list and then call it 4 times.
>
> ADDR	VRAM OFFSET
> A	X
> B	Y
> C	X
>
> A,B,C is the memory offset of 32kb buffer created for vertex buffer when 
> call lists are compiled. X,Y is the VRAM OFFSET (bo.mem.mm_node.start)
>
> First buffer is created (X,A). When it gets full (after around 3 frames) 
> second buffer is created (Y,B). Then first one is freed. When second 
> buffer is full, third is created (X,C) - here the problem start:
> according to my observations, the card seems to read vertexes not from 
> address C but from address A as if it somehow remembered the initial 
> address binding.
>
>   
So the actual VRAM (or GART) addresses are X + A, Y + B, X + C;
If they're all different and you get the vertices from X + A either
you have a bug or if X + A == X + C stuff is not written, or maybe
the GPU has cached that area somehow (even if the CPU has flushed).
I know that the kernel should take care of all cache flushing, but,
I made the same observation on nv50 that this somehow doesn't
seem to always work.
But then, maybe I was too quick to blame caches and should
try to find out if it isn't actually some other bug ...

From renouveau dumps it doesn't look like you need to insert
a fence in the command stream when you change the vtxbuf
addresses, on nv50 that is, I don't know about nv40, sorry.
But it *did* look like the blob inserts a fence after *uploading*
new data to a vertex buffer. That's why there's method 0x142c
in nv50_draw_arrays.
> Other observations:
> - the data during execution of gl commands actually seems to be put into 
> location C - when I switch to software path, I could track down that it 
> reads data from location C - rendering is done correctly in software path
> - when I comment out freeing of memory manager node (bo.mem.mm_node), so 
> that the third buffer is Z,C (paired with not yet used offset of VRAM) 
> then hardware rendering behaves correctly - but this will make card "run 
> out" of memory as no memory manager nodes will be deallocated
> - when I switch the calls of glCallList into actual rendering code and 
> disable invocation of glNewList/glEndList the hardware rendering also 
> behaves correctly
>
> Any help is appreciated.
>
> Best regards,
> Krzysztof
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>   
