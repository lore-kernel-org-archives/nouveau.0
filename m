From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Sun, 24 Jan 2021 00:43:19 +0000
Message-ID: <6746024b-ab68-4d6f-626f-224800832eb6@spliet.org>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
 <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
 <CAKb7UvhFtXT7Kt6UCAZ7tCm2=kssTfCLRqUm+ajXiPo0Vn1Ksw@mail.gmail.com>
 <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPpdf5_VRMAxBNkNw+THechFv_KpXfCYcHfP409__32jof8e-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 23-01-2021 om 23:18 schreef o1bigtenor:
>>>>>>
>>>>>> OK, so this is your 4k monitor. It is plugged into the *secondary*
>>>>>> GPU, and does not report any 4k@60 modes in the EDID (well, it does
>>>>>> report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
>>>>>> this time). Whether that's because the monitor itself doesn't support
>>>>>> HDMI 2.0, or you plugged it into your old GPU which does not support
>>>>>> HDMI 2.0, I couldn't say from just this output. What I can say is that
>>>>>> no amount of modelines will get you 4k@60 in this setup with nouveau.
>>>>>
[...]
> If you would point out a suggestion that I haven't tried - - - please?

A quick DuckDuckGo for "Hisense 4K 60Hz only reports 30Hz" gives this 
thread: https://www.coolcomputing.com/article.php?sid=4659 . No idea 
whether this also applies to your 2016 model. Have you scavenged through 
the TVs menu's to make sure HDMI 2.0 is explicitly enabled?
