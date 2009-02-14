From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Sat, 14 Feb 2009 11:32:12 +0100
Message-ID: <6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>
References: <49959366.2000805@gmail.com>
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>
	<49968B05.4090701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49968B05.4090701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Feb 14, 2009 at 10:12, aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Stephane Marchesin wrote:
>>
>> How many PCI domains does that machine have ? Current libpciaccess is
>> broken, in that PCI cards only work in the first domain. So the
>> solution is to put the card in a slot from the first domain if
>> possible. You are screwed otherwise (well, you could replace the
>> hardcoded first domain in pciaccess with the right domain and it might
>> work, I don't know...)
>>
>>
>
> No way. There are 6 domains and the first does not have any connector...
> But this libpciaccess - is it linux lib or nouveau lib or x.org lib?

It's an X.Org library. If you look there is a 0 hardcoded somewhere
for the domain - can't recall where exactly offhand though. Most
people aren't affected because there is usually a single PCI domain on
PC/x86...

Stephane
