From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: 3.12rc1-pre Nouveau? oops
Date: Sun,  8 Sep 2013 23:21:03 +0200
Message-ID: <1378675264-3005-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <CAKb7UviRb_ao_nB8Q3pa9ePm+yUGd8u7PDREv5wNfCheyGTZjQ@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UviRb_ao_nB8Q3pa9ePm+yUGd8u7PDREv5wNfCheyGTZjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: imirkin@alum.mit.edu, airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


> Looks like you have Optimus (intel + nvidia), and the backtrace has
> runtime pm in it, which is something new Dave added for 3.12, adding
> him in explicitly. The simplest explanation is that disp->init is
> NULL. And it seems like there are no outputs from the earlier nouveau
> init prints. I guess that the call to nouveau_display_resume from
> nouveau_pmops_runtime_resume should be guarded by a if
> (dev->mode_config.num_crtc) like it is everywhere else.
> 
>   -ilia

Your guess was right, this (hopefully attached patch) fixes it for me!

Thanks,
Tobias
