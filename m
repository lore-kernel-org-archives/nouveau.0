From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] Add fine-grain temperature reporting
Date: Wed, 16 Sep 2020 15:47:09 -0400
Message-ID: <20200916194711.999602-1-jcline@redhat.com>
References: <20200812204952.1921587-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200812204952.1921587-1-jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi folks,

This series adjusts the temp_get() interface in the thermal functions to
report milli-degrees, and additionally alters the way errors are
reported. As I went through all the users and implementations I realized
that Pascal's temp_get() implementation didn't include turning negative
temperatures to 0 like other implementations, so I separated error
reporting from the temperature in the API.

Couple of things I'm on the fence about here:

* I allowed the nvkm_therm_temp_get() functions to accept NULL as a way
  to check if temperature reading is available rather than adding a
  separate helper, but was torn about whether this is clearer than a
  separate helper function.

* I added a WARN_ON in places that previously called
  nvkm_therm_temp_get() and didn't check the return value for an error.
  This may not be a reasonable error handling method.

Jeremy Cline (2):
  drm/nouveau: return temperatures in temp_get() via parameter
  drm/nouveau: Add fine-grain temperature reporting

 .../nouveau/include/nvkm/subdev/bios/therm.h  | 13 +++++++++
 .../drm/nouveau/include/nvkm/subdev/therm.h   | 28 ++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 12 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 28 +++++++++++++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/g84.c   | 11 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 11 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/nv40.c  |  9 ++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/nv50.c  |  9 ++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  | 17 +++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/therm/temp.c  | 12 +++++---
 10 files changed, 110 insertions(+), 40 deletions(-)

-- 
2.26.2
