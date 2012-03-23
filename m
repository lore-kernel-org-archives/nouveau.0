From: Andreas Heider <andreas-nJONrVjOgt4@public.gmane.org>
Subject: [PATCH 0/3] Prepare nouveau for other switcheroo handlers
Date: Fri, 23 Mar 2012 22:57:04 +0100
Message-ID: <1332539827-13047-1-git-send-email-andreas@meetr.de>
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

While working on a vga_switcheroo handler for Apple's Macbook Pros I stumbled
upon a few bugs regarding the usage of nouveau with other switcheroo handlers
and module unloading, here are my fixes for them.


Andreas Heider (3):
  drm/nouveau: Initialize has_optimus
  drm/nouveau: Check dsm on switcheroo unregister
  drm/nouveau: Unregister switcheroo client on exit

 drivers/gpu/drm/nouveau/nouveau_acpi.c  |    5 +++--
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

--
1.7.9.1
