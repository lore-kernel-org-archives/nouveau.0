From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/12] TV-out modesetting kernel patches.
Date: Wed, 12 Aug 2009 18:10:19 +1000
Message-ID: <21d7e9970908120110g388aa9d3h361f82fb2bf4a26d@mail.gmail.com>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
	<20090812110405.642f1d44@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090812110405.642f1d44-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

>
>
> On Wed, 12 Aug 2009 02:14:56 +0200
> Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
>
>> This patch series adds TV-out modesetting support to the KMS
>> implementation.
>>
>> I've tried to test it on all the hardware I've got at hand (that is
>> nv11, nv17, nv34, nv35, nv40, nv4b) with every possible output
>> combination; I believe it has reached a mergeable state, however it
>> depends on some commits from drm-next that haven't got into Linus'
>> tree yet, if you agree to merge this they could be cherry-picked, they
>> are:
>>
>> d782c3f95c9263dc0b98e7115f75f1e18b9600b3 drm/mode: add the CVT algorithm in kernel space
>> 2066facca4c7dfe9f5068ece0200a4dbf10f49e1 drm/kms: slave encoder interface.
>> 74bd3c26b90f39b9dcc05c471333da8998572b5d drm: Define DRM_MODE_CONNECTOR_TV
>> aeaa1ad3ff32be833680e484d99ec29d892da1ff drm: Define DRM_MODE_SUBCONNECTOR_SCART
>> b6b7902e54c7e8abbc213d8bdc290350c00ccfe5 drm: Define some new standard TV properties.
>>
>> OTOH, I think merging drm-next would do no harm.
>
> That's probably not a good idea. Airlied?

Its up to you how close you run that tree to the main tree. Really
shouldn't be a problem pulling my drm-next tree in.
>
> We could cherry-pick the individual patches if we absolutely have to,
> but I'd like to wait until those patches come via Linus'. In the mean
> time, if you want testing, we could abuse the nouveau/linux-2.6
> master-compat branch, and push the patches there. Or start a feature
> branch.
>
>> PATCH1-2 haven't been
>> pushed there yet, I will forward them to dri-devel@ shortly.
>
> Airlied, do you have an estimate, when all those patches might reach
> Linus? Are they -rc candidates or for the next merge window?
>

drm-next is for the next merge window, it doesn't mean they are unstable
patches they are just adding features instead of fixing regressions at
this stage.

Dave.
