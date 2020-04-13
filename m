From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/9] drm/vblank: Add vblank works
Date: Mon, 13 Apr 2020 23:07:21 +0200
Message-ID: <20200413210721.GA802@ravnborg.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
 <20200413204243.GL60335@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200413204243.GL60335@mtj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi Tejun

> 
> And, thanks a lot for the vblank explanation. I really enjoyed readin it. :)

You were not the only one who liked it :-)

We ended up with an updated explanation in drm_vblank.c:
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_vblank.c

Including some nice ascii art in the final version.

It will hit upstream in next merge window.

	Sam
