From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 9/9] drm/nouveau/kms/nvd9-: Add CRC support
Date: Wed, 18 Mar 2020 07:02:54 +0100
Message-ID: <20200318060254.GB1594891@kroah.com>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-10-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200318004159.235623-10-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>, Kate Stewart <kstewart@linuxfoundation.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Sean Paul <seanpaul@chromium.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Takashi Iwai <tiwai@suse.de>, Jani Nikula <jani.nikula@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 08:41:06PM -0400, Lyude Paul wrote:
> +	root = debugfs_create_dir("nv_crc", crtc->debugfs_entry);
> +	if (IS_ERR(root))
> +		return PTR_ERR(root);

No need to check this, just take the return value and move on.

> +
> +	dent = debugfs_create_file("flip_threshold", 0644, root, head,
> +				   &nv50_crc_flip_threshold_fops);
> +	if (IS_ERR(dent))
> +		return PTR_ERR(dent);

No need to check this either, in fact this test is incorrect :(

Just make the call, and move on.  See the loads of debugfs cleanups I
have been doing for examples.

thanks,

greg k-h
