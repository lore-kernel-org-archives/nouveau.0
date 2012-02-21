From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patches][nouveau/kms]: Precise Vblank and pageflip
 timestamping v2
Date: Tue, 21 Feb 2012 20:28:49 +0100
Message-ID: <CAGZ4FETLN3-aDOMezV3-G10X6=GUfPOGda1egiEodWS2Gpg1DA@mail.gmail.com>
References: <1329722667-2240-1-git-send-email-dev@lynxeye.de>
	<F8CDD288-6434-4FDA-BC09-B7FB39E38650@tuebingen.mpg.de>
	<CAGZ4FETCDRqSDGobrtXJRsa6r6H8avB39LyGgdU3TFt7MdOqhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FETCDRqSDGobrtXJRsa6r6H8avB39LyGgdU3TFt7MdOqhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 21, 2012 at 8:26 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Feb 21, 2012 at 8:04 PM, Mario Kleiner
> <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> wrote:
>> On Feb 20, 2012, at 8:24 AM, Lucas Stach wrote:
>>
>>> Just updated versions of the patches send by Mario Kleiner. This ones are
>>> rebased on top of the nouveau tree and updated according to the review
>>> feedback.
>>>
>>> This time hopefully the right ones.
>>>
>>> Regards,
>>> Lucas
>>>
>>
>>
>> Ben, thanks for the feedback. I've resteted the v2 of Lucas new reworked and
>> rebased patches, everything fine and precise wrt. to timing precision.
>>
>> For my personal education: Is my understanding correct that these registers
>> are basically "double-buffered", and the NV50_PDISPLAY_CRTC_C macro accesses
>> the current state, whereas the NV50_PDISPLAY_CRTC_P macro provides/sets the
>> programmed values that will be latched into the _C registers at some later
>> time, e.g., modeset?
>>
>> thanks,
>> -mario
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
> The proposed registers show the value that has submitted (via the
> modesetting/display fifo), but they haven't been put into effect yet
> by the "update" command. The registers (both the current and proposed
> ones) are only intended for reading. At least that is my
> understanding, perhaps Ben can tell you more.
>
> --
> Far away from the primal instinct, the song seems to fade away, the
> river get wider between your thoughts and the things we do and say.

That should be "have been submitted" not "has submitted".

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
