From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Reported regressions for 4.7 as of Sunday, 2016-06-19
Date: Sun, 26 Jun 2016 14:52:40 +0200
Message-ID: <a2053cba-8044-0239-6091-7f47f278af1f@leemhuis.info>
References: <20160624141918.4646.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160624141918.4646.qmail@ns.sciencehorizons.net>
Sender: linux-kernel-owner@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 24.06.2016 16:19, George Spelvin wrote:
> Here's a regression you might add.  

Thx, added.

> I only reported it to dri-devel,
> since it's DRI-specific, but since there's been thunderous silence
> for a few weeks, I'm trying to be a squeakier wheel.

Added the nouveau developers to CC, maybe it's a bug in the drm driver
that triggers this problem; and airlied is "Internet challenged" right
now and Daniel on holidays, so it might be good to get more people into
the loop anyway.

> Given that I bisected it to a single, small, revertable commit, I'd
> hoped it would be easy to deal with.
> 
> [BISECTED: 0955c1250e] 4.7-rc1 oops at drm_connector_cleanup+0x5c/0x1d0 
> 
> E-mail report at
> https://marc.info/?l=dri-devel&m=146577898611849
> 
> Bugzilla report at
> https://bugs.freedesktop.org/show_bug.cgi?id=96532

FWIW the important detail: Reverting
https://git.kernel.org/linus/0955c1250e (drm/crtc: take references to
connectors used in a modeset. (v2)) fixes this.

Sincerely, your regression tracker for Linux 4.7 (http://bit.ly/28JRmJo)
 Thorsten
