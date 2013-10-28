From: Martin Kaffanke <martin.kaffanke-RbZlAiThDcE@public.gmane.org>
Subject: Re: Trouble on kernel
Date: Mon, 28 Oct 2013 18:23:29 +0100
Message-ID: <526E9D91.2030003@gmx.at>
References: <526E1619.9060402@gmx.at>	<CAKb7UvgaEqjAS7JDnQYio6DynTNk+yaDekwWPQpeEDdDDPmhpA@mail.gmail.com>	<526E915B.6070509@gmx.at>
	<CAKb7UvjctRR3KMaTGroeSY7=N4SQgnGvZERo+X8fMh2uJahphA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjctRR3KMaTGroeSY7=N4SQgnGvZERo+X8fMh2uJahphA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am 2013-10-28 17:55, schrieb Ilia Mirkin:
> On Mon, Oct 28, 2013 at 12:31 PM, Martin Kaffanke
> <martin.kaffanke-RbZlAiThDcE@public.gmane.org> wrote:
>> Am 2013-10-28 15:42, schrieb Ilia Mirkin:
>>>> dmesg tells me:
>>>>
>>>> [  686.209019] nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x00000000
>>>> FAULT at 0x00b020
>>>
>>>
>>> Odd. That's VPE. You should have one... maybe not. Nothing to worry
>>> about though. (Especially odd that it's showing up multiple times --
>>> are you trying to use xvmc?)
>>
>>
>> At the moment I'm trying nothing, its the default installation, i didn't
>> change something.
>>
>> Where do I have to look to find it out?
>
> Meh. Like I said, don't worry about it. On closer inspection, it's
> most likely the nv31_mpeg_tile_prog function. Although why it's
> getting addresses of 0... I don't know. (And also why it's getting
> run, I don't know either. Something must be starting up either xvmc or
> vdpau, the latter of which won't work for your card.)

Ok, if that is not my problem, so that doesn't matter.

>
> Well, if compiz/something else *crashes* (i.e.
> segfault/sigbus/whatever), it's likely there's a log of it. Perhaps
> look in .xsession-errors, or run it inside gdb? Or are you saying that
> you get a hard hang? Can you ssh into the machine when that happens?

Hm.  I don't really know, i installed the ssh server not so i can test this.

but the last 'crash', the xserver was not possible to work on it any more,
just seeing horizontal stripes instead of a picture, let me go back to the
console and dmesg gives now additional:

[29361.912198] nouveau E[   PFIFO][0000:00:0d.0] CACHE_ERROR - ch 1 
[Xorg[1029]] subc 4 mthd 0x0188 data 0x80000003
[29361.912206] nouveau E[  PGRAPH][0000:00:0d.0]  ERROR nsource: 
ILLEGAL_MTHD nstatus: INVALID_STATE BAD_ARGUMENT PROTECTION_FAULT

see the full dmesg:
http://ubuntuone.com/5rZQABeUirzvxUSIDhWTcY

After that i made a reboot, because a 'sudo service lightdm restart' 
does something strange:  I have an additional LightDM User there, which 
is not there after reboot....  - but thats another problem. :)

Martin
