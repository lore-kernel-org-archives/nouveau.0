From: John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Subject: Re: Missing menus in windows after update
Date: Sun, 27 Apr 2014 22:33:01 -0700
Message-ID: <20140427223301.34aa58d1@Devil-Bonobo>
References: <20140427194139.5a9d3594@Devil-Bonobo>
 <CAKb7UviNU=H=G2UarrW1FBZsHfcN2C4rePq290SEhkOKkwKWpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviNU=H=G2UarrW1FBZsHfcN2C4rePq290SEhkOKkwKWpg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, 27 Apr 2014 23:01:57 -0400
Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> dijo:

>On Sun, Apr 27, 2014 at 10:41 PM, John Jason Jordan
><johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
>> Ubuntu 13.10 x86_64 up to date on laptop with nVidia GeForce GTX
>> 765M.
>>
>> There were some updates that I applied last week, and ever since I
>> have missing text in some menus and lists. It is especially bad in
>> Claws Mail and LibreOffice Writer. However, text appears correctly;
>> it's just the menus where the text has disappeared. For example,
>> when writing in LO Writer the part of the window where the typed
>> text appears is fine; but the menus along the top have just ---
>> instead of the word (File, Edit, etc.), and if I click on one of the
>> --- the drop-down shows only a -- to the left of the item. None of
>> the style names appear in the styles toolbar, nor does the name of
>> the font that is in use.
>>
>> After the update I have:
>>
>>         libdrm-nouveau2 2.4.46-1-ubuntu1
>>         xserver-xorg-video-nouveau 1:1.0.9-2ubuntu1
>>
>> This computer has never had the nVidia proprietary drivers installed.
>> Nor have I ever tried to use the extra features (bumblebee, etc.).
>> There are no error messages in Xorg.0.log.
>>
>> I could use some suggestions for where to look to fix this, or how to
>> file a bug report.

>Did this work fine before? If so, when was before?

This is a System76 (Linux computer seller) Bonobo Extreme that I bought
early last December. It came with straight Ubuntu, but I wiped it and
installed Xubuntu instead (can't stand Unity). I just did the defaults,
which installed the nouveau driver. A long time ago on another
computer I installed the nVidia proprietary driver and it created a
mess, so I was delighted that everything worked perfectly with the
nouveau driver.

A couple of weeks ago the Update Manager announced that there were some
updates. I do not recall exactly what packages were involved, but I
remember that some of them involved nouveau. About a week ago I finally
installed them, and that is when the problem began.

>What kernel version are you using? What mesa version do you have
>installed?

jjj@Devil-Bonobo:~$ uname -a
Linux Devil-Bonobo 3.11.0-20-generic #34-Ubuntu SMP Tue Apr 1 20:40:25
UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

Searching in Synaptic on 'mesa' yielded the following:

mesa-common-dev 9.2.1-1ubuntu3
libgl1-mesa-dev 9.2.1-1ubuntu3
linglu1-mesa-dev 9.0.0-1
libglapi-mesa 9.2.1-iubuntu3
libgl1-mesa-glx 9.2.1-1ubuntu3
libglu1-mesa 9.0.0-1
libgl1-mesa-dri 9.2.1-1ubuntu3
libtxc-dxtn-s2tc0 0-git20121227-1
libopeng1-mesa 9.2.1-1ubuntu3
libegl1-mesa 9.2.1-1ubuntu3
xscreensaver-gl 5.15-3ubuntu1
libwxgtk2.8-0 2.8.12.1-14ubuntu1
libgbm1 9.2.1-1ubuntu3
libgles2-mesa 9.2.1-1ubuntu3
libegl1-mesa-drivers 9.2.1-1ubuntu3

>Is this an optimus laptop? If so, do you have the intel card enabled
>in the BIOS, or is it set to nvidia-only? In that case, unless you've
>specifically set up GPU offloading, your issues would be with the
>intel driver.

I believe it is an optimus laptop, but I do not understand much about
those things. I have never touched the BIOS, so it is at the default
that System76 shipped it with. I do know that the nouveau driver is
installed and loaded. I do not do gaming or anything that needs fancy
high speed graphics.

>Can you provide your dmesg + Xorg log? That will answer some of the
>above questions.

Both are really long documents. I did read through the Xorg.0.log file
and found no real error messages. It also noted that the nouveau driver
was loaded, and that it tried to load the nvidia driver but failed
because it is not installed. There is no xorg.conf file.

>Are you using a compositor? If so, what happens if you turn it off (or
>tell it not to use OpenGL, if that's an option).

I have never been interested in special effects, 3D, etc., so it is
using only whatever is installed and set up by default.

If you really need the Xorg.0.log file and the full results of dmesg,
can I attach them to an e-mail to this list?

Thanks for your response, and apologies for not including all the
information the first time. 
