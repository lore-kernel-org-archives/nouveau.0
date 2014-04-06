From: Claas Lorenz <cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org>
Subject: Re: [PATCH] acpi: allow non-optimus setups to load vbios
	from acpi
Date: Sun, 06 Apr 2014 10:12:56 +0200
Message-ID: <53410C88.1030205@uni-potsdam.de>
References: <1395877041-8646-1-git-send-email-imirkin@alum.mit.edu>	<CAA_k4TPf4kVMCiTnUEM6KmROwt3e7MTDq2p3eLwDUjswKx0kLg@mail.gmail.com>	<533FEEB8.2080605@uni-potsdam.de>
 <CAKb7UvgmBOjfRdoX2A_eBb9YO7OZROHiRUOaMUEbPppc_1UQ-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgmBOjfRdoX2A_eBb9YO7OZROHiRUOaMUEbPppc_1UQ-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Patrick Clara <patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Yes, it works without the workaround... and thanks for the suspend patch
which works fine as well :-)

On 05.04.2014 18:18, Ilia Mirkin wrote:
> On Sat, Apr 5, 2014 at 7:53 AM, Claas Lorenz <cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org> wrote:
>> Hi, same for me. The screen does not freeze anymore and the boot
> Great! And that's without the nouveau.config=NvBios= stuff that you
> added as a workaround, right?
>
>> succeeds. But now I have this kernel message during boot (for the second
>> card):
>>
>> [   24.382045] pci_pm_runtime_suspend():
>> nouveau_pmops_runtime_suspend+0x0/0xe0 [nouveau] returns -22
>>
>> Do you want to have the complete dmesg log? I think this is a new bug.
> New to you, perhaps :) Try
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=adbbdbac04f093c0abf946b1e93e4e5291808491.
> Or you can try forcing runpm=1 and seeing what happens. Ideally it'll
> be able to suspend your second GPU, but... who knows. That logic is
> really designed around optimus.
>
>> Your patch works for the previous one, so you can close it.
>>
>> Yours,
>> Claas
>>
>>
>> On 27.03.2014 11:54, Patrick Clara wrote:
>>> I have tested this patch. I can confirm that now nouveau loads
>>> correctly without errors.
>>> Thank you
>>>
>>> 2014-03-27 0:37 GMT+01:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:
>>>> There appear to be a crop of new hardware where the vbios is not
>>>> available from PROM/PRAMIN, but there is a valid _ROM method in ACPI.
>>>> The data read from PCIROM almost invariably contains invalid
>>>> instructions (still has the x86 opcodes), which makes this a low-risk
>>>> way to try to obtain a valid vbios image.
>>>>
>>>> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=76475
>>>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>>>> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v2.6.35+
>>>> ---
>>>>
>>>> Not sure if the stable CC is warranted... it's technically not a
>>>> regression. But it's a simple change that enables hardware to work.
>>>>
>>>> Patrick/Claas -- please test this out (if you're applying this to a linux
>>>> tree, you'll have to do it manually, but it should be fairly obvious where
>>>> this should apply).
>>>>
>>>>  drm/nouveau_acpi.c | 3 ---
>>>>  1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/drm/nouveau_acpi.c b/drm/nouveau_acpi.c
>>>> index 83face3..2792069 100644
>>>> --- a/drm/nouveau_acpi.c
>>>> +++ b/drm/nouveau_acpi.c
>>>> @@ -389,9 +389,6 @@ bool nouveau_acpi_rom_supported(struct pci_dev *pdev)
>>>>         acpi_status status;
>>>>         acpi_handle dhandle, rom_handle;
>>>>
>>>> -       if (!nouveau_dsm_priv.dsm_detected && !nouveau_dsm_priv.optimus_detected)
>>>> -               return false;
>>>> -
>>>>         dhandle = ACPI_HANDLE(&pdev->dev);
>>>>         if (!dhandle)
>>>>                 return false;
>>>> --
>>>> 1.8.3.2
>>>>
