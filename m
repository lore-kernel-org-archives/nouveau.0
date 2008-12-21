From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some ideas on how to mix userspace fifo's with a
 kernel memory manager
Date: Sun, 21 Dec 2008 01:51:58 +0100
Message-ID: <494D932E.2010906@gmail.com>
References: <494CEC01.9020801@gmail.com>
	<fc5b84ad0812201308r5fab4534j93ebe66b7b486319@mail.gmail.com>
	<494D7651.9050005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <494D7651.9050005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/20/2008 11:48 PM, Maarten Maathuis wrote:
> On 12/20/2008 10:08 PM, Ben Skeggs wrote:
>>
>>
>> On Sat, Dec 20, 2008 at 11:58 PM, Maarten Maathuis 
>> <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
>>
>>     I was thinking of the following system:
>>
>>     Allocate a fifo for userspace, map the fifo, map the fifo
>>     registers into
>>     userspace.
>>     These allocations are therefore pinned, so something to avoid memory
>>     fragmentation has to be done.
>>
>>     Userspace library fills up an entire fifo, minus a few essential
>>     things
>>     i will mention later. Userspace does ioctl with all the bo's it'll
>>     need
>>     for the fifo.
>>     Kernel pins all these bo's,
>>
>>  Feel free to give it a try, there's nothing stopping you.  The main 
>> reason being that the kernel has to be able to do things such as emit 
>> buffer moves, and zero-fill new buffers.  We have a channel allocated 
>> for the DRM, but as I discovered doing all the above on that channel 
>> has severe performance issues (synchronisation beween client's 
>> channel and kernel's channel).
>
> You make a good point, i hadn't considered this requirement.
>
>>
>>     creates several dma objects
>>     that covers only a single bo (as a form of memory protection). 
>> Kernel
>>     sends back a list of these object handles
>>
>> The first major problem is here.  This has been discussed numerous 
>> times already, and as good an idea as it sounds, it's not possible to 
>> implement on any of the chipsets we support.  On all the 3D object 
>> classes, there's exactly 2 methods that take object handles for 
>> textures (DMA_TEXTURE*).  Now, on nv4x you can use up to 16 texture 
>> images, which would each have separate bos.  See the problem 
>> already?  The image units have a bit which allow you to select 
>> between DMA_TEXTURE0 and DMA_TEXTURE1 but that's all.
>
> I just realised this (i was actually going to reply about this if you 
> hadn't).
>
>>
>> If you're concerned about protection there's not a great deal that's 
>> feasible on pre-nv5x chipsets.  Protecting clients from accessing 
>> memory that's not supposed to be accessible by the GPU is all we can 
>> do, stopping channels from accessing each others' memory isn't.  On 
>> nv5x each channel has its own address space, which gives us much more 
>> flexibility.
>>
>>     + a list of ref_cnt values
>>     that have to inserted after the bo usage is done. Userspace fills
>>     in the
>>     remaining values and fires the fifo.
>>
>>     Later, under memory pressure for example, the memory manager checks
>>     which bo's can be unpinned.
>>
>>
>>
>>     So you'll still need an ioctl, but you do avoid a copy into kernel
>>     space, which might hurt for stuff like hostdata transfers.
>>
>> If you notice the comments in my GEM code, I don't intend on doing 
>> this forever.  I'm currently in the process of moving interstate and 
>> don't have access to the system I've been working on the mm stuff 
>> from, hopefully in a couple of weeks I'll be able to get back to it.
>
> Out of curiosity, does the current work for nv50? It's tempting to 
> give it a try and fiddle with it, but if there's still a lot to do to 
> even get it working then I'm probably wasting my time.

I can partially answer myself, no, it doesn't work, there's a stange 
stripe pattern in the framebuffer and overal it's very crashy. I'll have 
a look at the ng ddx code, maybe there are obvious mistakes.

>
> Do you intend to something mmap'ish for command buffers?
>
>>
>> Ben.
>>
>>
>>
>>     As usual, comment is appreciated.
>>
>>     Maarten.
>>     _______________________________________________
>>     Nouveau mailing list
>>     Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
>>     http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>
>
