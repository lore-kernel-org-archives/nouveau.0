From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: where to report modesetting DDX bug?
Date: Fri, 28 Feb 2020 11:27:20 -0500
Message-ID: <CAKb7Uvg9RhCvRs+WU-0RdYc0SXMA-pXyppk5g7MF6b-MzPVUHg@mail.gmail.com>
References: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <105a5043-8cc0-43cd-42bf-a79cafbd2320-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Feb 28, 2020 at 11:06 AM Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> wrote:
> Video and input drivers Subgroups and projects on gitlab does not list modesetting
> DDX, presumably because it's not packaged separately from the server. Where's the
> right place to report a modesetting DDX bug that manifests only on an NVidia GPU?
> Directly against the server https://gitlab.freedesktop.org/xorg/xserver?

I don't know if anyone (from nouveau) looks at gitlab, so mailing list
is probably best anyways.

>
> Here are some particulars:
> How can I tell whether this should be reported to kernel tracker or to freedesktop
> tracker as driver or server problem? HDMI output on GT218 10de:0a65 GPU is limited
> to 1920x1200. When connected to 2560x1440 display, vttys are supported at
> display's supported 1920x1080 mode, but X with modesetting DDX puts display in
> unsupported mode (functionally asleep) regardless of various attempts to force
> 1920x1080@60 or 1600x900@60, while with nouveau DDX, or 1920x1200 display, or
> 2560x1440 display with Dual-link DVI cable, display behavior is as expected.
>
> openSUSE 15.1/kernel 4.12.14    OK
> openSUSE 15.2/kernel 5.3.18     bad
> Tumbleweed/kernel 5.4.14        bad
> Debian Buster/kernel 4.19.x     OK
> Fedora 31/5.5.5 kernel          bad
>
> http://fm.no-ip.com/Tmp/Linux/Xorg/xorg.0.log-gt218-stw-modesetting-OOR-0x1e
> http://fm.no-ip.com/Tmp/Linux/Xorg/gt218-dmesg-stw.txt

Those HDMI mode clocks are too high against the nominal single-link
165MHz TMDS. You can set your own maximum with nouveau.hdmimhz=300
(for example) to allow it. I believe the connectors aren't rated for
that though. The commit which fixed this is

commit d1084184789d677df4e9c110f38cb3f3d709195d
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed May 29 09:58:18 2019 +1000

    drm/nouveau/kms: disallow dual-link harder if hdmi connection detected

and went into v5.3. I'm not sure where this got broken... I think it
would have been

commit 9340d77f5327ea673a7f95f58139123d7a278243
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Mon Sep 3 20:57:37 2018 -0400

    drm/nouveau/disp: take sink support into account for exposing 594mhz

which went into v4.20, but it could also have been

commit 1a0c96c075bb4517d4ce4fb6750ee0a3cf38714c
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Tue Nov 3 21:00:11 2015 -0500

    drm/nouveau/kms: allow 225/297MHz pixel clocks for HDMI on Fermi/Kepler

which went into v4.5 and lines up with your timeline better, but seems
like it shouldn't be handing out those high frequencies to HDMI
connectors on tesla...

Cheers,

  -ilia
