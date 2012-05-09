From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [Patches]mesa/nv30: Diverse set of patches that improve
	NV3x render quality
Date: Thu, 10 May 2012 00:06:29 +0200
Message-ID: <1336601193-19147-1-git-send-email-r.spliet@student.tudelft.nl>
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
To: Nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

For all these patches I'd say: testers are welcome. The first three patches seem good enough to push as we speak IMHO (so if you agree, go ahead!), whereas for the fourth I don't know if this is the desired way to fix. The result of these four patches is that NV34 gives a nearly-correct desktop experience, where only some fading animations appear broken. It's quite useable now!

[1/4]: Fixes nearly all piglit vertprog testcases, due to it now being able to pass the results on to the fragment shader. 
[2/4]: Fixes shader compiler assertion errors: src[1] was uninitialised or filled with rubbish. Fixes several piglits.
[3/4]: as it says
[4/4]: Avoids the case where the framebuffer (?) is assumed to be swizzling and linear. Due to the current OR-logic this results in a type of 0x3, which simply does not exist in NV30 hardware. A better fix can be proposed, but as far as I know this does no harm even if the bug I hit was only due to a broken mesa setup.
