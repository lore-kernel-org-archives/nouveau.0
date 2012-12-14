From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/exynos: reorder framebuffer init
	sequence
Date: Fri, 14 Dec 2012 09:40:41 +0100
Message-ID: <CAKMK7uHB1h=Fdg7j86ff_DBppQ5RiD3XHQji2N5Ar9wYQW902Q@mail.gmail.com>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
	<00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
	<CAKMK7uHOqmKu+tQMWeBHayP_zSBFynWmfHomhxB+p1huptSRxQ@mail.gmail.com>
	<CAAQKjZP7KFsqLhZ3fPiZp4qEbvkgUhcm+Q0+1nHbKbwXngV0bg@mail.gmail.com>
	<CAKMK7uE6=taCeErFSvn-eUhG7+C0BxOCKELTara=XiGwmAticA@mail.gmail.com>
	<CAAQKjZM1_bDQoRdrFaDwLm6d0A5wyVfAOD7KFxUK2VZMPf5kRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAAQKjZM1_bDQoRdrFaDwLm6d0A5wyVfAOD7KFxUK2VZMPf5kRg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Dec 14, 2012 at 5:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
> 2012/12/14 Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> On Thu, Dec 13, 2012 at 4:16 PM, Inki Dae <inki.dae@samsung.com> wrote:
>> > How about rebasing this patch to top of
>> > git://people.freedesktop.org/~airlied/linux.git drm-next?
>> > Exynos's many patches have already been merged to drm-next. Or if you
>> > are
>> > ok, I'd like to rebase your patch to -next and test it. I don't care
>> > either
>> > way. :)
>>
>> I've pushed out a rebased version, but somehow I can't compile-test
>> exynos any more :( Probably missing some other stuff from linux-next.
>> Anyway, I don't mind which patch you pick or whether you just roll
>> your own, the important thing is that drm_framebuffer_init is called
>> _after_ everything is set up and initialized. Everything else doesn't
>> really matter.
>
>
> I've rebase your patch to -next and tested it. But your patch had null
> pointer issue to gem object so I fixed it.
> For this, you can refer to the below link,
>
> http://git.kernel.org/?p=linux/kernel/git/daeinki/drm-exynos.git;a=shortlog;h=refs/heads/exynos-drm-next
>
> And I gonna request git pull to -next including that patch today. If there
> is any problem, please let me know.

Oops, sorry for missing the gem obj assignment, your updated version
looks good. Thanks for fixing it up.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
