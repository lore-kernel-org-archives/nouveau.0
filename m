From: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: nouveau "eDP-1: EDID is invalid" regression after 4.11 with HP
 ZBook 15 G3
Date: Mon, 15 May 2017 10:03:33 +1000
Message-ID: <b7171c1e-5a4f-f703-800a-e1c7b4bfcd27@redhat.com>
References: <CA+ydwtofv0i07C-hWNfE9c82snc35-E3dHxKKhWj0VcJjiPbBw@mail.gmail.com>
 <CA+ydwtrE8QVH7u5rTV06woiiV7Ew8OcHz1Zd1hMX4jSbO1MDHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+ydwtrE8QVH7u5rTV06woiiV7Ew8OcHz1Zd1hMX4jSbO1MDHw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tommi Rantala <tt.rantala@gmail.com>
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 05/15/2017 01:10 AM, Tommi Rantala wrote:
> Hi,
Hey Tommi,

Thanks for bisecting this.  It's rather unexpected that you should be 
seeing problems here, but, the commit makes sense for it at least.

Are you able to get me new kernel logs of both before and after this 
patch with "log_buf_len=8M drm.debug=0x14 
nouveau.debug=disp=trace,i2c=trace,bios=trace" please?

Thanks,
Ben.

> 
> Bisected this to:
> 
> commit df8dc97cd17269474344d73cc02739532c468d04
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Wed Mar 1 09:42:04 2017 +1000
> 
>     drm/nouveau/kms/nv50: use drm core i2c-over-aux algorithm
> 
>     I'm not entirely sure NVKM needs to support this now, but I haven't
>     removed it as of yet just in case it's needed from DEVINIT scripts
>     where DRM isn't available.
> 
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> 
> 
> dmesg after boot with drm.debug enabled:
> 
> v4.10-10409-g5c68d91 (still works):
> http://termbin.com/b0is
> 
> v4.10-10410-gdf8dc97 (failure):
> http://termbin.com/j6lq
> 
> 
> Tommi
> 
> 
> 2017-05-10 11:24 GMT+03:00 Tommi Rantala <tt.rantala@gmail.com>:
>> Hi,
>>
>> The HP ZBook 15 G3 laptop builtin display (eDP-1) does not work
>> correctly with v4.11-11413-g2868b25.
>>
>> When booting the laptop, the resolution seems to be limited to
>> 1024x768, and gnome-session segfaults.
>>
>> Up to 4.11 the display works just fine in 1920x1080 mode.
>>
>> I'm seeing this in the kernel logs:
>>
>> nouveau 0000:01:00.0: eDP-1: EDID is invalid:
>>          [00] BAD  00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff 84 53 54
>>          [00] BAD  66 69 50 55 57 66 74 49 48 ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>          [00] BAD  ff ff ff ff ff ff ff ff ff ff ff 00 00 ff 00 ff
>> nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for eDP-1
>> [drm] Cannot find any crtc or sizes - going 1024x768
>>
>>
>> $ lspci | grep NVIDIA
>> 01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro
>> M2000M] (rev a2)
>>
>> Any ideas, or should I bisect?
>>
>> 4.11 dmesg & xrandr output:
>> https://pastebin.com/raw/P9LGP7e1
>>
>> 4.11-11413-g2868b25 dmesg:
>> https://pastebin.com/raw/QBT9mMua
>>
>> -Tommi
