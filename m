From: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <deathsimple@vodafone.de>
Subject: Re: [Nouveau] [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Wed, 23 Jul 2014 11:47:51 +0200
Message-ID: <53CF84C7.2020507@vodafone.de>
References: <20140709093124.11354.3774.stgit@patser>	<CAKMK7uFa8vMBV9_JenbFGnFXtV_r9dk=WjbMkkCDWcauhrDdJg@mail.gmail.com>	<53CE8A57.2000803@vodafone.de>	<53CF58FB.8070609@canonical.com>	<53CF5B9F.1050800@amd.com>	<53CF5EFE.6070307@canonical.com>	<53CF63C2.7070407@vodafone.de>	<CAKMK7uGJj+UwcnnzA+fj_=uWPN3i0sneWkoD+wfPJ_8Q6Y-DQg@mail.gmail.com>	<53CF6622.6060803@amd.com>	<53CF699D.9070902@canonical.com>	<53CF6B18.5070107@vodafone.de>	<CAKMK7uGd65HR11thcv8KjDw-RnTa7W-QGOzFGFd+oO_hp8wyHA@mail.gmail.com>	<53CF7035.2060808@amd.com>	<53CF7191.2090008@canonical.com>	<CAKMK7uGLqzePAREsWhX0D1oN4FdqKwPgAL6x8sULpJSqYH5LwA@mail.gmail.com>	<53CF765E.7020802@vodafone.de>	<CAKMK7uE1G-EjbJ2RAXC3ZfkaCo=Gber5PJuRG623Yoz9D=FmGw@mail.gmail.com>	<53CF8010.9060809@amd.com>	<CAKMK7uEowhvc+4Jc6t2NAeE1joFaohJ6cP7s
 U-Akut6b3ta=1g@mail.gmail.com>	<53CF822E.7050601@amd.com>	<CAKMK7uG85KV94PTqkzvY8RPxg6ApRKHVZrD20e48GHZM=s06=w@mail.gmail.com>
 <CAKMK7uHEgdU+Uz-OnRGvT_wFjOXHpZmgZcrORsBrST_MY5_ADA@mail.gmail
 .com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uHEgdU+Uz-OnRGvT_wFjOXHpZmgZcrORsBrST_MY5_ADA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5p?= =?UTF-8?B?Zw==?= <christian.koenig@amd.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Am 23.07.2014 11:44, schrieb Daniel Vetter:
> On Wed, Jul 23, 2014 at 11:39 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> The scheduler needs to keep track of a lot of fences, so I think we'll
>> have to register callbacks, not a simple wait function. We must keep
>> track of all the non-i915 fences for all oustanding batches. Also, the
>> scheduler doesn't eliminate the hw queue, only keep it much slower so
>> that we can sneak in higher priority things.
>>
>> Really, scheduler or not is orthogonal.
> Also see my other comment about interactions between wait_fence and
> the i915 reset logic. We can't actually use it from within the
> scheduler code since that would deadlock.

Yeah, I see. You would need some way to abort the waiting on other 
devices fences in case of a lockup.

What about an userspace thread to offload waiting and command submission to?

Just playing with ideas right now,
Christian.

> -Daniel
