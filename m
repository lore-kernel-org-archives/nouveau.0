From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Kernel module indispensable?
Date: Wed, 01 Aug 2007 14:09:23 -0400
Message-ID: <jwvtzrj2kts.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
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


I don't need 3D acceleration but I'm interested in the nouveau driver
because I hope it'll be able to properly set the mode of my card: currently
nv is unable to make my card display 1600x1200 via DVI (it works OK via VGA
but the quality is bit less stunning).

So I compiled and installed it, but now I encountered a problem: it seems
that (contrary to both the nv and the nvidia drivers) the nouveau driver
does not work at all without the corresponding kernel module.  Is that true?
Is there some hope to drop this requirement?


        Stefan "whose kernel says `-1 Unknown symbol in module' when trying
                to insert the new drm.ko module"


PS: I see that the avivo guys already have a Debian package (in
experimental), whereas that is still missing for the nouveau driver.
