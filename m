From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
Date: Thu, 28 May 2020 11:09:12 +0200
Message-ID: <CAK8P3a3wuK9hHWCypF0HEzWY_iSn1SQJ22j26ykXYeVYYqKpCg@mail.gmail.com>
References: <20200527134254.854672-1-arnd@arndb.de> <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
 <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com> <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPM=9tw_D0edbF38iFSrecDM8gnK4wNCDGiL2JV86tSUAmSk6g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, May 28, 2020 at 7:37 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 28 May 2020 at 00:36, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > Isn't this already fixed by
> > >
> > > https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403
> >
> > Ok, I see that fixes the link error, but I when I created my fix, that did
> > not seem like the correct solution because it reverts part of the original
> > patch without reverting the rest of it. Unfortunately there was no
> > changelog text in the first patch to explain why this is safe.
>
> No it doesn't, I think you missed the pci in API name.
>
> The initial behaviour doesn't use the pci version of the API, the
> replacement did, and the fix used the drm wrapper around the pci one.
>
> So this patch isn't necessary now that I've fixed it the other way,

Ok, got it, thanks for explaining!

       Arnd
