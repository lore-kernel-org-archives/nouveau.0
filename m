From: Ondrej Zary <linux@rainbow-software.org>
Subject: Blank console but X11 works on MCP79 - old regression since 3.8
Date: Fri, 17 Nov 2017 15:26:00 +0100
Message-ID: <201711171526.01053.linux@rainbow-software.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hello,
I've just been hit by this old bug which is still present in 4.14:
https://bugs.freedesktop.org/show_bug.cgi?id=80675

On MCP79 (ION), when stolen memory is set to 32MB in BIOS, console is blank 
but X11 works. When the stolen memory is increased to 64MB, console works 
fine.

Bisected it to this:

4f6029da58ba9204c98e33f4f3737fe085c87a6f is the first bad commit
commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Fri Nov 16 11:54:31 2012 +1000

    drm/nv50-nvc0: switch to common disp impl, removing previous version

    Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

It's a big change so I'm not able to do more debugging.

-- 
Ondrej Zary
