From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: Nouveau module results in total lockups without any dmesg trace
 on a NP900X5N Kaby Lake machine
Date: Tue, 1 Jan 2019 16:23:39 -0500
Message-ID: <CAKb7UvjMCGOdKybtUrV9DRY1vjiQvi+pkzf2FCHefdedqMGnig@mail.gmail.com>
References: <cb43e1cb-dffa-26d8-c938-49ca4b48d38a@nisi.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb43e1cb-dffa-26d8-c938-49ca4b48d38a@nisi.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Vlietland <j.vlietland@nisi.nl>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jan 1, 2019 at 4:06 PM Jan Vlietland <j.vlietland@nisi.nl> wrote:
>
> Hi Ben, David and Daniel ,
>
> First of all happy new year. Based on advice of Greg K-H herewith a mail
> about a number of Nouveau issues with my laptop.
>
> I installed various Kali linux versions up to Linux 4.20.0-rc7
> (downloaded, compiled and installed) on a Samsung NP900X5N laptop and
> have an issue with the driver after loading.
>
> My configuration:
>
> - i7 7500
> - 16 gb / 256 gb ssd
> - nvidia 940MX (for 3D graphics)
>
> When I enable loading of the nouveau module for my Nvidia 3D card I get
> three MMIO faults:
>
> [   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 6013d4 [ IBUS ]
> [   35.997510] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
> [   37.551790] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 619444 [ IBUS ]
>
> I see currenty varous discussions on bugzilla: (as summarized by Bruno
> Pagani) https://bugs.freedesktop.org/show_bug.cgi?id=100423.
>
> But I do not see any confirmed solutions on the MMIO faults.
>
> The module is loaded but X server cannot run in framebuffer mode. I
> assume that the module does not provide any video memory to X to run in
> graphics mode.
>
> First of all I would like to understand what the faults impose.
> And I also would like to help you providing testing to fix the errors.

The faults are, generally, nothing to worry about, esp if they occur
infrequently. It's one bit or another of code that's poking at a part
of the GPU it shouldn't be touching.

To the best of my knowledge, 940MX (GM108) should work reasonably
well. Perhaps it would make most sense if you posted about some of
your other issues (usually GM108's are have no outputs, so only usable
as offload devices). Feel free to join #nouveau on irc.freenode.net to
get more info as well.

Cheers,

  -ilia
