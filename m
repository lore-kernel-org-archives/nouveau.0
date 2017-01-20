From: poma <pomidorabelisima@gmail.com>
Subject: Re: [Nouveau] NVAC "No Signal"
Date: Fri, 20 Jan 2017 14:30:54 +0100
Message-ID: <7e22d244-bad9-46fa-29ce-8c70872e66a7@gmail.com>
References: <1de93d48-bc1c-bab4-11c4-395bfdfba7bb@gmail.com>
 <CAEXux-ZHdmop1c8F3FGRzAa_otwVjHUsT7OCVg6ObP_dg-Pcdw@mail.gmail.com>
 <90c3d7fc-16c9-bc81-8812-a9a1e86415dc@gmail.com>
 <CAEXux-Zr9SaRgSoVGCJKGO59CNYqq1MEwTo1ib23dCD+rxebjw@mail.gmail.com>
 <1f02c18b-e472-e3bc-9302-646d20e59d46@gmail.com>
 <CAEXux-a=F+AAr--rf8Dk_Cekcfk7yFF49mK4tW6MH4Xv=-2puA@mail.gmail.com>
 <07fa54e9-1a6f-de75-52ee-cc8aee96a541@gmail.com>
 <20161019175806.uqksdyiyr3dpkzu3@pmoreau.org>
 <f1d2a80f-5911-9ec7-f61f-4c10fe2ad87f@gmail.com>
 <f372e6ef-a030-ef79-c72f-0b00fdc48ffe@gmail.com>
 <4940241f-aadc-0277-a8c8-62879a41fc77@spliet.org>
 <be304bb1-621d-0e3a-3435-0430aa98a507@gmail.com>
 <d32d1fa0-1f65-3c3b-6b2c-b9f252663783@spliet.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <d32d1fa0-1f65-3c3b-6b2c-b9f252663783@spliet.org>
Sender: stable-owner@vger.kernel.org
To: Dave Airlie <airlied@redhat.com>, "# 4 . 9 . x-" <stable@vger.kernel.org>
Cc: Roy Spliet <nouveau@spliet.org>, Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org, Jeff Backus <jeff.backus@gmail.com>
List-Id: nouveau.vger.kernel.org

On 09.01.2017 19:20, Roy Spliet wrote:
> Op 09-01-17 om 00:24 schreef Ben Skeggs:
>> On 12/24/2016 07:48 PM, Roy Spliet wrote:
>>> I've observed this regression on my NVAC board; a 1920x1080 TV on HDMI
>>> (single monitor set-up) gets no signal with Fedora kernels from 4.8.
>>> Trace sent to the mmio dumps mailbox. A brief scan already revealed that
>>> register 0xe840 is never touched, so it appears that NVIDIA does
>>> something different.
>>> VBIOS for this board is in the usual place. Commenting out 0xac from the
>>> workaround seems to solve the problem, as tested on a Fedora 4.9 kernel.
>>> I hope that helps you get a little further with this issue. Cheers, and
>>> happy holidays!
>> Thanks Roy,
>>
>> NVIDIA told me that it applied to these boards, but, I can't see NVIDIA
>> attempting the workaround in your trace, so until there's evidence to
>> the contrary, I've disabled it for MCP7x for now.
>>
>> Ben.
> Thanks. Since your patch is the exact modification I made to verify the 
> workaround was bugging me, consider it:
> 
> Tested-by: Roy Spliet <nouveau@spliet.org>
> 
> Given "no display on HDMI since 4.8" is quite a serious regression 
> (albeit for a small userbase), please consider submitting this to 4.10 
> as well as a "back-port" to the upstream 4.8 and 4.9 trees.
> Thanks again! Cheers,
> 
> Roy
> 


Thanks Roy

Hello Dave, Greg

If it is not already, please push for:
- stable 4.9.6
- mainline 4.10-rc5

Also:
Reported-by: poma <poma@gmail.com>
Tested-by: poma <poma@gmail.com>

Ref.
https://lists.freedesktop.org/archives/nouveau/2016-October/026242.html
https://github.com/skeggsb/nouveau/commit/2e5fba2.patch
