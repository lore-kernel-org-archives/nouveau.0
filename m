From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bar/gk20a: Avoid bar teardown
 during init
Date: Wed, 17 Jan 2018 09:27:31 +0000
Message-ID: <d9e3c51b-880d-74e6-2789-935d78685622@collabora.com>
References: <1515065349-10187-1-git-send-email-jonathanh@nvidia.com>
 <20180110122032.GA26614@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180110122032.GA26614@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 10/01/18 12:20, Thierry Reding wrote:
> On Thu, Jan 04, 2018 at 11:29:09AM +0000, Jon Hunter wrote:
>> Commit bbb163e18960 ("drm/nouveau/bar: implement bar1 teardown")
>> introduced add a teardown helper function for BAR1. During
>> initialisation of the Nouveau, initially all the teardown helpers are
>> called once, before calling their init counterparts. For gk20a, after
>> the BAR1 teardown function is called, the device is hanging during the
>> initialisation of the FB sub-device. At this point it is unclear why
>> this is happening and this is still under investigation. However, this
>> change is preventing Tegra124 devices from booting when Nouveau is
>> enabled. To allow Tegra124 to boot, remove the teardown helper for
>> gk20a.
>>
>> This is based upon a previous patch by Guillaume Tucker but limits
>> the workaround to only gk20a GPUs.
>>
>> Fixes: bbb163e18960 ("drm/nouveau/bar: implement bar1 teardown")
>> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>> I am not happy that we do not yet fully understand the cause of
>> the hang, but I am talking with a few people at NVIDIA about this
>> and have a few things to look into. However, given that we are
>> close to v4.15 being released and I am not sure we will have a
>> proper fix in place before, I think it is best to workaround
>> this for now.
>>
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c  | 3 ++-
>>   drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.c | 1 -
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>

   https://lava.collabora.co.uk/scheduler/job/1047172

Thanks for this workaround.  Looking forward to having this
platform back on track in mainline.  I'm happy to run this boot
test again with a proper fix in future patches, let me know if I
can be of any help.

Guillaume
