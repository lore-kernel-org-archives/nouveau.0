From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 33/40] drm/nouveau/nvkm/subdev/volt/gk20a: Demote non-conformant kernel-doc headers
Date: Fri,  8 Jan 2021 20:14:50 +0000
Message-ID: <20210108201457.3078600-34-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
index ce5d83cdc7cf7..207e5278b37ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
@@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
 	/* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
 };
 
-/**
+/*
  * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
  */
 static inline int
@@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
 	return mv;
 }
 
-/**
+/*
  * cvb_t_mv =
  * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
  * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
-- 
2.25.1
