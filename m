From: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to
 struct drm_device.pdev
Date: Mon, 30 Nov 2020 20:59:52 +0000
Message-ID: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20201124113824.19994-15-tzimmermann@suse.de>
Content-Language: en-US
Content-ID: <DA00B6650FD7A948A321344693A5973A@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Roland Scheidegger <sroland@vmware.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org



> On Nov 24, 2020, at 06:38, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Roland Scheidegger <sroland@vmware.com>
> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  8 ++++----
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 27 +++++++++++++-------------
> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  2 +-

Reviewed-by: Zack Rusin <zackr@vmware.com>

z
