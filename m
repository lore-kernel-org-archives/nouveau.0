From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: [linux-next] DDC responded, but no EDID for %s errors
Date: Thu, 2 Aug 2018 11:46:48 +0900
Message-ID: <20180802024648.GA499@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi,

My dmesg is filled up with these errors

 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for HDMI-A-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for HDMI-A-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
[..]
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
 nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VGA-1
[..]

Basically, a message every 10s or so. Any chance we can make them
go away?

	-ss
