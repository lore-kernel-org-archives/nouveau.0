From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Commit "drm: run the hpd irq event code directly" causes stutter
	from repeated EDID retrievals
Date: Sun, 26 May 2013 18:14:06 +0200
Message-ID: <CAKMK7uGtJZOJzLm1sR07EN5DySX_V08q32cMEUdN=BrBPB3WsA@mail.gmail.com>
References: <4298860.NTVPviymN4@giraffe>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <4298860.NTVPviymN4@giraffe>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Gard Spreemann <gspreemann@gmail.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sun, May 26, 2013 at 5:38 PM, Gard Spreemann <gspreemann@gmail.com> wrote:
> Hi,
>
> If I should contact a list instead of you directly, I sincerely apologize!

You should have cc'ed relevant lists at least ;-) Fixed up.

> After a recent kernel upgrade, I found that my system (using Nouveau) would
> stutter whenever eDP-1 was turned off. That display being turned off apparently
> causes repeated EDID retrievals and failed checksums. I did a git bisect which
> lead me to
> ***
> commit 69787f7da6b2adc4054357a661aaa1701a9ca76f
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Tue Oct 23 18:23:34 2012 +0000
>
>     drm: run the hpd irq event code directly
>
>     All drivers already have a work item to run the hpd code, so we don't
>     need to launch a new one in the helper code. Dave Airlie mentioned
>     that the cancel+re-queue might paper over DP related hpd ping-pongs,
>     hence why this is split out.
>
>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>     Signed-off-by: Dave Airlie <airlied@redhat.com>
> ***
> as the first bad commit, and I was advised to contact you as well as file a bug
> with the Nouveau project [1].
>
> I don't have enough insight into the code in question to understand the
> problem, but your discussion on April 6 [2] seems relevant.
>
> Please let me know if there's anything I can do to help.
>
> [1] https://bugs.freedesktop.org/show_bug.cgi?id=64858
> [2] https://patchwork.kernel.org/patch/2402211/

My guess is that you've worked around these edid stalls with
drm_kms_helper.poll=0 and the above commit breaks that w/a. That patch
was shot down unfortunately. If you can't reproduce these stalls on
older kernels when removing the poll=0 option, then something else
broke.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
