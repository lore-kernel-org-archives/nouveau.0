From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 0/5] Thermal management fixes
Date: Sun, 11 Aug 2013 22:48:47 -0400
Message-ID: <1376275732-2878-1-git-send-email-martin.peres@free.fr>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

This patchset is mostly about fixing fdo bug #66177, reported by Dash Four.
This bug is about fan/temp management not working after a suspend/resume cycle.

Fan/therm management relies on ptimer's alarm feature to call periodically
multiple callbacks that poll the temperature and update the fan speed if needed.
The problem is that there is no easy way to make this work across suspend or
hibernate cycles because it would require making sure the IRQs aren't serviced
until all nouveau engines and subdevs are initialized after resume. This means
the alarm feature should be the last thing re-activated again. 

The proposed solution is a bit simpler. Ptimer.alarm's clients should cancel
their scheduled tasks before suspending and re-add them when resuming. The code
is thus very simple.

Patch 3 should also fix fan speed reading while suspending.

Emil Velikov (1):
  drm/nouveau/therm: Set the correct pwm_mode upon resume

Martin Peres (4):
  drm/nouveau/fan: restore the PWM value on resume when using the manual
    or auto mode
  drm/nouveau/timer: restore the time on resume
  drm/nouveau/timer: add a way to cancel alarms
  drm/nouveau/therm: survive to suspend/resume cycles

 .../gpu/drm/nouveau/core/include/subdev/timer.h    |  2 ++
 drivers/gpu/drm/nouveau/core/subdev/therm/base.c   | 19 ++++++++++--
 drivers/gpu/drm/nouveau/core/subdev/therm/fan.c    | 20 +++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/therm/priv.h   |  4 +++
 drivers/gpu/drm/nouveau/core/subdev/therm/temp.c   | 21 +++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/timer/base.c   |  7 +++++
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c   | 35 +++++++++++++++++++++-
 7 files changed, 104 insertions(+), 4 deletions(-)

-- 
1.8.3.4
