From: Alex <alex.lavoro.propio-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: NV40 LLVM Backend Status
Date: Thu, 1 Jan 2009 16:32:44 +0100
Message-ID: <4d77c5f20901010732q38dcb16emcd2d1d190535e675@mail.gmail.com>
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

Bonjour.

(1) Is there any other open source GPU backend in LLVM?

(2) I'd like to know the current status and plan of NV40 LLVM backend.
Does it work?

I cloned from git://anongit.freedesktop.org/~marcheu/llvm, but it
seems that a lot of code are stilling missing.

I've done a search on Nouveau wiki and mailing list but what I only found is:
"Marcheu is working on and off on LLVM for NV4 to NV20 cards with
optimizations for NV30. That would allow Nouveau to translate shaders
into fixed function stuff
http://people.freedesktop.org/~ahuillet/irclogs/nouveau-2008-10-10.htm#2139)
"

Best Regards, Alex.
