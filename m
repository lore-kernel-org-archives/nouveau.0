From: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VGA resume & thaw (wake up from S3 & S4) broken -
 kernel(nouveau) exclusively
Date: Mon, 15 Sep 2014 19:28:36 +0200
Message-ID: <541721C4.6020607@gmail.com>
References: <5413CEA5.3060403@gmail.com>	<5413CFD1.4020300@gmail.com>	<5414AEA4.4020707@gmail.com>	<CAKb7UviW9YTxHiJN6wjE122QF4r2Z2zx1Q8D+Uvk2GYtXsxtrQ@mail.gmail.com>	<5414B64D.4080801@gmail.com>	<5414BAFF.1030104@nimrod-online.com>	<5415527A.7090502@gmail.com>	<5415658C.2080501@nimrod-online.com>	<5416A21B.6090002@gmail.com>
 <CAKb7UvhNHM3Dga3Ekn5k9cY9ikT3JA5U-8t6_6ip943vUB40eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhNHM3Dga3Ekn5k9cY9ikT3JA5U-8t6_6ip943vUB40eQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>, Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 15.09.2014 15:36, Ilia Mirkin wrote:
> On Mon, Sep 15, 2014 at 4:23 AM, poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Chipset: G98 (NV98)
>> Family : NV50
>>
>>
>> WORKING VIDEO RESUME(S3)
>>
>> 3.15.0-rc8.1.git.7a014a8
>> 3.15.0-rc8.2.git.456b057
>> 3.15.0-rc8.3.git.b8407c9
>> 3.15.0-rc8.4.git.bb7ef1e
>>
>> ========================
>>
>> BROKEN VIDEO RESUME(S3)
>>
>> STARTING WITH:
>> 3.15.0-rc8.5.git.415f12e
>>
>> commit 415f12efc1b2308411b2cbc3e82666b3db8a7758
>> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Date:   Wed May 21 11:24:43 2014 +1000
>>
>>     drm/nv50/disp: start removing direct vbios parsing from supervisor
>>
>>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c?id=415f12e
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c?id=415f12e
> 
> Looks like the same issue as reported in
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=83550
> 
> Ben, any ideas? Poma, can you attach your vbios to the bug above?
> 
>   -ilia
> 

A Video BIOS dumped.


poma
