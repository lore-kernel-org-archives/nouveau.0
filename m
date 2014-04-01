From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Tue, 1 Apr 2014 14:53:02 -0400
Message-ID: <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
References: <20140401035741.GA3535@localhost4.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140401035741.GA3535-bi+AKbBUZKbeRWJqFmQP6g@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I believe that ch7006 is the only external encoder that's supposed to
work, so you're in luck. It sounds like it passes the nv04_tv_identify
stage of nv04_tv_create -- perhaps it fails later? Although based on
the prints, it's even doing dpms stuff (but it hits _detect a second
time... odd). Try booting with

nouveau.debug=debug drm.debug=0xe

That should provide a bunch more output as to what's going on. Are you
sure that the output isn't there? Can you check in /sys/class/drm?
What precisely doesn't work?

On Mon, Mar 31, 2014 at 11:57 PM, Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I have a Dell Inspiron 8100 laptop (or I8K) with a NVidia Geforce2 Go (or NV11)
> with an embedded CH7007A chip, and am seeing the following after getting ch7006
> kernel driver/module loaded:
>
> # dmesg |grep ch7006 -i
>
> --- Snip ---
> [   21.191147] nouveau  [     I2C][0000:01:00.0] detected TV encoder: ch7006
> [   21.404731] ch7006 1-0075: ch7006_probe:
> [   21.411672] ch7006 1-0075: Detected version ID: 50
> [   21.421536] ch7006 1-0075: ch7006_encoder_init:
> [   21.443870] ch7006 1-0075: ch7006_encoder_save:
> [   21.998969] ch7006 1-0075: ch7006_encoder_restore:
> [   22.778013] ch7006 1-0075: ch7006_encoder_dpms:
> [   23.217163] ch7006 1-0075: ch7006_encoder_detect:
> [   23.283738] ch7006 1-0075: ch7006_encoder_dpms:
> [   23.283862] ch7006 1-0075: ch7006_encoder_dpms:
> [   23.536950] ch7006 1-0075: ch7006_encoder_dpms:
> [   24.515223] ch7006 1-0075: ch7006_encoder_detect:
> --- Snip ---
>
> However, nouveau still only sees LVDS-1.  I assume this is likely not the
> ch7006 omitting the required code for enabling TV-OUT?
>
> For kicks, I've also tried a ton of options via kernel boot commands:
> video=LVDS-1:1024x768@60 video=VGA-1:800x600@60 video=TV-1:e video=TV:e gfxpayload=1024x768x16 selinux=0 nouveau.tv_disable=0 nouveau.tv_norm=NTSC-M nouveau.debug=1 ch7006.debug=1 ch7006.tv_norm=NTSC-M ch7006.scale=2 i2c-algo-bit.bit_test=1 rd.modules-load=i2c-dev rd.modules-load=i2c-i801 rd.modules-load=i2c-smbus
>
> Searching & reading the code of ch7006.h/.c, I find ch7006 driver should be setting the S-Video out port to full power usage when any chip ID version is >= 0x20.  Since this is 0x50 (?), and the chip specifications are extremely similar (if not identical after comparing the init section), this chip should be activated.
>
> (I also ensured i2c-dev was loaded per some other rumors on the net, but doubt
> it's needed?)
>
> --
> Roger
> http://rogerx.freeshell.org/
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
