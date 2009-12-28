From: Krzysztof Smiechowicz <deadwood-5tc4TXWwyLM@public.gmane.org>
Subject: Re: Synchronization mostly missing?
Date: Mon, 28 Dec 2009 08:27:17 +0100
Message-ID: <4B385DD5.90008@wp.pl>
References: <ff13bc9a0912271941s5d465634te43213ea9df1d14f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a0912271941s5d465634te43213ea9df1d14f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Luca Barbieri pisze:

> I'm not sure why this hasn't been noticed before though.
> Is everyone getting randomly misrendered OpenGL or is my machine
> somehow more prone to reusing buffers?

I reported a similar problem about 2 weeks ago. It first became apparent 
with NV40 but I also confirmed it with NV30 - in both cases it was 
visible in morph3d demo. As long as nothing changes in memory 
allocation, everything is fine. If I even move a window(which causes 
some allocations in the system) vertexes become damaged.


Some information from that previous emails:

""

I see this problem on morph3d demo. What it does is: for each frame 
create a call list and then call it 4 times.

ADDR    VRAM OFFSET
A    X
B    Y
C    X

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
""

Best regards,
Krzysztof
