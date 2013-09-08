From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: [Nouveau] 3.12rc1-pre Nouveau? oops
Date: Mon, 09 Sep 2013 01:02:36 +0200
Message-ID: <522D020C.6070402@mni.thm.de>
References: <CAKb7UviRb_ao_nB8Q3pa9ePm+yUGd8u7PDREv5wNfCheyGTZjQ@mail.gmail.com>	<1378675264-3005-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>	<CAPM=9tyCOdzC1NYy7jt+zh3WOuzubaO3b8vwFVast9ec=BWOkA@mail.gmail.com>	<522CF3D1.2020303@mni.thm.de> <CAPM=9twkyQGbnPEerqCpJNfXxSRo1pw7MBvGMuz8zs1pQ+Fcng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPM=9twkyQGbnPEerqCpJNfXxSRo1pw7MBvGMuz8zs1pQ+Fcng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org


On 09.09.2013 00:29, Dave Airlie wrote:
> On Mon, Sep 9, 2013 at 8:01 AM, Tobias Klausmann
> <tobias.johannes.klausmann@mni.thm.de> wrote:
>> On 08.09.2013 23:33, Dave Airlie wrote:
>>>>> Looks like you have Optimus (intel + nvidia), and the backtrace has
>>>>> runtime pm in it, which is something new Dave added for 3.12, adding
>>>>> him in explicitly. The simplest explanation is that disp->init is
>>>>> NULL. And it seems like there are no outputs from the earlier nouveau
>>>>> init prints. I guess that the call to nouveau_display_resume from
>>>>> nouveau_pmops_runtime_resume should be guarded by a if
>>>>> (dev->mode_config.num_crtc) like it is everywhere else.
>>>>>
>>>>>     -ilia
>>>> Your guess was right, this (hopefully attached patch) fixes it for me!
>>> Does it look like this one?
>>>
>>> Dave.
>> No, mine was quick and dirty, reverted it and took yours. But i'm a little
>> bit confused that this is a suspend/resume problem, i booted the kernel for
>> the first time while seeing the oops. But anyway i tested it and it works.
> It's runtime suspend/resume - so it turns the nvidia gpu off at boot since it
> isn't being used.
>
> you should see longer battery life.
> Dave.
Ah thanks for the explanation.
Can we see the state in /sys somewhere? I looked around but did not find 
something to determine the state?
/sys/bus/pci/drivers/nouveau/0000:01:00.0/drm/card0/power/runtime_status 
gives me "unsupported".
But i suspect thats because of nouveaus lack to properly reclock my 
nvidia gpu. Anyway i'm better of asking you for the right anyswer.
Thanks for your time,
Tobias
