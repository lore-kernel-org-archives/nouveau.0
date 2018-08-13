From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v6 3/5] drm/nouveau: Fix deadlock with fb_helper with
 async RPM requests
Date: Mon, 13 Aug 2018 15:11:28 -0400
Message-ID: <CAKb7UvjqVC5w4PDaVLtZqKs94bo22d4BGYgsQj9K-2_rksoqvg@mail.gmail.com>
References: <20180813190706.24172-1-lyude@redhat.com> <20180813190706.24172-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180813190706.24172-4-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 13, 2018 at 3:07 PM, Lyude Paul <lyude@redhat.com> wrote:
> +bool
> +nouveau_fbcon_hotplugged_in_suspend(struct nouveau_fbdev *fbcon)
> +{
> +       bool hotplug;
> +
> +       if (!fbcon)
> +               return false;
> +
> +       mutex_lock(&fbcon->hotplug_lock);
> +       hotplug = fbcon->hotplug_waiting;
> +       mutex_unlock(&fbcon->hotplug_lock);
> +
> +       return hotplug;
> +}

I'm probably missing it, but where is this function used?
