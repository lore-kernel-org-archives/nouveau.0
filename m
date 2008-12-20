From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Some ideas on how to mix userspace fifo's with a kernel
	memory manager
Date: Sat, 20 Dec 2008 13:58:41 +0100
Message-ID: <494CEC01.9020801@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I was thinking of the following system:

Allocate a fifo for userspace, map the fifo, map the fifo registers into 
userspace.
These allocations are therefore pinned, so something to avoid memory 
fragmentation has to be done.

Userspace library fills up an entire fifo, minus a few essential things 
i will mention later. Userspace does ioctl with all the bo's it'll need 
for the fifo. Kernel pins all these bo's, creates several dma objects 
that covers only a single bo (as a form of memory protection). Kernel 
sends back a list of these object handles + a list of ref_cnt values 
that have to inserted after the bo usage is done. Userspace fills in the 
remaining values and fires the fifo.

Later, under memory pressure for example, the memory manager checks 
which bo's can be unpinned.

So you'll still need an ioctl, but you do avoid a copy into kernel 
space, which might hurt for stuff like hostdata transfers.

As usual, comment is appreciated.

Maarten.
