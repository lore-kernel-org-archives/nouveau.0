From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/9] drm/nouveau/kms: A bunch of runtime_pm fixes
Date: Wed, 29 Jul 2020 17:36:54 -0400
Message-ID: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

While working on refactoring how we handle connector hotplugging/probing
+ a bunch of misc DP stuff, I found a bunch of runtime_pm errors that
were mostly introduced by me at one point. Oops. A lot of these aren't
triggered consistently on a lot of systems, so it's not terribly
surprising these got swept under the rug.

Lyude Paul (9):
  drm/nouveau/kms: Handle -EINPROGRESS in nouveau_connector_hotplug()
  drm/nouveau/kms: Fix rpm leak in nouveau_connector_hotplug()
  drm/nouveau/kms/fbcon: Correct pm_runtime calls in
    nouveau_fbcon_release()
  drm/nouveau/kms/fbcon: Fix pm_runtime calls in
    nouveau_fbcon_output_poll_changed()
  drm/nouveau/kms/fbcon: Use pm_runtime_put_autosuspend() in suspend
    work
  drm/nouveau/kms: Use pm_runtime_put_autosuspend() in hpd_work
  drm/nouveau/kms: Invert conditionals in nouveau_display_acpi_ntfy()
  drm/nouveau/kms: Fix runtime PM leak in nouveau_display_acpi_ntfy()
  drm/nouveau/kms: Handle -EINPROGRESS in nouveau_display_acpi_ntfy()

 drivers/gpu/drm/nouveau/nouveau_connector.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   | 52 ++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     | 18 ++++---
 3 files changed, 41 insertions(+), 34 deletions(-)

-- 
2.26.2
