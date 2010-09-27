From: Dmitri Sosnik <dimavs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [drm] failed to open device
Date: Mon, 27 Sep 2010 16:11:53 +1000
Message-ID: <AANLkTinqXrW0zeBX-nu_W7O5ic6mY4EHi=mLRvdDqd_v@mail.gmail.com>
References: <AANLkTim1Qp9Wd_P=rQEKh3Mp8zukPLwqkrg-nY7u3SU2@mail.gmail.com>
	<1285566262.2360.0.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1285566262.2360.0.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thanks! Yeah, something strange here, lsmod shows nouveau module as
loaded, but there is nothing from nouveau in dmesg, just one line that
drm is initialized.


I am booting kernel with nomodeset parameter, so efifb driver is used.
When I am trying to boot with nouveau I am just getting black screen
(system is available via ssh though) and dmesg says:
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: enabling device (0002 -> 0003)
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x084700a2)
checking generic (c0030000 708000) vs hw (c0000000 10000000)
fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing generic driver
Console: switching to colour dummy device 80x25
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PCIROM
nouveau 0000:01:00.0: Invalid ROM contents
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from ACPI
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: No valid BIOS image found
nouveau 0000:01:00.0: PCI INT A disabled


Thanks,
D



On Mon, Sep 27, 2010 at 3:44 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, 2010-09-27 at 15:35 +1000, Dmitri Sosnik wrote:
>> Hi All,
>>
>> I am trying to get nouveau working on MacBookPro 4,1. I am using
>> kernel from nouveau/linux-2.6 repository, XOrg 1.9, libdrm and
>> xf86-video-nouveau from git repositories.
>> When drm module is loaded with debug=3D1 it gives a number of "[drm:
>> drm_stub_open]," lines in logs. It looks like idr_find(...) function
>> returns 0. /dev/dri/card0 doesn't exist.
>>
>> What I am doing wrong?
> It's hard to say. =A0My initial assumption would be you don't have the
> kernel module loaded. =A0Failing that, your dmesg output should give more
> clues.
>
> Ben.
>>
>> Cheers,
>> D
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
>
