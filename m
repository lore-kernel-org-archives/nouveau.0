From: Ondrej Zary <linux@zary.sk>
Subject: Re: nouveau: System crashes with NVIDIA GeForce 8600 GT
Date: Sun, 18 Aug 2019 17:27:03 +0200
Message-ID: <201908181727.04076.linux@zary.sk>
References: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190817125033.p3vdkq3xzz45aidz@alex-chromebook>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Dewar <alex.dewar90@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Saturday 17 August 2019 14:50:33 Alex Dewar wrote:
> Hi all,
>
> I'm getting frequent system crashes (every few hours or so) and it seems
> that the nouveau driver is causing the issue (dmesg output below). I see it
> with both v5.2.8 and the v4.19 LTS kernel. Sometimes the system
> completely freezes and sometimes seemingly just the nouveau driver goes
> down. The screen freezes and colours stream across it. Often after I
> reboot the BIOS logo is mangled too until the first modeset. The crash
> seems to be happening in nv50_fb_intr() in nv50.c.
>
> I'm not sure if this is related, but the system now often freezes on
> suspend or resume since I switched from using the old (recently
> abandoned) proprietry NVIDIA drivers, again both with 5.2 and 4.19
> kernels. Blacklisting the nouveau driver doesn't seem to fix it however,
> though I guess the graphics card could still be causing issues in some
> other way? I never had problems with suspend and resume before.
>
> Any suggestions about how I could debug this further?

Is it really a software problem (does it still work fine with proprietary 
driver)?
These nVidia chips are known to fail and corrupt BIOS logo suggests that.

-- 
Ondrej Zary
