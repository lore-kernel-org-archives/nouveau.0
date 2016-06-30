From: Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org>
Subject: Re: GF114 [GeForce GTX 560 Ti] (rev a1) slow and
 flickering display
Date: Thu, 30 Jun 2016 01:43:53 +0100
Message-ID: <baf19c93-393c-0895-c135-b2a9b2619a4f@blueyonder.co.uk>
References: <mailman.3582.1467133072.7331.nouveau@lists.freedesktop.org>
 <5f93d9f9-dbe6-6b31-ef0f-ff9b0169a03e@blueyonder.co.uk>
 <CAKb7UviYmiipR6qNVJW_0asCXY8geHyFwrq6N-47WgvTtQqEEQ@mail.gmail.com>
Reply-To: sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2E2278731D736549490C4CDF"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviYmiipR6qNVJW_0asCXY8geHyFwrq6N-47WgvTtQqEEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------2E2278731D736549490C4CDF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

May also be useful.
73 ... Sid.

On 29/06/16 15:19, Ilia Mirkin wrote:
> Please provide your dmesg and xorg logs from the affected machine.
>
> Thanks,
>
>    -ilia
>
> On Wed, Jun 29, 2016 at 8:17 AM, Sid Boyce <sboyce-QgLWrMLu8clzjhtm8Ag3mw@public.gmane.org> wrote:
>> I recently replaced a 8600 GT with the above card on openSUSE Tumbleweed
>> x86_64.
>>
>> The screen now flickers and when I change desktops it takes a some 10 to 15
>> seconds to display the new windows.
>> e.g if I change from desktop 1 (konsole) to desktop 8 (thunderbird) it
>> switches but konsole is displayed for 10 to 15 seconds before thunderbird
>> appears.
>>
>> Occasionally the screen flickers wildly before settling down again.
>>
>> I don't see any errors in dmesg.
>> 01:00.0 VGA compatible controller: NVIDIA Corporation GF114 [GeForce GTX 560
>> Ti] (rev a1)
>>
>> # rpm -qa|grep nouveau
>> libvdpau_nouveau-11.2.2-139.2.x86_64
>> xf86-video-nouveau-1.0.12-1.3.x86_64
>> libdrm_nouveau2-2.4.68-1.2.x86_64
>> libXvMC_nouveau-32bit-11.2.2-139.2.x86_64
>> libvdpau_nouveau-32bit-11.2.2-139.2.x86_64
>> libXvMC_nouveau-11.2.2-139.2.x86_64
>> libdrm_nouveau2-32bit-2.4.68-1.2.x86_64
>>
>>
>> 2 other boxes are OK with the cards below, all 3 boxes are at the same
>> software levels.
>>
>> 01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT 610]
>> (rev a1)
>>
>> 05:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
>> (rev a1)
>>
>> Regards
>>
>> Sid.
>>
>> --
>> Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
>> Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
>> Senior Staff Specialist, Cricket Coach
>> Microsoft Windows Free Zone - Linux used for all Computing Tasks
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau


-- 
Sid Boyce ... Hamradio License G3VBV, Licensed Private Pilot
Emeritus IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support
Senior Staff Specialist, Cricket Coach
Microsoft Windows Free Zone - Linux used for all Computing Tasks


--------------2E2278731D736549490C4CDF
Content-Type: application/x-gzip;
 name="kdm.log.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="kdm.log.gz"

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
s7PBFbvagp5UP3n95t2T+pRMwmwestLLerIt0XmRQQE3sCcwXUZCQlosExnBeJ2Z6uI4VWqC
8nI6m919dto419A7zDW981hHrmE3zTXtyakl10T9c401Xf1lrhE9c013rto81dhSVp9Uc4PU
dYNU0wHgLaWabSSzzlTTkctunWra4d6aatqzU1uq6UhOLammIznZU02dnPqmGtwj1bTSO/X0
7und07und0/vXyO9B57ePb17evf07un9a6R35und07und0/vnt6/RnoPPb17evf07und0/vX
SO+Rp3dP757ePb17ev8a6Z17evf07und07un96+R3oWnd0/vnt49vXt6/xrpPfb07und07un
d0/vXyO9E/zX/F5beD1Fw0U5189bXVpaPUx9+Ujv8vfLJ3rrJ670NihFBf9XsvQZw2cMnzF8
xvAZw9WM4bd68ls9+a2eVls9/Q6VjAYSwYjSBDoCC5e3eiIxY85t9URiQu9/q6dOL/xWTw9s
tyHNCs9e/vTLhwQdLSrII7m2W0tgnlHUcxnt1T/eoQoAmp0uk9sqpcHMYFxM6r0Uq0Wmtxca
LvSukbt4D0bGaFo7OVoxxMBnRJ8RfUZsyYgsgd5xOCPSKAqdy4g0CuP7z4idXviM+LAyog++
L0d8OeLLkUdejkTQES6XI4FwcIIeiMCBvZg7vfDlyMPKiD74vhzx5YgvRx55OQK9ELpcjoRB
RJwrR8IgDO+/HOn0wpcjDysj+uD74Pvg++D74D+e4N9iFuT7yw8WH3wffB/8xxP8K5PhkDo4
GQ5J4MBkuMsLPxl+WIj3a71+rdev9W5xrZfrR3FCntDA5bVeIqh7d8IRHkf3n946vfDp7WGl
Nx98H/zHGXxf2PnCzhd2/Qu7IwiEBhLUUFgkAKbQ6S/xScDDyL3KLuABdqC063TjFrXdIyHZ
GIivzEgn0VKqJz6YJTAD6s201xr0bPt42PbdQi3RFCAcJBpQsdNsK7B7q8QwgWUOcG2XF7eh
Wn8fq2dnz873ys6XaIp1L1AAFHaZnSnmAjtHzxRHnN8/P3e74Ql66wRNuwk6RhiILdb3iG+J
oKkn6MdN0Ax6gbtM0Cxi7vFzwLkLD0B2eeHZeevsHFjZWU9H/0dOUISgdMZQ75A1OYc9yTnw
5PzYyHkNJkATYQkLkqBe2wgdJWeKsYO3CMSRA5vldHrhyXnr5Mys5Hy0mNTjiRBE69IZi22x
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
--------------2E2278731D736549490C4CDF
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--------------2E2278731D736549490C4CDF--
