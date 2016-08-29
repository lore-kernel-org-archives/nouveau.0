From: Arnd Bergmann <arnd@linaro.org>
Subject: Re: [PATCH] fix:overlay: add missing header dependencies
Date: Mon, 29 Aug 2016 12:41:18 +0200
Message-ID: <5154334.AoCXYPCTSK@wuerfel>
References: <1472360572-28375-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472360572-28375-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: bskeggs@redhat.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

On Sunday, August 28, 2016 1:02:52 PM CEST Baoyou Xie wrote:
> We get 1 warning when build kernel with W=1:
> drivers/gpu/drm/nouveau/dispnv04/overlay.c:496:1: warning: no previous prototype for 'nouveau_overlay_init' [-Wmissing-prototypes]
> 
> In fact, this function is declared in disp.h, so this patch
> add missing header dependencies
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

a few general notes:

- please use my arnd@arndb.de address on patch submissions, not the linaro
  address.

- for the email subject lines, have a look at what the typical style
  is for the file. "overlay:" is not a good name here because it's not
  unique to the driver, so better use "drm/nouveau", which will also
  get the attention of the right people.

- please drop the "fix:" prefix in the subject.

	Arnd
