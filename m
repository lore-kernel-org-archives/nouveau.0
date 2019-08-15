From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Thu, 15 Aug 2019 16:11:00 +0200
Message-ID: <CAKMK7uG1cugQvYLpEivDGg7+D0tUp5B9Jo7hWQCsmbXe3TC3nQ@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com> <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 15, 2019 at 12:47 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 15 Aug 2019 at 07:31, Karol Herbst <kherbst@redhat.com> wrote:
> >
> > This reverts commit 28586a51eea666d5531bcaef2f68e4abbd87242c.
> >
> > The original commit message didn't even make sense. AMD _does_ support it and
> > it works with Nouveau as well.
> >
> > Also what was the issue being solved here? No references to any bugs and not
> > even explaining any issue at all isn't the way we do things.
> >
> > And even if it means a muxed design, then the fix is to make it work inside the
> > driver, not adding some hacky workaround through ACPI tricks.
> >
> > And what out of tree drivers do or do not support we don't care one bit anyway.
> >
>
> I think the reverts should be merged via Rafael's tree as the original
> patches went in via there, and we should get them in asap.

+1

> Acked-by: Dave Airlie <airlied@redhat.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also fully agreeing with Karol's reply further down, if this doesn't
work we need to improve the drivers, not pile stuff on top in some
ACPI hacks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
