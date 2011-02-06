From: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Nouveau won't load with GeForce 6150SE nForce 430 (NV40)
Date: Sat, 5 Feb 2011 16:30:07 -0800
Message-ID: <AANLkTim9QZxKmNwux38ggsp1Y22vzHCja1gV-F2QhsOZ@mail.gmail.com>
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

I can't seem to get nouveau to load with my onboard GeForce 6150SE
nForce 430 which I believe is an NV40 chip.  I enabled DRM and
DRM_NOUVEAU in the kernel but lspci -v doesn't show any kernel driver
in use and Xorg fails to load the module.  It does work with the
nvidia driver.  I'm using Gentoo.

Should nouveau work with my card?  If so, any idea what I did wrong?

- Grant
