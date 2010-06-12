From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Need help getting nouveau drivers working on Fedora 13
Date: Fri, 11 Jun 2010 20:44:03 -0400
Message-ID: <AANLkTinZb1tzk6A_u7Z01O4PCzwH09wNoW91zy1fEg_n@mail.gmail.com>
References: <4C12BCFB.6070508@zeff.us>
	<AANLkTim6_KDoKsn6b09aKAmLRfmSfULVmO_4sQcqWQ0C@mail.gmail.com>
	<4C12D55D.9030700@zeff.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C12D55D.9030700-6czteffKXy8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Joe Zeff <joe-6czteffKXy8@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jun 11, 2010 at 8:27 PM, Joe Zeff <joe-6czteffKXy8@public.gmane.org> wrote:
> On 06/11/2010 05:10 PM, Younes Manton wrote:
>>
>> Hi. When you say you reinstalled Xorg without mesa packages, I'm
>> assuming you mean that you didn't install the nouveau mesa driver? If
>> so it sounds like you're trying to run compiz with the software
>> rasterizer. Not sure if/how that works, last I heard it didn't. Either
>> way, can you try without compiz? If you still have problems please
>> attach a kernel log (the output of dmesg) and an Xorg log.
>
> I did try installing the mesa experimental drivers, but they just gave me a
> broken screen that wasn't usable.  What packages should I install?  Also,
> how do I deactivate compiz?
>

That depends on your desktop environment. On Gnome it's something like
System -> Preferences -> Appearance -> Visual Effects.

On Fri, Jun 11, 2010 at 8:31 PM, Joe Zeff <joe-6czteffKXy8@public.gmane.org> wrote:
> On 06/11/2010 05:10 PM, Younes Manton wrote:
>>
>> Hi. When you say you reinstalled Xorg without mesa packages, I'm
>> assuming you mean that you didn't install the nouveau mesa driver?
>
> A little update: checking, I have mesa-dri-drivers.i686 installed,but not
> the experimental.
>

I don't use Fedora but I think that means you don't have the nouveau
mesa drivers. I suggest you disable compiz first anyway. If it works
at least you know the non-mesa part of the driver works. If it doesn't
work it will be easier to debug if the mesa driver is out of the
picture.
