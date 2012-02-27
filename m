From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/nouveau: do a better job at hiding the NIH i2c
	bit-banging algo
Date: Tue, 28 Feb 2012 00:42:19 +0100
Message-ID: <1330386139-22499-1-git-send-email-daniel.vetter@ffwll.ch>
References: <20120227172548.GG4866@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20120227172548.GG4866@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

I'd like to export the corresponding functions from the i2c core
so that I can use them in fallback bit-banging in i915.ko

v2: Adapt to new i2c export patch.

Cc: nouveau@lists.freedesktop.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/nouveau/nouveau_i2c.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.c b/drivers/gpu/drm/nouveau/nouveau_i2c.c
index 820ae7f..8f4f914 100644
--- a/drivers/gpu/drm/nouveau/nouveau_i2c.c
+++ b/drivers/gpu/drm/nouveau/nouveau_i2c.c
@@ -277,7 +277,7 @@ i2c_bit_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-const struct i2c_algorithm i2c_bit_algo = {
+const struct i2c_algorithm nouveau_i2c_bit_algo = {
 	.master_xfer = i2c_bit_xfer,
 	.functionality = i2c_bit_func
 };
@@ -384,12 +384,12 @@ nouveau_i2c_init(struct drm_device *dev)
 		case 0: /* NV04:NV50 */
 			port->drive = entry[0];
 			port->sense = entry[1];
-			port->adapter.algo = &i2c_bit_algo;
+			port->adapter.algo = &nouveau_i2c_bit_algo;
 			break;
 		case 4: /* NV4E */
 			port->drive = 0x600800 + entry[1];
 			port->sense = port->drive;
-			port->adapter.algo = &i2c_bit_algo;
+			port->adapter.algo = &nouveau_i2c_bit_algo;
 			break;
 		case 5: /* NV50- */
 			port->drive = entry[0] & 0x0f;
@@ -402,7 +402,7 @@ nouveau_i2c_init(struct drm_device *dev)
 				port->drive = 0x00d014 + (port->drive * 0x20);
 				port->sense = port->drive;
 			}
-			port->adapter.algo = &i2c_bit_algo;
+			port->adapter.algo = &nouveau_i2c_bit_algo;
 			break;
 		case 6: /* NV50- DP AUX */
 			port->drive = entry[0];
-- 
1.7.7.5
