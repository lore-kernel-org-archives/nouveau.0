From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 0/4] Make ZaphodHead work with xserver 1.13
Date: Fri,  2 Nov 2012 03:57:38 +0000
Message-ID: <1351828662-10807-1-git-send-email-emil.l.velikov@gmail.com>
References: <op.wm4fbfzs8t7z9u@arch-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.wm4fbfzs8t7z9u@arch-laptop>
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
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

  As of xserver 1.13 the PlatformProbe hook is used.
 This patch series adds a few missing functions within that function
 and consolidates some of the duplicating code

 Dave, I've noticed that at least radeon and omap are lacking those,
 whereas the intel sna driver is up to scratch

 [PATCH 1/4] nouveau: Remove unneeded xf86GetEntityInfo()
 [PATCH 2/4] nouveau: introduce NVInitScrn()
 [PATCH 3/4] nouveau: Factor out common code to NVHasKMS()
 [PATCH 4/4] nouveau: NVPlatformProbe, handle shareable entities
