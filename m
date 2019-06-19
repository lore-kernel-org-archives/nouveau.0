From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Date: Wed, 19 Jun 2019 15:36:35 +0900
Message-ID: <20190619063635.GA576@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
 <20190619054826.GA2059@jagdpanzerIV>
 <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
 <20190619062714.GA11457@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619062714.GA11457@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On (06/19/19 15:27), Sergey Senozhatsky wrote:
> [..]
> 
> > If all else fails, just remove nouveau_dri.so and/or boot with
> > nouveau.noaccel=1 -- should be perfect.
> 
> Can give it a try.

That has some impact on system responsiveness:

 CPU%		COMM
 339.7		firefox

Which is slightly less than perfect :)

	-ss
