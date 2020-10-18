From: Tom Rix <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
Date: Sun, 18 Oct 2020 07:04:49 -0700
Message-ID: <eecb7c3e-88b2-ec2f-0235-280da51ae69c@redhat.com>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201018054332.GB593954-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-power-RPVEmwYF7IOGWTQfUlqXWgC/G2K4zDHf@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, industrypack-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MPT-FusionLinux.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-can-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29Tb/PtFMR13I2A@public.gmane.org
List-Id: nouveau.vger.kernel.org


On 10/17/20 10:43 PM, Greg KH wrote:
> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
>> From: Tom Rix <trix-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> This is a upcoming change to clean up a new warning treewide.
>> I am wondering if the change could be one mega patch (see below) or
>> normal patch per file about 100 patches or somewhere half way by collecting
>> early acks.
> Please break it up into one-patch-per-subsystem, like normal, and get it
> merged that way.

OK.

Thanks,

Tom

>
> Sending us a patch, without even a diffstat to review, isn't going to
> get you very far...
>
> thanks,
>
> greg k-h
>
