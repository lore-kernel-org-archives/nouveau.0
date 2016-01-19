From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Tue, 19 Jan 2016 11:22:11 +0100
Message-ID: <569E0E53.4010201@suse.cz>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, stable <stable@vger.kernel.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Hi,

On 01/17/2016, 08:28 PM, Ilia Mirkin wrote:
> I'd like to recommend backporting this commit:
> 
> commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
> Author: Hans de Goede <hdegoede@redhat.com>
> Date:   Thu Jul 23 17:20:12 2015 +0200
> 
>     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c
> 
> This disables MSI by default on G72 (NV46) devices where it's
> apparently a bit buggy. We have a later patch which turns MSI back on
> with a quirk, but it isn't extremely necessary for these devices, and
> disabling (or, rather, not enabling) MSI is a pretty safe thing to do.
> 
> The patch went upstream in 4.3-rc1, however I believe that there are
> still a number of kernels between 3.12 (where MSI was first enabled by
> default - commit a27e56996) and 4.2 (inclusive) which are still being
> maintained. To those maintainers, please consider including this in
> your trees.

But it needs
commit fa8c9ac72fe0bcdf5bc7cc84e85cc2a1af53f9fd
Author: Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Wed Feb 5 14:33:02 2014 -0500

    drm/nv4c/mc: nv4x igp's have a different msi rearm register

    See https://bugs.freedesktop.org/show_bug.cgi?id=74492

which is only in 3.14. So I cannot take it into 3.12.

thanks,
-- 
js
suse labs
