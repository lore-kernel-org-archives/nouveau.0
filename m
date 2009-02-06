From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DRM fills logs
Date: Fri, 6 Feb 2009 20:32:11 +0100
Message-ID: <6d4bc9fc0902061132xef85df1l7b73782fcdd68c72@mail.gmail.com>
References: <498C529A.8060601@seiner.com>
	<6d4bc9fc0902060713u56ae31bdjb8bbf4a609eda32b@mail.gmail.com>
	<3923ba2a79e416d939d138f940f71743.squirrel@www.datavault.us>
	<cd228f6c55a4f61bb2b936259100f818.squirrel@www.datavault.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cd228f6c55a4f61bb2b936259100f818.squirrel-+Pg63oGcj7QHmtrW3VDF9w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Feb 6, 2009 at 7:50 PM, Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
> On Fri, February 6, 2009 10:49 am, Yan Seiner wrote:
>>
>> On Fri, February 6, 2009 7:13 am, Maarten Maathuis wrote:
>>> Have you tried running the cards separately first? Multi card
>>> situations are pretty rare, so it's better to know if they work
>>> individually.
>>
>> No, not yet. I don't have a test-bed where I can do that.  :-(  I can
>> build a single card system test bed but I only have a handful of the dual
>> DVI cards and all are in production use.
>>
>> If I read the attached xorg log file correctly, though, nouveau seems to
>> get confused and only sees one of the NVS 285 cards.
>>
>> It seems to miss the card at 7:0:0 entirely.  Am I reading it correctly?
>>
>
> OOPS!  This time with the log file...
>
> --
>  o__
>  ,>/'_          o__
>  (_)\(_)        ,>/'_        o__
> Yan Seiner      (_)\(_)       ,>/'_     o__
>       Personal Trainer      (_)\(_)    ,>/'_        o__
>             Professional Engineer     (_)\(_)       ,>/'_
> Who says engineers have to be pencil necked geeks?  (_)\(_)
>
> You are an adult when you realize that everyone's an idiot sometimes. You
> are wise when you include yourself.
>

Yes, it's missing one. I wasn't saying you should remove the cards
from your computer. You should try making an xorg.conf with only one
card. And test them seperately.

Maarten.
