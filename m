From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
Date: Thu, 13 Dec 2012 13:43:29 +0100
Message-ID: <CAKMK7uHOqmKu+tQMWeBHayP_zSBFynWmfHomhxB+p1huptSRxQ@mail.gmail.com>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
	<00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Hi Inki,

I've pushed out the latest bits to
http://cgit.freedesktop.org/~danvet/drm/log/?h=drm-kms-locking with
some hacks on top to be able to compile all the arm drivers. Testing
feedback of the entire pile would be awesome, especially since you've
had some issues with framebuffer lifecycle and those should now be
correctly fixable with the proper refcounting. If you have too many
conflicts pls yell so that I can include your base into mine and
rebase the entire series.

Thanks, Daniel

On Thu, Dec 13, 2012 at 1:26 PM, Inki Dae <inki.dae@samsung.com> wrote:
>> -----Original Message-----
>> From: dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org
>> [mailto:dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org] On
>> Behalf Of Daniel Vetter
>> Sent: Thursday, December 13, 2012 8:05 PM
>> To: DRI Development
>> Cc: Nouveau Dev; Intel Graphics Development; Daniel Vetter
>> Subject: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
>>
>> For user framebuffers it's easier to just inline the
>> exynos_drm_framebuffer_init helper instead of trying to adjust it -
>> most of the things that helper sets up need to be overwritten anyway
>> again due to the multiple backing storage objects support exynos has,
>> but does not use for the fbdev.
>>
>
> Hi Daniel,
>
> I'd rebase this patch to -next. This patch is conflicted with -next.
> And if there is no any problem after test, will apply it.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
