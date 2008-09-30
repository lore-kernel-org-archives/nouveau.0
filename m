From: Tomasz Chmielewski <mangoo-Nem3ZqsbT/g@public.gmane.org>
Subject: Re: How to set a different resolution?
Date: Tue, 30 Sep 2008 23:41:54 +0200
Message-ID: <48E29D22.6010905@wpkg.org>
References: <48E297C8.3050803@wpkg.org>
	<6a89f9d50809301433y4da36b28vb23813cef7f01b21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50809301433y4da36b28vb23813cef7f01b21-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Stephane Marchesin schrieb:
> On Tue, Sep 30, 2008 at 11:19 PM, Tomasz Chmielewski <mangoo-Nem3ZqsbT/g@public.gmane.org> wrote:
>> I just gave nouveau a try and was surprised that it just works out of
>> the box on Mandriva. Great work!
>>
>> However, I'm not sure how to set up a different resolution properly.
>>
>> With the closed nvidia driver, I usually just click on krandrtray in KDE
>> and pick a different resolution.
>>
>> With nouveau driver, though, it works as well, but only partially.
>>
>> I can see the resolution is theoretically changed (fonts, windows are
>> bigger when I change from 1280x1024 to 1024x768), but technically, in my
>> LCD monitor info I can see the resolution is still 1280x1024. Why?
>>
>> Because of this issue, I can't use my beamer (dual-head), which only
>> supports resolutions up to 1024x768.
>>
> 
> Type "xrandr" to list the available resolutions. Then xrandr -s [the
> number of my favourite resolution in the list].

"xrandr -s 1024x768" sets the resolution to 1024x768, but LCD display 
still shows 1280x1024 when I press its "Show info" button. Beamer 
doesn't work in that resolution.

Also, I can see black stripes (1 cm or so on a 19 inch LCD) below and 
above the image, where I can't move the mouse.


> For further information look there:
> http://intellinuxgraphics.org/dualhead.html
> (or any xrandr 1.2 tutorial for that matter).

I think the problem lies somewhere else.


-- 
Tomasz Chmielewski
http://wpkg.org
