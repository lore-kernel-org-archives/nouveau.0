From: Andy Isaacson <adi@hexapodia.org>
Subject: nouveau userspace bits for 2.6.34
Date: Mon, 12 Apr 2010 14:22:03 -0700
Message-ID: <20100412212203.GA2671@hexapodia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.sf.net
Cc: Ben Kseggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 04, 2010 at 10:18:03AM -0800, Linus Torvalds wrote:
> 	(II) NOUVEAU(0): [drm] nouveau interface version: 0.0.16
> 	(EE) NOUVEAU(0): [drm] wrong version, expecting 0.0.15
> 	(EE) NOUVEAU(0): 879:

So I've tried reading the thread and haven't found the answer to this
question yet; my apologies for surely missing the answer which is out
there.

What version of libdrm-nouveau and xserver-xorg-video-nouveau do I need
in order to run nouveau on 2.6.34-rc3 and later?

What git branches should I be tracking?  What changesets add support for
nouveau interface version 0.0.16?

(I'm on Debian and Ubuntu, but building my own from git is fine.)

Thanks,
-andy
