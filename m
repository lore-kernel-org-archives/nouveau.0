From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: Macbook Pro 5,3 Video Issues
Date: Tue, 20 Mar 2012 21:47:47 -0500
Message-ID: <20120321024747.GA5593@ubuntu-mba>
References: <4F690003.1040404@shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F690003.1040404@shealevy.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shea Levy <shea@shealevy.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 20, 2012 at 06:09:07PM -0400, Shea Levy wrote:
> Hello,
> 
> On my system (Linux 3.3, booting in EFI mode, using Nouveau with
> nouveau.noaccel=1 due to
> https://bugs.freedesktop.org/show_bug.cgi?id=27501 ), I can't figure
> out how to change the backlight or switch which of the two graphics
> cards (I have an Nvidia 9600M GT and a 9400M, both are recognized by
> nouveau but only the 9400M is ever used) Linux uses for the
> framebuffer or X uses for the output. I have
> /sys/class/backlight/nv_backlight, and writting to
> nv_backlight/brightness does change the value in
> nv_backlight/actual_brightness, but no actual screen changes occur.
> I'm using the in-tree staging version of nouveau, so I wasn't sure
> which ML this should go to.

Both of these are probably controlled by the gmux device on your
machine. I've submitted a driver that gets the backlight working [1]. I
haven't worked on the GPU muxing yet though, because the machine I'm
working with (MacBook Pro 8,2) has graphics issues under EFI boot that I
haven't had time to sort out.

Seth

[1] https://lkml.org/lkml/2012/3/16/388
