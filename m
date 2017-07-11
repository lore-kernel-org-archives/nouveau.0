From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Tue, 11 Jul 2017 20:08:30 +0200
Message-ID: <1499796510.5315.27.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On Tue, 2017-07-11 at 13:51 -0400, Ilia Mirkin wrote:
> Some details that may be useful in analysis of the bug:
> 
> 1. lspci -nn -d 10de:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204 [GeForce GTX 980] [10de:13c0] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GM204 High Definition Audio Controller [10de:0fbb] (rev a1

> 2. What displays, if any, you have plugged into the NVIDIA board when
> this happens?

A Philips 273V, via DVI.

> 3. Any boot parameters, esp relating to ACPI, PM, or related?

None for those, what's there that will be unfamiliar to you are for
patches that aren't applied.

nortsched hpc_cpusets skew_tick=1 ftrace_dump_on_oops audit=0
nodelayacct cgroup_disable=memory rtkthreads=1 rtworkqueues=2 panic=60
ignore_loglevel crashkernel=256M,high

	-Mike
