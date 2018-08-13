From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v6 3/5] drm/nouveau: Fix deadlock with fb_helper with
 async RPM requests
Date: Mon, 13 Aug 2018 15:12:11 -0400
Message-ID: <5eedf19a59f06a4c7055660dc85d6dc23964abe9.camel@redhat.com>
References: <20180813190706.24172-1-lyude@redhat.com>
         <20180813190706.24172-4-lyude@redhat.com>
         <CAKb7UvjqVC5w4PDaVLtZqKs94bo22d4BGYgsQj9K-2_rksoqvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvjqVC5w4PDaVLtZqKs94bo22d4BGYgsQj9K-2_rksoqvg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, 2018-08-13 at 15:11 -0400, Ilia Mirkin wrote:
> On Mon, Aug 13, 2018 at 3:07 PM, Lyude Paul <lyude@redhat.com> wrote:
> > +bool
> > +nouveau_fbcon_hotplugged_in_suspend(struct nouveau_fbdev *fbcon)
> > +{
> > +       bool hotplug;
> > +
> > +       if (!fbcon)
> > +               return false;
> > +
> > +       mutex_lock(&fbcon->hotplug_lock);
> > +       hotplug = fbcon->hotplug_waiting;
> > +       mutex_unlock(&fbcon->hotplug_lock);
> > +
> > +       return hotplug;
> > +}
> 
> I'm probably missing it, but where is this function used?
oh no you aren't, I thought I got rid of that function! will respin in just a
moment
-- 
Cheers,
	Lyude Paul
