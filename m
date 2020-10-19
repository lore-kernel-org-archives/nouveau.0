From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: remove unneeded break
Date: Mon, 19 Oct 2020 19:06:41 +0200
Message-ID: <20201019170641.GA963808@ravnborg.org>
References: <20201019163115.25814-1-trix@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201019163115.25814-1-trix@redhat.com>
To: trix@redhat.com
Cc: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, kraxel@redhat.com, gustavoars@kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi Tom
On Mon, Oct 19, 2020 at 09:31:15AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return or break
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Looks good and builds with no warnings.

One of the diffs made me - "oh this looks wrong". But after I looked again
it was right and the resulting code is more readable - so good.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

Was tempted to just apply to drm-misc-next but will give others the
opportunity to chime in.

	Sam
