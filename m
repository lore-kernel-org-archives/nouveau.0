From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv40 mpeg2 video decode
Date: Tue, 12 Jan 2010 22:02:56 -0500
Message-ID: <20100112220256.18149b3e@amd64linuxmsi.rentzhouse.lan>
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

Hello,

I have been working on a kernel and a user layer for the nv40 mpeg2 video decoding hardware:
* The decode hw accepts commands written to a fifo along with a set of registers for firing (put) and queries (get).
* The fifo can be mapped in vram or agp (though, agp isn't working right now).
* The fifo does not support dma jumps and such like the 3d fifo.

Well, I have some questions about how to implement this in nouveau:

* Mapping decode fifo in user-space versus kernel-space - My current version has the fifo being mapped from the kernel (I copied the 3d fifo simple version pretty much).  I could do this in the kernel or userspace but it would probably be faster in the kernel.

* Fencing - Each decode cmd sequence can emit a fence in a similar fashion to the 3d fifo.  So, you set the fence sequence number after a set of cmds.  You then check a register to see when the hw is done with a set of cmds.  I just don't see an easy of implementing this since the current fence mechanism only works for the 3d fifo.    

Jimmy Rentz
