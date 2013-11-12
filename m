From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: "Funny" index buffer transfers (was: Bug 64323] New:
 Severe misrendering in Left 4 Dead 2)
Date: Tue, 12 Nov 2013 08:35:10 +0000
Message-ID: <5281E83E.8080804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>, Nouveau devlist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello Christoph,

I was looking at bug 64323[1] over the weekend as to why this case works
under nvc0+ hardware and does not under nv50. Here are some of the
things I've noticed:
* nvc0 uses immediate(s) for VERTEX_BEGIN_GL/VERTEX_END_GL
* nvc0 is more consistent for doing pushbuffer space checks
* nvc0 uses dirty tracking in set_index_buffer()
* nvc0 uses "VERTEX_DATA push mode" over the FIFO for nv50

AFAICS the second and third one have no effect when ported to nv50. I'm
highly suspecting that "push mode" or actually the type of buffers used
will be the solution to this problem.

Would you have any input/ideas? It would be nice to have this issue
resolved properly but until then can we use one of the workarounds
mentioned in the bugreport?

Thanks
Emil

[1] https://bugs.freedesktop.org/show_bug.cgi?id=64323
