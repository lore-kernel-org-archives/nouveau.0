From: Michal Hocko <mhocko@kernel.org>
Subject: Re: nouveau driver locks up with 4.11 kernel
Date: Mon, 14 Aug 2017 22:29:40 +0200
Message-ID: <20170814202939.GA23014@dhcp22.suse.cz>
References: <20170814191818.GA20455@dhcp22.suse.cz>
 <CAKb7UvhCt1gw=oOyTtnPHH88f3vNE2s4Dc7QvtH1qd382bN9_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvhCt1gw=oOyTtnPHH88f3vNE2s4Dc7QvtH1qd382bN9_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon 14-08-17 15:27:20, Ilia Mirkin wrote:
> On Mon, Aug 14, 2017 at 3:18 PM, Michal Hocko <mhocko@kernel.org> wrote:
[...]
> > nouveau 0000:03:00.0: fifo: channel 6 [mpv/vo[3535]] kick timeout
> > nouveau: mpv/vo[3535]:00000000:0000906f: detach gr failed, -110
> 
> Are you using mpv in conjunction with the GL video output and
> VDPAU-based acceleration? That will kill nouveau. For VDPAU, I
> recommend mplayer.

Well, I am using mplayer package and vo=sdl. Which video output should I
try instead? Btw. xine seems to be using VDPAU as well, yet it doesn't
lockup the whole X session. The videou output doesn't work properly
either but at least I am able to kill xine and still have the session.
-- 
Michal Hocko
SUSE Labs
