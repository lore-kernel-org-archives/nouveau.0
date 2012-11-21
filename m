From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 0/3] use the new dp helpers
Date: Wed, 21 Nov 2012 17:03:57 +0100
Message-ID: <1353513840-30765-1-git-send-email-daniel.vetter@ffwll.ch>
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
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Ben,

These are the nouveau patches from my small dp helper refactoring that just
landed in drm-next. Simply reduces the amount of magic numbers a bit, otherwise
no functional changes.

Due to lack of hw not really tested beyond checking that the compiler is still
happy.

Cheers, Daniel

Daniel Vetter (3):
  drm/nouveau: use the cr_ok/chanel_eq_ok helpers
  drm/nouveau: use dp link train request helper
  drm/nouveau: use the new drm_dp_max_lane_count helper

 drivers/gpu/drm/nouveau/nouveau_dp.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

-- 
1.7.11.4
