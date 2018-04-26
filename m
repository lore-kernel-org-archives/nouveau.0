From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] drm/nouveau/secboot: remove VLA usage
Date: Thu, 26 Apr 2018 16:25:56 -0700
Message-ID: <CAGXu5j+OyUWm8N0s-6NnREFakpR6xFJTt7+KK99JRm4i+ZAmyQ@mail.gmail.com>
References: <20180313162411.GA1983@embeddedgus> <20180314110834.GB8564@ulmo> <CACAvsv6NhUrskZGMJGyO42LtuNTWygsutddo_-fuhHRPCs2KWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv6NhUrskZGMJGyO42LtuNTWygsutddo_-fuhHRPCs2KWA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, David Laight <David.Laight@aculab.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 15, 2018 at 7:05 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On 14 March 2018 at 21:08, Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Tue, Mar 13, 2018 at 11:24:11AM -0500, Gustavo A. R. Silva wrote:
>>> In preparation to enabling -Wvla, remove VLA. In this particular
>>> case directly use macro NVKM_MSGQUEUE_CMDLINE_SIZE instead of local
>>> variable cmdline_size. Also, remove cmdline_size as it is not
>>> actually useful anymore.
>>>
>>> The use of stack Variable Length Arrays needs to be avoided, as they
>>> can be a vector for stack exhaustion, which can be both a runtime bug
>>> or a security flaw. Also, in general, as code evolves it is easy to
>>> lose track of how big a VLA can get. Thus, we can end up having runtime
>>> failures that are hard to debug.
>>>
>>> Also, fixed as part of the directive to remove all VLAs from
>>> the kernel: https://lkml.org/lkml/2018/3/7/621
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>> ---
>>> Changes in v2:
>>>  - Use sizeof(buf) instead of NVKM_MSGQUEUE_CMDLINE_SIZE. This change
>>>    is based on the feedback provided by David Laight. Thanks David.
>>>
>>>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c | 7 +++----
>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Thanks everyone.  I've taken the patch in my tree.

Hi!

Just checking in on this -- I don't see this patch in linux-next. Is
this queued somewhere else?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
