From: "Henrik Rydberg" <rydberg@euromail.se>
Subject: Re: [REGRESSION] nouveau: Severe screen corruption on (0xaf, nv50)
Date: Fri, 16 Nov 2012 20:21:59 +0100
Message-ID: <20121116192159.GA491@polaris.bitmath.org>
References: <20121018095809.GA336@polaris.bitmath.org>
 <20121021071024.GA731@polaris.bitmath.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121021071024.GA731@polaris.bitmath.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Sun, Oct 21, 2012 at 09:10:24AM +0200, Henrik Rydberg wrote:
> On Thu, Oct 18, 2012 at 11:58:09AM +0200, Henrik Rydberg wrote:
> > Hi Ben,
> > 
> > 3.7-rc1 messed up the screen on my MacBookAir3,1 (nv50, 0xaf) pretty
> > badly. Not surprisingly,
> > 
> > commit 3863c9bc887e9638a9d905d55f6038641ece78d6
> > Author: Ben Skeggs <bskeggs@redhat.com>
> > Date:   Sat Jul 14 19:09:17 2012 +1000
> > 
> >     drm/nouveau/instmem: completely new implementation, as a subdev module
> > 
> > is the first bad commit. Standing on that commit, booting and then
> > starting X yields the output below. Hints are especially appreciated,
> > considering the patch is almost 8000 lines.
> 
> Going through one suspend/resume cycle makes the corruption go away,
> and there are no more errors in dmesg. Oddly enough, I have seen
> something very similar when using i915 on the MBP10. Builtin modules
> and systemd in both cases. Maybe this is a general drm issue. Any
> thoughts?

This is still a problem in Linus' tree. The screen corruption happens
during boot, in text mode, presumably in conjunction with alloction of
the nouveaufb device. It is 100% reproducible, and there is no
advanced graphics involved, just simple text console. Booting from efi
or bios does not matter. Modules are builtin.

Suspending and resuming once makes the problem go away every time.

Since this is a simple usecase, and the failing commit has been
bisected, it ought to be possible to find the problem. Unfortunately,
I am not familiar enough with the nouveau code to find the problem in
an 8000-line patch. Please help. :-)

Thanks,
Henrik
