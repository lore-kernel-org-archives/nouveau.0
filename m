From: Dzianis Kahanovich <mahatma-jC57FVqSskN9IU3jSFkzTg@public.gmane.org>
Subject: nv4c broken after october (approx.)
Date: Wed, 02 Feb 2011 19:28:36 +0200
Message-ID: <4D499444.20009@bspu.unibel.by>
Reply-To: mahatma-cw37gHAUgAY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

After october I got broken image on my integrated nv4c chip (are you need
precise model?). I don't know precise time points, but now known: in Gentoo
portage still 20101010 - good, 20101130 - bad (but I use git version before
problems and now - without acceleration/with shadowfb). If I set 32M VRAM -
image is semi-broken. I may to do some testings (like testing git by day or try
to trace registers), but in first point IMHO this minimal info may help to
developers too.

Last actions was: installing current kernel (2.6.38-rc2-git8), known
nouveau-firmware and current driver & libdrm snapshots.

This is my screen: http://mahatma.bspu.unibel.by/IMG0035A.jpg
(default it was green MJ leafs on background, terminal window and panel on top)

PS Even if you omit support of old chips, this is looks semi-working but memory
misorganized and in theory still possible to fix. Or no?

-- 
WBR, Dzianis Kahanovich AKA Denis Kaganovich, http://mahatma.bspu.unibel.by/
