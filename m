From: "Wladimir van der Laan" <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: G80
Date: Sat, 23 Jun 2007 18:34:36 +0200
Message-ID: <3a7f9e660706230934k27e70a2ah60a5a90805664f2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Hi there,

I'd like to help on finding out more details about the G8x hardware
from NVidia, especially given these cards have more functionality than
your average GPU: with CUDA (
http://developer.nvidia.com/object/cuda.html ) it is possible to use
them as compute devices.

This makes me very interested in their low level capabilities, like
microcode/shader specifications, and maybe even how to drive them
without the NVidia binary driver blob. It seems the hardware has a lot
more possibilities than the current libraries expose, for various
reasons.

To do this, I'd like to intercept communications between libcuda.so
and the /dev/nvidia* devices, and /dev/nvidiactl. Is this what the
Noveau developers have been doing already for GL? (I'm new to this)

Also, as more people are working on it according to TiNDC #21, can I
find the things that are already known somewhere?

-- 
Wladimir
Ogre3D Team (http://www.ogre3d.org)
