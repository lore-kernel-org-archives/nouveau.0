From: rosenp@gmail.com
Subject: Re: [Nouveau] v4.12 backport request: 13a86519202
 (drm/nouveau/i2c/gf119-: add support for address-only transactions)
Date: Sun, 03 Sep 2017 15:56:02 -0700
Message-ID: <1504479362.18990.1.camel@gmail.com>
References: <CAKb7UviPvnF_VuffWJW3HAXN66Jv4617On2-cC8qqho0suop6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKb7UviPvnF_VuffWJW3HAXN66Jv4617On2-cC8qqho0suop6g@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, stable <stable@vger.kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Fedora bug: https://bugzilla.redhat.com/show_bug.cgi?id=1482220

Also, +1.

On Sun, 2017-09-03 at 11:46 -0400, Ilia Mirkin wrote:
> Commit df8dc97cd17 (drm/nouveau/kms/nv50: use drm core i2c-over-aux
> algorithm) switched things over to the drm algo. Unfortunately it
> generates address-only transactions. Prior to GF119, the hardware had
> no support for such things, and GF119+ the nouveau code did not
> handle
> these properly.
> 
> The result of this bug is that EDID doesn't make it over for DP (and
> eDP) screens, which in turn wreaks all sorts of havoc. There have
> been
> lots of reports on IRC, a few on mailing lists, and also:
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=102528
> 
> Commit 13a86519202 (drm/nouveau/i2c/gf119-: add support for
> address-only transactions) fixes the nouveau support for such
> transactions on GF119+ and flips things back over to the custom algo
> for earlier chips. Please include into the next v4.12.x release:
> 
> commit 13a86519202c5d119d83640d6f781f3181205d2c
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Wed Jul 19 16:49:59 2017 +1000
> 
>     drm/nouveau/i2c/gf119-: add support for address-only transactions
> 
>     Since switching the I2C-over-AUX helpers, there have been
> regressions on
>     some display combinations due to us not having support for
> "address only"
>     transactions.
> 
>     This commits enables support for them for GF119 and newer.
> 
>     Earlier GPUs have been reverted to a custom I2C-over-AUX
> algorithm.
> 
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
