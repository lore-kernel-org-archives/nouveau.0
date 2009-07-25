From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [RFC] patch 0/4: DRM MMIO accessor cleanup
Date: Sat, 25 Jul 2009 15:29:03 +0300
Message-ID: <1248524947-4550-1-git-send-email-pq@iki.fi>
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

Hi,

this is continuation for the MMIO accessor rewrite and cleanup.
I am currently running nv28 with these patches applied, but
I cannot test on PPC.

Please, review and comment. If the direction is good, I'll do the
same to INSTANCE_{RD,WR} as I did for nv_{rd,wr}32, and change
PRAMIN from drm_local_map to simple ioremap.

Can the same be done for channel specific mappings, that is
nvchan_{rd,wr}32?

The macros nv_{in,out}32 are very close to removal now.

It also looks like nouveau_load() is in need of serious error
path review for resource leakage. And maybe refactorization,
too, into small functions.

- pq
