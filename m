From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VGA resume & thaw (wake up from S3 & S4) broken -
 reloaded & Fedora kernels 3.18 boot from soft-off(S5) broken
Date: Tue, 21 Oct 2014 02:23:39 +0200
Message-ID: <5445A78B.8050501@gmail.com>
References: <5444A802.9030504@gmail.com> <544562E9.1030000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <544562E9.1030000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 20.10.2014 21:30, poma wrote:
> On 20.10.2014 08:13, poma wrote:
>>
>> 02:00.0 VGA compatible controller: 
>> NVIDIA Corporation G98 [GeForce 8400 GS Rev. 2] (rev a1)
>> Chipset: G98 (NV98)
>> Family : NV50
>>
>> The same for all four kernel:
>> - 3.18.0-0.rc0.git8.1.fc22.x86_64
>> - 3.18.0-0.rc0.git9.1.fc22.x86_64
>> - 3.18.0-0.rc0.git9.3.fc22.x86_64
>> - 3.18.0-0.rc0.git9.4.fc22.x86_64
>> after
>> "fb: switching to nouveaufb from VESA VGA"
>> display is powered off.
>> The magic SysRq key sequence is necessary to reboot.
>>
> ...
> 
> This is what I've tested so far:
> http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next
> git clone -b drm-next git://people.freedesktop.org/~airlied/linux
> 
> 1. git-e94654e-1st-test-nouveau
> 
> 2. git-996f5a0-2nd-test-nouveau
>    drm/nouveau/core: pass related object into notify constructor
>    http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=996f5a0
> 
> 3. git-b38a232-3rd-test-nouveau
>    drm/nv50-/disp: add support for completion events
>    http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=b38a232
> 
> 4. git-dfda0df-4th-test-nouveau
>    The Last of the Mohicans
> 
> Unlike the above mentioned Fedora kernels, all four drm-next kernels have no problemos with booting from soft-off(S5).
> However "The Last of the Mohicans" has broken resume from suspend(S3)/hibernate(S4).
> This has been seen recently.
> 

Summa summarum

With the above mentioned drm-next kernels at least works boot from soft-off(S5).
However broken are resume from suspend(S3) & hibernate(S4).

The above mentioned Fedora kernels including 3.18.0-0.rc1.git0.1.fc22.x86_64, based on linux-next & derivatives, all broke boot from soft-off(S5) - after "fb: switching to nouveaufb from VESA VGA" you can only get WhoTF turned out the lights!
What the circus.

What is the best, I've compared the last working kernel and first broken, guess what, no diff within gpu/drm/nouveau/ branch.


BTW
(kernel_hibernate) Hibernation issue tracker bug
https://bugzilla.redhat.com/show_bug.cgi?id=781749

Are you really such opportunists?


poma
