From: Afzal Mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: [PATCH] Revert "drm/nouveau/fifo/gk104: kick channels when
 deactivating them"
Date: Wed, 12 Aug 2015 11:30:52 +0530
Message-ID: <20150812060052.GA4242@afzalpc>
References: <1439353058-10001-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439353058-10001-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Eric Biggers <ebiggers3@gmail.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, gnurou@gmail.com
List-Id: nouveau.vger.kernel.org

Hi,

On Wed, Aug 12, 2015 at 01:17:38PM +0900, Alexandre Courbot wrote:
> This reverts commit 1addc1264852
> 
> This commit seems to cause crashes in gk104_fifo_intr_runlist() by
> returning 0xbad0da00 when register 0x2a00 is read. Since this commit was
> intended for GM20B which is not completely supported yet, let's revert
> it for the time being.
> 
> Reported-by: Eric Biggers <ebiggers3@gmail.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> David, it would be great if this could be merged for 4.2 since lots of
> users could potentially experience this issue. Thanks!

Tested-by: Afzal Mohammed <afzal.mohd.ma@gmail.com>

Please help $subject reach mainline for 4.2, w/o this revert, the
system here hangs most (>90%) of the time at boot time.

As an aside, yesterday after a marathon git bisect, came to the same
solution (though I don't understand what that change means). Was
about to report it and saw this one. Thanks Alexandre.

W/o the revert, in the rare case where it boots, below is observed in
addition to as compared to w/ revert,

[    9.826010] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at 0x122130 [ !ENGINE ]

Regards
Afzal
