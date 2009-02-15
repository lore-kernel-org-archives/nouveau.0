From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Sun, 15 Feb 2009 15:18:09 +1000
Message-ID: <21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>
References: <49959366.2000805@gmail.com>
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>
	<49968B05.4090701@gmail.com>
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50902140232h4b262deby85e7b437067fbc99-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Feb 14, 2009 at 8:32 PM, Stephane Marchesin
<marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org> wrote:
> On Sat, Feb 14, 2009 at 10:12, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Stephane Marchesin wrote:
>>>
>>> How many PCI domains does that machine have ? Current libpciaccess is
>>> broken, in that PCI cards only work in the first domain. So the
>>> solution is to put the card in a slot from the first domain if
>>> possible. You are screwed otherwise (well, you could replace the
>>> hardcoded first domain in pciaccess with the right domain and it might
>>> work, I don't know...)
>>>
>>>
>>
>> No way. There are 6 domains and the first does not have any connector...
>> But this libpciaccess - is it linux lib or nouveau lib or x.org lib?
>
> It's an X.Org library. If you look there is a 0 hardcoded somewhere
> for the domain - can't recall where exactly offhand though. Most
> people aren't affected because there is usually a single PCI domain on
> PC/x86...

I don't think thats true, pciaccess handles domains fine.

DRM on the other hand not so well, I think you get to play with the bits of the
drm that match buses. Also be careful X's BusID are bus@domain:func:dev
not at all obvious.

Dave.
