From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Commit "drm: run the hpd irq event code directly" causes stutter
	from repeated EDID retrievals
Date: Sun, 26 May 2013 18:37:34 +0200
Message-ID: <CAKMK7uHMb12e05T7SmX-jFumuGzDUWG6VRaWsLL4Eps25=oXbA@mail.gmail.com>
References: <4298860.NTVPviymN4@giraffe>
	<CAKMK7uGtJZOJzLm1sR07EN5DySX_V08q32cMEUdN=BrBPB3WsA@mail.gmail.com>
	<1486851.BFel1pU9A1@giraffe>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1486851.BFel1pU9A1@giraffe>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Gard Spreemann <gspreemann@gmail.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sun, May 26, 2013 at 6:25 PM, Gard Spreemann <gspreemann@gmail.com> wrote:
> On Sunday 26 May 2013 18:14:06 Daniel Vetter wrote:
>> My guess is that you've worked around these edid stalls with
>> drm_kms_helper.poll=0 and the above commit breaks that w/a. That patch
>> was shot down unfortunately. If you can't reproduce these stalls on
>> older kernels when removing the poll=0 option, then something else
>> broke.
>
> You are correct. Before that commit, the stuttering behavior is present with
> poll=1, but not with poll=0. Starting with that commit, the behavior is
> present nomatter the poll setting.
>
> Am I correct in thinking that this is a problem without a clear solution?

It's a problem with a solution rejected by Dave and Alex, and I tend
to agree with them a bit. The real solution is to grow nouveau/radeon
hpd storm mitigation code (i915 already has it in 3.10), since it's
much better to cut of the issue at the source (by disasbling hpd
interrupts completely for such problematic outputs) instead of trying
to work around the worst side-effects of getting too many.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
