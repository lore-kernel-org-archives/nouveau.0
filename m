From: Daniel J Blueman <daniel@quora.org>
Subject: nouveau Macbook EDID fix upstreaming...
Date: Fri, 17 Aug 2012 16:33:25 +0800
Message-ID: <CAMVG2ssDVjwm2Fp6gBTKg2=MqWMDoO1_FpqoXOnskz5W58Unkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Bourgeois <bluedragonx@gmail.com>, Dave Airlie <airlied@linux.ie>
Cc: nouveau@lists.freedesktop.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

It looks like Ryan's Nouveau patch [1,2] to get the I2C working for
EDID (thus modelines) is crucial for avoiding the Nvidia binary
drivers on MacbookPro 2012s.

Any plans/chance for it to be upstreamed to eg 3.6-rc3?

Many thanks,
  Daniel

--- [1]

diff -urNp a/drivers/gpu/drm/nouveau/nouveau_bios.c
b/drivers/gpu/drm/nouveau/nouveau_bios.c
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c	2012-07-08 22:48:05.589828510 -0500
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c	2012-07-15 00:28:18.578864693 -0500
@@ -6461,6 +6461,9 @@ nouveau_run_vbios_init(struct drm_device
 		}
 	}

+	if (!bios->execute)
+		nouveau_gpio_reset(dev);
+
 	return ret;
 }

[2] https://bugs.freedesktop.org/show_bug.cgi?id=51971
-- 
Daniel J Blueman
