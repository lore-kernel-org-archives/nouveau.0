From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation failures
Date: Fri, 13 Sep 2019 10:48:57 -0400
Message-ID: <CAKb7UvgS5uGRP55Z7mcD=PTcPHmHMXB23gpP83kjn-vFcverJQ@mail.gmail.com>
References: <20190913130559.669563815@linuxfoundation.org> <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com> <20190913144627.GH1546@sasha-vm>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190913144627.GH1546@sasha-vm>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Sep 13, 2019 at 10:46 AM Sasha Levin <sashal@kernel.org> wrote:
>
> On Fri, Sep 13, 2019 at 09:33:36AM -0400, Ilia Mirkin wrote:
> >Hi Greg,
> >
> >This feels like it's missing a From: line.
> >
> >commit b513a18cf1d705bd04efd91c417e79e4938be093
> >Author: Lyude Paul <lyude@redhat.com>
> >Date:   Mon Jan 28 16:03:50 2019 -0500
> >
> >    drm/nouveau: Don't WARN_ON VCPI allocation failures
> >
> >Is this an artifact of your notification-of-patches process and I
> >never noticed before, or was the patch ingested incorrectly?
>
> It was always like this for patches that came through me. Greg's script
> generates an explicit "From:" line in the patch, but I never saw the
> value in that since git does the right thing by looking at the "From:"
> line in the mail header.

That's right -- the email's From header gets used in the case of no
explicit From in the email body. But Greg is sending the emails From:
Greg, so if I were to ingest that email, I would end up with a patch
From: Greg, not From: Lyude as it ought to be.

Cheers,

  -ilia
