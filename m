From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: VGA resume & thaw (wake up from S3 & S4) broken -
	kernel(nouveau) exclusively
Date: Sat, 13 Sep 2014 16:58:48 -0400
Message-ID: <CAKb7UviW9YTxHiJN6wjE122QF4r2Z2zx1Q8D+Uvk2GYtXsxtrQ@mail.gmail.com>
References: <5413CEA5.3060403@gmail.com> <5413CFD1.4020300@gmail.com>
 <5414AEA4.4020707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5414AEA4.4020707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Sep 13, 2014 at 4:52 PM, poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 13.09.2014 07:02, poma wrote:
>> On 13.09.2014 06:57, poma wrote:
>>>
>>> Actually I have nothing to show cause logs are all OK.
>>> Haha, it seems to me that the bugs become intelligent.
>>>
>>> 3.15.10-201.fc20.x86_64
>>> 3.16.2-200.fc20.x86_64
>>> 3.17.0-0.rc4.git3.2.fc22.1.x86_64
>>>  nouveau  [     DRM] suspending display...
>>>  nouveau  [     DRM] unpinning framebuffer(s)...
>>>  nouveau  [     DRM] evicting buffers...
>>>  nouveau  [     DRM] waiting for kernel channels to go idle...
>>>  nouveau  [     DRM] suspending client object trees...
>>>  nouveau  [     DRM] suspending kernel object tree...
>>> ...
>>>  nouveau  [     DRM] re-enabling device...
>>>  nouveau  [     DRM] resuming kernel object tree...
>>>  nouveau  [   VBIOS][0000:02:00.0] running init tables
>>>  nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
>>>  nouveau  [     CLK][0000:02:00.0] --: core 566 MHz shader 1400 MHz memory 399 MHz
>>>  nouveau  [     DRM] resuming client object trees...
>>>  nouveau  [     DRM] resuming display...
>>>  nouveau 0000:02:00.0: no hotplug settings from platform
>>>  nouveau 0000:02:00.0: no hotplug settings from platform
>>>
>>> Logs(dmesg) are literally identical.
>>>
>>> 3.15.10-201.fc20.x86_64 - nouveau(fb) resume & thaw PASSED, and that's all what works.
>>>         Kernels >= 3.16 - nouveau(fb) resume & thaw BROKEN
>>>             ALL Kernels - vesa(fb)    resume & thaw BROKEN.
>>>
>>>
>>
>> Excusez-moi,
>> BROKEN == The display remains OFF.
>>
>
> More precisely stated it looks like this:
>
> - Last kernel with working resume/thaw
>   http://koji.fedoraproject.org/koji/buildinfo?buildID=538208
>   kernel-3.16.0-0.rc0.git9.1.fc21
>   2014-06-13
>
> - First kernel with broken resume/thaw
>   kernel-3.16.0-0.rc0.git10.1.fc21
>   http://koji.fedoraproject.org/koji/buildinfo?buildID=538244
>   http://pkgs.fedoraproject.org/repo/pkgs/kernel/patch-3.15-git10.xz/f98fb42e79c966f8e139e27b61d933e0/patch-3.15-git10.xz
>   2014-06-13
>
> The only difference in dmesg between working and broken kernel module with drm.debug=14 is
>  [drm:drm_helper_hpd_irq_event] [CONNECTOR:18:DVI-I-1] status updated from connected to connected
>  [drm:drm_helper_hpd_irq_event] [CONNECTOR:18:DVI-I-1] status updated from connected to connected
>
> - git commit probably introduced breakage
>   drm/nouveau/disp: add internal representaion of output paths and connectors
>   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm?id=7a014a
>   https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/nouveau?id=7a014a
>   2014-06-11

Do you have any special reason to believe this to be the culprit
(besides the fact that it has something to do with hpd)? Can you do an
actual bisect to confirm?

Thanks,

  -ilia

>
> - Ref. fdbs
>   Video failed on resume from suspend
>   https://bugs.freedesktop.org/show_bug.cgi?id=77599
>   https://bugs.freedesktop.org/show_bug.cgi?id=80506
>
>
> poma
>
