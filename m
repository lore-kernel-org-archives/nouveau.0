From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
Date: Wed, 27 May 2020 16:36:28 +0200
Message-ID: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
References: <20200527134254.854672-1-arnd@arndb.de> <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Isn't this already fixed by
>
> https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403

Ok, I see that fixes the link error, but I when I created my fix, that did
not seem like the correct solution because it reverts part of the original
patch without reverting the rest of it. Unfortunately there was no
changelog text in the first patch to explain why this is safe.

Could you double-check if the behavior is still correct after the two patches?

      Arnd
