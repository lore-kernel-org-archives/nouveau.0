From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Sun, 17 Jan 2016 14:28:13 -0500
Message-ID: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable <stable@vger.kernel.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Hello,

I'd like to recommend backporting this commit:

commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
Author: Hans de Goede <hdegoede@redhat.com>
Date:   Thu Jul 23 17:20:12 2015 +0200

    drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c

This disables MSI by default on G72 (NV46) devices where it's
apparently a bit buggy. We have a later patch which turns MSI back on
with a quirk, but it isn't extremely necessary for these devices, and
disabling (or, rather, not enabling) MSI is a pretty safe thing to do.

The patch went upstream in 4.3-rc1, however I believe that there are
still a number of kernels between 3.12 (where MSI was first enabled by
default - commit a27e56996) and 4.2 (inclusive) which are still being
maintained. To those maintainers, please consider including this in
your trees.

Cheers,

  -ilia
