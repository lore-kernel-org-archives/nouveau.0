From: "Clemens Eisserer" <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: NV4x and A8 pictures
Date: Mon, 17 Nov 2008 01:52:13 +0100
Message-ID: <194f62550811161652v5f1ff1e2r503b0b2a6f888b45@mail.gmail.com>
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

Hi,

Does NV4x have support for A8 destinations?
I am doing XRenderFillRectangles to an A8 mask, and later I use this
mask in composite operations.
In some seldom cases I also do an A8->A8 composition operation.

I had a look at the source and for both NV3x/4x there I found a shader
in NV40EXAHackupA8Shaders.
What are those used for?

Would it help in such cases to allocate the mask as ARGB32, draw to it
using argb32 values?

Thank you in advance, Clemens
