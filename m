From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [Patches] mesa/nv30: Diverse set of patches that improve
	NV3x render quality V2
Date: Sat, 12 May 2012 03:42:28 +0200
Message-ID: <1336786951-3325-1-git-send-email-r.spliet@student.tudelft.nl>
References: <[Patches]mesa/nv30: Diverse set of patches that improve NV3x
	render quality>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <[Patches]mesa/nv30: Diverse set of patches that improve NV3x
	render quality>
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

A reworked version of 3 out of 4 patches mentioned earlier.

[1/4]: Fixes nearly all piglit vertprog testcases, due to now being able to pass the results on to the fragment shader. V2: rename samplers to texcoords.
[2/4]: Fixes shader compiler assertion errors, as some source registers do not exist for certain operations. Fixes several piglit tests when mesa is compiled with --enable-debug
[3/4]: unchanged
[4/4]: Dropped, requires a more substantial fix. As a quick-fix it's still useable though.

Testers welcome!
