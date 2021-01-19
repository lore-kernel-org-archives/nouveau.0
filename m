From: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings
 from GPU!
Date: Tue, 19 Jan 2021 19:27:20 +0000
Message-ID: <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local> <20210119082927.GJ4903@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20210119082927.GJ4903@dell>
Content-Language: en-US
Content-ID: <F0912769F7D8344F9F5AB490350D9FA0@namprd05.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>, Jesse Barnes <jesse.barnes@intel.com>, Jan Safrata <jan.nikitenko@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Gareth Hughes <gareth@valinux.com>, Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>, Min He <min.he@intel.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>, Niu Bing <bing.niu@intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, jim liu <jim.liu@intel.com>, Roland Scheidegger <sroland@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
List-Id: nouveau.vger.kernel.org



> On Jan 19, 2021, at 03:29, Lee Jones <lee.jones@linaro.org> wrote:
> 
> On Mon, 18 Jan 2021, Daniel Vetter wrote:
> 
>> On Mon, Jan 18, 2021 at 03:09:45PM +0000, Lee Jones wrote:
>>> On Mon, 18 Jan 2021, Daniel Vetter wrote:
>>> 
>>>> On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
>>>>> 
>>>>>> On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
>>>>>> 
>>>>>> This set is part of a larger effort attempting to clean-up W=1
>>>>>> kernel builds, which are currently overwhelmingly riddled with
>>>>>> niggly little warnings.
>>>>>> 
>>>>>> Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
>>>>> 
>>>>> Thanks! For all the vmwgfx bits:
>>>>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>>>> 
>>>> Ok I merged everything except vmwgfx (that's for Zack) and i915/nouveau
>>>> (those generally go through other trees, pls holler if they're stuck).
>>> 
>>> Thanks Daniel, you're a superstar!
>>> 
>>> So Zack will take the vmwgfx parts?  Despite providing a R-b?
>> 
>> I only merge stuff that's defacto abandoned already. Everything else I try
>> to offload to whomever actually cares :-)
> 
> Understood.  Thanks for the explanation.
> 
> Hopefully Zack actually cares. :D

hah, I do. I just pushed all of the changes to drm-misc-next. Let me know if I missed anything. Thanks!

z
