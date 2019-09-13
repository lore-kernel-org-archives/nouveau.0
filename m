From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Date: Fri, 13 Sep 2019 11:20:54 -0400
Message-ID: <20190913152054.GJ1546@sasha-vm>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
 <20190913145456.GA456842@kroah.com>
 <20190913150111.GI1546@sasha-vm>
 <20190913151051.GB458191@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190913151051.GB458191@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Sep 13, 2019 at 04:10:51PM +0100, Greg Kroah-Hartman wrote:
>On Fri, Sep 13, 2019 at 11:01:11AM -0400, Sasha Levin wrote:
>> On Fri, Sep 13, 2019 at 03:54:56PM +0100, Greg Kroah-Hartman wrote:
>> > On Fri, Sep 13, 2019 at 10:46:27AM -0400, Sasha Levin wrote:
>> > > On Fri, Sep 13, 2019 at 09:33:36AM -0400, Ilia Mirkin wrote:
>> > > > Hi Greg,
>> > > >
>> > > > This feels like it's missing a From: line.
>> > > >
>> > > > commit b513a18cf1d705bd04efd91c417e79e4938be093
>> > > > Author: Lyude Paul <lyude@redhat.com>
>> > > > Date:   Mon Jan 28 16:03:50 2019 -0500
>> > > >
>> > > >    drm/nouveau: Don't WARN_ON VCPI allocation failures
>> > > >
>> > > > Is this an artifact of your notification-of-patches process and I
>> > > > never noticed before, or was the patch ingested incorrectly?
>> > >
>> > > It was always like this for patches that came through me. Greg's script
>> > > generates an explicit "From:" line in the patch, but I never saw the
>> > > value in that since git does the right thing by looking at the "From:"
>> > > line in the mail header.
>> > >
>> > > The right thing is being done in stable-rc and for the releases. For
>> > > your example here, this is how it looks like in the stable-rc tree:
>> > >
>> > > commit bdcc885be68289a37d0d063cd94390da81fd8178
>> > > Author:     Lyude Paul <lyude@redhat.com>
>> > > AuthorDate: Mon Jan 28 16:03:50 2019 -0500
>> > > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > > CommitDate: Fri Sep 13 14:05:29 2019 +0100
>> > >
>> > >    drm/nouveau: Don't WARN_ON VCPI allocation failures
>> >
>> > Yeah, we should fix your scripts to put the explicit From: line in here
>> > as we are dealing with patches in this format and it causes confusion at
>> > times (like now.)  It's not the first time and that's why I added those
>> > lines to the patches.
>>
>> Heh, didn't think anyone cared about this scenario for the stable-rc
>> patches.
>>
>> I'll go add it.
>>
>> But... why do you actually care?
>
>On the emails we send out, it has inproper author information which can
>cause confusion that the sender of the email (i.e. me) is somehow saying
>that they are the author of the patch.

Right right, I agree this is wrong and I'll fix it. I'm just concerned
about what exactly you are doing with the -rc patches to actually care
about this :)

--
Thanks,
Sasha
