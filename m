From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: force alignment to 0x1000 for gpu objects
Date: Tue, 10 Sep 2013 09:21:51 +1000
Message-ID: <CACAvsv7kqqfnPXCqeAgaGuujmPLi_2iTs2jHMk6doSM1hRY4tQ@mail.gmail.com>
References: <1378132297-19616-1-git-send-email-maarten.lankhorst@canonical.com>
	<CACAvsv60+TdUFeQjUjZOig-7wdg6vu0fb9T8wBS5FLJFPEVJyg@mail.gmail.com>
	<52272095.10905@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <52272095.10905@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 4, 2013 at 9:59 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Op 04-09-13 05:34, Ben Skeggs schreef:
>> On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
>> <maarten.lankhorst@canonical.com> wrote:
>>> There are a lot of places that allocate multiples of 1000,
>>> but do not set alignment correctly and still require this
>>> alignment implicitly or explicitly.
>> This is wrong.  Where are the places you think you need this?
>>
> All the calls to nouveau_gpuobj_map_vm for example in core/engine/graph/nvc0.c.
>
> engctx_create is usually called with alignment = 0x100 too, which seems like it would break in the fifo_context_attach calls too.
All the places I can see with a "too small" alignment are not
suballocated, so the backend will force alignment to minimum GPU page
size anyway.

If someone wants to go through all these calls and fix them up
explicitly too, then, patches welcome.  The posted patch, however,
isn't the right way to go about this, and I couldn't find an example
yet that'd cause an actual breakage.

Ben.

>
> ~Maarten
